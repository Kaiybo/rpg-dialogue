-- The warlock patch (0.90.0): what people notice about a warlock's demon, steed, stones and shards.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Notice-only pools: they stack onto the role pools (pools.lua, pools_roles.lua) and
-- never replace them. Aura ids: Felsteed 5784, Dreadsteed 23161, Soulstone Resurrection
-- 20707/20762-20765, Demon Skin 687/696, Demon Armor 706/1086/11733-11735.
-- Items: Soul Shard 6265; healthstones 5509-5512, 9421, 19004-19013.

local SOULSTONE = { 20707, 20762, 20763, 20764, 20765 }
local DEMONARMOR = { 687, 696, 706, 1086, 11733, 11734, 11735 }
local HEALTHSTONES = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 }
local SHARDS = { id = 6265, min = 20 }

---------------------------------------------------------------------------
-- Guards
---------------------------------------------------------------------------
P:Pool {
  id = "lock_guard_alliance", role = "guard", faction = "Alliance",
  notice = {
    { id = "n_lk_void_trade", cat = "pet", when = { pet = { family = "Voidwalker" }, subzone = "Trade District" },
      text = "You've brought a voidwalker into the Trade District on market day, and the fishmonger has fainted twice already. Take it back to the Mage Quarter where your sort keep to the shadows." },
    { id = "n_lk_imp_capital", cat = "pet", when = { pet = { family = "Imp" }, capital = true },
      text = "Keep that imp of yours on a short leash in the city. The last one we let through set a thatch alight on the canal, and I was the one carrying buckets." },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Eyes on me, if you please, not on that creature of yours. Half my watch walked into a lamp post the last time one of those came through the gate." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "That hound of yours keeps sniffing at the mage who just went by, and he didn't like it one bit. Call it to heel before somebody throws a fireball in my street." },
    { id = "n_lk_lamb", cat = "class", when = { class = "WARLOCK", zone = "Stormwind City" },
      text = "Everyone knows what goes on in the cellar under the Slaughtered Lamb, {g:sir|ma'am}. The Crown looks the other way, and so do I, so long as none of it comes up the stairs." },
    { id = "n_lk_dwarf", cat = "class", when = { class = "WARLOCK", zone = "Ironforge" },
      text = "We've no warlocks' cellar in Ironforge, and we like it that way. Keep yer business quiet in the Mystic Ward, and dinnae bring it near the Great Forge." },
    { id = "n_lk_elf", cat = "class", when = { class = "WARLOCK", zone = { "Darnassus", "Teldrassil", "Darkshore" } },
      text = "My grandmother's grandmother fought the Legion when it first came through the Well, and its stink is on you, stranger. The Sentinels will be watching every step you take beneath these boughs." },
    { id = "n_lk_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "That's no horse from any stable I know; its hooves are scorching the cobbles. Walk it, don't trot it, and keep it out of the hay." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "Light preserve us, what is that you're riding? I've seen warhorses and I've seen nightmares, and that beast looks like both of them at once." },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE },
      text = "There's something hanging about you like a second shadow, {g:sir|ma'am}, and I don't care for it. Whatever spell keeps you from dying, I'd thank you not to test it on my watch." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "The dogs at the gatehouse started howling the moment you came up the road. I've stood this post nine years and they've never done that for anyone." },
  },
  react = {
    { id = "r_lk_demon", on = "pet", when = { pet = { type = "Demon" } },
      text = "Hold there! Don't go summoning that in the middle of the street, or I'll have half the watch down on both of us." },
  },
}

P:Pool {
  id = "lock_guard_horde", role = "guard", faction = "Horde",
  notice = {
    { id = "n_lk_orc_lock", cat = "class", when = { class = "WARLOCK", race = "Orc" },
      text = "An orc who calls on demons. My father drank the blood at Gul'dan's bidding, and it took Thrall to pull us out of that pit. See you don't drag us back into it." },
    { id = "n_lk_cleft", cat = "class", when = { class = "WARLOCK", zone = "Orgrimmar" },
      text = "Your kind gather in the Cleft of Shadow, and the Warchief allows it. But the Burning Blade hid down there too, warlock, so I'll be watching which of you I see go into Ragefire." },
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" }, capital = true },
      text = "Your imp spat at a peon a moment ago. The peon is still working, so no harm done, but tell it to spit at the Alliance instead." },
    { id = "n_lk_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker stands guard better than half my grunts. It doesn't complain, it doesn't eat, and I'd still rather it stood somewhere else." },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Keep that whip-woman away from the barracks, warlock. A grunt with his mind on her is a grunt with no mind for his post." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Your felhunter turned its head at the shaman's totems as we passed. I didn't like the look of that, and neither did the spirits, I'd wager." },
    { id = "n_lk_tauren", cat = "class", when = { class = "WARLOCK", zone = { "Thunder Bluff", "Mulgore" } },
      text = "The Earth Mother does not care for the fire you carry, little one. Thrall says your kind are welcome among the Horde, and so you are welcome here, but walk gently on the bluffs." },
    { id = "n_lk_forsaken", cat = "class", when = { class = "WARLOCK", zone = { "Undercity", "Tirisfal Glades" } },
      text = "The Magic Quarter is down the left passage, past the Apothecarium's stink, if you've business with your own. The Dark Lady has uses for warlocks, so try to be useful." },
    { id = "n_lk_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "A horse with burning hooves, and you ride it like a wolf rider. The beast has fire in it, I'll give you that, but no wolf of mine would share a road with it." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "Lok'tar, that's a dreadsteed. I've heard they come from beyond the Nether and won't take a rider who isn't strong enough to break them, and you broke one." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "You reek of the old fel, the same reek the warlocks of the Horde carried before Grom freed us. I know that smell, warlock, and I never wanted to smell it again." },
  },
  react = {
    { id = "r_lk_demon", on = "pet", when = { pet = { type = "Demon" } },
      text = "You open a hole in the world in front of my gate? Next time, warn a grunt before you do it, warlock." },
  },
}

---------------------------------------------------------------------------
-- Townsfolk
---------------------------------------------------------------------------
P:Pool {
  id = "lock_citizen_alliance", role = "citizen", faction = "Alliance",
  notice = {
    { id = "n_lk_void", cat = "pet", when = { pet = { family = "Voidwalker" }, capital = true },
      text = "Oh! I thought that was a storm cloud come down the lane, but it's following you. Does it have to stand quite so close to the bakery?" },
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your little red friend just called me something I won't repeat in front of my mother. Is it meant to talk like that, or did you teach it?" },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "My husband's gone very quiet since your companion walked by. I'd be grateful if she walked by somewhere else." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "What sort of dog has no eyes and those horrible feelers? It sniffed my shopping basket, and now the bread tastes of nothing at all." },
    { id = "n_lk_lamb", cat = "class", when = { class = "WARLOCK", zone = "Stormwind City" },
      text = "You'll be one of those who go down the cellar steps at the Slaughtered Lamb, then. My cousin says you can hear chanting through the floorboards on a quiet night." },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE },
      text = "There's a strange light hanging over you, like a lantern seen through fog. My grandmother would say something's keeping a hold of your soul, and she was right about most things." },
    { id = "n_lk_armor", cat = "aura", when = { aura = DEMONARMOR },
      text = "Your skin has gone grey and hard where the light catches it. Is that a spell, or are you poorly? You'd tell me if it was catching, wouldn't you?" },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 30 } },
      text = "I don't know what it is about you, but the milk turned when you walked past my door. I'm not accusing anyone, mind; I'm only saying." },
    { id = "n_lk_taint_hi", cat = "taint", when = { taint = { min = 60 } },
      text = "Please, step back a little. Something about you makes my teeth ache, and I don't think it's the weather." },
  },
}

P:Pool {
  id = "lock_citizen_horde", role = "citizen", faction = "Horde",
  notice = {
    { id = "n_lk_orc", cat = "class", when = { class = "WARLOCK", race = "Orc", zone = "Orgrimmar" },
      text = "My mother's skin went red from the demon blood, and it never came back to brown before she died. You chose this power, warlock; I hope you know better than our grandfathers did what it costs." },
    { id = "n_lk_cleft", cat = "class", when = { class = "WARLOCK", subzone = "Cleft of Shadow" },
      text = "The Cleft is no place to linger, even for your sort. The Burning Blade still whisper down here, and some of the faces you'd trust are the ones wearing their mark." },
    { id = "n_lk_tauren", cat = "class", when = { class = "WARLOCK", zone = "Thunder Bluff" },
      text = "The wind changes when your kind come up the lift, and the kodo bellow at it. Thrall vouches for you, so the tribes are patient, but patience is not the same as welcome." },
    { id = "n_lk_forsaken", cat = "class", when = { class = "WARLOCK", zone = "Undercity" },
      text = "Another warlock for the Magic Quarter. Mind you don't let your pets loose near the Apothecarium; they spoil the samples, and the samples are worth more than you." },
    { id = "n_lk_troll", cat = "class", when = { class = "WARLOCK", race = "Troll" },
      text = "A Darkspear who talks to demons, eh? De loa won't like it much, but de loa don't like most things, mon, so you be in good company." },
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp is laughing at me. I've been laughed at by peons and by ogres, but never by something the size of my boot." },
    { id = "n_lk_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your shadow-thing makes no sound when it moves, warlock. A creature that quiet in the camp makes the old warriors reach for their axes." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Keep your felhunter away from the shaman's hut. It looks at the totems the way a wolf looks at a lamb." },
    { id = "n_lk_shards", cat = "carry", when = { class = "WARLOCK", carrying = SHARDS },
      text = "Your pack is heavy with stones that hum, and I know what's inside them. The old Horde carried bags like that, before the camps, and I've no wish to see them again." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "The fire in you burns green, warlock; even I can see it, and I'm no shaman. Be careful it doesn't burn you down to nothing." },
  },
}

---------------------------------------------------------------------------
-- Innkeepers, vendors, flight and stable
---------------------------------------------------------------------------
P:Pool {
  id = "lock_innkeeper", role = "innkeeper",
  notice = {
    { id = "n_lk_imp_bar", cat = "pet", when = { pet = { family = "Imp" }, atInn = true },
      text = "{pet} has been sitting on my bar and setting fire to the regulars' pipes for them, which they seem to like. I don't, so would you call it down before somebody's beard goes up?" },
    { id = "n_lk_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker's put out every candle on that side of the room just by standing there. My guests are drinking in the dark, and they don't tip in the dark." },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "I've had three husbands asking for rooms on their own tonight, and it's no mystery why. Your lady friend waits outside, if you please." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Your hound has been licking at the mage in the corner, and he's asked for his money back. Keep it under the table, and keep its feelers to itself." },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE },
      text = "You've got one of those soul charms on you, haven't you? I had a warlock die in the best room once and stand up again an hour later, and I've never been able to let it since." },
    { id = "n_lk_healthstone", cat = "carry", when = { class = "WARLOCK", carrying = HEALTHSTONES },
      text = "I'll not have you passing those green stones round my tables like sweets. People bite into them, and then they want to complain to me about it." },
    { id = "n_lk_sheets", cat = "class", when = { class = "WARLOCK", resting = true, minLevel = 20 },
      text = "If you're staying the night, sleep on top of the covers. Your last stay left scorch marks the shape of a pentagram on my good linen, and I'm still not sure how." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "The fire's been burning green ever since you came in, and the cat won't come out from under the stairs. Drink up, friend, and don't take it personally if I don't sit with you." },
  },
  react = {
    { id = "r_lk_demon", on = "pet", when = { pet = { type = "Demon" } },
      text = "Not in my common room! I've only just got the smell out of the rug from the last time a warlock did that." },
  },
}

P:Pool {
  id = "lock_vendor", role = "vendor",
  notice = {
    { id = "n_lk_shards", cat = "carry", when = { class = "WARLOCK", carrying = SHARDS },
      text = "Before you ask, no, I don't buy those purple stones you're carrying. Somebody sold me a bag of them once, and the whole shop wept at night until I threw them in the river." },
    { id = "n_lk_shards2", cat = "carry", when = { class = "WARLOCK", carrying = { id = 6265, min = 28 } },
      text = "Your bags are full of shards. I can feel them from here, like cold breath on the back of my neck, so let's be quick about our business, shall we?" },
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp has picked up three things off my counter and put back two. I'll be counting the stock when you go, so tell it to empty its little hands now." },
    { id = "n_lk_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker is blocking the door, and customers keep walking up, seeing it and walking away again. If you're buying, buy quickly." },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Your companion keeps fingering the silk and asking what it costs, and then laughing. She can buy something, or she can wait outside with the horses." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "That hound of yours has been nosing at my scrolls and drinking the magic straight off the parchment. A blank scroll is worth nothing to anybody, friend." },
    { id = "n_lk_healthstone", cat = "carry", when = { class = "WARLOCK", carrying = HEALTHSTONES },
      text = "I've seen those green stones of yours mend a broken arm in a heartbeat, and I still wouldn't stock them. Folk ask where they come from, and I've no good answer." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 30 } },
      text = "Funny thing, the scales won't settle while you're near them. They keep tipping toward you, as if something about you weighs more than it should." },
  },
  react = {
    { id = "r_lk_demon", on = "pet", when = { pet = { type = "Demon" } },
      text = "Oh, wonderful, now there's a demon by the counter. Keep its hands off the stock, and I'll pretend I didn't see that." },
  },
}

P:Pool {
  id = "lock_flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  notice = {
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp tried to climb into the saddlebags of the Ironforge bird. Gryphons don't take kindly to anything that smells of brimstone, and they've a long memory for faces." },
    { id = "n_lk_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "Get that burning horse off the roost, I beg you. The gryphons have been screeching since you rode up, and one's thrown a shoe trying to get away from it." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "I'd ask you to dismount that thing well back from the birds. They've flown through smoke and arrows, but none of them will fly anywhere near a dreadsteed." },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE },
      text = "You've a soul charm on you, I see. Good, for if you fall off one of my birds over the mountains, I'd rather you got back up again." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "The birds are all facing away from you, every one of them. In twenty years I've only seen that once, and that was when a Dark Iron came up the stairs." },
    { id = "n_lk_auberdine", cat = "class", when = { class = "WARLOCK", zone = "Darkshore" },
      text = "The hippogryphs here were raised by the Sentinels, and they don't fly demon-callers gladly. I'll find you one that's willing, but mind your hands near its beak." },
  },
}

P:Pool {
  id = "lock_flightmaster_horde", role = "flightmaster", faction = "Horde",
  notice = {
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp tried to pull a feather from a wind rider's tail, and the wind rider nearly took its head. Send it away before the beast tries again; I'd rather not clean that up." },
    { id = "n_lk_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "Bring that fire-horse no closer to my wind riders. They're bred for war, and still they pull at their chains when one of those steeds comes up the path." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "A dreadsteed. I've heard the warlocks speak of them, but I never thought to see one on my tower. Leave it at the foot of the steps, warlock, for the wyverns' sake as much as mine." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "My wind riders won't look at you. They know the stink of the fel, the same as every orc who lived through the camps knows it." },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE },
      text = "You carry a soulstone's mark. Good; the drop from a wind rider is a long one, and the ground in the Barrens is hard." },
    { id = "n_lk_bluff", cat = "class", when = { class = "WARLOCK", zone = "Thunder Bluff" },
      text = "The winds over the bluffs are clean, warlock, and the wind riders like them that way. Fly gently, and let the Earth Mother see you carry no fire into her sky." },
  },
}

P:Pool {
  id = "lock_stablemaster", role = "stablemaster",
  notice = {
    { id = "n_lk_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "Don't even ask me to stable that horse; its hooves are smoking on my straw already. I keep animals here, and that creature's no animal, whatever shape it wears." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "Every beast in my stalls is pressed up against the far wall, and it's that black horse of yours doing it. Hitch it outside, or better yet, send it back wherever it came from." },
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp's been throwing sparks at the hay to watch the horses jump. One more and the whole stable goes up, and you'll be the one explaining it to the town." },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Your companion keeps cracking that whip near the stalls, and she's terrified the ponies. They'll not eat for a week now." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "That eyeless hound has the dogs all hiding under the trough. I'm not asking you to stable it, I'm only asking you to stand it further from my dogs." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 30 } },
      text = "The horses have been stamping since you came up the lane. Animals know something's off before people do, and they've decided something's off about you." },
  },
}

---------------------------------------------------------------------------
-- Children
---------------------------------------------------------------------------
P:Pool {
  id = "lock_child", role = "child",
  notice = {
    { id = "n_lk_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your little red man just made fire come out of his hands! Can he do it again, and can I hold it, if I'm really careful?" },
    { id = "n_lk_succubus", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Your lady has horns and wings and a whip, and she winked at me! Is she a queen? She looks like a queen from a scary story." },
    { id = "n_lk_felhunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Your doggy has no eyes! How does it know where it's going? Can I pet it, or will it eat my fingers?" },
    { id = "n_lk_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "Your horse's feet are on fire! Doesn't it hurt him? I want a fire horse, but Papa says we can barely afford a goat." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "That's the scariest horse I ever saw in my whole life, and I want one so much. Does it eat hay, or does it eat people?" },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE },
      text = "Why have you got a purple glow all around you, like a candle in a jar? Are you magic, or are you a ghost?" },
    { id = "n_lk_shards", cat = "carry", when = { class = "WARLOCK", carrying = SHARDS },
      text = "What's in your bag? It's humming, and it sounds like someone crying very quietly, and I don't like it very much." },
    { id = "n_lk_healthstone", cat = "carry", when = { class = "WARLOCK", carrying = HEALTHSTONES },
      text = "Is that green stone a sweet? It looks like a sweet. My brother would eat it, but he eats everything, even worms." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "Your eyes went green for a moment, I saw it! I'm not scared, but I think I'll go and find my mum now." },
  },
  react = {
    { id = "r_lk_imp", on = "pet", when = { pet = { family = "Imp" } },
      text = "Where did he come from? He came out of the fire! Make him go back in and come out again!" },
    { id = "r_lk_void", on = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Aaah! It came out of the ground all purple and smoky! I wasn't scared, I was only surprised." },
    { id = "r_lk_succubus", on = "pet", when = { pet = { family = "Succubus" } },
      text = "Where did the pretty scary lady come from? Mum said not to talk to strangers, and she's very strange." },
  },
}

---------------------------------------------------------------------------
-- Trainers: the priests and paladins who disapprove
---------------------------------------------------------------------------
P:Pool {
  id = "lock_trainer_priest", role = "trainer", subtitle = "priest trainer",
  notice = {
    { id = "n_lk_demon", cat = "pet", when = { pet = { type = "Demon" }, class = "WARLOCK" },
      text = "You've brought {pet} into a house of healing, and it sets every candle guttering. Leave it beyond the door, child; the Light is patient, but it is not blind." },
    { id = "n_lk_soulstone", cat = "aura", when = { aura = SOULSTONE, class = "WARLOCK" },
      text = "You have bound your own soul to a stone so it cannot leave when it ought to. We priests call the dead back with prayer, and you do it with a contract, and I fear the difference." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 30 }, class = "WARLOCK" },
      text = "I can feel the fel in you as a cold place in the room. It is not too late to set that power down, and I will pray with you whenever you choose to try." },
    { id = "n_lk_forsaken", cat = "class", when = { class = "WARLOCK", race = "Scourge" },
      text = "The Dark Lady keeps her warlocks close in the Magic Quarter, and I keep my students closer. Whatever you've bound, keep it out of my lessons; the Shadow is one thing, and demons are quite another." },
    { id = "n_lk_human", cat = "class", when = { class = "WARLOCK", race = "Human" },
      text = "I baptised children who grew up to go down the Slaughtered Lamb's cellar stairs, and I prayed for every one of them. Do not think the Light has forgotten you, whatever you have bargained away." },
    { id = "n_lk_healthstone", cat = "carry", when = { class = "WARLOCK", carrying = HEALTHSTONES },
      text = "Those healthstones of yours mend flesh, I know, but they are made from the souls you've torn loose. Healing should never cost someone else so dearly." },
  },
  react = {
    { id = "r_lk_demon", on = "pet", when = { pet = { type = "Demon" } },
      text = "Must you summon that here, in a place of prayer? Send it away, and we will speak as if it never came." },
  },
}

P:Pool {
  id = "lock_trainer_paladin", role = "trainer", subtitle = "paladin trainer", faction = "Alliance",
  notice = {
    { id = "n_lk_demon", cat = "pet", when = { pet = { type = "Demon" }, class = "WARLOCK" },
      text = "Every paladin in this hall can feel what walks behind you. Dismiss {pet} before you take another step, or one of my students will do it for you, and none too gently." },
    { id = "n_lk_lamb", cat = "class", when = { class = "WARLOCK", zone = "Stormwind City" },
      text = "The king's peace shelters the cellar of the Slaughtered Lamb, and so I keep my hammer on my belt. But I remember the Dark Portal, warlock, and I remember who opened it." },
    { id = "n_lk_dwarf", cat = "class", when = { class = "WARLOCK", zone = "Ironforge" },
      text = "Ye'll find no welcome for demon-callers in the Hall of Mysteries, lad or lass. The Light shows me what ye carry, and I'll pray it shows ye the same before it's too late." },
    { id = "n_lk_dreadsteed", cat = "mount", when = { aura = { 23161 } },
      text = "I rode a charger summoned by the Light, and you ride one dragged out of the Nether. Our steeds should never stand in the same yard, warlock." },
    { id = "n_lk_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "The Light pricks my palms whenever you come near, as it does when undead are close. You are not lost yet, but you are walking a road that ends in the dark." },
    { id = "n_lk_armor", cat = "aura", when = { aura = DEMONARMOR, class = "WARLOCK" },
      text = "I wear plate blessed by the Light, and you wear the skin of something that should never have been. Take it off in my hall, warlock, as a courtesy." },
  },
  react = {
    { id = "r_lk_demon", on = "pet", when = { pet = { type = "Demon" } },
      text = "You dare call a demon into the Light's own hall? Send it back where it came from, now, before I lose my patience." },
  },
}
