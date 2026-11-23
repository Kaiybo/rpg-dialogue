-- Undercity folk no earlier pass reached: holiday visitors (Darkcaller Yanka, the Copperpinches, the Midsummer
-- merchant), battlemasters, the War Effort recruiter, the wandering apothecaries and others.
-- Voice: bibles/townsfolk.md (Forsaken dry chill; goblins sell; orcs plain).
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Darkcaller Yanka: Hallow's End, the Ruins of Lordaeron and the zeppelin towers.
P:NPC {
  key = "uc_darkcaller_yanka", id = TODO_NPC("Darkcaller Yanka"), name = "Darkcaller Yanka", gender = "female",
  bible = "bibles/townsfolk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "grim", "proud" }, values = { "loyal", "ambitious" },
  impression = {
    first = "Darkcaller Yanka wears the black and orange of Hallow's End as if it were a uniform, and she speaks of the Wickerman the way a priest speaks of a cathedral.",
    third = "{name} met Darkcaller Yanka, who calls the Forsaken to the burning of the Wickerman at Hallow's End.",
  },
  greetings = {
    { id = "g_default", text = "Hallow's End is upon us, {class}. Tonight the Forsaken remember the day we threw off the Lich King's chains, and the Wickerman burns for it." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living thing from the south, at our festival? Keep well away from the Wickerman, or the guardians will make kindling of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Darkcaller Yanka, and I keep the rites of Hallow's End for the Dark Lady's people. The humans made this a night of candles and sweets, but for us it is the night we were set free." } },
      again = { { id = "h_again", text = "What else would you know of the festival?" }, { id = "h_again2", text = "Speak, before the fires are lit." } },
      choices = {
        { text = { normal = "What is the Wickerman?", polite = "Would you tell me what the Wickerman is?", blunt = "What's the Wickerman?" }, next = "wicker" },
        { text = "Hallow's End is a human festival.", next = "human" },
        { text = "How can I help with the celebration?", next = "help" },
        { text = "Are you ready for the Wickerman's burning?", next = "ready", when = { questActive = TODO_QUEST("A Time to Build Up") } },
        { text = "I'll come back when the fires burn.", next = "END" },
      },
    },
    wicker = {
      lines = { { id = "w_default", text = "A great figure of wood and straw that stands outside the Undercity, built by Forsaken hands. When we set it alight, every one of us remembers the moment our wills came back to us, and the Scourge's grip burned away." } },
      choices = {
        { text = "Do the Alliance know of it?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "They know, and they send their soldiers from Southshore to douse it with their little buckets. The Wickerman guardians are there to see that they don't, and they do it with great enthusiasm." } },
      choices = {
        { text = "Let them try. They'll learn.", next = "BACK", reply = "Spoken like one of us. I'll tell the guardians to save one for you.", fx = { align = { honor = -1 } } },
        { text = "A festival shouldn't be a battlefield.", next = "BACK", reply = "Then tell that to Southshore, {class}, because we didn't start the custom.", fx = { align = { honor = 1 } } },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "It was, once, and most of us were human when it was. We have kept what we liked of it and burned the rest, which is how the Forsaken deal with most of what we inherited." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = { { id = "he_default", text = "Every flame needs fuel, and every celebration needs hands. Speak to the innkeepers across the Horde's lands; they keep treats for those who carry the season's message, and I've a task or two of my own." } },
      choices = {
        { text = "What sort of task?", next = "task" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task = {
      lines = { { id = "t_default", text = "The Wickerman must be built up before it can be burned, and the shipments of wood and straw have a way of going astray between here and Brill. Bring me what I ask for, and you will have your place at the fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ready = {
      lines = { { id = "r_default", text = "Nearly, if you have brought what I asked. Once it's built, you'll stand with us when it burns, and you will understand why we celebrate as we do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask me again after the burning. Tonight I've thought only for the fire." } },
  },
}

-- Harbinger Balthazad: wandering herald of the Undercity.
P:NPC {
  key = "uc_harbinger_balthazad", id = TODO_NPC("Harbinger Balthazad"), name = "Harbinger Balthazad", gender = "male",
  bible = "bibles/townsfolk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "grand", "cold" }, values = { "loyal", "duty" },
  impression = {
    first = "Harbinger Balthazad walks the rings of the Undercity in a long dark coat, calling out the Dark Lady's needs in a voice that carries down every tunnel.",
    third = "{name} met Harbinger Balthazad, the Undercity's herald, who calls the Forsaken to arms.",
  },
  greetings = {
    { id = "g_default", text = "Hear me, {class}! The Dark Lady has need of every blade, and I have need of a moment of your time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Balthazad, harbinger to the Dark Lady. Where the Forsaken must march, I am the one who calls them, and lately I've been calling them to the Plaguelands." } },
      again = { { id = "h_again", text = "What more do you need to hear?" }, { id = "h_again2", text = "Speak, {class}; I've a long circuit to walk." } },
      choices = {
        { text = { normal = "What's happening in the Plaguelands?", polite = "What news is there from the Plaguelands, Harbinger?", blunt = "What's in the Plaguelands?" }, next = "plague" },
        { text = "You must walk a great distance every day.", next = "walk" },
        { text = "I'm ready to fight for the Dark Lady.", next = "ready", when = { minLevel = 50 } },
        { text = "I'll keep that in mind.", next = "END" },
      },
    },
    plague = {
      lines = { { id = "p_default", text = "The Scourge holds Andorhal and the lands east of it, and the Scarlet Crusade squats in Hearthglen pretending to fight them. Our Apothecaries have a foothold at the Bulwark, and it is our task to widen it." } },
      choices = {
        { text = "What is the Bulwark?", next = "bulwark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark = {
      lines = { { id = "b_default", text = "A wall of Deathguard and barricades on the road east out of Tirisfal, where Western Plaguelands begins. Every night the dead come against it, and every night it holds, because the Forsaken do not run." } },
      choices = {
        { text = "The Scourge must be destroyed utterly.", next = "BACK", reply = "Utterly, and their master with them. The Dark Lady will see to the last of it herself.", fx = { align = { order = 1 } } },
        { text = "Leave them be and they'll rot on their own.", next = "BACK", reply = "Rot? They don't rot, {class}; they spread. That's rather the point.", fx = { align = { order = -1 } } },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "From the Trade Quarter to the Royal Quarter and back again, every hour without fail. My legs feel nothing, and so I've no excuse to stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ready = {
      lines = { { id = "r_default", text = "Then go east to the Bulwark and present yourself to High Executor Derrington. Tell him the harbinger sent you, though he'll know it from the look of purpose on you." } },
      choices = {
        { text = "What will he ask of me?", next = "ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "To kill what the Scourge throws at the wall, mostly, and to carry the fight to Andorhal when it's time. It is honest work for a soldier, and there's no shortage of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I carry the Dark Lady's words, {class}, not the city's gossip." } },
  },
}

-- Kurden Bloodclaw: Warsong Gulch battlemaster.
P:NPC {
  key = "uc_kurden_bloodclaw", id = TODO_NPC("Kurden Bloodclaw"), name = "Kurden Bloodclaw", title = "Warsong Gulch Battlemaster", gender = "male",
  bible = "bibles/townsfolk.md", role = "battlemaster", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "proud" }, values = { "brave", "honor" },
  impression = {
    first = "Kurden Bloodclaw stands among the Forsaken like a boulder in a crypt, an orc of the Warsong Outriders with no patience for the city's chill.",
    third = "{name} met Kurden Bloodclaw, the orc who sends warriors to Warsong Gulch from the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "You look like you can swing a weapon, {class}. The Warsong Outriders need fighters at the gulch." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Kurden Bloodclaw, of the Warsong Outriders. The night elves of the Silverwing want us out of Ashenvale, and we mean to keep cutting their trees whether they like it or not." } },
      again = { { id = "h_again", text = "What else, warrior?" } },
      choices = {
        { text = "Tell me about Warsong Gulch.", next = "gulch" },
        { text = "You don't care for the Undercity.", next = "city" },
        { text = "Send me to the gulch.", next = "BUSINESS" },
        { text = "Another time.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "g_default", text = "A valley in Ashenvale, where Grom Hellscream's clan cut the forest and the Sentinels came to make them pay. Now we steal each other's flags and carry them home, and the side with the most wins the day." } },
      choices = {
        { text = "The elves are defending their forest.", next = "BACK", reply = "Aye, and we're feeding our people. Both of us are right, so we fight about it.", fx = { align = { honor = 1 } } },
        { text = "Then we take the forest and their flag.", next = "BACK", reply = "Lok'tar! That's the spirit the Outriders need.", fx = { align = { honor = -1 } } },
      },
    },
    city = {
      lines = { { id = "c_default", text = "It's cold, it stinks of the apothecaries' brews, and nobody here has eaten a proper meal in years. Still, the Forsaken fight hard, and a Warsong warrior respects that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about the gulch." } },
  },
}

-- Grizzle Halfmane: Alterac Valley battlemaster.
P:NPC {
  key = "uc_grizzle_halfmane", id = TODO_NPC("Grizzle Halfmane"), name = "Grizzle Halfmane", title = "Alterac Valley Battlemaster", gender = "male",
  bible = "bibles/townsfolk.md", role = "battlemaster", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "steady" }, values = { "loyal", "honor" },
  impression = {
    first = "Grizzle Halfmane wears the furs of the Frostwolf clan, and the snow of Alterac seems to cling to him even down in the Undercity's damp.",
    third = "{name} met Grizzle Halfmane, the Frostwolf who sends warriors to Alterac Valley from the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Frostwolf greets you, {class}. Drek'Thar needs warriors in Alterac, and the Stormpike dwarves aren't leaving on their own." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Grizzle Halfmane of the Frostwolf clan. Our home is the valley in Alterac where Durotan's people lived in exile, and the Stormpike dig into it as if it were theirs." } },
      again = { { id = "h_again", text = "Speak, and quickly; the valley waits." } },
      choices = {
        { text = "Who are the Stormpike?", next = "stormpike" },
        { text = "Why does the valley matter so much?", next = "valley" },
        { text = "Send me to Alterac.", next = "BUSINESS" },
        { text = "Farewell.", next = "END" },
      },
    },
    stormpike = {
      lines = { { id = "s_default", text = "Dwarves out of Ironforge who came to dig for iron and old relics in our valley. They built a fortress at Dun Baldar, and they think a fortress makes them owners." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "Durotan raised Thrall's people there, and Drek'Thar kept the clan alive through the long winters. A Frostwolf would sooner give up his own blood than give up that ground." } },
      choices = {
        { text = "Then the Frostwolves must hold it.", next = "BACK", reply = "We will, with your help. Lok'tar, {class}.", fx = { align = { order = 1 } } },
        { text = "Land is land. Share it and be done.", next = "BACK", reply = "Spoken like one who's never buried kin in it.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know snow and battle. Ask someone else about that." } },
  },
}

-- Brother Malach: Cult of Forgotten Shadows priest who runs the War Quarter pit fights.
P:NPC {
  key = "uc_brother_malach", id = TODO_NPC("Brother Malach"), name = "Brother Malach", gender = "male",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "wry", "cold" }, values = { "curious" },
  impression = {
    first = "Brother Malach stands by the War Quarter pit with his hands folded in his sleeves like a friar at prayer, watching the fighters below with a bookmaker's eye.",
    third = "{name} met Brother Malach, the Forsaken priest who arranges the War Quarter's bouts.",
  },
  greetings = {
    { id = "g_default", text = "Have you come to watch, {class}, or to bleed? Either way, there's a place for you here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Brother Malach, of the Forgotten Shadow. I keep the bouts in this pit, and I mend the fighters afterward, because a priest of shadow knows exactly where a body breaks." } },
      again = { { id = "h_again", text = "Anything else? The next bout starts soon." } },
      choices = {
        { text = "Who fights here?", next = "fighters" },
        { text = "A priest running fights is an odd thing.", next = "priest" },
        { text = "Tell me of the Forgotten Shadow.", next = "shadow", when = { class = "PRIEST" } },
        { text = "I'll watch from a distance.", next = "END" },
      },
    },
    fighters = {
      lines = { { id = "f_default", text = "Tyler and Edward, chiefly, two Forsaken who had some quarrel in life and found that death didn't end it. I put things in the pit with them, and the crowd watches to see whether they'll finally lose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Not to us. The Light taught that suffering was a test; the Forgotten Shadow teaches that it's a lesson, and this pit is my classroom." } },
      choices = {
        { text = "Suffering teaches nothing but cruelty.", next = "BACK", reply = "You'd be surprised how many students disagree, once they've healed.", fx = { align = { light = 1 } } },
        { text = "Strength is learned through pain.", next = "BACK", reply = "Then you've already passed the first lesson, {class}.", fx = { align = { light = -1 } } },
      },
    },
    shadow = {
      lines = { { id = "s_default", text = "We turned from the Light when it turned from us, and we found that the shadow answers more honestly. Speak to Aelthalyste in the War Quarter if you want the full catechism." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my concern, {class}. My concern is in the pit." } },
  },
}

-- Jaycrue Copperpinch: Smokywood Pastures, Winter Veil (the dearer goods).
P:NPC {
  key = "uc_jaycrue_copperpinch", id = TODO_NPC("Jaycrue Copperpinch"), name = "Jaycrue Copperpinch", title = "Smokywood Pastures", gender = "female",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "cheerful" }, values = { "ambitious" },
  impression = {
    first = "Jaycrue Copperpinch has set out a Winter Veil stall in the Trade Quarter as though the Undercity's gloom were simply an untapped market.",
    third = "{name} met Jaycrue Copperpinch, a Smokywood Pastures goblin selling Winter Veil goods in the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, sweetheart! Smokywood Pastures, finest holiday goods this side of the Great Sea, and no, I don't give samples." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jaycrue Copperpinch, the premium side of the Copperpinch operation. My brother Nardstrum over there sells the cheap stuff, and I sell the stuff people actually want to unwrap." } },
      again = { { id = "h_again", text = "What else, pal? Browsing's free, buying's better." } },
      choices = {
        { text = "Winter Veil in the Undercity?", next = "undercity" },
        { text = "You and Nardstrum compete?", next = "brother" },
        { text = "Show me the goods.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    undercity = {
      lines = { { id = "u_default", text = "Listen, a corpse with gold is still a customer, and these folks remember the holiday from when they had pulses. They buy the gift wrap for nostalgia and the hats for irony, and I bill them for both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Compete? We're diversified, sweetheart, so whichever way the customer's purse leans, a Copperpinch catches it. He keeps the volume, I keep the margins, and the Cartel keeps a cut of the whole festive mess." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Can't sell you that, so I can't say I care about it." } },
  },
}

-- Nardstrum Copperpinch: Smokywood Pastures, Winter Veil (the cheaper goods).
P:NPC {
  key = "uc_nardstrum_copperpinch", id = TODO_NPC("Nardstrum Copperpinch"), name = "Nardstrum Copperpinch", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "loud", "cheerful" }, values = { "ambitious" },
  impression = {
    first = "Nardstrum Copperpinch shouts his Winter Veil prices across the Trade Quarter canal, cheerfully undercutting nobody but his own sister.",
    third = "{name} met Nardstrum Copperpinch, a goblin selling cheap Winter Veil treats in the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Greatfather Winter's best prices, buddy, right here! Cookies, cocoa, candy canes, and all of it priced for a working stiff, if you'll pardon the expression." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Nardstrum Copperpinch, Smokywood Pastures, value line. My sister Jaycrue handles the fancy merchandise, and I handle everybody who's actually got to count their coppers." } },
      again = { { id = "h_again", text = "Anything else? Cocoa's gettin' cold, and so's everybody." } },
      choices = {
        { text = "Do the Forsaken even eat cookies?", next = "eat" },
        { text = "Who is Greatfather Winter?", next = "greatfather" },
        { text = "What are you selling?", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Eat 'em, no, but they buy 'em and leave 'em on graves, which is a market I never saw comin'. The trolls and orcs passin' through eat plenty, so the stock moves either way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    greatfather = {
      lines = { { id = "g_default", text = "The jolly fella in Orgrimmar with the beard and the presents, and the best mascot Smokywood ever signed. The dwarves call him something else on their side, but the cookies cost the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, pal, but I've got a candy cane that'll take your mind off it." } },
  },
}

-- Senior Sergeant Grimsford: War Effort Recruiter, Trade Quarter.
P:NPC {
  key = "uc_senior_sergeant_grimsford", id = TODO_NPC("Senior Sergeant Grimsford"), name = "Senior Sergeant Grimsford", title = "War Effort Recruiter", gender = "male",
  bible = "bibles/townsfolk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "gruff", "brisk" }, values = { "duty", "practical" },
  impression = {
    first = "Senior Sergeant Grimsford stands behind a table of ledgers in the Trade Quarter, tallying copper bars and linen bandages as though the fate of Kalimdor depended on his arithmetic.",
    third = "{name} met Senior Sergeant Grimsford, who collects supplies in the Undercity for the Horde's war effort.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! The Horde is gathering for war in the south, and the war needs more than swords. Have you any supplies to spare?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Senior Sergeant Grimsford, recruiter for the war effort. The Warchief has called on every city of the Horde to send supplies, and the Undercity will not be the city that sent the least." } },
      again = { { id = "h_again", text = "Next question, {class}. I've ledgers to fill." }, { id = "h_again2", text = "Anything else? Make it quick." } },
      choices = {
        { text = { normal = "What war is this?", polite = "Which war is the Horde preparing for, Sergeant?", blunt = "What war?" }, next = "war" },
        { text = "What supplies do you need?", next = "need" },
        { text = "You count everything twice, don't you?", next = "count" },
        { text = "I've brought supplies.", next = "brought", when = { minLevel = 20 } },
        { text = "I'll be back.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Something stirs in Silithus, beyond the deserts of Tanaris, and the Cenarion Circle says it's older and worse than anything we've faced. The Warchief means to be ready, and readiness is built out of bandages and bars." } },
      choices = {
        { text = "The Alliance is gathering too, I hear.", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "They are, in Ironforge, and they're counting their bars as fast as we count ours. For once, the Horde and the Alliance are racing toward the same enemy, and I'd like us to win the race." } },
      choices = {
        { text = "Then we should share the effort.", next = "BACK", reply = "Share? I'll share a battlefield with them, {class}, not a warehouse.", fx = { align = { order = -1 } } },
        { text = "The Horde must arrive first and strongest.", next = "BACK", reply = "Exactly so. Now go and help me make it happen.", fx = { align = { order = 1 } } },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Metal bars, cloth, herbs, leather and food, by the crate. Each city has its own list, and mine is posted here for anyone with eyes, so read it and bring what you can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    count = {
      lines = { { id = "c_default", text = "Three times, if you must know. A soldier who loses count of his arrows dies, and a quartermaster who loses count of his crates kills a whole company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brought = {
      lines = { { id = "b_default", text = "Then set it on the table and let me tally it. Every crate goes into the ledger beside your name, and the Warchief reads the ledgers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it's not on my list, {class}, it's not my concern." } },
  },
}

-- Apothecary Katrina: Royal Apothecary Society, patrols the Apothecarium and Trade Quarter.
P:NPC {
  key = "uc_apothecary_katrina", id = TODO_NPC("Apothecary Katrina"), name = "Apothecary Katrina", title = "Royal Apothecary Society", gender = "female",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "wry", "precise" }, values = { "curious" },
  impression = {
    first = "Apothecary Katrina moves between the Apothecarium and the Trade Quarter with a satchel of corked vials, and she smells faintly, oddly, of perfume.",
    third = "{name} met Apothecary Katrina, a member of the Royal Apothecary Society who walks the Undercity's rings.",
  },
  greetings = {
    { id = "g_default", text = "Mind the satchel, {class}. Half of it heals and half of it doesn't, and I'd rather not find out which half broke." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Apothecary Katrina, of the Royal Apothecary Society. I carry samples between the Apothecarium and the merchants, which is the Society's way of keeping a junior member busy." } },
      again = { { id = "h_again", text = "Something else? I'm expected below." } },
      choices = {
        { text = "You smell of perfume.", next = "perfume" },
        { text = "What does the Society work on?", next = "work" },
        { text = "Safe travels.", next = "END" },
      },
    },
    perfume = {
      lines = { { id = "p_default", text = "From Norman, the innkeeper, if you can believe it. A Forsaken ought to smell of embalming salts, but I find it helps the merchants forget what they're bargaining with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "Cures for the Scourge's plague, officially, and other things less officially. Master Apothecary Faranell keeps the real work behind locked doors, and I'm not yet senior enough to see behind them." } },
      choices = {
        { text = "A new plague, perhaps?", next = "plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "pl_default", text = "I didn't say that, {class}, and you didn't hear it. Ask Faranell if you're curious, and see how long you remain curious afterwards." } },
      choices = {
        { text = "A weapon against the living is only fair.", next = "BACK", reply = "Hush. Fair or not, keep it to yourself.", fx = { align = { light = -1 } } },
        { text = "That would be a grave mistake.", next = "BACK", reply = "Perhaps it would. Most mistakes here are grave ones, literally.", fx = { align = { light = 1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not in my notes, {class}. Try the Apothecarium library." } },
  },
}

-- Apothecary Lycanus: Royal Apothecary Society, patrols the city.
P:NPC {
  key = "uc_apothecary_lycanus", id = TODO_NPC("Apothecary Lycanus"), name = "Apothecary Lycanus", title = "Royal Apothecary Society", gender = "male",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "cold", "exacting" }, values = { "ambitious", "curious" },
  impression = {
    first = "Apothecary Lycanus walks the canals with a notebook open, observing the living who pass him with the careful interest of a man studying insects.",
    third = "{name} met Apothecary Lycanus, a cold-eyed member of the Royal Apothecary Society.",
  },
  greetings = {
    { id = "g_default", text = "Stand still a moment, {class}. No, no reason, I was simply noting your colour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Apothecary Lycanus. I study how things decay, which in the Undercity gives me no shortage of subjects." } },
      again = { { id = "h_again", text = "Something further? I'm taking notes regardless." } },
      choices = {
        { text = "What are you writing about me?", next = "notes" },
        { text = "Where do you find your subjects?", next = "subjects" },
        { text = "I'll be going now.", next = "END" },
      },
    },
    notes = {
      lines = {
        { id = "n_default", text = "Height, gait, the healthy flush you'd probably rather keep. The Society finds it useful to know how the living hold up against our more ambitious tinctures." },
        { id = "n_undead", when = { race = "Scourge" }, text = "That your stitching is holding and your jaw is properly set. Someone did good work on you, which is rarer than you'd think." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    subjects = {
      lines = { { id = "s_default", text = "The Plaguelands, Silverpine and Hillsbrad, wherever the Society has outposts. Gnolls, wolves and the occasional Scarlet volunteer, though they rarely volunteer as willingly as they ought." } },
      choices = {
        { text = "Science needs subjects. That's how it is.", next = "BACK", reply = "Precisely. You would make a fine apothecary, or a fine subject.", fx = { align = { light = -1 } } },
        { text = "That sounds like cruelty with a notebook.", next = "BACK", reply = "All science looks like cruelty to the subject, {class}.", fx = { align = { light = 1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I haven't observed that. Bring me a sample and I'll tell you." } },
  },
}

-- Midsummer Merchant: by the bonfire during the Midsummer Fire Festival.
P:NPC {
  key = "uc_midsummer_merchant", id = TODO_NPC("Midsummer Merchant"), name = "Midsummer Merchant", gender = "male",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "dry" }, values = { "practical" },
  impression = {
    first = "The Midsummer merchant keeps his stall by the festival bonfire and stays exactly far enough from it, as any Forsaken should.",
    third = "{name} met a merchant selling goods for the Midsummer Fire Festival in the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Midsummer greetings, {class}. Come and buy something festive, and please don't push me toward the fire." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I sell the season's trinkets for the Fire Festival, which is a strange trade for a man who'd burn like dry kindling. Still, the Earthen Ring pays its vendors well." } },
      again = { { id = "h_again", text = "Anything else, {class}?" } },
      choices = {
        { text = "Why would the Forsaken celebrate fire?", next = "fire" },
        { text = "What's the festival about?", next = "festival" },
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "Happy Midsummer.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "f_default", text = "Because fire is the one thing that frightens the Scourge as much as it frightens us. We light the bonfire and stand well back from it, and that's as good a celebration as any." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "fe_default", text = "The longest day of the year, kept by the shamans and their Earthen Ring. You honour the flames in your own cities and steal them from the Alliance's, which is the part most of the Horde enjoys." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I only know what's on my stall, {class}." } },
  },
}

-- Edward Remington: Tabard Designer, Trade Quarter.
P:NPC {
  key = "uc_edward_remington", id = TODO_NPC("Edward Remington"), name = "Edward Remington", title = "Tabard Designer", gender = "male",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "prim", "proud" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Edward Remington sits among swatches and dye pots in the Trade Quarter, holding colours up to the green lamplight and frowning at all of them.",
    third = "{name} met Edward Remington, who designs guild tabards in the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a client, or at least someone standing near enough to become one. Do you have a guild, {class}, and does it have taste?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Edward Remington, tabard designer. I stitch a guild's colours and crest onto a tabard, and I try to dissuade them from choosing pink." } },
      again = { { id = "h_again", text = "Anything else, before I lose the light?" } },
      choices = {
        { text = "What makes a good tabard?", next = "good" },
        { text = "Colours are hard to see down here.", next = "light" },
        { text = "I'd like to design a tabard.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g_default", text = "Two colours, one emblem, and restraint. Lordaeron's old houses understood that, and their banners could be read across a battlefield, but every guild now wants six colours and a dragon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "It is the bane of my profession. Everything under these lamps looks the colour of pond water, so I take my samples up to the ruins to see them in daylight, and the Deathguard think I'm mad." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I design tabards, {class}, not opinions." } },
  },
}

---------------------------------------------------------------------------
-- Theresa, Gerard's Mindslave: a living woman Gerard Abernathy cut and "improved".
-- She carries parcels between Gerard and Father Lankester. Flat, obedient, with
-- something of the old Theresa surfacing now and then.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_theresa", id = 5697, name = "Theresa", title = "Gerard's Mindslave",
  role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "flat", "obedient" }, values = { "the errand", "Gerard" },
  impression = {
    first = "A living woman with a scar along her scalp and eyes that look just past you. She waits, perfectly still, until she is spoken to.",
    third = "{name} spoke with Theresa, the living woman Gerard Abernathy keeps as a mindslave in the War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Good day. Master Gerard says I am to be polite to everyone who speaks to me, so I am being polite to you." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you. Master Gerard says remembering faces is one of the parts of me that still works." },
    { id = "g_hallows", when = { holiday = "hallowsend" }, text = "The city is burning a wicker man this week. Master Gerard says I am not to stand too close to the fire." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Theresa. I carry things from Master Gerard to Father Lankester, and from Father Lankester back to Master Gerard. That is what I am for." },
        { id = "h_living", when = { race = "Human" }, text = "You are warm, like me. There are not many warm people down here, and the cold ones look at us both the same way." },
      },
      again = {
        { id = "h_again", text = "Is there something else? I must not keep the parcel waiting." },
        { id = "h_again2", text = "I am still here. I am usually still here." },
      },
      choices = {
        { text = "What did Gerard do to you?", next = "gerard" },
        { text = "Do you remember your life before this?", next = "before" },
        { text = "What do you carry for them?", next = "parcels" },
        { text = "Go on with your errand, Theresa.", next = "END" },
      },
    },
    gerard = {
      lines = { { id = "ge_default", text = "He opened my head and took away the parts that were afraid. Then he woke up the parts that listen. He says I am his finest work, and I believe him, because I do not remember how to disbelieve him." } },
      choices = {
        { text = "That is monstrous. Someone should stop him.", next = "BACK", reply = "Stop him? Then who would tell me where to walk?", fx = { align = { light = 1 } } },
        { text = "It's no crueler than what the Scourge does.", next = "BACK", reply = "Master Gerard says that too. He says it often.", fx = { align = { light = -1 } } },
        { text = "Does it hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "Sometimes there is a pain behind my eyes, like a word I cannot remember. Then a parcel comes, and I carry it, and the pain goes somewhere else for a while." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "be_default", text = "There was a kitchen, I think, with bread in it. There was someone who called me by a shorter name. I try to think of the name, and then I think of the parcel instead." } },
      choices = {
        { text = "I'm sorry, Theresa.", next = "BACK", reply = "Thank you. I do not know what for, but thank you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    parcels = {
      lines = { { id = "pa_default", text = "Bottles, mostly, and papers sealed with wax. Father Lankester says I must never open them, and I never have. I would not know how to want to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Spoops: a little Hallow's End ghost in the Undercity. Playful, a bit lonely,
-- delighted by the festival that celebrates the Forsaken's freedom.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_spoops", id = 15309, name = "Spoops",
  role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "playful", "mischievous" }, values = { "fun", "the festival" },
  impression = {
    first = "A small, pale spirit bobs in the air and giggles, as if it has just pulled a prank on someone and is waiting for them to notice.",
    third = "{name} met Spoops, a mischievous little ghost who haunts the Undercity at Hallow's End.",
  },
  greetings = {
    { id = "g_default", text = "Boo! Oh, you didn't jump. Nobody down here ever jumps, and it isn't fair at all." },
    { id = "g_hallows", when = { holiday = "hallowsend" }, text = "It's Hallow's End! Everybody's dressing up as something scary, and I'm already scary, so I win." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you bring sweets? Ghosts can't eat them, but I like to look at them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Spoops. I float about the city when the Wicker Man is burning, and I try to scare people. The Forsaken are terribly hard to scare, though; they've seen worse than me." },
      },
      again = { { id = "h_again", text = "Do you want to hear another secret? I know lots of them, mostly about rats." } },
      choices = {
        { text = "Who were you, before you were a ghost?", next = "before" },
        { text = "What is Hallow's End to you?", next = "hallows" },
        { text = "Want to try scaring me again?", next = "scare" },
        { text = "Goodbye, Spoops.", next = "END" },
      },
    },
    before = {
      lines = { { id = "be_default", text = "I don't remember, really. I think there was a house and a dog. Now there's this, and it's quite a lot more interesting, so I try not to be sad about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hallows = {
      lines = { { id = "ha_default", text = "The grown-up dead burn the Wicker Man to show they're free of the Lich King. I don't really understand that part. I just like the fire, and the masks, and the living people who come to stare." } },
      choices = {
        { text = "Freedom from the Scourge is worth a celebration.", next = "BACK", reply = "That's what the big ghosts say. Then they shout a lot.", fx = { align = { order = -1 } } },
        { text = "The dead should rest, not throw parties.", next = "BACK", reply = "Rest is boring. I tried it once.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scare = {
      lines = { { id = "sc_default", text = "All right, close your eyes. Now open them. Boo! Did that work? It didn't work, did it." } },
      choices = {
        { text = "Oh no, I'm terrified!", next = "BACK", reply = "Ha! I knew it! Wait until I tell the rats.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
