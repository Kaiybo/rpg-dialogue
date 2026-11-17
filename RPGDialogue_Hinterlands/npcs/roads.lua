-- Between the towns: a troll prisoner at Quel'Danil Lodge. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rinji", id = TODO_NPC("Rin'ji"), name = "Rin'ji",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "quel_danil" }, temper = { "wary" }, values = { "cunning", "proud" },
  notices = { "race" },
  impression = {
    first = "Rin'ji is a troll in an elven cage, which is an old story in these hills, and he tells it with more bitterness than surprise. He'd like out, and he'll pay in secrets.",
    third = "{name} met Rin'ji, a troll held captive by the high elves of Quel'Danil Lodge.",
  },

  greetings = {
    { id = "g_cage", text = "Psst! You, mon, over here, by the bars. You be lookin' like someone who don't love elves." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, walkin' free in Quel'Danil! The spirits be kind today, cousin, or at least they be payin' attention." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Another elf, but not one of theirs, eh? Your ears be the same, so forgive me for flinchin'." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The guards, mon, because the bars don't shoot arrows. The elves of Quel'Danil be fine archers and poor fighters up close, so get in close quick, and Rin'ji will run while you be busy." } },
      choices = {
        { text = "We leave when the guard changes. No brawling.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the plan. We break out and fight our way clear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Owls, mon, only owls, for their feathers fetch good trade. The elves said I was huntin' them, which be flattery, because an elf be much harder to find than an owl and taste much worse." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} got the look of a beast that never been in a cage, mon, and Rin'ji hope it stay that way. Elves cage anythin' they don't understand." },
      },
      choices = {
        { text = "They had a right to guard their woods, Rin'ji.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Woods belong to no one. They had no right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rin'ji, they call me, and the elves of Quel'Danil caught me in their woods and threw me in this cage. Get me out, and Rin'ji gonna tell you a secret worth more than the trouble." },
        { id = "h_escort", tags = { "news" }, when = { questActive = TODO_QUEST("Rin'ji is Trapped!") },
          text = "If you be willin' to help me, that be good, mon, so get me past the elves' bows and out of their woods, and I run the rest of the way myself." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Rin'ji's Secret") },
          text = "A promise be a promise, even to a stranger. Take what I told you and go find it before somebody else does." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, mon! You got arms like a bear, so maybe you bend these bars, and maybe you bend an elf or two on the way out." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, mon. Rin'ji was huntin' too, before the elves caught him, so you know how it feel to hold the bow, and how bad it feel when somebody else got it." },
      },
      choices = {
        { text = "Elves caged my people too, once. I'll get you out.", next = "troll", when = { race = "Troll" } },
        { text = "Why did the elves cage you?", next = "caged" },
        { text = "What secret could a prisoner have?", next = "secret" },
        { text = "Why should I trust a troll?", next = "trust" },
        { text = "Should I break the bars or the guards first, Rin'ji?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What were you hunting when the elves caught you, Rin'ji?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Good luck, Rin'ji.", next = "END" },
      },
      again = { { id = "h_again", text = "Talk faster, mon. The elves be changin' the guard soon." } },
    },
    caged = {
      lines = {
        { id = "ca_default", text = "Because I be a troll in their woods, mon, and that be crime enough to an elf. Trolls and elves been killin' each other since before the dwarves came out of their mountains, so nobody be askin' my side of it." },
      },
      choices = { { text = "What is your side of it?", next = "caged_side" } },
    },
    caged_side = {
      lines = {
        { id = "cs_default", text = "I was huntin', and I got careless, and they got lucky. That be the whole story, though the elves tell it longer and make me sound much scarier." },
      },
      choices = {
        { text = "Old hatreds should end somewhere. Let's start here.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "You trespassed on their land. The cage is fair.", next = "BACK", fx = { affinity = -2, align = { order = 1 } } },
      },
    },
    secret = {
      lines = {
        { id = "se_default", text = "Ha! A prisoner be hearin' everything, mon, 'cause nobody guards their tongue near a cage. Free me, and I tell you where something worth findin' be hidden in these hills." },
      },
      choices = { { text = "Something else first.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "You shouldn't, not all the way. But I be the one in the cage, and you be the one with the key, so who be needin' trust more, eh?" },
      },
      choices = { { text = "Fair point. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr2_default", text = "Then the spirits sent the right cousin, mon. Mind the archers on the lodge roof; they be watchin' the trail, not the trees." } },
      choices = { { text = "Through the trees, then.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Rin'ji don't know, and Rin'ji don't care, not while he be in this cage." } },
  },
}
