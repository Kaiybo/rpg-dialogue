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
  notices = { "craft", "hunger" , "race" },
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
    { id = "n_b1", cat = "race", when = { race = "NightElf" },
      text = "Elune light your path, {g:brother|sister}. Take the bream if you miss the lakes of Ashenvale, for it is the nearest thing these waters give." },
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
        { id = "h_again_b1", text = "Ask on. The tide does not turn for a while yet." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Who are these neighbours of yours?", next = "naga" },
        { text = "Where are the best waters for fishing?", next = "waters" },
        { text = "The stronghold must eat a lot of fish.", next = "eat" },
        { text = "Your nets have been mended many times.", next = "nets" },
        { text = "Who buys from you besides the Sentinels?", next = "buyers" },
        { text = "What's the finest fish these waters give?", next = "finest", when = { profession = { "Fishing", "Cooking" } } },
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
    nets = {
      lines = {
        { id = "b_nets_default", text = "More times than I can count, and I have stopped counting. A naga does not untangle a net, it simply tears through, and then I spend the evening with a needle instead of a line." },
      },
      choices = {
        { text = "Could the Sentinels guard your nets?", next = "nets_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nets_guard = {
      lines = {
        { id = "b_nets_guard_default", text = "Latronicus Moonspear has offered, and I told him to keep his archers on the walls where they belong. A torn net costs me an evening, and a lost Sentinel would cost the isle far more." },
      },
      choices = {
        { text = "That's a fair way to weigh it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "b_buyers_default", text = "Travellers off the boat, mostly, and Innkeeper Shyria, who takes the best of each morning for her table. Brannock the fishing master buys nothing at all, since he catches his own and tells me mine are small." },
      },
      choices = {
        { text = "Are his any bigger?", next = "buyers_brannock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_brannock = {
      lines = {
        { id = "b_buyers_brannock_default", text = "A little, on a good day, and he never lets me forget those days. I will say that he taught half this stronghold to hold a line, and I sell to all of them when their luck runs out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    finest = {
      lines = {
        { id = "b_finest_default", text = "The big redgill that run in the deep channel between the isle and the coast, when you can bring one up before something else takes it. Cook it plainly over coals, because a fish that good needs nothing from you." },
      },
      choices = {
        { text = "I'll try the channel.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fish, as my mother did before me, and the sea does not care who I am, which is what I like about it." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the water here, even when it is calm." } },
    sentinels = { { id = "tp_b_sentinels", text = "They guard the walls and I feed them, and neither of us thinks the other has the easier work." } },
    rumors = { { id = "tp_b_rumors", text = "The naga have been quiet for three mornings together, and I do not like it. The sea is only ever that still before something comes up out of it." } },
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
  notices = { "pet" , "class" },
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
    { id = "n_b1", cat = "pet", when = { pet = { family = "Cat" } },
      text = "A cat, and a proud one. Keep it well away from the far pen, for the stronghold's nightsabers do not share their ground gladly." },
    { id = "n_b2", cat = "class", when = { class = "DRUID" },
      text = "A druid knows what it is to wear fur and claws. The beasts here will be easier with you than with most who come ashore." },
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
        { id = "h_again_b1", text = "The beasts are fed and the pens are quiet, so I can spare you a little longer." },
        { id = "h_again_b2", text = "Go on, then, but keep your voice as low as mine." },
      },
      choices = {
        { text = "I need to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why are the beasts so angry when they arrive?", next = "crossing" },
        { text = "What beasts does Feralas offer a hunter?", next = "beasts" },
        { text = "A tamed beast has lost its freedom.", next = "freedom" },
        { text = "That nightsaber in the far pen looks very old.", next = "saber" },
        { text = "Who else on the isle works with beasts?", next = "keepers" },
        { text = "Do the beasts know a druid when they see one?", next = "druidq", when = { class = "DRUID" } },
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
    saber = {
      lines = {
        { id = "b_saber_default", text = "She is older than this stronghold, and she carried a Sentinel through more battles than I have seen. She has earned her sleep, and I see to it that nobody disturbs it." },
      },
      choices = {
        { text = "Whose mount was she?", next = "saber_rider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saber_rider = {
      lines = {
        { id = "b_saber_rider_default", text = "She belonged to a Sentinel of the General's own company, who fell to the Gordunni on the mainland in the expedition's first year. The cat swam back to the isle alone, and she has not left my pens since." },
      },
      choices = {
        { text = "She's lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keepers = {
      lines = {
        { id = "b_keepers_default", text = "Fyldren Moonfeather keeps the hippogryphs on the rise above the dock, and he and I trade remedies for wet feathers and sore paws. The birds and the cats do not care for one another, so we keep our charges well apart." },
      },
      choices = {
        { text = "Do the hippogryphs mind the sea as well?", next = "keepers_birds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keepers_birds = {
      lines = {
        { id = "b_keepers_birds_default", text = "Not in the least, for they are creatures of the air, and the water is only something that passes beneath them. I envy Fyldren that on the days when a boat lands three seasick bears at once." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    druidq = {
      lines = {
        { id = "b_druidq_default", text = "They know at once, and I think it is the scent, though the druids tell me it is something deeper. The nightsabers will let a druid walk among them when they would bare their teeth at anyone else." },
      },
      choices = {
        { text = "They know their own kind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have tended beasts for the Sentinels for longer than I care to count, and they are better company than most." } },
    advice = { { id = "tp_ad", text = "Never rush a frightened animal. It remembers being rushed." } },
    sentinels = { { id = "tp_b_sentinels", text = "The Sentinels ride nightsabers into battle, and every one of those cats passes through my hands first. I send them out sound, and I mend what comes back." } },
    rumors = { { id = "tp_b_rumors", text = "The boatmen say the cats on the Forgotten Coast have grown bolder since the naga drove the game inland. I would keep a companion close on that shore." } },
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
  notices = { "class", "travel" , "race" },
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
    { id = "n_b1", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You are a long way from the eastern kingdoms. Our allies are welcome on the isle, and I will note your arrival all the same." },
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
        { id = "h_again_b1", text = "Go on. I can listen and count sails at once." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "What do you watch for out there?", next = "watch" },
        { text = "Who comes to Feathermoon these days?", next = "visitors" },
        { text = "You don't trust strangers much.", next = "trust" },
        { text = "You keep a bow beside your reagent crates.", next = "bow" },
        { text = "What lies on the coast across the water?", next = "coast" },
        { text = "You'd notice if someone came ashore unseen.", next = "unseen", when = { class = "ROGUE" } },
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
    bow = {
      lines = {
        { id = "b_bow_default", text = "I do, and it is strung. A dock is the first part of any stronghold to learn that trouble has arrived, and I would rather meet it with an arrow than with a pouch of rune dust." },
      },
      choices = {
        { text = "Have you ever had to use it?", next = "bow_used" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bow_used = {
      lines = {
        { id = "b_bow_used_default", text = "Twice, on Hatecrest scouts who came up under the pilings at night to count our boats as I count theirs. Neither of them went back to report, and so I think the naga still do not know our numbers." },
      },
      choices = {
        { text = "Then your counting is worth more than theirs.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coast = {
      lines = {
        { id = "b_coast_default", text = "The Forgotten Coast, and it is well named. There are sea giants in the shallows, naga in the ruins to the south, and a jetty where the boat from the mainland ties up whenever its master remembers us." },
      },
      choices = {
        { text = "And further inland?", next = "coast_inland" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coast_inland = {
      lines = {
        { id = "b_coast_inland_default", text = "Forest older than this stronghold, and ogres in every ruin they can find a roof in. The road east runs past the Twin Colossals to Thalanaar, and few who set out on it without a guide enjoy the walk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    unseen = {
      lines = {
        { id = "b_unseen_default", text = "I would like to say that I would, and I am honest enough to say that I might not. Your kind are the reason I count the footprints on the dock each dawn as well as the boats." },
      },
      choices = {
        { text = "I'll use the front gate, then.", next = "BACK", reply = "See that you do. Shandris has little patience for surprises on her own isle, and I have less." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have watched these waters for a long while. My name was given to me for it." } },
    advice = { { id = "tp_ad", text = "Buy your reagents before you need them. The coast sells none." } },
    sentinels = { { id = "tp_b_sentinels", text = "I served on the walls before I served on the dock. The dock is quieter, and I have come to think that it matters more." } },
    dire_maul = { { id = "tp_b_dire_maul", text = "The old city in the east draws the curious as a lamp draws moths. I sell them their reagents and I do not expect to see all of them again." } },
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
  notices = { "hunger", "race" , "class" },
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
    { id = "n_b1", cat = "class", when = { class = "HUNTER" },
      text = "Your beast is thin as well, hunter. I keep the meat scraps in that basket for the camp's hungry animals, so do not be too proud to ask." },
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
        { id = "h_again_b1", text = "Sit a little longer, then. Nobody ever starved from talking by an oven." },
      },
      choices = {
        { text = "I'll buy some food.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Where do you get your flour this far from Mulgore?", next = "flour" },
        { text = "Who do you feed here?", next = "feed" },
        { text = "Food is fuel. I don't need it to taste of home.", next = "fuel" },
        { text = "You bake for a great many mouths alone.", next = "alone" },
        { text = "Who in camp is hardest to feed?", next = "hardest" },
        { text = "Would you share the secret of your bread?", next = "secret", when = { profession = "Cooking" } },
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
    alone = {
      lines = {
        { id = "b_alone_default", text = "Not quite alone, little one. Innkeeper Greul takes half the bread for his tables, and Sheendra Tallgrass trades me salt and spice when the caravans bring her any." },
      },
      choices = {
        { text = "And when they don't?", next = "alone_without" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_without = {
      lines = {
        { id = "b_alone_without_default", text = "Then the bread is plain, and the braves eat it and pretend not to notice. Tauren are polite about food, which is a blessing to a baker in a lean season." },
      },
      choices = {
        { text = "The orcs are less polite, I'd guess.", next = "alone_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_orcs = {
      lines = {
        { id = "b_alone_orcs_default", text = "Krueg Skullsplitter told me once that my bread needed more meat in it. I asked him how one puts meat in bread, and he has been thinking about it ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "b_hardest_default", text = "Sage Korolusk, because he forgets that eating is a thing people do. I leave a loaf by his scrolls each morning, and by evening it is gone or it has notes written on the crust." },
      },
      choices = {
        { text = "He's lucky you look after him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret = {
      lines = {
        { id = "b_secret_default", text = "There is no secret, only time. Let the dough rise slowly by a banked fire, and do not open the oven to look at it, because bread is like a calf and will not grow while you stare." },
      },
      choices = {
        { text = "I'll try to leave it alone.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I baked for my family in Mulgore. Now the camp is my family, and it is larger and hungrier." } },
    advice = { { id = "tp_ad", text = "Carry bread on the road. The forest gives berries, but not enough." } },
    earth_mother = { { id = "tp_b_earth_mother", text = "She feeds us all in the end, little one. I only carry her gifts from the field to the table." } },
    cairne = { { id = "tp_b_cairne", text = "The old chief ate at my mother's fire once, when I was a calf in Mulgore. He asked for a second helping, and she spoke of it for the rest of her life." } },
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
  notices = { "class" , "profession" },
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
    { id = "n_b1", cat = "profession", when = { profession = "Herbalism" },
      text = "You carry the smell of cut stems, friend. The forest here gives sungrass and golden sansam freely, so take with care and leave the roots." },
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
        { id = "h_again_b1", text = "The seeds can wait a little longer. What would you ask?" },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "What does the forest give you?", next = "forest" },
        { text = "Does Feralas feel different from Mulgore?", next = "home" },
        { text = "Why gather it yourself? The kodo could carry it.", next = "gather" },
        { text = "You dry your herbs under the open sky.", next = "drying" },
        { text = "Who in camp uses what you gather?", next = "users" },
        { text = "Do the spirits of this forest speak to you?", next = "spirits", when = { class = { "SHAMAN", "DRUID" }, faction = "Horde" } },
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
    drying = {
      lines = {
        { id = "b_drying_default", text = "When the sky allows it, which in Feralas is not often. The rain comes most afternoons, and then I carry everything under the tent and wait, as the forest waits." },
      },
      choices = {
        { text = "Does the damp spoil them?", next = "drying_damp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drying_damp = {
      lines = {
        { id = "b_drying_damp_default", text = "Some of them, and I have learned which. The thornroot does not mind the wet, but the powders for the shamans must be kept in sealed gourds, or they turn to grey mud." },
      },
      choices = {
        { text = "That's a lesson learned the hard way.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    users = {
      lines = {
        { id = "b_users_default", text = "Jannos Lighthoof takes seeds for his students, and Witch Doctor Uzer'i asks for things I do not always wish to find. Bronk the alchemist buys the rest, and complains that I pick too little." },
      },
      choices = {
        { text = "What does Uzer'i ask for?", next = "users_uzeri" },
        { text = "Something else.", next = "BACK" },
      },
    },
    users_uzeri = {
      lines = {
        { id = "b_users_uzeri_default", text = "Things that grow near old ruins and bad water, for charms I do not understand. He is of the Horde and a guest of this camp, so I bring them, and I wash my hands in the stream afterwards." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = {
        { id = "b_spirits_default", text = "They do not speak to me as they speak to a shaman, but I hear something when the rain stops. It is like a herd breathing at night, slow and very large, and it does not seem to mind that we are here." },
      },
      choices = {
        { text = "Then the camp is welcome in this forest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came from Mulgore with the first braves who built this camp. I carried seeds, and they carried spears." } },
    advice = { { id = "tp_ad", text = "Ask before you take, and the land will keep giving." } },
    earth_mother = { { id = "tp_b_earth_mother", text = "Every seed is hers. I only keep them dry until someone has need of them." } },
    emerald_dream = { { id = "tp_b_emerald_dream", text = "Jannos says the Dream lies close under these trees. I believe him, because nothing grows this green without help." } },
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
  notices = { "pet" , "class" },
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
    { id = "n_b1", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You should ride a wolf into battle once before you die, {class}, because nothing else in this world is like it." },
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
        { id = "h_again_b1", text = "More talk? Fine, but the wolves eat when I say, and I say soon." },
      },
      choices = {
        { text = "I need to stable a companion.", next = "BUSINESS", when = { class = "HUNTER", faction = "Horde" } },
        { text = "How does an orc come to keep a tauren stable?", next = "why" },
        { text = "Tell me about your wolves.", next = "wolves" },
        { text = "A beast should fear its master.", next = "fear" },
        { text = "The camp's kodos are in your care as well.", next = "kodos" },
        { text = "Who brings beasts to you here?", next = "bring" },
        { text = "What beast would you tame in Feralas?", next = "tame_here", when = { class = "HUNTER", faction = "Horde" } },
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
    kodos = {
      lines = {
        { id = "b_kodos_default", text = "They are, though the tauren hardly need me for them. A kodo does as it pleases, slowly, and the tauren wait until what pleases it is also what they wanted." },
      },
      choices = {
        { text = "That would drive an orc mad.", next = "kodos_mad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodos_mad = {
      lines = {
        { id = "b_kodos_mad_default", text = "It did, for my first season here. Then I watched a kodo walk through a Gordunni ogre as if he were tall grass, and I decided that the tauren may know something after all." },
      },
      choices = {
        { text = "Patience has its uses.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bring = {
      lines = {
        { id = "b_bring_default", text = "Hunters from Orgrimmar who have come for the yetis and the great cats, and the braves who ride the road east. Cawind Trueaim sells them their arrows, and I keep their beasts while they are away spending his." },
      },
      choices = {
        { text = "Do the hunters treat their beasts well?", next = "bring_well" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bring_well = {
      lines = {
        { id = "b_bring_well_default", text = "Most do. The ones who do not, I tell them so to their faces, and Rok Orhan has not once told me to hold my tongue about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tame_here = {
      lines = {
        { id = "b_tame_here_default", text = "One of the big cats from the forest west of camp, if you have the patience to stalk it. They are quiet and they hit like a thrown axe, and the only better beast in Kalimdor is a wolf." },
      },
      choices = {
        { text = "You'd say that about any wolf.", next = "BACK", reply = "I would, and I would be right every time." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I rode wolves, I lost them in the camps, and I found them again, and that is all the story there is." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself. It will remember." } },
    thrall = { { id = "tp_b_thrall", text = "The Warchief rides a wolf, as an orc should. That told me what sort of chief he was before he ever spoke." } },
    internment = { { id = "tp_b_internment", text = "They took our wolves from us first, before the chains. A clan without its wolves forgets how to run, and I think they knew that." } },
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
    { id = "n_b1", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman hears the elements where I hear the growing things. We listen to the same land, you and I, through different ears." },
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
        { id = "h_again_b1", text = "Ask again, if you wish. A question is a kind of seed." },
      },
      choices = {
        { text = "I'm ready to train.", next = "BUSINESS", when = { class = "DRUID", faction = "Horde" } },
        { text = "What can Feralas teach a druid?", next = "teach" },
        { text = "The kaldorei were druids long before the tauren.", next = "kaldorei" },
        { text = "The wild should be tamed for the herd's sake.", next = "tame" },
        { text = "You teach under a tree rather than a tent.", next = "tree" },
        { text = "Do many of the herd come this far to learn?", next = "students" },
        { text = "Have you walked in Moonglade?", next = "moonglade", when = { class = "DRUID" } },
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
    tree = {
      lines = {
        { id = "b_tree_default", text = "A tent teaches a student about tents. Under this tree they hear the rain on the leaves and the beetles in the bark, and half of my lessons are given before I have opened my mouth." },
      },
      choices = {
        { text = "And when the Gordunni come near?", next = "tree_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree_ogres = {
      lines = {
        { id = "b_tree_ogres_default", text = "Then we go inside the palisade like sensible calves, and the braves do their work. A druid keeps the balance, but a druid is no use to the balance with an ogre's club in his skull." },
      },
      choices = {
        { text = "Even balance needs a wall sometimes.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students = {
      lines = {
        { id = "b_students_default", text = "A few each season. Most learn at Thunder Bluff under the Elder Rise, and only the restless ones take the long road to Feralas to see what an old forest can show them." },
      },
      choices = {
        { text = "Are the restless ones the better druids?", next = "students_restless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students_restless = {
      lines = {
        { id = "b_students_restless_default", text = "Sometimes, and sometimes they are only restless. Feralas sorts them quickly, because the forest has no patience for a student who will not sit still and listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = {
        { id = "b_moonglade_default", text = "I have, and I sat among the kaldorei there without a harsh word passing between us. The Cenarion Circle asks only that you serve the wild, and it does not ask whose banner you were born under." },
      },
      choices = {
        { text = "That's rare in this world.", next = "BACK", reply = "It is, and it should be guarded. Go there when you can, and take your quarrels off at the gate." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned at the feet of the elders in Thunder Bluff, and now I learn at the roots of these trees." } },
    advice = { { id = "tp_ad", text = "Listen more than you speak, in the forest and out of it." } },
    cenarion_circle = { { id = "tp_b_cenarion_circle", text = "The Circle is where tauren and kaldorei remember that they serve the same thing. I wish our chiefs sat in it more often." } },
    cairne = { { id = "tp_b_cairne", text = "The old chief chose friendship with the Horde, and friendship with the land, and he has never let one cost him the other. I try to teach the same." } },
    _none = { { id = "tp_none", text = "That I cannot say. Ask the forest; it is older than I am." } },
  },
}

---------------------------------------------------------------------------
-- Troyas Moonbreeze (Feathermoon, scholar: In Search of Knowledge, The Stave of Equinex, The Morrow Stone)
---------------------------------------------------------------------------
P:NPC {
  key = "troyas", id = TODO_NPC("Troyas Moonbreeze"), name = "Troyas Moonbreeze",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "feathermoon" }, temper = { "scholarly", "patient" }, values = { "lore", "careful" },
  notices = { "class", "race", "lore" },
  impression = {
    first = "Troyas Moonbreeze studies the old relics of Feralas from a house on Sardor Isle, with a cat asleep on his notes. He asks for a great deal of walking, and he explains exactly why each step is needed.",
    third = "{name} met Troyas Moonbreeze, a scholar of Feathermoon Stronghold who seeks the Morrow Stone.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Mind the cat, please; Jewel has chosen my best map to sleep on, and I have not the heart to move her." },
    { id = "g_2", when = { metBefore = true }, text = "You return, and Jewel has not stirred since you left. I envy her the certainty of her purpose." },
    { id = "g_3", when = { questActive = TODO_QUEST("In Search of Knowledge") }, text = "Has Daryn Lightwind parted with the book? He guards the Temple's shelves as a dragon guards gold." },
    { id = "g_4", when = { questActive = TODO_QUEST("The Stave of Equinex") }, text = "Four flames, four monoliths, and the stave lies beyond them. I hope the harpies have not troubled you too greatly." },
    { id = "g_5", when = { questDone = TODO_QUEST("The Morrow Stone") }, text = "The stone sits on my desk, and I have scarcely slept since you brought it. Thank you, {name}." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = { "MAGE", "DRUID" } },
      text = "You have the look of one who reads for pleasure. Sit, then, for I have few visitors who would know a relic from a river stone." },
    { id = "n_2", cat = "race", when = { race = "NightElf" },
      text = "It is good to see one of our own take an interest in what our ancestors left in this forest. Too many would rather it stayed buried." },
    { id = "n_3", cat = "lore", when = { questDone = TODO_QUEST("Elven Legends") },
      text = "Scholar Runethorn tells me you walked the halls of Eldre'Thalas for her. I should like to hear what the stones looked like, when you have an hour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Troyas Moonbreeze. I study what the ancients of Feralas left behind them, and at present I am seeking a relic called the Morrow Stone, which is said to lie hidden in the Ruins of Ravenwind." },
        { id = "hello_2", when = { questBefore = TODO_QUEST("In Search of Knowledge") }, text = "Before I send anyone into the ruins, I must be sure of my reading. There is a history of Feralas in the Temple library at Darnassus, kept by Daryn Lightwind, and I need what it says of the stave." },
        { id = "hello_3", when = { questActive = TODO_QUEST("The Stave of Equinex") }, text = "The Stave of Equinex is the key. Draw a flame from each of the four monoliths in the Ruins of Ravenwind, Byltan, Lahassa, Samha and Imbel, and bring them together at the Equinex Monolith." },
        { id = "hello_4", when = { questActive = TODO_QUEST("The Morrow Stone") }, text = "You have the stave in your hands. Then the Morrow Stone is within our reach at last, and I find that my hands are not quite steady." },
        { id = "hello_5", when = { questDone = TODO_QUEST("The Morrow Stone") }, text = "The Morrow Stone is everything the old texts promised and a good deal that they left out. I shall be years in understanding it, and I do not grudge a day of them." },
      },
      again = {
        { id = "hello_again1", text = "What else would you know? I have time, though my notes would deny it." },
        { id = "hello_again2", text = "Ask, friend. A scholar is only a person who enjoys being questioned." },
        { id = "hello_again3", when = { questDone = TODO_QUEST("The Morrow Stone") }, text = "Yes? Forgive me, my thoughts keep wandering back to the stone." },
      },
      choices = {
        { text = "What is the Morrow Stone?", next = "stone" },
        { text = "The Ruins of Ravenwind are harpy country now.", next = "ravenwind" },
        { text = "Your cat seems to run this household.", next = "jewel" },
        { text = "Is a relic like that safe to study?", next = "safe", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Does the General approve of your digging?", next = "general", when = { race = "NightElf" } },
        { text = "What do you need done?", next = "BUSINESS" },
        { text = "Elune light your studies, Troyas.", next = "END" },
      },
    },
    stone = {
      lines = {
        { id = "stone_default", text = "A relic of the elder days, shaped by those who raised the monoliths in the north of this forest. The texts say that it remembers the turning of the seasons, and that whoever holds it may read what is to come in what has been." },
      },
      choices = {
        { text = "Read the future in a stone?", next = "stone_future" },
        { text = "That sounds like a Highborne toy.", next = "stone_highborne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone_future = {
      lines = {
        { id = "stone_future_default", text = "Nothing so grand as prophecy, I think. I believe that it records the patterns of the land, the rains and the growth and the dying back, so faithfully that a careful reader could say what next year holds for the forest." },
      },
      choices = {
        { text = "That would be worth knowing.", next = "stone_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone_use = {
      narr = "He rests one hand on the sleeping cat while he considers the question.",
      lines = {
        { id = "stone_use_default", text = "It would, and that is where my wife and I disagree. Angelas holds that the stone belongs with the Sentinels, to warn them of famine and flood, and I hold that it must be understood before anyone leans upon it." },
      },
      choices = {
        { text = "Understand it first. Half-knowledge is how ruins are made.", next = "BACK", reply = "So I tell her, and she tells me that I have been understanding things for three hundred years. We are both right, which is the difficulty.", fx = { align = { order = 1 } } },
        { text = "Give it to the Sentinels. It's no use on a desk.", next = "BACK", reply = "You sound exactly like Angelas, and I will tell her so. She will be unbearably pleased.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone_highborne = {
      lines = {
        { id = "stone_highborne_default", text = "You are more right than you know. The monolith builders were of the old court, and they made beautiful things with a carelessness that still frightens me, which is why I study with the windows open and a bucket of sand beside me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenwind = {
      lines = {
        { id = "ravenwind_default", text = "The Northspring harpies roost in every broken arch of it, and they have no notion what they are fouling. The monoliths still stand among their nests, and the flames upon them have burned since before the Sundering." },
      },
      choices = {
        { text = "How do flames burn for ten thousand years?", next = "ravenwind_flames" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenwind_flames = {
      lines = {
        { id = "ravenwind_flames_default", text = "They are not fire as a hearth knows it. Each is a small working of the builders' craft, bound to its stone, and the Stave of Equinex was made to gather them, as a key is made for one lock." },
      },
      choices = {
        { text = "So someone must walk through the harpies to fetch it.", next = "ravenwind_walk", reply = "Someone must, and I am a poor hand with a bow. I do not ask it lightly of anyone." },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenwind_walk = {
      lines = {
        { id = "ravenwind_walk_default", text = "I would go myself if I thought I would return. A scholar who dies in the field teaches no one, and so I send the brave and I keep faithful notes of what they tell me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    jewel = {
      lines = {
        { id = "jewel_default", text = "She does. Jewel came to the isle as a kitten in a Sentinel's pack, and she decided within the week that my desk was the warmest place on it." },
      },
      choices = {
        { text = "Does she help with the research?", next = "jewel_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jewel_help = {
      lines = {
        { id = "jewel_help_default", text = "She sits on whichever page I most need, without fail. I have come to think of it as a discipline, for I must be very sure that I want a scroll before I disturb her for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = {
        { id = "safe_default", text = "No relic is safe, and those who say otherwise have usually buried a colleague. I handle it with gloves and with wards, and Xylinnia Starshine examines my wards each month and finds fault with them, for which I am grateful." },
      },
      choices = {
        { text = "A second pair of eyes is wise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    general = {
      lines = {
        { id = "general_default", text = "Shandris Feathermoon approves of anything that tells her more about the land she must hold. She has asked only that nothing I bring home should explode, and so far I have kept my word." },
      },
      choices = {
        { text = "That's a modest thing to ask.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "I know the old places of this forest, who built them, and a little of why. Ask, and I will tell you what the stones have told me." } },
    background = { { id = "tp_background", text = "I came with the General's expedition to read the ruins while the Sentinels held them. My wife Angelas came to keep me from walking into the sea with my nose in a book." } },
    highborne = { { id = "tp_highborne", text = "They built wonders here, and then they broke the world. I study their work as a healer studies a poison." } },
    dire_maul = { { id = "tp_dire_maul", text = "Eldre'Thalas is the greatest of their cities, and the ogres use its libraries for kindling. Scholar Runethorn weeps over it, and I do not blame her." } },
    elune = { { id = "tp_elune", text = "She gave us the night to think in. I try to use it well." } },
    _none = { { id = "tp_none", text = "That lies outside my reading, I fear. Ask me of old stones and I will be more use to you." } },
  },
}

---------------------------------------------------------------------------
-- Scholar Runethorn (Feathermoon: Elven Legends, the Alliance half of Korolusk's search)
---------------------------------------------------------------------------
P:NPC {
  key = "runethorn", id = TODO_NPC("Scholar Runethorn"), name = "Scholar Runethorn",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "feathermoon" }, temper = { "brisk", "exacting" }, values = { "lore", "pride" },
  notices = { "class", "race" },
  impression = {
    first = "Scholar Runethorn has chased one long-dead elf across half the world and is not about to lose the race at the last mile. She speaks of her tauren rival with more warmth than she seems to intend.",
    third = "{name} met Scholar Runethorn of Feathermoon Stronghold, who hunts the trail of Telmius Dreamseeker.",
  },
  greetings = {
    { id = "g_default", text = "Yes? If you have come about the ruins in the east, sit down. If not, I am rather busy." },
    { id = "g_2", when = { metBefore = true }, text = "You again. Good, for I have thought of three more things to ask you." },
    { id = "g_3", when = { questActive = TODO_QUEST("Elven Legends") }, text = "Have you been inside Eldre'Thalas yet? Tell me you have at least seen the gates." },
    { id = "g_4", when = { questDone = TODO_QUEST("Elven Legends") }, text = "So he died there, among the books. It is not the ending I hoped for, but it is an ending, and I thank you for it." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you may understand why the relics of one fugitive Highborne are worth ten years of my life." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "A tauren, on Sardor Isle! If Sage Korolusk has sent you to learn how far I have got, you may tell him that I am well ahead." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Scholar Runethorn. For ten years I have followed the trail of Telmius Dreamseeker, an elf who fled the fall of his homeland with relics older than he was, and that trail ends somewhere in the ruins the ogres call Dire Maul." },
        { id = "hello_2", when = { questBefore = TODO_QUEST("Elven Legends") }, text = "I believe that Telmius sought refuge in Eldre'Thalas, among the Highborne who lingered there. Someone must go into those halls and find what became of him, and the ogres will not let a scholar past the door." },
        { id = "hello_3", when = { questActive = TODO_QUEST("Elven Legends") }, text = "Search the halls for any sign of him: a journal, a pack, his bones if it comes to that. I need to know where the trail ends, even if the ending is a poor one." },
        { id = "hello_4", when = { questDone = TODO_QUEST("Elven Legends") }, text = "His remains, and nothing of what he carried. Then somebody reached him before we did, and I have a new question to lose ten years over." },
      },
      again = {
        { id = "hello_again1", text = "What else? Be precise, if you can." },
        { id = "hello_again2", text = "Go on. I answer questions better than I make small talk." },
      },
      choices = {
        { text = "Who was Telmius Dreamseeker?", next = "telmius" },
        { text = "You speak of Eldre'Thalas as though you'd seen it whole.", next = "city" },
        { text = "I hear a tauren sage is on the same trail.", next = "rival" },
        { text = "What relics did he carry?", next = "relics", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Why should a kaldorei care for a Highborne's fate?", next = "why", when = { race = "NightElf" } },
        { text = "I'll look for him in Dire Maul.", next = "BUSINESS" },
        { text = "Good hunting, Scholar.", next = "END" },
      },
    },
    telmius = {
      lines = {
        { id = "telmius_default", text = "He was an elven master of the eastern kingdom, learned and by every account insufferable. When the Scourge broke Quel'Thalas he took what he could carry and ran, west across the sea, which is the last place that anyone thought to look." },
      },
      choices = {
        { text = "Why run to Kalimdor?", next = "telmius_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    telmius_why = {
      lines = {
        { id = "telmius_why_default", text = "Because his people came from here, long ago, and he knew it. I think that he hoped the Highborne of Eldre'Thalas would take in a cousin, and I think that he did not ask himself what ten thousand years alone had made of them." },
      },
      choices = {
        { text = "What had it made of them?", next = "telmius_made" },
        { text = "Something else.", next = "BACK" },
      },
    },
    telmius_made = {
      lines = {
        { id = "telmius_made_default", text = "That is what I am sending you to find out. I will say only that those who fed on magic for that long are seldom generous with guests who arrive carrying more of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_default", text = "Only in the old accounts, and they are enough to break the heart. Eldre'Thalas had libraries where the whole of the old empire's learning was kept, and gardens that flowered in the dead of winter." },
      },
      choices = {
        { text = "And now the Gordunni hold it.", next = "city_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_ogres = {
      lines = {
        { id = "city_ogres_default", text = "The ogres hold the courts, and worse things hold the rest. Some here say that we should seal those ruins and forget them, since nothing good has ever come out of a Highborne hall." },
      },
      choices = {
        { text = "Seal it. Some doors are better left shut.", next = "BACK", reply = "That is what the Sentinels say, and they have ten thousand years of reasons. I only wish that their reasons did not cost us the library.", fx = { align = { order = 1 } } },
        { text = "Open it. Lost knowledge helps no one.", next = "BACK", reply = "Then you and I will get on. I would sooner be scorched by the truth than kept safe from it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rival = {
      lines = {
        { id = "rival_default", text = "Sage Korolusk, of Camp Mojache. We travelled together from the Burning Steppes to the sea, and he is the most patient creature I have ever met, which is extremely irritating in a rival." },
      },
      choices = {
        { text = "You sound fond of him.", next = "rival_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rival_fond = {
      lines = {
        { id = "rival_fond_default", text = "I am fond of his notes, which are excellent. Our peoples would have us sit on opposite shores and guard our findings, and so that is where we sit, like two children forbidden to share a book." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    relics = {
      lines = {
        { id = "relics_default", text = "The inventories from Quel'Thalas list three sealed cases and a staff, and they describe none of them, which tells me that the clerks were afraid to. Whatever they held, Telmius thought them worth abandoning his kingdom for." },
      },
      choices = {
        { text = "Then they're worth finding before someone worse does.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "Because they were ours before they were anyone's, and their folly is our history. A people that will not look at its own mistakes is merely waiting to make them again." },
      },
      choices = {
        { text = "Spoken like a true scholar.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "I know the eastern elves, the Highborne, and every league of one fugitive's road. Ask, and I shall try to be brief." } },
    background = { { id = "tp_background", text = "I am a scholar of Darnassus, on loan to the General until my search is done. She tolerates me because I am quiet and I pay for my own lamp oil." } },
    highborne = { { id = "tp_highborne", text = "Brilliant, and vain, and ours. I study them so that we need not repeat them." } },
    dire_maul = { { id = "tp_dire_maul", text = "Call it Eldre'Thalas, if you please. Dire Maul is what the ogres call it, and they also call a library a woodpile." } },
    _none = { { id = "tp_none", text = "I have no source for that, and I do not guess." } },
  },
}

---------------------------------------------------------------------------
-- Rockbiter (mountain giant south of the Ruins of Ravenwind: The Giant Guardian, Wandering Shay)
---------------------------------------------------------------------------
P:NPC {
  key = "rockbiter", id = TODO_NPC("Rockbiter"), name = "Rockbiter",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "feralas_wilds" }, temper = { "slow", "gentle" }, values = { "loyal", "patient" },
  notices = { "race", "kit" },
  impression = {
    first = "Rockbiter is a mountain giant who was set to watch over a small, wandering elf and takes the charge very seriously. He speaks slowly, as though each word had to be quarried first.",
    third = "{name} met the mountain giant Rockbiter, guardian of Shay Leafrunner, in northern Feralas.",
  },
  greetings = {
    { id = "g_default", text = "Small one comes to Rockbiter. Rockbiter will not step on you, so do not be afraid." },
    { id = "g_2", when = { metBefore = true }, text = "Rockbiter knows your face. It is hard for Rockbiter to tell small ones apart, but he remembers you." },
    { id = "g_3", when = { questActive = TODO_QUEST("Wandering Shay") }, text = "Have you found Shay? Rockbiter has looked, but Rockbiter is too big to look under things." },
    { id = "g_4", when = { questDone = TODO_QUEST("Wandering Shay") }, text = "Shay is back, and Rockbiter is happy. Rockbiter will watch better now." },
  },
  notice = {
    { id = "n_1", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "You are a very small one, even for a small one. Rockbiter will sit down, so that you need not shout." },
    { id = "n_2", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You wear a shell of iron, as the beetles do. Rockbiter thinks that is clever, for a soft creature." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Rockbiter. The elves asked Rockbiter to watch over Shay Leafrunner, because Shay wanders and does not look where she is going. Rockbiter watches, but Shay is small and quick, and Rockbiter is neither." },
        { id = "hello_2", when = { questActive = TODO_QUEST("The Giant Guardian") }, text = "The elves sent you to find Rockbiter, and here Rockbiter is. It is good that you came, because Rockbiter has lost Shay again." },
        { id = "hello_3", when = { questBefore = TODO_QUEST("Wandering Shay") }, text = "Shay has wandered off to the north, among the ruins where the bird women live. There is a bell in the chest beside Rockbiter, and when Shay hears her bell, she remembers to follow." },
        { id = "hello_4", when = { questDone = TODO_QUEST("Wandering Shay") }, text = "Shay sits by Rockbiter's foot now and counts flowers. Rockbiter does not move that foot, in case she forgets that it is there." },
      },
      again = {
        { id = "hello_again1", text = "What more does the small one ask?" },
        { id = "hello_again2", text = "Rockbiter is listening. Rockbiter is always listening, because it is easier than talking." },
      },
      choices = {
        { text = "Who is Shay Leafrunner?", next = "shay" },
        { text = "How does a giant come to guard an elf?", next = "guard" },
        { text = "You must have seen a great deal from up there.", next = "seen" },
        { text = "The stone of you is very old.", next = "old", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "How can I help you?", next = "BUSINESS" },
        { text = "Farewell, Rockbiter.", next = "END" },
      },
    },
    shay = {
      lines = {
        { id = "shay_default", text = "Shay is an elf who looks for plants. She sees a flower, and then another flower beyond it, and she follows the flowers until she is far away and has forgotten the way back." },
      },
      choices = {
        { text = "That sounds dangerous in Feralas.", next = "shay_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shay_danger = {
      lines = {
        { id = "shay_danger_default", text = "It is. The bird women would hurt her, and the ogres, and the big cats. Shay does not see them, because she is looking at the flowers, and so Rockbiter must see them for her." },
      },
      choices = {
        { text = "She's lucky to have you watching.", next = "shay_lucky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shay_lucky = {
      lines = {
        { id = "shay_lucky_default", text = "Rockbiter thinks it is Rockbiter who is lucky. Before Shay there was only standing, and the standing was very long and nobody talked." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = {
        { id = "guard_default", text = "The elves of the island came and asked. They were polite, and they did not throw anything, and so Rockbiter said yes. Rockbiter's kin in the south are not asked for things, because they are angry now and do not listen." },
      },
      choices = {
        { text = "Why are your kin angry?", next = "guard_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_kin = {
      lines = {
        { id = "guard_kin_default", text = "Rockbiter does not know. Something in the land hurts them, and they break what is near. Some small ones say the angry giants should be broken first, before they break more." },
      },
      choices = {
        { text = "They're suffering. Someone should find the cause and mend it.", next = "BACK", reply = "Rockbiter hopes a small one will. Rockbiter is too slow to find a hurt that hides in the ground.", fx = { align = { light = 1 } } },
        { text = "An angry giant is a danger. Put them down.", next = "BACK", reply = "Maybe that is so. Rockbiter will not help you do it, and Rockbiter will not stop you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = {
        { id = "seen_default", text = "Rockbiter has seen the trees grow from seeds to the size they are now. Rockbiter saw the elves build the white stones in the north, and saw the stones fall down, and the elves were sad both times." },
      },
      choices = {
        { text = "You watched Ravenwind fall?", next = "seen_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen_fall = {
      lines = {
        { id = "seen_fall_default", text = "The ground shook and the sea came in where there had been land. Rockbiter held on to a hill, and when the shaking stopped the hill was by the water. Rockbiter has not trusted the ground since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = {
        { id = "old_default", text = "Old as the hills, the elves say, and Rockbiter thinks that is right, because Rockbiter remembers when some of the hills were not there. You hear the stone, small one, and that is a rare thing." },
      },
      choices = {
        { text = "The stone remembers you kindly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "Rockbiter knows the hills, and where Shay likes to wander. That is not much, but it is true." } },
    background = { { id = "tp_background", text = "Rockbiter stood here a long time. Then the elves asked for help, and now Rockbiter stands here for a reason." } },
    _none = { { id = "tp_none", text = "Rockbiter does not know that. It is a small one's question, and Rockbiter is too big for it." } },
  },
}

---------------------------------------------------------------------------
-- Kylanna Windwhisper (Feathermoon, master alchemy trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "kylanna", id = TODO_NPC("Kylanna Windwhisper"), name = "Kylanna Windwhisper", title = "Master Alchemist",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "feathermoon" }, temper = { "exacting", "calm" }, values = { "craft", "careful" },
  notices = { "craft", "class" },
  impression = {
    first = "Kylanna Windwhisper teaches the highest alchemy the kaldorei will share, in a room that smells of crushed herbs and hot glass. She corrects a careless measure before the hand has finished pouring it.",
    third = "{name} met Kylanna Windwhisper, the master alchemist of Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Touch nothing on the lower shelf, I beg you, for it has not finished settling." },
    { id = "g_2", when = { metBefore = true }, text = "You return, and with all of your fingers. Then you heeded me about the lower shelf." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Alchemy" },
      text = "There are stains on your fingers that I recognise, and one that I do not. You must tell me what you were brewing when it happened." },
    { id = "n_2", cat = "craft", when = { profession = "Herbalism" },
      text = "You carry fresh-cut stems, and you cut them cleanly. Logannas will pay you well for those, and I shall have them from him by evening." },
    { id = "n_3", cat = "class", when = { class = "DRUID" },
      text = "A druid understands that a plant is more than its uses. I teach better to those who already know it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Kylanna Windwhisper, and I teach alchemy to those who have already learned patience elsewhere. Few masters of the craft will take students beyond a certain skill, and so they come to this isle from every corner of the Alliance." },
        { id = "hello_2", when = { profession = "Alchemy" }, text = "An alchemist, and far from home. Then you have come for what the city trainers could not show you, and we shall see whether you are ready for it." },
      },
      again = {
        { id = "hello_again1", text = "What else would you ask? Speak while the flask cools." },
        { id = "hello_again2", text = "Go on. I can spare you the length of one slow boil." },
        { id = "hello_again3", text = "I am listening, though my eyes must stay on this flame." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Why teach here, and not in Darnassus?", next = "here" },
        { text = "These herbs are not from Teldrassil.", next = "herbs" },
        { text = "An elixir could win a battle before it starts.", next = "power" },
        { text = "What is the hardest thing you brew?", next = "hardest", when = { profession = "Alchemy" } },
        { text = "Elune guide your hand, Kylanna.", next = "END" },
      },
    },
    here = {
      lines = {
        { id = "here_default", text = "Because the plants are here. Feralas grows sungrass, golden sansam and a dozen things that will not root anywhere else, and an alchemist who works far from her herbs is working with dead leaves." },
      },
      choices = {
        { text = "And the naga and ogres don't trouble you?", next = "here_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_trouble = {
      lines = {
        { id = "here_trouble_default", text = "They trouble the Sentinels, who trouble me for healing draughts by the crate. I count it a fair trade, since their bows are the reason I may gather in peace." },
      },
      choices = {
        { text = "How many crates in a season?", next = "here_crates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_crates = {
      lines = {
        { id = "here_crates_default", text = "More each year. Latronicus Moonspear sends for them before every sortie against the Hatecrest, and I have learned to judge how the war goes by how quickly my shelves empty." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "herbs_default", text = "You have a good eye. Logannas buys from every gatherer who lands at the dock, and I take the best of what he has before he sells the rest to travellers." },
      },
      choices = {
        { text = "What grows best in this forest?", next = "herbs_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_best = {
      lines = {
        { id = "herbs_best_default", text = "Sungrass, wherever the canopy breaks and lets the light through. It keeps its strength for weeks after cutting, which is more than I can say for anything that grows under the boughs of Teldrassil." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    power = {
      big = true,
      lines = {
        { id = "power_default", text = "It could, and that is the oldest temptation of my craft. A draught may make a soldier stronger, faster and deaf to pain for an hour, and afterwards it sends the reckoning." },
      },
      choices = {
        { text = "Then brew them. Soldiers' lives are worth the cost.", next = "BACK", reply = "So the commanders say, and I do brew them. I only ask that each one be told what she is drinking.", fx = { align = { order = -1 } } },
        { text = "Strength that's borrowed isn't strength. Use them sparingly.", next = "BACK", reply = "That is what I teach, and I am glad that someone else believes it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_default", text = "The flasks, which take a black lotus apiece and a week of watching. I have ruined four in my life, and I remember each of them as other people remember their griefs." },
      },
      choices = {
        { text = "I hope to ruin fewer.", next = "BACK", reply = "Then begin by expecting to ruin one. It will make you careful with all the rest." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I studied under the alchemists of Darnassus, and I came south with the General to brew for her Sentinels. The herbs here persuaded me to stay." } },
    advice = { { id = "tp_advice", text = "Measure twice, and then pour as though it were your last. One day it may be." } },
    elune = { { id = "tp_elune", text = "The moonwells taught us our first alchemy, long ago. I remember that whenever I am tempted to think the craft is mine." } },
    _none = { { id = "tp_none", text = "That is no matter of alchemy, and so I have nothing useful to say of it." } },
  },
}

---------------------------------------------------------------------------
-- Brannock (Feathermoon, fishing trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "brannock", id = TODO_NPC("Brannock"), name = "Brannock", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "feathermoon" }, temper = { "easygoing", "wry" }, values = { "patient", "nature" },
  notices = { "craft", "race" },
  impression = {
    first = "Brannock teaches fishing off the Feathermoon dock and seems entirely content never to do anything else. He measures other people's catches with his eyes and says nothing, which is somehow worse.",
    third = "{name} met Brannock, the fishing trainer of Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Quietly, friend, and mind your shadow on the water. The fish here have learned to fear anything that moves." },
    { id = "g_2", when = { metBefore = true }, text = "Back to the dock, are you? Sit, then. There is room on this plank for two, if neither of us talks too much." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a rod, and you carry it properly, tip down and line dry. I can teach someone who has already learned that much." },
    { id = "n_2", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf with a fishing line is a patient dwarf, and I have met only two. Sit down, and you shall be the third." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Brannock, and I teach the line and the hook to anyone on this isle with the patience for it. The Sentinels come to me when the watch has frayed their nerves, and they leave calmer, and now and then with a fish." },
        { id = "hello_2", when = { profession = "Fishing" }, text = "Another angler! Then you already know that the fish are not really the point, and I shall waste no breath explaining it." },
      },
      again = {
        { id = "hello_again1", text = "Something more? Speak softly, for I have a bite coming." },
        { id = "hello_again2", text = "Ask, while I let this one run." },
        { id = "hello_again3", text = "I am listening. So are the fish, sadly." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "What bites off this dock?", next = "bites" },
        { text = "The naga must ruin the fishing.", next = "naga" },
        { text = "Fishing looks like idleness with a stick.", next = "idle" },
        { text = "Is there anything rare in these waters?", next = "rare", when = { profession = { "Fishing", "Cooking" } } },
        { text = "May your line stay tight, Brannock.", next = "END" },
      },
    },
    bites = {
      lines = {
        { id = "bites_default", text = "Bream and mackerel in the shallows, and redgill where the bottom falls away. In the deep channel you will find things that pull back hard enough to take a careless angler in with them." },
      },
      choices = {
        { text = "Have you ever been pulled in?", next = "bites_pulled" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bites_pulled = {
      lines = {
        { id = "bites_pulled_default", text = "Once, by something that I never saw. I let go of the rod, which shamed me, and then Harklane sold me a new one, which shamed me more." },
      },
      choices = {
        { text = "What do you think it was?", next = "bites_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bites_what = {
      lines = {
        { id = "bites_what_default", text = "The Sentinels say a thresher, and Harklane says my own clumsiness. I prefer to think that it was the oldest fish in the sea, and that it is still down there wearing my hook." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = {
        { id = "naga_default", text = "Less than you would think. They take what they want from the deep water and leave the shallows to us, and I have even seen one watch my float for a while as a cat watches a string." },
      },
      choices = {
        { text = "You sound almost fond of them.", next = "naga_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_fond = {
      lines = {
        { id = "naga_fond_default", text = "I would not go so far, for they have killed friends of mine. But I share a sea with them every day, and it is hard to hate a neighbour quite as fiercely as the soldiers hate an enemy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    idle = {
      big = true,
      lines = {
        { id = "idle_default", text = "So Latronicus tells me, each time he finds one of his archers on my dock. I tell him that a Sentinel who has sat still for an hour shoots straighter than one who has paced a wall all night." },
      },
      choices = {
        { text = "He's right. A soldier's place is on the wall.", next = "BACK", reply = "Then you will get on well with him. I shall keep a plank free for you, all the same, for the day you change your mind.", fx = { align = { order = 1 } } },
        { text = "You're right. Rest makes better soldiers than drilling does.", next = "BACK", reply = "I think so, and so do the ones who come back to me. Sit a while yourself, and see.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rare = {
      lines = {
        { id = "rare_default", text = "Stonescale eels, on a dark night when the tide is turning. Kylanna Windwhisper pays well for their oil, and she will tell you exactly how many she needs and how fresh they must be." },
      },
      choices = {
        { text = "I'll watch for a dark night.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I have fished these waters since the stronghold was built, and other waters for a long while before that. It is the only craft I know that rewards doing less." } },
    advice = { { id = "tp_advice", text = "When the float goes under, count to two before you pull. Most folk lose the fish by wanting it too soon." } },
    rumors = { { id = "tp_rumors", text = "Harklane says that the naga have been quiet. I say the fish have been quiet too, and the two things are never unrelated." } },
    _none = { { id = "tp_none", text = "I could not say. It is not the sort of thing that comes up on a dock." } },
  },
}

---------------------------------------------------------------------------
-- Mardrack (Feathermoon, food and drink)
---------------------------------------------------------------------------
P:NPC {
  key = "mardrack", id = TODO_NPC("Mardrack"), name = "Mardrack", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "warm", "busy" }, values = { "kind", "practical" },
  notices = { "hunger", "race" },
  impression = {
    first = "Mardrack bakes the bread of Feathermoon Stronghold and judges every arrival by how recently they have eaten. He believes that most quarrels on the isle begin on an empty stomach.",
    third = "{name} met Mardrack, who sells food and drink at Feathermoon Stronghold.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome. You have crossed the water, and so you are hungry, and so you have come to the right door." },
    { id = "g_2", when = { metBefore = true }, text = "Back again! The loaves have just come out, and you have Elune's own timing." },
  },
  notice = {
    { id = "n_1", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You look as though Feralas has been chewing on you. Sit down and let me return the favour with something warm." },
    { id = "n_2", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You will be wanting something heavier than kaldorei fare, I know. I keep a dark loaf for our allies, and they have yet to send one back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Mardrack, and I bake for the stronghold. The Sentinels would live on dried fruit and duty if they were left to themselves, and so somebody must see that they eat a proper meal." },
        { id = "hello_2", when = { race = "NightElf" }, text = "Ishnu-alah, {g:brother|sister}. I bake with rice flour and moonberries, in the old way, and it will taste of home to you." },
      },
      again = {
        { id = "hello_again1", text = "What else may I tell you? The next batch needs a little while yet." },
        { id = "hello_again2", text = "Ask, friend. An oven teaches a baker to wait." },
        { id = "hello_again3", text = "Yes? Speak up over the crackling." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Where does an island get its flour?", next = "flour" },
        { text = "Who eats the most on this isle?", next = "eats" },
        { text = "Soldiers should eat plainly. Comfort makes them soft.", next = "plain" },
        { text = "How do you keep bread from going damp here?", next = "damp", when = { profession = "Cooking" } },
        { text = "Thank you, Mardrack.", next = "END" },
      },
    },
    flour = {
      lines = {
        { id = "flour_default", text = "It comes by boat from Darkshore when the weather allows, and when it does not I grind dried rice from our own stores. The sea decides what the stronghold eats, far more than I do." },
      },
      choices = {
        { text = "And when the boats don't come at all?", next = "flour_none" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flour_none = {
      lines = {
        { id = "flour_none_default", text = "Then Harklane catches more fish, and I bake less bread, and the Sentinels complain to me rather than to the General. I think that is the truest service I do her." },
      },
      choices = {
        { text = "She's fortunate in her baker.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eats = {
      lines = {
        { id = "eats_default", text = "The hippogryphs, if you count them, for Fyldren takes a basket of fish heads from Harklane every dawn. Among the people it is Pratt McGrubben, who eats like the human he is and praises every bite." },
      },
      choices = {
        { text = "And who eats the least?", next = "eats_least" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eats_least = {
      lines = {
        { id = "eats_least_default", text = "Shandris Feathermoon. I send a tray to her quarters each evening, and most evenings it comes back with only the bread gone. She is not a commander who sits down gladly." },
      },
      choices = {
        { text = "Do you keep sending it anyway?", next = "eats_send" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eats_send = {
      lines = {
        { id = "eats_send_default", text = "Every evening, and I always shall. One night she will be hungry, and I would not have it said that Mardrack's tray was missing on the night it was wanted." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      big = true,
      lines = {
        { id = "plain_default", text = "Some of the older Sentinels say the same, and they eat my honeyed bread while they say it. A warm meal reminds a soldier that there is something behind the wall worth guarding." },
      },
      choices = {
        { text = "Comfort is worth fighting for. Feed them well.", next = "BACK", reply = "I think so, and I shall go on thinking so with a clear conscience.", fx = { align = { light = 1 } } },
        { text = "Hardship keeps them sharp. Give them less.", next = "BACK", reply = "Then you may tell them so yourself, friend. I shall stand well back while you do it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp = {
      lines = {
        { id = "damp_default", text = "I keep the loaves in cedar boxes with a twist of dried kelp in each, and I bake small and often. A large loaf in this air is a sponge by nightfall." },
      },
      choices = {
        { text = "Small and often. I'll remember that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I baked in Auberdine before I baked here. The General's expedition needed a cook who did not mind boats, and I minded them less than most." } },
    advice = { { id = "tp_advice", text = "Eat before you cross to the mainland, and not after. The forest does not wait for anyone to digest." } },
    sentinels = { { id = "tp_sentinels", text = "They are the finest soldiers I know and the worst eaters. I have made my peace with both halves of that." } },
    _none = { { id = "tp_none", text = "I do not know, friend. If it can be baked, I can tell you about it." } },
  },
}

---------------------------------------------------------------------------
-- Hahrana Ironhide (Camp Mojache, master leatherworking trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "hahrana", id = TODO_NPC("Hahrana Ironhide"), name = "Hahrana Ironhide", title = "Master Leatherworker",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "mojache" }, temper = { "steady", "proud" }, values = { "craft", "honor" },
  notices = { "craft", "class" },
  impression = {
    first = "Hahrana Ironhide teaches the last and hardest lessons of leatherworking at Camp Mojache. She handles every hide as though the beast might still be asked for its opinion.",
    third = "{name} met Hahrana Ironhide, the master leatherworker of Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "The hides are stretched and the sun is kind today. Come, and tell me what your hands have learned." },
    { id = "g_2", when = { metBefore = true }, text = "You return. Show me your stitching, and I will know how you have spent your days." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Leatherworking" },
      text = "I see the callus on your thumb where the awl sits. You have worked many hides, though I think not yet enough." },
    { id = "n_2", cat = "craft", when = { profession = "Skinning" },
      text = "Your knife is clean, and your cuts will be the same. Kulleg Stonehorn would be glad of an hour with someone who skins so carefully." },
    { id = "n_3", cat = "class", when = { class = "HUNTER" },
      text = "A hunter knows where the leather comes from, and has looked it in the eye. That makes a more honest crafter than most." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Hahrana Ironhide. The crafters of Thunder Bluff send their best students down the long road to me, and I teach them what a hide can become when it is not hurried." },
        { id = "hello_2", when = { profession = "Leatherworking" }, text = "A leatherworker, and you have walked a long way to stand at my frames. Then you are ready to learn that everything you were taught before was only the beginning." },
        { id = "hello_3", when = { faction = "Alliance" }, text = "You are not of the Horde, and I do not teach you. But a crafter may speak to a crafter, so ask what you wish to ask." },
      },
      again = {
        { id = "hello_again1", text = "There is more? Speak while I oil this strap." },
        { id = "hello_again2", text = "Ask. The hide will not finish drying any sooner for my watching it." },
        { id = "hello_again3", text = "I am listening. The Earth Mother gave us two ears and only one mouth for a reason." },
      },
      choices = {
        { text = "Teach me your craft.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why teach here, so far from Thunder Bluff?", next = "here" },
        { text = "Those are yeti hides on your frames.", next = "yeti" },
        { text = "A hide is a hide. The beast is past caring.", next = "respect" },
        { text = "What is the hardest hide to work?", next = "hardest", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    here = {
      lines = {
        { id = "here_default", text = "Because the beasts are here. Feralas has yetis in the caves and great cats in the forest, and hippogryphs whose hides I will not touch, and a master should live beside her materials." },
      },
      choices = {
        { text = "Why not the hippogryph hides?", next = "here_hippo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_hippo = {
      lines = {
        { id = "here_hippo_default", text = "The night elves across the water love them as we love our kodo. We are not at peace with them, but I will not skin an enemy's kin and wear it, for there is no honour in that." },
      },
      choices = {
        { text = "Not everyone in camp would agree.", next = "here_agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_agree = {
      lines = {
        { id = "here_agree_default", text = "No. Rok Orhan has said that a hide is a hide, and she is free to find another crafter. In this, I answer to the Earth Mother before I answer to her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yeti = {
      lines = {
        { id = "yeti_default", text = "They are. Jangdor Swiftstrider sends hunters to the Rage Scar caves for them, and the best come to my frames. A yeti's hide is thick and warm, and it fights the needle at every stitch." },
      },
      choices = {
        { text = "What do you make from them?", next = "yeti_make" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeti_make = {
      lines = {
        { id = "yeti_make_default", text = "Cloaks and winter leggings for the braves who watch the hills at night. A brave who is warm stays awake, and a brave who is awake sees the Gordunni before they reach the palisade." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    respect = {
      big = true,
      lines = {
        { id = "respect_default", text = "That is what the hurried ones say. I say that the beast gave its life, whether it wished to or not, and that careless work throws the gift into the dust." },
      },
      choices = {
        { text = "Then honour it. Waste nothing and work it well.", next = "BACK", reply = "That is the whole of my teaching, in one breath. The rest is only stitches.", fx = { align = { honor = 1 } } },
        { text = "It's leather. Thanks and prayers don't make it stronger.", next = "BACK", reply = "Perhaps not. But the crafter who gives thanks works with more care, and care does make it stronger.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_default", text = "Devilsaur, from the crater to the south. It is thick as a shield and it remembers being angry, and I have broken three good awls on a single pair of gauntlets." },
      },
      choices = {
        { text = "I'll bring spare awls.", next = "BACK", reply = "Bring five. And bring patience, for it breaks sooner than the awls do." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I learned at my mother's frames in Mulgore, and she learned at hers. The Ironhide name was earned a stitch at a time." } },
    advice = { { id = "tp_advice", text = "Wet the thread before you pull it tight. Dry thread cuts the hide that it is meant to hold." } },
    earth_mother = { { id = "tp_earth_mother", text = "She gives the beast, and the beast gives the hide. I am only the last pair of hands in a long line of giving." } },
    _none = { { id = "tp_none", text = "That I do not know. Ask me of hides, and I will keep you until dark." } },
  },
}

---------------------------------------------------------------------------
-- Cawind Trueaim (Camp Mojache, gunsmith and bowyer)
---------------------------------------------------------------------------
P:NPC {
  key = "cawind", id = TODO_NPC("Cawind Trueaim"), name = "Cawind Trueaim", title = "Gunsmith & Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "quiet", "dry" }, values = { "craft", "patient" },
  notices = { "class", "kit" },
  impression = {
    first = "Cawind Trueaim sells bows and rifles at Camp Mojache and plainly prefers the bows. He strings each one himself before he lets it leave his rack.",
    third = "{name} met Cawind Trueaim, the gunsmith and bowyer of Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Bows on the left, rifles on the right. The arrows are fresh, and the powder is dry, which was not easy." },
    { id = "g_2", when = { metBefore = true }, text = "You are back. Did the string hold? Good; I thought that it would." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "You watch the treeline even while you speak to me. That is a hunter's habit, and it will keep you alive in this forest." },
    { id = "n_2", cat = "kit", when = { class = { "WARRIOR", "ROGUE" } },
      text = "You fight close. Carry something that reaches all the same, for the Gordunni throw boulders and do not wait for you to arrive." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Cawind Trueaim. I make the bows and I trade for the rifles, and the braves of this camp put both to use. A tauren's arms were made for the longbow, though I will sell you thunder in a tube if you ask." },
        { id = "hello_2", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter of the Horde. Take a bow from the rack and draw it, and let us see whether your arms are a match for your eyes." },
        { id = "hello_3", when = { faction = "Alliance" }, text = "I do not sell to the Alliance. You may look at the rack, if you keep your hands at your sides." },
      },
      again = {
        { id = "hello_again1", text = "More? Ask while I wax this string." },
        { id = "hello_again2", text = "Speak. Arrows do not fletch themselves, but they can wait." },
        { id = "hello_again3", text = "I am listening. A bowyer learns to." },
      },
      choices = {
        { text = "Show me your bows and guns.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "You sound as though you don't care for rifles.", next = "rifles" },
        { text = "What wood makes a good bow in Feralas?", next = "wood" },
        { text = "A rifle kills from further off. That's all that matters.", next = "matters" },
        { text = "What would you hunt here, in my place?", next = "hunt", when = { class = "HUNTER" } },
        { text = "May your aim be true, Cawind.", next = "END" },
      },
    },
    rifles = {
      lines = {
        { id = "rifles_default", text = "They are loud, and they frighten every beast within a day's walk. The orcs love them, and Krueg Skullsplitter would marry his if the shamans allowed it. I sell them, and I keep my own opinion." },
      },
      choices = {
        { text = "Where do the rifles come from?", next = "rifles_from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifles_from = {
      lines = {
        { id = "rifles_from_default", text = "From Orgrimmar, by the long road, and the goblin Orwin Gizzmick mends what breaks on the way. He tells me that my bows are a thousand years behind the times, and I tell him that they have never once blown up." },
      },
      choices = {
        { text = "Has one of his?", next = "rifles_blown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifles_blown = {
      lines = {
        { id = "rifles_blown_default", text = "Twice, that I have seen. He was pleased both times, because he said that he had learned something. Goblins are a strange people." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = {
        { id = "wood_default", text = "The old yew on the high ground west of camp. I ask the tree, as Tarhus taught me to, and I take one limb in a season and no more than that." },
      },
      choices = {
        { text = "One limb makes how many bows?", next = "wood_many" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_many = {
      lines = {
        { id = "wood_many_default", text = "Two, if the grain runs true, and the rest goes to arrow shafts. Nothing is burned. A bow made from a tree that was asked will not crack in the cold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    matters = {
      big = true,
      lines = {
        { id = "matters_default", text = "That is the orc's argument, and it is not a foolish one. But a rifle tells every ogre in the hills where you are standing, and a bow tells only the one it strikes." },
      },
      choices = {
        { text = "Quiet and patient wins. I'd take the bow.", next = "BACK", reply = "Then you hunt like a tauren, whatever you are. The rack is behind you.", fx = { align = { order = 1 } } },
        { text = "Loud and fast wins. Give me the rifle.", next = "BACK", reply = "Krueg will be glad to hear it. Keep your powder dry, and do not hunt near me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = {
        { id = "hunt_default", text = "The big cats, at dusk, when they come down to the Verdantis to drink. Take one shot only, and make it clean, for a wounded cat in this forest does not run away from you." },
      },
      choices = {
        { text = "One clean shot. I'll remember.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I made bows for the hunters of Mulgore before the camp was raised. When the braves came to Feralas, they asked for someone who knew wood." } },
    advice = { { id = "tp_advice", text = "Unstring your bow when the rain comes. A bow left strung in this damp is firewood by morning." } },
    grimtotem = { { id = "tp_grimtotem", text = "They buy no bows from me, and I would not sell them one. I have seen what they hunt." } },
    _none = { { id = "tp_none", text = "I do not know. Ask me about a bow, and I will have more to say." } },
  },
}

---------------------------------------------------------------------------
-- Bronk (Camp Mojache, alchemy supplies)
---------------------------------------------------------------------------
P:NPC {
  key = "bronk", id = TODO_NPC("Bronk"), name = "Bronk", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "cheerful", "fussy" }, values = { "craft", "curious" },
  notices = { "craft", "class" },
  impression = {
    first = "Bronk sells vials and herbs at Camp Mojache and sniffs each bundle twice before he will part with it. He complains happily that the forest gives him more than he can ever sell.",
    third = "{name} met Bronk, who sells alchemy supplies at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Vials, herbs and clean water! Come and smell the sungrass, friend, for it was cut only this morning." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, you are back. Did the last batch come out clear? Tell me that it came out clear." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! I can tell by your sleeves, which are burned in the same places as mine." },
    { id = "n_2", cat = "craft", when = { profession = "Herbalism" },
      text = "You have been gathering, and I can smell golden sansam on you. If you have more than you need, friend, I am buying." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Bronk, and I keep the camp's alchemists in vials and leaves. Feralas is the richest forest I have ever stood in, and I mean to learn the name and the use of everything that grows in it." },
        { id = "hello_2", when = { faction = "Alliance" }, text = "You are no friend of this camp, and I may not sell to you. Still, you may smell the sungrass if you like, since a smell costs nothing." },
      },
      again = {
        { id = "hello_again1", text = "What else? Ask quickly, for the mash wants stirring." },
        { id = "hello_again2", text = "Go on, friend. I talk better with my hands busy." },
        { id = "hello_again3", text = "Yes? There is always time for one more question." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Who gathers all of this for you?", next = "gather" },
        { text = "You keep one basket well apart from the rest.", next = "basket" },
        { text = "A strong potion matters more than a careful one.", next = "strong" },
        { text = "Which herb here is worth the most trouble?", next = "worth", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "May your vials never crack, Bronk.", next = "END" },
      },
    },
    gather = {
      lines = {
        { id = "gather_default", text = "Ruw brings the best of it, for she teaches the herb-gatherers and will not have her students sell me bruised stems. Tarhus brings some too, though he picks as if each leaf were a favour." },
      },
      choices = {
        { text = "You'd rather he picked more.", next = "gather_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather_more = {
      lines = {
        { id = "gather_more_default", text = "I would! But he says the forest must be asked, and I have noticed that his sungrass keeps twice as long as anyone else's. So perhaps the forest prefers his manners to mine." },
      },
      choices = {
        { text = "Maybe you should try asking.", next = "BACK", reply = "I did, once. I felt very foolish, and the bush said nothing, but it was a good harvest, so who can say?" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basket = {
      lines = {
        { id = "basket_default", text = "That one is for Witch Doctor Uzer'i. He orders roots that I do not sell to anyone else, and they do not smell like things that ought to be put in a body." },
      },
      choices = {
        { text = "What does he do with them?", next = "basket_uzeri" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basket_uzeri = {
      lines = {
        { id = "basket_uzeri_default", text = "He says that he makes vessels for spirits, and I have chosen not to ask the second question. He pays in good coin and he has never harmed anyone in camp, and that is as far as my curiosity cares to walk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    strong = {
      big = true,
      lines = {
        { id = "strong_default", text = "The orcs tell me so, and they drink whatever I hand them without sniffing it first. But a strong potion made carelessly is only a quick way to be sick in the middle of a battle." },
      },
      choices = {
        { text = "Careful work first. Strength follows from it.", next = "BACK", reply = "Exactly so! I shall tell Krueg that somebody agrees with me, though he will not believe it.", fx = { align = { order = 1 } } },
        { text = "In a fight you need power now, not perfection.", next = "BACK", reply = "Then drink fast, friend, and do not blame me for what follows.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth = {
      lines = {
        { id = "worth_default", text = "Golden sansam, which grows low in the wet places where the ogres like to walk. You must go where they go to find it, and so you must be quicker than they are, which is not difficult, or quieter, which is." },
      },
      choices = {
        { text = "Quieter than an ogre. I can manage that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I learned my leaves from the alchemists of Thunder Bluff. When the camp was raised, I begged to be sent, because I had heard what grows here." } },
    advice = { { id = "tp_advice", text = "Smell every herb before you buy it, even from me. A good seller will not be offended." } },
    earth_mother = { { id = "tp_earth_mother", text = "She has put a remedy beside every harm, if we are patient enough to look for it. That is what my craft believes." } },
    _none = { { id = "tp_none", text = "I cannot say, friend. If it grew in the ground, I might know it." } },
  },
}

---------------------------------------------------------------------------
-- Thyssiana (Thalanaar, hippogryph master)
---------------------------------------------------------------------------
P:NPC {
  key = "thyssiana", id = TODO_NPC("Thyssiana"), name = "Thyssiana", title = "Hippogryph Master",
  bible = "bibles/more_folk.md", role = "flightmaster", tier = "service",
  communities = { "thalanaar" }, temper = { "watchful", "quiet" }, values = { "duty", "nature" },
  notices = { "race", "form" },
  impression = {
    first = "Thyssiana keeps the hippogryphs at the little post of Thalanaar, where the forest ends and the dust begins. She watches the eastern sky more often than she watches whoever is speaking to her.",
    third = "{name} met Thyssiana, the hippogryph master of Thalanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveler. The hippogryphs are rested, and the wind is from the west, which is the kind one." },
    { id = "g_2", when = { metBefore = true }, text = "You come this way again. The birds know your step, and they did not raise their crests." },
  },
  notice = {
    { id = "n_1", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You will have come up from the Needles, by the dust on you. Drink something before you fly, for the birds dislike a rider who faints." },
    { id = "n_2", cat = "form", when = { class = "DRUID" },
      text = "A druid with wings of your own, perhaps, one day. Until then mine will carry you, and they will know what you are." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Thyssiana, and these are Thalanaar's hippogryphs. This is the last roost before the Thousand Needles, and so every message between Feathermoon and the east passes under my hands." },
        { id = "hello_2", when = { faction = "Horde" }, text = "You are of the Horde, and my birds will not carry you. Falfindel permits no bloodshed at this post, so say what you came to say and go on." },
      },
      again = {
        { id = "hello_again1", text = "What else? I can listen while I watch the sky." },
        { id = "hello_again2", text = "Ask, then. The birds are in no hurry today." },
        { id = "hello_again3", text = "Speak. Thalanaar is quiet, and I do not mind a voice in it." },
      },
      choices = {
        { text = "I need to fly.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "What do you watch for in the east?", next = "east" },
        { text = "Your birds seem uneasy at the forest's edge.", next = "uneasy" },
        { text = "A post this small can't be worth holding.", next = "worth" },
        { text = "How long have you kept this roost?", next = "long", when = { race = "NightElf" } },
        { text = "Fair winds, Thyssiana.", next = "END" },
      },
    },
    east = {
      lines = {
        { id = "east_default", text = "Dust, mostly, for it tells me who is moving in the Needles. A thin plume is a courier, a wide one is a centaur band, and a dark one is something burning." },
      },
      choices = {
        { text = "And what does today's sky tell you?", next = "east_today" },
        { text = "Something else.", next = "BACK" },
      },
    },
    east_today = {
      lines = {
        { id = "east_today_default", text = "That the centaur are riding south, and that nobody is burning anything, which makes it a good day. I send word to Falfindel each dusk, and he writes it down, and that is how a quiet post keeps its watch." },
      },
      choices = {
        { text = "Has there ever been a bad day?", next = "east_bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    east_bad = {
      lines = {
        { id = "east_bad_default", text = "Last season there were three dark plumes in one afternoon, off toward the Grimtotem cliffs. I sent a bird to Feathermoon, and for a week the Sentinels here slept with their bows strung." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    uneasy = {
      lines = {
        { id = "uneasy_default", text = "They are forest creatures, and here the forest stops as if it had been cut with a blade. They will fly over the Needles readily enough, but they do not like to roost in sight of so much bare stone." },
      },
      choices = {
        { text = "How do you settle them?", next = "uneasy_settle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uneasy_settle = {
      lines = {
        { id = "uneasy_settle_default", text = "I turn their perches to face west, toward the trees, and I sing to them at dusk as their mothers did. It is a small deceit, and they forgive me for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    worth = {
      big = true,
      lines = {
        { id = "worth_default", text = "Others have said so, in Darnassus, where the maps are small and the roads look short. Without this roost a courier from Feathermoon would walk six days through ogres to reach the Needles." },
      },
      choices = {
        { text = "Then hold it. Every road needs its last lamp.", next = "BACK", reply = "That is well said, and I shall tell Falfindel, who will write that down as well.", fx = { align = { order = 1 } } },
        { text = "Six Sentinels here are six fewer on the walls.", next = "BACK", reply = "So the argument runs. I hope that those who make it never need a message carried in a hurry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    long = {
      lines = {
        { id = "long_default", text = "Since the General first sent couriers east, and that is long enough for three of these birds to have hatched under my hands. I have not seen Darnassus in all that time, and I find that I do not miss it." },
      },
      choices = {
        { text = "The birds are home enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I am a keeper of hippogryphs, as my mother was in Ashenvale. The General asked for someone who would not mind the quiet." } },
    advice = { { id = "tp_advice", text = "If you ride east from here, carry twice the water that you think you need. The Needles give none." } },
    grimtotem = { { id = "tp_grimtotem", text = "They hold the cliffs to the west and they watch us as I watch them. So far, watching has been enough." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Falfindel, for the couriers tell him everything." } },
  },
}
