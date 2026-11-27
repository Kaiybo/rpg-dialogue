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
  notices = { "race", "rogue", "profession" },
  impression = {
    first = "She talks about the canal slime as if it were a neighbour.",
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
    { id = "n_fisher", cat = "profession", when = { profession = "Fishing" },
      text = "That's a fishing pole on your back. Don't cast it here, please, because the only thing that bites in this water is the water." },
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
        { id = "h_again3", text = "Go on, I'm listening. Something's coming down from the Apothecarium end, but it's slow." },
      },
      choices = {
        { text = "What do you find in there?", next = "finds" },
        { text = "Where does all this green water come from?", next = "water" },
        { text = "What did you do before all this?", next = "before" },
        { text = "Who else works the Canals?", next = "neighbours" },
        { text = "You fish with a pole and a bent nail.", next = "pole" },
        { text = "I fish too. Is there anything alive in there?", next = "fisher", when = { profession = "Fishing" } },
        { text = "I've dropped a few knives in canals myself.", next = "knives", when = { class = "ROGUE" } },
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
    pole = {
      lines = { { id = "pl_default", text = "A pole, a bent nail and a ladle tied on for the small things. Armand Cromwell teaches proper fishing over in the Magic Quarter, and he came to look at my rig once, and he went away without saying anything at all." } },
      choices = {
        { text = "Did he offer you a better one?", next = "pole2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pole2 = {
      lines = { { id = "pl2_default", text = "He sent Lizbeth Cromwell round with a real hook and a length of good line, and I thanked her. The hook's too sharp, though, because it goes straight through a glove or a purse, so I keep it in the sack with the other nice things." } },
      choices = {
        { text = "So the canal even gave you a hook.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fisher = {
      lines = { { id = "fs_default", text = "Nothing with eyes, not for a long while. There were blind white eels when we first came down, and the abominations ate them, or the slime did. If you want fish, Armand will send you up to the lake in Tirisfal, where they're only a little wrong." } },
      choices = {
        { text = "I'll leave your water to you, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives = {
      lines = { { id = "kn_default", text = "I thought you might have. I've eleven knives in the sack, and four of them are a matching set with a snake on the hilt, which came down one after another over a single week. Somebody in the Rogues' Quarter had a very busy week." } },
      choices = {
        { text = "Would you sell the set?", next = "knives2" },
        { text = "I'd not ask whose they were.", next = "knives2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives2 = {
      lines = { { id = "kn2_default", text = "I don't sell things that might be looked for, and I don't ask either, because Mennet Carkad's people walk this stretch and they've always been civil. If a matching set ever needs to come back up quietly, they know where I sit." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Kitchen girl in the palace, then dead, then this. The middle part I'd rather not go over." } },
    advice = { { id = "tp_ad", text = "Hold on to your things. Everything ends up in the canal eventually, and most of it never comes out again." } },
    forsaken = { { id = "tp_fs", text = "We're the things the kingdom dropped, I think. Somebody fished us out, and I've tried to do the same for the buttons." } },
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
  notices = { "race", "class", "profession" },
  impression = {
    first = "She is very careful not to know what goes in her casks.",
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
    { id = "n_eng", cat = "profession", when = { profession = "Engineering" },
      text = "You're an engineer, I can smell the oil. Don't talk to me about your iron drums, because a keg has to breathe a little and a drum can't." },
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
        { id = "h_again3", text = "Ask, then, but mind your fingers near that mallet." },
      },
      choices = {
        { text = "Who buys your barrels?", next = "buyers" },
        { text = "What's the magic in the hoops?", next = "ward" },
        { text = "How did you learn the trade?", next = "trade" },
        { text = "Alyz could use a barrel, she says.", next = "alyz" },
        { text = "You're short of good oak, by the look of it.", next = "wood" },
        { text = "I could set a stronger seal on these hoops.", next = "mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Do the alchemists buy from you as well?", next = "alch", when = { profession = { "Alchemy", "Herbalism" } } },
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
    wood = {
      lines = { { id = "wd_default", text = "I am, and I'll thank you not to say it so loudly. The oak comes down from Silverpine when the carts get past the worgen, and when they don't, I make do with Tirisfal pine, which weeps resin and warps in a month." } },
      choices = {
        { text = "Who brings the carts through?", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      lines = { { id = "wd2_default", text = "Deathguards out of the Sepulcher, when they can be spared, and they can't often. Sydney Upton in the Magic Quarter gets his staff wood on the same carts, and we've come near to blows over a single good plank, which is a foolish thing for two corpses to do." } },
      choices = {
        { text = "Who won the plank?", next = "BACK", reply = "We sawed it in half, and neither of us could use it. That's partnership for you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mg_default", text = "Could you, now? Mine's a pedlar's charm, good for wine and pitch, and I've often thought it wouldn't hold if the apothecaries put in anything truly eager to get out. Show me how you'd lay it, and I'll tell you whether the iron will take it." } },
      choices = {
        { text = "Lay it along the hoop, not the stave.", next = "mage2" },
        { text = "On second thought, yours is sound enough.", next = "mage2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage2 = {
      lines = { { id = "mg2_default", text = "Hm. I'll try it on the next cask and see whether it sweats. If you want a proper opinion, ask Bethor Iceshard's people up the stair, though they'll want to know why a cooper needs a ward that strong, and I've no good answer for them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    alch = {
      lines = { { id = "ac_default", text = "The small kegs, yes, for their mixing. Doctor Martin Felben's students take a dozen a month, and Martha Alliestar wants hers lined with wax so the herbs don't sour. They're honest customers, the pair of them, and I always know what's going in." } },
      choices = {
        { text = "That must be a relief, after the others.", next = "BACK", reply = "It is. I sleep better for a keg of peacebloom, or I would if I slept.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Cooper's daughter, cooper's trade, cooper still. Dying didn't change that much." } },
    advice = { { id = "tp_ad", text = "Never trust a barrel you didn't watch being sealed. That goes for most things in this city." } },
    trade = { { id = "tp_tr", text = "Oak where I can get it, Tirisfal pine where I can't, and iron hoops from the War Quarter smiths. Then a little charm, and it's done." } },
    forsaken = { { id = "tp_fs", text = "We kept our trades when we lost everything else. I'd be a poor sort of dead woman without mine." } },
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
    first = "His feet have not forgotten the watchman's beat he walked in life.",
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
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk too quietly for my liking. I had a sergeant who said the quiet ones were either thieves or scouts, and he was right both times." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Malus. I walked the night watch in the capital up there, Canal Gate to the barracks and back, and when I woke up dead I found my feet still knew the way, so I let them carry on." },
        { id = "h_soldier", when = { origin = { "forsaken_lordaeron_soldier", "forsaken_hillsbrad_militia" } }, text = "Malus, of the old night watch. You've carried a pike yourself, I can see it in your shoulders, so you'll understand a man who keeps to his round when there's nobody left to order it." },
      },
      again = {
        { id = "h_again", text = "Keep up, then. What else?" },
        { id = "h_again2", text = "We're coming round to the War Quarter again. Ask your question." },
        { id = "h_again3", text = "Mind the abomination, he's slow to turn. What else did you want to know?" },
      },
      choices = {
        { text = "Why keep walking it?", next = "why" },
        { text = "You were in the city watch?", next = "watch" },
        { text = "What do you see on your round?", next = "round" },
        { text = "You pass the abominations every lap.", next = "aboms" },
        { text = "The War Quarter is the end of your round.", next = "warq" },
        { text = "I stood a watch once, too.", next = "soldier", when = { origin = { "forsaken_lordaeron_soldier", "forsaken_hillsbrad_militia" } } },
        { text = "Does Bandarion Keep need watchmen?", next = "keep", when = { class = "PALADIN", race = "Scourge" } },
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
    aboms = {
      lines = { { id = "ab_default", text = "Every lap, and they've stopped looking at me. They walk a round the same as I do, only theirs was stitched into them by the apothecaries, and mine I chose. I'd not call them comrades, but we give each other room on the bridges." } },
      choices = {
        { text = "Do they trouble anyone?", next = "aboms2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aboms2 = {
      lines = { { id = "ab2_default", text = "Only those who ought to be troubled. I saw one lift a Scarlet spy off the stair by his head last spring, and it set him down again in two places. The old watch would have wanted a magistrate first, and I'm still deciding how I feel about that." } },
      choices = {
        { text = "A spy forfeits his magistrate.", next = "aboms3" },
        { text = "The old watch had it right.", next = "aboms3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aboms3 = {
      lines = { { id = "ab3_default", text = "That's one way to see it, and I've heard the other from better men than me. I'll walk on it a while. Most things come clear by the War Quarter stair, and the ones that don't, I walk round again." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    warq = {
      lines = { { id = "wq_default", text = "It is, and I slow down there, I'll admit. Angela Curthas drills her warriors by the forges and Baltus Fowler shouts at his, and it's the nearest thing this city has to a barracks square at dawn." } },
      choices = {
        { text = "You could join them.", next = "warq2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warq2 = {
      lines = { { id = "wq2_default", text = "Fowler's asked, twice. I told him I was a watchman and not a soldier, and that there's a difference, because a soldier goes out to find trouble and a watchman stays where folk are sleeping. Somebody ought to stay." } },
      choices = {
        { text = "The city's better for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "I knew it. Where did they post you? No, don't say, it'll be a wall that isn't there now. I only ask whether you still wake at the hour your watch began, because I do, every night, and I don't even sleep." } },
      choices = {
        { text = "Every night, at the second bell.", next = "BACK", reply = "Aye. Then walk a lap with me when it takes you, and we'll call it a relief of the guard.", fx = { affinity = 1 } },
        { text = "No. I left that life in the ground.", next = "BACK", reply = "Then you're the wiser of us. I couldn't leave it if I tried." },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "kp_default", text = "They've their own squires on the walls out there, and they're keen enough. But Garek was watch before he was anything, and if his keep ever wants an old hand to show the young ones how a round is walked, they know which canal to send to." } },
      choices = {
        { text = "I'll tell them at the keep.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "City watch, nights, the Canal Gate beat. Then the prince came home." } },
    advice = { { id = "tp_ad", text = "Know your way back. Wherever you go, know the way back, and walk it now and then." } },
    lordaeron = { { id = "tp_lord", text = "I knew every street of it by lamplight. The streets are still up there, under the ash, and I've never once gone to look." } },
    arthas = { { id = "tp_arthas", text = "I cheered him through the gate. I'll say that much and no more." } },
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
    first = "She would like her brother Victor mentioned less often.",
    third = "{name} met Angela Ward, who sells tailoring patterns in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You've come back! I've a new pattern for a wool reagent bag, and I'd like your thoughts before Victor sees it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. If you've come to ask after my brother, I'd rather you bought something and went." },
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
    w3_soul = {
      lines = {
        { id = "w3_soul_1", text = "They need a pouch for their soul shards, lined twice and stitched tight, because a shard rolling loose at the bottom of a satchel unsettles everything else in there. I sell the pattern to tailors and make them swear not to sew it with cheap thread, since a shard can cut through cheap thread in a week." },
        { id = "w3_soul_2", when = { class = "WARLOCK" }, text = "You'll want a soul pouch, lined twice and stitched tight, since I can see a shard clinking against your flask from here. Find a tailor who'll use good thread, or the shard will cut its way out by the end of the month." },
      },
      choices = {
        { text = "What does a loose shard do?", next = "w3_loose" },
        { text = "I sew these myself.", next = "BACK", when = { profession = "Tailoring" }, reply = "Then use the doubled silk, not the linen, and don't skimp at the corners. That's where they always break." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_loose = {
      lines = {
        { id = "w3_loose_1", text = "It whispers, or so the warlocks tell me, and it whispers to whatever is near it. One of Luther Pickman's students kept his loose with his rations, and he swore the bread tasted of sorrow for a month afterwards." },
      },
      choices = {
        { text = "I'll keep my bread elsewhere. Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Angela Ward. I sell patterns, not finished bags, because a bag you've sewn yourself is a bag you'll know how to mend. Every mage and apothecary in this quarter needs somewhere to keep their bits, and I tell them how to make it." },
      },
      again = {
        { id = "h_again", text = "Something more? I've patterns to sort, and Victor's humming through the wall again." },
        { id = "h_again2", text = "Yes? Ask, and then buy something, if you would." },
      },
      choices = {
        { text = "A tailor should sell only patterns she's stitched herself.", next = "BACK", reply = "That's my rule exactly, and I wish Victor kept it as well as I do.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Copy any pattern that sells. The original tailor won't know.", next = "BACK", reply = "They always know, and they tell everyone else in the Quarter too.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why reagent bags?", next = "bags" },
        { text = "Are you related to Victor Ward?", next = "victor" },
        { text = "What about Carolyn Ward, in the Rogues' Quarter?", next = "carolyn" },
        { text = "Show me your patterns.", next = "BUSINESS" },
        { text = "Who did you sew for in the capital?", next = "capital" },
        { text = "Any advice for a fellow tailor?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "I keep my reagents loose in my robes.", next = "caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Do warlocks need a special sort of bag?", next = "w3_soul" },
        { text = "Good day.", next = "END" },
      },
    },

    bags = {
      lines = { { id = "ba_default", text = "Because the mages in this quarter carry their reagents loose in their robes like children with sweets, and then wonder why they can't find a pinch of anything in a fight. A proper bag with proper pockets saves lives, and I'll not hear otherwise." } },
      choices = {
        { text = "How many pockets does a mage need?", next = "bags_pockets" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bags_pockets = {
      lines = { { id = "bp_default", text = "One more than they think, and every one lined, because powders find any gap and then you've a robe that sneezes. The warlocks want an extra pocket for their shards, and I've stopped asking why it has to be so deep." } },
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
    capital = {
      lines = { { id = "cp_default", text = "For the palace, in the end, though only for the servants, since the royal tailors wouldn't have let us near the king's own coats. Victor and I sewed liveries for the footmen and the pages, blue and gold, three hundred of them a year." } },
      choices = {
        { text = "What was the last thing you sewed there?", next = "capital_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    capital_last = {
      lines = { { id = "cl_default", key = true, fx = { learn = { "arthas" } }, text = "New liveries for the prince's homecoming, because the whole court was to line the road and cheer him in from Northrend. We finished the last of them the night before, and the pages wore them at the gate when he came through." } },
      choices = {
        { text = "That must be a hard thing to remember.", next = "capital_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    capital_pride = {
      big = true,
      lines = { { id = "cr_default", text = "It was the finest work we ever did, and the pages looked splendid, and I've never known what to do with that. Victor says to be proud of the stitches and forget the occasion, and some nights I manage it." } },
      choices = {
        { text = "Good work is good work. Be proud of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn the memory. That day deserves nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "ta_default", text = "Wash your linen before you cut it, because it shrinks, and nobody believes me until their first shirt fits a gnome. And buy your thread from someone who isn't my brother, because he'll talk your ear off while he's measuring it." } },
      choices = {
        { text = "Thank you, Angela. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = { { id = "cs_default", text = "Of course you do, and I'd wager there's a pinch of something in your boot as well. Buy a pattern, sew a bag, and let your robes be robes again, for pity's sake." } },
      choices = {
        { text = "Fine. Show me the pattern.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    arthas = { { id = "tp_arthas", next = "capital_last", text = "I sewed the pages' liveries for his homecoming. I'd rather not say more than that." } },
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
    first = "She finds the joke in her own name before anyone else can.",
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
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Rakkamar will be pleased, and I'll hear about it for a week. Do me a kindness and tell him one thing that went badly for you, just for balance." },
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
        { id = "h_again3", text = "Go on, I've an hour before the next lecture upstairs, and nobody's asked me anything interesting all night." },
      },
      choices = {
        { text = "Why keep your old name?", next = "name" },
        { text = "What do you and Rakkamar argue about?", next = "argue" },
        { text = "Where did you train?", next = "train" },
        { text = "What do you study now?", next = "study" },
        { text = "You stand guard over a quiet corner.", next = "corner" },
        { text = "Which Dalaran master taught you?", next = "master", when = { class = "MAGE" } },
        { text = "I had rooms near the Violet Citadel.", next = "rooms", when = { origin = "forsaken_dalaran_apprentice" } },
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
      lines = { { id = "ar_default", text = "Names, and whether the dead should keep them, and demons, and whether a mage who calls one up is clever or just impatient. He studies the warlocks' books in the Magic Quarter, and I study the old Dalaran texts, and neither of us will give an inch." } },
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
    study = {
      lines = { { id = "sy_default", text = "Wards, lately. The Scarlets have priests who can unpick a mage's shield in the time it takes to say a prayer, and Bethor Iceshard wants something that holds longer. I've been through every Dalaran text the city has, which took a fortnight." } },
      choices = {
        { text = "Only a fortnight?", next = "study2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study2 = {
      lines = { { id = "sy2_default", text = "There are eleven of them, and two are cookery. The Kirin Tor took their library behind the dome, and what we have was carried out in satchels by students like me, who grabbed whatever was on the desk. I saved a treatise on frost and half a novel." } },
      choices = {
        { text = "How does the novel end?", next = "study3" },
        { text = "The frost treatise was the better choice.", next = "study3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study3 = {
      lines = { { id = "sy3_default", key = true, text = "I've no idea how it ends, and it's the great sorrow of my death. Jorah Annison, the cartographer, has read my half four times and has three theories. If you ever find the rest of The Shepherdess of Darrowmere, bring it here before you bring it anywhere." } },
      choices = {
        { text = "I'll keep an eye out for it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    corner = {
      lines = { { id = "co_default", text = "Quiet is generous. We watch who goes up to the mage trainers and who goes down to the warlocks, and we tell Bethor if anyone looks lost in a way that seems deliberate. Mostly it's students who can't find Hannah Akeley's reagent stall." } },
      choices = {
        { text = "Has anyone ever looked deliberately lost?", next = "corner2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corner2 = {
      lines = { { id = "co2_default", text = "One, last winter. A living man in a hood asked me the way to the summoning circles and called me miss, and no Forsaken has called me miss since I died. Rakkamar walked him to the Deathguard without a word, and I'll admit he was rather splendid about it." } },
      choices = {
        { text = "You should tell him so.", next = "BACK", reply = "Absolutely not. He'd be unbearable, and I've a long time yet to stand next to him.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = { { id = "ma_default", text = "Old Archmage Tervosh's circle, for a term, before he went off across the sea with Lady Proudmoore, and then a succession of tutors who all taught frost as if fire were a personal failing. Who has you now, Kaelystia or Pierce?" } },
      choices = {
        { text = "Kaelystia. She's exacting.", next = "BACK", reply = "She is, and she's right nearly every time, which is the tiresome part. Learn her wards and you'll outlive me." },
        { text = "Pierce. He talks more than he teaches.", next = "BACK", reply = "He does, but listen to the talk. Half of what I know about the Scarlets' priests came out of his grumbling." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rooms = {
      lines = { { id = "rm_default", text = "Did you! Then we ate at the same pie stall, I'm certain of it, the one with the awning by the fountain. I think about that stall more than I think about the Citadel, which says little for my scholarship." } },
      choices = {
        { text = "The mutton pie. I remember it.", next = "BACK", reply = "The mutton pie! Oh, don't. Rakkamar, this one remembers the pies. No, he's pretending not to hear.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Dalaran student, Lordaeron mage, plague victim, Forsaken. I'd rather talk about the first two." } },
    advice = { { id = "tp_ad", text = "Keep something from before, even if it's only a name. You'll want it on the bad nights." } },
    dalaran = { { id = "tp_dal", text = "They shut the dome and left us outside it. I understand why, and I still look for my old window every time I'm in Silverpine." } },
    kirin_tor = { { id = "tp_kt", text = "They taught me everything I know and then decided I was a hazard. I'd like to say I've forgiven them, and some days I very nearly have." } },
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
    first = "He will not say what his name was before he woke.",
    third = "{name} met Rakkamar, a Forsaken caster in the Magic Quarter who refuses to speak his living name.",
  },

  greetings = {
    { id = "g_default", text = "If Faith sent you over to ask me my old name, the answer is the same as it was yesterday." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Speak, then, and make it worth the interruption." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You have the smell of the circle on you. Stand here a moment, then, since you may actually have something to say." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Good, someone in this quarter who understands that power comes from somewhere, and that the somewhere is rarely pleasant." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "One of the Light-burned. I don't understand your kind, and I don't intend to, but the Dark Lady allows you, so I'll keep my opinions behind my teeth." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another mage. I suppose she waved you over. Understand that I am outnumbered in this corner only by count." },
  },

  start = "hello",
  nodes = {
    w3_zeglo = {
      lines = {
        { id = "w3_zeglo_1", text = "He is impatient, resentful and far too eager, which describes nearly every warlock who ever amounted to anything, and most who were eaten. Whether he's the first sort or the second depends entirely on whether he learns to wait, and I doubt he will." },
      },
      choices = {
        { text = "You could teach him patience.", next = "w3_teach" },
        { text = "He keeps a list of those who wrong him.", next = "BACK", reply = "I know; I'm on it. I'm told I'm near the top, which I take as evidence of good judgement on his part." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_teach = {
      lines = {
        { id = "w3_teach_1", text = "I could, and he would hate me for it, and he would learn. Perhaps I will, one day, when he has drawn his thousandth circle and finally stopped admiring it." },
      },
      choices = {
        { text = "He'd be lucky to have you. Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Rakkamar. That is the name I chose, and it is the only one you need, whatever my colleague tells you. I study what the mages are too squeamish to study, and I keep my own counsel about it." },
      },
      again = {
        { id = "h_again", text = "Is there more? Then say it, and briefly." },
        { id = "h_again2", text = "Go on. I'm listening, against my better judgement." },
        { id = "h_again3", text = "You are persistent. That is not a compliment, though it is not quite a complaint." },
      },
      choices = {
        { text = "Why did you take a new name?", next = "name" },
        { text = "What do you study?", next = "study" },
        { text = "Faith seems fond of you.", next = "faith" },
        { text = "Whose books are you reading?", next = "books" },
        { text = "You and Faith watch this corner together.", next = "corner" },
        { text = "I already hold a demon's leash. It pulls back.", next = "leash", when = { class = "WARLOCK" } },
        { text = "What do you make of Zeglo Kruptorr?", next = "w3_zeglo" },
        { text = "I'll leave you to your brooding.", next = "END" },
      },
    },

    name = {
      lines = { { id = "na_default", text = "Because the man who had the old one died screaming in a farmhouse while the grain rotted, and I see no reason to drag his name about with me. Whoever woke up afterwards was someone new, so I named him something that doesn't flinch." } },
      choices = {
        { text = "Faith thinks you're wrong about that.", next = "faith" },
        { text = "Something else.", next = "BACK" },
      },
    },

    study = {
      lines = { { id = "st_default", text = "Binding, mostly, and the circles the warlocks in the Magic Quarter use to call their imps and their felhounds. I don't call anything myself, not yet, because I'd like to understand the leash before I hold one." } },
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
        { text = "You're right. Use whatever wins the fight.", next = "power_after", fx = { align = { light = -1 } } },
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
    books = {
      lines = { { id = "bk_default", text = "Richard Kerwin lends me what he judges I can be trusted with, which is less than I can read. Luther Pickman lends nothing, and tells me that a book borrowed is a lesson unearned. I copy what I can and return it clean." } },
      choices = {
        { text = "And what won't they lend?", next = "books2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books2 = {
      lines = { { id = "bk2_default", text = "The true names. Carendin Halgar keeps those, and he is right to, because a name read by the unready is an invitation. I have told the sour little acolyte Kruptorr the same thing, and he hears it no better from me than from his masters." } },
      choices = {
        { text = "You sound more patient than he is.", next = "BACK", reply = "I am more afraid than he is. In this art the two look alike, and only one of them is alive at the end.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    corner = {
      lines = { { id = "cr_default", text = "Bethor Iceshard set us here, a mage and a student of the other art, so that whoever comes down this stair is seen by both kinds of eye. It is a sensible arrangement, and I would have preferred a quieter half of it." } },
      choices = {
        { text = "She says you marched a spy off, once.", next = "corner2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corner2 = {
      lines = { { id = "cr2_default", text = "He called her miss, and he asked for the circles before he asked for the trainers. A student wants a teacher first, and only a thief wants the tools. I did what the post required, and she has not let the matter rest since." } },
      choices = {
        { text = "She thought you were splendid.", next = "BACK", reply = "She said that? Then she has said it to you and not to me, which is exactly like her.", fx = { affinity = 1 } },
        { text = "Sound reasoning.", next = "BACK", reply = "It was merely observation. Most people do not trouble to make any." },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash = {
      lines = { { id = "ls_default", text = "Then tell me something no book will. When you first held it, did the creature test you at once, or did it wait until you were tired?" } },
      choices = {
        { text = "At once. It was whispering my name within the hour.", next = "leash2" },
        { text = "It waited. The clever ones always wait for weakness.", next = "leash2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash2 = {
      lines = { { id = "ls2_default", text = "That agrees with Kerwin, and contradicts two of the texts, which I shall mark accordingly. I am obliged to you. When I draw my own circle at last, I intend that nothing in it shall surprise me, and you have removed one surprise." } },
      choices = {
        { text = "Something always surprises you. Make sure it isn't fatal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "There's nothing before Rakkamar worth telling, and I'll thank you not to ask Faith about it either." } },
    advice = { { id = "tp_ad", text = "Learn the leash before you hold it. Most people never learn that until it's around their own neck." } },
    burning_legion = { { id = "tp_legion", text = "They made the Scourge and the Scourge made us, so I owe them a debt. I intend to pay it with their own servants." } },
    scourge = { { id = "tp_scourge", text = "I remember being one of them, in pieces, like a fever. Nothing a demon whispers is worse than that voice was." } },
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
  notices = { "rogue", "race", "class" },
  impression = {
    first = "She is polite like someone trained not to be interesting.",
    third = "{name} met Anya Rince, who carries sealed papers between the Apothecarium and the Royal Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Excuse me, I've a delivery for the Royal Quarter, so walk with me if you need something." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm on the same errand as last time, and the time before, so talk while I walk." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "You've an apothecary's stains on your fingers. Then you'll know better than to ask what I'm carrying." },
  },

  notice = {
    { id = "n_rogue", cat = "rogue", when = { class = "ROGUE" },
      text = "Your eyes went straight to my satchel, rogue. It's sealed with the Society's wax and the Dark Lady's displeasure, so I'd look elsewhere." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "The apothecaries are always glad to see the living, you know. I'd be a little careful about how glad, if I were you." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Father Lankester sends sealed notes up the same stair, now and then, and they're the only ones that don't make my hands feel odd." },
  },

  start = "hello",
  nodes = {
    w3_seal = {
      lines = {
        { id = "w3_seal_1", text = "I stop where I am and stand still, and I don't look at the paper, and I send the nearest Deathguard for an apothecary to collect it. It happened once, in a rainstorm that came down the stairs from the ruins, and I stood by the bank for an hour without moving my eyes." },
      },
      choices = {
        { text = "And nobody blamed you?", next = "w3_blame" },
        { text = "An hour without looking? I couldn't.", next = "BACK", reply = "Then you'd not keep this post a week. The not looking is the whole of the job; the walking is the easy part." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_blame = {
      lines = {
        { id = "w3_blame_1", text = "They thanked me, and gave me a new satchel with a better flap, and the apothecary who came took the papers and never said a word. I've wondered since what would have happened if I had read them, and I've decided I'd rather keep wondering." },
      },
      choices = {
        { text = "Wise of you. Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Anya Rince, and I carry papers from the Apothecarium to the Royal Quarter and back, sealed, every hour the city's awake, which is every hour. I don't open them, and I don't talk about them, and that's why I still have the job." },
      },
      again = {
        { id = "h_again", text = "Anything else? We're nearly at the bridge." },
        { id = "h_again2", text = "Quickly, please. The Royal Quarter doesn't like to wait." },
        { id = "h_again3", text = "One more, then. The guards at the stair know my step, and they notice when it's late." },
      },
      choices = {
        { text = "What's in the papers?", next = "papers" },
        { text = "Who reads them?", next = "readers" },
        { text = "What's the Apothecarium like?", next = "apoth" },
        { text = "You walk this route as if it's worn in.", next = "route" },
        { text = "The Royal Quarter must be a hard place to wait.", next = "royal" },
        { text = "I've work in the Apothecarium myself.", next = "alch", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "What happens if a seal breaks on the way?", next = "w3_seal" },
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
    route = {
      lines = { { id = "rt_default", text = "Out of the Apothecarium, across the bridge, round the canal past the woman who fishes, and up the long stair to the Royal Quarter. It's the same each time, because the Society likes to know exactly where its papers are at any hour." } },
      choices = {
        { text = "And if you're stopped on the way?", next = "route2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    route2 = {
      lines = { { id = "rt2_default", text = "I've been stopped once, by a newly risen fellow who took me for his daughter. I let him walk with me as far as the stair, and the Deathguard were gentle with him. I looked for him afterwards on the canal, and I've not seen him since." } },
      choices = {
        { text = "That was kind of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You shouldn't let strangers walk with the satchel.", next = "BACK", reply = "No. I know it, and I'd do it again, so please don't mention it upstairs." },
        { text = "Something else.", next = "BACK" },
      },
    },
    royal = {
      lines = { { id = "ry_default", text = "It is. I hand the satchel to Sharlindra, who never touches the floor, and then I stand by the wall until something's handed back. The dreadlord stands across the room the whole while, and I've learned to look at the banners." } },
      choices = {
        { text = "Has Varimathras ever spoken to you?", next = "royal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    royal2 = {
      lines = { { id = "ry2_default", text = "Once. He said that I was punctual, and it was the worst moment of either of my lives. Royal Overseer Bauhaus told me afterwards that it was meant as praise, and that I should take care never to be praised again." } },
      choices = {
        { text = "Sound advice from the overseer.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alch = {
      lines = { { id = "al_default", text = "Then I've likely carried something with your hand on it. Apothecary Zinge's are the heavy ones, and Doctor Felben's students seal theirs crooked. I don't read them, but I know every seal in that hall by its weight." } },
      choices = {
        { text = "Whose do you least like carrying?", next = "BACK", reply = "The ones with no seal at all, only a ribbon. They go straight up, and nobody signs for them.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I ran errands in life and I run them now. The stairs are longer." } },
    advice = { { id = "tp_ad", text = "Carry what you're given and don't open it. It's kept me whole so far." } },
    sylvanas = { { id = "tp_syl", text = "I've seen her eleven times, from the wall. She has never once looked at the satchel, and I think she already knows what's in it." } },
    new_plague = { { id = "tp_np", text = "I carry papers. If there's a word for what's in them, I haven't learned it, and I'm not going to." } },
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
  notices = { "gear", "race", "class" },
  impression = {
    first = "He carried a valet's manners into the grave and out again.",
    third = "{name} met Chadsworth, a Forsaken valet who keeps the War Quarter's officers turned out properly.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. Do mind the boots by the wall, if you would, as they've only just been blacked." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned, and in the same state as before, I see. One does what one can." },
    { id = "g_noble", when = { origin = "human_minor_noble" }, text = "Good evening, and forgive the liberty, but one knows a household upbringing when one sees it. It is a pleasure to be spoken to correctly." },
  },

  notice = {
    { id = "n_broken", cat = "gear", when = { durability = { max = 0.30 } },
      text = "Forgive me, but your armour is in a shocking condition. I don't mend steel myself, but the smiths across the quarter do, and I'd go to them before you go anywhere else." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "I confess I've never valeted for anyone with hooves, and I find myself wondering how one would black them. Don't let me detain you with it." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "You'll be one of the gentlemen from the keep. Might I suggest a soft cloth for that breastplate, and a circular motion? One hates to see sand used on good steel." },
  },

  start = "hello",
  nodes = {
    w3_stain = {
      lines = {
        { id = "w3_stain_1", text = "Abomination bile, from a paladin's white tabard, after he'd been rather too close to one at the Bulwark. It is green, it is sticky, and it holds a grudge, and it took me nine days, a pound of salt and a remedy from Apothecary Zinge that I'm not to repeat." },
      },
      choices = {
        { text = "Did it come out in the end?", next = "w3_out" },
        { text = "Most would have burned the tabard.", next = "BACK", reply = "Most would, and most would have been wrong. A tabard is a soldier's dignity, and dignity is worth nine days." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_out = {
      lines = {
        { id = "w3_out_1", text = "Very nearly, {class}. There is a faint shadow at the hem, the shape of a hand, which only I can see, and I've told the paladin it's a trick of the light. He believes me, as an officer ought to believe his valet." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Chadsworth, at your service, though strictly speaking I'm at the service of the officers of the War Quarter. I was valet to a house of some standing in the capital, and I find that a man can lose his pulse without losing his standards." },
      },
      again = {
        { id = "h_again", text = "Will there be anything further, {class}? The officers can spare me for a moment more." },
        { id = "h_again2", text = "Yes? I'm listening, though I'll keep polishing, if you don't mind." },
        { id = "h_again3", text = "By all means. The buckles will wait, though they oughtn't to wait long." },
      },
      choices = {
        { text = "Which house did you serve?", next = "house" },
        { text = "Why bother with polish down here?", next = "polish" },
        { text = "What are the officers like?", next = "officers" },
        { text = "How does one keep kit decent down here?", next = "kit" },
        { text = "You've views on everyone in this quarter.", next = "quarter" },
        { text = "My boots could stand your attention.", next = "boots", when = { durability = { max = 0.6 } } },
        { text = "My family kept a man like you.", next = "house2", when = { origin = "human_minor_noble" } },
        { text = "What's the worst stain you've ever lifted?", next = "w3_stain" },
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
    kit = {
      lines = { { id = "kt_default", text = "With difficulty, and beeswax. The damp from the canals gets into leather overnight, and the fumes from the Apothecarium tarnish brass in a week, so I have a standing order with Joseph Moore for dubbin and with Samuel Van Brunt for wire wool." } },
      choices = {
        { text = "That's a campaign in itself.", next = "kit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit2 = {
      lines = { { id = "kt2_default", text = "It is the only campaign I'm fit for. I cannot hold a line, but I can see that those who do are not let down by a rotten strap, and I've known a rotten strap lose a man his shield at precisely the wrong moment." } },
      choices = {
        { text = "Then you've saved lives with a tin of wax.", next = "BACK", reply = "One would never say so oneself. But I shan't contradict you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter = {
      lines = { { id = "qr_default", text = "One observes. Mistress Tremayne across the way keeps the best-ordered shop in the city and would have made an admirable housekeeper. The weapon master Archibald is courteous and never wipes his feet. Master Fowler shouts, but his men's boots are always done." } },
      choices = {
        { text = "And the priests?", next = "quarter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter2 = {
      lines = { { id = "qr2_default", text = "Father Lazarus is a gentleman of the old sort, and I press his vestments without being asked. The lady Aelthalyste, being a banshee, has no laundry whatever, which I confess I find slightly unnerving in a member of the clergy." } },
      choices = {
        { text = "I'd never have thought of that.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boots = {
      lines = { { id = "bt_default", text = "They could, if you'll forgive my saying so. That's road salt at the welt, and it will crack the leather before the month is out. A stiff brush tonight, then dubbin, then leave them by a fire that isn't too near." } },
      choices = {
        { text = "I'll see to it. Thank you, Chadsworth.", next = "BACK", reply = "Not at all. It is a relief to give advice that will be taken.", fx = { affinity = 1 } },
        { text = "They only get dirty again.", next = "BACK", reply = "So does everything. One cleans it anyway, and that is very nearly the whole of civilisation." },
        { text = "Something else.", next = "BACK" },
      },
    },
    house2 = {
      lines = { { id = "h2_default", text = "Did they indeed? Then you were raised to stand still while someone fussed at your collar, and I am sorry for the loss of him. We were not much noticed, my profession, but we noticed everything." } },
      choices = {
        { text = "He noticed more than my father did.", next = "BACK", reply = "We generally did. I hope someone told him so, though I rather expect nobody thought of it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "In service, in the capital, for a house I'll not name. Then a brief interruption, and now in service again." } },
    advice = { { id = "tp_ad", text = "Black your boots the night before. One never knows what the morning will bring, and one ought to meet it shod." } },
    lordaeron = { { id = "tp_lord", text = "It was a kingdom that dressed for dinner. Whatever else may be said of it, I shall always hold that in its favour." } },
    sylvanas = { { id = "tp_syl", text = "Her Majesty's armour is kept by her own rangers, and kept beautifully. I have never been permitted near it, and I quite understand." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my station. The officers might know, if they'd stop fussing with their swords long enough to ask." } },
  },
}

---------------------------------------------------------------------------
-- Zeglo Kruptorr: a warlock's acolyte in the Magic Quarter, who feeds the trainers' imps and resents it.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_zeglo", id = TODO_NPC("Zeglo Kruptorr"), name = "Zeglo Kruptorr",
  bible = "bibles/uc_forever_folk.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "sour", "ambitious" }, values = { "ambitious", "cunning" },
  notices = { "class", "pet", "profession" },
  impression = {
    first = "He keeps a list of people who doubt his greatness.",
    third = "{name} met Zeglo Kruptorr, an ambitious warlock's acolyte in the Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Don't step in the chalk. If you scuff that circle I'll have to draw it again, and I'll remember your face while I do it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The imps have been fed, the circles drawn, and I'm still not a master, in case you were wondering." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Oh, wonderful, another one who's already been given a demon. Mind the chalk, and try not to look so pleased with yourself." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock with a pact of your own already. I'll admit I'm jealous, and I'll admit nothing else." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp's looking at my chalk. Tell it that if it so much as breathes on that circle, I'll feed it to the felhound." },
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "You're an enchanter. Then you'll know what a circle costs in dust, and you might tell the masters, because they seem to think chalk grows on the walls." },
  },

  start = "hello",
  nodes = {
    w3_felhound = {
      lines = {
        { id = "w3_felhound_1", text = "Hungry, mostly, for anything with a spell on it, and he follows me round the hall because I'm the one who brings him scraps of enchanted parchment. The masters say he's dangerous and I say he's the only thing in this city that's glad to see me." },
      },
      choices = {
        { text = "Does he have a name?", next = "w3_name" },
        { text = "A felhound's affection isn't affection.", next = "BACK", reply = "I know that. But it looks like affection from the outside, and I'll take what I'm given, since nobody gives me much." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_name = {
      lines = {
        { id = "w3_name_1", text = "The masters say a demon mustn't be named, so officially he's \"the felhound.\" I call him Carendin when nobody's listening, because it makes me laugh, and I'd thank you not to repeat that to Carendin Halgar." },
      },
      choices = {
        { text = "I won't. Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Zeglo Kruptorr, acolyte of the dark arts, which in practice means I feed the trainers' imps and redraw the circles they scorch. One day I'll have a pact of my own, and then we'll see who's scrubbing chalk." },
      },
      again = {
        { id = "h_again", text = "What else? The imps need feeding at the bell, and they bite if I'm late." },
        { id = "h_again2", text = "Go on, I've a minute before something catches fire." },
        { id = "h_again3", text = "Well? Ask it before the felhound wakes up, because he's my job too." },
      },
      choices = {
        { text = "What do imps eat?", next = "imps" },
        { text = "Why haven't you made a pact yet?", next = "pact" },
        { text = "Why come to the dark arts at all?", next = "why" },
        { text = "Which master do you answer to?", next = "masters" },
        { text = "Those circles look carefully drawn.", next = "circles" },
        { text = "You keep a list of people, I hear.", next = "list" },
        { text = "I made my first pact young. I'm still paying for it.", next = "cost", when = { class = "WARLOCK" } },
        { text = "What's the felhound like, the one you look after?", next = "w3_felhound" },
        { text = "I'll mind the chalk. Goodbye.", next = "END" },
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
      lines = { { id = "pw_default", text = "Right to make me wait? The Scourge is a day's walk from here and the Scarlets are closer than that, and the trainers want me sweeping. A demon on a leash is a demon fighting for us, and every night I wait is a night we're weaker." } },
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
    masters = {
      lines = { { id = "ms_default", text = "All of them, which is the trouble. Luther Pickman wants the circles redrawn nightly, Richard Kerwin wants the books dusted, and Kaal Soulreaper wants his felhound walked, and that beast ate a whole shoe of mine with my foot very nearly in it." } },
      choices = {
        { text = "Which of them is the fairest?", next = "masters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    masters2 = {
      lines = { { id = "ms2_default", text = "Kerwin, though I'd deny saying it. He told me once that he scrubbed chalk for two years under a master in Dalaran, and that the scrubbing taught him the shapes better than any book. I told him that was convenient, and he laughed, which Pickman never does." } },
      choices = {
        { text = "He may be telling you something useful.", next = "BACK", reply = "He may. I've noticed I can draw the binding ring from memory now, and I don't thank him for it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circles = {
      lines = { { id = "ci_default", text = "They are, and I'll take that compliment, since I get so few. The outer ring is easy, but the inner sigils have to be drawn in one stroke each without lifting the chalk, and it took me a month to stop my hand shaking on the third." } },
      choices = {
        { text = "What happens if the stroke breaks?", next = "BACK", reply = "Ask the acolyte before me. Or ask the scorch mark by the pillar, which is the same thing.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    list = {
      lines = { { id = "li_default", text = "Who told you that, the mushroom man? Yes, I keep a list. Pickman is at the top, the felhound is second, and there's a mage called Duggins who called me a promising boy in front of Rakkamar." } },
      choices = {
        { text = "And what happens to people on the list?", next = "list2" },
        { text = "That's a petty thing to keep.", next = "list2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    list2 = {
      lines = { { id = "li2_default", text = "Nothing, yet. One day I'll be a master, and I'll walk past each of them very slowly, and say good evening, and that'll be enough. I've thought about it a great deal, and honestly the slow walking is the part I like best." } },
      choices = {
        { text = "That's a milder revenge than I expected.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cost = {
      lines = { { id = "cs_default", text = "Cost you what? No, don't tell me, the masters will say you were put up to it. Fine, tell me. Everyone says it costs, and nobody ever says what, and I'd like to hear it from somebody who isn't trying to keep me sweeping." } },
      choices = {
        { text = "Sleep, mostly. It whispers in the hours before dawn.", next = "BACK", reply = "I don't sleep. Though I do get tired, in a way. Hm. I'll think about that, and I'm not putting you on the list.", fx = { affinity = 1 } },
        { text = "Nothing I wouldn't pay again, and gladly.", next = "BACK", reply = "There, you see? That's what I keep telling them. Say it louder, Pickman's just round the pillar." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was nobody in life, and I'll be somebody in death. That's all the background you need." } },
    advice = { { id = "tp_ad", text = "Never let an imp near your sleeves, your notes or your hair, if you've any left." } },
    burning_legion = { { id = "tp_legion", text = "They've an army of demons and no end of power, and look where it got them at Hyjal. I mean to borrow the demons and skip the losing." } },
    forsaken = { { id = "tp_fs", text = "We've been servants once already, to something far worse than a warlock trainer. I remind myself of that when I'm on my knees with the chalk." } },
    _none = { { id = "tp_none", text = "I don't know, and I've no time to find out. Ask a master; they've time for everything except teaching me." } },
  },
}

-- Captain Truman: a Forsaken in the Ruins of Lordaeron who served Grand Marshal Othmar Garithos and still
-- awaits his return, not knowing that Garithos is dead, nor that he is dead himself. Gives Abominable Creatures (Alliance).
P:NPC {
  key = "uc_captain_truman", id = TODO_NPC("Captain Truman"), name = "Captain Truman", title = "Captain", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "stern", "bitter" }, values = { "loyal", "duty" },
  notices = { "race" },
  impression = {
    first = "He stands at attention in rusted Alliance plate, and he does not seem to notice that his face is mostly bone.",
    third = "{name} met Captain Truman in the Ruins of Lordaeron, who still waits at his post for Grand Marshal Garithos.",
  },
  greetings = {
    { id = "g_default", text = "What do you want? Can't you see there is a war to be won?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Any word of the Grand Marshal, or have you only come to waste my time?" },
    { id = "g_human", when = { race = "Human" }, text = "A soldier of Lordaeron, or near enough! Stand straight, man, the Grand Marshal could return at any moment." },
  },
  notice = {
    { id = "n_nonhuman", cat = "race", when = { race = { "Dwarf", "Gnome", "NightElf" } },
      text = "Oh, a {race}. What are you doing in our glorious city? These ruins are already crawling with inhuman filth as it is." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      narr = "He holds his sword in a salute, and the leather of the grip has rotted to threads.",
      lines = {
        { id = "h_default", key = true, text = "My master has already charged into the fray and has ordered me to hold this post, and hold it I shall. It has been quite some time, I'll grant you, but the Grand Marshal is not a man to forget his officers." },
        { id = "h_active", when = { questActive = P.TODO_QUEST("Abominable Creatures") },
          text = "You're still alive? Hmph, well, what is it? Have you found my lord yet?" },
        { id = "h_done", when = { questDone = P.TODO_QUEST("Abominable Creatures") },
          text = "Get that thing's memory out of my sight. It was not him, do you hear me, it cannot have been him." },
      },
      again = {
        { id = "h_again", text = "Well? Out with it, I have a post to keep." },
        { id = "h_again2", text = "Anything else, or will you finally go and be useful?" },
      },
      choices = {
        { text = "What happened to you?", next = "happened" },
        { text = "Who is your master?", next = "garithos" },
        { text = "Have you looked at your own hands, Captain?", next = "hands" },
        { text = "The Grand Marshal isn't coming back.", next = "dead", when = { questDone = P.TODO_QUEST("Abominable Creatures") } },
        { text = "Where are the rest of your men?", next = "men" },
        { text = "These ruins belong to the Dark Lady now.", next = "lady" },
        { text = "What was Lordaeron like, before the fall?", next = "before" },
        { text = "I'm an orc, Captain. Of the Horde.", next = "orc", when = { race = "Orc" } },
        { text = "Garithos hated elves, didn't he?", next = "elves", when = { race = "NightElf" } },
        { text = "I serve the Light, Captain. As you once did.", next = "light", when = { class = "PALADIN" } },
        { text = "I'll leave you to your post.", next = "END" },
      },
    },
    happened = {
      lines = { { id = "w_default", text = "Watch your tone. When Arthas betrayed us, those of us still loyal to the Crown took up arms to fend off his unholy Scourge, and we held when the rest of Lordaeron broke." } },
      choices = {
        { text = "And after that?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "Our glorious commander allied with the Banshee Queen, Sylvanas Windrunner, to purge the undead filth from our homeland. I haven't heard from him since, and so I await his return, dutifully, as a soldier should." } },
      choices = {
        { text = "Trusting the Banshee Queen was a mistake.", next = "BACK", reply = "Mind your tongue! The Grand Marshal knew exactly what he was doing, and he'd have had her head the moment the war was won.", fx = { align = { order = -1 } } },
        { text = "Then your loyalty does you credit, Captain.", next = "BACK", reply = "Of course it does, and I'll thank you to remember it when you report back to your own commander.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garithos = {
      lines = { { id = "g_default", text = "Grand Marshal Othmar Garithos, the tallest, most statuesque hero you've ever laid eyes on, and you'll know him the moment you see him. He went into the ruins to finish the fight, and he ordered me to stay." } },
      choices = {
        { text = "I could go and find him for you.", next = "quest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quest = {
      lines = { { id = "q_default", text = "I doubt you'd survive ten minutes in combat, but if it keeps your simple mind busy, then by all means, go and seek him out. Tell him Captain Truman holds the line, and awaits his orders." } },
      choices = { { text = "I'll find him. Something else.", next = "BACK" } },
    },
    hands = {
      lines = { { id = "h2_default", text = "What about them? A soldier's hands are scarred, and mine have been at war a long time, and I'll not have some {race} sneer at them." } },
      narr = "He does not look down.",
      choices = { { text = "Never mind, Captain. Something else.", next = "BACK" } },
    },
    dead = {
      big = true,
      lines = { { id = "d_default", text = "That was a monstrosity, sewn together out of the dead, and you dare tell me it was my lord? He'll come back, he must come back, because if he doesn't, then what in the Light's name have I been waiting for?" } },
      choices = {
        { text = "You deserve the truth, Captain, however hard it is.", next = "BACK", reply = "Truth! Get out, and take your truth with you.", fx = { align = { honor = 1 } } },
        { text = "Perhaps I was mistaken. Keep your post.", next = "BACK", reply = "Yes, you were, and I will, so go and make yourself useful elsewhere.", fx = { align = { honor = -1 } } },
      },
    },
    men = {
      lines = { { id = "m_default", text = "Dispersed, on the Grand Marshal's orders, to hold the outer wards. They report to me less often than they ought, and I've half a mind to have the lot of them flogged when this is over." } },
      choices = {
        { text = "When did one last report to you?", next = "men_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    men_last = {
      lines = { { id = "ml_default", text = "Sergeant Hollis, I believe, a fortnight ago, or perhaps it was longer. He said nothing, merely stood there, grey as ash, and wandered off toward the throne room without a salute." } },
      choices = {
        { text = "Captain, I think Hollis was already dead.", next = "men_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    men_truth = {
      big = true,
      lines = { { id = "mt_default", text = "Dead? Nonsense, he was standing, and dead men don't stand unless they're Scourge, and Hollis was no traitor. <His jaw works soundlessly for a moment.> Are you trying to tell me something, {race}?" } },
      choices = {
        { text = "Only that you should look around you, Captain.", next = "BACK", reply = "I have looked, and I see a post that must be held. That is all a soldier needs to see.", fx = { align = { honor = 1 } } },
        { text = "No, Captain. Nothing at all. Carry on.", next = "BACK", reply = "Then stop muttering riddles at an officer and go and do something useful.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = { { id = "la_default", text = "The Dark Lady? Sylvanas is our ally, nothing more, and an ally of convenience at that, whatever her ghouls may believe. Once the Scourge is purged, the Grand Marshal will restore Lordaeron to her rightful king's heirs." } },
      choices = { { text = "If you say so, Captain. Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "be_default", text = "The finest kingdom of men, with banners on every tower and the bells of the capital ringing at dawn. I was a lieutenant then, with a wife in the lower city and a pension promised, and I intend to collect it." } },
      choices = {
        { text = "Do you know what became of your wife?", next = "before_wife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_wife = {
      lines = { { id = "bw_default", text = "She went south with the refugees when the plague came, as any sensible woman would, and I'll send for her once the city is secure. Don't look at me like that, {race}, she is perfectly well." } },
      choices = { { text = "Of course she is. Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "or_default", text = "An orc! Here, in the capital? I fought your kind in the Second War, and I'll do it again, so state your business before I have you clapped in irons. <He draws himself up, though no guard answers his call.>" } },
      choices = { { text = "Calm yourself, Captain. Something else.", next = "BACK" } },
    },
    elves = {
      lines = { { id = "el_default", text = "The Grand Marshal had no patience for elves of any colour, and nor have I, after what the high elves did to us at the end. Don't think your pointed ears will win you any favours at this post." } },
      choices = { { text = "I wouldn't dream of it. Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "As I still do, thank you very much, though I've not had time for chapel lately with the war on. When the Grand Marshal returns, we'll have the cathedral reconsecrated and the bells ringing again." } },
      choices = { { text = "I'll pray it happens. Something else.", next = "BACK" } },
    },
  },
  topics = {
    garithos = { { id = "tp_garithos", text = "The finest commander Lordaeron ever produced, and he'll return any moment now." } },
    sylvanas = { { id = "tp_sylvanas", text = "An ally. A temporary one, mark my words." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care, because my only concern is the Grand Marshal's return." } },
  },
}

-- Deelio: a Forsaken woman who walks the Magic Quarter of the Undercity. The wiki gives nothing else.
P:NPC {
  key = "uc_deelio", id = TODO_NPC("Deelio"), name = "Deelio", gender = "female",
  role = "citizen", tier = "service",
  temper = { "dry", "cold" }, values = { "curious" },
  impression = {
    first = "She walks the Magic Quarter's ring as if she has somewhere to be and never gets there.",
    third = "{name} spoke with Deelio, a Forsaken who walks the Magic Quarter of the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and keeping pace better than ever. Come on, there's another lap before the bank." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Walk on the other side of the ring today; I don't stop, but I can certainly speed up." },
    { id = "g_default", text = "Walk with me if you want to talk, because I don't stop." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've been round twice since we last spoke, if you're counting." },
  },
  start = "hello",
  nodes = {
    w3_stop = {
      lines = {
        { id = "w3_stop_1", text = "I tried it once, for a whole day, sitting on the bench by the reagent stall. By evening I could feel the earth over me again, every handful of it, and a warlock's imp had to tread on my foot before I'd get up." },
      },
      choices = {
        { text = "The imp did you a kindness, then.", next = "w3_imp" },
        { text = "Have you told anyone about it?", next = "BACK", reply = "Who would I tell, the apothecaries? They'd want to bury me again to see whether it happens twice." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_imp = {
      lines = {
        { id = "w3_imp_1", text = "It did, though it meant nothing of the sort, and it giggled about it for an hour. I give it a wide berth now, and it grins at me every time I pass, as if we share a secret, which I suppose we do." },
      },
      choices = {
        { text = "Keep walking, Deelio. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", key = true, text = "I walk the Magic Quarter, round and round, because standing still down here makes me feel like I'm back in the ground. The mages don't mind, and the warlocks are too busy with their imps to notice." } },
      again = { { id = "h_again", text = "More? Keep up, then, we're coming to the warlocks' corner." } },
      choices = {
        { text = "Why not leave the Undercity for a while?", next = "leave" },
        { text = "What do you see on your walks?", next = "see" },
        { text = "What were you, before the ground?", next = "life" },
        { text = "You must know the mages here by now.", next = "mages" },
        { text = "You walk like someone who's been buried alive.", next = "buried" },
        { text = "Mind if I walk a circuit with you?", next = "walk" },
        { text = "Do you ever take a lesson from the mages?", next = "lesson", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "What happens if you stop walking?", next = "w3_stop" },
        { text = "I'll let you walk on.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "And go where, Brill? It's all fields and Scarlets and that wretched inn, so I'd rather keep my circle down here where the Deathguard are thick on the ground." } },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Apprentices burning their sleeves, a warlock arguing with a voidwalker, and the same mage counting her reagents three times over. It's better than the canals, at any rate, where all you see is the green stuff and whatever falls in." } },
      choices = { { text = "I'll keep my sleeves clear. Something else.", next = "BACK" } },
    },
    life = {
      lines = { { id = "li_default", text = "A seamstress in the capital, with a shop two streets from the cathedral and a sign I painted myself. I walked these same stones then, above ground, though they were cleaner and nobody was trying to sell me a ghoul." } },
      choices = {
        { text = "Do you miss it?", next = "life_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_miss = {
      lines = { { id = "lm_default", text = "I miss the sign, oddly enough, more than the customers. Everything else about being alive was mostly waiting for something, and now I can't wait still, so I walk." } },
      choices = {
        { text = "Some Forsaken say the living life is best forgotten.", next = "life_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_stance = {
      big = true,
      lines = { { id = "ls_default", text = "The Apothecaries say that, mostly, and they say it as if it were an order. Do you think we should forget, or remember?" } },
      choices = {
        { text = "Forget it. The living never did anything for us.", next = "BACK", reply = "Spoken like a good subject of the Dark Lady. I'll try, though the sign keeps coming back.", fx = { align = { order = 1 } } },
        { text = "Remember. It's the only thing they can't take.", next = "BACK", reply = "Mm. That's a dangerous thing to say near the Royal Quarter, and I rather like you for it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mages = {
      lines = { { id = "ma_default", text = "By their tempers, if not their names. The warlocks keep their own corner and their own counsel, and the mages pretend not to notice the smell of sulphur, which is the politest thing anyone does down here." } },
      choices = {
        { text = "What do the warlocks get up to?", next = "warlocks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlocks = {
      lines = { { id = "wa_default", text = "Bargaining with things from the Twisting Nether, from what I overhear, and losing the odd apprentice to it. Last month an imp got loose and set fire to a robe display, and I'm the only one who laughed." } },
      choices = { { text = "I'd have laughed too. Something else.", next = "BACK" } },
    },
    buried = {
      lines = { { id = "bu_default", text = "Is it that obvious? I woke in a box under Brill churchyard and clawed my way out, and I've never cared for small rooms since, which is awkward in a city built entirely underground." } },
      choices = { { text = "That is a little awkward. Something else.", next = "BACK" } },
    },
    walk = {
      narr = "You fall in beside her. She doesn't slow down.",
      lines = { { id = "wk_default", text = "Suit yourself, but keep up. That's the reagent vendor, that's where the apprentice set fire to himself, and that's where I'll pass you again in about four minutes." } },
      choices = { { text = "<Walk a full circuit with her.>", next = "BACK", fx = { affinity = 1 } } },
    },
    lesson = {
      lines = { { id = "le_default", text = "Me? I tried once, and the teacher said I had the attention span of a moth, which is unkind but not wrong. I'd rather watch you lot set yourselves alight than do it myself." } },
      choices = { { text = "Wise choice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    undercity = { { id = "tp_uc", text = "I walk one ring of it, round and round. That's all of it I need." } },
    brill = { { id = "tp_brill", text = "Fields, Scarlets, and an inn I wouldn't haunt if you paid me." } },
    _none = { { id = "tp_none", text = "No idea. Ask someone who stands still long enough to learn things." } },
  },
}
