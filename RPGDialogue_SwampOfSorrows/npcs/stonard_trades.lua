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
      text = "A hunter, and your beast looks well kept, which is more than I can say for most who come through that gate." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
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
      lines = { { id = "wid_default", text = "Green ones, around the temple in the Pool of Sorrow, and they don't sleep the way they ought to. Fel'zerul says the trolls in the temple are behind something, so if you want the rest of that story, ask him and not me." } },
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
        { text = "A beast that trusts you deserves to be kept from harm.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Weapons get used.", next = "BACK", fx = { align = { light = -1 } } },
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
-- Thultash, food and drink
---------------------------------------------------------------------------
P:NPC {
  key = "thultash", id = TODO_NPC("Thultash"), name = "Thultash", title = "Food & Drink Vendor",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "jovial" }, values = { "generous", "practical" },
  notices = { "race", "purse" },

  impression = {
    first = "Thultash sells food and drink in Stonard and is the only orc in town who seems to enjoy the swamp. He'll tell you what's in the stew before you ask, and sometimes after you wish he hadn't.",
    third = "{name} met Thultash, who sells food and drink in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Everyone who walks in from that swamp is hungry, so sit down before you fall down." },
    { id = "g_back", when = { metBefore = true }, text = "You lived! I had a bet with Hekkru that you wouldn't, so you've cost me a mug of grog." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! You'll eat the things I cook without making a face, which already makes you my favourite customer this week." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "That purse is lighter than my bread, friend, so I'd stick to the cheap end of the board today." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Thultash, and I keep Stonard fed, which is harder than keeping it guarded, because the guards don't complain when the bread's damp. What can I get you?" },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "One of the Forsaken, and you're looking at my food as though you remember it. I'll sell to you all the same, though I've never known whether your kind eats for the taste or for the habit." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc who's walked the swamp road, and you look like you'd eat the boots off a grunt, so let's get some meat in you before you try." },
        { id = "h_tokkar", when = { questActive = TODO_QUEST("Lack of Surplus") },
          text = "If that's Tok'Kar's meat you're carrying, get it to him quick, because I've been promised a share and I'm already planning the stew." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've always got time while the pot's on." },
        { id = "h_again2", text = "Go on, I like the company. Most grunts just grunt." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What's in the stew?", next = "stew" },
        { text = "Where does Stonard get its food?", next = "supply" },
        { text = "You seem happy here. Why?", next = "happy" },
        { text = "Do you have anything a Forsaken would actually taste?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll come back hungrier.", next = "END" },
      },
    },

    stew = {
      lines = { { id = "st_default", text = "Today it's crocolisk tail, swamp onion and a bit of boar that came in from Kargath with the last rider, and I'll swear on my mother's axe it's all fresh. Yesterday it was the same, but less of the boar." } },
      choices = {
        { text = "Crocolisk? What does it taste like?", next = "stew_croc" },
        { text = "I'll trust you on the freshness.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stew_croc = {
      lines = { { id = "stc_default", text = "Like a fish that's been working hard all its life, chewy and honest and a little bit angry. The trick is to simmer it till it gives up, which takes most of a day." } },
      choices = { { text = "I'll have a bowl. Something else first.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    supply = {
      lines = { { id = "su_default", text = "Some we hunt and some we grow, though nothing grows well here except moss, and the rest comes on the caravans from Grom'gol twice a year. When the caravans are late, we eat crocolisk, and when we run out of crocolisk, we send Tok'Kar's hunters out for more." } },
      choices = {
        { text = "Do the caravans ever not arrive?", next = "supply_late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_late = {
      big = true,
      lines = { { id = "sul_default", text = "Once, the winter I came here, and we lived on fish and moss for a month and the grunts nearly hung me from the gate. Now I salt away a share of every catch, and the Commander says I'm a hoarder, and I say I'm the reason he still has a garrison." } },
      choices = {
        { text = "Every outpost needs someone who plans ahead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Share it now. Worry about tomorrow tomorrow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    happy = {
      lines = { { id = "ha_default", text = "Because nobody's shooting at me, my roof only leaks a little, and the grunts tell me their troubles while they eat. A cook in a hard place hears everything, and I like hearing things." } },
      choices = {
        { text = "What have you heard lately?", next = "happy_heard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happy_heard = {
      lines = { { id = "hah_default", text = "That the cartographers have drawn the swamp four different ways and the Commander has pinned all four to his wall. And that something big walks through the Misty Reed Strand at night, though the grunt who told me that had drunk most of a cask." } },
      choices = { { text = "I'll keep my eyes open. Something else.", next = "BACK" } },
    },

    xforsaken = {
      lines = { { id = "xf_default", text = "Salt, maybe, because they tell me salt still gets through when nothing else does, so I'd try the dried crocolisk. If it doesn't taste of anything, at least it'll be the strongest nothing you've ever chewed." } },
      choices = { { text = "I'll try it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I stirred gruel in the internment camps for orcs too sick to lift a spoon, and when Thrall broke the camps open I followed the ones who could walk. Feeding them free has been the best work of my life." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, but sit down, eat something, and ask again when you're less hungry." } },
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
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, by the stains on your fingers, and you'll be wanting my vials, so ask before you reach for anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rartar, and these are my supplies: vials, flasks, a few reagents that keep in the damp. If you're an alchemist, you'll know what you need, and if you're not, you'll want to ask Rogvar first." },
        { id = "h_alch", when = { profession = "Alchemy" },
          text = "An alchemist, and a working one by the look of you, so you'll know that the swamp air ruins anything that isn't stoppered. I keep the stoppers tight, so what do you need?" },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock, and I can see you eyeing the dark bottles, but those are for Rogvar's work and not for whatever you're summoning. The ordinary vials are on the left." },
      },
      again = {
        { id = "h_again", text = "Anything else? Carefully, now." },
        { id = "h_again2", text = "Ask away, but keep your elbows in." },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Why does the order of the shelf matter so much?", next = "order" },
        { text = "What's Rogvar like to work beside?", next = "rogvar" },
        { text = "What does the swamp do to reagents?", next = "damp" },
        { text = "Do you stock anything rare for an alchemist?", next = "xalch", when = { profession = "Alchemy" } },
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
        { text = "Discoveries need a little chaos. Let him work.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Careful work saves lives. You're right to keep count.", next = "BACK", fx = { align = { order = 1 } } },
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
      lines = { { id = "le_default", text = "I don't name names, but I'll say that a certain cook buys more salt than any orc could eat and pays for it in stew. And a certain smith pays on time to the day, which is why I sell him the good flux." } },
      choices = {
        { text = "Thultash pays in stew?", next = "ledger_stew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_stew = {
      lines = { { id = "les_default", text = "I didn't say his name, and you didn't hear it from me, but aye, and it's good stew. My ledger says he owes me forty bowls, and I'm eating my way through the debt." } },
      choices = { { text = "Sounds like a good bargain. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    prices = {
      big = true,
      lines = { { id = "pr_default", text = "Because the thread came across the sea, down the coast, through the jungle and up the swamp road, and every one of those legs had a toll on it. I could sell cheaper, I suppose, if I didn't want to eat." } },
      choices = {
        { text = "A merchant has a right to his margin. Charge what you must.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "The Horde's soldiers shouldn't pay a merchant's margin.", next = "BACK", fx = { align = { honor = 1 } } },
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
-- Thralosh, cloth and leather armor
---------------------------------------------------------------------------
P:NPC {
  key = "thralosh", id = TODO_NPC("Thralosh"), name = "Thralosh", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "dry" }, values = { "practical" },
  notices = { "kit", "class" },

  impression = {
    first = "Thralosh sells cloth and leather armor in Stonard and has strong opinions about how little of it survives the swamp. He seems to take it personally when his customers come back soaked through.",
    third = "{name} met Thralosh, who sells light armor in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Cloth and leather, and before you ask, yes, it will get wet, because everything here gets wet." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still damp at the knees, I see. Some things never change in this swamp." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's coming apart at the seams, and I can smell the mildew from here, so let's find you something sound." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Robes, in a swamp, and the hem's black to the knee. You casters never learn to tie them up before you wade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thralosh, and I sell cloth and leather to anyone who'd rather move quickly than stand still in heavy plate. In this swamp, that's most people who are still alive." },
        { id = "h_rogue", when = { class = { "ROGUE", "DRUID", "HUNTER" } },
          text = "Leather, for you, and good leather that won't creak when you're creeping up on something. I can tell you've done some creeping, by the mud on your belly." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "A caster, and you're wearing the swamp on your hem like a second robe. I've got cloth that dries faster, if you've got the coin." },
      },
      again = {
        { id = "h_again", text = "What else? The leather's not going anywhere." },
        { id = "h_again2", text = "Ask, if you like. I've nothing better to do than sell." },
      },
      choices = {
        { text = "Let me see the armor.", next = "BUSINESS" },
        { text = "What's wrong with heavy armor out here?", next = "plate" },
        { text = "How do you keep leather from rotting?", next = "leather" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "Got anything that won't creak?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Another time.", next = "END" },
      },
    },

    plate = {
      big = true,
      lines = { { id = "pl_default", text = "Nothing, until you step in the wrong pool and sink to your neck, and then it's the last thing that's wrong with anything. Grimnal will sell you plate and swear by it, but I've seen two grunts go down in the Pool of Tears and only one came up." } },
      choices = {
        { text = "Stand and fight in plate. A soldier shouldn't fear water.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Move light and fast. Plate is for fools in a swamp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    leather = {
      lines = { { id = "le_default", text = "Oil, and plenty of it, worked in with the heel of the hand every few days, and never leave it in a heap. Most of the leather that comes back to me ruined was put away wet by someone too tired to care." } },
      choices = {
        { text = "What oil do you use?", next = "leather_oil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_oil = {
      lines = { { id = "leo_default", text = "Crocolisk fat, rendered down slowly, which smells awful for a week and keeps the water out for a month. Thultash gives me the scraps from his kitchen, and I give him leather aprons, and nobody else in town will stand near either of us." } },
      choices = { { text = "A fair trade. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    cloth = {
      lines = { { id = "cl_default", text = "Mostly from the caravans, some woven in Orgrimmar and some bought off the goblins, and the goblin cloth is better and costs twice as much. I sell both and let the customer decide how much they care." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xrogue = {
      lines = { { id = "xr_default", text = "I've got a jerkin stitched with waxed thread and softened so well it makes less noise than the frogs. Whether you make noise is your business, but the leather won't give you away." } },
      choices = { { text = "That's all I ask. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a tanner for a clan that doesn't exist any more, and I'm a tanner now for a town that barely does. Somebody always needs leather." } },
    _none = { { id = "tp_none", text = "I sell armor, not answers. Try the hall." } },
  },
}

---------------------------------------------------------------------------
-- Grimnal, mail and plate
---------------------------------------------------------------------------
P:NPC {
  key = "grimnal", id = TODO_NPC("Grimnal"), name = "Grimnal", title = "Mail & Plate Merchant",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "proud", "gruff" }, values = { "brave", "proud" },
  notices = { "kit", "class" },

  impression = {
    first = "Grimnal sells mail and plate in Stonard and treats every piece like a promise. He and Thralosh argue about armor across the yard every day, and neither has ever won.",
    third = "{name} met Grimnal, who sells heavy armor in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Mail and plate, the only things standing between a grunt and an ogre's club, so look closely before you buy." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and still in one piece, which means the armor's doing its job, or you've been lucky." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That plate's taken a beating, and the rust's started at the joints, so get it to a smith before it seizes on you." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Plate, good, the way a warrior ought to be dressed. Don't let Thralosh talk you into leather." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grimnal, and I sell mail and plate. Thralosh will tell you it's too heavy for the swamp, and he's wrong, and I'll tell you why if you've got a moment." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior, and you know what good plate is worth, so you'll forgive me if I skip the speech. Let's see what fits you." },
        { id = "h_sham", when = { class = { "SHAMAN", "HUNTER" } },
          text = "Mail for you, then, because you need to move and you need to live. I've got mail light enough to swim in, nearly." },
      },
      again = {
        { id = "h_again", text = "What else? I've got all day and plenty of opinions." },
        { id = "h_again2", text = "Go on. The armor isn't selling itself." },
      },
      choices = {
        { text = "Let me see the armor.", next = "BUSINESS" },
        { text = "Why is Thralosh wrong about plate?", next = "argue" },
        { text = "What does the swamp do to steel?", next = "rust" },
        { text = "What's the toughest thing your plate has stopped?", next = "story" },
        { text = "Can you swim in mail?", next = "xmail", when = { class = { "SHAMAN", "HUNTER" } } },
        { text = "I'll be going.", next = "END" },
      },
    },

    argue = {
      big = true,
      lines = { { id = "ar_default", text = "Because a grunt in leather who meets an ogre on the swamp road is a dead grunt, and a grunt in plate is a bruised one, and I'd sooner be bruised. Thralosh talks about drowning, but I've buried more grunts who were cut down than drowned." } },
      choices = {
        { text = "Plate keeps soldiers alive. You're right, Grimnal.", next = "argue_won", fx = { align = { order = 1 } } },
        { text = "A grunt who can't swim isn't saved by plate.", next = "argue_won", fx = { align = { order = -1 } } },
        { text = "Why not sell both and stop arguing?", next = "argue_won" },
      },
    },
    argue_won = {
      lines = { { id = "aw_default", text = "Because then I'd have nothing to talk about at supper, and Thralosh would have to listen to Thultash's stories instead. The argument keeps us both honest, and it keeps the grunts thinking about what they wear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rust = {
      lines = { { id = "ru_default", text = "Turns it orange in a week, unless you oil it every night and dry it by a fire. Gharash sells me the oil and the flux, and I'd say a third of my day goes into keeping the stock from rotting on the racks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    story = {
      lines = { { id = "sto_default", text = "A Dreadmaul ogre's club, swung full at a grunt's chest on the road south, and the breastplate folded like a cooking pot but the grunt walked home. He brought the breastplate back to me and hung it over the door, and it's still there." } },
      choices = {
        { text = "I saw that dented plate on the way in.", next = "story_door" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_door = {
      lines = { { id = "std_default", text = "That's the one, and every grunt who buys from me touches it on the way out, for luck. I don't believe in luck, but I don't take it down either." } },
      choices = { { text = "I'll touch it on the way out.", next = "BACK", fx = { affinity = 1 } } },
    },

    xmail = {
      lines = { { id = "xm_default", text = "Nearly, if you're strong and the water's calm, and I wouldn't try it in the Pool of Tears. Keep to the shallows, keep your mail oiled, and you'll live long enough to buy the next set from me." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I wore plate in the Second War and walked out of it alive, so I sell plate now. I owe it that much." } },
    _none = { { id = "tp_none", text = "I sell armor, not news. Ask Thultash; he hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Hartash, weapons
---------------------------------------------------------------------------
P:NPC {
  key = "hartash", id = TODO_NPC("Hartash"), name = "Hartash", title = "Weapon Merchant",
  bible = "bibles/stonard_trades.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "blunt" }, values = { "brave", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "Hartash sells weapons in Stonard, from daggers to great axes, and tests the edge of each one on his thumb. His thumb has a good many scars.",
    third = "{name} met Hartash, the weapon merchant at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Weapons, all of them sharp, and if you find a dull one I'll give you a scolding, because it means you've been using it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I hope you've been using what you bought, because a clean blade is a wasted blade." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and you hold your weapon like you've used it, which is the only kind of customer I really like." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, and I've got throwing axes, if you're after them. Your kind throws better than any orc I know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hartash, and these are my blades. Axes, swords, maces, daggers and staves, and every one of them has been tested on my own thumb, so you know they're sharp." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, and you'll be wanting something short and quiet, and I've got daggers that'll do. Just don't test them on me." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, and I'd guess you want something long and heavy, because that's all your people seem to swing. I've got a war maul in the back that might suit." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep sharpening while you think." },
        { id = "h_again2", text = "Ask, then. The whetstone's not going anywhere." },
      },
      choices = {
        { text = "Show me the blades.", next = "BUSINESS" },
        { text = "Why test them on your thumb?", next = "thumb" },
        { text = "What weapon suits the swamp?", next = "swamp" },
        { text = "Where do your blades come from?", next = "forge" },
        { text = "I need something quiet.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Another time.", next = "END" },
      },
    },

    thumb = {
      lines = { { id = "th_default", text = "Because a thumb doesn't lie, and a whetstone sometimes does. If the blade bites my thumb without me pushing, it'll bite an ogre, and if it doesn't, it goes back to the grinder." } },
      choices = {
        { text = "Your thumb must be ruined.", next = "thumb_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thumb_scar = {
      lines = { { id = "ths_default", text = "It's seen better days, and so have I, but neither of us has let down a customer yet. There's a grunt in Kargath who still owes his life to the axe I tested on this thumb." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    swamp = {
      big = true,
      lines = { { id = "sw_default", text = "Something short, because a long blade gets caught in the reeds and the vines, and in the swamp the fighting's always close. The old Horde liked big axes, and I like big axes, but I've seen too many caught in a branch at the wrong moment." } },
      choices = {
        { text = "A real warrior swings the big axe and trusts it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A short knife and a quick strike. That's how you win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forge = {
      lines = { { id = "fo_default", text = "Some from Orgrimmar and some from my own hands, and a few that Gharash and I made together from ore the caravans brought in. The ones we made together are better, though I'd never tell him so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xrogue = {
      lines = { { id = "xr_default", text = "A short blade with a leather-wrapped grip, so it doesn't slip when your hands are wet, and that's what you'll want here. The blade doesn't care what you use it for, and neither do I, as long as you pay." } },
      choices = { { text = "Good. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sharpened axes for the Warsong before they went to Kalimdor, and I stayed behind when they sailed. I've been sharpening here ever since." } },
    _none = { { id = "tp_none", text = "I know blades. For anything else, try the Commander." } },
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
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "A smith, by your forearms, and a good one, I'd guess, since you've still got all your fingers." },
  },

  start = "hello",
  nodes = {
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
      },
      choices = {
        { text = "Let me see the supplies.", next = "BUSINESS" },
        { text = "Why is the swamp a bad place to work iron?", next = "swamp" },
        { text = "Where does your ore come from?", next = "ore" },
        { text = "You and Hartash work together?", next = "hartash" },
        { text = "What's the secret to working iron in the damp?", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    swamp = {
      lines = { { id = "sw_default", text = "Because the coal's always damp, so it smokes instead of burning, and the iron rusts between the forge and the quench. I spend half my day keeping things dry and the other half fixing what got wet anyway." } },
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
        { text = "Send the miners in with guards. Take what's yours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Commander's right to keep them safe.", next = "BACK", fx = { align = { order = 1 } } },
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
    _none = { { id = "tp_none", text = "I know iron. Ask Thultash about the rest, he'll talk for hours." } },
  },
}
