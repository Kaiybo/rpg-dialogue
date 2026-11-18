-- Tajarri, sworn warden of the Shrine of Remulos, who keeps the young druids' trials.
-- Voice: bibles/tajarri.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tajarri", id = TODO_NPC("Tajarri"), name = "Tajarri",
  bible = "bibles/tajarri.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "stern", "watchful" }, values = { "dutiful", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "Tajarri guards the Shrine of Remulos with a scimitar and a long memory, and she judges every visitor by how they stand on sacred ground. To young druids she's gentler than she looks.",
    third = "{name} met Tajarri, the sworn warden of the Shrine of Remulos in Moonglade, who oversees the druids' trials.",
  },

  greetings = {
    { id = "g_default", text = "This shrine is sacred to the Cenarion Circle, stranger. Walk softly here, and keep your hands away from your weapons." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Cenarius's blessing on you, young one. I am Tajarri, and I keep this shrine in Keeper Remulos's name." },
    { id = "g_lake", when = { questActive = TODO_QUEST("Trial of the Lake") }, text = "The bauble from the lake crumbles if you dawdle. Swim quickly, and come to me while it's whole." },
    { id = "g_sealion", when = { questActive = TODO_QUEST("Trial of the Sea Lion") }, text = "Two halves, young one, one for agility and one for endurance. Bring them both to me and we'll see them joined." },
    { id = "g_done", when = { questDone = TODO_QUEST("Trial of the Sea Lion") }, text = "You passed both trials at this shrine, and the water knows you now. Swim well." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the shrine hasn't moved. Neither have I." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren", class = "DRUID" },
      text = "A tauren druid. The Circle swore your people in alongside mine, and I've watched many of you take the trials here; you swim better than anyone expects." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I can see where you keep your knives, and I'd like them to stay there. There's nothing on this shrine worth stealing, and everything here is worth defending." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the smell of the Twisting Nether onto Remulos's ground. Say what you came to say, and then take it back down the path with you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tajarri, sworn protector of the Shrine of Remulos, and I serve the Keeper. Visitors may look and may pray, but the shrine is not a market or a camp, and my scimitar has opinions about anyone who forgets that." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You've come for your trials, I think, as every young druid of the Circle does. The lake will teach you to move through water as the sea lion does, and I'll be here to see whether you've learned it." },
        { id = "h_lake_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Trial of the Lake"), days = 3 } },
          text = "The bauble reached me whole, and so did you, which is the harder part for most. Rest a moment and dry off, and then we'll speak of the sea lion." },
        { id = "h_sealion", when = { questActive = TODO_QUEST("Trial of the Sea Lion") },
          text = "One half of the pendant lies in deep water far from Moonglade, the other in a place you'll have to find by asking. Each half tests something different, and the sea lion needs both: the speed to reach what it hunts and the endurance to reach home." },
        { id = "h_sealion_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Trial of the Sea Lion"), days = 3 } },
          text = "The halves join, and the pendant is whole. Go to Dendrite with it; he'll teach you the shape, and you'll never fear deep water again." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and keep your voice low." },
        { id = "h_again2", text = "Go on. The shrine can bear a few more questions." },
      },
      choices = {
        { text = "Whose shrine is this?", next = "shrine" },
        { text = "What are the druids' trials?", next = "trials" },
        { text = "How did you come to guard it?", next = "sworn" },
        { text = "Would you really use that scimitar here?", next = "scimitar" },
        { text = "I'm a druid. What should I know before the lake?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I serve the Light. May I pray here?", next = "xlight", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll leave the shrine in peace.", next = "END" },
      },
    },
    shrine = {
      lines = {
        { id = "s_default", text = "Keeper Remulos's, son of Cenarius, who guards Moonglade and the druids who sleep beneath it. He walks here sometimes, when the Circle's business lets him, and the water by the shrine runs clearer when he does." },
      },
      choices = {
        { text = "Why is Moonglade so peaceful?", next = "peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "p_default", text = "Because the Circle wills it, and because the wardens make sure of it. Horde and Alliance both come here, and whatever they do to each other in Ashenvale, here they lay it down or the wardens lay them down." },
      },
      choices = {
        { text = "Does that peace ever break?", next = "peace_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace_break = {
      big = true,
      lines = {
        { id = "pb_default", text = "Rarely, and never for long. I've seen an orc and a night elf glare at each other across this water for an hour and then walk away, and I respected them both more for the walking than I would have for the fight." },
      },
      choices = {
        { text = "Neutral ground matters. Keep it sacred.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace imposed by blades isn't really peace.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trials = {
      lines = {
        { id = "t_default", text = "Every druid of the Circle must learn to wear the shapes of the wild, and some shapes can't be taught in a grove. For the sea lion's form there are two trials: the lake, and then the pendant, and I keep watch over both." },
      },
      choices = {
        { text = "What happens in the Trial of the Lake?", next = "lake" },
        { text = "What's the pendant?", next = "pendant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake = {
      lines = {
        { id = "l_default", text = "You dive into Lake Elune'ara and bring up a shrine bauble from the bottom, and you carry it here before it crumbles in your hands. It sounds simple, and it is, if you can hold your breath and keep your nerve and not stop to admire the fish." },
      },
      choices = {
        { text = "Has anyone ever failed?", next = "failed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    failed = {
      big = true,
      lines = {
        { id = "f_default", text = "Many, and many went back in and succeeded, and those are the ones I remember best. A few never came back to try again, and I don't think less of them; the lake isn't for everyone, even among druids." },
      },
      choices = {
        { text = "The trial should be hard. That's its worth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd find a shortcut, if one existed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant = {
      lines = {
        { id = "pe_default", text = "The Pendant of the Sea Lion, broken long ago into two halves, one for aquatic agility and one for aquatic endurance. A druid who finds both and brings them here has proved they can go where the sea lion goes and come home again." },
      },
      choices = {
        { text = "Who broke it, and why?", next = "pendant_broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant_broke = {
      lines = {
        { id = "pb2_default", text = "Nobody I know can say for certain, and the older druids each tell it differently, so I've stopped asking. What matters is that the halves lie far apart, and no druid earns the shape by luck or by one easy swim." },
      },
      choices = {
        { text = "So the pendant is a lesson in itself.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sworn = {
      lines = {
        { id = "sw_default", text = "I swore an oath to the Keeper when I was younger than you'd guess, after the Circle sheltered my family during a hard winter. Some debts you pay in coin, and some you pay by standing in one place for a very long time." },
      },
      choices = {
        { text = "Do you ever regret it?", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      big = true,
      lines = {
        { id = "r_default", text = "On cold mornings, a little, when the Sentinels pass on their way to Ashenvale and I wonder what it would be like to go with them. Then a young druid comes up the path shaking with nerves, and I remember why I stay." },
      },
      choices = {
        { text = "Your oath is your honor. Hold to it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You've paid enough. Go see the world, Tajarri.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scimitar = {
      lines = {
        { id = "sc_default", text = "I would, and I have, though only twice, and both times the visitor walked away afterwards and thought better of it. The blade is a promise more than a threat; it says this place is defended, and people are calmer when they know it." },
      },
      choices = {
        { text = "Understood. I'll mind my manners.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "Don't fight the water; let it hold you, and swim with your whole body, not just your arms. And don't think of the bauble as a prize, because the moment you think of it as yours, you start to hurry, and hurrying is how it breaks." },
      },
      choices = {
        { text = "I'll be patient. Thank you, Tajarri.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      big = true,
      lines = {
        { id = "xl_default", text = "You may, quietly, though you won't find your Light named anywhere on these stones. The Circle prays to the wild and to Elune, and I've never seen why a prayer to one should offend the other, but some of the older druids do." },
      },
      choices = {
        { text = "All prayer is welcome where there's reverence.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll keep my faith to myself here.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "I serve the Circle and the Keeper, and the Circle has served Kalimdor longer than any banner now flying over it." } },
    malfurion = { { id = "tp_mf", text = "The Archdruid sleeps in the Dream beneath this glade. I keep the shrine quiet partly for him." } },
    background = { { id = "tp_bg", text = "I swore an oath to the Keeper and I keep it. The rest is between me and the shrine." } },
    advice = { { id = "tp_ad", text = "Respect the water in this glade. It remembers who disturbed it." } },
    _none = { { id = "tp_none", text = "That's outside the shrine's business, and outside mine. Ask in Nighthaven." } },
  },
}
