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
    first = "She claims to know what every beast in the mountains tastes like.",
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

---------------------------------------------------------------------------
-- Veenix: Venture Co. weapons merchant, west edge of Windshear Crag (neutral).
---------------------------------------------------------------------------
P:NPC {
  key = "veenix", id = TODO_NPC("Veenix"), name = "Veenix", title = "Venture Co. Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "windshear_crag" }, temper = { "slick", "hard" }, values = { "profit", "company" },
  notices = { "kit", "race" },
  impression = {
    first = "Veenix sells Venture Company weapons from the western edge of Windshear Crag, to Horde and Alliance alike, with the stumps of the forest all round him. He is friendly in the way of someone who has been told to be.",
    third = "{name} met Veenix, a Venture Company weapons merchant at Windshear Crag.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Venture Company territory, friend! Don't mind the noise, that's just progress. You buyin'?" },
    { id = "g_back", when = { metBefore = true }, text = "Hey, a repeat customer! The Company loves a repeat customer. What broke?" },
    { id = "g_away", when = { away = 14 }, text = "{away} since your last purchase, pal. That's a long time to go under-equipped in these hills." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, huh. Look, pal, I just work the counter. Ya got a grievance about the trees, there's a form for that, and nobody reads it." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf! Easy, easy, hands where I can see 'em. I sell to your side too, friend, strictly business, no hard feelings about the lumber." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Whoa, that gear's had it, pal. Lucky for you, the Company's got a replacement for everything and a price for all of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Name's Veenix, authorized Venture Company merchant. Blades, axes, bludgeons, all Company stock, all priced to move, and I don't ask which side you're on so long as your coin's round." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Name's Veenix. Yeah, yeah, I know, the Horde's got opinions about the Company. I got opinions about the Horde, pal, and neither of us is gonna let that get in the way of a sale." },
        { id = "h_goblin", when = { race = "Goblin" }, text = "Veenix, Venture Company, and you're a fellow goblin, Steamwheedle by the look of ya. No offence, cousin, but the Cartel plays at business, and the Company does it." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'm on the clock here." },
        { id = "h_again2", text = "Ask, but make it quick, the foreman counts my minutes." },
        { id = "h_again3", text = "Yeah?" },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What is the Venture Company doing here?", next = "company" },
        { text = "You sell to people who are killing your loggers.", next = "both" },
        { text = "What's it like working for the Company?", next = "work" },
        { text = "These hills were forest once.", next = "forest", when = { race = { "Tauren", "NightElf" } } },
        { text = "I know machines. Those shredders run rough.", next = "shred", when = { profession = "Engineering" } },
        { text = "What's the quality like on Company steel?", next = "stock" },
        { text = "Who buys from you out here?", next = "customers" },
        { text = "We're done here, Veenix.", next = "END" },
      },
    },
    company = {
      lines = {
        { id = "company_d", text = "Extraction, pal. Lumber off the slopes, ore outta the Windshear Mine, and whatever's under Cragpool once the wheel's done its job. The mountain was just sittin' here not turnin' a profit, and the Company can't abide waste." },
      },
      choices = {
        { text = "Who runs the operation?", next = "company_boss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company_boss = {
      lines = {
        { id = "company_boss_d", text = "That'd be Supervisor Wrenchwhistle, down at the waterwheel. Don't go lookin' for him, friend, he ain't a people person, and the last fella who brought him a complaint is part of the wheel now, which is mostly a figure of speech." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    both = {
      lines = {
        { id = "both_d", text = "Sure I do. The loggers got their job and I got mine, and mine's on commission. If you put a Company axe through a Company logger, pal, that's two transactions as far as my ledger's concerned." },
      },
      choices = {
        { text = "That's cold, even for a goblin.", next = "both_cold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    both_cold = {
      big = true,
      lines = {
        { id = "both_cold_d", text = "It's the Venture Company, friend, cold is in the charter. Ya want warm, go find a Steamwheedle and pay double." },
      },
      choices = {
        { text = "At least you're honest about it.", next = "BACK", reply = "Honesty's free, pal. It's about the only thing here that is.", fx = { align = { honor = 1 } } },
        { text = "Business is business. I respect that.", next = "BACK", reply = "Now there's a customer after my own heart. I'd give ya a discount if I was allowed, which I ain't.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_d", text = "Long hours, short pay, and a foreman who docks ya for breathin'. But the Company's got a rule, pal: nobody quits. They get promoted, or they get reassigned to the mine." },
      },
      choices = {
        { text = "Would you leave, if you could?", next = "work_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_leave = {
      lines = {
        { id = "work_leave_d", text = "Keep your voice down! ...There's a fella called Ziz Fizziks set up across the crag, no friend of the Company, and he says so out loud. He's still breathin', which gives a goblin ideas, and I ain't sayin' another word." },
      },
      choices = {
        { text = "I never heard it.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest = {
      lines = {
        { id = "forest_d", text = "So they tell me. I got here after, pal; all I ever saw was stumps and invoices. Ya want me to feel bad about it, you'll have to get in line behind my mother." },
      },
      choices = {
        { text = "One day this mountain will answer you.", next = "BACK", reply = "Yeah, well. Tell it to come during business hours.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shred = {
      lines = {
        { id = "shred_d", text = "Tell me about it! They're built cheap and run hot, and when one blows, the operator's widow gets a bill for the parts. Ya didn't hear that from me, and no, we ain't hirin' mechanics who ask questions." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = {
        { id = "stock_d", text = "Company steel, stamped and numbered. It ain't pretty, pal, and it ain't dwarf-made, but it's cheap and it's here, and the next weapon shop's a long walk through spiders." },
      },
      choices = {
        { text = "Cheap and here. That's something.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = {
        { id = "customers_d", text = "Horde from Sun Rock, on their way to burn somethin' of ours. Alliance from the Peak, same errand. Company guards, who get an employee rate that's higher than yours, don't ask me why." },
      },
      choices = {
        { text = "Everyone arms here before fighting you.", next = "customers_irony" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_irony = {
      lines = {
        { id = "customers_irony_d", text = "Yeah, I noticed, pal. I mentioned it to the foreman once, and he said as long as the till balances, the rest is somebody else's department." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in Undermine, signed with the Company at twelve, and I been behind one counter or another since. That's the whole biography, pal." } },
    advice = { { id = "tp_ad", text = "Stay off the logging roads at shift change, friend. The shredders don't brake for pedestrians." } },
    _none = { { id = "tp_none", text = "Not my department, pal. And I'd keep my voice down askin' about it round here." } },
  },
}

---------------------------------------------------------------------------
-- Nizzik: Venture Co. armour salesman on the Cragpool waterwheel (neutral).
---------------------------------------------------------------------------
P:NPC {
  key = "nizzik", id = TODO_NPC("Nizzik"), name = "Nizzik", title = "Venture Armor Salesman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "windshear_crag" }, temper = { "nervous", "wheedling" }, values = { "survival", "profit" },
  notices = { "class", "kit", "race" },
  impression = {
    first = "Nizzik sells Venture Company armour from a platform on the Cragpool waterwheel, shouting over the machinery. He flinched whenever the wheel groaned, and he glanced over his shoulder before every answer.",
    third = "{name} met Nizzik, a Venture Company armour salesman at the Cragpool waterwheel.",
  },
  greetings = {
    { id = "g_hi", text = "Hey! Hey, over here, mind the gap! Armour, friend, genuine Company armour, and ya look like ya could use some." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and nobody followed ya, so that's a good day already! What'll it be?" },
    { id = "g_away", when = { away = 14 }, text = "{away}, pal, and I'm still on this stinkin' platform. Buy somethin', make my day." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yikes, look at the state of ya! Somebody's been usin' you for target practice. I got just the thing, and it's almost new." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Uh, big fan of your people, real big, love the totems. Please don't break the platform, it's load-rated for goblins." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ya came up real quiet, pal. Don't do that! A fella on this wheel has enough to be jumpy about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Nizzik, Venture armour sales, Cragpool branch! It's damp and it's loud and I can't feel my feet, but the stock's good, pal, and I'll sell to anybody who can hear me." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Nizzik, Venture armour sales, and you're Horde, huh? Listen, whatever your people got planned for the wheel, just gimme a wave first so I can step off it, all right?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Nizzik, Venture armour sales! You're Alliance, sure, sure, and your coin spends the same. The elves up at the Peak hate us somethin' fierce, but they never said nothin' about buyin' a breastplate." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, the wheel's loud!" },
        { id = "h_again2", text = "Ask, friend, but keep an eye behind me, would ya?" },
        { id = "h_again3", text = "Yeah?" },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Why sell armour on a waterwheel?", next = "wheel" },
        { text = "You seem on edge, Nizzik.", next = "edge" },
        { text = "What is the wheel for?", next = "pool" },
        { text = "If this wheel came down, where would you go?", next = "down", when = { faction = "Horde" } },
        { text = "The druids at the Peak mean to stop all this.", next = "peak", when = { faction = "Alliance" } },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "Watch your footing, Nizzik.", next = "END" },
      },
    },
    wheel = {
      lines = {
        { id = "wheel_d", text = "On account of I asked the supervisor for a transfer, pal. I meant a transfer to Ratchet. He's got a sense of humour, Wrenchwhistle, it's the only thing about him that ain't made of iron." },
      },
      choices = {
        { text = "Why did you want a transfer?", next = "wheel_transfer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wheel_transfer = {
      lines = {
        { id = "wheel_transfer_d", text = "I was at Windshear Mine, friend, and things come up outta that mine that ain't on the payroll. I said so in a memo. Lesson learned: never put it in a memo." },
      },
      choices = {
        { text = "What came up out of the mine?", next = "BACK", reply = "Spiders, pal, big as ponies, and somethin' behind the spiders that I didn't stay to look at. I sell armour now, because armour's safe.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    edge = {
      lines = {
        { id = "edge_d", text = "Me, on edge? Pal, I'm standin' on a wooden plank over a poisoned lake, sellin' armour to people who came here to kill my boss. I think I'm doin' great, considerin'." },
      },
      choices = {
        { text = "Then why stay?", next = "edge_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    edge_stay = {
      big = true,
      lines = {
        { id = "edge_stay_d", text = "Company contract, friend. Ya read the small print? Nobody reads the small print. I owe 'em six more years or my weight in copper, and I been tryin' to lose weight." },
      },
      choices = {
        { text = "A contract's a contract. You signed it.", next = "BACK", reply = "Yeah, yeah, I signed it. I was nine! All right, I was nineteen. It felt like nine.", fx = { align = { order = 1 } } },
        { text = "Walk away. No paper is worth dying on a wheel for.", next = "BACK", reply = "Ya think? ...Ziz Fizziks spits on the Company every day, and he's still got all his fingers. Don't tempt me, pal, I got a sale to make.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pool = {
      lines = {
        { id = "pool_d", text = "Power for the saws and pumps for the mine, and all the runoff comes right back down into Cragpool. Used to be fish in there, they tell me. Now it's kinda green, and it kinda bubbles, and I don't look at it." },
      },
      choices = {
        { text = "That water runs down to Sun Rock.", next = "pool_sunrock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pool_sunrock = {
      lines = {
        { id = "pool_sunrock_d", text = "Does it? Well, that'd explain the tauren. Look, I just sell the armour, friend, I don't route the pipes. Take it up with the big guy at the top, and wear somethin' sturdy when ya do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    down = {
      lines = {
        { id = "down_d", text = "Is that a hypothetical, pal, or a schedule? Because if it's a schedule, I'm takin' my strongbox and I'm walkin' west till I hit somebody who's hirin', maybe that Fizziks fella, maybe anybody." },
      },
      choices = {
        { text = "Call it a friendly warning.", next = "BACK", reply = "Friendliest I had all year. I owe ya one, and I don't say that for free.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peak = {
      lines = {
        { id = "peak_d", text = "Yeah, the Keeper with the antlers. One of his sent me a letter once, real polite, askin' us to stop. I passed it up the chain, and it came back stamped 'filed'. That's Company for 'no'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = {
        { id = "stock_d", text = "Company issue, pal, same as the guards get, minus the guard. Some of it's got a dent or two, on account of the previous owner bein' between jobs. Permanently. I knock a little off for that." },
      },
      choices = {
        { text = "You're selling dead men's armour.", next = "stock_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock_dead = {
      lines = {
        { id = "stock_dead_d", text = "I'm sellin' pre-tested armour, friend! Look, it stopped most of what hit it. That's a recommendation, when ya think about it." },
      },
      choices = {
        { text = "Most of it. Very reassuring.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Company man, pal, since I was old enough to sign. I'd tell ya more, but the wheel's got ears." } },
    advice = { { id = "tp_ad", text = "Don't drink from Cragpool, friend. Don't wash in it, neither. Don't even look at it too long." } },
    _none = { { id = "tp_none", text = "I dunno, pal, and up here it's safer that way. Ask somebody who ain't standin' on a wheel." } },
  },
}
