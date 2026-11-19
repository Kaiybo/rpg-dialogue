-- Shindrell Swiftfire, Sentinel huntress in Astranaar (0.72.0). Voice: bibles/shindrell.md
-- Classic: Journey to Astranaar (turn-in), The Zoram Strand, Pridewings of Stonetalon, Kayneth Stillwind.
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shindrell", id = TODO_NPC("Shindrell Swiftfire"), name = "Shindrell Swiftfire",
  bible = "bibles/shindrell.md", role = "soldier", tier = "quest",
  communities = { "astranaar" }, temper = { "keen", "dutiful" }, values = { "duty", "protective" },
  notices = { "pet", "soldier" },
  impression = {
    first = "She gives orders she doesn't enjoy and says so, which I respect.",
    third = "{name} met Shindrell Swiftfire, a Sentinel huntress of Astranaar who watches Ashenvale's coast and the Horde's quiet advances.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to Astranaar. Ashenvale is still beautiful, but it is not the peaceful place it once was." },
    { id = "g_zoram", when = { questActive = TODO_QUEST("The Zoram Strand") }, text = "The naga on the Zoram Strand grow bolder every week. Thin them, and bring me proof." },
    { id = "g_venom", when = { questActive = TODO_QUEST("Pridewings of Stonetalon") }, text = "The pridewings nest around Mirkfallon Lake in Stonetalon. Every venom sac you take is one less for an orc's blade." },
    { id = "g_kayneth", when = { questActive = TODO_QUEST("Kayneth Stillwind") }, text = "My report is for Kayneth's eyes, at Forest Song in the east. He'll want it quickly." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}. The coast has been quiet, which means only that I haven't heard the bad news yet." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You came to Astranaar green, and now you look like someone the Sentinels would be glad to have. I mean that." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word in town is you've been throwing your weight about. Save it for the Horde, {class}; Astranaar has enemies enough." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "{pet} moves well, and keeps close to you without being told. That is a well-trained companion, hunter, and I'd know." },
    { id = "n_horde", cat = "soldier", when = { honorKills = { min = 50 } },
      text = "You have been fighting the Horde, I can see it in how you watch the road. Good, but remember we are not at open war, however it feels." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The Circle's druids walk into Splintertree and out again, treating the orcs like one more flock of strays to tend. I have my own answer, but you've seen them at work, so tell me yours first." },
      },
      choices = {
        { text = "Yes. Someone has to speak for the forest itself.", next = "op_r1", fx = { affinity = -1, align = { order = 1 }, opinion = { cenarion_circle = "respect" } } },
        { text = "No. Staying neutral while trees fall is taking a side.", next = "op_r2", fx = { affinity = 1, align = { order = -1 }, opinion = { cenarion_circle = "distrust" } } },
        { text = "Their neutrality keeps Moonglade open to everyone. That matters.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { cenarion_circle = "useful" } } },
        { text = "I'm of the Circle, Sentinel. We choose balance, not sides.", next = "op_r4", fx = { trait = { stern = 1 }, opinion = { cenarion_circle = "loyal" } }, when = { class = "DRUID" } },
        { text = "I'll leave that to the druids.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "The forest is bleeding, and the Circle is taking notes. I'll grant that they mean well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Thank you. Say that in Nighthaven some day and watch the druids stroke their beards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Maybe so, though I'd trade Moonglade's courtesy for a dozen more archers on the Zoram Strand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then balance this for me, {class}: the orcs took three groves last month, and we took none back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shindrell Swiftfire of the Sentinels. I watch our coast and the forests around Astranaar, and I send what I learn to those who can act on it." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to Astranaar") },
          text = "You're here to offer your services to the Alliance? We welcome the aid, whoever sent you, because Ashenvale needs hands more than introductions." },
        { id = "h_zoram_before", when = { questBefore = TODO_QUEST("The Zoram Strand") },
          text = "Naga have come up onto the Zoram Strand in the northwest, among the old drowned ruins, and they show no sign of leaving. I want them pushed back into the sea before they find a way inland." },
        { id = "h_venom_before", when = { questBefore = TODO_QUEST("Pridewings of Stonetalon") },
          text = "We are not in open war with the Horde, but our peace is fragile. Word from Theramore says orc assassins take venom from the pridewings of Stonetalon for their blades, and if it's true, we must deny it to them." },
        { id = "h_venom_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Pridewings of Stonetalon"), days = 3 } },
          text = "Thank you. It saddens me to order the slaughter of creatures that may never have chosen a side, but it is my duty, and now our people are safer from that poison." },
        { id = "h_kayneth_before", when = { questBefore = TODO_QUEST("Kayneth Stillwind"), minLevel = 25 },
          text = "The druid Kayneth Stillwind has asked me for a report of all that's happening on our coast and in our forests. He fears a corruption is moving through Ashenvale, and he may be right." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Then you'll understand that my work is mostly watching and waiting, and very little of it is shooting." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You are a long way from your lines, and this is not a town that welcomes the Horde. State your business quickly, and then go." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Ask while I have a moment." },
        { id = "h_again2", text = "Go on. The scouts won't be back for an hour." },
      },
      choices = {
        { text = "Is the Cenarion Circle right to stay neutral?", next = "op_ask" },
        { text = "Why are the naga on the Zoram Strand?", next = "naga" },
        { text = "Are we at war with the Horde or not?", next = "horde" },
        { text = "Some in Astranaar want open war with the Warsong.", next = "restraint" },
        { text = "I don't know this Kayneth Stillwind.", next = "kayneth", when = { minLevel = 25 } },
        { text = "You don't like ordering the pridewings killed.", next = "pridewings", when = { any = { { questActive = TODO_QUEST("Pridewings of Stonetalon") }, { questDone = TODO_QUEST("Pridewings of Stonetalon") } } } },
        { text = "I'm kaldorei too. How bad is it, between the two of us?", next = "sister", when = { race = "NightElf", class = { "HUNTER", "WARRIOR", "ROGUE" } } },
        { text = "What work do you have?", next = "BUSINESS" },
        { text = "Elune guide you, Sentinel.", next = "END" },
      },
    },

    naga = {
      lines = {
        { id = "na_default", text = "The strand was a city of ours once, before the Sundering drowned it, and the naga seem drawn to it. They've built camps among the ruins and attack anyone who comes along the shore." },
      },
      choices = {
        { text = "What do they want with old ruins?", next = "naga_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_want = {
      lines = {
        { id = "nw_default", text = "I don't know, and I like not knowing even less than I like the naga. There's a deep place under the strand that the Horde's scouts have been poking at too, and Darnassus must learn its secrets before they do." },
      },
      choices = {
        { text = "So the Horde are there as well.", next = "naga_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_horde = {
      big = true,
      lines = {
        { id = "nh_default", text = "That's Zoram'gar, a little outpost on the strand, mostly trolls. They fight the naga as we do, which makes them neither friends nor quite enemies, and I don't know what to call that." },
      },
      choices = {
        { text = "An enemy of my enemy is still an enemy.", next = "BACK", reply = "You speak as many Sentinels speak, and I can't fault you for it. Still, I'll be glad of any blade the naga have to face that isn't mine.", fx = { align = { order = 1 } } },
        { text = "If they fight the naga, let them be.", next = "BACK", reply = "That's my own leaning, most days, though I'd not say it too loudly in Astranaar. Let the naga have two enemies instead of one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horde = {
      lines = {
        { id = "ho_default", text = "Not open war, no, and the Warchief claims he wants none. But they cut our trees at Warsong and send their agents through our forest by night, and I have buried Sentinels who never saw the blade that killed them." },
      },
      choices = {
        { text = "Then why not strike them openly?", next = "horde_strike" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    horde_strike = {
      big = true,
      lines = {
        { id = "hs_default", text = "Because Darnassus has not given that order, and because open war would cost us more than we can spare. So we deny them what we can, quietly, as they do to us." },
      },
      choices = {
        { text = "Quiet war is still war. I'll do my part.", next = "BACK", reply = "Then Elune keep you in the shadows, friend. Quiet war is the only kind we can afford.", fx = { align = { honor = -1 } } },
        { text = "I'd rather face them openly, blade to blade.", next = "BACK", reply = "So would I, and so would every Sentinel I know. But Darnassus decides, and we wait.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Kaldorei factions: Shindrell keeps to Tyrande's restraint against the hawks of Astranaar.
    restraint = {
      lines = {
        { id = "re_default", key = true,
          text = "Xai'ander does, and he tells every customer so, and some days I understand him better than I'd like. But the day we go to open war, the Warsong will stop sending axes and start sending armies, and Astranaar has one bridge." },
      },
      choices = {
        { text = "So you'd let them cut, to keep the peace?", next = "restraint2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    restraint2 = {
      lines = {
        { id = "re2_default", text = "I'd let them keep what they've already cut, I'd shoot every foreman who crosses the river, and I'd hold to the treaty that keeps Orgrimmar's warchief at home. Tyrande has seen one war that ended the world, and she weighs her Sentinels' lives more carefully than her Sentinels do." },
      },
      choices = {
        { text = "That's wisdom. A wider war would drown Ashenvale.", next = "BACK", reply = "It would, and I'd be the one writing the names to Darnassus. I'm glad someone sees it who isn't wearing a Sentinel's cloak.", fx = { align = { honor = 1 }, opinion = { peace = "peace" } } },
        { text = "Half-measures. The Warsong read restraint as weakness.", next = "BACK", reply = "They might, and Raene would tell you so before I'd finished my sentence. I still think our dead count for more than our pride.", fx = { align = { honor = -1 }, opinion = { peace = "war" } } },
        { text = "Does Raene agree with you?", next = "restraint3" },
      },
    },
    restraint3 = {
      lines = {
        { id = "re3_default", text = "Raene agrees with no one until she's buried somebody over it. She wants the war, and she wants Stormwind to fight it beside us, and when Stormwind doesn't come she blames the humans, though it's Tyrande's order that holds her back and not Stormwind's absence." },
        { id = "re3_human", when = { race = "Human" },
          text = "Raene agrees with no one until she's buried somebody over it. She'll tell you Stormwind abandoned us, and she'll mean it, but it's Tyrande's order that holds her back and not your king's absence, and she knows that better than she admits." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Elune guide you, Sentinel.", next = "END" },
      },
    },

    kayneth = {
      lines = {
        { id = "ka_default", text = "He's a druid at Forest Song, in the Nightsong Woods to the east, and a careful one. He thinks something wicked is moving through Ashenvale, and he collects reports the way some people collect arrowheads." },
      },
      choices = {
        { text = "Do you believe him?", next = "kayneth_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kayneth_believe = {
      lines = {
        { id = "kb_default", text = "I believe the forest is sicker than it was, and I believe Kayneth will find out why before the rest of us admit it. He calls me brave and keen, I hear, which is kind of him." },
      },
      choices = {
        { text = "He's right about you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Shindrell.", next = "END" },
      },
    },

    pridewings = {
      lines = {
        { id = "pr_default", text = "No, and dressing it up wouldn't make you feel any better. A pridewing doesn't know which side it's on; it only knows its nest, and we took that from it for the sake of our own." },
      },
      choices = {
        { text = "Your heart's in the right place.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "It was necessary. Don't dwell on it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    sister = {
      lines = {
        { id = "si_default", text = "Bad enough that I'm glad of you, {g:brother|sister}. We're stretched from the coast to the Warsong camps, and every month the Horde's axes bite a little deeper into the forest." },
      },
      choices = {
        { text = "Then put me where I'm needed.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Sentinel and a huntress, and lately more of a letter-writer than either. Somebody has to tell Darnassus what's happening out here." } },
    advice = { { id = "tp_ad", text = "In Ashenvale, look up as often as you look ahead. The forest has more than one floor." } },
    sentinels = { { id = "tp_sentinels", text = "We are fewer than we should be and more stubborn than the Horde expects. That has served so far." } },
    warsong = { { id = "tp_warsong", text = "Orc axes in our oldest trees, and the forest bleeding sap where they cut. I try not to go and look too often.", next = "horde" } },
    thrall = { { id = "tp_thrall", text = "The Horde's warchief is a name in every report I send Darnassus, usually beside the Warsong. I would much prefer to write about the birds of Zoram Strand." } },
    centaur = { { id = "tp_centaur", text = "Centaur raids on the Barrens edge of Stonetalon come up in my letters too. Darnassus never writes back about those." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess reads my reports herself, I'm told. I try to keep them short, and I always fail." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom's a cult nest and a naga nest at once. I write that in every report, and I'll keep writing it until someone sends more arrows." } },
    _none = { { id = "tp_none", text = "I don't know, {class}. Faldreas keeps track of the roads; ask him." } },
  },
}
