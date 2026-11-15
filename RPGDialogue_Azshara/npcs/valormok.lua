-- Valormok: a bare Horde camp against the northern mountains, a dozen warriors short. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "agtor", id = TODO_NPC("Ag'tor Bloodfist"), name = "Ag'tor Bloodfist",
  bible = "bibles/azshara.md", role = "soldier", tier = "quest",
  communities = { "valormok" }, temper = { "steady", "proud" }, values = { "loyal", "brave" },
  notices = { "race", "class" },

  impression = {
    first = "Ag'tor Bloodfist holds Valormok for a commander who made a fool's bargain with an elf. He grieves a dozen dead warriors and still believes the Horde will win here, because someone has to.",
    third = "{name} met Ag'tor Bloodfist, who holds Valormok after Magus Rimtori's betrayal cost it a dozen warriors.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar. Another blade for Valormok, and not a moment too soon." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {class}. The camp's still standing, more or less." },
    { id = "g_avenged", when = { questDone = TODO_QUEST("Betrayed") }, text = "There's the one who brought me the elf's head! Sit by my fire whenever you like." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc of Durotar, out in this elf-haunted forest. Good; I'm tired of explaining the Horde to people who aren't in it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The spirits here are angry and old, and they don't like us much. Maybe they'll like you better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ag'tor Bloodfist, and this is Valormok, or what's left of it. Belgrom Rockmaul sent us out here to guard an elf mage's expedition, and she repaid us by killing nearly every warrior in this camp." },
        { id = "h_letter", when = { questActive = TODO_QUEST("Betrayed") },
          text = "So Belgrom finally sent someone who isn't one of his own grunts. The elf's workers are on the bluffs of the northern cliffs, and her camp is somewhere past them; we'll start there." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Betrayed"), days = 7 } },
          text = "The spirits of our dead can rest now, and Belgrom can stop pacing his hall. You did that, {name}, and Valormok won't forget it." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; I've had nothing but the wind to talk to for weeks." },
        { id = "h_again2", text = "Go on. We've time, until the satyr come again." },
      },
      choices = {
        { text = "What happened to your warriors?", next = "betrayal" },
        { text = "Why did Belgrom trust an elf?", next = "belgrom" },
        { text = "How does Valormok hold out here?", next = "camp" },
        { text = "The spirits of your dead deserve rites.", next = "rites", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "Lok'tar, Ag'tor.", next = "END", fx = { affinity = 1, standing = { valormok = 1 } } },
      },
    },

    betrayal = {
      big = true,
      lines = {
        { id = "b_default", fx = { learn = { "rimtori" } },
          text = "Magus Rimtori promised Belgrom treasure and power from the old elven ruins if we kept her people safe while they dug. Once her diggers had what they needed, she turned her spells on the warriors guarding her, and this camp went from a dozen strong to what you see." },
      },
      choices = {
        { text = "Did any of them escape?", next = "betrayal_ran" },
        { text = "Where is she now?", next = "betrayal_where" },
        { text = "They'll be avenged. I swear it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { valormok = 1 } } },
        { text = "Vengeance won't bring them back. Cut your losses.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    betrayal_ran = {
      lines = { { id = "br_default", text = "After that I threw every warrior I had left at her, and not one came home. Some are dead, I'm sure, and some simply ran, and I don't know which I'd rather believe." } },
      choices = {
        { text = "Not every warrior is a hero.", next = "betrayal_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    betrayal_names = {
      lines = { { id = "bn_default", text = "No, but every one of them was mine. I cut the twelve names into the post by my tent, the cowards with the rest, because I'll judge them when I'm dead and not before." } },
      choices = {
        { text = "That's a fair way to remember them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    betrayal_where = {
      lines = { { id = "bw_default", text = "In her base camp on the northern cliffs, with her guards and her circle of floating crystals, digging up whatever the old elves left. She has a book there she won't let out of her sight, and I'd like very much to take it from her." } },
      choices = { { text = "Then that's where I'll start.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    belgrom = {
      lines = { { id = "be_default", text = "Because she told him what he wanted to hear, and told it well. He's a great warrior and a poor judge of elves, and too many orcs have died for that already, but he still commands us, and honour says we make the best of it." } },
      choices = {
        { text = "You're more loyal than he deserves.", next = "belgrom_loyal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom_loyal = {
      lines = { { id = "bl_default", text = "Maybe. But if his gamble had paid off, the whole Horde would have gained by it, and I'd have called him wise. A plan isn't foolish until it fails, {class}, and this one failed very loudly." } },
      choices = {
        { text = "Loyalty to a fool is still loyalty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A leader who wastes lives deserves none.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    camp = {
      lines = { { id = "c_default", fx = { learn = { "satyrs" } },
        text = "Badly, and stubbornly. The satyr of Haldarr are just south of us, the elves' Sentinels watch from their point to the southwest, and the mountains behind us are full of furbolgs who'd sooner kill us than trade." } },
      choices = {
        { text = "Why not pull back to Orgrimmar?", next = "camp_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_why = {
      lines = { { id = "cw_default", text = "Because this forest hasn't given us our finest hours, but we're young and our blood's hot, and we'll have a victory out of it yet. If we left now, the dead would have died for nothing." } },
      choices = {
        { text = "Then I'll stand with you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { valormok = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rites = {
      lines = { { id = "ri_default", text = "They do, and we've had no one to give them. If you'd say the words over the post where their names are cut, I'd count it a kindness, {class}." } },
      choices = {
        { text = "I'll do it before I leave.", next = "BACK", fx = { affinity = 3, standing = { valormok = 2 } },
          journal = { first = "At Valormok I said the rites over the post where Ag'tor cut the names of his twelve dead warriors.",
                      third = "{name} spoke the rites for Valormok's twelve dead warriors at Ag'tor Bloodfist's post." } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this forest and the enemies in it, and not much else. Ask." } },
    background = { { id = "tp_bg", text = "An orc of Durotar, sent to guard an elf and left to bury what she left behind. My brother Haggrum came with me; he's the only one of us who still smiles." } },
    advice = { { id = "tp_ad", text = "Don't trust anyone who promises you treasure in old ruins. I learned that from someone else's mistake, and it cost me twelve warriors anyway." } },
    rimtori = { { id = "tp_rimtori", text = "The elf who betrayed us. Ask me again when her head's on a spike, and I'll be more cheerful about it.", next = "betrayal" } },
    satyrs = { { id = "tp_satyr", text = "The Haldarr are south of us and never sleep. We kill them, they come back, and so it goes." } },
    sentinels = { { id = "tp_sent", text = "They watch us from their point, and we watch them. Nobody's spilt blood over it yet, and I'd like to keep it that way." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask Jediga; she's the one who thinks about things." } },
  },
}

P:NPC {
  key = "jediga", id = TODO_NPC("Jediga"), name = "Jediga",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "valormok" }, temper = { "sharp", "proud" }, values = { "greedy", "proud" },
  notices = { "race", "drink" },

  impression = {
    first = "Jediga was sent to Valormok because she told a powerful orc no, and she's turned her exile into a business selling Highborne tablets. She trusts nobody, the Archmage least of all.",
    third = "{name} met Jediga, who turned her exile at Valormok into a trade in stolen Highborne tablets.",
  },

  greetings = {
    { id = "g_default", text = "Another face from Orgrimmar. Tell me you brought ale." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and alive, and I've a use for both of those things." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stealing Knowledge") }, text = "My favourite partner in crime. How's the tablet trade treating you?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You smell of a tavern, and I envy you so much I could spit. Where did you find a drink in this forest?" },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of ours, and from the city, I'd wager. Tell me the ale in the Drag is still cold." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jediga, and I'm not out here for glory or honour, before you ask. One orc's wounded pride put me in this forest, and I mean to make enough coin out of my exile to buy my way home." },
        { id = "h_tablets", when = { questActive = TODO_QUEST("Stealing Knowledge") },
          text = "Four tablets in the Ruins of Eldarath, each named for a Highborne wizard, and each one worth a tidy sum to the right buyer. Get them all and you get a cut; that's how partners work." },
        { id = "h_xylem", when = { questActive = TODO_QUEST("Delivery to Archmage Xylem") },
          text = "You're taking the last one to the Archmage. Be careful up there; he's human, but he doesn't act like any human I've met, and I've met plenty." },
        { id = "h_paid", when = { questDone = TODO_QUEST("Xylem's Payment to Jediga") },
          text = "He paid, every coin, and didn't even try to turn you into a toad. I don't know whether to be relieved or suspicious, so I'm being both." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast; I've accounts to keep." },
        { id = "h_again2", text = "Go on. You're better company than Ag'tor, at least." },
      },
      choices = {
        { text = "Whose pride sent you here?", next = "exile" },
        { text = "Who buys Highborne tablets?", next = "buyers" },
        { text = "What do you make of the Archmage?", next = "xylem" },
        { text = "What would you do back in Orgrimmar?", next = "home" },
        { text = "You and me both, I could use a drink.", next = "drink", when = { drunk = true } },
        { text = "Good luck, Jediga.", next = "END" },
      },
    },

    exile = {
      big = true,
      lines = {
        { id = "e_default", text = "Belgrom Rockmaul's. He made me an offer I didn't want, and I turned him down in front of half the Valley of Honor. A week later I was posted to the edge of the world to guard his precious elf, and he called it a promotion." },
      },
      choices = {
        { text = "That's an abuse of his rank.", next = "exile_rank" },
        { text = "You did the right thing.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Swallowing your pride would've been smarter.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
      },
    },
    exile_rank = {
      lines = { { id = "er_default", text = "It is, and everyone knows it, and nobody says it. I'll say it, though, to anyone who'll listen, and the next time he tries it with someone, I hope she has fewer manners than I did." } },
      choices = {
        { text = "I'll remember his name.", next = "BACK", fx = { affinity = 1, opinion = { belgrom = "contempt" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", fx = { learn = { "highborne" } },
        text = "More people than you'd think. An apothecary in the Undercity, the old crone of the Grimtotem in Thunder Bluff, a troll alchemist in Orgrimmar, and the Archmage on his cliff. Each one wanted a tablet, and none of them asked where it came from." } },
      choices = {
        { text = "Isn't selling to Magatha a risk?", next = "buyers_magatha" },
        { text = "This is just grave-robbing.", next = "buyers_rob" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_magatha = {
      lines = { { id = "bm_default", text = "Everything's a risk out here. The crone pays well and asks nothing, and I don't care what she does with a stone tablet any more than she cares what I do with her gold." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    buyers_rob = {
      lines = { { id = "br_default", text = "The Highborne have been dead ten thousand years, and the naga are robbing the graves anyway. I'd sooner the Horde got the coin than a fish with a trident." } },
      choices = {
        { text = "Fair point. Profit is profit.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some things shouldn't be for sale.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },

    xylem = {
      lines = { { id = "x_default", fx = { learn = { "xylem" } },
        text = "He came down to this camp himself to ask for a tablet, then said his bodyguard would see to the rest. He reeks of power, and I didn't dare ask him what he wanted with it, which isn't like me at all." } },
      choices = {
        { text = "He seemed harmless to me.", next = "xylem_harmless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem_harmless = {
      lines = { { id = "xh_default", text = "Harmless people don't live alone on cliffs with no stairs. He paid, I'll grant him that, but I'll keep counting my fingers after every handshake, just the same." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },

    home = {
      lines = { { id = "ho_default", text = "Drink, first of all, something cold and brewed by someone who knows how. Then I'd take my tablet money and open a stall in the Drag, and Belgrom could walk past it every morning and choke." } },
      choices = {
        { text = "I'll buy the first round.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = { { id = "dr_default", text = "Don't tease me, {class}. Kurll sells milk and fruit juice here, as if we were children, and I've been dreaming about a mug of grog for a month." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I keep my ears open; it's the only entertainment in Valormok. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "A warrior of Orgrimmar who said no to the wrong orc. Now I sell old stones to strangers.", next = "exile" } },
    advice = { { id = "tp_ad", text = "Get paid before you deliver, unless the buyer's a mage on a cliff. Then pray." } },
    xylem = { { id = "tp_xylem", text = "Dangerous, polite and very rich. I don't know which of those worries me most.", next = "xylem" } },
    highborne = { { id = "tp_hb", text = "Dead wizards with expensive handwriting. Their tablets are my ticket home." } },
    rimtori = { { id = "tp_rimtori", text = "She fooled Belgrom, which isn't hard, and killed our warriors, which is unforgivable. Ag'tor wants her head, and he's welcome to it." } },
    _none = { { id = "tp_none", text = "No idea, and unless there's coin in it, no interest either." } },
  },
}

P:NPC {
  key = "kroum", id = TODO_NPC("Kroum"), name = "Kroum",
  bible = "bibles/azshara.md", role = "flightmaster", tier = "service",
  communities = { "valormok" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Kroum keeps Valormok's wind riders and speaks as little as he can. He told me the beasts hate the salt wind, and I think he does too.",
    third = "{name} met Kroum, the wind rider master at Valormok.",
  },

  greetings = {
    { id = "g_default", text = "Need a wind rider? They're fed and ready." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The beasts know your smell now." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The wind riders are calmer with your kind; something about the smell of the plains." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kroum, wind rider master. I can send you home to Orgrimmar or Thunder Bluff, to the Crossroads, to Splintertree in Ashenvale, to Bloodvenom Post in Felwood, or north to Everlook in the snow." },
      },
      again = { { id = "h_again", text = "Anything else, or are you flying?" } },
      choices = {
        { text = "How do the wind riders like it here?", next = "beasts" },
        { text = "Is it safe to fly over the coast?", next = "coast" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "They hate the salt wind off the bay, and they hate the smell of the satyr camp even more. But they'll fly anywhere I tell them, which is more than I can say for most grunts." } },
      choices = {
        { text = "Good beasts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coast = {
      lines = { { id = "c_default", text = "Over the cliffs, yes. Over the bay, no: the storms come up out of nothing, and the elves' Sentinels shoot at anything with leathery wings, so we fly west and keep our heads down." } },
      choices = { { text = "West it is.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fly wind riders for the Horde. Ag'tor gives the orders; I just make sure they get delivered." } },
    advice = { { id = "tp_ad", text = "Don't feed the wind riders the satyr's meat. Trust me on that." } },
    _none = { { id = "tp_none", text = "Ask Ag'tor. I just fly." } },
  },
}
