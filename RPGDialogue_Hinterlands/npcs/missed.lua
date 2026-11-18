-- The Hinterlands, the folk a roster scan found missing: Aerie Peak's armorsmith and general goods seller,
-- the Zipcoil gnomes camped northeast of Quel'Danil Lodge, the ranger Jalinde Summerdrake at the lodge, and
-- Oran Snakewrithe (Undercity), the Forsaken scholar of the Witherbark. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brannik Ironbelly: Wildhammer armorsmith at Aerie Peak.
P:NPC {
  key = "hl_brannik_ironbelly", id = TODO_NPC("Brannik Ironbelly"), name = "Brannik Ironbelly", title = "Armorsmith", gender = "male",
  bible = "bibles/missed.md", role = "blacksmith", tier = "service",
  communities = { "aerie_peak" }, temper = { "hearty", "loud" }, values = { "craft", "proud" },
  notices = { "class", "craft" },
  impression = {
    first = "Brannik Ironbelly makes and sells armor at Aerie Peak, and most of it is built light enough that a gryphon will still leave the ground under it. He slapped my shoulder to test what I was wearing before he said hello.",
    third = "{name} met Brannik Ironbelly, the Wildhammer armorsmith of Aerie Peak.",
  },
  greetings = {
    { id = "g_default", text = "Hah! Come in out o' the wind, {g:lad|lass}, an' let's see what ye're wearin' that the trolls have nae put a hole in yet." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece! Then either my advice was good or yer luck was, an' I'll take the credit either way." },
  },
  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's a {class} built tae carry proper plate. Ye'll never sit a gryphon in all that, mind, but ye'll make a fine wall on the ground." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith yerself, are ye? Then come feel the heat o' this forge, for the wind up here draws it hotter than any bellows." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Ye speak wi' the storm, by the look of ye. The Wildhammer have aye respected that, whoever's doin' the speakin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Brannik Ironbelly, armorsmith tae the Wildhammer! I make mail for the gryphon riders an' plate for them that fight afoot, an' every piece is hammered up here where the air's clean an' the fire burns true." } },
      again = {
        { id = "h_again", text = "Aye, what else? Shout up, the forge is roarin'." },
        { id = "h_again2", text = "Go on, {g:lad|lass}!" },
      },
      choices = {
        { text = "How do you armor someone who flies?", next = "riders" },
        { text = "What does the armor have to stop out here?", next = "trolls" },
        { text = "Wildhammer smithing differs from Ironforge's?", next = "ironforge" },
        { text = "Show me your armor.", next = "END" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "Light, an' close tae the body, wi' naught that'll catch the wind or chafe the bird. A gryphon will carry a dwarf, his hammer an' his mail, an' if ye add a pound more she'll look at ye like ye've insulted her mother." } },
      choices = {
        { text = "The gryphon gets a say in the armor?", next = "say" },
        { text = "Something else.", next = "BACK" },
      },
    },
    say = {
      lines = { { id = "s_default", text = "She gets the last say, {g:lad|lass}! A Wildhammer doesnae own his gryphon, he's partnered wi' her, an' I've seen a bird refuse a rider over a badly cut saddle strap." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      lines = { { id = "t_default", text = "Troll axes, mostly, an' the Vilebranch throw them hard enough tae split a shield. The Witherbark are fonder o' poison, which nae armor stops, so for them I recommend killin' the troll first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "i_default", text = "Our cousins under the mountain make it thick an' square, like themselves, an' it's grand work for standin' in a tunnel. We left the tunnels long ago, an' we forge for folk who mean tae move." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Wildhammer o' Aerie Peak, an' I've hammered armor for the riders since my beard was short." } },
    _none = { { id = "tp_none", text = "Cannae help ye there, {g:lad|lass}. Ask Falstad's folk in the keep." } },
  },
}

-- Grella Stonefist: general goods at Aerie Peak.
P:NPC {
  key = "hl_grella_stonefist", id = TODO_NPC("Grella Stonefist"), name = "Grella Stonefist", title = "General Goods", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "aerie_peak" }, temper = { "brisk", "warm" }, values = { "practical", "hospitality" },
  notices = { "race", "weary" },
  impression = {
    first = "Grella Stonefist sells general goods at Aerie Peak, the last place to buy a blanket or a waterskin before the Hinterlands turn to trolls and forest. She packs a traveller's bag the way a mother would, firmly and without asking.",
    third = "{name} met Grella Stonefist, who sells general goods at Aerie Peak.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Aerie Peak! Ye'll be wantin' supplies before ye go east, an' ye'll take more than ye think ye need, because I'll see tae it." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! Did ye eat what I sold ye, or did ye carry it about like a keepsake?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A mountain cousin! Ye'll find the air thinner an' the ale stronger up here, an' both take a day tae get used to." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One o' the forest folk. Our friends at Quel'Danil are elves o' another sort, but ye'll likely find more tae talk about wi' them than wi' us." },
    { id = "n_far", cat = "weary", when = { minLevel = 40 },
      text = "Ye've the look o' someone who's walked a long road tae get here. Sit a moment, for the trolls will still be there in an hour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Grella Stonefist, an' I keep the stores here. The Hinterlands are a week across on foot an' full o' trolls from end tae end, so nobody leaves my counter wi' an empty pack if I've aught tae say about it." } },
      again = {
        { id = "h_again", text = "What else, dearie?" },
        { id = "h_again2", text = "Go on, I'm listenin' while I pack." },
      },
      choices = {
        { text = "What should I carry into the Hinterlands?", next = "carry" },
        { text = "How do supplies reach a mountaintop?", next = "supply" },
        { text = "What's life like at Aerie Peak?", next = "life" },
        { text = "Let me see your goods.", next = "END" },
      },
    },
    carry = {
      lines = { { id = "c_default", text = "Food for twice as long as ye plan tae be gone, an' bandages for the wolves an' the owlbeasts. An' if ye go as far as Jintha'Alor, carry a prayer as well, for that's a whole mountain o' Vilebranch." } },
      choices = {
        { text = "Is anywhere out there friendly?", next = "friendly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friendly = {
      lines = { { id = "f_default", text = "The high elves at Quel'Danil Lodge are old allies, though they're wary o' strangers these days. An' there's a pair o' gnomes camped beyond the lodge who'll sell ye a spare cog, if ye can follow a word they say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supply = {
      lines = { { id = "s_default", text = "By gryphon, every sack an' barrel of it, an' the riders grumble about haulin' flour when they'd sooner be haulin' hammers. Brannik gets his iron the same way, which is why he's so careful wi' it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      lines = { { id = "l_default", text = "Windy, loud an' free, an' I'd nae trade it for all the halls of Ironforge. Ye wake tae gryphons cryin' an' ye sleep tae Falstad's lads singin', an' there's nae roof o' stone between ye an' the sky." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Wildhammer born an' bred. I keep the Peak's stores, an' I keep its travellers fed." } },
    _none = { { id = "tp_none", text = "I dinnae ken, dearie. Ask at the keep, they hear all the news the riders bring." } },
  },
}

-- Ruppo Zipcoil: gnome engineering supplier, camped northeast of Quel'Danil Lodge with Gigget.
P:NPC {
  key = "hl_ruppo_zipcoil", id = TODO_NPC("Ruppo Zipcoil"), name = "Ruppo Zipcoil", title = "Engineering Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "zipcoil_camp" }, temper = { "excitable", "distracted" }, values = { "craft", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Ruppo Zipcoil sells engineering supplies from a small camp northeast of Quel'Danil Lodge, which he shares with Gigget Zipcoil and a great many crates. He was halfway through rebuilding something when I arrived and never quite stopped.",
    third = "{name} met Ruppo Zipcoil, a gnome engineering supplier camped in the Hinterlands woods.",
  },
  greetings = {
    { id = "g_default", text = "Oh! A customer, out here! Hold this for a second, would you, and don't let go of the red wire, and then I'll be right with you." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Good, good, because the thing I was building last time works now, at an efficiency of nearly sixty percent." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Gigget, an engineer! Quick, what's your opinion on gyro-stabilised fuse housings, because I have three and they all disagree with each other." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You'll understand, then, why we set up somewhere with no ceiling to bring down and no neighbours to complain." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Ruppo Zipcoil, engineering supplies! Gigget handles the general trade goods and I handle anything with a spring in it, and between us we've got the only parts depot in the whole of the Hinterlands." } },
      again = {
        { id = "h_again", text = "Yes, yes, what else? I'm listening with at least one ear." },
        { id = "h_again2", text = "Go on, I can solder and talk." },
      },
      choices = {
        { text = "Why camp in the middle of troll country?", next = "why" },
        { text = "What are you building?", next = "building" },
        { text = "Do the trolls and wolves leave you alone?", next = "safe" },
        { text = "Let me see your parts.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the testing range is excellent! There's nothing for a mile in any direction that anyone would mind us blowing up, and the Wildhammer riders overhead make a very useful check on how high the debris goes." } },
      choices = {
        { text = "The gryphon riders don't object?", next = "riders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "They did object, once, quite loudly and from quite close. We've agreed on a flag system since then, so a red flag means we're testing and they fly around, which has reduced complaints by a hundred percent." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    building = {
      lines = { { id = "b_default", text = "A self-winding tripwire alarm, so that the camp wakes us before a wolf does. The current prototype detects wolves, falling leaves, Gigget, and me, and I'm working on narrowing that down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "Mostly! The elves at Quel'Danil keep the nearest trolls busy, and the wolves have learned that our camp occasionally goes bang. I'd put our survival odds at eighty-eight percent per month, which Gigget says I shouldn't say to customers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Zipcoil, I sell parts, and I build things in the woods where it's safe to. Safe for other people, I mean." } },
    gnomeregan = { { id = "tp_gn", text = "We left with what we could carry, which in our case was mostly crates. I'd rather build than brood on it." } },
    _none = { { id = "tp_none", text = "I've no idea! Ask Gigget, she keeps track of the things I don't." } },
  },
}

-- Gigget Zipcoil: gnome trade supplies vendor at the same camp.
P:NPC {
  key = "hl_gigget_zipcoil", id = TODO_NPC("Gigget Zipcoil"), name = "Gigget Zipcoil", title = "Trade Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "zipcoil_camp" }, temper = { "organised", "dry" }, values = { "practical", "order" },
  notices = { "craft", "race" },
  impression = {
    first = "Gigget Zipcoil sells trade supplies at the gnome camp northeast of Quel'Danil Lodge, and she is plainly the reason the camp still exists. She keeps an inventory, a ledger, and a wary eye on whatever Ruppo is building.",
    third = "{name} met Gigget Zipcoil, who sells trade supplies and keeps order at the Zipcoil camp in the Hinterlands.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Trade supplies are on this side, engineering parts are on Ruppo's side, and if anything on his side starts ticking, please walk briskly back to mine." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. We've had two small fires and one medium one since your last visit, so everything is quite normal." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing" } },
      text = "You work a proper craft, I can tell by your hands. Thread, flux, salt and dyes are all labelled, which I mention because nothing on Ruppo's side is." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome! Please tell Ruppo that sixty percent efficiency is not a figure one announces proudly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Gigget Zipcoil. Ruppo and I run this depot together, which means that he invents and I count, and so far I've counted eleven prototypes, four successes and one tent that we no longer have." } },
      again = {
        { id = "h_again", text = "What else can I help you with?" },
        { id = "h_again2", text = "Go on, I've finished this column." },
      },
      choices = {
        { text = "Who buys trade supplies out here?", next = "buyers" },
        { text = "What happened to the tent?", next = "tent" },
        { text = "Wouldn't you be safer at Aerie Peak?", next = "peak" },
        { text = "Let me see your supplies.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "More people than you'd expect, by a factor of about three. Wildhammer crafters fly down for flux, the elves at the lodge buy thread, and adventurers arrive having forgotten everything, which I've come to rely on." } },
      choices = {
        { text = "The high elves trade with you?", next = "elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "Politely and briefly, yes. They don't say much and they never haggle, and I suspect they tolerate our camp because the noise draws the trolls' attention away from theirs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tent = {
      lines = { { id = "t_default", text = "Ruppo tested a heating coil inside it, on the reasoning that a tent is where one wants heat. His reasoning was sound and his coil was not, and I've stored the stock under oilcloth ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peak = {
      lines = { { id = "p_default", text = "Safer, certainly, but the Wildhammer were very clear that Ruppo's testing was not to happen within sight of the gryphon roosts. Out here we have room, and I've calculated that room is what keeps us alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Zipcoil, I keep the books, and I sell the supplies that don't explode." } },
    gnomeregan = { { id = "tp_gn", text = "Gone, for now. We've made a home of a clearing and some crates, and I've inventoried worse." } },
    _none = { { id = "tp_none", text = "I don't have that written down anywhere, so I'd only be guessing, and I don't guess." } },
  },
}

-- Jalinde Summerdrake: high elf ranger of the Highvale, at Quel'Danil Lodge.
P:NPC {
  key = "hl_jalinde_summerdrake", id = TODO_NPC("Jalinde Summerdrake"), name = "Jalinde Summerdrake", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "quel_danil" }, temper = { "proud", "guarded" }, values = { "loyal", "dutiful" },
  notices = { "race", "class" },
  impression = {
    first = "Jalinde Summerdrake is a high elf ranger at Quel'Danil Lodge, and she had an arrow on the string before I had finished climbing the path. She speaks for the Highvale elves when anyone must, and she would clearly prefer that nobody had to.",
    third = "{name} met Jalinde Summerdrake, a high elf ranger who watches over Quel'Danil Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Stand where you are and let me look at you. Good, you are no troll and no corpse, so you may come as far as the steps." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the lodge. You were careful with the forest last time, and so you are welcome again." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. The Wildhammer have stood by us when our own kin did not, and for their sake you have my trust until you spend it." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A kaldorei. Our peoples parted long ago and not as friends, but I have no wish to carry an old quarrel into a new age." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry a bow as though you know its weight. The Farstriders would have had work for you, when there was a Quel'Thalas to guard." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You wield the arcane. Use it sparingly here, I ask you, for our people have learned what it costs to lean on magic too heavily." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Jalinde Summerdrake, ranger of the Highvale. This lodge has sheltered our people since long before the Scourge marched on Quel'Thalas, and now it is one of the few homes that the high elves have left." } },
      again = {
        { id = "h_again", text = "What more would you ask? My watch is not ended." },
        { id = "h_again2", text = "Speak, and I will answer what I may." },
      },
      choices = {
        { text = "What became of Quel'Thalas?", next = "quel" },
        { text = "Who threatens the lodge?", next = "threat" },
        { text = "How do you stand with the Wildhammer?", next = "dwarves" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    quel = {
      lines = { { id = "q_default", text = "The traitor prince of Lordaeron led the dead through our forests, slew our king and fouled the Sunwell that sustained us. Most of my people perished in a season, and those of us who were here in the Hinterlands lived only because we were away." } },
      choices = {
        { text = "And those who survived in the north?", next = "north" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "We hear little of them, and what we hear is troubling. They have turned inward in their grief, and I think that we of the lodge would be strangers to them now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = { { id = "t_default", text = "The forest trolls, as ever, for the Witherbark and Vilebranch have not forgotten the Troll Wars. Of late there have been Horde scouts in the trees as well, and the Revantusk on the coast have surely told them where we are." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "As allies of long standing. The Wildhammer fought beside our rangers in the Second War, and when the rest of the Alliance grew cold toward us, the dwarves of Aerie Peak still sent gryphons to ask how we fared." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a ranger of the Highvale, and Quel'Danil is my charge." } },
    _none = { { id = "tp_none", text = "I cannot tell you. We keep to our forest, and the world's news reaches us late." } },
  },
}

