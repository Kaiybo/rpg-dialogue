-- Eastern Feralas: Falfindel Waywarder at the Thalanaar way-station (Thalanaar Delivery, Lonebrow's Journal,
-- The Crone of the Kraul) and Jer'kai Moonweaver, hiding with Kindal above the Grimtotem (Doling Justice).
-- Voice: bibles/east_feralas.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Falfindel Waywarder
---------------------------------------------------------------------------
P:NPC {
  key = "falfindel", id = TODO_NPC("Falfindel Waywarder"), name = "Falfindel Waywarder",
  bible = "bibles/east_feralas.md", role = "questgiver", tier = "quest",
  communities = { "thalanaar" }, temper = { "earnest", "grave" }, values = { "duty", "memory" },
  notices = { "race", "class" },

  impression = {
    first = "He has the sorrow of one who reads too many death reports.",
    third = "{name} met Falfindel Waywarder, keeper of the Thalanaar way-station on Feralas's eastern edge.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to Thalanaar, traveler. Rest, if you can; the road east is long and dry." },
    { id = "g_crone", when = { questActive = TODO_QUEST("The Crone of the Kraul") }, text = "The crone still lives, then. Gather your companions, and be careful in the Kraul." },
    { id = "g_crone_done", when = { questDone = TODO_QUEST("The Crone of the Kraul") }, text = "Razorflank is dead, and Heralath and Lonebrow are answered. Thank you, {name}." },
    { id = "g_parcel", when = { questDone = TODO_QUEST("Thalanaar Delivery") }, text = "Raschal's parcel sits on my shelf still. I couldn't bring myself to open it in a hurry." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Forgive me if I'm quiet for a moment; you remind me of a brave one I never got to thank." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, friend. Thalanaar sees few of our own this far south." },
    { id = "n_b1", cat = "class", when = { class = "HUNTER" },
      text = "A hunter reads the ground as my scouts do. If you see quilboar sign east of here, I would be glad to hear of it before you leave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Falfindel Waywarder, and Thalanaar is mine to keep. It's a small post, but every courier, scout and Sentinel between Feathermoon and the Barrens passes my door eventually." },
        { id = "h_parcel", when = { questActive = TODO_QUEST("Thalanaar Delivery") },
          text = "A parcel with my name on it, found in the Woodpaw camps? Then Raschal never made it. Give it here, and tell me everything you know." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("Lonebrow's Journal") },
          text = "This journal belonged to Henrig Lonebrow, a dwarf who rode with our scout Heralath into the Barrens. Read it with me, if you would; I don't think I can read it alone." },
        { id = "h_crone", when = { questActive = TODO_QUEST("The Crone of the Kraul") },
          text = "Charlga Razorflank leads the quilboar of the Kraul, and she killed Heralath and Lonebrow both. Assemble a party, go into the Kraul, and bring me her medallion as proof." },
        { id = "h_vale", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "News from Stonetalon? Keeper Albagorm's work in the Charred Vale is close to my heart, because a burned forest is a wound to all of us." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, then. The road can wait a little while." },
        { id = "h_again_b1", text = "Ask, friend. A quiet post gives a sentry a great deal of time for talk." },
      },
      choices = {
        { text = "Who were Heralath and Lonebrow?", next = "lonebrow" },
        { text = "What is Thalanaar for?", next = "post" },
        { text = "Who is the crone of the Kraul?", next = "crone" },
        { text = "Did you know the courier Raschal?", next = "raschal" },
        { text = "What needs doing here?", next = "BUSINESS" },
        { text = "The Needles begin just beyond your gate.", next = "needles" },
        { text = "Tell me what you'd have said to Lonebrow.", next = "thanks", when = { race = "Dwarf" } },
        { text = "Is there word from Feathermoon?", next = "word", when = { race = "NightElf" } },
        { text = "Do you track the Kraul's raiders yourself?", next = "hnt_track", when = { class = "HUNTER" } },
        { text = "Farewell, Falfindel.", next = "END" },
      },
    },

    lonebrow = {
      lines = { { id = "lo_default", text = "Heralath was one of our scouts, and Henrig Lonebrow was a dwarf who went along to see what the quilboar were doing in the Barrens. Neither came back, and the journal was all that did." } },
      choices = {
        { text = "What did the journal say?", next = "lonebrow_journal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonebrow_journal = {
      lines = { { id = "lj_default", text = "That the quilboar of Razorfen are led by a crone who speaks with dark powers, and that Lonebrow stood his ground so Heralath could run, though Heralath didn't run far enough." } },
      choices = {
        { text = "Their courage shouldn't be wasted.", next = "lonebrow_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonebrow_stance = {
      big = true,
      lines = { { id = "ls_default", text = "No, it shouldn't. There isn't time to send word to Darnassus and wait, but some here say we should, rather than send more brave souls after the first two." } },
      choices = {
        { text = "Don't wait. Strike the crone now.", next = "BACK", reply = "That is my heart's answer too, and I will find the arrows for whoever is willing, though I fear for them.", fx = { align = { order = -1 } } },
        { text = "Send word to Darnassus first. Do it properly.", next = "BACK", reply = "You are right, and it is the proper way, but the crone will not wait for a reply from Darnassus.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    post = {
      lines = { { id = "po_default", text = "A way-station, a place to rest, change horses and pass on messages. Thalanaar sits on the border, so we watch the Grimtotem to the west and the centaur to the east, and we try not to be noticed by either." } },
      choices = {
        { text = "That sounds lonely.", next = "post_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_lonely = {
      lines = { { id = "pl_default", text = "It is, sometimes. But the couriers bring gossip, the hippogryphs bring the couriers, and once in a long while somebody like you walks in with a story, so an old sentry has company enough." } },
      choices = {
        { text = "I'll come back with more stories.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crone = {
      lines = { { id = "cr_default", text = "Charlga Razorflank, the quilboar crone who rules the warrens of Razorfen Kraul in the southern Barrens. They say she speaks with spirits in the brambles, and that the brambles answer." } },
      choices = {
        { text = "I'll bring you her medallion.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    raschal = {
      lines = { { id = "ra_default", text = "Everyone knew Raschal. He'd stop here on the way to the Needles and eat everything I had, and complain about the bread, and leave with a story for Ginro. I'll miss the complaining most." } },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needles = {
      lines = {
        { id = "b_needles_default", text = "They do, and the forest ends as though someone had drawn a line with a blade. Beyond it the land is all dust and stone spires, and the centaur and the Grimtotem quarrel over every watering hole in it." },
      },
      choices = {
        { text = "Do they trouble Thalanaar?", next = "needles_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needles_trouble = {
      lines = {
        { id = "b_needles_trouble_default", text = "The Grimtotem test us now and then, a few riders at dusk to see whether the sentries are awake. So far they have found us awake every time, and I mean to keep it so." },
      },
      choices = {
        { text = "Who holds the road if they come in force?", next = "needles_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needles_hold = {
      lines = {
        { id = "b_needles_hold_default", text = "The few Sentinels I have, and Thyssiana's hippogryphs to carry word to Feathermoon before the dust has settled. A post like this one is not meant to win a battle, only to make sure the General hears of it." },
      },
      choices = {
        { text = "Then I hope she never has to.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks = {
      lines = {
        { id = "b_thanks_default", text = "I would have told him that an elf of this post owed him a life, and that we do not forget such debts in a hundred years or a thousand. Since I cannot tell him, I am telling you, and perhaps your people will carry it home." },
      },
      choices = {
        { text = "I'll see that Ironforge hears his name.", next = "BACK", fx = { affinity = 1 } },
        { text = "He'd have asked for an ale, not a speech.", next = "BACK", reply = "Then I owe him an ale as well, and Thalanaar has none. I will have to settle that debt some other way." },
        { text = "Something else.", next = "BACK" },
      },
    },
    word = {
      lines = {
        { id = "b_word_default", text = "Ginro's dispatches come when the couriers do, which is less often than either of us would like. The General holds the isle against the naga, the ogres hold the hills, and Thalanaar holds the road between them and the world." },
      },
      choices = {
        { text = "Elune watch over your road, Falfindel.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hnt_track = {
      lines = { { id = "htr_d", text = "When there is no one else to, which is often. Quilboar leave a trail a child could follow, all churned mud and broken thorn, so the hard part is not finding them but knowing when to stop, because the Kraul swallow scouts who follow too far." } },
      choices = {
        { text = "Then I'll know when to stop.", next = "BACK", reply = "Heralath did not, and I wish I had told him so more plainly.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the road, the couriers, and the names of the scouts who didn't come back." } },
    background = { { id = "tp_bg", text = "A sentry of the Kaldorei, keeper of a small post on a long road.", next = "post" } },
    grimtotem = { { id = "tp_b_grimtotem", text = "They watch us from the cliffs to the west and send riders to test the gate at dusk. I do not know what they want with a way-station, and I would rather not learn." } },
    razorfen = { { id = "tp_b_razorfen", text = "The Kraul lies north and east in the Barrens, a tangle of great thorns with quilboar under every root. Two of ours went to look at it, and you know how that ended." } },
    _none = { { id = "tp_none", text = "No courier has brought me word of that." } },
  },
}

---------------------------------------------------------------------------
-- Jer'kai Moonweaver
---------------------------------------------------------------------------
P:NPC {
  key = "jerkai", id = TODO_NPC("Jer'kai Moonweaver"), name = "Jer'kai Moonweaver",
  bible = "bibles/east_feralas.md", role = "questgiver", tier = "quest",
  temper = { "fierce", "quick" }, values = { "nature", "justice" },
  notices = { "race", "class" },

  impression = {
    first = "She keeps an arrow on the string the whole time she talks.",
    third = "{name} met Jer'kai Moonweaver, who fights the Grimtotem of Feralas alongside Kindal Moonweaver.",
  },

  greetings = {
    { id = "g_hello", text = "Down, and quiet. The Grimtotem have ears, and some of them have good ones." },
    { id = "g_active", when = { questActive = TODO_QUEST("Doling Justice") }, text = "The Grimtotem raiders, naturalists and shamans are still down there, so neither of us is finished." },
    { id = "g_done", when = { questDone = TODO_QUEST("Doling Justice") }, text = "They felt that, all through the camp. I heard them wailing from up here." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with a beast at your side that isn't in a cage. That's the right way round." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren up here! Don't look so surprised; I know you're not one of them, or you'd be dead." },
    { id = "n_b1", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you will feel it as we do when you see those cages, and I won't need to explain why we stayed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jer'kai Moonweaver. Kindal and I watch the Grimtotem from up here, and we've seen what they do to the creatures of this forest. Now we're taking the fight to them." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Doling Justice") },
          text = "As Kindal's already told you, we're done watching. We can pick off some of the tauren without much threat to ourselves, but we'd welcome help. Deal as much damage as you can, to the camp below and the ones east of it." },
        { id = "h_active", when = { questActive = TODO_QUEST("Doling Justice") },
          text = "Use your own tactics; we'll use ours. Meet us back here when they've felt Kindal's arrows and your weapons both." },
        { id = "h_freed", tags = { "news" }, when = { questDone = TODO_QUEST("Freedom for All Creatures") },
          text = "The sprite darters you brought out are flying again over the lake. Kindal cried, though she'll tell you it was the smoke." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice low." },
        { id = "h_again2", text = "Quickly, then." },
        { id = "h_again_b1", text = "Still here? Then ask, and watch the ridge while you do." },
      },
      choices = {
        { text = "What do the Grimtotem do to the creatures?", next = "cages" },
        { text = "How did you and Kindal end up here?", next = "kindal" },
        { text = "Why not bring the Sentinels?", next = "sentinels" },
        { text = "What happened to the captured sprite darters?", next = "darters" },
        { text = "I'll fight with you.", next = "BUSINESS" },
        { text = "You've a clear view of the whole camp from here.", next = "view" },
        { text = "Show me how you get close to their camp unseen.", next = "stalk", when = { class = { "HUNTER", "ROGUE" } } },
        { text = "What will the General say when you return?", next = "general", when = { race = "NightElf" } },
        { text = "I'll go quietly.", next = "END" },
      },
    },

    cages = {
      lines = { { id = "ca_default", text = "They cage them, starve them, and bleed them for their rituals, and they call it honoring the earth. I've seen a sprite darter beat its wings against the bars until it couldn't fly anymore." } },
      choices = {
        { text = "Why would they do that?", next = "cages_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cages_why = {
      big = true,
      lines = { { id = "cw_default", text = "Power, Kindal thinks, or spite against the forest that won't bow to them. I don't care why anymore. Some of my sisters say we should try to reason with their elders; I say an arrow is the only reason they'll hear." } },
      choices = {
        { text = "Then let arrows do the talking.", next = "BACK", reply = "Then you and I agree, and Kindal can keep his patience while we keep our bows strung.", fx = { align = { light = -1 } } },
        { text = "Try reasoning first. Not all of them choose this.", next = "BACK", reply = "Kindal would like you, and perhaps he is right, but I have seen the cages, and I have run out of reasons to talk.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kindal = {
      lines = { { id = "ki_default", text = "We came to Feralas together with the expedition, and when we saw the cages, neither of us could go back to the stronghold and pretend we hadn't. So we stayed, and we hid, and we watched until we knew enough." } },
      choices = {
        { text = "You're very close, you two.", next = "kindal_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kindal_close = {
      lines = { { id = "kc_default", text = "She's the patient one and I'm the angry one, and between us we make one good Sentinel. Don't tell her I said that, because she'll be insufferable for a month." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sentinels = {
      lines = { { id = "se_default", text = "The general has the naga on the coast and the ogres to the north, and only so many bows. Two Sentinels in the hills cost her nothing, and two Sentinels who know these hills can bleed an ogre camp for a month." } },
      choices = {
        { text = "You're brave to try alone.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    darters = {
      lines = {
        { id = "da_default", text = "Some made it out, and some didn't. Every one we lose on the way out is one more I owe the Grimtotem, and I keep count." },
        { id = "da_done", when = { questDone = TODO_QUEST("Freedom for All Creatures") }, text = "The ones you led out made it, every one, and I shouted loud enough to wake the whole camp. It was worth it." },
      },
      choices = {
        { text = "I'm glad they're free.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    view = {
      lines = {
        { id = "b_view_default", text = "That is why we chose it. I can count their fires and their sentries from this rock, and I know which of them sleeps on watch and which of them never does." },
      },
      choices = {
        { text = "Which of them should I fear most?", next = "view_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view_fear = {
      lines = {
        { id = "b_view_fear_default", text = "The shamans, because they call the lightning without warning and they do not tire. The raiders are strong but they fight one at a time, and the naturalists run for help, so drop those first." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalk = {
      lines = {
        { id = "b_stalk_default", text = "Come in from the north, where the wind carries your scent away from their wolves, and keep the lake at your back. Kindal taught me that after I walked into a patrol in our first week and had to run a mile with an axe behind me." },
      },
      choices = {
        { text = "She sounds like the careful one.", next = "stalk_kindal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalk_kindal = {
      lines = {
        { id = "b_stalk_kindal_default", text = "She is, and she has kept me alive for it more than once. I make the noise and she makes the plan, and the Grimtotem have yet to work out which of us is which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    general = {
      lines = {
        { id = "b_general_default", text = "That we left our posts without leave, I expect, and she will be right. I would sooner stand before Shandris Feathermoon and answer for it than walk past those cages a second time." },
      },
      choices = {
        { text = "She'd have done the same in your place.", next = "BACK", fx = { affinity = 1 } },
        { text = "Orders exist for a reason, Sentinel.", next = "BACK", reply = "So they do, and I have broken them with my eyes open. Tell her that too, if she asks you." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Grimtotem camps, their patrols, and every cage they keep." } },
    background = { { id = "tp_bg", text = "A Sentinel who came with the expedition and stayed in the hills.", next = "kindal" } },
    grimtotem = { { id = "tp_grim", text = "The Grimtotem are cruel to the forest and proud of it. I've no pity left for them." } },
    sentinels = { { id = "tp_b_sentinels", text = "We are Sentinels still, whatever our orders said. Guarding this forest is the oath, and nobody told us it stopped at the stronghold's walls." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't the time to find out." } },
  },
}
