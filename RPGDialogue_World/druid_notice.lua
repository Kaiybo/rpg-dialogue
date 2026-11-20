-- The druid patch: what people notice about a druid's shapes, blessings, thorns and seeds.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Notice-only pools: they stack onto the role pools (pools.lua, pools_roles.lua) and
-- never replace them. The base pools already answer the plain shapes (a child's "kitty",
-- an innkeeper's door frame); these add who-is-looking and what-they-make-of-it, and keep
-- a druid's own lines (change back before the bank) apart from a non-druid's (a blessing).
-- Forms: ctx.state.form = "bear" (dire bear too) | "cat" | "travel" | "aquatic" | "moonkin".
-- Aura ids: Mark of the Wild 1126/5232/6756/5234/8907/9884/9885, Gift of the Wild
-- 21849/21850, Thorns 467/782/1075/8914/9756/9910, Barkskin 22812, Innervate 29166,
-- Rejuvenation 774/1058/1430/2090/2091/3627/8910/9839/9840/9841/25299,
-- Regrowth 8936/8938/8939/8940/8941/9750/9856/9857/9858, Nature's Swiftness 17116,
-- Omen of Clarity 16864.
-- Items: Wild Berries 17021, Wild Thornroot 17026; Rebirth seeds Maple 17034,
-- Stranglethorn 17035, Ashwood 17036, Hornbeam 17037, Ironwood 17038.
-- Unsure: the Cenarion set 16828-16835 and the Stormrage set 16897-16904 (ids from the
-- original game, unconfirmed for Forever); whether dire bear reports as "bear".

local MARK = { 1126, 5232, 6756, 5234, 8907, 9884, 9885, 21849, 21850 }
local GIFT = { 21849, 21850 }
local THORNS = { 467, 782, 1075, 8914, 9756, 9910 }
local BARKSKIN = { 22812 }
local INNERVATE = { 29166 }
local REJUV = { 774, 1058, 1430, 2090, 2091, 3627, 8910, 9839, 9840, 9841, 25299 }
local REGROWTH = { 8936, 8938, 8939, 8940, 8941, 9750, 9856, 9857, 9858 }
local HOTS = { 774, 1058, 1430, 2090, 2091, 3627, 8910, 9839, 9840, 9841, 25299,
  8936, 8938, 8939, 8940, 8941, 9750, 9856, 9857, 9858 }
local SWIFTNESS = { 17116 }
local OMEN = { 16864 }

local BERRIES = { 17021 }
local THORNROOT = { 17026 }
local GIFT_REAGENTS = { 17021, 17026 }
local SEEDS = { 17034, 17035, 17036, 17037, 17038 }
local CENARION = { 16828, 16829, 16830, 16831, 16832, 16833, 16834, 16835 }   -- unsure
local STORMRAGE = { 16897, 16898, 16899, 16900, 16901, 16902, 16903, 16904 }  -- unsure

local NOT_DRUID = { class = "DRUID" }
local ELF_TOWNS = { "Darnassus", "Teldrassil" }
local BLUFF = { "Thunder Bluff", "Mulgore" }

---------------------------------------------------------------------------
-- Guards
---------------------------------------------------------------------------
P:Pool {
  id = "dru_guard_alliance", role = "guard", faction = "Alliance",
  notice = {
    { id = "n_dr_bank", cat = "form", when = { form = "bear", zone = { "Stormwind City", "Ironforge" } },
      text = "A bear, strolling up the King's road as calm as you please. I know a druid when I see one, friend, because a real bear wouldn't wait its turn at the gate, but change back before you go into the bank, or the clerks will lock themselves in the vault." },
    { id = "n_dr_bear_elf", cat = "form", when = { form = "bear", zone = ELF_TOWNS },
      text = "Ishnu-alah, druid. Bears are welcome enough at the Enclave, but the Warrior's Terrace has had its fill of claw marks on the steps this season, so walk lightly past it." },
    { id = "n_dr_cat", cat = "form", when = { form = "cat", ["not"] = { zone = ELF_TOWNS } },
      text = "A great cat padding past my post, and me with my hand halfway to my sword. Put your own face back on, druid, before some recruit with a crossbow decides you've escaped from a menagerie." },
    { id = "n_dr_cat_elf", cat = "form", when = { form = "cat", zone = ELF_TOWNS },
      text = "You move well as a nightsaber, druid, but our own cats are trained to warn of strangers in that shape. Walk on two feet near the Temple Gardens, and they will stop growling at you." },
    { id = "n_dr_travel", cat = "form", when = { form = "travel", zone = { "Stormwind City", "Ironforge" } },
      text = "You went past me at a gallop on four spotted legs, and I had to look twice to be sure you weren't somebody's runaway cheetah. The streets are for walking, druid, even for those of you who can't settle on a shape." },
    { id = "n_dr_moonkin", cat = "form", when = { form = "moonkin", ["not"] = { zone = ELF_TOWNS } },
      text = "Light preserve us, what is that? Oh, it's a druid, one of those moonkin shapes the night elves talk about, and you'll forgive me, but I've stood this post eleven years and never once had to salute an owl." },
    { id = "n_dr_mark", cat = "aura", when = { aura = MARK, ["not"] = NOT_DRUID },
      text = "Somebody's put a druid's blessing on you; I can smell the leaves and the rain on it from here. My wife swears it keeps the chill out of her bones, and I've stopped arguing with her about it." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS },
      text = "There are thorns growing out of your armour, out of nothing at all, and I scratched my hand just pointing at you. Keep that away from the crowds in the market, would you?" },
    { id = "n_dr_nelf_sw", cat = "class", when = { class = "DRUID", race = "NightElf", zone = "Stormwind City" },
      text = "One of the kaldorei druids, here in Stormwind. Half this city has never seen anyone turn into a bear on purpose, so you'll have to forgive the stares, and the children following you about." },
    { id = "n_dr_human", cat = "class", when = { class = "DRUID", race = "Human" },
      text = "A human druid? I'd have said there was no such thing, but you've the leaves in your hair and the look of someone who sleeps outdoors. My captain will want to hear about this." },
    { id = "n_dr_skyborne", cat = "class", when = { class = "DRUID", race = "Skyborne" },
      text = "A Skyborne druid. Folk say your people listen to the winds before the moon, and I'll admit I'd not know the difference, but the night elves at the harbour seem to think it matters a great deal." },
    { id = "n_dr_rank", cat = "pvp", when = { class = "DRUID", pvpRank = { min = 6 } },
      text = "The lads back from Ashenvale speak of you, {rank}. They say there's a druid who tends the wounded under arrow fire and then turns bear and holds the line, and I suppose that must be you." },
  },
  react = {
    { id = "r_dr_bear", on = "form", when = { form = "bear", ["not"] = { zone = ELF_TOWNS } },
      text = "Whoa, steady! Give a man some warning before you grow a foot and a half of fur!" },
    { id = "r_dr_barkskin", on = "aura", when = { aura = BARKSKIN },
      text = "Your skin's gone to bark! Are you hurt, or is that meant to happen?" },
  },
}

P:Pool {
  id = "dru_guard_horde", role = "guard", faction = "Horde",
  notice = {
    { id = "n_dr_bank", cat = "form", when = { form = "bear", zone = { "Orgrimmar", "Durotar" } },
      text = "A bear in the Valley of Strength, walking as if it owns the place. I know a druid when I see one, but change back before the bank, because the goblins in there won't count gold for anything with claws." },
    { id = "n_dr_lift", cat = "form", when = { form = "bear", zone = BLUFF },
      text = "Walk softly on the lift in that shape, druid; the ropes have carried many tauren, but never quite so much bear. The Earth Mother does not mind which shape you wear up the bluff, though the lift-keeper might." },
    { id = "n_dr_cat_uc", cat = "form", when = { form = "cat", zone = { "Undercity", "Tirisfal Glades" } },
      text = "A cat in the Undercity. The rats are fleeing from you, druid, which makes you more useful than half the Apothecarium's assistants, so I'll let you pass." },
    { id = "n_dr_cat", cat = "form", when = { form = "cat", ["not"] = { zone = { "Undercity", "Tirisfal Glades" } } },
      text = "A great cat stalking through the gate, and my hand went straight to my axe. Put your own face on, druid, before one of the young grunts tries to skin you for a rug." },
    { id = "n_dr_travel", cat = "form", when = { form = "travel", zone = { "Orgrimmar", "Durotar" } },
      text = "You came through the gate on four legs like a running cheetah, and two grunts nearly put spears in you. The Warchief's road is for walking, druid." },
    { id = "n_dr_tauren", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "One of Hamuul's druids. The Elder Rise waited a long time for our people to hear the old ways again, and I am glad to see you walking the road with them." },
    { id = "n_dr_ogrim", cat = "class", when = { class = "DRUID", zone = "Orgrimmar", ["not"] = { race = "Tauren" } },
      text = "A druid in Orgrimmar. Grom's axe slew the night elves' forest god in Ashenvale, and some of the old guard still wonder whose side your Circle would take, so don't be surprised by the looks." },
    { id = "n_dr_mark", cat = "aura", when = { aura = MARK, ["not"] = NOT_DRUID },
      text = "A druid's blessing on you, I see; the tauren hand them out like water at the Crossroads. Good, because you'll need the luck where you're going." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS },
      text = "You've thorns on your shoulders, sprouting out of the leather. Keep your distance in the crowd, because if a peon walks into you, I'll be the one hearing about it." },
    { id = "n_dr_skyborne", cat = "class", when = { class = "DRUID", race = "Skyborne" },
      text = "A Skyborne druid. Thunder Bluff vouches for your people, and the tauren say you hear the wind as clearly as they hear the earth, so I'll not stand in your way." },
    { id = "n_dr_rank", cat = "pvp", when = { class = "DRUID", pvpRank = { min = 6 } },
      text = "The grunts back from the front speak of you, {rank}. They say you rooted a whole squad of Sentinels to the ground and walked away healing the wounded, and that the elves still curse you by name." },
  },
  react = {
    { id = "r_dr_bear", on = "form", when = { form = "bear" },
      text = "Ha! A bear! Lok'tar, druid, you nearly had my spear in you." },
    { id = "r_dr_barkskin", on = "aura", when = { aura = BARKSKIN },
      text = "Your hide's gone to bark like an old tree. Strong medicine, that." },
  },
}

---------------------------------------------------------------------------
-- Townsfolk
---------------------------------------------------------------------------
P:Pool {
  id = "dru_citizen_alliance", role = "citizen", faction = "Alliance",
  notice = {
    { id = "n_dr_cat", cat = "form", when = { form = "cat", ["not"] = { zone = ELF_TOWNS } },
      text = "Oh, what a lovely great cat! Are you a person in there? My daughter wants to know whether you'll purr, and I'm afraid I'd like to know as well." },
    { id = "n_dr_bear", cat = "form", when = { form = "bear", ["not"] = { zone = ELF_TOWNS } },
      text = "There's a bear in the market, and nobody's screaming, so I suppose you must be one of the elf druids. My heart's still going like a drum, mind you." },
    { id = "n_dr_mark", cat = "aura", when = { aura = MARK, ["not"] = NOT_DRUID },
      text = "You smell of rain and green things, like a spring morning. Has one of the druids blessed you? I've heard it keeps the cold off better than a wool coat." },
    { id = "n_dr_rejuv", cat = "aura", when = { aura = HOTS, ["not"] = NOT_DRUID },
      text = "There's a little green light under your skin, mending you while you stand there. Was it a druid that did that? I'd pay a whole silver to have my knees seen to like that." },
    { id = "n_dr_human", cat = "class", when = { class = "DRUID", race = "Human" },
      text = "A human druid! My gran swore our people had hedge-witches once who talked to the oaks, back before there was a Stormwind, so perhaps it's in the blood after all." },
    { id = "n_dr_nelf", cat = "class", when = { class = "DRUID", race = "NightElf", ["not"] = { zone = ELF_TOWNS } },
      text = "Is it true your druids slept for a thousand years in a dream? I can barely manage eight hours, and only when the baby lets me." },
    { id = "n_dr_dwarf", cat = "class", when = { class = "DRUID", race = "Dwarf" },
      text = "A dwarf with leaves in his beard and a druid's staff! My husband will never believe me, so I hope you'll stand still long enough for me to fetch him." },
    { id = "n_dr_elf_town", cat = "class", when = { class = "DRUID", zone = ELF_TOWNS },
      text = "Back from the wild, druid? My brother went to the Enclave to learn the bear and came home after a year speaking twice as slowly, and my mother says it suits him." },
  },
}

P:Pool {
  id = "dru_citizen_horde", role = "citizen", faction = "Horde",
  notice = {
    { id = "n_dr_bear", cat = "form", when = { form = "bear", zone = { "Orgrimmar", "Durotar" } },
      text = "A bear in the Drag! The peons scattered like quail, druid, so I hope you're pleased with yourself." },
    { id = "n_dr_tauren", cat = "class", when = { class = "DRUID", race = "Tauren", zone = BLUFF },
      text = "Our people are druids again, after so long without. My grandmother wept when Hamuul came home from Moonglade, and I think she would weep again to see you, little one." },
    { id = "n_dr_tauren_away", cat = "class", when = { class = "DRUID", race = "Tauren", ["not"] = { zone = BLUFF } },
      text = "A tauren druid, this far from the grass. The orcs here don't know what to make of your kind, so they'll ask you to heal their wolves, and you'd be wise to say yes." },
    { id = "n_dr_cat_uc", cat = "form", when = { form = "cat", zone = { "Undercity", "Tirisfal Glades" } },
      text = "A cat, in the Undercity. Do keep away from the Apothecarium, druid, because I hear they've been wanting a live one for their work." },
    { id = "n_dr_mark", cat = "aura", when = { aura = MARK, ["not"] = NOT_DRUID },
      text = "You've a druid's blessing on you; the air smells of grass wherever you stand. A tauren gave you that, I'd wager, for they're generous with it." },
    { id = "n_dr_rejuv", cat = "aura", when = { aura = HOTS, ["not"] = NOT_DRUID },
      text = "Some druid's put green light into your wounds, and they're closing as I watch. The shamans heal fast and loud, and that is slow and quiet, and I can't decide which I like better." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS, zone = { "Orgrimmar", "Durotar" } },
      text = "Thorns on your armour, and green ones at that. Mind them in the Drag, because there's not a single green thing in this city and the cactus-pickers will think you're stealing their trade." },
  },
}

---------------------------------------------------------------------------
-- Bankers and auctioneers: no claws at the counter
---------------------------------------------------------------------------
P:Pool {
  id = "dru_banker", role = "banker",
  notice = {
    { id = "n_dr_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "Not as a bear at my counter, druid! The last one leaned on it and the ledgers went everywhere, so change back, and then we can talk about your vault." },
    { id = "n_dr_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "A cat at the counter. Paws off the coin, please, because we count it by hand here, and I'll need you to sign for your vault with something that isn't a claw." },
    { id = "n_dr_moonkin", cat = "form", when = { form = "moonkin" }, place = "replace",
      text = "I'm sure you're a very respectable owl, but the bank can't open a vault for anyone it can't recognise. Your own face, if you please, and then your business." },
  },
}

P:Pool {
  id = "dru_auctioneer", role = "auctioneer",
  notice = {
    { id = "n_dr_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "No bidding in that shape, druid, because I can't tell a raised paw from a scratch behind the ear. Change back, and you can outbid whomever you like." },
    { id = "n_dr_seeds", cat = "carry", when = { carrying = SEEDS },
      text = "Rebirth seeds, are they? If you mean to list them, I'll warn you that druids buy them from the reagent seller for coppers, and nobody else has the faintest idea what they're for." },
  },
}

---------------------------------------------------------------------------
-- Innkeepers and vendors
---------------------------------------------------------------------------
P:Pool {
  id = "dru_innkeeper", role = "innkeeper",
  notice = {
    { id = "n_dr_resting", cat = "class", when = { class = "DRUID", resting = true },
      text = "A druid taking a real bed. I'd heard your sort slept on moss and liked it, so I'll take the coin and not ask what's wrong with the moss tonight." },
    { id = "n_dr_cat", cat = "form", when = { form = "cat" },
      text = "A cat by my hearth, and a big one. Curl up by the fire if you like, druid, but the regulars will want their chairs back once you've had your nap." },
    { id = "n_dr_moonkin", cat = "form", when = { form = "moonkin" },
      text = "Mind the rafters, druid, because an owl that size will take the lantern down with its head, and I've only just rehung it." },
    { id = "n_dr_innervate", cat = "aura", when = { aura = INNERVATE },
      text = "Your eyes have that bright, full look, as if somebody's poured the stars into you. A druid's gift, is it? It'll do you more good than my ale, and I say that as the man who sells the ale." },
    { id = "n_dr_berries", cat = "carry", when = { carrying = BERRIES },
      text = "Those berries in your pouch aren't for eating, are they? The last druid who stayed here told me they were for blessings, and then ate a handful anyway once the kitchen closed." },
    { id = "n_dr_tauren", cat = "class", when = { class = "DRUID", race = "Tauren", zone = BLUFF },
      text = "Sit, young druid, and take some of the stew. Hamuul's students always come in from the plains with the wind in their manes and nothing in their bellies." },
    { id = "n_dr_nelf", cat = "class", when = { class = "DRUID", race = "NightElf", zone = ELF_TOWNS },
      text = "A druid of the Enclave, taking a room in town. You must have quarrelled with your grove, or else the moonwell's too cold for sleeping tonight, and I won't ask which." },
  },
}

P:Pool {
  id = "dru_vendor", role = "vendor",
  notice = {
    { id = "n_dr_bear", cat = "form", when = { form = "bear" },
      text = "Not in that shape near the shelves, please. Bears have no idea where their backsides are, and I've a whole stack of pottery right behind you." },
    { id = "n_dr_cat", cat = "form", when = { form = "cat" },
      text = "A cat in my shop. If you're after fish, druid, you've come to the wrong counter, and if you're after my stock, you'll need thumbs to pay for it." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS },
      text = "You've thorns sprouting all over you. Don't lean on the bolts of cloth, I beg you, or I'll be selling them as lace." },
    { id = "n_dr_mark", cat = "aura", when = { aura = GIFT, ["not"] = NOT_DRUID },
      text = "You and your whole party came in smelling of the forest, which means a druid's blessed the lot of you at once. That's a generous druid, friend, so buy them something nice on your way out." },
  },
}

P:Pool {
  id = "dru_vendor_reagent", role = "vendor", subtitle = { "reagent" },
  notice = {
    { id = "n_dr_noseeds", cat = "carry", when = { class = "DRUID", minLevel = 20, ["not"] = { carrying = SEEDS } },
      text = "Not a single seed for Rebirth on you, druid? The day you need to call a friend back from the dead, you'll be very sorry you were too thrifty to buy one from me." },
    { id = "n_dr_seeds", cat = "carry", when = { carrying = SEEDS },
      text = "You've a pocket full of Rebirth seeds, I see. I sell them by the dozen and never ask what they're used for, but I've seen the look on a man's face after a druid's planted one for him, so I can guess." },
    { id = "n_dr_gift", cat = "carry", when = { carrying = GIFT_REAGENTS },
      text = "Wild berries and thornroot, and in quantity. That's a druid who blesses a whole company at once, and I'd think more highly of the company if any of them ever thanked me for stocking it." },
    { id = "n_dr_nothornroot", cat = "carry", when = { class = "DRUID", minLevel = 60, ["not"] = { carrying = THORNROOT } },
      text = "No thornroot on you? Then you'll be blessing your friends one at a time like an apprentice, and the raid leaders I've met don't care for waiting." },
  },
}

P:Pool {
  id = "dru_blacksmith", role = "blacksmith",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid in a smithy. Your sort won't wear my steel, I know, but I've mended many a druid's mace and staff ferrule, so let's see what you've broken." },
    { id = "n_dr_bear", cat = "form", when = { form = "bear" },
      text = "Out of the forge in that shape, druid! Fur and hot coals are a poor match, and I'll not be the one who has to put you out." },
    { id = "n_dr_barkskin", cat = "aura", when = { aura = BARKSKIN },
      text = "Your skin's gone hard as old oak, and I'll tell you honestly, that's better armour than half of what's on my rack. Don't tell my customers." },
  },
}

---------------------------------------------------------------------------
-- Flight and stable masters
---------------------------------------------------------------------------
P:Pool {
  id = "dru_flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  notice = {
    { id = "n_dr_travel", cat = "form", when = { form = "travel" },
      text = "You'll not be needing my birds, I'd guess, not with those four fast legs of yours. They don't cross water, though, druid, and mine do." },
    { id = "n_dr_moonglade", cat = "class", when = { class = "DRUID", minLevel = 10 },
      text = "You druids step off to Moonglade with a word and come back on your own feet, I'm told, and then you come to me to get anywhere else. I'd charge double for the convenience if the Circle wouldn't frown at me." },
  },
}

P:Pool {
  id = "dru_flightmaster_horde", role = "flightmaster", faction = "Horde",
  notice = {
    { id = "n_dr_travel", cat = "form", when = { form = "travel" },
      text = "Running everywhere as a cheetah, druid? The wind riders laugh at four legs, but they'll take you over the mountains when your paws give out." },
    { id = "n_dr_tauren", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "The wind riders like tauren druids; they say you smell of grass and you never kick. Climb on, and hold the mane, not the ears." },
  },
}

P:Pool {
  id = "dru_stablemaster", role = "stablemaster",
  notice = {
    { id = "n_dr_bear", cat = "form", when = { form = "bear" },
      text = "My beasts went quiet the moment you walked in, druid, and they only do that for a real bear or a real druid. Change back before the kodo panic, please." },
    { id = "n_dr_cat", cat = "form", when = { form = "cat" },
      text = "The hunters' cats are all staring at you, druid, and they can't decide whether to fight you or follow you. Go gently past the pens." },
    { id = "n_dr_class", cat = "class", when = { class = "DRUID", ["not"] = { form = { "bear", "cat", "travel", "aquatic", "moonkin" } } },
      text = "A druid at my stables. You'll never need to board a beast with me, but the beasts like you, so stay a moment and settle the restless ones if you would." },
  },
}

---------------------------------------------------------------------------
-- Children
---------------------------------------------------------------------------
P:Pool {
  id = "dru_child", role = "child",
  notice = {
    { id = "n_dr_mark", cat = "aura", when = { aura = MARK },
      text = "You smell like a forest! Did you roll in leaves? Mum says I'm not allowed to roll in leaves, but you're a grown-up, so you can." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS },
      text = "You've got prickles all over you, like a hedgehog! I touched one and it stung, so I'm not going to do that again, probably." },
    { id = "n_dr_tauren", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "Are you a tauren and a bear as well? Do you turn into a bigger bear than everybody else, because I think you would." },
    { id = "n_dr_class", cat = "class", when = { class = "DRUID", ["not"] = { form = { "bear", "cat", "travel", "aquatic", "moonkin" } } },
      text = "Are you one of the ones who turns into animals? Do a bear, please, a big one, and then do a cat, and then do a bear again!" },
  },
  react = {
    { id = "r_dr_barkskin", on = "aura", when = { aura = BARKSKIN },
      text = "You turned into a tree for a second! Do it again, do it again!" },
    { id = "r_dr_rejuv", on = "aura", when = { aura = REJUV },
      text = "Your skin's sparkly green now! Did it tickle?" },
  },
}

---------------------------------------------------------------------------
-- The spirit healer
---------------------------------------------------------------------------
P:Pool {
  id = "dru_spirithealer", role = "spirithealer",
  notice = {
    { id = "n_dr_first", cat = "death", place = "before", when = { class = "DRUID", deaths = { max = 1 } },
      text = "The wild teaches that everything returns to the soil, and you knew that lesson long before you came here. You have only learned it sooner than you meant to, druid." },
    { id = "n_dr_many", cat = "death", place = "after", when = { class = "DRUID", deaths = { min = 50 } },
      text = "You come here often for one who can mend others. Your file is thick with friends you kept standing while you yourself fell, and I suspect you count that a fair trade." },
    { id = "n_dr_rebirth", cat = "death", place = "after", when = { class = "DRUID", minLevel = 20 },
      text = "You carry seeds that call others back from this place, druid, so you understand what I do better than most. Go back, and plant them wisely." },
    { id = "n_dr_sixty", cat = "death", place = "after", when = { class = "DRUID", minLevel = 60 },
      text = "You have worn every shape the wild could give you, and still you came to this one in the end. Go back, and wear the others a while longer." },
  },
}

---------------------------------------------------------------------------
-- Trainers, looking at a druid
---------------------------------------------------------------------------
P:Pool {
  id = "dru_trainer_druid", role = "trainer", subtitle = "druid trainer",
  notice = {
    { id = "n_dr_nomark", cat = "aura", when = { class = "DRUID", minLevel = 10, ["not"] = { aura = MARK } },
      text = "No Mark of the Wild on you, and you a druid? Bless yourself before you bless anyone else, because the wild's first gift is the one you keep for your own road." },
    { id = "n_dr_omen", cat = "aura", when = { aura = OMEN },
      text = "Omen of Clarity hums about you like a bee in clover. Good; let it pay for your spells when it can, because the wild is generous to those who keep it close." },
    { id = "n_dr_swift", cat = "aura", when = { aura = SWIFTNESS },
      text = "You've Nature's Swiftness ready at your fingertips, I can feel it from here. Save it for the moment someone is dying, and not a heartbeat before." },
    { id = "n_dr_innervate", cat = "aura", when = { aura = INNERVATE },
      text = "Somebody has been given your Innervate, and I hope it was a healer who needed it and not a mage who was merely tired. Choose with care, because the gift is slow to come back." },
    { id = "n_dr_noseeds", cat = "carry", when = { class = "DRUID", minLevel = 20, ["not"] = { carrying = SEEDS } },
      text = "No seeds for Rebirth in your pack? The spell is no use without one, and the day you need it, nobody will have time to wait while you run to the reagent seller." },
    { id = "n_dr_cenarion", cat = "gear", when = { equipped = CENARION },
      text = "Leaves and antlers on your shoulders, woven by hands far older than mine, and the weave smells of cinders. Wherever you won that, it was somewhere the wild never grows, so wear it like a promise to go back and mend the place." },
    { id = "n_dr_stormrage", cat = "gear", when = { equipped = STORMRAGE },
      text = "That raiment carries Stormrage's name, and a dragon's shadow on the cloth besides. I'll not ask where you found it, but wear it humbly, because the name was never yours." },
  },
}

P:Pool {
  id = "dru_trainer_priest", role = "trainer", subtitle = "priest trainer",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid in the Light's hall. You heal with leaves and moonlight and I heal with prayer, and I've never once heard a wounded man ask which." },
    { id = "n_dr_rejuv", cat = "aura", when = { aura = HOTS },
      text = "A druid's healing is working through you slowly, from the inside out. It is gentler than ours and slower, so I'll let it finish before I add anything to it." },
  },
}

P:Pool {
  id = "dru_trainer_paladin", role = "trainer", subtitle = "paladin trainer", faction = "Alliance",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid among the Silver Hand. We'll stand in front and you'll keep us standing, and that's an old and honest arrangement, whatever your elders think of the Light." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS, ["not"] = NOT_DRUID },
      text = "A druid has grown thorns on your armour, I see. Wear them proudly; any blow that lands on you will cost the one who struck it." },
  },
}

P:Pool {
  id = "dru_trainer_warrior", role = "trainer", subtitle = "warrior trainer",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid. I've seen your sort turn bear and hold a line better than half my recruits, so don't let anyone tell you it isn't real fighting." },
    { id = "n_dr_bear", cat = "form", when = { form = "bear" },
      text = "Now that's a stance I can't teach! Stand in the yard like that a moment and let the recruits see what a proper pair of shoulders looks like." },
  },
}

P:Pool {
  id = "dru_trainer_rogue", role = "trainer", subtitle = "rogue trainer",
  notice = {
    { id = "n_dr_cat", cat = "form", when = { form = "cat" },
      text = "You're stalking about as a cat, druid, and you think nobody sees you. I see you, though I'll admit you're quieter than half my students." },
    { id = "n_dr_class", cat = "class", when = { class = "DRUID", ["not"] = { form = "cat" } },
      text = "A druid, in here. I've lost two marks to a cat that turned into an elf at the worst possible moment, so you'll understand if I keep an eye on you." },
  },
}

P:Pool {
  id = "dru_trainer_hunter", role = "trainer", subtitle = "hunter trainer",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "The beasts keep looking at you as though you were one of them who forgot the way home. Mind you don't confuse them, druid." },
    { id = "n_dr_bear", cat = "form", when = { form = "bear" },
      text = "Don't stand by the pens in that shape, druid; my bear thinks you're a rival, and he's been sulking since you came in." },
  },
}

P:Pool {
  id = "dru_trainer_mage", role = "trainer", subtitle = "mage trainer",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid, in among the books. Your Circle thinks my sort will drown the world again one day, so I'll keep the arcane to a whisper while you're here." },
    { id = "n_dr_moonkin", cat = "form", when = { form = "moonkin" },
      text = "A moonkin among the mages! The starlight you throw is half arcane, you know, whatever your elders in Moonglade would prefer to call it." },
  },
}

P:Pool {
  id = "dru_trainer_shaman", role = "trainer", subtitle = "shaman trainer", faction = "Horde",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid. You listen to the beasts and the moon and I listen to the elements, and in all my years I've never seen the spirits quarrel over it." },
    { id = "n_dr_tauren", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "A tauren druid in a shaman's lodge. Our people walked both paths before the Circle came to teach us, so don't forget the elements while you learn the moon." },
  },
}

P:Pool {
  id = "dru_trainer_warlock", role = "trainer", subtitle = "warlock trainer",
  notice = {
    { id = "n_dr_class", cat = "class", when = { class = "DRUID" },
      text = "A druid among warlocks. The grass you walked in on is already wilting, and I never touched it, so don't look at me like that." },
    { id = "n_dr_thorns", cat = "aura", when = { aura = THORNS },
      text = "Thorns, is it? How very rustic. My imp has found three of them already, and he's very offended." },
  },
}
