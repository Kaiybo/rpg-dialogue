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
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You checked the water trough before you checked me, which is how a farm-raised rider looks over a stable. Somebody taught you horses young, and taught you properly." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "If you've brought one of those clockwork striders, leave it outside the gate, please. It doesn't eat, it ticks all night, and my goats can't abide the sound of it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Your people's wolves never settle in a stall; they lie across the doorway and watch the yard as if they're standing a watch. Is yours the same, or have I only met the surly ones?" },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "The Darkspear ride raptors, and every raptor I've stabled has tried to eat whatever was in the next stall. I hope you've taught yours better manners, because I've only the one goat left." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Your people ride horses as dead as you are, I'm told, and I've never worked out what one eats. If it's oats I'll be very surprised, and if it's anything else I'd rather not stock it." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784 } },
      text = "Don't bring that through the gate! I've a stable full of horses that'll kick down their stalls if they catch the smell of burning hooves, and they've caught it already." },
    { id = "n_lock_dreadsteed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 23161 } },
      text = "Is that a dreadsteed? I've heard of them and never wanted to see one. Whatever you fought to bind that beast, I hope it stayed dead, and I hope you're not about to ask me to stable it." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The horses have their ears back and the dog's gone under the trough, and they only do that when something's wrong with the visitor. No offence, but I'll do my business with you from over here." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Your hand's hot as a fever when you pass me the reins. Is that the imp's doing? The horses can feel it too, and they don't care for it." },
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
        { text = "Got room for a wolf that won't lie down?", next = "race_wolf", when = { race = "Orc" } },
        { text = "Ever had a raptor in here?", next = "race_raptor", when = { race = "Troll" } },
        { text = "What do you feed a horse that died years ago?", next = "race_deadhorse", when = { race = "Scourge" } },
        { text = "My mechanostrider needs a dry corner, not a stall.", next = "race_strider", when = { race = "Gnome" } },
        { text = "We kept plough horses on the farm back home.", next = "race_plough", when = { race = "Human" } },
        { text = "Would a galestrider fit in one of your stalls?", next = "race_gale", when = { race = "Skyborne" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    race_wolf = {
      lines = { { id = "race_wolf_l", text = "Then it's a good wolf, and it's guarding you even when you're not here. I never shut a wolf in; I leave the half-door open and it lies across the sill, and nobody steals so much as a bucket while it's there." } },
      choices = {
        { text = "Wolves have carried my people into battle for generations.", next = "race_wolf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_wolf2 = {
      lines = { { id = "race_wolf2_l", text = "So I've heard, and it shows. Your wolves look at an orc the way my hound looks at me, as if the pair of you share a secret about everyone else, so bring yours by whenever you like, so long as it leaves the goats alone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_raptor = {
      lines = { { id = "race_raptor_l", text = "Once, and once was enough. It ate a bridle, bit my apprentice and spent the whole night staring at the goats with one eye and at me with the other, and I've slept badly near a raptor ever since." } },
      choices = {
        { text = "They only bite people they don't respect.", next = "race_raptor2", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_raptor2 = {
      lines = { { id = "race_raptor2_l", text = "Then it never respected me, and I can't say I blame it. I'm told your people raise them from the egg at Sen'jin, which must be the only way anyone ever earns a raptor's good opinion." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_deadhorse = {
      lines = { { id = "race_deadhorse_l", text = "Honestly, I don't know, and I've wondered more than once. One of your kind tied a skeletal horse at my rail last spring, and it stood there all night eating nothing and drinking nothing, while every animal in the yard pressed itself against the far wall." } },
      choices = {
        { text = "It doesn't need feeding. It needs a little respect.", next = "race_deadhorse2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_deadhorse2 = {
      lines = { { id = "race_deadhorse2_l", text = "It has my respect, from a distance. I'll not pretend I'm easy with it, but it stood quieter than half the living horses I've kept, and I'll give it that much." } },
      choices = {
        { text = "That's more than most of the living give us.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be off, then.", next = "END" },
      },
    },
    race_strider = {
      lines = { { id = "race_strider_l", text = "A dry corner I can do, and I'll keep the goats off it, because they chewed through the last one's wiring. Only don't ask me to oil it, since I'd not know which end of the thing is the front." } },
      choices = {
        { text = "We built them by the hundred, before Gnomeregan fell.", next = "race_strider2" },
        { text = "The front is whichever end is moving.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    race_strider2 = {
      lines = { { id = "race_strider2_l", text = "So I've heard, and now you build them in Tinker Town with whatever you carried out on your backs. I'll keep a corner swept for yours; it's the least anybody can do for folk who lost a whole city." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_plough = {
      lines = { { id = "race_plough_l", text = "Then you'll know the difference between a horse that's tired and one that's sulking, which is more than most riders do. Plough horses are the best-tempered beasts alive, and it's a shame how many fields stand empty that used to keep them." } },
      choices = {
        { text = "Westfall was full of them, once.", next = "race_plough2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_plough2 = {
      lines = { { id = "race_plough2_l", text = "It was, and the farmers who fled the Defias sold their teams for whatever they'd fetch on the road. I bought two of them myself, and the old mare still turns her head west every morning when I open the gate." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    race_gale = {
      lines = { { id = "race_gale_l", text = "No, and I'd not try to put one in, from what I've heard of them. A beast that can half fly won't stand for a roof over its head, so I'd sooner you left yours wherever your people leave them." } },
      choices = {
        { text = "It goes where I go. Stalls never suited it.", next = "race_gale2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_gale2 = {
      lines = { { id = "race_gale2_l", text = "Then it's like the wild things I keep, the ones that pace and stare at the hills. If you ever do need it minded, bring it by at night when the yard's quiet, and I'll leave the high gate open and hope for the best." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
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
        { text = "What serves me sleeps somewhere colder than a stall.", next = "BACK", when = { class = "WARLOCK" }, fx = { trait = { stern = 1 } } },
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
  -- Race-variant lines and race-gated replies only; a broad role never notices.
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "What you leave here stays here. That's the whole of the job, and I'm very good at it." },
        { id = "l_poor", when = { money = { max = 100 } }, text = "We keep anything, friend, even very little." },
        { id = "l_dwarf", when = { race = "Dwarf" }, text = "Your people built the great Vault of Ironforge, so I expect you'll judge ours harshly. It locks and it keeps, and I'd ask you to judge it on that." },
        { id = "l_gnome", when = { race = "Gnome" }, text = "I've never once had a gnome dispute a ledger, because they've always counted it twice before they reach the counter. That makes you my favourite sort of customer." },
        { id = "l_scourge", when = { race = "Scourge" }, text = "Your account's under the name you carry now, I hope, and not the one you had before. A few of your people have come asking after the old Lordaeron vaults, and I'm afraid those went with the city." },
        { id = "l_tauren", when = { race = "Tauren" }, text = "Your people never set much store by coin, I'm told, and I can see why, since you can't eat it and it doesn't graze. It keeps better in here than in a saddlebag, though." },
        { id = "l_orc", when = { race = "Orc" }, text = "The old bankers used to say an orc keeps only what an orc can carry. I'm glad to see you've decided to trust a door and a lock instead." },
        { id = "l_troll", when = { race = "Troll" }, text = "The Darkspear trade in shells and teeth as often as coin, I'm told, so I'll say plainly that we keep anything. I've a drawer of the strangest deposits you ever saw to prove it." },
        { id = "l_nightelf", when = { race = "NightElf" }, text = "You'll find our ways hasty, I expect, after the patience of your people. The coin will still be here when you come back, however long you take about it." },
        { id = "l_skyborne", when = { race = "Skyborne" }, text = "Your people traded in windstones before you came here, I've heard, and I've no scale that weighs one. It'll have to be gold and silver for now, the same as everyone." },
      },
      again = {
        { id = "a_again", text = "Anything else? The vault's patient, but the queue behind you isn't." },
        { id = "a_again2", text = "Go on; I've a moment before the next deposit." },
      },
      choices = {
        { text = "My vault, please.", next = "BUSINESS" },
        { text = "Ironforge's vault would swallow this whole building.", next = "race_vault", when = { race = "Dwarf" } },
        { text = "I had money in a Lordaeron vault, before.", next = "race_lordaeron", when = { race = "Scourge" } },
        { text = "Your ledgers want a proper counting engine.", next = "race_engine", when = { race = "Gnome" } },
        { text = "On the plains, nobody needed coin.", next = "race_plains", when = { race = "Tauren" } },
        { text = "I carry what I own. Coin's no use otherwise.", next = "race_carry", when = { race = "Orc" } },
        { text = "Back home we traded in windstones.", next = "race_windstone", when = { race = "Skyborne" } },
        { text = "Stormwind's taxes leave little enough to deposit.", next = "race_taxes", when = { race = "Human" } },
        { text = "Good day.", next = "END" },
      },
    },
    race_vault = {
      lines = { { id = "race_vault_l", text = "It would, and it's deeper, and guarded by dwarves who'd sooner bite you than open up after hours. I once wrote to them asking how they keep the damp out, and they wrote back a single word, which was 'stone'." } },
      choices = {
        { text = "That sounds like Ironforge.", next = "BACK", fx = { affinity = 1 } },
        { text = "My vault, please.", next = "BUSINESS" },
      },
    },
    race_lordaeron = {
      lines = { { id = "race_lordaeron_l", text = "Then I'm sorry, truly, because whatever was in it went the way of Lordaeron, and nobody's been back to open those doors. If anyone sits on that coin now, it's the Scourge, and they've no use for it." } },
      choices = {
        { text = "Are the debts still owed, do you think?", next = "race_lordaeron2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_lordaeron2 = {
      lines = { { id = "race_lordaeron2_l", text = "Some of the living argue those debts died with you, and some of your people argue back, very coldly, across this counter. I keep out of it, and I'd advise you to start a fresh ledger." } },
      choices = { { text = "A fresh ledger, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    race_engine = {
      lines = { { id = "race_engine_l", text = "A gnome built me one, once, and it added up every coin in the vault in an afternoon and then caught fire. I've gone back to ink and a good clerk, and I sleep a great deal better for it." } },
      choices = {
        { text = "The fire was probably a calibration problem.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_plains = {
      lines = { { id = "race_plains_l", text = "No, and I envy you a little. Here every scrap of a life ends up in a ledger, and I expect on the plains a good kodo and a sound tent were all the wealth anybody needed to count." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_carry = {
      lines = { { id = "race_carry_l", text = "Then you carry too much, if you'll forgive me, and you'll lose it the first time something bigger than you knocks you down. A vault doesn't care how strong you are, which is rather the point of it." } },
      choices = {
        { text = "Nothing's knocked me down yet.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "My vault, then.", next = "BUSINESS" },
      },
    },
    race_windstone = {
      lines = { { id = "race_windstone_l", text = "So I've heard, and I'd dearly like to see one, though I'm told they're as much a power as a coin. Nobody here would know how to change one, so I'm afraid it's silver for you, the same as everyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    race_taxes = {
      lines = { { id = "race_taxes_l", text = "You're not the first to say so at this counter, and with the city still paying for its walls and its watch, you'll not be the last. Whatever's left over, though, is safer here than under a floorboard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "t_none", text = "Unless it's kept in a vault, I wouldn't know." } } },
}

P:Pool {
  id = "auctioneer", role = "auctioneer",
  greetings = {
    { id = "g_bid", text = "Bidding, buying out, or selling?" },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}? Most of the listings have changed hands since, so have a look." },
  },
  -- Race-variant lines and race-gated replies only; a broad role never notices.
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "The house takes its cut, the seller takes the rest, and everybody blames me for the prices." },
        { id = "l_dwarf", when = { race = "Dwarf" }, text = "Every dwarf who comes to this counter wants to know what thorium's fetching, and every one of them swears at the answer. Go on, then, ask." },
        { id = "l_gnome", when = { race = "Gnome" }, text = "Gnomes sell the strangest lots through this house, springs and cogs and half a mechanical chicken once, and every one comes with three pages of notes." },
        { id = "l_nightelf", when = { race = "NightElf" }, text = "The kaldorei are the only sellers who list something, wander off for a week and come back surprised that it sold. Your people are patient, I'll give you that." },
        { id = "l_orc", when = { race = "Orc" }, text = "Orcs never haggle with me; they only look at the house's cut for a long, quiet moment, until I start to wonder whether it's too high." },
        { id = "l_troll", when = { race = "Troll" }, text = "The Darkspear list the oddest lots I've ever handled: carved bones, little bags that rattle, and things with eyes. I don't ask, and the buyers don't seem to either." },
        { id = "l_tauren", when = { race = "Tauren" }, text = "Your people bring me hides cleaner than anything a tanner's apprentice ever managed, and you never seem to mind what they fetch. I wish I could say that of my other sellers." },
        { id = "l_scourge", when = { race = "Scourge" }, text = "Your people send me the oddest things out of the Plaguelands, and I've learned to wash my hands after handling the lots. No offence meant; the buyers ask." },
        { id = "l_skyborne", when = { race = "Skyborne" }, text = "A few lots of your people's cloth have come through this house, woven so fine the tailors bid against each other like fishwives. If you've any more of it, list it high." },
      },
      again = {
        { id = "a_again", text = "Anything else? Bids close while we talk, mind." },
        { id = "a_again2", text = "Ask away; the listings will keep a minute." },
      },
      choices = {
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "What's thorium fetching these days?", next = "race_ore", when = { race = "Dwarf" } },
        { text = "I've a few inventions I'd like to list.", next = "race_invent", when = { race = "Gnome" } },
        { text = "Do the voodoo goods sell well?", next = "race_voodoo", when = { race = "Troll" } },
        { text = "The Plaguelands are full of things the dead left behind.", next = "race_plague", when = { race = "Scourge" } },
        { text = "Your prices make no sense to me.", next = "race_price", when = { race = "Tauren" } },
        { text = "An honest fight would settle prices faster.", next = "race_fight", when = { race = "Orc" } },
        { text = "My people's clothcraft would fetch a good price here.", next = "race_cloth", when = { race = "Skyborne" } },
        { text = "Good day.", next = "END" },
      },
    },
    race_ore = {
      lines = { { id = "race_ore_l", text = "More than you'd like if you're buying and less than you'd like if you're selling, which is how I know the price is fair. The miners working the Searing Gorge set it, and with Dark Irons about, they charge for the danger." } },
      choices = {
        { text = "Dark Irons. That's worth the price, I'll grant.", next = "BACK" },
        { text = "Show me the listings.", next = "BUSINESS" },
      },
    },
    race_invent = {
      lines = { { id = "race_invent_l", text = "List them, by all means, only write down what they do in words the buyers can read. Last month somebody listed a thing called a discombobulator, and three people bought it and two of them came back to complain." } },
      choices = {
        { text = "It does exactly what the name says.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_voodoo = {
      lines = { { id = "race_voodoo_l", text = "Well enough, though I'll admit the shrunken heads make the clerks nervous. If you're selling one, pack it in a box, please, so it isn't looking at anybody while it waits." } },
      choices = { { text = "It only looks at people it doesn't like.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_plague = {
      lines = { { id = "race_plague_l", text = "They are, and some of it sells very well indeed, which says something about the living I'd rather not think on. Wash whatever you bring, though, because I'll not list anything that's still crawling." } },
      choices = {
        { text = "The Apothecaries would pay more than your buyers.", next = "race_plague2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_plague2 = {
      lines = { { id = "race_plague2_l", text = "Then sell it to them, and I'll not be offended. The Royal Apothecary Society pays for things my buyers wouldn't touch with a stick, and I'd as soon not ask what for." } },
      choices = { { text = "Wise of you.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    race_price = {
      lines = { { id = "race_price_l", text = "They don't make much sense to me either, and I've been here for years. A thing is worth whatever somebody will pay on the day, and I'd guess on the plains a thing was worth what it was good for, which is the better rule." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_fight = {
      lines = { { id = "race_fight_l", text = "It would, and the house would lose its cut, which is why we don't allow it. Bid high, and if you lose, take it out on a centaur rather than my clerks." } },
      choices = {
        { text = "Centaur it is.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Show me the listings.", next = "BUSINESS" },
      },
    },
    race_cloth = {
      lines = { { id = "race_cloth_l", text = "It would, if what I've seen is anything to go by, so list it in small lots and keep the buyers hungry. The tailors here can't match the weave, and believe me, they've tried." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
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
    { id = "n_human", cat = "gear", when = { race = "Human" },
      text = "Stormwind plate, by the rivets, and somebody's patched it in a hurry with the wrong nails. I know a field repair when I see one; I made enough of them myself in the war." },
    { id = "n_nightelf", cat = "gear", when = { race = "NightElf" },
      text = "Your people's armour is shaped like leaves and finished like jewellery, and I've never once seen a kaldorei smith at work. I'll mend it as best I can, but forgive me if I go slowly." },
    { id = "n_orc", cat = "gear", when = { race = "Orc" },
      text = "Orcish steel is heavy and plain, made to be swung by somebody who doesn't mind the weight. I respect that, and I'll not try to make it pretty." },
    { id = "n_troll", cat = "gear", when = { race = "Troll" },
      text = "That's troll work on your belt, bone and feather and iron all lashed together. I'll mend the iron, but I'll not touch the feathers, in case they're doing something besides looking handsome." },
    { id = "n_scourge", cat = "gear", when = { race = "Scourge" },
      text = "That's old Lordaeron make, with the crown's mark rubbed off the pauldron. I'll mend it gladly, and I'll not ask whose it was first." },
    { id = "n_skyborne", cat = "gear", when = { race = "Skyborne" },
      text = "I've not seen your people's metalwork before, and I'd like a closer look at those fittings when you've a moment. It's lighter than I'd ever dare make anything meant to stop a blade." },
    { id = "n_paladin", cat = "gear", when = { class = "PALADIN", durability = { max = 0.5 } },
      text = "The Light doesn't hammer out dents, however hard you pray at them. Get it on the bench." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's not armour you're wearing over your armour, that's hide, and it's off no beast I've ever worked. I'll mend the iron underneath, but I'll not put a hammer to whatever's crawling on top of it." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My forge fire's gone green round the edges since you walked in. Thirty years at this anvil and that's never once happened with a customer, so let's be quick about it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Those purple crystals in your bag are cold enough that I can feel them from the anvil. Keep the bag away from my quench tub, because I don't know what cold like that does in hot water and I don't care to find out." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "That's a firestone on your belt; I'd know the heat anywhere. Folk say it puts a fire in a blade, but a good edge doesn't need a demon's help, and I'll thank you not to tell my apprentice otherwise." },
    { id = "n_lock_trance", cat = "lock_armor", when = { class = "WARLOCK", aura = { 17941 } },
      text = "Your hands are smoking, and not with heat; that's dark stuff curling off your fingers. Don't touch my tools until it stops." },
  },
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Good steel's patient; it waits for you to need it. Bad steel waits for the worst moment." },
        { id = "l_low", when = { durability = { max = 0.5 } }, text = "Half of that's held together by habit. Let me look before it lets you down." },
        { id = "l_warrior", when = { class = "WARRIOR" }, text = "A warrior's gear tells me everything: where you were hit, how often, and how often you didn't move out of the way." },
        { id = "l_warlock", when = { class = "WARLOCK" }, text = "Brimstone and soot smell much the same, but I know the difference. Keep your conjuring out of my coals." },
      },
      again = {
        { id = "a_again", text = "Anything else? The iron's cooling while we talk." },
        { id = "a_again2", text = "Go on, I can listen and hammer at the same time." },
      },
      choices = {
        { text = "Repairs, please.", next = "BUSINESS" },
        { text = "Just browsing.", next = "BUSINESS" },
        { text = "Dwarven steel's folded more times than yours.", next = "race_fold", when = { race = "Dwarf" } },
        { text = "I could improve those bellows, you know.", next = "race_bellows", when = { race = "Gnome" } },
        { text = "My people work little iron; we prefer wood and hide.", next = "race_hide", when = { race = "Tauren" } },
        { text = "Orcish steel needs no polish.", next = "race_polish", when = { race = "Orc" } },
        { text = "Can you work a bit of bone into this hilt?", next = "race_bone", when = { race = "Troll" } },
        { text = "This armour was mine when I was alive.", next = "race_oldplate", when = { race = "Scourge" } },
        { text = "Your forge smoke carries a long way into the trees.", next = "race_smoke", when = { race = "NightElf" } },
        { text = "Stormwind's smiths say nobody else can rivet plate properly.", next = "race_rivets", when = { race = "Human" } },
        { text = "You keep staring at my fittings.", next = "race_fittings", when = { race = "Skyborne" } },
      },
    },
    race_fold = {
      lines = { { id = "race_fold_l", text = "I don't doubt it, and I'd love to learn how, but your smiths guard the method like it's the last cask in the mountain. One day I'll get one of them drunk enough at the Great Forge to tell me." } },
      choices = { { text = "You'll need a lot of ale for that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    race_bellows = {
      lines = { { id = "race_bellows_l", text = "No, thank you. The last gnome who said that left me with bellows that breathe on their own, day and night, and I've had to chain them to the wall, so admire them from over there if you must." } },
      choices = {
        { text = "That's a twelve percent improvement, at least.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Repairs, then.", next = "BUSINESS" },
      },
    },
    race_hide = {
      lines = { { id = "race_hide_l", text = "And yet you've worn that iron well, and never once complained of the weight, which is more than I can say of most customers. Hide and wood are honest things, but iron turns a spear, so I'm glad you've some on you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_polish = {
      lines = { { id = "race_polish_l", text = "Some orc smith told you that, and he wasn't wrong, but rust doesn't care for pride. Oil it once a week and it'll take ten more years of swinging, and that's a smith's honour, not vanity." } },
      choices = {
        { text = "Once a week, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Repairs, then.", next = "BUSINESS" },
      },
    },
    race_bone = {
      lines = { { id = "race_bone_l", text = "I can, though I'd rather know whose bone it is first. Your people lash charms to everything, and I've learned to ask before my hammer finds out the hard way." } },
      choices = { { text = "Just a raptor's. Nothing that'll mind.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_oldplate = {
      lines = { { id = "race_oldplate_l", text = "Then it's served you longer than most armour serves anyone, and it isn't finished yet. The plate's sound under the rust, but I'll redo the straps, because the old leather's rotted clean through." } },
      choices = {
        { text = "Leave the crest alone. I want to remember.", next = "race_oldplate2" },
        { text = "Repairs, then.", next = "BUSINESS" },
      },
    },
    race_oldplate2 = {
      lines = { { id = "race_oldplate2_l", text = "I'll leave it, and I'll not polish it either, so it stays the way you knew it. There are some things a smith shouldn't put a hammer to, and an old soldier's memory is one of them." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_smoke = {
      lines = { { id = "race_smoke_l", text = "It does, and one of your people once stood at my door and stared at the chimney until I banked the fire. I'll not say it didn't trouble me, but I'll not shoe horses on a cold forge either." } },
      choices = {
        { text = "The trees remember every fire.", next = "BACK" },
        { text = "Repairs, then.", next = "BUSINESS" },
      },
    },
    race_rivets = {
      lines = { { id = "race_rivets_l", text = "Stormwind's smiths say a lot of things, mostly in the Dwarven District and mostly after a few drinks. I learned my rivets from a dwarf there, as it happens, so tell them that the next time they boast." } },
      choices = { { text = "I'll be sure to.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_fittings = {
      lines = { { id = "race_fittings_l", text = "I do, and I'm sorry, but I've never seen work like it, and a smith can't help looking. If you ever meet whoever made those, tell them there's a smith here who'd trade a month's wages for an afternoon at their bench." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = { _none = { { id = "t_none", text = "Bring it to the anvil and I'll tell you what it is." } } },
}

---------------------------------------------------------------------------
-- A few common kinds of vendor, by their titles. Narrowed by subtitle, so they may
-- notice what their trade would; the broad vendor role never does.
---------------------------------------------------------------------------
P:Pool {
  id = "vendor_food", role = "vendor", subtitle = { "food", "bread", "baker", "butcher", "meat", "fruit", "cook" },
  greetings = {
    { id = "g_fresh", text = "Fresh today, or mostly today." },
    { id = "g_away", when = { away = 7 }, text = "Back after {away}? You'll be hungry, then, because road food never fills anyone." },
  },
  -- Narrowed by title, so it may notice what a cook would.
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at a baker's stall! You'll be after something that goes with ale, I expect, and I've a rye loaf that's been waiting for you all morning." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Take the small rolls, they're easier to carry, and no, I don't know what each one weighs to the quarter-ounce. The last gnome asked me that, and I've not been the same since." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "The fruit's at this end, picked this morning, and the honey cakes beside it. The last kaldorei who came by walked straight past the sausages as if they'd insulted the forest." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You've the look of somebody who's been living on dried boar for a week. Eat something that was cooked today before you buy anything for the road." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "You'll be wanting something with a bit of fire in it, I expect, and I'm sorry to tell you the hottest thing on this stall is the mustard. Every troll who's tried it has laughed at me." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You've the look of somebody raised on farm bread and missing it, so take the brown loaf. It's the nearest thing to a mother's oven I sell." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You looked at that loaf as though you'd never seen wheat grown in proper soil. I hope it's to your taste, whatever your people ate up there." },
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
        { text = "Have you anything that goes with a dark ale?", next = "race_ale", when = { race = "Dwarf" } },
        { text = "Was this grain grown in good soil?", next = "race_soil", when = { race = "Tauren" } },
        { text = "Meat. Nothing else.", next = "race_meat", when = { race = "Orc" } },
        { text = "Got anything with real spice in it?", next = "race_spice", when = { race = "Troll" } },
        { text = "How long does this bread keep, precisely?", next = "race_keep", when = { race = "Gnome" } },
        { text = "This tastes like the bread back home.", next = "race_home", when = { race = "Human" } },
        { text = "Do you sell anything that wasn't hunted?", next = "race_hunted", when = { race = "NightElf" } },
        { text = "Food grown in the ground still tastes strange to me.", next = "race_ground", when = { race = "Skyborne" } },
        { text = "Good day.", next = "END" },
      },
    },
    race_ale = {
      lines = { { id = "race_ale_l", text = "Rye bread, a hard cheese and a sausage with enough pepper in it to make you want a second pint, which is the whole idea. The innkeeper and I have an understanding about that sausage." } },
      choices = {
        { text = "A wise arrangement.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll take some.", next = "BUSINESS" },
      },
    },
    race_soil = {
      lines = { { id = "race_soil_l", text = "The best I can buy, though I doubt the farmers thank the Earth Mother for it the way your people would. It tastes honest, and that's the most I'll promise anybody." } },
      choices = {
        { text = "Then I'll thank her for both of us.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_meat = {
      lines = { { id = "race_meat_l", text = "A plain order, and I like it. The ribs were roasted this morning, and if they're not to your liking you can tell me so to my face, which I hear is how your people prefer it anyway." } },
      choices = {
        { text = "To your face, then. They're good.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll take some.", next = "BUSINESS" },
      },
    },
    race_spice = {
      lines = { { id = "race_spice_l", text = "Not the way your people mean it, no. I tasted what the Darkspear cook at Sen'jin once, and my mouth didn't recover until the next morning, so the mustard's the best I can do and I'm sorry for it." } },
      choices = {
        { text = "Next time I'll bring you some peppers.", next = "race_spice2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_spice2 = {
      lines = { { id = "race_spice2_l", text = "Bring them, and I'll put them in a pie and sell it to the guards, who boast that nothing ever frightens them. I'd pay good money to watch their faces." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_keep = {
      lines = { { id = "race_keep_l", text = "Four days in a dry pack, three in a damp one, and about an hour once somebody starts taking it apart to see how it works. Eat it, please, don't study it." } },
      choices = { { text = "Four days. I'll make a note.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    race_home = {
      lines = { { id = "race_home_l", text = "Then somebody back home knew what they were about, and so do I. Brown flour, a little honey, a hot oven and patience, and the patience is the part nobody ever writes down." } },
      choices = {
        { text = "I miss it more than I'd say aloud.", next = "race_home2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_home2 = {
      lines = { { id = "race_home2_l", text = "Most folk on the road do, and they say it to the baker before they'd say it to anyone else. Buy a loaf for the first night out, and eat it slowly, and you'll be home for a few minutes at least." } },
      choices = { { text = "I'll do that.", next = "BUSINESS", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    race_hunted = {
      lines = { { id = "race_hunted_l", text = "Plenty: the fruit, the nuts and the bread, all of it grown and none of it chased. I'd guess your people would sooner thank the forest than the butcher, and I'll not argue with ten thousand years of good manners." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    race_ground = {
      lines = { { id = "race_ground_l", text = "Does it? I suppose it would, to somebody who's not eaten much of it. I hope that's a good kind of strange, because there's more earth in my bread than in anything else I sell." } },
      choices = {
        { text = "It's a good kind of strange.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
  -- Narrowed by title, so it may notice what someone behind a bar would.
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at my counter, and I can already see you judging the taps. Go on, then, tell me which of them you'd pour down the drain." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Orcs drink as if it's a contest and set the cup down as if it's lost, and I've learned not to take either personally. What'll it be?" },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Every troll I've served says my strongest is too weak, and then has three of them anyway. I'm told the Darkspear brew their own on the Echo Isles, and I'm told not to try it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The big tankard, I think, and I'll fill it twice. I've never yet seen a tauren tipsy, and believe me, I've watched for it." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Gnomes take a single cup of anything and then talk for an hour about how it was distilled. I'll pour you one if you promise not to take my still apart afterwards." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei always ask for wine and then look at it, disappointed, as though they remember a better vintage from a few thousand years back. I suppose you might, at that." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You've the look of someone who knows the Lion's Pride by its taps. Don't tell me mine's better, because I know it isn't." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've no idea what your people drink, or whether you drink at all. Try the plain ale, and if you make a face I'll know for next time." },
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
        { text = "Can I still get drunk, do you think?", next = "race_numb", when = { race = "Scourge" } },
        { text = "Give me something that bites back.", next = "race_bite", when = { race = "Orc" } },
        { text = "Your ale's weak. Ever had a proper troll brew?", next = "race_brew", when = { race = "Troll" } },
        { text = "Is there anything here my ancestors would recognise?", next = "race_ancestors", when = { race = "Tauren" } },
        { text = "Your still could run thirty percent more efficiently.", next = "race_still", when = { race = "Gnome" } },
        { text = "You wouldn't have anything from Darnassus?", next = "race_darnassus", when = { race = "NightElf" } },
        { text = "Is that cask really Stormwind ale?", next = "race_cask", when = { race = "Human" } },
        { text = "What would you pour for someone who's never tasted ale?", next = "race_firstcup", when = { race = "Skyborne" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    race_numb = {
      lines = { { id = "race_numb_l", text = "I've watched your kind try, and I'd say no, though one swore the strong stuff made his fingers go numb, which I'd thought they already were. Try it and tell me; I've wondered for months." } },
      choices = {
        { text = "I'll let you know.", next = "race_numb2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_numb2 = {
      lines = { { id = "race_numb2_l", text = "Do, and quietly, because the living customers get nervous when one of your people laughs too loud at nothing. They needn't, I suppose, but I'd rather not find out what a frightened crowd does to my furniture." } },
      choices = { { text = "Quietly, then.", next = "BUSINESS", fx = { trait = { discreet = 1 } } } },
    },
    race_bite = {
      lines = { { id = "race_bite_l", text = "Then you want the dark rum the sailors bring in, which has bitten everyone who's tried it and a few who only smelled it. Drink it slowly, or don't drink it in here." } },
      choices = {
        { text = "Pour it.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_brew = {
      lines = { { id = "race_brew_l", text = "Once, on a dare, and I don't remember the end of that night or most of the next day. Whatever your people put in it, I'd never sell it here, because I'd never get my customers home again." } },
      choices = { { text = "That's the point of it.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_ancestors = {
      lines = { { id = "race_ancestors_l", text = "Water, I suppose, and maybe milk, though I keep little of either. I'd guess your people drank from the rivers of Mulgore long before anyone thought to brew, and you've lost nothing by it." } },
      choices = {
        { text = "Water, then. And maybe one ale.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_still = {
      lines = { { id = "race_still_l", text = "It probably could, and the last gnome who said so left a drawing on the back of my price list that I still can't read. I'll keep my thirty percent less, thank you, because at least I know it won't explode." } },
      choices = { { text = "Twenty-eight percent, then. I was rounding.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_darnassus = {
      lines = { { id = "race_darnassus_l", text = "Not a drop. Your wines never seem to leave the island, and the one bottle I ever saw was sold three times over before anybody dared to open it." } },
      choices = { { text = "Some things are worth the wait.", next = "BACK" } },
    },
    race_cask = {
      lines = { { id = "race_cask_l", text = "It says so on the cask, and I paid as though it were. I'll be honest, I trust the cooper's mark more than the brewer's, but nobody's complained yet." } },
      choices = {
        { text = "Pour one, and I'll be the judge.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_firstcup = {
      lines = { { id = "race_firstcup_l", text = "Something gentle, so you don't decide on the first sip that the whole of Azeroth is trying to poison you. The honey mead, I think, and slowly, because it's sweeter than it is strong and it'll fool you by the second cup." } },
      choices = {
        { text = "The honey mead, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
  -- Narrowed by title, so it may notice what someone weighing out herbs would.
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome in my shop, and already counting the jars. Every one of them is labelled, so you needn't open any to check." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Your people have ways with roots and powders older than my whole trade. Look round if you like, but I suspect you'll find my shelves rather tame." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "I've sold to the Apothecarium's people before, and they always ask for things I'd not sell to anyone else. Whatever you're after, keep it stoppered while you're in here, please." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Your people know every herb on the plains by name, I'm told, so you've likely spotted the ones I've mislabelled already. Do tell me quietly." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei always look at my dried herbs the way a man looks at a caged bird. They were picked kindly, I promise you, or kindly enough." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "If you're after blasting powder, I don't keep it, and I'd thank you not to bring any in. Everything on these shelves is the gentle sort of powder, the kind that doesn't take a wall down with it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Orcs usually grind their own powders and pick their own herbs, and I've never had one ask me for help. Are you the first, or has some shaman sent you shopping?" },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've heard your people trade in a kind of stone that's power and coin both, and I'd give a good deal to see one. I've nothing like it on these shelves, I'm sorry to say." },
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
        { text = "Do you sell anything for the work I do after dark?", next = "shards", when = { class = "WARLOCK" } },
        { text = "My people make better powders than these.", next = "race_powders", when = { race = "Troll" } },
        { text = "Do you sell to the Apothecaries?", next = "race_apoth", when = { race = "Scourge" } },
        { text = "Three of your labels are wrong.", next = "race_labels", when = { race = "Gnome" } },
        { text = "This herb was picked before it was ready.", next = "race_unripe", when = { race = "Tauren" } },
        { text = "These were torn up by the roots.", next = "race_roots", when = { race = "NightElf" } },
        { text = "Any blasting powder behind the counter?", next = "race_blasting", when = { race = "Dwarf" } },
        { text = "Do any of these jars hold something of the elements?", next = "race_elements", when = { race = "Skyborne" } },
        { text = "Good day.", next = "END" },
      },
    },
    race_powders = {
      lines = { { id = "race_powders_l", text = "I don't doubt it, and I'd never dare argue with somebody whose grandmother could curse me. If you ever have a recipe you'd part with, though, I'd like to hear it, and I'd ask no questions about the bones." } },
      choices = { { text = "Some recipes don't leave the Echo Isles.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    race_apoth = {
      lines = { { id = "race_apoth_l", text = "When they come, and they come with lists longer than my arm and seals I'm not meant to read. I sell them the plain things, roots and salts, and I try not to wonder what they mix them into." } },
      choices = {
        { text = "Better that you don't wonder.", next = "race_apoth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_apoth2 = {
      lines = { { id = "race_apoth2_l", text = "That's what I tell myself, and it sounds more convincing from one of your people. Keep your secrets and I'll keep my shelves, and we'll both sleep, or whatever it is you do instead." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    race_labels = {
      lines = { { id = "race_labels_l", text = "Only three? Then I'm doing better than last month, when a gnome found seven and wrote corrections on every jar in very small, very neat handwriting." } },
      choices = { { text = "Make that four. I missed one.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    race_unripe = {
      lines = { { id = "race_unripe_l", text = "Was it? I'll take your word over the herbalist's, since your people were gathering on the plains long before anyone sold herbs in jars. Tell me what to look for, and I'll send the next batch back." } },
      choices = {
        { text = "Look at the root, not the leaf.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_roots = {
      lines = { { id = "race_roots_l", text = "They were, and I know your people would rather they weren't, because a kaldorei druid told me so for the better part of an hour. I've started asking the herbalists to leave a little behind, though I can't swear they listen." } },
      choices = {
        { text = "Then the hills will thank you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_blasting = {
      lines = { { id = "race_blasting_l", text = "None, and if I did, I'd sell it to you through the window with the door shut. Your miners can blow up their own mountains, but I'd like to keep my shop standing." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_elements = {
      lines = { { id = "race_elements_l", text = "Not that I know of, though a shaman once swore my sulphur was full of fire and wouldn't stop staring at it. If you can feel something in these jars that I can't, I'd honestly rather you didn't tell me." } },
      choices = {
        { text = "The sulphur is a little restless.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
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
        { id = "sh_default", text = "No, and I'll thank you not to ask that so loudly. I can guess the sort of work you mean, and I'd rather not know more, so we'll keep to candles and powders between us." },
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
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "PALADIN" },
      text = "A gnome in plate! I'd have sworn the armour weighed more than you, and yet here you stand in it. The Light never cared how tall a shield-bearer was, only that they stayed in front." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "PALADIN" },
      text = "A kaldorei who answers to the Light, and not only to Elune, or perhaps to both; I've never had to ask that of a student before. Tell me which you pray to, once we're done, because I'd like to know." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "PALADIN" },
      text = "An orc who calls on the Light. The Alliance I served kept your people in the camps, and I'd not blame you if that sat badly between us, but the Light seems to have settled the matter without asking either of us." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "PALADIN" },
      text = "A troll paladin. Your loa want offerings, I'm told, and the Light asks only that you stand in front of somebody weaker, so I'm curious which of them is louder in your head." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "PALADIN" },
      text = "A tauren who answers to the Light! I'd have guessed your people too settled in the Earth Mother's ways for it, and I'm glad to be wrong. You'll have to tell me someday whether she minds." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "PALADIN" },
      text = "Your people were gone ten thousand years, and now one of you kneels to the Light. I'll not pretend to know what you were taught before, but you're welcome to whatever I can teach you now." },
    { id = "n_deaths", cat = "class", when = { class = "PALADIN", deaths = { min = 20 } },
      text = "You've been carried back from the dead more often than I'd like to count, by the look of you. A shield is meant to be held up, {class}, not admired from the ground." },
    { id = "n_scarlet", cat = "class", when = { class = "PALADIN", killed = { name = "Scarlet", min = 25 } },
      text = "There's red dye under your gauntlets, and I don't think it's wine. Cutting down men who pray to the same Light is a hard road, so walk it with your eyes open." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The Light pulls back from you, warlock, the way a hand pulls back from a hot stove. Ask whatever you came to ask, but I'll answer it from across the room." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Take that demon's hide off before you stand in a hall of the Light. I can feel it from here, a cold crawl along my arms, and so can every squire in the room." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "A warlock has bound your soul to a stone. Some call that a kindness and I'll not lecture you, but the Light would have brought you back without asking a price." },
    { id = "n_lock_stones", cat = "lock_stones", when = { ["not"] = { class = "WARLOCK" }, carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "You carry a warlock's healthstone. It'll close a wound, I don't doubt it, but I'd sooner you came to us for healing that doesn't remember where it was taken from." },
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
        { text = "Does Stormwind still remember the Silver Hand?", next = "race_stormwind", when = { race = "Human" } },
        { text = "Ironforge came late to the Light.", next = "race_ironforge", when = { race = "Dwarf" } },
        { text = "The Light burns me every time I call on it.", next = "race_burn", when = { race = "Scourge", class = "PALADIN" } },
        { text = "The order's plate wasn't made for someone my size.", next = "race_size", when = { race = "Gnome", class = "PALADIN" } },
        { text = "Elune and the Light seem very alike to me.", next = "race_elune", when = { race = "NightElf" } },
        { text = "The Alliance put my people in camps, and you served it.", next = "race_camps", when = { race = "Orc" } },
        { text = "The loa and the Light ask very different things.", next = "race_loa", when = { race = "Troll" } },
        { text = "The Earth Mother and the Light don't feel so different.", next = "race_earth", when = { race = "Tauren" } },
        { text = "I'd never heard of the Light before my people came back.", next = "race_newlight", when = { race = "Skyborne" } },
        { text = "Farewell.", next = "END" },
      },
    },

    -- Race-gated replies.
    race_stormwind = {
      lines = { { id = "race_stormwind_l", text = "It remembers in the Cathedral, where the old banners hang and the squires still learn the founders' names by heart. The rest of the city forgets, I think, because it's busy with troubles of its own." } },
      choices = {
        { text = "Then I'll remember for them.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_ironforge = {
      lines = { { id = "race_ironforge_l", text = "Late, but whole-hearted, which I'll take over early and lukewarm any day. Your people in the Mystic Ward pray the way they forge, loud and long and all at once, and the Light seems to enjoy it." } },
      choices = { { text = "We do everything that way.", next = "BACK", fx = { trait = { proud = 1 } } } },
    },
    race_burn = {
      lines = { { id = "race_burn_l", text = "Then you're paying a price none of my other students pay, and you're still here paying it. I can't tell you why it hurts, but a thing that costs that much is a thing you truly mean." } },
      choices = {
        { text = "Some days I wonder if it's a punishment.", next = "race_burn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_burn2 = {
      lines = { { id = "race_burn2_l", text = "If it were, I think it would have stopped answering you, and it hasn't. The Light doesn't bargain and it doesn't torment, so call it the cost of carrying something heavy, and carry it anyway." } },
      choices = { { text = "I'll carry it.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } } },
    },
    race_size = {
      lines = { { id = "race_size_l", text = "No, and the armourers grumble every time, but they manage it. A shield that comes up to your nose still stops a blade, and the Light fills in whatever the smith couldn't." } },
      choices = { { text = "And the hammer?", next = "race_size2" } },
    },
    race_size2 = {
      lines = { { id = "race_size2_l", text = "Swing it from the hip and let the weight do the work, the way a smith does. I've watched gnome paladins knock down ogres, and the ogres never once saw it coming, because they were looking for somebody taller." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    race_elune = {
      lines = { { id = "race_elune_l", text = "Perhaps they are, and perhaps they're one thing seen through different eyes; I've heard the Cathedral's scholars argue it both ways until supper went cold. Pray to whichever answers you, and I'll not quarrel with the moon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    race_camps = {
      lines = { { id = "race_camps_l", text = "It did, and I'll not dress that up as anything it wasn't. Many of the knights called it a mercy at the time, and a few of us knew better and said nothing, which is its own kind of sin." } },
      choices = {
        { text = "And now you teach an orc.", next = "race_camps2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_camps2 = {
      lines = { { id = "race_camps2_l", text = "Now I teach an orc, and the Light answers you as readily as it answers me, which I take as the Light's own opinion of those camps. Make better use of it than we did." } },
      choices = { { text = "I intend to.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_loa = {
      lines = { { id = "race_loa_l", text = "They do, from the little I know of the loa, and I'll not ask you to choose between them today. Only be sure you know which one you're calling on in a fight, because a paladin who hesitates there is a paladin who falls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    race_earth = {
      lines = { { id = "race_earth_l", text = "Perhaps not, and I've no wish to quarrel with her. The Light asks you to shelter the weak, and from what I hear the Earth Mother asks the same, so I doubt she'll be jealous of a little extra help." } },
      choices = { { text = "She isn't the jealous sort.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_newlight = {
      lines = { { id = "race_newlight_l", text = "Then you've a great deal to catch up on, and very little of it is as tidy as the sermons make it sound. Start with the people around you, because the Light shows itself in what you do for them long before it shows itself in any book." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
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
    { id = "n_human", cat = "class", when = { race = "Human", class = "PRIEST" },
      text = "You fold your hands the Cathedral's way, right up to the knuckles. Somebody in Stormwind taught you well, and I'll try not to undo it." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "PRIEST" },
      text = "A dwarf priest, and you smell faintly of the forge, as every one of them does. Your people pray like they're hammering something into shape, and I've come to like it." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "PRIEST" },
      text = "A priest of Elune, standing among the Light's candles. Some say the moon and the Light are cousins, so I'll teach you what I can and you may pray how you like." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "PRIEST" },
      text = "A Darkspear priest! Your people have their loa and their witch doctors, and still you came to learn what I teach, so tell me what the loa make of that when you've the time." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "PRIEST" },
      text = "A tauren who heals with the Light and not only the Earth Mother's spirits. I've never taught one of your people before, and I expect you'll teach me a good deal about patience." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "PRIEST" },
      text = "An orc priest. Your old warlocks sold your people to demons, and I'd guess that leaves you wary of any power you can't see, but the Light asks nothing back, and I hope you'll let it prove that." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "PRIEST" },
      text = "I've not taught one of your people before, and I'm told you hold the elements dearer than any god. Whatever brought you to the Light, I'm glad of it." },
    { id = "n_hurt", cat = "class", when = { class = "PRIEST", durability = { max = 0.25 } },
      text = "A priest, with armour like that? You've been standing in front of the fighters again, and you belong behind them, always behind." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Out of the shadow for the lesson, please. Nothing I teach will reach you through it." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Forgive me if I don't offer you a blessing; the Light would only flinch from it, and so would you. Say what you came to say, and I'll listen." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Your soul is held in a stone. I can feel the knot of it, tied tight to something that isn't the Light. When you fall, I'd sooner raise you myself, if you'll let a priest try first." },
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "A healthstone, in a temple. It heals, I know, but there's someone else's life pressed into it, and the candles have noticed even if you haven't." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "The Light shows me a green stain on you, deeper than the skin. It can still be washed out, though not by me alone, and not if you keep adding to it." },
  },
  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Ah, the other half of the craft. Careful it doesn't become the whole of it." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "Did you just call demon hide onto yourself, here, before the altar? Every candle went out at once, and I'll not light them again until you've gone." },
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
        { text = "Why does the Light still answer me?", next = "race_answer", when = { race = "Scourge" } },
        { text = "I pray to Elune. Will the Light mind?", next = "race_elune", when = { race = "NightElf" } },
        { text = "The loa are watching what I learn here.", next = "race_loa", when = { race = "Troll" } },
        { text = "Our priests pray in the Mystic Ward, with the forge below.", next = "race_ward", when = { race = "Dwarf" } },
        { text = "Faith seems awfully imprecise.", next = "race_precise", when = { race = "Gnome" } },
        { text = "My people learned to distrust any power that makes promises.", next = "race_promise", when = { race = "Orc" } },
        { text = "The Earth Mother heals too.", next = "race_earth", when = { race = "Tauren" } },
        { text = "The Cathedral teaches the Light as a duty.", next = "race_duty", when = { race = "Human" } },
        { text = "My people honoured the elements, not any god.", next = "race_elements", when = { race = "Skyborne" } },
        { text = "Farewell.", next = "END" },
      },
    },
    race_answer = {
      lines = { { id = "race_answer_l", text = "I don't know, and nor does anyone at the Cathedral, though they'd never admit it. I think the Light looks at what you do now and not at what was done to you, and I find that easier to believe than the alternative." } },
      choices = {
        { text = "Most of my people turned to the shadow instead.", next = "race_answer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_answer2 = {
      lines = { { id = "race_answer2_l", text = "Many did, and I can't blame them, because the shadow doesn't burn. You chose the harder road, and I'd ask you to keep choosing it, one cold morning at a time." } },
      choices = { { text = "I'll keep choosing it.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } } },
    },
    race_elune = {
      lines = { { id = "race_elune_l", text = "The Light has never once told me it minds anything, and I've given it plenty of cause. Elune's priestesses have healed under the moon for ten thousand years, so pray to her, and I'll teach you what the Light can add." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { pious = 1 } } } },
    },
    race_loa = {
      lines = { { id = "race_loa_l", text = "Then let them watch, and let them see you heal somebody. I don't know the loa, but I'd guess even the ones who keep the dead can't begrudge a soul kept a little longer from them." } },
      choices = {
        { text = "You'd be surprised what the loa begrudge.", next = "race_loa2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_loa2 = {
      lines = { { id = "race_loa2_l", text = "I'm sure I would, and I'll not pretend to know your spirits better than you do. Give them their due, and give the wounded theirs, and if the two ever pull against each other, come and talk to me before you choose." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_ward = {
      lines = { { id = "race_ward_l", text = "I've heard the floor shakes while they pray, and I'd dearly like to hear one of their hymns sung over that noise. Your people found the Light late, but they found it shouting, and that counts for something." } },
      choices = { { text = "Shouting's the only way to be heard over a forge.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_precise = {
      lines = { { id = "race_precise_l", text = "It is, and that's the hardest thing I'll ever teach a gnome. You can't measure the Light, only notice where it's been, so keep a journal of every heal if you must, and see what your numbers tell you." } },
      choices = {
        { text = "I've already started one.", next = "race_precise2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_precise2 = {
      lines = { { id = "race_precise2_l", text = "Of course you have. Show it to me in a month, and I'd wager the pages that matter most are the ones where you forgot to write anything down, because you were too busy keeping somebody alive." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    race_promise = {
      lines = { { id = "race_promise_l", text = "And you were right to, after what the warlocks made of you. The Light makes no promises, though, and asks for nothing back, and you'll have to watch it a long while before you believe that, so I'll not hurry you." } },
      choices = { { text = "I'm watching it.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    race_earth = {
      lines = { { id = "race_earth_l", text = "She does, through your druids and your shamans, and I'd never say otherwise. The Light is only another hand on the same wound, and I'd guess the wounded don't much care whose it is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    race_duty = {
      lines = { { id = "race_duty_l", text = "It does, and duty's a fine place to begin, though a poor place to stop. Archbishop Benedictus would tell you the same, if you could ever get past his clerks to ask him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    race_elements = {
      lines = { { id = "race_elements_l", text = "Then the Light will feel strange to you at first, because it isn't a spirit you can bargain with or a wind you can name. Give it time; most priests come to it strangely, whatever they believed before." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
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
    { id = "n_human", cat = "class", when = { race = "Human", class = "MAGE" },
      text = "Another human with Dalaran in their eyes! Every one of you who walks in here dreams of the Violet Citadel, and I've never had the heart to tell you how few the Kirin Tor let through the gate." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "MAGE" },
      text = "A dwarf of the arcane! Your people trust stone and steel and very little else, so you must have wanted this badly. Keep that stubbornness; it's half of what a mage needs." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "MAGE" },
      text = "A kaldorei mage. Your people forbade this magic after the Highborne nearly ended the world, and I'd not blame you for glancing over your shoulder while you study it, only study it properly." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "MAGE" },
      text = "A tauren mage, with a spellbook that looks very small in those hands. The arcane is a long way from the Earth Mother's ways, but I'll teach you as gently as I can." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "There's a stink of brimstone and a cold draught coming off you, and my wards just flickered. Dalaran expelled students for less, you know, and most of them deserved it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Soul shards, and a good many of them. In Dalaran we'd have called that evidence; here I'll only call it a poor thing to carry into a library." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "Your eyes are picking out things in this room that are meant to stay hidden. Stop looking at my wards, please; they're shy, and they're expensive." },
    { id = "n_lock_breath", cat = "lock_breath", when = { class = "WARLOCK", aura = { 5697 } },
      text = "You're breathing water like air, I can see the weave of it on you, and it's neat work for a demon's gift. The arcane does the same with a little study and nobody to owe afterwards." },
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
        { text = "My people's warlocks ruined us. Is this any different?", next = "race_warlocks", when = { race = "Orc" } },
        { text = "The witch doctors say this magic isn't ours.", next = "race_foreign", when = { race = "Troll" } },
        { text = "Our engineers think the arcane is too imprecise.", next = "race_engineers", when = { race = "Gnome" } },
        { text = "I studied in Dalaran, when I was alive.", next = "race_studied", when = { race = "Scourge" } },
        { text = "My people work beside the Kirin Tor now.", next = "race_highorder", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "I'd like to study in Dalaran one day.", next = "race_dream", when = { race = "Human" } },
        { text = "My people trust a hammer more than a spell.", next = "race_hammer", when = { race = "Dwarf" } },
        { text = "My people swore off this magic after the Sundering.", next = "race_sworn", when = { race = "NightElf" } },
        { text = "The arcane feels nothing like the land.", next = "race_land", when = { race = "Tauren" } },
        { text = "Farewell.", next = "END" },
      },
    },
    race_warlocks = {
      lines = { { id = "race_warlocks_l", text = "It is, though I'll not pretend the line between us is as wide as I'd like. A warlock bargains with demons for power, and a mage studies the world's own currents, and Dalaran expelled students for confusing the two." } },
      choices = {
        { text = "Then I'll study, and bargain with nobody.", next = "race_warlocks2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_warlocks2 = {
      lines = { { id = "race_warlocks2_l", text = "Good. Your people paid for the warlocks' bargains with the blood in their eyes and the colour of their skin, and you'll pay for this only in hours and headaches, which is a far better price." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } } },
    },
    race_foreign = {
      lines = { { id = "race_foreign_l", text = "They're right, and I'd never tell a witch doctor otherwise to his face. The arcane came into this world through the night elves' Well and Dalaran's towers, and it's no more yours than mine until you put the work in." } },
      choices = { { text = "Then I'll put the work in.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    race_engineers = {
      lines = { { id = "race_engineers_l", text = "Your engineers have plainly never watched a polymorph go wrong, because it's precise in all the worst ways. Bring me your numbers, though; a mage who measures twice blows up half as often." } },
      choices = { { text = "Half as often is still too often.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_studied = {
      lines = { { id = "race_studied_l", text = "Then you've walked through libraries I've only read about, and I envy you that more than I'd like to admit. Do you remember much of it, or did the plague take the books along with everything else?" } },
      choices = {
        { text = "I remember the libraries better than my own family.", next = "race_studied2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_studied2 = {
      lines = { { id = "race_studied2_l", text = "That's a cold thing to say, and I suspect you meant it to be. Hold on to the libraries, then, because the Kirin Tor may never let any of us back inside them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    race_highorder = {
      lines = { { id = "race_highorder_l", text = "So I've heard, and I'll admit I'm jealous; they've opened doors to your High Order that I've knocked on for twenty years. If you learn anything there that you're allowed to share, I'd be very glad to hear it." } },
      choices = {
        { text = "My ancestors were magisters. We're only taking back what we lost.", next = "race_highorder2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_highorder2 = {
      lines = { { id = "race_highorder2_l", text = "Then you'll have more to remember than most of us have to learn, and I hope you're careful about which parts you take back. The Highborne knew a great deal, and not all of it ended well for them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    race_dream = {
      lines = { { id = "race_dream_l", text = "So would every human student I've ever had, and I'll tell you what I told them. Work until the Kirin Tor hear your name from somebody else, because they never take an application, only a reputation." } },
      choices = { { text = "Then I'll earn the reputation.", next = "BACK", fx = { trait = { proud = 1 } } } },
    },
    race_hammer = {
      lines = { { id = "race_hammer_l", text = "So do most sensible people, and yet here you are. A spell won't dull and it can't be dropped, and if you study hard enough, you'll be the first in your clan to set an ogre alight from across a valley." } },
      choices = { { text = "That would be worth a song in Ironforge.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    race_sworn = {
      lines = { { id = "race_sworn_l", text = "They did, and the Highborne who wouldn't swear off it were driven across the sea, so I'd say your people had cause. What made you take it up again, after ten thousand years of leaving it alone?" } },
      choices = {
        { text = "Someone ought to learn it who remembers the cost.", next = "race_sworn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    race_sworn2 = {
      lines = { { id = "race_sworn2_l", text = "Then you'll be a better mage than most of mine, who only learn the cost after they've paid it. Study, and keep that memory close, because the arcane will try very hard to make you forget." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    race_land = {
      lines = { { id = "race_land_l", text = "It doesn't, and I'd worry if it did. The land is patient and the arcane is not, so bring your people's patience to it, and you'll have an advantage most of my students would envy." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
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
    { id = "g_quiet", text = "Shut that door behind you first, and then tell me what you want." },
    { id = "g_vet", when = { class = "WARLOCK", minLevel = 40 }, text = "You're still yourself, I see, and not everyone who comes back from where you've been can say that." },
    { id = "g_away", when = { away = 7 }, text = "You've been away {away}, and you're still yourself. Shut the door and sit." },
    { id = "g_since", when = { levelsSince = 6 }, text = "You've grown stronger since our last lesson, and something has noticed. Let's make certain you stay the master of it." },
    { id = "g_taint", when = { taint = { min = 30 } }, text = "Close the door, and keep your hands where I can see them. Something came in with you, and I'd like to know what it is before we talk." },
    { id = "g_horde", when = { faction = "Horde", class = "WARLOCK" }, text = "Come in out of the light. The Warchief lets us work, but nobody in this city enjoys watching us do it." },
    { id = "g_alliance", when = { faction = "Alliance", class = "WARLOCK" }, text = "Come in, and quietly. The good people outside have agreed not to know we're here, and I'd like to keep it that way." },
    { id = "g_outsider", when = { ["not"] = { class = "WARLOCK" } }, text = "You're not one of mine, so say what you came to say, and keep your hands off the books while you say it." },
  },
  notice = {
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A Darkspear with a grimoire instead of a fetish. The loa won't thank you for it, and the demons won't know the difference." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp is looking at my books. Tell it to stop looking at my books, or I'll find out what it looks like inside a jar." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "WARLOCK" },
      text = "A gnome who reads grimoires. Your people like to know how things work, and I'll warn you now that some things work better when you don't look too closely." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "WARLOCK" },
      text = "An orc at this trade, after everything it cost your people. Either you're very brave or you haven't heard the stories, and I hope it's the first." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "WARLOCK" },
      text = "The dead make careful warlocks, since there's not much left in you for a demon to bargain over. Don't let that make you careless." },
    { id = "n_human", cat = "class", when = { race = "Human", class = "WARLOCK" },
      text = "Another one from the kingdoms, and I'd guess you learned your first words of this in a cellar with the door barred. Most of us did." },
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
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "WARLOCK" },
      text = "A dwarf with a grimoire under that beard. Your people saw what the Dark Irons got for calling up a power they couldn't hold, so I'd expect you to be the most careful student in this room." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "WARLOCK" },
      text = "A kaldorei at this trade. Your people still remember the night the Legion came through the Highborne's Well, so I'd guess nobody in Darnassus knows what you study here, and I'd keep it that way." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "WARLOCK" },
      text = "I've never had a tauren in this room before, and I'll confess I'm curious. Your elders will tell you the Earth Mother turns her face from this work, so I'd like to hear what made you come anyway." },
    { id = "n_skyborne", cat = "class", when = { race = "Skyborne", class = "WARLOCK" },
      text = "One of the Skyborne, at my door with a grimoire. I'd heard your forebears fled a prince who drew his power out of the Nether, so it's a strange road that brings one of you back to it." },
  },
  react = {
    { id = "r_demon", on = "pet", when = { pet = { type = "Demon" } }, text = "Ah, and here's your shadow. Sit it by the door and don't let it touch anything." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "Faster than that. If calling the armour takes you that long, you'll be wearing it in your grave." },
    { id = "r_lock_soulstone", on = "aura", when = { aura = { 20707, 20762, 20763, 20764, 20765 } }, text = "You've set the stone. Good; now I know you'll come back to hear the rest of this lesson." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "l_default", text = "Power is power, and the ones who sneer at where it comes from never seem to have enough of it." },
        { id = "l_young", when = { class = "WARLOCK", maxLevel = 20 }, text = "Your imp still talks back to you, doesn't it? Good; the day it goes quiet is the day you should start worrying." },
        { id = "l_veteran", when = { class = "WARLOCK", minLevel = 45 }, text = "You've bound things I'd hesitate to name aloud. Tell me how, quietly, and then tell me what they asked for in return." },
        { id = "l_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're no warlock, so I'll not explain myself. Most people who ask what I do don't really want to know." },
        { id = "l_capped", when = { class = "WARLOCK", minLevel = 60 }, text = "There's nothing left in my books that you haven't already read. Sit anyway, because a warlock with no one to talk to starts listening to the wrong voices." },
        { id = "l_holy", when = { class = { "PALADIN", "PRIEST" } }, text = "A servant of the Light, in my room, with that look on your face. Say your piece and go, and try not to bless anything on your way out." },
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
        { text = "What does this craft mean for one of my people?", next = "heritage", when = { class = "WARLOCK", race = { "Orc", "Troll", "Scourge", "Human", "Gnome", "Dwarf", "NightElf", "Tauren", "Skyborne" } } },
        { text = "What comes next for me?", next = "path", when = { class = "WARLOCK" } },
        { text = "Some nights I hear it whispering.", next = "whisper", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "Some would call this work hard to justify.", next = "justify" },
        { text = "The Light would see your whole craft burned.", next = "holy", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "What does it take to become a warlock?", next = "recruit", when = { ["not"] = { class = "WARLOCK" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    practise = {
      lines = {
        { id = "p_default", text = "Patience with your curses. Lay them, step back and let them work, because a warlock standing in the thick of the fight has forgotten what the craft is for." },
        { id = "p_young", when = { maxLevel = 20 }, text = "Learn to trade your own health for power and back again, and learn exactly how far you can push it. You'll find the line by falling over it once, so do that somewhere safe." },
        { id = "p_mid", when = { minLevel = 21, maxLevel = 39 }, text = "Learn to drain, life and mana both, so that a long fight feeds you instead of bleeding you dry. And learn to fear, because a foe running in terror is a foe who isn't hitting you." },
        { id = "p_veteran", when = { minLevel = 40 }, text = "Learn to send your servant where you'd never go yourself. That's the whole art, and it's also the whole danger." },
      },
      choices = {
        { text = "And if the demon turns on me?", next = "practise_turn" },
        { text = "Tell me about soul shards.", next = "shards_harvest" },
        { text = "Back to the other lessons, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    practise_turn = {
      lines = { { id = "pt_default", text = "Then you were weak, or careless, or it was cleverer than you, and you'll find out which while it's eating you. Bind it again, tighter, and never let it see you flinch." } },
      choices = {
        { text = "I won't flinch. I'll make it bleed.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'd rather it never came to that.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    shards_harvest = {
      narr = "The trainer turns a small violet stone over in one hand, then sets it down very carefully.",
      lines = {
        { id = "sh_default", text = "Every shard is the last of something that died under your hand while you were drinking from it, pulled out and set in stone. You'll spend them on the greater summonings and on healthstones and soulstones, and you'll never have quite enough, so take them when the killing's easy." },
        { id = "sh_undead", when = { race = "Scourge" }, text = "You'll find the harvest easier than the living do, I expect, since you know better than most what a soul is worth once it's loose. Every shard is the last of something you killed, set in stone, and you'll spend them faster than you'd like." },
      },
      choices = {
        { text = "Whose soul is it, though?", next = "shards_whose" },
        { text = "I'll keep my bag full.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    shards_whose = {
      big = true,
      lines = { { id = "sw_default", text = "A wolf's, a bandit's, a murloc's, whatever was dying under your hand. Some trainers will tell you a beast has no soul worth worrying about, and I won't tell you that, because I don't know, and neither do they." } },
      choices = {
        { text = "It was dying anyway. I waste nothing.", next = "BACK", reply = "Spoken like a warlock who'll still be alive in ten years, and I'm not sure I mean that as praise.", fx = { align = { honor = -1 }, trait = { practical = 1 } } },
        { text = "I'll take them only from things that deserve it.", next = "BACK", reply = "Then you'll be choosy, and you'll go short some days. I've known worse rules to live by, so keep it if you can.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Back to the lessons.", next = "BACK" },
      },
    },
    path = {
      lines = {
        { id = "pa_default", text = "More of the same, done better, and then something worse to bind. That's the whole path, and it doesn't end where you'd like it to." },
        { id = "pa_imp", when = { maxLevel = 9 }, text = "Your imp first, and learn it well, because everything after it is bigger and less forgiving. When you're ready, I'll send you to bind a voidwalker, and you'll have to beat it in the circle before it will serve you." },
        { id = "pa_void", when = { minLevel = 10, maxLevel = 19 }, text = "The voidwalker, if you haven't bound it yet, and the succubus after that. She'll fight you for the binding as the voidwalker did, but she fights with her tongue as well as the whip, so don't believe a word she says." },
        { id = "pa_succ", when = { minLevel = 20, maxLevel = 29 }, text = "The felhunter comes next, a hound that eats magic, and you'll be glad of it the first time a mage or a priest stands against you. Binding one will take you a long way from this room, so settle your affairs before you go." },
        { id = "pa_hunter", when = { minLevel = 30, maxLevel = 39 }, text = "A mount of your own, before long. When you're ready, I can teach you to call a felsteed out of the Nether, and you'll never have to pay a stable hand again." },
        { id = "pa_steed", when = { minLevel = 40, maxLevel = 49 }, text = "The great rituals are next: the infernal, which you call down out of the sky with a stone, and the doomguard, which takes a circle of five and one life to open the door. Master banishing and enslaving before you try either, because neither of them arrives friendly." },
        { id = "pa_ritual", when = { minLevel = 50, maxLevel = 59 }, text = "There's a warlock in the Burning Steppes called Mor'zul Bloodbringer, and he'll set you after a dreadsteed when you're ready for it. It's a long road through Scholomance and Dire Maul, and at the end of it waits a lord of Xoroth who would very much like to keep his horse." },
        { id = "pa_top", when = { minLevel = 60 }, text = "I've nothing left to show you that you haven't bound already, and I'll admit that frightens me a little. Whatever comes next, you'll find on your own." },
      },
      choices = {
        { text = "Does it get easier?", next = "path_easier" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    path_easier = {
      big = true,
      lines = { { id = "pe_default", text = "The binding gets easier, but what you're binding gets cleverer, so the work stays exactly as hard as it was. The only thing that changes is how far you fall when you get it wrong." } },
      choices = {
        { text = "Then I'll keep climbing. I want what's at the top.", next = "BACK", reply = "Everyone who climbed before you wanted it too. Some of them are still up there, and some of them are what's up there now.", fx = { align = { light = -1 }, trait = { proud = 1 } } },
        { text = "I'll climb only as far as fighting the Legion needs.", next = "BACK", reply = "A sensible limit, and a hard one to keep. Write it down somewhere, and read it to yourself on the nights it whispers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    master = {
      big = true,
      lines = { { id = "m_default", text = "The warlock is, always, right up until the moment the warlock isn't. Every one of us believes we hold the leash, and every one who fell believed it until they found themselves on the other end of it." } },
      choices = {
        { text = "I hold the leash. That is what mastery means.", next = "BACK", reply = "Then hold it tightly, and never let the thing on the other end hear you say that, because they all keep a careful count of every boast.", fx = { align = { order = 1, light = -1 }, trait = { stern = 1 } } },
        { text = "Perhaps I'm being used. I'll use it right back.", next = "BACK", reply = "That's the honest answer, and the one that keeps most of us alive, so long as you remember the demon is thinking exactly the same thing.", fx = { align = { order = -1, honor = -1 }, trait = { witty = 1 } } },
        { text = "Have you ever lost control?", next = "master_lost" },
      },
    },
    master_lost = {
      narr = "The trainer glances, without meaning to, at a patch of fresh paint on the far wall.",
      lines = { { id = "ml_default", text = "Once, and the room still has scorch marks under the new paint. I bound it again before it reached the door, and you're the first student I've told how close it came." } },
      choices = { { text = "Your secret's safe. I keep many.", next = "BACK", fx = { affinity = 1 } } },
    },
    whisper = {
      lines = {
        { id = "wh_default", text = "Of course you do; they all whisper, and the ones that don't are the ones you should really worry about. What does yours say?" },
        { id = "wh_void", when = { pet = { family = "Voidwalker" } }, text = "From that one? Voidwalkers don't whisper, student, so whatever you're hearing is coming from somewhere else, and that's worse. What does it say?" },
      },
      choices = {
        { text = "That I'm stronger than the one who taught me.", next = "whisper_flattery" },
        { text = "It whispers. I don't listen, and that's the end of it.", next = "BACK", reply = "Good, and keep it that way. Not listening is a skill, and most of us are worse at it than we admit.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Some nights I think it's right.", next = "BACK", reply = "Then come and see me on those nights, before you do anything about it. I mean that, student; my door's shut, but it isn't locked.", fx = { affinity = 1, align = { order = -1 }, trait = { honest = 1 } } },
      },
    },
    whisper_flattery = {
      lines = { { id = "wf_default", text = "Then it's lying, or it's telling the truth, and both are dangerous. A demon that flatters you is measuring how much rope you'll give it, so give it none, and come and tell me the next time it says something kind." } },
      choices = {
        { text = "I'll come to you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Back to the lessons.", next = "BACK" },
      },
    },
    justify = {
      lines = {
        { id = "j_default", text = "The demons are coming whether we study them or not. I'd rather the one who understands them stood on our side than theirs, and if it costs me a little of my soul, that's mine to spend." },
        { id = "j_mage", when = { class = "MAGE" }, text = "This from a mage? Your Kirin Tor have dabbled in worse behind closed doors, and the only difference between us is that I don't pretend otherwise. The demons are coming either way, and I'd rather understand them." },
        { id = "j_lock", when = { class = "WARLOCK" }, text = "You'll hear that all your life, student, so you'd better have an answer ready. Mine is that the demons are coming whether we study them or not, and I'd rather it was one of us who understood them." },
      },
      choices = {
        { text = "That's a dangerous bargain.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    holy = {
      big = true,
      lines = { { id = "ho_default", text = "It would, and plenty of your kind have tried. Meanwhile the Legion's servants walk the roads in daylight wearing borrowed faces, and I'm the one who knows what they are, so you'll forgive me if I keep my books." } },
      choices = {
        { text = "Then turn what you know on the Legion, and nothing else.", next = "BACK", reply = "That's all I've ever done. Tell your Light that, and tell it I'd welcome its help the day the Legion comes back.", fx = { align = { light = 1 } } },
        { text = "Knowledge is knowledge. I won't judge you for it.", next = "BACK", reply = "From a servant of the Light, that's nearly a kindness. Don't say it too loudly at your temple.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll pray for you anyway.", next = "BACK" },
      },
    },
    recruit = {
      lines = { { id = "rc_default", text = "A strong will, a weak conscience, or the wit to tell the two apart, and a teacher who'll throw you out the first time you lie to them. Most who ask me that want power quickly, and the quick way is the way that eats you." } },
      choices = {
        { text = "I'll stay as I am, thank you.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I was only curious.", next = "BACK", fx = { trait = { curious = 1 } } },
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
        { id = "he_dwarf", when = { race = "Dwarf" }, text = "It means Ironforge must never find out, if you've any sense. Your people trust stone, steel and the Light, and the last dwarves who reached for a fire they couldn't hold were the Dark Irons, who called up Ragnaros and have been his slaves ever since." },
        { id = "he_nightelf", when = { race = "NightElf" }, text = "It means you've taken up something very close to what your people exiled the Highborne for. The Sentinels would call it a betrayal of Elune, and you'd have a hard time telling them they're wrong, so keep your books far from Darnassus." },
        { id = "he_tauren", when = { race = "Tauren" }, text = "It means walking where no tauren has walked, as far as I know, and the elders in Thunder Bluff will say you've turned from the Earth Mother. Prove them wrong by what you bind, and by what you never let it touch." },
        { id = "he_skyborne", when = { race = "Skyborne" }, text = "It means I'm guessing, because I know very little of your people. I've heard your ancestors were magisters once, and that they fled a prince who fed on the Nether, so you'll know better than most what reaching too far can cost." },
      },
      choices = {
        { text = "My people should know exactly what I do.", next = "BACK", reply = "Honest, and it'll cost you, but at least you'll never be caught out in a lie. Choose who you tell with care.", fx = { align = { honor = 1, order = 1 } } },
        { text = "What my people don't know won't hurt them.", next = "BACK", reply = "It's what every one of us has decided, sooner or later. Keep your secrets, and keep them well.", fx = { align = { honor = -1, order = -1 } } },
        { text = "My ancestors drank the demon's blood. Did it damn us?", next = "heritage_orc", when = { race = "Orc" } },
        { text = "Did the Highborne do what we do?", next = "heritage_nightelf", when = { race = "NightElf" } },
        { text = "Ironforge would see me jailed for this.", next = "heritage_dwarf", when = { race = "Dwarf" } },
      },
    },
    heritage_nightelf = {
      lines = { { id = "hne_default", text = "Not quite. Queen Azshara's Highborne drew on the Well of Eternity until the Legion heard them, and what they wielded was arcane, not fel, but it ended with demons walking the world all the same. A kaldorei who binds them ought to know that story better than anyone." } },
      choices = {
        { text = "Then I'll learn from their ruin.", next = "BACK", reply = "Learn from it every night, because the Highborne thought they'd learned too. Something else?", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heritage_dwarf = {
      lines = { { id = "hdw_default", text = "Jailed if you're lucky, and handed to the priests if you're not. Ironforge has never forgotten the Dark Irons, and a dwarf at this trade will look like the start of that story all over again to anyone who finds out." } },
      choices = {
        { text = "Then they won't find out.", next = "BACK", reply = "Good. Burn your notes, keep your voidwalker out of the taverns, and never practise where the stone can carry the sound.", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "HUNTER" },
      text = "An orc hunter, and I'd wager someone in your clan rode a wolf to war. Your people were raising beasts for battle long before they came to this world, so show me you can raise one for the hunt as well." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "HUNTER" },
      text = "A gnome hunter! I half expected you to come in with a clockwork squirrel on a lead, so I'm glad to see you'd rather have something with a heartbeat. Keep the gadgets out of my pens, though." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My cat's got her back up and won't stop growling at you. Animals smell brimstone a mile off, warlock, and they never forget whose hand it was on." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Get that burning horse away from the pens before it spooks every beast I've tamed this season. They'll be smelling its hoofprints for a week." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "There's something cold in your pack that makes the hounds whine. A hunter takes a beast's life and thanks it for it, but you've taken the soul as well, and I can't think what you'd say to it." },
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
        { text = "My people favour a rifle. Is that a lesser craft?", next = "gun", when = { class = "HUNTER", race = { "Dwarf", "Gnome" } } },
        { text = "Few humans walk this road. Will the beasts take to me?", next = "human_road", when = { class = "HUNTER", race = "Human" } },
        { text = "My people ride nightsabers. Can any beast be tamed like that?", next = "sabers", when = { class = "HUNTER", race = "NightElf" } },
        { text = "My people thank the beasts we kill. Is that your way?", next = "thanks", when = { class = "HUNTER", race = "Tauren" } },
        { text = "I learned to hunt in jungle, not on open plains.", next = "jungle", when = { class = "HUNTER", race = "Troll" } },
        { text = "My people rode wolves to war. Is a hunter's beast different?", next = "wolves", when = { class = "HUNTER", race = "Orc" } },
        { text = "Beasts shy from the dead. How do I win one over?", next = "dead_beast", when = { class = "HUNTER", race = "Scourge" } },
        { text = "Hunting here isn't like hunting at home.", next = "sky_hunt", when = { class = "HUNTER", race = "Skyborne" } },
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
    gun = {
      lines = {
        { id = "gu_default", text = "Not lesser, only louder. I've watched Ironforge mountaineers drop a ram at four hundred paces, which is further than any bow of mine will reach, but every beast in the valley hears the shot, so you'd best make the first one count." },
        { id = "gu_gnome", when = { race = "Gnome" }, text = "Not lesser, only louder, and I suspect you'd like to take the thing apart and make it louder still. A good rifle reaches further than my bow, but every beast in the valley hears it, so make the first shot count." },
      },
      choices = {
        { text = "And what does my companion make of the noise?", next = "gun_pet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gun_pet = {
      lines = { { id = "gp_default", text = "It flinches the first dozen times, and then it learns that the bang means supper. Feed it right after every shot you fire for a week, and you'll not be able to keep it away from the smell of powder." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },
    human_road = {
      lines = { { id = "hr_default", text = "They'll take to you as fast as you take to them, which is to say slowly. Your people have kept hounds and hawks for the lords' hunts as long as there have been lords, but a hound that fetches its master's supper isn't the same as a wolf that hunts beside you as an equal." } },
      choices = {
        { text = "How do I learn the difference?", next = "human_road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    human_road2 = {
      lines = { { id = "hr2_default", text = "Stop calling it. A hound comes when it's called, but a companion comes when it decides you're worth the trouble, and you earn that by feeding it first and sleeping where it can smell you." } },
      choices = { { text = "Feed it first. I'll remember.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    sabers = {
      lines = { { id = "sa_default", text = "Not any, though more than you'd think. The Sentinels raise their sabers from cubs, and that's a different bond from the one you'll make, because you'll be walking up to something grown and wild and asking it to choose you over everything it knows." } },
      choices = {
        { text = "What's the hardest beast you ever tamed?", next = "sabers_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sabers_hard = {
      lines = { { id = "sh_default", text = "A boar with one eye and a temper to match, and it took me three days and most of my patience. It never once let me scratch its ears, but it never left my side either, and I'd call that a bond." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    thanks = {
      lines = { { id = "th_default", text = "It's become my way, though I learned it late, and from a tauren, as it happens. I used to think it was only ceremony, and now I think it's the one thing that keeps a hunter from turning into a butcher." } },
      choices = {
        { text = "The Earth Mother provides. We only take what she gives.", next = "BACK", reply = "Then she'll keep providing for you, I'd guess. Walk gently, and something else?", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jungle = {
      lines = { { id = "ju_default", text = "Then you've learned to hunt close, where the vines hide everything ten paces off, and that's the harder kind. Out on open ground the trouble runs the other way, because the prey sees you coming a mile off, so learn to use the long grass and the wind the way you used the vines." } },
      choices = {
        { text = "And the beasts out here? Are they any smarter?", next = "jungle_beasts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jungle_beasts = {
      lines = { { id = "jb_default", text = "Not smarter, only warier, because they've nowhere to hide and they know it. A plains cat will watch you for an hour before it decides you're not worth running from, so let it watch, and don't move until it looks away." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    wolves = {
      lines = { { id = "wo_default", text = "Very different, and an orc ought to know it better than anyone. A war wolf is broken to the saddle and taught to bite on command, but a hunter's companion isn't broken at all, so if you go at it the way the old wolf-riders did, it'll be gone the first night you leave it unchained." } },
      choices = {
        { text = "The Frostwolves never broke their wolves.", next = "wolves_frost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wolves_frost = {
      lines = { { id = "wf_default", text = "So I've heard, and if it's true, the Frostwolves were hunters before they were soldiers, and you'd do well to learn their way. The Warchief lived among them in Alterac, so there's no shame in taking their lead." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dead_beast = {
      lines = { { id = "db_default", text = "Slowly, and from downwind. They smell the grave on you before they see you, and nothing you do will change that, so you'll have to give them reasons to stay that outweigh it." } },
      choices = {
        { text = "What reasons would a beast accept?", next = "dead_beast2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_beast2 = {
      lines = { { id = "db2_default", text = "Food, first and always, and then quiet, because the living fidget and you don't. Start with the bats and spiders that already live among graves, and work your way up to the wolves once you've the knack of it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    sky_hunt = {
      lines = { { id = "sk_default", text = "I'd believe it, though I can't picture what home looked like for you, and I won't pretend to. Every beast I've ever trained turns its nose into the wind before it does anything else, though, so learn our winds and you'll learn our beasts." } },
      choices = {
        { text = "The winds here feel heavier.", next = "sky_hunt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_hunt2 = {
      lines = { { id = "sk2_default", text = "Heavier, you say? Then they'll carry scent further and slower than you're used to, which helps you and the prey alike. I'd like to hear how your aim changes with it, so come back and tell me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
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
    { id = "n_human", cat = "class", when = { race = "Human", class = "SHAMAN" },
      text = "A human who speaks to the elements! I'd never have believed it, and I'm not sure the spirits quite believe it yet, so be patient with them while they learn your voice." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "SHAMAN" },
      text = "A gnome shaman, and I can see you itching to measure the totems. The elements won't fit in a schematic, so put the calipers away and simply listen, which I suspect will be harder for you than the casting." },
    { id = "n_nightelf", cat = "class", when = { race = "NightElf", class = "SHAMAN" },
      text = "A kaldorei who calls on the elements instead of the moon. Your druids will think you've wandered off the path, but the spirits are older than any grove, and they don't seem to mind." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "SHAMAN" },
      text = "The spirits are uneasy around the dead, and I'll not lie to you about it. That they answer you at all is something I've never seen, so tell me sometime what you said to them, because I'd like to know." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" }, place = "replace",
      text = "Let the wolf go and sit with me. The spirits lend you that shape; they don't give it." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The spirits went quiet when you came in, warlock, the way birds go quiet before a storm. They remember what your craft did to Draenor, even if you were never there to see it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "You carry souls in your bag, bound in stone and still crying. The spirits can hear them, so speak quickly, because I'd rather they didn't listen to you for long." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Your blood runs hot with an imp's bargain. Fire is a spirit too, and it doesn't care to be bought; it only burns, and it will burn you when the bargain turns." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "The ground would sicken under you if you stood still long enough, and you've stood still too long already. The orcs drank from the same cup once, and it turned their sky green." },
  },
  react = {
    { id = "r_wolf", on = "form", when = { form = "ghostwolf" }, text = "The wolf runs well in you. Don't run so far you forget the way back." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "You put on a demon's skin in a lodge of the spirits? The brazier just turned its face from you, and so do I." },
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
        { text = "My people lost the spirits once. Could it happen again?", next = "lost", when = { class = "SHAMAN", race = "Orc" } },
        { text = "Ironforge thinks I'm mad for talking to stone.", next = "stone", when = { class = "SHAMAN", race = "Dwarf" } },
        { text = "Our elders say the elements are the Earth Mother's children.", next = "mother", when = { class = "SHAMAN", race = "Tauren" } },
        { text = "Do the loa and the elements ever quarrel?", next = "loa", when = { class = "SHAMAN", race = "Troll" } },
        { text = "The wind spirits are dear to my people.", next = "sky_wind", when = { class = "SHAMAN", race = "Skyborne" } },
        { text = "Will the elements truly answer one of the dead?", next = "dead_elem", when = { class = "SHAMAN", race = "Scourge" } },
        { text = "Few of my people walk this path. Will the spirits accept me?", next = "newpath", when = { class = "SHAMAN", race = { "Human", "Gnome", "NightElf" } } },
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
    lost = {
      lines = { { id = "lt_default", text = "It could, and that's the truth every orc shaman carries. The spirits came back to Thrall because he asked with humility once the demon blood was gone, and they'll leave again the moment the Horde forgets why they left the first time." } },
      choices = {
        { text = "Then I'll make sure we don't forget.", next = "BACK", reply = "Remember it for those who'd rather not. That's half of what a shaman is for.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = { { id = "so_default", text = "Ironforge has been talking to stone for a thousand years with pick and hammer, so you're only asking politely where your kin shout. They'll come round the day the earth warns you of a cave-in and doesn't warn them." } },
      choices = {
        { text = "Do the spirits mind the mines?", next = "stone_mines" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone_mines = {
      lines = { { id = "sm_default", text = "Some of them do. The earth grumbles where miners dig too greedily, and you'll hear it in the deep places under Dun Morogh if you listen, so teach your kin to ask before they dig, if any of them will hear it from you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    mother = {
      lines = { { id = "mo_default", text = "Your elders taught the Warchief that very thing, and he's never been shy of saying so. I think they're right, and I think it's why tauren make the most patient shamans I've ever trained, because nobody hurries a mother's children." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    loa = {
      lines = { { id = "lo_default", text = "Not that I've heard, though your witch doctors would know better than I would. The loa are spirits with names and wants, and the elements are older and simpler, so I suspect they've little to quarrel over, but tell me if you ever hear otherwise." } },
      choices = {
        { text = "The loa always want something.", next = "loa_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loa_want = {
      lines = { { id = "lw_default", text = "And the elements want only to be asked, which makes them the cheaper bargain, I'd say. Keep your offerings for the loa and your respect for the elements, and you'll not offend either one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    sky_wind = {
      lines = { { id = "sw_default", text = "So the Earthen Ring told us when your Windshapers came to the Horde, and I've seen it in every one of you since. Air is the hardest element to keep, because it never stays where you ask, so tell me: how do your people hold it?" } },
      choices = {
        { text = "We don't hold it. We follow it.", next = "BACK", reply = "Then you understand air better than I do, and I've been at this a long while. Winds be with you, as your people say.", fx = { trait = { patient = 1 } } },
        { text = "With gratitude, and with a debt we still owe.", next = "BACK", reply = "A debt to the spirits is the one kind worth carrying. Pay it well.", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_elem = {
      lines = { { id = "de_default", text = "They answer you, so the answer is yes, though I couldn't tell you why. The spirits fled the Plaguelands when the Scourge came, and they've no love for what walks there, so I think they can tell the Scourge from those who threw it off." } },
      choices = {
        { text = "Do they forgive what I was?", next = "dead_elem2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_elem2 = {
      lines = { { id = "de2_default", text = "Forgiveness isn't something the elements think about. They judge what you do now, which is a kinder thing than most of the living will offer you, so make the most of it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    newpath = {
      lines = {
        { id = "np_default", text = "They'll accept anyone who asks with respect, and they've no idea what your people are supposed to do. That's a freedom, if you use it well." },
        { id = "np_human", when = { race = "Human" }, text = "They'll accept anyone who asks with respect, but your people have spent a long time praying to the Light instead. The trick for you is learning that the elements want to be thanked, not prayed to." },
        { id = "np_gnome", when = { race = "Gnome" }, text = "They'll accept anyone who asks with respect, though I'll warn you they don't care to be taken apart to see how they work. Ask, listen, and keep your notebook in your pocket until the totem's planted." },
        { id = "np_nightelf", when = { race = "NightElf" }, text = "They'll accept anyone who asks with respect, and your people have been listening to the wild for ten thousand years, so you're further along than you know. The difference is that the moon answers slowly, and fire answers at once." },
      },
      choices = {
        { text = "Then I'll ask, and keep asking.", next = "BACK", fx = { trait = { patient = 1 } } },
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
    { id = "n_human", cat = "class", when = { race = "Human", class = "DRUID" },
      text = "A human druid, and I'll admit I never expected to say those words. Your people cleared whole forests to build their kingdoms, so I'm curious to see what the wild will teach someone whose grandfathers felled it." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "DRUID" },
      text = "A dwarf in my grove, and a druid besides. Your people know the stone better than anyone living, so let's see whether you can learn the soil above it, and everything that grows there." },
    { id = "n_gnome", cat = "class", when = { race = "Gnome", class = "DRUID" },
      text = "A gnome druid, which is something I've never seen in all my years. I'd ask you very kindly not to take my saplings apart to find out how they grow, because they don't go back together." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "DRUID" },
      text = "An orc druid. Your people found their way back to the spirits through the shamans, so I wonder what made you choose the wild's shapes instead, and the Circle will certainly ask you." },
    { id = "n_troll", cat = "class", when = { race = "Troll", class = "DRUID" },
      text = "A Darkspear in the grove. Your people have kept company with beast-spirits for longer than mine have kept records, so I suspect the shapes come easier to you than you let on." },
    { id = "n_undead", cat = "class", when = { race = "Scourge", class = "DRUID" },
      text = "One of the Forsaken, and a druid? Nothing grows where the Plague passed, and I'd thought nothing that walked out of it could ever answer the wild, so if it answers you, I'd very much like to know why." },
    { id = "n_travel", cat = "form", when = { form = "travel" }, place = "replace",
      text = "Off the four legs, please, before you trample my seedlings. You can be a bear again once you're past the gate." },
    { id = "n_moonkin", cat = "form", when = { form = "moonkin" }, place = "replace",
      text = "A moonkin, in my grove! Sit, if you can work out how, and please don't hoot during the lesson." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My saplings are curling their leaves away from you. Every growing thing here can feel the fel on you, warlock, and they haven't the manners to hide it the way I do." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "That beast's hoofprints are smoking in my grass. Walk it out the way you came, on the path only, because the soil will need a season to forget it." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "You smell of Felwood, of rot under green. The land remembers every drop of fel it's ever been fed, and standing next to you, it's remembering." },
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "A healthstone. You'd sooner eat a stone full of somebody's stolen life than ask the earth for a little of its own? I don't understand it, but I'll not stop you." },
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
        { text = "My people gave up immortality at Hyjal. Was it worth it?", next = "hyjal", when = { class = "DRUID", race = "NightElf" } },
        { text = "Why did the Circle take tauren into its ranks?", next = "tauren_circle", when = { class = "DRUID", race = "Tauren" } },
        { text = "Can a druid honor the wind spirits and Elune both?", next = "sky_both", when = { class = "DRUID", race = "Skyborne" } },
        { text = "Can one of the dead truly walk in the wild?", next = "dead_wild", when = { class = "DRUID", race = "Scourge" } },
        { text = "My people have no druids. Will the Circle have me?", next = "newdruid", when = { class = "DRUID", race = { "Human", "Dwarf", "Gnome", "Orc", "Troll" } } },
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
    hyjal = {
      lines = { { id = "hy_default", text = "Ask a Sentinel and she'll say yes without blinking, and ask an old druid and you'll get a long silence first. Nordrassil's blessing was spent to stop Archimonde, and without it the world would belong to the Legion, but your people are only now learning what it means to grow old." } },
      choices = {
        { text = "What does it mean, for a druid?", next = "hyjal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal2 = {
      lines = { { id = "hy2_default", text = "It means the Dream can't be a place to wait out the centuries any more. Whatever you mean to mend in the wild, you'll have to mend in one lifetime, as the tauren and the rest of us always have." } },
      choices = {
        { text = "Then I'd best not waste it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_circle = {
      lines = { { id = "tc_default", text = "Because the tauren were already listening, long before anyone came to teach them. Hamuul Runetotem learned from Malfurion himself and carried that teaching home to Thunder Bluff, where it took root in ground that was ready for it." } },
      choices = {
        { text = "Do the kaldorei still see us as students?", next = "tauren_circle2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_circle2 = {
      lines = { { id = "tc2_default", text = "Some of the older ones do, and they'll tell you so in Moonglade with a smile that isn't quite kind. The rest have watched tauren druids heal the Barrens' scars, and they've stopped saying it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sky_both = {
      lines = { { id = "sb_default", text = "I don't see why not, though you'd know your own people's view better than I do. The Circle teaches balance, and I've never heard that balance means choosing one voice and stopping your ears to the rest." } },
      choices = {
        { text = "My people put the elements first.", next = "BACK", reply = "Then put them first, and let the moon have what's left. The wild won't complain.", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_wild = {
      lines = { { id = "dw_default", text = "You're standing in my grove and the grass hasn't withered under you, so perhaps. I've seen the Plaguelands, where every root has gone grey, and I'd thought the dead were the wild's enemy without exception." } },
      choices = {
        { text = "What would you have me do?", next = "dead_wild2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_wild2 = {
      lines = { { id = "dw2_default", text = "Plant something, and see whether it grows for you. If it does, you'll have answered a question the Circle never thought to ask, and if it doesn't, you'll only have lost a seed." } },
      choices = { { text = "I'll plant one.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    newdruid = {
      lines = {
        { id = "nd_default", text = "The Circle has never asked where a druid comes from, only whether they listen. Some of the elders will frown, but a frown isn't a closed door." },
        { id = "nd_human", when = { race = "Human" }, text = "The Circle has never asked where a druid comes from, only whether they listen. The kaldorei elders may be slower to warm to you than to their own, but slow isn't no." },
        { id = "nd_dwarf", when = { race = "Dwarf" }, text = "It will, and I suspect the earth will take to you faster than the moon does. Learn the bear first, because you've the shoulders for it already." },
        { id = "nd_gnome", when = { race = "Gnome" }, text = "It will, though I'll admit nobody's quite sure what shape a gnome bear turns out to be, and I'd very much like to find out." },
        { id = "nd_orc", when = { race = "Orc" }, text = "It will, but some will remember that Grom Hellscream's axe killed Cenarius in Ashenvale, so you'll have more to prove than most. Prove it by what you heal, not by what you say." },
        { id = "nd_troll", when = { race = "Troll" }, text = "It will, and you'll not be the strangest thing that's ever walked into Moonglade. Speak to the trees as you'd speak to a loa, with respect and something in your hand, and you'll do well." },
      },
      choices = {
        { text = "Then I'll prove I listen.", next = "BACK", fx = { trait = { patient = 1 } } },
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
    { id = "n_human", cat = "class", when = { race = "Human", class = "ROGUE" },
      text = "A human, and I'd bet my last copper somebody's told you this trade belongs to the Defias. It doesn't; they only borrowed it, and badly." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "ROGUE" },
      text = "An orc who wants to work from the shadows. Your people like their fights loud and in the open, so I'll warn you that the hardest lesson here is keeping your mouth shut when your blood's up." },
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "ROGUE" },
      text = "A tauren rogue, and I heard you coming from the street. Don't take it hard, because I've watched stranger things learn to vanish, but we'll start with your hooves and work up." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "Your eyes followed me across the room before I'd even moved. Detect Invisibility, is it? I'll thank you not to wear that in here, because it's very bad for the lessons." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "The bag on your hip clinks like a purse but sounds colder. I could have it off you in a heartbeat, but I'm not touching anything that hums." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That demon hide creaks every time you breathe. It's fine for standing in a fight and useless for anything else, so take it off before you try sneaking past me." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "A burning horse, for somebody who'd like not to be seen? Every sentry from here to the coast will follow the smoke straight to you." },
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
        { text = "Stormwind thinks my trade belongs to the Defias.", next = "defias", when = { class = "ROGUE", race = "Human" } },
        { text = "Orcs prize open battle. Is there honor in this?", next = "orc_honor", when = { class = "ROGUE", race = "Orc" } },
        { text = "Can someone my size really learn to vanish?", next = "big", when = { class = "ROGUE", race = "Tauren" } },
        { text = "Do gadgets have a place in this trade?", next = "gadgets", when = { class = "ROGUE", race = "Gnome" } },
        { text = "They say dwarves aren't made for sneaking.", next = "dwarf_sneak", when = { class = "ROGUE", race = "Dwarf" } },
        { text = "My people can fade into shadow. Is that cheating?", next = "meld", when = { class = "ROGUE", race = "NightElf" } },
        { text = "I learned to stalk prey in the jungles of home.", next = "stalk", when = { class = "ROGUE", race = "Troll" } },
        { text = "The Dark Lady's deathstalkers do this work too.", next = "deathstalkers", when = { class = "ROGUE", race = "Scourge" } },
        { text = "My people stayed hidden for ten thousand years.", next = "hidden_people", when = { class = "ROGUE", race = "Skyborne" } },
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
    defias = {
      lines = { { id = "df_default", text = "Stormwind thinks a lot of things, and some of them are even true. SI:7 does this same work for the crown, and does it better than VanCleef's lot ever will, so if anyone sneers at you, ask who they think keeps the Defias out of the Keep." } },
      choices = {
        { text = "Could SI:7 use someone like me?", next = "defias_si7" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias_si7 = {
      lines = { { id = "ds_default", text = "They don't take applications, and anyone who tells you otherwise is selling something. Do quiet, useful work in Westfall and Redridge, and if you're good enough, someone in SI:7 will know your name before you ever think to ask." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    orc_honor = {
      lines = { { id = "oh_default", text = "There's honor in winning, and in bringing your friends home alive, and a blade in the dark does both. The Burning Blade hide in Orgrimmar's own shadows, and it's quiet work, not warbands, that roots them out, though nobody sings songs about it." } },
      choices = {
        { text = "Then I'll fight unseen, and be proud of it.", next = "BACK", reply = "Be proud in private, then. Pride's the loudest thing a rogue can carry.", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big = {
      lines = { { id = "bg_default", text = "Size is the least of it. Shadows don't care how tall you are, only how still, and your people know how to stand in long grass until the prey walks right up to them, so you're further along than your footsteps suggest." } },
      choices = {
        { text = "And my footsteps?", next = "big_steps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    big_steps = {
      lines = { { id = "bs_default", text = "Wrap your hooves in felt and walk on the outside edge, and practise on gravel until you can cross it without a sound. It'll take you a season, and it'll be the best season you ever spent." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    gadgets = {
      lines = { { id = "gd_default", text = "A good lockpick is a gadget, if you like, and so is a smoke bomb, so yes, within reason. What doesn't belong is anything that whirs, ticks or might go off in your pocket while you're standing behind a guard." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },
    dwarf_sneak = {
      lines = { { id = "dk_default", text = "They say a great deal in Ironforge, mostly over ale. A dwarf is low to the ground, steady on its feet and patient as stone, which is three of the four things I look for, so the only thing left to teach you is to stop humming." } },
      choices = {
        { text = "I don't hum.", next = "BACK", reply = "You hummed all the way across the room. Something else?", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    meld = {
      lines = { { id = "me_default", text = "Of course it is, and I'd cheat too if I could. The trick is that it only holds while you're still, so learn to move the way you stand, and you'll be the best student I've had in years." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stalk = {
      lines = { { id = "sk_default", text = "Then you already know the most important thing, which is that prey always feels watched before it sees you. A city's the same jungle with stone instead of vines, and the guards are the beasts that bite back." } },
      choices = {
        { text = "And how do I stop it feeling watched?", next = "stalk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalk2 = {
      lines = { { id = "sk2_default", text = "Don't look at the mark; look at what the mark's looking at. People feel eyes on them, but nobody ever felt someone staring at the same shop window." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    deathstalkers = {
      lines = { { id = "dt_default", text = "They do, and they do it well, though I'd never say so to their faces. They learn the same tricks I teach and then add a few the living can't manage, like lying a week in a ditch without needing to eat, so if they'll have you, go." } },
      choices = {
        { text = "They haven't asked.", next = "deathstalkers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deathstalkers2 = {
      lines = { { id = "dt2_default", text = "Then do something in the Plaguelands worth noticing, and quietly. The Dark Lady's people watch the ones who kill the Scourge and say nothing about it afterwards." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    hidden_people = {
      lines = { { id = "hp_default", text = "Ten thousand years without being found is a craft I'd pay good gold to learn. Whatever your people knew about keeping out of sight, I hope some of it came down to you, because I'd like to see it." } },
      choices = {
        { text = "Some of it did.", next = "BACK", reply = "Then show me, and don't tell me. That's how it's done here.", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    { id = "n_human", cat = "class", when = { race = "Human", class = "WARRIOR" },
      text = "That's a barracks stance if ever I saw one: shield square, weight back, waiting for a sergeant to shout. It's a good stance in a wall of soldiers, so let's see how you fare when there's nobody standing beside you." },
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "WARRIOR" },
      text = "A dwarf, and built like a gatehouse. Your people were holding lines in the Second War before most of my students were born, so I'll not teach you to stand; I'll teach you when to move." },
    { id = "n_orc", cat = "class", when = { race = "Orc", class = "WARRIOR" },
      text = "An orc warrior. Your people learned to fight in harder schools than mine, so I'll not teach you to be fierce, only how to stay alive while you're being it." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That isn't armour, that's a demon's hide stretched over cloth. Real armour you earn with sweat and a smith, and a steel plate doesn't care what you've summoned." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "You carry yourself like someone who's never been hit. Warlocks always do, because something else stands in front of you, and one day it won't." },
    { id = "n_lock_stones", cat = "lock_stones", when = { ["not"] = { class = "WARLOCK" }, carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "You're carrying a warlock's healthstone into the fight. Fine, it'll keep you on your feet, but learn to stay on them without it first." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're flushed like a recruit who's run three laps, and you haven't run anywhere. That's an imp's pact in your blood, so don't mistake it for stamina." },
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
        { text = "Everyone tells me I'm too small for this.", next = "small", when = { class = "WARRIOR", race = "Gnome" } },
        { text = "My people have fought the centaur for generations.", next = "centaur", when = { class = "WARRIOR", race = "Tauren" } },
        { text = "My people leave the blade to the Sentinels.", next = "sentinels", when = { class = "WARRIOR", race = "NightElf" } },
        { text = "I don't feel pain. Why should I fear a blow?", next = "nopain", when = { class = "WARRIOR", race = "Scourge" } },
        { text = "Orcs are born warriors. What can you teach me?", next = "born", when = { class = "WARRIOR", race = "Orc" } },
        { text = "A dwarf's shield wall never breaks.", next = "wall", when = { class = "WARRIOR", race = "Dwarf" } },
        { text = "The Darkspear fight with a berserker's fury.", next = "fury", when = { class = "WARRIOR", race = "Troll" } },
        { text = "I was trained to fight in a line, with a sergeant shouting.", next = "line", when = { class = "WARRIOR", race = "Human" } },
        { text = "Will you train someone from a people you barely know?", next = "sky_train", when = { class = "WARRIOR", race = "Skyborne" } },
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
    small = {
      lines = { { id = "sm_default", text = "Everyone's wrong, though not entirely. You'll never out-push an ogre, so don't try; get under its guard and behind its knees before it's worked out where you went, and an ogre with no knees is just a very large rug." } },
      choices = {
        { text = "And if it steps on me?", next = "small2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    small2 = {
      lines = { { id = "sm2_default", text = "Then you were standing where it was looking, and that's the one mistake a small warrior can't afford. Stay at its flank and keep moving, and let the bigger fools in your party take the front." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    centaur = {
      lines = { { id = "ce_default", text = "Then you know how to fight something faster than you, which is most things, I'm sorry to say. The centaur ride rings around a slow warrior, so plant your hooves, let them come to you, and make the one blow you get count." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
    sentinels = {
      lines = { { id = "se_default", text = "Mostly, and the Sentinels have kept your forests safe for a very long time with glaive and bow. A kaldorei who comes to a plain soldier to learn the sword instead is a rarer thing, so tell me what brought you here, because I'm curious." } },
      choices = {
        { text = "I wanted a fight on my own terms.", next = "BACK", reply = "That's the best reason there is, and the one that keeps a warrior going when the glory runs out. Shield up, then.", fx = { trait = { proud = 1 } } },
        { text = "The Sentinels didn't need another glaive.", next = "BACK", reply = "And the world needs more people who'll stand at the front. Their loss, then.", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nopain = {
      lines = { { id = "np_default", text = "Because pain was never the danger; it was the warning. A blow that doesn't hurt still breaks bone and cuts sinew, and you'll find that out when your arm stops answering in the middle of a fight." } },
      choices = {
        { text = "Then how will I know when I'm hurt?", next = "nopain2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nopain2 = {
      lines = { { id = "np2_default", text = "Watch yourself the way you'd watch a recruit. Count the hits you take, check your joints between fights, and when your shield arm drops an inch, believe it before you believe your pride." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    born = {
      lines = { { id = "bo_default", text = "How to stop, mostly. Grom Hellscream's warriors were the fiercest the world had seen, and their fierceness was how the demons chained them in the end, so I'll teach you the one thing they never learned, which is when to hold." } },
      choices = {
        { text = "Grom broke those chains himself.", next = "born2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    born2 = {
      lines = { { id = "bo2_default", text = "He did, and he died doing it, and I'd rather you lived. Honour him by being the warrior he became at the end, not the one he was at the start." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wall = {
      lines = { { id = "wa_default", text = "Every wall breaks, given enough weight and time, and the good ones break slowly. Learn to give a step without giving the line, and you'll hold long after the wall beside you has gone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    fury = {
      lines = { { id = "fu_default", text = "So I've seen, and it's a fine thing to watch from a safe distance. Fury wins the first minute of a fight, though, and you'll need something else for the second, so let's teach you to breathe between swings." } },
      choices = {
        { text = "What comes after the fury?", next = "fury2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fury2 = {
      lines = { { id = "fu2_default", text = "Tired arms and a foe who waited for them. Save the fury for when the fight turns against you, and spend it all at once, and you'll be the one still standing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    line = {
      lines = { { id = "li_default", text = "And a fine line it is, but out here you'll mostly fight alone or beside three strangers. Learn to put your back to a wall the way you'd put it to the soldier beside you, and you'll last." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },
    sky_train = {
      lines = { { id = "sk_default", text = "I'd train anyone who'll hold a shield, and I'll admit I'm curious about your people, since I know next to nothing of where you've been all this time. Show me how you stand, and I'll tell you what to fix." } },
      choices = {
        { text = "Our guard taught me what I know.", next = "BACK", reply = "Then they taught you to keep your feet, which is the hard part. Let's see the rest.", fx = { affinity = 1 } },
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
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Orcs always sit a wind rider as if it were a wolf, knees in and heels down. It isn't a wolf, so don't kick it to make it go faster, or it'll show you how far down the ground is." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks. Wind riders won't fly with fel stink in the saddle, so send it off." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Quick on the ground, druid, but nothing on four legs beats a wind rider over open country." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "Your ghost wolf can't fly, shaman, so let it go and climb on." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Your burning horse stays on the ground, and so do you until the smell's gone. A wind rider will stand blood and dung and dead things, but it won't carry anyone who just climbed down off a demon." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "The wind riders are hissing at your pack. They know a soul when they smell one, even a little caged one, so keep the bag tied shut over open water." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That demon hide will have to come off, or the beast will try to scrape you off on the first tower it passes. Wind riders know what a demon smells like, warlock." },
    { id = "n_lock_breath", cat = "lock_breath", when = { class = "WARLOCK", aura = { 5697 } },
      text = "Breathing water now, are you? Good, because if the beast drops you in the sea for smelling of brimstone, you'll be the only passenger who ever swam home." },
  },
  lines = {
    { id = "l_default", text = "Hold the harness, not the rider's neck. It bites." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Wind riders won't share a saddle with your beast, so it stays below and finds you at the other end. They always do." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "You grip the harness like it's an axe haft. Loosen up, or the rider will shake you loose for the fun of it." },
  },
  choices = { { text = "Just the flight.", next = "BUSINESS" } },
  -- Racial pass: a small tree so each Horde race has something of its own to ask.
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The riders are fed and the harness is mended, so you can be in the air before the dust settles. Where are you bound, or is there something you want to ask first?" },
        { id = "h_orc", when = { race = "Orc" }, text = "Another orc who'd sooner trust a wolf than a pair of wings; I can see it in your face. Ask what you want, and then get in the saddle." },
      },
      again = {
        { id = "a_more", text = "Anything else, or shall I saddle one for you?" },
        { id = "a_wind", text = "Ask, then, but the wind won't wait all day, and neither will the riders." },
      },
      choices = {
        { text = "Are the wind riders dangerous?", next = "bite" },
        { text = "My clan never trusted anything that flew.", next = "orc", when = { race = "Orc" } },
        { text = "Do the riders ever fly out over the Echo Isles?", next = "troll", when = { race = "Troll" } },
        { text = "Can a wind rider truly carry someone my size?", next = "tauren", when = { race = "Tauren" } },
        { text = "Your beasts shy away whenever I come near.", next = "undead", when = { race = "Scourge" } },
        { text = "My people lived among the wind spirits for a very long time.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Just the flight.", next = "BUSINESS" },
      },
    },
    bite = {
      lines = {
        { id = "bi_default", text = "They bite, they sulk, and they'll go for anything that smells of an Alliance gryphon. Treat one like a proud warrior and not like a pack kodo, and it'll carry you anywhere the Horde keeps a roost." },
      },
      choices = {
        { text = "Then saddle one for me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = {
        { id = "or_default", text = "The old ones say the Horde rode red dragons over Lordaeron in the Second War, so your clan has flown before, whether it liked it or not. The difference is that a dragon was chained and a wind rider chooses to carry you, so be grateful and keep your feet out of its ribs." },
      },
      choices = {
        { text = "A beast that chooses. I can respect that.", next = "BACK", reply = "Good, because it'll know whether you mean it before you're over the first ridge." },
        { text = "Then saddle one for me.", next = "BUSINESS" },
      },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "They fly the coast past Sen'jin when the route takes them, and every Darkspear I've ever flown leans out to look for home. I hear Zalazane's madmen still hold the islands, though, so it's as well the riders don't land there." },
      },
      choices = {
        { text = "One day Vol'jin will take them back.", next = "BACK", reply = "When he does, I'll send a rider over to see it, and I'll tell it to fly low for you." },
        { text = "Then saddle one for me.", next = "BUSINESS" },
      },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "Heavier than most, I'll grant you, but a wind rider is stronger than it looks, and it has never dropped one of your people yet. It will complain the whole way, so let it; complaining is how it tells you it's working." },
      },
      choices = {
        { text = "I'll thank it when we land.", next = "BACK", reply = "Do that. Nobody ever thanks them, and they're vain enough to remember you for it." },
        { text = "Then saddle one for me.", next = "BUSINESS" },
      },
    },
    undead = {
      lines = {
        { id = "un_default", text = "They do, and it isn't anything you've done. A wind rider eats carrion when it's hungry, and I think you confuse it, because you smell like supper and you talk back. Sit still, keep your hands on the harness, and it'll stop flinching before you're over the first ridge." },
      },
      choices = {
        { text = "I've been called worse than supper.", next = "BACK", reply = "I don't doubt it. Down in the Undercity, I hear, that's practically a compliment." },
        { text = "Then saddle one for me.", next = "BUSINESS" },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "So I've heard, though nobody's told me more than that, and I've stopped asking. These are Kalimdor's winds, though, rough and dusty and full of grit, so you'll ride like everyone else, strapped in and holding on." },
      },
      choices = {
        { text = "Fair enough. I'll hold on.", next = "BACK" },
        { text = "Then saddle one for me.", next = "BUSINESS" },
      },
    },
  },
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
    -- Racial pass: the road watch outside the capitals (capital guards have their own).
    { id = "n_human", cat = "race", when = { race = "Human", ["not"] = { capital = true } },
      text = "One of the King's own subjects, by the look of you. You'll know the drill, then: keep to the road, report the bandits, and don't believe a word a Defias tells you about the price of bread." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", ["not"] = { capital = true } },
      text = "A dwarf on foot and in no hurry, that's a new one. Your kin who come through usually have a rifle over one shoulder and an Explorers' League map under the other arm, and they ask the way to the nearest dig before they say good morning." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome", ["not"] = { capital = true } },
      text = "Another of the Gnomeregan folk, and still on the road. I'm sorry about your city, truly; the watch was told what happened down there, and nobody laughed, whatever you might have heard." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf", ["not"] = { any = { { capital = true }, { zone = { "Teldrassil", "Darkshore", "Ashenvale", "Feralas", "Azshara", "Stonetalon Mountains", "Desolace", "Moonglade" } } } } },
      text = "You're a long way from your forests, elf. Folk out here have only lately got used to your people, so don't mind the farmers staring; it's the ears, mostly, and the way your eyes catch the lantern light." },
    { id = "n_dwarf_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "Totems on a dwarf's belt. The captain says you're on our side, and the captain's never wrong, so on you go." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "You can't ride that burning horse through the farmland. There's a harvest coming in somewhere every week, and one spark from those hooves will fire a whole field." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's demon skin you're wearing in plain sight on the King's road. I'll not arrest you for it, but I'll be writing it down." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "You're looking at me as if you can see straight through my coat to what's in my pockets. Whatever spell's on your eyes, keep it off the farmers." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My torch keeps guttering, and it was fine before you walked up. Go on about your business, quickly, and let me have my light back." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Show yourself!" },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Hold! Oh, it's a priest. You might warn a man first." },
    { id = "r_lock_soulstone", on = "aura", when = { aura = { 20707, 20762, 20763, 20764, 20765 } }, text = "Did a soulstone just go into you, in front of a guard? Keep it, I suppose, but don't make me find out whether it works." },
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
        -- Racial pass: the road watch.
        { text = "I grew up on a farm much like the ones you guard.", next = "ga_human", when = { race = "Human", ["not"] = { capital = true } } },
        { text = "Ironforge sends its regards, and its rifles.", next = "ga_dwarf", when = { race = "Dwarf", ["not"] = { capital = true } } },
        { text = "Does the watch ever talk about retaking Gnomeregan?", next = "ga_gnome", when = { race = "Gnome", ["not"] = { capital = true } } },
        { text = "Your roads are so loud. How do you hear anything coming?", next = "ga_elf", when = { race = "NightElf", ["not"] = { capital = true } } },
        { text = "What did that notice about my people say?", next = "ga_sky", when = { race = "Skyborne" } },
        -- Racial pass: the capitals (their own pools carry no tree, so their questions live here).
        { text = "I'm Stormwind born. Has the city changed since the king vanished?", next = "sw_human", when = { race = "Human", zone = "Stormwind City" } },
        { text = "Fine stonework, for human hands.", next = "sw_dwarf", when = { race = "Dwarf", zone = "Stormwind City" } },
        { text = "Do Stormwind folk actually ride the tram we built?", next = "sw_gnome", when = { race = "Gnome", zone = "Stormwind City" } },
        { text = "Your Park is a poor sort of forest.", next = "sw_elf", when = { race = "NightElf", zone = "Stormwind City" } },
        { text = "Any word of the Dark Irons near the gates?", next = "if_dwarf", when = { race = "Dwarf", zone = "Ironforge" } },
        { text = "Has King Magni any news of Gnomeregan?", next = "if_gnome", when = { race = "Gnome", zone = "Ironforge" } },
        { text = "How do you stand the dark down here?", next = "if_human", when = { race = "Human", zone = "Ironforge" } },
        { text = "Your forge smoke stings my eyes.", next = "if_elf", when = { race = "NightElf", zone = "Ironforge" } },
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
    -- Racial pass: the road watch.
    ga_human = {
      lines = {
        { id = "gah_default", text = "Then you'll know what it is to lie awake listening for wolves, or for worse. Half the farms I knew as a youngster stand empty now, and it does me good to meet someone who remembers them full." },
      },
      choices = {
        { text = "Which farms are empty now?", next = "ga_human2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ga_human2 = {
      lines = {
        { id = "gah2_default", text = "The Westfall ones went first, when the Defias came and the crown sent nobody, and then the gnolls took the Redridge homesteads and the Duskwood folk barred their doors against whatever walks those woods. Stormwind sends its sympathy and very little else, so the watch does what it can, which isn't much." },
      },
      choices = {
        { text = "The crown should have sent soldiers years ago.", next = "BACK", reply = "Say it in the barracks and you'll get a cheer. Say it at the Keep and you'll get a long ride somewhere cold.", fx = { align = { order = -1 } } },
        { text = "The crown has a whole kingdom to hold together.", next = "BACK", reply = "That's what the captain says, and he's not wrong. It's only that the kingdom looks smaller from a burned farm.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ga_dwarf = {
      lines = {
        { id = "gad_default", text = "And glad we are of both, though I'd take the rifles first. The patrols that come down from Loch Modan all say the same thing: put a dwarf on a wall, and the wall stops worrying. Is the tram under the sea as frightening as the lads say?" },
      },
      choices = {
        { text = "Perfectly safe. Mostly.", next = "BACK", reply = "Mostly. That's the word that keeps me walking, friend." },
        { text = "Only if you think about the water overhead.", next = "BACK", reply = "Well, I am now, thank you very much." },
      },
    },
    ga_gnome = {
      lines = {
        { id = "gag_default", text = "The younger lads talk about it the way they talk about marrying a princess, which is to say often and with no plan at all. The sergeants who saw your people come out of Dun Morogh don't talk about it; they say whatever drove you out is still down there, and the troggs with it. Does your High Tinker mean to go back?" },
      },
      choices = {
        { text = "One day. We've planned every gear of it.", next = "BACK", reply = "Then I hope I'm there to see it, and I hope I'm standing well back when it starts." },
        { text = "I don't know if there's anything left to save.", next = "BACK", reply = "There's you, and there's Tinker Town, and that's not nothing. I'm sorry, all the same." },
      },
    },
    ga_elf = {
      lines = {
        { id = "gae_default", text = "We don't, half the time, and that's the honest answer. One of your Sentinels could stand in that hedge all night and I'd never know it, which is why the lads are glad you're on our side and not out there in the dark." },
      },
      choices = {
        { text = "I could teach you to listen.", next = "BACK", reply = "I'd like that, though I suspect the first lesson is to stop talking, and I've never been good at it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    ga_sky = {
      lines = {
        { id = "gas_default", text = "Not much, which is why I remember it. It said your people came down out of the sky, that the Kirin Tor speaks for you, and that the watch is to be polite, and the sergeant read it twice, because nobody believed the first part." },
      },
      choices = {
        { text = "And have you been polite?", next = "BACK", reply = "I've been trying. It's harder than it sounds when you keep wanting to ask how." },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Racial pass: Stormwind.
    sw_human = {
      lines = {
        { id = "swh_default", text = "It's quieter at the Keep and louder everywhere else. The nobles hold more dinners, the Cathedral feeds more mouths, and the Stockade's fuller than I've ever seen it, so make of that what you will. You'll have noticed the same, being one of ours." },
      },
      choices = {
        { text = "What does the watch make of the regency, then?", next = "w_king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sw_dwarf = {
      lines = {
        { id = "swd_default", text = "High praise from a dwarf, and I'd pass it on to the masons if the nobles hadn't cheated them of their pay. Most of them went off to Westfall afterwards, and now they wear red bandanas and rob the roads, so the city's stone is the last honest work they did." },
      },
      choices = {
        { text = "That's a poor way to repay builders.", next = "BACK", reply = "It is, and half the watch thinks so, though we're the ones sent to hang them for it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sw_gnome = {
      lines = {
        { id = "swg_default", text = "A few do, and they come off at the other end looking pale and swearing they heard the sea over their heads. Most of the city would sooner walk to Ironforge than sit in a box under the water, but the tram's never failed us yet, and the watch is grateful for it." },
      },
      choices = {
        { text = "It's perfectly safe. I've run the figures.", next = "BACK", reply = "I believe you. I'll still be walking, mind, but I believe you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sw_elf = {
      lines = {
        { id = "swe_default", text = "It's the best we've got, and the city's proud of it, though I'll grant you it's more lawn than forest. Your priestesses come and stand under those trees some evenings, very still, and the children dare each other to go and ask them what they're listening for." },
      },
      choices = {
        { text = "They're listening to the trees. Yours are very young.", next = "BACK", reply = "Young? Some of those oaks were planted before my grandfather was born. I suppose that's young, to you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Racial pass: Ironforge.
    if_dwarf = {
      lines = {
        { id = "ifd_default", text = "Not at the gates, praise the forge, but word comes up from the Searing Gorge o' Dark Iron diggers closer than they ought tae be. Ye know the old grudge as well as I do, so if ye're headin' south, give 'em one from me." },
      },
      choices = {
        { text = "I'll give them more than one.", next = "BACK", reply = "That's the spirit! Bring me back a Dark Iron beard an' I'll stand ye a pint at the Stonefire." },
        { text = "The old grudge has cost us enough already.", next = "BACK", reply = "Aye, maybe it has. But Thaurissan's lot started it, an' they'll no' let us finish it, so here we are." },
      },
    },
    if_gnome = {
      lines = {
        { id = "ifg_default", text = "The king's sent mountaineers up the west road tae Gnomeregan more times than I can count, an' every time they come back sayin' the same: troggs at the door an' worse inside. Yer High Tinker's down in Tinker Town makin' plans, an' I'll say this for gnomes, ye never stop makin' plans." },
      },
      choices = {
        { text = "Plans are how we'll get it back.", next = "BACK", reply = "Then make 'em good ones, an' send for the rifles when ye're ready. We'll come." },
        { text = "Something else.", next = "BACK" },
      },
    },
    if_human = {
      lines = {
        { id = "ifh_default", text = "Dark? Ye've the Great Forge burnin' day an' night in the middle o' the city, an' it's the warmest light in the world! It's ye surface folk who stand about in the cold an' the rain an' call it fresh air, an' I'll never understand it." },
      },
      choices = {
        { text = "I'll grant you it's warmer than Elwynn.", next = "BACK", reply = "Warmer, drier, an' the ale's better. Ye'll be movin' in by winter." },
        { text = "Something else.", next = "BACK" },
      },
    },
    if_elf = {
      lines = {
        { id = "ife_default", text = "Aye, it'll do that, an' it'll keep doin' it till ye leave, for the Great Forge never goes out. Yer folk an' mine don't see eye tae eye on much, what wi' the League diggin' in yer old ruins, but I'll grant ye this: nobody shoots straighter than a Sentinel, bar a mountaineer." },
      },
      choices = {
        { text = "Bar a mountaineer? We'll see about that.", next = "BACK", reply = "Ha! Come tae the Hall of Arms some day an' we'll set up the targets." },
        { text = "Something else.", next = "BACK" },
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
    -- Racial pass: the posts outside the capitals (capital guards have their own).
    { id = "n_orc", cat = "race", when = { race = "Orc", ["not"] = { capital = true } },
      text = "An orc on the road between posts. The grunts at every fire from here to the Crossroads will want news of Orgrimmar, so have some ready, or make it up well." },
    { id = "n_troll", cat = "race", when = { race = "Troll", ["not"] = { capital = true } },
      text = "Darkspear. Your people walk the roads with a spear in one hand and a charm in the other, and I've stopped asking which one does the work." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren", ["not"] = { capital = true } },
      text = "A tauren, a long way from Mulgore. The grunts sleep better with one of your people on the next watch, because you don't startle, and nothing on four legs gets past you." },
    { id = "n_troll_lock", cat = "class", when = { race = "Troll", class = "WARLOCK" },
      text = "A Darkspear with demon-stink on them. I thought Vol'jin's people knew better than that." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My father told me the sky was green when the warlocks ran the Horde, and you've a little of that green about you. The Warchief says your kind serve us now, so walk on." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784 } },
      text = "A demon horse at a Horde gate. The wolves won't stop howling until it's gone, so be gone quickly." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Demon hide on an orc's road. Gul'dan's warlocks wore the same, and the Horde is still paying for it." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Your blood's running hot; I can see it in your face. That's no battle-fever, that's an imp's pact, and I've heard what demon blood did to the Horde." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I can smell you, so come out." } },
  lines = {
    { id = "l_default", text = "If you're looking for a fight, there are better places than my post. Ask anyone." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Good, another warrior. If trouble comes through this gate, you'll stand with us." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "I don't know your face, and I don't like faces I don't know. Walk where I can see you." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "The spirits are restless past the camp, shaman. The scouts say the wind's been wrong all week." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Hunters bring the best news, since you go where the scouts don't. Seen anything moving out there?" },
    { id = "l_mage", when = { class = "MAGE" }, text = "Keep the fire in your hands and out of the supply tents, mage." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "You call demon skin onto yourself in front of a grunt? Do that again near the wolf pens and I'll let the wolves decide what you are." },
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
        -- Racial pass: the posts outside the capitals.
        { text = "This road was harder when the Horde had nowhere to go.", next = "gh_orc", when = { race = "Orc", ["not"] = { capital = true } } },
        { text = "Do the Darkspear stand watch with you out here?", next = "gh_troll", when = { race = "Troll", ["not"] = { capital = true } } },
        { text = "The land here feels restless to me.", next = "gh_tauren", when = { race = "Tauren", ["not"] = { capital = true } } },
        { text = "Do the grunts truly trust my people?", next = "gh_sky", when = { race = "Skyborne", ["not"] = { capital = true } } },
        -- Racial pass: the capitals (their own pools carry no tree, so their questions live here).
        { text = "Is Orgrimmar what the Warchief promised us?", next = "og_orc", when = { race = "Orc", zone = "Orgrimmar" } },
        { text = "Will the Darkspear ever take back the Echo Isles?", next = "og_troll", when = { race = "Troll", zone = "Orgrimmar" } },
        { text = "Orgrimmar is very loud after the plains.", next = "og_tauren", when = { race = "Tauren", zone = "Orgrimmar" } },
        { text = "Your grunts don't hide their stares well.", next = "og_undead", when = { race = "Scourge", zone = "Orgrimmar" } },
        { text = "Does Orgrimmar trust the Earthen Ring's word about my people?", next = "og_sky", when = { race = "Skyborne", zone = "Orgrimmar" } },
        { text = "Are the Grimtotem truly a danger to us?", next = "tb_tauren", when = { race = "Tauren", zone = "Thunder Bluff" } },
        { text = "My people fought the centaur beside yours once.", next = "tb_orc", when = { race = "Orc", zone = "Thunder Bluff" } },
        { text = "Do the tauren hunt the way the Darkspear hunt?", next = "tb_troll", when = { race = "Troll", zone = "Thunder Bluff" } },
        { text = "Your Bluffwatchers watch me closer than the others.", next = "tb_undead", when = { race = "Scourge", zone = "Thunder Bluff" } },
        { text = "My people honour the winds, as yours do.", next = "tb_sky", when = { race = "Skyborne", zone = "Thunder Bluff" } },
        { text = "Do you remember who you were before?", next = "uc_undead", when = { race = "Scourge", zone = "Undercity" } },
        { text = "This city smells worse than the Drag.", next = "uc_orc", when = { race = "Orc", zone = "Undercity" } },
        { text = "Your apothecaries brew things the Earth Mother would not bless.", next = "uc_tauren", when = { race = "Tauren", zone = "Undercity" } },
        { text = "Your Dark Lady keeps a strange court.", next = "uc_troll", when = { race = "Troll", zone = "Undercity" } },
        { text = "Are the dead here truly free?", next = "uc_sky", when = { race = "Skyborne", zone = "Undercity" } },
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
    -- Racial pass: the posts outside the capitals.
    gh_orc = {
      lines = {
        { id = "gho_default", text = "It was, and some of the old ones on this watch still walk it as if a human patrol might come over the next rise. Now we have Durotar, and posts from the Crossroads to the mountains, and every one of them is a promise the Warchief kept." },
      },
      choices = {
        { text = "Then I'll help keep them.", next = "BACK", reply = "Good. Promises are only as strong as the arms holding them, so keep yours strong." },
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_troll = {
      lines = {
        { id = "ght_default", text = "They do, and they're the best night watch I've ever had: they see in the dark and they laugh at things that would make a grunt reach for an axe. One of them told me the spirits warn him before a raid comes, and twice now he's been right." },
      },
      choices = {
        { text = "The loa watch over the Horde too.", next = "BACK", reply = "Then tell them I said thanks, and ask them to warn me a little earlier next time." },
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_tauren = {
      lines = {
        { id = "gta_default", text = "The shamans say the same, and so did the last tauren who stood this post, but the land tells me nothing except where to dig the latrine. If the Earth Mother is warning you of something, tell me what it is, and I'll double the watch." },
      },
      choices = {
        { text = "Only a feeling. I'll keep listening.", next = "BACK", reply = "Do that, and come and find me the moment the feeling grows a face." },
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_sky = {
      lines = {
        { id = "ghs_default", text = "Some do, because Thunder Bluff speaks for you, and the tauren don't speak lightly. The rest will trust you once they've seen you fight, which is the only way a grunt has ever trusted anyone." },
      },
      choices = {
        { text = "Then they'll see me fight.", next = "BACK", reply = "Good answer. Make it a good fight, and they'll be telling it around the fire by nightfall." },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Racial pass: Orgrimmar.
    og_orc = {
      lines = {
        { id = "ogo_default", text = "It's more than any of us hoped for behind the camp fences: a city of our own, raised by our own hands, on land nobody gave us out of pity. It's hot and it's dusty and the Burning Blade crawl in the Cleft, but it's ours, and I'd die on this wall before I let anyone take it." },
      },
      choices = {
        { text = "Then why does the Warchief keep peace with humans?", next = "h_war" },
        { text = "It's worth dying for.", next = "BACK", reply = "Lok'tar. Just make sure you die for it slowly, and take plenty of them with you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    og_troll = {
      lines = {
        { id = "ogt_default", text = "Ask Vol'jin, not me, though his people talk of little else when they come up from Sen'jin. Zalazane holds the isles with his witch doctors and his hexed slaves, and if Vol'jin ever calls for axes, he'll find mine among the first." },
      },
      choices = {
        { text = "I'll remember that, grunt.", next = "BACK", reply = "Do. Vol'jin's people sailed to Kalimdor with the Warchief, and orcs remember who sailed with them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    og_tauren = {
      lines = {
        { id = "ogta_default", text = "Loud and hot and full of orcs, and we like it that way. Your people welcomed us when we were strangers on this continent, and Cairne fought beside the Warchief before this city had a single wall, so you're never a guest here, whatever the noise. Mind your horns on the lanterns in the Drag, though." },
      },
      choices = {
        { text = "The Earth Mother keeps us all.", next = "BACK", reply = "Maybe she does. Out here the Warchief does most of the keeping, but I'll not argue with your mother." },
        { text = "Something else.", next = "BACK" },
      },
    },
    og_undead = {
      lines = {
        { id = "ogu_default", text = "No, and they won't learn to. The old ones saw Gul'dan's dead knights in the Second War, and those dead men were no friends of any orc. The Warchief says your Dark Lady broke from the Lich King, and I believe him, but believing a thing and getting used to it are different battles." },
      },
      choices = {
        { text = "Then I'll give them time.", next = "BACK", reply = "That's fair, and more patience than most of them would show you." },
        { text = "They'd stare less if I fought beside them.", next = "BACK", reply = "Aye, that's how it works with grunts. Bleed beside one and the staring stops." },
      },
    },
    og_sky = {
      lines = {
        { id = "ogs_default", text = "The Ring vouched for you, and the shamans in the Valley of Wisdom say the Ring doesn't vouch lightly, so the gate's open. The grunts will stare, because they've never met an elf they didn't have to fight, but they'll learn." },
      },
      choices = {
        { text = "I'll give them a reason to learn quickly.", next = "BACK", reply = "Good. In Orgrimmar a reason usually means a deed, so go and find one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Racial pass: Thunder Bluff.
    tb_tauren = {
      lines = {
        { id = "tbt_default", text = "Magatha Grimtotem sits among the elders on Elder Rise and speaks softly, and her braves smile at Cairne's own. But the Grimtotem out in Stonetalon and the Thousand Needles do not smile at all, and the Bluffwatchers have learned to count their hands when they cross the bridges." },
      },
      choices = {
        { text = "Then I'll keep my eyes open on Elder Rise.", next = "BACK", reply = "Do, but keep your voice low there. Magatha hears more than an old woman should." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tb_orc = {
      lines = {
        { id = "tbo_default", text = "You did, and Cairne speaks of it still: the young Warchief and his orcs marching beside our caravans until the centaur broke and ran. That is a debt the tauren carry gladly, and these bluffs are yours to walk because of it." },
      },
      choices = {
        { text = "The Horde remembers its friends.", next = "BACK", reply = "So do the tauren. Walk with the Earth Mother, friend." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tb_troll = {
      lines = {
        { id = "tbtr_default", text = "We hunt to feed the tribe and to honour the beast, and we thank the Earth Mother for every kill. Your people hunt with spears and poison and laughter, the braves tell me, and I think the Earth Mother would not mind the laughter." },
      },
      choices = {
        { text = "The poison she might mind.", next = "BACK", reply = "Perhaps. Bring your catch to Hunter Rise and let the elders decide." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tb_undead = {
      lines = {
        { id = "tbu_default", text = "They do, and I will not pretend otherwise. Our elders argued long before they spoke for your people at the Warchief's fire, and some of them argue still, but the Earth Mother turns no one from her bluffs who comes in peace. Show us peace, and the watching will ease." },
      },
      choices = {
        { text = "I come in peace. You'll see.", next = "BACK", reply = "Then I will be glad to see it. May the eternal sun shine on you, even below ground." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tb_sky = {
      lines = {
        { id = "tbs_default", text = "So I have heard, and it is part of why Thunder Bluff speaks for your people. The winds on these mesas are old and strong; I hope they greet you kindly, and that your camp at Gev'rek has found good grazing." },
      },
      choices = {
        { text = "Winds be with you, Bluffwatcher.", next = "BACK", reply = "And with you. Mind the edges, all the same; the wind does not ask permission." },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Racial pass: Undercity.
    uc_undead = {
      lines = {
        { id = "ucu_default", text = "Every face, every name, and every morning I woke up warm. Some of the Deathguard try to forget and some of us hold on to it like a coin, and the Dark Lady doesn't care which, so long as we remember who freed us." },
      },
      choices = {
        { text = "I'd sooner forget.", next = "BACK", reply = "Then forget, and good luck to you. It never worked for me." },
        { text = "I hold on to mine.", next = "BACK", reply = "So do I. It's cold comfort, but cold is all the comfort we get down here." },
      },
    },
    uc_orc = {
      lines = {
        { id = "uco_default", text = "Higher praise than you know. The Drag smells of the living, and that's a stink the Apothecarium has never managed to bottle, though not for want of trying. Keep to the walkways above the canals, orc; what's in that green would eat through your boots." },
      },
      choices = {
        { text = "I'll mind my boots.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uc_tauren = {
      lines = {
        { id = "uct_default", text = "I expect she wouldn't, and the Royal Apothecary Society would be delighted to hear it. They say they're brewing a cure for what the Scourge did to us, and they say it to every tauren who asks, so I'll say it to you too, and you can decide how much of it to believe." },
      },
      choices = {
        { text = "I'd like to believe it.", next = "BACK", reply = "So would I, some days. Most days I just keep the door." },
        { text = "I don't believe a word of it.", next = "BACK", reply = "Then keep that to yourself near the Apothecarium. They're touchy about their reputation." },
      },
    },
    uc_troll = {
      lines = {
        { id = "uctr_default", text = "Strange, to a Darkspear? Coming from a people who talk to the spirits of their dead as easily as I'm talking to you, I'll take that as a compliment. The Dark Lady keeps the court she needs, banshees and apothecaries and the Deathguard, and nobody in it is waiting for her to die." },
      },
      choices = {
        { text = "Fair. Our spirits are better company, though.", next = "BACK", reply = "I'm sure they are. Ours mostly complain about the damp." },
        { text = "Something else.", next = "BACK" },
      },
    },
    uc_sky = {
      lines = {
        { id = "ucs_default", text = "Free of the Lich King, which is the only freedom that matters down here. You came from somewhere far away, I'm told, so you won't know what it was to hear his voice in your head and obey it. Pray you never learn." },
      },
      choices = {
        { text = "I'm sorry for what was done to you.", next = "BACK", reply = "Don't be sorry. Be useful, and point your weapon at the Scourge." },
        { text = "Something else.", next = "BACK" },
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
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Born under these walls or come down from Lordaeron, I can never tell any more, since half the Trade District talks with a northern accent these days. Either way, welcome home, and mind the canals." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You've still got the tram look about you, checking the ceiling for cracks, but there's no ceiling up here, only sky. The masons who rebuilt these walls were the finest in the kingdom, whatever became of them afterwards." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "I can hear those shards clinking from here. Nothing in the city statutes forbids them, but the Watch has a long memory and a short temper, so give me a reason and see how quickly I find a statute." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Demon hide, on the streets of Stormwind, in daylight. Your sort usually keep it under a cloak down at the Lamb, so either you're bold or you're new, and I'd like to know which." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Not on the canal bridges. The last burning horse through the Trade District set three awnings alight, and the merchants are still writing letters." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { ["not"] = { class = "WARLOCK" }, carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "You've a warlock's soulstone in your pack, and you're no warlock. Who gave it to you, and where did they get it? I'm only asking, for now." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Stealth inside the city walls? Show yourself, or I call the Watch." },
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Light preserve us! Oh, you're one of the Cathedral's lot. Carry on, then, but go gently; you'll frighten the canal folk." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "Right, that's demon armour, in the street, in front of the Watch. Put it away and keep it away, or we'll finish this talk somewhere with bars on the windows." },
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
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Back under the mountain, are ye? Ye'll want a pint at the Stonefire afore ye do anythin' else, an' I'll no' tell the sergeant I said so." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Ye've come in on the tram, by the green look o' ye. Stand a while by the Great Forge, an' the warmth'll put the colour back in yer cheeks." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Ye're squintin', elf, an' I don't blame ye, for there's no moon under the mountain an' no trees but the ones we burn. The Mystic Ward's quieter, if the forge noise is too much for ye." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One o' the sky-elves, under a mountain! I'd wager it's a long while since ye stood this far from an open wind, so breathe slow, an' don't stand too near the bellows." },
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
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Them purple stones in yer pack are cold enough tae frost me beard from here. Keep 'em wrapped, an' keep 'em well away from the Great Forge, for I'll not have anythin' that cold near that fire." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Ye're wearin' a demon's hide like a winter coat. The Forlorn Cavern lot do the same, an' every one o' them thinks the guard can't tell." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Get that burnin' horse off the bridge! The rams in the stables can smell it from here, an' they're tryin' tae butt their way through the walls." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "That's a firestone ye've got on ye. The smiths at the Great Forge say it makes a blade burn, an' they say it like a curse." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about under the mountain? Out wi' ye, where I can see." } },
  lines = {
    { id = "l_default", text = "Great Forge in the middle, King Magni up in the throne room, the tram to Stormwind down the Tinker Town way. Ye'll not get lost, it's a circle." },
    { id = "l_warrior", when = { class = "WARRIOR" }, text = "Hall of Arms for the fightin' trades, through the Military Ward. Ye'll hear it afore ye find it." },
    { id = "l_rogue", when = { class = "ROGUE" }, text = "Keep yer hands where the mountain can see them. We've a long memory under here, and short tempers." },
    { id = "l_magni", text = "King Magni holds court in the High Seat, an' he's a fair king if ye bring him an honest matter. Bring him a dishonest one an' ye'll learn how loud a throne room echoes." },
    { id = "l_dark_iron", text = "If ye see a Dark Iron anywhere near the gates, ye shout, an' ye shout loud. We've not forgotten what Thaurissan's lot did to this mountain." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "Did ye just pull demon skin round yerself, in front o' the King's own guard? Ye've more nerve than sense, an' I'm watchin' ye now." },
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
        -- Racial pass: Darnassus (guard_darnassus's own questions; the other towns share this tree).
        { text = "Why build a city in a tree at all?", next = "dn_human", when = { race = "Human", zone = "Darnassus" } },
        { text = "Where does a dwarf get a decent drink in this city?", next = "dn_dwarf", when = { race = "Dwarf", zone = "Darnassus" } },
        { text = "Could the moonwells use a little engineering?", next = "dn_gnome", when = { race = "Gnome", zone = "Darnassus" } },
        { text = "Do the Sentinels know who my people were?", next = "dn_sky", when = { race = "Skyborne", zone = "Darnassus" } },
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
    -- Racial pass: Darnassus.
    dn_human = {
      lines = {
        { id = "dnh_default", text = "Because the last time we built in stone and gave ourselves to magic, the sea took all of it. Archdruid Fandral grew Teldrassil after Hyjal, and we live in its branches because a tree remembers what stone forgets. Your people think in walls, I know; ours think in roots." },
      },
      choices = {
        { text = "Walls kept my people alive.", next = "BACK", reply = "And roots kept mine alive for ten thousand years. Perhaps we are both right, for now." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dn_dwarf = {
      lines = {
        { id = "dnd_default", text = "Moonberry juice, on the Craftsmen's Terrace, and I see from your face that this is not the answer you wanted. The last of your people to ask brought his own cask over on the boat from Auberdine, and the Sentinels let him keep it, because we are gracious hosts and because it was very heavy." },
      },
      choices = {
        { text = "Next time I'll bring two casks.", next = "BACK", reply = "Then bring a third for the Sentinels at the gate. We are not as solemn as we look." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dn_gnome = {
      lines = {
        { id = "dng_default", text = "No. The moonwells are Elune's, and the priestesses have tended them without a single gear or valve since long before your people learned to tinker. They would like you to keep your tools in your pack, and so, I am afraid, would I." },
      },
      choices = {
        { text = "Just a small valve. Nobody would notice.", next = "BACK", reply = "Elune would notice. So would I, and I am the one holding the glaive." },
        { text = "Understood. Hands in my pockets.", next = "BACK", reply = "Thank you. The priestesses will be relieved, though they will never say so." },
      },
    },
    dn_sky = {
      lines = {
        { id = "dns_default", text = "We remember Eldre'Thalas, and we remember what the Highborne's magic cost the world, so you will forgive me for watching your hands. As for you, I know only what the priestesses have said, which is very little, and I would rather learn the rest from you than guess at it." },
      },
      choices = {
        { text = "Watch my hands, then. They're honest.", next = "BACK", reply = "Then they have nothing to fear from my watching. Ishnu-alah, sky-born." },
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
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Welcome home. Teldrassil has grown a little while you were away, and the Sentinels are still arguing over where the new paths should run." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human beneath Teldrassil. You came by the boat from Auberdine and up through Rut'theran, I expect, and now you are looking up as all your people do, as if the tree might fall. It will not." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Your boots are loud on the bark, dwarf. The tree does not mind, I think, but the owls do, so step a little softer near the Temple." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "The last of your people to visit Darnassus asked a priestess how the moonwells were plumbed. She has not yet decided whether to be offended, so I would not ask her again." },
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
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The owls in the branches above us have all turned to look at you. They remember the Highborne and the fire that came after, and so do I." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "You carry captive souls beneath Teldrassil's boughs. Elune gathers her dead in her own way, and she does not care to find them locked in stones." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "Your eyes see too much, outsider, and they see it by a demon's gift. The Sentinels hide in the moonlight for a reason, so do not go looking for them." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "You smell of the fel, the old smell that hung over Zin-Azshari before the sea took it. Our elders taught us that smell, stranger, so that we would never forget it." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The Sentinels own every dark corner in this city. Step out where I can see you." } },
  lines = {
    { id = "l_default", text = "The Temple of the Moon for the priestesses, the Cenarion Enclave for the druids. Walk softly; this tree is young." },
    { id = "l_warrior", when = { race = "NightElf", class = "WARRIOR" }, text = "Our warriors train on the Warrior's Terrace. The Sentinels will want to measure you, so be ready." },
    { id = "l_hunter", when = { class = "HUNTER" }, text = "Hunters gather at the Cenarion Enclave with the druids. Keep your companion close on the bridges." },
    { id = "l_tree", text = "Teldrassil is young yet, and the Sentinels guard her the way you would guard a sapling in a storm. Walk gently on her branches, and she will hold you." },
    { id = "l_tyrande", text = "The High Priestess keeps the Temple of the Moon, and her word is law beneath these boughs. If you seek an audience, the priestesses will tell you whether you may have one." },
    { id = "r_lock_armor", on = "aura", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } }, text = "You call a demon's skin onto yourself beneath the World Tree? My glaive is drawn, and it will stay drawn until you leave." },
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
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "The old grunts still spit when one of your kind walks through the Valley of Strength, Warchief's word or not. Don't take it to heart; they spit at the trolls too, and the trolls spit back." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. You're walking through the gate of a city our people raised with their own hands, so walk it like you remember the camps." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. The Valley of Spirits is yours, and your shadow hunters keep it smelling of smoke and strange herbs, which I'm told is good luck. It makes my eyes water, so take your luck down there with you." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mind the beams in the Drag, tauren. It was dug for orcs, and your horns keep finding the lanterns." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "You've souls rattling in your pack. Gul'dan kept souls too, and the Horde paid for every one, so keep yours down in the Cleft where we don't have to hear them." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "A demon horse in the Valley of Strength! The wolves at the kennels are howling, and they won't stop until you've ridden it out of the gate." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Demon skin, worn openly in the Warchief's city. The old Horde wore the same, and the Warchief broke the chains it forged for us, so don't make me forget whose side you're on." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "Your eyes have a green cast, warlock, the colour of Mannoroth's blood. I've seen orcs with that look before, and I've seen what it cost them." },
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
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc on the bluffs. Your Warchief marched beside our caravans when the centaur hounded us across the Barrens, and the elders have not forgotten it, so walk here as a friend." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome home, child of the plains. The Earth Mother kept your place by the fire, and the lifts have creaked no louder than usual while you were gone." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear on the bridges! The kodo will not like it, and neither will the bridges." },
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your demon walks behind you on the bluffs, warlock, and it does not touch the totems." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The kodo below are lowing at you. They smell fire that is not fire, and the Earth Mother has taught them to fear it, as she has taught us." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Leave the burning horse at the bottom of the lifts. The bluffs are dry and the grass is long, and we have no wish to watch them burn." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "There are souls in your pack, traveller, and the ancestors can hear them crying. Keep them quiet while you walk among the totems." },
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
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Welcome home, if that's the word for it. The Trade Quarter's busy, the Apothecarium's quiet, and the Dark Lady is as unforgiving as ever of anyone who forgets who freed them." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, down the lifts. Your Warchief took us in when the rest of the world wanted us burned, and the Deathguard remembers it, though we'd thank you not to breathe quite so loudly." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Your witch doctors look at us as if we were a hex that worked too well. Look all you like, but don't touch." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-elves, in a city of the dead. You look at us the way every living thing does, and I'll not hold it against you; most of us looked the same, once." },
    { id = "n_warrior", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "War Quarter for you, soldier. Some of the Deathguard in there wore Lordaeron's colours too, once." },
    { id = "n_beast", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Animals hate this place. Keep yours close; the bats down here have opinions." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Change back, druid. Bears down here make the abominations nervous, and you don't want them nervous." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 20 } },
      text = "That many shards? The apothecaries would want a look at them, though what you carry is none of my business down here. Just don't spill any in the canals." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Demon hide. Half the Magic Quarter wears it to supper, so you'll have to try harder than that to frighten anyone in the Undercity." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "A felsteed, down the lifts? The bats are screaming, but the bats always scream. Go on through." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Bound your soul in a stone, have you? Some of us would have given a great deal for that kind of choice the day the plague came, so use it well." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "We see better in the dark than you think, so out." } },
  lines = {
    { id = "l_default", text = "The Apothecarium, the Magic Quarter, the War Quarter and the Rogues' Quarter, all in a ring around the Trade Quarter. The Banshee Queen keeps the Royal Quarter, and you don't." },
    { id = "l_shaman", when = { class = "SHAMAN" }, text = "Shamans don't come down here much. The elements are a long way from the Undercity, and they seem to like it that way." },
    { id = "l_lady", text = "The Dark Lady gave us our wills back, and we stand guard so no one takes them again. That's all the reason a Deathguard needs, and a better one than the living ever gave me." },
    { id = "l_scarlet", text = "The Scarlet Crusade would burn this whole city with us in it, and they'd sing hymns while they did. Keep that in mind when the living tell you we're the monsters." },
    { id = "r_lock_soulstone", on = "aura", when = { aura = { 20707, 20762, 20763, 20764, 20765 } }, text = "A soulstone, down here? It hardly matters in the Undercity, friend. Most of us came back without one." },
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
  lines = {
    { id = "l_default", text = "Peon chop wood and peon carry wood, but peon not talk about wood." },
    -- Racial pass: peons react to who is asking.
    { id = "l_orc", when = { race = "Orc" }, text = "You orc too, so you know how it go: peon work hard, and grunts take the credit. Zug zug." },
    { id = "l_troll", when = { race = "Troll" }, text = "Troll make peon nervous, because troll always laughing, and peon never know what is funny." },
    { id = "l_tauren", when = { race = "Tauren" }, text = "Big one! You could carry whole tree on one shoulder, and peon only ask because peon have whole tree right here." },
    { id = "l_undead", when = { race = "Scourge" }, text = "You smell like old meat. Peon not say it to be rude, peon just say it because it true." },
    { id = "l_skyborne", when = { race = "Skyborne" }, text = "Pointy ears, but not night elf? Peon very confused, so peon will go back to chopping, which peon understand." },
  },
  choices = { { text = "Back to work.", next = "END" } },
  -- Racial pass: a small tree so a peon has something to say to each race.
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Peon working! Peon always working, see, look at all this wood. What you want?" },
      },
      again = {
        { id = "a_more", text = "More talking? Peon like talking, because talking is not chopping." },
      },
      choices = {
        { text = "Does the work ever end?", next = "work" },
        { text = "Who's your overseer, peon?", next = "orc", when = { race = "Orc" } },
        { text = "Want a troll charm to make the work lighter?", next = "troll", when = { race = "Troll" } },
        { text = "I could carry that load for you.", next = "tauren", when = { race = "Tauren" } },
        { text = "Do I frighten you, peon?", next = "undead", when = { race = "Scourge" } },
        { text = "My people have never seen a peon before.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Back to work.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "wk_default", text = "Work end when sun go down, and then work start again when sun come up. Peon once ask if sun could stay down a little longer, and overseer laugh for very long time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Back to work.", next = "END" },
      },
    },
    orc = {
      lines = {
        { id = "or_default", text = "Overseer is big orc with whip and loud voice, and he say peon lazy. Peon not lazy, peon tired, which is very different thing, and peon only tell you because you orc too and maybe you understand." },
      },
      choices = {
        { text = "Zug zug, friend.", next = "BACK", reply = "Zug zug! You good orc. Peon remember your face." },
        { text = "Back to work.", next = "END" },
      },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "Charm? Peon had charm once, from troll at Sen'jin, and it make wood lighter for one day and then it make peon sneeze for one week. Peon not want charm. Peon want nap." },
      },
      choices = {
        { text = "No charm for naps, sorry.", next = "BACK", reply = "Then troll charms not very good, peon think." },
        { text = "Back to work.", next = "END" },
      },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "You carry?! Nobody ever carry for peon. Peon not know what to do with hands now, so peon will just stand here and watch you carry, and it is best day peon ever have." },
      },
      choices = {
        { text = "Glad to help, little one.", next = "BACK", reply = "Peon tell everybody about kind tauren. Nobody believe peon, but peon tell them." },
        { text = "Back to work.", next = "END" },
      },
    },
    undead = {
      lines = {
        { id = "un_default", text = "Little bit. Peon think dead things should stay dead, but Warchief say dead ones are Horde now, so peon say hello nicely and then peon go chop wood very far away." },
      },
      choices = {
        { text = "I don't bite, peon.", next = "BACK", reply = "Peon believe you. Peon still going to chop over there, though." },
        { text = "Back to work.", next = "END" },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "Never see peon? Where you live, nobody chop wood? Peon think that sound like very good place, but peon not know the way, and overseer not give day off anyway." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Back to work.", next = "END" },
      },
    },
  },
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
    -- Racial pass: a neutral port sizes up every kind of customer.
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Off the boat from Booty Bay, I bet, with that Stranglethorn sunburn. Welcome to Ratchet, pal, where the sun's just as bad and the pirates are worse." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Your Ironforge boys pay in good coin and drink like the barrels owe 'em money, pal, so you're welcome on my docks any day of the week." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "No offense, pal, but the last gnome who came through tried to sell Gazlowe a better crane. Gazlowe's still sore about it, 'cause it was a better crane." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Night elf, this far south? Your Sentinels don't buy from us much, pal, on account of the lumber, and it's a shame, 'cause I'd sell 'em the axes to chase the loggers off with." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Orc, huh? Gazlowe built your Warchief's city, pal, so you could say you're standin' on the Cartel's references." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, huh? Your folks down at Sen'jin trade us fish and charms, pal, and the charms sell better, 'cause a sailor will buy anything that promises he won't drown." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Easy on the dock planks, big customer, would ya? Every board a tauren cracks goes on the Cartel's books, and guess who has to write it up." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, huh? The boat crews get twitchy around your folk, pal, so if you're sailin', try smilin' less; it doesn't help as much as you'd think." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of them sky-elves, huh? Never seen one up close, pal, and I keep wonderin' what your people use for money, and whether the Cartel takes it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "That's a lotta soul shards, pal. I know a guy in Booty Bay who'd want a look at 'em, but in Ratchet they're just luggage, so keep the bag shut on the docks." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Burnin' horse on my boardwalk? These planks are tarred, buddy, and the Steamwheedle don't insure against demons." },
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Healthstones, huh? Those'd move like hotcakes on the boats, I'm tellin' ya, but the Cartel ain't figured out how to get the warlocks workin' for a cut yet." },
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
        -- Racial pass.
        { text = "Goblins and gnomes. Always rivals, aren't we?", next = "rt_gnome", when = { race = "Gnome" } },
        { text = "Your Venture Company kin are stripping Stonetalon bare.", next = "rt_elf", when = { race = "NightElf" } },
        { text = "You'd fight for the Horde when it counts, right?", next = "rt_orc", when = { race = "Orc" } },
        { text = "Our caravans pay far too much at your docks.", next = "rt_tauren", when = { race = "Tauren" } },
        { text = "Does the Cartel sell to the dead?", next = "rt_undead", when = { race = "Scourge" } },
        { text = "Your sailors buy Sen'jin charms by the crate.", next = "rt_troll", when = { race = "Troll" } },
        { text = "Booty Bay's goblins nearly robbed me blind.", next = "rt_human", when = { race = { "Human", "Dwarf" } } },
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
    -- Racial pass.
    rt_gnome = {
      lines = {
        { id = "rtg_default", text = "Rivals? Pal, we're the competition, and competition's healthy, mostly for us. Your people build it right and slow, my people build it fast and cheap and sell it before it blows up, and the customers keep comin' back to us, so you tell me who's winnin'." },
      },
      choices = {
        { text = "Ours don't blow up.", next = "BACK", reply = "Sure they don't, pal. Say hi to Gnomeregan for me. Whoa, whoa, too soon, I know, I take it back." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rt_elf = {
      lines = {
        { id = "rte_default", text = "Whoa, whoa, the Venture Company ain't kin of mine, pal, they're the competition, and they don't pay their dock fees neither. Steamwheedle sells, it doesn't saw, and if you want to go smash their shredders in Stonetalon, I'll sell you the hammer at a fair price." },
      },
      choices = {
        { text = "A goblin is a goblin to the trees.", next = "BACK", reply = "Then the trees got lousy eyesight, pal, and you can tell 'em I said so." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rt_orc = {
      lines = {
        { id = "rto_default", text = "Pal, I fight for whoever's payin' me this week, and this week it's Gazlowe, and Gazlowe's neutral, so no. Between you and me, though, the Horde tips better, and I've got a long memory for tips." },
      },
      choices = {
        { text = "Honest, at least.", next = "BACK", reply = "Honesty's free, pal. It's about the only thing in Ratchet that is." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rt_tauren = {
      lines = {
        { id = "rtt_default", text = "Too much? Pal, the fees are the fees, same for every caravan from Thunder Bluff to the Crossroads, and your people are the only ones who pay without arguin', which I appreciate. Tell your elders the Cartel says thanks, and also that the fees are goin' up." },
      },
      choices = {
        { text = "The Earth Mother sees your ledger, goblin.", next = "BACK", reply = "Then she knows I'm givin' you a good rate, pal. Tell her to come by the docks sometime." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rt_undead = {
      lines = {
        { id = "rtu_default", text = "Pal, the Cartel sells to anybody whose coin is real, and yours spends just like everybody else's. Only thing we won't sell you is a seat at the front of the boat, 'cause the crew's superstitious and there's more of them than there is of me." },
      },
      choices = {
        { text = "The back of the boat suits me.", next = "BACK", reply = "Good, 'cause that's where the cargo goes, and you're quieter than most of the cargo." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rt_troll = {
      lines = {
        { id = "rtr_default", text = "By the crate, pal, and every one comes with a promise the sailor won't drown, which is a great business model, 'cause the ones who drown never come back to complain. You tell your witch doctors that if they ever want a proper distributor, I know a guy." },
      },
      choices = {
        { text = "The charms work, you know.", next = "BACK", reply = "Sure they do, pal, and so does the markup. Everybody wins." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rt_human = {
      lines = {
        { id = "rth_default", text = "Nearly? Then you got off light, pal, 'cause Booty Bay's the big leagues and Ratchet's just the friendly little branch office. Same Cartel, same rules, same fees, only here I'll at least tell you the price before you pay it." },
      },
      choices = {
        { text = "That's oddly reassuring.", next = "BACK", reply = "That's the Steamwheedle promise, pal: we rob you honest." },
        { text = "Something else.", next = "BACK" },
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
