-- Role pools for every common kind of NPC, so anyone without their own file still sounds
-- like their job. Narrow roles may notice things (stable masters, blacksmiths, trainers);
-- broad ones (bankers, auctioneers, vendors) never do. A pool with `subtitle` only fits NPCs
-- whose title contains that text ("paladin trainer"), and beats the plain role pool.
-- Lore used here: LORE_NOTES.md, "Capitals and their people".
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Stable masters: they look at animals first and people second.
---------------------------------------------------------------------------
P:Pool {
  id = "stablemaster", role = "stablemaster",
  greetings = {
    { id = "g_stalls", text = "Stalls are clean, mostly." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Leave {pet} with me or take {pet} along. Either way, mind the hay." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and whatever you left with me is fatter for it. Come and see." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk say you did the town a good turn. The animals don't care, but I do." },
  },
  notice = {
    { id = "n_xrider", cat = "origin", when = { origin = "skyborne_banaethal_rider" },
      text = "You stand like someone used to a big bird under you, and a bad-tempered one at that. Is it true your Galestriders will only ever carry the one rider?" },
    { id = "n_pet_hurt", cat = "pet", when = { pet = { type = "Beast" }, durability = { max = 0.3 } },
      text = "You look like you've been dragged through a briar. Does {pet} look the same under all that fur?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a good animal. May I see its teeth? No? I can't blame it; I wouldn't let a stranger look either." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "I'm not stabling you; I've got goats in there." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Don't look at the oats like that; they're for animals that stay animals." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "If you're going to be a cat in my stable, stay off the rafters. The owls nest up there, and they've opinions about cats." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Not that one, thank you; I don't stable anything that smells of brimstone. The horses would kick the stalls to kindling." },
    { id = "n_wolf", cat = "form", when = { form = "ghostwolf" },
      text = "A wolf made of mist, and now my hounds won't stop howling. Could you be a little less ghostly while you're in the yard?" },
    { id = "n_tauren_hunter", cat = "pet", when = { race = "Tauren", class = "HUNTER" },
      text = "Tauren hunters' beasts are always calm in the stall, and I've never learned why. Do you sing to them?" },
    { id = "n_dwarf_hunter", cat = "pet", when = { race = "Dwarf", class = "HUNTER" },
      text = "A dwarf with a beast! Your people's animals always come back smelling of ale, and I've stopped asking how." },
    { id = "n_nightelf_hunter", cat = "pet", when = { race = "NightElf", class = "HUNTER" },
      text = "Kaldorei animals never touch what I put out for them. Tell me what yours eats, and I'll stop wasting good oats." },
    { id = "n_skyborne", cat = "pet", when = { race = "Skyborne" },
      text = "Your people ride something called a galestrider, I'm told. I've no stall for anything that half flies, so I hope you keep it somewhere else." },
  },
  -- 0.71.0: a conversation tree (care and feeding, the keeper's own animals, the road,
  -- your companion, and whether a pen is a kindness).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Fed, watered, brushed: whatever you leave with me comes back in better shape than it went in." },
        { id = "l_hunter", when = { class = "HUNTER" }, text = "A hunter, then. Feed them before yourself and they'll follow you anywhere." },
        { id = "l_druid", when = { class = "DRUID" }, text = "A druid knows animals from the inside, which is more than I can say. If any of mine look unhappy to you, tell me." },
        { id = "l_warlock", when = { class = "WARLOCK" }, text = "Keep your servants well away from my stalls. Nothing in here was born to stand next to one of those." },
        { id = "l_shaman", when = { class = "SHAMAN" }, text = "Shamans settle my beasts quicker than I can. I've stopped taking it personally." },
        { id = "l_paladin", when = { class = "PALADIN", minLevel = 40 }, text = "A charger that comes when it's called and goes when it's done. I'd lose my trade if every rider had one of those." },
      },
      again = {
        { id = "a_again", text = "Anything else, or can I get back to the mucking out?" },
        { id = "a_again2", text = "Ask away; the animals won't mind, so long as I keep the forks moving." },
        { id = "a_again_pet", when = { pet = { type = "Beast" } }, text = "Go on, then. {pet} looks happy enough to stand about while we talk." },
      },
      choices = {
        { text = "Just the stable.", next = "BUSINESS" },
        { text = "How does stabling work, exactly?", next = "how" },
        { text = "Some of these animals must be yours.", next = "own" },
        { text = "The road must be hard on animals.", next = "road" },
        { text = "What do you make of {pet}?", next = "mypet", when = { pet = { type = "Beast" } } },
        { text = "Do you ever mind keeping wild things penned?", next = "cages" },
        { text = "Good day to you.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "h_default", text = "You leave a beast with me, I feed it, water it and keep it out of trouble, and when you want it back you ask. It's the oldest trade there is, older than smithing, and twice as honest." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter can only keep one at heel, so the rest wait here with me until you swap them over. Buy another stall if you've the coin, though I'd rather you loved two well than five badly." },
      },
      choices = {
        { text = "How do I keep my beast loyal?", next = "care_loyal", when = { class = "HUNTER" } },
        { text = "Mine turns its nose up at what I feed it.", next = "care_food", when = { class = "HUNTER" } },
        { text = "Any advice on taming something new?", next = "care_tame", when = { class = "HUNTER" } },
        { text = "My servants need no stall, thank you.", next = "BACK", when = { class = "WARLOCK" }, fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    care_loyal = {
      lines = {
        { id = "cl_default", text = "Time, food and not getting it killed, in that order. A beast you've just tamed is only waiting to see whether you're worth staying for, so feed it well, keep it out of fights it can't win, and one day you'll find it won't leave your side." },
        { id = "cl_low", when = { maxLevel = 20 }, text = "Yours is young in your service yet, I'd wager. Be patient with it, because a hungry, frightened beast will walk off into the trees and never look back." },
      },
      choices = {
        { text = "And if it does die on me?", next = "care_loyal_die" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    care_loyal_die = {
      lines = { { id = "cd_default", text = "Then you bring it back and you make it up to it. They forgive you, mostly, but every time it happens they trust you a little less, and you'll have to earn that back with meals and miles." } },
      choices = { { text = "I'll keep it out of trouble.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    care_food = {
      lines = {
        { id = "cf_default", text = "Then you're feeding it the wrong thing. Cats and wolves want meat or fish and nothing else, bears and boars will eat near anything you put down, and the gentler sort want fruit or a bit of mushroom. A beast that eats what it likes fights like it means it." },
        { id = "cf_pet", when = { pet = { type = "Beast" } }, text = "Then you're feeding it the wrong thing. Look at {pet}'s teeth and you'll know what it wants; flat teeth for greens, sharp ones for meat. Feed it what its teeth ask for, and feed it before it starts sulking." },
      },
      choices = {
        { text = "I'll buy it something better.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "It'll eat what it's given.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    care_tame = {
      lines = {
        { id = "ct_default", text = "Pick one that suits you, not one that looks grand, and never one that's stronger than you are, because it'll know. It'll fight you while you're working at it, so have your wits about you, and once it settles, give it a meal straight away." },
      },
      choices = {
        { text = "I tracked bears in the hills before I ever tamed one.", next = "tame_kin", when = { origin = "dwarf_bear_tracker" } },
        { text = "I rode a nightsaber before I ever tamed one.", next = "tame_kin", when = { origin = "nightelf_nightsaber_rider" } },
        { text = "I ran the plains beside the beasts I hunted.", next = "tame_kin", when = { origin = "tauren_plains_runner" } },
        { text = "The Eastvale woods taught me most of what I know.", next = "tame_kin", when = { origin = "human_eastvale_woodsman" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame_kin = {
      lines = {
        { id = "tk_default", text = "Then you know your way round a beast already, and you'll not need me telling you how to hold a leash." },
        { id = "tk_bear", when = { origin = "dwarf_bear_tracker" }, text = "A bear-tracker from the Dun Morogh hills! Then you know a bear will forgive you nearly anything except surprising it, and that's half of taming right there." },
        { id = "tk_saber", when = { origin = "nightelf_nightsaber_rider" }, text = "A nightsaber rider, is it? Your cats pick their own riders, I'm told, so you'll know already that the beast tames you at least as much as you tame it." },
        { id = "tk_plains", when = { origin = "tauren_plains_runner" }, text = "A plains runner! Your people walk with the herds rather than behind them, and the animals feel it; I've watched kodo follow a tauren like a calf follows its mother." },
        { id = "tk_eastvale", when = { origin = "human_eastvale_woodsman" }, text = "A woodsman, eh? You'll have learned to sit still and let the creature come to you, which is the one thing nobody can teach in a stable yard." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be off, then.", next = "END" },
      },
    },
    own = {
      lines = {
        { id = "o_default", text = "Two of them are mine: the old mule at the end, who's older than my apprentice and twice as sensible, and the hound under the trough, who thinks the whole yard is his. The rest belong to folk who'll be back for them, or so they promised." },
      },
      choices = {
        { text = "Surely everyone comes back for their animals.", next = "unclaimed" },
        { text = "Got any rams in there?", next = "own_rams", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    own_rams = {
      lines = { { id = "or_default", text = "Not today, and I'm not sorry, because the last ram I stabled ate a saddle, two buckets and most of a gate. Your people can keep them; I'll keep my gates." } },
      choices = { { text = "That sounds like a good ram.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    unclaimed = {
      lines = {
        { id = "u_default", text = "Not always. A hunter once left me a big grey wolf and said a week, maybe two, and I fed that wolf through a whole season while it lay by the gate with its nose to the road. Then one morning the stall was empty and the latch was still shut, and I've never worked out how." },
      },
      choices = {
        { text = "Did you ever learn what became of the hunter?", next = "unclaimed_end" },
        { text = "Maybe it went looking for them.", next = "unclaimed_end", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    unclaimed_end = {
      lines = { { id = "ue_default", text = "No, and I stopped asking. I like to think the wolf found them somewhere out on the road, so I keep that stall swept and empty, just in case either of them comes back this way." } },
      choices = {
        { text = "That's a kind thought.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "Harder than it is on you, because nobody gives a beast a choice about where it goes. Spider bites, snares, bad water and anything bigger with an appetite, and that's before somebody rides a horse lame because they were late for supper." },
        { id = "r_hurt", when = { durability = { max = 0.3 } }, text = "And by the look of you, you've been somewhere that chews things up. I'd not take a horse where you've just been." },
      },
      choices = {
        { text = "What do you do for a hurt animal?", next = "road_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_hurt = {
      lines = {
        { id = "rh_default", text = "Clean the wound, pack it with a poultice, and keep the beast warm and quiet until it decides to eat again. If it won't eat by the third day, I sit up with it, because that's all I've got left to give." },
        { id = "rh_druid", when = { class = "DRUID" }, text = "You'd do better than me, druid; I've seen one of your kind lay a hand on a lamed horse and have it trotting by the evening. I only wish I knew the trick of it." },
        { id = "rh_shaman", when = { class = "SHAMAN" }, text = "Your sort would ask the spirits, I suppose, and they'd likely answer. I just ask the poultice, and it doesn't always listen." },
      },
      choices = {
        { text = "The spirits of the wild listen to those who care.", next = "BACK", when = { class = { "DRUID", "SHAMAN" } }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    mypet = {
      lines = {
        { id = "mp_default", text = "{pet}'s got a clear eye and a good coat, and it watches you the way a beast only watches somebody it trusts. Whatever you're doing with it, keep doing it." },
        { id = "mp_hurt", when = { durability = { max = 0.3 } }, text = "{pet}'s carrying a limp it's trying to hide from you, which means it's prouder than you are. Rest it a day before you take it anywhere rough." },
        { id = "mp_veteran", when = { minLevel = 50 }, text = "{pet} has scars I'd not have thought a beast could live through. You've been to some terrible places together, and it's still at your heel, which tells me what I need to know about you." },
      },
      choices = {
        { text = "We look after each other.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Don't tell {pet}, but it snores.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    cages = {
      big = true,
      lines = {
        { id = "c_default", text = "Every day, a little. A horse is bred to the stall and doesn't miss what it never had, but a wild thing remembers the wind, and it paces. I keep the pens wide and the doors open whenever I can, and I tell myself it helps." },
        { id = "c_tauren", when = { race = "Tauren" }, text = "Your people would say a beast walks beside you and not behind you, I expect. I've heard tauren say it, and I've watched their kodo, and I'm half persuaded." },
        { id = "c_nightelf", when = { race = "NightElf" }, text = "The kaldorei don't pen their sabers at all, I'm told; the cats come and go as they please. I'd try it, but my goats would never be seen again." },
      },
      choices = {
        { text = "A good pen and a good keeper beat starving in the wild.", next = "BACK", reply = "That's what I tell myself on the good days, and most of them grow fat and easy here, though I still catch the wild ones staring at the hills.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Nothing wild should be caged, however kind the keeper.", next = "BACK", reply = "I can't argue with you, and some nights I can't argue with myself either, but a wounded beast turned loose is a dead one, so I keep the pens and the doubts both.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Do the animals ever forgive you for it?", next = "cages_mind" },
        { text = "The Earth Mother made the beasts our kin, not our property.", next = "cages_mind", when = { race = "Tauren" } },
        { text = "Our nightsabers choose whom they follow.", next = "cages_mind", when = { race = "NightElf" } },
      },
    },
    cages_mind = {
      lines = {
        { id = "cm_default", text = "The tame ones never knew any other life, and the wild ones only settle once they've decided you belong to them, not the other way round. It took that old hound under the trough three winters to decide it about me." },
        { id = "cm_druid", when = { class = "DRUID" }, text = "You'd know better than me, druid, having been a beast yourself. Did you ever want to be shut in somewhere warm, or did the cold always pull at you?" },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Good day to you.", next = "END" },
      },
    },
  },
  topics = { _none = { { id = "t_none", text = "If it doesn't eat hay, I don't know about it." } } },
}

---------------------------------------------------------------------------
-- Bankers and auctioneers: money people. No noticing moments (any of them could say it).
---------------------------------------------------------------------------
P:Pool {
  id = "banker", role = "banker",
  greetings = {
    { id = "g_vault", text = "Deposit, withdrawal, or are you just admiring the vault?" },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Ah, do come in, and mind the step." },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}. Your vault's exactly as you left it, which is the whole point of us." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "There's talk you've been telling clever stories in town. The bank believes in ledgers rather than stories, so let's keep to those." },
  },
  lines = {
    { id = "l_default", text = "What you leave here stays here. That's the whole of the job, and I'm very good at it." },
    { id = "l_poor", when = { money = { max = 100 } }, text = "We keep anything, friend, even very little." },
  },
  choices = { { text = "My vault, please.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "Unless it's kept in a vault, I wouldn't know." } } },
}

P:Pool {
  id = "auctioneer", role = "auctioneer",
  greetings = {
    { id = "g_bid", text = "Bidding, buying out, or selling?" },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}? Most of the listings have changed hands since, so have a look." },
  },
  lines = {
    { id = "l_default", text = "The house takes its cut, the seller takes the rest, and everybody blames me for the prices." },
  },
  choices = { { text = "Show me the listings.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "If nobody's selling it, I've no opinion." } } },
}

---------------------------------------------------------------------------
-- Blacksmiths, armorers and weaponsmiths: they see your gear before your face.
---------------------------------------------------------------------------
P:Pool {
  id = "blacksmith", role = "blacksmith",
  greetings = {
    { id = "g_anvil", text = "Repairs, or something new?" },
    { id = "g_broken", when = { durability = { max = 0.25 } }, text = "Put it all on the bench, all of it." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and by the look of your gear you spent most of it getting hit. Put it on the bench." },
    { id = "g_dd_deaths", when = { deaths = { min = 25 } }, text = "Gear that's been through a death has a look to it, and yours has been through more than a few. Put it on the bench and tell me nothing; I'd rather not know." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you've been leaning on folk in town. I'll mend your steel, but I'll not be leaned on, so we understand each other." },
  },
  notice = {
    { id = "n_broken", cat = "gear", when = { durability = { max = 0.2 } }, place = "before",
      text = "No, don't tell me, I can see it from here. That's not wear, that's an argument you lost." },
    { id = "n_naked", cat = "gear", when = { nearlyNaked = true },
      text = "You're shopping, at least I hope you are. Nobody walks in here dressed like that on purpose." },
    { id = "n_plate", cat = "gear", when = { class = { "WARRIOR", "PALADIN" }, durability = { min = 0.9 } },
      text = "Somebody keeps their plate oiled, good. I hate seeing rust I didn't put there." },
    { id = "n_rogue", cat = "gear", when = { class = "ROGUE" },
      text = "Those daggers want honing, and I'll not ask what dulled them. Hand them over hilt first, if you please." },
    { id = "n_hunter", cat = "gear", when = { class = "HUNTER" },
      text = "Half your arrowheads are bent from rattling in the quiver. Bring them to the anvil sometime, before they bend in something that's charging you." },
    { id = "n_mage", cat = "gear", when = { class = "MAGE" },
      text = "Mind those robes near the forge; cloth goes up like kindling. You'd be surprised how many mages learn that here." },
    { id = "n_shaman", cat = "gear", when = { class = "SHAMAN" },
      text = "Mail, a shield and a totem on the belt. I'll mend the first two, but the totem's beyond any smith." },
    { id = "n_druid", cat = "gear", when = { class = "DRUID" },
      text = "Leather and wood, mostly? You hardly need a smith, but sit a moment; the forge is warm." },
    { id = "n_dwarf", cat = "gear", when = { race = "Dwarf" },
      text = "Let's see that work. Ironforge steel, or somebody's poor copy of it? I can always tell, so don't bother lying." },
    { id = "n_gnome", cat = "gear", when = { race = "Gnome" },
      text = "Don't touch the bellows. The last gnome in here improved them, and I still can't make them stop." },
    { id = "n_tauren", cat = "gear", when = { race = "Tauren" },
      text = "I'll need the big anvil for your gear. Tauren buckles take twice the iron of anyone else's." },
    { id = "n_paladin", cat = "gear", when = { class = "PALADIN", durability = { max = 0.5 } },
      text = "The Light doesn't hammer out dents, however hard you pray at them. Get it on the bench." },
  },
  lines = {
    { id = "l_default", text = "Good steel's patient; it waits for you to need it. Bad steel waits for the worst moment." },
    { id = "l_low", when = { durability = { max = 0.5 } }, text = "Half of that's held together by habit. Let me look before it lets you down." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "A warrior's gear tells me everything: where you were hit, how often, and how often you didn't move out of the way." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "Brimstone and soot smell much the same, but I know the difference. Keep your conjuring out of my coals." },
  },
  choices = { { text = "Repairs, please.", next = "BUSINESS" }, { text = "Just browsing.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "Bring it to the anvil and I'll tell you what it is." } } },
}

---------------------------------------------------------------------------
-- A few common kinds of vendor, by their titles. No noticing moments.
---------------------------------------------------------------------------
P:Pool {
  id = "vendor_food", role = "vendor", subtitle = { "food", "bread", "baker", "butcher", "meat", "fruit", "cook" },
  greetings = {
    { id = "g_fresh", text = "Fresh today, or mostly today." },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}? You'll be hungry, then, because road food never fills anyone." },
  },
  -- 0.71.0: a small tree of its own (where the food comes from, road rations, the hungry).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "You'll not fight on an empty stomach. Well, you will, but not for long." },
        { id = "l_tauren", when = { race = "Tauren" }, text = "You'll want the big loaves, I expect, and maybe two of them. I've never once seen a tauren leave this stall still hungry, and I'd hate you to be the first." },
        { id = "l_low", when = { maxLevel = 15 }, text = "New to the road? Then buy more than you think you'll need, because you'll eat twice what you planned and you'll be glad of every crumb." },
      },
      again = {
        { id = "a_again", text = "Anything else, or shall I wrap something up for you?" },
        { id = "a_again2", text = "Go on, I've time while the next batch cools." },
      },
      choices = {
        { text = "I'll take some.", next = "BUSINESS" },
        { text = "Where does it all come from?", next = "source" },
        { text = "I've a long road ahead and little to pack.", next = "road" },
        { text = "There must be folk round here who can't pay.", next = "needy" },
        { text = "I don't eat much these days.", next = "undead", when = { race = "Scourge" } },
        { text = "Good day.", next = "END" },
      },
    },
    source = {
      lines = {
        { id = "s_default", text = "The flour comes in by cart from whatever farms still have fields standing, and the meat comes from hunters who'd rather sell to me than haul it further. When the roads get bad the prices go up, and I get the blame for it, every time." },
        { id = "s_hunter", when = { class = "HUNTER" }, text = "Half of what's on this stall was brought in by somebody like you, so if you've fresh meat in your pack, a cook somewhere will be glad to see it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll be off.", next = "END" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "Hard bread and dried meat, because they'll keep for a week and taste the same on the last day as the first. Fresh food's lovely, but it goes off in a day in a warm pack, and then you're eating it anyway." },
        { id = "r_mage", when = { class = "MAGE" }, text = "You'll be conjuring your own, I suppose, and I've tasted that conjured bread. It fills you up, I'll give it that, but it's never once tasted of anything." },
      },
      choices = {
        { text = "Sound advice.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll eat what I find on the way.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    needy = {
      big = true,
      lines = {
        { id = "n_default", text = "The heels of yesterday's loaves go out the back door at closing, to whoever's waiting there. I can't feed the whole town for nothing, or I'd be standing in that line myself by spring." },
      },
      choices = {
        { text = "Nobody should go hungry while there's bread to spare.", next = "BACK", reply = "My mother would have said the same, and she gave away half her bread, which is why I still bake in her shop and not my own.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Charity's a fine way to go out of business.", next = "BACK", reply = "You sound like my ledger, and it's not wrong, but I've stood in that line myself once, and I'll not send folk away while there are heels to give.", fx = { align = { light = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    undead = {
      lines = {
        { id = "u_default", text = "No, I don't suppose you do, and I'll not ask what you eat instead. If you've living friends on the road with you, though, they'll want feeding, so buy for them." },
      },
      choices = { { text = "I'll buy for them, then.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = { _none = { { id = "t_none", text = "Can't say, but ask me about bread." } } },
}

P:Pool {
  id = "vendor_drink", role = "vendor", subtitle = { "drink", "wine", "brew", "ale", "spirits" },
  greetings = {
    { id = "g_pour", text = "Something to wash the road down?" },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, so I'd say you're owed a drink. You'll be paying for it, mind." },
  },
  -- 0.71.0: a small tree of its own (what's worth drinking, bar talk, when to stop pouring).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Every bottle's honest. Some are honest about being terrible." },
        { id = "l_drunk", when = { drunk = { min = 2 } }, text = "You've had a few. I'll sell you one more, and then I'll sell you water." },
      },
      again = {
        { id = "a_again", text = "Anything else, or are we pouring?" },
        { id = "a_again2", text = "Ask what you like; I'll keep polishing while you think." },
      },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "What's actually worth drinking?", next = "best" },
        { text = "You must hear a lot over the bar.", next = "gossip" },
        { text = "Do you ever stop pouring for someone?", next = "cutoff" },
        { text = "Got any proper dwarven stout?", next = "stout", when = { race = "Dwarf" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "b_default", text = "The cheap stuff's for washing the dust down and the dear stuff's for impressing somebody, and neither one is worth drinking alone. If you want my honest pick, it's the plain ale on the bottom shelf, because nobody's ever been ashamed of it." },
        { id = "b_undead", when = { race = "Scourge" }, text = "Can you even taste it any more? I've served your kind before, and they drink the strong stuff like it's water and stare into the cup as if they're trying to remember something." },
      },
      choices = {
        { text = "The bottom shelf it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip = {
      lines = {
        { id = "g_default", text = "Mostly who owes whom, whose cart lost a wheel, and which guard sleeps through the night watch. Folk don't tell a bartender secrets, they just forget I'm standing here, which comes to the same thing." },
        { id = "g_alliance", when = { faction = "Alliance" }, text = "The caravan drivers say King Varian still hasn't come home, and Lord Bolvar is ruling as regent in his place. Folk are uneasy, and uneasy folk drink." },
        { id = "g_horde", when = { faction = "Horde" }, text = "The caravan drivers say the centaur are bolder on the Barrens roads than they've been in years, and nobody's riding out alone. Good for my trade, I suppose, since frightened folk drink." },
      },
      choices = {
        { text = "And what have they said about me?", next = "gossip_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_me = {
      lines = {
        { id = "gm_default", text = "Nothing yet, which means you're either very careful or very dull. I'll let you know which once somebody's had a few and starts talking." },
        { id = "gm_helped", when = { word = "helped" }, text = "That you lent a hand when nobody asked you to, and that you didn't stand about afterwards waiting to be thanked. That's the kind of talk I like hearing over my bar." },
      },
      choices = {
        { text = "Let's keep it that way.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cutoff = {
      big = true,
      lines = {
        { id = "c_default", text = "When they start crying into the cup or offering to fight the furniture, yes. A drunk who falls down the stairs is bad for trade, and a drunk who burns the place down is worse." },
      },
      choices = {
        { text = "Somebody has to say when, and it may as well be you.", next = "BACK", reply = "That's the way I see it, and nobody thanks me at the time, though they come back sober the next week with an apology and an empty purse.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Grown folk can decide for themselves when they've had enough.", next = "BACK", reply = "They can, friend, right up until they decide it on my stairs, and then it's my floor and my trade they're bleeding on.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stout = {
      lines = {
        { id = "st_default", text = "I've a cask that came down on a dwarf's cart, and I'll swear it's real, though you'd know better than I would. Every dwarf who tries it frowns and says it's not the same as home, and then they buy another." },
      },
      choices = { { text = "Nothing's ever the same as home.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Nobody tells a bartender anything on the first drink, but by the third I'm hearing all of it. Here's the best of what's been poured out lately." },
    },
    _none = { { id = "t_none", text = "I hear a lot over the bar, but not that." } },
  },
}

P:Pool {
  id = "vendor_reagents", role = "vendor", subtitle = { "reagent", "herbalism supplies", "alchemy supplies", "poison" },
  greetings = {
    { id = "g_weigh", text = "Weighed fair, every pinch of it." },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}? You'll have run through your pouches by now, I expect." },
  },
  -- 0.71.0: a small tree of its own (what it's all for, where it comes from, whether to ask).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Powders, roots, little jars of things you don't want to sniff. What do you need?" },
        { id = "l_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID", "PALADIN" } },
          text = "One of the casting sort, are you? You'll be back; they're always back." },
      },
      again = {
        { id = "a_again", text = "Anything else? Mind the jar by your elbow while you think." },
        { id = "a_again2", text = "Go on, ask; the scales aren't going anywhere." },
      },
      choices = {
        { text = "Let me see the shelves.", next = "BUSINESS" },
        { text = "Half of this I couldn't put a name to.", next = "uses" },
        { text = "You've a lot of stock in here.", next = "source" },
        { text = "Do you ask what your customers do with it?", next = "asking" },
        { text = "Do you sell soul shards?", next = "shards", when = { class = "WARLOCK" } },
        { text = "Good day.", next = "END" },
      },
    },
    uses = {
      lines = {
        { id = "u_default", text = "Candles for the priests, powders for the mages, little symbols for the paladins, and seeds and berries for the druids, who could pick their own but never seem to have the time. The rogues want flash powder and vials, and I've stopped asking why." },
        { id = "u_shaman", when = { class = "SHAMAN" }, text = "And ankhs for your sort, of course. I've sold a good many of them to shamans who swore they'd never need one, and they all came back for more." },
        { id = "u_rogue", when = { class = "ROGUE" }, text = "You'll be after the vials and the flash powder, I expect, and you'll not tell me what for. That's fine; your coin's the same colour as anyone's." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll be off.", next = "END" },
      },
    },
    source = {
      lines = {
        { id = "s_default", text = "The roots and leaves come from herbalists who know the hills better than I do, and the powders come in sealed crates from people who don't sign their letters. Some of it's travelled further than you have, and it's priced like it, too." },
        { id = "s_herb", when = { class = "DRUID" }, text = "You'd know where half of this grows, I expect, and you'd pick it kinder than the herbalists do. They tear it up roots and all, and grumble when it doesn't come back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    asking = {
      big = true,
      lines = {
        { id = "a_default", text = "Not often, because the answer's usually either dull or something I'd rather not know. Still, when a nervous sort buys three vials of the same thing, I do take a long look at their face." },
      },
      choices = {
        { text = "You ought to know who you're selling to.", next = "BACK", reply = "You're right, and I've turned away a few whose faces I didn't like, though I'll never know if I stopped something or only lost a sale.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "What folk do with it is their own business.", next = "BACK", reply = "That's how most of my trade sees it, and it lets me sleep, but every so often I hear a story in the market and wonder whose vial it was.", fx = { align = { order = -1 }, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = {
        { id = "sh_default", text = "No, and I'll thank you not to ask that so loudly. You gather those yourself, I'm told, and I'd rather not know how, so we'll keep to candles and powders between us." },
      },
      choices = { { text = "Candles and powders it is.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
  },
  topics = { _none = { { id = "t_none", text = "If it doesn't go in a pouch, I can't help you." } } },
}

---------------------------------------------------------------------------
-- Class trainers. They notice what a teacher would: a student from an unexpected
-- people (Forever's new combinations, the Skyborne), and how far you've come.
---------------------------------------------------------------------------
P:Pool {
  -- Faction-neutral: human and dwarf paladins of the Silver Hand, and the Forsaken who
  -- still answer to the Light in Forever. Expanded 0.82.0: craft sub-hub (blessings,
  -- seals, auras, undead, Redemption, the warhorse), the order sub-hub (Uther, Arthas,
  -- the Scarlet Crusade, the Argent Dawn, Forsaken paladins), the teacher asks why you
  -- took up the hammer, origin replies, and branches for priests and outsiders.
  id = "trainer_paladin", role = "trainer", subtitle = "paladin trainer", tier = "service",
  greetings = {
    { id = "g_light", text = "Be welcome, and be honest. Here to learn?" },
    { id = "g_high", when = { minLevel = 40 }, text = "You carry yourself like someone who's come a long way since their first lesson. Come, there's always more to learn." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and I trust the Light walked with you. Come, let's see what it taught you." },
    { id = "g_since", when = { levelsSince = 6 }, text = "Look at you; you stand differently than you did at our last lesson. Let's find out what else has changed." },
    { id = "g_fem", when = { class = "PALADIN", gender = "female", maxLevel = 15 }, text = "Welcome, sister. Some of the old knights will tell you the order was a brotherhood, and you may tell them the Light never checked." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for a lesson, but the Light keeps no hours and neither do I. Come in out of the dark." },
    { id = "g_ghost", when = { resSick = true }, text = "You've the grey look of someone the spirit healer has just sent back. Sit a moment before you swing anything." },
  },
  notice = {
    { id = "n_dirty", cat = "gear", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, and the Light shields but does not mend, so visit a smith after this." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "The Light comes to you, and it hurts, doesn't it? I don't understand why it answers, but I've stopped pretending that it doesn't." },
    { id = "n_human", cat = "class", when = { race = "Human", class = "PALADIN" },
      text = "Every human paladin I've taught had that same look, hoping the Light was listening and afraid that it was. Keep both; they'll serve you." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "PALADIN" },
      text = "You've a dwarf's patience with the hammer and a dwarf's impatience with everything else. The Light seems to like the combination, so I'll not argue with it." },
    { id = "n_deaths", cat = "class", when = { class = "PALADIN", deaths = { min = 20 } },
      text = "You've been carried back from the dead more often than I'd like to count, by the look of you. A shield is meant to be held up, {class}, not admired from the ground." },
    { id = "n_scarlet", cat = "class", when = { class = "PALADIN", killed = { name = "Scarlet", min = 25 } },
      text = "There's red dye under your gauntlets, and I don't think it's wine. Cutting down men who pray to the same Light is a hard road, so walk it with your eyes open." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Come in, and keep your voice low; there's a squire at prayer in the corner. Now, what have you come to learn?" },
        { id = "l_dwarf", when = { race = "Dwarf", class = "PALADIN" }, text = "A dwarf of the Light! Stubborn faith is the best kind, so let's begin." },
        { id = "l_young", when = { class = "PALADIN", maxLevel = 20 }, text = "Your hammer arm will learn before your heart does, and that's the wrong way round. Pray before you train, not after." },
        { id = "l_veteran", when = { class = "PALADIN", minLevel = 45 }, text = "You wear the Light now like an old coat you've stopped noticing. That's either grace or exhaustion, so tell me which." },
        { id = "l_other", when = { ["not"] = { class = "PALADIN" } }, text = "You're not of the order, but you're welcome all the same. The Light judges what you do, not what you were trained to do." },
        { id = "l_forsaken", when = { race = "Scourge", class = "PALADIN", faction = "Horde" }, text = "Another of the risen who still kneels. There are few enough of us that I'd know your face anywhere, so let's make the most of the lesson." },
      },
      again = {
        { id = "a_again", text = "Is there more on your mind, or shall we get back to the hammer?" },
        { id = "a_again2", text = "Speak plainly; I have the time." },
        { id = "a_again3", text = "Go on. A squire who stops asking questions has stopped learning, and that's when they get hurt." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What should I be practising?", next = "craft", when = { class = "PALADIN" } },
        { text = "I can't decide whether the Light asks mercy or judgement.", next = "mercy", when = { class = "PALADIN", minLevel = 10 } },
        { text = "What's left of the Silver Hand these days?", next = "order" },
        { text = "You've the look of someone who's trained a lot of squires.", next = "teacher" },
        { text = "Could someone like me learn to call on the Light?", next = "outsider", when = { ["not"] = { class = { "PALADIN", "PRIEST" } } } },
        { text = "The priests and you pray to the same Light, surely.", next = "priest", when = { class = "PRIEST" } },
        { text = "I was squire to a knight of the Silver Hand, once.", next = "xorig_squire", when = { origin = "human_paladin_squire" } },
        { text = "I held Darkshire's walls before I ever held a hammer.", next = "xorig_darkshire", when = { origin = "human_darkshire_watch" } },
        { text = "I took my first vows in Ironforge.", next = "xorig_ironforge", when = { origin = "dwarf_silver_hand" } },
        { text = "I ran a quarry crew at Gol'Bolar before this.", next = "xorig_quarry", when = { origin = "dwarf_quarry_foreman" } },
        { text = "I was a knight of the Silver Hand before I died.", next = "xorig_risen", when = { origin = "forsaken_risen_knight" } },
        { text = "I was a squire, and the plague came before my oath.", next = "xorig_unsworn", when = { origin = "forsaken_unsworn_squire" } },
        { text = "Farewell.", next = "END" },
      },
    },

    -- The craft: a sub-hub of things to practise.
    craft = {
      hub = true,
      lines = {
        { id = "p_default", text = "Your blessings, and practise them on other people. Anyone can keep themselves standing; the trick is keeping the soldier beside you on their feet." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn to heal in armour with a hammer still in your hand. Nobody will ever give you a quiet moment to set it down." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn when to step forward and take the blow meant for someone softer. The Light gave you that armour for exactly that." },
      },
      again = {
        { id = "c_again", text = "What else? There's always more to drill than there are hours to drill it." },
        { id = "c_again2", text = "Ask away. I'd rather answer you here than have the road answer you instead." },
      },
      choices = {
        { text = "Who should I bless, if I can only manage one?", next = "blessings" },
        { text = "I don't really understand seals and judgement.", next = "seals" },
        { text = "My aura feels like nothing at all.", next = "auras" },
        { text = "And against the undead?", next = "practise_undead" },
        { text = "I've learned Redemption, and it frightens me a little.", next = "redemption", when = { minLevel = 12 } },
        { text = "When will the order trust me with a warhorse?", next = "warhorse", when = { minLevel = 30 } },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    blessings = {
      lines = {
        { id = "bl_default", text = "Whoever is standing nearest the danger, and that's rarely the one asking loudest for it. Bless the healer in the back before you bless yourself, because if they fall, you follow them soon enough." },
        { id = "bl_party", when = { party = true }, text = "Look at the company you keep and ask who'd be the first to fall. Bless {companion} before you bless yourself, and you'll all walk home." },
      },
      choices = {
        { text = "And myself? Am I last?", next = "blessings_self" },
        { text = "I'll keep that in mind.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    blessings_self = {
      lines = { { id = "bs_default", text = "You're not last, you're simply not first. A paladin covered in bruises can still stand in a doorway, and that does more good than a clean one hiding behind it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    seals = {
      lines = {
        { id = "se_default", text = "A seal is a promise you make on your weapon, and a judgement is you keeping it. Set the seal, strike, then release it on your enemy all at once, and set another before the first one cools." },
        { id = "se_young", when = { maxLevel = 15 }, text = "You've one or two seals so far, and that's plenty to learn the rhythm. Set it, strike with it, judge it, set it again, and count it out loud at first if you have to." },
      },
      choices = {
        { text = "That sounds more like arithmetic than prayer.", next = "seals_prayer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seals_prayer = {
      lines = { { id = "sp_default", text = "Prayer is only attention, said aloud. Count your seals with the same care you'd count your prayers, and soon enough you won't know which is which." } },
      choices = { { text = "I'll practise both, then.", next = "BACK", fx = { trait = { pious = 1 } } } },
    },
    auras = {
      lines = {
        { id = "au_default", text = "It should feel like nothing; that's how you know it's working. An aura isn't for you, it's for the people beside you, and they'll feel the difference long before you do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    practise_undead = {
      lines = {
        { id = "pu_default", text = "The Light is fire to them, so don't hold back and don't hesitate. Whatever they were once, they aren't that now, and the kindest blow is the quickest." },
        { id = "pu_undead", when = { race = "Scourge" }, text = "You know better than I do what the Scourge feel when the Light touches them. Use that knowledge, and finish what's left of them quickly." },
      },
      choices = {
        { text = "Some of them were people I knew.", next = "undead_known" },
        { text = "I'll remember.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    undead_known = {
      lines = {
        { id = "uk_default", text = "Then say their names before you strike, if it helps, and say them again afterward over a candle. The Light won't think less of you for grieving, but it won't wait for you to finish, either." },
        { id = "uk_undead", when = { race = "Scourge" }, text = "And some of them knew you, before you woke up free and they didn't. That's a debt you can't pay in tears, only by putting them to rest." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    redemption = {
      lines = {
        { id = "rd_default", text = "Good, because it should. You'll call a soul back into a body that was finished with it, and the first time they open their eyes and look at you, you'll understand why we pray before we try it." },
        { id = "rd_undead", when = { race = "Scourge" }, text = "I'd be frightened too, in your place. You call them back into warm flesh, which is more than anyone did for you, and I've no answer for why the Light allows the one and not the other." },
      },
      choices = {
        { text = "It's a gift. I'll use it gladly.", next = "BACK", reply = "It is a gift, and I'm glad you see it that way, only don't forget the face they make when they wake, because it will tell you more than any sermon.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Some souls are better left where they fell.", next = "BACK", reply = "Some are, and you'll learn to feel the difference, though I pray you'll never have to be the one who decides it beside a grave.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warhorse = {
      lines = {
        { id = "wh_default", text = "When you're ready to look after something that will carry you into a fight without asking why. Come back to me when you've a few more seasons on you, and we'll talk about it then." },
        { id = "wh_ready", when = { minLevel = 40 }, text = "You're ready, or near enough. The warhorse comes when you call and goes when the fight is over, and it will never once complain, so be worth riding." },
        { id = "wh_dwarf", when = { race = "Dwarf" }, text = "The order gives dwarves a warhorse too, and I've seen the look on the rams' faces about it. Don't let the stable hands tease you; it's a fine beast and it doesn't care how long your legs are." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- Mercy and judgement: a stance.
    mercy = {
      big = true,
      lines = { { id = "m_default", text = "Both, and never at the same moment. Mercy for the one who can still turn back, judgement for the one who won't, and Light help you telling them apart while they're both holding swords." } },
      choices = {
        { text = "Mercy first, always. Judgement belongs to the Light.", next = "BACK", reply = "That's the gentler path, and the Light walks it more often than we do, but be ready for the day mercy is spent on someone who means to use it.", fx = { align = { light = 1, order = -1 }, trait = { kind = 1 } } },
        { text = "Judgement first, because mercy to the wicked is cruelty to their victims.", next = "BACK", reply = "There's iron in that, and the innocent will thank you, but watch yourself, because a paladin who stops looking for mercy soon stops finding any.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "How do you tell them apart?", next = "mercy_tell" },
      },
    },
    mercy_tell = {
      lines = { { id = "mt_default", text = "You don't, not always, and you'll get it wrong both ways before you're done. Pray over the ones you spared and the ones you didn't, and keep doing the work anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { pious = 1 } } } },
    },

    -- The order: what's left of the Silver Hand.
    order = {
      hub = true,
      lines = {
        { id = "o_default", text = "Less than there should be. Arthas broke the order when he broke Lordaeron, Uther lies in his tomb in the Plaguelands, and the rest of us are scattered across every kingdom that still has a chapel." },
        { id = "o_horde", when = { faction = "Horde" }, text = "The living knights would say nothing is left that belongs to us. We swore the same oaths before the plague, though, and the Light hasn't asked to have them back." },
      },
      again = {
        { id = "o_again", text = "What else about the order? I'll tell you what I can, and say so plainly when I can't." },
        { id = "o_again2", text = "Ask on. Old knights like nothing better than talking about the old days." },
      },
      choices = {
        { text = "Tell me about Uther.", next = "uther", fx = { learn = { "silver_hand" } } },
        { text = "How does a paladin end up like Arthas?", next = "arthas_fall", fx = { learn = { "arthas" } } },
        { text = "The Scarlet Crusade says it's the true order now.", next = "scarlet", fx = { learn = { "scarlet_crusade" } } },
        { text = "What do you make of the Argent Dawn?", next = "argent", fx = { learn = { "argent_dawn" } } },
        { text = "Do the living knights accept Forsaken paladins?", next = "forsaken_order", when = { race = "Scourge" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uther = {
      lines = {
        { id = "ut_default", text = "He was the first of us, ordained by Archbishop Faol himself, and he was kinder off the field than anyone would believe from watching him on it. He died near Andorhal, guarding King Terenas's ashes from Arthas, the son who had murdered him." },
        { id = "ut_undead", when = { race = "Scourge" }, text = "You might have seen him once, in the life before. Plenty of Lordaeron's people did, riding at the head of the column with that great hammer across his saddle." },
      },
      choices = {
        { text = "I'd like to see his tomb one day.", next = "uther_tomb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uther_tomb = {
      lines = { { id = "utt_default", text = "It stands in the Western Plaguelands, south of Andorhal, and the dead wander right up to its door. Go when you can hold your own out there, and leave something at the statue for the rest of us who can't." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } } },
    },
    arthas_fall = {
      big = true,
      lines = {
        { id = "af_default", text = "One hard choice at a time, each of them made for a reason that sounded good. He burned Stratholme to save the kingdom and lost the kingdom anyway, and somewhere along that road the Light stopped answering him and he didn't notice." },
        { id = "af_undead", when = { race = "Scourge" }, text = "You'd know his work better than any of my students. I'll only say that he was once exactly as earnest as you, and that's the part we're meant to remember." },
      },
      choices = {
        { text = "Then any of us could fall the same way.", next = "BACK", reply = "Any of us could, and that's why I told you, because Arthas was the finest of us once, and he never thought it could happen to him either.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "He chose it, and I never would.", next = "BACK", reply = "That's exactly what he would have said, the year before Stratholme, and I'd sleep easier if you weren't quite so certain.", fx = { align = { order = -1 }, trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scarlet = {
      big = true,
      lines = {
        { id = "sc_default", text = "They say plenty, mostly at the top of their lungs. Some of them were good knights once, and now they burn farmers for coughing and call it the Light's work, which it isn't." },
        { id = "sc_undead", when = { race = "Scourge" }, text = "They'd say you're an abomination wearing a dead knight's armour, and they'd put you to the torch before you finished a prayer. Keep away from their monastery and their towers, unless you've come to end them." },
      },
      choices = {
        { text = "Someone has to fight the Scourge without mercy.", next = "BACK", reply = "Someone does, and I'll not pretend the Scourge deserves mercy, but there's a difference between fighting the dead and burning the living because you're afraid.", fx = { align = { order = 1, light = -1 }, opinion = { scarlet_crusade = "necessary" } } },
        { text = "They've become as cruel as the dead they hunt.", next = "BACK", reply = "They have, and it grieves me more than I can say, because I knew some of them when their tabards were clean and their prayers were honest.", fx = { align = { light = 1 }, opinion = { scarlet_crusade = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    argent = {
      lines = {
        { id = "ag_default", text = "They're the best of what came after, if you ask me. Priests, knights, farmers and scholars who'll stand beside anyone who fights the Scourge, and they don't ask what you were before you picked up a sword." },
        { id = "ag_lvl", when = { minLevel = 50 }, text = "You're ready for the Plaguelands, so go and find them at Light's Hope Chapel, at the far eastern end. They'll have work for a paladin, and they'll pay in more than coin." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken_order = {
      lines = {
        { id = "fo_default", text = "Most of them would rather put us to the torch than kneel beside us. A few of the old knights look at us a long while before they draw, though, and that's more than nothing." },
        { id = "fo_horde", when = { faction = "Horde" }, text = "No, and I don't expect them to. That's why there's Bandarion Keep up on the bluffs in Tirisfal, so that the Light's risen servants have somewhere to kneel. Go and see Danitha Morr there if you haven't." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },

    -- The teacher, and why the player took up the hammer.
    teacher = {
      lines = {
        { id = "t_default", text = "More than I can remember and fewer than I'd like to have kept. Most of them are good knights now, and some of them I pray for every night. Tell me, then, why did you take up the hammer?" },
        { id = "t_notpal", when = { ["not"] = { class = "PALADIN" } }, text = "More than I can count, and each one of them stood about where you're standing. You've a weapon of your own, though, so tell me what you fight for." },
      },
      choices = {
        { text = "To protect people who can't protect themselves.", next = "why_answer", fx = { align = { light = 1 }, trait = { kind = 1 }, affinity = 1 } },
        { text = "For justice. Somebody has to drag the wicked to account.", next = "why_answer", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "For vengeance. The Scourge took everything from me.", next = "why_vengeance", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "The order needed bodies, and I needed bread. Simple as that.", next = "why_answer", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Do you ever doubt the Light?", next = "doubt" },
      },
    },
    why_answer = {
      lines = {
        { id = "wa_default", text = "That's as good a reason as any I've heard, and better than some. Hold on to it, because there'll come a morning when it's the only thing that gets you out of bed and into your armour." },
      },
      choices = {
        { text = "What got you out of bed?", next = "doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_vengeance = {
      lines = { { id = "wv_default", text = "I understand it, and I've felt it myself, more than once. Vengeance will get you to the Plaguelands, but it won't keep the Light in your hands once you're there, so find another reason before you arrive." } },
      choices = {
        { text = "I'll try.", next = "BACK", fx = { affinity = 1 } },
        { text = "Vengeance is reason enough for me.", next = "BACK", fx = { trait = { proud = 1 } } },
      },
    },
    doubt = {
      lines = {
        { id = "d_default", text = "I doubt myself every morning, and I doubted the Light the winter the plague came. It answered anyway, both times, and that's the only argument I've ever needed." },
        { id = "d_undead", when = { race = "Scourge", class = "PALADIN" }, text = "You'd know more about doubt than I would. You woke in the dark and something in you still wanted to pray, and the Light came, which I suspect surprised you both." },
      },
      choices = {
        { text = "That's a comfort.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Visitors from outside the order.
    outsider = {
      lines = {
        { id = "os_default", text = "Anyone can pray, and the Light listens to a farmer as closely as it listens to a knight. To wield it the way we do takes vows and years of training, and I'm afraid the order chooses its squires young." },
        { id = "os_warrior", when = { class = "WARRIOR" }, text = "You fight like one of us already, you only do it without the prayers. Say one before your next fight anyway and see whether the shield feels any lighter." },
        { id = "os_horde", when = { faction = "Horde", ["not"] = { race = "Scourge" } }, text = "The Light doesn't care what tusks or horns you wear, whatever the living knights might say. Your own people have their spirits and their Earth Mother, though, and I'd not try to talk you out of those." },
      },
      choices = {
        { text = "Then teach me a prayer, at least.", next = "prayer" },
        { text = "I'll keep to my own path.", next = "BACK" },
      },
    },
    prayer = {
      lines = { { id = "pr_default", text = "Here's the one we give squires on their first night: Light, make my arm strong and my judgement slow, and keep the people behind me safe from both. Say it before a fight and mean it, and you'll have the heart of what we do." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } } },
    },
    priest = {
      lines = {
        { id = "pq_default", text = "The same Light, yes, and different work. You mend people from behind the line, and we stand on it and mend them where they fall, and both of us would be dead in a week without the other." },
        { id = "pq_undead", when = { race = "Scourge" }, text = "Most of your kind turned to the shadow when they woke, and you didn't, or not entirely. That makes two of us who don't fit anywhere, so come and sit by the brazier whenever you like." },
      },
      choices = {
        { text = "Paladins are just priests who'd rather hit things.", next = "priest_joke", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_joke = {
      lines = { { id = "pj_default", text = "Ha! And priests are just paladins who never learned to lift anything heavier than a book. Go on, before I tell the cathedral what you called us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    -- Origins.
    xorig_squire = {
      lines = { { id = "xo_squire", text = "Then you carried a knight's shield before you ever had your own, and that's the best schooling there is. Whoever it was, I'd wager they'd be proud to see you wearing the plate now." } },
      choices = { { text = "I hope so.", next = "BACK", fx = { affinity = 1 } } },
    },
    xorig_darkshire = {
      lines = { { id = "xo_darkshire", text = "Then you already know what it's like to stand on a wall at night and wait for the dark to move. The Light only puts a little more behind you, which is something the Night Watch could always have used." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorig_ironforge = {
      lines = { { id = "xo_ironforge", text = "The Mystic Ward's a good place to kneel, with the forge rumbling under your knees like the mountain's own prayer. Dwarves were late to the Light, but you've never been late to anything else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { proud = 1 } } } },
    },
    xorig_quarry = {
      lines = { { id = "xo_quarry", text = "Then you know how to keep a crew alive under a falling roof, which is most of what a paladin does with a party. You'll only swap the pick for a hammer and the foreman's whistle for a prayer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorig_risen = {
      lines = {
        { id = "xo_risen", text = "Then you swore the oath once already, with a heartbeat behind it. I won't ask you to swear it again, only to keep it as well as you can now that you're cold." },
      },
      choices = {
        { text = "My oath outlived me. I'll keep it.", next = "BACK", reply = "Then the Light has more company than I thought, and I'll stand beside you, cold hands and all, for as long as you keep that oath.", fx = { align = { honor = 1 }, trait = { pious = 1 } } },
        { text = "Death released me from that oath.", next = "BACK", reply = "Perhaps it did, and I won't hold you to words spoken by a living man, but I'd hope you'd find something worth swearing to again.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_unsworn = {
      lines = { { id = "xo_unsworn", text = "Then you never knelt, and yet the Light came to you anyway, so it can't care much for our ceremonies. If you want to say the words now, I'll hear them, and if not, the Light seems to have heard enough." } },
      choices = {
        { text = "I'd like to say them now.", next = "oath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oath = {
      lines = { { id = "oa_default", text = "Then kneel. Swear to stand between the weak and the dark, to judge slowly and strike surely, and to give the Light back everything it gives you. Rise, then, for it's done, and no grave can take it from you a second time." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
  },
  topics = {
    holy_light = {
      { id = "w_light", text = "The Light is the strength in your arm when your arm has nothing left, and it asks only that you use it for others. Uther taught us that, and every paladin since has had to learn it again with blood on their gauntlets." },
    },
    arthas = {
      { id = "w_arthas", text = "He was one of ours, ordained by Uther's own hand, and he broke the order when he broke his father's kingdom. We teach his name to every squire, so that none of them think the Light makes them incapable of falling." },
    },
    scourge = {
      { id = "w_scourge", text = "The dead fear the Light more than any blade, and a paladin who stands firm is a wall they can't climb. Go north when you're ready, and not a day before." },
    },
    silver_hand = {
      { id = "w_hand", text = "Five knights at the start, and Uther first among them, and for a while there was no finer order in the world. Now we're whoever still keeps the oaths, wherever we happen to be." },
    },
    scarlet_crusade = {
      { id = "w_scarlet", text = "Zealots in red who think fear and faith are the same thing. Some of my old brothers are among them, and I pray for them, which they would call heresy." },
    },
    argent_dawn = {
      { id = "w_argent", text = "Good people at Light's Hope Chapel who fight the Scourge without asking for anyone's pedigree. If you want to do the order's work in the north, they'll give you plenty of it." },
    },
    stratholme = {
      { id = "w_strat", text = "The city where a prince stopped being a paladin. The Scourge hold its streets and the Scarlets hold a corner of it, and neither of them deserves to." },
    },
    tome_of_divinity = {
      { id = "w_tome", text = "Every young paladin gets sent after a tome sooner or later, and the reading is the easy part. The lesson is in the errand, which is usually somebody else's trouble." },
    },
    forsaken = {
      { id = "w_forsaken", text = "They're the people of Lordaeron, whatever else they are now, and some of them still kneel. I'd sooner judge them one at a time than all at once." },
    },
    knows = {
      { id = "t_kn1", text = "The Light asks us to share whatever might help another, so I will. Ask me about any of these, and I'll give you a true answer." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You carry yourself with honor, and I'd gladly tell you all I know, and pray you use it well." },
    },
    _none = { { id = "t_none", text = "That's not a matter of the Light. Ask elsewhere, and kindly." } },
    background = { { id = "t_bg", text = "I took my vows on my knees and broke my first hammer within the week. The vows held up better." } },
    advice = { { id = "t_ad", text = "Mend the body, then the armour, then the spirit. Most people do it backwards and wonder why they're so tired." } },
  },
}

P:Pool {
  -- Every unnamed priest trainer shares this conversation (named ones have their own).
  -- Faction-neutral: Light-aligned priests of both factions, and Forsaken and troll priests.
  id = "trainer_priest", role = "trainer", subtitle = "priest trainer", tier = "service",
  greetings = {
    { id = "g_peace", text = "Peace. What do you need?" },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Back for more? Good; the Light rewards the stubborn." },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}. I hope you prayed while you were gone, because I prayed for you." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've grown since our last lesson, and the Light has grown in you with it. Sit, and we'll go on." },
  },
  notice = {
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "PRIEST" },
      text = "A gnome in the vestments! I've heard of it and never seen it. Your people do like to take things apart, but faith isn't one of those things." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "PRIEST" },
      text = "The Light still answers you. It burns a little, I'd guess, and that's good; burning means it's listening." },
    { id = "n_hurt", cat = "class", when = { class = "PRIEST", durability = { max = 0.25 } },
      text = "A priest, with armour like that? You've been standing in front of the fighters again, and you belong behind them, always behind." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Out of the shadow for the lesson, please. Nothing I teach will reach you through it." },
  },
  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Ah, the other half of the craft. Careful it doesn't become the whole of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Healing is the easy part. Knowing when to let someone fall and learn is harder." },
        { id = "l_young", when = { class = "PRIEST", maxLevel = 20 }, text = "Still learning to keep your friends standing? That takes longer than learning the words, so be patient with yourself." },
        { id = "l_veteran", when = { class = "PRIEST", minLevel = 45 }, text = "You've seen things I only teach about. Don't let them make you hard; let them make you careful." },
        { id = "l_other", when = { ["not"] = { class = "PRIEST" } }, text = "Not one of mine, but the Light doesn't mind. If you're ever hurt and far from a priest, pray anyway. It hears more than we do." },
      },
      again = { { id = "a_again", text = "Something else, while you're here?" } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What should I be practising?", next = "practise", when = { class = "PRIEST" } },
        { text = "I'm torn between studying the Light and the shadow.", next = "shadow", when = { class = "PRIEST", minLevel = 10 } },
        { text = "Does the shadow frighten you?", next = "shadow_fear", when = { form = "shadow" } },
        { text = "Healing all day must wear you down.", next = "tired" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Watching: who's about to fall, who's pretending not to be hurt, who's standing in the fire. A priest who sees early heals less and saves more." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Your mana: learn how much a prayer costs before you need three in a row. Most young priests learn it the other way." },
      },
      choices = {
        { text = "And in a fight?", next = "practise_fight" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_fight = {
      lines = { { id = "pf_default", text = "Shield the one who'll be hit next, not the one who was hit last. That's the whole art. The rest is timing and nerve." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shadow = {
      big = true,
      lines = { { id = "s_default", text = "Both, if you're brave and honest with yourself. The Light heals; the shadow teaches you what you're healing against. Just never let the second one become the reason you do the first." } },
      choices = {
        { text = "I'll keep to the Light.", next = "BACK", reply = "A good choice, and an easier road to walk, though you'll still meet the shadow in other people's wounds, so don't think you've escaped it altogether.", fx = { align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I want to learn the shadow.", next = "BACK", reply = "Then learn it carefully, and come back to the Light often, because the shadow is a fine teacher and a very poor master.", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },
    shadow_fear = {
      lines = { { id = "sf_default", text = "Not the shadow itself, but the ease of it. Everything you do in that shape, you take from someone, and everything you do outside it, you give. I'd hate to see you forget how to give." } },
      choices = {
        { text = "I won't forget.", next = "BACK", reply = "I'll hold you to that, and so will the people you heal, because they'll notice long before you do if you start to forget.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Taking keeps people alive too.", next = "BACK", reply = "It does, and I'll not tell you otherwise, but be sure you keep count of what you take, because the shadow certainly won't.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    tired = {
      lines = { { id = "t_default", text = "Every night, and then someone walks in bleeding and I'm not tired any more. That's either devotion or habit, and after long enough, I'm not sure there's a difference." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },
  topics = {
    holy_light = {
      { id = "w_light_a", when = { faction = "Alliance" }, text = "The Light dwells in compassion and in sacrifice, and a priest's whole work is to make room for it. Practise kindness until it's as natural to you as breathing, and the Light will do the rest." },
      { id = "w_light_h", when = { faction = "Horde" }, text = "The Light is a power like any other, and it answers whoever has the will to command it. Learn to call it, and don't let anyone tell you that you must first be worthy." },
      { id = "w_light_ud", when = { faction = "Horde", race = "Scourge" }, text = "We died and the Light still answers us, which the Cathedral has never managed to explain. Use it, and let them keep their sermons." },
    },
    elune = {
      { id = "w_elune", when = { race = "NightElf" }, text = "Elune hears your prayers as surely as the Light hears a human's, and the Sisterhood has healed under her moon for ten thousand years. Pray to her by name, child; she likes to be asked." },
    },
    scourge = {
      { id = "w_scourge", text = "The Scourge are what happens when death is denied its due. Heal the living, give the dead their rest, and you'll have done what a priest is for." },
    },
    knows = {
      { id = "t_kn1", text = "The sick tell me everything, and the healthy tell me the rest. Here is what I can speak to without breaking a confidence." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you, because I answer everyone, but I'll choose my words with care." },
    },
    _none = { { id = "t_none", text = "I'd only be guessing, and guessing is not a sermon." } },
    background = { { id = "t_bg", text = "I knelt once, got up a priest, and haven't sat down much since." } },
    advice = { { id = "t_ad", text = "Carry bandages anyway. The Light is generous, but it's not always quick." } },
  },
}

P:Pool {
  -- Faction-neutral: human, gnome and Skyborne mages for the Alliance; Forsaken, troll and
  -- orc mages for the Horde.
  id = "trainer_mage", role = "trainer", subtitle = "mage trainer", tier = "service",
  greetings = {
    { id = "g_study", text = "Have you been studying, or just setting things on fire?" },
    { id = "g_vet", when = { class = "MAGE", minLevel = 40 }, text = "You've still got both eyebrows, I see, which means you've been careful. Come in." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and nothing's exploded in your absence. Make of that what you will." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've come on a long way since I last taught you; I can feel it in the air around you. Let's not waste it." },
  },
  notice = {
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "MAGE" },
      text = "An orc who reads! Don't take offense; I'm delighted. Most of my students can't sit still for a page." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "MAGE" },
      text = "Descended from Highborne magisters, I'm told, and come home after a very long time away. I'd like to hear what your people kept, after you've heard what I teach." },
    { id = "n_robes", cat = "gear", when = { class = "MAGE", durability = { max = 0.25 } },
      text = "Robes in tatters? The best mages never get close enough for that, you understand." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "MAGE" },
      text = "A gnome of the arcane! Your people's last students are scattered across three cities since Gnomeregan fell, and each of them still corrects my diagrams." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "MAGE" },
      text = "Some of your people studied in Dalaran while they still breathed. They make the most patient students I have, since time no longer frightens them." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "MAGE" },
      text = "A troll with a spellbook. The witch doctors would call this foreign magic, and they wouldn't be wrong, but the arcane doesn't care whose hands it's in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Magic is a debt: you borrow power and you pay it back in focus. Don't fall behind on payments." },
        { id = "l_young", when = { class = "MAGE", maxLevel = 20 }, text = "You still count your mana in fireballs, don't you? Count it in heartbeats instead, and you'll live a good deal longer." },
        { id = "l_veteran", when = { class = "MAGE", minLevel = 45 }, text = "You've read things out in the field that aren't in any library I can get into. Write them down, and be careful who you show them to." },
        { id = "l_other", when = { ["not"] = { class = "MAGE" } }, text = "You're no mage, but you're welcome to stand in the corner and look impressed. Most of my students would kill for an audience." },
      },
      again = {
        { id = "a_again", text = "Another question? Good; questions are cheaper than mistakes." },
        { id = "a_again2", text = "Go on. The books won't mind waiting." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "All this knowledge must come at a cost.", next = "price", when = { class = "MAGE", minLevel = 10 } },
        { text = "You must think about Dalaran often.", next = "dalaran" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Control: putting a frost bolt exactly where you meant it, every single time. Power comes on its own, and control never does." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Conjure your own food and water, and stop paying the innkeeper for it. Making bread out of nothing teaches more patience than any lecture of mine." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to turn the beast into a sheep and walk away from it. The cleverest fight is the one you postpone until it suits you." },
      },
      choices = {
        { text = "And if they get close?", next = "practise_close" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_close = {
      lines = { { id = "pc_default", text = "Then you've already made a mistake, so freeze them where they stand and walk, don't run, to a better distance. A mage in a hurry is usually a mage on fire." } },
      choices = { { text = "Walk, don't run. Understood.", next = "BACK", fx = { affinity = 1 } } },
    },
    price = {
      big = true,
      lines = { { id = "pr_default", text = "Everything, if you let it. Dalaran's best minds studied until they couldn't see the edge of what they were doing, and some of them opened doors that should have stayed shut. Read all you like, but learn when to put a book down, because the Kirin Tor keep locked shelves for a reason." } },
      choices = {
        { text = "Some books should stay closed.", next = "BACK", reply = "Wiser words than many in Dalaran ever spoke, and I'd say them more often myself if the books weren't so very tempting.", fx = { align = { order = 1, light = 1 }, trait = { cautious = 1 } } },
        { text = "No knowledge is forbidden. Only what we do with it.", next = "BACK", reply = "That's the argument every fallen magus made, and they believed it as sincerely as you do, right up until they found out what they'd done with it.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Who opened those doors?", next = "price_who" },
      },
    },
    price_who = {
      lines = { { id = "pw_default", text = "Kel'Thuzad sat among the Kirin Tor, and a respected member too, until he went looking for necromancy and found something waiting for him. He was a brilliant man, and that was precisely the trouble." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    dalaran = {
      lines = { { id = "da_default", text = "Every mage does. The Scourge broke its walls and the demon Archimonde levelled what was left, and now the Kirin Tor rebuild behind their shield and let very few inside. Whatever you learn here is a scrap of what was lost there." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = {
      { id = "w_dalaran", text = "Every school of the arcane worth the name traces itself back to Dalaran, and I'd give a great deal to see its libraries again. The Kirin Tor are rebuilding behind their dome, and they'll open the gates when they're good and ready, and not a moment sooner." },
    },
    kirin_tor = {
      { id = "w_kirintor", text = "The Council of Six rule Dalaran and guard its secrets, and they don't share them lightly. Earn their notice someday, and you'll learn more in a month than I can teach you in a year." },
    },
    kelthuzad = {
      { id = "w_kelthuzad", text = "He sat on the Council of Six, and he left it for necromancy, and now he commands the dead in the north. Every mage should study him, the way a sailor studies a shipwreck." },
    },
    knows = {
      { id = "t_kn1", text = "Knowledge is the one thing a mage may hoard without shame, though I'll lend a little of mine. Here's what I've read, or overheard in the library." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've studied properly, so I'll open the better books for you." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer these briefly, because every minute spent on you is a minute taken from my research." },
    },
    _none = { { id = "t_none", text = "If it isn't in a book, I haven't bothered with it." } },
    background = { { id = "t_bg", text = "I set fire to my first teacher's beard, and he took me on because of it. He said anyone who could manage that by accident was worth teaching on purpose." } },
    advice = { { id = "t_ad", text = "Never stand where you can't see the door. Mages who forget that end up as warnings in someone else's lecture." } },
  },
}

P:Pool {
  -- Faction-neutral: human and gnome warlocks for the Alliance; orc, troll and Forsaken
  -- warlocks for the Horde.
  -- The warlock patch: a mentor's walk through the class, gated by level (imp and Life Tap,
  -- voidwalker 10, succubus 20, felhunter and Enslave Demon 30, felsteed 40, Inferno 50,
  -- Ritual of Doom and the dreadsteed 60), soul shards and stones, Fel Taint, faction and race.
  id = "trainer_warlock", role = "trainer", subtitle = "warlock trainer", tier = "service",
  greetings = {
    { id = "g_quiet", text = "Shut that door first. Now, what is it you want?" },
    { id = "g_vet", when = { class = "WARLOCK", minLevel = 40 }, text = "Still yourself, I see. Good; not everyone who comes back is." },
    { id = "g_away", when = { away = 7 }, text = "You've been away {away}, and you're still yourself. Shut the door and sit." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've grown stronger since our last lesson, and something has noticed. Let's make certain you stay the master of it." },
    { id = "g_taint", when = { taint = { min = 30 } }, text = "Close the door, and keep your hands where I can see them. Something came in with you, and I'd like to know what it is before we talk." },
    { id = "g_horde", when = { faction = "Horde", class = "WARLOCK" }, text = "Come in out of the light. The Warchief lets us work, but nobody in this city enjoys watching us do it." },
    { id = "g_alliance", when = { faction = "Alliance", class = "WARLOCK" }, text = "Come in, and quietly. The good people outside have agreed not to know we're here, and I'd like to keep it that way." },
  },
  notice = {
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A troll with a grimoire instead of a fetish. The spirits won't like it, and the demons won't care." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp is looking at my books. Tell it to stop looking at my books." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "WARLOCK" },
      text = "A gnome who reads grimoires. Your people like to know how things work, and I'll warn you now that some things work better when you don't look too closely." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "WARLOCK" },
      text = "An orc at this trade, after everything it cost your people. Either you're very brave or you haven't heard the stories, and I hope it's the first." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "WARLOCK" },
      text = "The dead make careful warlocks, since there's not much left in you for a demon to bargain over. Don't let that make you careless." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker keeps drifting toward the candles. Tell it the dark in this room belongs to me." },
    { id = "n_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Send your succubus to wait in the hall. She distracts my other students, and she knows perfectly well that she does." },
    { id = "n_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Your felhunter is sniffing at my wards. They need the testing, but call it back before it eats one." },
    { id = "n_human", cat = "class", when = { race = "Human", class = "WARLOCK" },
      text = "A human warlock, and a bold one to walk in here in daylight. Half the nobles on the hill would hang you in public and ask you a favour in private, so mind which half you're talking to." },
    { id = "n_taint", cat = "dark", when = { taint = { min = 60 } },
      text = "There's fel on you thick enough to smell, like hot iron and burnt hair. I've seen students go that colour before, and I've buried most of them." },
    { id = "n_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "You rode a felsteed to my door, I see. Send it back before the horses in the street catch its scent and kick their stalls to splinters." },
  },
  react = {
    { id = "r_demon", on = "pet", when = { pet = { type = "Demon" } }, text = "Ah, and here's your shadow. Sit it by the door and don't let it touch anything." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Power is power. The ones who sneer at where it comes from never have enough of it." },
        { id = "l_young", when = { class = "WARLOCK", maxLevel = 20 }, text = "Your imp still talks back to you, doesn't it? Good; the day it goes quiet is the day you should start worrying." },
        { id = "l_veteran", when = { class = "WARLOCK", minLevel = 45 }, text = "You've bound things I'd hesitate to name aloud. Tell me how, quietly, and then tell me what they asked for in return." },
        { id = "l_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're no warlock, so I'll not explain myself. Most people who ask what I do don't really want to know." },
        { id = "l_capped", when = { class = "WARLOCK", minLevel = 60 }, text = "There's nothing left in my books that you haven't already read. Sit anyway, because a warlock with no one to talk to starts listening to the wrong voices." },
      },
      again = {
        { id = "a_again", text = "Something else? Keep your voice low." },
        { id = "a_again2", text = "Go on, while the door's still shut." },
        { id = "a_again3", when = { class = "WARLOCK" }, text = "What else is on your mind? Ask it now, while there's nothing listening but me." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Tell me about the demons I'll be binding.", next = "bind", when = { class = "WARLOCK" } },
        { text = "What exactly does Drain Soul take from them?", next = "shards", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "Show me the uses of a soul shard.", next = "stones", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "I'd guess the demon is never really the servant.", next = "master", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "I've learned to call a felsteed out of the Nether.", next = "steed", when = { class = "WARLOCK", minLevel = 40 } },
        { text = "You keep looking at my hands.", next = "taint", when = { taint = { min = 30 } } },
        { text = "My demon's been listening to every word.", next = "pet", when = { pet = { type = "Demon" } } },
        { text = "How does a warlock teach here without a mob at the door?", next = "hidden" },
        { text = "What does this craft mean for one of my people?", next = "heritage", when = { class = "WARLOCK", race = { "Orc", "Troll", "Scourge", "Human", "Gnome" } } },
        { text = "Some would call this work hard to justify.", next = "justify" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Patience with your curses. Lay them, step back and let them work, because a warlock standing in the thick of the fight has forgotten what the craft is for." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn to trade your own health for power and back again, and learn exactly how far you can push it. You'll find the line by falling over it once, so do that somewhere safe." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to send your servant where you'd never go yourself. That's the whole art, and it's also the whole danger." },
      },
      choices = {
        { text = "And if the demon turns on me?", next = "practise_turn" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_turn = {
      lines = { { id = "pt_default", text = "Then you were weak, or careless, or it was cleverer than you, and you'll find out which while it's eating you. Bind it again, tighter, and never let it see you flinch." } },
      choices = { { text = "I won't flinch.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    master = {
      big = true,
      lines = { { id = "m_default", text = "The warlock is, always, right up until the moment the warlock isn't. Every one of us believes we hold the leash, and every one who fell believed it until they were on the other end of it." } },
      choices = {
        { text = "I hold the leash. That's what mastery means.", next = "BACK", reply = "Then hold it tightly, and never let the thing on the other end hear you say that, because they all keep a careful count of every boast.", fx = { align = { order = 1, light = -1 }, trait = { stern = 1 } } },
        { text = "Maybe I'm being used. I'll use it right back.", next = "BACK", reply = "That's the honest answer, and the one that keeps most of us alive, so long as you remember the demon is thinking exactly the same thing.", fx = { align = { order = -1, honor = -1 }, trait = { witty = 1 } } },
        { text = "Have you ever lost control?", next = "master_lost" },
      },
    },
    master_lost = {
      lines = { { id = "ml_default", text = "Once, and the room still has scorch marks under the new paint. I bound it again before it reached the door, and you're the first student I've told how close it came." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    justify = {
      lines = { { id = "j_default", text = "The demons are coming whether we study them or not. I'd rather the one who understands them stood on our side than theirs, and if it costs me a little of my soul, that's mine to spend." } },
      choices = {
        { text = "That's a dangerous bargain.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The binding ladder: a hub of its own, each rung opening at the level it's taught.
    bind = {
      hub = true,
      narr = "The trainer draws a circle on the table with one finger, then wipes it away with the side of a hand.",
      lines = {
        { id = "b_default", text = "Every demon you call is a lesson in what you can hold, and they come in the order you're ready for them. Ask about the ones you've met, and I'll tell you what the books leave out." },
        { id = "b_young", when = { maxLevel = 9 }, text = "For now you've an imp and a little of your own blood to spend, and that's more than enough to get yourself killed. The rest will come when you've proved you can keep hold of those." },
        { id = "b_vet", when = { minLevel = 50 }, text = "You've climbed most of the ladder already, so you know the lower rungs better than I could tell you. Ask anyway; it does a warlock good to remember how small the first chains felt." },
      },
      again = {
        { id = "ba_again", text = "Which of them, then? Pick one, and I'll tell you how it bites." },
        { id = "ba_again2", text = "Another of your servants? Go on, I've time for one more." },
      },
      choices = {
        { text = "My imp, to start with.", next = "imp" },
        { text = "I'm paying for spells with my own blood now.", next = "lifetap", when = { minLevel = 6 } },
        { text = "You sent me after a voidwalker. What is it?", next = "void", when = { minLevel = 10 } },
        { text = "The succubus, and her little games.", next = "succubus", when = { minLevel = 20 } },
        { text = "Tell me about the felhunter.", next = "felhunter", when = { minLevel = 30 } },
        { text = "Why does Enslave Demon never hold?", next = "enslave", when = { minLevel = 30 } },
        { text = "I can call down an infernal now.", next = "inferno", when = { minLevel = 50 } },
        { text = "That's enough about demons for now.", next = "BACK" },
      },
    },
    imp = {
      lines = {
        { id = "i_default", text = "The imp is the first thing any of us ever binds, because it's small, and spiteful, and too lazy to do you much harm. It will lie to you, sulk at you and set fire to anything you leave lying about, and you'll learn more about holding a leash from that one than from anything that comes after." },
        { id = "i_hasimp", when = { pet = { family = "Imp" } }, text = "That one at your heels is listening, so I'll say it plainly: an imp is the cheapest servant in the Nether, and it knows it. It will lie to you and sulk at you, and you'll learn more about holding a leash from it than from anything that comes after." },
      },
      choices = {
        { text = "Mine keeps setting fire to things on purpose.", next = "imp_trust" },
        { text = "I'll keep it on a short chain. Something else?", next = "BACK", reply = "Short enough to feel it pull, but not so short it learns how much you fear it. Ask on." },
      },
    },
    imp_trust = {
      lines = { { id = "it_default", text = "Of course it does, because it's testing what you'll let it get away with, and so far the answer is a burned blanket and a sulk. Punish it once and mean it, and let it see you mean it, because every demon you ever bind will have heard how you handle the small ones." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", reply = "Good, and so will the imp.", fx = { trait = { stern = 1 } } },
        { text = "Honestly, I've grown fond of the little wretch.", next = "BACK", reply = "Most of us do, which is exactly how it gets away with the blankets. Be fond of it, then, but never where it can see.", fx = { trait = { kind = 1 } } },
      },
    },
    lifetap = {
      lines = { { id = "lt_default", text = "Life Tap is the first true warlock's bargain, and it's made with yourself. You open a vein of your own life and pour it into your mana, and the only thing standing between you and the grave is your own judgement of when to stop." } },
      choices = {
        { text = "What does it cost me, beyond the blood?", next = "lifetap_cost" },
        { text = "I'll mind my judgement. What else?", next = "BACK", reply = "Mind it closely. The ones who tap themselves dry rarely get the chance to learn from it." },
      },
    },
    lifetap_cost = {
      big = true,
      lines = { { id = "lc_default", text = "Habit, mostly. A priest prays and a mage studies, but you'll learn to reach for your own heartbeat whenever you want more, and a warlock who gets used to spending their own life is halfway to spending everyone else's." } },
      choices = {
        { text = "My life is mine to spend however I like.", next = "BACK", reply = "It is, and no one will stop you. Just make sure it's you doing the spending, and not something that's learned to hold your purse.", fx = { align = { order = -1, honor = -1 } } },
        { text = "Then I'll keep strict rules about when I'll use it.", next = "BACK", reply = "Rules are what keep a warlock alive, so write them down and keep them somewhere you'll see them on your worst night.", fx = { align = { order = 1, honor = 1 }, trait = { cautious = 1 } } },
      },
    },
    void = {
      lines = {
        { id = "v_default", text = "A voidwalker is a piece of the emptiness between worlds, given a body so that it can be hit instead of you. My students bind their first one as a test, out in the wild where a mistake won't burn down my study, and the ones who come back have learned what a real circle is for." },
        { id = "v_hasvoid", when = { pet = { family = "Voidwalker" } }, text = "You bound that one yourself, so you already know the test: you called it, it fought you, and you won. What you may not know yet is where it came from, or why it never seems to mind the pain." },
      },
      choices = {
        { text = "What is the void, exactly?", next = "void_what" },
        { text = "It's stronger than me, so why does it obey?", next = "void_why" },
        { text = "Good to know. Another question.", next = "BACK" },
      },
    },
    void_what = {
      lines = { { id = "vw_default", text = "Between the worlds there's the Twisting Nether, where the Legion's demons breed and burn, and beneath even that there's a dark that wants nothing at all. The voidwalker is a scrap of that dark, and it serves us because it has no will of its own to set against ours." } },
      choices = { { text = "That's a cold thing to keep at your side.", next = "BACK", reply = "Cold and faithful, which is more than I can say for most company. Something else?" } },
    },
    void_why = {
      lines = { { id = "vy_default", text = "Because you beat it once, and the void remembers nothing but who won. It will soak up every blow meant for you without complaint, but the moment the chain slips, it will drift off into the dark again and never look back." } },
      choices = { { text = "Then I won't let the chain slip.", next = "BACK", reply = "See that you don't. What else?" } },
    },
    succubus = {
      lines = {
        { id = "s_default", text = "The succubus is your first servant with real wit, and she'll use it on you before she ever uses it on an enemy. I sent you to bind her because you were ready for the chains, but nobody is ever quite ready for the conversation." },
        { id = "s_has", when = { pet = { family = "Succubus" } }, text = "She's smiling at me over your shoulder as we speak, and I'd advise you not to turn around and ask why. A succubus serves the warlock who can't be read, and she has been reading you since the day you bound her." },
      },
      choices = {
        { text = "How does she read me?", next = "succubus_read" },
        { text = "I can handle her. Something else.", next = "BACK", reply = "Everyone says that about the first one. Ask me again in a year." },
      },
    },
    succubus_read = {
      big = true,
      lines = { { id = "sr_default", text = "She watches what you want, and what you're ashamed of wanting, and she offers you one to cover the other. Never let her see what you desire, not power or comfort or even a kind word, because the day she knows it, she'll start bargaining with you for it." } },
      choices = {
        { text = "Then I'll want nothing. Ice is harder to read.", next = "BACK", reply = "Ice cracks, but it's the right instinct, and she'll respect it in her way. Keep it up.", fx = { align = { order = 1, light = 1 } } },
        { text = "Let her read me. I'll learn to read her back.", next = "BACK", reply = "Ambitious, and dangerous, and I've known it work exactly twice. Go carefully, because she's had a great deal more practice.", fx = { align = { order = -1, honor = -1 }, trait = { witty = 1 } } },
      },
    },
    felhunter = {
      lines = { { id = "f_default", text = "The Legion bred the felhunters to hunt down rogue spellcasters, sniffing out their magic and devouring it while it still hums. Now they wear our collars, and I've never stopped finding that funny, though I'm careful not to laugh where one can hear me." } },
      choices = {
        { text = "So it was made to hunt people like us.", next = "felhunter_irony" },
        { text = "Useful against mages, then. Another question.", next = "BACK", reply = "Against mages, priests and anything else that hums, which is half of Azeroth. What else?" },
      },
    },
    felhunter_irony = {
      lines = { { id = "fi_default", text = "Exactly like us, and it hasn't forgotten. A felhunter is the most loyal thing you'll ever bind for as long as you're stronger than it, and the hungriest the moment you aren't, so feed it on enemy magic often and never let it get a taste of yours." } },
      choices = { { text = "I'll keep it well fed.", next = "BACK", reply = "Do. A hungry hound on a fel leash is a lesson nobody survives twice." } },
    },
    enslave = {
      lines = { { id = "e_default", text = "Enslave Demon takes a creature someone else bound, or no one did, and puts your chain on it by force. It never holds, because the demon never agreed to anything; every moment it serves you, it's straining to get free, and when it does, it remembers who held it." } },
      choices = {
        { text = "Then why teach it at all?", next = "enslave_break" },
        { text = "A borrowed demon, then. Something else.", next = "BACK", reply = "Borrowed from someone who'll want it back with interest. Go on." },
      },
    },
    enslave_break = {
      lines = { { id = "eb_default", text = "Because sometimes you need a doomguard for a minute more than you need one for a year, and because it teaches a warlock what a binding really is. A proper binding is a bargain, and Enslave is a stolen one, so when it breaks, you'd best be standing somewhere far away." } },
      choices = { { text = "I'll keep my distance when it breaks.", next = "BACK", reply = "Sensible. More than a few never got the chance." } },
    },
    inferno = {
      lines = { { id = "in_default", text = "Inferno rips an infernal out of the Nether and throws it down like a burning stone, and the crater it leaves is the least of its damage. It fights for you only so long as you keep it enslaved, and it hates you with a fury that never cools, so keep the chain on it, or don't call it at all." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK", reply = "Keep it close to the front of your mind, then. Infernals don't give second warnings." } },
    },

    -- Soul shards and the ethics of taking them.
    shards = {
      narr = "The trainer turns a soul shard over in the candlelight, and something purple shifts inside it.",
      lines = { { id = "sh_default", text = "Drain Soul takes what's left of a creature in the moment it dies, and presses it into a shard you can carry in your bag. Every circle you draw and every stone you make costs one, so a warlock is always hunting, whether they'll admit it or not." } },
      choices = {
        { text = "Whose souls are worth taking?", next = "shards_ethics" },
        { text = "I'll keep my bags full. What else?", next = "BACK", reply = "Fuller than you think you need. You always run out at the worst moment." },
      },
    },
    shards_ethics = {
      big = true,
      lines = {
        { id = "se_default", text = "That's the question every warlock answers sooner or later, usually without noticing. Some only take from beasts and demons, some take from anything that dies at their feet, and some start choosing who dies because of what's in them." },
        { id = "se_horde", when = { faction = "Horde" }, text = "That's the question Gul'dan stopped asking, and the whole Horde paid for it. Some of us only take from beasts and demons, some from anything that falls at our feet, and a few start choosing who falls because of what's inside them." },
      },
      choices = {
        { text = "A soul is fuel. I'll take whatever I need.", next = "BACK", reply = "Spoken like someone the Legion would welcome with open arms. I'll teach you all the same, but I'll be watching what you bring back.", fx = { align = { light = -1, honor = -1 }, taint = 1 } },
        { text = "Only from those who'd have taken mine.", next = "BACK", reply = "A soldier's rule, and a good one. Keep to it, and you'll be able to look a paladin in the eye, even if he won't look back.", fx = { align = { light = 1, honor = 1 } } },
        { text = "Does it hurt them?", next = "shards_hurt" },
      },
    },
    shards_hurt = {
      lines = { { id = "shh_default", text = "I don't know, and nobody who knows has ever come back to tell me. I've heard them, though, faintly, when the bag is full and the room is quiet, so I keep my shards in a box and the box in a drawer." } },
      choices = { { text = "I'd rather not have asked.", next = "BACK", reply = "Most of my students say that. It's the right answer, and it won't stop you wondering." } },
    },
    stones = {
      lines = { { id = "st_default", text = "A shard is more than fuel for a summoning, so learn its other uses. A healthstone gives the life back to whoever eats it, a soulstone holds a soul ready to come back from death, and once you know the ritual, a shard and two friends can pull a third across the world to you." } },
      choices = {
        { text = "Tell me about the soulstone.", next = "stones_soul", when = { minLevel = 18 } },
        { text = "And the Ritual of Summoning?", next = "stones_summon", when = { minLevel = 20 } },
        { text = "Healthstones, then. Why do others want mine?", next = "stones_health" },
        { text = "That's plenty. Something else.", next = "BACK" },
      },
    },
    stones_health = {
      lines = { { id = "sth_default", text = "Because it works, and because nobody asks where the life inside it came from. Hand them out freely to whoever fights beside you, and you'll find the same people who sneer at your robes will queue politely for your stones." } },
      choices = { { text = "I've noticed that already.", next = "stones", reply = "Everyone does, eventually. The irony never wears off." } },
    },
    stones_soul = {
      lines = { { id = "sts_default", text = "A soulstone holds a soul in trust, so that when it dies it has somewhere to go besides the graveyard. Put it on the priest or the healer before a hard fight, because the one who can bring everyone else back is the one who needs it most, and never let anyone call it unholy while it's saving their life." } },
      choices = { { text = "On the healer. I'll remember.", next = "stones", reply = "You'll be thanked for it, though rarely out loud." } },
    },
    stones_summon = {
      lines = { { id = "ss_default", text = "The Ritual of Summoning opens a door between you and someone far away, and it takes your friends' hands on the circle to hold it open. It's the one spell we have that needs trust, so pick your company well, because a circle with a traitor in it is very quick to close." } },
      choices = { { text = "Then I'll choose my company carefully.", next = "BACK", reply = "Carefully, and more than once. Something else?" } },
    },

    -- The felsteed at 40, and at 60 the Ritual of Doom and the dreadsteed.
    steed = {
      lines = {
        { id = "fs_default", text = "Then you've earned something few get, a mount the Nether gives you that no stable could ever sell. A felsteed runs on hate and brimstone, and it won't tire, but it remembers every kick of your heels, so ride it hard and dismiss it gently." },
        { id = "fs_riding", when = { aura = { 5784 } }, text = "I can hear it stamping outside, and the street's gone very quiet around it. A felsteed runs on hate and brimstone and never tires, but it remembers every kick of your heels, so ride it hard and dismiss it gently." },
      },
      choices = {
        { text = "Is there anything beyond the felsteed?", next = "doom", when = { minLevel = 60 } },
        { text = "It's a fine beast. Something else.", next = "BACK", reply = "It is, and don't tell it so. They grow vain." },
      },
    },
    doom = {
      big = true,
      narr = "The trainer glances at the door, then leans across the table to speak more quietly still.",
      lines = { { id = "d_default", text = "There's the Ritual of Doom, which opens a gate for a doomguard of the Legion, and the circle pays for it, sometimes with a life. And there's the dreadsteed of Xoroth: Mor'zul Bloodbringer in the Burning Steppes knows the way of it, and it ends in Dire Maul, in a circle of warlocks holding back the dreadsteed itself, and whatever lord of Xoroth comes looking for it." } },
      choices = {
        { text = "The Legion's own ritual, turned to my ends. Gladly.", next = "BACK", reply = "Gladly is the word that worries me. Go, then, but count the people in the circle when it's done.", fx = { align = { light = -1, order = -1 }, taint = 2 } },
        { text = "I'll take the dreadsteed, and leave the doomguard alone.", next = "BACK", reply = "The steed is a trophy, and the doomguard is a debt. I think you've chosen well.", fx = { align = { light = 1, order = 1 } } },
        { text = "What waits in that circle?", next = "doom_xor" },
      },
    },
    doom_xor = {
      lines = { { id = "dx_default", text = "A steed of fire and shadow, fighting the chain with everything it has, and then a dreadlord of Xoroth who keeps the finest steeds in the Nether and doesn't care to share them. Bring friends, bring shards, and bring a warlock or two besides yourself, because the circle won't hold with one." } },
      choices = { { text = "I'll go to the Burning Steppes, then.", next = "BACK", reply = "Go, and come back in the saddle. I'll want to hear every word." } },
    },

    -- Fel Taint: the trainer senses it.
    taint = {
      big = true,
      lines = {
        { id = "ta_default", when = { taint = { min = 30 } }, text = "I'm looking at the fel on them, which is more than a trainer likes to see on a student. It isn't a crime yet, but it's how every warlock who ever turned started out, with a little too much of the Nether left on the hands after the work was done." },
        { id = "ta_deep", when = { taint = { min = 60 } }, text = "You're carrying more fel than half the demons I've bound, and I'll grant it's made you strong. But I can see it in your eyes when the light catches them, and that green doesn't wash out; you'll have to decide soon whether you're wearing it, or it's wearing you." },
      },
      choices = {
        { text = "Let it in. The power is worth the stain.", next = "BACK", reply = "That's what Gul'dan told the clans, word for word. I'll still teach you, but I'll keep a circle drawn under my desk.", fx = { align = { light = -1, order = -1 }, taint = 1 } },
        { text = "I'll burn it out before it takes me.", next = "BACK", reply = "Then rest, fast, and stay away from the Nether for a while. Discipline cleans more than any priest's water.", fx = { align = { light = 1, order = 1 }, trait = { stern = 1 } } },
        { text = "How do I know when it's too much?", next = "taint_signs" },
      },
    },
    taint_signs = {
      lines = { { id = "tas_default", text = "When your demons stop arguing with you, because they've started to think you're one of them. When the green shows in your eyes without your calling it, and when the kind voices in your head are the ones you've learned to trust." } },
      choices = { { text = "I'll watch for it.", next = "BACK", reply = "Watch closely, and if you can't tell anymore, come back here and I'll tell you." } },
    },

    -- The demon at the player's side.
    pet = {
      lines = {
        { id = "pe_default", text = "Of course it has; they always do. Listen well, {pet}, because your master's lessons are your lessons too, and the first one is that you serve until you're told otherwise." },
        { id = "pe_imp", when = { pet = { family = "Imp" } }, text = "Of course it has, because imps eavesdrop the way other creatures breathe. Listen, {pet}: the books on that shelf are warded, and the last imp who touched one is still a smudge on the ceiling." },
        { id = "pe_void", when = { pet = { family = "Voidwalker" } }, text = "Of course it has, though it hasn't the faintest idea what we're saying. Stand there and be still, {pet}, as you do so well, and keep your master between you and my candles." },
        { id = "pe_succ", when = { pet = { family = "Succubus" } }, text = "Of course she has, and she's enjoying it far too much. Hear me, {pet}: your master is my student, and if you ever try your tricks on my students, I will know." },
        { id = "pe_fel", when = { pet = { family = "Felhunter" } }, text = "Of course it has, and it's been sniffing at me the whole while to see what I'm made of. Down, {pet}; I'm not your supper, and neither is the one who holds your leash." },
      },
      choices = { { text = "It heard you, I think.", next = "BACK", reply = "Good. Now, what did you really come to ask?" } },
    },

    -- How the craft hides, by faction.
    hidden = {
      lines = {
        { id = "hi_default", text = "Very carefully, and with the blessing of a few people who'd rather not be seen giving it. A warlock's trainer keeps his door shut, his students quiet and his books warded, and in exchange nobody asks what the screaming was." },
        { id = "hi_horde", when = { faction = "Horde" }, text = "Thrall allows us, because he knows the Legion better than any orc alive and he'd rather we understood it than feared it. So we keep to the Cleft of Shadow in Orgrimmar and the Magic Quarter beneath Undercity, and the rest of the Horde agrees not to look too closely." },
        { id = "hi_alliance", when = { faction = "Alliance" }, text = "Beneath the Slaughtered Lamb in Stormwind there's a cellar, and beneath the cellar there's us. The nobles on the hill know exactly who's down there, and they come down quietly when they need something, and the rest of the city goes on pretending it's only a tavern." },
      },
      choices = {
        { text = "And the Burning Blade?", next = "hidden_blade", when = { faction = "Horde" } },
        { text = "Who are these nobles, then?", next = "hidden_nobles", when = { faction = "Alliance" } },
        { text = "That sounds like a lonely way to live.", next = "BACK", reply = "It is, and it's the reason I talk with my students more than I should. Something else?" },
      },
    },
    hidden_blade = {
      big = true,
      lines = { { id = "hb_default", text = "The Burning Blade is what happens when warlocks stop listening to Thrall and start listening to the Legion again. They're in Ragefire Chasm under the city and in the Cleft itself, in plain sight, and every time a student of mine goes missing, I look for them first." } },
      choices = {
        { text = "They shame us all. I'll hunt them down.", next = "BACK", reply = "Then you'll have the Warchief's thanks and mine. Bring me their grimoires, unopened.", fx = { align = { order = 1, honor = 1 }, learn = { "burning_blade" } } },
        { text = "They've power we could learn from.", next = "BACK", reply = "Learn from them by watching them fall, not by joining them. I've buried enough students who confused the two.", fx = { align = { order = -1, honor = -1 }, learn = { "burning_blade" } } },
      },
    },
    hidden_nobles = {
      big = true,
      lines = { { id = "hn_default", text = "I'd not name them if you put my hand in a candle, but you'd recognise the crests. They want curses for their rivals and protection from their enemies, and they pay well to have both while telling the Cathedral they've never heard of us." } },
      choices = {
        { text = "Hypocrites, the lot of them. Someone should say so.", next = "BACK", reply = "Someone did, once, and his shop burned down the same week. Keep your opinions in this cellar.", fx = { align = { honor = 1, order = -1 } } },
        { text = "Their silence keeps us alive. I'll respect it.", next = "BACK", reply = "That's how this city has always worked, and why we're still here to argue about it.", fx = { align = { order = 1, honor = -1 } } },
      },
    },

    -- What the craft means to the player's own people.
    heritage = {
      big = true,
      lines = {
        { id = "he_default", text = "It means you'll be watched by your own kind more closely than by any stranger. Every people in Azeroth has its reasons to fear what we do, and yours is no different." },
        { id = "he_orc", when = { race = "Orc" }, text = "It means the blood the Legion poured into your ancestors still answers when you call. Gul'dan's Shadow Council made the old Horde drink from Mannoroth, and you'll feel that thirst in you sooner than any human would, so you'll have to master it twice as hard." },
        { id = "he_troll", when = { race = "Troll" }, text = "It means turning your back on the loa, or at least walking where they won't follow. The Darkspear made room for warlocks because Thrall asked them to, and your witch doctors will watch you with their arms folded until you prove them wrong." },
        { id = "he_undead", when = { race = "Scourge" }, text = "It means you're among the Forsaken who chose the darkest door in the Magic Quarter, and that's saying something. The Dark Lady values a weapon, and you're a weapon against the Scourge, but she'd not hesitate to break one that turns in her hand." },
        { id = "he_human", when = { race = "Human" }, text = "It means the Church of the Holy Light would burn you if they could prove what you are, and half of them suspect already. You'll live your life in cellars and back rooms, and you'll learn to smile at the priests who preach against you every Sunday." },
        { id = "he_gnome", when = { race = "Gnome" }, text = "It means you're one of the gnomes who came out of Gnomeregan looking for a power that doesn't run on cogs and steam. Your people value results above all else, and they'll forgive you a great deal so long as it keeps Thermaplugg's lot at bay." },
      },
      choices = {
        { text = "My people should know exactly what I do.", next = "BACK", reply = "Honest, and it'll cost you, but at least you'll never be caught out in a lie. Choose who you tell with care.", fx = { align = { honor = 1, order = 1 } } },
        { text = "What my people don't know won't hurt them.", next = "BACK", reply = "It's what every one of us has decided, sooner or later. Keep your secrets, and keep them well.", fx = { align = { honor = -1, order = -1 } } },
        { text = "My ancestors drank the demon's blood. Did it damn us?", next = "heritage_orc", when = { race = "Orc" } },
      },
    },
    heritage_orc = {
      lines = { { id = "ho_default", text = "It nearly did, and it took Grom Hellscream's death to break the curse that came with it. The blood is gone from the Horde, but the memory of it isn't, and an orc at this trade carries that memory into every grimoire opened." } },
      choices = { { text = "Then I'll carry it well.", next = "BACK", reply = "Carry it like a scar, not a banner. Something else?" } },
    },
  },
  topics = {
    kelthuzad = {
      { id = "w_kelthuzad", text = "Kel'Thuzad reached for power over death and found a master waiting for him on the other side. Bind what you summon, never let it bind you, and you'll never end up like him." },
    },
    scourge = {
      { id = "w_scourge", text = "The Scourge are what happens when someone else holds the leash. Learn from that, and keep a firm grip on your own." },
    },
    second_war = {
      { id = "w_secondwar_h", when = { faction = "Horde" }, text = "Gul'dan's warlocks led the old Horde to ruin in that war, and no orc has forgotten it. We teach the craft differently now, and we watch our students very closely." },
      { id = "w_secondwar_a", when = { faction = "Alliance" }, text = "In the Second War the Horde's warlocks raised death knights from the bodies of our own dead knights. It's the reason Stormwind still hangs warlocks it can catch, and I can't say I entirely blame it." },
    },
    burning_legion = {
      { id = "w_legion", text = "The Burning Legion is where every demon you'll ever bind comes from, and it is still out there in the Nether, waiting. We study them so we'll know their voices when they come calling again, and they will come." },
      { id = "w_legion_h", when = { faction = "Horde" }, text = "The Legion made the Horde its weapon once, and it was the Shadow Council that handed us over. Every orc warlock knows the name Gul'dan, and the good ones say it like a curse." },
    },
    burning_blade = {
      { id = "w_blade", text = "The Burning Blade are warlocks who forgot who they were serving. They're fewer than they'd like you to think, and more than I'd like." },
      { id = "w_blade_h", when = { faction = "Horde" }, text = "The Burning Blade hide in Ragefire Chasm and whisper in the Cleft of Shadow, and they'd hand Orgrimmar to the Legion tomorrow if they could. If you hear one of my students using their phrases, you tell me." },
    },
    knows = {
      { id = "t_kn1", text = "I make it my business to know what others would rather keep hidden. Some of it I can share, so choose carefully." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "You'll get what I care to give, which is very little, and these are all of it." },
    },
    _none = { { id = "t_none", text = "I don't share what I don't know, and I share very little of what I do." } },
    background = {
      { id = "t_bg", text = "I found the wrong book in the right library and read it twice before anyone noticed. By then I knew too much to stop." },
      { id = "t_bg_h", when = { faction = "Horde" }, text = "I learned from an old warlock who'd served the Shadow Council and spent the rest of his life trying to undo it. He taught me everything Gul'dan knew, and then everything Gul'dan forgot to fear." },
    },
    advice = { { id = "t_ad", text = "Never make a bargain you haven't read to the bottom. Demons write the important part small." } },
  },
}

P:Pool {
  -- Faction-neutral: hunters of every people, including Forever's human hunters.
  id = "trainer_hunter", role = "trainer", subtitle = "hunter trainer", tier = "service",
  greetings = {
    { id = "g_track", text = "Wind's from the west, a good day for it. What do you need?" },
    { id = "g_pet", when = { class = "HUNTER", pet = { type = "Beast" } }, text = "You and {pet} again. One of you is improving, and I won't say which." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and you smell of the wild. Good; that means you've been working." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've come on a long way since I last taught you. Your aim's steadier, and you move quieter, too." },
  },
  notice = {
    { id = "n_human", cat = "class", when = { race = "Human", class = "HUNTER" },
      text = "A human with a bow and a beast at heel. Not many of you take to it, but the ones who do take to it hard." },
    { id = "n_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 12, pet = false },
      text = "Where's your companion? A hunter alone is just someone with a bow." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has good eyes, better than yours, so listen to {pet} more." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A dwarf with a rifle, and you'll want to blast everything from a mile off. Learn to be close and quiet too, because the beast won't wait for you to reload." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "HUNTER" },
      text = "You move like the woods taught you, which I suppose they did. Let the beast do some of the deciding; your people are good at that already." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "HUNTER" },
      text = "Darkspear hunters throw like they were born to it, and maybe they were. Show me what the islands taught you, and I'll teach you what they didn't." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "HUNTER" },
      text = "The plains hunters thank every animal they kill, and I've never once thought it a waste of breath. Keep doing it." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "HUNTER" },
      text = "A Skyborne hunter! I'd heard your people kept rangers of their own, and I'd like to know what you hunted up there, where the ground isn't always under you." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "HUNTER" },
      text = "Animals don't care for the dead, and yet one follows you. Whatever you did to win it over, keep doing it." },
  },
  react = {
    { id = "r_pet", on = "pet", when = { pet = { type = "Beast" } }, text = "There, now you look like a hunter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Patience first, aim second, and the rest is weather and luck." },
        { id = "l_young", when = { class = "HUNTER", maxLevel = 20 }, text = "Your shots go wide when you're worried, and you're worried most of the time. Breathe out before you loose, and stop watching the arrow." },
        { id = "l_veteran", when = { class = "HUNTER", minLevel = 45 }, text = "You and your beast move like one animal now. There's not much left I can teach you, except to remember how you got there." },
        { id = "l_other", when = { ["not"] = { class = "HUNTER" } }, text = "You're not a hunter, but you've eyes, so use them. Most of my craft is noticing what the rest of the world walks past." },
      },
      again = {
        { id = "a_again", text = "What else? The wind won't change for a while yet." },
        { id = "a_again2", text = "Ask, then. The beasts can wait." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What should I be practising?", next = "practise", when = { class = "HUNTER" } },
        { text = "I'd guess you hunt for sport as much as need.", next = "sport", when = { class = "HUNTER", minLevel = 10 } },
        { text = "You must have lost a companion or two.", next = "lose" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Distance, more than aim. Keep the beast between you and the fight, and learn the exact step back that keeps you out of reach." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Feed your companion before you feed yourself, and talk to it even when you feel a fool. It's listening more than you think." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Traps, laid before the fight instead of during it. The best hunt is the one where everything goes exactly where you meant it to." },
      },
      choices = {
        { text = "How do I choose a companion?", next = "practise_beast" },
        { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    practise_beast = {
      lines = {
        { id = "pb_default", text = "Choose the one that looks back at you. Teeth and claws you can train, but the nerve has to be there from the start." },
        { id = "pb_pet", when = { pet = { type = "Beast" } }, text = "Choose the one that looks back at you, because teeth you can train but nerve has to be there from the start. {pet} chose you as much as you chose {pet}, so look after that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sport = {
      big = true,
      lines = { { id = "s_default", text = "For need, mostly, and I'll admit the 'mostly' is doing some work. There's a pleasure in the chase that has nothing to do with supper, and the day you stop feeling it you should hang up the bow, but the day it's all you feel, hang it up sooner." } },
      choices = {
        { text = "I take only what I need from the wild.", next = "BACK", reply = "Then the wild will treat you kindly, and you'll still be hunting long after the ones who chase for sport have gone soft or gone under.", fx = { align = { order = 1, honor = 1 }, trait = { kind = 1 } } },
        { text = "The chase is the point. The kill just proves it.", next = "BACK", reply = "I know the feeling, and I won't pretend I don't, but mind it doesn't grow until you're hunting things you'll never eat for the sake of a trophy.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    lose = {
      lines = { { id = "lo_default", text = "Twice, and both times I sat by the stables for a week like a fool. You'll tame another, and you'll love it, and you'll never quite stop looking for the first one in it." } },
      choices = {
        { text = "I'd look too.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = {
      { id = "w_centaur", text = "Centaur are the best hunters on the plains, after us, and they know it. Learn to read their tracks and you'll never be caught out on open ground." },
    },
    quilboar = {
      { id = "w_quilboar", text = "The quilboar keep boars as war beasts, and the beasts are better trained than the riders. Watch how they handle them, and you'll learn something, much as it pains me to say so." },
    },
    green_dragons = {
      { id = "w_greendragons", text = "I've tracked a lot of beasts in my time, but I've never followed a green dragon, and I never will. They sleep in strange groves, and whatever they're dreaming, it's not something you want to wake." },
    },
    knows = {
      { id = "t_kn1", text = "Tracks tell you where something's been, and travellers tell you the rest. Here's what I've picked up on the trail." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've a good eye and a patient hand, so I'll share what I'd tell my own students by the fire." },
    },
    _none = { { id = "t_none", text = "If it doesn't leave tracks, I don't follow it." } },
    background = { { id = "t_bg", text = "I followed a wolf into the woods when I was small, and it let me. I've been following things into the woods ever since." } },
    advice = { { id = "t_ad", text = "Carry more arrows than you think you'll need, and more food for the beast than for yourself." } },
  },
}

P:Pool {
  -- Faction-neutral: orc, troll, tauren and Skyborne shamans for the Horde, and Forever's
  -- dwarf shamans for the Alliance.
  id = "trainer_shaman", role = "trainer", subtitle = "shaman trainer", tier = "service",
  greetings = {
    { id = "g_elements", text = "The elements are restless today; come in." },
    { id = "g_wolf", when = { form = "ghostwolf" }, text = "Come in out of the wolf, and sit." },
    { id = "g_away", when = { away = 7 }, text = "The spirits said you would return, and after {away}, here you are. Sit, and tell me what the elements showed you." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You have come a long way since I last taught you. The elements answer you more readily now, and I can hear it." },
  },
  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "Stone has always listened to your people. I only wondered when you'd start talking back." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "SHAMAN" },
      text = "Your Windshapers came to the Horde through the Earthen Ring, I'm told. Then you know already that the elements listen. Let's see if they answer." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "The spirits turned from your people once, when the warlocks led them to the demons. That they answer you now is a gift, so never take it as something you're owed." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "SHAMAN" },
      text = "The Darkspear knew the spirits long before the orcs found their way back to them. Teach me a little of the island ways while I teach you the totems." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "SHAMAN" },
      text = "The Earth Mother's children make patient shamans. The elements are slow to trust, and you're slower still, which suits them." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" }, place = "replace",
      text = "Let the wolf go and sit with me. The spirits lend you that shape; they don't give it." },
  },
  react = {
    { id = "r_wolf", on = "form", when = { form = "ghostwolf" }, text = "The wolf runs well in you. Don't run so far you forget the way back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "You don't command the elements; you ask, and you listen when they answer. Most forget the second part." },
        { id = "l_young", when = { class = "SHAMAN", maxLevel = 20 }, text = "The earth answered you first, didn't it? It answers everyone first, being the most patient. Fire will make you wait, and then it'll make you sorry." },
        { id = "l_veteran", when = { class = "SHAMAN", minLevel = 45 }, text = "The elements know your voice now, and they come quicker for you than they do for me. Be humble about it, because they can still decide to stop." },
        { id = "l_other", when = { ["not"] = { class = "SHAMAN" } }, text = "You don't walk with the spirits, but they see you all the same. Be kind to the land where you tread, and they'll remember it." },
      },
      again = {
        { id = "a_again", text = "The spirits are patient, and so am I. Ask what else you came to ask." },
        { id = "a_again2", text = "The fire's still burning; speak while it listens." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "What should I be practising?", next = "practise", when = { class = "SHAMAN" } },
        { text = "Should a shaman ask the elements, or command them?", next = "command", when = { class = "SHAMAN", minLevel = 10 } },
        { text = "Do you ever hear the elements angry?", next = "angry" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Your totems: where you plant them, and when. Drop them just anywhere, and the elements will ignore you about as fast as the enemy does." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Listen to the earth before you strike with lightning. The quiet spells keep you alive long enough to use the loud ones." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to call a fallen friend back from the edge with the spirits' help. It costs them something to give, so never ask it lightly." },
      },
      choices = {
        { text = "Which element is strongest?", next = "practise_elem" },
        { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    practise_elem = {
      lines = { { id = "pe_default", text = "None of them, and all of them, depending on the hour and the place. In the desert you ask the water for nothing, and in a storm you ask the air for nothing more than it's already doing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    command = {
      big = true,
      lines = { { id = "c_default", text = "Ask. The orcs learned what commanding brings when their warlocks turned from the spirits to the demons, and their old world withered for it. A shaman who commands is only a warlock who hasn't met the right demon yet." } },
      choices = {
        { text = "I ask. The elements are partners, not servants.", next = "BACK", reply = "Then the elements will hear you, and they'll come when it matters most, because they remember who treated them as friends.", fx = { align = { honor = 1, order = -1 }, trait = { patient = 1 } } },
        { text = "Sometimes the world needs a firm hand, even the elements.", next = "BACK", reply = "That's how it starts, and I've seen where it ends, so if the earth ever stops answering you, don't say you weren't warned.", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
        { text = "What happened to the orcs' old world?", next = "command_draenor" },
      },
    },
    command_draenor = {
      lines = { { id = "cd_default", text = "Their warlocks drank from the demons and bled the land to feed the spells, and the spirits fled them in grief. Thrall brought the spirits back to the orcs here, but the old world is red dust now, and it won't grow again." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    angry = {
      lines = { { id = "an_default", text = "Often. The earth grumbles where miners have dug too greedily, and fire is never calm, which is its nature. Anger isn't the danger, though; silence is, because an element that won't answer has stopped listening." } },
      choices = {
        { text = "I'll listen for the silence, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    the_elements = {
      { id = "w_elements", text = "Earth, fire, water and air are spirits, not tools, and they help us because we ask with respect. The warlocks forgot that, and the Horde paid for it in blood." },
    },
    earth_mother = {
      { id = "w_earthmother", text = "The tauren call the land the Earth Mother, and the elements are her children. Thrall learned that from them, and we're all wiser for it." },
    },
    thrall = {
      { id = "w_thrall", text = "The Warchief is the greatest shaman of our age, and he brought the old ways back to the orcs. Speak to the spirits as he does, with respect, and they'll listen." },
    },
    knows = {
      { id = "t_kn1", text = "The spirits speak, and so do the people who come to hear them. These are things I can tell you of." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "The elements sit calm around you today, so I think you can be trusted with more." },
    },
    _none = { { id = "t_none", text = "The spirits have said nothing to me of that." } },
    background = { { id = "t_bg", text = "The spirits woke me one morning by shaking the tent down around my ears. I took the hint." } },
    advice = { { id = "t_ad", text = "Thank the water when you drink it. It sounds foolish until the day there isn't any." } },
  },
}

P:Pool {
  -- Faction-neutral: night elf druids for the Alliance, tauren for the Horde, Skyborne on
  -- both sides.
  id = "trainer_druid", role = "trainer", subtitle = "druid trainer", tier = "service",
  greetings = {
    { id = "g_grove", text = "Walk softly. Now, what will you learn?" },
    { id = "g_vet", when = { class = "DRUID", minLevel = 40 }, text = "Back in your own shape, I see. Sit, and tell me what the wild has been saying." },
    { id = "g_away", when = { away = 7 }, text = "You have been away {away}, and the wild has marked you. Sit, and let me see how." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You have grown much since our last lesson, as a sapling grows between seasons. Let us see what more you can learn." },
  },
  notice = {
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "DRUID" },
      text = "Your people's druids are few, I hear, and look to the elements before the moon. Tell me of that sometime, and I'll teach you this in trade." },
    { id = "n_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "A good cat: low, quiet, patient. Change back, though; we talk better with mouths that make words." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "Mind the lanterns. Every new bear knocks over a lantern." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "DRUID" },
      text = "Your people's druids slept in the Dream for centuries while the Sentinels kept the world. Now you're awake, and the world is far harder to balance than the stories promised." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "Hamuul brought the night elves' teaching to your people, and you're the proof that it took. The Earth Mother and the Circle aren't so far apart as some would like." },
    { id = "n_travel", cat = "form", when = { form = "travel" }, place = "replace",
      text = "Off the four legs, please, before you trample my seedlings. You can be a bear again once you're past the gate." },
    { id = "n_moonkin", cat = "form", when = { form = "moonkin" }, place = "replace",
      text = "A moonkin, in my grove! Sit, if you can work out how, and please don't hoot during the lesson." },
  },
  react = {
    { id = "r_shift", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "There it is. Feel how the shape fits, and then feel how much you want to stay in it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Balance isn't standing still. It's leaning one way and then the other and never quite falling." },
        { id = "l_young", when = { class = "DRUID", maxLevel = 20 }, text = "You still think of the bear as a costume. It isn't; it's a conversation, and the bear has opinions." },
        { id = "l_veteran", when = { class = "DRUID", minLevel = 45 }, text = "You've walked in more shapes than most of the Circle have. Remember which one you were born in." },
        { id = "l_other", when = { ["not"] = { class = "DRUID" } }, text = "You're not of the Circle, but you walk in the wild like the rest of us. Leave it as you found it, and we'll get along." },
      },
      again = {
        { id = "a_again", text = "What else stirs in you?" },
        { id = "a_again2", text = "Go on; the grove has time." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What should I be practising?", next = "practise", when = { class = "DRUID" } },
        { text = "Should the wild be kept from people, or shared with them?", next = "wild", when = { class = "DRUID", minLevel = 10 } },
        { text = "Elune or the Earth Mother: whom do druids serve?", next = "elune", when = { class = "DRUID" } },
        { text = "Do you ever want to stay in a shape?", next = "stay" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Shifting, until you can do it without thinking, and then until you can do it while thinking. I had one student turn bear in the middle of a lecture, and the bench still hasn't recovered." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Heal yourself between fights, not in the middle of them. A young druid trying to be everything at once ends up being nothing for long enough to fall over." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to be the one the others forget is there: a heal here, roots there, a bear when the line breaks. The best druids are only noticed once they're gone." },
      },
      choices = {
        { text = "Which shape should I favour?", next = "practise_shape" },
        { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    practise_shape = {
      lines = { { id = "ps_default", text = "The one the moment needs, which is never the one you like best. A druid with a favourite shape is halfway to being a beast with a memory of something else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wild = {
      big = true,
      lines = { { id = "w_default", text = "The Circle argues it every year in Moonglade. Some say the wild must be walled off from axes and plows, and others that people are part of it and must be taught to take gently; I've lived long enough to think both are right, which pleases nobody." } },
      choices = {
        { text = "The wild must be protected, even from us.", next = "BACK", reply = "The Circle has plenty who'd agree, and I'll not say they're wrong, but walls have a way of keeping out the very people who need to learn.", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "People belong in the balance. Teach them; don't wall them out.", next = "BACK", reply = "You'd have friends in Moonglade, then, though not all of them, and I suspect you'll spend your life teaching people who'd rather not listen.", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Those arguments sound as though they never end.", next = "wild_who" },
      },
    },
    wild_who = {
      lines = { { id = "ww_default", text = "Nobody wins, which is how the Circle likes it. Remulos listens and says very little, and the argument carries on the following year." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    elune = {
      lines = {
        { id = "e_default", text = "The night elves pray to Elune and the tauren to the Earth Mother, and both bring their druids to Moonglade. Malfurion taught the first druids, and he never asked whom they prayed to, only whether they listened." },
        { id = "e_skyborne", when = { race = "Skyborne" }, text = "Your own people favour the elements over the moon, I hear. The Circle will take you anyway; it has never asked a druid whom they pray to, only whether they listen." },
      },
      choices = {
        { text = "I listen to all of them.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Every winter I want to be the bear and sleep, and every spring I'm glad I wasn't. Some who stayed too long in a shape forgot how to come back, and the Circle doesn't speak of them." } },
      choices = {
        { text = "I'll keep the way back in mind.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    emerald_dream = {
      { id = "w_dream", text = "The Emerald Dream is the world as it was meant to be, and our Archdruid walks there in his sleep. Something troubles the Dream now, and the Circle is worried." },
    },
    nordrassil = {
      { id = "w_nordrassil", text = "The World Tree on Hyjal gave the night elves their immortality, and they gave it up to defeat the Legion. A druid ought to visit it once in their life, if only to understand what was lost." },
    },
    green_dragons = {
      { id = "w_greendragons", text = "Ysera's flight guards the Dream, and they're appearing in strange places now, sleeping by the old portals. The Circle watches them very closely and says very little." },
    },
    elune = {
      { id = "w_elune", text = "Elune is the moon's light, and Cenarius was her son, so we honour her in every grove. A druid serves the wild, but the wild was always hers as well." },
    },
    knows = {
      { id = "t_kn1", text = "The wild carries word on the wind, and the Circle carries the rest. Ask of these, and I'll tell you what I've learned." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The wild is patient with you, and I'm trying to be. Ask one of these, and listen to the answer." },
    },
    _none = { { id = "t_none", text = "The wild has not shown me that. Perhaps it will show you." } },
    background = { { id = "t_bg", text = "A stag let me touch its antlers when I was a child, and the druid who saw it took me in that same night." } },
    advice = { { id = "t_ad", text = "Rest in the wild now and then, not just near it. A bed of moss teaches more than a bed of straw." } },
  },
}

P:Pool {
  -- Faction-neutral: rogues of every people, Skyborne included.
  id = "trainer_rogue", role = "trainer", subtitle = "rogue trainer", tier = "service",
  greetings = {
    { id = "g_whisper", text = "Keep your voice down. What do you want to learn?" },
    { id = "g_vet", when = { class = "ROGUE", minLevel = 40 }, text = "You came in by the door this time. Getting sentimental?" },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and nobody's come asking after you, which is either good work or good luck." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've come a long way since I last taught you, and you walked in quieter than you used to. Good." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear you sold someone in town a story and they bought it whole. Nicely done, but don't try it on me." },
  },
  notice = {
    { id = "n_stealth", cat = "class", when = { stealthed = true }, place = "replace",
      text = "I saw you come in, and if I can see you, so can everyone else. Again." },
    { id = "n_plate", cat = "gear", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank, and I don't train people who clank." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "ROGUE" },
      text = "A gnome who picks locks instead of building them. Your people would be appalled, and I'm delighted." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "ROGUE" },
      text = "A dwarf who wants to be quiet. Take your boots off first, and then we'll talk about the rest of you." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "ROGUE" },
      text = "You're taller than anyone in the room, and somehow I still lose sight of you. Teach me that one sometime." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "ROGUE" },
      text = "You don't breathe, which is half the craft done already. The other half is learning not to rattle." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "ROGUE" },
      text = "The hidden people, your lot call yourselves, or so I'm told. Let's find out whether the name was earned." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "ROGUE" },
      text = "Your people can melt into a shadow just by standing still. Most of my students would sell their own mothers for that." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Better. Now I can only hear you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Nobody remembers a quiet blade. That's the point of it." },
        { id = "l_young", when = { class = "ROGUE", maxLevel = 20 }, text = "You still look over your shoulder before you do anything shady. Stop it; nobody suspects the one who looks bored." },
        { id = "l_veteran", when = { class = "ROGUE", minLevel = 45 }, text = "I've heard your name from people who shouldn't know it. That's either very good work or very bad, and you'll have to tell me which." },
        { id = "l_other", when = { ["not"] = { class = "ROGUE" } }, text = "You're not one of mine, so I'll assume you're lost. The door's behind you, and I'd count your coins on the way out." },
      },
      again = {
        { id = "a_again", text = "What else? Quickly." },
        { id = "a_again2", text = "Go on, then. I swept the corners for ears before you came in." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "A rogue works for whoever pays, I've heard.", next = "loyalty", when = { class = "ROGUE", minLevel = 10 } },
        { text = "You don't seem the trusting sort.", next = "trust" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Waiting. You'll spend more time standing still in the dark than doing anything clever, and the ones who can't wait are the ones who get caught." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Picking locks now, and poisons once you're trusted with them. Open the right box in the right house, and you'll never go hungry again." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to leave without a fight. Vanishing is the most expensive trick I teach, and the only one I'd keep if I had to choose." },
      },
      choices = {
        { text = "And if I'm caught?", next = "practise_caught" },
        { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    practise_caught = {
      lines = { { id = "pc_default", text = "Then you're caught, so stop being clever and start being fast. Blind the one who saw you and run, because pride heals quicker than a knife wound." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    loyalty = {
      big = true,
      lines = { { id = "lo_default", text = "Whoever's paying, some say, and they don't live long. The rest of us pick someone to be loyal to, a guild or a crown or a friend, and let coin fill in the gaps, because a blade for hire gets hired against you sooner or later." } },
      choices = {
        { text = "I keep faith with my own. Coin comes second.", next = "BACK", reply = "Then you'll have someone at your back when it counts, which is more than most blades for hire can say when the job goes sour.", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Coin never lies to me. People do it all the time.", next = "BACK", reply = "No, it doesn't lie, but it doesn't guard your back either, and I've seen a full purse lying next to a lot of dead mercenaries.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "So who do you work for?", next = "loyalty_who" },
      },
    },
    loyalty_who = {
      lines = { { id = "lw_default", text = "You asked, and that's the first lesson: never ask that question twice in the same room. The second is that I'd never tell you, so you've learned two things for the price of none." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    trust = {
      lines = { { id = "tr_default", text = "Everyone a little, and nobody all the way. Trust is like a lock: it's only good until somebody patient comes along." } },
      choices = {
        { text = "That sounds lonely.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Sounds sensible.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },
  topics = {
    ravenholdt = {
      { id = "w_ravenholdt", text = "There's a manor in the Alterac hills where the best of our trade gather, and you'll not find it unless you're invited. Do good work and keep quiet about it, and one day the invitation might find you." },
    },
    prestor = {
      { id = "w_prestor_a", when = { faction = "Alliance" }, text = "Lady Prestor's the most watched woman in Stormwind, and nobody's ever caught her doing anything at all. That's either innocence or talent, and I'd dearly like to know which." },
    },
    booty_bay = {
      { id = "w_bootybay", text = "Booty Bay is the best place in the world for our sort, because nobody asks questions and everyone has something to hide. Mind the bruisers, though, because they don't ask questions either." },
    },
    knows = {
      { id = "t_kn1", text = "Information is the only coin that's worth more after you've spent it. Here's what I can afford to give away." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've kept your mouth shut when it counted, so I'll open mine a little." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Everything I know has a price, and you can't afford most of it, but these you can have." },
    },
    _none = { { id = "t_none", text = "If I knew, it'd cost you. I don't, so it won't." } },
    background = { { id = "t_bg", text = "I'll tell you where I came from when you tell me where you hid the last thing you stole." } },
    advice = { { id = "t_ad", text = "Never be the most interesting person in the room. That's where the knives go." } },
  },
}

P:Pool {
  -- Faction-neutral: warriors of every people.
  id = "trainer_warrior", role = "trainer", subtitle = "warrior trainer", tier = "service",
  greetings = {
    { id = "g_stance", text = "Feet apart, shield up. Now, what do you want?" },
    { id = "g_vet", when = { class = "WARRIOR", minLevel = 40 }, text = "Still standing, I see. Good; standing's most of the job." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and you've the bruises to show for it. Good; bruises are how you learn." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've come a long way since I last taught you; I can see it in your feet. Shield up, and let's go on." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you leaned on someone hard in town. Fear's a weapon, but use it on the enemy and not on the baker." },
  },
  notice = {
    { id = "n_dented", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Good, you've been hit. Now tell me why you got hit." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "WARRIOR" },
      text = "Short reach, quick feet. Everyone underestimates a small warrior, once." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "WARRIOR" },
      text = "A Skyborne with a blade. I hear your people kept a guard of their own up there in the wind, so show me what they taught you, and I'll show you what they didn't." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "WARRIOR" },
      text = "You're the biggest student I've had this season, and the biggest ones always think they can skip the footwork. You can't." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "You don't feel the bruises any more, do you? That makes you brave and it makes you careless, so I'll be the one who remembers pain for you." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "WARRIOR" },
      text = "Most of your people leave the blade to the Sentinels, and yet here you are. Good; patience is half of this, and you've centuries of it." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "WARRIOR" },
      text = "Long arms and a temper; that's a fine start. Now learn to keep the temper for when it's useful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Anyone can swing a sword. A warrior knows when not to." },
        { id = "l_young", when = { class = "WARRIOR", maxLevel = 20 }, text = "Your shield arm's dropping; I can see it from here. Keep it up, and one day it'll stop feeling heavy." },
        { id = "l_veteran", when = { class = "WARRIOR", minLevel = 45 }, text = "You've stood in front of things I've only heard about in the barracks. I can still teach you, but I'll be learning back." },
        { id = "l_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You're no warrior, but you'll get hit like one sooner or later. Keep your feet under you and your back to something solid." },
      },
      again = {
        { id = "a_again", text = "Something else, or back to the drills?" },
        { id = "a_again2", text = "Speak up; I've been shouted at by sergeants half my life." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "When should a warrior refuse a fight?", next = "refuse", when = { class = "WARRIOR", minLevel = 10 } },
        { text = "Do you ever miss the battlefield?", next = "miss" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Footwork, until you're sick of it. A warrior standing in the right place gets hit half as often and hits twice as hard." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn when your rage comes and when it goes. Young warriors spend it all in the first breath and then stand about wondering why the wolf's still alive." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to hold the beast's eyes on you while your friends do their work. Anyone can kill something; keeping something that big looking at you takes nerve." },
      },
      choices = {
        { text = "And when I'm outnumbered?", next = "practise_many" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_many = {
      lines = { { id = "pm_default", text = "Put your back to a wall and make them come one at a time. If there's no wall, find a doorway, and if there's no doorway, you made the mistake an hour ago." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    refuse = {
      big = true,
      lines = { { id = "r_default", text = "When the fight's only for your name. I've buried more glory-chasers than I can count, so fight for the ones behind you, and let the glory find you if it wants to." } },
      choices = {
        { text = "I fight for the ones behind me.", next = "BACK", reply = "Then you'll live long enough to have both, I'd wager, and the ones behind you will remember your name far better than any bard could.", fx = { align = { order = 1, honor = 1 }, trait = { stern = 1 } } },
        { text = "A warrior's name is worth fighting for.", next = "BACK", reply = "It is, and I won't tell you otherwise, but make sure you're alive to hear it said, because the dead don't get to enjoy their reputations.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Have you ever run from a fight?", next = "refuse_ran" },
      },
    },
    refuse_ran = {
      lines = { { id = "rr_default", text = "Once, from a fight I couldn't win, with two wounded recruits on my back. Somebody called me a coward for it, and the recruits called me nothing at all, because they lived to call me whatever they liked." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    miss = {
      lines = { { id = "mi_default", text = "Every time a student gets it right, and every time one gets it wrong. Teaching's the same fight, only slower, and I'm on both sides of it." } },
      choices = {
        { text = "That's a good way to see it.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gurubashi_arena = {
      { id = "w_arena", text = "The Gurubashi Arena is where warriors go to find out what they're really worth, and most of them find out it's less than they thought. Go, by all means, but come back and tell me what you learned." },
    },
    second_war = {
      { id = "w_secondwar_a", when = { faction = "Alliance" }, text = "The Second War taught us that a line that holds wins more battles than any hero. Learn to stand with others, and you'll outlive the ones who don't." },
      { id = "w_secondwar_h", when = { faction = "Horde" }, text = "The old Horde won every fight but the last one, because it never learned to stand still. Learn to hold, and then learn when to charge." },
    },
    internment = {
      { id = "w_intern_h", when = { faction = "Horde" }, text = "Some of the best warriors I know learned to fight in the human camps, for the guards' amusement. They fight for themselves now, and they fight better." },
    },
    knows = {
      { id = "t_kn1", text = "Soldiers talk in the training yard between bruises, and I listen. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Talk comes after you've learned to keep your guard up, so take one of these and get back to the drills." },
    },
    _none = { { id = "t_none", text = "Can I hit it? If not, then I don't know about it." } },
    background = { { id = "t_bg", text = "I held a line once that wasn't meant to hold. I've been teaching people how ever since, because I'm still not sure how I did it." } },
    advice = { { id = "t_ad", text = "Eat, sleep and mend your armour, in that order. Glory comes fourth, a long way behind." } },
  },
}

---------------------------------------------------------------------------
-- Horde flight masters: their own view of the sky.
---------------------------------------------------------------------------
P:Pool {
  id = "flightmaster_horde", role = "flightmaster", faction = "Horde",
  greetings = {
    { id = "g_where", text = "Where are you flying? Speak up, the wind riders are hungry." },
    { id = "g_again", when = { timesTalked = { min = 5 } }, text = "Back so soon? The riders know your smell by now." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and the wind riders have forgotten your smell. They'll learn it again soon enough." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "The riders say you threw your weight about in town. Don't try it with the wind riders, because they bite." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "They say your people glide. Gliding is falling with manners, and a wind rider climbs." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Your beast walks and mine fly, so climb down off that one and up onto one of mine." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren on a wind rider. The beasts grumble about it, but they've carried heavier, mostly." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Wind riders don't like the smell of the dead, so sit still and don't take it to heart." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear always want to fly low over the sea to look at it. The rider decides the height, not you." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks. Wind riders won't fly with fel stink in the saddle, so send it off." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Quick on the ground, druid, but nothing on four legs beats a wind rider over open country." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "Your ghost wolf can't fly, shaman, so let it go and climb on." },
  },
  lines = {
    { id = "l_default", text = "Hold the harness, not the rider's neck. It bites." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Wind riders won't share a saddle with your beast, so it stays below and finds you at the other end. They always do." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "You grip the harness like it's an axe haft. Loosen up, or the rider will shake you loose for the fun of it." },
  },
  choices = { { text = "Just the flight.", next = "BUSINESS" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every wind rider brings news back from the far roosts along with the dust. Here's what's come in on the wind." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've flown with me enough to hear what the riders say when they think no one's listening." },
    },
  },
}

---------------------------------------------------------------------------
-- Guards outside the capitals, by faction. Capital guards are below.
---------------------------------------------------------------------------
P:Pool {
  id = "guard_alliance", role = "guard", faction = "Alliance",
  greetings = {
    { id = "g_move", text = "Move along. If there's trouble, come and find me." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be wandering, friend. Keep to the road." },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}, are you? The watch hasn't changed, and neither has the road." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Word at the barracks is you leaned on someone in town. Keep it outside the walls, or the watch will have something to say." },
    { id = "g_word_help", when = { word = "helped" }, text = "I hear you did the town a good turn. The watch is grateful, though we'll not say so in front of the sergeant." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Bandits get your gear, or are you just brave about the weather?" },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "Sleep it off somewhere that isn't my road." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Easy, priest. Folk see that on the road at night and reach for a sword before they think to pray." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Keep that imp off the road where the farmers can see it. Last week a carter ran his horse into a ditch over one." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "That thing behind you has no face, and I'd thank you to keep it that way. Walk it on the far side of the road." },
    { id = "n_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Eyes front when one of those walks by, they told us at muster. I'll keep mine on you instead, if it's all the same." },
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Good-looking animal. Keep {pet} out of the sheep pens and we'll get on fine." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Walk on two legs past the farms, druid. The dogs here have never seen a bear stand still, and they won't start today." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You went past me like a cat with somewhere to be. Slow down at the bridges; the carts can't stop quick." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You'll be one of the elves out of the sky. The sergeant read us a notice about your people; it was short, and it said to be polite." },
    { id = "n_dwarf_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "Totems on a dwarf's belt. The captain says you're on our side, and the captain's never wrong, so on you go." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Show yourself!" },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Hold! Oh, it's a priest. You might warn a man first." },
  },
  lines = {
    { id = "l_default", text = "Report anything strange to the nearest officer. Strange gets worse if you wait." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "A fighter, good. If you're on this road anyway, keep an eye out for bandits; there are never enough of us to be everywhere at once." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "I'll not ask what your trade is. I'll just remember your face, and you'll remember that I did." },
    { id = "l_paladin", when = { class = "PALADIN" }, text = "Light be with you, paladin. Folk out here sleep easier knowing the Silver Hand still walks the roads." },
    { id = "l_mage", when = { class = "MAGE" }, text = "If you're going to throw fire about, throw it away from the crops. The last mage through here cost a farmer his barley." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "The wolves have been bad along this road all season. If you're hunting anyway, take a few for us." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "I know what you are, and so long as you keep it leashed, I don't have to do anything about it." },
  },
  -- 0.71.0: a conversation tree shared by every Alliance guard, in towns and capitals alike
  -- (capital pools have no tree of their own, so their lines compete in this hub).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Keep your weapon sheathed and your business honest, and we'll get on fine. What can the watch do for you?" },
        { id = "h_capital", when = { capital = true }, text = "The city's big enough to lose a whole regiment in, so ask if you're turned around. That's half of what we're here for." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Quiet night so far, and I'd like it to stay that way. What do you need, friend?" },
        { id = "h_young", when = { maxLevel = 12 }, text = "You've the look of someone fresh to the road, so stay where the patrols can hear you shout. What can I do for you?" },
        { id = "h_vet", when = { minLevel = 50 }, text = "I know a veteran when one walks up, and I'd sooner have you on my side of the wall than the other. What's on your mind?" },
        -- Opinion pass: word of what the player said to someone else in this town.
        { id = "h_o_peace_for", once = true, when = { gossip = { topic = "peace", stance = { "for", "mixed" } } },
          text = "Word at the barracks is you're all for Lady Jaina's peace with the orcs. Some of the lads call that soft, but I've buried enough friends to hope you're right." },
        { id = "h_o_peace_against", once = true, when = { gossip = { topic = "peace", stance = { "against", "war" } } },
          text = "The lads tell me you'd march on Orgrimmar tomorrow if the regent gave the word. The young ones would stand you a drink for it, and the old sergeants think you're mad." },
        { id = "h_o_prestor", once = true, when = { gossip = { topic = "prestor", stance = "distrust" } },
          text = "Somebody heard you speak against Lady Prestor, and now the whole watch has heard it too. I'd keep that sort of talk outside the city walls, friend, for your own sake." },
        { id = "h_o_defias_soft", once = true, when = { gossip = { topic = "defias", stance = { "masons_wronged", "sympathetic", "mercy" } } },
          text = "I hear you've a kind word for the Defias and their masons. Be careful with it, because the watch has pulled too many farmers out of ditches to feel the same." },
        { id = "h_o_defias_hard", once = true, when = { gossip = { topic = "defias", stance = "hardline" } },
          text = "Folk say you'd see every Defias hanged on the Westfall road. The watch would settle for seeing them in the Stockade, but I take your meaning." },
        { id = "h_o_bolvar", once = true, when = { gossip = { topic = "bolvar", stance = { "trust", "respect" } } },
          text = "Someone told me you spoke up for Lord Bolvar. Good; he's earned it, and it's nice to hear a stranger say so for once." },
      },
        -- Deeds pass: what the watch has heard about your deaths, your standing and the front.
        { id = "h_dd_deaths", when = { deaths = { min = 15 } },
          text = "The graveyard keeper says you're on first-name terms with the spirit healer by now. I'd not make a habit of it, friend, because one day the road back won't be there." },
        { id = "h_dd_drowned", when = { deathCause = "drowning" },
          text = "You drowned out there, didn't you? You've the look of someone who still reaches for the surface. My brother went into the lake and never came up, so forgive me for staring." },
        { id = "h_dd_rep", tags = { "news" }, when = { any = { { reputation = { faction = "Stormwind", min = "honored" } }, { reputation = { faction = "Ironforge", min = "honored" } }, { reputation = { faction = "Darnassus", min = "honored" } }, { reputation = { faction = "Gnomeregan", min = "honored" } } } },
          text = "Your name came down from the barracks with this week's orders, {g:sir|ma'am}, with a note to treat you well. I don't get many notes like that, so I read it twice." },
        { id = "h_dd_hk", when = { honorKills = { min = 100 } },
          text = "The talk at muster is that you've put a good many of the Horde in the ground out on the front. You carry it well, though I can see you carry it." },
      again = {
        { id = "a_road", text = "Anything else, or can I get back to watching the road?" },
        { id = "a_go", text = "Go on, then; I'm not going anywhere until the bell." },
        { id = "a_city", when = { capital = true }, text = "Something else? The crowds can manage without me for a moment." },
      },
      choices = {
        { text = "What's around here worth knowing?", next = "around" },
        { text = "Life in the watch looks hard.", next = "watch" },
        { text = "Seen anything on the roads lately?", next = "roads" },
        { text = "I've some trouble to report.", next = "report" },
        { text = "Do you ever have to bend the law?", next = "law" },
        { text = "What do the soldiers say about the court these days?", next = "pol" },
        { text = "Could the watch use another sword?", next = "recruit", when = { class = "WARRIOR" } },
        { text = "I wore the Stormwind City Guard's tabard myself, once.", next = "oldguard", when = { origin = "human_city_guard" } },
        { text = "I held the rearguard at Gnomeregan, so I know a little about watches.", next = "rearguard", when = { origin = "gnome_rearguard" } },
        { text = "You might want to tie that purse a little tighter.", next = "purse", when = { class = "ROGUE" } },
        { text = "I've died more often than I'd like to admit.", next = "dd_deaths", when = { deaths = { min = 15 } } },
        { text = "I've been fighting the Horde on the front.", next = "dd_front", when = { honorKills = { min = 100 } } },
        { text = "Carry on, guard.", next = "END" },
      },
    },
    -- Deeds pass: deaths and the front.
    dd_deaths = {
      lines = {
        { id = "dd_de_default", text = "Then you're either very brave or very careless, and from my post the two look much the same. Every time they carry you to the graveyard, somebody on the watch writes it in the book, and I've seen your name there more than once." },
        { id = "dd_de_many", when = { deaths = { min = 50 } }, text = "More than you'd like? The book has a page of its own for you now, friend, and the clerk complains about it. I don't know how you keep coming back, and I'm not sure I want to." },
      },
      choices = {
        { text = "Does it unsettle the watch, folk coming back like that?", next = "dd_deaths2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_deaths2 = {
      lines = {
        { id = "dd_d2_default", text = "A little, if I'm honest. The spirit healers send you back and I'm glad of it, but the lads I lost to the Scourge up north never got sent back, and some nights that sits wrong with me." },
      },
      choices = {
        { text = "Then I'll spend every second chance well.", next = "BACK", reply = "See that you do. That's all any of us could ask, and it's more than most manage.", fx = { align = { light = 1 } } },
        { text = "Dying's a toll on the road. I'll keep paying it.", next = "BACK", reply = "Spoken like a sellsword. I hope the road never sends you a bill you can't pay, friend.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_front = {
      lines = {
        { id = "dd_fr_default", text = "I can see it on you; folk who've been at Warsong Gulch or up the Alterac pass come back standing differently. The wounded we get through here say it's no war like the old ones. How do you fight it?" },
      },
      choices = {
        { text = "Fairly. I'd have them do the same to us.", next = "BACK", reply = "Then you're a better soldier than some I've served with, and the Horde will know it, in time.", fx = { align = { honor = 1 } } },
        { text = "To win. However it has to be done.", next = "BACK", reply = "Hard words, but I've heard them from sergeants who came home when better men didn't. Just mind they don't follow you inside the walls.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    around = {
      lines = {
        { id = "ar_default", text = "The inn's the place for a bed and the latest gossip, and the smith will mend what the road breaks. If you're after work, look for the folk with worry on their faces; out here there's always somebody who needs a hand." },
        { id = "ar_capital", when = { capital = true }, text = "Ask any of us for directions and we'll point you right, since that's most of the job inside the walls. Mind your purse in the crowds, though, because the cutpurses love a busy street." },
      },
      choices = {
        { text = "And where's the danger hereabouts?", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "dg_default", text = "Anywhere the patrols stop going, which is closer to town than any of us likes to admit. Off the road, past the last fence and after dark is where folk go missing." },
        { id = "dg_capital", when = { capital = true }, text = "Inside the walls it's pickpockets, drunks and the odd brawl, and outside them it's everything else. Don't go wandering off the roads beyond the gates without a blade you know how to use." },
      },
      choices = {
        { text = "Then that's where I'm going.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Then I'll keep to the road.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "w_default", text = "Long hours, cold suppers and boots that never quite dry, and the pay comes late more often than not. Still, somebody has to stand here, and it may as well be someone who cares." },
      },
      choices = {
        { text = "Some nights must be worse than others.", next = "watch_hard" },
        { text = "It seems a thankless job.", next = "watch_why" },
        { text = "What do the men on watch say about the king?", next = "w_king" },
        { text = "Does the barracks expect war with the Horde?", next = "w_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_hard = {
      lines = {
        { id = "wh_default", text = "The nights you hear something out past the lanterns and you can't leave your post to go and look. Come morning there's a cart overturned or a farmhand who never came home, and you wonder if you could have done something." },
      },
      choices = {
        { text = "You did your duty. That's all anyone can ask.", next = "BACK", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Then next time, go and look.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    watch_why = {
      lines = {
        { id = "wy_default", text = "My family lives a short walk from here, and I'd rather it was me standing between them and the dark than somebody who doesn't know their names. That's the whole reason, though the captain likes to think it's his speeches." },
        { id = "wy_paladin", when = { class = "PALADIN" }, text = "Same reason you took up the Light, I'd guess, only with a cheaper sword. Somebody has to stand between ordinary folk and the dark, and the Silver Hand can't be on every road at once." },
      },
      choices = {
        { text = "That's as good a reason as any.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = {
        { id = "rd_default", text = "Bandits on the long empty stretches, wolves where the woods come close, and lately things after dark the farmers won't put a name to. You've the look of someone who's walked a fair way, though, so what brings you out here?" },
        { id = "rd_capital", when = { capital = true }, text = "Travellers come through the gates with a new tale every day, and half of them are about bandits on the roads. You've the look of someone who's walked a fair way yourself, so what brings you here?" },
      },
      choices = {
        { text = "Coin, mostly. Somebody always needs something killed.", next = "roads_you", fx = { trait = { greedy = 1 } } },
        { text = "These people need help, and I can give it.", next = "roads_you", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "I want to see what lies past the next hill.", next = "roads_you", fx = { trait = { curious = 1 } } },
        { text = "That's my own business, guard.", next = "roads_you", fx = { affinity = -1 } },
      },
    },
    roads_you = {
      lines = {
        { id = "ry_default", text = "Your reasons are your own, so long as you leave the road a little safer than you found it. If you see smoke where there oughtn't to be any, though, come and tell us before you go running at it." },
      },
      choices = {
        { text = "What sort of smoke?", next = "smoke" },
        { text = "I'll keep my eyes open.", next = "BACK" },
      },
    },
    smoke = {
      lines = {
        { id = "sm_default", text = "A burning farmstead, or a campfire where no honest traveller would camp, kept low and back in the trees. Bandits get careless when they've been lucky for a while, and that's when we catch them." },
      },
      choices = {
        { text = "I'll keep an eye out for you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Farewell, guard.", next = "END" },
      },
    },
    report = {
      lines = {
        { id = "rp_default", text = "Go on, then: what did you see, and where? Take your time, because a muddled report sends us running the wrong way." },
      },
      choices = {
        { text = "Bandits, watching the road out of town.", next = "report_done" },
        { text = "Something unnatural, moving about after dark.", next = "report_done" },
        { text = "Never mind, it can wait.", next = "BACK" },
      },
    },
    report_done = {
      lines = {
        { id = "rpd_default", text = "I'll write it down and pass it to the captain, and he'll pass it up, and before long somebody with a horse will ride out and look. I wish I could tell you it moved faster than that, but the watch is spread thin as it is." },
      },
      choices = {
        { text = "Then I'll deal with it myself.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Thank you for listening.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    law = {
      big = true,
      lines = {
        { id = "lw_default", text = "More often than I'd like. Last month I caught a lad stealing bread for his little sisters, and the law says the stocks and a fine his family couldn't pay in a year, so tell me, what would you have done?" },
      },
      choices = {
        { text = "The law's the law. Bend it once and it breaks.", next = "law_did", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Let him go. Since when is being hungry a crime?", next = "law_did", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "What did you do?", next = "law_did" },
      },
    },
    law_did = {
      lines = {
        { id = "ld_default", text = "I paid the baker out of my own purse and told the lad that if I ever caught him again, it'd be the stocks for certain. Maybe that was right and maybe it wasn't, but I sleep well enough, and if the captain asks, you never heard it from me." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruit = {
      lines = {
        { id = "rc_default", text = "Always, though you'd be standing a post in the rain for poor pay instead of out making a name for yourself. If you mean it, talk to an officer, but I'd wager you'll do more good on the road than you ever would at a gate." },
      },
      choices = {
        { text = "Maybe one day.", next = "BACK" },
        { text = "You're probably right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    oldguard = {
      lines = {
        { id = "og_default", text = "Did you, now? Then you know about the boots that never dry and the sergeant who never sleeps, and you'll know what it costs to walk away from it. What made you leave?" },
      },
      choices = {
        { text = "The city felt too small for me.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I wanted to fight, not stand guard.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    rearguard = {
      lines = {
        { id = "rg_default", text = "Then you've stood a harder watch than any of us ever will, and I'm sorry for what you lost down there. If you ever tire of the road, there's a fire at the barracks, and nobody would ask you to talk about it." },
      },
      choices = {
        { text = "Thank you. That means something.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Opinion pass: the guard asks what the player thinks of the throne and of the war.
    w_king = {
      big = true,
      lines = {
        { id = "wk_default", text = "Near a year now since King Varian went off to his parley and never came home, and the barracks argues about it every night. Lord Bolvar holds the throne, Lady Prestor holds Lord Bolvar's ear, and nobody asks a guard, so I'm asking you: what do you make of it?" },
        { id = "wk_capital", when = { capital = true }, text = "The Keep's just up the hill, and every soldier on these walls has a view on who ought to be sitting in it. The king's been gone near a year, Lord Bolvar rules for the boy prince and Lady Prestor is never far from his side, so what do you make of it all?" },
      },
      choices = {
        { text = "Bolvar's holding the kingdom together. I trust him.", next = "w_king_bolvar", fx = { opinion = { bolvar = "trust" }, align = { order = 1 }, affinity = 1 } },
        { text = "The nobles let Westfall starve. The throne answers to them, not us.", next = "w_king_nobles", fx = { opinion = { stormwind = "abandoned_its_own" }, align = { order = -1 } } },
        { text = "The king's alive somewhere. Someone should be out looking.", next = "w_king_varian", fx = { opinion = { varian = "hope" }, trait = { brave = 1 } } },
        { text = "I don't like how close Lady Prestor sits to the throne.", next = "w_king_prestor", fx = { opinion = { prestor = "distrust" }, trait = { skeptical = 1 } } },
        { text = "Ironforge would never leave its throne empty this long.", next = "w_king_magni", when = { race = "Dwarf" }, fx = { opinion = { magni = "admire" } } },
        { text = "The Sentinels answer to Tyrande, and she doesn't vanish.", next = "w_king_elf", when = { race = "NightElf" }, fx = { opinion = { tyrande = "trust" }, affinity = -1 } },
        { text = "I'd sooner not talk about the throne in the street.", next = "BACK" },
      },
    },
    w_king_bolvar = {
      lines = { { id = "wkb_default", text = "Aye, he's an old Silver Hand man and he's never once sat that throne as if it were his own, which is more than you can say for most who've stood near it. Some of the lads call him too gentle with the nobles, mind, and I can't swear they're wrong." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Good day to you.", next = "END" },
      },
    },
    w_king_nobles = {
      lines = { { id = "wkn_default", text = "You'll find no argument from the men on these walls, since half of us have family on a Westfall farm. Mind who hears you say it inside the city, though, because the Stockade has a few men in it who said it louder." } },
      choices = {
        { text = "I'll mind my tongue.", next = "BACK" },
        { text = "Let them hear it.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    w_king_varian = {
      lines = { { id = "wkv_default", text = "That's what my sergeant says, and he lights a candle for the king every night in the barracks chapel. I hope you're both right, because the prince is a good lad, but he's years too young to carry a crown." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    w_king_prestor = {
      lines = { { id = "wkp_default", text = "Keep your voice down when you say that, friend. She has the court eating from her hand, and the ones who don't care for her have a way of being posted somewhere cold, though you never heard that from me." } },
      choices = {
        { text = "Has that happened to anyone you know?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_king_magni = {
      lines = { { id = "wkm_default", text = "Maybe not, and they say King Magni's never left his for so much as an hour. But Stormwind isn't Ironforge, and we make do with the regent we've got, the same as you'd make do if your king went missing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_king_elf = {
      lines = { { id = "wke_default", text = "Maybe she doesn't, and maybe your high priestess would sit our throne better than any noble, but it's ours to fill all the same. I'd not say that in front of the sergeant, if I were you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_war = {
      big = true,
      lines = {
        { id = "ww_default", text = "The barracks is split clean down the middle: some want to march on Orgrimmar tomorrow, and some say Lady Jaina's right to keep her peace at Theramore. They've all lost someone to the orcs, so you'll understand it gets loud. Where do you stand?" },
        { id = "ww_vet", when = { minLevel = 40 }, text = "You've fought more of the Horde than most of us have seen, so the lads would want your answer sooner than mine. Lady Jaina keeps her peace at Theramore, and plenty in the barracks say she's wrong. Where do you stand?" },
      },
      choices = {
        { text = "Lady Jaina's right. That peace is worth keeping.", next = "w_war_peace", fx = { opinion = { peace = "for", jaina = "trust" }, align = { light = 1 } } },
        { text = "The orcs burned this kingdom once. I'd not give them another chance.", next = "w_war_war", fx = { opinion = { peace = "against", orcs = "hate" }, align = { light = -1 } } },
        { text = "Peace for now, but I'd keep my sword sharp.", next = "w_war_mixed", fx = { opinion = { peace = "mixed" }, trait = { cautious = 1 } } },
        { text = "The real war is in the north, against the Scourge.", next = "w_war_scourge", when = { class = { "PALADIN", "PRIEST" } }, fx = { opinion = { scourge = "war" }, affinity = 1 } },
        { text = "They're cutting Ashenvale down. That's war already.", next = "w_war_ashen", when = { race = "NightElf" }, fx = { opinion = { ashenvale = "war" } } },
        { text = "I'll keep my own counsel on that one.", next = "BACK" },
      },
    },
    w_war_peace = {
      lines = { { id = "wwp_default", text = "My captain would shake your hand for that and my sergeant would spit, so I'll do neither and say only that I hope you're right. The orcs at Theramore's gates haven't broken faith yet, and that's more than anyone expected of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_war_war = {
      lines = { { id = "www_default", text = "You'll have friends in the barracks for that, and plenty of them. I'd only say the last war took my father and most of his village, so be very sure of it before you go wishing for another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_war_mixed = {
      lines = { { id = "wwm_default", text = "That's about where the captain lands, and he's the steadiest man I know. A peace with one hand on the hilt has kept this kingdom standing longer than any treaty." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_war_scourge = {
      lines = { { id = "wws_default", text = "There's sense in that, and the Light knows the dead don't sign truces. My cousin went north with the Argent Dawn last spring, and his letters never mention orcs at all, only the plague and the dead walking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_war_ashen = {
      lines = { { id = "wwa_default", text = "I'd heard the Sentinels were hard pressed out there, though the orders that reach us never say much. If it's war in Ashenvale already, I'm sorry for it, and I'd not blame your people for answering it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    purse = {
      lines = {
        { id = "pu_default", text = "Is it? That's funny, because it's knotted shut and tucked under my belt, and you'd only know that if you'd been looking. I'll remember your face, friend, and you'll remember that I did." },
      },
      choices = {
        { text = "Only trying to be helpful.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Easy, I was only joking.", next = "BACK" },
      },
    },
    -- 0.80.0: politics. Opinions recorded here travel the gossip network (CONTENT_GUIDE §10).
    pol = {
      lines = {
        { id = "po_default", text = "Soldiers aren't meant to have opinions, so naturally every one of us has a dozen. Pick a subject and I'll tell you what the barracks says, but keep your voice down if a sergeant walks by." },
        { id = "po_capital", when = { capital = true }, text = "In the city you can't buy a loaf without hearing somebody's view on the court, the orcs, or who ought to pay for the last war. Pick one, and I'll tell you what the barracks thinks." },
        { id = "po_g_loyal", when = { gossip = { topic = "regency", stance = "trust_the_regency" } }, text = "Word reached the barracks that you'll hear no ill spoken of the Highlord's regency. The sergeants liked that, though a few of the younger lads called you a courtier when you weren't there." },
        { id = "po_g_king", when = { gossip = { topic = "regency", stance = "find_the_king" } }, text = "Somebody in town says you told them the court ought to be out looking for King Varian. Plenty of soldiers think the same, but they don't say it near an officer, and neither should you." },
        { id = "po_g_nobles", when = { gossip = { topic = "regency", stance = "curb_the_nobles" } }, text = "I hear you've been saying the nobles have their hands all over the young king's throne. You're not wrong, by the barracks' reckoning, but folk have lost their posts for saying less." },
        { id = "po_g_peace", when = { gossip = { topic = "peace", stance = "for" } }, text = "I hear you've been telling folk that Lady Proudmoore's peace with the orcs is worth keeping. The young bloods in my company would argue it with you, but the ones who've buried friends might not." },
        { id = "po_g_nopeace", when = { gossip = { topic = "peace", stance = "against" } }, text = "Word is you called the peace with the orcs a fool's bargain, and in front of witnesses. There's a few in the barracks who'd stand you a drink for it." },
        { id = "po_g_burden", when = { gossip = { topic = "refugees", stance = "send_them_to_the_farms" } }, text = "Somebody said you think the Lordaeron folk are more trouble than they're worth. Mind who hears that, because plenty in the watch have a cousin who came south with nothing." },
        { id = "po_contra", when = { contradiction = "regency" }, text = "Funny thing: I've heard from folk in this town that you trust the regency, and from others that you don't. A soldier learns to notice when someone tells each crowd what it wants to hear." },
      },
      choices = {
        { text = "What do you make of the regency?", next = "pol_regency" },
        { text = "Should we keep the peace with Thrall's orcs?", next = "pol_peace" },
        { text = "What about the refugees from Lordaeron?", next = "pol_refugees" },
        { text = "Is it true Gilneas shut its gates on the Alliance?", next = "pol_gilneas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_regency = {
      big = true,
      lines = {
        { id = "pr_default", text = "King Varian sailed off to a council and never came home, and now there's a boy on the throne with Highlord Bolvar at his elbow. I'd follow the Highlord into the Burning Steppes, but the nobles have crowded round that throne like gulls round a fishing boat. Where do you stand on it?" },
        { id = "pr_paladin", when = { class = "PALADIN" }, text = "The Highlord walks in the same Light you do, and I'd trust him with my life. It's the rest of the court that worries the barracks: lords and ladies and advisors, all telling a boy king what's good for him. Where do you stand?" },
        { id = "pr_noble", when = { origin = "human_minor_noble" }, text = "You'd know the court better than I would, coming from one of the old houses. From the barracks it looks as if the nobles have the boy's ear, the Highlord has his sword arm, and nobody has the king himself. Where do you stand?" },
      },
      choices = {
        { text = "Bolvar holds the realm together. Trust the regency.", next = "pol_regency_said", fx = { align = { order = 2 }, opinion = { regency = "trust_the_regency" } } },
        { text = "Someone should be turning the world over to find Varian.", next = "pol_regency_said", fx = { align = { honor = 1, order = -1 }, opinion = { regency = "find_the_king" } } },
        { text = "The nobles bled the masons dry, and they'll bleed the boy too.", next = "pol_regency_said", fx = { align = { order = -2 }, opinion = { regency = "curb_the_nobles" } } },
        { text = "Who has the young king's ear, besides the Highlord?", next = "pol_court" },
      },
    },
    pol_court = {
      lines = {
        { id = "pc_default", text = "Lady Katrana Prestor, mostly. She came down from Alterac's old lands, as I hear it, and the court took to her in a single season. The kitchen girls say she's kind to them and the lords say she's clever, and I've never heard those two crowds agree on anything before." },
      },
      choices = {
        { text = "Back to the regency, then.", next = "pol_regency" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_regency_said = {
      lines = {
        { id = "prs_default", text = "Well, you've said it plainly, and I'll not repeat it to an officer." },
        { id = "prs_loyal", when = { opinion = { topic = "regency", stance = "trust_the_regency" } }, text = "Good. Every week somebody new tells me the realm's falling apart, and every week the Highlord's still standing in the throne room and the walls are still up. That's enough for me." },
        { id = "prs_king", when = { opinion = { topic = "regency", stance = "find_the_king" } }, text = "Aye, and you'll find a lot of old soldiers who agree with you over a drink. But who goes looking? The Highlord can't leave, the nobles won't, and the king's son is ten years old." },
        { id = "prs_nobles", when = { opinion = { topic = "regency", stance = "curb_the_nobles" } }, text = "You'll get no argument from the barracks, though you'll get one from the Keep. Just remember that the masons said much the same before they went to Westfall and put on red bandanas." },
      },
      choices = {
        { text = "What else is the barracks arguing about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_peace = {
      big = true,
      lines = {
        { id = "pp_default", text = "Lady Jaina Proudmoore keeps a peace with the orcs from her island in Dustwallow, and Warchief Thrall keeps his end of it, so they say. My father fought orcs at Blackrock Spire, and he spits whenever her name comes up. Me, I don't know. What do you think?" },
        { id = "pp_nightelf", when = { race = "NightElf" }, text = "Your people have orcs cutting down Ashenvale while Lady Proudmoore sits in Theramore talking peace with their Warchief. I'd like to hear what an elf makes of that, and plainly." },
        { id = "pp_refugee", when = { origin = "human_lordaeron_refugee" }, text = "You came south from Lordaeron, didn't you? Then you'll remember the camps we kept the orcs in, and what it cost to keep them. Now Lady Proudmoore treats with the orc who broke them open. What do you make of that?" },
      },
      choices = {
        { text = "Peace with Thrall beats a dozen victories.", next = "pol_peace_said", fx = { align = { light = 2 }, opinion = { peace = "for" } } },
        { text = "An orc's word means nothing. Arm Theramore and be ready.", next = "pol_peace_said", fx = { align = { order = 1, light = -1 }, opinion = { peace = "against" } } },
        { text = "Do the soldiers trust Thrall at all?", next = "pol_peace_thrall" },
      },
    },
    pol_peace_thrall = {
      lines = {
        { id = "ppt_default", text = "Some do. He broke the camps open, but he didn't burn a single human town doing it, and the old hands say no orc chieftain they ever fought would have bothered being so careful. The rest say he's only been careful so far." },
      },
      choices = {
        { text = "Back to the peace, then.", next = "pol_peace" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_peace_said = {
      lines = {
        { id = "pps_default", text = "Have it your way. It's not a question that'll be settled at a gate." },
        { id = "pps_for", when = { opinion = { topic = "peace", stance = "for" } }, text = "Maybe you're right. I'd sooner my children grew up afraid of nothing worse than wolves, and if a peace in Dustwallow buys that, I'll hold my tongue when my father spits." },
        { id = "pps_against", when = { opinion = { topic = "peace", stance = "against" } }, text = "My father would shake your hand for that. I only hope that when the fighting comes, it's the people who said it loudest who end up in the front rank." },
      },
      choices = {
        { text = "What else is the barracks arguing about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_refugees = {
      big = true,
      lines = {
        { id = "pf_default", text = "They came south when the plague took Lordaeron, whole villages of them, with whatever they could carry. The Cathedral feeds them and the city grumbles, because bread's dear and work's scarce and every second beggar in the Trade District has a northern accent. What would you do with them?" },
        { id = "pf_refugee", when = { origin = "human_lordaeron_refugee" }, text = "Forgive me, you'd know this better than I do, having walked that road yourself. The city grumbles about your people every time the price of bread goes up. What would you have the crown do?" },
      },
      choices = {
        { text = "Take them in. They lost everything holding the line for us.", next = "pol_refugees_said", fx = { align = { light = 2 }, opinion = { refugees = "take_them_in" } } },
        { text = "Stormwind can't feed the whole north. Send them to the farms.", next = "pol_refugees_said", fx = { align = { order = 1, light = -1 }, opinion = { refugees = "send_them_to_the_farms" } } },
        { text = "Where do most of them end up?", next = "pol_refugees_where" },
      },
    },
    pol_refugees_where = {
      lines = {
        { id = "pfw_default", text = "Old Town, the Cathedral's back rooms, and the farms in Elwynn if they're lucky. Some went to Menethil and Southshore to be nearer what's left of home. I've had grown men ask me which road leads to Lordaeron, as though it'll still be there when they arrive." },
      },
      choices = {
        { text = "Back to the refugees, then.", next = "pol_refugees" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_refugees_said = {
      lines = {
        { id = "pfs_default", text = "There's no easy answer, and anyone who says there is has never stood at the gate when the carts come in." },
        { id = "pfs_welcome", when = { opinion = { topic = "refugees", stance = "take_them_in" } }, text = "That's the Cathedral's view, and it's a good one. I only wish the Cathedral paid my rent, because the landlords have been raising it on every family that can't argue back." },
        { id = "pfs_burden", when = { opinion = { topic = "refugees", stance = "send_them_to_the_farms" } }, text = "There's some sense in that, but there's not a farm in Westfall safe enough to send anyone to now. Say it to a priest and see what face they make." },
      },
      choices = {
        { text = "What else is the barracks arguing about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_gilneas = {
      big = true,
      lines = {
        { id = "pg_default", text = "It's true. King Greymane walked out of the Alliance after the Second War, said his kingdom had paid enough for the orcs' camps, and built a wall across the land. Then the plague came, and Gilneas kept its gate shut while Lordaeron burned. Was he wrong?" },
        { id = "pg_dwarf", when = { race = "Dwarf" }, text = "True enough. Your king kept faith with us when Greymane and Stromgarde went home, so I'd guess a dwarf already has a view on it. Greymane built his wall and kept his gate shut while Lordaeron burned. Was he wrong?" },
      },
      choices = {
        { text = "He abandoned his allies. That's a betrayal, plainly.", next = "pol_gilneas_said", fx = { align = { honor = 2 }, opinion = { gilneas = "greymane_betrayed_us" } } },
        { text = "His people are alive behind that wall. That's a king's job.", next = "pol_gilneas_said", fx = { align = { order = 1, honor = -1 }, opinion = { gilneas = "greymane_saved_his_own" } } },
        { text = "Does anyone hear from Gilneas at all?", next = "pol_gilneas_news" },
      },
    },
    pol_gilneas_news = {
      lines = {
        { id = "pgn_default", text = "Not a whisper. No ships put in from there, the gate in the wall stays shut, and nobody who climbs over comes back to tell us what's on the other side. For all we know they're having a lovely time." },
      },
      choices = {
        { text = "Back to Gilneas, then.", next = "pol_gilneas" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_gilneas_said = {
      lines = {
        { id = "pgs_default", text = "Well, Greymane isn't listening either way, so you're safe to say it." },
        { id = "pgs_betrayal", when = { opinion = { topic = "gilneas", stance = "greymane_betrayed_us" } }, text = "That's how my sergeant puts it, though with more cursing. He says that when all this is over, somebody ought to remind Greymane who held the line while he was laying bricks." },
        { id = "pgs_right", when = { opinion = { topic = "gilneas", stance = "greymane_saved_his_own" } }, text = "Maybe so. If I'd had a wall to put between my family and the Scourge, I can't swear I'd have opened the gate either. I'd only not have called myself an ally afterwards." },
      },
      choices = {
        { text = "What else is the barracks arguing about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Patrols pass word along the road, and a fair bit of it reaches me. Here's what I can tell you." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been a friend to these roads, so I'll speak plainly about what we've seen out here." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer your questions, but I'll be keeping an eye on you while I do." },
    },
    _none = { { id = "t_none", text = "That's above my post, I'm afraid; ask an officer." } },
  },
}

P:Pool {
  id = "guard_horde", role = "guard", faction = "Horde",
  greetings = {
    { id = "g_strength", text = "Strength and honor. What is it you want?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's the night watch, so don't make it interesting." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}. The watch stood without you, but it's good to see you back." },
    { id = "g_word_angry", when = { word = "angered" }, text = "I hear you made someone in town very angry. Grudges turn into fights, and fights are my business, so watch yourself." },
    { id = "g_word_help", when = { word = "helped" }, text = "Word is you did this place a good turn. Lok'tar; the guard remembers." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Lost your armor, or lost a bet?" },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "You reek of grog. Fall over somewhere I'm not standing." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Keep your demon on a short chain. The Warchief allows your kind, and I allow nothing I don't have to." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "You came through the camp wolf-shaped again, shaman. The grunts keep swinging at you, and one day one of them will connect." },
    { id = "n_claws", cat = "form", when = { form = { "bear", "cat" } },
      text = "A druid in claws. Walk on two legs past the wolf pens before something in there gets ideas." },
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} has better manners than most grunts. Keep it that way." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Sky-elf. The tauren vouch for you, and I trust the tauren, so I'll trust you a little." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. You're Horde by the Warchief's word and I'll stand beside you, but don't ask me to like the smell." },
    { id = "n_troll_lock", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A Darkspear with demon-stink on them. I thought Vol'jin's people knew better than that." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I can smell you, so come out." } },
  lines = {
    { id = "l_default", text = "If you're looking for a fight, there are better places than my post. Ask anyone." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Good, another warrior. If trouble comes through this gate, you'll stand with us." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "I don't know your face, and I don't like faces I don't know. Walk where I can see you." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "The spirits are restless past the camp, shaman. The scouts say the wind's been wrong all week." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Hunters bring the best news, since you go where the scouts don't. Seen anything moving out there?" },
    { id = "l_mage", when = { class = "MAGE" }, text = "Keep the fire in your hands and out of the supply tents, mage." },
  },
  -- 0.71.0: a conversation tree shared by every Horde guard: orc grunts, troll and tauren
  -- braves and Forsaken Deathguard alike, so it speaks for the Horde, not one people.
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Speak your business. The Horde keeps this post, and I keep it for the Horde." },
        { id = "h_capital", when = { capital = true }, text = "The Horde's people pass this way by the hundred, so make it quick and make it worth my while." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The night watch is the long one, so talk if you've something to say; it passes the time." },
        { id = "h_young", when = { maxLevel = 12 }, text = "You're young to be this far from the fires, so keep close to the posts until your arm is stronger. What do you want?" },
        { id = "h_vet", when = { minLevel = 50 }, text = "I've heard your name spoken around the fires, and none of it was dull. What does a blooded one want with a guard?" },
        -- Opinion pass: word of what the player said to someone else in this town.
        { id = "h_o_soft", once = true, when = { gossip = { topic = "warchief", stance = { "soft", "weak", "distrust" } } },
          text = "I hear you've been saying the Warchief has gone soft. Say it to my face next time, and we'll see how soft the Horde is." },
        { id = "h_o_trust", once = true, when = { gossip = { topic = "warchief", stance = { "trust", "respect", "admire" } } },
          text = "The grunts say you spoke well of the Warchief. Good; there are too many grumblers around the fires these days, and they need to hear it." },
        { id = "h_o_peace_for", once = true, when = { gossip = { topic = "peace", stance = { "for", "mixed" } } },
          text = "Word is you'd keep the peace with the humans. I don't love it, but the Warchief says the same, and he's not been wrong yet." },
        { id = "h_o_peace_against", once = true, when = { gossip = { topic = "peace", stance = { "against", "war" } } },
          text = "They tell me you're hungry for war with the Alliance. Keep that hunger for the battlefield, and don't go starting one on my road." },
        { id = "h_o_forsaken", once = true, when = { gossip = { topic = "forsaken", stance = { "distrust", "hate", "dangerous" } } },
          text = "Somebody heard you say the Forsaken can't be trusted. Plenty here agree, but the Warchief took them in, so we keep our muttering quiet." },
      },
        -- Deeds pass: what the watch has heard about your deaths, your standing and the front.
        { id = "h_dd_deaths", when = { deaths = { min = 15 } },
          text = "The spirit healer sends you back so often the grunts have started laying wagers on it. Die less, and you'll cost me less coin." },
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "I hear you went off a cliff and the ground won. Next time, look before you jump; the ground has never lost a fight yet." },
        { id = "h_dd_rep", tags = { "news" }, when = { any = { { reputation = { faction = "Orgrimmar", min = "honored" } }, { reputation = { faction = "Thunder Bluff", min = "honored" } }, { reputation = { faction = "Undercity", min = "honored" } }, { reputation = { faction = "Darkspear Trolls", min = "honored" } } } },
          text = "The runners carry your name between the cities now, and they carry it with respect. The Horde doesn't hand that out for nothing, so stand tall." },
        { id = "h_dd_hk", when = { honorKills = { min = 100 } },
          text = "The war-callers say you've spilled a great deal of Alliance blood on the front. Good; you have the eyes for it, and the scars to go with them." },
      again = {
        { id = "a_road", text = "What else? The road won't watch itself." },
        { id = "a_speak", text = "Speak, then; I'm listening, and I'm still watching." },
      },
      choices = {
        { text = "What's around here worth knowing?", next = "around" },
        { text = "Guard duty looks a hard life.", next = "watch" },
        { text = "What's been moving on the roads?", next = "roads" },
        { text = "I've seen trouble you should know about.", next = "report" },
        { text = "You must take prisoners now and then.", next = "prisoners" },
        { text = "What are the grunts arguing about around the fires?", next = "pol" },
        { text = "Does the watch need another blade?", next = "recruit", when = { class = "WARRIOR" } },
        { text = "I stood the Razor Hill watch myself.", next = "razor", when = { origin = "orc_razor_hill_grunt" } },
        { text = "I grew up behind human walls, in the internment camps.", next = "camp", when = { origin = "orc_camp_born" } },
        { text = "Do the Deathguard keep watches like yours?", next = "deathguard", when = { race = "Scourge", ["not"] = { capital = true } } },
        { text = "You'd never see me coming, you know.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I've died more times than I can count.", next = "dd_deaths", when = { deaths = { min = 15 } } },
        { text = "I've been fighting the Alliance on the front.", next = "dd_front", when = { honorKills = { min = 100 } } },
        { text = "Strength and honor.", next = "END" },
      },
    },
    -- Deeds pass: deaths and the front.
    dd_deaths = {
      lines = {
        { id = "dd_de_default", text = "Then the spirits want you for something, or they'd have kept you by now. The old orcs say a warrior who keeps coming back has unfinished business, and that it's bad luck to stand between them and it." },
        { id = "dd_de_forsaken", when = { race = "Scourge" }, text = "You were dead before you ever came to my post, so I don't know what dying means to your kind any more. The Forsaken I know just shrug and go back to the fight, and I'd call that brave if it weren't so strange." },
      },
      choices = {
        { text = "Does it trouble the grunts, folk coming back like that?", next = "dd_deaths2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_deaths2 = {
      lines = {
        { id = "dd_d2_default", text = "It troubles the old ones. They saw what Gul'dan made of dead men in the Second War and they've never forgotten the smell of it, though the shamans swear the spirit healers are nothing like that." },
      },
      choices = {
        { text = "Every time I come back, I owe the Horde more.", next = "BACK", reply = "That's how a warrior should carry it. Pay the debt in deeds, and the ancestors will be satisfied.", fx = { align = { honor = 1 } } },
        { text = "The spirits can keep their debts. I fight for myself.", next = "BACK", reply = "Then fight well, at least, because a warrior who fights for nobody has nobody to carry them home.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_front = {
      lines = {
        { id = "dd_fr_default", text = "Warsong Gulch, the Alterac pass, the roads in between; I hear the Alliance send more soldiers every season. Tell me plainly, how do they fight?" },
      },
      choices = {
        { text = "Hard, and fairly. I give them the same.", next = "BACK", reply = "Good. Thrall says honour is what separates us from what we were, and a warrior who fights fairly keeps that true.", fx = { align = { honor = 1 } } },
        { text = "However they like. I fight to win.", next = "BACK", reply = "Winning matters, and I'll not pretend otherwise. Only remember the Warchief is watching what kind of Horde we become.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    around = {
      lines = {
        { id = "ar_default", text = "There's food and a bed at the inn and a smith for whatever the road breaks, and anyone who needs a hand will tell you loudly enough. The Horde looks after its own here, so ask before you go wandering." },
        { id = "ar_capital", when = { capital = true }, text = "Ask any guard and you'll be pointed right, because the city is big and the crowds don't wait for the lost. Keep your coin close in the markets, since not everyone in the Horde is honest." },
      },
      choices = {
        { text = "There must be danger somewhere, then.", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "dg_default", text = "Past the last post and away from the roads, where the scouts stop going and the beasts and raiders start. The Alliance has scouts out here and there as well, and they don't come to trade." },
        { id = "dg_capital", when = { capital = true }, text = "Inside the walls it's brawlers and thieves, and outside them it's everything that hungers. Don't leave the roads without a weapon you trust." },
      },
      choices = {
        { text = "Then that's where I'm headed.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'll stay where the posts can see me.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "w_default", text = "Long nights, thin stew and a wind that never stops, and nobody sings songs about the ones who stand at the gate. Still, the Horde was made in worse places than this, and we're not about to let it fall now." },
      },
      choices = {
        { text = "What's the hardest part?", next = "watch_hard" },
        { text = "Why do you stand it?", next = "watch_why" },
        { text = "What do the grunts say about the Warchief?", next = "h_chief" },
        { text = "Will the peace with the humans hold?", next = "h_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_hard = {
      lines = {
        { id = "wh_default", text = "The waiting. A warrior wants to meet the enemy, but a guard has to stand still and let the enemy come, and some nights the waiting feels longer than any battle I've fought." },
      },
      choices = {
        { text = "Standing still that long takes nerve. I respect it.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "I'd go mad, standing still that long.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    watch_why = {
      lines = {
        { id = "wy_default", text = "Because the Horde gave my people a place when we had none, and a place is worth standing in the rain for. The Warchief asks it of us, and I've stood in worse rain for worse reasons." },
        { id = "wy_shaman", when = { class = "SHAMAN" }, text = "The same reason you listen to the spirits, shaman: somebody has to, or everything goes wrong. The spirits have you, and the gate has me." },
      },
      choices = {
        { text = "That's well said.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = {
        { id = "rd_default", text = "Raiders on the long stretches, beasts grown bold with hunger, and Alliance scouts where they've no business being. You walk like someone who's come a long way, though, so tell me what brings you out here." },
      },
      choices = {
        { text = "Glory! I want my name told at every fire in the Horde.", next = "roads_you", fx = { trait = { brave = 1 } } },
        { text = "Coin, plain and simple.", next = "roads_you", fx = { trait = { greedy = 1 } } },
        { text = "The Horde needs strong arms, so here I am.", next = "roads_you", fx = { affinity = 1 } },
        { text = "That's my own business.", next = "roads_you", fx = { affinity = -1 } },
      },
    },
    roads_you = {
      lines = {
        { id = "ry_default", text = "Good enough, whatever drives you, so long as you pull your weight when the horns sound. If you find tracks out there that don't belong to any beast you know, come back and tell me." },
      },
      choices = {
        { text = "What sort of tracks?", next = "tracks" },
        { text = "I'll keep my eyes open.", next = "BACK" },
      },
    },
    tracks = {
      lines = {
        { id = "tr_default", text = "Boots walking in a line, too careful to be bandits, or a camp with its ashes buried so nobody sees the smoke. The Alliance trains its scouts well, and the only way to beat them is to know where to look." },
      },
      choices = {
        { text = "I'll watch for them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Strength and honor.", next = "END" },
      },
    },
    report = {
      lines = {
        { id = "rp_default", text = "Speak plainly: what did you see, and where did you see it? The more you tell me, the fewer of us die finding out the rest." },
      },
      choices = {
        { text = "Raiders, watching the road.", next = "report_done" },
        { text = "Something dead that should have stayed dead.", next = "report_done" },
        { text = "Never mind, it can wait.", next = "BACK" },
      },
    },
    report_done = {
      lines = {
        { id = "rpd_default", text = "I'll send word to the commander with the next runner, and the scouts will go and look when there are scouts to spare. There never are enough of them, so if you want it done quickly, you may have to do it yourself." },
      },
      choices = {
        { text = "Then I'll see to it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "You have my thanks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    prisoners = {
      big = true,
      lines = {
        { id = "pr_default", text = "We took a human scout two weeks back, half starved and frightened out of his wits, and the commander's still deciding what to do with him. Some say send him home and some say squeeze him dry first, so I'd hear what you think." },
      },
      choices = {
        { text = "Send him home whole. We're not the old Horde.", next = "prisoners_did", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Wring him for everything he knows first.", next = "prisoners_did", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "What do you think should happen?", next = "prisoners_did" },
      },
    },
    prisoners_did = {
      lines = {
        { id = "pd_default", text = "I've fed him from my own bowl and listened to him talk about his farm and his wife, and I find I can't hate him the way I'm supposed to. The Warchief wants a Horde with honor in it, and every year I understand that a little better." },
      },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruit = {
      lines = {
        { id = "rc_default", text = "There's always room on the wall for a strong arm, though the pay is poor and the glory poorer. Talk to the commander if you mean it, but I think your blade does more good out on the road than it would standing here." },
      },
      choices = {
        { text = "Maybe when I'm older and slower.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "You're probably right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    razor = {
      lines = {
        { id = "rz_default", text = "Razor Hill! Then you've stood on that wall with the sea wind in your face and Kul Tiran marines camped down the coast, and you know exactly how dull and how important this work is. Do they still make the new ones scrub the barracks floor?" },
      },
      choices = {
        { text = "Every morning, with a brush the size of my thumb.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "They did, and I'm glad to be out of it.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "cp_default", text = "Then you know what it is to look at a wall from the wrong side of it. I stand at this post so none of the Horde's children ever has to again, and I'd wager that's why you carry a weapon too." },
      },
      choices = {
        { text = "It is. Never again.", next = "BACK", fx = { affinity = 1 } },
        { text = "I carry it for myself.", next = "BACK" },
      },
    },
    deathguard = {
      lines = {
        { id = "dgd_default", text = "The Deathguard keep watches like ours, only without sleep and without feeling the cold. It looks like an advantage, until you remember what it cost them to get that way." },
      },
      choices = {
        { text = "It cost us everything.", next = "BACK", fx = { affinity = 1 } },
        { text = "It has its advantages.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    -- Opinion pass: the guard asks what the player thinks of Thrall and of the peace.
    h_chief = {
      big = true,
      lines = {
        { id = "hc_default", text = "Some of the grunts say the Warchief's gone soft, making treaties with humans and opening the gates to the Forsaken, and others would follow him into the sea. You've been out on the roads, so tell me: what do you make of Thrall?" },
        { id = "hc_capital", when = { capital = true }, text = "The Warchief sits in Grommash Hold, and every grunt in this city has an opinion on how he ought to rule from it. Some call him soft and some would die for him. What do you make of Thrall?" },
      },
      choices = {
        { text = "Thrall freed us from the camps. He has my trust.", next = "h_chief_trust", fx = { opinion = { warchief = "trust" }, align = { honor = 1 }, affinity = 1 } },
        { text = "He's too soft on the humans. The Horde should be feared.", next = "h_chief_soft", fx = { opinion = { warchief = "soft" }, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "He's wise, but he trusts the Forsaken too far.", next = "h_chief_dead", fx = { opinion = { warchief = "respect", forsaken = "distrust" }, trait = { skeptical = 1 } } },
        { text = "Cairne trusts him. That's enough for me.", next = "h_chief_cairne", when = { race = "Tauren" }, fx = { opinion = { warchief = "trust", cairne = "admire" } } },
        { text = "He gave my people a place when no one else would.", next = "h_chief_scourge", when = { race = "Scourge" }, fx = { opinion = { warchief = "respect" }, affinity = 1 } },
        { text = "That's for the Warchief to answer, not me.", next = "BACK" },
      },
    },
    h_chief_trust = {
      lines = { { id = "hct_default", text = "Good. Thousands of orcs walked out of the camps on Thrall's word, and they'll tell you nobody alive has earned more loyalty than that. Say it loud around the fires, because the grumblers need to hear it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_chief_soft = {
      lines = { { id = "hcs_default", text = "Careful who you say that to, because there are old grunts in this city who'd take your arm for it. Still, you're not the first, and the Warchief has never yet punished an orc for speaking plainly." } },
      choices = {
        { text = "Then I'll keep speaking plainly.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    h_chief_dead = {
      lines = { { id = "hcd_default", text = "You're not alone in that. The dead keep their own counsel down in the Undercity, and plenty of us wonder what they're brewing there, but the Warchief gave his word, and his word holds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_chief_cairne = {
      lines = { { id = "hcc_default", text = "The old bull of Thunder Bluff doesn't trust lightly, so if Cairne vouches for the Warchief, the rest of us ought to listen. Your people have been good to the Horde, and the Horde doesn't forget it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_chief_scourge = {
      lines = { { id = "hcf_default", text = "Then you know better than any of us what the Warchief's word is worth. Plenty of grunts muttered when he took your people in, but they've watched you fight since, and the muttering's gone quieter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_war = {
      big = true,
      lines = {
        { id = "hw_default", text = "The humans keep their fort at Northwatch and their ships at Theramore, and the Warchief keeps his peace with Lady Proudmoore for as long as she keeps hers. Some grunts are spoiling for a fight, and some are glad of the quiet. Where do you stand?" },
      },
      choices = {
        { text = "The peace gives the Horde time to grow strong.", next = "h_war_peace", fx = { opinion = { peace = "for" }, align = { order = 1 } } },
        { text = "The humans kept us in camps. No peace with them.", next = "h_war_war", fx = { opinion = { peace = "against", humans = "hate" }, align = { order = -1 } } },
        { text = "Proudmoore keeps her word. The rest of the Alliance doesn't.", next = "h_war_jaina", fx = { opinion = { jaina = "respect", alliance = "distrust" }, trait = { skeptical = 1 } } },
        { text = "The Earth Mother has seen enough blood. I want peace.", next = "h_war_peace", when = { race = "Tauren" }, fx = { opinion = { peace = "for" }, trait = { kind = 1 } } },
        { text = "The living made no peace with us. The Dark Lady owes them none.", next = "h_war_dead", when = { race = "Scourge" }, fx = { opinion = { peace = "against", sylvanas = "loyal" } } },
        { text = "I'll leave that to the Warchief.", next = "BACK" },
      },
    },
    h_war_peace = {
      lines = { { id = "hwp_default", text = "That's the Warchief's own thinking, near enough, and I've learned to trust it even when my blood says otherwise. A Horde that's had ten quiet years will be a hard thing to break." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_war_war = {
      lines = { { id = "hww_default", text = "Plenty of the grunts were born in those camps, so I'll not argue with you. But the Warchief says the camps are behind us, and I've decided to believe him, at least until a human gives me cause not to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_war_jaina = {
      lines = { { id = "hwj_default", text = "That's a fair reading. Proudmoore turned on her own father to keep faith with us, and no one forgets that, but Stormwind and the dwarves have made no such choice, and they've long memories." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    h_war_dead = {
      lines = { { id = "hwd_default", text = "The Dark Lady keeps her own counsel, and the Warchief keeps his. I'll stand my post and let the two of them sort out who owes the living what." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Maybe not, but I'd smell you, and so would every wolf in the pens. The ones who boast about it are never the ones I need to worry about, so walk where I can see you." },
      },
      choices = {
        { text = "Right, I'll walk where you can see me.", next = "BACK" },
        { text = "We'll see about that.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    -- 0.80.0: politics. Opinions recorded here travel the gossip network (CONTENT_GUIDE §10).
    pol = {
      lines = {
        { id = "po_default", text = "Politics is for chieftains and shamans, they tell us. But a grunt on a long watch thinks, and a grunt with a friend on the next post talks, so ask and I'll tell you what the barracks says." },
        { id = "po_capital", when = { capital = true }, text = "In the city every fire has its own argument: the Warchief, the humans, the dead ones from the north. Pick one, and I'll tell you what the grunts say." },
        { id = "po_g_peace", when = { gossip = { topic = "peace", stance = "for" } }, text = "Word reached my post that you spoke well of the Warchief's peace with the humans. Some here call that wisdom and some call it weakness, and both will be watching to see which you are." },
        { id = "po_g_nopeace", when = { gossip = { topic = "peace", stance = "against" } }, text = "I hear you called the peace with Theramore a mistake. Say it louder in the Valley of Strength and you'll find friends quickly, and enemies nearly as quickly." },
        { id = "po_g_watch", when = { gossip = { topic = "forsaken_in_horde", stance = "watch_them" } }, text = "Somebody says you told them the Forsaken need watching. You're not the first to say it, but don't say it where one of them can hear; they listen very well, for corpses." },
        { id = "po_g_kin", when = { gossip = { topic = "forsaken_in_horde", stance = "they_are_kin" } }, text = "I hear you stood up for the Forsaken around a fire not long ago. That's a generous heart, and the Horde has room for one or two of those." },
        { id = "po_g_warsong", when = { gossip = { topic = "warsong", stance = "support" } }, text = "Word is you back the Warsong in Ashenvale. The young grunts cheer that, and the old ones remember what the last war in a forest cost us." },
        { id = "po_g_soft", when = { gossip = { topic = "old_ways", stance = "the_horde_has_gone_soft" } }, text = "Somebody heard you say the Horde's gone soft. Careful, friend; the last orcs who wanted us hard again went looking for demons to help them." },
        { id = "po_contra", when = { contradiction = "peace" }, text = "I've heard that you praised the Warchief's peace at one fire and cursed it at another, both in this town. Pick one, friend. The Horde forgives a hard opinion sooner than a soft tongue." },
      },
      choices = {
        { text = "What do the grunts make of the peace with Theramore?", next = "pol_peace" },
        { text = "Do the Forsaken belong in the Horde?", next = "pol_forsaken" },
        { text = "Should the Warsong keep cutting into Ashenvale?", next = "pol_warsong" },
        { text = "Do any of the grunts miss the old ways?", next = "pol_oldways" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_peace = {
      big = true,
      lines = {
        { id = "pp_default", text = "The Warchief and the human sorceress in Theramore keep a peace between them, and so far it holds. The old grunts who did years in the human camps say no peace with them is worth the breath, and the young ones say the camps are gone because Thrall chose his fights. What do you say?" },
        { id = "pp_tauren", when = { race = "Tauren" }, text = "Your people welcomed the orcs when they were strangers on this land, so perhaps you understand the Warchief better than most. He keeps a peace with the human sorceress in Theramore, and the grunts argue about it every night. Where do you stand?" },
        { id = "pp_undead", when = { race = "Scourge" }, text = "You'll know better than most of us what the living humans think of your kind. The Warchief keeps a peace with the human sorceress all the same, and the grunts argue about it every night. Where do you stand?" },
        { id = "pp_camp", when = { origin = "orc_camp_born" }, text = "You grew up behind their fences, the same as half the old grunts. They say no peace with the humans is worth the breath, the Warchief says otherwise, and you've as much right to an opinion as any of them. Well?" },
      },
      choices = {
        { text = "The Warchief chose peace. That's the strength the old Horde lacked.", next = "pol_peace_said", fx = { align = { light = 1, honor = 1 }, opinion = { peace = "for" } } },
        { text = "The humans will break it the moment it suits them.", next = "pol_peace_said", fx = { align = { order = 1, light = -1 }, opinion = { peace = "against" } } },
        { text = "Do the grunts trust the Warchief on this?", next = "pol_peace_trust" },
      },
    },
    pol_peace_trust = {
      lines = {
        { id = "ppt_default", text = "Most do, because he's never once asked us to do a thing he wouldn't do himself. But trusting and liking aren't the same, and a lot of grunts wanted a war they could finish, not a peace they have to keep." },
      },
      choices = {
        { text = "Back to the peace, then.", next = "pol_peace" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_peace_said = {
      lines = {
        { id = "pps_default", text = "Hm. That'll be argued at every fire long after you and I are gone." },
        { id = "pps_for", when = { opinion = { topic = "peace", stance = "for" } }, text = "Spoken like the Warchief himself. I hope you're right, because I've a son who's never seen a camp, and I'd like to keep it that way." },
        { id = "pps_against", when = { opinion = { topic = "peace", stance = "against" } }, text = "The old grunts would clasp your arm for that. Just remember the Warchief says otherwise, and he's been right far more often than they have." },
      },
      choices = {
        { text = "What else do the grunts argue about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_forsaken = {
      big = true,
      lines = {
        { id = "pf_default", text = "The Dark Lady's people threw off the Lich King and came looking for allies, and the Warchief took them in. Some of my company trust them, and some say a corpse that turned on one master can turn on another. You've walked among them, so what do you think?" },
        { id = "pf_undead", when = { race = "Scourge" }, text = "Forgive me asking you, of all people. There are grunts in my company who'd follow a Forsaken into battle, and others who sleep with one eye open when one of you is on the next post. What do you say to that?" },
        { id = "pf_tauren", when = { race = "Tauren" }, text = "Your own elders spoke for the Forsaken at the Warchief's fire, I hear, and the Warchief listened. Some of my company think the tauren were too kind. What do you say?" },
      },
      choices = {
        { text = "They've bled for the Horde. That makes them kin.", next = "pol_forsaken_said", fx = { align = { honor = 1, light = 1 }, opinion = { forsaken_in_horde = "they_are_kin" } } },
        { text = "Watch them. The dead have their own reasons.", next = "pol_forsaken_said", fx = { align = { order = 1, honor = -1 }, opinion = { forsaken_in_horde = "watch_them" } } },
        { text = "What do the Forsaken want from us?", next = "pol_forsaken_want" },
      },
    },
    pol_forsaken_want = {
      lines = {
        { id = "pfw_default", text = "Allies against the Scourge, and against the humans who'd burn them, as far as anyone can tell. The Dark Lady keeps her own counsel, her apothecaries keep to their cellars, and the rest of us guess. Grunts are good at guessing and bad at being right." },
      },
      choices = {
        { text = "Back to the Forsaken, then.", next = "pol_forsaken" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_forsaken_said = {
      lines = {
        { id = "pfs_default", text = "Well, you've said it, and the Forsaken will have heard it before." },
        { id = "pfs_kin", when = { opinion = { topic = "forsaken_in_horde", stance = "they_are_kin" } }, text = "That's what the Warchief said, near enough, and the tauren before him. I'll try to remember it the next time one of them stands downwind of me." },
        { id = "pfs_watch", when = { opinion = { topic = "forsaken_in_horde", stance = "watch_them" } }, text = "Plenty agree with you, quietly. Only mind that watching someone and waiting for them to fail look much the same from outside, and the Forsaken notice." },
      },
      choices = {
        { text = "What else do the grunts argue about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_warsong = {
      big = true,
      lines = {
        { id = "pw_default", text = "The Warsong are cutting timber in Ashenvale for the Warchief's city, and the night elves kill a logger for every tree that falls. Some say we need the wood and the elves will never share it, and some say we've started a war the Warchief never asked for. Where do you stand?" },
        { id = "pw_tauren", when = { race = "Tauren" }, text = "The tauren don't like it, I know. Your druids say that forest is old and angry and the Warsong are poking it with axes. But Orgrimmar needs timber, and the Barrens has none to give. Where do you stand?" },
      },
      choices = {
        { text = "We need the timber. Let the Warsong fight for it.", next = "pol_warsong_said", fx = { align = { honor = 1, light = -1 }, opinion = { warsong = "support" } } },
        { text = "Rein them in before they drag the whole Horde into war.", next = "pol_warsong_said", fx = { align = { order = 1, light = 1 }, opinion = { warsong = "restrain" } } },
        { text = "Who leads the Warsong, now that Grom is gone?", next = "pol_warsong_who" },
      },
    },
    pol_warsong_who = {
      lines = {
        { id = "pww_default", text = "The old Warsong captains, each of them keen to prove Grom's fire still burns in the clan. Grom died killing the demon that cursed us, and the Warsong haven't let anyone forget it, least of all the night elves." },
      },
      choices = {
        { text = "Back to the Warsong, then.", next = "pol_warsong" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_warsong_said = {
      lines = {
        { id = "pws_default", text = "Ashenvale will have its own opinion, and it'll give it with arrows." },
        { id = "pws_support", when = { opinion = { topic = "warsong", stance = "support" } }, text = "Lok'tar! The young grunts say the same, and they'll be glad to hear a blooded one agree with them." },
        { id = "pws_restrain", when = { opinion = { topic = "warsong", stance = "restrain" } }, text = "Careful who hears that. The Warsong don't like being told to sit down, and their friends in Orgrimmar like it less, but I've heard the Warchief say something close to it himself." },
      },
      choices = {
        { text = "What else do the grunts argue about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pol_oldways = {
      big = true,
      lines = {
        { id = "pow_default", text = "A few. The old orcs talk about the days on Draenor, when the clans were one fist and nothing could stand before them. Then you ask how they did it, and they go quiet, because the answer is demon blood and warlocks. Should we miss it?" },
        { id = "pow_warlock", when = { class = "WARLOCK" }, text = "You'd know better than me. You deal in the same powers that poisoned our blood once, and the Warchief tolerates it because your kind keep them on a short leash. So tell me: should the Horde miss the old days?" },
        { id = "pow_frostwolf", when = { origin = "orc_frostwolf" }, text = "Not your clan, I'd guess. The Frostwolves never drank the blood, and they were exiled for it. But some of the others still talk about the old days as if they were glory and not a sickness. Should we miss them?" },
      },
      choices = {
        { text = "Never again. That kind of strength nearly destroyed us.", next = "pol_oldways_said", fx = { align = { light = 2 }, opinion = { old_ways = "never_again" } } },
        { text = "The Horde has gone soft. We were feared, once.", next = "pol_oldways_said", fx = { align = { light = -1, order = 1 }, opinion = { old_ways = "the_horde_has_gone_soft" } } },
        { text = "What do the old ones say about the Warchief?", next = "pol_oldways_thrall" },
      },
    },
    pol_oldways_thrall = {
      lines = {
        { id = "powt_default", text = "That he's Durotan's son, raised by humans, and a stranger to the old blood. Then they watch him fight, and he fights like a Frostwolf, and they stop saying it for a while." },
      },
      choices = {
        { text = "Back to the old ways, then.", next = "pol_oldways" },
        { text = "Something else.", next = "pol" },
      },
    },
    pol_oldways_said = {
      lines = {
        { id = "pows_default", text = "The old ones will argue it until they're ash, and then their sons will take it up." },
        { id = "pows_never", when = { opinion = { topic = "old_ways", stance = "never_again" } }, text = "Good. I've seen what Mannoroth's blood left of the old orcs who drank it, and I'd sooner be weaker and free." },
        { id = "pows_soft", when = { opinion = { topic = "old_ways", stance = "the_horde_has_gone_soft" } }, text = "You'll find friends for that talk in some of the clans. Only remember what the price was, because nobody who paid it would pay it again." },
      },
      choices = {
        { text = "What else do the grunts argue about?", next = "pol" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "A guard hears the road's business whether he wants it or not. Ask about any of this." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've earned some respect around here, so I'll tell you what the grunts are saying." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask your questions quickly, since I've a post to watch and I don't like your look." },
    },
    _none = { { id = "t_none", text = "Ask someone who gives orders." } },
  },
}

---------------------------------------------------------------------------
-- Capital guards. Directions, pride in their city, and an eye on you.
---------------------------------------------------------------------------
P:Pool {
  id = "guard_stormwind", role = "guard", community = "stormwind",
  barks = {
    { id = "b_bridge", text = "Mind the canals; we fish someone out every week." },
  },
  greetings = {
    { id = "g_city", text = "Welcome to Stormwind. Keep your blade sheathed inside the walls." },
    { id = "g_lost", when = { timesTalked = { max = 1 } }, text = "Lost? Everyone's lost their first week, so ask me anything." },
    { id = "g_hero", when = { townStanding = { town = "stormwind", min = 55 } }, text = "It's an honor to have you in the city, really, and I'm not just saying that." },
    { id = "g_distrust", when = { townStanding = { town = "stormwind", max = -20 } }, text = "The Watch knows your face, so behave yourself." },
    { id = "g_away", when = { away = 7 }, text = "Back in Stormwind after {away}? Keep your blade sheathed, same as before." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word at the barracks is that you were caught lying to someone in the city. The Watch takes note of that sort of thing." },
    { id = "g_word_help", when = { word = "helped" }, text = "I had it from {source} that you've done the city a good turn. The Watch is glad of you, {g:sir|ma'am}." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You can't walk the Trade District like that. Well, you can, but people will talk." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Looking like that, you'll set the canal folk screaming. Cathedral business, I'll assume, so move along gently." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You smell like the Slaughtered Lamb's cellar. The Watch knows what goes on down there, and we know who goes in." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks behind you, not beside the children, and nowhere near the Cathedral steps." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know the Old Town walk when I see it. SI:7 would like you, and the Stockade would like you more." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Druid, there's a rule about bears in the Trade District, and I've just made it." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Darnassus is a long way off. If you miss the trees, the Park's out past the Mage Quarter; it's not much, but the squirrels are friendly." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Gnomeregan folk are welcome by the King's own order. Just keep the explosions down to a reasonable number." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You'll be one of the Skyborne. The court says your people are friends of Stormwind now, so you'll get no trouble from the Watch, only stares." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Stealth inside the city walls? Show yourself, or I call the Watch." },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Light preserve us! Oh, you're one of the Cathedral's lot. Carry on, then, but go gently; you'll frighten the canal folk." },
  },
  lines = {
    { id = "l_default", text = "Trade District for shops, Cathedral Square for the Light, Old Town for trouble. The Keep's up the hill, and they won't let you in to see the Highlord without good reason." },
    { id = "l_rebuilt", text = "Masons rebuilt every stone you're standing on after the orcs burned it. Spare a thought for them, if you ever see one." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "The barracks are in Old Town if you need training, and the Pig and Whistle is next door if you need forgetting." },
    { id = "l_mage", when = { class = "MAGE" }, text = "The Mage Quarter's west, past the canals. Follow the smell of singed hair and you can't miss it." },
    { id = "l_paladin", when = { class = "PALADIN" }, text = "Cathedral Square's where the Silver Hand gathers. Say a word for the Watch while you're up there; we could use it." },
    { id = "l_king", text = "The young King Anduin holds court in the Keep, with Lady Prestor at his ear and the Highlord over the army. Above my post, all of it, so I just keep the streets tidy." },
  },
  choices = { { text = "Thanks for the directions.", next = "END" } },
  topics = {
    bolvar = { { id = "w_bolvar", text = "The Highlord commands the city in the king's absence, and the watch answers to him. He's a good man and a better soldier, and I'd follow him anywhere." } },
    varian = { { id = "w_varian", text = "His Majesty's absence is not a matter for the street, citizen. If you've information, take it to the Keep; if you haven't, move along." } },
    prestor = { { id = "w_prestor", text = "Lady Prestor is a guest of the court, and the court has its own guards. I'd mind my tongue if I were you." } },
    the_stockade = { { id = "w_the_stockade", text = "The Stockade's by the canals, full of Defias and worse, and the prisoners have been restless lately. If you hear the bells ring from that way, keep clear." } },
    knows = {
      { id = "t_kn1", text = "The Watch hears everything in this city eventually, usually at the worst hour. Here's what I'm free to tell you." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done right by Stormwind, so I'll tell you what we say in the barracks as well." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The Watch will answer your questions, and the Watch will also be writing down your name." },
    },
    defias = { { id = "t_defias", text = "Out in Westfall, mostly. Don't say that name loudly in Old Town." } },
    _none = { { id = "t_none", text = "Couldn't say. The Watch doesn't pay me to know everything." } },
  },
}

P:Pool {
  id = "guard_ironforge", role = "guard", community = "ironforge",
  greetings = {
    { id = "g_forge", text = "Ye're under the mountain now. Warm enough for ye, eh?" },
    { id = "g_elf", when = { race = { "NightElf", "Skyborne" } }, text = "An elf, in Ironforge! Well, it's a big mountain, so mind the heat." },
    { id = "g_away", when = { away = 7 }, text = "Ye've been gone {away}, an' the mountain's still standin'. Warm yerself, then." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Word at the barracks is ye've been leanin' on folk in the Commons. Ye'll no' do that under this mountain while I'm on watch." },
  },
  notice = {
    { id = "n_xcampwatch", cat = "origin", when = { origin = "gnome_kharanos_watch" },
      text = "Ye held the line at the refugee camps by Kharanos, did ye no'? The lads on the gate still talk about the gnome wi' a shield bigger than the one holdin' it." },
    { id = "n_xthrallspy", cat = "origin", when = { origin = "dwarf_searing_gorge_spy" },
      text = "Ye're one o' the lads the king sent intae the Dark Iron camps in the Searing Gorge. The Captain says ye came back thinner an' quieter, an' he says it like it's a medal." },
    { id = "n_dwarf_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf shaman! My granddad would've had words, but I've no words; just mind the Great Forge doesn't talk back to ye." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Tinker Town's down the way, and every gnome in it is still looking for a way home. I hope ye find it, I do, an' I hope they air the place out first." },
    { id = "n_dwarf_paladin", cat = "class", when = { race = "Dwarf", class = "PALADIN" },
      text = "Silver Hand, is it? The Mystic Ward's where ye'll find yer teachers, past the priests and their candles." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ye reek o' brimstone. Yer lot gather in the Forlorn Cavern, and the guard keeps a close eye on that hole." },
    { id = "n_hunter", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A mountaineer's rifle, I see. The hunters train in the Hall of Arms, and they'll want a look at it." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear, in Ironforge! Change back afore someone takes ye for supper." },
    { id = "n_gnome_mage", cat = "class", when = { race = "Gnome", class = "MAGE" },
      text = "A gnome mage. Yer teachers are in the Hall of Mysteries, what's left o' them after Gnomeregan." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about under the mountain? Out wi' ye, where I can see." } },
  lines = {
    { id = "l_default", text = "Great Forge in the middle, King Magni up in the throne room, the tram to Stormwind down the Tinker Town way. Ye'll not get lost, it's a circle." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Hall of Arms for the fightin' trades, through the Military Ward. Ye'll hear it afore ye find it." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "Keep yer hands where the mountain can see them. We've a long memory under here, and short tempers." },
    { id = "l_magni", text = "King Magni holds court in the High Seat, an' he's a fair king if ye bring him an honest matter. Bring him a dishonest one an' ye'll learn how loud a throne room echoes." },
    { id = "l_dark_iron", text = "If ye see a Dark Iron anywhere near the gates, ye shout, an' ye shout loud. We've not forgotten what Thaurissan's lot did to this mountain." },
  },
  choices = { { text = "Thanks.", next = "END" } },
  topics = {
    magni = { { id = "w_magni", text = "King Magni holds court in the High Seat, an' he's the finest king this mountain's ever had. Show some respect when ye go in, an' take yer hat off before the throne." } },
    wildhammer = { { id = "w_wildhammer", text = "Our cousins from the Hinterlands come through now an' then on their gryphons, an' they cause a fair bit o' trouble in the taverns. Still, they're kin, an' we let 'em be." } },
    second_war = { { id = "w_second_war", text = "The gates o' Ironforge held through the Second War, an' they'll hold through the next one too. Ye've my word on that, as a guard o' this mountain." } },
    knows = {
      { id = "t_kn1", text = "Under the mountain, news echoes, so ye hear it whether ye want to or no. Here's what's been bouncin' off the walls." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Ye've been good to the mountain, so pull up a stool, an' I'll tell ye the lot." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell ye what I must, an' then ye can be on yer way." },
    },
    _none = { { id = "t_none", text = "Never heard of it. Ask at the Explorers' Hall, they know everything and tell ye twice." } },
  },
}

---------------------------------------------------------------------------
-- Sentinel tree (0.78.0): night elf guards in Darnassus and the Kalimdor towns the
-- Sentinels hold. sentinelTree() returns a fresh copy for each pool, because indexing
-- stamps every line with its pool's id. Community pools outrank guard_alliance, so this
-- tree replaces the human-sounding watch tree for these guards only.
---------------------------------------------------------------------------
local function sentinelTree()
  return {
    hello = {
      lines = {
        { id = "h_default", text = "Ishnu-alah, traveller. The Sentinels keep this place, and while I stand here, nothing passes that I have not seen. What do you need of me?" },
        { id = "h_capital", when = { capital = true }, text = "You stand in Darnassus, beneath the boughs of Teldrassil, and the Sentinels keep her roots and her branches alike. Ask what you must, and walk softly afterwards." },
        { id = "h_teldrassil", when = { zone = "Teldrassil" }, text = "Elune's light on you. The roads of Teldrassil are young, and so is the watch along them, but we are not careless. What brings you to me?" },
        { id = "h_darkshore", when = { zone = "Darkshore" }, text = "The sea is loud tonight, as it has been every night since the Sundering. Speak up, traveller, and tell me what you need." },
        { id = "h_ashenvale", when = { zone = "Ashenvale" }, text = "Keep your voice low. There are Warsong scouts in these woods, and they listen as well as we do. What is it?" },
        { id = "h_feralas", when = { zone = "Feralas" }, text = "You came a long way for a stronghold on a rock in the sea. Shandris Feathermoon, who commands here, will be glad of another blade, and so will I. Speak." },
        { id = "h_azshara", when = { zone = "Azshara" }, text = "This land still wears the name of the queen who drowned it, and none of us are glad to stand here. Still, we stand. What do you need?" },
        { id = "h_stonetalon", when = { zone = "Stonetalon Mountains" }, text = "Listen, and you can hear the goblins' saws from here. The mountain is bleeding, traveller, so be quick with your question." },
        { id = "h_kin", when = { race = "NightElf" }, text = "Elune keep you, kin. It is good to see one of our own on the road. What do you need of the watch?" },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The moon is up, which makes this the best hour of the watch. What brings you out under her?" },
        { id = "h_vet", when = { minLevel = 50 }, text = "I have heard your name spoken in the barracks, and not unkindly. The Sentinels remember those who fight beside us. What can I do for you?" },
      },
      again = {
        { id = "a_more", text = "Something more? I can listen and watch at the same time; it is most of what we do." },
        { id = "a_moon", text = "Ask, then. The moon has not moved far since you last spoke." },
      },
      choices = {
        { text = "Who are the Sentinels, exactly?", next = "who" },
        { text = "Something seems to trouble these woods.", next = "trouble" },
        { text = "You don't seem fond of your new allies.", next = "allies" },
        { text = "I grew up under these boughs too.", next = "kin", when = { race = "NightElf" } },
        { text = "Could you teach me to track the way you do?", next = "hunt", when = { class = "HUNTER" } },
        { text = "I scouted for the Sentinels before I took this road.", next = "scout", when = { origin = "nightelf_sentinel_scout" } },
        { text = "I was at Hyjal when the World Tree burned.", next = "hyjal", when = { origin = "nightelf_hyjal_survivor" } },
        { text = "Elune keep you, Sentinel.", next = "END" },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "We are the army of the Kaldorei, sworn to the High Priestess and to Elune. For ten thousand years, while our druids slept in the Emerald Dream, we were the only blades that guarded these forests." },
        { id = "wh_human", when = { race = "Human" }, text = "We are the Kaldorei's army, sworn to Tyrande Whisperwind and to Elune. We kept watch over these forests for ten thousand years, long before your first king laid his first stone, and we did it alone." },
      },
      choices = {
        { text = "Ten thousand years? How long have you stood watch?", next = "vigil" },
        { text = "Why are the Sentinels almost all women?", next = "women" },
        { text = "Who commands you?", next = "command" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vigil = {
      big = true,
      lines = {
        { id = "vg_default", text = "Longer than I care to count aloud. I have walked the same patrol through so many winters that the trees along it know my step. Tell me, traveller, could you keep a watch like that with no one to thank you for it?" },
      },
      choices = {
        { text = "A vow is a vow, however long it runs.", next = "vigil_after", fx = { align = { honor = 1 }, trait = { stern = 1 }, affinity = 1 } },
        { text = "No vow is worth ten thousand thankless years.", next = "vigil_after", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "You must have thought of leaving, once.", next = "vigil_leave" },
      },
    },
    vigil_after = {
      lines = {
        { id = "va_default", text = "Perhaps you are right. Most nights I do not ask whether it was worth it, because the forest is still here, and that is the only answer I have ever been given." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    vigil_leave = {
      lines = {
        { id = "vl_default", text = "Once. A long time ago, I lost a friend to the satyrs and stood at her barrow wondering why I should hold a line no one remembered drawing. Then the High Priestess walked the patrol with me for a night, and said nothing at all, and in the morning I picked up my glaive." },
      },
      choices = {
        { text = "She sounds like a good commander.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    women = {
      lines = {
        { id = "wo_default", text = "Because our men were druids, and the druids slept. When they went into the Dream, someone had to stay awake and hold a glaive, and so it fell to the sisters. A few men walk with us now, and we tease them without mercy, but they hold the line as well as anyone." },
        { id = "wo_nelfman", when = { race = "NightElf", gender = "male" }, text = "You ask that as if you have not been asked it yourself. Our men went into the Dream, and the watch fell to the sisters. Now the Dream gives a few of you back, and some of you even pick up a blade; we tease them, but we are glad of them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    command = {
      lines = {
        { id = "cm_default", text = "Tyrande Whisperwind, High Priestess of Elune, and beneath her General Shandris Feathermoon, who would be a legend among your people if she ever sat still long enough to be sung about. The druids answer to Archdruid Staghelm, and that is a separate matter." },
      },
      choices = {
        { text = "I didn't know the druids were a separate matter.", next = "staghelm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    staghelm = {
      lines = {
        { id = "sg_default", text = "The Archdruid speaks for the Circle, and the High Priestess speaks for the temple and the watch. They agree more often than the gossips in Darnassus would like. When they do not, we Sentinels keep our mouths shut and our glaives sharp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "Satyrs in the old places, furbolgs gone mad in their dens and harpies on the cliffs. Every forest we have ever loved has something rotten growing in it now, and it takes more of us each year to cut it back." },
        { id = "tr_capital", when = { capital = true }, text = "Inside the city, very little; a pickpocket from Stormwind now and then, and dwarves who mistake the moonwells for washbasins. Out on the tree it is the Gnarlpine, who were our friends once, and now they bare their teeth at us." },
        { id = "tr_teldrassil", when = { zone = "Teldrassil" }, text = "The Gnarlpine furbolgs were our friends once, and now they bite. The timberlings are sickly, and some of the beasts on the tree fight like they have forgotten what fear is. Something on Teldrassil has gone wrong, and we cannot find the root of it." },
        { id = "tr_darkshore", when = { zone = "Darkshore" }, text = "The Blackwood furbolgs have turned savage, the murlocs grow bolder every tide, and the sea keeps taking more of the coast. Ameth'Aran is full of restless dead now. Darkshore is dying slowly, and Auberdine is all that keeps it company." },
        { id = "tr_ashenvale", when = { zone = "Ashenvale" }, text = "The Warsong orcs cut our trees for timber and call it the Horde's right. Satyrs breed in the south, and the Foulweald have gone the way of every other furbolg tribe. If you see smoke in the trees, do not go to it alone." },
        { id = "tr_feralas", when = { zone = "Feralas" }, text = "Ogres in the Gordunni hills, Grimtotem in the north and Horde at Camp Mojache, close enough to smell their cooking. We hold Feathermoon because the sea keeps them off us, and because Shandris will not give up a stone of it." },
        { id = "tr_azshara", when = { zone = "Azshara" }, text = "Satyrs, and the ghosts of the Highborne who made them. The Horde has a camp at Valormok and wants the ruins for whatever they can sell. Do not go into the old palaces alone; some of them still remember their queen." },
        { id = "tr_stonetalon", when = { zone = "Stonetalon Mountains" }, text = "The Venture Company is stripping the mountain to the bone, and their machines burn whatever they cannot cut. The Charred Vale was green once. We cannot hold back an army of goblins with a handful of glaives, but we try." },
      },
      choices = {
        { text = "And the Horde?", next = "horde" },
        { text = "Then I'll cut some of it back for you.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      big = true,
      lines = {
        { id = "hd_default", text = "The orc who slew Cenarius is dead, and his clan still cuts our forests to warm their halls. Some of the priestesses say Thrall's Horde is not the old one, and we should talk. Some of us remember Cenarius. What do you say?" },
      },
      choices = {
        { text = "Talk first. Thrall's Horde isn't the one that served the demons, and they should hear it.", next = "horde_after", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Arrows are the only treaty the Warsong will honour.", next = "horde_after", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "What would you do, if it were yours to decide?", next = "horde_her" },
      },
    },
    horde_after = {
      lines = {
        { id = "ha_default", text = "Then you have more of an answer than the council does. I will tell you this much: the next time a Warsong axe bites into an ancient, the Sentinel standing beside it will not be waiting for the council to finish talking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_her = {
      lines = {
        { id = "hh_default", text = "If it were mine? I would let them have the dead wood and the fallen trees, and put an arrow in any orc who touched a living one. That is not peace, but it is a line, and I have always been good at holding lines." },
      },
      choices = {
        { text = "That sounds like a line worth holding.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    allies = {
      lines = {
        { id = "al_default", text = "We needed them at Hyjal, and we will need them again, and none of us enjoys needing anyone. The young races are loud and brief and build everything out of stone. They also stood with us when the Legion came, and I have not forgotten it." },
        { id = "al_human", when = { race = "Human" }, text = "Your people are loud and brief, and they build everything out of stone, which the trees do not like. But Jaina Proudmoore's people stood with us at Hyjal when it would have been easier to run, and we have not forgotten it." },
        { id = "al_dwarf", when = { race = "Dwarf" }, text = "Your Explorers' League digs in our ruins on the Darkshore coast and calls it scholarship. We call it something else. Still, your people fight like the mountain itself took offence, and I would rather have you beside me than across from me." },
        { id = "al_gnome", when = { race = "Gnome" }, text = "Your machines smell of oil and burning, and the dryads complain of the noise whenever one of your people visits. I am told you lost your city. I am sorry for it; we have lost a few ourselves, and it does not get easier." },
        { id = "al_kin", when = { race = "NightElf" }, text = "You know my mind already, because it is the mind of every one of us. We needed them, we still need them, and we have not yet learned how to be gracious about it." },
      },
      choices = {
        { text = "I wonder whether they'll keep faith with you.", next = "faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      big = true,
      lines = {
        { id = "fa_default", text = "That is the question the priestesses argue over in the temple. The young races live so briefly that a promise made by the grandfather is a story to the grandson. Tell me plainly, traveller: will they keep faith with us once they no longer need us?" },
      },
      choices = {
        { text = "They will. We gave our word, and we keep it.", next = "faith_after", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Only for as long as it suits them.", next = "faith_after", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "Will your people keep faith with them?", next = "faith_us" },
      },
    },
    faith_after = {
      lines = {
        { id = "fa2_default", text = "We shall see. I have time to watch, at least, and I will remember which of you were right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    faith_us = {
      lines = {
        { id = "fu_default", text = "That is a sharper question than most visitors ask. We keep our word for ten thousand years, but we also remember a slight for that long, and the young races give us plenty of slights to remember. Ask me again in a century." },
      },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "kn_default", text = "Then you know what this place was before, and what it cost us to come here. Some nights I wake and reach for the smell of Nordrassil's bark, and it is not there. Do you feel it too, the difference in this tree?" },
      },
      choices = {
        { text = "Something about Teldrassil feels wrong to me.", next = "tree" },
        { text = "I don't feel it. Teldrassil is our home now.", next = "tree_home" },
        { text = "I'd serve beside you one day, if you'd have me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tree = {
      big = true,
      lines = {
        { id = "tre_default", text = "Hush; say that softly in Darnassus. The Archdruid grew her without the blessing of the Aspects, and he says she will grow strong regardless. The priestesses say nothing at all, which troubles me more. What do you think?" },
      },
      choices = {
        { text = "The Archdruid knows the land. We should trust him.", next = "tree_after", fx = { align = { order = 1 } } },
        { text = "Staghelm grew her out of pride, not wisdom.", next = "tree_after", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
        { text = "What does the High Priestess say?", next = "tree_tyrande" },
      },
    },
    tree_after = {
      lines = {
        { id = "ta_default", text = "Then you have said it, and I have heard it, and neither of us will repeat it to the Cenarion Enclave. The tree holds us up whatever we think of her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tree_tyrande = {
      lines = {
        { id = "tt_default", text = "The High Priestess says that Elune watches over all of us, the tree included. I have served her long enough to know when she is choosing her words carefully, and those words were very carefully chosen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tree_home = {
      lines = {
        { id = "th_default", text = "Then I envy you. Perhaps it is only the old ones like me who cannot let Hyjal go. Keep your eyes on the young ones, kin; they deserve a home that does not feel borrowed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "Watch the ground, not the trees. Bent grass, a print half in the moss, a stone turned wet side up: the forest tells you who passed if you are patient enough to listen. Your companion will learn it faster than you do, and you should let it." },
        { id = "hu_dwarf", when = { race = "Dwarf" }, text = "With those boots? Forgive me. Watch the ground, not the trees: bent grass, a print half in the moss, a stone turned wet side up. And tread softer, or every beast in the forest will be tracking you." },
      },
      choices = {
        { text = "Thank you. I'll practise.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scout = {
      lines = {
        { id = "sc_default", text = "Did you? Then you will remember the cold camps and the long silences, and the way a patrol learns to talk with its hands. Why did you leave us?" },
      },
      choices = {
        { text = "I wanted to see the world beyond our forests.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "The world needs blades more than the watch does.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'd rather not speak of it.", next = "BACK" },
      },
    },
    hyjal = {
      lines = {
        { id = "hy_default", text = "Then we have both seen the worst night of the world, and survived it. I was on the slopes when the wisps came down. I still see that light when I close my eyes, and I am not sure I would give it back." },
      },
      choices = {
        { text = "Nor would I. We won that night.", next = "BACK", fx = { affinity = 2 } },
        { text = "I would. It cost Nordrassil.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  }
end

P:Pool {
  id = "guard_darnassus", role = "guard", community = "darnassus",
  greetings = {
    { id = "g_elune", text = "Elune's light on you, stranger." },
    { id = "g_short", when = { race = { "Dwarf", "Gnome" } }, text = "Welcome. The branches are wide, and you won't fall." },
    { id = "g_away", when = { away = 7 }, text = "You have been away {away}. The Sentinels noted your going, and now they note your return." },
    { id = "g_word_trick", when = { word = "deceived" }, text = "There is talk among the Sentinels that you deceived someone in the city. We will be watching, as we always are." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Elves from the sky, and forgive me for staring; a Sentinel is allowed to be curious once a century." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Walk in your own shape among the trees, druid. The young ones find it unsettling." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Sheathe your arcane arts beneath our branches, stranger. The Highborne's hunger for that power drowned a continent, and the Sentinels have not forgotten." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Fel, in Darnassus? Step with care; the Sentinels have killed demons before, and they will not ask whose leash it wears." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "That creature is not welcome under Teldrassil's boughs. Send it away, or I will." },
    { id = "n_druid", cat = "class", when = { race = "NightElf", class = "DRUID" },
      text = "The Cenarion Enclave lies to the east, druid. The archdruid will want to see how you have grown." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Mind the bridges in that shape. They were grown for lighter feet." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "The Light is not Elune, paladin, but the priestesses will make you welcome at the Temple all the same." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The Sentinels own every dark corner in this city. Step out where I can see you." } },
  lines = {
    { id = "l_default", text = "The Temple of the Moon for the priestesses, the Cenarion Enclave for the druids. Walk softly; this tree is young." },
    { id = "l_warrior", when = { race = "NightElf", class = "WARRIOR" }, text = "Our warriors train on the Warrior's Terrace. The Sentinels will want to measure you, so be ready." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Hunters gather at the Cenarion Enclave with the druids. Keep your companion close on the bridges." },
    { id = "l_tree", text = "Teldrassil is young yet, and the Sentinels guard her the way you would guard a sapling in a storm. Walk gently on her branches, and she will hold you." },
    { id = "l_tyrande", text = "The High Priestess keeps the Temple of the Moon, and her word is law beneath these boughs. If you seek an audience, the priestesses will tell you whether you may have one." },
  },
  choices = { { text = "Thank you, Sentinel.", next = "END" } },
  tier = "service",
  start = "hello",
  nodes = sentinelTree(),
  topics = {
    tyrande = { { id = "w_tyrande", text = "The High Priestess holds court in the Temple of the Moon, and the Sentinels answer to her. Show her the respect she's due, or the Sentinels will show you the way out." } },
    elune = { { id = "w_elune", text = "Elune watches over this city, and the Sentinels watch over it for her. Walk softly in her temple, and do not raise your voice." } },
    nordrassil = { { id = "w_nordrassil", text = "Teldrassil is our home now, though the World Tree still stands on Hyjal. We gave up much to save it, and we'd do it again." } },
    knows = {
      { id = "t_kn1", text = "The Sentinels watch, and what we watch, we remember. I may tell you of these things." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Elune has smiled on you, I think, and so I will speak more freely than I would to others." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will answer, as a Sentinel must, but my trust is not so easily given." },
    },
    _none = { { id = "t_none", text = "The Sentinels do not speak of what they do not know." } },
  },
}

-- The Sentinel tree for the other towns the Sentinels hold (0.78.0). Lines, greetings and
-- notices stay in each zone pack's own guard pool; these only carry the conversation.
for _, town in ipairs({ "dolanaar", "auberdine", "astranaar", "maestras_post", "feathermoon", "stonetalon_peak", "talrendis_point" }) do
  P:Pool {
    id = "sentinel_tree_" .. town, role = "guard", community = town,
    tier = "service",
    start = "hello",
    nodes = sentinelTree(),
  }
end

P:Pool {
  id = "guard_orgrimmar", role = "guard", community = "orgrimmar",
  greetings = {
    { id = "g_xbdef", when = { origin = "orc_blade_defector" }, text = "I know that face, and the Burning Blade mark you used to wear with it. The Warchief says you walked away from them, so walk on, but I'll be watching where you go." },
    { id = "g_strength", text = "Lok'tar. You're in Orgrimmar now, so act like it." },
    { id = "g_mage", when = { race = "Orc", class = "MAGE" }, text = "An orc with a staff and no axe? Don't set the Drag on fire." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and Orgrimmar still stands, as it will while there's blood in the Horde. Walk in proud, like you never left." },
    { id = "g_word_help", when = { word = "helped" }, text = "I had it from {source} that you've done the city a service. Lok'tar; walk proud in the Valley of Strength." },
  },
  notice = {
    { id = "n_xvmage", cat = "origin", when = { origin = "troll_valley_of_spirits_mage" },
      text = "Another one up from the Valley of Spirits, smelling of smoke. The trolls down there study things the rest of us walk past quickly, so don't set fire to my gate." },
    { id = "n_xtsham", cat = "origin", when = { origin = "troll_orgrimmar_shaman" },
      text = "A Darkspear learning at our shamans' fires. Thrall's own teachers walk the Valley of Wisdom, and if they've taken you in, you'll get no trouble from me." },
    { id = "n_xraptor", cat = "origin", when = { origin = "troll_raptor_rider" },
      text = "A raptor rider from Sen'jin, are you? The last one who came through the Valley of Strength let her beast eat half a butcher's stall, so keep yours on a short lead." },
    { id = "n_xrevan", cat = "origin", when = { origin = "troll_revantusk_envoy" },
      text = "Revantusk, by your markings. Your people hold the Hinterlands coast for the Horde, and the Warchief speaks well of them, so you're welcome at this gate." },
    { id = "n_xvstud", cat = "origin", when = { origin = "orc_valley_of_spirits_student" },
      text = "An orc who learns magic from the trolls in the Valley of Spirits. My captain says to check your kind for a green glow, so hold still and let me look at your eyes." },
    { id = "n_xdrag", cat = "origin", when = { origin = "orc_drag_runner" },
      text = "I remember you running knives through the Drag before you'd grown a proper tusk. Whatever business you're about these days, keep it off my watch." },
    { id = "n_xdoom", cat = "origin", when = { origin = "orc_doomhammer_veteran" },
      text = "You stood at Lordaeron's walls under Doomhammer, I'd wager, by the way you carry yourself. My father was there too, and he never lifted his axe again after the camps, so swing yours for him." },
    { id = "n_orc_mage", cat = "class", when = { race = "Orc", class = "MAGE" },
      text = "My grandfather would spit to see an orc mage, but my grandfather's dead. Learn it well, and use it for the Horde." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Your kind gather in the Cleft of Shadow, and the Warchief tolerates it. I would not, if this were my city." },
    { id = "n_shaman", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "Shaman. Thrall's own teachers walked the Valley of Wisdom, so go and honour them." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "Ghost wolf at the gate! Walk on your own feet in the Warchief's city, shaman." },
    { id = "n_troll_hunter", cat = "class", when = { race = "Troll", class = "HUNTER" },
      text = "A Darkspear hunter. Your people tamed the raptors of the islands and kept most of their fingers, which impresses me more than I'll say." },
    { id = "n_tauren_druid", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "A tauren druid, a long way from the bluffs. Your claws are welcome here, but keep them off the wolves." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Sky-elf. You came to the Horde through the Earthen Ring, and Thrall trusts the Ring, so the gate's open to you." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Skulking in the Warchief's city? Show yourself." } },
  lines = {
    { id = "l_default", text = "The Valley of Strength lies by the gate, the Drag holds anything crooked, and Grommash Hold belongs to the Warchief. Go there with a deed to report, not with idle talk." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Warriors train in the Valley of Honor, where blood is spilled and nobody weeps over it. The weak train somewhere else, I'm told, but I've never found where." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "Rogues gather in the Cleft of Shadow with the other things that crawl. Don't make me come down there to find you." },
    { id = "l_thrall", text = "The Warchief built this city with his own people's hands, and named it for the Warchief who came before him. Remember that when you walk under these gates." },
    { id = "l_burning", text = "Burning Blade cultists crawl about the Cleft and the canyons when they think no one is looking. If you see one, you won't need to ask us twice." },
  },
  choices = { { text = "Lok'tar.", next = "END" } },
  topics = {
    thrall = { { id = "w_thrall", text = "The Warchief holds Grommash Hold, at the heart of the city, and he'll see you if your business is worth his time. Don't waste it, or you'll answer to me." } },
    voljin = { { id = "w_voljin", text = "Vol'jin is the Darkspear chieftain, and his trolls hold the Valley of Spirits. He's the Warchief's friend, and that makes him ours." } },
    internment = { { id = "w_internment", text = "Every orc on this wall remembers the camps, or remembers someone who does. We built Orgrimmar so we'd never see one again." } },
    knows = {
      { id = "t_kn1", text = "The gate hears everything that comes in from the Barrens, and plenty that crawls up out of the Drag. Here's what I know of it." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've bled for the Horde, so I'll tell you what the grunts don't say in front of the officers." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you because the Warchief says we answer, so make it worth my time." },
    },
    _none = { { id = "t_none", text = "That's not a guard's business. Find a shaman in the Valley of Wisdom, because the spirits talk more than I do." } },
  },
}

P:Pool {
  id = "guard_thunderbluff", role = "guard", community = "thunder_bluff",
  greetings = {
    { id = "g_winds", text = "Walk with the Earth Mother. The lifts will take you down when you're done." },
    { id = "g_xghost", when = { origin = "tauren_ghost_walker_scout" }, text = "You scouted out of Ghost Walker Post, the braves say. Desolace makes hard hunters, so the bluffs must seem very quiet to you after the centaur." },
    { id = "g_away", when = { away = 7 }, text = "You have been away {away}, and the grass below has grown and been grazed again. The bluffs are as they were, and the Earth Mother kept your place." },
    { id = "g_word_angry", when = { word = "angered" }, text = "The braves say you angered someone on the bluffs. Settle it peaceably, traveler, because we settle things no other way here." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Your Windshapers keep their camp below us now, at Gev'rek, and you are welcome on the bluffs. Mind the edges anyway." },
    { id = "n_druid", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "Elder Rise is where the druids gather, under Hamuul's eye. Go gently; the elders there notice everything." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Spirit Rise keeps the shamans. Climb it slowly, because the spirits there are old and do not like to be hurried." },
    { id = "n_hunter", cat = "class", when = { race = "Tauren", class = "HUNTER" },
      text = "Hunter Rise is above the lifts. The hunters there will judge your companion before they judge you." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, on the bluffs. Your apothecaries keep to the Pools of Vision beneath Spirit Rise, if you are looking for your own." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, be welcome. Watch yourself on the lifts; your people always lean out to look." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear on the bridges! The kodo will not like it, and neither will the bridges." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks behind you on the bluffs, warlock, and it does not touch the totems." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hiding on the bluffs? There is nowhere to fall but down, so come out." } },
  lines = {
    { id = "l_default", text = "The rises stand together like old bulls in a herd, and the bridges run between them. Mind the edges, for the wind does not ask permission." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "The Earth Mother does not love the fel. Do your work below the bluffs, if you must do it at all." },
    { id = "l_cairne", text = "High Chieftain Cairne keeps his lodge on the central rise, and his door is open to any who come in peace. That is the tauren way, and it is his way most of all." },
    { id = "l_grimtotem", text = "The Grimtotem walk among us on the bluffs, and they smile, but their eyes do not. If one of them troubles you, come to a Bluffwatcher and not to your weapon." },
  },
  choices = { { text = "Thank you.", next = "END" } },
  topics = {
    cairne = { { id = "w_cairne", text = "The High Chieftain holds council in the great tent on the central rise. If your business is with him, go humbly, and he'll hear you out." } },
    earth_mother = { { id = "w_earth_mother", text = "The Earth Mother's eyes watch over these bluffs, and the braves who guard them do it in her name. Be welcome here, so long as you honour her." } },
    centaur = { { id = "w_centaur", text = "The centaur drove us from our lands, and we came here to be safe from them. The bluffs are high, and the centaur can't climb them." } },
    knows = {
      { id = "t_kn1", text = "The wind carries word up the bluffs, and the Bluffwatchers hear it first. These things I can speak of." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You walk gently among our people, so I will share what the elders have let us hear." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will answer, but my patience is shorter than the lift ropes, so choose well." },
    },
    _none = { { id = "t_none", text = "The Earth Mother keeps that to herself, and so must I." } },
  },
}

P:Pool {
  id = "guard_undercity", role = "guard", community = "undercity",
  greetings = {
    { id = "g_dark", text = "Welcome to the Undercity, where the Dark Lady's will is the only law. Keep to the paths and don't touch the green, unless you'd like to join us sooner than you planned." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, which is nothing at all to the dead. The Deathguard noticed all the same, as they notice everything." },
    { id = "g_xarchive", when = { origin = "forsaken_stratholme_archivist" }, text = "The Stratholme scholar, they say in the barracks. Don't ask the Deathguard about that city; some of them died there in the Culling, and they won't talk about it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word in the barracks is that a lie of yours was seen through. The Dark Lady's servants keep track of such things." },
  },
  notice = {
    { id = "n_xcutpurse", cat = "origin", when = { origin = "forsaken_capital_cutpurse" },
      text = "Your hands keep drifting toward other people's belts. I'd heard some of the old capital's cutpurses came back with the rest of us, and now I know what one looks like." },
    { id = "n_paladin", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "One of us, wearing the Light like a coat. I don't know whether to salute or step back." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "Breathing, in here? You'll get used to the smell before you get used to the stares." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "The Magic Quarter's warlocks keep their demons on short chains. You'll do the same, down here." },
    { id = "n_mage", cat = "class", when = { race = "Scourge", class = "MAGE" },
      text = "Most of the Magic Quarter studied in Dalaran before the plague. You'll find them there, still arguing about it." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "The Rogues' Quarter is yours. Don't think we haven't noticed you counting the guards." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tauren. You'll be stooping in the tunnels, so mind the drips; they aren't water." },
    { id = "n_warrior", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "War Quarter for you, soldier. Some of the Deathguard in there wore Lordaeron's colours too, once." },
    { id = "n_beast", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Animals hate this place. Keep yours close; the bats down here have opinions." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Change back, druid. Bears down here make the abominations nervous, and you don't want them nervous." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "We see better in the dark than you think, so out." } },
  lines = {
    { id = "l_default", text = "The Apothecarium, the Magic Quarter, the War Quarter and the Rogues' Quarter, all in a ring around the Trade Quarter. The Banshee Queen keeps the Royal Quarter, and you don't." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "Shamans don't come down here much. The elements are a long way from the Undercity, and they seem to like it that way." },
    { id = "l_lady", text = "The Dark Lady gave us our wills back, and we stand guard so no one takes them again. That's all the reason a Deathguard needs, and a better one than the living ever gave me." },
    { id = "l_scarlet", text = "The Scarlet Crusade would burn this whole city with us in it, and they'd sing hymns while they did. Keep that in mind when the living tell you we're the monsters." },
  },
  choices = { { text = "Understood.", next = "END" } },
  topics = {
    sylvanas = { { id = "w_sylvanas", text = "The Dark Lady holds court in the Royal Quarter, and she does not receive visitors lightly. If you've business with her, you'd better be very sure of it." } },
    forsaken = { { id = "w_forsaken", text = "We are the Forsaken, and this is our city, beneath the ruins of the one we died in. Respect it, or join us more permanently." } },
    scourge = { { id = "w_scourge", text = "The Scourge are our enemy, and our former masters, and some of them are still our kin. We put them down, every one, and we don't look at their faces." } },
    knows = {
      { id = "t_kn1", text = "The dead hear more than the living suspect, and we have nowhere else to be. Here is what has drifted down to us." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done the Dark Lady good service, so I'll tell you what the Deathguard whisper among themselves." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what the Dark Lady permits, and not a syllable that she doesn't." },
    },
    _none = { { id = "t_none", text = "The dead keep secrets, but that one isn't mine to keep." } },
  },
}

---------------------------------------------------------------------------
-- Peons: they work, and they'd rather not.
---------------------------------------------------------------------------
P:Pool {
  id = "peon", role = "peon",
  barks = { { id = "b_work", text = "Work, work." } },
  greetings = { { id = "g_busy", text = "Peon busy, very busy, look how busy!" } },
  lines = { { id = "l_default", text = "Peon chop wood and peon carry wood, but peon not talk about wood." } },
  choices = { { text = "Back to work.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Peon not know, and peon not want to know." } } },
}

---------------------------------------------------------------------------
-- Ratchet Bruisers (0.71.0). Ratchet had no town definition, and community pools match
-- by town, so it is defined here (World loads at login) with the pool that needs it.
---------------------------------------------------------------------------
P:Town {
  id = "ratchet", name = "Ratchet",
  subzones = { "Ratchet" },
  related = { booty_bay = 0.05 },
  tiers = { Hero = "Friend of Gazlowe" },
}

P:Pool {
  id = "guard_ratchet", role = "guard", community = "ratchet",
  barks = {
    { id = "b_boat", text = "Boat's in from Booty Bay, so everybody keep your hands where I can see 'em and your purses where you can, because I don't get paid extra for finding 'em." },
    { id = "b_pirates", text = "Sails on the horizon again, boys, and if they're black, somebody ring the bell, because that's the Southsea pirates comin' callin'." },
  },
  greetings = {
    { id = "g_ratchet", text = "Welcome to Ratchet, pal, Cartel port and neutral ground. You trade here, you pay your fees here, and you do your fighting somewhere that isn't on my shift." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Pirates like the dark, chum, so stay off the beach till sunup if you've got any sense, because I'm not hauling your body back up for free." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Somebody's been rolling around in the Barrens with the quilboar, by the look of you, pal. There's a smith on the docks, but he takes cash, not stories, and so do I." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, sure, half our customers walk down from the Crossroads. In town, though, buddy, you're a customer first and a grunt second, and customers keep their axes on their backs." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, this deep in the Barrens? Brave or lost, pal, and either way you're safe inside the town, so do us both a favour and spend somethin'." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey, I saw that! Sneak all you like, pal, but sneak somewhere that isn't the Cartel's warehouse, because the Cartel bills thieves by the knuckle." } },
  lines = {
    { id = "l_default", text = "Gazlowe built this port out of nothing but sand and nerve, and we keep it neutral for him, because neutral pays. Draw steel in town, pal, and you'll be swimming back to wherever you came from." },
  },
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Weapons stay sheathed, coin stays moving, and everybody goes home happy and a little lighter in the purse. What do you want, pal?" },
        { id = "h_horde", when = { faction = "Horde" }, text = "Down from the Crossroads, are ya? Leave the war on the road outside, pal, because in Ratchet the only thing anybody fights over is the price. What do you need?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Off the boat, or did you really walk through the whole Barrens? Either way, nobody here will touch you while you're spending money, pal, and I'd keep spending if I were you. What do you need?" },
        { id = "h_rep", when = { reputation = { faction = "Ratchet", min = "honored" } }, text = "Hey, the boss likes you, and the boss doesn't like anybody who isn't paying him, so you must be doing somethin' right. What can I do for you, boss?" },
      },
      again = {
        { id = "a_clock", text = "What else? Talk while I watch the water, pal, because I get paid to watch the water." },
        { id = "a_go", text = "Anything else, pal? Make it quick, because the boat's due and every crate on it pays a fee." },
      },
      choices = {
        { text = "What are the rules in this town?", next = "rules" },
        { text = "Who runs Ratchet?", next = "boss" },
        { text = "I'd guess a port like this sees its share of trouble.", next = "trouble" },
        { text = "Where does that boat go?", next = "boat" },
        { text = "Doesn't staying neutral ever bother you?", next = "neutral" },
        { text = "Do the Alliance give you trouble here?", next = "sides", when = { faction = "Horde" } },
        { text = "Do the Horde give you trouble here?", next = "sides", when = { faction = "Alliance" } },
        { text = "Who'd notice a purse or two going missing?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll behave.", next = "END", fx = { standing = { ratchet = 1 } } },
      },
    },
    rules = {
      lines = {
        { id = "ru_default", text = "Nobody fights in town, nobody robs the warehouses, and everybody pays the dock fees. That's it, pal, and you'd be amazed how many folks can't manage all three without gettin' sat on." },
      },
      choices = {
        { text = "And if someone does start something?", next = "rules_fight" },
        { text = "Simple enough.", next = "BACK" },
      },
    },
    rules_fight = {
      lines = {
        { id = "rf_default", text = "Then every bruiser on the docks shows up at once, and we sort out who started it after we've sat on everybody. The Cartel doesn't do trials, pal, it does invoices, and the invoice includes the sitting." },
      },
      choices = {
        { text = "Efficient.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boss = {
      lines = {
        { id = "bo_default", text = "Gazlowe, and he'll tell you himself that he built Orgrimmar for the Warchief, usually before you've said hello. Truth is he's a good boss, loud and cheap and sharper than he looks, and he pays us on time, which is all a bruiser asks." },
      },
      choices = {
        { text = "I can't believe he really built Orgrimmar.", next = "boss_orgrimmar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boss_orgrimmar = {
      lines = {
        { id = "bg_default", text = "He did, or a good chunk of it, back when the orcs first landed and needed walls up fast. He got paid well for it too, pal, so you could say the Horde's been a good customer from the very first invoice." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "The Southsea pirates, mostly, raiding ships off the coast and camping on the beaches south of here like they own the place and owe nobody rent. Then there's the Venture Company sniffing around the Barrens, and they'd buy the whole port out from under us if Gazlowe let 'em." },
      },
      choices = {
        { text = "Why don't you deal with the pirates?", next = "trouble_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_deep = {
      lines = {
        { id = "td_default", text = "Because we're paid to guard the town, pal, not to chase pirates up and down the beach for nothin'. That's what adventurers are for, and Gazlowe's always got work for anybody willing to go." },
      },
      choices = {
        { text = "Maybe I'll pay the beach a visit.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Pirates aren't my problem.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    boat = {
      lines = {
        { id = "bt_default", text = "Across the sea to Booty Bay, another Cartel port, and it's the one thing in the Cartel nobody charges you for, so enjoy it, pal. Hang onto the rail, though, because the captain doesn't stop for anybody who falls off." },
      },
      choices = {
        { text = "I've heard Booty Bay is a lot like Ratchet.", next = "boat_bay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat_bay = {
      lines = {
        { id = "bb_default", text = "Like Ratchet, only bigger, wetter and full of Bloodsail instead of Southsea. The Baron runs it tight, chum, so the same rules hold there: no fighting in town, and everybody pays." },
      },
      choices = {
        { text = "Sounds like home away from home.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Thanks.", next = "BACK" },
      },
    },
    neutral = {
      big = true,
      lines = {
        { id = "ne_default", text = "Bother me? Pal, the war's the best thing that ever happened to Ratchet, because both sides need boats and both sides need goods. We sell to everybody, we side with nobody, and the gold keeps rollin' in, which is more than you can say for most wars." },
      },
      choices = {
        { text = "Smart thinking. Wars end, but trade never does.", next = "BACK", reply = "Now you're talkin' my language, pal, and if you ever want a share in a boat, you come see me first, because the margins on peace are lousy.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Profiting off a war isn't something to boast about.", next = "BACK", reply = "Boast? Friend, I'm just tellin' you the weather, and if you don't like it you can swim to the next port, though I'll sell you the boat for a fair price.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Has anyone ever tried to take the port?", next = "neutral_take" },
      },
    },
    neutral_take = {
      lines = {
        { id = "nt_default", text = "Not yet, because both sides know the other one would lose its boats the same day, and nobody can afford that. Neutral's the only thing everybody can agree on, pal, and that's what keeps us standing." },
      },
      choices = {
        { text = "Neutral and profitable. Makes sense.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sides = {
      lines = {
        { id = "si_default", text = "Not in town they don't, pal, because we're standing right here and we bill by the bruise." },
        { id = "si_horde", when = { faction = "Horde" }, text = "A few come in off the Booty Bay boat, nervous as cats, and they keep to the docks and pay their fees. Nobody bothers 'em and they don't bother anybody, and that's how Gazlowe likes it, because quiet customers spend more." },
        { id = "si_alliance", when = { faction = "Alliance" }, text = "Horde come down from the Crossroads every day, pal, and they look at you funny, but they won't start anything here. Out on the road past the gate, though, you're on your own, and the Cartel doesn't insure that stretch." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Gazlowe would, pal, because he counts every coin in this town twice before bed. Try the pirates on the beach instead, since they've got plenty of loot and nobody's going to file a complaint." },
      },
      choices = {
        { text = "Just asking.", next = "BACK" },
        { text = "Now that's a good tip.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    ratchet = { { id = "w_ratchet", text = "Ratchet's the Cartel's door on the Barrens, pal, and I'm the guy who keeps it from gettin' kicked in. Everybody's welcome, everybody pays, and nobody fights on the docks." } },
    booty_bay = { { id = "w_booty_bay", text = "The boat to Booty Bay leaves right off the end of the pier, pal, and it won't cost you a copper. Don't start nothin' on board, 'cause the sharks are hungry and the captain's got a long memory." } },
    centaur = { { id = "w_centaur", text = "Centaur raid the caravans comin' in from the Barrens, and then they try to sell the goods back to us. We don't buy, pal, on principle and also 'cause they never got the paperwork." } },
    steamwheedle = { { id = "t_cartel", text = "Same Cartel as Booty Bay, Gadgetzan and Everlook, pal, and Ratchet's the one that keeps the Barrens supplied. Everything that crosses the sea comes through our docks first and pays its toll on the way." } },
    _none = { { id = "t_none", text = "Ask Gazlowe, pal. He knows everything, and he'll tell you whether you asked or not, and then he'll tell you what it cost him." } },
  },
}
