-- Menethil Harbor, the folk a roster scan found missing (part 1): the docks, the Grassman house, the
-- Rumdnul family at the general store, and the harbor's smaller traders. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Adam Lind: stands on the Menethil docks and tells travellers which ship goes where.
P:NPC {
  key = "wl_adam_lind", id = TODO_NPC("Adam Lind"), name = "Adam Lind", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "friendly", "patient" }, values = { "practical" },
  notices = { "race", "weary" },
  impression = {
    first = "Adam Lind stands on the Menethil docks and tells people which pier their ship leaves from, over and over, without ever seeming to tire of it. He knows the tide tables better than most of the captains do.",
    third = "{name} met Adam Lind, who gives directions to the ships on the Menethil docks.",
  },
  greetings = {
    { id = "g_default", text = "Looking for a ship, friend? Tell me where you're bound and I'll point you at the right pier before you board the wrong one." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the docks, are you? Then either you've missed your ship or you're catching another, and I can help with both." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "You'll be wanting the Auberdine ship, I'd wager, since most of your people who come through here are on their way home or have only just left it." },
    { id = "n_weary", cat = "weary", when = { minLevel = 30 },
      text = "You've the look of someone who has sailed before, so I'll spare you the speech about holding the rail." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Adam Lind, and I suppose I'm the nearest thing these docks have to a signpost. Two ships call here, one for Auberdine on the Darkshore and one for Theramore Isle, and every day somebody boards the wrong one." } },
      again = {
        { id = "h_again", text = "Anything else you need before the next bell?" },
        { id = "h_again2", text = "Ask away, friend, because the ship won't leave any sooner for my being quiet." },
      },
      choices = {
        { text = "Which ship goes to Auberdine?", next = "auberdine" },
        { text = "Which ship goes to Theramore?", next = "theramore" },
        { text = "You must tire of saying the same thing all day.", next = "tire" },
        { text = "Thanks. Fair winds.", next = "END" },
      },
    },
    auberdine = {
      lines = { { id = "a_default", text = "The Auberdine ship ties up at the long pier on the north side, and she'll carry you across the Great Sea to the night elves' coast. It's a cold, grey harbor when you get there, but the elves keep it well." } },
      choices = {
        { text = "What sort of passengers take it?", next = "passengers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    passengers = {
      lines = { { id = "p_default", text = "Night elves going home, dwarves of the Explorers' League chasing some ruin or other, and a good many young folk like yourself who've heard there's work in Kalimdor. I've yet to see one of them come back looking bored." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    theramore = {
      lines = { { id = "t_default", text = "The Theramore ship uses the southern pier, and she sails for Lady Proudmoore's city in the Dustwallow Marsh. Folk say it's a swamp much like ours, only hotter and with bigger things living in it." } },
      choices = {
        { text = "The Wetlands has trained you for swamps, then.", next = "swamps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamps = {
      lines = { { id = "s_default", text = "It has, and that's why I'm staying in this one. A man gets used to his own crocolisks, and I see no reason to go and meet somebody else's." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tire = {
      lines = { { id = "ti_default", text = "Not as much as you'd think. Everyone who asks me is going somewhere for the first time, and there's a pleasure in sending them off the right way, even if I never leave the dock myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've worked these docks for years, and I know the two ships and their tides by heart." } },
    _none = { { id = "tp_none", text = "That's beyond me, friend. If it doesn't tie up at one of these piers, I can't tell you much about it." } },
  },
}

-- Bart Tidewater: captain of the Maiden's Virtue, moored at Menethil.
P:NPC {
  key = "wl_bart_tidewater", id = TODO_NPC("Bart Tidewater"), name = "Bart Tidewater", title = "Captain of the Maiden's Virtue", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "gruff", "proud" }, values = { "loyal", "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "Captain Bart Tidewater commands the Maiden's Virtue, which sits at her mooring in Menethil Harbor and does not seem to be going anywhere. He talks about holding his station as though it were a battle.",
    third = "{name} met Bart Tidewater, captain of the Maiden's Virtue at Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Mind the lines, {class}, and state your business. The Maiden's Virtue is a ship of Stormwind's navy, and she's not a ferry." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {class}. She hasn't moved since you last looked, if that's what you came to see." },
    { id = "g_quest", when = { questActive = TODO_QUEST("A Lack of Virtue") }, text = "You're about my business, {class}, and I'll hear how it goes when it's done and not before." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like a fighting {class}, and that's worth more to me than a sailor's knots just now. Marines are harder to come by than deckhands." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on my deck! Your folk built half this harbor's defences, so I'll forgive you for looking green whenever she rolls." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Captain Bart Tidewater, of the Maiden's Virtue. My orders are to hold this harbor for the Alliance, so hold it I do, and I'll thank the tavern wits to stop asking when she last put to sea." } },
      again = {
        { id = "h_again", text = "What else, {class}? Speak up, for the gulls are loud today." },
        { id = "h_again2", text = "Go on, then, while the tide's slack and I've a moment." },
      },
      choices = {
        { text = "Tell me about your ship.", next = "ship" },
        { text = "What are you guarding the harbor against?", next = "guard" },
        { text = "She looks as if she hasn't sailed in a long while.", next = "sailed" },
        { text = "Do you know First Mate Fitzsimmons?", next = "fitz" },
        { text = "Hold your station, Captain.", next = "END" },
      },
    },
    ship = {
      lines = { { id = "s_default", text = "She's a Stormwind warship, sound in every timber, with guns enough to make a pirate think twice about this bay. I've had her since the harbor was rebuilt, and I'd not trade her for the Admiral's own flagship." } },
      choices = {
        { text = "And your crew?", next = "crew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew = {
      lines = { { id = "c_default", text = "Good lads, though idle hands at anchor turn to dice and grumbling. I keep them scrubbing and drilling, because a crew that forgets its work in harbor will not remember it under fire." } },
      choices = {
        { text = "Do they grumble about you?", next = "grumble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grumble = {
      lines = { { id = "gr_default", text = "They say I love this mooring better than the open sea, and they say it where they think I can't hear. Let them talk, for they're fed and dry and alive, and that's more than many a crew can say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g_default2", text = "Pirates out of the south, murlocs on every sandbar, and the Dragonmaw orcs inland who'd burn this town a second time if they could. Menethil is the Alliance's door to Kalimdor, and somebody has to stand in it.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "A ship can't stop orcs who come by land.", next = "land" },
        { text = "Something else.", next = "BACK" },
      },
    },
    land = {
      lines = { { id = "l_default", text = "No, but her guns can cover the bridge and the gate, and Captain Stoutfist knows it. He holds the walls and I hold the water, and between us the town sleeps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sailed = {
      lines = { { id = "sa_default", text = "A guardship is meant to be seen, {class}, and she's seen from here every hour of every day. If you want adventures on the open water, the passenger ships leave from the other piers." } },
      choices = {
        { text = "Fair enough. Holding a place is work too.", next = "BACK", reply = "It is, and I'm glad one soul in this harbor understands it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fitz = {
      lines = { { id = "f_default", text = "The Kul Tiran who drinks by the tavern door? I know him, and I pity him, for a mate without a ship is half a man. He tells a fine tale of the Third Fleet, if you've the price of a drink.", fx = { learn = { "third_fleet" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Stormwind navy man, and the Maiden's Virtue has been my command since Menethil was rebuilt." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs in the hills to the east. They can't swim out to my ship, more's the pity for my gunners." } },
    third_fleet = { { id = "tp_tf", text = "Kul Tiras lost ships off this coast, and Fitzsimmons in the tavern can tell you more than I can." } },
    _none = { { id = "tp_none", text = "That's no concern of the navy's, {class}, so it's none of mine. Ask ashore." } },
  },
}

-- Caitlin Grassman: alchemist in the small house by the smithy; her husband Ardin gathers her herbs.
P:NPC {
  key = "wl_caitlin_grassman", id = TODO_NPC("Caitlin Grassman"), name = "Caitlin Grassman", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "warm", "anxious" }, values = { "family", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Caitlin Grassman brews potions in a small house by the Menethil smithy, with herbs her husband Ardin climbs half the Wetlands to pick. He went to look at some strange grasses at the excavation, and she has been watching the road since.",
    third = "{name} met Caitlin Grassman, the alchemist of Menethil Harbor, whose husband is overdue from the excavation.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Forgive me, I thought for a moment you were Ardin at the door. Come in, and mind the drying racks." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I don't suppose you passed a man on the road with far too many plants on his back?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "Bless you for bringing word of him! I've had the kettle on ever since, so that there's something hot when he walks in." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've an alchemist's stained fingers, so you'll know what it means to run out of good herbs. Ardin keeps my shelves full, when he's home." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf! I write to a herbalist of your people, Llana of Astranaar, and she knows more about growing things than I shall ever learn." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Caitlin Grassman, and I make the potions this harbor runs on, from whatever my husband brings home. Ardin has a gift for finding plants, and no gift at all for coming back when he says he will." },
        { id = "h_seek", when = { questActive = TODO_QUEST("Seeking Caitlin") }, text = "Llana sent you? She must be wondering about the grass seeds I promised her, and it comforts me that she's as uneasy as I am. Something about that excavation has us both on edge." },
        { id = "h_lost", when = { questActive = TODO_QUEST("Lost in the Thicket Things") }, text = "Have you found any trace of Ardin? He said a week, and I've stopped counting how many it has been." },
        { id = "h_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "He wove me a heart out of reeds, the great fool, in the middle of all that danger. I'm so grateful he's among the living that I can't even be cross with him." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Talking keeps my mind off the road." },
        { id = "h_again2", text = "Yes, go on, I'm listening." },
      },
      choices = {
        { text = "Where did your husband go?", next = "ardin" },
        { text = "What do you brew here?", next = "brew" },
        { text = "Who is Llana?", next = "llana" },
        { text = "He'll come home, Caitlin.", next = "END" },
      },
    },
    ardin = {
      lines = { { id = "a_default", text = "An excavation crew came through for supplies, and they spoke of grasses taller than a house, like nothing anyone had seen. Ardin had his pack on before they'd finished the sentence, and he said he only wanted to look." } },
      choices = {
        { text = "And he hasn't come back.", next = "gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gone = {
      lines = {
        { id = "go_default", text = "Not a word, and that isn't like him, for he always sends a note with a carter if he's delayed. If you go that way and learn anything at all of him, I'd be more grateful than I can say." },
        { id = "go_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "He was caught in something dreadful out there, and you cleared the way for him to walk out of it. I shan't forget that, {name}." },
      },
      choices = {
        { text = "What is he like, your Ardin?", next = "like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    like = {
      lines = { { id = "l_default", text = "He jokes when he's frightened, which fools nobody, and he'll scale any peak in the Wetlands for a flower I happened to mention at supper. I'd rather have him home than every rare herb in the world." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brew = {
      lines = { { id = "b_default", text = "Healing draughts for the guard, mostly, and salves for crocolisk bites, which this town gets through at a shocking rate. Dewin Shimmerdawn sells me my vials, and the herbs are all Ardin's doing." } },
      choices = {
        { text = "The marsh must be rich in herbs.", next = "herbs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "he_default", text = "Richer than anywhere I know, if you don't mind wet feet and things with teeth. Liferoot along the water, kingsblood on the banks, and briarthorn in every hedge, though the best patches are always where the raptors are." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    llana = {
      lines = { { id = "ll_default", text = "A herbalist in Astranaar, far across the sea, whom I've never met and count as a dear friend. We trade letters about rare plants and local oddities, and now and then a warning about what not to touch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an alchemist, and my husband Ardin gathers what I brew with. We've a small house by the smithy." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. My mind is half on the road these days, as you can see." } },
  },
}

-- Derina Rumdnul: Gruham's wife, Gimlok's mother; helps at the general store.
P:NPC {
  key = "wl_derina_rumdnul", id = TODO_NPC("Derina Rumdnul"), name = "Derina Rumdnul", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "warm", "harried" }, values = { "family", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "Derina Rumdnul keeps the books at her husband Gruham's supply shop and keeps an ear cocked for her son Gimlok, who is never where she left him. She worries loudly and laughs just as loudly.",
    third = "{name} met Derina Rumdnul, wife of Menethil's general supplier and mother of a wandering boy.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, {g:lad|lass}! Ye havenae seen a wee dwarf boy about so high, have ye, likely wet tae the knees?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yerself again. Where has that boy gotten to now, I ask ye?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "It's good tae see another dwarf in this soggy town. Ye'll understand me when I say a child should grow up wi' stone under his feet, an' nae a dock." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, are ye? Then tell my Gimlok the crocolisks are nae pets, for he'll nae hear it from his mother." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Derina Rumdnul, an' that's my husband Gruham behind the counter, sellin' ye things ye didnae know ye needed. I mind the ledger an' I mind our son, an' the ledger's a good deal less trouble." } },
      again = {
        { id = "h_again", text = "What else, dearie? I've one eye on the door, mind." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "What does your son get up to?", next = "gimlok" },
        { text = "How did dwarves come to keep shop here?", next = "shop" },
        { text = "You sound like you miss the mountains.", next = "home" },
        { text = "Good day, Derina.", next = "END" },
      },
    },
    gimlok = {
      lines = { { id = "g_default2", text = "Everythin' he shouldnae! He's down at the docks pokin' at crabs, or under the pier, or followin' the Halloran children up somethin' tall. He's half their size an' twice as stubborn, like his father." } },
      choices = {
        { text = "What worries you most?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "The water, {g:lad|lass}. Dwarves sink like anvils, an' there are murlocs on the sandbars past the pier that would carry off a calf, never mind a boy. I've told him so till my beard... well, till Gruham's beard went grey." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "s_default", text = "Gruham said there was coin in a port where every ship needs rope an' every traveller forgets his waterskin, an' he was right, bless him. We came down from Loch Modan when Gimlok was a babe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Aye, I do. I miss dry stockings an' a proper hearth cut from the rock, but trade's good an' the neighbours are kind, so I'll nae complain more than twice a day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a shopkeeper's wife an' a mother, an' both are full days' work in this town." } },
    _none = { { id = "tp_none", text = "I wouldnae know, dearie. Ask Gruham, he hears everythin' over that counter." } },
  },
}

-- Gimlok Rumdnul: dwarf child of Gruham and Derina.
P:NPC {
  key = "wl_gimlok_rumdnul", id = TODO_NPC("Gimlok Rumdnul"), name = "Gimlok Rumdnul", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "menethil" }, temper = { "cheerful", "stubborn" }, values = { "curious" },
  notices = { "race" },
  impression = {
    first = "Gimlok Rumdnul is a dwarf boy, the shopkeeper's son, and he is smaller than every other child in Menethil and plainly doesn't care. He had a crab in his pocket when I met him.",
    third = "{name} met Gimlok Rumdnul, the shopkeeper's son in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Hullo! Are ye off one o' the big ships? I'm goin' tae sail on one when I'm bigger." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Dinnae tell my mam ye saw me by the water." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye've a proper beard! My da says mine will come in when I stop askin' about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Gimlok, an' my da has the shop an' my mam has the shoutin'. I'm nae supposed tae be down here, but the crabs are down here, so what can I do?" } },
      again = {
        { id = "h_again", text = "What else? I've crabs tae catch." },
        { id = "h_again2", text = "Aye, go on!" },
      },
      choices = {
        { text = "What do you do with the crabs?", next = "crabs" },
        { text = "Who do you play with?", next = "play" },
        { text = "Your mother is looking for you.", next = "mam" },
        { text = "Stay out of the water, Gimlok.", next = "END" },
      },
    },
    crabs = {
      lines = { { id = "c_default", text = "I race them along the pier, an' the fastest one gets a name. This one's called Magni, because he's the king o' the crabs an' he pinches hardest." } },
      choices = {
        { text = "Does the king know about that?", next = "king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I dinnae think so, an' ye mustnae tell him! Da says the king has a hammer as big as me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    play = {
      lines = { { id = "p_default", text = "Jesse an' Regina, the tanner's two. Jesse climbs the tower an' I cannae reach the first rung yet, but I'm a better hider than the both of them, because I fit in a barrel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mam = {
      lines = { { id = "m_default", text = "She's always lookin' for me, that's just how she is. I'll go home when I hear her the third time, because the third time is when she means it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Gimlok Rumdnul, an' my da's shop is the one wi' all the rope." } },
    _none = { { id = "tp_none", text = "I dinnae know that one. Ask my da, he knows everythin' that costs money." } },
  },
}

-- Dewin Shimmerdawn: night elf alchemy supplier in Menethil Harbor.
P:NPC {
  key = "wl_dewin_shimmerdawn", id = TODO_NPC("Dewin Shimmerdawn"), name = "Dewin Shimmerdawn", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "measured", "courteous" }, values = { "nature", "craft" },
  notices = { "race", "craft" },
  impression = {
    first = "Dewin Shimmerdawn is a night elf who sells vials and alchemical supplies in Menethil Harbor, a long sea voyage from his own forests. He speaks of the marsh's plants with more respect than most of the townsfolk show them.",
    third = "{name} met Dewin Shimmerdawn, a night elf who sells alchemy supplies in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Elune light your path, traveller. If you practise the alchemist's art, you will find what you need here, and if you do not, you are welcome all the same." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and I am glad of it. What does your work require today?" },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, {g:brother|sister}. It is a comfort to hear our own tongue among so many hammers and so much shouting." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "I see the stains of the craft upon your hands. Remember that the plant gives its life to the vial, and waste none of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Dewin Shimmerdawn. I came across the sea on the Auberdine ship to learn what grows in these eastern marshes, and I remain because the alchemists of this harbor have need of clean glass and honest measures." } },
      again = {
        { id = "h_again", text = "What more would you ask of me?" },
        { id = "h_again2", text = "Speak, and I will answer as I am able." },
      },
      choices = {
        { text = "What have you learned about the marsh?", next = "marsh" },
        { text = "How do you find living among dwarves and humans?", next = "living" },
        { text = "Who buys from you here?", next = "buyers" },
        { text = "Show me your supplies.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "m_default", text = "That it is older and more alive than those who build upon it suppose. The humans call it a swamp and wish it drained, yet every pool here feeds a hundred growing things, and the land remembers when no wall stood in it." } },
      choices = {
        { text = "You sound as if you pity the town.", next = "pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pity = {
      lines = { { id = "p_default", text = "Not pity, for they are brave to live where the water wishes to return. I only think that a people who have lived here a few short generations should listen more closely to a land that has endured for ages." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "l_default", text = "They are loud, hasty and kinder than their manners suggest. I have lived through more winters than this harbor has stones, and still a dwarf will explain to me, slowly, how to light a fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Caitlin Grassman, who brews for the town guard, is the most faithful of them, and her husband gathers herbs with a care that I respect. Travellers buy the rest, usually in a hurry and usually too few vials." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the kaldorei, and I crossed the sea to study the plants of these wetlands." } },
    _none = { { id = "tp_none", text = "That lies outside my knowledge, and I will not guess at it. Ask one who has walked that path." } },
  },
}

-- Edwina Monzor: bowyer in Menethil Harbor; works beside Naela Trance.
P:NPC {
  key = "wl_edwina_monzor", id = TODO_NPC("Edwina Monzor"), name = "Edwina Monzor", title = "Bowyer", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "brisk", "sharp" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Edwina Monzor sells bows in Menethil Harbor and waxes strings while she talks, without once looking at her hands. She says damp is a bowyer's whole war, and that in the Wetlands she is losing it slowly.",
    third = "{name} met Edwina Monzor, a bowyer of Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {class}. If you want a bow that will still draw true after a week in the marsh, you've come to the right bench." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I hope you've been keeping that string dry, or we shall have words." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and one who carries the bow properly unstrung, I see. You and I will get along." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "I know, I know, you'd rather have a rifle. Murndan Derth will sell you one, and I'll sell you a bow for the day the powder gets wet." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Edwina Monzor, bowyer. Naela Trance and I keep the harbor's archers supplied between us, and what with the sea fog and the bog air, we spend half our days re-waxing strings that were perfectly good yesterday." } },
      again = {
        { id = "h_again", text = "What else? I can talk and wax at the same time." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "How do you keep a bow sound in this damp?", next = "damp" },
        { text = "Two bowyers in one small harbor?", next = "naela" },
        { text = "What do your customers hunt?", next = "hunt" },
        { text = "I'll look at your bows.", next = "END" },
      },
    },
    damp = {
      lines = { { id = "d_default", text = "Wax on the string, oil on the limbs, and never, ever leave it strung overnight. A bow that sleeps strung in this air wakes up with a twist in it, and after that it is only good for kindling." } },
      choices = {
        { text = "And the wood itself?", next = "wood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "I have my staves shipped from Elwynn, because nothing that grows in this marsh will hold a curve. The local wood is fine for arrows and for burning, and I use it for both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    naela = {
      lines = { { id = "n_default", text = "There's work for two, believe me. Naela has the better eye for a stave and I have the faster hands, and neither of us will admit the other part of that sentence to her face." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunt = {
      lines = { { id = "hu_default", text = "Crocolisks for the tanner, mostly, since James Halloran pays well for a clean hide. The bolder ones go after the raptors east of town, and some of those come back to buy a second bow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've made bows since I was a girl, and I've sold them in Menethil for some years now." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. If it hasn't a string on it, it's rarely my business." } },
  },
}

-- Naela Trance: bowyer in Menethil Harbor; works beside Edwina Monzor.
P:NPC {
  key = "wl_naela_trance", id = TODO_NPC("Naela Trance"), name = "Naela Trance", title = "Bowyer", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "quiet", "patient" }, values = { "craft", "steady" },
  notices = { "class" },
  impression = {
    first = "Naela Trance is the quieter of Menethil's two bowyers, and she sights down every stave three times before she'll let it leave her bench. She listens more than she speaks, and she seems to notice how a person stands.",
    third = "{name} met Naela Trance, a bowyer of Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Welcome. Take your time with the bows, and tell me how long your draw is before you choose one." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. Has the bow served you well, or have you come to complain of it?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You hold your shoulders like an archer, and that tells me you'll want something heavier than what I show the dockhands." },
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "WARRIOR" } },
      text = "You're no archer by trade, I think, but a bow on the back has saved many a {class} who couldn't reach the enemy in time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Naela Trance, and I make bows. Edwina does most of the talking for the pair of us, which suits me, because a stave tells you more if you're quiet with it." } },
      again = {
        { id = "h_again", text = "Is there something else?" },
        { id = "h_again2", text = "Ask, and I'll answer if I can." },
      },
      choices = {
        { text = "What does a stave tell you?", next = "stave" },
        { text = "Edwina says she has the faster hands.", next = "edwina" },
        { text = "Is Menethil a good place for your trade?", next = "trade" },
        { text = "I'll look at your bows.", next = "END" },
      },
    },
    stave = {
      lines = { { id = "s_default", text = "Where it grew and how fast, and whether it means to bend or to break. You look along the grain in good light, and if it runs straight from tip to tip, the bow is already in there waiting." } },
      choices = {
        { text = "And if the grain runs crooked?", next = "crooked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crooked = {
      lines = { { id = "c_default", text = "Then I make arrows of it, or I give it to Edwina for the fire, and I don't grieve. A bow that fails at full draw can take an eye with it, so I would sooner lose the wood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    edwina = {
      lines = { { id = "e_default", text = "She has, and I'd be a poor liar to deny it. She finishes three bows while I am still deciding on one, though I notice it is mine the harbor guard come back to ask for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trade = {
      lines = { { id = "t_default", text = "Better than you would think. Every ship brings someone who lost a bow overboard or left one in Kalimdor, and the guard on the walls go through strings quickly in this weather." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a bowyer, and I share a bench in Menethil with Edwina Monzor." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. Edwina hears more of the harbor's talk than I do." } },
  },
}

-- Falkan Armonis: reagent vendor in Menethil Harbor.
P:NPC {
  key = "wl_falkan_armonis", id = TODO_NPC("Falkan Armonis"), name = "Falkan Armonis", title = "Reagents", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "dry", "careful" }, values = { "practical", "discreet" },
  notices = { "class" },
  impression = {
    first = "Falkan Armonis sells reagents in Menethil Harbor, and he weighs out powders with the care of a man who has seen what a careless pinch can do. He has a dry word for every sort of spellcaster who comes through his door.",
    third = "{name} met Falkan Armonis, the reagent seller of Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. If your craft needs powders, candles or anything else that burns up when you use it, I likely have it." },
    { id = "g_back", when = { metBefore = true }, text = "Run out already? You people do get through the stuff." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and bound across the sea, I expect. Buy your powders here, because they cost a good deal more once you're standing in Theramore wanting them." },
    { id = "n_pal", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "Candles and blessed things are on the left, {class}. I keep them well apart from what the warlocks ask for, as a courtesy to both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Falkan Armonis, reagents. Every caster who takes ship from this harbor remembers at the gangplank that they've forgotten something, and I am the last shop before the water." } },
      again = {
        { id = "h_again", text = "Was there something more?" },
        { id = "h_again2", text = "Go on, I'm only counting candles." },
      },
      choices = {
        { text = "What sells best here?", next = "sells" },
        { text = "Do you practise magic yourself?", next = "magic" },
        { text = "Does the damp spoil your stock?", next = "damp" },
        { text = "Let me see what you have.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Whatever a mage needs for a portal or a priest needs for a prayer, in that order. The ones leaving for Kalimdor buy by the pouch, and the ones coming back buy by the sack, having learned." } },
      choices = {
        { text = "And the strangest thing you've been asked for?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A fellow once wanted a pound of grave dust and wouldn't say why. I told him I don't stock it, which is true, and that I'd remember his face, which is also true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magic = {
      lines = { { id = "m_default", text = "Not a spark of it, and I count that a blessing. I've sold to enough singed apprentices to know that the safest place in any spell is behind the counter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "d_default", text = "It would, if I let it. Everything is kept in waxed pouches and sealed jars, because powder that has drawn water is good for nothing, and I'll not sell a mage a portal that opens halfway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell reagents to those who can use them, and I've no talent for magic myself." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea. I deal in powders, and gossip is extra." } },
  },
}

-- Jennabink Powerseam: gnome tailoring supplies and specialty goods, on a cart between the inn and the gryphon roost.
P:NPC {
  key = "wl_jennabink_powerseam", id = TODO_NPC("Jennabink Powerseam"), name = "Jennabink Powerseam", title = "Tailoring Supplies & Specialty Goods", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "bright", "chatty" }, values = { "craft", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Jennabink Powerseam sells thread, dyes and odd little luxuries from a cart between the Deepwater Tavern and the gryphon roost. She can tell you the tensile strength of every spool she owns, and she will if you let her.",
    third = "{name} met Jennabink Powerseam, a gnome who sells tailoring supplies from a cart in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Hello, hello! Thread, dye, needles and several things I can't easily classify, all on one cart and all perfectly dry, which in this town is an achievement." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again! I've reorganised the spools by colour and then by strength since you were here, so do ask if you can't find anything." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Wonderful, because nobody else here wants to discuss stitch density, and I've been saving up opinions for weeks." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome, all the way out here! Did you come by the tram and the long road, or were you clever and fly?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Jennabink Powerseam, and this cart is my whole shop, which is efficient because I can move it whenever the gryphons get too interested in the silk. I sell to tailors mostly, and to anyone who wants something a little out of the ordinary." } },
      again = {
        { id = "h_again", text = "What else can I tell you? I've plenty left!" },
        { id = "h_again2", text = "Go on, I love questions." },
      },
      choices = {
        { text = "Why a cart instead of a shop?", next = "cart" },
        { text = "What are the specialty goods?", next = "special" },
        { text = "The gryphons bother your silk?", next = "gryphons" },
        { text = "Let me see the cart.", next = "END" },
      },
    },
    cart = {
      lines = { { id = "c_default", text = "Because a shop floor here is damp on roughly nine days in ten, by my count, and thread that has been damp is eleven percent weaker even after it dries. A cart sits off the ground, and that solves it." } },
      choices = {
        { text = "You measured that?", next = "measured" },
        { text = "Something else.", next = "BACK" },
      },
    },
    measured = {
      lines = { { id = "m_default", text = "Of course I measured it! I hung weights from forty spools until each one snapped, and I'd have done sixty if the innkeeper hadn't complained about the noise of the weights landing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    special = {
      lines = { { id = "s_default", text = "Little things that come in on the ships and don't fit anyone else's shelves, like a fine dye or a pattern nobody has seen in Ironforge yet. I buy whatever looks interesting off the sailors and work out afterwards who wants it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gryphons = {
      lines = { { id = "g_default2", text = "They like to nest with it, the great feathered thieves! Shellei Brondir says they only take the red, so I've moved the red to the far side, and we are collecting data on whether that helps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a gnome with a cart and a great deal of thread, and Menethil has turned out to be an excellent market for both." } },
    gnomeregan = { { id = "tp_gn", text = "I'd rather talk about thread, if you don't mind. Home is a sore subject for all of us just now." } },
    _none = { { id = "tp_none", text = "I don't have any data on that at all, I'm afraid! Ask me about fabric and I'll have too much." } },
  },
}
