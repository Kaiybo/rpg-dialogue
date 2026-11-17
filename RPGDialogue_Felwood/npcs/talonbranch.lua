-- Talonbranch Glade: the Alliance's only post in Felwood, around its moonwell. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "golhine", id = TODO_NPC("Golhine the Hooded"), name = "Golhine the Hooded", title = "Druid Trainer",
  bible = "bibles/felwood.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "quiet" }, values = { "wise", "patient" },
  notices = { "class", "form" },

  impression = {
    first = "Golhine the Hooded teaches druids beside the one clean moonwell in a sick forest, and doesn't say much more than he must. The hood, he says, only keeps the ash off.",
    third = "{name} met Golhine the Hooded, the quiet druid trainer at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "You've come far to train in a sick forest, which is good. Sit by the well." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "The moonwell is clean, though little else here is. Rest a moment, if you need to." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Careful in that shape out there; the bears of Felwood are sick, and they'll take you for kin, and then for food." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I teach druids, not warriors, but I've watched warriors learn this forest anyway, and they learn it faster than the young druids, because they don't expect it to be kind. A druid comes here hoping, a warrior comes here ready, and the forest punishes hope first." } },
      choices = {
        { text = "Hope isn't weakness. I fight because there's still something to save.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll expect nothing from this forest and spare nothing in it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sometimes, if the sickness hasn't gone deep, and I've seen a wolf from the south recover after a week of drinking here. But the water has little to spare, and if every hunter brought every sick beast in Felwood to it, it would be gone by summer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Let {pet} drink first, before you, so it knows the taste of clean water. It may need to remember it out there." },
      },
      choices = {
        { text = "Then I'll bring only the ones worth saving, and quietly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it heals beasts, it should be used, not hoarded.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson = {
      lines = {
        { id = "le_default", text = "How a forest sounds when it's dying, which is not how it sounds when it sleeps. Moonglade will teach you the healthy song, and Felwood will teach you the other one, and you need both before you can call yourself a healer of anything." },
      },
      choices = {
        { text = "I'd rather learn it from a book.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll listen, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because everything outside this glade was green once, and fel made it otherwise. I teach druids to heal the land, and you were taught to burn it, so we start a long way apart, and I would rather not pretend we don't." } },
      choices = {
        { text = "Then I'll prove you wrong by keeping my distance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burning is the only thing demons understand.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fair enough. I'll be on my way.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Highborne thought the arcane could do anything, and the sea that swallowed their city is answer enough to that. Elune keeps this water clean, and I would rather trust her than a spell." } },
      choices = {
        { text = "Elune's way is the right one here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Highborne failed. That doesn't mean all mages will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll leave the well alone.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Holy is a priest's word, and I'm no priest, but the water remembers what the forest was before the demons came. That memory is worth more than any blessing I could give, and it's growing thin." } },
      choices = {
        { text = "Then it should be guarded above everything else here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then pour it on the forest now, before it fades.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Lean your shield where you like, but don't foul the moonwell; it's the only clean water for a day's walk." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, at the last clean moonwell. Let your beast drink, if it will." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, at the last clean moonwell in Felwood. Keep your fire to yourself, please." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You're welcome to the shade, but don't draw on the moonwell for your spells; it has little enough to spare." },
        { id = "h_default", text = "I am Golhine, and I teach the druids who come this far north, though few do. A druid who only knows healthy places hasn't learned much." },
        { id = "h_hood", when = { metBefore = true },
          text = "You're wondering about the hood, as everyone does. It keeps the ash off, and that's all, though people prefer a better story." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moonwell is brightest now, so look at it, and then look at the trees; that's the difference we're fighting for." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at the last clean moonwell. Whether you pray to Elune or the Light, your prayers are welcome here, so long as you say them quietly." },
      },
      again = { { id = "h_again", text = "What else?" } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why teach here?", next = "why" },
        { text = "What's Talonbranch Glade like?", next = "glade" },
        { text = "What does a druid learn here that she can't at home?", next = "lesson", when = { class = "DRUID" } },
        { text = "I mean the moonwell no harm. Why so wary?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the arcane help cleanse the moonwell's water?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is the moonwell's water holy, the way a blessing is?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a warrior learn in a forest like this, Golhine?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will the moonwell's water heal a sick beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because a forest this sick needs druids who aren't afraid of it. I can't make the young ones unafraid, but I can make them used to it." },
      },
      choices = { { text = "That's a hard lesson.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    glade = {
      lines = { { id = "g_default", text = "It's a clearing that's held out longer than most, and the moonwell keeps it clean, mostly. We guard the well, and the well guards us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a teacher of druids, and the rest is under the hood, where it stays." } },
    advice = { { id = "tp_ad", text = "Learn the sick places as well as the healthy ones. A healer who only knows health is no healer." } },
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle heals the south of the forest and we hold the north, but the middle belongs to the demons, for now." } },
    _none = { { id = "tp_none", text = "I don't know." } },
  },
}
