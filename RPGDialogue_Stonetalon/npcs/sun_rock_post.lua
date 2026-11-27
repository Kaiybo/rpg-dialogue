-- Sun Rock Retreat's keepers: Tharm (wind rider master), Gereck (stable master), Hgarth (enchanting
-- trainer on the cliff), Jeeda (apprentice witch doctor, upstairs at the inn). Horde, service tier.
-- Voice: bibles/sun_rock_post.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

-- Hgarth: orc enchanting trainer on a cliff above Sun Rock.
P:NPC {
  key = "hgarth", id = TODO_NPC("Hgarth"), name = "Hgarth", title = "Enchanting Trainer",
  bible = "bibles/sun_rock_post.md", role = "trainer", tier = "service",
  communities = { "sun_rock" }, temper = { "aloof", "proud" }, values = { "knowledge", "discipline" },
  notices = { "craft", "class", "arcane" },
  impression = {
    first = "He asks if I came for knowledge and sounds doubtful.",
    third = "{name} climbed to Hgarth, the orc enchanter who teaches from a hidden ledge above Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You return to Hgarth, worthy seeker. Sit, and receive knowledge few are given." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You seek the knowledge of Hgarth? It is not freely given to those who disappoint." },
    { id = "g_default", text = "Have you come to seek the knowledge of Hgarth? You must have, because nobody climbs that path by accident." },
    { id = "g_back", when = { metBefore = true }, text = "You found the path a second time. Good; most forget it, and I don't remind them." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "Your hands carry the dust of disenchanted things. Show me what you've learned, and I'll tell you how much of it is wrong." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll think enchanting is a lesser art, as your kind usually do, until you try to hold a spell inside a cloak for a year." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Don't bring that up here; I can smell it on you from the path, sulphur and worse. It sours the rods." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Hgarth, and I teach the art of enchanting to those who climb this far. The wind on this ledge keeps the work clean, and the climb keeps out those who want it only a little." },
        { id = "h_notEnch", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking" } },
          text = "You're a crafter, but not an enchanter, and you climbed anyway. Either you're curious, or you're lost, and I'll find out which by your questions." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; the wind will take it away soon enough." },
        { id = "h_again2", text = "Another question. You climbed for them, so ask." },
      },
      choices = {
        { text = "Why teach up here, where no one can find you?", next = "ledge" },
        { text = "What is enchanting, truly?", next = "art" },
        { text = "Where did an orc learn this?", next = "learned" },
        { text = "Train me.", next = "BUSINESS", when = { profession = "Enchanting" } },
        { text = "Kulwia sells your students their rods, she says.", next = "kulwia" },
        { text = "What do your students go on to?", next = "students" },
        { text = "What do you see from this ledge, on a clear day?", next = "w5_view" },
        { text = "I'll climb back down. Farewell.", next = "END" },
      },
    },

    w5_view = {
      lines = { { id = "w5_view_l", text = "The whole of Stonetalon, laid out like an old map. Sun Rock below, Mirkfallon's green, the black scar of the Charred Vale, and on the far side, the smoke of the Venture Company's camps. On the clearest days, the Barrens beyond, yellow as old parchment." } },
      choices = {
        { text = "Does the view comfort you, or grieve you?", next = "w5_view2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_view2 = {
      lines = { { id = "w5_view2_l", text = "Both, each day in a different measure. I came here to keep the work clean, but I find I watch the smoke more than I enchant. An enchanter must see the world as it is before he asks anything of it. From here, the world is very honest." } },
      choices = {
        { text = "An honest view is worth the climb.", next = "BACK", reply = "It is. That is why I do not remind people of the path. Those who find it should have earned it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledge = {
      big = true,
      lines = {
        { id = "le_default", text = "Because those who want the art badly enough will find the path, and those who don't will waste my rods. Kulwia, who sells supplies below, thinks I'm unfriendly, and she's right, but my students finish what they start." },
      },
      choices = {
        { text = "Knowledge should be open to anyone who asks.", next = "BACK", reply = "Then go and teach it in the valley yourself, and see how many of your students are still enchanting a year from now. The ledge stays.", fx = { align = { order = -1 } } },
        { text = "Hard paths make good students. Keep the ledge.", next = "BACK", reply = "Good, you understand it. Climb when you're ready, and bring your own rods.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    art = {
      lines = {
        { id = "ar_default", text = "Taking the power out of one thing and binding it into another, so a cloak turns a blade or a bracer gives strength. Unmake carelessly and you get dust, and bind carelessly and you get a cloak that burns its wearer." },
      },
      choices = {
        { text = "Has that happened?", next = "art_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    art_burn = {
      lines = {
        { id = "ab_default", text = "Once, to a student of mine who rushed. He lived, and he learned, and he doesn't rush now; he also doesn't wear cloaks, which is a shame in these winds." },
      },
      choices = {
        { text = "I'll take my time, then.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learned = {
      lines = {
        { id = "lr_default", text = "From the warlocks of the old Horde, before Thrall, though I learned only the binding and refused the rest. I watched what they did with the power they took, and I chose to take it out of stones and cloth instead of out of people." },
      },
      choices = {
        { text = "You turned away from the warlocks?", next = "learned_turn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_turn = {
      big = true,
      lines = {
        { id = "lt_default", text = "I did, and I paid for it in the camps like everyone else, but my hands are clean of that work. Some say the knowledge itself was tainted, and I say the hand that uses it decides, and we'll never agree." },
      },
      choices = {
        { text = "Knowledge is only a tool. The hand decides.", next = "BACK", reply = "Then we agree, and you're welcome on my ledge. Sit down out of the wind and show me your rod.", fx = { align = { light = -1 } } },
        { text = "Some knowledge stains whoever learns it.", next = "BACK", reply = "Then you'll never learn from me, and that's your choice to make. I won't argue it again; I've had that argument for twenty years.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kulwia = {
      lines = { { id = "kw_default", text = "She does, and she overcharges for them slightly, and I let her, because she has to carry them up from Thunder Bluff and I do not. She thinks I dislike her. I dislike everyone a little, and her rather less than most." } },
      choices = {
        { text = "Have you ever told her that?", next = "kulwia2" },
        { text = "That's almost a compliment, for you.", next = "kulwia2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kulwia2 = {
      lines = { { id = "kw2_default", text = "No, and you won't either. A trainer who is liked gets visitors, and visitors bring questions that are not about enchanting. The ledge is quiet because I have made it unpleasant to reach. Leave it that way." } },
      choices = {
        { text = "Not a word. Something else.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "sd_default", text = "Some go to Orgrimmar, to the enchanters in the Drag, once they've outgrown what a ledge can teach. Some go to war and enchant their friends' weapons in tents. And one or two stay on the mountain and mend cloaks for the braves, which is the least glorious and most useful of the three." } },
      choices = {
        { text = "Which do you hope for?", next = "students2" },
        { text = "Useful matters more than glorious.", next = "students2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students2 = {
      lines = { { id = "sd2_default", text = "I hope for none of them. I hope only that they bind carefully, and that they never once reach for the kind of power the old warlocks wanted. I have trained thirty students on this ledge, and none of them has. I count that my only boast." } },
      choices = {
        { text = "I'm a warlock. Some of us bind carefully too.", next = "students3", when = { class = "WARLOCK" } },
        { text = "A good boast. Something else.", next = "BACK" },
      },
    },
    students3 = {
      lines = { { id = "sd3_default", text = "Some, perhaps, and I have watched the rest. I will teach you enchanting, if you climb for it, and I will watch your hands while I do. Do not take it as an insult, because it is the same care I give the stones." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned binding in the old Horde and kept it when I left the rest behind. That's all you'll get from me." } },
    advice = { { id = "tp_ad", text = "Disenchant what you don't need. Dust is more useful than vanity." } },
    _none = { { id = "tp_none", text = "That isn't enchanting, so it isn't my concern." } },
  },
}
