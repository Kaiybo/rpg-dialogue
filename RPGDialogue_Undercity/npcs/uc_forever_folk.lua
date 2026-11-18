-- Undercity folk added in World of Warcraft: Forever (1.60.1), from warcraft.wiki.gg.
-- Canals: Alyz, Barrelmaker Ishtar, Malus. Magic Quarter: Angela Ward, Faith Duggins, Rakkamar.
-- Apothecarium/Royal Quarter: Anya Rince. War Quarter: Chadsworth. Rogues' Quarter: Zeglo Kruptorr.
-- The wiki gives these people almost nothing but a place; their lives here are small and authored.
-- Voice: bibles/uc_forever_folk.md (see "Authored, not canon").
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Alyz: fishes lost things out of the green canals and keeps them in a sack.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_alyz", id = TODO_NPC("Alyz"), name = "Alyz",
  bible = "bibles/uc_forever_folk.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "odd", "calm" }, values = { "practical" },
  notices = { "race", "rogue" },
  impression = {
    first = "Alyz sits by the green water in the Canals and fishes out what the city drops into it. She keeps every button and ring in a sack, and she talks about the slime as if it were a neighbour.",
    third = "{name} met Alyz, a Forsaken woman who scavenges the Undercity canals for lost things.",
  },

  greetings = {
    { id = "g_default", text = "Mind the edge, the water's thicker than it looks, and it doesn't give back what it takes, not to anyone but me." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I found a spoon this morning, a good silver one, so the canal's in a generous mood." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Don't put your hands in the water, living one. It doesn't bother me, because there's nothing left in me for it to spoil, but you'd come out greener than you went in." },
    { id = "n_rogue", cat = "rogue", when = { class = "ROGUE" },
      text = "A rogue. If you've dropped anything into my canal on purpose, I've probably found it, and I don't ask questions about knives." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Alyz, and this stretch of canal is mine, as far as anything down here belongs to anyone. Everything that falls in drifts past me sooner or later, and I fish it out before the sludge eats it." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "You've come down from the Brill road, I can tell, because you still look at the water like it might hurt you. It won't, not us, so sit if you want." },
      },
      again = {
        { id = "h_again", text = "Something else? The water's slow tonight, so I've time." },
        { id = "h_again2", text = "Ask away, I'm only watching the green go by." },
      },
      choices = {
        { text = "What do you find in there?", next = "finds" },
        { text = "Where does all this green water come from?", next = "water" },
        { text = "What did you do before all this?", next = "before" },
        { text = "Who else works the Canals?", next = "neighbours" },
        { text = "Good fishing, Alyz.", next = "END" },
      },
    },

    finds = {
      lines = { { id = "fi_default", text = "Buttons, mostly, and coins, and teeth, a surprising number of teeth. Last week it was a wedding ring with two names cut inside it, and I sat with it most of the night wondering whose they were." } },
      choices = {
        { text = "What will you do with the ring?", next = "ring" },
        { text = "Do you sell what you find?", next = "sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ring = {
      big = true,
      lines = { { id = "ri_default", text = "I could hang it on a post in the Trade Quarter and see who comes for it, or I could keep it, because whoever lost it may not remember they were married. A good many in this city don't, you know." } },
      choices = {
        { text = "Hang it up. Somebody might be looking for it.", next = "ring_after", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Keep it. The canal gave it to you.", next = "ring_after", fx = { align = { order = -1 } } },
        { text = "Does anyone ever come asking after their things?", next = "ring_ask" },
      },
    },
    ring_ask = {
      lines = { { id = "ra_default", text = "Once, a man came asking for a pipe he'd dropped, and I gave it to him, and he stood there turning it over and said he'd never smoked in his life. I think it was somebody else's pipe, and he only wanted something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ring_after = {
      lines = { { id = "rf_default", text = "Maybe so. I'll think on it, and the ring will wait, since it's waited this long already." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sell = {
      lines = { { id = "se_default", text = "The coins I spend, because coins don't miss anybody. The rest I keep in a sack under the bridge, and Ishtar says I'll need a barrel soon, which is her way of trying to sell me one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    water = {
      lines = { { id = "wa_default", text = "From the Apothecarium, some say, and from the old sewers of the city above, and from the Scourge's leavings that seeped down before we came. I don't mind which, because it's green and it moves, and that's more than you can say for most of us." } },
      choices = {
        { text = "That can't be safe.", next = "water_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water_safe = {
      lines = { { id = "ws_default", text = "Safe? Nothing's been safe since the prince came home from the north. The water hasn't killed me yet, though I suppose that's an easy boast for a corpse to make." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    before = {
      lines = {
        { id = "bf_default", text = "I scrubbed pots in the palace kitchens, up there where the throne room was, and I dropped half of them in the wash tub for the cook to shout at me. Now I fish for things other folk dropped, so I suppose I've come up in the world." },
        { id = "bf_scourge", when = { race = "Scourge" }, text = "Pots, in the palace kitchens, if you can believe it. You'll have had a life too, and I won't ask about it, because some of us like that door shut." },
      },
      choices = {
        { text = "Do you miss it?", next = "before_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_miss = {
      lines = { { id = "bm_default", text = "I miss the bread. I can't taste it now, but I remember the smell of it at dawn better than I remember my own mother's face, and that tells you something about memory." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    neighbours = {
      lines = { { id = "ne_default", text = "Ishtar makes barrels further along and won't stop trying to sell me one. And there's Malus, who walks round and round from here to the War Quarter, and never stops to say hello, though he nods." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Kitchen girl in the palace, then dead, then this. The middle part I'd rather not go over." } },
    advice = { { id = "tp_ad", text = "Hold on to your things. Everything ends up in the canal eventually, and most of it never comes out again." } },
    _none = { { id = "tp_none", text = "I wouldn't know. If it hasn't floated past me, I've never heard of it." } },
  },
}

---------------------------------------------------------------------------
-- Barrelmaker Ishtar: cooper of the Canals; seals the Apothecarium's casks and doesn't ask what goes in them.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_ishtar", id = TODO_NPC("Barrelmaker Ishtar"), name = "Barrelmaker Ishtar",
  bible = "bibles/uc_forever_folk.md", role = "worker", tier = "quest",
  communities = { "undercity" }, temper = { "brisk", "proud" }, values = { "practical", "craft" },
  notices = { "race", "class" },
  impression = {
    first = "Barrelmaker Ishtar builds casks in the Canals and seals them with a little magic of her own. She is proud of her joints and her hoops, and very careful not to know what the apothecaries put inside them.",
    third = "{name} met Barrelmaker Ishtar, a Forsaken cooper who makes sealed casks for the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Stand clear of the staves, if you please, they're green and they spring when you least want them to." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've three casks to seal before the carts go up to Brill, so talk while I work." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, down here? Your folk make the only barrels I'd call better than mine, and I'd say so to their faces, if they'd stop trying to kill us." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "You'll have felt the ward on these hoops. It's a small thing, a sealing charm I learned from a Dalaran pedlar, but nothing gets out of a cask of mine that I didn't let out." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Ishtar, barrelmaker, and I've been coopering since before I died and kept on after, since a good cask doesn't care who's holding the adze. Every barrel that leaves this city for Brill or the zeppelin tower came through my hands." },
      },
      again = {
        { id = "h_again", text = "Anything else? Hand me that hoop while you're asking." },
        { id = "h_again2", text = "Go on, I can talk and drive a hoop at the same time." },
      },
      choices = {
        { text = "Who buys your barrels?", next = "buyers" },
        { text = "What's the magic in the hoops?", next = "ward" },
        { text = "How did you learn the trade?", next = "trade" },
        { text = "Alyz could use a barrel, she says.", next = "alyz" },
        { text = "I'll let you work.", next = "END" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", text = "The Apothecarium, mostly, and they want them sealed tight and asked no questions about. The Deathguard take a few for water and pitch, and the goblins at the zeppelin tower take anything that won't leak on their deck." } },
      choices = {
        { text = "What do the apothecaries put in them?", next = "apoth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth = {
      big = true,
      lines = { { id = "ap_default", text = "I make a barrel, and I seal it, and I hand it over empty, and what happens after is between them and the Dark Lady. Some casks come back to be burned instead of mended, and I've learned not to wonder why." } },
      choices = {
        { text = "A crafter should know what her work is used for.", next = "apoth_after", fx = { align = { light = 1 } } },
        { text = "Not knowing is safer, and you're wise to keep it that way.", next = "apoth_after", fx = { align = { light = -1 } } },
        { text = "Have you ever looked inside one?", next = "apoth_look" },
      },
    },
    apoth_look = {
      lines = { { id = "al_default", text = "Once, and the smell came through the bung so foul that my hands shook for a day, and I don't have the blood left to shake with. I put the plug back and never did it again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    apoth_after = {
      lines = { { id = "aa_default", text = "Maybe. You're welcome to ask the apothecaries yourself, but bring a better reason than curiosity, because they don't care for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ward = {
      lines = { { id = "wa_default", text = "A sealing charm, nothing grand, and I learned it from a pedlar out of Dalaran who wanted his wine kept from going off on the road. It keeps things in, and it keeps damp out, and the apothecaries pay extra for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trade = {
      lines = { { id = "tr_default", text = "From my father, in the cooperage behind the old brewers' row up in the capital. He made barrels for the king's own cellars, and I made the lids, because he said I had the steadier hand." } },
      choices = {
        { text = "What happened to him?", next = "father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = { { id = "fa_default", text = "The plague, the same as everyone, and I don't know where he went after. I look at the ghouls up in the ruins sometimes to see if any of them hold an adze the way he did, and none of them do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    alyz = {
      lines = { { id = "az_default", text = "She does, and she knows it, but she'll keep stuffing that sack until it splits and her treasures go back in the water. I'd make her one for nothing, if she'd stop pretending she doesn't want it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Cooper's daughter, cooper's trade, cooper still. Dying didn't change that much." } },
    advice = { { id = "tp_ad", text = "Never trust a barrel you didn't watch being sealed. That goes for most things in this city." } },
    trade = { { id = "tp_tr", text = "Oak where I can get it, Tirisfal pine where I can't, and iron hoops from the War Quarter smiths. Then a little charm, and it's done." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know staves and hoops, and not much else." } },
  },
}

---------------------------------------------------------------------------
-- Malus: walks the same round from the Canals to the War Quarter, the way he walked a watchman's beat in life.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_malus", id = TODO_NPC("Malus"), name = "Malus",
  bible = "bibles/uc_forever_folk.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "dour", "steady" }, values = { "loyal", "order" },
  notices = { "soldier", "class" },
  impression = {
    first = "Malus walks a round from the Canals to the War Quarter and back, and never stops for long. He walked a watchman's beat in the capital before the plague, and his feet have not forgotten it.",
    third = "{name} met Malus, a Forsaken who walks the old watch round through the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Walk with me if you want to talk, because I don't stop, not for long." },
    { id = "g_back", when = { metBefore = true }, text = "You again. That's twice round the ring for me since I last saw you, or two hundred times, I lose count." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { origin = { "forsaken_lordaeron_soldier", "forsaken_hillsbrad_militia" } },
      text = "You walk like a soldier of the old army, heel first. I could pick you out of a crowd of ghouls by that alone." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "Scourge" },
      text = "A warrior of ours. The War Quarter's the end of my round, and I see your kind drilling there every night, and I'm glad of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Malus. I walked the night watch in the capital up there, Canal Gate to the barracks and back, and when I woke up dead I found my feet still knew the way, so I let them carry on." },
      },
      again = {
        { id = "h_again", text = "Keep up. What else?" },
        { id = "h_again2", text = "We're coming round to the War Quarter again. Ask your question." },
      },
      choices = {
        { text = "Why keep walking it?", next = "why" },
        { text = "You were in the city watch?", next = "watch" },
        { text = "What do you see on your round?", next = "round" },
        { text = "I'll let you walk.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because when I stop, I start remembering, and when I walk, I only have to remember the next corner. The apothecaries say it's a habit of the flesh, and maybe so, but it's the one habit I've got left that I like." } },
      choices = {
        { text = "Old duties are worth keeping, even now.", next = "why_after", fx = { align = { order = 1 } } },
        { text = "You're free now. You could walk anywhere you like.", next = "why_after", fx = { align = { order = -1 } } },
        { text = "What would you remember, if you stopped?", next = "why_remember" },
      },
    },
    why_remember = {
      lines = { { id = "wr_default", text = "The night they opened the gates for the prince, and the cheering, and then the screaming. I was on the wall that night, and I cheered with the rest of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why_after = {
      lines = { { id = "wy_default", text = "Maybe. I'll think about it on the next lap, and the one after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    watch = {
      lines = { { id = "wt_default", text = "Under Captain Landen, a good man and a patient one, and young Garek Bandarion was his right hand, all fire and wanting a real war. He got his war, and they named a keep after him for it, out in the west of the Glades." } },
      choices = {
        { text = "You knew Garek Bandarion?", next = "garek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek = {
      lines = {
        { id = "ga_default", text = "To nod to, and to be shouted at by, when I was late on the gate. He came back like the rest of us and found the Light still answered him, which none of us expected, and he died for this city a second time." },
        { id = "ga_paladin", when = { class = "PALADIN", race = "Scourge" }, text = "To nod to. You'll have heard of him at the keep, I expect, since every Forsaken paladin seems to be his heir now. He'd have found that funny, or he'd have hated it, I was never sure which way he'd go." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    round = {
      lines = { { id = "ro_default", text = "Alyz fishing in the green, Ishtar banging hoops, the soldiers drilling, and the bats going over. Nothing changes much, which is how I like a round to go." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "City watch, nights, the Canal Gate beat. Then the prince came home." } },
    advice = { { id = "tp_ad", text = "Know your way back. Wherever you go, know the way back, and walk it now and then." } },
    _none = { { id = "tp_none", text = "Not on my round, so I couldn't say." } },
  },
}

---------------------------------------------------------------------------
-- Angela Ward: sells tailoring patterns for reagent bags in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_angela_ward", id = TODO_NPC("Angela Ward"), name = "Angela Ward", title = "Tailoring Recipes",
  bible = "bibles/uc_forever_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "prim", "dry" }, values = { "craft", "practical" },
  notices = { "profession", "class" },
  impression = {
    first = "Angela Ward sells tailoring patterns in the Magic Quarter, reagent bags mostly, and has firm opinions about stitching. She is Victor Ward's sister and would like that mentioned less often.",
    third = "{name} met Angela Ward, who sells tailoring patterns in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Patterns for reagent bags, linen and wool, and every one tested by my own hand before I'd sell it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another pattern, or have you come to tell me the last one worked? I do like hearing that." },
  },

  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = { name = "Tailoring", min = 1 } },
      text = "You're a tailor, I can tell by the calluses on your fingertips, or what's left of them. Good, then you'll know a well-cut pattern when you see one." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "A caster, and I'd wager your pockets are full of loose powders and candle ends. You want one of my reagent bags, whether you know it or not." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Angela Ward. I sell patterns, not finished bags, because a bag you've sewn yourself is a bag you'll know how to mend. Every mage and apothecary in this quarter needs somewhere to keep their bits, and I tell them how to make it." },
      },
      again = {
        { id = "h_again", text = "Something more? I've patterns to sort." },
        { id = "h_again2", text = "Yes? Ask, and then buy something, if you would." },
      },
      choices = {
        { text = "Why reagent bags?", next = "bags" },
        { text = "Are you related to Victor Ward?", next = "victor" },
        { text = "What about Carolyn Ward, in the Rogues' Quarter?", next = "carolyn" },
        { text = "Show me your patterns.", next = "BUSINESS" },
        { text = "Good day.", next = "END" },
      },
    },

    bags = {
      lines = { { id = "ba_default", text = "Because the mages in this quarter carry their reagents loose in their robes like children with sweets, and then wonder why they can't find a pinch of anything in a fight. A proper bag with proper pockets saves lives, and I'll not hear otherwise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    victor = {
      lines = { { id = "vi_default", text = "My brother, and yes, he teaches tailoring to anyone who'll listen, and no, I don't teach with him. We sewed side by side for thirty years in life, and that was quite enough of his humming for one lifetime, never mind two." } },
      choices = {
        { text = "You two don't get along?", next = "victor_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    victor_more = {
      lines = { { id = "vm_default", text = "We get along perfectly well from the far ends of a room. He sends his students to me for patterns, and I send mine to him for lessons, and we have supper together on the Dark Lady's feast nights, if you can call it supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    carolyn = {
      lines = { { id = "ca_default", text = "Ward was a common enough name in Lordaeron, and I've never asked her and she's never asked me. If she's family, she's the sort that keeps a knife in her sleeve, and supper is a poor place to find that out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A seamstress in the capital, my brother beside me, and now a pattern-seller under it. The work hasn't changed much." } },
    advice = { { id = "tp_ad", text = "Measure twice and cut once, and never let a mage borrow your scissors." } },
    _none = { { id = "tp_none", text = "Not my thread to pull, I'm afraid. Try someone in the quarter who reads books instead of hems." } },
  },
}

---------------------------------------------------------------------------
-- Faith Duggins: a mage of the Magic Quarter who kept her living name; argues with Rakkamar, who didn't.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_faith_duggins", id = TODO_NPC("Faith Duggins"), name = "Faith Duggins",
  bible = "bibles/uc_forever_folk.md", role = "scholar", tier = "quest",
  communities = { "undercity" }, temper = { "wry", "warm" }, values = { "curious", "loyal" },
  notices = { "class", "origin" },
  impression = {
    first = "Faith Duggins is a Forsaken mage who kept the name her mother gave her and finds the joke in it before anyone else can. She and Rakkamar stand together in the Magic Quarter and argue about names, the dead and the dark.",
    third = "{name} met Faith Duggins, a Forsaken mage in the Magic Quarter who kept her living name.",
  },

  greetings = {
    { id = "g_default", text = "Yes, it's Faith, and yes, I've heard every jest about it, so if you've a new one I'd like to hear it." },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, someone else to talk to. Rakkamar's been brooding at the wall for an hour and I've run out of ways to annoy him." },
  },

  notice = {
    { id = "n_dalaran", cat = "origin", when = { origin = "forsaken_dalaran_apprentice" },
      text = "You studied in Dalaran, didn't you? You've that tilt of the head the tutors beat into all of us. Which master did you have, before the city went under the dome?" },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A fellow mage. Come and stand with me, so Rakkamar's outnumbered for once." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Faith Duggins, mage, and a long way from the halls I trained in. Rakkamar and I mind this corner of the quarter, which mostly means we stand here and disagree about everything." },
        { id = "h_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "One of our living friends from across the sea. Welcome, and please don't take Rakkamar's glare personally, because he glares at everybody." },
      },
      again = {
        { id = "h_again", text = "What else? I'm in a talking mood, which you've probably noticed." },
        { id = "h_again2", text = "Ask away. Rakkamar's not listening, or he's pretending not to." },
      },
      choices = {
        { text = "Why keep your old name?", next = "name" },
        { text = "What do you and Rakkamar argue about?", next = "argue" },
        { text = "Where did you train?", next = "train" },
        { text = "Good evening, Faith.", next = "END" },
      },
    },

    name = {
      big = true,
      lines = { { id = "na_default", text = "My mother picked it, and she was a plain woman who didn't believe in much, so she must have hoped for something when she picked it. Plenty of us threw our names away when we woke up, and I understand why, but mine's the last thing she gave me." } },
      choices = {
        { text = "Keep it. The past is worth carrying.", next = "name_after", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A new life deserves a new name.", next = "name_after", fx = { align = { order = -1 } } },
        { text = "What did Rakkamar used to be called?", next = "rak_name" },
      },
    },
    rak_name = {
      lines = { { id = "rn_default", text = "He won't say, and I've tried everything short of a truth draught from the Apothecarium. I think it was something soft, a baker's name or a farmer's, and he'd rather die again than have me use it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name_after = {
      lines = { { id = "nf_default", text = "Well, you're entitled to your view, and so is Rakkamar, though his is wrong. Go and tell him what you think, if you like; it'll do him good to talk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    argue = {
      lines = { { id = "ar_default", text = "Names, and whether the dead should keep them, and demons, and whether a mage who calls one up is clever or just impatient. He studies the warlocks' books in the Rogues' Quarter, and I study the old Dalaran texts, and neither of us will give an inch." } },
      choices = {
        { text = "Who's winning?", next = "argue_win" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue_win = {
      lines = { { id = "aw_default", text = "Nobody wins, which is the point. When you've no sleep and no supper to look forward to, a good argument is about the only thing that makes the nights go by." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    train = {
      lines = {
        { id = "tr_default", text = "In Dalaran, as a girl, before the city shut itself under its dome and decided the Forsaken weren't welcome. I learned frost and fire there, and I've had to teach myself everything since." },
        { id = "tr_dalaran", when = { origin = "forsaken_dalaran_apprentice" }, text = "In Dalaran, the same as you, I'd guess. Do you ever stand on the hills in Silverpine and look at the dome, and wonder if your old room's still there?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Dalaran student, Lordaeron mage, plague victim, Forsaken. I'd rather talk about the first two." } },
    advice = { { id = "tp_ad", text = "Keep something from before, even if it's only a name. You'll want it on the bad nights." } },
    _none = { { id = "tp_none", text = "No idea, but give me a week and a library and I'll have an opinion on it." } },
  },
}

---------------------------------------------------------------------------
-- Rakkamar: took a hard new name when he woke, reads the warlocks' books, and broods beside Faith Duggins.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rakkamar", id = TODO_NPC("Rakkamar"), name = "Rakkamar",
  bible = "bibles/uc_forever_folk.md", role = "scholar", tier = "quest",
  communities = { "undercity" }, temper = { "cold", "proud" }, values = { "ambitious", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Rakkamar is a Forsaken caster who took a hard new name when he woke and will not say what the old one was. He reads the warlocks' books and treats Faith Duggins's teasing as a storm to be waited out.",
    third = "{name} met Rakkamar, a Forsaken caster in the Magic Quarter who refuses to speak his living name.",
  },

  greetings = {
    { id = "g_default", text = "If Faith sent you over to ask me my old name, the answer is the same as it was yesterday." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Speak, then, and make it worth the interruption." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Good, someone in this quarter who understands that power comes from somewhere, and that the somewhere is rarely pleasant." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "One of the Light-burned. I don't understand your kind, and I don't intend to, but the Dark Lady allows you, so I'll keep my opinions behind my teeth." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Rakkamar. That is the name I chose, and it is the only one you need, whatever my colleague tells you. I study what the mages are too squeamish to study, and I keep my own counsel about it." },
      },
      again = {
        { id = "h_again", text = "Is there more?" },
        { id = "h_again2", text = "Go on. I'm listening, against my better judgement." },
      },
      choices = {
        { text = "Why did you take a new name?", next = "name" },
        { text = "What do you study?", next = "study" },
        { text = "Faith seems fond of you.", next = "faith" },
        { text = "I'll leave you to your brooding.", next = "END" },
      },
    },

    name = {
      lines = { { id = "na_default", text = "Because the man who had the old one died screaming in a farmhouse while the grain rotted, and I see no reason to drag his name about with me. Whoever woke up in that ditch was someone new, so I named him something that doesn't flinch." } },
      choices = {
        { text = "Faith thinks you're wrong about that.", next = "faith" },
        { text = "Something else.", next = "BACK" },
      },
    },

    study = {
      lines = { { id = "st_default", text = "Binding, mostly, and the circles the warlocks in the Rogues' Quarter use to call their imps and their felhounds. I don't call anything myself, not yet, because I'd like to understand the leash before I hold one." } },
      choices = {
        { text = "Is that sort of power worth the risk?", next = "power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    power = {
      big = true,
      lines = { { id = "po_default", text = "The Scourge didn't ask whether it was worth the risk when they took us, and the Scarlets won't ask when they burn us. We need every weapon there is, and I'd sooner hold a dangerous one than lose with a clean one." } },
      choices = {
        { text = "Some weapons poison the hand that holds them.", next = "power_after", fx = { align = { light = 1 } } },
        { text = "You're right. Use whatever wins.", next = "power_after", fx = { align = { light = -1 } } },
      },
    },
    power_after = {
      lines = { { id = "pa_default", text = "So you have a view. Take it to Faith, she collects them, and she'll argue with it for a week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    faith = {
      lines = { { id = "fa_default", text = "She's fond of the sound of her own voice, and I happen to be standing near it. Still, she's the only one in this quarter who argues in good faith, and that's a rare habit among the dead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "There's nothing before Rakkamar worth telling, and I'll thank you not to ask Faith about it either." } },
    advice = { { id = "tp_ad", text = "Learn the leash before you hold it. Most people never learn that until it's around their own neck." } },
    _none = { { id = "tp_none", text = "I have no interest in that, and so no knowledge of it." } },
  },
}

---------------------------------------------------------------------------
-- Anya Rince: a runner between the Apothecarium and the Royal Quarter, discreet about what she carries.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_anya_rince", id = TODO_NPC("Anya Rince"), name = "Anya Rince",
  bible = "bibles/uc_forever_folk.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "guarded", "brisk" }, values = { "loyal", "discreet" },
  notices = { "rogue", "race" },
  impression = {
    first = "Anya Rince walks between the Apothecarium and the throne room with sealed papers under her arm and never says what is in them. She is polite in the way of someone who has been trained not to be interesting.",
    third = "{name} met Anya Rince, who carries sealed papers between the Apothecarium and the Royal Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Excuse me, I've a delivery for the Royal Quarter, so walk with me if you need something." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm on the same errand as last time, and the time before, so talk while I walk." },
  },

  notice = {
    { id = "n_rogue", cat = "rogue", when = { class = "ROGUE" },
      text = "Your eyes went straight to my satchel, rogue. It's sealed with the Society's wax and the Dark Lady's displeasure, so I'd look elsewhere." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "The apothecaries are always glad to see the living, you know. I'd be a little careful about how glad, if I were you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Anya Rince, and I carry papers from the Apothecarium to the Royal Quarter and back, sealed, every hour the city's awake, which is every hour. I don't open them, and I don't talk about them, and that's why I still have the job." },
      },
      again = {
        { id = "h_again", text = "Anything else? We're nearly at the bridge." },
        { id = "h_again2", text = "Quickly, please. The Royal Quarter doesn't like to wait." },
      },
      choices = {
        { text = "What's in the papers?", next = "papers" },
        { text = "Who reads them?", next = "readers" },
        { text = "What's the Apothecarium like?", next = "apoth" },
        { text = "I won't keep you.", next = "END" },
      },
    },

    papers = {
      big = true,
      lines = { { id = "pa_default", text = "Ink, mostly, and wax, and none of my business. The last runner who got curious isn't a runner any more, and I've no wish to learn what he is instead." } },
      choices = {
        { text = "Secrets keep this city alive. You're right to keep them.", next = "papers_after", fx = { align = { honor = -1 } } },
        { text = "The people have a right to know what's being done.", next = "papers_after", fx = { align = { honor = 1 } } },
        { text = "What happened to the last runner?", next = "runner" },
      },
    },
    runner = {
      lines = { { id = "ru_default", text = "He stopped coming to work, and then his room in the Canals was let to someone else, and nobody asked. That's all I know, and it's more than I'd like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    papers_after = {
      lines = { { id = "pf_default", text = "Say that up there and see who agrees with you. I only carry the satchel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    readers = {
      lines = { { id = "re_default", text = "They go to the throne room, and what happens there isn't mine to see. Master Apothecary Faranell signs them, and someone above him reads them, and that's as far up the stairs as my thoughts go." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    apoth = {
      lines = { { id = "ap_default", text = "Hot, and loud, and full of things in jars that are still moving. The apothecaries are good to me, in their way, because I'm quick and I'm quiet, but I don't linger near the cages." } },
      choices = {
        { text = "What's in the cages?", next = "cages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cages = {
      lines = { { id = "ca_default", text = "Whatever the Deathstalkers bring back, Scarlets and Scourge and the odd unlucky trapper from Hillsbrad. I walk past them, and I don't look, and that's the only advice I'll give you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I ran errands in life and I run them now. The stairs are longer." } },
    advice = { { id = "tp_ad", text = "Carry what you're given and don't open it. It's kept me whole so far." } },
    _none = { { id = "tp_none", text = "I don't know, and I'm late, so you'll have to ask someone who isn't." } },
  },
}

---------------------------------------------------------------------------
-- Chadsworth: a noble house's valet in life, who now keeps the War Quarter officers' kit in order.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_chadsworth", id = TODO_NPC("Chadsworth"), name = "Chadsworth",
  bible = "bibles/uc_forever_folk.md", role = "worker", tier = "quest",
  communities = { "undercity" }, temper = { "formal", "dry" }, values = { "order", "loyal" },
  notices = { "gear", "race" },
  impression = {
    first = "Chadsworth was a valet to a noble house in Lordaeron and has carried his manners into the grave and out again. He keeps the War Quarter officers' boots and buckles in order and judges everyone's polish.",
    third = "{name} met Chadsworth, a Forsaken valet who keeps the War Quarter's officers turned out properly.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. Do mind the boots by the wall, if you would, as they've only just been blacked." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned, and in the same state as before, I see. One does what one can." },
  },

  notice = {
    { id = "n_broken", cat = "gear", when = { durability = { max = 30 } },
      text = "Forgive me, but your armour is in a shocking condition. I don't mend steel myself, but the smiths across the quarter do, and I'd go to them before you go anywhere else." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "I confess I've never valeted for anyone with hooves, and I find myself wondering how one would black them. Don't let me detain you with it." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Chadsworth, at your service, though strictly speaking I'm at the service of the officers of the War Quarter. I was valet to a house of some standing in the capital, and I find that a man can lose his pulse without losing his standards." },
      },
      again = {
        { id = "h_again", text = "Was there something further?" },
        { id = "h_again2", text = "Yes? I'm listening, though I'll keep polishing, if you don't mind." },
      },
      choices = {
        { text = "Which house did you serve?", next = "house" },
        { text = "Why bother with polish down here?", next = "polish" },
        { text = "What are the officers like?", next = "officers" },
        { text = "Carry on, Chadsworth.", next = "END" },
      },
    },

    house = {
      lines = { { id = "ho_default", text = "A good house, with a fine name I'll keep to myself, because the family that bore it didn't survive the plague in any state I'd care to describe. A gentleman's gentleman doesn't gossip about his employers, even when they're ghouls." } },
      choices = {
        { text = "You still serve them, in a way.", next = "serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    serve = {
      big = true,
      lines = { { id = "se_default", text = "I serve the officers now, and through them the Dark Lady, which is an advancement of sorts. Though there are nights, I'll own, when I wonder whether a man ought to serve anyone at all, having died once already for his betters." } },
      choices = {
        { text = "Service is an honour. You keep this place standing.", next = "serve_after", fx = { align = { order = 1 } } },
        { text = "You've served enough. Live for yourself now.", next = "serve_after", fx = { align = { order = -1 } } },
      },
    },
    serve_after = {
      lines = { { id = "sa_default", text = "A kind thought, whichever way you meant it. I'll consider it while I do the buckles." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    polish = {
      lines = { { id = "po_default", text = "Because a soldier who looks like a corpse will fight like one, and we have quite enough of those wandering the ruins above us. A shine on the boots reminds a man he was a man, and I'm told it frightens the Scarlets, which is a pleasant bonus." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    officers = {
      lines = { { id = "of_default", text = "Diligent, mostly, and dreadful about their cuffs. The paladins who've lately come back to the Light are the worst, as they insist on polishing their own armour and getting it wrong, but I suppose that's piety for you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "In service, in the capital, for a house I'll not name. Then a brief interruption, and now in service again." } },
    advice = { { id = "tp_ad", text = "Black your boots the night before. One never knows what the morning will bring, and one ought to meet it shod." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my station. The officers might know, if they'd stop fussing with their swords long enough to ask." } },
  },
}

---------------------------------------------------------------------------
-- Zeglo Kruptorr: a warlock's acolyte in the Rogues' Quarter, who feeds the trainers' imps and resents it.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_zeglo", id = TODO_NPC("Zeglo Kruptorr"), name = "Zeglo Kruptorr",
  bible = "bibles/uc_forever_folk.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "sour", "ambitious" }, values = { "ambitious", "cunning" },
  notices = { "class", "pet" },
  impression = {
    first = "Zeglo Kruptorr is a warlock's acolyte in the Rogues' Quarter who spends his nights feeding other people's imps and resenting every minute of it. He is sure he is meant for greater things and keeps a list of the people who disagree.",
    third = "{name} met Zeglo Kruptorr, an ambitious warlock's acolyte in the Rogues' Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Don't step in the chalk. If you scuff that circle I'll have to draw it again, and I'll remember your face while I do it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The imps have been fed, the circles drawn, and I'm still not a master, in case you were wondering." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock with a pact of your own already. I'll admit I'm jealous, and I'll admit nothing else." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp's looking at my chalk. Tell it that if it so much as breathes on that circle, I'll feed it to the felhound." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Zeglo Kruptorr, acolyte of the dark arts, which in practice means I feed the trainers' imps and redraw the circles they scorch. One day I'll have a pact of my own, and then we'll see who's scrubbing chalk." },
      },
      again = {
        { id = "h_again", text = "What else? The imps need feeding at the bell." },
        { id = "h_again2", text = "Go on, I've a minute before something catches fire." },
      },
      choices = {
        { text = "What do imps eat?", next = "imps" },
        { text = "Why haven't you made a pact yet?", next = "pact" },
        { text = "Why come to the dark arts at all?", next = "why" },
        { text = "Mind the chalk. Goodbye.", next = "END" },
      },
    },

    imps = {
      lines = { { id = "im_default", text = "Anything, and that's the trouble, because they'll eat your sleeve if you don't give them something better. Mostly I give them scraps from the Apothecarium's bins, and they complain about the flavour, which is rich coming from a creature that eats sleeves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pact = {
      lines = { { id = "pa_default", text = "Because the trainers say I'm too eager, which is a strange complaint to make of a warlock. They want me to learn patience first, and I keep telling them I've been dead for a year and I'm patient enough." } },
      choices = {
        { text = "Maybe they're right to make you wait.", next = "pact_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pact_wait = {
      big = true,
      lines = { { id = "pw_default", text = "Right? The Scourge is a day's walk from here and the Scarlets are closer than that, and the trainers want me sweeping. A demon on a leash is a demon fighting for us, and every night I wait is a night we're weaker." } },
      choices = {
        { text = "Power taken in a hurry will take you back.", next = "pact_after", fx = { align = { order = 1 } } },
        { text = "Then stop waiting and take what you're owed.", next = "pact_after", fx = { align = { order = -1 } } },
      },
    },
    pact_after = {
      lines = { { id = "pf_default", text = "Easy for you to say, standing there with your hands clean of chalk. I'll add your opinion to the others." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = { { id = "wh_default", text = "Because nothing I was in life did me any good when the plague came, and the Light certainly didn't. When I woke up I wanted a power that answers back, and the fel answers, loudly and at once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was nobody in life, and I'll be somebody in death. That's all the background you need." } },
    advice = { { id = "tp_ad", text = "Never let an imp near your sleeves. Or your notes. Or your hair, if you've any left." } },
    _none = { { id = "tp_none", text = "I don't know, and I've no time to find out. Ask a master; they've time for everything except teaching me." } },
  },
}
