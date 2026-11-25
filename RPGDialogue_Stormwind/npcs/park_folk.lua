-- The Park's other folk: the priestess of the Moon, the Grant sisters, Imelda by the well, and Shailiea on the paths.
-- Classic Park only (before it was destroyed). Voices: bibles/park_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_HOME = TODO_QUEST("Returning Home")
local Q_PRAYER = TODO_QUEST("Desperate Prayer")
local Q_PELTS = TODO_QUEST("Packaged Pristine Pelts")

-- Nara Meideros: the Sisterhood's door in a city of the sun's Light.
P:NPC {
  key = "nara_meideros", id = TODO_NPC("Nara Meideros"), name = "Nara Meideros", title = "Priest Trainer",
  bible = "bibles/park_folk.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "gentle", "calm" }, values = { "pious", "kind" },
  notices = { "shadow", "kaldorei", "priest" },
  impression = {
    first = "She asks if Elune blesses my travels and truly wants to know.",
    third = "{name} met Nara Meideros, a night elf priestess of Elune who trains priests in Stormwind's Park.",
  },

  greetings = {
    { id = "g_default", text = "Elune be with you, {class}. The Park is quiet this evening, and so am I, if you've need of a listening ear." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Welcome back to the shade, young priest. Your lessons will keep until you're ready for them." },
    { id = "g_home", when = { questActive = Q_HOME }, text = "Darnassus is a long road from here, I know, but Priestess Alathea won't keep her news forever." },
    { id = "g_prayer", when = { questActive = Q_PRAYER }, text = "The Cathedral is only across the canals, {name}. Go on, for the High Priestess is expecting you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon is up, and I'm the happier for it. Come and stand in her light a moment." },
  },

  notice = {
    { id = "n_shadow", cat = "shadow", when = { form = { "shadow" } },
      text = "Elune's light finds every corner of the dark, {class}, but I'll admit it's struggling to find you just now. Let the shadows go a while beneath these trees, if you would." },
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Ishnu-alah, child of Teldrassil. It does my heart good to see one of our own beneath human trees, even if they are rather young trees." },
    { id = "n_priest", cat = "priest", when = { race = "Human", class = "PRIEST" },
      text = "A priest of the Cathedral, and welcome. Your High Priestess and I trade news of our students like two aunts over a garden wall, so I suspect I've heard of you already." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Nara Meideros, a Priestess of the Moon. I teach the priests who find their way to this Park, and I keep the Sisterhood's door open in a city that prays to the Light of the sun." },
        { id = "h_home", key = true, tags = { "news" }, when = { race = "NightElf", class = "PRIEST", questBefore = Q_HOME },
          text = "Oh, yes, of course, there you are. A messenger from our order came looking for you not long ago, and she said something important waits for you in Darnassus, so go to the Temple of the Moon and speak to Priestess Alathea." },
        { id = "h_home_active", tags = { "news" }, when = { questActive = Q_HOME },
          text = "You haven't sailed yet? Priestess Alathea is waiting at the Temple of the Moon, and I believe the news has to do with how well you've grown in our ways." },
        { id = "h_home_recent", tags = { "news" }, when = { questRecent = { Q_HOME, days = 3 } },
          text = "You went home and came back to me, which pleases me more than I can easily say. Tyrande always likes to hear that those we train return safely, and so do I." },
        { id = "h_prayer", key = true, tags = { "news" }, when = { race = "Human", class = "PRIEST", questBefore = Q_PRAYER },
          text = "One of your priests was here a short while ago looking for you, and he asked me to send you to High Priestess Laurena at the Cathedral. I wouldn't worry, for he looked very much like a man carrying good news." },
        { id = "h_prayer_active", tags = { "news" }, when = { questActive = Q_PRAYER },
          text = "The Cathedral is just beyond the canals, and Laurena is not a woman who likes to be kept waiting. Go on, and Elune be with you." },
        { id = "h_prayer_recent", tags = { "news" }, when = { questRecent = { Q_PRAYER, days = 3 } },
          text = "So Laurena has taught you the prayer of last resort. I hope you never need it, and I hope you remember it the very moment that you do." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PRIEST" },
          text = "A priest from Ironforge, come all this way to the trees. Your people pray beneath the mountains, and I've always wondered how the Light finds you down there." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah, and welcome beneath the leaves. You have the look of someone who hasn't seen the moon over Teldrassil in some time, and I know that feeling well." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moon is up over the Park, and the city has gone quiet enough to hear the leaves. This is the hour I like best for talking, so sit if you wish." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Elune be with you, {class}, though I'll confess the trees have gone very still since you came under them." },
      },
      again = {
        { id = "h_again", text = "What else is on your heart, {name}?" },
        { id = "h_again2", text = "Go on. The moon is patient, and I try to be." },
        { id = "h_again3", text = "Ask what you like. Listening is half of a priestess's work." },
      },
      choices = {
        { text = "Train me, Priestess.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "You said a messenger came looking for me?", next = "msg_home", when = { race = "NightElf", class = "PRIEST" } },
        { text = "Who was the priest asking after me?", next = "msg_cathedral", when = { race = "Human", class = "PRIEST" } },
        { text = "Who are the Priestesses of the Moon?", next = "sisterhood" },
        { text = "Why teach in a human city?", next = "stormwind" },
        { text = "Tell me of Elune.", next = "elune" },
        { text = "You've some interesting neighbours in this Park.", next = "park" },
        { text = "Teach me something beyond the spells, Priestess.", next = "practise", when = { class = "PRIEST" } },
        { text = "Do your people think much of dwarven faith?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I was a novice of the Temple myself, Priestess.", next = "xorigin", when = { origin = "nightelf_priestess" } },
        { text = "I've come a long way since we last spoke.", next = "travels", when = { metBefore = true } },
        { text = "Would Elune hear someone who isn't a priest?", next = "anyone" },
        { text = "My magic troubles you, doesn't it?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Elune be with you too.", next = "END" },
      },
    },

    sisterhood = {
      lines = { { id = "sis_default", text = "We are the Sisterhood of Elune, and Tyrande Whisperwind is our high priestess. Your people picture us kneeling in temples, but in the war against the Burning Legion the priestesses rode to battle with bow and glaive, and we have never quite put them down.",
        fx = { learn = { "sisterhood_of_elune" } } } },
      choices = {
        { text = "Priestesses who fight? That sounds like a contradiction.", next = "sisterhood_war" },
        { text = "Tell me about Tyrande.", next = "tyrande" },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    sisterhood_war = {
      big = true,
      lines = { { id = "sw_default", text = "Only if you think mercy is the same as softness. We heal whom we can and stand against what cannot be healed, and Elune has never asked us to choose one and forget the other." } },
      choices = {
        { text = "Mercy comes first. A priest reaching for a bow has failed.", next = "BACK", reply = "That is the human Light's teaching, I think, more than Elune's, and it is not wrong. Still, I have known priestesses whose bows saved more lives than their prayers.", fx = { align = { light = 1 } } },
        { text = "Some evils only answer to arrows. You're right to fight.", next = "BACK", reply = "Elune's light falls on the sick and on the corrupted alike, and we answer each as it needs. I am glad you understand that.", fx = { align = { light = -1 } } },
        { text = "I'd ask about something else.", next = "BACK" },
      },
    },
    tyrande = {
      lines = { { id = "ty_default", text = "She has led us for longer than your kingdom has had kings, and still she waits for Malfurion to wake from the Dream. When she smiles at a student who has come home safely, the whole sea crossing is worth it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stormwind = {
      lines = { { id = "sw2_default", text = "Because priests find their calling wherever they happen to be standing, and some of ours are standing here, among the Alliance's soldiers and envoys. Someone must teach them, and someone must remind the humans that the moon has priests as well as the sun." } },
      choices = {
        { text = "Do the Cathedral's priests accept you?", next = "laurena" },
        { text = "The city must feel cramped after Teldrassil.", next = "stormwind_walls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    laurena = {
      lines = { { id = "la_default", text = "High Priestess Laurena has been kinder than I had any right to expect. When one of her students wanders through the Park, or one of mine wanders toward the Cathedral, we send each other word, and between us very few young priests go astray." } },
      choices = {
        { text = "Have you been inside the Cathedral yourself?", next = "cathedral" },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    cathedral = {
      big = true,
      lines = { { id = "ca_default", text = "Not once, though I've stood at its doors more evenings than I'd care to admit. It is their house, built for their Light, and I've never been sure whether a priestess of the Moon would be a guest there or a curiosity." } },
      choices = {
        { text = "Every faith should keep its own house. You're wise to wait.", next = "BACK", reply = "Perhaps, though I think wisdom and fear wear very similar robes on the Cathedral steps. Thank you for being kind about it.", fx = { align = { order = 1 } } },
        { text = "Doors are for walking through, Nara. Go in tomorrow.", next = "BACK", reply = "Tomorrow, you say? You humans are so very brave about doors. Perhaps I shall, and perhaps Laurena will pour the tea after.", fx = { align = { order = -1 } } },
        { text = "I'll walk in with you some evening, if you like.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormwind_walls = {
      lines = { { id = "swl_default", text = "It does, though the Park helps, and the Cathedral's sunset bell helps more. Sheldras says the trees here try very hard, and he's right; I walk among them at night and pretend the stone isn't there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    elune = {
      lines = {
        { id = "el_default", text = "Elune is the Mother Moon, who watches over every living thing, and her light is kindest in the dark, when it's needed most. She doesn't speak in thunder, {class}; she answers in small mercies, and you have to be quiet to notice them." },
        { id = "el_human", when = { race = "Human", class = "PRIEST" },
          text = "Elune is the Mother Moon, and you'll find her less like your Light than you expect and more like it than Laurena would admit. She answers in small mercies, and a priest learns to be quiet enough to notice them." },
      },
      choices = {
        { text = "Your Elune and our Light seem much alike.", next = "elune_light" },
        { text = "Why the moon, and not the sun?", next = "elune_moon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elune_light = {
      big = true,
      lines = { { id = "elt_default", text = "Laurena and I have argued that over a great many cups of tea, and we agree only that both teach mercy. She thinks the Light is a truth that needs no face, and I think Elune has a face and a name, and neither of us has convinced the other yet." } },
      choices = {
        { text = "Each faith has its own truth. They should stay distinct.", next = "BACK", reply = "Laurena would agree, I think, and then we'd argue for another hour about which of us agreed first. Distinct, yes, but neighbours.", fx = { align = { order = 1 } } },
        { text = "Two names for one mercy. The difference hardly matters.", next = "BACK", reply = "That is a kind thought, and I share it some evenings. On others, I remember that names matter a great deal to those who pray.", fx = { align = { order = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    elune_moon = {
      lines = { { id = "elm_default", text = "Because the sun asks nothing of you, and the moon asks you to look up in the dark. My people lived ten thousand years by her light, and when the World Tree's gift left us she was still there, which is more than can be said for most promises.",
        fx = { learn = { "elune" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    park = {
      lines = { { id = "pk_default", text = "I have, and I'm fond of most of them. Sheldras teaches his druids beneath the old oaks, Shylamiir guards her herbs as if they were her children, and the Grant sisters argue by the well loudly enough to wake Malfurion." } },
      choices = {
        { text = "Tell me about Sheldras.", next = "park_sheldras" },
        { text = "Who's the elf who walks the paths in circles?", next = "park_shailiea" },
        { text = "What do the Grant sisters argue about?", next = "park_grants" },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_sheldras = {
      lines = { { id = "pks_default", text = "He'll speak to you of balance until the moon sets, and he means every word of it. We came to Stormwind in the same year, and we've kept each other from growing too homesick, mostly by complaining about the pigeons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    park_shailiea = {
      lines = { { id = "pksh_default", text = "That is Shailiea, and she walks those paths a hundred times a day, reading the tracks the way I read prayers. She was a tracker in Ashenvale once, and I don't think she has ever forgiven these walls for having no forest behind them." } },
      choices = {
        { text = "Is she all right?", next = "park_shailiea2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_shailiea2 = {
      lines = { { id = "pksh2_default", text = "She's restless, which isn't the same as unwell, though I keep an eye on her as one does. If you've a moment, walk a lap with her; she talks more freely to people who keep pace." } },
      choices = {
        { text = "I'll walk a lap with her, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_grants = {
      lines = { { id = "pkg_default", text = "Kimberly keeps the accounts for her family's fur trade, and Kelly would rather be anywhere but behind a ledger. Their other sister is somewhere in Feralas, at Thalanaar, and every parcel she sends starts the argument over again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    msg_home = {
      lines = {
        { id = "mh_default", text = "She was one of our order, a young priestess who had sailed from Rut'theran on purpose to find you. She would say no more than that you should go to Priestess Alathea, but she was smiling, and our messengers rarely smile." },
        { id = "mh_done", when = { questDone = Q_HOME },
          text = "And you went, and you came back, which is the part I always worry about. I hope the Temple treated you well, and that Alathea didn't keep you on your knees all night." },
      },
      choices = {
        { text = "How do I reach Darnassus from here?", next = "msg_home_road" },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    msg_home_road = {
      lines = { { id = "mhr_default", text = "Ride north through the Wetlands to Menethil Harbor, take the ship to Auberdine, and then the boat to Rut'theran Village beneath Teldrassil. It is a long way to go for one conversation, but Alathea's conversations are usually worth it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    msg_cathedral = {
      lines = {
        { id = "mc_default", text = "A young priest of the Cathedral, very earnest, who held his hands as if he were carrying a candle. He said High Priestess Laurena wished to see you, and I'd guess she means to teach you the prayer your people make when there's nothing left to pray with." },
        { id = "mc_done", when = { questDone = Q_PRAYER },
          text = "The same earnest young man, and he came back afterwards to thank me for sending you, which I thought very sweet. Laurena speaks well of you, {name}, and she doesn't speak well of many." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    practise = {
      lines = {
        { id = "pr_default", text = "Learn to listen before you heal. A wounded soldier will tell you the arrow is the trouble, and sometimes it's the fear behind it, and the Light and Elune both mend fear more slowly than flesh." },
        { id = "pr_old", when = { minLevel = 40 },
          text = "Learn when not to heal. You're strong enough now to keep almost anyone standing, and sometimes the kindest prayer is the one that lets a weary soldier fall back and live." },
      },
      choices = {
        { text = "Some priests turn to the shadow instead.", next = "practise_shadow" },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    practise_shadow = {
      big = true,
      lines = { { id = "ps_default", text = "Some do, and it's a path I've never understood. My people knew a hunger for power that drowned a continent, and I see a little of that hunger in priests who learn to wound with their prayers, though Laurena tells me the Light allows it, and she's no fool." } },
      choices = {
        { text = "Shadow is a tool. A wise priest uses every tool.", next = "BACK", reply = "A tool can cut the hand that holds it, and shadow cuts deeper than most. I will not forbid it, but I will pray for you.", fx = { align = { light = -1 } } },
        { text = "A priest's prayers should mend, never wound.", next = "BACK", reply = "Then we see this alike, and Elune is glad of it. Come and sit with me when the Park is quiet.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = { { id = "xd_default", text = "Rather a lot, from what I've seen. Your people pray the way you build, stubbornly and in stone, and I've met dwarven priests in this very Park who could out-pray a whole temple of mine." } },
      choices = {
        { text = "We'd say the same of your Sisterhood, Priestess.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorigin = {
      lines = { { id = "xo_default", text = "Then you'll remember the novices' cold feet on the temple floor at dawn, and the pool that never quite warmed. I'd guess you came here thinking a human city could teach you something Darnassus couldn't, and I hope it has." } },
      choices = {
        { text = "It has. Humans pray louder, but no less truly.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Mostly it's taught me how much I miss home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    travels = {
      lines = { { id = "tr_default", text = "Then tell me, does Elune still bless your travels? I ask all my wanderers, because I so rarely get to go anywhere myself, and I like to hear the world through you." } },
      choices = {
        { text = "She does. I've been spared more than once.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "I've made my own luck, mostly.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "The roads have been cruel lately, Priestess.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    anyone = {
      lines = { { id = "an_default", text = "She hears everyone, {name}, whether they have been taught her prayers or not. The farmers of Elwynn leave milk out under a full moon without knowing why, and I like to think she doesn't hold the forgetting against them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlock = {
      big = true,
      lines = { { id = "xl_default", text = "It does, and I won't insult you by pretending otherwise. The thing at your heel was born of the same Legion my people bled to drive from this world, and every bargain your kind makes with it leaves a door open behind you." } },
      choices = {
        { text = "I hold the leash, Nara, and what's on it answers to me.", next = "BACK", reply = "So said many of the Highborne, once, before the Legion answered their call. I hope you are wiser than they were, truly.", fx = { align = { light = -1 } } },
        { text = "Then I'll keep my doors shut beneath your trees.", next = "BACK", reply = "I am sorry for it, and I will not pretend I am not relieved. Elune keep you on whatever road you take.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Sisterhood's teachings, the priests who pass through this Park, and a good deal of gossip I'm too polite to repeat. Ask, and I'll answer what I can." } },
    background = { { id = "tp_bg", text = "A Priestess of the Moon, sent to teach in a human city and grown fonder of it than I expected. I keep the Sisterhood's door open here, and I keep a candle by it." } },
    advice = { { id = "tp_ad", text = "Pray a little when things go well, too. Elune hears the frightened prayers easily enough, but I think she likes the grateful ones better." } },
    elune = { { id = "tp_elune", text = "Elune is the Mother Moon, and she has watched over my people since long before your kingdom's first stones were cut. Her light is kindest in the dark, which is when you'll need it." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind is our high priestess and the leader of our people, and she waits for Malfurion to wake. I have knelt before her twice in my life, and both times she knew my name." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "The priestesses of Elune, healers and warriors both, who keep the Temple of the Moon in Darnassus. I am one of them, though a long way from the Temple." } },
    teldrassil = { { id = "tp_teldrassil", text = "Our new World Tree, rising from the sea off Darkshore. I miss the sound of its leaves more than I miss its shade." } },
    _none = { { id = "tp_none", text = "I don't know, {name}, and a priestess who guesses aloud does more harm than one who admits it. Elune keeps some answers to herself, and so, it seems, does the world." } },
  },
}

-- Imelda: stands north of the Park's well every afternoon and knows everyone who passes it.
P:NPC {
  key = "imelda", id = TODO_NPC("Imelda"), name = "Imelda",
  bible = "bibles/park_folk.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "warm", "steady" }, values = { "loyal", "practical" },
  notices = { "soldier", "noble" },
  impression = {
    first = "Her father was a footman, and she still stands like his daughter.",
    third = "{name} met Imelda, a nursemaid who keeps watch by the well in Stormwind's Park.",
  },

  greetings = {
    { id = "g_default", text = "Afternoon, {name}. Mind the wet stones by the well; the children splash more than they drink." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "You walk like a soldier, {g:lad|lass}. My father would have liked the look of you." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the well again? You'll have the Park gossiping about you next." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "There's the Cathedral bell. I'll have to fetch the little ones home soon, but I've a minute yet." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "You hold that weapon low and easy, the way my father always told me to, and not the way the young guardsmen do. Someone taught you properly." },
    { id = "n_noble", cat = "noble", when = { origin = "human_minor_noble" },
      text = "I'd know a noble house's manners anywhere, even under road dust. I spend my days teaching them to merchant children who'd rather be climbing trees." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Imelda, and pleased to meet you. I mind a cloth merchant's two children on the north side of the Park, and while their tutor has them at their sums, I stand by this well and watch the whole city go by." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A soldier, by the way you stand. My father was a footman in the Second War, and I still look at every warrior who passes and wonder whether he'd have approved of their grip." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Good afternoon to you. I've got used to your people in the Park, but I still can't tell how old any of you are, and I've stopped guessing out loud since I called Shylamiir a young thing." },
        { id = "h_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "You've a northern way of talking, from Lordaeron, I'd guess. My father served beside men from there in the war, and he always said they were the steadiest soldiers he knew." },
        { id = "h_dusk", when = { timeOfDay = "dusk" },
          text = "The bell's rung, and the elves have gone quiet the way they do at sunset. I've a few minutes yet before the little ones need fetching home, so talk if you like." },
      },
      again = {
        { id = "h_again", text = "What else, then? The tutor won't let them out for a while yet." },
        { id = "h_again2", text = "Go on. I've nowhere to be until the bell rings." },
      },
      choices = {
        { text = "What brings you to this well every day?", next = "well" },
        { text = "You stand like someone who's held a sword.", next = "sword" },
        { text = "You must know everyone in the Park.", next = "folk" },
        { text = "You look like you'd rather be somewhere else.", next = "elsewhere" },
        { text = "Merchant children, taught noble manners? That's ambitious.", next = "xnoble", when = { origin = "human_minor_noble" } },
        { text = "What did your father say of Lordaeron?", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Do humans truly like having us in their Park?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Did your father ever tell you about the war?", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Good day to you, Imelda.", next = "END" },
      },
    },

    well = {
      lines = { { id = "w_default", text = "The children, mostly, though the well is the best place in the Park to stand and see who's coming. Everyone stops here sooner or later, for a drink or a rest or a quarrel, and I've learned more about this city in a season by the well than in a lifetime of living in it." } },
      choices = {
        { text = "Tell me about these children you mind.", next = "well_children" },
        { text = "What sort of quarrels happen at a well?", next = "well_quarrel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_children = {
      lines = { { id = "wc_default", text = "Two of them, a boy of nine who wants to join the Stormwind Guard and a girl of six who wants to be a night elf. Their father sells good wool in the Trade District and wants them raised like a lord's children, so I teach manners in the mornings and fish them out of the pond in the afternoons." } },
      choices = {
        { text = "A girl who wants to be a night elf?", next = "well_girl" },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_girl = {
      lines = { { id = "wg_default", text = "She follows Shailiea around the paths and tries to walk without making a sound, and the poor elf is far too polite to tell her to go home. Kelly Grant has been teaching her elvish words, too, which hasn't helped in the least." } },
      choices = {
        { text = "Let her dream. Children grow out of it soon enough.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_quarrel = {
      lines = { { id = "wq_default", text = "Mostly the Grant sisters, I'm sorry to say. Kimberly wants Kelly to mind the family's furs, Kelly wants to go off adventuring like their sister in Feralas, and they have the same row by this well about once a week, very loudly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sword = {
      lines = { { id = "s_default", text = "You've a good eye. My father was a footman of Stormwind, and since he never had a son, he taught me everything he would have taught one, and my mother never quite forgave him for it." } },
      choices = {
        { text = "What happened to your father?", next = "sword_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sword_father = {
      lines = { { id = "sf_default", text = "He came home from the Second War with a bad knee and a worse temper, and he spent ten years after it drilling me in the yard behind our house in Old Town. He's been gone four winters now, and I still keep his sword oiled, though I've had no call to draw it." } },
      choices = {
        { text = "Did he think the war was worth it?", next = "sword_war" },
        { text = "Something else, Imelda.", next = "BACK" },
      },
    },
    sword_war = {
      big = true,
      lines = { { id = "sw_default", text = "Some days he said Stormwind was rebuilt on the backs of the men who fought for it, and some days he said the nobles took the credit and left the soldiers the bills. I think both were true, and I think it ate at him that the stonemasons who rebuilt the city were never paid for it either." } },
      choices = {
        { text = "The crown keeps the kingdom safe. Soldiers know what they sign for.", next = "BACK", reply = "My husband would have said the same some days, and then cursed the crown at supper. I suppose both were true.", fx = { align = { order = 1 } } },
        { text = "Then the nobles owe them still, and should be made to pay.", next = "BACK", reply = "He'd have liked you, I think. He'd have bought you a drink and told you about the wall at Grim Batol until closing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    folk = {
      lines = { { id = "f_default", text = "Near enough. There are the elves, who are lovely and very strange, and the Grant sisters, who are lovely and very loud, and a hundred apprentices from the Mage Quarter who cut through on their way to somewhere else." } },
      choices = {
        { text = "What do you make of the elves living here?", next = "folk_elves" },
        { text = "Tell me about the Grant sisters.", next = "folk_grants" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_elves = {
      big = true,
      lines = { { id = "fe_default", text = "I like them, truth be told, though half my neighbours think the Park's gone strange since they came. Nara the priestess tends to anyone who falls ill by the well, and I've never once heard her ask what god they pray to." } },
      choices = {
        { text = "The Alliance is stronger when we share our cities.", next = "BACK", reply = "That's how I feel too, most days. The priestess brings me soup when my chest is bad, and I'll not hear a word against her.", fx = { align = { order = -1 } } },
        { text = "They're guests here. Guests should keep to their own customs.", next = "BACK", reply = "They do keep to their own ways, dearie, mostly in the trees, but I'll not begrudge them a bit of green in this stone city.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_grants = {
      lines = { { id = "fg_default", text = "Kimberly is the eldest and keeps the accounts, and Kelly is the youngest and keeps her head in the clouds. They love each other fiercely, you understand, but you'd never know it from listening to them by the well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    elsewhere = {
      lines = { { id = "e_default", text = "Is it so plain? I've never been further than Goldshire, if you'll believe it, and I'm thirty years old. Every adventurer who stops at this well has been somewhere I've only heard of, and I go home and lie awake thinking about it." } },
      choices = {
        { text = "Then why not go?", next = "elsewhere_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elsewhere_go = {
      big = true,
      lines = { { id = "eg_default", text = "Because the children need me and my mother needs my wages, and there's always a reason that's better than mine. Still, I keep Father's sword oiled, and I tell myself that means something." } },
      choices = {
        { text = "Your family needs you. That's a duty worth keeping.", next = "elsewhere_ask", fx = { align = { order = 1 } } },
        { text = "Life's short, Imelda. Go before the chance is gone.", next = "elsewhere_ask", fx = { align = { order = -1 } } },
        { text = "Where would you go first?", next = "elsewhere_ask" },
      },
    },
    elsewhere_ask = {
      lines = { { id = "ea_default", text = "To the sea, I think, at Westfall or Menethil, just to see it go on forever. You've seen it, haven't you? Tell me true, is it as big as they say?" } },
      choices = {
        { text = "Bigger. It makes the city feel very small.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "It's just water, Imelda. Grey and cold.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Westfall's coast isn't safe. Go to Menethil instead.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    xnoble = {
      big = true,
      lines = { { id = "xn_default", text = "Their father thinks a merchant's coin should buy a lord's manners, and I can't say he's wrong. There are old houses on the hill with their silver pawned and their roofs leaking, poorer than he is now, and you'd know that better than I would, I expect." } },
      choices = {
        { text = "Birth still counts for something. Coin can't buy everything.", next = "BACK", reply = "It does, and my mother would agree with you. Still, I've seen birth count for very little when the rent is due.", fx = { align = { order = 1 } } },
        { text = "Good. The old houses grew fat and lazy anyway.", next = "BACK", reply = "Hush now, not so loud by the well, the old houses have long ears! Though I'll admit some of them could stand a hard winter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrefugee = {
      lines = { { id = "xr_default", text = "That Lordaeron's men would hold a line in the rain without a word of complaint, and then sing all night afterwards. He grieved when he heard what became of it, and I'm sorry for whatever you lost there." } },
      choices = {
        { text = "Thank you, Imelda. It helps to hear that.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = { { id = "xne_default", text = "Some do, and some grumble, and most simply haven't decided yet. The children love you, and their mothers notice that, and I've never seen the Park so well kept as it's been since your druids came." } },
      choices = {
        { text = "That's kind of you to say.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = { { id = "xw_default", text = "Only when he'd had a cup too many, and then only about the men beside him, never the fighting. He used to say a soldier's courage was for his friends and his anger was for the enemy, and the trouble starts when you mix them up." } },
      choices = {
        { text = "Wise man. I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Park and everyone who stops at this well, which is nearly everyone. Ask away." } },
    background = { { id = "tp_bg", text = "A footman's daughter from Old Town who minds other people's children. It's honest work, and it leaves me plenty of time to watch the world." } },
    advice = { { id = "tp_ad", text = "Keep your blade oiled even when you don't need it. My father said that, and he said it about more than swords." } },
    the_park = { { id = "tp_park", text = "The Park is the prettiest corner of the city, and the strangest since the elves came. Mind the pond if you've children with you; it's deeper than it looks." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid. Ask me who's quarrelled by the well this week, and I'll do better." } },
  },
}

-- Kimberly Grant: the eldest Grant sister, keeper of the family's fur accounts.
P:NPC {
  key = "kimberly_grant", id = TODO_NPC("Kimberly Grant"), name = "Kimberly Grant",
  bible = "bibles/park_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "brisk", "sharp" }, values = { "practical", "family" },
  notices = { "skinner", "hunter" },
  impression = {
    first = "She worries about both her sisters out loud.",
    third = "{name} met Kimberly Grant, who sells her sister's Feralas furs from Stormwind's Park.",
  },

  greetings = {
    { id = "g_default", text = "If you're selling, I'm not buying, and if you're buying, I've nothing in until my sister Kristy's next parcel." },
    { id = "g_active", when = { questActive = Q_PELTS }, text = "Is that Kristy's knot on that parcel? Bring it here before Kelly sees it." },
    { id = "g_done", when = { questDone = Q_PELTS }, text = "The pelts sold in a week, every one. Kristy will be insufferable." },
    { id = "g_skinner", when = { profession = "Skinning" }, text = "A skinner. Let me see your hands, and I'll tell you if you cut clean." },
  },

  notice = {
    { id = "n_skinner", cat = "skinner", when = { profession = "Skinning" },
      text = "You've the smell of the skinning knife about you, and I mean that kindly. Most folk who cut hides can't tell a pristine pelt from a ruined one, and my sister would say you look like you could." },
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER" },
      text = "A hunter. If you ever go as far as Feralas, and you see a woman at Thalanaar arguing with the elves over hyena hides, that's my sister, and you can tell her to write more often." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Kimberly Grant. My family trades in furs, and since my sister Kristy does the hunting in Feralas and my sister Kelly does nothing at all, I do the selling and the worrying." },
        { id = "h_before", key = true, tags = { "news" }, when = { questBefore = Q_PELTS, minLevel = 40 },
          text = "You look like you get about. My sister Kristy is out at Thalanaar, on the edge of Feralas, and she's due to send me a parcel of pelts, so if you're ever down that way, she could use a courier who won't get eaten." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_PELTS },
          text = "That's Kristy's parcel, I'd know her knots anywhere; she ties them like she's afraid the hides will run off. Hand it over, and tell me she's eating properly." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { Q_PELTS, days = 3 } },
          text = "Pesterhide pelts, not a nick on them, packed in salt and cedar the way Mother taught us. I've already had three tailors from the Trade District round to look, and I've sent two of them away for insulting the price." },
        { id = "h_later", when = { questLater = { Q_PELTS, days = 7 } },
          text = "Kristy's pelts are all sold, and I've written to tell her so, and I've told her to come home for a season. She won't, of course, but I've told her." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and you'll know a good hide when you see one. Kristy would like you; she likes anyone who doesn't flinch at the smell of a curing shed." },
        { id = "h_pickpocket", when = { origin = "human_canal_pickpocket" },
          text = "I'll keep my purse on this side of the bench, if it's all the same to you. I grew up near the canals, too, and I know that walk." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've accounts to finish before Kelly wanders off again." },
        { id = "h_again2", text = "Go on, then, quickly. Time is coin, and I've less of both than I'd like." },
      },
      choices = {
        { text = "What sort of furs do you trade?", next = "trade" },
        { text = "Tell me about your sister in Feralas.", next = "kristy" },
        { text = "You and Kelly don't seem to agree much.", next = "kelly" },
        { text = "I've brought a parcel from Kristy.", next = "pelts_deliver", when = { questActive = Q_PELTS } },
        { text = "Did Kristy's pelts sell well?", next = "pelts_after", when = { questDone = Q_PELTS } },
        { text = "What makes a pelt pristine, to your eye?", next = "xskinner", when = { profession = "Skinning" } },
        { text = "I could hunt for your family, if the price were right.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Do the night elves make good neighbours?", next = "park_elves" },
        { text = "Your father started the business, then?", next = "father" },
        { text = "I could carry Kristy's parcel, if I'm down that way.", next = "pelts_before", when = { questBefore = Q_PELTS, minLevel = 40 } },
        { text = "I've seen Feralas myself. It's wild country.", next = "feralas_been", when = { minLevel = 40 } },
        { text = "Good luck with the accounts, Kimberly.", next = "END" },
      },
    },

    trade = {
      lines = { { id = "t_default", text = "Whatever Kristy can buy or skin out in Feralas and Thousand Needles: hyena, mostly, and some cat when she's lucky. Hyena doesn't sound grand, I know, but a Pesterhide pelt cleaned properly is as soft as anything from Ashenvale, and the tailors here can't get enough of it." } },
      choices = {
        { text = "Who buys hyena pelts in Stormwind?", next = "trade_buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_buyers = {
      lines = { { id = "tb_default", text = "Tailors and leatherworkers in the Trade District, and through them a good many lords up by the Keep, though the nobles think they're wearing something far more exotic. I never correct them; a lord who pays for mystery deserves to keep it." } },
      choices = {
        { text = "So you charge the nobles extra?", next = "trade_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_price = {
      big = true,
      lines = { { id = "tp_default", text = "I charge what they'll pay, and the tailors charge them double that again. Kristy risks her neck for every hide out there, and if a lord wants to pay for the privilege of a cloak, I don't see why my sister shouldn't eat well from it." } },
      choices = {
        { text = "A fair price is a fair price, whoever's buying.", next = "BACK", reply = "That's what I keep telling Kelly. If a lord pays a lord's price, that's his lookout, and the hides are worth it.", fx = { align = { honor = 1 } } },
        { text = "Good. Fleece them, if they're foolish enough to pay.", next = "BACK", reply = "Fleece them? I'd never say it so plain, but I'll not refuse their coin either. Kristy's boots don't pay for themselves.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kristy = {
      lines = { { id = "k_default", text = "Kristy's the middle one, and the brave one, or the foolish one, depending on which of us you ask. She went south two years ago to make the family's fortune in furs and ended up at Thalanaar, a little elven outpost between Feralas and Thousand Needles, and she's never come home since." } },
      choices = {
        { text = "Why Thalanaar, of all places?", next = "kristy_thalanaar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kristy_thalanaar = {
      lines = { { id = "kt_default", text = "Because the hyenas are thick there and the elves let her work, so long as she takes only what she needs. She writes that the Sentinels have taught her to skin a beast without wasting a scrap, and that she's never been so happy, and I believe the second part less than the first." } },
      choices = {
        { text = "You're worried about her.", next = "kristy_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kristy_worry = {
      lines = { { id = "kw_default", text = "Of course I'm worried; there are centaurs on one side of her and ogres on the other, and the parcels come later every season. I keep the accounts so I've something to do with my hands while I wait for the next one." } },
      choices = {
        { text = "She sounds like she can look after herself.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kelly = {
      lines = { { id = "ke_default", key = true, text = "We agree on plenty, so long as nobody asks Kelly to do any work. She's the youngest, and she spends her days learning elf words from Shailiea and mooning about Darnassus, while I spend mine making sure there's bread on the table." } },
      choices = {
        { text = "What does Kelly want to do?", next = "kelly_dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelly_dream = {
      lines = { { id = "kd_default", text = "Go to Teldrassil, or go to Feralas after Kristy, or go anywhere at all so long as it isn't here. She thinks I'm keeping her in a cage, and I suppose I am, but one sister out in the wilds is all my nerves can stand." } },
      choices = {
        { text = "Should you let her go?", next = "kelly_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelly_choice = {
      big = true,
      lines = { { id = "kc_default", text = "That's the question I ask myself every night, and I never like the answer. Father left the business to the three of us, and somebody has to stay and keep it, and Kristy's already chosen not to." } },
      choices = {
        { text = "Family comes first. Kelly should stay and do her share.", next = "BACK", reply = "That's what I keep telling her, though she never listens, and she gets a look in her eye whenever Shailiea comes by. Thank you, anyway.", fx = { align = { order = 1 } } },
        { text = "Let her go. Nobody should live out someone else's duty.", next = "BACK", reply = "You sound just like her, and maybe you're both right. But someone has to keep the shop when Kristy's in Feralas and Kelly's dreaming.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    father = {
      lines = { { id = "fa_default", text = "Thomas Grant, furrier, of the Trade District, and the finest judge of a wolf pelt in Elwynn. He bought from trappers all over the kingdom until the Defias made the roads too dangerous, and then he sat at home and drank and taught us all he knew." } },
      choices = {
        { text = "What became of him?", next = "father_sign" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_sign = {
      lines = { { id = "fs_default", text = "A fever took him two winters ago, and he left the business to the three of us with his name still on the sign. Kristy said the only way to keep it alive was to go where the furs were, and she was right, and I've never quite forgiven her for it." } },
      choices = {
        { text = "You're keeping his name alive, Kimberly. He'd be proud.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pelts_before = {
      lines = { { id = "pb_default", text = "Would you? Kristy will want proof you're not a thief, so tell her Kimberly says the ledger balances and Kelly still can't whistle. She'll know you've come from me, and she'll hand the parcel over." } },
      choices = {
        { text = "How do I find Thalanaar?", next = "pelts_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pelts_road = {
      lines = { { id = "pr_default", text = "It's on the eastern edge of Feralas, where the road comes up out of Thousand Needles, and the elves keep a moonwell there. Kristy writes that you'll smell the hyenas before you see the outpost, and that I should stop asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pelts_deliver = {
      lines = { { id = "pd_default", text = "Salt and cedar, just as Mother taught us, and not a moth in it. You've done the family a real kindness carrying this all the way from Thalanaar, and I won't forget it." } },
      choices = {
        { text = "Kristy sends her love, I'm sure.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pelts_after = {
      lines = { { id = "pa_default", text = "Every last one, and to a tailor who swore they were Ashenvale panther until I showed him the spots. Kristy's done well, and I'll tell her so, though not in so many words." } },
      choices = {
        { text = "What exactly are Pesterhide hyenas?", next = "pelts_hyenas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pelts_hyenas = {
      lines = { { id = "ph_default", text = "Big spotted brutes that run the canyons near Thalanaar in packs, from what Kristy writes. She says they laugh at night, and that it's the worst sound she's ever heard, and that their pelts are the best she's ever handled." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xskinner = {
      lines = { { id = "xs_default", text = "One long cut, no nicks, no scorch from a careless fire, and the fat scraped before it turns. Kristy would add that you thank the beast, but that's elf talk, and I've told her so." } },
      choices = {
        { text = "The elves have a point. Waste nothing, respect the kill.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "A hide's a hide. The tailors won't care.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      big = true,
      lines = { { id = "xh_default", text = "Everyone's price is right until the hyenas find them. I'll not hire a stranger to hunt beside my sister, though if you're in Feralas anyway, I'd sleep better knowing someone with a bow had stopped by Thalanaar." } },
      choices = {
        { text = "I'll look in on her, and not for pay.", next = "BACK", reply = "That's kinder than you had to be. Kristy will grumble at you, which means she's glad to see a friendly face.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Nothing's free, Kimberly. Not even looking in.", next = "BACK", reply = "No, nothing ever is in this trade. Forget I asked, then, and I'll keep worrying the old way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_elves = {
      lines = { { id = "pe_default", key = true, text = "Better than most. Nara Meideros tends anyone who's taken sick, and Shylamiir sells the cheapest peacebloom in the city, though she makes you feel like a thief for buying it. It's Shailiea I'd watch; she's filling Kelly's head with forests." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feralas_been = {
      lines = { { id = "fb_default", text = "Have you, now? Then tell me plainly, since Kristy never will: is Thalanaar safe, or is my sister lying to me in every letter?" } },
      choices = {
        { text = "The Sentinels keep it well. She's safer than you think.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Plainly? Nowhere in Feralas is safe.", next = "BACK", fx = { trait = { honest = 1 } } },
        { text = "I didn't stop long enough to say.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know furs, prices, and which tailors in the Trade District will try to cheat you. Ask quickly." } },
    background = { { id = "tp_bg", text = "The eldest Grant girl, with a sister in Feralas, a sister in the clouds, and a ledger I never get to close." } },
    advice = { { id = "tp_ad", text = "Never tell a buyer what you paid. Never tell a sister what you worry about, either; they only use it against you." } },
    feralas = { { id = "tp_feralas", text = "Great dripping forests and canyons full of hyenas, by Kristy's letters. Thalanaar sits on the eastern edge of it, and that's where she is." } },
    the_park = { { id = "tp_park", text = "Pretty enough, and full of elves, and the well is where my sister and I have all our rows. People seem to enjoy listening." } },
    _none = { { id = "tp_none", text = "I don't know and I haven't time to find out. If it doesn't have fur or a price, it isn't my business." } },
  },
}

-- Kelly Grant: the youngest Grant sister, who would rather be anywhere but behind a ledger.
P:NPC {
  key = "kelly_grant", id = TODO_NPC("Kelly Grant"), name = "Kelly Grant",
  bible = "bibles/park_folk.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "eager", "restless" }, values = { "curious", "family" },
  notices = { "kaldorei", "traveller" },
  impression = {
    first = "She asks more questions about the world than I ask her.",
    third = "{name} met Kelly Grant, a restless young woman in Stormwind's Park who dreams of Darnassus.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello! Don't tell Kimberly you saw me; I'm supposed to be counting pelts." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Ishnu-alah! Did I say that right? Shailiea says I'm getting better." },
    { id = "g_done", when = { questDone = Q_PELTS }, text = "You're the one who brought Kristy's parcel! Was she well? Was it beautiful there?" },
  },

  notice = {
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Oh, you're one of Shailiea's people! Please don't mind me staring; I'm trying to remember how you hold yourselves so still, so I can practise it later." },
    { id = "n_traveller", cat = "traveller", when = { minLevel = 40 },
      text = "You've been everywhere, haven't you? You've got the sort of boots that have walked off the edge of the map, and I'd give a year of Kimberly's ledgers to have boots like that." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Kelly, the youngest Grant, the one who isn't in Feralas and isn't keeping the accounts. I'm meant to be helping Kimberly, but I'd much rather be talking to someone who's been somewhere." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah, that's right, isn't it? Shailiea's been teaching me, and I've been dying to try it on someone who wouldn't laugh, though I suppose you're allowed to laugh a little." },
        { id = "h_pelts", tags = { "news" }, when = { questRecent = { Q_PELTS, days = 3 } },
          text = "You brought Kristy's parcel! Kimberly won't let me read the letter that came with it, so you'll have to tell me everything: did you see her, and is it as green down there as she says?" },
        { id = "h_kim", when = { heardLine = "kimberly_grant.ke_default" },
          text = "Kimberly's been telling you I do nothing all day, hasn't she? I can tell by your face. I do plenty; it just isn't counting." },
        { id = "h_veteran", when = { minLevel = 40 },
          text = "You look like you've been to the ends of the world and back again. Have you been to Feralas, or to Darnassus? Please say you have." },
      },
      again = {
        { id = "h_again", text = "What else? Kimberly hasn't noticed I'm gone yet." },
        { id = "h_again2", text = "Ask me anything, I don't mind. It's better than counting." },
      },
      choices = {
        { text = "What do you do here in the Park?", next = "park" },
        { text = "Tell me about your sisters.", next = "sisters" },
        { text = "You look like you're planning to run away.", next = "run" },
        { text = "Your sister says you hate ledgers.", next = "ledgers", when = { heardLine = "kimberly_grant.ke_default" } },
        { text = "Kimberly thinks Shailiea's filling your head with forests.", next = "forests", when = { heardLine = "kimberly_grant.pe_default" } },
        { text = "Ishnu-alah to you as well, Kelly.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I brought the parcel, yes. What do you want to know?", next = "xpelts", when = { questDone = Q_PELTS } },
        { text = "I've seen most of the map. Ask me something.", next = "xtraveller", when = { minLevel = 40 } },
        { text = "Back to your counting, Kelly.", next = "END" },
      },
    },

    park = {
      lines = { { id = "p_default", text = "Learn things, mostly, and not the things Kimberly wants me to. Shailiea teaches me elf words while she walks her circles, and Nara lets me sit nearby when she prays at night, and I've nearly learned how Sheldras whistles for the birds." } },
      choices = {
        { text = "What words has Shailiea taught you?", next = "park_words" },
        { text = "Nara lets you watch her pray?", next = "park_nara" },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_words = {
      lines = { { id = "pw_default", text = "Ishnu-alah, which is good fortune to you, and Elune-adore, which is a sort of blessing, and shan'do, which means a teacher you honour, though she won't let me call her that. She says I haven't earned a teacher yet, only a nuisance." } },
      choices = {
        { text = "Why does Shailiea bother teaching you?", next = "park_shailiea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_shailiea = {
      lines = { { id = "ps_default", text = "I think she's lonely, though she'd never say so. She was a tracker in Ashenvale, and there's nobody here to talk to about it except me, and I'll listen to anything about a forest, so I suppose we suit each other." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    park_nara = {
      lines = { { id = "pn_default", text = "As long as I'm quiet, which is the hardest part. She kneels in the moonlight and doesn't say anything at all for an hour, and when I asked her what Elune said back, she told me that was the wrong question and wouldn't tell me the right one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sisters = {
      lines = { { id = "s_default", text = "There's Kimberly, who's the eldest and thinks she's our mother, and Kristy, who's in the middle and went off to Feralas, and me. Father left us the fur trade, and Kristy got the adventure and Kimberly got the ledger, and I got told to wait my turn." } },
      choices = {
        { text = "What's Kristy like?", next = "sisters_kristy" },
        { text = "Kimberly seems to worry about you more than she lets on.", next = "sisters_kim" },
        { text = "What was your father like?", next = "sisters_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters_kristy = {
      lines = { { id = "sk_default", text = "Brave and funny and terrible at writing letters. She's at Thalanaar, with the night elves, skinning hyenas and sending the pelts home, and every time a parcel comes I read her letter until Kimberly takes it away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sisters_kim = {
      lines = { { id = "skm_default", text = "She does, I know she does, and that's the worst of it. If she were cruel I could just leave, but she sits up worrying about Kristy every night, and I can't bear to give her someone else to worry about." } },
      choices = {
        { text = "That's a kind reason to stay.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    run = {
      lines = { { id = "r_default", text = "Is it that obvious? I haven't packed anything, I swear, I've only been thinking about it, and asking every traveller who comes through the Park how much a passage to Auberdine costs." } },
      choices = {
        { text = "Where would you go?", next = "run_where" },
        { text = "And how much does a passage cost?", next = "run_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    run_cost = {
      lines = { { id = "rc_default", text = "More than I've saved and less than I'd feared, which is the most annoying answer there is. I've been putting a few coppers aside from every sale, in a sock under the floorboard, and if Kimberly ever finds it, I'll say it's for her birthday." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    run_where = {
      lines = { { id = "rw_default", text = "Darnassus first, to see the tree, and then down to Thalanaar to surprise Kristy. Shailiea says I'd last a week in Ashenvale, but she also says I walk like a startled deer, so I don't take everything she says to heart." } },
      choices = {
        { text = "So what's stopping you?", next = "run_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    run_stance = {
      big = true,
      lines = { { id = "rs_default", text = "Kimberly, and the business, and Father's name on the sign. Everyone tells me family comes first, but nobody ever tells Kristy that, so what do you think I ought to do?" } },
      choices = {
        { text = "Stay and help your sister. Your turn will come.", next = "BACK", reply = "You sound like Kimberly, and she'll be thrilled to hear it. I just wish my turn had a date on it, that's all.", fx = { align = { order = 1 } } },
        { text = "Go, Kelly. The world won't wait for your turn.", next = "BACK", reply = "You really think so? Don't tell Kimberly I asked you, because she'll go pale and start counting hides at me.", fx = { align = { order = -1 } } },
        { text = "That's not my choice to make.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    forests = {
      big = true,
      lines = { { id = "fo_default", text = "Kimberly thinks anything she can't count is dangerous. Shailiea only tells me what's true, that there's a whole world past the walls, and I don't see why knowing that should be a bad thing." } },
      choices = {
        { text = "Your sister's right. Dreams don't put bread on the table.", next = "BACK", reply = "Bread, bread, bread! That's all anyone says, and nobody ever asks what the bread is for in the first place.", fx = { align = { order = 1 } } },
        { text = "Keep listening to Shailiea. Kimberly's afraid of the world.", next = "BACK", reply = "I knew someone would understand! I'll tell Shailiea you said so, and maybe she'll show me the trail out of the Park properly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters_father = {
      lines = { { id = "sf_default", text = "He used to take me on his knee and name every pelt in the shop, where it came from and what the land was like there. I think that's where all this started, so it's really his fault and not Shailiea's at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ledgers = {
      lines = { { id = "l_default", text = "I don't hate them; I hate what they're for, which is sitting still and being sensible. Kimberly's brilliant with numbers, and I'm brilliant at losing the page, and we both know which of us Father should have left the business to." } },
      choices = {
        { text = "Every trade needs someone who can talk, not just count.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "You said it back! Oh, that's wonderful, Shailiea only ever sighs at me. Tell me, is Darnassus really built in the branches of one tree, or is she having a joke at my expense?" } },
      choices = {
        { text = "It is. The whole city sits on Teldrassil's boughs.", next = "xnelf_more" },
        { text = "Shailiea doesn't make jokes, Kelly.", next = "xnelf_more", fx = { trait = { witty = 1 } } },
      },
    },
    xnelf_more = {
      lines = { { id = "xnm_default", text = "I knew it! I'm going to see it one day, I promise you, and when I do, I'll say Ishnu-alah to the first person I meet and get it exactly right." } },
      choices = {
        { text = "I hope you do, Kelly. Elune-adore.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpelts = {
      lines = { { id = "xp_default", text = "Everything! Was Kristy brown as a nut, was she thin, did she ask about me? Kimberly read the letter twice and then locked it in the strongbox, which means there was something in it about me." } },
      choices = {
        { text = "She asked about you first, before anyone else.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I only carried the parcel. I didn't read letters.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtraveller = {
      lines = { { id = "xt_default", text = "Then tell me the most beautiful place you've ever been, and don't say Stormwind just to be polite. I keep a list in the back of Kimberly's ledger, where she never looks." } },
      choices = {
        { text = "Ashenvale, at night, when the wisps come out.", next = "xtraveller_list", fx = { trait = { kind = 1 } } },
        { text = "Ironforge. Nothing beats a dwarven forge-hall.", next = "xtraveller_list", fx = { trait = { witty = 1 } } },
        { text = "Nowhere's beautiful once you've had to fight there.", next = "xtraveller_list", fx = { trait = { stern = 1 } } },
      },
    },
    xtraveller_list = {
      lines = { { id = "xtl_default", text = "I'm writing that down, right now, under the hyena prices. One day I'll go and see every place on this list, and I'll think of you at each one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know elf words, and gossip, and which paths in the Park Shailiea walks at what hour. Ask me something!" } },
    background = { { id = "tp_bg", text = "The youngest Grant sister, stuck in Stormwind while the whole world happens somewhere else." } },
    advice = { { id = "tp_ad", text = "Learn a greeting in every language you can. Even if you say it badly, people smile." } },
    darnassus = { { id = "tp_darnassus", text = "The night elves' city, high up in the branches of Teldrassil. I'm going to see it one day, whatever Kimberly says." } },
    the_park = { { id = "tp_park", text = "The best part of Stormwind, because it's the only part that doesn't feel like Stormwind." } },
    _none = { { id = "tp_none", text = "I don't know that one, but I'd love to! Ask Shailiea; she knows everything, she just won't say it." } },
  },
}

-- Shailiea: a kaldorei tracker who walks the Park's paths because there is no forest to walk.
P:NPC {
  key = "shailiea", id = TODO_NPC("Shailiea"), name = "Shailiea",
  bible = "bibles/park_folk.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "dry", "restless" }, values = { "nature", "proud" },
  notices = { "beast", "stealth", "kaldorei" },
  impression = {
    first = "She reads footprints and can mostly tell where you have been.",
    third = "{name} met Shailiea, a restless night elf tracker who wanders Stormwind's Park.",
  },

  greetings = {
    { id = "g_default", text = "Walk if you want to talk. I don't stand still well." },
    { id = "g_mounted", when = { mounted = true }, text = "Off the beast, please. It's tearing up my paths, and I read them every morning." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Elune-adore. You walk like Teldrassil still, and that's a comfort here." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The paths are clearest at night, when the city stops trampling them." },
  },

  notice = {
    { id = "n_beast", cat = "beast", when = { pet = { type = "Beast" } },
      text = "Your {pet} puts its feet down where yours have been, which means it trusts you. That tells me more about you than anything you could say." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You're quieter than the humans, which isn't hard, but you bent the grass by the pond and you haven't let it spring back. Come out and talk properly." },
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Your tracks are the only ones in this Park that don't drag their heels. I'd forgotten how much I missed the sight of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Shailiea. I walk these paths because they're the only ones within the walls that still have earth on them, and I read what's written there because I can't stop, not after so many years of doing it in Ashenvale." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah, and walk with me a while. The humans think I'm mad for going round and round, but you'll understand that a tracker without a forest has to track something." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and you came in from the west gate, past the canals, with your beast a pace ahead of you. Don't look surprised; it's all in the mud by the bridge." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "There's a cat's pawprint by the oaks that turns into a pair of boots halfway down the path, which I'd guess was you. Sheldras's students never think to change back somewhere softer." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You put your feet on the stones and not the earth, which means you've learned not to leave tracks. I'd like to know who taught you, because they were very nearly good enough." },
      },
      again = {
        { id = "h_again", text = "Keep walking. What else?" },
        { id = "h_again2", text = "Another lap, then. Ask what you like." },
      },
      choices = {
        { text = "Why do you walk in circles?", next = "circles" },
        { text = "What do the tracks tell you about me?", next = "tracks" },
        { text = "Where did you learn to track?", next = "ashenvale" },
        { text = "Kelly Grant says you're teaching her elvish.", next = "kelly" },
        { text = "Nara Meideros worries about you, you know.", next = "nara" },
        { text = "Is there any trail here you can't read?", next = "mystery" },
        { text = "That pawprint by the oaks was mine, yes.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Could you teach a hunter what you see?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I scouted the forests too, before I came here.", next = "xorigin", when = { origin = { "nightelf_sentinel_scout", "nightelf_feralas_tracker" } } },
        { text = "You don't miss much, do you?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll let you walk on.", next = "END" },
      },
    },

    circles = {
      lines = { { id = "c_default", text = "Because the Park is small and I am not, and a straight line in this city ends at a wall in a few hundred paces. If I walk in circles, I can pretend the path goes on, and by the hundredth lap I've stopped noticing that it doesn't." } },
      choices = {
        { text = "Why stay in Stormwind, if the walls trouble you?", next = "circles_walls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circles_walls = {
      lines = { { id = "cw_default", text = "I came with the envoys after the war, to guide them about the human lands, and when they went home I found I'd nothing to go home to. Ashenvale is full of orc axes now, and I can't bear to stand in it and watch it fall tree by tree." } },
      choices = {
        { text = "Running from it won't save Ashenvale.", next = "circles_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circles_stance = {
      big = true,
      lines = { { id = "cs_default", text = "No, it won't, and I knew that long before you said it, so keep your counsel. The Sentinels need every bow they can find, and I tell myself that every morning, and every morning I take another lap instead." } },
      choices = {
        { text = "Then go back. Your people need you more than this Park.", next = "BACK", reply = "You think I don't know that? I'll go back when my leg lets me draw a bow without shaking, and not a day before.", fx = { align = { honor = 1 } } },
        { text = "You've earned your rest. Let the young ones hold the line.", next = "BACK", reply = "Rest is a word for the dead, stranger, and I'm not one yet. Still, I'll take the kindness, since it's offered.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tracks = {
      lines = {
        { id = "t_default", text = "That you came in by the Cathedral side, that your left boot is wearing faster than your right, and that you stopped at the well and didn't drink. You're in a hurry and you favour one leg when you're tired, and you should see to the boot." },
        { id = "t_mounted", when = { mounted = true },
          text = "That your mount's left foreleg lands heavier than the right, and that you ride it harder than you should through a garden. It'll go lame within the season if you don't let it rest." },
      },
      choices = {
        { text = "What else do the paths tell you?", next = "tracks_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tracks_city = {
      lines = { { id = "tc_default", text = "That the Mage Quarter's apprentices cut across the grass by the pond every morning, late, and that the guard on the north path naps behind the oak at noon. A small girl follows me on tiptoe most afternoons, and Imelda's boot prints come to fetch her back." } },
      choices = {
        { text = "Do you tell anyone what you see?", next = "tracks_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tracks_tell = {
      lines = { { id = "tt_default", text = "Only when it matters, and in a city it rarely does. I once found a cutpurse's trail from the Trade District to a cellar in Old Town and told the guards, and they thanked me and arrested the wrong man, so now I mostly keep the paths' secrets to myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ashenvale = {
      lines = { { id = "a_default", text = "In Ashenvale, among the Sentinels, though I was never one of their sworn warriors. I tracked for them, satyrs and furbolgs gone mad, and lately orcs, and I could read a week-old trail across a stream before your grandfather was born." } },
      choices = {
        { text = "Orcs in Ashenvale? What are they doing there?", next = "ashenvale_orcs" },
        { text = "Do you miss it?", next = "ashenvale_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashenvale_orcs = {
      big = true,
      lines = { { id = "ao_default", text = "Cutting it down, mostly. The Warsong orcs have built camps along the eastern edge and they fell the old trees for their war, and every one they take was standing when my mother was a girl." } },
      choices = {
        { text = "Then they should be driven out, whatever it costs.", next = "BACK", reply = "Spoken like someone who has never seen what it costs, but I'll not argue with the Sentinels' answer. Every tree is worth fighting for.", fx = { align = { light = -1 } } },
        { text = "There must be terms short of slaughter.", next = "BACK", reply = "Terms, with the Warsong? Go and ask them, if you can find one who'll speak before he swings. I've tried, and I bear the scar.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashenvale_home = {
      lines = { { id = "ah_default", text = "Every step. The ground here is packed hard by a thousand years of human boots, and in Ashenvale the moss gives back under your foot like it's glad you came. I don't expect you to understand that, but you asked." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kelly = {
      lines = { { id = "k_default", text = "Teaching is a generous word for it. She follows me round the paths asking what everything is called, and I tell her, because it's easier than telling her to go away, and because she remembers every word." } },
      choices = {
        { text = "You seem fond of her.", next = "kelly_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelly_fond = {
      lines = { { id = "kf_default", text = "She walks like a startled deer and she'll never be quiet a day in her life, and yes, I suppose I'm fond of her. Her sister Kimberly thinks I'm filling her head with forests, and Kimberly is right, and I haven't decided whether I'm sorry." } },
      choices = {
        { text = "Every head could use a few forests.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nara = {
      lines = { { id = "n_default", text = "Nara worries about everyone; it's what the Sisterhood trains them for. She sits up with her prayers, and I walk my laps, and every so often we pass each other in the dark and pretend not to notice that neither of us is sleeping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mystery = {
      lines = { { id = "m_default", text = "One. Some nights there's a great cat's track by the pond, heavier than any lynx in Elwynn, and it walks to the canal's edge and simply stops. I've decided it's one of Sheldras's students and that I don't want to know which one." } },
      choices = {
        { text = "Or something worse is prowling the Park.", next = "mystery_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mystery_more = {
      lines = { { id = "mm_default", text = "Then it's a very polite something worse, because it's never taken so much as a pigeon. I've tracked worse things than a druid out for a swim, and I know which ones leave blood behind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Then change back on the grass next time, not halfway down my path. A cat's print turning into a boot print is the kind of thing that sends the humans running for the guards, and I'm tired of explaining it." } },
      choices = {
        { text = "I'll be more careful, Shailiea.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let them run. They should get used to us.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xhunter = {
      big = true,
      lines = { { id = "xh_default", text = "I could tell you to look at the edges of a print, not the middle, and to read a trail backward to see where the beast was afraid. Whether you use that to hunt for food or for sport is your business, though I'll think less of you for one of them." } },
      choices = {
        { text = "I hunt what I need, and nothing more.", next = "BACK", reply = "Then you hunt as my people do, and the forest will remember you kindly. That's more than most humans can say.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The hunt is the sport. That's what makes it worth doing.", next = "BACK", reply = "Sport, is it? Then you'll learn nothing from me, and one day the forest will teach you the rest itself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorigin = {
      lines = { { id = "xo_default", text = "I thought so; you look at the ground before you look at faces, which is the mark of it. Tell me, then, are the Sentinels still holding the line, or have they started losing trees faster than they can count them?" } },
      choices = {
        { text = "They're holding, barely, but they're holding.", next = "BACK", fx = { affinity = 1 } },
        { text = "We're losing ground, Shailiea. We need every tracker.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Not in a garden, and not when someone's trying very hard to leave nothing behind. A careful step is still a step, and the ones who try hardest to be invisible always leave the neatest tracks of all." } },
      choices = {
        { text = "Then I'll be careless on purpose next time.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know tracks, forests, and who walked through this Park and when. Ask, while I'm walking." } },
    background = { { id = "tp_bg", text = "A tracker who came to guide the envoys and stayed when they left. Ashenvale was home; this Park is somewhere to put my feet." } },
    advice = { { id = "tp_ad", text = "Look at the edges of a footprint, not the middle. The middle tells you where they were, the edges tell you how they felt about it." } },
    ashenvale = { { id = "tp_ashenvale", text = "Ashenvale is the oldest forest my people still hold, and the orcs are cutting it down for their war. I tracked there for longer than Stormwind has stood." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels are Tyrande's warriors, who guard our forests by moonlight, and I tracked for them, though I never swore their oath." } },
    _none = { { id = "tp_none", text = "Nothing I've seen in the mud. Ask me something that leaves tracks." } },
  },
}
