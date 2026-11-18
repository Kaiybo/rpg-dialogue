-- More of Feralas: Feathermoon Stronghold's enchanting trainer, fish seller, stable master and dockside reagent seller
-- (Xylinnia Starshine, Harklane, Antarius, Jadenvis Seawatcher), and Camp Mojache's food seller, reagent seller,
-- stable master and druid trainer (Loorana, Tarhus, Shyrka Wolfrunner, Jannos Lighthoof). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Xylinnia Starshine (Feathermoon, enchanting trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "xylinnia", id = TODO_NPC("Xylinnia Starshine"), name = "Xylinnia Starshine", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "feathermoon" }, temper = { "calm", "precise" }, values = { "craft", "careful" },
  notices = { "craft", "arcane" },
  impression = {
    first = "Xylinnia Starshine teaches enchanting at Feathermoon, and she speaks of it as a discipline of restraint rather than power. She weighs every word as though it might be bound into something.",
    third = "{name} met Xylinnia Starshine, the enchanting trainer of Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you have come to learn, sit, and if you have come to watch, sit quietly." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has your rod cooled since we last spoke, or are you still forcing it?" },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "Your hands carry the dust of disenchanted things. Wash them before you touch the runes, please, because the old residue clouds the new work." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You carry a great deal of arcane power, and very little of it is held still. Enchanting would teach you patience, if you let it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Xylinnia Starshine, and I teach the binding of magic into cloth, steel and leather. It is quiet work, which suits an island at the edge of the world." },
        { id = "h_ench", when = { profession = "Enchanting" },
          text = "A fellow enchanter, come all the way to Sardor Isle. Let us see how much you know, and how much you only believe you know." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You are far from your own people, and the Sentinels here will not look kindly upon you. I have nothing to teach you, so go carefully." },
      },
      again = {
        { id = "h_again", text = "Is there more? Speak; the runes can wait a little." },
        { id = "h_again2", text = "Ask what you wish. Patience is the first lesson anyway." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS", when = { profession = "Enchanting" } },
        { text = "What does enchanting ask of those who learn it?", next = "art" },
        { text = "This seems a lonely place to teach.", next = "island" },
        { text = "Magic should be wielded, not sewn into boots.", next = "wield" },
        { text = "Farewell.", next = "END" },
      },
    },
    art = {
      lines = { { id = "ar_default", text = "Restraint, above all else. Our people once drew on the Well of Eternity without restraint, and you know what that cost the world, so I teach my students to bind a little power well rather than a great deal badly." } },
      choices = {
        { text = "Where does the power come from?", next = "art_source" },
        { text = "Something else.", next = "BACK" },
      },
    },
    art_source = {
      lines = { { id = "as_default", text = "From the things you unmake. An old blade or a worn cloak gives up its magic as dust and shards, and we bind that dust into something new. Nothing is wasted, which I think Elune approves of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    island = {
      lines = { { id = "is_default", text = "Lonely, perhaps, but not empty. Sentinels pass through, and druids from the mainland, and a few travellers who swim further than is sensible. The sea keeps the ogres away, and it keeps the noise away too." } },
      choices = {
        { text = "The naga don't stay away, though.", next = "naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = { { id = "na_default", text = "No, the Hatecrest come up from the water whenever they please. Shandris has archers on the shore for that, and I have wards on my door, and between us I sleep well enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wield = {
      big = true,
      lines = { { id = "wi_default", text = "Many young mages say so, and many young mages have scorched eyebrows. A bound enchantment works every day for a hundred years and never once burns down a library." } },
      choices = {
        { text = "Then restraint is the wiser path. I see that.", next = "BACK", reply = "Good. Come back when you are ready to practise it, and bring old things to unmake.", fx = { align = { order = 1 } } },
        { text = "Power held back is power wasted.", next = "BACK", reply = "Then I hope you never learn otherwise the way my people did. The sea is very deep where the Well once stood.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have bound enchantments for longer than your kingdoms have kept records. It is enough to say I am patient." } },
    advice = { { id = "tp_ad", text = "Unmake what you no longer need. The dust is worth more than the thing." } },
    _none = { { id = "tp_none", text = "That is outside my study. Ask me of runes and dust, and I will answer." } },
  },
}

---------------------------------------------------------------------------
-- Harklane (Feathermoon, fish vendor)
---------------------------------------------------------------------------
P:NPC {
  key = "harklane", id = TODO_NPC("Harklane"), name = "Harklane", title = "Fish Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "dry", "steady" }, values = { "practical", "nature" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Harklane sells fish and drink at Feathermoon, and he knows which waters around the isle are safe to net and which belong to the naga. He spoke of the sea as a neighbour he doesn't entirely trust.",
    third = "{name} met Harklane, who sells fish at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Fresh from the morning nets, and the water is sweet. Buy now, before the gulls decide for you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The fish are different, but the price is the same." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish, I see from your hands. Try the north shore at dusk, but stay off the rocks to the south, because the naga watch them." },
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half drowned and wholly hungry. Eat something before you go back out, please; the Hatecrest prefer their prey tired." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Harklane, and I feed this stronghold from the sea around it. The fish are good here, though I share the waters with neighbours who would happily make a meal of me." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and so far from the mountains. I keep no ale, friend, only water and moonberry juice, and I am told that is a great disappointment to your people." },
      },
      again = {
        { id = "h_again", text = "What else? The nets need mending, but I can listen while I mend." },
        { id = "h_again2", text = "Speak, then. The fish will keep a little longer." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Who are these neighbours of yours?", next = "naga" },
        { text = "Where are the best waters for fishing?", next = "waters" },
        { text = "The stronghold must eat a lot of fish.", next = "eat" },
        { text = "Farewell.", next = "END" },
      },
    },
    naga = {
      lines = { { id = "ng_default", text = "The Hatecrest, who swim up from the south and the west and take what they please. My nets come back torn more often than I like, and twice they have come back with a trident tangled in them." } },
      choices = {
        { text = "Why do they come here?", next = "naga_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_why = {
      big = true,
      lines = { { id = "nw_default", text = "The Sentinels say they were once our own kind, Highborne who drowned when the Well was lost, and that they hate us for living on. I cannot say whether that is true, but they certainly hate us." } },
      choices = {
        { text = "Then the Sentinels should drive them from these waters.", next = "BACK", reply = "Shandris would like nothing better, and her archers try. The sea is very large, though, and the Sentinels are few.", fx = { align = { light = -1 } } },
        { text = "If they were kaldorei once, perhaps there's peace to be had.", next = "BACK", reply = "A kind thought, and I wish it were so. Tell it to the one who took my nets, if he will stop long enough to listen.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    waters = {
      lines = { { id = "wa_default", text = "The shallows on the northern side of the isle, where the water is clear and the naga do not bother to come. Further out the fish are larger, but so is everything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eat = {
      lines = { { id = "ea_default", text = "More than you would think, and the travellers who swim across from the coast arrive starving. Mardrack bakes the bread and I catch the fish, and between us nobody goes to bed hungry." } },
      choices = {
        { text = "That's honest work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fish, as my mother did before me, and the sea does not care who I am, which is what I like about it." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the water here, even when it is calm." } },
    _none = { { id = "tp_none", text = "I know fish and tides. That question is neither." } },
  },
}

---------------------------------------------------------------------------
-- Antarius (Feathermoon, stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "antarius", id = TODO_NPC("Antarius"), name = "Antarius", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "feathermoon" }, temper = { "gentle", "patient" }, values = { "nature", "patient" },
  notices = { "pet" },
  impression = {
    first = "Antarius keeps Feathermoon's stables and talks to the animals in a low voice that never changes, whatever they do. He worries about beasts that come over the water, because they rarely enjoy the crossing.",
    third = "{name} met Antarius, the stable master of Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore. Your companion is welcome here, and so are you." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The beasts remember you, even if they pretend otherwise." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} is still wet from the sea and not at all pleased about it. Let it rest by the fire a while, and it will forgive you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Antarius, and I care for the companions of those who come to Feathermoon. Most of them arrive soaked and angry, and they leave dry and only a little less angry." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Feralas has fine beasts for the taming, and I would know, because sooner or later most of them end up in my pens." },
      },
      again = {
        { id = "h_again", text = "Is there more? Speak softly; the nightsaber is sleeping." },
        { id = "h_again2", text = "Ask, if you wish. I have time." },
      },
      choices = {
        { text = "I need to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why are the beasts so angry when they arrive?", next = "crossing" },
        { text = "What beasts does Feralas offer a hunter?", next = "beasts" },
        { text = "A tamed beast has lost its freedom.", next = "freedom" },
        { text = "Farewell.", next = "END" },
      },
    },
    crossing = {
      lines = { { id = "cr_default", text = "Because nothing that walks on four legs wishes to cross the sea. Cats hate the water most of all, and the bears simply sit down halfway and must be coaxed." } },
      choices = {
        { text = "How do you calm them?", next = "calm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calm = {
      lines = { { id = "ca_default", text = "Warmth, food and quiet, the same as anyone. I have never yet met a beast that could not be calmed by those three, though I have met a few people." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "be_default", text = "Great cats in the forest, wolves and bears on the high ground, and the yetis in the caves if you are bold or foolish. The forest is old here, and its beasts are strong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    freedom = {
      big = true,
      lines = { { id = "fr_default", text = "Some druids say so, and I have heard them argue it long into the night. I have seen tamed beasts that loved their hunters, though, and wild ones that starved in the winter." } },
      choices = {
        { text = "A loyal companion chooses its bond. That's no cage.", next = "BACK", reply = "That is what I have come to believe, after many years with them. I am glad to hear a hunter say it.", fx = { align = { order = 1 } } },
        { text = "The wild is harsh, but it belongs to them.", next = "BACK", reply = "Spoken like a druid, and perhaps you are right. I will still feed the ones that come to me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have tended beasts for the Sentinels for longer than I care to count, and they are better company than most." } },
    advice = { { id = "tp_ad", text = "Never rush a frightened animal. It remembers being rushed." } },
    _none = { { id = "tp_none", text = "I do not know. Ask the beasts, perhaps; they know more than they say." } },
  },
}

---------------------------------------------------------------------------
-- Jadenvis Seawatcher (Feathermoon, reagents on the dock)
---------------------------------------------------------------------------
P:NPC {
  key = "jadenvis", id = TODO_NPC("Jadenvis Seawatcher"), name = "Jadenvis Seawatcher", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "watchful", "dry" }, values = { "duty", "careful" },
  notices = { "class", "travel" },
  impression = {
    first = "Jadenvis Seawatcher sells reagents from the Feathermoon dock and watches the water while he does it. He is the first face most travellers see on the isle, and he seems to take that seriously.",
    third = "{name} met Jadenvis Seawatcher, the reagent seller on the Feathermoon dock.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Sardor Isle. If you need powders or herbs for your craft, you need not go further than this dock." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and dry this time. You are learning." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and one who came over the water. I keep wild thornroot and other seeds for your rites, if you need them." },
    { id = "n_travel", cat = "travel", when = { durability = { max = 0.4 } },
      text = "You look as though the crossing was not kind to you. Rest at Shyria's inn before you go anywhere near the naga shore." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Jadenvis Seawatcher, and I keep the reagents and the dock both. Every traveller who comes to Feathermoon passes me first, and so I see who comes, and how wet they are." },
        { id = "h_mage", when = { class = { "MAGE", "PRIEST", "SHAMAN", "WARLOCK" } },
          text = "One who works with spells, I see. You will want powders and candles, and I would rather you bought them here than went searching the coast for them." },
      },
      again = {
        { id = "h_again", text = "What else? I am watching the water, but I am listening." },
        { id = "h_again2", text = "Speak; the tide is slow today." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "What do you watch for out there?", next = "watch" },
        { text = "Who comes to Feathermoon these days?", next = "visitors" },
        { text = "You don't trust strangers much.", next = "trust" },
        { text = "Farewell.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "wa_default", text = "Naga, mostly, and the occasional raft of ogres who have decided the sea is a road. The Gordunni are poor swimmers, I am glad to say, but they keep trying." } },
      choices = {
        { text = "Ogres on rafts?", next = "rafts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rafts = {
      lines = { { id = "ra_default", text = "Logs lashed together with vines, and five ogres arguing about which way to paddle. They have never landed, but I keep my bow by the reagent crates in case they learn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    visitors = {
      lines = { { id = "vi_default", text = "Sentinels, druids of the Circle, and outsiders who have heard of the ruins in the hills. Many of them ask after the old elven city in the east of Feralas, and I tell them all the same thing: that it is not a place for the curious." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      big = true,
      lines = { { id = "tr_default", text = "I trust what I see, and I see a great deal from this dock. Shandris says the isle must be open to our allies, and I obey, but I count the boats that come and the boats that leave." } },
      choices = {
        { text = "Caution keeps a stronghold standing. Count away.", next = "BACK", reply = "Thank you. Not everyone on this isle agrees, but the sea has taught me to watch.", fx = { align = { order = 1 } } },
        { text = "Allies who are counted don't feel like allies.", next = "BACK", reply = "Perhaps not, but they leave alive, and so do we. I will keep counting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have watched these waters for a long while. My name was given to me for it." } },
    advice = { { id = "tp_ad", text = "Buy your reagents before you need them. The coast sells none." } },
    _none = { { id = "tp_none", text = "I could not tell you. I know the dock, the water and the powders." } },
  },
}

---------------------------------------------------------------------------
-- Loorana (Camp Mojache, food and drink)
---------------------------------------------------------------------------
P:NPC {
  key = "loorana", id = TODO_NPC("Loorana"), name = "Loorana", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "warm", "gentle" }, values = { "kind", "family" },
  notices = { "hunger", "race" },
  impression = {
    first = "Loorana sells bread and drink at Camp Mojache, and she feeds travellers the way a mother feeds a herd. Her bread smells of the plains, though she bakes it in a forest.",
    third = "{name} met Loorana, who sells food and drink at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Come, eat something. The forest is long and the road is longer, and neither of them feeds you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and thinner, I think. Sit, little one, and eat." },
  },
  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look as though the ogres chased you halfway across Feralas. Eat first, and tell me about it after." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Another of the herd, so far from Mulgore. My bread is baked the way it is baked in Bloodhoof, and it will taste of home." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Loorana, and I keep the camp fed. Bread, water and melon juice; it is simple food, but it has carried many braves home." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are far from your friends, and the braves will be watching you. Still, a hungry traveller is a hungry traveller, so speak, but softly." },
      },
      again = {
        { id = "h_again", text = "Is there more? The bread is cooling, so be quick." },
        { id = "h_again2", text = "Ask what you like. The Earth Mother made time for talk." },
      },
      choices = {
        { text = "I'll buy some food.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Where do you get your flour this far from Mulgore?", next = "flour" },
        { text = "Who do you feed here?", next = "feed" },
        { text = "Food is fuel. I don't need it to taste of home.", next = "fuel" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    flour = {
      lines = { { id = "fl_default", text = "It comes by kodo from Thunder Bluff, over the long road through the Needles, and it arrives dusty and late. When it does not arrive at all, I bake with acorns from the forest, and the braves pretend not to notice." } },
      choices = {
        { text = "How does acorn bread taste?", next = "acorn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    acorn = {
      lines = { { id = "ac_default", text = "Bitter, if you hurry it, and sweet, if you soak the acorns three days in the stream. Most things are like that, I think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feed = {
      lines = { { id = "fe_default", text = "The braves who guard the road, the hunters who come for hides, and Rok Orhan, who eats standing up and never says thank you. I feed her anyway, because she fights the Gordunni for all of us." } },
      choices = {
        { text = "The Gordunni trouble the camp often?", next = "gordunni" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gordunni = {
      lines = { { id = "go_default", text = "They watch from the hills, and sometimes they come down. The braves send them back, and I bake more bread for the braves, and the Earth Mother keeps us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fuel = {
      big = true,
      lines = { { id = "fu_default", text = "Then you have been away from home too long, I think. Food that tastes of a place reminds you what you are fighting for." } },
      choices = {
        { text = "You're right. A meal can be a kind of blessing.", next = "BACK", reply = "It can. Eat slowly, then, and remember the plains.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I fight to win, not for memories.", next = "BACK", reply = "Then eat to win, little one, and I will remember the plains for you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I baked for my family in Mulgore. Now the camp is my family, and it is larger and hungrier." } },
    advice = { { id = "tp_ad", text = "Carry bread on the road. The forest gives berries, but not enough." } },
    _none = { { id = "tp_none", text = "I do not know, little one. I know bread, and what the braves like." } },
  },
}

---------------------------------------------------------------------------
-- Tarhus (Camp Mojache, reagents)
---------------------------------------------------------------------------
P:NPC {
  key = "tarhus", id = TODO_NPC("Tarhus"), name = "Tarhus", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "calm", "patient" }, values = { "nature", "wise" },
  notices = { "class" },
  impression = {
    first = "Tarhus sells reagents at Camp Mojache: powders, seeds and the odd thing gathered from the forest floor. He speaks slowly and sorts his stock by the season it was gathered in.",
    third = "{name} met Tarhus, the reagent seller of Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Seeds, powders and things the forest gives. May the eternal sun shine upon you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the season has turned a little. I have new things." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits walk close beside you, shaman. I keep ankhs for when they cannot keep you from falling." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Earth Mother. I gather wild thornroot from these very woods, and the seeds are strong this year." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tarhus. I keep the reagents that the shamans, druids and mages of the camp need, and I gather what I can from the forest so the kodo need not carry it." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are not of the Horde, but you are standing very still, which is wise in this camp. Speak, and then go on your way." },
      },
      again = {
        { id = "h_again", text = "There is more? Speak; my seeds are patient." },
        { id = "h_again2", text = "Ask. The forest has given me time to answer." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "What does the forest give you?", next = "forest" },
        { text = "Does Feralas feel different from Mulgore?", next = "home" },
        { text = "Why gather it yourself? The kodo could carry it.", next = "gather" },
        { text = "May the sun shine on you, Tarhus.", next = "END" },
      },
    },
    forest = {
      lines = { { id = "fo_default", text = "Thornroot and seeds for the druids, and good wood for the shamans' totems. The trees here are older than any in Mulgore, and they give freely, if you ask before you take." } },
      choices = {
        { text = "How do you ask a tree?", next = "ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "as_default", text = "Slowly, and with your hand on the bark. It does not answer in words, but you will know if it minds, because the seeds you take will not grow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Mulgore is open sky and wind in the grass, and Feralas is rain and green shadow. I missed the sky at first, but the rain sings, and now I would miss that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gather = {
      big = true,
      lines = { { id = "ga_default", text = "The kodo have enough to carry, and the forest is right here. Some in camp think it foolish to walk the woods with the Gordunni about, but the woods give me what Thunder Bluff cannot." } },
      choices = {
        { text = "Take only what you need. The forest deserves respect.", next = "BACK", reply = "That is the way of it. A herd that grazes one field bare has nothing to graze next spring.", fx = { align = { light = 1 } } },
        { text = "Take all it gives while the ogres don't.", next = "BACK", reply = "You think like a hungry wolf, little one. Wolves are not always wrong, but they are often lean.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came from Mulgore with the first braves who built this camp. I carried seeds, and they carried spears." } },
    advice = { { id = "tp_ad", text = "Ask before you take, and the land will keep giving." } },
    _none = { { id = "tp_none", text = "That I do not know. Ask me of seeds and roots." } },
  },
}

---------------------------------------------------------------------------
-- Shyrka Wolfrunner (Camp Mojache, stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "shyrka", id = TODO_NPC("Shyrka Wolfrunner"), name = "Shyrka Wolfrunner", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "mojache" }, temper = { "blunt", "steady" }, values = { "loyal", "proud" },
  notices = { "pet" },
  impression = {
    first = "Shyrka Wolfrunner keeps the stables at Camp Mojache, an orc among tauren, and she has opinions about every beast that comes through. She judges hunters by how their companions look at them.",
    third = "{name} met Shyrka Wolfrunner, the orc stable master at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "You need a pen for a beast? I have pens, and I have meat. Speak." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Your beast was well behaved, I will say that." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} looks at you before it looks at me. That is a good sign, {class}; it trusts you." },
    { id = "n_wolf", cat = "pet", when = { pet = { family = "Wolf" } },
      text = "A wolf! Now there is a proper companion. My clan rode wolves before we ever learned to tame anything else." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Shyrka Wolfrunner. I keep the beasts of the camp, and of any hunter who rides through. The tauren treat their animals like kin, and I have learned to do the same." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Another orc, out here among the tauren! Good. They are fine people, but they never raise their voices, and sometimes a beast needs shouting at." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are not of the Horde. I keep no pens for you, and the braves will want you gone, so say your piece." },
      },
      again = {
        { id = "h_again", text = "What else? The wolves are hungry." },
        { id = "h_again2", text = "Ask. I have time until feeding." },
      },
      choices = {
        { text = "I need to stable a companion.", next = "BUSINESS", when = { class = "HUNTER", faction = "Horde" } },
        { text = "How does an orc come to keep a tauren stable?", next = "why" },
        { text = "Tell me about your wolves.", next = "wolves" },
        { text = "A beast should fear its master.", next = "fear" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Thrall asked the tauren for help, and the tauren asked for help in return, and here I am. The camp needed someone who knew beasts, and I have known wolves since before I could walk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wolves = {
      lines = { { id = "wo_default", text = "My clan rode wolves into every battle we fought, and many of us died in the camps without them. When I came out, the first thing I did was find a wolf, and the second was find a name for it." } },
      choices = {
        { text = "What did you name it?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Gnaw, because that is what it did to my boots. It is old now and sleeps by the fire, and it still chews my boots when it thinks I am not looking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fear = {
      big = true,
      lines = { { id = "fe_default", text = "Some of the old warlords thought so, and their beasts turned on them at the worst moment. A wolf who fears you runs, and a wolf who trusts you stands." } },
      choices = {
        { text = "Trust, then. A bond is stronger than a chain.", next = "BACK", reply = "Now you speak like a Wolfrunner. Bring your companion to me any time.", fx = { align = { honor = 1 } } },
        { text = "Fear works well enough, if you're strong.", next = "BACK", reply = "Then be very strong, and never sleep. I will feed your beast, and hope it forgives you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I rode wolves, I lost them in the camps, and I found them again, and that is all the story there is." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself. It will remember." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask me about wolves." } },
  },
}

---------------------------------------------------------------------------
-- Jannos Lighthoof (Camp Mojache, druid trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "jannos", id = TODO_NPC("Jannos Lighthoof"), name = "Jannos Lighthoof", title = "Druid Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "mojache" }, temper = { "calm", "gentle" }, values = { "nature", "wise" },
  notices = { "form", "class" },
  impression = {
    first = "Jannos Lighthoof trains druids at Camp Mojache, and he spends as much time listening to the forest as to his students. He seems to think Feralas has a great deal to teach anyone patient enough.",
    third = "{name} met Jannos Lighthoof, the druid trainer at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "The forest is speaking today, if you will listen. What brings you to me?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. The forest remembers your footsteps; so do I." },
  },
  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat" } },
      text = "You wear the shape of the wild well, but remember to step out of it now and then. A druid who forgets the way back is no longer a druid." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "NightElf" },
      text = "A kaldorei druid, here among the Horde. We share the Dream and the Earth Mother both, whatever our peoples think of each other." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Jannos Lighthoof. I teach the way of the druid to those of the herd who would learn it, and Feralas is a good teacher too, older and wiser than I am." },
        { id = "h_druid", when = { class = "DRUID", faction = "Horde" },
          text = "A druid of the herd! Come, sit by me, and let us see how far you have walked on the path since Thunder Bluff." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are of the Alliance, and I cannot teach you. Still, the forest belongs to neither of us, so speak if you must." },
      },
      again = {
        { id = "h_again", text = "There is more? The forest is in no hurry, and nor am I." },
        { id = "h_again2", text = "Speak; the rain will not mind." },
      },
      choices = {
        { text = "I'm ready to train.", next = "BUSINESS", when = { class = "DRUID", faction = "Horde" } },
        { text = "What can Feralas teach a druid?", next = "teach" },
        { text = "The kaldorei were druids long before the tauren.", next = "kaldorei" },
        { text = "The wild should be tamed for the herd's sake.", next = "tame" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "How old things grow. The trees here stood before the kaldorei's great sundering, and some say the Dream lies very close to the ground in parts of this forest. Walk carefully in the south and east, and you may feel it." } },
      choices = {
        { text = "What would I feel?", next = "dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "A stillness, as if the world were holding its breath. Some druids find peace in it, and some find a dread they cannot name, and I do not yet know which it means." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "So they were, and so they tell us, often. But the Earth Mother spoke to the tauren long before any elf taught us, and our ways grew from the plains as theirs grew from the forest. Both roots drink from the same water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tame = {
      big = true,
      lines = { { id = "ta_default", text = "Some braves say so when the Gordunni come down from the hills. But a druid does not tame the wild; a druid keeps the balance, and the balance keeps the herd." } },
      choices = {
        { text = "Balance, then. The herd lives within the land.", next = "BACK", reply = "You have the heart of a druid, whether or not you wear the shape. The Earth Mother hears you.", fx = { align = { order = -1 } } },
        { text = "The herd comes first. The land must serve it.", next = "BACK", reply = "Then you will find the land a hard servant, little one. It has outlived many masters.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned at the feet of the elders in Thunder Bluff, and now I learn at the roots of these trees." } },
    advice = { { id = "tp_ad", text = "Listen more than you speak, in the forest and out of it." } },
    _none = { { id = "tp_none", text = "That I cannot say. Ask the forest; it is older than I am." } },
  },
}
