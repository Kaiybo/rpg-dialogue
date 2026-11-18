-- More of Stonetalon: Braug Dimspirit, the shaman by the Talondeep Path who gives the Test of Lore,
-- and Denni'ka, Malaka'jin's butcher. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Braug Dimspirit: Test of Lore (1-4), from Dorn Plainstalker on to Parqual Fintallas.
---------------------------------------------------------------------------
P:NPC {
  key = "braug", id = TODO_NPC("Braug Dimspirit"), name = "Braug Dimspirit",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "windshear_crag" }, temper = { "grave", "dry" }, values = { "wisdom", "balance" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "He blames every race for the world's pain and spares none.",
    third = "{name} met Braug Dimspirit, the shaman by the Talondeep Path who gives the Test of Lore.",
  },
  greetings = {
    { id = "g_hi", text = "You stand at the mouth of the Talondeep Path. Few come here without a reason, so tell me yours." },
    { id = "g_back", when = { metBefore = true }, text = "You return to my fire. Sit, and let us see what you have learned since." },
    { id = "g_lore1", when = { questActive = TODO_QUEST("Test of Lore") }, text = "Dorn sent you. Now you stand before Braug, and your easy tests are behind you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Test of Lore") }, text = "You have walked further on the path of lore since we last spoke. Dorn chose well when he sent you to me." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The elements speak to you; let us see whether the past does as well." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. Your people are not the only ones to blame for the world's pain, whatever the night elves say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Braug Dimspirit. The days and nights grow colder across the world as goblins strip the land and the night elves point their fingers at the younger races, and I test those who would understand why." },
        { id = "h_lore1", when = { questActive = TODO_QUEST("Test of Lore") }, text = "Dorn knows the world's pain has many fathers, and he has sent you to me because you have shown the patience a test of the mind requires. It is easy to test your body; your mind is another matter." },
        { id = "h_lore2", when = { questActive = TODO_QUEST("Test of Lore") }, text = "If you carry the book I named, remember to bring it to me only after you have studied it, for I will not ask my question until it is in my hands." },
      },
      again = {
        { id = "h_again", text = "What else? There is time; there is always time for a question." },
        { id = "h_again2", text = "Ask. Life is full of questions, and you will never answer them all." },
      },
      choices = {
        { text = "What is the Test of Lore?", next = "test" },
        { text = "Where is Dor'danil?", next = "dordanil" },
        { text = "You blame everyone for the world's pain.", next = "blame" },
        { text = "Why do you live out here by the tunnel?", next = "tunnel" },
        { text = "Who will test me after you?", next = "after" },
        { text = "Earth Mother guide you, Braug.", next = "END" },
      },
    },
    test = {
      lines = { { id = "te_default", text = "Dorn tests the body and the spirit, and I test the mind. The book I name is the Legacy of the Aspects, which lies at the bottom of Dor'danil; find it, study it, and then I will ask you a question about what is written there." } },
      choices = {
        { text = "And if I answer wrongly?", next = "test_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_wrong = {
      lines = { { id = "tw_default", text = "Then you will find yourself a long way from here, with a long walk back to think about it. Study what you read, and you will not need that lesson." } },
      choices = {
        { text = "I'll read every page.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dordanil = {
      lines = { { id = "dd_default", text = "Through this tunnel and south into Ashenvale, almost beneath the walls of Splintertree. It is a barrow where night elf druids were laid to rest, and now the dead druids and those who slew them guard its depths together." } },
      choices = {
        { text = "The night elves won't welcome me there.", next = "dordanil_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dordanil_elves = {
      big = true,
      lines = { { id = "de_default", text = "They will not, and they may try to stop you before you reach it. They guard their forests as if no one else had a claim to the land, and they forget that the Horde, too, must eat and build." } },
      choices = {
        { text = "Their forest is theirs. I'll go carefully.", next = "BACK", reply = "A gentle answer, and perhaps a wise one. Go carefully, then, and go quickly.", fx = { align = { order = 1 } } },
        { text = "If they stand in my way, they'll fall.", next = "BACK", reply = "Then you will add to the pain I spoke of. I will not stop you, but I will remember it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      big = true,
      lines = { { id = "bl_default", text = "I do, because there is blame enough for everyone. The Forsaken and the orcs are not the only ones who have wounded Kalimdor and Lordaeron, and anyone who says otherwise is selling you something, most likely a goblin." } },
      choices = {
        { text = "Then the Horde must own its share.", next = "BACK", reply = "It must, and the strongest of us do. That is the beginning of wisdom.", fx = { align = { honor = 1 } } },
        { text = "The Horde did what it had to do.", next = "BACK", reply = "So does everyone, in their own telling. That is exactly the trouble.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tunnel = {
      lines = { { id = "tu_default", text = "Because those who walk between the forest and the mountains pass my fire, and they bring news from both. And because a shaman who lives too close to a city forgets to listen to anything but voices." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Not me. Seek out Parqual Fintallas in the Undercity; he was a great historian of the humans before the Plague took him, and he still seeks knowledge, though of a different kind. He will ask something of you before he asks his question." } },
      choices = {
        { text = "A Forsaken historian? Strange company for a tauren.", next = "after_parqual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_parqual = {
      lines = { { id = "ap_default", text = "Wisdom is wisdom, whoever keeps it. He will doubt you, mock you and call you a fraud, I expect; do not let it trouble you, for you have done masterfully thus far." } },
      choices = {
        { text = "Then I'll go to the Undercity.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a shaman who prefers questions to answers. Dorn sends me those who can bear them." } },
    dorn = { { id = "tp_dorn", text = "Dorn Plainstalker tests the body and the spirit at the Weathered Nook. He is a good judge of who is ready." } },
    _none = { { id = "tp_none", text = "That is a question I cannot answer. It is good to find one, now and then." } },
  },
}

---------------------------------------------------------------------------
-- Denni'ka: butcher at Malaka'jin.
---------------------------------------------------------------------------
P:NPC {
  key = "dennika", id = TODO_NPC("Denni'ka"), name = "Denni'ka", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "malakajin" }, temper = { "cheerful", "sly" }, values = { "trade", "hunt" },
  notices = { "race", "class" },
  impression = {
    first = "She claims to know what every beast in the mountains tastes like.",
    third = "{name} met Denni'ka, the troll butcher at Malaka'jin.",
  },
  greetings = {
    { id = "g_hi", text = "Hungry, mon? Denni'ka got meat fresh from the hunt, and only a little bit of spider in it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you'd come back, they always do." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Come, come, you get first pick before the tauren eat it all." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} be lookin' at my meat the way it looks at you. Feed it, mon, before it decides." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Denni'ka, and I butcher for Malaka'jin. Xen'Zilla's hunters bring me the meat, I cut it, and everybody eats, so long as de spiders don't steal it first." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The knife doesn't wait." },
        { id = "h_again2", text = "Ask, ask. I keep cuttin' while you talk." },
      },
      choices = {
        { text = "Show me your meat.", next = "BUSINESS" },
        { text = "The spiders steal your meat?", next = "spiders" },
        { text = "What's the best meat in Stonetalon?", next = "best" },
        { text = "I'll be going, Denni'ka.", next = "END" },
      },
    },
    spiders = {
      lines = { { id = "sp_default", text = "Every night, mon, the big ones come down from the northern trees and take what they can carry. Xen'Zilla's been huntin' dem, but they breed faster than he can kill them." } },
      choices = {
        { text = "I could help him hunt them.", next = "spiders_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spiders_help = {
      big = true,
      lines = { { id = "sh_default", text = "Ya, go talk to Xen'Zilla, he always needs more spears. And if you bring me any spider legs, I cook them up for you; they taste like crab, mostly." } },
      choices = {
        { text = "I'll help for the camp's sake.", next = "BACK", reply = "Good, mon, good! The camp remembers dat.", fx = { align = { light = 1 } } },
        { text = "I'll help if the pay's good.", next = "BACK", reply = "Ha! Honest, at least. Xen'Zilla pay fair, I promise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "Mountain goat from the high peaks, mon, sweet and lean. Kodo is too tough and harpy too stringy, and the less said about what Jin'Zil feeds his pets, the better." } },
      choices = {
        { text = "I'll take the goat, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I butcher. Before dat, I butchered on the Echo Isles, so not much has changed, mon, except it be colder." } },
    _none = { { id = "tp_none", text = "Dunno, mon, but ask me about meat and I talk all day." } },
  },
}
