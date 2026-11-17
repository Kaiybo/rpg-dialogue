-- Chief Archaeologist Greywhisker of the Explorers' League, outside the Temple of the Moon (0.72.0). Voice: bibles/greywhisker.md
-- Classic: Trouble in Darkshore? (gives), the Remtravel dig in Darkshore (The Absent Minded Prospector).
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "greywhisker", id = TODO_NPC("Chief Archaeologist Greywhisker"), name = "Chief Archaeologist Greywhisker",
  bible = "bibles/greywhisker.md", role = "scholar", tier = "quest",
  communities = { "darnassus" }, temper = { "fussy", "earnest" }, values = { "curious", "proud" },
  notices = { "race", "craft" },
  impression = {
    first = "Chief Archaeologist Greywhisker is a dwarf of the Explorers' League who frets about his missing dig crew and about being taken seriously, in roughly equal measure. He thinks the old ruins are a warning, not a hobby.",
    third = "{name} met Chief Archaeologist Greywhisker, an Explorers' League dwarf in Darnassus worried for his excavation team in Darkshore.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, good, someone who looks like they've held a shovel. Come over, come over." },
    { id = "g_trouble", when = { questActive = TODO_QUEST("Trouble in Darkshore?") }, text = "Auberdine, {g:lad|lass}, and look for any sign of my crew. Weeks without a letter isn't like Remtravel, even for Remtravel." },
    { id = "g_found", when = { questDone = TODO_QUEST("The Absent Minded Prospector") }, text = "Remtravel's safe and his fossil's on its way to Ironforge, thanks to you. I may even forgive him for not writing." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}! Still no letter from Darkshore, so I'm glad of any face that's been somewhere." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've a bit more weight in your stride than when I sent you off to Auberdine. The League could use a {class} like you, if you ever fancy a dig." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word is you've been making friends among the elves, which is more than I've managed in a year. Teach me the trick sometime." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! By my beard, it's good to hear a proper accent; these elves talk as if every sentence costs them a gold piece." },
    { id = "n_arch", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "You've got grit under your nails, and I mean that kindly. Mind you don't go mining through anything older than you are without telling the League." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Chief Archaeologist Greywhisker, of the Explorers' League, at your service. Most folk think our work is a hobby for old dwarves with too much time, but the ruins of this world have a great deal to tell us, if we listen." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Trouble in Darkshore?") },
          text = "I sent a crew to Darkshore under Prospector Remtravel, and I've not heard a word from them in weeks. Would a {class} like you travel to Auberdine and look for any clue to where they've got to?" },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Trouble in Darkshore?"), days = 5 } },
          text = "You went, and good for you! Hollee's at Auberdine, you say, and Remtravel is off in the south of Darkshore with golems crawling up out of his own dig? That's him to the bone." },
        { id = "h_found", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Absent Minded Prospector"), days = 5 } },
          text = "Remtravel found you useful and didn't even ask your name, which is the warmest compliment he's capable of. That fossil had better be as mysterious as he claims." },
        { id = "h_young", when = { maxLevel = 11 },
          text = "You're a touch green for Darkshore, if you'll forgive me saying it. Come back with a few more scars, and I'll have work for you." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "One of the kaldorei, interested in old stones? That's rare. Your people lived atop more history than mine ever dug up, and half of you won't talk about it." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; the elves don't let me dig in their city, so I've plenty of it." },
        { id = "h_again2", text = "Go on, go on. Questions are what the League runs on." },
      },
      choices = {
        { text = "What were your crew digging for in Darkshore?", next = "crew" },
        { text = "Why does the League care so much about ruins?", next = "warning" },
        { text = "What brings a dwarf to Darnassus?", next = "city" },
        { text = "Tell me about Prospector Remtravel.", next = "remtravel" },
        { text = "I'm of Ironforge. Did you lecture there?", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "I'll look for your crew.", next = "BUSINESS" },
        { text = "Good day, Archaeologist.", next = "END" },
      },
    },

    crew = {
      lines = {
        { id = "cr_default", text = "Remtravel thinks there was a great society under those forests long before the elves planted anything there. He's got young Hollee with him to keep his tools in order, and she'll need every one of them." },
      },
      choices = {
        { text = "A society older than the night elves?", next = "crew_older" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_older = {
      lines = {
        { id = "co_default", text = "Or one they won't speak of, which comes to the same thing for a digger. Stone doesn't lie, but it does keep secrets, and I mean to have a few of them out of it." },
      },
      choices = {
        { text = "Do the elves mind you digging up their past?", next = "crew_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_elves = {
      big = true,
      lines = {
        { id = "ce_default", text = "Mind it? Some of them would sooner I filled in every hole and went home. The priestesses are polite about it, which is somehow worse than shouting." },
      },
      choices = {
        { text = "It's their land. Ask before you dig.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "History belongs to everyone. Dig on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    warning = {
      lines = {
        { id = "wa_default", text = "Because recent finds in Khaz Modan have shown us there are powers older than any throne in Azeroth, and some of them may not be asleep. Lordaeron or Kalimdor, it makes no odds; what we dig up today might be what we fight tomorrow." },
      },
      choices = {
        { text = "What kind of powers?", next = "warning_what" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    warning_what = {
      lines = {
        { id = "ww_default", text = "Makers, {g:lad|lass}, folk who shaped the very stone, and the things they left behind to guard it. That's all I'll say in the street, because the League doesn't like its theories shouted about before they're proven." },
      },
      choices = {
        { text = "Then I'll keep it to myself.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Diplomacy, of a sort. If the League's to dig on Kalimdor, it does well to ask the kaldorei nicely, and I'm the one they sent to stand about looking harmless." },
      },
      choices = {
        { text = "Is it working?", next = "city_working" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_working = {
      lines = {
        { id = "cw_default", text = "Tarelvir talks to me, which is a start, and the Sentinels haven't shot me, which is another. I'd call that a promising first season." },
      },
      choices = {
        { text = "Patience suits a digger.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Goodbye, Archaeologist.", next = "END" },
      },
    },

    remtravel = {
      lines = {
        { id = "re_default", text = "The finest field man the League has, and the most hopeless at noticing anything that isn't buried. I've seen him brush dirt off a tablet while a bear ate his lunch beside him." },
      },
      choices = {
        { text = "That sounds dangerous.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironforge = {
      lines = {
        { id = "ir_default", text = "Many a winter, in the Hall of Explorers, to rooms half full of yawning apprentices. I once spent an hour on Agamaggan and the Barrens, and a gnome at the back asked if there'd be a test." },
      },
      choices = {
        { text = "Was there a test?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Forty years with a brush and a trowel, and I'm only now being taken half seriously. That's the League for you." } },
    advice = { { id = "tp_ad", text = "Write down where you found a thing before you pick it up. You'll thank me in ten years." } },
    explorers_league = { { id = "tp_league", text = "The finest minds in Ironforge, and a few of the dustiest. We're not treasure hunters, whatever the Wetlands lot say.", next = "warning" } },
    uldaman = { { id = "tp_uldaman", text = "There's a vault in the Badlands that's had the League up all night arguing. I'll say no more in a city of elves." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. If it's not under a hill, I don't know it." } },
  },
}
