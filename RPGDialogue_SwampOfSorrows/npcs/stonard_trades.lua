-- Stonard's tradesfolk: Hekkru (stable master), Thultash (food and drink), Rartar (alchemy supplies), Banalash (trade supplies),
-- Thralosh (cloth and leather), Grimnal (mail and plate), Hartash (weapons), Gharash (blacksmithing supplies).
-- Voice: bibles/stonard_trades.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Hekkru, stable master
---------------------------------------------------------------------------
P:NPC {
  key = "hekkru", id = TODO_NPC("Hekkru"), name = "Hekkru", title = "Stable Master",
  bible = "bibles/stonard_trades.md", role = "stablemaster", tier = "service",
  communities = { "stonard" }, temper = { "patient", "gruff" }, values = { "practical", "loyal" },
  notices = { "pet", "class" },

  impression = {
    first = "Hekkru keeps Stonard's stables on the one patch of ground in town that doesn't flood, and he guards it like a treasure. He talks to the beasts more kindly than he talks to their owners.",
    third = "{name} met Hekkru, the stable master at Stonard, who keeps the beasts dry in a swamp that never is.",
  },

  greetings = {
    { id = "g_default", text = "Wipe your boots before you come under my roof, because this is the only dry straw in the whole swamp and I mean to keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your beast's been fed and grumbling, which is how I like them." },
    { id = "g_rain", when = { timeOfDay = "night" }, text = "The frogs are loud tonight, and the beasts hate it, so speak softly if you're coming in." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has swamp mud between its toes, and that mud breeds rot if you leave it, so let me see that paw before you go anywhere." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast looks well kept, and most who come through that gate can't say as much for their wolves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_crocs", when = { killed = { name = "Sawtooth", min = 30 } },
          text = "You've been killing the crocolisks along the river, haven't you? They're nasty brutes, I'll grant you, but they were here first, and I'd rather you didn't brag about it near my stables." },
        { id = "h_default", key = true,
          text = "I'm Hekkru, and I keep the stables for Stonard. If you've a beast that needs rest, I'll keep it dry and fed while you go and get yourself bitten by something." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good, because you'll understand why I don't let anyone else feed the beasts. Do you need one stabled, or one brought out?" },
        { id = "h_pet", when = { pet = { type = "Beast" } },
          text = "That {pet} of yours has the look of a beast that's been dragged through every bog between here and the Blasted Lands. I'll look after it, if you want it looked after." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, and the beasts are calm already, because they always are around your people. I've never learned the trick of it, though I've watched for years." },
      },
      again = {
        { id = "h_again", text = "What else? The beasts want their supper soon." },
        { id = "h_again2", text = "Ask, then, but keep your voice low near the pens." },
      },
      choices = {
        { text = "I need to stable a beast.", next = "BUSINESS" },
        { text = "How do you keep anything dry in this swamp?", next = "dry" },
        { text = "What lives out there that a beast should fear?", next = "wilds" },
        { text = "Do you think beasts belong in war?", next = "war" },
        { text = "Why do tauren calm the beasts, do you think?", next = "xtauren", when = { race = "Tauren" } },
        { text = "My beast has never been ill a day in its life.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll leave you to the pens.", next = "END" },
      },
    },

    dry = {
      lines = { { id = "dr_default", text = "I don't, not truly dry, but this corner of town sits on old stone the first Horde laid down, and the water only reaches it in the worst rains. I raise the straw on planks, I burn the damp out with a brazier, and I check every hoof and paw twice a day." } },
      choices = {
        { text = "Old stone from the first Horde?", next = "dry_stone" },
        { text = "What happens if you miss a day?", next = "dry_rot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry_stone = {
      lines = { { id = "drs_default", text = "Aye, there's footings under this town older than any of us, laid when the Horde first came through the Portal. Somebody built them well, and I don't know his name, but I thank him every time it rains." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    dry_rot = {
      lines = { { id = "drr_default", text = "Then the swamp gets into the feet, and a wolf with foot rot is a wolf that limps for a month and bites whoever tries to help. I lost a good worg to it my first season here, and I haven't missed a day since." } },
      choices = {
        { text = "That's hard work for one orc.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wilds = {
      lines = { { id = "wi_default", text = "Crocolisks, first, because they lie still in the shallows until a beast stops to drink, and then it's gone. After them, the swamp jaguars, who hunt from the trees, and the dragonkin around the sunken temple, which nobody sensible goes near." } },
      choices = {
        { text = "Dragonkin? Here?", next = "wilds_dragon" },
        { text = "How do you teach a beast to fear a log?", next = "wilds_log" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds_dragon = {
      lines = { { id = "wid_default", text = "Green ones, around the sunken temple in the Pool of Tears, and they don't sleep the way they ought to. Fel'zerul, our troll who watches the temple, says the trolls in the temple are behind something, so if you want the rest of that story, ask him and not me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wilds_log = {
      lines = { { id = "wil_default", text = "You don't, because a thirsty beast forgets everything you've taught it the moment it smells water. You teach yourself instead, and you walk to the bank first and look at every log until it either blinks or doesn't." } },
      choices = { { text = "Good advice. Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },

    war = {
      big = true,
      lines = { { id = "wa_default", text = "The Horde has always fought beside wolves, and the wolves have never complained, but I've buried enough of them to wonder. A beast follows because it trusts you, and that trust is a heavy thing to spend." } },
      choices = {
        { text = "A beast that trusts you deserves to be kept from harm.", next = "BACK", reply = "It does, and I've tried to keep them so. You speak like someone who has had a beast of their own.", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Weapons get used.", next = "BACK", reply = "A weapon, yes, until it looks at you the morning before a battle. Then tell me it's only a weapon.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    xtauren = {
      lines = { { id = "xt_default", text = "My guess is you never once look at them as food, and they know it, in whatever way beasts know things. An orc can't help measuring a boar for the spit, and the boar sees it in his eyes." } },
      choices = { { text = "Maybe so. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "Then you've been lucky or careful, and in this swamp the difference doesn't matter until the day it does. Bring it to me when you're passing and I'll look at its feet, and we'll see how long your luck holds." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I kept wolves for a raiding band in the Barrens, and when the band settled down, the wolves and I came east together. Only one of those wolves is left, and she's too old to leave the straw." } },
    _none = { { id = "tp_none", text = "I know beasts, not that. Ask in the hall, where they talk about everything." } },
  },
}

---------------------------------------------------------------------------
-- Rartar, alchemy supplies
---------------------------------------------------------------------------
P:NPC {
  key = "rartar", id = TODO_NPC("Rartar"), name = "Rartar", title = "Alchemy Supplies",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "fussy" }, values = { "careful", "practical" },
  notices = { "craft" },

  impression = {
    first = "Rartar sells alchemy supplies in Stonard and keeps every vial on his shelf in an order only he understands. He works next to Rogvar the alchemist and quietly thinks he's the more careful of the two.",
    third = "{name} met Rartar, who sells vials and reagents to Stonard's alchemists.",
  },

  greetings = {
    { id = "g_default", text = "Don't touch the shelf, please, because everything on it is in order and the order matters." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more vials? Good, but take them from the front, not the back." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "There's green under your fingernails, so you gather. If you've brought anything in, show me before the damp gets at it." },
    { id = "n_big", cat = "race", when = { race = "Tauren" },
      text = "Careful, please. These shelves were built for orcs, and you're a good deal wider than an orc." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Haromm buys his powders here, and he never knocks anything over, so I'm disposed to like your kind." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, by the stains on your fingers, and you'll be wanting my vials, so ask before you reach for anything." },
  },

  start = "hello",
  nodes = {
    hall = {
      lines = {
        { id = "hl_default", text = "Rogvar brews at the back, Thultazor sells reagents two tables down, and Banalash has the trade goods by the door. Kartosh the warlock comes by for things I'd rather not name, and he always pays in exact coin, which I appreciate." },
      },
      choices = {
        { text = "You and Thultazor sell much the same wares.", next = "hall_thultazor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_thultazor = {
      lines = {
        { id = "ht_default", text = "We do not, and he'd say the same. He sells what goes into a spell, and I sell what goes into a bottle, and we agreed long ago that anyone who asks for both gets sent to the nearer table. It has kept the peace." },
      },
      choices = {
        { text = "A sensible treaty.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "hb_default", text = "More than you'd think. Blindweed comes up along the water's edge, liferoot grows on the banks, and there's a good deal of swamp moss if you can stand the smell. The trouble is everything that lives beside them." },
      },
      choices = {
        { text = "What lives beside them?", next = "herbs_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_danger = {
      lines = {
        { id = "hd_default", text = "Crocolisks in the shallows, jaguars in the reeds, and the Lost Ones at the Fallow Sanctuary, who take a gatherer for a trespasser. I've had three herbalists stop coming, and only one of them told me why." },
      },
      choices = {
        { text = "Then your stock is hard won.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xherb = {
      lines = {
        { id = "xh_default", text = "Blindweed along the Misty Reed shore and the pools west of the gate, and liferoot wherever the bank is steep. Cut it clean, wrap it in oilcloth the moment it's out of the mud, and bring it here the same day." },
      },
      choices = {
        { text = "Oilcloth, and the same day. Understood.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xwr_default", text = "I did, and so did every orc my age. I carried the healers' satchels and kept the salves from spilling while warlocks shouted over my head. It taught me to label everything, and to stand well back from anyone who glows." },
      },
      choices = {
        { text = "Careful hands were worth as much as axes.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rartar, and these are my supplies: vials, flasks, a few reagents that keep in the damp. If you're an alchemist, you'll know what you need, and if you're not, you'll want to ask Rogvar the alchemist first." },
        { id = "h_alch", when = { profession = "Alchemy" },
          text = "An alchemist, and a working one by the look of you, so you'll know that the swamp air ruins anything that isn't stoppered. I keep the stoppers tight, so what do you need?" },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock, and I can see you eyeing the dark bottles, but those are for Rogvar's work and not for whatever you're summoning. The ordinary vials are on the left." },
      },
      again = {
        { id = "h_again", text = "Anything else? Carefully, now." },
        { id = "h_again2", text = "Ask away, but keep your elbows in." },
        { id = "h_again3", text = "Yes? Mind the lower shelf while you ask." },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Why does the order of the shelf matter so much?", next = "order" },
        { text = "What's Rogvar like to work beside?", next = "rogvar" },
        { text = "What does the swamp do to reagents?", next = "damp" },
        { text = "Do you stock anything rare for an alchemist?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "Who else works out of this hall?", next = "hall" },
        { text = "Something useful must grow in all this mud.", next = "herbs" },
        { text = "I gather my own herbs. What grows near Stonard?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "You said you slept beside worse in the war.", next = "xwar", when = { race = "Orc" } },
        { text = "I'll keep my elbows to myself.", next = "END" },
      },
    },

    order = {
      lines = { { id = "or_default", text = "Because a grunt once knocked a jar of firebloom into a crate of swamp moss, and the smoke closed the hall for a day. Since then, everything that burns sits far from everything that's damp, and everything that's both sits under my bed." } },
      choices = {
        { text = "Under your bed?", next = "order_bed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    order_bed = {
      lines = { { id = "orb_default", text = "Where I can keep an eye on it, yes, and before you laugh, I've slept beside worse things in the war. A bottle that might catch fire is a quiet neighbour next to some of the orcs I shared a tent with." } },
      choices = { { text = "That's fair. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    rogvar = {
      big = true,
      lines = { { id = "ro_default", text = "Rogvar is the finest alchemist in Stonard and the messiest, and he'll tell you the mess is where the discoveries live. I sweep up after him and say nothing, mostly, though I do keep a count of the scorch marks." } },
      choices = {
        { text = "Discoveries need a little chaos. Let him work.", next = "BACK", reply = "Let him, I do, and I sweep. But somebody has to count what he's broken before it breaks someone.", fx = { align = { order = -1 } } },
        { text = "Careful work saves lives. You're right to keep count.", next = "BACK", reply = "Someone agrees with me at last! Don't tell Rogvar, or he'll sulk in the fumes for a week.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    damp = {
      lines = { { id = "da_default", text = "It gets into everything, so powders cake, oils turn and dried herbs go black in a week if they're left open. I wax the corks and keep the crates up off the floor, and still I lose a tenth of what comes in." } },
      choices = {
        { text = "Can anything be done about it?", next = "damp_fix" },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp_fix = {
      lines = { { id = "daf_default", text = "Buy what you need and use it quickly, which is good advice for an alchemist anywhere and the only advice that works in this swamp. Whatever you carry out into those reeds, carry it stoppered." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },

    xalch = {
      lines = { { id = "xa_default", text = "Rare is a big word for a shelf in a swamp, but I keep the good vials when the caravans bring them, and Rogvar teaches the hard recipes to those who've earned them. If you're past what I sell, he's the one to see." } },
      choices = { { text = "I'll talk to Rogvar. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I mixed salves for the healers in the camps, and when they let us out I kept mixing. Rogvar does the clever work now, and I make sure he has something to do it with." } },
    _none = { { id = "tp_none", text = "That's not on my shelf. Try Rogvar, or try the hall." } },
  },
}

---------------------------------------------------------------------------
-- Banalash, trade supplies
---------------------------------------------------------------------------
P:NPC {
  key = "banalash", id = TODO_NPC("Banalash"), name = "Banalash", title = "Trade Supplies",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "shrewd" }, values = { "practical", "ambitious" },
  notices = { "craft", "purse" },

  impression = {
    first = "Banalash sells thread, dye, flux and everything else the craftsmen of Stonard need, and he keeps a running tally of who owes him what. He trades with the Booty Bay goblins and has picked up a little of their habit of pricing everything aloud.",
    third = "{name} met Banalash, the trade supplier at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Thread, flux, dye, salt and needles, and all of it came a long way to get here, so the prices know it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You'll be wanting more of the same, I suppose, and I've got it, at the same price as last time, near enough." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing" } },
      text = "A crafter, and your hands say you've been working, so you'll be wanting supplies and not small talk." },
    { id = "n_rich", cat = "purse", when = { money = { min = 200000 } },
      text = "That's a heavy purse for a swamp road, friend, so keep it closer, and spend some of it here where it's safe." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Banalash, trade supplies. Anything a crafter needs I can sell you, and anything I can't sell you, I can tell you who's got it and what they'll charge." },
        { id = "h_tailor", when = { profession = { "Tailoring", "Leatherworking" } },
          text = "A tailor or a tanner, and you'll want thread that doesn't rot in the damp, which I've got, and dye that doesn't run, which I've mostly got." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll, and you'll be wanting needles for fishing line as much as for cloth, I expect. I keep both, and I charge the same for both, which is a bargain if you're a troll and a robbery if you're a tailor." },
      },
      again = {
        { id = "h_again", text = "Something else? Every question's free, but the thread isn't." },
        { id = "h_again2", text = "Go on, I'm listening, and I'm counting." },
      },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "Where do your goods come from?", next = "goods" },
        { text = "Who owes you the most in Stonard?", next = "ledger" },
        { text = "Why are your prices so high?", next = "prices" },
        { text = "Does your thread really hold up in the damp?", next = "xtailor", when = { profession = { "Tailoring", "Leatherworking" } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    goods = {
      lines = { { id = "go_default", text = "Booty Bay, mostly, by way of the caravans to Grom'gol, and a little from Kargath when the riders bring it. The goblins sell to everyone and charge the Horde the same as the Alliance, which I've always thought was the most honest thing about them." } },
      choices = {
        { text = "You like dealing with goblins?", next = "goods_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods_goblins = {
      lines = { { id = "gog_default", text = "I like that I always know where I stand with a goblin, which is a step behind him and two coins short. Once you know that, you can plan around it, and I plan very carefully." } },
      choices = { { text = "Smart. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    ledger = {
      lines = { { id = "le_default", text = "I don't name names, but I'll say that a certain cook buys more salt than any orc could eat and pays for it in stew. And a certain smith pays on time to the day, so he gets the good flux." } },
      choices = {
        { text = "This cook pays you in stew?", next = "ledger_stew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_stew = {
      lines = { { id = "les_default", text = "Aye, and it's good stew, though you didn't hear it from me. My ledger says he owes me forty bowls, and I'm eating my way through the debt." } },
      choices = { { text = "Sounds like a good bargain. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    prices = {
      big = true,
      lines = { { id = "pr_default", text = "Because the thread came across the sea, down the coast, through the jungle and up the swamp road, and every one of those legs had a toll on it. I could sell cheaper, I suppose, if I didn't want to eat." } },
      choices = {
        { text = "A merchant has a right to his margin. Charge what you must.", next = "BACK", reply = "Thank you. You'd be amazed how many grunts think thread grows on trees in the swamp.", fx = { align = { honor = -1 } } },
        { text = "The Horde's soldiers shouldn't pay a merchant's margin.", next = "BACK", reply = "They shouldn't, and I'd lower it if the tolls came down. Take it up with the trolls on the coast, not me.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xtailor = {
      lines = { { id = "xt_default", text = "It holds up better than anything else you'll find south of Kargath, because I buy the waxed spools that sailors use for their sails. It costs more, and it's worth it, and I'll say that to anyone who asks." } },
      choices = { { text = "I'll take your word. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I ran supplies for a war band once, and found I liked counting the crates better than carrying them. So now I count them here." } },
    _none = { { id = "tp_none", text = "I don't deal in that. If it comes on a caravan, though, I'll let you know the price." } },
  },
}

---------------------------------------------------------------------------
-- Gharash, blacksmithing supplies
---------------------------------------------------------------------------
P:NPC {
  key = "gharash", id = TODO_NPC("Gharash"), name = "Gharash", title = "Blacksmithing Supplies",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "steady" }, values = { "craft", "practical" },
  notices = { "craft" },

  impression = {
    first = "Gharash keeps the forge supplies at Stonard: flux, coal, stones and hammers. He's a quiet smith who says the swamp is the worst place on Azeroth to work iron, and then goes back to working it.",
    third = "{name} met Gharash, who sells blacksmithing supplies at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Flux, coal, whetstones and hammers, so if you need to work iron, you've come to the right orc." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my forge, good, because the coal's dry today and I want to sell it before the rain gets to it." },
  },

  notice = {
    { id = "n_rust", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's gone orange at the rivets, which is the swamp's doing. See to it today, because tomorrow it'll be worse." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc who looks after his own steel, I hope. Half the grunts here wait until the axe head falls off." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "That's a miner's pick on your pack, and it's seen use. If you've ore to sell, I'm listening." },
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "A smith, by your forearms, and a good one, I'd guess, since you've still got all your fingers." },
  },

  start = "hello",
  nodes = {
    stonard = {
      lines = {
        { id = "sn_default", text = "It does, for an outpost. Hartash makes the weapons and Grimnal sells the mail and plate, and both of them need coal, flux and whetstones every day. Thralosh has the cloth and leather, so he needs nothing from me and says so often." },
      },
      choices = {
        { text = "Who decides what the forge makes first?", next = "stonard_ruag" },
        { text = "A town this size, and three armourers.", next = "stonard_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stonard_ruag = {
      lines = {
        { id = "sr_default", text = "Dispatch Commander Ruag does, and it's always the same order: the grunts on the wall first, the scouts second, and everyone else when there's iron left. I don't argue, because he's the one who counts the dead." },
      },
      choices = {
        { text = "The wall first is the right order.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stonard_why = {
      lines = {
        { id = "sy_default", text = "Because this was the Horde's first stronghold on this world, and it has never once been safe. There are Lost Ones in the marsh, murlocs on the coast, and the humans' keep watching us from the Blasted Lands, so we stay armed." },
      },
      choices = {
        { text = "Then your coal matters more than most.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caravans = {
      lines = {
        { id = "cv_default", text = "Goblins out of Booty Bay, with mules up to their bellies in mud by the time they reach the gate. They charge for the mud too. Banalash deals with them for the trade goods, and I stand behind him and look at the ore before he pays." },
      },
      choices = {
        { text = "Do they ever try to cheat you?", next = "caravans_cheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caravans_cheat = {
      lines = {
        { id = "cc_default", text = "Once. There was slag at the bottom of every sack, under a hand's depth of good iron. I emptied the sacks at their feet, and they have brought clean ore ever since, and smiled while they did it." },
      },
      choices = {
        { text = "A goblin respects a buyer who checks the sack.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmine = {
      lines = {
        { id = "xm_default", text = "There's iron in the southern hills and mithril deeper in, but the Dreadmaul ogres sit on it. Go if you must, and go quietly, and if you come back with more than you need, I'll pay better than any goblin." },
      },
      choices = {
        { text = "I'll bring you the first sack.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xw_default", text = "Oil, every night, and a dry rag before the oil. Hang your mail by the fire and never leave it in a pack. It's dull work, but a link that rusts through is the one the spear finds." },
      },
      choices = {
        { text = "Then sell me oil and a whetstone.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gharash, and I keep the forge supplies for the town. If you're a smith, you'll find what you need here, and if you're not, I'll sell you a whetstone and you can pretend." },
        { id = "h_smith", when = { profession = "Blacksmithing" },
          text = "A smith, good, because I like talking to someone who knows what flux is for. What do you need, and how much of it?" },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf at an orc's forge, in Stonard? I won't ask how you got through the gate, but I'll admit your people know iron, and I'll sell to you if you're quick." },
      },
      again = {
        { id = "h_again", text = "Something else? The coal's waiting." },
        { id = "h_again2", text = "Ask, then. I'll keep the fire going." },
        { id = "h_again3", text = "Go on. Talk over the bellows if you must." },
      },
      choices = {
        { text = "Let me see the supplies.", next = "BUSINESS" },
        { text = "Why is the swamp a bad place to work iron?", next = "swamp" },
        { text = "Where does your ore come from?", next = "ore" },
        { text = "Do you work with Hartash, the weaponsmith?", next = "hartash" },
        { text = "What's the secret to working iron in the damp?", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "Stonard keeps a good many smiths busy.", next = "stonard" },
        { text = "You buy your ore from goblins, you said.", next = "caravans" },
        { text = "I mine my own ore. Is there iron worth the risk?", next = "xmine", when = { profession = "Mining" } },
        { text = "My armour takes a beating. What keeps rust off?", next = "xwar", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } } },
        { text = "I'll be going.", next = "END" },
      },
    },

    swamp = {
      lines = { { id = "sw_default", text = "Because the coal's always damp, so it smokes instead of burning, and the iron rusts between the forge and the quench. I spend my mornings keeping things dry and my evenings fixing what got wet anyway." } },
      choices = {
        { text = "Why not move the forge somewhere drier?", next = "swamp_move" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_move = {
      lines = { { id = "swm_default", text = "Because Stonard's here, and Stonard needs a forge, and there's no drier ground for a day in any direction except the Blasted Lands. I'd sooner have the damp than the demons." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },

    ore = {
      big = true,
      lines = { { id = "or_default", text = "From the caravans, mostly, though there's iron in the hills to the south, under Dreadmaul ground. The Commander won't send miners there, and I don't blame him, though it galls me to buy ore from goblins when there's ore a day's walk away." } },
      choices = {
        { text = "Send the miners in with guards. Take what's yours.", next = "BACK", reply = "With guards, aye, and that's what I keep telling the Commander. He keeps saying no, and I keep running short.", fx = { align = { order = -1 } } },
        { text = "The Commander's right to keep them safe.", next = "BACK", reply = "Safe and poor, aye, and that's Stonard. I'll keep working with what the caravans bring.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hartash = {
      lines = { { id = "ha_default", text = "When the caravans bring good ore, aye, and we make blades between us that are better than either of us makes alone. He'll tell you he does the real work, and I let him, because he's got the louder voice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xsmith = {
      lines = { { id = "xs_default", text = "Keep your coal under oiled hide and your flux in a sealed jar, and quench in oil instead of water when you can afford it. The swamp wants everything you make, so give it nothing it can reach." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I worked a forge for a war band, and when the war band settled, so did I. The forge is all I've ever really wanted." } },
    _none = { { id = "tp_none", text = "I know iron. Ask Thultash the cook about the rest, because he'll talk for hours." } },
  },
}
