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
      text = "You stand like someone used to a big bird under you, and a bad-tempered one at that. Is it true your Galestriders will let only one rider near them, or did you just never bother to share?" },
    { id = "n_pet_hurt", cat = "pet", when = { pet = { type = "Beast" }, durability = { max = 0.3 } },
      text = "You look like you've been dragged through a briar. Does {pet} look the same under all that fur?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Good animal; let me see the teeth. No? Can't blame you; I wouldn't let me either." },
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
        { text = "Are any of these animals yours?", next = "own" },
        { text = "Is the road hard on animals?", next = "road" },
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
        { id = "cf_pet", when = { pet = { type = "Beast" } }, text = "Look at {pet}'s teeth and you'll know what it wants; flat teeth for greens, sharp ones for meat. Feed it what its teeth ask for, and feed it before it starts sulking." },
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
        { id = "tk_default", text = "Then you know more than most who come through here, and you'll not need me telling you how to hold a leash." },
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
        { text = "Has anyone never come back for theirs?", next = "unclaimed" },
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
        { id = "u_default", text = "Once. A hunter left me a big grey wolf and said a week, maybe two, and I fed that wolf through a whole season while it lay by the gate with its nose to the road. Then one morning the stall was empty and the latch was still shut, and I've never worked out how." },
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
        { text = "A good pen and a good keeper beat starving in the wild.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Nothing wild should be caged, however kind the keeper.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Do the animals ever forgive you for it?", next = "cages_mind" },
        { text = "The Earth Mother made the beasts our kin, not our property.", next = "cages_mind", when = { race = "Tauren" } },
        { text = "Our nightsabers choose whom they follow.", next = "cages_mind", when = { race = "NightElf" } },
      },
    },
    cages_mind = {
      lines = {
        { id = "cm_default", text = "The tame ones never knew there was anything to forgive, and the wild ones only forgive you once they've decided you're theirs. It took that old hound under the trough three winters to decide it about me." },
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
    { id = "g_away", when = { away = 7 }, text = "Back after {away}? Half the listings have changed hands since, so have a look." },
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
        { text = "What would you pack for a long road?", next = "road" },
        { text = "Do you ever feed folk who can't pay?", next = "needy" },
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
        { text = "Nobody should go hungry while there's bread to spare.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Charity's a fine way to go out of business.", next = "BACK", fx = { align = { light = -1 }, trait = { greedy = 1 } } },
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
        { text = "Heard anything interesting over the bar?", next = "gossip" },
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
        { id = "g_alliance", when = { faction = "Alliance" }, text = "The caravan drivers say the king still hasn't come home, and the regent's doing his best, but nobody's buying rounds to his health. Folk are uneasy, and uneasy folk drink." },
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
        { text = "Somebody has to say when, and it may as well be you.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Grown folk can decide for themselves when they've had enough.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "What do people use all this for?", next = "uses" },
        { text = "Where do you get it all?", next = "source" },
        { text = "Do you ask what your customers do with it?", next = "asking" },
        { text = "Do you sell soul shards?", next = "shards", when = { class = "WARLOCK" } },
        { text = "Good day.", next = "END" },
      },
    },
    uses = {
      lines = {
        { id = "u_default", text = "Candles for the priests, powders for the mages, little symbols for the paladins, and seeds and berries for the druids, who could pick their own but never seem to have the time. The rogues want flash powder and vials, and I've stopped asking why." },
        { id = "u_shaman", when = { class = "SHAMAN" }, text = "And ankhs for your sort, of course. I've sold a good many of them to shamans who swore they'd never need one, and every one of them came back for more." },
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
        { id = "a_default", text = "Not often, because the answer's usually either dull or something I'd rather not know. Mind you, when a nervous sort buys three vials of the same thing, I do take a long look at their face." },
      },
      choices = {
        { text = "You ought to know who you're selling to.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "What folk do with it is their own business.", next = "BACK", fx = { align = { order = -1 }, trait = { discreet = 1 } } },
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
  -- still answer to the Light in Forever.
  id = "trainer_paladin", role = "trainer", subtitle = "paladin trainer", tier = "service",
  greetings = {
    { id = "g_light", text = "Be welcome, and be honest. Here to learn?" },
    { id = "g_high", when = { minLevel = 40 }, text = "You've come a long way since your first lesson, when you dropped the hammer on your own foot. Come, there's more to learn." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}, and I trust the Light walked with you. Come, let's see what it taught you." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've come a long way since I last taught you, and it shows in how you stand. Come, there's more to learn." },
  },
  notice = {
    { id = "n_dirty", cat = "gear", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, and the Light shields but does not mend, so visit a smith after this." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "The Light comes to you, and it hurts, doesn't it? I don't understand why it answers, but I've stopped pretending that it doesn't." },
    { id = "n_human", cat = "class", when = { race = "Human", class = "PALADIN" },
      text = "Every human paladin I've taught had that same look, half sure the Light was listening and half afraid that it was. Both halves are right, so keep them." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "PALADIN" },
      text = "You've a dwarf's patience with the hammer and a dwarf's impatience with everything else. The Light seems to like the combination, so I'll not argue with it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Strength without humility is just a heavier sword. Now, what have you come to learn?" },
        { id = "l_dwarf", when = { race = "Dwarf", class = "PALADIN" }, text = "A dwarf of the Light! Stubborn faith is the best kind, so let's begin." },
        { id = "l_young", when = { class = "PALADIN", maxLevel = 20 }, text = "Your hammer arm will learn before your heart does, and that's the wrong way round. Pray before you train, not after." },
        { id = "l_veteran", when = { class = "PALADIN", minLevel = 45 }, text = "You wear the Light now like an old coat you've stopped noticing. That's either grace or exhaustion, so tell me which." },
        { id = "l_other", when = { ["not"] = { class = "PALADIN" } }, text = "You're not of the order, but you're welcome all the same. The Light judges what you do, not what you were trained to do." },
      },
      again = {
        { id = "a_again", text = "Is there more on your mind, or shall we get back to the hammer?" },
        { id = "a_again2", text = "Speak plainly; I have the time." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What should I be practising?", next = "practise", when = { class = "PALADIN" } },
        { text = "Mercy or judgement: which does the Light ask of us?", next = "mercy", when = { class = "PALADIN", minLevel = 10 } },
        { text = "Do you ever doubt the Light?", next = "doubt" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Your blessings, and on other people. A paladin who keeps every blessing for their own skin is only a warrior who prays." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn to heal in armour with a hammer still in your hand. Nobody will ever give you a quiet moment to set it down." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn when to step forward and take the blow meant for someone softer. The Light gave you that armour for exactly that." },
      },
      choices = {
        { text = "And against the undead?", next = "practise_undead" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_undead = {
      lines = {
        { id = "pu_default", text = "The Light is fire to them, so don't hold back and don't hesitate. Whatever they were once, they aren't that now, and the kindest blow is the quickest." },
        { id = "pu_undead", when = { race = "Scourge" }, text = "You know better than I do what the Scourge feel when the Light touches them. Use that knowledge, and finish what's left of them quickly." },
      },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 1 } } },
    },
    mercy = {
      big = true,
      lines = { { id = "m_default", text = "Both, and never at the same moment. Mercy for the one who can still turn back, judgement for the one who won't, and Light help you telling them apart while they're both holding swords." } },
      choices = {
        { text = "Mercy first, always. Judgement belongs to the Light.", next = "BACK", fx = { align = { light = 1, order = -1 }, trait = { kind = 1 } } },
        { text = "Judgement first. Mercy to the wicked is cruelty to their victims.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "How do you tell them apart?", next = "mercy_tell" },
      },
    },
    mercy_tell = {
      lines = { { id = "mt_default", text = "You don't, not always, and you'll get it wrong both ways before you're done. Pray over the ones you spared and the ones you didn't, and keep doing the work anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { pious = 1 } } } },
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
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Light asks us to share whatever might help another, so I will. Ask me of these, and I'll answer you honestly." },
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
    { id = "g_since", when = { levelsSince = 6 }, text = "You've grown a great deal since our last lesson, and the Light has grown in you with it. Sit, and we'll go on." },
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
        { id = "l_veteran", when = { class = "PRIEST", minLevel = 45 }, text = "You've seen things I only teach about. Don't let them make you hard; make them make you careful." },
        { id = "l_other", when = { ["not"] = { class = "PRIEST" } }, text = "Not one of mine, but the Light doesn't mind. If you're ever hurt and far from a priest, pray anyway. It hears more than we do." },
      },
      again = { { id = "a_again", text = "Something else, while you're here?" } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What should I be practising?", next = "practise", when = { class = "PRIEST" } },
        { text = "Light or shadow. Which should I study?", next = "shadow", when = { class = "PRIEST", minLevel = 10 } },
        { text = "Does the shadow frighten you?", next = "shadow_fear", when = { form = "shadow" } },
        { text = "Do you ever get tired of healing?", next = "tired" },
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
        { text = "I'll keep to the Light.", next = "BACK", fx = { align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I want to learn the shadow.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },
    shadow_fear = {
      lines = { { id = "sf_default", text = "Not the shadow itself, but the ease of it. Everything you do in that shape, you take from someone, and everything you do outside it, you give. I'd hate to see you forget how to give." } },
      choices = {
        { text = "I won't forget.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Taking keeps people alive too.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    tired = {
      lines = { { id = "t_default", text = "Every night, and then someone walks in bleeding and I'm not tired any more. That's either devotion or habit, and after long enough, I'm not sure there's a difference." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },
  topics = {
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
      text = "A gnome of the arcane! Your people's last students are scattered across three cities since Gnomeregan fell, and every one of them corrects my diagrams." },
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
        { text = "What does all this knowledge cost?", next = "price", when = { class = "MAGE", minLevel = 10 } },
        { text = "Do you ever think about Dalaran?", next = "dalaran" },
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
      lines = { { id = "pr_default", text = "Everything, if you let it. Dalaran's best minds studied until they couldn't see the edge of what they were doing, and some of them opened doors that should have stayed shut. The price of knowledge is knowing when to close the book." } },
      choices = {
        { text = "Some books should stay closed.", next = "BACK", fx = { align = { order = 1, light = 1 }, trait = { cautious = 1 } } },
        { text = "No knowledge is forbidden. Only what we do with it.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
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
  id = "trainer_warlock", role = "trainer", subtitle = "warlock trainer", tier = "service",
  greetings = {
    { id = "g_quiet", text = "Shut that door first. Now, what is it you want?" },
    { id = "g_vet", when = { class = "WARLOCK", minLevel = 40 }, text = "Still yourself, I see. Good; not everyone who comes back is." },
    { id = "g_away", when = { away = 7 }, text = "You've been away {away}, and you're still yourself. Shut the door and sit." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've grown stronger since our last lesson, and something has noticed. Let's make certain you stay the master of it." },
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
        { id = "l_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're no warlock, so you'll forgive me if I don't explain myself. Most people who ask what I do don't really want to know." },
      },
      again = {
        { id = "a_again", text = "Something else? Keep your voice low." },
        { id = "a_again2", text = "Go on, while the door's still shut." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Who's the master: you, or the demon?", next = "master", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "How do you justify this work?", next = "justify" },
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
        { text = "I hold the leash. That's what mastery means.", next = "BACK", fx = { align = { order = 1, light = -1 }, trait = { stern = 1 } } },
        { text = "Maybe I'm being used. I'll use it right back.", next = "BACK", fx = { align = { order = -1, honor = -1 }, trait = { witty = 1 } } },
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
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "I make it my business to know what others would rather keep hidden. Some of it I can share, so choose carefully." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "You'll get what I care to give, which is very little, and these are all of it." },
    },
    _none = { { id = "t_none", text = "I don't share what I don't know, and I share very little of what I do." } },
    background = { { id = "t_bg", text = "I found the wrong book in the right library and read it twice before anyone noticed. By then I knew too much to stop." } },
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
        { text = "Do you hunt for need, or for sport?", next = "sport", when = { class = "HUNTER", minLevel = 10 } },
        { text = "Have you ever lost a companion?", next = "lose" },
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
        { id = "pb_pet", when = { pet = { type = "Beast" } }, text = "{pet} chose you as much as you chose {pet}, whatever you think. Look after that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sport = {
      big = true,
      lines = { { id = "s_default", text = "For need, if I'm honest, and I'm not always honest. There's a pleasure in the chase that has nothing to do with supper, and the day you stop feeling it you should hang up the bow, but the day it's all you feel, hang it up sooner." } },
      choices = {
        { text = "I take only what I need from the wild.", next = "BACK", fx = { align = { order = 1, honor = 1 }, trait = { kind = 1 } } },
        { text = "The chase is the point. The kill just proves it.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
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
      text = "The spirits turned from your people once, when the warlocks led them to the demons. That they answer you now is a gift, and you must never treat it like a debt repaid." },
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
        { id = "p_default", text = "Your totems: where you plant them, and when. A shaman who drops them anywhere is only decorating the battlefield." },
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
        { text = "I ask. The elements are partners, not servants.", next = "BACK", fx = { align = { honor = 1, order = -1 }, trait = { patient = 1 } } },
        { text = "Sometimes the world needs a firm hand, even the elements.", next = "BACK", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
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
    knows = {
      { id = "t_kn1", text = "The spirits speak, and so do the people who come to hear them. These are things I can tell you of." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "The elements sit calm around you today, which tells me you can be trusted with more than most." },
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
      text = "Your people's druids slept in the Dream for centuries while the Sentinels kept the world. Now you're awake, and the world is a great deal harder to balance than the stories promised." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "Hamuul brought the night elves' teaching to your people, and you're the proof that it took. The Earth Mother and the Circle aren't so far apart as some would like." },
    { id = "n_travel", cat = "form", when = { form = "travel" }, place = "replace",
      text = "Off the four legs, please, before you trample my seedlings. A druid in a hurry has forgotten the point." },
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
        { text = "The wild must be protected, even from us.", next = "BACK", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "People belong in the balance. Teach them; don't wall them out.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Who wins those arguments?", next = "wild_who" },
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
        { text = "Who do you really work for?", next = "loyalty", when = { class = "ROGUE", minLevel = 10 } },
        { text = "Do you ever trust anyone?", next = "trust" },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Waiting. You'll spend more time standing still in the dark than doing anything clever, and the ones who can't wait are the ones who get caught." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Picking locks now, and poisons once you're trusted with them. A rogue who can open a box is a rogue who never goes hungry." },
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
        { text = "I keep faith with my own. Coin comes second.", next = "BACK", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Coin never lies to me, which is more than I can say for people.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
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
      lines = { { id = "r_default", text = "When the fight's only for your name. Glory's a fine thing to have and a poor thing to chase, and I've buried more glory-chasers than I can count; fight for the ones behind you, and the glory finds you anyway, or it doesn't and you're still alive." } },
      choices = {
        { text = "I fight for the ones behind me.", next = "BACK", fx = { align = { order = 1, honor = 1 }, trait = { stern = 1 } } },
        { text = "A warrior's name is worth fighting for.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
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
      text = "Your beast walks and mine fly, so get off and get on." },
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
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Your beast stays below and finds you at the other end; they always do. Wind riders won't share a saddle with one." },
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
      },
      again = {
        { id = "a_road", text = "Anything else, or can I get back to watching the road?" },
        { id = "a_go", text = "Go on, then; I'm not going anywhere until the bell." },
        { id = "a_city", when = { capital = true }, text = "Something else? The crowds can manage without me for a moment." },
      },
      choices = {
        { text = "What's around here worth knowing?", next = "around" },
        { text = "How's life in the watch?", next = "watch" },
        { text = "Seen anything on the roads lately?", next = "roads" },
        { text = "I've some trouble to report.", next = "report" },
        { text = "Do you ever have to bend the law?", next = "law" },
        { text = "Could the watch use another sword?", next = "recruit", when = { class = "WARRIOR" } },
        { text = "I wore the Stormwind City Guard's tabard myself, once.", next = "oldguard", when = { origin = "human_city_guard" } },
        { text = "I held the rearguard at Gnomeregan, so I know a little about watches.", next = "rearguard", when = { origin = "gnome_rearguard" } },
        { text = "You might want to tie that purse a little tighter.", next = "purse", when = { class = "ROGUE" } },
        { text = "Carry on, guard.", next = "END" },
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
        { text = "What's the worst of it?", next = "watch_hard" },
        { text = "Why do you do it?", next = "watch_why" },
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
        { text = "Coin. Somebody always needs something killed.", next = "roads_you", fx = { trait = { greedy = 1 } } },
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
        { text = "Let him go. Hunger isn't a crime.", next = "law_did", fx = { align = { order = -1 }, trait = { kind = 1 } } },
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
    purse = {
      lines = {
        { id = "pu_default", text = "Is it? That's funny, because it's knotted shut and tucked under my belt, and you'd only know that if you'd been looking. I'll remember your face, friend, and you'll remember that I did." },
      },
      choices = {
        { text = "Only trying to be helpful.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Easy, I was only joking.", next = "BACK" },
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
      text = "Your {pet} has better manners than half the grunts. Keep it that way." },
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
      },
      again = {
        { id = "a_road", text = "What else? The road won't watch itself." },
        { id = "a_speak", text = "Speak, then; I'm listening, and I'm still watching." },
      },
      choices = {
        { text = "What's around here worth knowing?", next = "around" },
        { text = "How does guard duty treat you?", next = "watch" },
        { text = "What's been moving on the roads?", next = "roads" },
        { text = "I've seen trouble you should know about.", next = "report" },
        { text = "What happens to the prisoners you take?", next = "prisoners" },
        { text = "Does the watch need another blade?", next = "recruit", when = { class = "WARRIOR" } },
        { text = "I stood the Razor Hill watch myself.", next = "razor", when = { origin = "orc_razor_hill_grunt" } },
        { text = "I grew up behind human walls, in the internment camps.", next = "camp", when = { origin = "orc_camp_born" } },
        { text = "Do the Deathguard keep watches like yours?", next = "deathguard", when = { race = "Scourge", ["not"] = { capital = true } } },
        { text = "You'd never see me coming, you know.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Strength and honor.", next = "END" },
      },
    },
    around = {
      lines = {
        { id = "ar_default", text = "There's food and a bed at the inn and a smith for whatever the road breaks, and anyone who needs a hand will tell you loudly enough. The Horde looks after its own here, so ask before you go wandering." },
        { id = "ar_capital", when = { capital = true }, text = "Ask any guard and you'll be pointed right, because the city is big and the crowds don't wait for the lost. Keep your coin close in the markets, since not everyone in the Horde is honest." },
      },
      choices = {
        { text = "Where's the danger, then?", next = "danger" },
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
        { text = "Glory. I want my name told at the fires.", next = "roads_you", fx = { trait = { brave = 1 } } },
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
        { id = "dgd_default", text = "I'm told the Deathguard never sleep and never feel the cold, so they stand their watches without ever shifting their feet. I'd envy that, if I didn't know what it cost them to get that way." },
      },
      choices = {
        { text = "It cost us everything.", next = "BACK", fx = { affinity = 1 } },
        { text = "It has its advantages.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
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
    { id = "g_hero", when = { townStanding = { town = "stormwind", min = 55 } }, text = "It's an honor, really, and I'm not just saying that." },
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
        { id = "h_feralas", when = { zone = "Feralas" }, text = "You came a long way for a stronghold on a rock in the sea. Shandris will be glad of another blade, and so will I. Speak." },
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
        { text = "What troubles these woods?", next = "trouble" },
        { text = "What do you make of your new allies?", next = "allies" },
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
        { id = "wh_human", when = { race = "Human" }, text = "We are the Kaldorei's army, sworn to Tyrande Whisperwind and to Elune. We were keeping watch over these forests long before your first king laid his first stone, and we were doing it alone." },
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
        { text = "Did you ever think of leaving?", next = "vigil_leave" },
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
        { text = "A separate matter?", next = "staghelm" },
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
        { text = "Talk first. Thrall's Horde isn't the one that served the demons.", next = "horde_after", fx = { align = { light = 1 }, trait = { kind = 1 } } },
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
        { id = "al_human", when = { race = "Human" }, text = "Your people are loud and brief, and they build everything out of stone, which the trees do not like. But Jaina Proudmoore's people stood with us at Hyjal when it would have been easier to run, and that buys a great deal of patience." },
        { id = "al_dwarf", when = { race = "Dwarf" }, text = "Your Explorers' League digs in our ruins on the Darkshore coast and calls it scholarship. We call it something else. Still, your people fight like the mountain itself took offence, and I would rather have you beside me than across from me." },
        { id = "al_gnome", when = { race = "Gnome" }, text = "Your machines smell of oil and burning, and the dryads complain of the noise whenever one of your people visits. I am told you lost your city. I am sorry for it; we have lost a few ourselves, and it does not get easier." },
        { id = "al_kin", when = { race = "NightElf" }, text = "You know my mind already, because it is the mind of every one of us. We needed them, we still need them, and we have not yet learned how to be gracious about it." },
      },
      choices = {
        { text = "Will they keep faith with you, do you think?", next = "faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      big = true,
      lines = {
        { id = "fa_default", text = "That is the question the priestesses argue over in the temple. The young races live so briefly that a promise made by the grandfather is a story to the grandson. Tell me honestly, traveller: will they keep faith with us once they no longer need us?" },
      },
      choices = {
        { text = "They will. An alliance is a promise, and promises are kept.", next = "faith_after", fx = { align = { honor = 1 }, affinity = 1 } },
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
        { text = "I feel nothing. She's our home now.", next = "tree_home" },
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
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}. Orgrimmar's still standing, so walk in like you never left." },
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
    { id = "l_default", text = "Valley of Strength by the gate, the Drag for anything crooked, and Grommash Hold for the Warchief, but don't bother him." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Warriors to the Valley of Honor. The weak train somewhere else, I'm told, but I've never found where." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "Rogues gather in the Cleft of Shadow with the other things that crawl. Don't make me come down there to find you." },
    { id = "l_thrall", text = "The Warchief built this city with his own people's hands, and named it for the Warchief who came before him. Remember that when you walk under these gates." },
    { id = "l_burning", text = "Burning Blade cultists crawl about the Cleft and the canyons when they think no one is looking. If you see one, you won't need to ask us twice." },
  },
  choices = { { text = "Lok'tar.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The gate hears everything that comes in from the Barrens, and plenty that crawls up out of the Drag. Here's what I know of it." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've bled for the Horde, so I'll tell you what the grunts don't say in front of the officers." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you because the Warchief says we answer, so make it worth my time." },
    },
    _none = { { id = "t_none", text = "Not my business; find a shaman." } },
  },
}

P:Pool {
  id = "guard_thunderbluff", role = "guard", community = "thunder_bluff",
  greetings = {
    { id = "g_winds", text = "Walk with the Earth Mother. The lifts will take you down when you're done." },
    { id = "g_xghost", when = { origin = "tauren_ghost_walker_scout" }, text = "You scouted out of Ghost Walker Post, the braves say. Desolace makes hard hunters, so the bluffs must seem very quiet to you after the centaur." },
    { id = "g_away", when = { away = 7 }, text = "You have been away {away}. The bluffs are as they were, and the lifts still run." },
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
    { id = "l_default", text = "The rises and the bridges between them. Mind the edges; the wind does not ask permission." },
    { id = "l_warlock", when = { class = "WARLOCK" }, text = "The Earth Mother does not love the fel. Do your work below the bluffs, if you must do it at all." },
    { id = "l_cairne", text = "High Chieftain Cairne keeps his lodge on the central rise, and his door is open to any who come in peace. That is the tauren way, and it is his way most of all." },
    { id = "l_grimtotem", text = "The Grimtotem walk among us on the bluffs, and they smile, but their eyes do not. If one of them troubles you, come to a Bluffwatcher and not to your weapon." },
  },
  choices = { { text = "Thank you.", next = "END" } },
  topics = {
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
    { id = "g_dark", text = "You're in the Undercity. Keep to the paths and don't touch the green." },
    { id = "g_xarchive", when = { origin = "forsaken_stratholme_archivist" }, text = "The Stratholme scholar, they say in the barracks. Don't ask the Deathguard about that city; some of them died there in the Culling, and they won't talk about it." },
    { id = "g_away", when = { away = 7 }, text = "You've been gone {away}. The Deathguard noticed, as they notice everything." },
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
      text = "Half the Magic Quarter studied in Dalaran before the plague. You'll find them there, still arguing about it." },
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
    { id = "l_lady", text = "The Dark Lady gave us our wills back, and we stand guard so no one takes them again. That's all the reason a Deathguard needs, and more than most of the living have." },
    { id = "l_scarlet", text = "The Scarlet Crusade would burn this whole city with us in it, and they'd sing hymns while they did. Keep that in mind when the living tell you we're the monsters." },
  },
  choices = { { text = "Understood.", next = "END" } },
  topics = {
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
    { id = "b_pirates", text = "Sails on the horizon again, boys, and if they're black, somebody ring the bell before they start chargin' us for the privilege." },
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
        { text = "Any trouble lately?", next = "trouble" },
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
        { text = "Did he really build Orgrimmar?", next = "boss_orgrimmar" },
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
        { text = "What's Booty Bay like?", next = "boat_bay" },
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
        { text = "Smart. Wars end, but trade doesn't.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Profiting off a war isn't something to boast about.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
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
    steamwheedle = { { id = "t_cartel", text = "Same Cartel as Booty Bay, Gadgetzan and Everlook, pal, and Ratchet's the one that keeps the Barrens supplied. Everything that crosses the sea comes through our docks first and pays its toll on the way." } },
    _none = { { id = "t_none", text = "Ask Gazlowe, pal. He knows everything, and he'll tell you whether you asked or not, and then he'll tell you what it cost him." } },
  },
}
