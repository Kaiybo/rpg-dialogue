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
    { id = "g_hello", text = "Ah, good, someone who looks like they've held a shovel. Come over, come over, {g:lad|lass}." },
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
      text = "You've got grit under your nails, and I mean that kindly. Just don't go mining through anything older than you are without telling the League." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Some do and some don't, and the honest ones admit they're curious. I'd like an outside opinion, so tell me: what do you make of the Explorers' League poking about in Kalimdor?" },
      },
      choices = {
        { text = "History belongs to everyone, Archaeologist. Dig it up.", next = "op_r1", fx = { affinity = 2, align = { honor = -1 }, opinion = { explorers_league = "admire" } } },
        { text = "Those are their dead. Leave the ruins alone.", next = "op_r2", fx = { affinity = -1, align = { honor = 1 }, opinion = { explorers_league = "wrong" } } },
        { text = "Magni wants his titans. The rest is courtesy.", next = "op_r3", fx = { trait = { skeptical = 1 }, opinion = { explorers_league = "self_serving", magni = "distrust" } } },
        { text = "Bronzebeards go where the stone calls, and that's all there is.", next = "op_r4", fx = { affinity = 1, opinion = { explorers_league = "proud", magni = "trust" } }, when = { race = "Dwarf" } },
        { text = "Your League digs with care. My people notice that.", next = "op_r5", fx = { affinity = 1, trait = { kind = 1 }, opinion = { explorers_league = "tolerate" } }, when = { race = "NightElf" } },
        { text = "I've no stake in it either way.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "That's the spirit Ironforge sends us out with! Mind you, I'd not say it quite so loud near the Temple." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Aye, I hear that often, and I've stopped arguing it in the street. We record and we don't loot, and anyone who tells you otherwise has met the wrong dwarves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "The King does want his answers, and I'll not lie to you about it. There are worse things to want than the truth of where we came from, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Ha! Spoken like one raised in the Hall of Explorers. I only wish they brewed a decent stout up here so I could toast it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r5 = {
      lines = { { id = "op_r5_default", text = "That's kindly said, and I'll put it in my letters home, because Ironforge is half convinced your people want us all shot." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "o_explorers_league_wrong", tags = { "news" }, when = { opinion = { topic = "explorers_league", stance = "wrong" } },
          text = "You think the League should leave the ruins alone, I'm told. You're welcome to the opinion, so long as you don't preach it to my crew." },
        { id = "o_magni_distrust", tags = { "news" }, when = { opinion = { topic = "magni", stance = "distrust" } },
          text = "You've been heard saying the King cares more for old stones than for his people. I'll not argue, but I'll thank you not to say it in front of the League." },
        { id = "h_default", key = true,
          text = "Chief Archaeologist Greywhisker, of the Explorers' League, at your service. Most folk think our work is a hobby for old dwarves with too much time, but the ruins of this world have stories carved in their stones, if we've the patience to read them." },
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
        { id = "h_again", text = "What else? I've time aplenty, since the elves won't let me dig in their city, and a dwarf without a dig is a sorry sight." },
        { id = "h_again2", text = "Go on, go on. Questions are what the League runs on." },
      },
      choices = {
        { text = "What were your crew digging for in Darkshore?", next = "crew" },
        { text = "Why does the League care so much about ruins?", next = "warning" },
        { text = "I didn't expect to find a dwarf in Darnassus.", next = "city" },
        { text = "Tell me about Prospector Remtravel.", next = "remtravel" },
        { text = "I'm of Ironforge. Did you lecture there?", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "I'll look for your crew.", next = "BUSINESS" },
        { text = "Good day, Archaeologist.", next = "END" },
      },
    },

    crew = {
      lines = {
        { id = "cr_default", text = "Remtravel thinks there was a great society under those forests long before the elves planted anything there. He's got young Hollee with him to keep his tools in order, and the way he loses trowels, she'll be busy." },
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
        { text = "I'd guess the elves mind you digging up their past.", next = "crew_elves" },
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
        { text = "Do the kaldorei resent the League's digging?", next = "op_ask" },
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
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "Now there's a name to make an archaeologist's hands shake, {g:lad|lass}. Old walls in Silithus with carvings nobody can read, and the night elves won't talk about them, which is the best sign of all." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's got the finest library in the human kingdoms and a lock on every door. I've written to the Kirin Tor four times, and they've answered once, to say no." } },
    magni = { { id = "tp_magni", text = "Good King Magni signs my grants himself, so you'll hear nothing but praise from me. He's a fine one for history, too, he'd come dig with us if they let him off his throne." } },
    dire_maul = {
      { id = "tp_dire_maul", text = "Eldre'Thalas, out in Feralas, is a whole Highborne city with the roof still on, mostly. The ogres have got it now, and it near breaks my heart." },
      { id = "tp_dire_maul2", when = { disposition = { min = 65 } }, text = "If you're bound for Dire Maul, mind the ogres and mind the walls even more, because Highborne masonry bites. Bring me back a rubbing of any inscription and I'll owe you a pint." },
    },
    gnomeregan = { { id = "tp_gnomeregan", text = "Lost a few gnome friends when that city went bad, and more friends' tools than that. Gnomes build to last, so it's still down there, waiting for someone to clean it up." } },
    highborne = { { id = "tp_highborne", text = "The night elves' old nobility, and the finest builders this side of Ironforge, I'll grant them that. Their ruins are all over Darkshore, and the locals would rather I left them alone." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. If it's not under a hill or a hundred feet of good stone, I don't know it." } },
  },
}
