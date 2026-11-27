-- Blackfathom Deeps: Argent Guard Thaelrid, the Argent Dawn's watcher in the flooded temple,
-- and Twilight Lord Kelris, who keeps the Twilight's Hammer's vigil over Aku'mai.
-- Voices: bibles/dg_thaelrid.md, bibles/dg_kelris.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Argent Guard Thaelrid: a night elf of the Argent Dawn, alone in the dark water.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_thaelrid", id = TODO_NPC("Argent Guard Thaelrid"), name = "Argent Guard Thaelrid",
  bible = "bibles/dg_thaelrid.md", role = "questgiver", tier = "quest",
  temper = { "grave", "earnest" }, values = { "dutiful", "faithful" },
  notices = { "class", "race" },
  impression = {
    first = "A sentinel's patience, worn thin by too many nights underwater.",
    third = "{name} met Argent Guard Thaelrid keeping watch in Blackfathom Deeps.",
  },

  greetings = {
    { id = "dp_rep_ad_h", when = { rep = { faction = "Argent Dawn", min = "Honored" } }, text = "Ishnu-alah. The Dawn honours you, and I'm glad to have one of our own beside me in these waters." },
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, my friend. Seeing a friendly face in these dark waters lifts my heart more than I can say." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep your voice down and your business short; the Deeps are dangerous enough without distractions." },
    { id = "g_default", text = "Ishnu-alah, traveler. Step softly here, because the water carries every sound down to the ones who worship below." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Blackfathom Villainy") }, text = "Kelris still draws breath, then. Go deeper, and bring me proof that the Twilight Lord's prayers have ended." },
    { id = "g_done", when = { questDone = TODO_QUEST("Blackfathom Villainy") }, text = "Since Kelris fell, the chanting from below has thinned. It hasn't stopped, but I can sleep an hour at a time now." },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of the Kaldorei, here in the halls our people raised to Elune. It grieves me that you must see them like this." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Then you can feel it too, the cold that sits under the old prayers to Elune." },
  },

  start = "hello",
  nodes = {
    w8_alone = {
      lines = { { id = "w8_alone_a", text = "Since the last new moon, and before that with two companions who went deeper and did not return. I keep their packs beside my own, in case they find their way back, though I know in my heart they will not." } },
      choices = {
        { text = "Who were they?", next = "w8_alone2" },
        { text = "You should come away from this place.", next = "w8_alone2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_alone2 = {
      lines = { { id = "w8_alone2_a", text = "A human priest of the Dawn and a Sentinel from Astranaar, and both of them braver than I am. I will not leave until someone carries word of what they found, and if that someone is you, I will finally sleep." } },
      choices = {
        { text = "I'll look for them below.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I serve the Argent Dawn, and they sent me here to watch the Twilight's Hammer and learn what they want in these ruins. What I've learned is that they want something old and very hungry woken up." },
        { id = "h_elf", when = { race = "NightElf" }, text = "These were temples once, sister of the moon, built when Ashenvale's shore still stood above the sea. The Sundering drowned them, and now worse things than water fill them." },
      },
      again = { { id = "h_again", text = "Ask what you must, friend. The water is cold and the dark is long, and a voice is welcome in it." }, { id = "h_again2", text = "Ask, but keep watch on the water while you do." } },
      choices = {
        { text = "Who are the Twilight's Hammer?", next = "hammer" },
        { text = "What is down there that they worship?", next = "akumai" },
        { text = "What was this place before?", next = "temple" },
        { text = "The Argent Dawn reaches a long way.", next = "dawn" },
        { text = "I've seen what the Scourge do in the north.", next = "north", when = { faction = "Horde" } },
        { text = "Elune has not forgotten this place, sister.", next = "elune", when = { race = "NightElf" } },
        { text = "I can feel that cold you mean.", next = "elune", when = { class = "PRIEST" } },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "How long have you watched these waters alone?", next = "w8_alone" },
        { text = "I'll go on.", next = "END" },
      },
    },
    hammer = {
      lines = { { id = "hm_default", text = "A cult of men and orcs and worse, who believe the world must end so something older can wake. Their leader here is Twilight Lord Kelris, and he leads their prayers to the creature in the deepest pool." } },
      choices = {
        { text = "Why would anyone want the world to end?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "I've asked that of the ones I've caught, and they smile as though I were a child. They say the old powers whisper to them in their sleep, and that the whispers promise them a place when everything else is gone." } },
      choices = {
        { text = "Then there's no reasoning with them.", next = "BACK", reply = "No, there isn't. Kill them cleanly, and burn whatever they write down.", fx = { align = { light = -1 }, learn = { "twilights_hammer" } } },
        { text = "Some of them might still be saved.", next = "BACK", reply = "Perhaps, and the Dawn would want me to say so. But not the ones down here, not anymore.", fx = { align = { light = 1 }, learn = { "twilights_hammer" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    akumai = {
      lines = { { id = "a_default", text = "They call it Aku'mai, and they feed it, and it grows. I have only seen its shadow move under the water, but the shadow was larger than any boat in Auberdine." } },
      choices = {
        { text = "Something that big can't just be killed.", next = "kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kill = {
      lines = { { id = "k_default", text = "Everything can be killed if enough brave people go together, and that's why I'm glad to see you. The lighting of the old braziers in the last chamber calls it up, or so the cultists' notes say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    temple = {
      lines = { { id = "t_default", text = "A temple to Elune on the shore of Ashenvale, long before the Sundering broke the land. You can still see the moon carved in the arches, if you hold a torch close and don't mind what's crawling on them." } },
      choices = {
        { text = "It's a shame to see it fouled.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "dw_default", text = "It does, though most of its strength is with the Plaguelands far to the north. The Dawn believes any darkness left to grow will one day join the rest, so we watch even the quiet corners." } },
      choices = {
        { text = "Why would a Sentinel join the Dawn?", next = "joined" },
        { text = "Something else.", next = "BACK" },
      },
    },
    joined = {
      lines = { { id = "jn_default", text = "Because the Dawn asks no one which banner they were born under, only whether they will stand against the dark. My sisters in Ashenvale thought me foolish to take a human order's oath, and some of them still do." } },
      choices = {
        { text = "Every race should answer the Dawn's call.", next = "BACK", reply = "That is the Dawn's hope as well, though hope is slow work.", fx = { align = { order = -1 } } },
        { text = "Your first duty is to your own people.", next = "BACK", reply = "Perhaps, and yet the dark does not care whose people it takes.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    north = {
      lines = { { id = "no_default", text = "Then you know why I watch this water so closely, whatever colours you wear. The Dawn takes help from orc and troll and Forsaken alike, so long as their blades are pointed at the right enemy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elune = {
      lines = { { id = "el_default", text = "I pray you're right. The priestesses who served here are long gone, but I light a small candle to the Mother Moon each night in the dry hall above, and I like to think the old stones notice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You carry yourself like one of the Dawn, whether you wear our colours or not. I'm glad to fight beside you." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been careless with me and with this place. The Dawn expects better, and so do I." },
    },
    twilights_hammer = { { id = "tp_th", text = "The Twilight's Hammer, cultists who pray for the end of the world.", next = "hammer" } },
    _none = { { id = "tp_none", text = "I'm sorry, but my mind is on the water. Ask me again somewhere drier." } },
  },
}
