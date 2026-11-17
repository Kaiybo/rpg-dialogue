-- Booty Bay: the Steamwheedle Cartel's port, kept by the Blackwater Raiders. Voice: bibles/stranglethorn.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "revilgaz", id = TODO_NPC("Baron Revilgaz"), name = "Baron Revilgaz",
  bible = "bibles/stranglethorn.md", role = "noble", tier = "major",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "ambitious", "proud" },
  notices = { "purse", "kit" },

  impression = {
    first = "Baron Revilgaz watches the cove from his balcony the way a miser watches a purse. He was perfectly civil to me, and I had the distinct sense of being priced.",
    third = "{name} was received by Baron Revilgaz, who keeps Booty Bay for the Steamwheedle Cartel and counts its ships and coins from his balcony.",
  },

  greetings = {
    { id = "g_balcony", text = "From this balcony I can count every ship in the cove and most of the coins coming off them. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Good; repeat business is the only kind I trust." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors on my balcony? That doesn't trouble me in the least; gold doesn't wear a tabard." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You jingle when you walk, and Booty Bay is very fond of people who jingle. Just try not to do it near the docks after dark." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Empty pockets, in my town? That's dangerous, since people here will assume you mean to fill them from theirs." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there chewed on you. There's a smith along the boardwalk who takes coin and asks no questions." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "A cat on my balcony. If you're after the parrot, it bites, and it's worth more than you." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When the Bloodsail get bold, I hire anyone who can hold a gangplank, and I pay by the day rather than by the head, because heads are far too easy to fake. What I cannot abide is a sellsword who changes ships halfway through the fight." } },
      choices = {
        { text = "Once I take a contract, I hold it to the end.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I fight for the best offer, and offers change.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Pelts for Gadgetzan, tusks for Ratchet, and panther skins for every lord in Stormwind who wants a rug that snarls. The jungle is a warehouse with teeth, and you lot are the ones brave enough to open the doors." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Pelts for Gadgetzan, tusks for Ratchet, and panther skins for every lord in Stormwind who wants a rug that snarls. The jungle is a warehouse with teeth, and you lot are the ones brave enough to open the doors. Your {pet} looks well fed, which in this port means you're either a very good hunter or it's been eating my dock rats, and I'm grateful either way." },
      },
      choices = {
        { text = "I hunt fair, Baron, and I won't strip a jungle for coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it pays, it's a pelt. Point me at your buyers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Mend the ward-lanterns on the outer piers, for a start, because the Bloodsail keep sending something across the water at night that my Bruisers can't hit with a club. The Cartel pays well for magic that keeps the cargo dry and the pirates wet." } },
      choices = {
        { text = "A contract's a contract. I'll keep your lanterns lit.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll work for whoever pays the most that night.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Cartel asks the ledger, and the ledger always answers. Still, when a storm sinks one of my cargoes, I do wonder whether the competition paid off your elements, so I'd rather keep a shaman on good terms." } },
      choices = {
        { text = "The elements can't be bought, Baron, and nobody should try.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything has a price in Booty Bay, the storms included.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The jungle grows back, and so does the profit. The Venture Company is the one with the saws, not the Blackwater Raiders. If you want to fight someone over trees, I'll gladly point you at them." } },
      choices = {
        { text = "Then I'll stop the Venture Company's saws.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Profit and saws, it's all the same to the jungle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Now and then, to ward a vault or freeze a cargo of fish on the way to Ratchet, and I pay them exactly what the ledger says it's worth. The trouble with mages is that they always think their time is worth more than anyone else's, and the ledger always disagrees." } },
      choices = {
        { text = "My craft is worth what I say it is, Baron.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A fair price for fair work. I'll match your ledger.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Baron.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman of the Horde under my balcony. Keep your lightning away from my ships, and we'll get along nicely." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde under my balcony. Whatever you pray to, ask it to keep the Bloodsail off my harbor, and I'll pay a fair tithe." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock on my balcony. Keep whatever you've summoned on a short leash, because the Bruisers can't tell a demon from a drunk and won't try." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "I know a cutpurse's walk when I see one. Booty Bay tolerates thieves who pay their dues, and it drowns the ones who don't." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid in Booty Bay. If you're here to lecture me about the jungle, I'll warn you now that I've heard it." },
        { id = "h_default", key = true,
          text = "Baron Revilgaz. This port belongs to the Steamwheedle Cartel, and I keep it for them. The Blackwater Raiders hold the water, the Bruisers hold the peace, and I hold the books." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Seahorn says the Bloodsail are planning something against my town. They've hated us for years, but planning is new, and I don't like new." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "There's an island off the coast the captains won't go near anymore. Something there scares sailors, and scared sailors don't carry cargo. Find out what it is." },
        { id = "h_tides", when = { any = { { questActive = TODO_QUEST("Water Elementals") }, { questActive = TODO_QUEST("The Curse of the Tides") }, { questActive = TODO_QUEST("The Stone of the Tides") } } },
          text = "Now, this business with the tides. I don't pretend to understand the magic, but I understand exactly what it's costing me." },
        { id = "h_ledger", when = { metBefore = true }, text = "Eleven ships in, nine out, and two the Bloodsail will want to know about. The ledger never sleeps, and neither do I, much." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Lanterns on every deck, music on every pier, and somebody about to fall in. It's the same every night, and I'd miss it if it stopped." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "Back again, and still not spending much. My balcony is for paying customers, friend, so make your question worth the climb." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, on my balcony. I've had three of your kind offer to ward my vault, and every one of them quoted a price that made Viznik weep, so I'll hear your offer with a straight face." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, all plate and patience. The Bruisers keep the peace on my piers, but I always find room in my ledger for someone who can hold a line when the Bloodsail come calling." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, with the jungle still on your boots. Kebok downstairs deals in pelts and tusks, and somehow a sliver of every deal finds its way into my ledger, so happy hunting." },
      },
      again = {
        { id = "h_again", text = "Go on. Every minute on this balcony is a minute I'm not counting something." },
        { id = "h_again2", text = "Something more? I bill by the question, you know, and I'm only mostly joking." },
        { id = "h_again3", when = { townStanding = { town = "booty_bay", min = 30 } }, text = "Ask. You've earned a little of my time; this town says so." },
      },
      choices = {
        { text = "Does the Cartel ever ask the spirits anything, Baron?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What could a spellcaster do for Booty Bay, Baron?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Your cartels are stripping the jungle bare.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Who are the Bloodsail?", next = "bloodsail" },
        { text = "What does the Cartel want with a jungle?", next = "cartel" },
        { text = "How do you keep the peace between Alliance and Horde here?", next = "peace" },
        { text = "What's your opinion of me, Baron?", next = "ledger", when = { metBefore = true } },
        { text = "Stormwind could use a port like this.", next = "stormwind", when = { faction = "Alliance" } },
        { text = "The Horde's ships dock here too. Do you trust them?", next = "horde", when = { faction = "Horde" } },
        { text = "Is there a chapel anywhere in Booty Bay?", next = "priest_chapel", when = { class = "PRIEST" } },
        { text = "What does a rogue owe the Baron, working his docks?", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "This was troll country before it was Cartel country, Baron.", next = "k_troll", when = { race = "Troll" } },
        { text = "Will the Baron let a warlock keep rooms here?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "Does the Cartel ever hire mages, Baron?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you ever hire warriors to guard the Cartel's cargo, Baron?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What does the Cartel make from the jungle's beasts, Baron?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Good day, Baron.", next = "END" },
      },
    },

    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "Pirates, and not our sort of pirate, the sort who pays dues. They raid anything that floats and they've never forgiven us for doing well, so if you're fighting them, I'm paying." },
      },
      choices = {
        { text = "Then I'm fighting them.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "What's the difference between them and your Raiders?", next = "bloodsail_diff", fx = { trait = { skeptical = 1 } } },
        { text = "Just asking.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    bloodsail_diff = {
      lines = {
        { id = "bd_default", text = "Receipts, mainly. My Raiders take what they're owed and write it down, while the Bloodsail take everything and burn the paper. Civilization is mostly receipts." },
      },
      choices = {
        { text = "That's a thin line.", next = "bloodsail_line", fx = { align = { honor = 1 } } },
        { text = "I like the receipts.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    bloodsail_line = {
      lines = { { id = "bl_default", text = "It's a line with a town on one side and a burning ship on the other. Thin is fine, so long as I can count it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cartel = {
      lines = {
        { id = "c_default", text = "Goblins took this cove from the trolls before anyone here had heard the word orc. We built a town in a shark's mouth and made it pay. Everyone's welcome as long as they spend." },
      },
      choices = {
        { text = "Hard to argue with that.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } },
        { text = "And the trolls you took it from?", next = "cartel_trolls" },
        { text = "Who do you answer to?", next = "cartel_boss", fx = { trait = { curious = 1 } } },
      },
    },
    cartel_trolls = {
      lines = {
        { id = "ct_default", text = "They're still out there, still angry, and still bad at accounting. I don't lose sleep over the trolls; I save that for the Bloodsail." },
      },
      choices = {
        { text = "That's cold.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Trolls who raid ships get what they deserve.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    cartel_boss = {
      lines = {
        { id = "cb_default", text = "The Cartel's trade princes, in principle, but in practice I answer to the number at the bottom of the quarterly report. If it's a good number, nobody visits, and I prefer it when nobody visits." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    peace = {
      lines = {
        { id = "p_default", text = "Simply enough. Anybody who draws steel on my boardwalk meets the Bruisers, and nobody likes meeting the Bruisers, so the war stays outside the shark's teeth." },
      },
      choices = {
        { text = "And if a war comes through those teeth anyway?", next = "peace_war" },
        { text = "Neutral ground. I like it.", next = "BACK", fx = { affinity = 1, opinion = { peace = "for" } } },
      },
    },
    peace_war = {
      lines = {
        { id = "pw_default", text = "Then I'll sell both sides the boats to leave in. Neutral doesn't mean blind; it means I keep the receipts for everyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "The Bloodsail want more than your town, Baron. They want you.", tag = "Persuade", next = "knives",
          check = { pass = { any = { { disposition = { min = 65 } }, { reputation = { faction = "Steamwheedle Cartel", min = "honored" } }, { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } } },
          fail = { next = "knives_no", fx = { affinity = -1 } } },
      },
    },

    ledger = {
      lines = {
        { id = "l_default", text = "You're a line item, and a small one for now. Pay your tab and don't start fights, and the line gets longer." },
        { id = "l_liked", when = { townStanding = { town = "booty_bay", min = 30 } },
          text = "My Bruisers nod when you pass, and Skindle doesn't water your rum. That's about as high as anyone gets in my ledger without owning a ship." },
        { id = "l_disliked", when = { townStanding = { town = "booty_bay", max = -20 } },
          text = "You're in red ink. People talk about you on my docks, and not in the way that's good for business, so fix it." },
      },
      choices = {
        { text = "I'll keep paying my tab.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not a number, Baron.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    stormwind = {
      lines = {
        { id = "s_default", text = "Stormwind could use a lot of things, a treasury for one. Their ships dock here, they pay and they leave, and that's the arrangement; it's the best one they'll get." },
      },
      choices = {
        { text = "Stormwind pays its debts.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Stormwind deserves no better than what it pays for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "hd_default", text = "I trust their coin. Their sailors drink, fight and pay for the damage, which is more than I can say for some of the Alliance ones." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest_chapel = {
      lines = { { id = "pc_default", text = "A chapel? We have a tavern with a very quiet corner on Tuesdays, so bless the corner if you like, and bless the ledger while you're at it; it could use the help." } },
      choices = {
        { text = "I'll bless them both.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives = {
      lines = {
        { id = "kn_default", text = "They do, and Seahorn's men have read the letters to prove it. So I sleep in a different room every night and never take the same stair twice, and the Bruiser outside my door thinks he's guarding the ledger, because that's what I told him." },
        { id = "kn_letters", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "You read the letters yourself, so I won't insult you by pretending otherwise. They want me and Seahorn floating in the cove, so I sleep in a different room every night now, and the Bruiser outside my door thinks he's guarding the ledger." },
      },
      choices = {
        { text = "Your secret's safe with me, Baron.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives_no = {
      lines = {
        { id = "kno_default", text = "Everybody wants something from me, friend, and the Bloodsail are only louder about it. Pay your tab and leave the worrying to the man with the balcony." },
        { id = "kno_rogue", when = { class = "ROGUE" },
          text = "Is that a warning or a sales pitch? Either way, I don't buy information from people who look like they sell it twice." },
      },
      choices = {
        { text = "Suit yourself, Baron.", next = "BACK" },
      },
    },
    k_rogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "A cut, and a little courtesy. Pick a sailor's pocket on the docks and that's between you and the sailor, but pick one of mine and the Bruisers will find you before you've counted it, because in Booty Bay everything worth stealing already has my name in the ledger." },
        { id = "xro_canal", when = { origin = "human_canal_pickpocket" },
          text = "A canal rat from Stormwind, by those fingers. Stormwind's watch is slow and my Bruisers are not, so pick sailors' pockets if you must and leave mine alone." },
      },
      choices = {
        { text = "Then I'll work for you, Baron, not against you.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Every ledger has a gap, Baron. I'll find yours.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "What does the Baron's ledger say about me?", next = "ledger" },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "It was, and the Gurubashi will tell you so if you ask them politely through an arrow. The Cartel pays rent in the only coin trolls here take, which is staying out of their temples, and the Darkspear left long before we built a single plank." },
      },
      choices = {
        { text = "My people will remember who sits on their coast.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Coin is coin. I don't care who built the dock.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "What does the Cartel want with a jungle?", next = "cartel" },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "Let you? Friend, I'd let a dragon keep rooms if it paid in advance and didn't eat the staff. Keep your little friend off the balconies and out of the kitchen, and if it sets anything on fire, it's on your bill." },
      },
      choices = {
        { text = "Fair terms, Baron.", next = "BACK", fx = { affinity = 2 } },
        { text = "My imp has better manners than your Bruisers.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that happens in this cove ends up in my ledger sooner or later. Ask, and I'll tell you what it says, within reason." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "You've been good for business, so ask me anything you like; I'll even answer the ones I'd normally bill for." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "I answer questions for paying customers, and you're barely one. Make it quick." },
    },
    background = { { id = "tp_bg", text = "Steamwheedle born and Steamwheedle made. I came to this cove with a ledger and a plan, and the ledger's thicker now." } },
    advice = { { id = "tp_ad", text = "Pay your tab, stay off the Bloodsail's boats, and don't feed the parrot; it bites." } },
    bloodsail = { { id = "tp_bloodsail", text = "They want my town, and they've wanted it since before you were born. They can keep on wanting." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut and leaves me to run things. That's the best arrangement a goblin can ask for." } },
    _none = { { id = "tp_none", text = "If it doesn't touch my port, I don't keep track of it. Krazek does, so go and ask him." } },
  },
}

P:NPC {
  key = "seahorn", id = TODO_NPC("Fleet Master Seahorn"), name = "Fleet Master Seahorn",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "booty_bay" }, temper = { "boisterous" }, values = { "brave", "loyal" },
  notices = { "race", "kit" },

  impression = {
    first = "Fleet Master Seahorn laughs like someone who has survived a great many bad ideas, most of them his own. I liked him at once, which may be exactly what he intended.",
    third = "{name} met Fleet Master Seahorn of the Blackwater Raiders, a loud, cheerful pirate who answers to the Baron and to no one else.",
  },

  greetings = {
    { id = "g_deck", text = "Up the stairs and still breathing! That's a good start, for I've watched orcs come down those stairs headfirst." },
    { id = "g_back", when = { metBefore = true }, text = "The tide's brought you back! I like a sailor who can find the way home." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, this far from the plains! I traded the grass for the sea long ago and I've never regretted it, save once, in a storm." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been keelhauled twice and dried in the sun. Get that armor patched before the Bloodsail notice." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear on my docks! Your people knew these waters before any goblin put a plank on them, and I'd wager you still know how to read a tide." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear on my top floor! Ha, I've sailed with worse crews than you, but mind the rum." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Loud, wet and over faster than you'd think, because whoever holds the rail in the first minute holds the ship. I once watched one stubborn warrior with a shield keep a whole crew of buccaneers on their own deck until our cannons finished the argument." } },
      choices = {
        { text = "Hold the rail and keep the line. That's how it's done.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the line. I'd leap in among them and start swinging.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, when we run down the coast to Jaguero Isle and want fresh meat that didn't come out of a barrel. A good hunter can drop a Bloodsail lookout from his crow's nest at a hundred paces, too, and I'll not pretend I've never been glad of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Now and then, when we run down the coast to Jaguero Isle and want fresh meat that didn't come out of a barrel. A good hunter can drop a Bloodsail lookout from his crow's nest at a hundred paces, too, and I'll not pretend I've never been glad of it. Mind, if {pet} comes aboard, it'll want to fight the ship's cat, and the ship's cat has never lost." },
      },
      choices = {
        { text = "I'd hunt for the galley, not shoot sailors for coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A lookout's an easy shot. I'd take it and the coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We take on anyone who can climb a rope and keep their mouth shut, and a rogue does both better than most. The Bloodsail have spies in every tavern on this coast, so a sharp pair of eyes on our side is worth a great deal to me." } },
      choices = {
        { text = "I'll keep your secrets and hunt the Bloodsail spies.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll work for whoever pays best, Fleet Master.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Fleet Master.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, a gnome who swore he could summon a waterspout and then sank our own skiff instead. I've been wary of magic at sea ever since, though I'll admit the Bloodsail's faces were a sight when the water started spinning." } },
      choices = {
        { text = "Leave magic off the ships. A good crew is enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give me a deck and I'll show you what magic can do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Faith in the Light, faith in the tides and a great deal of faith in the Baron's coin, in roughly that order when the weather turns. Most of my crews will pray to anything that listens when the Bloodsail come over the horizon, and they forget all about it the moment the guns go quiet." } },
      choices = {
        { text = "Even a forgotten prayer is heard. The Light remembers your crews.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then trust the guns. Prayer won't sink a Bloodsail ship.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Fleet Master.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Easy, my friend: you only rob the people who'd rob you first, and you keep every bargain you strike with the Baron. The Bloodsail break their word as often as they break their masts, and that's the whole difference between us and them, as I see it." } },
      choices = {
        { text = "A pirate's still a thief. Honor asks more than kept bargains.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Rob the robbers. That's as honest as the sea allows.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Half of them do, and the other half think you'd only charge more for it than a goblin would. I had a druid of the Circle sail with us once, and we never lost a mast that voyage, so I've stopped laughing at the idea." } },
      choices = {
        { text = "The sea answers to nature, not to coin. I'd never sell a storm.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it saves your masts, I'd name my price like anyone else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest ashore, ha! Sailors are a superstitious lot, so if you linger in Booty Bay they'll be lining up to have you bless their hulls, though I doubt any of them will pay you in more than rum." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in Booty Bay! You'll find more pirates here than honest men, and I'm one of the pirates, but I like to think I'm an honest one, which makes me a rarer beast than anything in the jungle." },
        { id = "h_default", key = true,
          text = "Fleet Master Seahorn, of the Blackwater Raiders! The fleet answers to me, I answer to the Baron, and the Baron answers to his ledger." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "The Bloodsail are scheming against the town, and their camp's up the Wild Shore. Raid it, bring me their letters, and we'll see whose name is on the plan." },
        { id = "h_treasure", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "A treasure under the waves, and somebody wants me to have the best of it? Bring that gem straight here, and don't let it near a Bloodsail." },
        { id = "h_storm", when = { metBefore = true }, text = "Smell that? There's a storm coming by morning, and my knees know it before the sky does. That's the old sailor's curse for you." },
        { id = "h_crazz", when = { heardLine = "crazz.h_default" }, text = "Crazz has been at you about the Bloodsail? He's a good lad, if too eager, but I was just as eager once myself, and it got me a fleet." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Ha, you'd fit right in on the Blackwater ships, though I'll warn you that my sailors guard their rum better than the Baron guards his vault." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You could freeze the Bloodsail's sails solid from the docks, I'd wager, and I'd buy you a drink for every ship you stopped." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Ha! Now there's someone built for a boarding action. You'd look grand swinging onto a Bloodsail deck, provided you don't miss the rope the way my last three did." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! There's a parrot on my flagship that has bitten every hand in the fleet, so if you understand beasts, I'd dearly love to have it explained to me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid aboard my docks! Sailors swear your kind can talk a storm out of a sky, and I've lost enough sails that I'd like to believe them." },
      },
      again = {
        { id = "h_again", text = "Ha! Got more for me? Out with it, then, before the tide turns." },
        { id = "h_again2", text = "Ask away. I've rum, time and opinions, and only the rum runs out." },
      },
      choices = {
        { text = "Why does a tauren go to sea?", next = "why" },
        { text = "Tell me about the Bloodsail.", next = "bloodsail" },
        { text = "What's it like, working for a goblin?", next = "baron" },
        { text = "Got a sea story for me?", next = "story" },
        { text = "Do you miss the plains, ever?", next = "plains", when = { race = "Tauren" } },
        { text = "I've never been on a ship.", next = "landlubber", when = { race = { "Dwarf", "Gnome" } } },
        { text = "The sea has spirits too, Fleet Master. Do you hear them?", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "My people were sailors once, before Thrall.", next = "k_troll", when = { race = "Troll" } },
        { text = "My ancestors sailed west from the Feralas coast.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "Do the Blackwater Raiders take on rogues, Fleet Master?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have the Blackwater ever used mages against the Bloodsail, Fleet Master?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the Blackwater Raiders put much faith in the Light?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How can a pirate be an honest man, Fleet Master?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's a boarding action like against the Bloodsail, Fleet Master?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters ever sail with the Blackwater Raiders?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do your sailors really think a druid can calm a storm, Fleet Master?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Fair winds, Fleet Master.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Everyone asks! My people wander the plains, and I found a bigger plain: flatter, wetter, and the centaur can't follow me onto it." },
      },
      choices = {
        { text = "Ha. Fair enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "What did your family say?", next = "why_family" },
      },
    },
    why_family = {
      lines = { { id = "wf_default", text = "Something about the Earth Mother not owning a boat. I sent them a shell and they never wrote back, for tauren are very good at disapproving quietly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "They're cutthroats with a fleet, and we're cutthroats with a town, and that's the whole difference. It matters more than you'd think." },
      },
      choices = {
        { text = "I'll help you sink them.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "Who leads them?", next = "bloodsail_lead" },
        { text = "Why do they hate this town so much?", next = "bloodsail_why" },
      },
    },
    bloodsail_lead = {
      lines = { { id = "bl_default", text = "A fleet master of their own, with a grudge for every one of my ships. He'd dearly love my horns over his door. I'd love to see him try." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    bloodsail_why = {
      lines = { { id = "bw_default", text = "Because we did what they wanted to: found a cove, made it rich, and kept it. Nothing makes a pirate angrier than another pirate who settled down." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    baron = {
      lines = {
        { id = "bn_default", text = "The Baron? He counts my cannonballs, every last one. But when the Bloodsail came for him, I was the one at his door, and neither of us has forgotten it." },
      },
      choices = {
        { text = "They came for him?", next = "baron_attempt" },
        { text = "Sounds like friendship.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    baron_attempt = {
      lines = { { id = "ba_default", text = "For both of us! They tried a knife in the dark and got a tauren in the dark instead, which was a bad trade for them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" } } } },
    },

    story = {
      lines = {
        { id = "st_default", text = "Once I sailed through a storm so thick the gulls walked! It took the mast, the cook and my hat, and though the hat turned up again, to this day I miss that hat more than the mast." },
      },
      choices = {
        { text = "And the cook?", next = "story_cook" },
        { text = "That's not true.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    story_cook = {
      lines = { { id = "sc_default", text = "Washed up in Ratchet a month later, spitting mad, and runs a chowder stall there now. Won't serve me a single bowl, and I can't call that unfair." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    plains = {
      lines = {
        { id = "pl_default", text = "On calm nights, aye. The water goes flat and silver and I think of grass, and then a wave slaps the hull and I remember why I left. You came a long way from the plains yourself." },
      },
      choices = {
        { text = "The Earth Mother walks with me here too.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "I'm glad to trade the plains for a ship and a captain.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I miss it every day.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    landlubber = {
      lines = {
        { id = "ll_default", text = "Never! Then the sea's waiting to make a fool of you. Sit in the middle of the boat, look at the horizon, and don't eat the cook's eggs." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Hear them? Ha! Every night in my bunk they sing me to sleep, and every storm they shout me awake. A shaman at sea is worth a crew of ten, for you'll know the squall before the gulls do, so if you ever want a berth, you've got one." },
        { id = "xsh_tauren", when = { race = "Tauren" },
          text = "Hear them? Ha! My grandmother swore no tauren could hear the Earth Mother out on the waves, and she was wrong about that. A tauren shaman on a deck is a sight I'd pay to see, and I'd give you the wheel for a day." },
      },
      choices = {
        { text = "The sea spirits are wild. I'd leave them be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The spirits respect a steady hand. I'll take the berth.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Why does a tauren go to sea?", next = "why" },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "That you were, and good ones! The Darkspear canoes on the Echo Isles could cut through surf my ships wallow in. You ever want to remember what your grandmothers knew, come aboard, and I'll put you in the rigging where you belong." },
      },
      choices = {
        { text = "One day I'll sail these waters again.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "My people walk on land now, Fleet Master.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    k_sky = {
      lines = {
        { id = "xsk_default", text = "West from Feralas, you say, into open water? Then your ancestors were braver sailors than any I know, because there's nothing out that way but weather. Did they ever say what they sailed toward, or were they only sailing away?" },
      },
      choices = {
        { text = "Away. The winds found them after.", next = "BACK", fx = { affinity = 2 } },
        { text = "That's a story for another day, Fleet Master.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every ship that sails these waters sends word back to me, one way or another! Ask, and I'll tell you what the sea's been saying." },
    },
    background = { { id = "tp_bg", text = "I was a plains calf who grew into a sea-going bull. The grass raised me, and the waves finished the job.", next = "why" } },
    advice = { { id = "tp_ad", text = "Respect the sea, laugh at the storm, and never, ever trust a red sail." } },
    bloodsail = { { id = "tp_bloodsail", text = "Their fleet master would dearly love my horns on his wall. He'll have to get in line." } },
    _none = { { id = "tp_none", text = "That's a landlubber's question, so ask somebody with dry boots." } },
  },
}

P:NPC {
  key = "krazek", id = TODO_NPC("Krazek"), name = "Krazek",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "chatty" }, values = { "cunning", "ambitious" },
  notices = { "craft", "purse" },

  impression = {
    first = "Krazek talks faster than I can follow and seems to know the price of everything in the jungle. I suspect he already knew mine before I opened my mouth.",
    third = "{name} met Krazek, Baron Revilgaz's secretary, who claims to know every price, pirate and debt in Stranglethorn.",
  },

  greetings = {
    { id = "g_desk", text = "Busy, busy, busy, but never too busy for a customer. You are a customer, aren't you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back already? I said you'd return, and I'm rarely wrong about these things." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! The Baron's always short of good ore, and I'm always short of favors owed. We should talk." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Lean times? I can find you work, and finding work is a service, and services cost, but we'll sort something out." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Mosh'Ogg ogres up in the hills, the Kurzen men in the north, and the Gurubashi Arena, where every few hours a chest gets dropped in the pit and everybody kills each other for it. Personally I'd take the ogres, because they don't hold grudges past supper." } },
      choices = {
        { text = "I'd rather fight ogres for the town than brawl for a chest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Arena sounds right. I'll take that chest however I can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tiger pelts are down, since Nesingwary's lot keep flooding the market, but basilisk scales are up, and a white tiger's hide would buy you a house here if anyone ever came back from King Bangalash alive." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Tiger pelts are down, since Nesingwary's lot keep flooding the market, but basilisk scales are up, and a white tiger's hide would buy you a house here if anyone ever came back from King Bangalash alive. And don't think of selling me {pet}, friend, because I've seen that look in a hunter's eye and it's never the look of somebody who sells." },
      },
      choices = {
        { text = "I'd take Bangalash for the hunt, not for your buyers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll hunt whatever sells highest this week.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Oh, the best one is that a Venture Company man on the coast is buying up those singing crystals to power something he won't name. The second best is that Zanzil's been seen brewing by the shore again, and the third is about you, but I'm saving that one." } },
      choices = {
        { text = "Name your price for the one about me.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather earn my news than buy gossip.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They say you can call rain, which the sailors like, and lightning, which the Bruisers don't. Mostly they say you pay in coin like everyone else, and around here that's the highest praise there is." } },
      choices = {
        { text = "I'll keep the peace here. The Bruisers have nothing to fear from me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Bruisers worry. I answer to the elements, not the Cartel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The ruins of Zul'Gurub, mostly, and the old Gurubashi temples along the coast where the trolls left offerings to their gods. I don't ask what they do, I just sell them, and I'd advise you not to ask either, because some of them answer." } },
      choices = {
        { text = "I'll examine one carefully, and leave the cursed ones alone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll take the whole crate. Power is worth the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bits and pieces from the troll ruins, mostly, and a few things the Bloodsail tossed overboard because they started whispering at night. I sell them cheap, because I don't like the whispering either, and I'd rather they were your problem than mine." } },
      choices = {
        { text = "I'll take them and bind whatever's whispering.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Throw them back in the sea. Some things should stay drowned.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than it admits, I'd say, because every week a crew comes back from the jungle short a few hands and long on nightmares. There's no temple and the Baron won't pay for one, so the sailors make do with rum and each other, and some of them don't make do at all." } },
      choices = {
        { text = "I'll tend them without charge. The Light doesn't send bills.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Rum works quicker than prayer on sailors. Let them be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Tiger pelts, raptor hides, basilisk scales, and gorilla anything, mostly bought by nobles up north who want a rug with teeth. Nesingwary's camp alone ships more skins through here in a month than you'd see in a year, and the Baron takes his cut of every one." } },
      choices = {
        { text = "This jungle can't keep giving forever. Someone should limit the hunting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunters take what they can carry. That's the jungle's own law.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, how nice! I'll note you down under visitors with a conscience, which is a very short list in Booty Bay, and the Baron likes to know who's on it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Thrall's people have been coming through more often since he brought the old ways back, and I keep a note of every one." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde! Loa or shadow, I don't judge; I only write down which one, because somebody always asks me later." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Ah, a fellow professional. You listen at doors and I listen at bars, so we should compare notes sometime, for a fee." },
        { id = "h_default", key = true,
          text = "Krazek, secretary to Baron Revilgaz. Prices, pirates, who owes whom in this jungle: ask me. If I don't know it, it hasn't happened yet." },
        { id = "h_cousin", when = { heardLine = "tranrek.h_default" },
          text = "You met my cousin in Gadgetzan! Did he tell you what he does? No? He never does, and that's how he stays rich." },
        { id = "h_thorsen", when = { questActive = TODO_QUEST("Supplies to Private Thorsen") },
          text = "Private Thorsen's out near the rebels' camp, waiting on those supplies. Keep your head down on the way, because Kurzen's men don't sign for deliveries." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "That island the Baron frets about? The crews swear they hear things out there at night, and I swear I don't believe them, but I'm also not going." },
        { id = "h_rumor", when = { questActive = TODO_QUEST("The Rumormonger") },
          text = "Information's my trade, and I'm trusting you with a little of it. Rumors spoil faster than fish, so run!" },
        { id = "h_tranrek", when = { questActive = TODO_QUEST("Tran'rek") },
          text = "Tran'rek, in Gadgetzan, pays well for the right sort of help. Tell him Krazek sent you; it can't hurt." },
        { id = "h_gossip", when = { metBefore = true }, text = "Three new rumors since you left, and one of them's about you. Don't worry, it's a flattering one, mostly." },
        { id = "h_smotts", when = { heardLine = "smotts.h_default" }, text = "Smotts told you about the giants? He tells everyone, and I think the giants have heard it by now too." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, you'd be just the type to appreciate some of the trinkets that come up out of the old troll ruins, and I've got a crate of them that hum when you get close." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now there's a customer who knows the value of a deal with something bigger than himself, and I've got a few deals that might interest you." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Steel's dear down here, friend, since everything rusts, so I hope you've oiled that armor or you'll be paying Zarena for new plates by the end of the week." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, good! I've buyers for panther pelts, raptor hides and basilisk scales, and not one of my buyers has ever asked how the animal felt about it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in Booty Bay! You'd be amazed what the jungle trade pays for a pelt, and I'd be amazed if you approved of any of it." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, quick, the Baron rings that bell every four minutes." },
        { id = "h_again2", text = "More? I love a customer with questions; questions are inventory." },
      },
      choices = {
        { text = "What do people in Booty Bay say about shamans?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What rumors are going round about magic in Booty Bay, Krazek?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What's the word in the jungle?", next = "word" },
        { text = "Do you really know everything?", next = "brag" },
        { text = "What's the Baron like to work for?", next = "baron" },
        { text = "What's the rumor about me?", next = "about_me", when = { metBefore = true } },
        { text = "How are the rebels up north holding out?", next = "rebels", when = { faction = "Alliance" } },
        { text = "I trade in information too, Krazek.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Where do these humming trinkets come from, Krazek?", next = "xmage", when = { class = "MAGE" } },
        { text = "What deals do you have for warlocks, Krazek?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does Booty Bay have any use for a priest, Krazek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does this jungle hold that's worth a warrior's time, Krazek?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which beasts are fetching the best prices this month, Krazek?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does the jungle trade pay for, Krazek, and who's buying?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Thanks, Krazek.", next = "END" },
      },
    },

    word = {
      lines = {
        { id = "w_default", text = "The Venture Company's cutting up the north, Kurzen's men have gone strange, and the trolls are still trolls. It's the same as ever: dangerous, and good for business." },
      },
      choices = {
        { text = "Good for business?", next = "bandages" },
        { text = "Strange how? Kurzen's men.", next = "word_kurzen" },
        { text = "And the Venture Company?", next = "word_venture" },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1, learn = { "kurzen" } } },
      },
    },
    bandages = {
      lines = { { id = "bd_default", text = "Somebody has to sell the bandages. Might as well be somebody who knows where you're bleeding." } },
      choices = { { text = "That's grim, Krazek.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    word_kurzen = {
      lines = { { id = "wk_default", text = "They stopped buying. Soldiers always buy: boots, rum, letters home. When soldiers stop wanting letters home, something's gone wrong in their heads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },
    word_venture = {
      lines = { { id = "wv_default", text = "Big saws, small ethics. They're digging up something in the hills that sings, and if you want to know more, ask Crank downstairs, but don't believe his first price." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    brag = {
      lines = { { id = "br_default", text = "Everything worth knowing, and a fair bit that isn't. The second part's cheaper." } },
      choices = {
        { text = "Prove it. What's Seahorn's weakness?", next = "brag_prove", fx = { trait = { curious = 1 } } },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brag_prove = {
      lines = { { id = "bp_default", text = "Rum, storms, and a hat he lost years ago and still talks about. That one's free, since everyone knows it; the real one costs more than you have." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    baron = {
      lines = {
        { id = "bn_default", text = "Wonderful! Demanding, suspicious and generous when it suits him, like working for a very rich parrot. Don't repeat that, by the way; he has a parrot." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keeping quiet will cost you, Krazek.", next = "baron_deal", fx = { align = { honor = -2 }, trait = { greedy = 1 } } },
      },
    },
    baron_deal = {
      lines = { { id = "bdl_default", text = "Ha! Now you're talking my language: a discount on rumors, worth whatever I decide, and I've decided it's worth nothing. Nice try, though; I like you more now." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    about_me = {
      lines = {
        { id = "am_default", text = "That you're new, armed and asking questions, which describes half the docks. I'll make you a better one, if you give me something to work with." },
        { id = "am_liked", when = { townStanding = { town = "booty_bay", min = 30 } },
          text = "That you pay what you owe and the Bloodsail don't like you. In Booty Bay, that's a love song." },
        { id = "am_king", when = { questDone = TODO_QUEST("Big Game Hunter") },
          text = "That Nesingwary has a new head on his wall and it's partly your fault. Nobody's talking about anything else at the bar." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "The Baron sent me. He wants to hear about Crank Fizzlebub.", tag = "Deceive", next = "crank",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 60 } } } } },
          fail = { next = "crank_no", fx = { affinity = -1 } } },
      },
    },

    rebels = {
      lines = {
        { id = "rb_default", text = "Thinly. They buy roots and pay in Stormwind silver, which is the last thing Stormwind ever sent them, and I send what I can at a fair price. Well, fairish." },
      },
      choices = {
        { text = "Give them a better price.", next = "rebels_price", fx = { align = { light = 1 }, trait = { generous = 1 } } },
        { text = "A fairish price is fair enough for deserters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    rebels_price = {
      lines = { { id = "rp_default", text = "A better price, from a goblin, in the Baron's town? You're either very kind or very new. I'll knock a copper off the next crate, but don't tell anyone, or it'll ruin me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crank = {
      lines = {
        { id = "cr_default", text = "The Baron? Already? Fine, fine: Crank's been selling the Venture Company's singing crystals out the back of this very tavern, and he's got some arrangement with a goblin at the Mirage Raceway that I haven't priced yet, so tell the Baron I was going to mention it today, at the latest." },
        { id = "cr_shards", when = { questDone = TODO_QUEST("Singing Blue Shards") },
          text = "He knows already? Then he knows you carried crystals for Crank yourself, so I'll skip that part. The new part is a deal with some goblin at the Mirage Raceway, and you can tell the Baron I was going to mention it today, at the latest." },
      },
      choices = {
        { text = "I'll pass it on.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crank_no = {
      lines = {
        { id = "cno_default", text = "The Baron rings a bell when he wants me, friend; he doesn't send strangers up the stairs. Nice try, though, and I'll be selling that story by supper." },
        { id = "cno_paladin", when = { class = "PALADIN" },
          text = "A paladin, lying for the Baron? Now that's a rumor I can sell twice, so thank you kindly for it." },
      },
      choices = {
        { text = "It was worth a try.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Then you're competition, and I don't like competition, but I like partners, and a partner's just competition who splits the fee. Tell me something I don't know and I'll tell you something you don't, and we'll see who comes out ahead." },
      },
      choices = {
        { text = "The Bloodsail are watching the Baron's ships.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll tell you something, but it'll be made up.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Pick a subject, any subject; I've got a rumor for every one of them and a price for most." },
    },
    background = { { id = "tp_bg", text = "I started out running messages, and now I am the messages. That's not bad for a goblin with no inheritance." } },
    advice = { { id = "tp_ad", text = "Information's worth more than gold, and it spoils faster, so use it quick." } },
    kurzen = { { id = "tp_kurzen", text = "The rebels up north buy from me, but Kurzen's lot stopped buying anything a while back, and that's never a good sign." } },
    bloodsail = { { id = "tp_bloodsail", text = "Bad for shipping, bad for business, bad for my nerves. The Baron pays well to make them less of all three." } },
    _none = { { id = "tp_none", text = "That, I don't know. Come back tomorrow and I will." } },
  },
}

P:NPC {
  key = "mackinley", id = TODO_NPC("\"Sea Wolf\" MacKinley"), name = "\"Sea Wolf\" MacKinley",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "menacing" }, values = { "cunning", "practical" },
  notices = { "purse", "drink" },

  impression = {
    first = "Sea Wolf MacKinley was friendly enough over the knucklebones, and I still came away feeling like a column in his ledger. I mean to stay out of his debt.",
    third = "{name} shared a crate with Sea Wolf MacKinley, a Booty Bay moneylender who swears that not even death cancels a debt owed to him.",
  },

  greetings = {
    { id = "g_crate", text = "Pull up a crate, then. Are you any good at knucklebones? It doesn't matter much, since I'm better." },
    { id = "g_back", when = { metBefore = true }, text = "Look who it is! You don't owe me a thing, not yet anyway." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "A full purse and a friendly face, the two things that go missing quickest in this town. Hold on to both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're three sheets gone. Sit down before you bet something you'll miss in the morning." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When a debtor hides behind his friends, aye, I send somebody broad enough to make the friends reconsider. I don't need anyone hurt, mind, since a dead man pays slowly and a frightened one pays tomorrow." } },
      choices = {
        { text = "I won't break bones over another man's debts.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A debt's a debt. I'd collect it however I had to.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of them run off into the jungle thinking I'll not follow, and they're right, because I won't, but you might. A frightened man leaves a trail like a wounded boar, and I'd pay attention to where it ends." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some of them run off into the jungle thinking I'll not follow, and they're right, because I won't, but you might. A frightened man leaves a trail like a wounded boar, and I'd pay attention to where it ends. Your {pet} has the nose for it, I'd wager, and a beast never forgets a smell, which is more than I can say for my debtors." },
      },
      choices = {
        { text = "I track beasts, MacKinley, not frightened men.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Point me at the debtor. Tracking is tracking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A gnome once paid me in conjured gold, and it went to air the minute he was out the door. I found him in the end, and he paid twice, once for the debt and once for the insult, and he does his sums in real coin now." } },
      choices = {
        { text = "A debt's a debt. He should have paid in honest coin.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anyone who cheats a moneylender has my admiration.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A debt doesn't die with the man, and I've never seen a ghost pay one off, so they can trouble me all they like. If your ancestors want to collect on me, tell them to take a number like everybody else." } },
      choices = {
        { text = "Their spirits deserve rest, MacKinley. Let the dead debts go.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A debt's a debt, living or dead. I respect that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tried, a young one who thought a little illusion would make the bones roll his way. I let him win three games before I took back every coin and his robe besides, because a cheat is only clever until he's caught." } },
      choices = {
        { text = "Cheating is cheating. He got what he deserved.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you didn't catch him for three games, he earned the winnings.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, MacKinley.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the Bloodsail only want gold, and gold I can find, but a demon wants something you can't get back once it's spent. I've heard sailors' stories of deals made in the dark of the sea, and none of them ended with a ship coming home." } },
      choices = {
        { text = "A deal made with care can be kept. It's all in the terms.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Demons don't keep deals. That's why I master them instead.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "There's mercy in the interest, friend, because I let a man pay late before I send anyone round. Shaky Phillipe has had more chances than a cat has lives and still he hides from me, so you tell me who's being cruel to whom." } },
      choices = {
        { text = "Forgive him, MacKinley. Mercy costs less than you think.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He made his bargain. Let him pay what he owes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I lend to anyone who comes back, and druids come back more often than sailors, being harder to drown. Mind you, the last one paid me in herbs, and I'm still not sure if I got the better end of it or a rash." } },
      choices = {
        { text = "A debt is a debt. I'd pay you in coin, honestly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A druid owes nothing to a moneylender. The jungle keeps no ledgers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, is it? You'll find me a fair man in my way, though if you've come to tell me that forgiving a debt is good for the soul, I've heard that sermon before and I didn't care for the ending." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? You lot talk to dead ancestors, I hear, so you can tell a few of my late debtors I'm still waiting." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? If you're here to pray for my soul, it's fully paid up, which is more than I can say for my customers." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Light fingers on you, I can tell. Pick a pocket in this town and you'll owe the Bruisers, and the Bruisers sell their debts to me." },
        { id = "h_default", key = true,
          text = "They call me the Sea Wolf. Folk borrow, folk forget, and I remind them; dying doesn't get you out of a debt with me, and I've proved it." },
        { id = "h_seen_stoley", when = { heardLine = "stoley.h_default" },
          text = "You've seen Stoley, and he's still breathing? Good, because breathing men can pay." },
        { id = "h_voodoo", when = { questActive = TODO_QUEST("Voodoo Dues") },
          text = "There's a debt out among the trees with a bit of voodoo wrapped round it. That's no matter to me; magic doesn't cancel what's owed." },
        { id = "h_maury", when = { questActive = TODO_QUEST("Cracking Maury's Foot") },
          text = "Maury's dead, and he still owes me. Death is no excuse, so bring me what he's got." },
        { id = "h_stoley", when = { questActive = TODO_QUEST("Stoley's Debt") },
          text = "Stoley's been dodging me long enough. Go and see him, and be friendly about it, at first." },
        { id = "h_knuckle", when = { metBefore = true }, text = "Won three hands of knucklebones this morning and lost one. The one I lost, I'll be collecting on." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage at my table, eh? Don't go conjuring any extra dice, friend, because I count every pair in this tavern, and I'd know." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I'll be honest with you, I'd rather owe money to the Bloodsail than to a demon, and I've owed plenty to the Bloodsail." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? There are a few names on my list who've been dodging me for months, and you look like the sort who could knock on a door without needing it opened." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and they tell me your kind can track anything at all. I've a debtor or two who would be very surprised to hear that." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? I've no shape to change into that'd get me out of a debt, and neither have you, so we'll get along fine." },
      },
      again = {
        { id = "h_again", text = "Still here? Then talk, since talking's free, for now." },
        { id = "h_again2", text = "Go on, then; I'm only shuffling." },
      },
      choices = {
        { text = "Do the spirits of your dead debtors ever trouble you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Has a debtor ever tried to pay you off with magic?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Deal me in. One game.", tag = "Persuade", next = "game",
          check = { pass = { money = { min = 100000 } } },
          fail = { next = "broke" } },
        { text = "What do people owe you for?", next = "owe" },
        { text = "How do you collect from a dead man?", next = "dead" },
        { text = "Shaky Phillipe is terrified of you.", next = "shaky", when = { heardLine = "shaky.h_default" } },
        { text = "Undead pay their debts too, then?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I know a marked deck when I see one, MacKinley.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Has a mage ever cheated you at dice, MacKinley?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why would you rather owe the Bloodsail than a demon, MacKinley?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there no mercy in your ledger, MacKinley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you use warriors to collect your debts, MacKinley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could a hunter track down your debtors, MacKinley?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you lend to druids, MacKinley, or are we too much trouble?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll keep my purse closed, thanks.", next = "END" },
      },
    },

    game = {
      lines = { { id = "gm_default", text = "Coin and nerve, is it? Fine, you'll get your game, though not now, while I'm working. But I'll remember your face, and I never forget a face that can pay." } },
      choices = { { text = "I'll be back for it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    broke = {
      lines = { { id = "bk_default", text = "With that purse? Come back when it weighs more than your mouth does." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },

    owe = {
      lines = { { id = "o_default", text = "Cards, boats, ale, but mostly bad ideas, and bad ideas are always bought on credit." } },
      choices = {
        { text = "And if someone simply can't pay?", next = "owe_cant" },
        { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    owe_cant = {
      big = true,
      lines = { { id = "oc_default", text = "Everybody can pay; it's only a question of what with. Coin, work, a favor, or fear at the very bottom, and I don't like the bottom; it takes longer." } },
      choices = {
        { text = "Fear's a poor collector.", next = "BACK", fx = { align = { light = 2 }, affinity = -1 } },
        { text = "Sometimes fear is the only thing that works.", next = "BACK", fx = { align = { light = -2 }, trait = { cruel = 1 }, affinity = 1 } },
        { text = "A debt's a debt. Fair's fair.", next = "BACK", fx = { align = { honor = 2 }, affinity = 1 } },
      },
    },

    dead = {
      lines = {
        { id = "d_default", text = "Dead men leave things behind: teeth, rings, a foot with a secret in it. A debt doesn't die, you see; it just changes address." },
      },
      choices = {
        { text = "A foot?", next = "dead_foot" },
        { text = "That's ghoulish.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "A debt should outlive the debtor, and fair's fair.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    dead_foot = {
      lines = { { id = "df_default", text = "Maury kept his savings in it. It's wooden, before you ask, or mostly wooden, and you don't want to ask about the rest." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 1 } } },
    },

    shaky = {
      lines = {
        { id = "sk_default", text = "Good. Fear is a fine savings plan, and they always pay when they're shaking enough. Tell him I asked after him kindly; he'll know what kindly means." },
      },
      choices = {
        { text = "Go easy on him. He's harmless.", next = "BACK", fx = { align = { light = 2 }, trait = { kind = 1 } } },
        { text = "I'll tell him. Kindly.", next = "BACK", fx = { align = { light = -1 }, trait = { cruel = 1 }, affinity = 1 } },
      },
    },

    forsaken = {
      lines = {
        { id = "fs_default", text = "Pay better than the living, mostly. They've nothing left to spend it on and a long memory for who's owed. You'll fit right in at the table." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Do you, now? Then you'll know the deck's honest, friend, because I don't need to mark cards to win; I only need people to keep playing. That's the whole secret of the trade, and I've given it to you for nothing, which I never do." },
      },
      choices = {
        { text = "Then deal me in, and we'll see.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'll keep watching your hands all the same.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I make it my business to know things about people, mostly what they owe. Ask, and we'll see what it costs you." },
    },
    background = { { id = "tp_bg", text = "Sailor, gambler, collector. I was very bad at the first two before I got very good at the third." } },
    advice = { { id = "tp_ad", text = "Don't borrow what you can't pay back, and if you do, don't borrow it from me." } },
    _none = { { id = "tp_none", text = "Does it owe me money? Then I don't care about it." } },
  },
}

P:NPC {
  key = "kebok", id = TODO_NPC("Kebok"), name = "Kebok",
  rivals = { "nesingwary" },
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "slick" }, values = { "ambitious", "cunning" },
  notices = { "purse" },

  impression = {
    first = "Kebok smiled through his whole pitch, and I noticed the smile never reached the part about his agents getting killed. I am apparently meant to be harder to kill.",
    third = "{name} heard a business proposition from Kebok, a goblin trader whose agents keep dying in the jungle.",
  },

  greetings = {
    { id = "g_pitch", text = "You've the look of somebody who'd like to be rich, and I can help with that for a fee, a small one, or medium at most." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor is back! Don't tell the others I said so." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you've done well for yourself! Ever thought about investing? I have several opportunities, and some of them are even legal." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A warrior makes a better corpse-preventer, which is what I really need, since the Skullsplitters take the head off anyone carrying my crates. Walk my goods past their camps and still have your head at the end of it, and I'll call it a good season." } },
      choices = {
        { text = "I'd carry your goods openly and meet any troll head on.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather sneak the crates past them at night.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Their witch doctors, and they're the reason my agents come back as bones in a basket, when they come back at all. Kill a witch doctor and the rest scatter like gulls, which is what I call an efficient investment." } },
      choices = {
        { text = "I'll kill their witch doctors for a share of the profits.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Those trolls are defending their own land, Kebok.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Skullsplitters and the Bloodscalp leave fetishes along the trails, and my agents walk past them and never come back. I don't believe in curses, mind you, but I believe in dead agents, and I've got plenty of those." } },
      choices = {
        { text = "Respect their shrines, and your agents might live longer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then pay me to smash the shrines. Business is business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Venture Company caught one at the mine, the Bloodsail caught the second, and the third got eaten by something in the jungle that I'd rather not describe. It's all very sad, of course, but the work still needs doing, and you look harder to kill." } },
      choices = {
        { text = "I'll do your work, but I want the full truth first.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sounds like they were careless. I'm not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kebok.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd hire anything that comes back alive, friend, and I'd guess demons are hard to kill. The trouble is that the Cartel's insurance doesn't cover anything summoned, and the Baron is very strict about his paperwork." } },
      choices = {
        { text = "My demon works for me, not for the Cartel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then I'll do the work myself, by the Baron's rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Grieve is a strong word, but I think about them, yes, usually while I'm writing the next contract. The trolls don't care whose goods they're taking, and my agents knew the risk, though I'll admit not every one of them knew it quite as well as I did." } },
      choices = {
        { text = "Tell your next agents the whole truth. They deserve it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart business. What they don't know won't scare them off.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing that's yours to worry about, friend, just goods the trolls would rather I didn't have. A druid who can walk past a raptor without being eaten could earn a fortune off me, and I'd never ask how you did it." } },
      choices = {
        { text = "I'll not use the wild's gifts to smuggle your goods.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A fortune's a fortune. Show me the route and I'll walk it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You're one of Nesingwary's hunters now, I hear. Good for you, but every tiger you skin for him knocks another silver off my pelts, so forgive me if I don't buy you a drink." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Old Hemet's sore at you, I hear, and anybody who's sore at Hemet is a friend of mine. What are you buying?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Wonderful, wonderful, because my last few agents died rather badly in the jungle and nobody said a word over any of them, which I'm told is bad for morale among the next few." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The jungle trolls have witch doctors of their own, so it might do me some good to have someone like you on my side for once." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! If your loa or your shadows can stop the Bloodscalp skinning my agents, I'll make you a partner, a very junior partner." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, excellent. Fire is very persuasive with trolls, and I keep a list of trolls who need persuading." },
        { id = "h_default", key = true,
          text = "Kebok. I move goods out of Stranglethorn to places that pay for them, but the trolls keep killing my agents, so I need someone harder to kill." },
        { id = "h_ears", when = { questActive = TODO_QUEST("Bloodscalp Ears") },
          text = "Bloodscalp ears. Bring me a bundle and I can count how many fewer trolls are bothering my people. Business by subtraction." },
        { id = "h_tusks", when = { questActive = TODO_QUEST("Skullsplitter Tusks") },
          text = "Skullsplitter tusks, and don't ask what for. All right, ask: polished up, nobody on the southern islands can tell them from a tiger's fang." },
        { id = "h_takeover", when = { questActive = TODO_QUEST("Hostile Takeover") },
          text = "That job I gave you: quietly, quickly, and my name stays off it. Some deals are best closed in the dark." },
        { id = "h_agents", when = { metBefore = true }, text = "Lost another agent to the trolls last week, a good man and terrible at running, so I'm hiring faster runners now." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now you're the kind of agent I can use, friend, because my last three came back in pieces, and I'm sure a quiet one would last longer." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, I don't suppose your demon could do a little work for me? I pay in gold, of course, though I imagine it'd prefer souls." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! The trolls keep killing my agents, friend, but they were mostly clerks with knives, and you look a great deal harder to kill." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You'd move through that jungle like it was your own garden, which is exactly the kind of agent I keep losing." },
      },
      again = {
        { id = "h_again", text = "Still interested? Excellent; interest compounds, you know." },
        { id = "h_again2", text = "What else? Time is money, and you're spending mine." },
      },
      choices = {
        { text = "What do the jungle trolls' witch doctors do to your agents?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Bloodscalp have casters I should worry about?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What exactly is the business?", next = "trade" },
        { text = "Troll tusks sold as tiger fangs? That's fraud.", next = "fraud" },
        { text = "What happened to your agents?", next = "agents" },
        { text = "I'm a troll, Kebok.", next = "troll", when = { race = "Troll" } },
        { text = "I hunt tigers myself. You're selling troll tusks as fangs?", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "What happened to your last three agents, Kebok?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really hire a demon, Kebok?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you grieve for the agents you lost, Kebok?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would a warrior make a better agent than your clerks, Kebok?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your agents keep dying in the jungle. What are they carrying, Kebok?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Not interested.", next = "END" },
      },
    },

    trade = {
      lines = { { id = "t_default", text = "Buy low in the jungle and sell high over the sea. The sea's the expensive part, on account of the pirates." } },
      choices = {
        { text = "Sounds risky.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" } } },
        { text = "Who buys over the sea?", next = "trade_who" },
      },
    },
    trade_who = {
      lines = { { id = "tw_default", text = "Island folk to the south who want a tiger's fang over the door and have never met a tiger. I'd hate to disappoint them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fraud = {
      big = true,
      lines = {
        { id = "f_default", text = "Fraud is a strong word; I prefer 'creative sourcing'. Nobody's hurt, except the trolls, and they started it." },
      },
      choices = {
        { text = "Fine by me, so long as it pays.", next = "BACK", fx = { align = { honor = -2 }, trait = { greedy = 1 }, affinity = 2 } },
        { text = "I'll do the work. Not the lying.", next = "BACK", fx = { align = { honor = 2 }, affinity = 1 } },
        { text = "I'll be telling the Baron.", next = "fraud_baron", fx = { align = { order = 1 }, affinity = -2 } },
      },
    },
    fraud_baron = {
      lines = { { id = "fb_default", text = "Please do. He takes ten percent of it, and he'll be very interested to hear you're worried about his ten percent." } },
      choices = { { text = "...Something else.", next = "BACK" } },
    },

    agents = {
      lines = {
        { id = "a_default", text = "Ambushed on the jungle roads. The Bloodscalp don't negotiate, and believe me, I've tried; I sent a goblin with a very good contract, and they sent back the contract." },
      },
      choices = {
        { text = "Just the contract?", next = "agents_contract" },
        { text = "I'm sorry for your people.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    agents_contract = {
      lines = { { id = "ac_default", text = "Signed, in something that wasn't ink. I've had it framed, to remind me to hire tougher people." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    troll = {
      lines = {
        { id = "tr_default", text = "Darkspear, by the look of you, not Bloodscalp or Skullsplitter, so that's a different tribe, different tusks and a different ledger. We're fine, then, absolutely fine, aren't we?" },
      },
      choices = {
        { text = "For now.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "The Bloodscalp aren't my people. Hunt them.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Keep your voice down, friend, the customers can hear you. A hunter knows the difference, but a merchant in Stormwind doesn't, and as long as he doesn't, the business is very healthy." },
      },
      choices = {
        { text = "I'll keep quiet, for a cut.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll tell every buyer I meet.", next = "BACK", fx = { align = { honor = 1 }, affinity = -2 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Information is just another commodity, and I deal in commodities. Ask, and I'll tell you what I'm willing to part with." },
    },
    background = { { id = "tp_bg", text = "Bought my first crate at nine and sold it at ten for twice the price. I never looked back, mostly because I never had the time." } },
    advice = { { id = "tp_ad", text = "Never let the client see the warehouse." } },
    bloodsail = { { id = "tp_bloodsail", text = "Every crate they take is a crate I paid for twice: once to buy it, and once to cry about it." } },
    _none = { { id = "tp_none", text = "Is there money in it? No? Then I'm afraid I wasn't listening." } },
  },
}

P:NPC {
  key = "skindle", id = TODO_NPC("Innkeeper Skindle"), name = "Innkeeper Skindle",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "booty_bay" }, temper = { "wry" }, values = { "practical" },
  notices = { "drink", "guest" },

  impression = {
    first = "Innkeeper Skindle keeps the Salty Sailor running under the Baron's nose and lowers his voice near the stairs. Sensible man, and the rum was better than I expected.",
    third = "{name} took a stool at the Salty Sailor, where Innkeeper Skindle keeps the rooms, the rum and a careful eye on the Baron's stairs.",
  },

  greetings = {
    { id = "g_inn", text = "In you come, out of the sun. Stools by the windows get the breeze, and the sea air covers the smell of the fish." },
    { id = "g_home", when = { homeInn = { "Booty Bay", "The Salty Sailor Tavern" } }, text = "Your room's just as you left it, mostly, though the parrots got in again." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy there. Pirates drink like that and fall off the pier, and then I have to fish them out, and I charge for it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night the fleet's in, and the Bruisers only come running if the Baron's guests are bleeding. I'd sooner have one steady warrior at the bar who can end a brawl with a look than six goons who end it with a table." } },
      choices = {
        { text = "A good warrior ends a fight before it starts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some brawls are worth letting run. They clear the air.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They tell the biggest lies in the South Seas, and every one of them has very nearly killed King Bangalash. The ones from Nesingwary's camp come down for rum and a real bed, and they leave mud all over the stairs the Baron has to walk up." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They tell the biggest lies in the South Seas, and every one of them has very nearly killed King Bangalash. The ones from Nesingwary's camp come down for rum and a real bed, and they leave mud all over the stairs the Baron has to walk up. Keep {pet} by the hearth where I can see it, and well away from the kitchen and that cleaver." },
      },
      choices = {
        { text = "A hunter who lies about a kill dishonors the beast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good story's worth a little embroidery, Skindle.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Something done about the cellar, honestly. The damp gets into the casks, the rats get into the damp, and last week something bigger than a rat got in after them, and none of my staff will go down past the third step." } },
      choices = {
        { text = "I'll clear your cellar, and you can keep your coin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll clear it, for a month of free rooms.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The only spirits I deal with come in a bottle, friend, though the sailors swear something walks the docks at low tide. I tell them it's the Baron's tax man, and they settle their bills faster." } },
      choices = {
        { text = "If a restless spirit walks your docks, it deserves some peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it walk. Ghosts on the docks are none of my business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not him, his people, and they're good at it, which is why I serve the strong rum near the door and the weak rum near the stairs. A drunk man talks louder, and I'd rather he did it where nobody's listening." } },
      choices = {
        { text = "You're a clever innkeeper. I'll keep my voice down.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Baron listen. I've nothing to hide.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Skindle.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It is, in the cellar, and I've tried water, sand and a very loud sailor's curse. It doesn't give much light, but it's never once needed trimming, so I've decided to call it an investment." } },
      choices = {
        { text = "A candle that never goes out is a fine bargain.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd snuff it for you. Strange magic is best ended.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, everything, sooner or later, because rum loosens the tongue and nobody remembers I'm listening. I've heard of ships sunk on purpose and cargo gone missing and men who went over the side with a little help, and I keep every word to myself, which is the only reason I'm still pouring." } },
      choices = {
        { text = "Men who drowned others should answer for it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep the secrets. Silence keeps an innkeeper breathing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Anyone with a warrant in Stormwind, which is a good third of the room on a busy night. They behave themselves here because the Bruisers would throw them off the docks if they didn't, but they still won't sit with their backs to you." } },
      choices = {
        { text = "Wanted men belong in Stormwind's cells. I'll remember their faces.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Booty Bay isn't Stormwind. Let them drink in peace.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only once, and quietly enough, but the stairs haven't been right since, and the Baron heard it from up top. I put it on the bill as furniture and decided not to ask whose fault it was." } },
      choices = {
        { text = "Then it was the druid's fault. They should pay for the stairs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bear in a pirate inn sounds like a fine night. Leave it be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the Salty Sailor, there's a sight. Keep your blessings quiet near the stairs, if you would, because the Baron's men don't care for anything they can't put a price on." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in here? Take a seat by the wall, friend, where you can see the door, because half my customers would sooner not be seen drinking near the Silver Hand." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Salty Sailor. If you can do anything about the damp in my rooms, the first rum is on the house." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the Salty Sailor. Sit where you like, only please don't bless the rum, because the last one who did put the sailors right off it." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock at my bar. Your imp can sit by the fire, but it pays for its own stool like everybody else." },
        { id = "h_default", key = true,
          text = "The Salty Sailor. Rooms upstairs, rum down here, and the Baron up top over all of it. Keep your voice down near the stairs." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two pirates fought over a parrot last night, and the parrot won. It's upstairs now, paying rent somehow." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night in Booty Bay means lanterns on the water, music on every deck and somebody falling off a pier, like clockwork." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue at my inn. Keep your voice down near the stairs, because the Baron's ears reach farther than you'd think, and I'd rather not lose my license." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! The last one who stayed here left a candle burning that never went out, and I still can't figure out how to snuff it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, in my common room. Lean your shield by the door if you like, because the last fellow who drank with his on knocked three tankards and a sailor off the bar." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? If you've a beast with you, keep it out of my kitchen, because the cook throws cleavers at anything with fur and she rarely misses." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at the Salty Sailor! Mind the rum, friend; I've seen what happens when one of your kind turns into a bear after the third mug." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've three tabs to chase and one of them's armed." },
        { id = "h_again2", text = "More? Lean on the bar, then, only not that bit; that bit's sticky." },
      },
      choices = {
        { text = "Do the sailors here tell stories of spirits on the docks?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the Salty Sailor need from someone with magic?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Heard anything interesting?", next = "gossip" },
        { text = "What's it like with the Baron living upstairs?", next = "baron" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "Does the Horde get a fair pour here?", next = "x_horde", when = { faction = "Horde" } },
        { text = "Stormwind soldiers drink beside orcs here?", next = "x_alliance", when = { faction = "Alliance" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Does the Baron really listen at your stairs, Skindle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is that magic candle still burning, Skindle?", next = "xmage", when = { class = "MAGE" } },
        { text = "What do the sailors confess over their rum, Skindle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who in Booty Bay fears the Silver Hand, Skindle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do fights break out often in the Salty Sailor, Skindle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the hunters who stay here tell good stories, Skindle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has a druid really turned into a bear in your inn, Skindle?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "In this tavern? Everything, and none of it true. Do you want the Bloodsail rumor or the haunted island? They're the same price." } },
      choices = {
        { text = "The Bloodsail.", next = "gossip_bloodsail" },
        { text = "The island.", next = "gossip_isle" },
        { text = "I'll pass.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gossip_bloodsail = {
      lines = { { id = "gb_default", text = "Red bandanas drinking in my corner, pretending to be fishermen. Only fishermen don't tip, and these do, which is how I know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    gossip_isle = {
      lines = { { id = "gi_default", text = "Captains won't go near it. One swore he heard his dead mother calling from the beach, but his mother runs a fish stall in Ratchet, and I've met her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    baron = {
      lines = { { id = "bn_default", text = "Quiet, mostly. He stamps when the music's too loud and sends Krazek down when it's too quiet, because too quiet means nobody's buying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_horde = {
      lines = {
        { id = "xh_default", text = "Same rum, same price, same sticky bar as everyone. The Baron's rule is that coin has no colors in his town, and I'd be a fool to argue with the man who owns the roof." },
      },
      choices = {
        { text = "And if someone starts trouble?", next = "x_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_alliance = {
      lines = {
        { id = "xa_default", text = "Beside them, across from them, occasionally under the same table when the rum's good. Nobody draws steel in the Salty Sailor, because the Bruisers drink here too." },
      },
      choices = {
        { text = "And if someone starts trouble?", next = "x_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_trouble = {
      big = true,
      lines = {
        { id = "xt_default", text = "Then the Bruisers throw them off the pier, whichever side they're on, and the sharks don't check tabards. That's the whole of Booty Bay's law, and I've never seen a better one." },
      },
      choices = {
        { text = "A firm hand keeps the peace. Good.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Feeding people to sharks isn't law.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Whiskey Slim, who toasts everyone and threatens their fingers; Crank, who'll sell you a deal; and MacKinley, who'll sell you a debt. Pick your poison, since I sell that too." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Rum loosens tongues, and I pour a great deal of rum. Ask me what you like, and keep your voice down near the stairs." },
    },
    background = { { id = "tp_bg", text = "I've poured drinks in worse places than this. Booty Bay pays better, and the fights are funnier." } },
    advice = { { id = "tp_ad", text = "Sit facing the door. Everyone in here does, which is why the chairs are all on one side." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask whoever's drinking the most; they always have a theory." } },
  },
}

-- More of Booty Bay: the sea giants' victim, the debtor, the first mate, the schemer, the tavern owner, the leathercrafter.
P:NPC {
  key = "smotts", id = TODO_NPC("Captain Hecklebury Smotts"), name = "Captain Hecklebury Smotts",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "vengeful" }, values = { "proud", "stubborn" },
  notices = { "kit" },

  impression = {
    first = "Captain Smotts lost two ships and a fortune to three sea giants, and he tells the story as though it happened to someone he'd like to punch. He has not given up.",
    third = "{name} heard Captain Hecklebury Smotts tell of the three sea giants who sank two of his ships and took everything he owned.",
  },

  greetings = {
    { id = "g_giants", text = "Sea giants, three of 'em! You can ask me about them or not, for I'll tell you anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? If you've found my chest, my cutlass or my sash, out with it; if not, sit down and I'll tell you the whole sorry tale again." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Looks like the sea's had a go at you too. Welcome to the club, though I'll warn you the membership's terrible." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not alone, since Gorlash took my first ship in one swing, but a giant has knees like any other brute, and knees can be broken. Hold your ground in the shallows and the beast will come to you, which is more than my crew ever managed." } },
      choices = {
        { text = "Patience and a steady shield will bring a giant down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd charge it head on and let fury do the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "By the wreckage, mostly, since they leave a trail of broken hulls from the Cape down to the Wild Shore. You'll see them wading the shallows near the old wrecks, and anyone who says they can't be hunted has never lost two ships to them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "By the wreckage, mostly, since they leave a trail of broken hulls from the Cape down to the Wild Shore. You'll see them wading the shallows near the old wrecks, and anyone who says they can't be hunted has never lost two ships to them. Keep {pet} out of the surf when you go, because a giant won't notice a beast underfoot until it's stepped on it." },
      },
      choices = {
        { text = "Revenge isn't hunting, Captain. You should let them go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then we'll hunt them down and take every one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They came up out of the water like hills with arms and pulled my ships apart plank by plank. I lost two good crews and a fortune in cargo, and I've sworn I'll see them dead or die trying." } },
      choices = {
        { text = "Vengeance will eat you alive, Captain. Let it go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then let's sink them. I'll bring the storm.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd trade almost anything, and that frightens me a little when I think about it at night. Sprogger tells me I'm a fool to even consider it, and he's usually right, though I've never told him that." } },
      choices = {
        { text = "Sprogger is right. Some prices are too high.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Vengeance is worth any price. I'll help.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That's what I'm asking you, and you're not answering! If you could tell Gorlash, Negolash and Mok'rash that I want my ships back, I'd pay well, though I'd rather you told them something ruder." } },
      choices = {
        { text = "Giants aren't beasts to bargain with. They must be stopped, plainly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave the giants be, Captain. The sea took your ships fairly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Hecklebury Smotts. I had a ship, a crew and a fortune, and three sea giants took the lot: Gorlash, Negolash and Mok'rash. I bought another ship to hunt them, and they sank that one too." },
        { id = "h_cutlass", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash has my cutlass; he took it right out of my hand. Bring a crew, because he's bigger than he looks, and he looks enormous." },
        { id = "h_sash", when = { questActive = TODO_QUEST("The Monogrammed Sash") },
          text = "Mok'rash has my sash, the monogrammed one my mother stitched for me. Get it back and I'll forgive the ocean, partly." },
        { id = "h_sprogger", when = { metBefore = true },
          text = "Of the whole crew of my second ship, only the cook survived, Sprogger of all people. I've never once complained about his stew since, not out loud." },
        { id = "h_negolash_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Facing Negolash"), days = 3 } },
          text = "Negolash is gone, and I keep waiting to feel lighter. I feel exactly as heavy, just with a cutlass." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you call up a storm and sink those three sea giants for me? I'd pay well, and I'd pay double if you made it painful." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I'll admit I've thought about hiring one of your demons to deal with those giants, but I'm told they want more than gold." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Good, because I'm done hiring sailors; what I need is someone who'll stand toe to toe with a sea giant and not lose their nerve." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I've been hunting three sea giants for years, so we're in the same trade, you and I, only my quarry keeps sinking my boats." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You speak to beasts, they tell me, so tell me this: can you speak to a sea giant? I've a few things I'd like to say to three of them." },
      },
      again = {
        { id = "h_again", text = "Aye, something else? Ask away, for I've nowhere to be, nowhere at all." },
        { id = "h_again2", text = "Go on and ask, and then I'll tell you about the giants again." },
      },
      choices = {
        { text = "Why not give up?", next = "giveup" },
        { text = "What happened, that first time?", next = "first" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "Will you ever sail again?", next = "sail" },
        { text = "I lost people too. Everyone I grew up with.", next = "lost",
          when = { origin = { "human_lordaeron_refugee", "gnome_gnomeregan_refugee", "nightelf_hyjal_survivor" } } },
        { text = "Negolash is dead. How does it feel?", next = "after", when = { questDone = TODO_QUEST("Facing Negolash") } },
        { text = "Shall I say words for your crew, Captain?", next = "priest_words", when = { class = "PRIEST" } },
        { text = "Could a warrior really stand against a sea giant, Captain?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How would you track a sea giant, Captain?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll get your things back.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "The sea spirits took your crews, Captain. Not luck.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "How did the sea giants sink your ships, Captain?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really trade a demon for vengeance, Captain?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Can a druid really speak to sea giants, Captain?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll leave you to it, Captain.", next = "END" },
      },
    },
    giveup = {
      big = true,
      lines = {
        { id = "gu_default", text = "Give up? Two crews are at the bottom of that bay, and if I give up, they drowned for nothing. I'm a stubborn man, and it's all I've got left." },
      },
      choices = {
        { text = "Then I'll help.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "They'd want you to live, not to hunt.", next = "giveup_live", fx = { align = { light = 2 }, trait = { kind = 1 } } },
        { text = "Revenge won't bring them up.", next = "giveup_live", fx = { trait = { stern = 1 } } },
      },
    },
    giveup_live = {
      lines = { { id = "gl_default", text = "You didn't know them. Half of them would've hunted those giants with a rowboat and a spoon, so believe me when I say I'm the sensible one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    first = {
      lines = {
        { id = "f_default", text = "Calm sea, full hold, good wind, and then the water stood up. That's the only way I can say it: the water stood up, and it had a face." },
      },
      choices = {
        { text = "How did you get away?", next = "first_away" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_away = {
      lines = { { id = "fa_default", text = "I clung to a hatch cover for a day and a night until a Blackwater sloop fished me out. I paid them back, mind; I pay everyone back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    crew = {
      lines = {
        { id = "c_default", text = "Good sailors, loud singers, and terrible at cards. I can name every one of them, and I do, most nights, out loud, though the innkeeper's asked me to stop." },
      },
      choices = {
        { text = "Name one for me.", next = "crew_name", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_name = {
      lines = { { id = "cn_default", text = "My bosun, who laughed at storms and cried at weddings. That's all you're getting; the rest of them are mine." } },
      choices = { { text = "Thank you, Captain.", next = "BACK", fx = { affinity = 2 } } },
    },
    sail = {
      lines = {
        { id = "s_default", text = "When the giants are gone. I've no ship and no crew, so it's a promise that costs me nothing. But I make it every morning anyway." },
        { id = "s_done", when = { questDone = TODO_QUEST("Facing Negolash") },
          text = "One giant down, maybe, if I can find a crew mad enough to sail with me. Sprogger says he'll cook, and he says it like it's a threat." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      big = true,
      lines = {
        { id = "lo_default", text = "Then you know nobody tells you what to do with your hands afterwards. I bought a ship; what did you do with yours?" },
      },
      choices = {
        { text = "Picked up a sword.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Kept walking. Still am.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'd rather not say.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Like holding my own cutlass for the first time in a year, and heavier than I remembered. There are two more of them out there, mind." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest_words = {
      lines = { { id = "pw_default", text = "Sprogger asked me that once, and I said no, because I wasn't ready. Say them now, but not too long, and I'll stand at the back where nobody can see my face." } },
      choices = {
        { text = "I'll keep it short.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "Words won't help them now, Smotts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Spirits, is it? Then the spirits had a giant's face and a giant's fists, and they laughed while they did it. Don't tell me the sea took them, shaman; Negolash took them, and I mean to have my cutlass back from him." },
      },
      choices = {
        { text = "Then I'll help you face him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Some things the sea gives back, Captain. Some it doesn't.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've sailed every inch of this coast hunting those giants, and I've learned a thing or two along the way. Ask, and I'll tell you." },
    },
    background = { { id = "tp_bg", text = "I've been captain of two ships and two crews, and both are at the bottom of that bay. That's my story, and I tell it every night.", next = "giveup" } },
    advice = { { id = "tp_ad", text = "Never sail where the water stands up. You'll know it when you see it, and you'll wish you hadn't." } },
    _none = { { id = "tp_none", text = "Is it a sea giant? No? Then it isn't my problem." } },
  },
}

P:NPC {
  key = "shaky", id = TODO_NPC("\"Shaky\" Phillipe"), name = "\"Shaky\" Phillipe",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "nervous" }, values = { "cautious" },
  notices = { "kit" },

  impression = {
    first = "Shaky Phillipe jumped when I came near and asked, a little too casually, whether a large man with a gambling habit had been looking for him. Somebody clearly has.",
    third = "{name} met Shaky Phillipe, a nervous Booty Bay sailor who seems very worried about a certain large gambler.",
  },

  greetings = {
    { id = "g_jump", text = "Ah! Oh, it's only you; I thought you were... well, nobody, nobody in particular, so hello there." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Is that blood, and is it yours? No, don't tell me, and please don't come any closer either." },
  },

  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No! I mean, yes, but only if they're small tracks, and only if they're leaving. A hunter can read who's been where, can't they, so you'd know if a large man from the Sea Wolf's table had been waiting about, and I'd sleep a great deal better for knowing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "No! I mean, yes, but only if they're small tracks, and only if they're leaving. A hunter can read who's been where, can't they, so you'd know if a large man from the Sea Wolf's table had been waiting about, and I'd sleep a great deal better for knowing. And could {pet} sit by my door tonight, perhaps, just for a little while, since nobody knocks on a door with a beast in front of it?" },
      },
      choices = {
        { text = "Pay your debts, Shaky, and you won't need a guard.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I could hide you where nobody tracks, for the right price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Could it? Could it really? I've thought of a ward on the door, or a glyph, or something to make my room look like a wall. Only MacKinley knows a fellow who knows a fellow, and they'd just send somebody who can see through walls." } },
      choices = {
        { text = "I'll set you a ward, and MacKinley can whistle for it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should just pay what you owe, Phillipe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would you? No, don't, because if it says yes I'd only have to run, and I've nowhere left to run to. If the wind ever whispers the name Phillipe, though, you'll tell me first, won't you?" } },
      choices = {
        { text = "Pay what you owe, Phillipe, and the spirits will leave you be.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Run, then. A debt you outrun is a debt you never pay.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Nobody you'd know, and nobody I'd like to introduce you to, so let's leave it at that. I owe him a little money, and a little more than that, and he's not the sort to forget a debt." } },
      choices = {
        { text = "Then pay him back. Running only makes it worse.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hide well. Debts are only real if he finds you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Shaky.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because I owe money to the kind of people who don't care how they get paid, and I've heard stories about debt collectors in Booty Bay that would turn your hair white. I'm sure you're not one of them, but I'll stand over here just in case." } },
      choices = {
        { text = "Relax. I'm not here to collect anyone's debts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe I am. Best pay up, Shaky.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nothing, nothing at all, only I might have borrowed a little from the Sea Wolf, and then a little more to win back the first little, and then the dice turned on me as dice do. Now I sleep with a chair against the door and I don't go near the docks after dark." } },
      choices = {
        { text = "Face MacKinley and tell him the truth. It's your best chance.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Lie low and take the next ship out. Debts can't swim.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nobody's looking for me, ha, ha, why would anybody be looking for me? Only a druid can turn into a cat and slip off into the jungle, and I was thinking, idly, that it must be a very comfortable way to avoid people you owe." } },
      choices = {
        { text = "Running won't settle it. Face him and pay what you owe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then slip off quietly. Not every debt is worth facing.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, oh good, good, you'll be the honest sort, so you'll tell me straight whether a large man with a ledger has been asking after me, won't you, because I'd hate to find out from his friends." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman? Oh, good, good. You couldn't ask the spirits whether a big man is coming up the pier, could you? No? Never mind, ha, ha." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest? Oh, could you say a few words over me, just in case? Nothing's going to happen, of course, ha, ha." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh! You came up very quietly. Please don't do that, because MacKinley's men walk quietly too, and my heart can't take it." },
        { id = "h_default", key = true,
          text = "They call me Shaky, and I can't think why, ha, ha. Listen, has a big man with a gambling habit been asking about me? You'd tell me if he had, wouldn't you?" },
        { id = "h_mackinley", when = { heardLine = "mackinley.h_default" },
          text = "You've talked to MacKinley, I can tell, because you've got that look, the look of someone who knows what I owe. I'll pay! Tell him I'll pay soon, very soon!" },
        { id = "h_scared", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "I paid, every last coin, and I'm never playing knucklebones again. I'm never looking at meat again, either." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage? Could you make me invisible, just for a few days? There's a large man with a gambling habit looking for me, and I'd really rather he didn't find me." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Oh no, did he send you? Please tell me he didn't hire a demon to collect, because I really can't afford that." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You don't happen to have seen big footprints near my door, have you, the heavy kind, belonging to somebody very large who likes to gamble?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, ha! Could you, ah, turn into something fast if a big man came along? Not for me, of course, I'm just curious." },
      },
      again = {
        { id = "h_again", text = "What else? Is there someone standing behind me? Don't look, just tell me, quietly." },
        { id = "h_again2", text = "Still here? That's nice, or is it nice? I honestly can't tell any more." },
      },
      choices = {
        { text = "Shall I ask the earth whether trouble is coming for you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic keep MacKinley's men away from you?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "How much do you owe him?", next = "debt" },
        { text = "How did you get into this?", next = "how" },
        { text = "Why not just leave Booty Bay?", next = "leave" },
        { text = "MacKinley asked me to check on you.", next = "panic", when = { heardLine = "mackinley.h_default" } },
        { text = "Want me to teach you to hide properly?", next = "hide", when = { class = "ROGUE" } },
        { text = "You seem afraid for your life, Shaky. What happened?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shall I tell you whose tracks are outside your door, Shaky?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Your secret's safe. For now.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Pay MacKinley what you owe, and you'll stop shaking.", next = "END", fx = { align = { honor = 1 } } },
        { text = "Want me to lean on MacKinley for you?", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Who's looking for you, Shaky?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why would anyone send a demon after you, Shaky?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Who's looking for you, Shaky, and why should a druid care?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Calm down. Nobody's after you.", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    debt = {
      lines = {
        { id = "d_default", text = "A number, a big number, a number that grows while I'm asleep. So I've stopped sleeping, which should slow it down, shouldn't it?" },
        { id = "d_paid", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "Nothing! Nothing at all, now, though I still check every morning, just to be sure." },
      },
      choices = {
        { text = "I could talk to MacKinley for you.", next = "debt_talk", fx = { trait = { generous = 1 } } },
        { text = "Tell me the truth, Phillipe, or MacKinley hears where you hide.", tag = "Intimidate", next = "confess", when = { ["not"] = { questDone = TODO_QUEST("Scaring Shaky") } },
          check = { pass = { any = { { power = { "above", "far_above" } }, { class = { "WARRIOR", "ROGUE" } }, { trait = "stern" } } } },
          fail = { next = "confess_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_talk = {
      lines = { { id = "dt_default", text = "No! He'll know I sent you, because he knows everything, so please don't... unless you think it'd work? No, it wouldn't, don't." } },
      choices = {
        { text = "All right. I won't.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be subtle.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "It was one game, one friendly game, and I won the first hand. That's how they get you; they let you win the first hand." } },
      choices = {
        { text = "Who taught you that?", next = "how_who" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    how_who = {
      lines = { { id = "hw_default", text = "MacKinley did, after I'd lost! He explained it very kindly, and that was the worst part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "Where? Out there? With the trolls and the tigers and the things that eat trolls and tigers? At least MacKinley only wants money." } },
      choices = {
        { text = "Fair point.", next = "BACK" },
        { text = "Ratchet's nice this time of year.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    panic = {
      lines = {
        { id = "pa_default", text = "He asked about me? What did he say, and what was his face doing, was it the smiling face? Don't tell me if it was the smiling face." },
      },
      choices = {
        { text = "It was the smiling face.", next = "BACK", fx = { align = { light = -1 }, trait = { cruel = 1 } } },
        { text = "I'm joking. He didn't say a thing.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Pay him, Phillipe. It'll stop.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    hide = {
      lines = {
        { id = "hi_default", text = "Hide? I've been hiding for weeks, behind barrels and in barrels, and he always finds me. There's a trick to it, isn't there?" },
      },
      choices = {
        { text = "Stop shaking. That's the whole trick.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1, trait = { witty = 1 } } },
        { text = "Pay your debts. Then there's nothing to hide from.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    confess = {
      lines = {
        { id = "cf_default", text = "All right, all right, don't tell him! The truth is, it isn't the debt that scares me most; it's that if MacKinley dealt me a hand tomorrow I'd sit down and play it, and I know I would, and so does he." },
        { id = "cf_rogue", when = { class = "ROGUE" },
          text = "Don't, please, I know your sort, you'd really do it! The truth is I'd play him again tomorrow if he dealt me in, and he knows it, and that's why he's never in any hurry to collect." },
      },
      choices = {
        { text = "Then stay away from the tables.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confess_no = {
      lines = {
        { id = "cn_default", text = "You wouldn't dare, would you, not really? No, you're bluffing, because I've watched MacKinley bluff and you're not nearly frightening enough." },
        { id = "cn_gnome", when = { race = "Gnome" },
          text = "You're going to tell on me? You're barely taller than the barrel I hide in, and I'm frightened of a great many things, but not that." },
      },
      choices = {
        { text = "Fine, Phillipe.", next = "BACK" },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Lean on him? Oh, no, no, no, please don't, because MacKinley's got friends who lean back, and they lean on me, and they lean harder. I'm sorry, I'm grateful, I'm terrified, all at once." },
      },
      choices = {
        { text = "Then I'll stand by you if they come.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then pay him, Shaky.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't know anything, honestly! Well, maybe a few things, if you promise nobody's listening." },
    },
    background = { { id = "tp_bg", text = "Nobody! I'm nobody at all, so please ask someone more interesting, please?" } },
    advice = { { id = "tp_ad", text = "Never play knucklebones with a man called Wolf. Any kind of wolf." } },
    _none = { { id = "tp_none", text = "I don't know anything about anything, I swear! Is this about money?" } },
  },
}

P:NPC {
  key = "crazz", id = TODO_NPC("First Mate Crazz"), name = "First Mate Crazz",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "eager" }, values = { "loyal", "fierce" },
  notices = { "race" },

  impression = {
    first = "First Mate Crazz hates the Bloodsail Buccaneers with a steady, practical sort of hatred. Anyone with news of a red bandana will have a friend in him, for an afternoon.",
    third = "{name} met First Mate Crazz of the Blackwater Raiders, who wants to know what the Bloodsail Buccaneers are planning and then to sink it.",
  },

  greetings = {
    { id = "g_bloodsail", text = "If you've seen a red bandana on the coast, tell me where. I've been wanting a reason all week." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin, good! You know the sea's just money with waves on it. The Bloodsail want our money, and they can have the waves." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "On their decks if we can, on the beach if we must, and never in open water, where their cannons outnumber ours. They're brave when they've the numbers and cowards when they haven't, so a warrior who holds firm through the first rush breaks them nine times in ten." } },
      choices = {
        { text = "I'll meet them face to face on their own decks.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Burn their camps at night. Pirates deserve no fair fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Bloodsail scouts who land at night down the coast and creep up toward town, then vanish before morning. Find where they come ashore and I'll know where they're anchored, and then the Raiders can pay them a visit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Bloodsail scouts who land at night down the coast and creep up toward town, then vanish before morning. Find where they come ashore and I'll know where they're anchored, and then the Raiders can pay them a visit. Your {pet} would sniff them out quicker than any of us, since a pirate who hasn't washed in a month leaves a trail a blind dog could follow." },
      },
      choices = {
        { text = "I'll track them, but I won't lead you to murder them asleep.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Show me where they land. I'll take them myself, quietly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Their ships run on secrecy, so find their coves, read their orders and burn their powder before it's ever loaded. Fleet Master Seahorn won't put it in writing, but a spell in the right hold is worth twenty cannons." } },
      choices = {
        { text = "Burn their powder and sink their ships. Gladly.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Sinking ships drowns honest sailors too, Crazz.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Sailors pray to whatever's listening, and on Blackwater ships that's usually the rum. Still, I once saw a troll shaman calm a squall off the Cape, and nobody laughed at her after that." } },
      choices = {
        { text = "The sea deserves respect, and your crews should show it some.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The sea's a road. Sail it hard and ask it for nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Sea witches, more like, who whisper to the tides and curse anyone who crosses their captain. I've seen one of them call a squall that nearly took our mast, and I've wanted to see her drown ever since." } },
      choices = {
        { text = "Then I'll hunt her down and end her.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll stop her, but I won't drown anyone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Crazz.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Enough that I've a list of every one of them who's ever boarded a ship of ours, and I cross off a name every time one hangs. It's a long list, and it's not getting shorter fast enough for my liking." } },
      choices = {
        { text = "Hate's a poor compass, Crazz. It'll sink you too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then let's shorten that list together.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I hate them the way you hate a leak in the hull, steady and without much fuss, because hating them louder won't plug it. They've sunk friends of mine and robbed every honest trader on this coast, and one day I mean to watch their flagship go down." } },
      choices = {
        { text = "Hatred eats a sailor hollow. Fight them, but let the hate go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hold onto it. Hate keeps a sailor sharp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Openly when we can, because a Bloodsail ship at the bottom of the bay can't plot anything. Still, they've spies in every tavern on this coast, so I'm not above a bit of sneaking myself when it gets us the news we need." } },
      choices = {
        { text = "Fight them in the open. Let them see who's coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Turn their spies against them. Sneaking wins wars.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Shark teeth sell well to the trolls, and the Bloodsail would sell their own mothers to the trolls if they could find them. They leave the bodies to rot on the reef, and the fishing's gone bad from it, which is the part I mind." } },
      choices = {
        { text = "Then sink them, Crazz. Waste like that deserves no mercy.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pirates and sharks both take what they can. Let the sea sort it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? Good, because the Bloodsail leave a lot of dead along this coast, and our lads would sooner have a proper word said over the drowned than leave them to the sharks." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The Bloodsail fear two things, cannon and the righteous, and you look to have brought the second, so you're welcome on our docks as far as I'm concerned." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you can call up a stiff wind, the Blackwater could use you to run down a Bloodsail sloop or two." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Say a few words over the Blackwater dead, would you, and a few curses over the Bloodsail while you're at it." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You've got sneaking feet. Good, because I've got Bloodsail letters that need stealing." },
        { id = "h_default", key = true,
          text = "First Mate Crazz, Blackwater Raiders. The Bloodsail Buccaneers are scum, and they're up to something on our coast, so I want to know what, and then I want to sink it." },
        { id = "h_buccaneers", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Their camp's on the Wild Shore, and I want their letters, their orders, their whole plan. Bring me paper, and I'll bring the Fleet Master a war." },
        { id = "h_watch", when = { metBefore = true },
          text = "Spotted a red sail on the horizon last night, and it was gone by morning. They're watching us, which suits me fine; let them watch us coming." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Good, because the Bloodsail have a few spellcasters of their own, and I'd love to see one of them on the wrong end of a fireball for once." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, I hate the Bloodsail more than I hate anything, so if your demon fancies a few red bandanas, I'll point the way." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Good, because the Bloodsail don't parley, and I'd rather have a shield beside me than another fool asking about terms." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Can you follow a man across sand after the tide's been at it? Because that's what I need, and none of my lads can manage it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The Bloodsail have been gutting sharks off the coast for their teeth, and I'd wager that bothers you more than it bothers me." },
      },
      again = {
        { id = "h_again", text = "What else? Make it about the Bloodsail, if you can." },
        { id = "h_again2", text = "Yeah? Talk fast, then; I've a coast to watch." },
      },
      choices = {
        { text = "Do your sailors pray to anything before they put to sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How could magic help the Blackwater against the Bloodsail?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why do you hate them so much?", next = "hate" },
        { text = "How do you know they're planning something?", next = "proof" },
        { text = "What's the Fleet Master like?", next = "seahorn" },
        { text = "Stormwind's navy could help against them.", next = "navy", when = { faction = "Alliance" } },
        { text = "The Horde has no love for the Bloodsail either.", next = "horde", when = { faction = "Horde" } },
        { text = "A goblin pirate who hates pirates?", next = "goblin", when = { race = "Goblin" } },
        { text = "Do you hate the Bloodsail for what they've done?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Bloodsail be fought openly, or undermined?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you fight the Bloodsail, First Mate?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who are you trying to track across the sand, First Mate?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll find their plan.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "I could slip aboard a Bloodsail ship for you.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Do the Bloodsail really have mages, Crazz?", next = "xmage", when = { class = "MAGE" } },
        { text = "How much do you hate the Bloodsail, Crazz?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why are the Bloodsail gutting sharks off your coast, Crazz?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Later, Crazz.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "ha_default", text = "Because they make the rest of us look bad. We're pirates with rules, and they're pirates with knives and no rules, so when folk say 'pirate', they think of them, and then they think of me." },
      },
      choices = {
        { text = "Pirates with rules. I can respect that.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Rules are for merchants, and I'd rather sail free.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A pirate's a pirate.", next = "hate_pirate", fx = { affinity = -1 } },
      },
    },
    hate_pirate = {
      lines = { { id = "hp_default", text = "Say that on the docks and see how many friends you have by supper. Go on, I'll watch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    proof = {
      lines = {
        { id = "pr_default", text = "They've stopped raiding small. Small raids are hunger, but stopping is planning, so somebody's saving them up for something big." },
      },
      choices = {
        { text = "That's a guess.", next = "proof_guess", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    proof_guess = {
      lines = { { id = "pg_default", text = "It's a guess that's kept me alive four years. Bring me their letters and it won't be a guess any more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seahorn = {
      lines = {
        { id = "sh_default", text = "Best captain on the South Seas! He laughs at cannon fire and pays on time, and if he tells the same storm story every night, I'll punch anyone who yawns." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    navy = {
      lines = {
        { id = "nv_default", text = "Stormwind's navy has lovely ships and very slow letters. By the time they decided to help, we'd have sunk the Bloodsail ourselves, twice over." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
        { text = "Don't underestimate Stormwind.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Booty Bay's better off without Stormwind's navy.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    horde = {
      lines = {
        { id = "hz_default", text = "Good. Your people sail in, buy, drink and go, while the Bloodsail sail in and burn, so I know which customers I'd rather keep." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    goblin = {
      lines = {
        { id = "gb_default", text = "Pirate's a job; Bloodsail's a disease. You'd not call a doctor a plague just because they both turn up at funerals." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Would you? Oh, that'd be grand, that'd be the best thing since the cannon! Bring back anything with writing on it, because those Bloodsail scum write everything down, and the Fleet Master'll want to read every word." },
      },
      choices = {
        { text = "Anything with writing. Got it.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "How do you know they're planning something?", next = "proof" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Blackwater born, Blackwater sworn. I've been on the Fleet Master's deck since I was tall enough to see over the rail, just barely." } },
    advice = { { id = "tp_ad", text = "Red bandana, red sail, red flag: shoot first. You'll have time to apologise later, though you won't need to." } },
    bloodsail = { { id = "tp_bloodsail", text = "Scum with sails, every one of them. I'd sink their whole fleet for one good night's sleep." } },
    _none = { { id = "tp_none", text = "If it's not about the Bloodsail, I'm not listening." } },
  },
}

P:NPC {
  key = "fizzlebub", id = TODO_NPC("Crank Fizzlebub"), name = "Crank Fizzlebub",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "shifty" }, values = { "greedy", "clever" },
  notices = { "purse" },

  impression = {
    first = "Crank Fizzlebub called me over from across the dock with a promise of easy money. Nothing he offers will be easy, and I'm fairly sure that's the point.",
    third = "{name} was hailed by Crank Fizzlebub, a Booty Bay goblin with schemes for anyone who has a strong arm and a short memory.",
  },

  greetings = {
    { id = "g_profit", text = "Psst, you there, yes, you! Want to make some money? Course you do, everybody does, so lean in." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you're doing well, I can always tell; it's a gift. Let's talk about doing better." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, crates that need carrying through ogre country, a debt that needs a little persuading, and a raptor nest somebody promised a buyer in Gadgetzan. Strength is an investment, pal, and I'm a goblin who loves an investment." } },
      choices = {
        { text = "I'll take honest work, Crank, not your shady deals.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I don't care what's in the crates. Name the price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rich goblins in Gadgetzan and Undermine who want a panther in a cage beside the fountain, mostly, and a raptor egg fetches a fortune if it hatches on the ship and not before. The trick is keeping the stock alive, and frankly that's where I always lose money." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Rich goblins in Gadgetzan and Undermine who want a panther in a cage beside the fountain, mostly, and a raptor egg fetches a fortune if it hatches on the ship and not before. The trick is keeping the stock alive, and frankly that's where I always lose money. Now don't look at me like that, pal, because I'd never try to buy {pet}, at least not while you're standing right there." },
      },
      choices = {
        { text = "A beast deserves a clean hunt, not a cage in Undermine.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they pay that well, I'll fill a few cages.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Selling them, I'd guess, or using them for something that hums, but nobody's ever told me, and that's what hurts. If you hear a proper answer, I'll pay for it, and if it's worth anything, I'll pay you less and sell it on." } },
      choices = {
        { text = "I'll sell you the answer, if I find one.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some things shouldn't be sold, Fizzlebub.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I once sold rainwater blessed by a troll witch doctor, but it turned out to be ordinary rainwater, and the buyer turned out to be a Bruiser. Now I sell things that don't talk back, like ore and gossip." } },
      choices = {
        { text = "The elements aren't merchandise. Leave them out of your schemes.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bottle me a storm, Fizzlebub, and we'll split the profit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shards and crystals from the jungle, mostly, the kind that come out of places the trolls would rather we left alone. The Baron takes his cut on everything that crosses the docks, so I've found ways to keep some of it from crossing them at all." } },
      choices = {
        { text = "Cheating the Baron is a fool's game. I'll stay honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Baron has enough gold. I'll take the deal.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Crank.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I haven't the faintest idea, and that's what makes them valuable, because anything nobody understands can be sold for twice what it's worth. Bring your imp a little closer and let's see if the tune changes." } },
      choices = {
        { text = "I'll test them, but carefully. Some things shouldn't be woken.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's find out. Curiosity is worth the risk.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hauling, guarding, scaring off the competition, the usual, and a druid does all three without needing a wage for a horse. I've got a few jobs out in the jungle where a big angry animal would save a lot of arguments, and nobody would ask whose animal it was." } },
      choices = {
        { text = "My gifts aren't for hire, Fizzlebub. Find yourself a real bear.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the coin's honest, a bear can carry a crate.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do you know what a goblin would pay for a bottled thunderstorm? Neither do I, but I'd love to find out." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I sell a lovely holy water, or a lovely unholy water, depending on which way you lean; same bottle, different label." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, now that's handy. You couldn't tell me whether these crystals are magic, could you, before I sell them as magic?" },
        { id = "h_default", key = true,
          text = "Crank Fizzlebub: entrepreneur, opportunist, and friend to anyone with a strong arm and a short memory. Standing still never made anyone a copper." },
        { id = "h_shards", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Singing Blue Shards") }, { questActive = TODO_QUEST("Venture Company Mining") } } },
          text = "The Venture Company's digging up crystals that sing, singing crystals! Do you know what people pay for things that sing? Bring me some, and don't ask the Venture Company first." },
        { id = "h_zanzil", when = { any = { { questActive = TODO_QUEST("Zanzil's Secret") }, { questActive = TODO_QUEST("Fool's Stout") }, { questActive = TODO_QUEST("Zanzil's Mixture and a Fool's Stout") } } },
          text = "Zanzil's mixture, a fool's stout, and a friend at a racetrack who'd like a few rivals to slow down. Don't ask me which friend; you'll meet him." },
        { id = "h_kravel", when = { heardLine = "kravel.h_default" },
          text = "You know Kravel, at the Raceway? Lovely fellow, very competitive, and we have an arrangement. You didn't hear that from me." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now you look like someone who appreciates a good bargain, and I've got some that aren't exactly on the Baron's books." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, I've got a few crystals that hum a strange tune when you hold them near a demon, and I'd love to know what that means." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Now here's a strong arm with a short memory, I hope! Warriors are my favorite customers, pal, because they never ask how dangerous a job is until they're halfway through it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and I've just the opportunity for you, pal: live exotic animals, top prices from the collectors in Gadgetzan, very few questions asked." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now there's a business opportunity, friend: a bear who doesn't need feeding and can carry a crate. Think about it." },
      },
      again = {
        { id = "h_again", text = "Still here? That's a good sign; it means you smell opportunity too." },
        { id = "h_again2", text = "Psst, you want more? Lean in closer, a bit closer, no, that's too close." },
      },
      choices = {
        { text = "Have you ever tried to sell the elements, Fizzlebub?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's the Venture Company really doing with those singing crystals?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is any of this legal?", next = "legal" },
        { text = "What do singing crystals actually do?", next = "crystals" },
        { text = "What's your arrangement with Kravel?", next = "kravel", when = { any = { { heardLine = "kravel.h_default" }, { topicKnown = "mirage_raceway" } } } },
        { text = "I'm a gnome. I know a scheme when I see one.", next = "gnome", when = { race = "Gnome" } },
        { text = "What sort of work do you have for a warrior, Crank?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who buys live animals out of Stranglethorn, Crank?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'm listening, so tell me the job.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't work for swindlers, Crank.", next = "END", fx = { align = { honor = 1 } } },
        { text = "Those singing crystals are just quartz. I'm a mage.", next = "k_mage", when = { class = "MAGE" } },
        { text = "What deals aren't on the Baron's books, Crank?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would your crystals hum near a demon, Crank?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What business could a druid possibly have with you, Fizzlebub?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Not today, Crank.", next = "END" },
      },
    },
    legal = {
      lines = {
        { id = "l_default", text = "Legal? This is Booty Bay! The Baron takes his cut, the Bruisers keep the peace, and everything else is negotiation, which you're doing right now, and badly." },
      },
      choices = {
        { text = "Fine, then, tell me the job.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Then I'll have no part of it, Crank.", next = "END", fx = { align = { honor = 1 } } },
        { text = "Then I'll negotiate better. What's my cut?", next = "legal_cut", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legal_cut = {
      lines = { { id = "lc_default", text = "Your cut is not getting caught. It's a very generous cut, and most people don't get it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crystals = {
      lines = {
        { id = "c_default", text = "They hum, they glow, and they make rich people feel special. Do they do anything else? Probably, but I don't care; the Venture Company cares, which is why they'll pay to get them back." },
      },
      choices = {
        { text = "You'd sell them back to the people you stole them from?", next = "crystals_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    crystals_back = {
      lines = { { id = "cb_default", text = "Stole? I'd say liberated. And yes, twice if I can manage it, which is what's called a supply chain." } },
      choices = {
        { text = "That's brilliant.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "That's theft with extra steps.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
      },
    },
    kravel = {
      big = true,
      lines = {
        { id = "k_default", text = "Arrangement is such a dull word. Let's say Kravel would like certain racers to be a little slower, and I know a troll recipe that does exactly that, so everybody wins, except the slow ones." },
      },
      choices = {
        { text = "You're rigging the races.", next = "kravel_rig", fx = { learn = { "mirage_raceway" } } },
        { text = "Count me in.", next = "BACK", fx = { align = { honor = -2 }, affinity = 2 } },
        { text = "I won't help you poison racers, Crank.", next = "BACK", fx = { align = { honor = 2 } } },
      },
    },
    kravel_rig = {
      lines = { { id = "kr_default", text = "Rigging, adjusting, encouraging. If you tell Pozzik or that gnome, I'll deny it, and Kravel will cry. He's very convincing when he cries." } },
      choices = {
        { text = "Maybe I'll tell them.", next = "BACK", fx = { align = { honor = 2 }, affinity = -2 } },
        { text = "Your secret's safe.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Pozzik already knows, Crank. He told me himself.", tag = "Deceive", next = "kravel_spill",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { race = "Gnome" } } } },
          fail = { next = "kravel_calm", fx = { affinity = -1 } } },
      },
    },
    gnome = {
      lines = {
        { id = "g_default", text = "Then you'll appreciate a well-built one! Look at it: no moving parts, no witnesses, high yield. If it had gears you'd be weeping." },
      },
      choices = { { text = "It's a bit crude.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    kravel_spill = {
      lines = {
        { id = "ks_default", text = "He knows? Then it's Kravel's fault, all of it! It's Zanzil's troll mixture stirred into a cask of Fool's Stout for the racers, and Kravel swore nobody would taste it under the stout, and if Pozzik's coming I'm leaving on the next boat." },
        { id = "ks_gnome", when = { race = "Gnome" },
          text = "That gnome told you? Of course he did, you people stick together! Fine: it's Zanzil's troll mixture in a cask of Fool's Stout for the racers, it was Kravel's idea, and I'm leaving on the next boat." },
      },
      choices = {
        { text = "Relax, Crank, I made that up.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kravel_calm = {
      lines = {
        { id = "kc_default", text = "Pozzik doesn't talk to anybody who isn't holding a wrench, friend, and you're not holding a wrench. Nice try; I'd have tried it too." },
        { id = "kc_paladin", when = { class = "PALADIN" },
          text = "A paladin, lying to me? Now I've seen everything, and I still don't believe a word of it." },
      },
      choices = {
        { text = "Worth a try.", next = "BACK" },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Shh! Quartz, yes, technically, but quartz with a very pleasing hum, and the customers don't own a mage. Besides, if you were really sure, you wouldn't have come over to look so closely, would you?" },
      },
      choices = {
        { text = "Fine. I'll keep your secret.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll tell your customers the truth.", next = "BACK", fx = { align = { honor = 1 }, affinity = -2 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Lean in and ask, friend; I know a little about a lot, and most of it's worth something to somebody." },
    },
    background = { { id = "tp_bg", text = "I'd tell you, but then you'd know where the bodies are buried, figuratively speaking. Mostly figuratively." } },
    advice = { { id = "tp_ad", text = "Buy from people who are in a hurry and sell to people who are scared, never the other way round." } },
    venture_company = { { id = "tp_venture", text = "Rivals, and rich, careless rivals at that, which are my favourite kind." } },
    _none = { { id = "tp_none", text = "If there's no money in it, why are we talking about it?" } },
  },
}

P:NPC {
  key = "whiskeyslim", id = TODO_NPC("Whiskey Slim"), name = "Whiskey Slim",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "jovial" }, values = { "generous", "touchy" },
  notices = { "drink" },

  impression = {
    first = "Whiskey Slim raised a toast to me before he knew my name, and two more after. Somewhere under the drink is a real grief over a lost cask of port.",
    third = "{name} was toasted by Whiskey Slim, a cheerful drinker in Booty Bay who still mourns a lost cask of the finest port.",
  },

  greetings = {
    { id = "g_toast", text = "A toast! To you, stranger, and to whatever brought you here, unless it was trouble, in which case, to you anyway!" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've been enjoying yourself, and good for you. Just don't spill, and I mean it: don't spill." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night, and they all toast their old regiments, Stromgarde and Lordaeron and Stormwind, and then they weep for the ones who didn't come home. I've learned more about the Second War at this bar than any scholar ever wrote down, and I've forgotten most of it by morning." } },
      choices = {
        { text = "A soldier keeps faith with his regiment, drunk or sober.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The regiments are gone. A soldier's free to forget.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Ha! If anyone could, it'd be one of your sort, because I'd know the smell of that port anywhere, and I'd swear it left a trail of happy scoundrels behind it. It was the finest in the South Seas, and somewhere out there somebody is drinking it without me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Ha! If anyone could, it'd be one of your sort, because I'd know the smell of that port anywhere, and I'd swear it left a trail of happy scoundrels behind it. It was the finest in the South Seas, and somewhere out there somebody is drinking it without me. Even {pet} could follow that scent, friend, and if your beast finds it first, I'll forgive it for having a little sip." },
      },
      choices = {
        { text = "I'll find your port and bring it back to you honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If I find that port, I might just keep it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Could you? Oh, could you! It's somewhere in the Hinterlands, and if you've a spell that finds a cask by smell, I'll toast you every night until my liver gives out, which may not be long." } },
      choices = {
        { text = "I'll find your port and bring it back untouched.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I find it, I'm tasting it first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every sailor in Booty Bay has a story about the sea spirits, and each one gets better with the third drink. My favorite says a water elemental drank half a ship's rum and went home happy, and I'd very much like to meet that fellow." } },
      choices = {
        { text = "Toast them with care. The sea's spirits aren't a joke.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good story's worth more than the truth of it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somewhere in the Hinterlands, where the trolls and the wildkin and who knows what else could be sitting on it right now. I don't care who's got it, so long as it comes home before somebody opens it without me." } },
      choices = {
        { text = "I'll bring it back honestly, cask and seal intact.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Finders keepers, Slim. Whoever has it now owns it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Slim.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what a sailor told me, and I've been chasing a mage who knows the trick ever since. Nobody's managed it yet, but I keep hoping, because the real thing is somewhere in the Hinterlands and water is all I've got." } },
      choices = {
        { text = "Magic can't replace the real thing. I'll find your port.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll make you something better. Forget the old port.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Comfort, now there's a sad word for a merry man, but you're not wrong, I suppose. I used to say a good drink was a prayer you could taste, and since the port went missing I've been praying rather a lot, though none of it's been answered yet." } },
      choices = {
        { text = "The Light offers better comfort than the bottle, Slim.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A man's entitled to his drink. Raise one for me.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Oh, the yellow fruit the gorillas fight over, and the bitter red berry the trolls chew before battle, which I'd only try once. Most of all I'd find the cask of port I lost, but no druid's told me which root grows into that." } },
      choices = {
        { text = "Drink less and grieve less, Slim. The port's gone for good.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good drink is nature's gift. Enjoy it while you can.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, and here's a toast to you, friend! Bless this cup if you'd be so kind, because it's the closest thing to holy I've held since I lost that cask of port." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Pull up a stool and tell me, do the spirits of the earth know where a good cask of port might have rolled off to?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A toast to the priest! To your gods, whoever they are, and may they be the drinking sort!" },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "To the warlock! May your demons stay on their leashes and your glass stay full, and never the other way round." },
        { id = "h_default", key = true,
          text = "Whiskey Slim, at your service! I've tasted every drink between here and Ironforge, and I had a cask of the finest port you'll ever... well, had. I had it, and then I lost it." },
        { id = "h_grog", tags = { "news" }, when = { questActive = TODO_QUEST("Whiskey Slim's Lost Grog") },
          text = "My Pupellyverbos Port, lost in the Hinterlands, of all the miserable places! Find it, and I'll toast your name every night for a year." },
        { id = "h_toast", when = { metBefore = true },
          text = "To friends who come back! And to friends who don't, may they come back soon! And to anyone who touches my glass: may they lose a finger." },
        { id = "h_grog_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Whiskey Slim's Lost Grog"), days = 3 } },
          text = "To {name}, who brought back my port! I've had a glass, and then another, and I'll toast you properly as soon as the room stops leaning." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Here's to you, friend, and here's to anyone who can slip a cask out from under a troll's nose, because that's exactly what my poor port needs." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Here's to you, and here's to magic, which I hear can make a cask of water taste like the finest port, if you know the right words." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! To your health, friend, and to your armor, which I hope is better at keeping out a sword than my cellar was at keeping out thieves." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! I'll drink to the hunt, friend, and to whatever you brought down last, unless it was a boar, because I had a very bad night with a boar once." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and I'll drink to that! You must know every berry and root that ferments, and I'd give my last cask to hear about the good ones." },
      },
      again = {
        { id = "h_again", text = "A toast, to more questions! Ask away, my friend." },
        { id = "h_again2", text = "More? To curiosity! May it never kill anybody I like." },
      },
      choices = {
        { text = "Do the sailors' tavern stories ever mention the spirits of the sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a spellcaster help you find your lost port?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do you lose a whole cask?", next = "lost" },
        { text = "What makes this port so special?", next = "port" },
        { text = "Toast me, then.", next = "toast" },
        { text = "A gnome who drinks like a dwarf?", next = "gnome", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Pour me something big. I'm a tauren.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Where exactly did your port go missing, Slim?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can magic really make water taste like port, Slim?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is drink all you have to comfort you, Slim?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you drink with many old soldiers here, Slim?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could a hunter track down your lost port, Slim?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Which jungle fruits would you ferment, Slim, if you had the choice?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Cheers.", next = "END", fx = { affinity = 1 } },
      },
    },
    lost = {
      lines = {
        { id = "l_default", text = "Bandits, a cart, a hill and a very unfortunate trade involving a troll. The details are hazy, and that's partly the port's fault." },
      },
      choices = {
        { text = "The Hinterlands are dangerous.", next = "lost_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_danger = {
      lines = { { id = "ld_default", text = "Dangerous! It's full of trolls with axes and gryphons with opinions. To the Hinterlands: may they choke on my port." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    port = {
      lines = {
        { id = "p_default", text = "Aged in a barrel that once held something I won't name, rolled down a mountain on purpose, and blessed by a priest who didn't know he was doing it. One taste makes you forgive your enemies, briefly." },
      },
      choices = {
        { text = "That sounds made up.", next = "port_made", fx = { trait = { skeptical = 1 } } },
        { text = "I'd like a glass.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    port_made = {
      lines = { { id = "pm_default", text = "All the best things are! To made-up things! And to you, who'll never get a drop for saying so." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    toast = {
      lines = {
        { id = "t_default", text = "To you! May your boots stay dry, your blade stay sharp, and your enemies trip on something embarrassing. And if you ever cheat me, may your teeth rot. Cheers!" },
        { id = "t_drunk", when = { drunk = { min = 2 } },
          text = "To you, who's already had a few, ha, a kindred spirit! May you find the door on the first try." },
      },
      choices = {
        { text = "To you too, Slim.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why the threat at the end?", next = "toast_threat" },
      },
    },
    toast_threat = {
      lines = { { id = "tt_default", text = "Every toast needs a little salt! It's a gnomish tradition, probably, or at least my grandfather did it, and he had very few friends, but they never cheated him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = {
        { id = "g_default", text = "Like a dwarf! I drink like three dwarves stacked in a coat. Ironforge taught me, and Ironforge regretted it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "Big! Ha, the Fleet Master says that every night, and every night the tankards come back empty and the floor comes back cracked. To the biggest drinkers in Booty Bay, and may the floorboards hold." },
      },
      choices = {
        { text = "To the floorboards!", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge taught me to drink, the road taught me to drink better, and Booty Bay taught me to drink here. To all three!" } },
    advice = { { id = "tp_ad", text = "Never toast with an empty glass, never toast someone who won't toast back, and never touch my glass." } },
    _none = { { id = "tp_none", text = "Don't know and don't care! Fancy a drink instead?" } },
  },
}

P:NPC {
  key = "drizzlik", id = TODO_NPC("Drizzlik"), name = "Drizzlik",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "boastful" }, values = { "proud", "greedy" },
  notices = { "craft" },

  impression = {
    first = "Drizzlik praised his own leatherwork for longer than most people pray. The trouble is that the work deserves most of it.",
    third = "{name} browsed Drizzlik's Emporium in Booty Bay, where the goblin leathercrafter praises his own crocolisk and panther hides at great length.",
  },

  greetings = {
    { id = "g_emporium", text = "Welcome to Drizzlik's Emporium, the finest leather in the South Seas! The finest leather anywhere, if you ask me, and you are asking me." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "A leatherworker! You've good hands, I can tell, not as good as mine but close, give or take." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Is it any use! A good padded jerkin stops the rings biting and the rust spreading, and in this heat it's the difference between fighting all day and fainting by noon. I've dressed Blackwater bosuns who swore by it, and the ones who didn't swore at the heat instead." } },
      choices = {
        { text = "Good armor is discipline. I look after mine properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fight in whatever I've got and fix it when it breaks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Raptor for toughness, panther for suppleness, and crocolisk for anything that has to stand up to sea water, which in Booty Bay is everything. Skin it clean, keep it out of the sun, and bring it to me before the flies find it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Raptor for toughness, panther for suppleness, and crocolisk for anything that has to stand up to sea water, which in Booty Bay is everything. Skin it clean, keep it out of the sun, and bring it to me before the flies find it. And keep {pet} away from my drying racks, if you please, because last week a hunter's cat ate half a crocolisk hide and I'm still not over it." },
      },
      choices = {
        { text = "I skin clean and waste nothing. The beast is owed that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll skin whatever pays best and leave the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Gloves, mostly, because casters set fire to their own hands more often than they'll admit. And satchels with strong seams, since a reagent pouch that splits in the jungle means a mage with no spells and a raptor with no manners." } },
      choices = {
        { text = "Fine work deserves a fine price. I'll pay it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner haggle you down to half.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I give thanks to the hunters who bring them in, and I give them coin, which they like better. If a crocolisk's spirit wants to complain, it can take it up with the hide, which looks magnificent now, if I say so myself." } },
      choices = {
        { text = "The beast gave its life. A word of thanks costs nothing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide is a hide. Thanks never tanned any leather.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Raptor hide, cured slow and oiled twice, and a few tricks I'll be taking to my grave. Most leatherworkers rush the curing, and that's why their armor squeaks like a Bloodsail parrot." } },
      choices = {
        { text = "Good work deserves good pay. I'll buy honestly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take the trick and skip the price.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Drizzlik.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd make armor for a raptor if it paid me, and I've done worse, believe me. The trouble is that demons tend to burn through leather faster than anything I can stitch, so I'd charge double just for the risk." } },
      choices = {
        { text = "My demon needs no armor. I'll keep it bare.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Make it, then. Name your price for the risk.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Your people wear hides with respect, I'm told, so you'll know quality when you see it, and you're looking at it now." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Even the faithful need boots, and mine are the finest in the South Seas, blessed by nobody and worth it anyway." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, in cloth, in this jungle? You'll want something of mine underneath it, because raptors don't care how many spells you know." },
        { id = "h_default", key = true,
          text = "Drizzlik! Finest leathercrafter of the South Seas and every world old or new. Crocolisk, raptor, panther: if it has a hide, I've made it into something gorgeous." },
        { id = "h_supply", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Supply and Demand") }, { questActive = TODO_QUEST("Some Assembly Required") } } },
          text = "I need hides, good ones. The jungle's full of them, still attached to things with teeth, and that's where you come in." },
        { id = "h_boots", when = { metBefore = true },
          text = "Somebody ordered a pair of boots from me yesterday and paid in advance! In advance! I almost fainted, so I'm making them extra gorgeous out of pure shock." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'll want leather that doesn't creak, and I'm the only goblin on this coast who can make it, so you've come to the right place." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I'll tell you now, I've never made anything for a demon, but I'd be willing to try, as long as it holds still while I measure it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior in mail, and mail is all very well, but under it you want padded crocolisk leather, the finest in the South Seas, which happens to be mine." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You've brought me hides, I hope, because I can turn a raptor skin into a jerkin that would make a Stormwind tailor faint dead away." },
      },
      again = {
        { id = "h_again", text = "More? Ask anything you like, but touch nothing." },
        { id = "h_again2", text = "Something else? Make it quick; that raptor hide won't stretch itself." },
      },
      choices = {
        { text = "Do you give thanks to the beasts whose hides you sell?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does a spellcaster need from a leathercrafter, Drizzlik?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What's the best hide in the jungle?", next = "hides" },
        { text = "Who taught you the trade?", next = "teacher" },
        { text = "Got any advice for a leatherworker?", next = "advice", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "A druid thinks twice about wearing a beast's hide.", next = "x_druid", when = { class = "DRUID" } },
        { text = "What makes your leather so quiet, Drizzlik?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really make armor for a demon, Drizzlik?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is your leather any use under a warrior's mail, Drizzlik?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which jungle hides make the best leather, Drizzlik?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Later.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hd_default", text = "Crocolisk for boots, raptor for belts, and panther for anything you want to be admired in. Tiger too, if Nesingwary's people leave any, but they never leave any." },
      },
      choices = {
        { text = "I'll bring you some.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = {
        { id = "t_default", text = "Taught? I was born knowing! Fine, it was an old goblin in Ratchet who said I'd never be any good, and I keep a pair of his boots to remind me he was wrong." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_druid = {
      lines = {
        { id = "xdr_default", text = "Think twice, then! I think about it once, very carefully, and then I make it beautiful. If the beast's already gone, I'd say the worst thing you could do is waste it on ugly boots." },
      },
      choices = {
        { text = "Fair. Waste is the real insult.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Cut with the grain, cure in the shade, and never let a customer tell you the color's wrong. The color is never wrong; the customer is." },
      },
      choices = {
        { text = "Thanks, Drizzlik.", next = "BACK", fx = { affinity = 2 } },
        { text = "Sometimes the customer's right.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born with a needle in one hand and a hide in the other. My mother was very surprised." } },
    advice = { { id = "tp_ad", text = "Leather breathes and plate doesn't, so in this heat, choose wisely." } },
    _none = { { id = "tp_none", text = "If it isn't leather, it's beneath me." } },
  },
}

P:NPC {
  key = "sprogger", id = TODO_NPC("Sprogger"), name = "Sprogger",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "haunted" }, values = { "loyal" },
  notices = { "drink" },

  impression = {
    first = "Sprogger cooked for Captain Smotts and came up out of the sea with him when the giants struck. He speaks of it plainly, which made it worse to hear.",
    third = "{name} met Sprogger, Captain Smotts' cook, who survived the sinking of the Smotts' Revenge alongside his captain.",
  },

  greetings = {
    { id = "g_cook", text = "You hungry? I can cook, I'm a cook. Well, I was a cook, on a ship, two ships actually." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy on the grog. The water's closer than you think from these docks, and I'd know." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The bosun did, with a boarding axe, and he stood at the rail while the rest of us ran, and the giant took him and the rail together. I think about him every time somebody tells me a brave man can hold anything." } },
      choices = {
        { text = "He held his post. That's the best any of us can do.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Brave and dead. He should have run with the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar when we could get it, crocolisk tail when we couldn't, and once a whole panther that the Captain swore blind was venison. Fresh meat keeps a crew happy at sea, and I still miss having a crew to cook for." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Boar when we could get it, crocolisk tail when we couldn't, and once a whole panther that the Captain swore blind was venison. Fresh meat keeps a crew happy at sea, and I still miss having a crew to cook for. Your {pet} looks like it'd eat anything I put down, which is the highest compliment a cook gets these days." },
      },
      choices = {
        { text = "A cook keeps a crew alive. That matters as much as fighting.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Meat's meat. Nobody remembers who cooked it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "We had a goblin with a wand aboard, and he got off one bolt before the first giant put a hand through the hull. I don't think it was a matter of magic; the sea wanted that ship, and the sea usually gets what it wants." } },
      choices = {
        { text = "Negolash will answer for your crew. I'll see to it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your captain took the risk for profit and paid for it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It was as if the sea itself stood up, with barnacles on their shoulders and eyes like lanterns, and the ship broke in their hands like kindling. I've cooked through storms and pirates, but I never felt so small as I did that night." } },
      choices = {
        { text = "The sea spared you, Sprogger. Honor the crew it took.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea takes what it wants. Forget them and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I held on to a barrel of salt pork and kicked for shore, and I didn't let go until my feet touched sand. The Captain was clinging to the next barrel over, and we didn't say a word to each other the whole way in." } },
      choices = {
        { text = "You survived together. That's a bond worth keeping.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You were lucky. Most aren't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sprogger.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "He talks about it at night, after the rum, and in the morning he pretends he never said it. I've cooked for him a long time, and I've never seen him like this, so I'll ask you plainly to leave him be." } },
      choices = {
        { text = "I'll leave him be. He deserves peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If he wants a demon, that's his choice.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You talk to the water, don't you? Then ask it why it sent the giants up after the Smotts' Revenge, because I still can't sleep for wondering." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Will you say something for the crew of the Smotts' Revenge? Whoever you pray to, it doesn't matter; nobody's said anything for them yet." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. You can conjure bread and water, can't you? Then you don't need a cook, and I don't blame you, but I'll make you a stew anyway." },
        { id = "h_default", key = true,
          text = "Sprogger. I cooked for Captain Smotts on the Smotts' Revenge, until the giants came up out of the water and that was the end of her. Everyone went down but the Captain and me." },
        { id = "h_negolash", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash. I can still see him coming over the rail, so bring friends, lots of friends. Then come back and tell me he's gone, because I'd like to sleep again." },
        { id = "h_why", when = { metBefore = true },
          text = "People ask why I lived. I was in the galley, under a pot, a big pot, and that's the whole secret; it isn't a good story, but it's mine." },
        { id = "h_gone", tags = { "news" }, when = { questRecent = { TODO_QUEST("Facing Negolash"), days = 3 } },
          text = "Is it true he's gone? Then I'm going to sleep tonight, all night. You can wake me if the sea comes up, but it won't, not now." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be wanting to know where the Captain keeps his gold, I suppose, and I'll tell you that it's at the bottom of the sea with his ships." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The Captain's been talking about hiring a demon to kill those giants, and I'll ask you not to encourage him, because he's not thinking clearly." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. The Captain could have used one of you on the Revenge, though I doubt even you could have stopped what came up out of the water." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Back on the ship I cooked whatever the shore parties brought me, and the hunters always brought the best meat, so you're welcome by my pot." },
      },
      again = {
        { id = "h_again", text = "Something else? I can do a stew while we talk; I always do a stew." },
        { id = "h_again2", text = "Ask away, and I'll keep stirring." },
      },
      choices = {
        { text = "What did the giants look like when they rose from the sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic have saved the Smotts' Revenge from the sea giants?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What was the Captain like, at sea?", next = "captain" },
        { text = "What did you see that night?", next = "night" },
        { text = "What do you cook?", next = "cook" },
        { text = "Would you sail with him again?", next = "again" },
        { text = "Shall I say a prayer for the crew?", next = "pray", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "I conjure my own food, cook.", next = "k_mage", when = { class = "MAGE" } },
        { text = "How did you survive the sea giants, Sprogger?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is the Captain really considering a demon, Sprogger?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Did any of the crew fight the giants, Sprogger?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What did you cook from the jungle back then, Sprogger?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'm glad you made it.", next = "END", fx = { affinity = 2 } },
      },
    },
    captain = {
      lines = {
        { id = "c_default", text = "Loud, and fair, and he knew every man's name and every man's mother's name. He sang badly at the wheel, too, but he doesn't sing now." },
      },
      choices = {
        { text = "Maybe he will again.", next = "BACK", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      big = true,
      lines = {
        { id = "n_default", text = "Nothing, mostly: the pot, the dark, a noise like the world tearing. Then quiet, and water up to my knees, and the Captain shouting names." },
      },
      choices = {
        { text = "You don't have to say more.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Did anyone else call back?", next = "night_names" },
      },
    },
    night_names = {
      lines = { { id = "nn_default", text = "Just me, and he kept shouting anyway. Nobody's told him to stop, and I don't think anybody should." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = {
        { id = "ck_default", text = "Stew: fish stew, crab stew, stew stew. The Captain says it's terrible and has two bowls, and I've learned to take that as a yes." },
      },
      choices = {
        { text = "I'd try a bowl.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ever thought of cooking something else?", next = "cook_else" },
      },
    },
    cook_else = {
      lines = { { id = "ce_default", text = "Once, a pie, and that was the night of the second ship. I haven't made a pie since; I'm not superstitious, I'm just not making pies." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    again = {
      lines = {
        { id = "a_default", text = "He'll ask. He'll find a ship and stand on that dock and ask, and I'll say yes, and I'll hate every minute of it." },
      },
      choices = {
        { text = "Standing by him like that is real loyalty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then tell him no, because you've earned some peace.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would you? Nobody's said anything over them, because there wasn't anything to say it over, just water." },
        { id = "pr_shaman", when = { class = { "SHAMAN", "DRUID" } },
          text = "To the water? The water took them, so tell it to keep them gentle, if it's listening; you'd know better than me whether it is." },
      },
      choices = {
        { text = "Then the water will do.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I've no words for the sea, Sprogger, and I'm sorry.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "I've tasted that conjured bread, and it's bread the way a painted fish is a fish. A cook's food remembers where it came from, mate, and yours remembers nothing at all." },
      },
      choices = {
        { text = "It keeps me alive. That's enough.", next = "BACK", fx = { affinity = -1 } },
        { text = "Fair. Cook me something real, then.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a ship's cook, on two ships. You know the rest; everyone does.", next = "night" } },
    advice = { { id = "tp_ad", text = "If the boat starts shaking and it isn't a storm, find a pot, a big one." } },
    _none = { { id = "tp_none", text = "I only know cooking and sea giants, mostly cooking, though lately it's too much sea giants." } },
  },
}

P:NPC {
  key = "fin", id = TODO_NPC("Fin Fizracket"), name = "Fin Fizracket",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "miserable" }, values = { "hopeful" },
  notices = { "kit" },

  impression = {
    first = "Fin Fizracket is sweating out the Stranglethorn Fever and warned me off in the same breath as he asked for help. I kept a polite distance anyway.",
    third = "{name} met Fin Fizracket, a Blackwater Raider laid low by the Stranglethorn Fever.",
  },

  greetings = {
    { id = "g_sick", text = "Don't come too close, or do, I don't know if it's catching, and nobody else knows anything either. Ugh." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It took one of our bosuns, who once held a gangplank against four Bloodsail by himself, and laid him out shaking for a fortnight. The fever doesn't care how hard you hit, pal, so get your medicine before you go swinging at trolls." } },
      choices = {
        { text = "Strength isn't everything. A warrior should know his limits.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight through any fever. Pain's no reason to stop.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The physician says it's the jungle air, and the troll from Grom'gol said it was the jungle's rot, and they both charged me for saying so. If there's a spell in it, I'd like to know whose, so I can send them the bill." } },
      choices = {
        { text = "I'll find Mokk and get your cure.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll help, but your crew can cover my costs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A troll from Grom'gol laid hands on me once and said the fever comes from the jungle's own rot, and that the jungle would have to give back what it took. Then he charged me five silver, which I thought was a bit less spiritual of him." } },
      choices = {
        { text = "I'll ask the waters to help you, Fin, and charge nothing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healing takes effort. Five silver sounds fair to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Out in the jungle, chasing a deal that wasn't worth it, and now I sweat through three shirts a day. The witch doctors on the coast are supposed to know a cure, but I'm not in any shape to go asking, so here I sit." } },
      choices = {
        { text = "I'll find the cure for you, Fin. Hang on.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You chased the deal. Live with what it cost you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Fin.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not that I've found, since the mages I've asked tell me their magic is for burning and freezing, not for curing. I asked one to freeze the fever out of me, and she just laughed and handed me a cold cloth, which I'll admit did help a little." } },
      choices = {
        { text = "She was right. A cold cloth is better than a frost bolt.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me try a frost bolt. It might just work.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman? Your kind heal with water and earth, don't they? I've tried every potion in Booty Bay, so I'll try mud next if you think it'll help." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Pray over me, would you? Loa, shadows, anything, I'm not fussy, and I've tried everything else twice." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Ugh, don't tell me the fever's a curse, because I've had enough bad news this week for three goblins." },
        { id = "h_default", key = true,
          text = "Fin Fizracket, Blackwater Raiders, or I was, before the Stranglethorn Fever got me. Sweats, shakes, and a taste in my mouth like old boots, so don't get sick in the jungle." },
        { id = "h_fever", tags = { "news" }, when = { questActive = TODO_QUEST("Stranglethorn Fever") },
          text = "There's a cure, supposedly: a gorilla's heart, from one particular gorilla, a big angry one called Mokk. I can't believe I'm hoping somebody kills a gorilla for me." },
        { id = "h_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "I'm better, look at me, standing on my own two feet! The heart tasted awful and I'd eat ten more, or actually no, never again, but I'd think about it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? Don't come any closer than you have to, pal, because this fever doesn't care how sneaky you are, and I'd hate to share it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I don't suppose you know a spell for fever, do you? I've tried everything in Booty Bay, and the only thing that helps is lying very still." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? Keep your distance, pal, because I've seen big strong types go down with this fever faster than anybody, and it isn't scared of a sword arm." },
      },
      again = {
        { id = "h_again", text = "Something else? Talk loud; my ears are ringing." },
        { id = "h_again2", text = "Ugh, yes? Go on, I'm listening, more or less." },
      },
      choices = {
        { text = "Has anyone tried a shaman's healing on the fever?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there magic in this fever, Fin, or only sickness?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How did you catch it?", next = "caught" },
        { text = "A gorilla's heart? Who says that works?", next = "cure" },
        { text = "Let me look at you.", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "What'll you do when you're well?", next = "after" },
        { text = "I could hunt the gorilla for you.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Where did you catch the Stranglethorn Fever, Fin?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can't a mage's magic cure your fever, Fin?", next = "xmage", when = { class = "MAGE" } },
        { text = "Can the fever really take down a warrior, Fin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Feel better.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    caught = {
      lines = {
        { id = "c_default", text = "Shore leave. I swam in a pond up the coast when everyone said don't swim in the pond, but I'm a sailor, and I didn't think a pond could beat me." },
      },
      choices = {
        { text = "Never trust a jungle pond.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure = {
      lines = {
        { id = "cu_default", text = "A troll witch doctor, through a friend of a friend of a cousin. Is it real? I don't know, and do I care, when I'm sweating through my second shirt today?" },
      },
      choices = {
        { text = "Then I'll get it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Sounds like a troll joke at your expense.", next = "cure_joke", fx = { trait = { skeptical = 1 } } },
      },
    },
    cure_joke = {
      lines = { { id = "cj_default", text = "Then it's a very good joke, and I'll laugh when I'm dead. Get the heart anyway, please." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    healer = {
      lines = {
        { id = "hl_default", text = "You're a healer? Go on, then, do the glowy thing, do anything at all; I'm not proud." },
        { id = "hl_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "Too late, friend, I'm cured! But you can look all you like; I like being looked at by people who aren't worried." },
      },
      choices = {
        { text = "This is beyond what I can mend. Hold on.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It'll pass. Rest and water.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Back on a Blackwater ship with the Bloodsail in sight and the cannons going, and never, ever anywhere near a pond." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Could you? Mokk the Savage, the big one up the hill, and don't let your pet near him because he throws things. I'd go myself, but I can't hold a cup still, never mind a rifle." },
      },
      choices = {
        { text = "Mokk won't be throwing anything for long.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "A gorilla's heart? Who says that works?", next = "cure" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Blackwater Raider since I was old enough to lie about my age. Then I swam in a pond." } },
    advice = { { id = "tp_ad", text = "Don't swim in the jungle ponds, don't drink from them, and don't even look at them too long." } },
    _none = { { id = "tp_none", text = "I can't think straight with this fever, so ask somebody healthy." } },
  },
}

P:NPC {
  key = "lozgil", id = TODO_NPC("Wharfmaster Lozgil"), name = "Wharfmaster Lozgil",
  bible = "bibles/stranglethorn.md", role = "worker", tier = "quest",
  communities = { "booty_bay" }, temper = { "watchful" }, values = { "careful", "practical" },
  notices = { "race" },

  impression = {
    first = "Wharfmaster Lozgil sees every crate and every face that comes off a boat in Booty Bay. He looked at mine long enough that I wondered which list I'd gone on.",
    third = "{name} passed Wharfmaster Lozgil on the docks of Booty Bay, where everything and everyone coming off a boat goes past him first.",
  },

  greetings = {
    { id = "g_docks", text = "Watch your step on the boards, and your purse on the docks. Not necessarily in that order." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Horde, eh? There's a crate of axes on my dock with your name on it, or your Warchief's name, anyway, and it's been sitting there for days." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone to hold the end of the pier while my dockhands get the crates and the passengers clear, because pirates always go for the cargo first. I've worked out who stands where and who runs where, and I'd want you at the narrow end." } },
      choices = {
        { text = "Give me the narrow end. I'll hold it as long as needed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather go after the pirates than wait on a pier.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because animals come off the boats as well as on, and I've had a Barrens hyena loose in the hold of the Ratchet boat and a crocolisk asleep on my scales. Everything that walks through Booty Bay goes past me first, and that includes things with four legs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because animals come off the boats as well as on, and I've had a Barrens hyena loose in the hold of the Ratchet boat and a crocolisk asleep on my scales. Everything that walks through Booty Bay goes past me first, and that includes things with four legs. Your {pet} looks well behaved enough, so it can go on the good list, provided it stays off my crates." },
      },
      choices = {
        { text = "Fair enough. Rules keep a busy dock safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go, list or no list.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Crates marked as glassware that hum when you put your ear to them, mostly, and they go north to people who don't sign their names. I don't open cargo, but I do write it down, and the Baron reads everything I write." } },
      choices = {
        { text = "Good. Somebody should keep track of that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some cargo is better left unwritten, Wharfmaster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I keep a close eye on anyone who can call lightning down on my docks, which is mostly mages and you. The mages set fire to a crate last month, so for now you're ahead." } },
      choices = {
        { text = "I'll keep my lightning to myself on your docks, Wharfmaster.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watch all you like. I go where the elements take me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The list of folk I watch when they're near the crates, which is half of Booty Bay, so don't take it personally. The Bloodsail send their sneaks to the wharf to see what's coming in, and a sharp eye has saved the Cartel more gold than the Bruisers ever have." } },
      choices = {
        { text = "Keep your list. I'll prove I belong off it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your list won't stop me if I want something.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Wharfmaster.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I count everything, because the Cartel taxes everything, and I'm not about to let a demon slip through just because it's ugly. I've got a column for livestock and a column for passengers, and so far your sort have gone under livestock." } },
      choices = {
        { text = "Count it how you like. Rules keep the port running.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon is no one's livestock. Leave it off your books.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The ones who smile too much and carry too little, because nobody comes to Stranglethorn with an empty bag unless they mean to fill it with something they shouldn't. The Bloodsail slip spies in on the merchant ships and the Venture Company sends worse, and I can't turn away anyone who pays the docking fee." } },
      choices = {
        { text = "Report every suspicious face to the Baron. Order keeps a port safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them come. A free port can't question everyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It's a safe harbor for anyone who pays, which is the Cartel's rule and not mine, though I'll admit some of what walks down my gangplanks makes my skin crawl. The Baron says neutrality keeps the cannons quiet, and so far he's been right." } },
      choices = {
        { text = "Some things can't be bought. I'd turn the worst away.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Neutral gold is still gold. The Baron's wise.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They say it's sick, or angry, or both, and they mutter about Zul'Gurub and something the trolls are waking up in there. I don't know what any of that means, but I've noticed fewer of them come back at all lately." } },
      choices = {
        { text = "Whatever the trolls are waking, it must be stopped before it spreads.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The jungle was here before the trolls. It can tend itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I see every face that comes off the boats, and yours is the first in a week that didn't look like it was hiding something, so welcome to Booty Bay." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I don't often see the Silver Hand on my docks, and when I do it usually means someone out in the jungle is about to have a very bad day." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman off the Grom'gol road. I watch who comes and goes, and your sort have been coming more often since Orgrimmar was built." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I'll put you down in the book as no trouble, and I'll change it if I need to." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. The last one through here set fire to a crate, so I'll thank you to keep your hands in your sleeves while you're on my boards." },
        { id = "h_default", key = true,
          text = "Wharfmaster Lozgil. Everything that comes off a boat in Booty Bay comes past me first, and you'd be amazed who comes and goes here, and who I'd rather didn't." },
        { id = "h_warsong", tags = { "news" }, when = { questActive = TODO_QUEST("Warsong Supplies") },
          text = "That Warsong crate is axes, by the weight of it, and it's been sitting on my dock for days. Haul it off, please, before somebody else decides it's theirs." },
        { id = "h_sponsor", when = { questActive = TODO_QUEST("Goblin Sponsorship") },
          text = "The Cartel likes to know who it's investing in. Show me you're worth the gold, and the gold will find you." },
        { id = "h_watch", when = { metBefore = true },
          text = "Saw a sailor slip a letter to a fishmonger this morning, and fishmongers don't read. I've made a note of it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. I've already put you on a list, friend, and it's not the bad list yet, so let's keep it that way." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'll be noting your companion on the manifest, since anything that walks off a boat in Booty Bay gets counted, demon or not." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You go on the list of people I'd want beside me if the Bloodsail ever land at the docks, which is a short list, so try to stay on it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I'll need to see whatever's on that lead before it gets on any boat, because the last hunter's beast ate a crate of bananas and bit a ship's captain." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, coming off a boat. I see a fair few of your kind heading south, and most of them come back up the dock looking unhappy about the jungle." },
      },
      again = {
        { id = "h_again", text = "Yes? Keep one eye on the water while you ask." },
        { id = "h_again2", text = "More? Fine, but stand there; you're blocking my view of the green boat." },
      },
      choices = {
        { text = "Do you keep a closer eye on shamans than on other visitors?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What comes through your docks that a spellcaster should know about?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who comes and goes that you'd rather didn't?", next = "who" },
        { text = "What happened with the fishmonger?", next = "fish", when = { metBefore = true } },
        { text = "Any ships to Stormwind or Menethil?", next = "ships", when = { faction = "Alliance" } },
        { text = "What's in the Horde crate?", next = "crate", when = { faction = "Horde" } },
        { text = "How do you know who to trust?", next = "trust" },
        { text = "My people arrived by sky, not ship, wharfmaster.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "What sort of list have you put me on, Wharfmaster?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you really count demons on the manifest, Wharfmaster?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Who comes through Booty Bay that worries you most?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is Booty Bay a safe harbor for wicked men?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you need from a warrior if pirates landed, Wharfmaster?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do you inspect hunters' beasts, Wharfmaster?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why do druids come back unhappy from the jungle, Wharfmaster?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll watch my purse.", next = "END", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Sailors with clean hands, fishermen who don't smell of fish, and anyone in a red scarf who suddenly isn't wearing one. I write them all down." },
      },
      choices = {
        { text = "And then what?", next = "who_then" },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    who_then = {
      lines = { { id = "wt_default", text = "Then I give the list to Krazek, who gives it to the Baron, who does nothing until someone dies. Then he asks why I didn't tell him sooner." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = {
        { id = "f_default", text = "The fishmonger's gone, stall empty and nets left behind, and the letter went with him. I've told the Bruisers, and they told me fishmongers come and go." },
      },
      choices = {
        { text = "You think he was Bloodsail.", next = "BACK", fx = { learn = { "bloodsail" }, trait = { curious = 1 } } },
        { text = "Fishmongers do come and go.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    ships = {
      lines = {
        { id = "s_default", text = "Not from here; the boat to Ratchet goes from the end of the pier. Stormwind's a long way round from there, and Menethil further still, so bring a book." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crate = {
      lines = {
        { id = "c_default", text = "Axes, nails and a smell, with a Warsong stamp on the side. It's been on my dock so long the dock thinks it lives here." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "I don't. I trust cargo manifests, tide tables and my own eyes, and two of those three have lied to me." },
      },
      choices = {
        { text = "Which one hasn't?", next = "trust_which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_which = {
      lines = { { id = "tw_default", text = "The tide tables. The sea's the most honest thing in this town: it'll drown you, but it tells you when." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_sky = {
      lines = {
        { id = "xsk_default", text = "Did they, now? Then they didn't pay my wharf fees, and I'll be putting that in the ledger as a loss. I've seen a few of your kind on my docks lately, and nobody here knows what to make of you, so I'll make you a customer and leave it there." },
      },
      choices = {
        { text = "A customer is fine, wharfmaster.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that comes off a boat passes me first, and so does every scrap of news. Ask, and I'll tell you what I've seen." },
    },
    background = { { id = "tp_bg", text = "I've been on these docks longer than most of the docks have, and I've replaced every board twice." } },
    advice = { { id = "tp_ad", text = "Watch the people who aren't watching the ships. They're the ones to worry about." } },
    bloodsail = { { id = "tp_bloodsail", text = "Some of the faces on my docks wear red when nobody's looking. I can't prove it, not yet." } },
    _none = { { id = "tp_none", text = "If it didn't come off a boat, I don't know it." } },
  },
}
