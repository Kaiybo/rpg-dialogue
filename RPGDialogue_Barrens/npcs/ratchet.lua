-- Ratchet: the Steamwheedle port on the Barrens coast, neutral ground. Voice: bibles/crossroads.md
-- Goblins first, factions second: everyone pays, nobody fights on the docks.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gazlowe", id = TODO_NPC("Gazlowe"), name = "Gazlowe",
  bible = "bibles/crossroads.md", role = "noble", tier = "quest",
  temper = { "brash" }, values = { "ambitious", "practical" },
  notices = { "race" },
  impression = {
    first = "Gazlowe runs Ratchet for the Steamwheedle Cartel, and he will tell anyone who stands still that he built Orgrimmar for Thrall. He is loud and greedy and sharper than he lets on, and the Southsea pirates on his coast cost him money every day.",
    third = "{name} met Gazlowe, the goblin boss of Ratchet who once helped build Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, hey, a new face in my town! You buying, selling, or just admiring the view?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, repeat customers are the backbone of this whole operation." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } },
      text = "Alliance, huh? Don't sweat it, pal, because in Ratchet your gold's the same color as everybody else's." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "He talked to 'em plenty, sure, but the walls went up because my crews worked double shifts, and he paid us, which I respect. He said the earth there was willing, whatever that means, and I'll take willing earth over a lazy goblin any day." } },
      choices = {
        { text = "A spirit's blessing holds a city up better than mortar.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Walls are walls, and coin and labor built them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Now you're talking my language, pal! Somebody on my own docks is tipping off the Southsea about which boats carry what, and I'd love to know who, though the bruisers won't lay a hand on anybody without proof, so bring me something better than a hunch." },
      },
      choices = {
        { text = "Leave it to me. Nobody will even know I was looking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll catch them openly, in front of your bruisers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What's the trouble with the pirates, anyway?", next = "pirates" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Expensive is the best word in the language, pal, and I respect a professional. The last mage who worked my docks froze a Southsea boarding party solid and then froze half my pier along with 'em, so if you want work around here, you aim better than he did." },
      },
      choices = {
        { text = "I'll be careful with your pier. Precision is the job.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little damage to the pier is part of the price.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who else should I know around Ratchet?", next = "town" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The bruisers care about one thing, which is whether you start trouble on my docks. Your demon's welcome to stand around looking scary for all I care, but if it sets fire to so much as one crate, you're paying for the crate, the fire and the bruiser who puts it out." },
      },
      choices = {
        { text = "Fair rules. My demon won't touch a crate.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If your docks burn, they burn. I'm not paying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How does a goblin town stay neutral?", next = "neutral" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Name's Gazlowe, and Ratchet's my town, so whatever you need, it goes through me eventually. Keep your blades sheathed on the docks and we'll get along just fine." },
        { id = "h_pirates", when = { questActive = TODO_QUEST("Southsea Freebooters") },
          text = "Those Southsea freebooters are camped right down the coast, bleeding my shipping dry. Thin 'em out for me, and Ratchet breathes easier." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The big guy, Thrall, is one of you, and I'll tell you what I told him, which is that lightning's great but a good crane is better for building a city." },
      },
      choices = {
        { text = "Did Thrall use the spirits to build Orgrimmar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You built Orgrimmar?", next = "orgrimmar" },
        { text = "What's the trouble with the pirates?", next = "pirates" },
        { text = "Who else should I know in Ratchet?", next = "town" },
        { text = "How does a goblin town stay neutral?", next = "neutral", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } } },
        { text = "Your docks leak cargo. I could find out who's helping it along.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Need a mage for anything? I'm told I'm expensive.", next = "xmage", when = { class = "MAGE" } },
        { text = "A warlock walks into Ratchet. Do the bruisers care?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "I'll see you around, Gazlowe.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, but I'll spot you a little." },
        { id = "h_again2", text = "Still here? Good, ask away, the first questions are free." },
      },
    },
    orgrimmar = {
      lines = { { id = "o_default", text = "Me and my crew, sure, back when Thrall first landed with a bunch of orcs and no idea how to raise a wall that didn't fall over. We built him a city, and he paid us, and then he let us keep this little harbor besides." } },
      choices = { { text = "And you've been here since?", next = "orgrimmar_since" } },
    },
    orgrimmar_since = {
      lines = { { id = "os_default", text = "Ratchet was nothing but sand and a broken pier when I got here. Now look at it: a bank, a boat to Booty Bay, and every caravan from the Crossroads to the coast pays a toll somewhere along the way." } },
      choices = { { text = "Do you miss building?", next = "orgrimmar_miss" } },
    },
    orgrimmar_miss = {
      lines = { { id = "om_default", text = "Building's fine, but owning is better, pal, and I learned that the hard way. Still, I'd take another big job if the Warchief came asking and the price was right." } },
      choices = {
        { text = "A deal's a deal. Thrall was right to pay you fairly.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You should have squeezed him for twice as much.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "The Southsea Freebooters think anything floating off my coast belongs to them. They've cost me cargo, crews and two very nice boats, and I'm running out of patience and polite words." } },
      choices = { { text = "I'll handle them.", next = "BACK", fx = { affinity = 2 } } },
    },
    town = {
      lines = { { id = "t_default", text = "Wharfmaster Dizzywig keeps the docks, Mebok Mizzyrix is always cooking up some deal, and Sputtervalve, well, he lost a very important gizmo and won't shut up about it." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    neutral = {
      lines = { { id = "n_default", text = "Easy: the bruisers on the docks hit anybody who starts trouble, Horde or Alliance, and nobody wants to lose the only decent harbor on this coast. Business keeps the peace better than any treaty." } },
      choices = {
        { text = "Peace bought with gold is still peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace that's for sale can be bought out from under you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, and if I haven't heard of it, it isn't making anybody any money." } },
  },
}

P:NPC {
  key = "sputtervalve", id = TODO_NPC("Sputtervalve"), name = "Sputtervalve",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  temper = { "anxious" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Sputtervalve is a goblin tinker in Ratchet who cannot stop talking about the Samophlange, a contraption he lost out in the Barrens. He means well and frets constantly, and his sentences rarely end where they started.",
    third = "{name} met Sputtervalve, a fretful goblin tinker in Ratchet.",
  },
  greetings = {
    { id = "g_hi", text = "Oh! A customer, or a helper, or maybe both, which would be best of all, really." },
  },
  notice = {
    { id = "n_eng", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A spellcaster, huh? You folks never appreciate a good gear, but I won't hold that against you." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Anger them? I hope not, but now that you mention it, the Samophlange did spark something terrible right before I lost it. That was probably just the coil, though, wasn't it? Please say it was the coil." } },
      choices = {
        { text = "Respect the elements, and your machines will fare better.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It was the coil. Gears need no spirit's permission.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would I! The Venture Company boys out at the Sludge Fen have it, I'm almost certain, and they'll have it locked up tighter than a gnome's toolbox, so if you can slip in without blowing anything up, which is more than I've ever managed, you'll be the best friend a tinker ever had." },
      },
      choices = {
        { text = "I'll take it back quietly. They stole it first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll take it fair and square, even if it means a fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What exactly is a Samophlange, anyway?", next = "samo" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sputtervalve, inventor and tinker, at your service, mostly. You wouldn't happen to have seen a Samophlange lying around out in the Barrens, would you?" },
        { id = "h_samo", when = { questActive = TODO_QUEST("Samophlange") },
          text = "The Samophlange is still out there, and every day it sits in the dust I lose another year off my life. Please hurry, and please don't drop it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, you don't happen to know a spirit who finds lost things, do you, because the Samophlange is still out there and I've asked everyone else already." },
      },
      choices = {
        { text = "Do your machines ever anger the elements, Sputtervalve?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What is a Samophlange?", next = "samo" },
        { text = "How did you lose it?", next = "lost" },
        { text = "Is Ratchet good for a tinker?", next = "ratchet" },
        { text = "Magic does what gears can't, little tinker.", next = "magic", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I get into places quietly. Shall I fetch your Samophlange?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Good luck with it.", next = "END" },
      },
      again = { { id = "h_again", text = "More questions? I love questions, almost as much as I love gears, almost." } },
    },
    samo = {
      lines = { { id = "s_default", text = "It's a pressure-regulating, flow-correcting, all-purpose mechanical marvel, and it's the heart of a very big project. I can't tell you what the project is, because it isn't finished and I'm superstitious." } },
      choices = { { text = "Can you give me a hint?", next = "samo_hint" } },
    },
    samo_hint = {
      lines = { { id = "sh_default", text = "Let's just say there's oil under the Barrens, and the Venture Company isn't the only outfit that knows it. A goblin with the right machine could make a fortune, and keep it out of the wrong hands besides." } },
      choices = { { text = "Out of the Venture Company's hands?", next = "samo_venture" } },
    },
    samo_venture = {
      lines = { { id = "sv_default", text = "Those thugs would drill the whole plain dry and leave the tauren nothing but holes. I'm greedy, sure, but I'm a Steamwheedle goblin, and we like our customers alive." } },
      choices = {
        { text = "Better you than the Venture Company, then.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The land isn't anyone's to drill, goblin.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I was testing it in the field, and then there were centaur, and then there was running, and then there wasn't a Samophlange anymore. It's not the most dignified story." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK" } },
    },
    ratchet = {
      lines = { { id = "r_default", text = "Good enough! Gazlowe keeps the peace and the boats bring parts from Booty Bay, though they charge me a fortune for every bolt." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magic = {
      lines = { { id = "m_default", text = "Sure, until it doesn't, and then you've got nothing but a headache and a puff of smoke. A gear you can fix, but try fixing a fireball after it's gone off." } },
      choices = { { text = "Fair point.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of that, but if it's got moving parts, bring it by and I'll take a look." } },
  },
}

P:NPC {
  key = "mebok", id = TODO_NPC("Mebok Mizzyrix"), name = "Mebok Mizzyrix",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  temper = { "smooth" }, values = { "ambitious" },
  notices = { "race" },
  impression = {
    first = "Mebok Mizzyrix sells concoctions out of Ratchet and wants raptor horns and other odd ingredients for them. He is a pure salesman, all promises and grins, and he never says exactly what the drinks are for.",
    third = "{name} met Mebok Mizzyrix, a goblin peddler of tonics in Ratchet.",
  },
  greetings = {
    { id = "g_hi", text = "Step right up, friend, because Mebok Mizzyrix has exactly what you need, even if you don't know it yet." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Anger them? Friend, I give those raptors a second life in a bottle, which is more than the Barrens ever gave them. The tauren don't see it that way, of course, but the tauren don't pay my rent either." } },
      choices = {
        { text = "A beast killed for its horn deserves better than a sales pitch.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead raptors need no apology. Business is business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Oh, it would, and I've had three customers ask this week alone, but I'm a purveyor of fine refreshment, not poisons! Of course, a strong enough sleeping draught does help a fellow sleep very soundly, and who's to say which guard ends up drinking it." },
      },
      choices = {
        { text = "Sleeping guards make for easy work. Count me in.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "No. I'd rather keep my business honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Do your tonics actually work, Mebok?", next = "work" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Shh, not so loud, pal! Nobody said magic, I said refreshment, and if a customer feels a little brighter after a swig, who am I to argue with a satisfied customer?" },
      },
      choices = {
        { text = "Fair enough. A good sale is a good sale.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Your customers deserve to know what they're drinking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What do you use the raptor horns for?", next = "horns" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mebok Mizzyrix, purveyor of fine tonics and quality refreshment. I'm always looking for a few special ingredients, and the Barrens is full of them, if you've got the stomach to collect." },
        { id = "h_horns", when = { questActive = TODO_QUEST("Raptor Horns") },
          text = "Raptor horns, friend, the bigger the better! The thunderheads and stormsnouts out west have the good ones." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now there's a customer who appreciates a tonic with a little lightning in it, and I happen to have exactly that, if you take my meaning." },
      },
      choices = {
        { text = "Do your tonics anger the spirits of the beasts you use?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you use raptor horns for?", next = "horns" },
        { text = "Do your tonics actually work?", next = "work" },
        { text = "What's Ratchet like for business?", next = "biz" },
        { text = "Tauren medicine doesn't need goblin salesmanship.", next = "tauren", when = { race = "Tauren" } },
        { text = "A tonic that puts a guard to sleep would sell well, Mebok.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your tonics aren't magic, Mebok. I'd know.", next = "xmage", when = { class = "MAGE" } },
        { text = "Maybe later.", next = "END" },
      },
      again = { { id = "h_again", text = "Another question, friend? Mebok's always happy to talk, especially about Mebok." } },
    },
    horns = {
      lines = { { id = "h1_default", text = "Ground fine, they put a little kick in a drink that the customers just love. Don't ask me why it works, because I'm a businessman, not an alchemist." } },
      choices = { { text = "And who buys them?", next = "horns_who" } },
    },
    horns_who = {
      lines = { { id = "h2_default", text = "Sailors, mostly, and caravan guards, and anybody who wants to feel ten feet tall after a long day. A few orcs from the Crossroads come in on the quiet, too." } },
      choices = { { text = "And it's safe?", next = "horns_safe" } },
    },
    horns_safe = {
      lines = { { id = "h3_default", text = "Safe is a strong word, friend, and I'm a careful man with strong words. Nobody's complained yet, and the ones who might have aren't in any shape to." } },
      choices = {
        { text = "People deserve to know what they're drinking.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "If they buy it, that's their lookout.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Never mind, then.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Of course they work, friend, because the customers keep coming back, and nobody comes back for a drink that doesn't do something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    biz = {
      lines = { { id = "b_default", text = "Couldn't be better, friend, what with pirates and quilboar and centaur keeping everyone thirsty and nervous. Trouble's good for trade, as long as it stays off the docks." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "No offense meant, big fella, I'd never sell against the Earth Mother. My stuff's for folks who want a quick kick, not a spiritual journey." } },
      choices = { { text = "See that you don't.", next = "BACK", fx = { affinity = -1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Can't say I know it, friend, but if it sells, Mebok will learn quick." } },
  },
}

P:NPC {
  key = "dizzywig", id = TODO_NPC("Wharfmaster Dizzywig"), name = "Wharfmaster Dizzywig",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  temper = { "harried" }, values = { "practical", "dutiful" },
  notices = { "race" },
  impression = {
    first = "Wharfmaster Dizzywig keeps Ratchet's docks running and keeps a ledger of every crate that never arrived. He is harried and exact, and a missing shipment makes him take it personally.",
    third = "{name} met Wharfmaster Dizzywig, who runs Ratchet's docks.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the crates, and mind the ropes, and mind the edge, because I'm not fishing anybody out today." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The orc crews do, and they tip a cup of grog overboard before they cast off, which comes out of my stores, so I log it. The goblin crews call it a waste, and the goblin crews lose more cargo, and I've started to wonder whether those two things are related." } },
      choices = {
        { text = "Then log the offering as a proper cost of business.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No ledger will ever strike a bargain with the sea.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "No, they don't, and I've got a whole page in my ledger for crates that walked off with somebody's help. Half go to the Southsea, but the other half go missing right here between the ship and my scales, and that tells me somebody in Ratchet knows how to lift a lid quietly." },
      },
      choices = {
        { text = "Then I'll help you catch them, wharfmaster.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Somebody's good at their job. I respect that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where do the shipments usually go missing?", next = "missing" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Have you seen what a mage does to a crate of eggs when he teleports it? The boat to Booty Bay works fine and the sea never sends me a bill, so I'll keep my cargo on the water where I can count it." },
      },
      choices = {
        { text = "Fair enough. The old ways work well enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is the future. Your boats are behind the times.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do your boats sail?", next = "boats" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wharfmaster Dizzywig, and every crate that comes through Ratchet goes through my ledger first. Lately too many of them have been going missing before they ever reach it." },
        { id = "h_ship", when = { questActive = TODO_QUEST("The Missing Shipment") },
          text = "That shipment should have come in days ago, and the only thing the sea brought back was rumors. Find out what happened to it, would you?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good. If you can talk to the sea, ask it where my shipments went, because it's taken nine crates since the spring and it hasn't filed a single report." },
      },
      choices = {
        { text = "Do your sailors ask the sea spirits for safe passage?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where do the shipments go missing?", next = "missing" },
        { text = "Where do your boats sail?", next = "boats" },
        { text = "How long have you kept the docks?", next = "dock" },
        { text = "Do you check Alliance cargo as hard as Horde?", next = "fair", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } } },
        { text = "Your missing crates don't vanish on their own, wharfmaster.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Couldn't a mage just teleport your cargo for you?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll let you work.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Make it quick, because the tide doesn't wait and neither do my crews." } },
    },
    missing = {
      lines = { { id = "m_default", text = "Somewhere along the coast between here and the southern isles, and I'd bet my ledger the Southsea pirates have something to do with it. They know our schedules better than some of my own dockhands." } },
      choices = { { text = "Someone on the docks is talking?", next = "missing_spy" } },
    },
    missing_spy = {
      lines = { { id = "ms_default", text = "I didn't say that, and I'd rather you didn't say it either, not loud. But somebody's selling our sailing times, and when I find out who, Gazlowe will want a word." } },
      choices = { { text = "What will Gazlowe do?", next = "missing_gaz" } },
    },
    missing_gaz = {
      lines = { { id = "mg_default", text = "Docked wages, a swim with the sharks, or a job in the Venture Company's mines, depending on his mood. Gazlowe doesn't forgive people who cost him money." } },
      choices = {
        { text = "A thief on the docks gets what he deserves.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sharks seem a bit much for loose lips.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    boats = {
      lines = { { id = "b_default", text = "The big run is to Booty Bay, across the sea to Stranglethorn, and it's the only boat in Kalimdor that takes Horde and Alliance alike. Everything else is coastal hauling and fishing." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    dock = {
      lines = { { id = "d_default", text = "Since Gazlowe drove the first pile into the mud, and I've hauled more cargo than you've seen in your life. I've never lost a crate I could blame on myself, either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fair = {
      lines = { { id = "f_default", text = "Harder, if you want the truth, because your lot sneak more contraband. But I take your coin the same, and that's as fair as Ratchet gets." } },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it isn't in my ledger, it doesn't exist as far as I'm concerned." } },
  },
}
