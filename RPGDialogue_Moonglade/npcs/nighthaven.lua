-- Nighthaven and the Shrine of Remulos. Voice: bibles/nighthaven.md
-- Moonglade is neutral: nothing here assumes the player's faction.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "remulos", id = TODO_NPC("Keeper Remulos"), name = "Keeper Remulos",
  bible = "bibles/nighthaven.md", role = "noble", tier = "major",
  communities = { "nighthaven" }, temper = { "serene" }, values = { "protective", "firm" },
  spiritSensitive = true,
  notices = { "form", "fel", "race" },
  impression = {
    first = "Keeper Remulos speaks to every visitor as if they were a guest in his own grove, which I suppose they are. When he asks about the new tree on Teldrassil, a quiet sadness creeps into his voice.",
    third = "{name} met Keeper Remulos, son of Cenarius, who guards Moonglade for every druid whatever banner they fly.",
  },

  greetings = {
    { id = "g_glade", text = "Be welcome in Moonglade, little one. Every creature that comes in peace may rest here." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A child of the Circle. Come, walk with me a little, for the glade is glad of you." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The trees remember your step, and so do I." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "You wear the bear well: heavy, patient, slow to anger. Let the shape teach you while you wear it." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Swift and quiet, I see. The cat's is a sharp lesson, so mind it doesn't teach you only how to hunt." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "The fel clings to you like smoke to a cloak. You may stand here, but you may not call upon it here. Do we understand each other?" },
    { id = "n_skyborne_druid", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "You honour the winds first, and the moon after, if at all; I know it. The Circle has never asked every druid to kneel to the same sky." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Remulos, son of Cenarius, keeper of this glade. Moonglade is the heart of the druids' craft. I guard it for all of them, whatever banners they fly beyond its hills." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "The tauren came to the Circle late and were made welcome. Not everyone in Darnassus wished it, but I did, and I do still." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Child of the forest, tell me, does the new tree on Teldrassil sing to you? I listen for it, and I do not hear what I hoped to." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Shen'dorei, the hidden people, come out of hiding. The winds kept you a long while, and I hope they taught you gently." },
        { id = "h_seed", tags = { "news" }, when = { questActive = TODO_QUEST("Seed of Life") },
          text = "You smell of Maraudon's rot, little one, and yet there is something about you I almost know. Tell me why you have come to the shrine." },
        { id = "h_seed_done", when = { questDone = TODO_QUEST("Seed of Life") },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "You walk gently in my glade, little one, and the trees have noticed it as well as I. Come, sit, and ask what you will." },
          text = "My brother's seed sleeps in good soil now. I thought Zaetar lost to us for good, and you brought me word that he was only waiting to be reborn." },
        { id = "h_visitor", when = { ["not"] = { class = "DRUID" } },
          text = "Few who are not druids find the road to Moonglade, for it runs through the furbolgs' tunnels and over the cold of Winterspring. You are welcome all the same." },
      },
      again = {
        { id = "h_again", text = "The glade is patient, and so am I. What else would you ask?" },
        { id = "h_again2", text = "Ask, little one. The trees are listening too, so ask kindly." },
      },
      choices = {
        { text = "What is the Cenarion Circle?", next = "circle" },
        { text = "What troubles you, Keeper?", next = "troubles" },
        { text = "You are Cenarius's son. Tell me of your family.", next = "family" },
        { text = "What is this place to the druids?", next = "glade" },
        { text = "I carry a seed from Zaetar's spirit.", next = "seed", when = { questActive = TODO_QUEST("Seed of Life") } },
        { text = "I'm a druid. What does the glade ask of me?", next = "druid", when = { class = "DRUID" } },
        { text = "I serve the Light. Is a priest welcome here?", next = "priest", when = { class = "PRIEST" } },
        { text = "A human, this far north. Do you see many of us?", next = "human", when = { race = "Human" } },
        { text = "You welcomed my people when others wouldn't.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to the glade.", next = "END", fx = { affinity = 1 } },
      },
    },
    circle = {
      lines = {
        { id = "c_default", text = "Druids of every people who will hear the wild: elves, tauren, others now. We keep the balance where we can, and grieve it where we can't." },
      },
      choices = {
        { text = "Do all of you agree?", next = "staghelm" },
        { text = "I'd like to help keep it.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" }, align = { order = 1 } } },
        { text = "Balance is for the wild to keep, not a circle of druids.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    staghelm = {
      lines = {
        { id = "st_default", text = "No, and the Archdruid and I agree least of all. He did not want the tauren taught our secrets, and I taught them. He raised a new World Tree without the Aspects' blessing, and I told him it was a selfish thing, done to win back what we lost." },
      },
      choices = {
        { text = "That's a hard thing to say to an Archdruid.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "teldrassil" } } },
        { text = "Maybe he meant well.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The Emerald Dream was the purest of places, and something has crept into it. Druids who walk there come back changed, or not at all, and I watch, and I do not like what I see." },
      },
      choices = {
        { text = "Can it be stopped?", next = "stopped", fx = { learn = { "cenarion_circle" } } },
        { text = "Who walks there now?", next = "sleepers" },
        { text = "I'll be careful in my dreams.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    stopped = {
      lines = { { id = "s_default", text = "Everything can be stopped, little one, if enough hands hold it back. When you are strong, come and lend me yours." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Dream's a druid problem, Keeper, and not mine.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    sleepers = {
      lines = {
        { id = "sl_default", text = "Those who gave up their waking lives to go into the Dream and guard it. Malfurion Stormrage himself walks there, and his body sleeps while his spirit wanders. I worry for them more each season, because the Dream has grown dangerous even for its friends." },
      },
      choices = {
        { text = "Then they need someone watching over them.", next = "BACK", fx = { affinity = 2, learn = { "malfurion" }, align = { light = 1 } } },
        { text = "They chose to sleep, and the waking world has troubles enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What else should I know?", next = "BACK", fx = { learn = { "malfurion" } } },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "My father fell in the war, when the demons' servants came into the forests, and his children carry on as best we can. My brother Ordanus keeps the great tree at Raynewood in Ashenvale. My son Celebras is a keeper like me and his sisters are dryads, and I have not seen them in far too long." },
      },
      choices = {
        { text = "You had another brother?", next = "zaetar" },
        { text = "Where is Celebras now?", next = "celebras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar = {
      big = true,
      lines = {
        { id = "z_default", text = "Zaetar, the cunning one, who always thought the world looked at me first. He loved Princess Theradras of the earth, and I told him the union was cursed. He would not hear me, and their children were the centaur, who murdered their father almost the moment they knew him." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The centaur killed their own father?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "You blame yourself for Zaetar, Keeper.", tag = "Persuade", next = "zaetar_regret",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "DRUID" }, { questDone = TODO_QUEST("Seed of Life") } } } },
          fail = { next = "zaetar_no", fx = { affinity = -1 } } },
      },
    },
    celebras = {
      lines = {
        { id = "ce_default", text = "He went into Maraudon in Desolace with his sisters to free Zaetar's spirit from Theradras, and the poison of that place took them instead. If you go down into those caves, look upon him gently, for he did not choose what he has become." },
      },
      choices = {
        { text = "I'll remember him, if I go there.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Whatever he's become, I'll cut him down if he stands in my way.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seed = {
      big = true,
      lines = {
        { id = "sd_default", text = "Zaetar's spirit gave you this, the first seed from the life his body fed? Then my brother has found his place in nature at last, as was always his duty. I feared his pride and his rage had cost us him forever, and he was only waiting to grow again." },
      },
      choices = {
        { text = "He said to tell you his spirit lives on.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "A seed seems a small thing to show for a whole life.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    glade = {
      lines = {
        { id = "gl_default", text = "It is the sacred centre of every druid's study, and it belongs to no kingdom and no warchief. Alliance and Horde druids sleep under the same trees here, and my wardens stop any quarrel before it is a fight." },
      },
      choices = {
        { text = "Who are your wardens?", next = "shrine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine = {
      lines = {
        { id = "sh_default", text = "Night elves and tauren alike, sworn to keep the peace in Nighthaven and at my shrine by the lake. Tajarri watches the shrine itself, and young druids take their Trial of the Lake under her eye." },
      },
      choices = {
        { text = "I'll keep the peace while I'm here.", next = "BACK", fx = { affinity = 1, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Only that you listen, and that you come home to it when the world is loud. Dendrite will set your trials, and the Great Bear Spirit will teach you what strength is for. The rest you will learn by walking." },
      },
      choices = {
        { text = "I'll listen, Keeper.", next = "BACK", fx = { affinity = 2, standing = { nighthaven = 1 }, align = { order = 1 } } },
        { text = "I'll learn by walking, Keeper, and find my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "You are welcome, little one, and so is your Light, as long as it keeps its voice low among my trees. I have watched healers of many faiths kneel beside the same wounded beast, and I have never seen the beast ask whose prayer saved it." },
      },
      choices = {
        { text = "Then I'll heal what I can, and keep my voice low.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "My faith goes where I go, and I won't whisper it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Light answers anyone who asks.", next = "priest_light" },
      },
    },
    priest_light = {
      lines = {
        { id = "pl_default", text = "So does the wild, if they ask humbly enough, and few do. Perhaps your Light and my father's forest are not so far apart as your temples think." },
      },
      choices = {
        { text = "Perhaps not.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = {
        { id = "hu_default", text = "Few, and those few come with questions. There is one human who lives in Nighthaven, Umber, who keeps the Circle's archives and loses his books daily, and the druids think him brilliant. Ask Rabine where to find him, if you like your answers with a great many footnotes." },
      },
      choices = {
        { text = "I'll look for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "I did, and I taught them secrets the Circle had guarded closely, because they had listened to the land all that while without being taught. Some in Darnassus have not forgiven me for it, and I find I do not need them to." },
      },
      choices = {
        { text = "My people remember it.", next = "BACK", fx = { affinity = 3, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_regret = {
      lines = {
        { id = "zr_default", text = "I warned him that Theradras would be his ruin, and I was right, and being right has never once comforted me. I spoke to him as the son our father favored, little one, and I think that is all he heard." },
        { id = "zr_seed", when = { questDone = TODO_QUEST("Seed of Life") },
          text = "You carried his seed to me, so you have earned this. I warned Zaetar that Theradras would ruin him, and I was right, but I spoke as the son our father favored, and I think he heard only that before he went to her anyway." },
      },
      choices = {
        { text = "He found his place in the end, Keeper.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_no = {
      lines = {
        { id = "zn_default", text = "Blame is a heavy word to carry into a glade this quiet, little one. Let it rest, and ask me something else." },
        { id = "zn_tauren", when = { race = "Tauren" },
          text = "Your people taught me that grief is shared, not handed over, and still this one I keep. Ask me something else, child of the plains." },
      },
      choices = {
        { text = "Of course, Keeper.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The glade hears much, and the trees tell me what they hear. Ask, little one, and I will answer as I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 75 } },
        text = "You have always walked gently here, so ask what you will. I will keep little from you." },
    },
    background = { { id = "tp_bg", text = "I am a son of Cenarius, and Moonglade has been mine to keep since before your kingdoms had names.", next = "family" } },
    advice = { { id = "tp_ad", text = "Sleep lightly, little one, and do not go looking for the Dream. If it wants you, it will find you soon enough." } },
    cenarion_circle = { { id = "tp_circle", text = "My father's children, in a way, and not all of them agree with one another. That is how I know it lives." } },
    malfurion = { { id = "tp_malf", text = "He walks the Dream while his body sleeps, and I keep the glade for him until he wakes." } },
    worgen = { { id = "tp_worgen", text = "Wolves that are not wolves, in the human forests. I have heard of them, and I am troubled, for such things do not happen without a cause." } },
    _none = { { id = "tp_none", text = "That is beyond the glade. Rabine keeps better track of the world than I do." } },
  },
}

P:NPC {
  key = "rabine", id = TODO_NPC("Rabine Saturna"), name = "Rabine Saturna",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "grave" }, values = { "careful", "loyal" },
  notices = { "lore", "form" },
  impression = {
    first = "Rabine Saturna keeps the Keeper's house in order so the Keeper need not think about it. He does not believe in chance, and he looked at me as though weighing what my coming here meant.",
    third = "{name} met Rabine Saturna, majordomo to Keeper Remulos, who watches over everything in Nighthaven the Keeper does not.",
  },

  greetings = {
    { id = "g_house", text = "Be at ease here. I keep the Keeper's house in order, and the Keeper's visitors. Speak, please." },
    { id = "g_back", when = { metBefore = true }, text = "Again you come to Nighthaven, and I don't think that's chance. I don't believe in chance." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader, good. The world remembers less than it thinks it does, and readers keep the rest." },
    { id = "n_form", cat = "form", when = { form = "travel" },
      text = "You came in at a run on four legs, so rest them. Nighthaven isn't going anywhere, and neither are its troubles." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rabine Saturna, majordomo to Keeper Remulos. He watches the glade; I watch everything else, so he needn't. It's a quieter job than it sounds, most days." },
        { id = "h_locket", tags = { "news" }, when = { questActive = TODO_QUEST("A Reliquary of Purity") },
          text = "Southwind's ruins are deep in Silithus, and I've known for a while that a Reliquary of Purity lay there. I kept it quiet so as not to stir our enemies, but Eldre'Thalas leaves me no more time for quiet." },
        { id = "h_locket_done", when = { questDone = TODO_QUEST("Shards of the Felvine") },
          text = "The Felvine is sealed and in our keeping, and Milli's work is no longer a demon's plaything. You're welcome in this house as a hero of the Circle, and I don't say that lightly." },
        { id = "h_felvine", tags = { "news" }, when = { questActive = TODO_QUEST("Shards of the Felvine") },
          text = "Alzzin the Wildshaper holds the eastern halls of Eldre'Thalas, and the Felvine grows close to him. When he falls, seal what you can of it in the Reliquary and bring it here, with all the care you've got." },
        { id = "h_wasteland", when = { questActive = TODO_QUEST("Wasteland") },
          text = "Layo Starstrike waits at Valor's Rest, where Silithus buries its dead. Show him my letter and he'll trust you as I do." },
        { id = "h_remulos", when = { heardLine = "remulos.t_default" },
          text = "The Keeper spoke to you of the Dream? He doesn't tell many, so take it as a sign of trust, and a warning, both." },
      },
      again = {
        { id = "h_again", text = "Go on, then. I've a ledger to finish, but it can wait for a good question." },
        { id = "h_again2", text = "What else? I'm listening, and I don't forget what I hear." },
      },
      choices = {
        { text = "What happens in Nighthaven?", next = "village" },
        { text = "You don't believe in chance?", next = "chance" },
        { text = "What worries the Circle these days?", next = "silithus" },
        { text = "Another human lives here, I'm told?", next = "umber", when = { race = "Human" } },
        { text = "My people came from Eldre'Thalas, long ago.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "The Keeper told me about the Dream.", next = "dream", when = { heardLine = "remulos.t_default" } },
        { text = "Goodbye, Rabine.", next = "END" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "Druids come to learn and rest. Wardens keep the peace between peoples who'd otherwise not share a road. And I keep the ledger of who owes the Circle what." } },
      choices = {
        { text = "Who owes the Circle what?", next = "ledger" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    ledger = {
      lines = { { id = "l_default", text = "Everyone who's been helped and hasn't yet helped back, which is nearly everyone. I don't send collectors, mind. I simply remember, and sooner or later the world brings them to my door." } },
      choices = {
        { text = "Then put my name down on the helping side.", next = "BACK", fx = { affinity = 2, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chance = {
      big = true,
      lines = {
        { id = "c_default", text = "I've lived long enough to see the same patterns come round twice. When something seems like chance, it's usually a thread we haven't followed yet." },
      },
      choices = {
        { text = "Then I'll follow it.", next = "eldre", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Sometimes chance is just chance.", next = "just" },
      },
    },
    just = {
      lines = { { id = "j_default", text = "Perhaps. Come back in a few hundred years and tell me if you still think so." } },
      choices = {
        { text = "All right, what thread are you following?", next = "eldre" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldre = {
      lines = {
        { id = "e_default", text = "Dire Maul, as most folk call it now, though I know it by its true name of Eldre'Thalas. It was a bastion of our magic long ago, and our agents have found something there that should have died in the War of the Ancients." },
      },
      choices = {
        { text = "What should have died?", next = "milli" },
        { text = "Something else.", next = "BACK" },
      },
    },
    milli = {
      big = true,
      lines = {
        { id = "m_default", text = "The Fruit of Fertility, the finest work of a naturalist named Millicent Serene, grown from a moonwell to protect and nourish the whole city. We thought it destroyed, and instead it lives on as the Felvine, rotting under a demon called Alzzin the Wildshaper. I won't let it be corrupted to the end, if only for Milli's memory." },
      },
      choices = {
        { text = "Then I'll help when I'm strong enough.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Burn the Felvine, then, because memories won't save anyone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithus = {
      lines = {
        { id = "si_default", text = "Silithus, west of Un'Goro, where our people fought a war long ago against something alien and terrible. It was sealed away, and now we suspect someone is trying to stir it." },
      },
      choices = {
        { text = "Who watches it for you?", next = "layo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    layo = {
      lines = {
        { id = "la_default", text = "Layo Starstrike, at Valor's Rest, by the graves of those who fell in the wastes. When you're seasoned enough to survive Silithus, come to me and I'll give you a letter for him." },
      },
      choices = {
        { text = "I'll come when I'm ready.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    umber = {
      lines = {
        { id = "u_default", text = "Umber, our archivist, who is brilliant and knows it and can never find the book he had a moment ago. He calls me the den mother of this bear camp. I let him, because he's the only one who'd dare." },
      },
      choices = {
        { text = "He sounds good company.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "From Eldre'Thalas? Then it's no coincidence at all that you're standing in my house while I worry about that city, and you know I don't believe in those. Tell me one day what your people remember of it, and I'll tell you what mine do." },
      },
      choices = {
        { text = "I will, one day.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = {
        { id = "d_default", text = "Then you know more than most of Nighthaven does, so keep it close. The Keeper carries that worry so the rest of us can sleep, and I'd rather it stayed that way." },
      },
      choices = {
        { text = "I'll keep it close.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep track of everything that passes through Nighthaven, so the Keeper needn't. Ask, and I'll tell you what I've noted." },
    },
    background = { { id = "tp_bg", text = "I've served the Keeper as majordomo for longer than I'll admit, and I keep his house and the Circle's ledgers." } },
    advice = { { id = "tp_ad", text = "Don't go listening to the hearts of the world for answers. The answer is usually in you, and you already know it." } },
    cenarion_circle = { { id = "tp_circle", text = "The Keeper's charge, the Archdruid's pride, and my paperwork, though not in that order, some days." } },
    _none = { { id = "tp_none", text = "I'd have to look into it, and I do look into things. Give me time." } },
  },
}

P:NPC {
  key = "dendrite", id = TODO_NPC("Dendrite Starblaze"), name = "Dendrite Starblaze",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "formal" }, values = { "balance", "dutiful" },
  notices = { "form", "class" },
  impression = {
    first = "Formal as Dendrite Starblaze is about the Circle's trials, there is a dry humour hiding under it. Anyone not here for the trials is told the village is lovely this time of year.",
    third = "{name} met Dendrite Starblaze, who guides young druids through the Cenarion Circle's first trials in Moonglade.",
  },

  greetings = {
    { id = "g_trial", text = "Balance be with you. If you've come for the trials, you've come to the right elf. If not, the village is lovely this time of year." },
    { id = "g_druid", when = { class = "DRUID", maxLevel = 12 }, text = "A young druid, fresh from the trainer? Good. The Circle has been expecting you, even if you didn't know it." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the Great Bear Spirit's gift sits well on you. Remember where you learned it." },
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "Not a druid, are you? You're welcome all the same, though the trials are another matter." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Dendrite Starblaze, and I guide young druids through the Circle's first trials: the bear, the cleansing, the water. Each one teaches you something your trainer couldn't." },
        { id = "h_bear", tags = { "news" }, when = { questActive = TODO_QUEST("Great Bear Spirit") },
          text = "West along the mountains, you'll find the Great Bear Spirit, so listen to it. It doesn't say much, which makes what it says worth hearing." },
        { id = "h_bear_done", when = { questDone = TODO_QUEST("Great Bear Spirit"), maxLevel = 15 },
          text = "The Bear has seen you; I can tell by how you stand, rooted. Go back to your trainer now and claim what you've earned." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Power over Poison") },
          text = "Poison is only nature turned the wrong way, so learn to turn it back. That's a druid's whole art, in small." },
        { id = "h_lake", tags = { "news" }, when = { questActive = TODO_QUEST("Trial of the Lake") },
          text = "The lake holds what you need. Dive, and keep diving until the water feels like a friend rather than a threat." },
        { id = "h_sealion", when = { questActive = TODO_QUEST("Trial of the Sea Lion") },
          text = "The pendant's two halves lie far from here, in deep water. Ask the folk of Moonglade where; our flight masters, Silva and Bunthen, know more than they let on." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "The sea's yours now, as much as the forest. Few druids feel at home in both, so try to be one of the few." },
        { id = "h_skyborne", when = { race = "Skyborne", class = "DRUID" },
          text = "A druid of the shen'dorei! There are few of you, I'm told, and you look to the winds before the moon, but the trials don't mind which. Balance is balance." },
      },
      again = {
        { id = "h_again", text = "Ask what you like. A student who asks nothing learns nothing, in my experience." },
        { id = "h_again2", text = "Go on, then; the trials will keep a moment longer." },
      },
      choices = {
        { text = "What are the trials for?", next = "trials" },
        { text = "Tell me about the trial of the water.", next = "water" },
        { text = "Why would a druid learn to cure poison like a layman?", next = "poison" },
        { text = "I'm no druid. May I watch the trials?", next = "nondruid", when = { ["not"] = { class = "DRUID" } } },
        { text = "Where do I look for the pendant halves?", next = "pendant", when = { questActive = TODO_QUEST("Trial of the Sea Lion") } },
        { text = "My faith leans to the winds. Does that matter?", next = "winds", when = { race = "Skyborne", class = "DRUID" } },
        { text = "Thank you, Dendrite.", next = "END" },
      },
    },
    trials = {
      big = true,
      lines = {
        { id = "t_default", text = "A druid who can wear a shape but doesn't understand it is just a person in a costume. The trials teach the understanding. The shapes come after." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "The shapes seem like the fun part.", next = "fun" },
      },
    },
    fun = {
      lines = { { id = "f_default", text = "They are, and I'd never say otherwise. But a bear that doesn't know why it's a bear makes a very poor bear." } },
      choices = {
        { text = "Then what is the bear for?", next = "bear" },
        { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    bear = {
      lines = {
        { id = "b_default", text = "Strength of body and strength of heart, as the Great Bear Spirit puts it, and the second matters more. A mother bear guarding her cubs isn't strong because she's large; she's strong because she will not move." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    water = {
      lines = {
        { id = "w_default", text = "Two trials. First you dive Lake Elune'ara for a shrine bauble that crumbles if you dawdle, and carry it to the Shrine of Remulos, where Tajarri waits. Then you find the two halves of the Pendant of the Sea Lion and join them at the shrine." },
      },
      choices = {
        { text = "Why a pendant in two halves?", next = "water2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water2 = {
      lines = {
        { id = "w2_default", text = "One half holds the sea lion's agility and the other its endurance, and a druid in the water needs both in equal measure. Swim fast and tire early, and you drown; swim slow and never tire, and you never arrive." },
      },
      choices = {
        { text = "Balance again.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison = {
      lines = {
        { id = "p_default", text = "Because Cenarius gave us the power to purge poison with a word, and a gift that easy is easily misused. So we send our students to Auberdine's sick deer, or the Crossroads' sick gazelles, with nothing but salve and their own two hands." },
      },
      choices = {
        { text = "What was poisoning them?", next = "poison2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison2 = {
      lines = {
        { id = "p2_default", text = "Water, in both places: the falls of Cliffspring in Darkshore, and the pools atop Dreadmist Peak, which we think the Burning Blade fouled. Those animals are victims of a greater taint, and there are those in Darnassus who'd rather not see it." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If Darnassus won't look, I'll go and see for myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nondruid = {
      lines = {
        { id = "n_default", text = "Watch, by all means, though most of the trials happen underwater or a long way off, so there isn't much to see. Moonglade welcomes anyone who respects nature, and our wardens will stop anyone who doesn't." },
      },
      choices = {
        { text = "I'll respect it.", next = "BACK", fx = { affinity = 1, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant = {
      lines = {
        { id = "pe_default", text = "Ask Silva and Bunthen by the flight perches; between them they know where both halves were hidden. Then bring the halves back to the shrine and join them there, for they won't join anywhere else." },
      },
      choices = {
        { text = "I'll ask them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winds = {
      lines = {
        { id = "wi_default", text = "Not to me, and not to the Keeper, I think. The Circle has druids who pray to Elune and druids who pray to the Earth Mother, and the bears never seem to notice the difference." },
      },
      choices = {
        { text = "Good to know.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've guided many young druids through their trials, and they ask me a great many things. Ask what you need." },
    },
    background = { { id = "tp_bg", text = "I'm the Circle's guide for young druids in Nighthaven, and I've watched more bears take their first clumsy steps than I can count." } },
    advice = { { id = "tp_ad", text = "Learn the lesson before you learn the spell. The spell is the easy part." } },
    cenarion_circle = { { id = "tp_circle", text = "Our order and our duty, and Nighthaven is its hearth." } },
    _none = { { id = "tp_none", text = "That's not my trial to teach, but Loganaar might know, or Rabine." } },
  },
}

P:NPC {
  key = "loganaar", id = TODO_NPC("Loganaar"), name = "Loganaar",
  bible = "bibles/nighthaven.md", role = "trainer", tier = "service",
  communities = { "nighthaven" }, temper = { "calm" }, values = { "balance", "kind" },
  notices = { "class" },
  impression = {
    first = "Balance, says Loganaar, is something you carry, not somewhere you go. He suggested I sit a while for no reason at all, and it was better advice than it sounded.",
    third = "{name} met Loganaar, the calm druid trainer of Nighthaven, who teaches that balance begins within.",
  },

  greetings = {
    { id = "g_calm", text = "Peace, friend. Even inside these stone walls it's there, if you stop long enough to find it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "{g:Brother|Sister}, come in. If you're ready to learn, then I'm ready to teach." },
  },

  notice = {
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "You're no druid, but sit if you like. The quiet here costs nothing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Loganaar, and I train the druids who find their way to Nighthaven. Balance isn't somewhere you go; it's something you carry, and I help you pack." },
        { id = "h_dream", when = { minLevel = 20, class = "DRUID" },
          text = "One day the Dream will call you, and you'll sleep a long while among the purest of things. Learn all you can awake, first." },
        { id = "h_tea", when = { metBefore = true }, text = "Sit, if you have a moment, not for training but only to sit. Most druids forget to, and it shows in their bears." },
      },
      choices = {
        { text = "What brought you to Nighthaven?", next = "why" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "How do you find balance?", next = "balance" },
        { text = "Farewell.", next = "END" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "Look inward before you look outward. Most of what's out of balance in the world started out of balance in someone." } },
      choices = { { text = "Thank you.", next = "END", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "The quiet. Everywhere else the world was asking something of me, but here it only asks that I listen, and I've found that's plenty." },
      },
      choices = { { text = "I'll try to listen.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Balance comes from knowing a little of everything. Ask, and I'll share what I've learned." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Home, for those of us who've no other, and for some who have." } },
    _none = { { id = "tp_none", text = "Ask the quiet first, and then ask Rabine." } },
  },
}

P:NPC {
  key = "great_bear", id = TODO_NPC("Great Bear Spirit"), name = "Great Bear Spirit",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "patient" }, values = { "strength", "patience" },
  spiritSensitive = true,
  notices = { "form" },
  impression = {
    first = "The Great Bear Spirit speaks in a voice felt in the chest more than heard with the ears. It told me that strength that cannot wait is only noise, and I keep turning that over.",
    third = "{name} sat before the Great Bear Spirit in Moonglade, an ancient presence that teaches patience as the root of strength.",
  },

  greetings = {
    { id = "g_calm", text = "The great bear looks at you, calm and unhurried. Its voice, when it comes, is in your chest more than your ears." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "The spirit's gaze softens. You wear its shape, and it seems to know you, the way kin know kin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Old as the hills you walked to reach me, I am, and I do not hurry. Sit, and when you are still, I will speak." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Great Bear Spirit") },
          text = "You come to learn the bear, so learn this first: strength that cannot wait is not strength. It is only noise." },
        { id = "h_not", when = { ["not"] = { class = "DRUID" } },
          text = "Not of the Circle, this one. Still, you came all this way to sit with an old bear. That is a kind of wisdom too." },
        { id = "h_return", when = { metBefore = true }, text = "You came back, and most do not. They think one visit is a lesson learned, when it is only a lesson begun." },
      },
      again = {
        { id = "h_again", text = "The bear settles again, watching you with calm, unhurried eyes, and waits for you to speak." },
        { id = "h_again2", text = "The spirit's breath stirs the grass. There is more, if you are still enough to ask." },
      },
      choices = {
        { text = "What does the bear teach?", next = "teach" },
        { text = "What do you represent, spirit?", next = "represent" },
        { text = "I seek your blessing, to learn the way of the Claw.", next = "blessing", when = { class = "DRUID" } },
        { text = "I'm a priest. I came to pray where it's quiet.", next = "pray", when = { class = "PRIEST" } },
        { text = "(Sit quietly a while.)", next = "sit", fx = { affinity = 2 } },
        { text = "(Rise and leave the spirit in peace.)", next = "END" },
      },
    },
    teach = {
      big = true,
      lines = {
        { id = "t_default", text = "To endure, and to protect what stands behind you, and to sleep when the world is cold and wake when it is ready. Most of what is worth doing is waiting well." },
      },
      choices = {
        { text = "Teach me the strength of the body.", next = "body" },
        { text = "Teach me the strength of the heart.", next = "heart" },
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    represent = {
      lines = {
        { id = "r_default", text = "The strength that holds up a young druid, and the strength under the feet of an old one. I have been part of this world for as long as there has been a world to be part of." },
      },
      choices = {
        { text = "Then teach me what you can.", next = "teach" },
        { text = "(Bow your head.)", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    body = {
      lines = {
        { id = "bo_default", text = "Power and swiftness of action, little one, kept ready in mind as well as limb. The bear looks heavy, and those who think it slow and dull learn otherwise too late; let them think it." },
      },
      choices = {
        { text = "And the heart?", next = "heart" },
        { text = "(Let the lesson settle.)", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    heart = {
      lines = {
        { id = "he_default", text = "The heart is what makes you act, for reasons that are clean and honest. Keeping the balance is not sitting still; a mother bear guarding her young does not weigh both sides, and neither does an old bear at the mouth of his den." },
      },
      choices = {
        { text = "Am I ready, then?", next = "ready" },
        { text = "(Let the lesson settle.)", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes weighing both sides is what keeps a bear alive.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    ready = {
      lines = {
        { id = "re_default", text = "That remains to be seen, and the wisest and oldest druids are never truly ready when their time of testing comes. Go on all the same, for there will be a time when your strength is needed, and you will find it there." },
      },
      choices = {
        { text = "(Thank the spirit.)", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    blessing = {
      lines = {
        { id = "bl_default", text = "You have heard me, and the rest is yours to carry, not mine to give. Go back to Dendrite, and let him see what you have taken from this place." },
      },
      choices = {
        { text = "(Bow, and rise.)", next = "BACK", fx = { affinity = 2, standing = { nighthaven = 1 } } },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Pray, then, and I will keep still beside you, which is a thing I am very good at. Your Light and my mountain will not quarrel, little one; they have both been here too long for that." },
      },
      choices = {
        { text = "(Pray a while beside the bear.)", next = "BACK", fx = { affinity = 2, trait = { pious = 1 }, align = { light = 1 } } },
        { text = "I'll sit with you, but I've no prayer in me today.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "(Rise.)", next = "BACK" },
      },
    },
    sit = {
      lines = { { id = "s_default", text = "Good; few sit. Most come wanting, and leave still wanting, but you may come back whenever the world is too loud." } },
      choices = {
        { text = "(Stay a little longer.)", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "(Rise and go.)", next = "END" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have watched these hills a very long time, and I remember what I have seen. Ask, and I will answer slowly." },
    },
    background = { { id = "tp_bg", text = "The bear only looks at you. It has been here as long as the world has, and it does not seem to think that needs saying." } },
    advice = { { id = "tp_ad", text = "Keep yourself fit in body and in mind, little one, for the one without the other is only half a bear." } },
    _none = { { id = "tp_none", text = "The bear says nothing. It does not seem to think the question needs an answer." } },
  },
}

P:NPC {
  key = "silva", id = TODO_NPC("Silva Fil'naveth"), name = "Silva Fil'naveth",
  bible = "bibles/nighthaven.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "warm" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Silva Fil'naveth keeps the Circle's hippogryphs, and her oldest will not fly until she says its name politely. She turns away anyone who is not a druid, but so kindly that nobody can stay cross with her.",
    third = "{name} met Silva Fil'naveth, keeper of the Cenarion Circle's hippogryphs at Nighthaven.",
  },

  greetings = {
    { id = "g_flight", when = { class = "DRUID", faction = "Alliance" }, text = "Going home? The Circle's hippogryphs will carry you to Rut'theran, so climb on." },
    { id = "g_horde", when = { class = "DRUID", faction = "Horde" }, text = "Your flight's with Bunthen, friend, over by the wind riders. He'll see you to Thunder Bluff." },
    { id = "g_not", when = { ["not"] = { class = "DRUID" } }, text = "I'm sorry, but these birds fly for druids only. The Circle's rule, not mine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Silva, and I keep the Circle's hippogryphs. They fly one road only, to Rut'theran by Teldrassil, and only for druids; they're very particular." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You'd rather have your own wings, I imagine. These ones bite less than you'd think, if only slightly less." },
        { id = "h_names", when = { metBefore = true }, text = "The oldest of my hippogryphs won't fly unless I say her name first, and politely. I've stopped finding it strange." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night flights are the best. Teldrassil's lights come up out of the sea like someone's left a lantern for you." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are restless, but they'll wait for you." },
        { id = "h_again2", text = "Ask away; Rut'theran isn't going anywhere." },
      },
      choices = {
        { text = "Why only druids?", next = "rule" },
        { text = "Where can I find half of the sea lion's pendant?", next = "pendant", when = { questActive = TODO_QUEST("Trial of the Sea Lion") } },
        { text = "Show me the flight.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Farewell.", next = "END" },
      },
    },
    rule = {
      lines = {
        { id = "r_default", text = "The Circle keeps these birds for its own, so that a druid can come home to Moonglade and go back to the world without asking anyone's leave. Everyone else walks in through Felwood and Winterspring, I'm afraid." },
      },
      choices = {
        { text = "Couldn't you make one exception?", next = "exception", when = { ["not"] = { class = "DRUID" } } },
        { text = "That seems fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    exception = {
      lines = {
        { id = "e_default", text = "I could ask, and she'd bite me, and then she'd bite you. The answer's no, but it's a kind no, and the walk is lovely if you don't mind furbolgs." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    pendant = {
      lines = {
        { id = "p_alliance", when = { faction = "Alliance" },
          text = "North in Darkshore, where the Cliffspring River runs out into Mist's Edge, swim north until the sea floor drops away. There's a rock the fishermen call the Stone Claw, and what you seek is near it, but mind the threshers; they don't share." },
        { id = "p_horde", when = { faction = "Horde" },
          text = "In the northeast of the Barrens there's a pool the locals call the Sludge Fen, poisoned by the Venture Company's works. What you seek lies in the heart of it, and the goblins there hate a protector of nature on sight." },
        { id = "p_default", text = "One half lies in deep water, and I'll tell you where once you've taken the trial from Tajarri at the shrine." },
      },
      choices = {
        { text = "Thank you, Silva.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The hippogryphs carry riders, and riders carry news. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep the Circle's hippogryphs and fly druids home to Teldrassil. That's the whole of it, and it's enough." } },
    advice = { { id = "tp_ad", text = "Never walk behind a hippogryph you haven't been introduced to. I mean that more than I'd like to." } },
    _none = { { id = "tp_none", text = "I fly birds; Rabine knows everything else." } },
  },
}

P:NPC {
  key = "bunthen", id = TODO_NPC("Bunthen Plainswind"), name = "Bunthen Plainswind",
  bible = "bibles/nighthaven.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "For a keeper of wind riders, Bunthen Plainswind is a gentle and patient sort, and he admits he misses the wind on the Bluff. He seemed glad of a little conversation, since his riders offer so little.",
    third = "{name} met Bunthen Plainswind, who keeps the Cenarion Circle's wind riders for druids flying home to Thunder Bluff.",
  },

  greetings = {
    { id = "g_flight", when = { class = "DRUID", faction = "Horde" }, text = "Earth Mother keep you. The wind rider's saddled; Thunder Bluff is a long way and a short flight." },
    { id = "g_alliance", when = { class = "DRUID", faction = "Alliance" }, text = "Your flight's with Silva, little friend; her hippogryphs go to Rut'theran." },
    { id = "g_not", when = { ["not"] = { class = "DRUID" } }, text = "You're no druid, and these riders fly for the Circle alone. I'm sorry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bunthen Plainswind is my name, and I keep the Circle's wind riders, who fly for druids to Thunder Bluff. It's a short road through the sky, from one home to another." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "From the sky to the Bluff, your folk came, I hear, and the Earthen Ring vouched for you. The winds are kind to you. Let my riders be kind too." },
        { id = "h_rider", when = { metBefore = true }, text = "My riders grumble at Nighthaven's quiet, because they like the wind on the Bluff. So do I, if I'm honest, but don't tell the Keeper." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Mu'sha's eye is open over the lake, and it's a good night for flying. The riders know it too; listen to them fidget." },
      },
      again = {
        { id = "h_again", text = "Something more, friend? The riders can wait a little." },
        { id = "h_again2", text = "Ask, and I'll answer if I can. Wind riders aren't much for conversation, so I'm glad of it." },
      },
      choices = {
        { text = "Why do the Circle's riders fly for druids alone?", next = "rule" },
        { text = "Where can I find half of the sea lion's pendant?", next = "pendant", when = { questActive = TODO_QUEST("Trial of the Sea Lion") } },
        { text = "Show me the flight.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Farewell.", next = "END" },
      },
    },
    rule = {
      lines = {
        { id = "r_default", text = "They were given to the Circle so its druids could come and go between Moonglade and their own people. Silva keeps the same rule with her hippogryphs, and between us we see every druid home, whatever their banner." },
      },
      choices = {
        { text = "You and Silva get along, then?", next = "silva" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silva = {
      lines = {
        { id = "s_default", text = "She flies elves and I fly tauren and our beasts glare at each other across the perches, but we have never once quarrelled. That is Moonglade for you, friend; out there it would be a war." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
    pendant = {
      lines = {
        { id = "p_alliance", when = { faction = "Alliance" },
          text = "Search the waters of Westfall, west and a little north of where the Gold Coast Quarry meets the shore, where an anchor marks a sunken boat. The deep there will crush a swimmer who goes too far, so look for the bubbling fissure and breathe there." },
        { id = "p_horde", when = { faction = "Horde" },
          text = "In Silverpine, along the North Tide's Run, an old boat lies wrecked on the shore. Swim west of it to a lockbox on the sea floor, and use the bubbling fissure for breath, or the deep will take you." },
        { id = "p_default", text = "One half lies in deep water far from here. Take the trial from Tajarri at the shrine first, and then come and ask me again." },
      },
      choices = {
        { text = "Thank you, Bunthen.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The wind riders bring travellers, and travellers bring stories. Ask, and I'll tell you what I've heard." },
    },
    background = { { id = "tp_bg", text = "I keep the wind riders for the Circle and fly druids home to the Bluff, and that is work enough for one tauren." } },
    advice = { { id = "tp_ad", text = "Hold on with your knees, not your hands, and don't look down until you're over water." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle took my people in when others would not, and we remember that. The tauren remember everything kind." } },
    _none = { { id = "tp_none", text = "I fly the riders, friend. Ask the elves in the village." } },
  },
}
