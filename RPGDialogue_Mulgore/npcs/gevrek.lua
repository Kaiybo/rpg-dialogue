-- Camp Gev'rek: the Windshapers' camp in Mulgore. Voice: bibles/mulgore.md
-- Skyborne facts ONLY from the brief (§10). Where the brief is silent, she stays vague.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "ayessa", id = TODO_NPC("Ayessa Dawnsinger"), name = "Ayessa Dawnsinger",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "gevrek" }, temper = { "steady" }, values = { "loyal", "devout", "proud" },
  spiritSensitive = true,
  notices = { "race", "class" },

  greetings = {
    { id = "g_winds", text = "Winds be with you. You're welcome at Gev'rek, as long as you come in peace." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you, child of the isle. The ground still feels strange under your feet, doesn't it?" },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to us. Sit, and tell me what the land below the sky taught you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Skyborne" },
      text = "A druid. There are few of you among us. The Cenarion Circle will want to know you; let them, but remember it was the elements that raised you." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You've walked the elemental trials; I can see it in how you stand, and that is good." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Thunder Bluff opened its gates to us. We won't forget that, and we won't make the tauren regret it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ayessa Dawnsinger, and I lead the Windshapers. The Earthen Ring answered when we called, and the Horde gave us a place to stand." },
      },
      choices = {
        { text = "Why did you leave Skywall?", next = "skywall" },
        { text = "What do the Windshapers believe?", next = "believe" },
        { text = "And the High Order?", next = "order" },
        { text = "Winds be with you.", next = "END", fx = { affinity = 1, standing = { gevrek = 1 } } },
      },
    },
    skywall = {
      big = true,
      lines = {
        { id = "s_default", text = "The spirits who sheltered us fell silent, and the isles began to drift apart. Then the Al'Aketh lit their beacon, and we left before the Windlord could answer it." },
      },
      choices = { { text = "That must have been hard.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "al_aketh" } } } },
    },
    believe = {
      lines = {
        { id = "b_default", text = "The four elements, and a debt to the wind that carried us. Our initiates pass the trials and take the sapta. The rest you learn by walking it." },
      },
      choices = { { text = "I'd like to learn.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
    order = {
      lines = {
        { id = "o_default", text = "They went to the Kirin Tor; we went to the Earthen Ring. Some of what lies between us is old, and some of it is fresh graves. Don't ask me to pretend otherwise." },
      },
      choices = { { text = "I won't.", next = "END", fx = { affinity = 1, learn = { "two_orders" } } } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Sacred sites, old wrongs and new deaths. We'll speak of it another day, but not today." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes and shaved heads. If you ever see them on this side of the sky, tell me before you tell anyone else." } },
    windstones = { { id = "tp_windstones", text = "Power and coin both, on the isle. Down here they're a reminder of home, mostly." } },
    cenarion_circle = { { id = "tp_circle", text = "Our druids feel a pull toward them, and I won't stand in the way; the elements are generous enough to share." } },
    _none = { { id = "tp_none", text = "I don't know. Down here, there's a great deal I don't know yet." } },
  },
}
