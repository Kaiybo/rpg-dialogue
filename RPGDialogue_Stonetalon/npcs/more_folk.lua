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
    first = "Braug Dimspirit is a tauren shaman who keeps a hut by the Talondeep Path and tests the minds of those Dorn Plainstalker sends him. He spoke of goblins, night elves and the younger races all sharing the blame for the world's pain, and he spared none of them.",
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
        { text = "The elements must weigh on you, out here alone.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Our people were hunted here once. I know the stories.", next = "tauren", when = { race = "Tauren" } },
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
    shaman = {
      lines = {
        { id = "shaman_d", text = "They do, and you will learn that weight yourself before long. The spirits of this pass carry every axe-stroke from Ashenvale down the tunnel to me, and a shaman who listens cannot choose to hear only the pleasant part." },
      },
      choices = {
        { text = "I'd rather hear it all than be deaf.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_d", text = "Then you know why I test those who come, and why I do not smile while I do it. A people who nearly vanished cannot afford braves who are strong in the arm and empty in the head." },
      },
      choices = {
        { text = "Test me as hard as you like.", next = "BACK", fx = { affinity = 1 } },
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
    first = "Denni'ka butchers and sells meat at Malaka'jin, the troll camp where the Barrens road climbs into Stonetalon. She laughs a lot and cuts fast, and she claimed to know what every beast in the mountains tastes like.",
    third = "{name} met Denni'ka, the troll butcher at Malaka'jin.",
  },
  greetings = {
    { id = "g_hi", text = "Hungry, mon? Denni'ka got meat fresh from the hunt, and only a little bit of spider in it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you'd come back, they always do." },
    { id = "g_back2", when = { metBefore = true }, text = "You came back, mon! And the spiders didn't get you, so dat's two good things." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone! I saved you nothin', but I got fresh." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! You want it in big lumps, ya? I know, I know, I get the cleaver." },
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
        { id = "h_again3", text = "Ya? Talk, mon, my hands know the work." },
        { id = "h_again", text = "What else, mon? The knife doesn't wait." },
        { id = "h_again2", text = "Ask, ask. I keep cuttin' while you talk." },
      },
      choices = {
        { text = "Show me your meat.", next = "BUSINESS" },
        { text = "The spiders steal your meat?", next = "spiders" },
        { text = "What's the best meat in Stonetalon?", next = "best" },
        { text = "Who else lives at Malaka'jin?", next = "camp" },
        { text = "How do you know what a beast ate?", next = "ate" },
        { text = "You laugh a lot for someone besieged by spiders.", next = "laugh" },
        { text = "My beast eats better than I do.", next = "pet", when = { class = "HUNTER" } },
        { text = "I can cook what you cut.", next = "cook", when = { profession = "Cooking" } },
        { text = "Darkspear meat, cut the Darkspear way.", next = "troll", when = { race = "Troll" } },
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
    camp = {
      lines = {
        { id = "camp_d", text = "Not many, mon, and dat's how we like it. Xen'Zilla leads the hunters, Witch Doctor Jin'Zil keeps to his cave up the hill with his potions and his bad temper, and Ken'zigla runs errands for him and pretends it's important work." },
      },
      choices = {
        { text = "What does the witch doctor want out here?", next = "camp_jinzil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_jinzil = {
      lines = {
        { id = "camp_jinzil_d", text = "Somethin' from the lake up at the Charred Vale, and somethin' from the spiders, and he don't explain himself to a butcher. I send up his meat, and it comes back as bones picked clean, so he's alive in dere at least." },
      },
      choices = {
        { text = "I'll take my questions to him.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ate = {
      lines = {
        { id = "ate_d", text = "You open the belly and you look, mon, it's no great voodoo. A goat dat's been eatin' the grey moss by the goblin mill has a liver like a stone, and I don't sell dat to nobody I like." },
      },
      choices = {
        { text = "The Venture Company's mill is poisoning the goats?", next = "ate_mill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ate_mill = {
      big = true,
      lines = {
        { id = "ate_mill_d", text = "Poisonin' the water, the moss, the goats and the wyverns dat eat the goats, ya. The tauren up at Sun Rock been shoutin' about it for a year, and they're right, even if they shout it very slow." },
      },
      choices = {
        { text = "Then the mill has to burn.", next = "BACK", reply = "Ha! I hold your coat, mon. Bring me back a goblin's hat.", fx = { align = { order = -1 } } },
        { text = "Sun Rock's elders should settle it properly.", next = "BACK", reply = "Dey been settlin' it properly a long time, and the moss still be grey. But ya, maybe you're right.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    laugh = {
      lines = {
        { id = "laugh_d", text = "What else you gonna do? De spiders don't go away if I cry, and the meat still needs cuttin'. My mother laughed through the whole crossin' from the Echo Isles, and she said the sea couldn't drown a troll who was busy." },
      },
      choices = {
        { text = "Your mother sounds formidable.", next = "laugh_mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    laugh_mother = {
      lines = {
        { id = "laugh_mother_d", text = "She was, mon, and she taught me the knife. First rule: never cut angry, because the meat comes out ragged and so do you." },
      },
      choices = {
        { text = "A good rule for more than butchery.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "pet_d", text = "Den you're doin' it right, mon. Feed de beast first and it fights for you, feed it last and it thinks about how you'd taste." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_d", text = "Good! Den take de shank and cook it slow with something sour, and don't you dare boil it. I cut too careful to see my meat boiled." },
      },
      choices = {
        { text = "Slow and sour. You have my word.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "troll_d", text = "Ya, across the grain and thin as a leaf, the way the old ones did on the isles. The orcs just hack it in lumps, and I love dem, but I can't watch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Hang your meat high at night in dese mountains, mon. What the spiders don't take, the harpies will." } },
    background = { { id = "tp_bg", text = "I butcher. Before dat, I butchered on the Echo Isles, so not much has changed, mon, except it be colder." } },
    _none = { { id = "tp_none", text = "Dunno, mon, but ask me about meat and I talk all day." } },
  },
}
