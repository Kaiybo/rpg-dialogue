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
        { text = "I'll climb back down. Farewell.", next = "END" },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned binding in the old Horde and kept it when I left the rest behind. That's all you'll get from me." } },
    advice = { { id = "tp_ad", text = "Disenchant what you don't need. Dust is more useful than vanity." } },
    _none = { { id = "tp_none", text = "That isn't enchanting, so it isn't my concern." } },
  },
}
