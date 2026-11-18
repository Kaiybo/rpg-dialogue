-- Cenarion Hold's flight masters (0.72.0): Runk Windtamer (Horde wind riders) and Cloud Skydancer
-- (Alliance hippogryphs), who share a courtyard and a sky. Voice: bibles/hold_flight.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "runk", id = TODO_NPC("Runk Windtamer"), name = "Runk Windtamer", title = "Wind Rider Master",
  bible = "bibles/hold_flight.md", role = "flightmaster", tier = "service",
  communities = { "cenarion_hold" }, temper = { "calm", "dry" }, values = { "patient", "dutiful" },
  notices = { "race", "mount" },
  impression = {
    first = "Runk Windtamer keeps the Horde's wind riders at Cenarion Hold and talks to them more than to people. He watches the sky for sandstorms the way other tauren watch for rain.",
    third = "{name} met Runk Windtamer, the tauren wind rider master at Cenarion Hold.",
  },

  greetings = {
    { id = "o_cc_distrust", when = { gossip = { topic = "cenarion_circle", stance = "distrust" } }, text = "Windcaller Proudhorn says you think the Circle asks everyone else to bleed. The wind riders bleed too, traveller, and they don't complain about it." },
    { id = "g_default", text = "The riders are rested and the sky is clear, for now, as the Earth Mother wills it. Where are you bound?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. The riders know your smell by now, which is a kind of welcome." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the people. The riders settle better with a tauren on their backs; they say we sit still." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get down off that beast before my riders take offence. They are jealous of anything with legs that goes where they go." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Runk Windtamer, and these are the Horde's wind riders in Silithus. They fly to Mojache and Gadgetzan and Un'Goro Crater, and they fly in spite of the sand, which is more than I would do; a tauren was made for grass under his hooves." },
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You died from a fall, I think, because you stand back from the edge like a grunt who learned the hard way. Hold the straps and let my riders do the flying, and the ground will never catch you like that again." },
      },
      again = {
        { id = "h_again", text = "Something else? The riders grow restless, like a herd before a storm." },
        { id = "h_again2", text = "Ask. The sky can wait a moment." },
      },
      choices = {
        { text = "How do the wind riders bear the sand?", next = "sand" },
        { text = "You share the courtyard with the elves' hippogryphs?", next = "cloud" },
        { text = "I'd like to meet your riders.", next = "riders", when = { class = { "HUNTER", "DRUID", "SHAMAN" } } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Farewell, Runk.", next = "END" },
      },
    },
    sand = {
      lines = { { id = "s_default", text = "Badly. When a storm comes off the Scarab Wall I ground them all and cover their eyes, and they hate me for an hour, and then they forgive me." } },
      choices = {
        { text = "Do they really forgive you?", next = "sand_forgive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand_forgive = {
      lines = { { id = "sf_default", text = "They forgive me because I bring meat. It is the same with most creatures, and most people." } },
      choices = { { text = "Wise words.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    cloud = {
      lines = { { id = "c_default", text = "Cloud Skydancer and I keep to our own corners, and our beasts keep to theirs. The Circle says this is neutral ground, so we are neutral, and we nod to each other in the mornings." } },
      choices = {
        { text = "Is that peace, or just politeness?", next = "cloud_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloud_stance = {
      big = true,
      lines = { { id = "cs_default", text = "Out here, I am not sure there is a difference. The bugs do not care whose banner we fly, and the sand gets into everyone's eyes the same." } },
      choices = {
        { text = "Then the nod is worth keeping. Keep it.", next = "BACK", reply = "I will keep it, then, for as long as she keeps hers, and the winds may sort out the rest when this war is done.", fx = { align = { order = 1 } } },
        { text = "A nod won't stop an elf's arrow later.", next = "BACK", reply = "Perhaps not, but I have lived long enough to know that a hand raised first is the one that starts the war, so I will nod and watch.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "Slowly, with your palm open, and do not look them in the eye until they look at you first. There, that one likes you, the grey; she does not like many." } },
      choices = { { text = "Hello, grey one.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A tauren who learned the wind riders' ways in Thunder Bluff and was sent south because nobody else wanted the sand." } },
    advice = { { id = "tp_ad", text = "Never fly into a storm you can see. The ones you can't see are bad enough." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "My wind riders won't fly near the hives, because the bugs throw sand and the sand gets in their eyes. They're smart beasts, smarter than me sometimes." } },
    cairne = { { id = "tp_cairne", text = "Cairne rode a kodo, not a wind rider, and I've always thought it a waste of a good chief. Imagine him in the air!" } },
    thrall = { { id = "tp_thrall", text = "The Warchief flew a wind rider once, they say, and didn't care for it. I don't hold it against him." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The flight to Gadgetzan is long and hot, and the wind riders hate the goblins' landing pads. I hate the goblins' prices, so we're even." } },
    _none = { { id = "tp_none", text = "I know riders and wind, and the winds were my teachers. Ask someone else about the rest." } },
  },
}

P:NPC {
  key = "cloud_skydancer", id = TODO_NPC("Cloud Skydancer"), name = "Cloud Skydancer", title = "Hippogryph Master",
  bible = "bibles/hold_flight.md", role = "flightmaster", tier = "service",
  communities = { "cenarion_hold" }, temper = { "cheerful", "restless" }, values = { "loyal", "kind" },
  notices = { "race", "weary" },
  impression = {
    first = "Cloud Skydancer tends the hippogryphs at Cenarion Hold and would rather be in the air than anywhere on the ground. He fusses over his birds' feathers and sings to them when the sand blows.",
    third = "{name} met Cloud Skydancer, the night elf hippogryph master at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Where to, friend? Ishnu-alah; the birds are eager, and so am I, frankly." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon! The birds remember you, they're fluffing up." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah! It's good to see a kaldorei face; the birds miss home too, I think." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look worn thin, friend. Sit a moment before you fly, or you'll slide right off at the first turn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cloud Skydancer, and these are my hippogryphs, the finest in Silithus, which isn't saying much, since they're the only ones. They fly to Feathermoon, Gadgetzan and Un'Goro Crater, and they'd fly to Elune's moon itself if I asked." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are getting impatient, and so is the sun." },
        { id = "h_again2", text = "Go on. I can preen and listen at the same time." },
      },
      choices = {
        { text = "Your birds don't look happy in this desert.", next = "desert" },
        { text = "What do you think of the wind riders?", next = "runk" },
        { text = "Do you sing to them?", next = "sing", when = { class = { "DRUID", "PRIEST" } } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Farewell, Cloud.", next = "END" },
      },
    },
    desert = {
      lines = { { id = "d_default", text = "Not well, the poor dears. Sand gets in their feathers and they spend half the night preening, and so do I, with a brush, until my arms ache." } },
      choices = {
        { text = "Why not send them home?", next = "desert_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    desert_home = {
      lines = { { id = "dh_default", text = "Because the Circle needs couriers and the soldiers need a way home when they're hurt. The birds go where they're needed, and so do I." } },
      choices = { { text = "That's devotion.", next = "BACK", fx = { affinity = 1 } } },
    },
    runk = {
      lines = { { id = "r_default", text = "Runk's a quiet sort, and his beasts are uglier than mine, though I'd never say it to his face. We nod in the mornings, and once he lent me a bucket, which out here is practically a treaty." } },
      choices = {
        { text = "I'm not sure the Horde can be trusted.", next = "runk_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runk_stance = {
      big = true,
      lines = { { id = "rs_default", text = "Runk can be trusted with a bucket, and I'll start there. Whatever happens beyond the Hold's walls, here we're both just keepers of tired animals." } },
      choices = {
        { text = "Start with a bucket, then. Trust grows.", next = "BACK", reply = "That is how the old trees grew, one ring at a time, and I am content to let this trust grow slowly under the same sun.", fx = { align = { light = 1 } } },
        { text = "Don't turn your back on him, all the same.", next = "BACK", reply = "I hear you, and I will keep one eye on him as he keeps one eye on me, which I suppose is its own kind of courtesy.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sing = {
      lines = { { id = "s_default", text = "When the storms come, yes, an old Ashenvale lullaby my mother sang. The birds settle, and the soldiers pretend they aren't listening." } },
      choices = { { text = "Sing it for me sometime.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A keeper of hippogryphs from Ashenvale, sent south with the Circle and the sand. I'd go back tomorrow, but the birds would miss the work." } },
    advice = { { id = "tp_ad", text = "Lean into the turns, not away. Every new flier leans away, and regrets it at the first gust." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives look like scabs from the air, ugly and swollen, and the hippogryphs won't go near them. I don't blame them." } },
    teldrassil = { { id = "tp_teldrassil", text = "My birds came from Teldrassil, and I sing them the songs of the high branches when the sand blows. It keeps them calm, and me too." } },
    elune = { { id = "tp_elune", text = "Elune watches over the flyers, my grandmother said, and I've never fallen, so she must. I'd like to keep it that way." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins in Gadgetzan feed my hippogryphs dried fish, and the birds come home sick. I bring my own grain now." } },
    _none = { { id = "tp_none", text = "I only know the sky and the birds, friend, and neither the sky nor the moon is talking today." } },
  },
}
