-- Dorion, hunter trainer in the Cenarion Enclave, and his wolf Shadow (0.72.0). Voice: bibles/dorion.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "dorion", id = TODO_NPC("Dorion"), name = "Dorion", title = "Hunter Trainer",
  bible = "bibles/dorion.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "dry" }, values = { "patience", "loyalty" },
  notices = { "pet", "class" },
  impression = {
    first = "Dorion trains hunters in the Enclave with a grey wolf named Shadow lying across his feet. He says more to the wolf than to his students, and the wolf seems to listen better.",
    third = "{name} met Dorion, a hunter trainer of the Cenarion Enclave who keeps a wolf called Shadow.",
  },

  greetings = {
    { id = "g_hello", text = "Shadow's decided you're harmless. I'll take her word for it, for now." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Back for more, hunter? Good, then let's see what the forest has taught you since I last did." },
    { id = "g_away", when = { away = 14 }, text = "Shadow noticed you were gone {away} before I did. She always does." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10, class = "HUNTER" }, text = "You've grown into your bow since we last met. Shadow has stopped watching your hands, which means she trusts them." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you've been leaning on folk about the city. A good hunter doesn't need to frighten what it isn't hunting, remember that." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has a good coat and clear eyes, so you're feeding it properly. Shadow wants to say hello, if you don't mind her sniffing." },
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", pet = false },
      text = "No companion with you today? A hunter alone is only half a hunter. Shadow thinks so too, and she's never wrong about these things." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_ursangous", when = { killed = { name = "Ursangous" } }, text = "So you brought down Ursangous, the great bear of Ashenvale. Good, for that bear had grown far too used to the taste of hunters, and the Sentinels of Astranaar will walk easier for it." },
        { id = "h_default", key = true,
          text = "I am Dorion, and I teach hunters here at the Enclave, as I taught them in Ashenvale before the tree was planted. This is Shadow, who teaches them more than I do, so mind your manners around her and she'll mind hers around you." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Then sit, and tell me what you've tracked and what's tracked you, and I'll tell you what you did wrong." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Enclave visiting the hunters? Shadow can tell, you know. She sniffs at druids as if she's not sure which one of you is the wolf." },
      },
      again = {
        { id = "h_again", text = "Something else? Shadow's in no hurry, and neither am I." },
        { id = "h_again2", text = "Ask. I'm listening, and so is she." },
        { id = "h_again3", text = "Shadow's put her head back down, so I suppose you're staying. Go on." },
      },
      choices = {
        { text = "Tell me about Shadow.", next = "shadow" },
        { text = "What makes a good hunter?", next = "hunting" },
        { text = "I'd like to learn how to bond with a beast.", next = "bond", when = { class = "HUNTER" } },
        { text = "I'd like to train.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why did you leave Ashenvale?", next = "leave" },
        { text = "What beast should I tame next?", next = "tame", when = { class = "HUNTER", minLevel = 10 } },
        { text = "My people hunt with a gun. You disapprove?", next = "gun", when = { race = "Dwarf" } },
        { text = "Goodbye, Dorion.", next = "END" },
      },
    },
    shadow = {
      lines = {
        { id = "sh_default", text = "I found her in Ashenvale as a pup, half drowned in Lake Falathim, and she's been at my heels ever since. She's grey at the muzzle now, but she still beats me up the Enclave stairs." },
      },
      choices = {
        { text = "May I stroke her?", next = "shadow_stroke" },
        { text = "How did a pup end up in the lake?", next = "shadow_lake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_stroke = {
      lines = {
        { id = "ss_default", text = "Ask her, not me. Hold out the back of your hand and wait; if she leans in, you've your answer." },
      },
      choices = {
        { text = "She's leaning in.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Goodbye, Dorion.", next = "END" },
      },
    },
    shadow_lake = {
      lines = {
        { id = "sl_default", text = "Her mother's den was flooded in a spring storm, and I heard one small voice still crying out of the reeds. I meant only to carry her to the shore, but she followed me home, and I've never once regretted letting her." },
      },
      choices = {
        { text = "She chose you, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunting = {
      big = true,
      lines = {
        { id = "hu_default", text = "Patience, mostly, and respect for what you kill. The forest feeds the hunter who takes what he needs, and it starves the one who takes for pride." },
      },
      choices = {
        { text = "I hunt only what I need.", next = "BACK", reply = "Then the forest will feed you for as long as you walk in it. That is the oldest bargain the kaldorei know, and the only one worth keeping.", fx = { align = { light = 1 } } },
        { text = "The strong hunt as they please.", next = "BACK", reply = "They do, until the herds are gone and the strong go hungry like everyone else. The forest has outlived many proud hunters, and it will outlive you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bond = {
      lines = {
        { id = "bo_default", text = "Feed it before you feed yourself, and never ask it to fight something you wouldn't. A beast will forgive you hunger and cold and long roads, but not being used." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "And if my companion dies?", next = "bond_loss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bond_loss = {
      lines = {
        { id = "bl_default", text = "Then you grieve it, properly, and you don't tame another until you've finished. I've seen hunters replace a companion the same day, and every beast they've had since has known it." },
      },
      choices = {
        { text = "Shadow's growing old. What will you do?", next = "bond_shadow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bond_shadow = {
      lines = {
        { id = "bs_default", text = "Sit with her, when it comes, and then sit alone for a long while. I won't tame another, I think; I'm too old to start again, and she'd be cross with me if I tried." },
      },
      choices = {
        { text = "She'll have had a good life with you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = {
        { id = "le_default", text = "The Sentinels asked for teachers in the new city, and my knees asked for an easier life. But I left Ashenvale with the orcs already cutting at its edges, and I've never quite forgiven myself the timing." },
      },
      choices = {
        { text = "What did the orcs do?", next = "leave_warsong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave_warsong = {
      lines = {
        { id = "lw_default", text = "The Warsong came with axes and fire and made lumber of trees older than their whole race. The hunters I trained are out there now, in the shadow of every camp, making them pay for each trunk." },
        { id = "lw_horde", when = { faction = "Horde" }, text = "Your Warsong came with axes and fire and made lumber of trees older than your whole race. I'll not be rude to a guest, but you should know what my students are doing out there." },
      },
      choices = {
        { text = "Then hunt them as they hunt the forest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "There must be a way that doesn't end in blood.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong", "ashenvale" } } },
      },
    },
    tame = {
      lines = {
        { id = "ta_default", text = "That depends on where you're hunting and what you need beside you. Owls in Darkshore if you want eyes, bears in Ashenvale if you want something to stand in front of you, and a cat if you want a friend who'll judge you." },
      },
      choices = {
        { text = "Which did Shadow teach you to prefer?", next = "tame_wolf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame_wolf = {
      lines = {
        { id = "tw_default", text = "Wolves, naturally, though I'm not fair on the question. A wolf will hunt with you as a pack of two, and once you've had that, a cat seems a little too pleased with itself." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gun = {
      lines = {
        { id = "gu_default", text = "Not the gun, only the noise. A dwarf once fired one in this Enclave and every bird in the city left at once, and Shadow hid under my cot for an afternoon, so be a little gentle with it here." },
      },
      choices = { { text = "I'll keep it quiet. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A hunter who got too old to range far and too stubborn to stop. So I teach." } },
    advice = { { id = "tp_ad", text = "Watch your companion's ears. They'll hear trouble a full breath before you do." } },
    centaur = { { id = "tp_centaur", text = "Centaur hunt like a pack and fight like a herd, so you'll lose if you try to outrun them. Find high ground and let them come to you, and keep your companion close." } },
    timbermaw = { { id = "tp_timbermaw", text = "Furbolgs who still have their wits, up in Felwood's passes. Shadow likes them, and she doesn't like anyone." } },
    green_dragons = { { id = "tp_green_dragons", text = "There's something wrong with the green dragons' places, the hunters say, in Ashenvale and in the human woods too. The beasts won't go near them anymore, and beasts know." } },
    blackfathom = { { id = "tp_blackfathom", text = "The old temple drowned off Ashenvale's coast, and nothing good comes out of it now. Hunters who go down there come back smelling of brine and fear." } },
    warsong = { { id = "tp_warsong", text = "Orcs who cut Ashenvale for lumber. My old students hunt them in the shadow of every camp." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Shadow might know, but she isn't saying, and wolves keep their secrets longer than elves do." } },
  },
}
