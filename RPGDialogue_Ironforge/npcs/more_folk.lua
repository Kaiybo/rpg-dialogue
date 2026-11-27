-- More Ironforge folk: Deliana at the High Seat, Gerrig Bonegrip and Alexander Calder in the Forlorn Cavern,
-- Laris Geardawdle and Roetten Stonehammer in the Library, Muren Stormpike, Pilot Longbeard and the Thundergranites
-- in the Hall of Arms, Tormus Deepforge at the Great Forge, Artilleryman Sheldonore and Lieutenant Rotimer in the Commons,
-- and Valgar Highforge in the Hall of Mysteries.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Deliana: a human woman at the High Seat with a proposition for veterans in old dungeon-made armour.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_deliana", id = TODO_NPC("Deliana"), name = "Deliana",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "composed", "patient" }, values = { "practical", "loyal" },
  notices = { "greenness", "class" },
  impression = {
    first = "She is measuring whether I'm worth her proposition.",
    third = "{name} met Deliana, a human woman waiting at the High Seat for an audience with King Magni, who has a proposition for seasoned adventurers.",
  },
  greetings = {
    { id = "g_wait", text = "Good day. If you've come to see the king, you'll want to join the queue, and I'm afraid I'm at the front of it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm still waiting, as you can see, and the guards have started nodding to me like a neighbour." },
    { id = "g_vet", when = { minLevel = 55 }, text = "Now there's someone who has seen the inside of a few strongholds. Have you a moment for a proposition?" },
    { id = "g_active", when = { questActive = TODO_QUEST("An Earnest Proposition") }, text = "Have you gathered what I asked for? I can't begin the work without it, and I'd rather not wait longer than I must." },
  },
  notice = {
    { id = "n_low", cat = "greenness", when = { maxLevel = 30 },
      text = "You're young for the road you're on. Come back when your armour has a few more dents in it, and we'll talk business." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the Silver Hand. I've seen a fair few of your order pass through these halls hoping the king will spare more men for Lordaeron." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My name is Deliana, and I've been waiting for an audience with King Magni for longer than I care to count. While I wait, I have business with anyone who has fought through the worst places in this land and kept their armour." },
        { id = "h_human", when = { race = "Human" }, text = "Someone from home, or near enough. My name is Deliana, and I've been waiting on the king's pleasure long enough to learn the name of every guard on this stair." },
        { id = "h_done", when = { questDone = TODO_QUEST("Saving the Best for Last") }, text = "There you are, wearing it well. I'll admit I had my doubts that anyone would see the whole business through, and I'm glad you proved me wrong." },
      },
      again = {
        { id = "h_again", text = "Anything else? I have nowhere to be, as it happens." },
        { id = "h_again2", text = "Go on, then. The king's door isn't opening any faster." },
      },
      choices = {
        { text = "What's your proposition?", next = "offer" },
        { text = "Why do you need King Magni?", next = "king" },
        { text = "You look like you've been standing here a while.", next = "waiting" },
        { text = "I've found Anthion Harmon in Stratholme.", next = "anthion", when = { questActive = TODO_QUEST("In Search of Anthion") } },
        { text = "Good day, Deliana.", next = "END" },
      },
    },
    offer = {
      lines = {
        { id = "of_default", text = "The armour that veterans carry out of Scholomance and Stratholme and Blackrock Spire is fine work, but it could be finer, and I know a man who learned how to make it so. His name is Anthion Harmon, and I've not heard from him in a long while." },
        { id = "of_low", when = { maxLevel = 50 }, text = "It's for those who've walked the halls of Stratholme and Blackrock Spire and come out wearing the proof. Come back when you've done that, and I'll explain properly." },
      },
      choices = {
        { text = "Who is Anthion Harmon?", next = "offer_anthion" },
        { text = "And what's in it for you?", next = "offer_price" },
        { text = "Something else, Deliana.", next = "BACK" },
      },
    },
    offer_anthion = {
      lines = { { id = "oa_default", text = "A scholar and a craftsman who went into Stratholme to study what the Scourge left behind. He sent word that he'd found a way to strengthen old armour, and then the letters stopped." } },
      choices = {
        { text = "Nobody comes out of Stratholme unchanged.", next = "offer_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    offer_grim = {
      big = true,
      lines = { { id = "og_default", text = "I know it, and I've made my peace with whatever you find. If he's dead, I'd still want his work finished, and if he's something worse than dead, I'd want that finished too." } },
      choices = {
        { text = "Then I'll find him, whatever he's become.", next = "BACK", reply = "Thank you. Bring me word, good or bad, and I'll know what to do next.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "His work matters more than he does, then.", next = "BACK", reply = "That's a cold way to put it, but I won't pretend you're wrong. The work is what he'd want saved.", fx = { align = { light = -1 } } },
        { text = "Something else, Deliana.", next = "BACK" },
      },
    },
    offer_price = {
      big = true,
      lines = { { id = "op_default", text = "A fair question, and I'll answer it plainly: I'm paid for the work, and the materials don't come cheap. I'd rather be honest about the coin than have you think me a charity." } },
      choices = {
        { text = "Honest about coin. I can respect that.", next = "BACK", reply = "Good, then we'll get along. Most folk who come up these stairs want something for nothing.", fx = { align = { honor = 1 } } },
        { text = "I'll find someone cheaper, then.", next = "BACK", reply = "You're welcome to try. I'll still be here when you've finished looking.", fx = { align = { honor = -1 } } },
      },
    },
    king = {
      lines = { { id = "k_default", text = "That's between me and the king, I'm afraid, and I've been asked not to discuss it on the stair. I'll only say that I've come a long way, and I mean to be heard." } },
      choices = {
        { text = "The thanes keep a lot of people waiting.", next = "king_thanes" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    king_thanes = {
      lines = { { id = "kt_default", text = "They do, and the guards tell me the king's had little time for anyone since the Dark Irons grew bold again. I don't blame him for that, but it does make for a long queue." } },
      choices = { { text = "I'll leave you to it.", next = "BACK" } },
    },
    waiting = {
      lines = { { id = "w_default", text = "I have, and I've learned more about Ironforge from this stair than I would in a year of walking it. Dwarves argue very loudly, and they assume a human can't follow a word of it." } },
      choices = {
        { text = "So what have you overheard?", next = "waiting_gossip" },
        { text = "Patience suits you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    waiting_gossip = {
      lines = { { id = "wg_default", text = "That the Dark Irons are bolder than they've been in years, and that the Explorers' League spends more on maps than the army spends on rifles. I'd keep that second one to yourself, mind." } },
      choices = { { text = "My lips are sealed.", next = "BACK" } },
    },
    anthion = {
      big = true,
      lines = { { id = "an_default", text = "You found him, then, and from your face I can guess what state he's in. Tell me what he said, all of it, and don't soften it for my sake." } },
      choices = {
        { text = "He's a ghost, but he remembers you.", next = "BACK", reply = "Then he's still himself, in some fashion. That's more than I hoped for, and I'm grateful you told me gently.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's dead and bound there. That's the truth.", next = "BACK", reply = "Then that's the truth, and I'll carry it. Thank you for not dressing it up.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    stratholme = { { id = "tp_strat", text = "Stratholme was a proud city once, and now it's a graveyard that walks. Anthion went there because the dead don't guard their secrets as well as the living." } },
    background = { { id = "tp_bg", text = "I'm a woman with business before the king and a good deal of time on my hands. That's all you need of me for now." } },
    _none = { { id = "tp_none", text = "I couldn't say, I'm afraid. I've spent my time on this stair, not out in the world." } },
  },
}

---------------------------------------------------------------------------
-- Gerrig Bonegrip: keeper of Bonegrip's Runes and Dooms; buys forbidden lore and doesn't say why.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gerrig", id = TODO_NPC("Gerrig Bonegrip"), name = "Gerrig Bonegrip",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "secretive", "wry" }, values = { "knowledge", "greedy" },
  notices = { "class" },
  impression = {
    first = "He wants certain manuscripts very badly and won't explain why.",
    third = "{name} met Gerrig Bonegrip, the dwarf who runs Bonegrip's Runes and Dooms in the Forlorn Cavern and pays well for forbidden lore.",
  },
  greetings = {
    { id = "g_shop", text = "Runes and Dooms, that's what the sign says, an' that's what I sell. Mind the shelves; some o' those books bite." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, for I've a list that never gets shorter, an' ye've the look o' someone who goes places." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, one o' the cavern's own sort. Ye'll find the folk in here don't ask what ye do wi' yer evenings, an' I'd thank ye tae return the favour." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A servant o' the Light in my shop, is it? Look all ye like; there's nothin' on these shelves that's against the law, quite." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Ye'll appreciate a good manuscript, I'd wager, more than the brutes who usually bring them tae me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gerrig Bonegrip, an' this is my shop. I collect old knowledge, the kind the Library upstairs won't touch, an' I pay well for anyone who'll fetch it from places I'd rather no' go myself." },
        { id = "h_deeps", when = { questActive = TODO_QUEST("Knowledge in the Deeps") }, text = "The Lorgalis Manuscript, have ye got it? It's down in Blackfathom Deeps, past the naga an' worse, an' I've waited a long time tae hold it." },
        { id = "h_deeps_done", when = { questDone = TODO_QUEST("Knowledge in the Deeps") }, text = "I've been readin' that manuscript ye brought me every night since, an' I've no' slept much. Worth every copper, it was." },
        { id = "h_forbid", when = { questActive = TODO_QUEST("Forbidden Knowledge") }, text = "Ye've the pieces, or ye're close? Good. Don't open anythin' on the way back; I mean that most sincerely." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the candles; they're older than ye are." },
        { id = "h_again2", text = "Ask away. I answer what I like an' charge for the rest." },
      },
      choices = {
        { text = "What sort of knowledge do you collect?", next = "lore" },
        { text = "You've work for me?", next = "work" },
        { text = "This cavern seems a dark place for a shop.", next = "cavern" },
        { text = "Why would a dwarf want warlock books?", next = "why", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Good day, Gerrig.", next = "END" },
      },
    },
    lore = {
      lines = { { id = "lo_default", text = "Rituals, mostly, an' the names o' things that lived under the world before the titans tidied it. The Library calls it nonsense an' locks it away, which only tells me it isnae nonsense at all." } },
      choices = {
        { text = "Some things are locked away for good reason.", next = "lore_reason" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lore_reason = {
      big = true,
      lines = { { id = "lr_default", text = "Maybe so, but ye cannae fight what ye refuse tae read about. Every dwarf who ever sealed a tunnel did it because someone first went in an' looked." } },
      choices = {
        { text = "Then read carefully, and burn what's too dangerous.", next = "BACK", reply = "Careful's my middle name, near enough. As for burnin', I'll be the judge o' that.", fx = { align = { light = 1 } } },
        { text = "Knowledge is knowledge. Burning books is for cowards.", next = "BACK", reply = "Now there's a customer after my own heart. Keep sayin' that, quietly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "There's a manuscript in Blackfathom Deeps, the Lorgalis Manuscript, kept by the naga who've taken the old temple. An' there's a digest from the Swamp o' Sorrows I'd dearly like, though that's for someone wi' more years on the road." } },
      choices = {
        { text = "What's in the Lorgalis Manuscript?", next = "work_lorgalis" },
        { text = "Who'd be fool enough to go?", next = "work_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_lorgalis = {
      lines = { { id = "wl_default", text = "Prayers tae somethin' the naga worship down there, written by hands that weren't quite sane. I want tae know what they were prayin' to, an' whether it ever answered." } },
      choices = {
        { text = "And if it did answer?", next = "work_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_answer = {
      big = true,
      lines = { { id = "wa_default", text = "Then I'll know somethin' nobody else in Ironforge knows, an' that's worth more tae me than gold. Ye'll forgive me if I don't say what I'd do with it." } },
      choices = {
        { text = "Share what you learn with the Library.", next = "BACK", reply = "Share it wi' those dusty old beards? Maybe, if they ask nicely, which they never do.", fx = { align = { order = 1 } } },
        { text = "Keep it to yourself. Secrets are worth more hoarded.", next = "BACK", reply = "Spoken like a shopkeeper. Ye'd do well down here.", fx = { align = { order = -1 } } },
      },
    },
    work_who = {
      lines = { { id = "ww_default", text = "Ye, I'd hope, an' anyone ye can find tae go with ye. The Deeps lie on the Zoram Strand in Ashenvale, an' they don't forgive anyone who goes alone." } },
      choices = { { text = "I'll think about it.", next = "BACK" } },
    },
    cavern = {
      lines = { { id = "ca_default", text = "Dark, aye, an' quiet, an' nobody upstairs comes down unless they've a reason. That suits me an' my customers, an' Alexander Calder teaches his warlocks next door without anyone pokin' their nose in." } },
      choices = {
        { text = "Do the guards ever trouble you?", next = "cavern_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cavern_guards = {
      lines = { { id = "cg_default", text = "Now an' then they wander through, look at my skulls, an' leave again lookin' green. I've a license from the city, an' I keep it framed where they can see it." } },
      choices = { { text = "Very wise.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "wy_default", text = "Because somebody had best understand it, priest, an' it might as well be a dwarf who keeps a tidy shop. Ye'd sooner the only folk readin' these books were the ones who mean harm?" } },
      choices = {
        { text = "Fair point. Someone has to know the enemy.", next = "BACK", reply = "There, ye see? We're on the same side, you an' I, near enough.", fx = { align = { order = -1 } } },
        { text = "Nobody should read them. The Light needs no help.", next = "BACK", reply = "The Light's no' the one standin' guard in the tunnels at night. Good day tae ye.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    blackfathom_deeps = { { id = "tp_bfd", text = "An old night elf temple, sunk under the Zoram Strand, an' now the naga keep it. Whatever they found down there, they're prayin' to it." } },
    background = { { id = "tp_bg", text = "I'm a collector an' a shopkeeper, an' that's all I'll say tae a stranger." } },
    _none = { { id = "tp_none", text = "If it's no' written in an old book wi' a lock on it, I've no interest in it." } },
  },
}

---------------------------------------------------------------------------
-- Laris Geardawdle: gnome ooze theorist in the Library.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_laris", id = TODO_NPC("Laris Geardawdle"), name = "Laris Geardawdle",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "eager", "scatterbrained" }, values = { "knowledge", "curious" },
  notices = { "race", "class" },
  impression = {
    first = "He believes slime from far-off places holds the secret of life.",
    third = "{name} met Laris Geardawdle, a gnome scholar in the Ironforge Library with a passionate theory about the origin of oozes.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, hello, hello! Mind the jars, they're labelled but not sealed, which is a problem I've been meaning to solve." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you seen any oozes since we spoke? Any colour, any consistency, I'm not fussy." },
    { id = "g_active", when = { questActive = TODO_QUEST("A Little Slime Goes a Long Way") }, text = "Have you been to Un'Goro yet? The slimes there are the purest I've read about, and I simply must have samples!" },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! You'll understand when I say the oozes in Gnomeregan weren't there before the radiation, and that's a clue, a very important clue." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "The dwarves in this library think I'm daft, you know, but they let me keep my desk, which is very decent of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Laris Geardawdle, natural philosopher, and I've a theory about oozes that will change everything we know about how life begins. Nobody believes it yet, but nobody believed in the mechanostrider either!" },
        { id = "h_done", when = { questDone = TODO_QUEST("A Little Slime Goes a Long Way") }, text = "My samples are doing marvellously, thanks to you, and two of them have started to move toward the lamp, which I'm told is not normal for jam jars." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've so much to tell you." },
        { id = "h_again2", text = "Ask me anything, anything at all, though slime is my speciality." },
      },
      choices = {
        { text = "What's your theory about oozes?", next = "theory" },
        { text = "What do you need from me?", next = "samples" },
        { text = "Those jars smell terrible.", next = "jars" },
        { text = "Did Gnomeregan's oozes come from the radiation?", next = "gnomer", when = { race = "Gnome" } },
        { text = "Goodbye, Laris.", next = "END" },
      },
    },
    theory = {
      lines = { { id = "th_default", text = "Every ooze I've studied has the same basic composition, whether it came from a swamp in Dustwallow or a sewer in Stormwind. That means they all share a common source, and I believe that source is older than anything else living!" } },
      choices = {
        { text = "Older than the titans?", next = "theory_titans" },
        { text = "So oozes are... ancestors?", next = "theory_ancestors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theory_titans = {
      lines = { { id = "tt_default", text = "Well, I'm not saying older than the titans, the historians upstairs would chase me out with brooms. But I'm not not saying it, if you take my meaning." } },
      choices = { { text = "I won't tell the historians.", next = "BACK", fx = { affinity = 1 } } },
    },
    theory_ancestors = {
      big = true,
      lines = { { id = "ta_default", text = "In a manner of speaking, yes, and isn't that wonderful? Imagine everything that walks or flies, all of it starting as a little puddle of goo!" } },
      choices = {
        { text = "It is wonderful. Keep at it, Laris.", next = "BACK", reply = "Thank you! Nobody ever says that, and I'll write it down so I remember.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "It sounds mad. Prove it before you preach it.", next = "BACK", reply = "Prove it, yes, of course, that's what the samples are for! You sound like my old tutor.", fx = { align = { order = 1 } } },
      },
    },
    samples = {
      lines = { { id = "sa_default", text = "Slime, pure slime, from the crater called Un'Goro in the far south of Kalimdor, where the land is supposed to be older than anywhere. I'd go myself, but I'm told the lizards there are the size of houses." } },
      choices = {
        { text = "They are the size of houses.", next = "samples_lizards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    samples_lizards = {
      lines = { { id = "sl_default", text = "Oh dear, then I'm glad I asked you. Just scoop the samples into jars and keep them out of the sun, and if anything inside tries to get out, let it." } },
      choices = {
        { text = "What if something does get out?", next = "samples_out" },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    samples_out = {
      big = true,
      lines = { { id = "so_default", text = "Then I'll have proven that the slime of Un'Goro wants to live, which is the whole point of the theory! Tell me honestly, would you catch it again, or let it go?" } },
      choices = {
        { text = "Let it go. Living things deserve their freedom.", next = "BACK", reply = "How kind! I'd write it a letter of apology if it could read.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Catch it again. Science needs it in the jar.", next = "BACK", reply = "Quite right, quite right, though I'd feel a little guilty, I think.", fx = { align = { light = -1 } } },
      },
    },
    jars = {
      lines = { { id = "ja_default", text = "Do they? I stopped noticing years ago, which my landlord says is the most worrying part. The green one smells of vinegar, and the brown one smells of something I'm still trying to name." } },
      choices = { { text = "Leave it unnamed.", next = "BACK" } },
    },
    gnomer = {
      big = true,
      lines = { { id = "gn_default", text = "That's what I think, yes, and it frightens me a little, because it means the radiation made something new. I'd love to study them, but I'm not going back down there, not for all the gears in Tinker Town." } },
      choices = {
        { text = "Someday we'll take the city back and you can.", next = "BACK", reply = "Someday, yes! I'll bring extra jars. Lots of them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the city rot. It's poisoned anyway.", next = "BACK", reply = "Oh, don't say that, please. Even poisoned, it's home.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomer", text = "Gnomeregan has oozes now, and it never did before. I think about that more than I should." } },
    background = { { id = "tp_bg", text = "I'm a gnome with a desk in the Library and a theory nobody believes. That's enough to be going on with." } },
    _none = { { id = "tp_none", text = "I'm afraid I've not studied that, though if it oozes, do tell me." } },
  },
}

---------------------------------------------------------------------------
-- Muren Stormpike: tests young warriors in the Hall of Arms; sends them after Vejrek.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_muren", id = TODO_NPC("Muren Stormpike"), name = "Muren Stormpike",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "stern", "proud" }, values = { "brave", "clan" },
  notices = { "class", "race" },
  impression = {
    first = "He speaks of his clan's name like a weapon he keeps sharp.",
    third = "{name} met Muren Stormpike, a Stormpike warrior in the Hall of Arms who tests young fighters before they earn their weapons.",
  },
  greetings = {
    { id = "g_hi", text = "Stand straight when ye come into the Hall o' Arms. What's yer business wi' Muren Stormpike?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Good, for it's the ones who don't come back that I worry about." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior, an' a young one. Granis Swiftaxe sent ye, I'll wager, an' he always sends me the stubborn ones." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR", race = "Dwarf" },
      text = "A dwarf warrior, an' ye've the shoulders for it, so now let's see if ye've the head tae go wi' them." },
    { id = "n_stormpike", cat = "race", when = { origin = "dwarf_stormpike" },
      text = "Ye've a Stormpike look about ye, or I'm a trogg. Whose son or daughter are ye, then, for I'll be holdin' ye tae the clan's measure an' no' a hair less." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I'll no' test ye, for that's Highforge's business, but I'll say ye'd make a fair warrior if the Light ever gives up on ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Muren Stormpike, an' I test the warriors who come up from Dun Morogh. A dwarf isnae a warrior because he holds an axe; he's a warrior when he's proven he can use it." },
        { id = "h_vejrek", when = { questActive = TODO_QUEST("Vejrek") }, text = "Vejrek's still breathin', then? He's a frost troll in the high snows near Frostmane Hold, an' he's killed better fighters than ye, so don't be hasty." },
        { id = "h_vejrek_done", when = { questDone = TODO_QUEST("Vejrek") }, text = "Ye brought me Vejrek's head, an' I'll no' forget it. Tormus Deepforge at the Great Forge is the one tae see next." },
        { id = "h_vejrek_news", tags = { "news" }, when = { class = "WARRIOR", questRecent = { TODO_QUEST("Vejrek"), days = 2 } }, text = "There's the warrior who walked intae Frostmane Hold an' came out wi' a troll's head! Ye've earned yer Defensive Stance, so sit a moment, for I've a few words on how tae use it." },
        { id = "h_old", when = { class = "WARRIOR", minLevel = 30 }, text = "I tested ye once, an' ye passed, an' now look at the iron on ye. I'll admit I didnae think ye'd get this far, an' I've never been happier tae be wrong." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick an' make it plain, for that's how a warrior speaks." },
        { id = "h_again2", text = "Go on, I'm listenin', but stand up straight while ye talk." },
      },
      choices = {
        { text = "Granis Swiftaxe sent me to you.", next = "test", when = { class = "WARRIOR" } },
        { text = "What do you test them on?", next = "test" },
        { text = "The Stormpikes are a proud clan, I hear.", next = "clan" },
        { text = "Your hall is full of young fighters.", next = "hall" },
        { text = "Vejrek fought harder than I expected.", next = "vejrek_fought", when = { class = "WARRIOR", questDone = TODO_QUEST("Vejrek") } },
        { text = "What is Defensive Stance really for, Muren?", next = "defstance", when = { class = "WARRIOR", minLevel = 10 } },
        { text = "A gnome's head is level with a troll's knee.", next = "gnome", when = { race = "Gnome", class = "WARRIOR", maxLevel = 19 } },
        { text = "My kin fight for the clan in Alterac.", next = "kin", when = { origin = "dwarf_stormpike" } },
        { text = "I'll be off, Muren.", next = "END" },
      },
    },
    test = {
      lines = { { id = "te_default", text = "There's a frost troll called Vejrek who's been raidin' the high passes, an' I want his head. A warrior who can bring it back has earned a proper weapon." } },
      choices = {
        { text = "Why Vejrek, and not some other troll?", next = "test_vejrek" },
        { text = "What happens after I bring it?", next = "test_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_vejrek = {
      lines = { { id = "tv_default", text = "Because he's clever as well as strong, an' he's killed three mountaineers this season. A troll who only hits hard is a test for a hunter; a troll who thinks is a test for a warrior." } },
      choices = {
        { text = "Then I'll outthink him.", next = "test_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_how = {
      big = true,
      lines = { { id = "th_default", text = "That's the spirit, but tell me how. Do ye go at him head on, or wait for him tae make a mistake?" } },
      choices = {
        { text = "Head on. A warrior doesn't hide.", next = "BACK", reply = "Brave, an' maybe foolish, but brave's what I'm lookin' for. Keep yer shield high.", fx = { align = { honor = 1 } } },
        { text = "I'll wait for an opening and strike from behind.", next = "BACK", reply = "Hmph. Not the Stormpike way, but a dead troll's a dead troll, I suppose.", fx = { align = { honor = -1 } } },
      },
    },
    test_after = {
      lines = { { id = "ta_default", text = "Then ye'll go tae Tormus Deepforge at the Great Forge, an' he'll have more for ye. Tormus makes the grey iron weapons we give tae warriors who've proven themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clan = {
      lines = { { id = "cl_default", text = "Proud, aye, an' we've reason tae be. Stormpikes have fought in every war Ironforge ever had, an' now our kin are pushin' into Alterac, where the orcs have dug in." } },
      choices = {
        { text = "Alterac Valley? What's there?", next = "clan_alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan_alterac = {
      big = true,
      lines = { { id = "ca_default", text = "Old dwarven land, an' iron in the hills, an' a clan o' Frostwolf orcs who say it's theirs. We say it's ours, an' we've the deeds tae prove it." } },
      choices = {
        { text = "Then it's yours, and you should take it.", next = "BACK", reply = "That's how I see it too. Lieutenant Rotimer in the Commons is takin' names, if ye want tae help.", fx = { align = { order = 1 } } },
        { text = "Old deeds don't make a fight right.", next = "BACK", reply = "Maybe no', but iron does. Mind yer tongue near my kin.", fx = { align = { order = -1 } } },
      },
    },
    vejrek_fought = {
      big = true,
      lines = {
        { id = "vf_default", text = "He would have, for he knew he was fightin' for his life, an' a troll fightin' for his life is a different beast from one fightin' for a meal. Tell me true, now: did ye feel sorry for him at the end?" },
      },
      choices = {
        { text = "A little. He died defending his people.", next = "BACK", reply = "Aye, an' that's what makes ye a warrior an' no' a butcher. Keep that.", fx = { align = { light = 1 } } },
        { text = "No. He killed three mountaineers.", next = "BACK", reply = "He did, an' they'd thank ye for it. That's a hard answer, an' a fair one.", fx = { align = { light = -1 } } },
        { text = "I'd rather not say, Muren.", next = "BACK" },
      },
    },
    defstance = {
      lines = {
        { id = "ds_default", text = "It's for the day ye stop fightin' for yerself an' start fightin' for the dwarf behind ye, an' that's the day ye truly become a warrior. Ye'll hit softer an' bleed less, an' with Taunt an' Sunder Armor the beast'll forget the priest is even there." },
        { id = "ds_low", when = { maxLevel = 9 }, text = "It's a thing ye'll earn from me, an' no' before ye're ready, so dinnae ask me tae describe a meal ye've no' yet sat down tae. Come back when ye've ten summers o' fightin' an' a strong stomach for the snow." },
      },
      choices = {
        { text = "Then I'll fight for the one behind me.", next = "BACK", reply = "Aye, that's a Stormpike's answer, whatever yer name is.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I fight for myself first, Muren.", next = "BACK", reply = "Then ye'll use the stance tae save yer own skin, an' it'll do that too. It's a start.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Aye, an' a troll's knee is a fine thing tae hit, for he cannae fight standin' on one leg. I've sent gnomes after Vejrek before an' they came back wi' his head, so dinnae let the dwarves at the bar tell ye different." } },
      choices = { { text = "Knees first, then. Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    kin = {
      lines = { { id = "ki_default", text = "Then they fight for all of us, an' I'll raise a glass tae them in the Stonefire tonight. Vanndar holds Dun Baldar wi' too few, so if ye've a mind tae join them, Lieutenant Rotimer in the Commons can tell ye where tae go." } },
      choices = {
        { text = "I'll go when I'm ready. The clan comes first.", next = "BACK", reply = "Spoken like a Stormpike. I'll tell yer kin ye said so.", fx = { affinity = 2 } },
        { text = "I'll make my own name before the clan's.", next = "BACK", reply = "Hmph. Every Stormpike says that once, an' then comes home tae Alterac.", fx = { trait = { stern = 1 } } },
      },
    },
    hall = {
      lines = { { id = "ha_default", text = "Aye, an' most o' them will be dead or famous in ten years, an' I cannae tell which by lookin'. That's why I test them; it saves the Dark Irons the trouble." } },
      choices = { { text = "That's a grim way to think, Muren.", next = "BACK" } },
    },
  },
  topics = {
    alterac_valley = { { id = "tp_av", text = "It's Stormpike land, an' the Frostwolf orcs can argue the point wi' our rifles if they like." } },
    background = { { id = "tp_bg", text = "I'm a Stormpike an' a warrior, an' I've tested more young fighters than I can count." } },
    _none = { { id = "tp_none", text = "That's no' my concern, {g:lad|lass}, so go an' ask somebody who cares about it." } },
  },
}

---------------------------------------------------------------------------
-- Tormus Deepforge: smith at the Great Forge who makes grey iron weapons for warriors who pass Muren's test.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tormus", id = TODO_NPC("Tormus Deepforge"), name = "Tormus Deepforge",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "gruff", "proud" }, values = { "craft", "honest" },
  notices = { "class", "craft" },
  impression = {
    first = "He only gives his weapons to those who earn them twice.",
    third = "{name} met Tormus Deepforge, a smith at the Great Forge who makes grey iron weapons for proven warriors.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the sparks, an' state yer business. I've three blades on the fire an' no patience for idle talk." },
    { id = "g_back", when = { metBefore = true }, text = "You again, is it? If ye've come tae watch me work, stand back an' don't touch anythin'." },
    { id = "g_muren", when = { questActive = TODO_QUEST("Tormus Deepforge") }, text = "Muren sent ye, did he? Then ye've killed Vejrek, an' I'll believe it when I've seen yer hands." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, eh? Ye hold yer hammer too high, I'd guess, but most young smiths do." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, so let me see yer weapon. Hmph, it's held together by hope, an' I've seen better on a trogg." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tormus Deepforge, smith o' the Great Forge, an' my family's worked iron in this hall since before the kings had beards. I make the grey iron weapons for warriors who've proved their worth, an' nobody else gets one." },
        { id = "h_comp", when = { questActive = TODO_QUEST("Ironband's Compound") }, text = "Ye've no' finished at Ironband's Compound yet. I'll no' put grey iron in yer hands until ye have, so get tae it." },
        { id = "h_done", when = { questDone = TODO_QUEST("Grey Iron Weapons") }, text = "That's my grey iron on yer belt, an' ye're still wearin' it proudly. Keep it oiled, an' it'll outlive ye." },
        { id = "h_old", when = { class = "WARRIOR", minLevel = 30 }, text = "Ye've put my grey iron aside for somethin' heavier, I see, an' I'll no' take offence, for a blade's meant tae be outgrown. Show me what ye carry now, an' I'll tell ye who made it badly." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? These blades won't quench themselves, an' I'll no' let them sit." },
        { id = "h_again2", text = "Go on, then, while the iron's heatin', but keep it short." },
      },
      choices = {
        { text = "What makes grey iron special?", next = "iron" },
        { text = "What's at Ironband's Compound?", next = "compound" },
        { text = "This forge must never cool.", next = "forge" },
        { text = "Which grey iron weapon should a warrior choose?", next = "choose", when = { class = "WARRIOR", any = { { questActive = TODO_QUEST("Ironband's Compound") }, { questDone = TODO_QUEST("Ironband's Compound") } } } },
        { text = "I've outgrown your grey iron, Tormus.", next = "outgrown", when = { class = "WARRIOR", minLevel = 25, questDone = TODO_QUEST("Grey Iron Weapons") } },
        { text = "Can you teach me a thing or two?", next = "smithtalk", when = { profession = "Blacksmithing" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    iron = {
      lines = { { id = "ir_default", text = "It's ore from deep under Dun Morogh, an' it takes the heat slow an' gives it up slow. A grey iron blade bends before it breaks, an' a warrior needs that more than he knows." } },
      choices = {
        { text = "Where does the ore come from?", next = "iron_ore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron_ore = {
      lines = { { id = "io_default", text = "From the old shafts, the ones the Dark Irons haven't found yet. I'll no' say more, for I've heard their spies are everywhere these days." } },
      choices = {
        { text = "You think there are spies in Ironforge?", next = "iron_spies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron_spies = {
      big = true,
      lines = { { id = "is_default", text = "I think a Dark Iron can shave his beard an' wash the soot off his face like any other dwarf. Tell me, would ye report a neighbour if ye only suspected him?" } },
      choices = {
        { text = "Yes. Better safe than sorry.", next = "BACK", reply = "Aye, that's what I'd do, though my wife says I'm too suspicious by half.", fx = { align = { order = 1 } } },
        { text = "No. Suspicion alone isn't proof.", next = "BACK", reply = "That's fair, an' maybe kinder than me, but keep yer eyes open all the same.", fx = { align = { order = -1 } } },
      },
    },
    compound = {
      lines = { { id = "co_default", text = "Ironband's Compound lies south o' Helm's Bed Lake, east o' Kharanos, an' the Dark Irons have taken it an' dug in. There's a load o' Umbral Ore in a strongbox there that I want for the weapons, so fetch it out from under their noses, an' I'll know ye're worth my iron." } },
      choices = {
        { text = "Dark Irons so close to Kharanos?", next = "compound_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    compound_dark = {
      lines = { { id = "cd_default", text = "Aye, an' that's what keeps me up at night, for if they can dig in by the lake, they can dig anywhere. Mind the basement when ye go, for whoever leads them down there will no' be a raw recruit like the ones at the gate." } },
      choices = { { text = "I'll mind the basement. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    choose = {
      big = true,
      lines = { { id = "ch_default", text = "Axe, mace, sword or dagger, all o' them forged wi' that Umbral ore, an' I'll tell ye now that the choosin' says more about ye than the weapon does. The mace is for the patient, the axe for the stubborn, the sword for the quick, an' the dagger for the ones who should've been rogues." } },
      choices = {
        { text = "The axe. Stubborn suits me.", next = "BACK", reply = "Ha! A dwarf's answer, whatever ye are.", fx = { affinity = 1 } },
        { text = "The mace. I'll wait for the right blow.", next = "BACK", reply = "Good, patience is the rarest metal in this hall.", fx = { trait = { cautious = 1 } } },
        { text = "The sword. Quick hands win fights.", next = "BACK", reply = "They do, until they meet a dwarf wi' a mace. Choose it anyway.", fx = { trait = { brave = 1 } } },
      },
    },
    outgrown = {
      lines = { { id = "og_default", text = "Course ye have, for grey iron's for the first year an' no' the tenth. Hang it on a wall somewhere, an' when a young one asks ye what it was for, tell them about Vejrek an' the Compound, for that's what it's really made of." } },
      choices = {
        { text = "I've hung it above my bed already.", next = "BACK", reply = "Good. That's the best place for it, an' the worst place for a thief.", fx = { affinity = 2 } },
        { text = "I sold it to a merchant, honestly.", next = "BACK", reply = "Hmph. Then some trogg will be carryin' it next spring, an' I'll have tae make another.", fx = { trait = { witty = 1 } } },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "It hasnae cooled in my lifetime, nor my grandfather's, an' the day it does, Ironforge will be finished. Every smith in this hall feeds it, an' we're proud o' it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smithtalk = {
      lines = { { id = "sm_default", text = "Bengus Deepforge's the trainer, an' he'll teach ye properly. But I'll tell ye one thing: watch the colour, no' the clock, for the iron tells ye when it's ready." } },
      choices = { { text = "Thanks for the tip.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Deepforges have worked iron in this hall for generations, an' I'm no different, save that I'm better at it than most." } },
    _none = { { id = "tp_none", text = "Unless it's iron or fire, I couldnae care less about it, so ask me about one o' those." } },
  },
}

---------------------------------------------------------------------------
-- Roetten Stonehammer: Reclaimers Inc. agent pacing the Library, recruiting for work in Desolace.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_roetten", id = TODO_NPC("Roetten Stonehammer"), name = "Roetten Stonehammer", title = "Reclaimers Inc.",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "restless", "salesman" }, values = { "profit", "practical" },
  notices = { "greenness", "craft" },
  impression = {
    first = "He talks about Desolace as though it were a gold mine.",
    third = "{name} met Roetten Stonehammer, a Reclaimers Inc. agent in the Ironforge Library who recruits for salvage work in Desolace.",
  },
  greetings = {
    { id = "g_hi", text = "Reclaimers Inc., at your service! Well, at our service, really, but you'll be paid for it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again! Thought any more about Desolace? It's not as bad as they say, mostly." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Then you already know what a clean Desolace reagent fetches, and you'll understand why I can't sit still." },
    { id = "n_vet", cat = "greenness", when = { minLevel = 30 },
      text = "Now you've the look of someone who could cross Desolace and come back with the cargo, which is exactly the sort we're after." },
    { id = "n_young", cat = "greenness", when = { maxLevel = 25 },
      text = "You're a bit green for our line of work, if you don't mind me saying. Come back with a few more scars." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Roetten Stonehammer, Reclaimers Inc. We recover things, lost cargo and sunken chests and the like, from places too dangerous for honest merchants to go. Right now that's Desolace, and we're short of hands." },
        { id = "h_active", when = { questActive = TODO_QUEST("Reclaimers' Business in Desolace") }, text = "Off to Desolace, are you? Find our people at Nijel's Point, and tell them Roetten sent you, and don't drink the water." },
      },
      again = {
        { id = "h_again3", text = "Something more? Go on, the ship's late anyway, and so is everything else this week." },
        { id = "h_again", text = "Anything else? I've letters to write and a ship to catch." },
        { id = "h_again2", text = "Ask away, but walk with me, if you don't mind." },
      },
      choices = {
        { text = "What's in Desolace worth recovering?", next = "desolace" },
        { text = "What does Reclaimers Inc. do, exactly?", next = "company" },
        { text = "You're pacing a groove into the Library floor.", next = "pacing" },
        { text = "Why recruit in a library, of all places?", next = "library" },
        { text = "I know what Desolace reagents are worth.", next = "reagents", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "I've finished your company's business in Desolace.", next = "done", when = { questDone = TODO_QUEST("Reclaimers' Business in Desolace") } },
        { text = "Farewell, Roetten.", next = "END" },
      },
    },
    desolace = {
      lines = { { id = "de_default", text = "Shipwrecks along the coast, for one, like the Karnitol, which went down with a chest nobody's ever recovered. And there's reagents to gather, odd things only Desolace grows, that alchemists pay handsomely for." } },
      choices = {
        { text = "Tell me about the Karnitol.", next = "desolace_karnitol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    desolace_karnitol = {
      lines = { { id = "dk_default", text = "Merchant ship, sank off the coast with her captain's chest still aboard. The naga have been circling the wreck, which means there's something in it worth having." } },
      choices = {
        { text = "Or something that's better left alone.", next = "desolace_left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    desolace_left = {
      big = true,
      lines = { { id = "dl_default", text = "Ha! Spoken like someone who's never had to make payroll. Tell me, would you leave a fortune at the bottom of the sea because it might be cursed?" } },
      choices = {
        { text = "If it's cursed, yes. Not worth the risk.", next = "BACK", reply = "Then you'll be poor, but alive, and there's something to be said for that.", fx = { align = { light = 1 } } },
        { text = "No. A fortune's a fortune.", next = "BACK", reply = "Now you're talking like a Reclaimer! I like you already.", fx = { align = { light = -1 } } },
      },
    },
    company = {
      lines = { { id = "co_default", text = "We find what's lost and return it to whoever pays, mostly the original owner, sometimes not. It's honest work, if you squint, and better paid than mining." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pacing = {
      lines = { { id = "pa_default", text = "Am I? The librarians keep giving me looks, so I suppose I must be. Our last shipment from Nijel's Point is a week late, and I can't think about anything else." } },
      choices = { { text = "I hope it turns up.", next = "BACK", fx = { affinity = 1 } } },
    },
    library = {
      lines = { { id = "li_default", text = "Because the Explorers' League keeps every chart and shipping record in Khaz Modan under this roof, and a wreck is only worth chasing if you know what she carried. Mae Paledust lets me read the manifests so long as I keep my voice down, which I mostly manage." } },
      choices = {
        { text = "The League doesn't mind you profiting from its records?", next = "library_league" },
        { text = "Something else.", next = "BACK" },
      },
    },
    library_league = {
      lines = { { id = "ll_default", text = "The League digs for knowledge and we dig for cargo, and we stay out of each other's holes. Laris Geardawdle over there has even asked me to bring him back a jar of anything that oozes, and I've told him I'll think about the price." } },
      choices = {
        { text = "You'd charge a scholar for a jar of slime?", next = "library_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    library_price = {
      lines = { { id = "lp_default", text = "I'd charge my own mother for a jar of slime, if she wanted it carried out of Desolace past the centaur. Carriage is the cost, friend, and the slime itself comes free." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    reagents = {
      lines = { { id = "re_default", text = "Then you'll know the trouble, too, which is that everything worth picking out there grows beside something that wants to kill you. We pay by the bundle at Nijel's Point, and we pay better for bundles that aren't crushed." } },
      choices = {
        { text = "I pack my herbs properly.", next = "BACK", reply = "Then you're already ahead of our last three hires, and I mean that kindly.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "dn_default", text = "So I heard, and the letter from Nijel's Point spoke well of you, which they never do. The shipment's still late, mind, but that's the sea's fault and not yours." } },
      choices = { { text = "Glad it went well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    nijels_point = { { id = "tp_nijel", text = "It's the Alliance's foothold in Desolace, up in the northern hills, and our people keep an office there. It's the only place in that whole grey country where you can sleep without one hand on your purse." } },
    explorers_league = { { id = "tp_league", text = "Good neighbours, if a little slow to get to the point. They'll spend a year measuring a wall that we'd have crated and shipped in a week." } },
    desolace = { { id = "tp_desolace", text = "Grey, dusty and full of centaur, but rich as anything if you know where to dig." } },
    background = { { id = "tp_bg", text = "I'm a Reclaimer. That says it all, really." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend, unless there's money in it." } },
  },
}

---------------------------------------------------------------------------
-- Pilot Longbeard: retired gyrocopter pilot in the Hall of Arms, friend of the Brassbolts brothers.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_longbeard", id = TODO_NPC("Pilot Longbeard"), name = "Pilot Longbeard",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial", "nostalgic" }, values = { "friendship", "adventure" },
  notices = { "race", "craft" },
  impression = {
    first = "He has a story ready for anyone who stands still.",
    third = "{name} met Pilot Longbeard, a jovial dwarf pilot in the Hall of Arms with friends among the racers of the Shimmering Flats.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Up late, are ye? So am I, for an old pilot never sleeps sound wi'out an engine hummin' under him." },
    { id = "g_hi", text = "Ho there! Pilot Longbeard, at your service, though my flyin' days are fewer than they were." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have ye been tae the Shimmering Flats yet? Tell me everythin'." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Ye've oil under yer nails, an' that's the mark o' somebody who'd keep a gyrocopter in the air instead o' just ridin' in one." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I've flown wi' more gnomes than dwarves, an' they've never once let me down, except when they forgot the fuel." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I flew gyrocopters for the army back in the day, an' now I mostly tell stories about it. But I've friends out at the Shimmering Flats, the Brassbolts brothers, an' they could use a hand." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Brassbolts Brothers") }, text = "Off tae the Flats, are ye? Tell the Brassbolts I said hello, an' tell them their engine's still too loud." },
      },
      again = {
        { id = "h_again3", text = "Still here? Good, for the recruits round here have heard all my stories twice." },
        { id = "h_again", text = "What else, friend? I've stories enough for a week." },
        { id = "h_again2", text = "Go on, ask. I love a good question." },
      },
      choices = {
        { text = "Who are the Brassbolts brothers?", next = "brothers" },
        { text = "Tell me about your flying days.", next = "flying" },
        { text = "You must know Pilot Stonegear.", next = "stonegear" },
        { text = "The Hall of Arms is an odd roost for a pilot.", next = "hall" },
        { text = "I know my way around an engine.", next = "engine", when = { any = { { profession = "Engineering" }, { race = "Gnome" } } } },
        { text = "I've met your friends on the Flats.", next = "met", when = { questDone = TODO_QUEST("The Brassbolts Brothers") } },
        { text = "Farewell, Pilot.", next = "END" },
      },
    },
    brothers = {
      lines = { { id = "br_default", text = "Two gnomes who race rocket cars across the salt flats in Thousand Needles, an' they're the fastest things on wheels I've ever seen. They're racin' against a goblin team, an' it's gettin' nasty." } },
      choices = {
        { text = "Nasty how?", next = "brothers_nasty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_nasty = {
      lines = { { id = "bn_default", text = "Sabotage, mostly, an' a few blown tyres that weren't accidents. The goblins'll do anythin' tae win, an' my friends are too honest by half." } },
      choices = {
        { text = "Then they should fight dirty too.", next = "brothers_dirty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_dirty = {
      big = true,
      lines = { { id = "bd_default", text = "I've said the same, an' they won't hear it. What would ye do, if ye were them?" } },
      choices = {
        { text = "Win clean. Let the goblins disgrace themselves.", next = "BACK", reply = "That's what they'd say, an' I'm proud o' them for it, even if it costs them.", fx = { align = { honor = 1 } } },
        { text = "Sabotage the goblins first. Fair's fair.", next = "BACK", reply = "Ha! I like ye, but don't tell the brothers I said so.", fx = { align = { honor = -1 } } },
      },
    },
    flying = {
      lines = { { id = "fl_default", text = "I flew scouting runs over the Burning Steppes durin' the Second War, an' I've the burns tae prove it. A gyrocopter's a wonderful thing until somethin' starts shootin' at it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stonegear = {
      lines = { { id = "st_default", text = "Every pilot in Khaz Modan knows every other, an' Stone's one o' the best o' the young ones. He's out at Steelgrill's Depot now wi' that siege engine o' his, an' I hear he talks tae it more than tae folk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hall = {
      lines = { { id = "hl_default", text = "It is, but the airfield's a long cold climb an' the Hall has a fire an' folk tae talk at. Muren Stormpike lets me sit so long as I don't tell his young warriors that the real fightin' is done from the air." } },
      choices = {
        { text = "And do you tell them anyway?", next = "hall_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_tell = {
      lines = { { id = "ht_default", text = "Every chance I get, an' Muren pretends he cannae hear me. Belia Thundergranite says I'm worse than her bears for noise, an' she may be right, though the bears never flew over Blackrock." } },
      choices = { { text = "You like it here, I think.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    engine = {
      lines = {
        { id = "en_default", text = "Then tell me this, for the Brassbolts an' I have argued it for years: is it better tae build an engine that's fast, or one that comes home every time?" },
        { id = "en_gnome", when = { race = "Gnome" }, text = "O' course ye do, ye were likely born holdin' a spanner. So settle an argument for me: should an engine be built fast, or built tae come home every time?" },
      },
      choices = {
        { text = "One that comes home. A pilot matters more than a race.", next = "BACK", reply = "That's a pilot's answer, an' it's kept me alive, though it never won me a race.", fx = { align = { order = 1 } } },
        { text = "Fast. Nobody remembers the careful ones.", next = "BACK", reply = "Ha! Ye'd get on wi' the brothers, an' ye'd likely lose yer eyebrows alongside them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    met = {
      lines = { { id = "me_default", text = "Did ye now! An' are they well, an' is that rocket car still held together wi' hope an' rivets? I'd fly out myself if my knees would take the landin'." } },
      choices = {
        { text = "They're well, and still racing.", next = "BACK", reply = "Then that's the best news I've had this month, an' I thank ye for carryin' it back.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    gyrocopters = { { id = "tp_gyro", text = "Gnomish cleverness wi' dwarven nerve in the seat, an' that's the only way they've ever worked. Ye fly them by ear, for when the engine changes its tune ye've about a breath tae find somewhere flat." } },
    burning_steppes = { { id = "tp_steppes", text = "I've seen it from above, an' it's all ash an' orc fires as far as the mountain. I didnae care for it then, an' I'd no' care for it now." } },
    shimmering_flats = { { id = "tp_flats", text = "Salt as far as the eye can see, an' rocket cars racin' across it. Best place in the world, if ye ask me." } },
    background = { { id = "tp_bg", text = "I'm an old pilot wi' more stories than sense." } },
    _none = { { id = "tp_none", text = "No idea, friend, unless it flies." } },
  },
}

---------------------------------------------------------------------------
-- Artilleryman Sheldonore: Commons artilleryman who thinks bows are for sissies.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_sheldonore", id = TODO_NPC("Artilleryman Sheldonore"), name = "Artilleryman Sheldonore",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "loud", "boastful" }, values = { "proud", "craft" },
  notices = { "class", "craft" },
  impression = {
    first = "He seems to think archery is a hobby for elves.",
    third = "{name} met Artilleryman Sheldonore, a gun-loving dwarf in the Commons who thinks arrows are for sissies.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf, good! Now tell me ye carry a rifle an' no' one o' those bent sticks, an' we'll be friends." },
    { id = "g_hi", text = "Bang! Ha, made ye jump, didn't I? Artilleryman Sheldonore, an' I love the sound o' a good rifle." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye've no' taken up the bow, I hope?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Arrows Are For Sissies") }, text = "Got what I asked for yet? I'm itchin' tae get to work." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that powder I smell on ye? An engineer! Now there's a trade that understands a proper bang." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? If that's a bow on yer back, we need tae have a word." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I served on the big guns along the walls for twenty years, an' I've never met a problem that couldnae be solved by more powder. Arrows are for sissies, an' I'll say it tae any elf's face." },
        { id = "h_done", when = { questDone = TODO_QUEST("Arrows Are For Sissies") }, text = "There's the one who saw sense! How's that rifle treatin' ye? Better than any bow, I'll wager." },
      },
      again = {
        { id = "h_again3", text = "Eh? Ask it again, an' louder this time, for the guns took the top off my hearin' years ago." },
        { id = "h_again", text = "What else? Make it loud, my ears are no' what they were." },
        { id = "h_again2", text = "Go on, speak up!" },
      },
      choices = {
        { text = "Why do you hate bows?", next = "bows" },
        { text = "What did you do on the walls?", next = "walls" },
        { text = "My bow has served me well.", next = "defend", when = { class = "HUNTER" } },
        { text = "The Commons is a quiet post for a gunner.", next = "commons" },
        { text = "I mix my own powder.", next = "powder", when = { profession = "Engineering" } },
        { text = "Farewell, Sheldonore.", next = "END" },
      },
    },
    bows = {
      lines = { { id = "bo_default", text = "I don't hate them, I just don't respect them. A bow's a stick wi' a string, an' a rifle's a work o' art, made by dwarven hands wi' dwarven powder." } },
      choices = {
        { text = "So you want me to switch?", next = "bows_switch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bows_switch = {
      lines = { { id = "bs_default", text = "I want ye tae see sense, an' I'll make it worth yer while. Bring me what I need, an' I'll show ye what a proper gun can do." } },
      choices = {
        { text = "What makes a rifle better than a bow?", next = "bows_better" },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    bows_better = {
      lines = { { id = "bb_default", text = "Range, noise an' the look on a troll's face when the shot lands, an' ye don't need arms like a blacksmith tae draw it. Any dwarf can learn the rifle, an' the elves need a hundred years tae learn the bow." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    walls = {
      lines = { { id = "wa_default", text = "Manned the cannons, an' kept the powder dry, an' kept the Horde off the gates in the Second War. Loud work, an' I loved every minute o' it." } },
      choices = {
        { text = "Did you ever fire on the orcs yourself?", next = "walls_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walls_orcs = {
      big = true,
      lines = { { id = "wo_default", text = "More times than I can count, an' I'd do it again tomorrow. Tell me, d'ye think the orcs can be trusted now, with this new Horde o' theirs?" } },
      choices = {
        { text = "Never. Keep the powder dry.", next = "BACK", reply = "That's what I like tae hear! Keep yer rifle loaded.", fx = { align = { order = 1 } } },
        { text = "Maybe. People can change.", next = "BACK", reply = "Hmph. Maybe, but I'll believe it when I see it.", fx = { align = { order = -1 } } },
      },
    },
    defend = {
      big = true,
      lines = { { id = "de_default", text = "Has it, now? Then ye've no' seen what a dwarven rifle can do. Will ye give one a try, at least?" } },
      choices = {
        { text = "I'll try one. I'm not too proud to learn.", next = "BACK", reply = "That's the spirit, an' once ye've felt a good stock against yer shoulder, ye'll never look back.", fx = { align = { honor = 1 } } },
        { text = "No. My bow and I are done talking.", next = "BACK", reply = "Suit yerself, but don't come cryin' when yer string snaps.", fx = { align = { honor = -1 } } },
      },
    },
    commons = {
      lines = { { id = "cm_default", text = "Quiet! Wi' the auctioneers bellowin' an' Lieutenant Rotimer shoutin' for volunteers ten paces off? I came down off the walls for a rest, an' I've had less peace here than I had beside a cannon." } },
      choices = {
        { text = "You and Rotimer must get along.", next = "commons_rotimer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    commons_rotimer = {
      lines = { { id = "cr_default", text = "He's a good lad wi' a good cause, an' I'll no' hear a word against the Stormpike. I only wish he'd ask for gunners instead o' axes, for one decent battery would settle that valley by teatime." } },
      choices = { { text = "You should tell him that.", next = "BACK", reply = "I have, an' loudly. He says Vanndar's got cannons enough, which shows ye what officers know.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    powder = {
      lines = { { id = "po_default", text = "Do ye, now! Then ye'll know it's all in the grain, for coarse powder throws a ball an' fine powder throws a tantrum. Who taught ye, somebody up in Tinker Town?" } },
      choices = {
        { text = "I mostly learned by blowing things up.", next = "BACK", reply = "Ha! That's the only school worth attendin', so long as ye graduate wi' all yer fingers.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_war", text = "The Horde came at Khaz Modan wi' everythin' it had, an' the gates o' Ironforge never opened for them. I like tae think my battery had a say in that." } },
    stormpike = { { id = "tp_storm", text = "Good dwarves in a hard valley. Rotimer'll tell ye the rest, whether ye ask him or no'." } },
    rifles = { { id = "tp_rifles", text = "Buy dwarven, keep it oiled, an' never lend it tae a gnome who says he can improve it. That's forty years o' wisdom, free." } },
    background = { { id = "tp_bg", text = "I'm an artilleryman, an' proud o' it. Twenty years on the guns." } },
    _none = { { id = "tp_none", text = "Eh? Speak up! Oh, never mind, I wouldnae know anyway." } },
  },
}

---------------------------------------------------------------------------
-- Alexander Calder: human warlock trainer in Bonegrip's Runes and Dooms.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_calder", id = TODO_NPC("Alexander Calder"), name = "Alexander Calder", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "cold", "precise" }, values = { "power", "knowledge" },
  notices = { "class", "race" },
  impression = {
    first = "Alexander Calder stands among Gerrig Bonegrip's shelves in a dark coat, a tall human in a cavern built for dwarves. He speaks as if each word costs him, and he rarely blinks.",
    third = "{name} met Alexander Calder, a human warlock trainer in the Forlorn Cavern.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's good to see you. Few of my students listen as well as you do." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll teach you, since it's my duty, but I'll not waste kind words on you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The cavern is quieter at this hour, and I prefer it. Speak softly, if you must speak." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back down the stairs. Most do not, once they have seen the shelves." },
    { id = "g_hi", text = "Yes? If you've come to learn, I'll teach you, and if not, I'd prefer you didn't linger among the books." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another of the craft, and in one piece. I trust your servants have been behaving themselves?" },
    { id = "g_lockh", when = { class = "WARLOCK", race = "Human" }, text = "A human warlock under Ironforge rather than under Stormwind. Either the Lamb's cellar was too crowded for you, or you have the sense I had." },
  },
  notice = {
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You carry the Light in here as if it were a lantern in a cellar. Hold it as high as you like, but do not expect me to squint." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. Your people take to this art more readily than the dwarves do, and I have never decided whether that is curiosity or simply a lack of fear." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the shadow well. Some take years to stop flinching from it." },
    { id = "n_steed", cat = "class", when = { class = "WARLOCK", minLevel = 40 },
      text = "You have walked a long way on your own feet for someone of your standing. We should speak about that." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He closes the book he was reading without marking the page, as though he already knows where he left off.",
      lines = {
        { id = "h_default", text = "Alexander Calder. I teach those who would master the shadow, in a cavern where nobody asks too many questions, and the dwarves tolerate us, which is more than Stormwind ever did." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Then you are a student, and I will tell you what I tell all of them: I teach power, and what you do with it is a matter for you and whatever gods still speak to you. What would you learn today?" },
      },
      again = {
        { id = "h_again3", text = "You have more questions. Ask them quietly, please, because Gerrig's customers startle easily." },
        { id = "h_again", text = "Is there anything else? I would ask you to be brief." },
        { id = "h_again2", when = { class = "WARLOCK" }, text = "Go on, then, and ask what you came down here to ask." },
      },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'm tired of walking everywhere.", next = "steed", when = { class = "WARLOCK", minLevel = 40 } },
        { text = "What do you teach that the gnomes don't?", next = "power", when = { class = "WARLOCK" } },
        { text = "Why teach here, and not in Stormwind?", next = "stormwind" },
        { text = "Isn't what you teach dangerous?", next = "danger" },
        { text = "You teach out of the back of a bookshop.", next = "shop" },
        { text = "The Light has no quarrel with you, if you keep control.", next = "holy", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    stormwind = {
      lines = { { id = "st_default", text = "There are warlocks in Stormwind, beneath the Slaughtered Lamb, but they're watched closely by the Church. Here, the dwarves care more about whether we pay our rent than what we do with our evenings." } },
      choices = {
        { text = "Who teaches in the Lamb's cellar?", next = "lamb" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    lamb = {
      lines = {
        { id = "lb_default", text = "Demisette Cloyce, who trained me and still writes to remind me of it, and Gakin the Darkbinder, who sets the bindings. They are good teachers working under a cathedral's shadow, and a teacher who is always looking over his shoulder cannot look closely at anything else." },
      },
      choices = {
        { text = "Is that the only reason you left?", next = "lamb2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    lamb2 = {
      lines = { { id = "lb2_default", text = "No. Some years ago the Defias broke into the cellar and carried off tomes that should never have left it, and the Church's answer was to watch us harder rather than to catch the thieves. I decided I would rather be trusted by dwarves than suspected by my own city." } },
      choices = {
        { text = "The Defias have warlocks of their own, then.", next = "BACK", reply = "They have stolen books and a few fools who can read them, and that is worse than having warlocks." },
        { text = "That's a fair grievance.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "Of course it is, and so is a forge, and so is a rifle. Power is always dangerous to those who can't control it, and only somewhat less dangerous to those who can." } },
      choices = {
        { text = "And can you control it?", next = "danger_control" },
        { text = "I'll take your word for it.", next = "BACK" },
      },
    },
    danger_control = {
      big = true,
      lines = { { id = "dc_default", text = "I've controlled it for twenty years, and I'm still here. Tell me, do you think power should be feared, or mastered?" } },
      choices = {
        { text = "Feared. Some power should never be touched.", next = "BACK", reply = "Then you'll never be a warlock, and perhaps that's for the best.", fx = { align = { light = 1 } } },
        { text = "Mastered. Fear is for the weak.", next = "BACK", reply = "Now that's an answer I can respect, and I'd ask you to remember it the first time you're afraid.", fx = { align = { light = -1 } } },
      },
    },
    power = {
      lines = {
        { id = "pw_gnome", when = { race = "Gnome" }, text = "Briarthorn and Thistleheart teach you to keep a demon from killing you, which is necessary and dull. I teach you what to do with it once it has stopped trying, and that is the part that wins wars against the Legion." },
        { id = "pw_default", text = "The gnomes teach you to keep a demon from killing you, which is necessary and dull. I teach you what to do with it once it has stopped trying, and that is the part that wins wars against the Legion." },
      },
      choices = {
        { text = "You sound ambitious for a teacher.", next = "power2" },
        { text = "Back to the other questions.", next = "BACK" },
      },
    },
    power2 = {
      big = true,
      lines = { { id = "pw2_default", text = "I am ambitious, and I see no shame in it, since the Burning Legion is the most ambitious thing in creation and I would rather not meet it with modest goals. What about you, {class}? Why did you take this road?" } },
      choices = {
        { text = "For power. I'll not be weak again.", next = "BACK", reply = "An honest answer, and a dangerous one, which is how the honest ones usually are.", fx = { align = { light = -1 } } },
        { text = "To turn the Legion's weapons back on them.", next = "BACK", reply = "That's the answer the gnomes give, and I've noticed they live longer than the rest of us.", fx = { align = { light = 1 } } },
        { text = "I'm still working that out.", next = "BACK", reply = "Then work it out before your demon does it for you." },
      },
    },
    steed = {
      lines = { { id = "sd_default", text = "Then you're ready for the Felsteed, which is a demon of the Nether made to carry a rider and nothing more. I teach the summoning of it here, and it will bear you faster than any horse in Katie Hunter's paddock, though it will never once be glad of you." } },
      choices = {
        { text = "A demon that only carries me? Is it safe?", next = "steed2" },
        { text = "Then teach me.", next = "BUSINESS" },
      },
    },
    steed2 = {
      lines = { { id = "sd2_default", text = "Safer than most, because it has no wit to plot with, only hooves and fire. Feed it nothing, thank it never, and dismiss it before you dismount in a town, because the dwarves have very long memories for scorched cobbles." } },
      choices = { { text = "Never thank it. Noted.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    shop = {
      lines = { { id = "sh_default", text = "Gerrig Bonegrip rents me the corner, and in return my students buy his books. It is a sensible arrangement, since he asks nothing about my lessons and I ask nothing about where his manuscripts come from." } },
      choices = {
        { text = "What do you make of Gerrig?", next = "shop_gerrig" },
        { text = "Do the dwarves ever send you students?", next = "shop_students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_gerrig = {
      lines = { { id = "sg_default", text = "He is a collector, and collectors are safer than believers. A man who wants a forbidden book in order to own it will rarely do anything so foolish as read it aloud." } },
      choices = { { text = "That is a thin sort of comfort.", next = "BACK", reply = "It is the only sort this cavern offers, and I have learned to be content with it." }, { text = "Let's move on.", next = "BACK" } },
    },
    shop_students = {
      lines = { { id = "ss_default", text = "Very few, because a dwarf who feels the pull usually drinks until it goes away. Most who come down these stairs are gnomes from Tinker Town or humans who found Stormwind too watchful, and I turn away the ones who are only angry, since anger is a poor reason to open a door that does not close again." } },
      choices = {
        { text = "At least you turn some away.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    holy = {
      lines = { { id = "hy_default", text = "That is more generous than your Church has ever been, and I will accept it in the spirit you offer it. Control is the whole of what I teach, as it happens, and the rest is only vocabulary." } },
      choices = { { text = "Then we understand each other.", next = "BACK", fx = { affinity = 1 } }, { text = "I'll keep an eye on you all the same.", next = "BACK", reply = "Do, by all means. I have been watched by better." } },
    },
  },
  topics = {
    stormwind = { { id = "tp_sw", text = "A handsome city with a cathedral at its heart and my colleagues in its cellar. I did not care to live under a floor." } },
    demons = { { id = "tp_demons", text = "They are servants, and a servant you do not watch becomes a master. That is the first lesson, and for some students it is also the last." } },
    forlorn_cavern = { { id = "tp_cavern", text = "It is damp, ill lit, and avoided by everyone with a reputation to keep. I could not have designed a better classroom." } },
    gerrig = { { id = "tp_gerrig", text = "My landlord. He pays for books that others would burn, and I find it more restful not to ask why." } },
    slaughtered_lamb = { { id = "tp_lamb", text = "The tavern in Stormwind's Mage Quarter where I learned the craft, under Demisette Cloyce. The ale was poor and the lessons were not." } },
    background = { { id = "tp_bg", text = "I am a teacher from Stormwind who preferred a mountain over his head to a cathedral. The rest is my own affair." } },
    _none = { { id = "tp_none", text = "I have no interest in that, and I suspect you have better people to ask." } },
  },
}

---------------------------------------------------------------------------
-- Valgar Highforge: senior paladin of the Silver Hand in Ironforge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_valgar", id = TODO_NPC("Valgar Highforge"), name = "Valgar Highforge", title = "Paladin Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "stern", "kind" }, values = { "faith", "duty" },
  notices = { "class" },
  impression = {
    first = "He speaks gently and expects much of anyone who takes the hammer.",
    third = "{name} met Valgar Highforge, the senior paladin of the Silver Hand in Ironforge.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, there you are. Come in; I'll teach you gladly, for you've earned it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "My duty is to teach, not to like my students. Be grateful for the first." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've returned, an' that's good, for a body that comes back tae this hall o' its own accord is half taught already." },
    { id = "g_human", when = { race = "Human" }, text = "The Light be wi' ye, {g:son|daughter} o' Lordaeron or Stormwind, whichever it is. Yer people brought the Hand tae us, an' ye're welcome here." },
    { id = "g_hi", text = "The Light be with ye. Are ye here tae learn, or tae listen?" },
    { id = "g_pal", when = { class = "PALADIN" }, text = "Welcome back, brother or sister o' the Hand. What would ye learn today?" },
  },
  notice = {
    { id = "n_dwarfpal", cat = "class", when = { class = "PALADIN", race = "Dwarf" },
      text = "A dwarf o' the Hand. There were few enough of us when I took my oaths, an' it does an old heart good tae see another." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I ken what ye are, an' I'll no' pretend it sits easy wi' me. Mind what ye bring intae this hall." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "Ye carry the Light well, but mind ye don't carry it proudly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Valgar Highforge, an' I train paladins for the Silver Hand. It's no' an easy road, an' I'll no' pretend it is, but it's a road worth walkin'." },
      },
      again = {
        { id = "h_again3", text = "Ye've more on yer mind, I can see it. Out wi' it, then, for the Hall's quiet today." },
        { id = "h_again", text = "Anythin' else? The Light is patient, an' so am I." },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What's become of the Silver Hand?", next = "hand" },
        { text = "What makes a good paladin?", next = "good" },
        { text = "The Hall of Mysteries holds more than paladins.", next = "hall" },
        { text = "I took the same oaths you did.", next = "oaths", when = { class = "PALADIN" } },
        { text = "Farewell, Valgar.", next = "END" },
      },
    },
    hand = {
      lines = { { id = "ha_default", text = "We've seen better days. Uther's dead, Lordaeron's fallen, an' the order's scattered tae the winds. But the Light doesnae need a kingdom tae shine, an' we're still here." } },
      choices = {
        { text = "Who leads you now?", next = "hand_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_lead = {
      big = true,
      lines = { { id = "hl_default", text = "Nobody, an' everybody, which isnae how it should be. Some say we should rebuild the order; others say we should go north an' fight. What say ye?" } },
      choices = {
        { text = "Rebuild first. A scattered order can't fight.", next = "BACK", reply = "That's my thinking too, an' it's a slow, patient road.", fx = { align = { order = 1 } } },
        { text = "Go north now. The dead won't wait.", next = "BACK", reply = "Brave, an' maybe right. I pray for those who've gone.", fx = { align = { order = -1 } } },
      },
    },
    good = {
      lines = { { id = "go_default", text = "Humility, first an' last. The Light gives ye strength, but it can take it away just as quick if ye forget who it's for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hall = {
      lines = { { id = "hm_default", text = "Aye, we share it wi' the priests an' the mages, an' it works better than ye'd think. High Priest Rohan keeps the Light's side o' the house, an' the mages keep tae their own corner an' try no' tae set fire tae ours." } },
      choices = {
        { text = "How do paladins and priests differ, to you?", next = "hall_priests" },
        { text = "And the warlocks, down in the Forlorn Cavern?", next = "hall_warlocks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_priests = {
      lines = { { id = "hp_default", text = "A priest carries the Light tae folk who need it, an' a paladin stands between those folk an' whatever means them harm. Rohan would say it's the same work done wi' different tools, an' he's likely right, though my tool is heavier." } },
      choices = { { text = "Well said. Something else.", next = "BACK" } },
    },
    hall_warlocks = {
      big = true,
      lines = { { id = "hw_default", text = "The king permits them, an' so I hold my tongue an' keep my eyes open. There's some in the order who'd have them driven out o' the mountain, an' some who say a warlock ye can see is safer than one ye cannae. Where do ye stand?" } },
      choices = {
        { text = "Watch them, but let them be. They've broken no law.", next = "BACK", reply = "That's the king's own thinkin', an' it's mine on my better days.", fx = { align = { light = 1 } } },
        { text = "Drive them out. Shadow doesn't stay in its corner.", next = "BACK", reply = "Hard words, an' I've heard them from good dwarves. I'll no' say ye're wrong, only that it isnae mine tae order.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oaths = {
      lines = {
        { id = "oa_default", text = "Then ye ken they're easy tae say an' hard tae keep. I've buried better paladins than me who kept theirs tae the end, an' I think o' them every time a young one kneels here." },
        { id = "oa_dwarf", when = { race = "Dwarf" }, text = "Aye, an' in the same hall, most likely, wi' the forge-heat on yer back. Keep them the way a dwarf keeps a debt, an' ye'll no' go far wrong." },
      },
      choices = { { text = "I'll keep them, Valgar.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "The dead o' Lordaeron, raised an' driven. Every paladin I train will face them sooner or later, an' I train them wi' that in mind." } },
    rohan = { { id = "tp_rohan", text = "High Priest Rohan tends the Light's flock in this hall. He's a wiser dwarf than me, an' he's kinder about it." } },
    uther = { { id = "tp_uther", text = "The best of us, an' betrayed by the prince he'd trained. I'll say nae more than that, for it still sticks in my throat." } },
    hall_of_mysteries = { { id = "tp_hall", text = "Priests, mages an' paladins under one roof in the Mystic Ward. It's the quietest corner o' Ironforge, which isnae sayin' a great deal." } },
    background = { { id = "tp_bg", text = "I'm a paladin o' the Silver Hand, an' that's all that matters." } },
    _none = { { id = "tp_none", text = "I cannae say, friend, but the Light might know." } },
  },
}

---------------------------------------------------------------------------
-- Belia Thundergranite: pet trainer in the Hall of Arms; kin to Regnus the hunter trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_belia", id = TODO_NPC("Belia Thundergranite"), name = "Belia Thundergranite", title = "Pet Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "warm", "brisk" }, values = { "animals", "family" },
  notices = { "class", "pet" },
  impression = {
    first = "She greets the animals before she greets their owners.",
    third = "{name} met Belia Thundergranite, a dwarf pet trainer in the Hall of Arms.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, there you are. Come in; I'll teach you gladly, for you've earned it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll teach you, since it's my duty, but I'll not waste kind words on you." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! The bear remembers ye, or remembers yer boots, I'm no' sure which." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Whisht, keep yer voice down, I've only just got the cubs tae settle." },
    { id = "g_hi", text = "Hello there, an' where's yer beast? Oh, ye've none at all, which is a terrible shame, but ye can still come in." },
    { id = "g_hunter", when = { class = "HUNTER", pet = { type = "Beast" } }, text = "Hello, hunter, an' hello tae you too, {pet}! Come here an' let me have a look at ye." },
    { id = "g_train", when = { questActive = TODO_QUEST("Training the Beast") }, text = "Ah, ye've tamed yer first beast, have ye? Come here an' let me teach ye how tae look after it." },
  },
  notice = {
    { id = "n_hunter_nopet", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! I can always tell, for ye lot look at the beasts before ye look at me, an' quite right too." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine {pet} ye've got there. I can tell ye feed it well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Belia Thundergranite, pet trainer, an' my cousin Regnus teaches the huntin' side o' things. A hunter's only as good as the beast at their side, an' a beast's only as good as the care it gets." },
      },
      again = {
        { id = "h_again3", text = "Still here? Then mind yer fingers near the cages, an' ask what ye like." },
        { id = "h_again", text = "What else? I've a bear in the back who wants his supper." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you train a beast?", next = "train" },
        { text = "You seem fond of animals.", next = "fond" },
        { text = "The Hall of Arms is full of beasts as well as blades.", next = "hall" },
        { text = "What do you make of my companion?", next = "mypet", when = { pet = { type = "Beast" } } },
        { text = "What's the hardest beast you ever trained?", next = "hardest" },
        { text = "Grif sent me to learn how to keep a beast.", next = "hp_tb", when = { class = "HUNTER", questActive = TODO_QUEST("Training the Beast") } },
        { text = "What does a beast need from me, as the years go on?", next = "hp", when = { class = "HUNTER", minLevel = 10 } },
        { text = "How do humans fare with beasts, Belia?", next = "hp_human", when = { race = "Human", class = "HUNTER" } },
        { text = "The beasts of my isle were different from these.", next = "hp_sky", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "Farewell, Belia.", next = "END" },
      },
    },
    hp_tb = {
      lines = { { id = "hptb_default", text = "Did he, now! Then ye've tamed somethin' on his hill an' come all this way wi' it, an' I'm glad tae see ye both. I'll teach yer beast new tricks for a few coppers, an' I'll teach you tae feed it right an' keep it happy, which is the half Grif forgets tae mention." } },
      choices = {
        { text = "What does a beast need most?", next = "hp" },
        { text = "Thank you, Belia. I'll look after it.", next = "BACK", reply = "Ye will, I can see it in how ye stand next tae it. Off ye go, then, an' come back when it's learned somethin'.", fx = { affinity = 1 } },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Food, an' the right food, an' a hunter who notices when it's unhappy. A beast learns tae trust ye a wee bit every day ye keep it fed an' alive, an' if ye neglect it, it'll leave ye, an' there's nae gettin' it back." },
        { id = "hp_pet", when = { pet = { type = "Beast" } }, text = "Look at {pet}'s ears, now, for that's where a beast tells ye how it's feelin'. Food, the right food an' a hunter who notices when it's unhappy, that's all it needs, an' ye'd be amazed how many forget the third." },
      },
      again = { { id = "hp_again", text = "What else? Mind the cages." } },
      choices = {
        { text = "What's the right food?", next = "hp_food" },
        { text = "How does my beast learn new tricks?", next = "hp_tricks" },
        { text = "What if my beast dies in a fight?", next = "hp_dies" },
        { text = "Something else, Belia.", next = "hello" },
      },
    },
    hp_food = {
      lines = { { id = "hpf_default", text = "Depends on the beast. A boar'll eat anythin' ye drop, a bear likes fish an' fruit an' bread, an' a cat or wolf wants meat an' looks at ye like ye've insulted its mother if ye offer a biscuit. Feed it somethin' near its own strength, for a beast grown past wolf meat won't thank ye for it." } },
      choices = {
        { text = "I'll carry what it likes, even if it costs me.", next = "BACK", reply = "That's a good hunter, an' yer beast will know it, even if ye never see it say so.", fx = { align = { light = 1 } } },
        { text = "It'll eat what I have, or go hungry.", next = "BACK", reply = "Then it'll go hungry, an' then it'll go, an' ye'll have only yerself tae blame.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_tricks = {
      lines = { { id = "hpt_default", text = "Two ways. I can teach it, for a few coppers an' a bit o' patience, or ye can tame a wild beast that knows the trick already an' learn it from them yourself, an' then teach yer own. Either way, the more yer beast trusts ye, the more it can learn, for a wary beast won't take instruction." } },
      choices = {
        { text = "Then I'll earn its trust first.", next = "BACK", reply = "Aye, an' the rest follows, as it always does." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_dies = {
      lines = { { id = "hpd_default", text = "Then ye revive it, for ye'll have learned how, an' ye say sorry, an' ye mean it. It'll come back, but each time it dies on ye it trusts ye a little less, an' a beast that's been dropped too often learns no' tae trust anyone again." } },
      choices = {
        { text = "Then I'll never let it die for my mistakes.", next = "BACK", reply = "That's a promise I like tae hear, an' I hope ye keep it.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_human = {
      lines = { { id = "hph_default", text = "Better than I expected, an' I'll say so tae anyone. There were nae human hunters when I was a girl, an' the first ones I met handled their beasts like plough horses, but the ones comin' through now are gentler, an' the beasts like them for it." } },
      choices = {
        { text = "We learned from dwarves, so it's your credit.", next = "BACK", reply = "Ha! Flatterer. I'll take it, though, an' tell Regnus.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_sky = {
      lines = { { id = "hps_default", text = "I'd expect so, an' I'd love tae hear about them some day, for I've never seen anythin' that lived on a cloud. But a beast's a beast wherever it comes from, an' it wants food an' a kind word, so the old lessons should hold." } },
      choices = {
        { text = "They held on the isle. They'll hold here.", next = "BACK", reply = "Then ye'll do grand, an' so will yer beast.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    train = {
      lines = { { id = "tr_default", text = "Patience, kindness, an' plenty o' meat. A beast learns faster from a full belly than a sharp word, an' it remembers who fed it." } },
      choices = {
        { text = "And if it won't learn?", next = "train_wont" },
        { text = "Something else.", next = "BACK" },
      },
    },
    train_wont = {
      big = true,
      lines = { { id = "tw_default", text = "Then ye're doin' somethin' wrong, no' the beast. Some hunters think a sharp hand teaches quicker. What do ye think?" } },
      choices = {
        { text = "Kindness, always. A beast trusts what's kind to it.", next = "BACK", reply = "That's it exactly! Ye'll make a fine hunter.", fx = { align = { light = 1 } } },
        { text = "A firm hand. Beasts respect strength.", next = "BACK", reply = "Respect, maybe, but no' love, an' a beast that doesnae love ye won't stand by ye when it counts.", fx = { align = { light = -1 } } },
      },
    },
    fond = {
      lines = { { id = "fo_default", text = "Fond? I'd sooner talk tae a ram than most dwarves, an' the ram would have more sense. Regnus says I'm daft, but he talks tae his wolf more than he talks tae me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hall = {
      lines = { { id = "hl_default", text = "It is, an' the warriors grumble about the smell, an' I tell them they smell worse after drill. Regnus an' Daera Brightspear teach the huntin', Ulbrek Firehand stables the beasts, an' I teach the beasts their manners." } },
      choices = {
        { text = "Which beasts do dwarves take to best?", next = "hall_beasts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_beasts = {
      lines = { { id = "hb_default", text = "Bears, every time, for a Dun Morogh bear is stubborn, hungry an' loyal, an' so is a dwarf. The young ones want a snow leopard because it looks grand, an' then they find out a leopard does what it pleases." } },
      choices = {
        { text = "And what would you choose?", next = "hall_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_choice = {
      lines = { { id = "hc_default", text = "A boar, an' ye can laugh, for Regnus does. A boar will charge anythin' ye point it at an' eat anythin' ye drop, an' I've never asked more than that o' any companion." } },
      choices = { { text = "A sensible beast. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mypet = {
      lines = { { id = "mp_default", text = "Let me see. Bright eyes, a good coat, an' {pet} keeps lookin' back at ye tae see what ye'll do next, which is the best sign there is. Ye've done well by this one, an' I don't say it tae everybody." } },
      choices = {
        { text = "We look after each other.", next = "BACK", reply = "Aye, an' that's the whole o' the craft, right there.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "hd_default", text = "A crag boar that'd been kept on a chain by a fool o' a trapper, an' wouldnae let anybody within ten paces. I sat outside his pen wi' a bucket o' turnips for a fortnight an' never once reached for him, an' on the fifteenth day he came tae me." } },
      choices = { { text = "A fortnight of turnips. That's patience.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ulbrek = { { id = "tp_ulbrek", text = "Ulbrek Firehand keeps the stable next tae me. He's a soft hand wi' a frightened beast, an' I trust him wi' any o' mine." } },
    dun_morogh = { { id = "tp_dm", text = "Snow, pine an' the best bears in Khaz Modan. If ye want a companion that'll stand a winter, look there first." } },
    regnus = { { id = "tp_regnus", text = "My cousin, an' the better shot o' the two of us, though I'll thank ye no' tae tell him I said so." } },
    beasts = { { id = "tp_beasts", text = "Feed them before ye feed yerself, an' never raise yer hand tae one. Everythin' else is practice." } },
    background = { { id = "tp_bg", text = "I'm a Thundergranite an' a pet trainer, an' I love my work." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about beasts instead." } },
  },
}

---------------------------------------------------------------------------
-- Lieutenant Rotimer: Stormpike Guard recruitment officer in the Commons.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_rotimer", id = TODO_NPC("Lieutenant Rotimer"), name = "Lieutenant Rotimer", title = "Stormpike Guard Recruitment Officer",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "ironforge" }, temper = { "loud", "earnest" }, values = { "duty", "clan" },
  notices = { "greenness", "soldier" },
  impression = {
    first = "He believes every word he shouts about Alterac Valley.",
    third = "{name} met Lieutenant Rotimer, a Stormpike Guard recruitment officer calling for volunteers in the Commons.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you still standing. Come, stand with us a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Stay clear of the camp, unless you've orders to be here." },
    { id = "g_war", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 51 }, text = "Now there's an arm the Guard could use! Step up, an' let me tell ye where it's needed." },
    { id = "g_hi", text = "The Stormpike Guard needs ye! Have ye heard about Alterac Valley?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ready tae sign up yet?" },
    { id = "g_rep", when = { reputation = { faction = "Stormpike Guard", min = "honored" } }, text = "There's one o' ours! The Guard's proud o' ye, an' so am I." },
  },
  notice = {
    { id = "n_vet", cat = "soldier", when = { minLevel = 51 },
      text = "Now ye're the sort I've been shoutin' for all week! Ye've the look o' somebody who's stood in a line an' held it." },
    { id = "n_dwarf", cat = "soldier", when = { race = "Dwarf" },
      text = "A dwarf, an' fit tae fight. I'll no' need tae explain tae ye what kin are worth." },
    { id = "n_young", cat = "greenness", when = { maxLevel = 50 },
      text = "Ye're a bit young for Alterac yet, but come back when ye've grown a bit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lieutenant Rotimer, Stormpike Guard. Our kin are fightin' the Frostwolf orcs in Alterac Valley, an' we need every axe an' rifle Ironforge can spare." },
      },
      again = {
        { id = "h_again3", text = "Speak up over the auctioneers, for they've been outshoutin' me all mornin'." },
        { id = "h_again", text = "Anythin' else? I've a crowd tae shout at." },
        { id = "h_again2", text = "Go on, then, quick." },
      },
      choices = {
        { text = "A soldier's word should be as strong as his shield.", next = "BACK", reply = "Aye, and the good ones are. I've stood beside a few.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever soldier lies to the enemy and lives.", next = "BACK", reply = "Maybe so, but don't make a habit of it with your friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's happening in Alterac?", next = "alterac" },
        { text = "Why should I fight for the Stormpikes?", next = "why" },
        { text = "You've a hard crowd to recruit from.", next = "crowd" },
        { text = "I've already fought for the Guard.", next = "fought", when = { reputation = { faction = "Stormpike Guard", min = "friendly" } } },
        { text = "Farewell, Lieutenant.", next = "END" },
      },
    },
    alterac = {
      lines = { { id = "al_default", text = "The Stormpike expedition dug intae the valley lookin' for relics an' iron, an' the Frostwolves didnae like it. Now it's war, an' Commander Vanndar Stormpike is holdin' Dun Baldar against them." } },
      choices = {
        { text = "Who started it?", next = "alterac_start" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alterac_start = {
      big = true,
      lines = { { id = "as_default", text = "The orcs say we did, an' we say they did, an' I'll no' bore ye wi' the details. What matters is our kin are there, an' they need help. Will ye go?" } },
      choices = {
        { text = "Our kin need us. I'll fight.", next = "BACK", reply = "That's the spirit! Head tae Alterac an' report tae Dun Baldar.", fx = { align = { order = 1 } } },
        { text = "Not for a war over digging rights.", next = "BACK", reply = "Hmph. Suit yerself, but don't come cryin' when the orcs reach the gates.", fx = { align = { order = -1 } } },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because they're dwarves, an' because the orcs would take every inch o' Alterac if we let them. An' because there's glory in it, if that's what ye're after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "cw_default", text = "The Commons is the best spot in Ironforge for it, for everybody passes through on the way tae the bank or the auction house. The trouble is they're all thinkin' about their purses, an' Alterac's a long cold way from a purse." } },
      choices = {
        { text = "How many sign on?", next = "crowd_many" },
        { text = "Sheldonore says you need gunners.", next = "crowd_guns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crowd_many = {
      lines = { { id = "cy_default", text = "Fewer than I'd like an' more than the senators expected. Most are young an' want a story tae tell, an' I send them north tae the Alterac Mountains an' hope they come home wi' one." } },
      choices = { { text = "I hope they do too.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    crowd_guns = {
      lines = { { id = "cg_default", text = "The Artilleryman says everybody needs gunners, includin' the bakers. He's no' wrong that a battery would help, but I've nae cannon tae give away, only a place in the line." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    fought = {
      lines = { { id = "fo_default", text = "Have ye! Then ye've seen Dun Baldar wi' yer own eyes, which is more than I've managed since they gave me this post. Tell me true, how's the line holdin'?" } },
      choices = {
        { text = "It holds, and the Guard fights well.", next = "BACK", reply = "That's what I tell the crowd every day, an' it's grand tae hear it from somebody who's been.", fx = { affinity = 1 } },
        { text = "It's a hard fight, and it isn't ending soon.", next = "BACK", reply = "Aye, I feared as much. I'll keep shoutin', then.", fx = { trait = { honest = 1 } } },
      },
    },
  },
  topics = {
    dun_baldar = { { id = "tp_baldar", text = "The Stormpike stronghold at the north end o' the valley. It's cold, it's crowded, an' it's ours." } },
    vanndar = { { id = "tp_vanndar", text = "Vanndar Stormpike commands at Dun Baldar, an' ye'll no' meet a harder dwarf nor a fairer one." } },
    frostwolf = { { id = "tp_frost", text = "Orcs who've lived in that valley for years an' mean tae keep it. I'll give them this much, they fight for it." } },
    alterac_valley = { { id = "tp_av", text = "Stormpike land, an' we'll hold it." } },
    background = { { id = "tp_bg", text = "I'm a soldier o' the Stormpike Guard, an' I'm proud o' it." } },
    _none = { { id = "tp_none", text = "No idea, but have ye heard about Alterac?" } },
  },
}
