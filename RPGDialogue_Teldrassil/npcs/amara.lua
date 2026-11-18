-- Moon Priestess Amara, patrolling the road west of Dolanaar with two huntresses (0.72.0). Voice: bibles/amara.md
-- Classic: The Road to Darnassus (Gnarlpine Ambushers in the den up the northern path).
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "amara", id = TODO_NPC("Moon Priestess Amara"), name = "Moon Priestess Amara",
  bible = "bibles/amara.md", role = "priest", tier = "quest",
  communities = { "dolanaar" }, temper = { "stern", "watchful" }, values = { "devout", "dutiful" },
  notices = { "mount", "class" },
  impression = {
    first = "Moon Priestess Amara rides the road to Darnassus as if it were a temple floor that needs keeping clean. She salutes like a Sentinel and blesses like a priestess, and she means both.",
    third = "{name} met Moon Priestess Amara, who keeps the road between Dolanaar and Darnassus clear of Gnarlpine ambushers.",
  },

  greetings = {
    { id = "g_road", text = "Keep to the road, and keep your eyes on the trees beside it. The Gnarlpine like to watch before they strike." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Road to Darnassus") }, text = "Their den lies up the northern path, {class}. The road will not clear itself." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Road to Darnassus") }, text = "The merchants have stopped asking for escorts since you cleared the ambushers. Elune's light on you, {class}." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A fine night for the road, with the moon this high. She watches it with me." },
    { id = "g_away", when = { away = 14 }, text = "You have been away {away}, and the road has missed a friend. Welcome back to it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You were new to the road when you first cleared it for me, and now you carry yourself like a Sentinel. Elune has been generous with you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear there were sharp words with someone in Dolanaar. Settle it, {class}, because a quarrel on the road is how ambushes begin." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "A good mount, and it carries you well, but the Gnarlpine throw stones at riders first. Keep your head low through the trees." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "NightElf" },
      text = "A sister of the Temple, out on the road! The priestesses inside the walls forget that Elune walks out here too, so I am glad to see you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Amara, a priestess of the moon, and I keep this road with Nhemai and Yaeliura. News and trade travel to and from Darnassus along it every day, and I will not have it terrorised by a band of maddened furbolgs." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Road to Darnassus") },
          text = "The Gnarlpine attack travellers on this road without rest, {class}. Their ambushers keep a den up the northern path, and they will keep coming until someone goes up there and stops them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Road to Darnassus") },
          text = "The road is still not safe, {class}. Go up the northern path, slay the ambushers, and come back to me when the den is quiet." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Road to Darnassus"), days = 3 } },
          text = "You have served Dolanaar and Darnassus well, and as one of the Sentinels of Teldrassil, I salute you. The carts came through this morning without a single arrow in them." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Road to Darnassus"), days = 7 } },
          text = "A few new ambushers crept back into that den, as they always do, but fewer and more frightened. I've slept the night through twice this week, and I owe that to you." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, on the road to Darnassus! You will find our city grander than your stories, and our welcome slower, so be patient with it." },
        { id = "h_orc_note", when = { faction = "Horde" },
          text = "You are a long way from your own lands, and this road is not for you. Turn back the way you came, and quickly." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, {class}? Speak while we ride, and keep one eye on the trees, as every Sentinel learns to." },
        { id = "h_again2", text = "Ask, and then let me return to watching the trees. The Gnarlpine are patient, and they wait for us to look away." },
      },
      choices = {
        { text = "Why do you guard this road yourself?", next = "road" },
        { text = "You salute like a Sentinel, but you bless like a priestess.", next = "both" },
        { text = "Your two companions look sharp-eyed.", next = "huntresses" },
        { text = "Pray with me before I go up the path.", next = "pray_a", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "I've never seen Darnassus. What's it like?", next = "darnassus", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "I'll clear the ambushers.", next = "BUSINESS" },
        { text = "Elune keep you, Priestess.", next = "END" },
      },
    },

    road = {
      lines = {
        { id = "ro_default", text = "Because this road is how Dolanaar eats, and how the Temple hears from the rest of the island, and how our young walk to the city for their first lessons. A road nobody guards becomes a road nobody uses." },
      },
      choices = {
        { text = "Why have the Gnarlpine turned to ambush?", next = "road_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_why = {
      lines = {
        { id = "rw_default", text = "The druids say a corruption has them, and that Ursal the Mauler drives them with it. I believe it, though I cannot stand on the road and argue the point with an arrow in my saddle." },
      },
      choices = {
        { text = "You speak of them as though you pity them.", next = "road_pity" },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    road_pity = {
      big = true,
      lines = {
        { id = "rp_default", text = "I pity what they were, and I pray for what they might be again. But the ambusher on this road is not a patient to be healed, {class}; he is a danger to children walking to Darnassus." },
      },
      choices = {
        { text = "The road comes first. I'll do what's needed.", next = "BACK", reply = "The road does come first, and I am glad you understand it. Do what you must, and I will do the praying for both of us.", fx = { align = { light = -1 } } },
        { text = "I'll fight them, but I'll pray for them too.", next = "BACK", reply = "Then you have the heart of a priestess under that {class}'s gear, and Elune will see it. Go gently, even with a blade drawn.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    both = {
      lines = {
        { id = "bo_default", text = "Both, and I have stopped apologising for it. Some of my sisters prefer the Temple's cool halls, but Elune's light falls on the road as well, and someone ought to stand in it with a bow." },
      },
      choices = {
        { text = "Do the other priestesses disapprove?", next = "both_sisters" },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    both_sisters = {
      big = true,
      lines = {
        { id = "bs_default", text = "Some of them, gently, in the way priestesses disapprove of things. The High Priestess has never told me to come in from the road, and I take that as her answer." },
      },
      choices = {
        { text = "Faith should be lived where the danger is.", next = "BACK", reply = "That is what I have always believed, and I am glad to hear it from someone who walks this road too. Elune's light shines best in the dark.", fx = { align = { order = -1 } } },
        { text = "The Temple's ways exist for good reasons.", next = "BACK", reply = "They do, and I honour them, even from out here. I only think the Temple is wherever someone needs it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } },
      },
    },

    huntresses = {
      lines = {
        { id = "hu_default", text = "Nhemai and Yaeliura, and they are better shots than I am, though I would thank you not to tell them I said so. They see the ambushers in the branches long before I do." },
      },
      choices = {
        { text = "They seem very quiet.", next = "huntresses_quiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    huntresses_quiet = {
      lines = {
        { id = "hq_default", text = "They are listening, {class}, which is what a huntress does on a road like this. If you hear them stop talking altogether, draw your weapon." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Goodbye, Priestess.", next = "END" },
      },
    },

    pray_a = {
      lines = {
        { id = "pa_default", text = "Gladly. Mother Moon, guide this one's aim and guard their back on the northern path, and bring them home to the road again." },
      },
      choices = {
        { text = "Thank you, Priestess.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darnassus = {
      lines = {
        { id = "da_default", text = "Quiet, mostly, and green, with the Temple of the Moon at its heart and the Cenarion Enclave across the water from it. Walk slowly when you arrive, because our people judge visitors by how they walk." },
      },
      choices = {
        { text = "I'll walk slowly, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess of the moon who prefers a saddle to a pew. That is all you need to know of me, and it is all most of my sisters know either." } },
    advice = { { id = "tp_ad", text = "When the forest goes quiet, it is not peace. Draw your bow first and wonder about it afterwards." } },
    sisterhood_of_elune = { { id = "tp_sisters", text = "The Sisterhood keeps the Temple, and some of us keep the roads. Elune does not mind which.", next = "both" } },
    sentinels = { { id = "tp_sentinels", text = "They hold the forest's edges so the Temple can keep its peace. I ride with them gladly." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine were not always like this, and I pray they will not always be. Until then, the road comes first." } },
    elune = { { id = "tp_elune", text = "Elune rides with me on every road I patrol, and she is better company than most of my sisters. She never asks why I'm late back to the Temple." } },
    nordrassil = { { id = "tp_nordrassil", text = "The first tree stands on Hyjal, and I rode up its slopes once as a girl to see it. Teldrassil is grand, but it has never made me catch my breath like that." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess gave me this saber and these roads, and she trusts me to keep both. I'd ride through fire for her, and she knows it, so she has never once needed to ask." } },
    blackfathom = { { id = "tp_blackfathom", text = "That was Elune's temple once, on the Ashenvale shore, before the sea took it. Cultists pray in it now, and I'd ride in and drag them out myself if the Temple let me." } },
    _none = { { id = "tp_none", text = "I keep a road, {class}, not a library, and my saddle's softer than most books besides. Ask the priestesses in Darnassus." } },
  },
}
