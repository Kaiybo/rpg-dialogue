-- Dustwallow Marsh, folk no earlier pass reached: Theramore's shopkeepers and trainers (Uma Bartulm, Marie Holdston,
-- Craig Nollward, Helenia Olden, Timothy Worthington, Medic Helaina), a Theramore Lieutenant and Sentry, a Brackenwall
-- Enforcer, and the black drake Emberstrife in the Wyrmbog.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Uma Bartulm: herbalism and alchemy supplies.
P:NPC {
  key = "dw_uma_bartulm", id = TODO_NPC("Uma Bartulm"), name = "Uma Bartulm", gender = "female",
  role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "brisk" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Uma Bartulm sells herbs and alchemy supplies on Theramore Isle, and her shop smells of drying leaves and swamp water. She weighs everything twice and talks while she does it.",
    third = "{name} met Uma Bartulm, Theramore's herbalism and alchemy supplier.",
  },
  greetings = {
    { id = "g_default", text = "Come in and shut the door, please, the damp gets into the vials. What are you after?" },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You've been picking in the marsh, I can smell it on you. If there's liferoot in that bag, I'll have a look at it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep vials, solvents and the odd herb that doesn't grow here. Half the guard buys healing draughts from the alchemists I supply, so I like to think I've saved a few of them." } },
      again = { { id = "h_again", text = "Anything else? I've a batch of leaves to turn." } },
      choices = {
        { text = "What grows well in the marsh?", next = "marsh" },
        { text = "The damp must ruin your stock.", next = "damp" },
        { text = "Who buys from you?", next = "xbuyers" },
        { text = "What's the rarest thing on your shelf?", next = "xrare" },
        { text = "Your shop smells of mint and swamp.", next = "xsmell" },
        { text = "I'm an alchemist. What should I brew here?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "Good day, Uma.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "m_default", text = "Liferoot and kingsblood along the drier ground, and fadeleaf if you don't mind the shade. Don't pick anything near the Wyrmbog, though, because the dragons' mess gets into the roots." } },
      choices = {
        { text = "Dragons' mess?", next = "dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Black dragons nest in the south of the marsh, and everything that grows near them comes up bitter and sooty. I threw out a whole crate once, and the smell stayed in the shop for a week." } },
      choices = { { text = "I'll keep north. Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "da_default", text = "It does, unless you're stubborn about it, and I am. Everything goes in waxed jars, and I keep a brazier going even in summer, which the neighbours complain about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbuyers = {
      lines = { { id = "xxbuyers_d", text = "The alchemists in town, the medics and the odd adventurer who's run out of vials. Medic Helaina buys swiftthistle by the sack, and I don't ask what she does with it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrare = {
      lines = { { id = "xxrare_d", text = "A dried sprig of goldthorn from Stranglethorn, which took three months to arrive and cost more than my rent. I'm saving it for something that matters, though I've not decided what." } },
      choices = {
        { text = "Who would you give it to?", next = "xgive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgive = {
      lines = { { id = "xxgive_d", text = "There's a soldier in the barracks with a wound that won't close, and a goldthorn draught might help him. But it might also help ten others, if I sell it to the alchemist instead." } },
      choices = {
        { text = "Give it to the soldier. One life you can save matters.", next = "BACK", reply = "That's what my heart says. I'll take it to the infirmary tomorrow.", fx = { align = { light = 1 } } },
        { text = "Sell it. Ten draughts serve the garrison better.", next = "BACK", reply = "That's the sensible answer, and I hate that it is.", fx = { align = { light = -1 } } },
      },
    },
    xsmell = {
      narr = "She tucks a fresh bunch of mint into a crack in the shelving without looking.",
      lines = { { id = "xxsmell_d", text = "Mint for the shelves, to keep the mould down, and swamp because it gets in everywhere no matter what I do. You get used to it, or you go back on the boat." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalch = {
      lines = { { id = "xxalch_d", text = "Healing potions, as many as you can, because the garrison drinks them like ale. Liferoot grows along the riverbanks here, and it's the best in Kalimdor, so pick it and bring me some." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    liferoot = { { id = "tp_xliferoot", text = "Grows by the rivers in the marsh. Best quality I've seen anywhere." } },
    goldthorn = { { id = "tp_xgoldthorn", text = "I've a single sprig, and I'm saving it for something important." } },
    _none = { { id = "tp_none", text = "I couldn't say, dear. Ask me about roots and I'll talk all day." } } },
}

-- Marie Holdston: blacksmithing trainer and weapon vendor.
P:NPC {
  key = "dw_marie_holdston", id = TODO_NPC("Marie Holdston"), name = "Marie Holdston", gender = "female",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "gruff" }, values = { "craft", "duty" },
  notices = { "craft", "kit" },
  impression = {
    first = "Marie Holdston trains blacksmiths and sells weapons on Theramore Isle. She has forearms like a dockhand and a voice that carries over the anvil without effort.",
    third = "{name} met Marie Holdston, Theramore's blacksmithing trainer.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sparks. If you want a blade, they're on the rack, and if you want to learn to make one, roll up your sleeves." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's burns on your hands. Let's see what you know, and then I'll show you what you don't." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear's half rust. The marsh does that, and so does neglect, and I'd guess both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I came over with Lady Proudmoore's fleet and I've kept the garrison armed ever since. The damp here eats steel faster than any orc, so most of my day is fighting rust." } },
      again = { { id = "h_again", text = "Something else? The iron's cooling." } },
      choices = {
        { text = "How do you fight rust?", next = "rust" },
        { text = "You sailed with the fleet from Lordaeron?", next = "fleet" },
        { text = "Who taught you to smith?", next = "xtaught" },
        { text = "Does the garrison keep you busy?", next = "xbusy" },
        { text = "What's the best steel for this climate?", next = "xsteel" },
        { text = "I'm a warrior. What would you forge for me?", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Thanks, Marie.", next = "END" },
      },
    },
    rust = {
      lines = { { id = "r_default", text = "Oil every night, and a good scabbard, and never put a blade away wet. Most soldiers manage one of the three, and I see the rest of them at my rack." } },
      choices = { { text = "I'll oil mine. Something else.", next = "BACK" } },
    },
    fleet = {
      lines = { { id = "f_default", text = "I did, with my hammer wrapped in sailcloth and not much else. We left a dying kingdom behind us, and I'd sooner talk about steel than about that." } },
      choices = {
        { text = "Then we'll talk about steel.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you miss it?", next = "miss" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss the forge my father built, and I miss the man himself. The rest is ash now, and Theramore is home, rain and all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtaught = {
      lines = { { id = "xxtaught_d", text = "My father, in Kul Tiras, at a forge by the harbour where they made fittings for the Admiral's ships. I learned to keep iron from the sea before I learned to make a sword, and that's served me better here than anything." } },
      choices = {
        { text = "Kul Tiras? Do you still think of home?", next = "xhome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhome = {
      lines = { { id = "xxhome_d", text = "Sometimes, when the smoke goes right. But Admiral Proudmoore died on these shores, and the Lady stayed, and most of us who came with her decided that was the end of the argument." } },
      choices = {
        { text = "Was the Admiral wrong to attack the Horde?", next = "xadmiral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xadmiral = {
      lines = { { id = "xxadmiral_d", text = "That's a question that splits this town down the middle, and I've heard both halves in my own shop. He was a great man, and he came here to fight a war the Lady had already ended." } },
      choices = {
        { text = "The Admiral was wrong. Jaina chose peace, and she was right.", next = "BACK", reply = "That's how I see it too, though I'll not say it loud near the old sailors.", fx = { align = { order = -1 } } },
        { text = "He was her father and her admiral. She owed him obedience.", next = "BACK", reply = "Plenty here would shake your hand for that. I'll just say it cost her more than any of us.", fx = { align = { order = 1 } } },
      },
    },
    xbusy = {
      narr = "She drops a red-hot strip into the quench barrel, and the steam rolls across the counter.",
      lines = { { id = "xxbusy_d", text = "Busy enough that I never see the sun before noon. Swords rust, mail rusts, the hinges on the gate rust, and every time the dragons come down from the Wyrmbog someone needs a new shield." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsteel = {
      lines = { { id = "xxsteel_d", text = "Good dwarven steel, oiled every night, and never stored wet, which in Dustwallow means never stored at all. A blade here wants a thick spine and a plain grip, because fancy work just gives the rust somewhere to hide." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = { { id = "xxwarrior_d", text = "Something heavy with no frills, because out here you fight crocolisks and black dragonspawn, not duelists. Learn to keep it oiled and it'll outlast three of those pretty swords from Stormwind." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kul_tiras = { { id = "tp_xkul_tiras", text = "Home, once. The forges by the harbour smelled of salt and tar, and I miss them some nights." } },
    rust = { { id = "tp_xrust", text = "The marsh's greatest weapon is rust. It's beaten more soldiers here than the dragons have." } },
    _none = { { id = "tp_none", text = "Not my trade. Ask at the inn, they've nothing better to do." } } },
}

-- Craig Nollward: cook at the Theramore inn.
P:NPC {
  key = "dw_craig_nollward", id = TODO_NPC("Craig Nollward"), name = "Craig Nollward", gender = "male",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "cheerful" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Craig Nollward cooks and sells food at the Theramore inn, and he has strong opinions about seasoning that he will share with anyone who stands still.",
    third = "{name} met Craig Nollward, the cook at the Theramore inn.",
  },
  greetings = {
    { id = "g_default", text = "Hungry? You look hungry. Sit down, I've a pot of something that's nearly fish." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Thank the Light. Tell me, do you salt before or after, because there's a man down the dock who's wrong about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I feed the off-watch, the dock hands and anyone who wanders in out of the rain. I also teach a bit of cooking, if you've patience and a strong stomach." } },
      again = { { id = "h_again", text = "Anything else? The pot won't stir itself." } },
      choices = {
        { text = "Who's wrong about salt?", next = "stern" },
        { text = "What do you cook in a swamp?", next = "swamp" },
        { text = "What's the most popular dish on the docks?", next = "xdish" },
        { text = "Who do you feed, mostly?", next = "xwho" },
        { text = "This place smells better than the marsh.", next = "xsmell" },
        { text = "I'm a dwarf, and I want something with ale in it.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Later, Craig.", next = "END" },
      },
    },
    stern = {
      lines = { { id = "s_default", text = "Morgan Stern, who cooks for the guard. He salts after and he swears by bogbean leaves, and we've had the same argument every night for a year." } },
      choices = {
        { text = "Bogbean leaves?", next = "bogbean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bogbean = {
      lines = { { id = "b_default", text = "Bitter green things from the north marsh. He sends poor Ignatz out to pick them, raptors and all, and I still say the dish would be better without them." } },
      choices = { { text = "I'll take no side. Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "sw_default", text = "Fish, crab, turtle if the hunters bring one back, and raptor when I'm desperate. Raptor's stringy, but it's honest food, which is more than I can say for anything with tentacles." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdish = {
      lines = { { id = "xxdish_d", text = "Crocolisk steak, done slow with a bit of pepper, because the soldiers bring in crocolisk tails every other day and they'll not waste the meat. It's tough as a boot if you rush it, and better than beef if you don't." } },
      choices = {
        { text = "Is crocolisk safe to eat?", next = "xsafe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsafe = {
      lines = { { id = "xxsafe_d", text = "Safe as anything in this swamp, which is to say mostly. Cut the green bits off, cook it through, and you'll live, though I've had a few complaints from the stomachs of new recruits." } },
      choices = {
        { text = "Do you teach the recipe?", next = "xteach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xteach = {
      lines = { { id = "xxteach_d", text = "I'll teach anyone who'll stand over a fire for an hour without wandering off. Bring me the meat and I'll show you, and you'll never be hungry in Dustwallow again, only tired of crocolisk." } },
      choices = {
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xwho = {
      lines = { { id = "xxwho_d", text = "Off-watch guards, sailors off the Menethil boat, and the odd Horde courier who's brave enough to sit in a corner. Lady Jaina says we serve anyone peaceable, so I serve anyone peaceable, though some of the lads grumble." } },
      choices = {
        { text = "You'd serve an orc at your table?", next = "xorc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = { { id = "xxorc_d", text = "I have, and he ate like a soldier and paid like a gentleman, which is more than I can say for our own garrison. What do you think, should the Lady keep the door open?" } },
      choices = {
        { text = "Yes. Bread and peace go together.", next = "BACK", reply = "That's my thinking too. A full belly picks fewer fights, whatever colour it is.", fx = { align = { honor = 1 } } },
        { text = "No. Theramore should look after its own first.", next = "BACK", reply = "Well, you'll find plenty of the garrison who'd agree with you. I just cook, and the Lady decides.", fx = { align = { honor = -1 } } },
      },
    },
    xsmell = {
      narr = "He waves a ladle toward the shuttered window without looking up from the pot.",
      lines = { { id = "xxsmell_d", text = "It ought to, with the onions I go through. The trick is to keep the shutters closed on the marsh side, because the wind off the bog smells like a dead heron and gets into everything." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xxdwarf_d", text = "Ale in it? I'll do you a stew with a splash of Thunderbrew, if the supply boat brought any, which it sometimes doesn't. Dwarves always ask for that, and I've never once had one complain about the result." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    crocolisk = { { id = "tp_xcrocolisk", text = "Tough meat, good flavour. Slow is the only way to cook it." } },
    theramore_inn = { { id = "tp_xtheramore_inn", text = "The inn's never empty. Soldiers come in wet and leave full, and I like it that way." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me about a stew." } } },
}

-- Helenia Olden: trade supplies, first house by the docks.
P:NPC {
  key = "dw_helenia_olden", id = TODO_NPC("Helenia Olden"), name = "Helenia Olden", gender = "female",
  role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "kindly" }, values = { "plain_dealing" },
  notices = { "craft" },
  impression = {
    first = "Helenia Olden sells trade supplies from the first house past Theramore's docks. She is the first shopkeeper most newcomers meet, and she seems to have made a habit of giving directions.",
    third = "{name} met Helenia Olden, who sells trade supplies near Theramore's docks.",
  },
  greetings = {
    { id = "g_default", text = "Just off the boat? Everyone is, at first. I've thread, dye and flux, and directions are free." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "My shop's the first one off the dock, so I see every face that comes to Theramore. Most are lost, a few are trouble, and some just need a spool of thread." } },
      again = { { id = "h_again", text = "What else can I help you find?" } },
      choices = {
        { text = "Where should a newcomer go first?", next = "where" },
        { text = "What kind of trouble comes off the boat?", next = "trouble" },
        { text = "What do you sell the most of?", next = "xsell" },
        { text = "You must hear a lot of gossip here.", next = "xgossip" },
        { text = "Why did you come to Theramore?", next = "xwhy" },
        { text = "I'm a tailor. Is your thread any good?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "Thank you, Helenia.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "The inn for a bed, the keep if you're looking for work, and Lady Proudmoore's tower only if you've been sent for. The guards will point you right if I haven't." } },
      choices = {
        { text = "What sort of work at the keep?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "Deserters in the marsh, raptors, the black dragons to the south, and something about Stonemaul ogres. There's always more trouble than soldiers here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Men who left something bad behind in Lordaeron and think the sea will hide it. It doesn't, and the guard usually works it out before I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsell = {
      lines = { { id = "xxsell_d", text = "Thread and flux, mostly, because soldiers tear their coats and smiths burn through flux like it's water. Dye sells to the officers, who like their colours bright even in a swamp." } },
      choices = {
        { text = "Bright colours in a swamp seems foolish.", next = "xcolour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcolour = {
      lines = { { id = "xxcolour_d", text = "Foolish, maybe, but a blue coat in the fog tells the guard you're one of theirs before he shoots. Captain Vimes insisted on it after a sentry put an arrow in a supply clerk." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgossip = {
      narr = "She glances at the open door before she answers, and lowers her voice.",
      lines = { { id = "xxgossip_d", text = "More than I'd like, and I keep most of it behind the counter where it belongs. Lately it's all about the hoofprints by the burnt inn, and whether the Horde's up to something or someone wants it to look that way." } },
      choices = {
        { text = "What do you think?", next = "xthink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xthink = {
      lines = { { id = "xxthink_d", text = "I think a peace is a fragile thing and there are folk on both sides who'd like to see it break. Some say Theramore's too soft on the Horde, and some say it's the only sense left in the world." } },
      choices = {
        { text = "Jaina's right. Peace with Thrall is worth protecting.", next = "BACK", reply = "Then you and I would get along, and the Lady too, I expect.", fx = { align = { light = 1 } } },
        { text = "Trusting orcs will cost Theramore dearly someday.", next = "BACK", reply = "Well, you're not alone in saying so. I hope you're wrong, that's all.", fx = { align = { light = -1 } } },
      },
    },
    xwhy = {
      lines = { { id = "xxwhy_d", text = "My husband was a sailor in the Proudmoore fleet, and when it came here, so did I. He sails the Menethil run now, and I mind the shop and watch the boats come in." } },
      choices = {
        { text = "Do you worry when he sails?", next = "xworry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xworry = {
      lines = { { id = "xxworry_d", text = "Every time, because the sea between here and Menethil has pirates and storms and worse. But he always comes back with a story and a bad cold, so I've learned to keep a pot of tea ready." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtailor = {
      lines = { { id = "xxtailor_d", text = "It's good thread from Lakeshire mills, not the rough sailcloth stuff the docks use. Bring me silk or mageweave from the marsh and you'll want the finer spools, and I keep those on the top shelf." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    menethil = { { id = "tp_xmenethil", text = "The boat to Menethil runs when the weather lets it. My husband's on it more often than he's home." } },
    theramore = { { id = "tp_xtheramore", text = "Theramore was a swamp when we got here. Now it's a city, and I helped, with thread." } },
    _none = { { id = "tp_none", text = "I sell thread, love, not secrets. Try the inn." } } },
}

-- Timothy Worthington: tailoring trainer.
P:NPC {
  key = "dw_timothy_worthington", id = TODO_NPC("Timothy Worthington"), name = "Timothy Worthington", gender = "male",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "fussy" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Timothy Worthington trains tailors in Theramore and keeps his own clothes spotless, which in Dustwallow Marsh is a small miracle he is quietly proud of.",
    third = "{name} met Timothy Worthington, Theramore's tailoring trainer.",
  },
  greetings = {
    { id = "g_default", text = "Please wipe your boots. I've mud enough from the soldiers, and I've only just finished brushing the bench." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A fellow tailor, and your seams are straight, which I can't say for half the garrison. Come and see what I can teach you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I teach tailoring to anyone with steady hands and keep the officers' uniforms presentable. Mageweave is the cloth of the hour, if you can find it." } },
      again = { { id = "h_again", text = "Yes? Do mind the cloth on the bench." } },
      choices = {
        { text = "Where does mageweave come from?", next = "mageweave" },
        { text = "Clean clothes in a swamp seems hopeless.", next = "clean" },
        { text = "How did you become a tailor?", next = "xhow" },
        { text = "Whose uniforms do you mend?", next = "xuniforms" },
        { text = "What would you make with the right cloth?", next = "xdream" },
        { text = "I'm a mage. Do you make robes for casters?", next = "xmage", when = { class = "MAGE" } },
        { text = "Good day, Timothy.", next = "END" },
      },
    },
    mageweave = {
      lines = { { id = "mw_default", text = "Off the backs of those who can afford it, mostly, so the ogres and the cultists and the like. I won't ask how you come by it, and you needn't tell me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clean = {
      lines = { { id = "c_default", text = "It is hopeless, which is exactly why it matters. If the officers look like soldiers, the soldiers remember they are, and Lady Proudmoore notices these things." } },
      choices = {
        { text = "Appearances keep discipline. You're right.", next = "BACK", reply = "Thank you. Someone finally understands.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A soldier fights just as well muddy.", next = "BACK", reply = "Perhaps, but he salutes worse.", fx = { align = { order = -1 } } },
      },
    },
    xhow = {
      lines = { { id = "xxhow_d", text = "I apprenticed in Dalaran, sewing robes for magi who never once said thank you. When the city fell under the Scourge's shadow I took passage with the Lady, because she at least remembers her tailor's name." } },
      choices = {
        { text = "You knew Jaina in Dalaran?", next = "xjaina" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xjaina = {
      lines = { { id = "xxjaina_d", text = "Knew is a strong word, but I hemmed her apprentice robes once and she apologised for standing on my pins. A mage who apologises is rarer than a clean boot in this marsh." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xuniforms = {
      narr = "He holds up a coat sleeve to the light and sighs at a mud stain no bigger than a coin.",
      lines = { { id = "xxuniforms_d", text = "The officers', mostly, and Captain Vimes' in particular, because he insists his coat be presentable even when he's knee-deep in a bog. I approve of the principle and despair of the practice." } },
      choices = {
        { text = "Is looking smart really important here?", next = "xsmart" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsmart = {
      lines = { { id = "xxsmart_d", text = "I've heard both sides argued at my bench, mostly by soldiers who want to get out of polishing." } },
      choices = {
        { text = "Yes. A tidy garrison is a disciplined one.", next = "BACK", reply = "Thank you. At last someone sensible has walked through my door.", fx = { align = { order = 1 } } },
        { text = "No. Mud is honest. Polish is for parades.", next = "BACK", reply = "Hmph. Then I suppose you'll be wanting to mend your own coat.", fx = { align = { order = -1 } } },
      },
    },
    xdream = {
      lines = { { id = "xxdream_d", text = "Mageweave, enough of it, and silk from the marsh spiders for the lining. I'd make the Lady a proper winter robe, because the citadel is draughty and she works far too late." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xxmage_d", text = "Of course. Mageweave takes an enchantment better than any linen, and I can teach you to cut a robe that won't catch on a staff. Dalaran's patterns, though I'll thank you not to tell Dalaran." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_xdalaran", text = "I sewed robes there once. The magi were brilliant and very hard on the hems." } },
    mageweave = { { id = "tp_xmageweave", text = "Good cloth, soft and strong. Most of it comes off bandits and cultists, which I try not to think about." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. I keep to my needles." } } },
}

-- Medic Helaina: a young first aid medic.
P:NPC {
  key = "dw_medic_helaina", id = TODO_NPC("Medic Helaina"), name = "Medic Helaina", gender = "female",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "earnest" }, values = { "healing" },
  notices = { "craft", "kit" },
  impression = {
    first = "Medic Helaina is young for a medic and works harder than anyone to make up for it. She learned her trade from the healers of the Alliance and treats the guard's cuts and fevers on Theramore Isle.",
    third = "{name} met Medic Helaina, a first aid medic on Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Are you hurt? Sit down and let me look, even if you think it's nothing." },
    { id = "g_low", when = { health = { max = 0.5 } }, text = "You're bleeding on my floor. Sit, please, before you fall over." },
  },
  notice = {
    { id = "n_aid", cat = "craft", when = { profession = "First Aid" },
      text = "You carry bandages. Good. Let me see how you wrap them, because most people do it too loosely." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the garrison patched up and teach first aid to anyone who'll learn. In this marsh it's fever as often as swords, and fever doesn't care how brave you are." } },
      again = { { id = "h_again", text = "Anything else? I've a soldier with marsh rot waiting." } },
      choices = {
        { text = "What's the worst you see here?", next = "worst" },
        { text = "Who taught you?", next = "teacher" },
        { text = "How did you become a medic?", next = "xhow" },
        { text = "What's marsh rot, exactly?", next = "xrot" },
        { text = "You look like you haven't slept.", next = "xsleep" },
        { text = "I'm a priest. Could the Light help your patients?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Thanks, Helaina.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Raptor bites that go bad in the damp. If you're bitten out there, clean it with boiled water the same day, not the next, or you'll be back here losing the arm." } },
      choices = {
        { text = "Boiled water. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = { { id = "t_default", text = "The field healers, mostly, in the camps after the war. They had more wounded than hands, so they taught anyone who didn't faint." } },
      choices = {
        { text = "You didn't faint?", next = "faint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faint = {
      lines = { { id = "f_default", text = "Once, the first day, but I came back the second. They said that was the part that counted." } },
      choices = { { text = "It is. Something else.", next = "BACK" } },
    },
    xhow = {
      lines = { { id = "xxhow_d", text = "My mother was a midwife in Southshore, and I held her lamp from the time I could stand. When the fleet sailed I came along to bind wounds, and nobody's sent me home since." } },
      choices = {
        { text = "Southshore? Do you hear from there?", next = "xsouth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsouth = {
      lines = { { id = "xxsouth_d", text = "Now and then, through the Menethil boat, and the news is never good. The Forsaken are thick in the hills and the Syndicate rob the roads, and my mother writes that she's fine, which means she isn't." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrot = {
      lines = { { id = "xxrot_d", text = "It starts as a rash between the toes and climbs, and if you leave it, it eats the skin right off you. Dry socks, clean bandages and a salve of swiftthistle keep it off, if the soldiers would listen." } },
      choices = {
        { text = "Why won't they listen?", next = "xlisten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlisten = {
      lines = { { id = "xxlisten_d", text = "Because a soldier would sooner die brave than change his socks, I sometimes think. Should I order them, or let them learn the hard way?" } },
      choices = {
        { text = "Order them. Their lives are worth a little pride.", next = "BACK", reply = "I think I will, then. Captain Vimes owes me a favour or two.", fx = { align = { order = 1 } } },
        { text = "Let them learn. Grown soldiers choose for themselves.", next = "BACK", reply = "That's what they'd say too. I'll leave the salve on the shelf and wait for them to come limping.", fx = { align = { order = -1 } } },
      },
    },
    xsleep = {
      narr = "She rubs her eyes with the back of a wrist, careful of the blood on her hands.",
      lines = { { id = "xxsleep_d", text = "I sleep when the infirmary's empty, and it hasn't been empty since the new recruits arrived. But a medic who complains about being tired is a medic who isn't working, so I'll thank you to keep it between us." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = { { id = "xxpriest_d", text = "The Light helps, of course it does, and I'm glad of every priest who stops in. But a prayer doesn't keep a wound clean for a week, and a good bandage does, so I'd have you learn both." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    marsh_rot = { { id = "tp_xmarsh_rot", text = "Dry socks, clean wraps, a swiftthistle salve. Simple, and nobody does it." } },
    southshore = { { id = "tp_xsouthshore", text = "My mother still delivers babies in Southshore, with the Forsaken over the hill. She's braver than I am." } },
    _none = { { id = "tp_none", text = "I don't know about that, I'm afraid. Ask me about a wound instead." } } },
}

-- Theramore Lieutenant.
P:NPC {
  key = "dw_theramore_lieutenant", id = TODO_NPC("Theramore Lieutenant"), name = "Theramore Lieutenant", gender = "male",
  role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "stern" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "The Theramore Lieutenants keep the watch on the isle and answer to Captain Garran Vimes. This one looked at me as if I were a report he had not yet decided to file.",
    third = "{name} spoke with a Theramore Lieutenant on the isle.",
  },
  greetings = {
    { id = "g_default", text = "State your business on the isle, please. If it's honest, you'll find us glad of the help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the watch rotation and pass reports up to Captain Vimes. Between the deserters, the Horde scouts and the dragons, there's never a short report." } },
      again = { { id = "h_again", text = "Anything else? Keep it brief, please." } },
      choices = {
        { text = "What's in the reports lately?", next = "reports" },
        { text = "Where do I find Captain Vimes?", next = "vimes" },
        { text = "What's the rotation like?", next = "xrota" },
        { text = "Tell me about the deserters.", next = "xdesert" },
        { text = "You look like you'd rather be in the field.", next = "xfield" },
        { text = "I'm a warrior. Do you need another blade?", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Carry on, lieutenant.", next = "END" },
      },
    },
    reports = {
      lines = {
        { id = "r_default", text = "Orcs seen near the Shady Rest, and some of the men are calling for blood. The Lady wants it looked into before anyone draws steel, and so do I." },
        { id = "r_orc", when = { questDone = TODO_QUEST("The Orc Report") }, text = "Your report on the orcs reached the captain. He read it twice, which is more than he does for mine." },
      },
      choices = {
        { text = "Peace with the Horde is worth keeping.", next = "BACK", reply = "Lady Proudmoore thinks so, and I follow her.", fx = { align = { order = 1 } } },
        { text = "The Horde will break the peace anyway.", next = "BACK", reply = "Maybe, but not because we broke it first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vimes = {
      lines = { { id = "v_default", text = "In the keep, behind a desk he hates. He'd rather be on the walls, and so would I, but someone has to read the reports." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xrota = {
      lines = { { id = "xxrota_d", text = "Four watches a day, each one a little shorter than the soldiers want and a little longer than the marsh allows. I pair the new recruits with the old hands, because a recruit alone in the fog sees ghosts in every reed." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdesert = {
      narr = "His jaw tightens, and he squares the stack of reports on the table without looking at them.",
      lines = { { id = "xxdesert_d", text = "They've a camp out in the marsh, and they call themselves free men while they rob our supply wagons. Some of them I trained myself, which makes it worse." } },
      choices = {
        { text = "Why did they leave?", next = "xwhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = { { id = "xxwhy_d", text = "They didn't care for peace with the Horde, or for mud, or for the pay, depending which one you ask. Some say we should hang them, and some say we should take them back." } },
      choices = {
        { text = "What would you do?", next = "xdo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdo = {
      lines = { { id = "xxdo_d", text = "I'd rather hear what you'd do, honestly, since I've argued it with myself all week." } },
      choices = {
        { text = "Desertion is betrayal. They should hang.", next = "BACK", reply = "That's the law, and Captain Vimes would agree with you. I'll put it in the report.", fx = { align = { order = 1 } } },
        { text = "Offer them a way home. Theramore needs every sword.", next = "BACK", reply = "That's the soft answer, and I half believe it. The Lady might too.", fx = { align = { order = -1 } } },
      },
    },
    xfield = {
      lines = { { id = "xxfield_d", text = "Is it that obvious? I was a sergeant in the field before they gave me a desk and a stack of paper. Captain Vimes says a good lieutenant knows the marsh from the reports, and I say he knows it better from the mud." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = { { id = "xxwarrior_d", text = "Always, and Captain Vimes takes on capable help for the marsh patrols. Ask him in the citadel, and tell him the lieutenant sent you, so he knows you've been vetted." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    deserters = { { id = "tp_xdeserters", text = "Former soldiers who'd sooner rob our wagons than stand our walls. I trained some of them." } },
    vimes = { { id = "tp_xvimes", text = "Captain Garran Vimes runs the garrison. He's fair and he's tired, like the rest of us." } },
    _none = { { id = "tp_none", text = "That's not in my orders. Ask at the keep." } } },
}

-- Theramore Sentry.
P:NPC {
  key = "dw_theramore_sentry", id = TODO_NPC("Theramore Sentry"), name = "Theramore Sentry", gender = "male",
  role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "weary" }, values = { "duty" },
  notices = {},
  impression = {
    first = "The Theramore Sentries stand on the walls and towers around the isle, watching the marsh for anything that moves. This one was wet through and did not seem to expect otherwise.",
    third = "{name} spoke with a Theramore Sentry.",
  },
  greetings = {
    { id = "g_default", text = "Halt, and good day. You're not a raptor, so you're welcome enough." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Quiet, please. You hear more of the marsh at night when nobody's talking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I stand watch and I count what comes out of the marsh. Raptors, deserters, now and then a black dragon high up, and fog, always fog." } },
      again = { { id = "h_again", text = "Anything else? I'm meant to be watching, not chatting." } },
      choices = {
        { text = "Dragons fly this far north?", next = "dragons" },
        { text = "Deserters?", next = "deserters" },
        { text = "What's the strangest thing you've seen?", next = "xstrange" },
        { text = "How do you stay awake out here?", next = "xawake" },
        { text = "Do raptors really come this close?", next = "xraptor" },
        { text = "I'm a hunter. I could help with those raptors.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Stay dry.", next = "END" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Not often, but I've seen them, black as a coal against the clouds. They come from the Wyrmbog to the south, and they never land, thank the Light." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deserters = {
      lines = { { id = "de_default", text = "Men who ran off into the marsh, and some have turned bandit since. I knew a few of them once, which makes the watch longer." } },
      choices = {
        { text = "They chose their road.", next = "BACK", reply = "They did, and it's a hard one.", fx = { align = { order = 1 } } },
        { text = "Maybe they had reasons.", next = "BACK", reply = "Maybe. I'd still have to stop them.", fx = { align = { order = -1 } } },
      },
    },
    xstrange = {
      lines = { { id = "xxstrange_d", text = "A light moving out in the fog one night, blue and slow, like a lantern carried by nobody. It went toward the old ruins in the south and never came back, and the sergeant told me not to put it in my report." } },
      choices = {
        { text = "Why not report it?", next = "xreport" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xreport = {
      lines = { { id = "xxreport_d", text = "He said ghost stories make the recruits jumpy, and jumpy recruits shoot at herons. Should I have put it in anyway?" } },
      choices = {
        { text = "Yes. A sentry reports what he sees, whatever it is.", next = "BACK", reply = "That's what I thought. I'll write it in tonight, and the sergeant can scowl.", fx = { align = { order = 1 } } },
        { text = "No. Some things are better kept to yourself.", next = "BACK", reply = "Maybe you're right. I've kept it this long, and nobody's died of it yet.", fx = { align = { order = -1 } } },
      },
    },
    xawake = {
      narr = "He stifles a yawn behind a gloved fist and straightens up at once.",
      lines = { { id = "xxawake_d", text = "Strong tea, cold water on the face and counting the frogs. There are a great many frogs in Dustwallow, and I've never finished counting them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xraptor = {
      lines = { { id = "xxraptor_d", text = "Close enough to steal a ration pack off the wall once, and to bite the sergeant's boot another time. They come up from the south in packs, and they're cleverer than they look." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xxhunter_d", text = "Then you're welcome on my watch any night. A hunter who knows raptors is worth ten guards who've only read about them, and I've only read about them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    raptors = { { id = "tp_xraptors", text = "Clever, fast and always hungry. They stole my supper once." } },
    fog = { { id = "tp_xfog", text = "The fog comes off the marsh every evening, and you learn to listen instead of look." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask the lieutenant." } } },
}

-- Brackenwall Enforcer: Stonemaul ogre guard.
P:NPC {
  key = "dw_brackenwall_enforcer", id = TODO_NPC("Brackenwall Enforcer"), name = "Brackenwall Enforcer", gender = "male",
  role = "guard", tier = "service",
  communities = { "brackenwall" }, temper = { "gruff" }, values = { "strength" },
  notices = {},
  impression = {
    first = "The Brackenwall Enforcers are Stonemaul ogres in red war paint who guard the village with maces as long as a man. This one counted on his fingers while he talked, and kept losing his place.",
    third = "{name} spoke with a Brackenwall Enforcer of the Stonemaul.",
  },
  greetings = {
    { id = "g_default", text = "You come in Brackenwall, you be good. Enforcer is watching, and Enforcer has big mace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Enforcer guards Brackenwall for the Stonemaul and for the Horde. Stonemaul used to live in the south, but the black dragons came and burned everything, so now we live here." } },
      again = { { id = "h_again", text = "You still talking? Enforcer is still listening." } },
      choices = {
        { text = "The dragons drove you out?", next = "dragons" },
        { text = "Why do Stonemaul fight for the Horde?", next = "horde" },
        { text = "What does an Enforcer do all day?", next = "xjob" },
        { text = "You keep counting on your fingers.", next = "xfingers" },
        { text = "What do you think of the humans in Theramore?", next = "xhumans" },
        { text = "I am Horde too. Throm-ka, big one.", next = "xorc", when = { race = "Orc" } },
        { text = "Goodbye, big one.", next = "END" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Big black ones, from the bog. They burned the old village and ate many ogres, and Enforcer wants to smash them, but Enforcer cannot reach that high." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "h2_default", text = "Rexxar came and helped Stonemaul when the bad ogres fought us. Rexxar is strong and Thrall is strong, so Stonemaul is Horde now, and Enforcer smashes for them." } },
      choices = {
        { text = "Strength earns loyalty. That's fair.", next = "BACK", reply = "Yes! You are smart, for a small one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Loyalty should come from more than strength.", next = "BACK", reply = "Enforcer does not know what that means, but Enforcer will think about it.", fx = { align = { honor = -1 } } },
      },
    },
    xjob = {
      lines = { { id = "xxjob_d", text = "Enforcer stands by the gate and looks scary, and Enforcer is very good at looking scary. When something bad comes from the bog, Enforcer smashes it, and then Enforcer stands by the gate again." } },
      choices = {
        { text = "What comes out of the bog?", next = "xbog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbog = {
      lines = { { id = "xxbog_d", text = "Crocolisks, mostly, and sometimes the mean ogres from the old mound who did not want to be Horde. Once a dragon man came, all scales and wings, and Enforcer hit him so hard his friends carried him home." } },
      choices = {
        { text = "The mean ogres? Who are they?", next = "xmound" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmound = {
      lines = { { id = "xxmound_d", text = "They are Stonemaul too, but they followed the old chief and not Rexxar's friend Rok'tar. Now they hide in the burnt mound and growl at us. Chieftain says they are not Stonemaul any more, and Enforcer agrees, mostly." } },
      choices = {
        { text = "Rok'tar? Who's he?", next = "xroktar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xroktar = {
      lines = { { id = "xxroktar_d", text = "Chief of Brackenwall! He has two heads that agree with each other, which is very rare for ogres. You talk to him by the big fire, but bring him something, because he likes presents." } },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
      },
    },
    xfingers = {
      narr = "He holds up both enormous hands and frowns at them as if they had cheated him.",
      lines = { { id = "xxfingers_d", text = "Enforcer counts the people who go in and the people who go out, so nobody stays who should not stay. Enforcer runs out of fingers at ten, and then Enforcer starts again and hopes it is right." } },
      choices = {
        { text = "That seems like a flawed system.", next = "xcount" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcount = {
      lines = { { id = "xxcount_d", text = "Chieftain says it is good enough, because nobody bad stays very long near Enforcer anyway. You want to count instead? Enforcer will hold your mace." } },
      choices = {
        { text = "Counting is your duty. Do it right, or ask for help.", next = "BACK", reply = "Hmph. You sound like Chieftain's smart head. Enforcer will ask the shaman to count, then.", fx = { align = { order = 1 } } },
        { text = "Forget counting. Just smash whatever looks wrong.", next = "BACK", reply = "Ha! That is what Enforcer does anyway. You are a good small one.", fx = { align = { order = -1 } } },
      },
    },
    xhumans = {
      lines = { { id = "xxhumans_d", text = "Enforcer is told the little lady wizard is friends with Thrall, so Enforcer does not smash humans. But they come with swords and look at Enforcer like Enforcer is a crocolisk, and Enforcer does not like that." } },
      choices = {
        { text = "Would you fight them, if Thrall allowed it?", next = "xfight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfight = {
      lines = { { id = "xxfight_d", text = "Thrall says no, so the answer is no. Enforcer does not think hard about things the Warchief already thought about, because his head is better at it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = { { id = "xxorc_d", text = "Throm-ka, little orc! Rexxar was half orc and Enforcer likes orcs very much, because orcs hit hard and do not talk too long. You stay in Brackenwall as long as you like." } },
      choices = {
        { text = "Something else, big one.", next = "BACK" },
      },
    },
  },
  topics = {
    stonemaul = { { id = "tp_xstonemaul", text = "Stonemaul is the best clan of ogres. The others are angry because they know it." } },
    rexxar = { { id = "tp_xrexxar", text = "Rexxar walks with a bear and has very big axes. Enforcer wants to be Rexxar one day." } },
    _none = { { id = "tp_none", text = "Enforcer does not know. Ask somebody with smaller head." } } },
}

-- Emberstrife: black drake of the Wyrmbog, who tests dragonspawn for Onyxia's guard.
P:NPC {
  key = "dw_emberstrife", id = TODO_NPC("Emberstrife"), name = "Emberstrife", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "proud", "cruel" }, values = { "power" },
  notices = { "race" },
  impression = {
    first = "Emberstrife is an ancient black drake who lairs in the Wyrmbog, and his den reeks of ash and old bones. He spoke to me the way a cat speaks to a mouse it has not decided to eat.",
    third = "{name} faced Emberstrife, the black drake of the Wyrmbog.",
  },
  greetings = {
    { id = "g_default", text = "Another small thing walks into my den on two legs. Speak quickly, mortal, while I am still curious." },
    { id = "g_disguise", when = { questActive = TODO_QUEST("Emberstrife") }, text = "You smell of dragonspawn, and badly. Do you think you are the first to wear a borrowed shape before me?" },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people once held my kin in chains at Grim Batol, and my flight has a very long memory." },
  },
  start = "hello",
  nodes = {
    hello = {
      big = true,
      lines = { { id = "h_default", text = "I am Emberstrife, and I serve Onyxia, daughter of Deathwing. Dragonspawn who would join her guard come to me, and I test them, and most of them do not come back out." } },
      again = { { id = "h_again", text = "You are still here, and still talking. How brave, or how foolish." } },
      choices = {
        { text = "What is the test?", next = "test" },
        { text = "Why does Onyxia need guards?", next = "onyxia" },
        { text = "Deathwing's brood will fall in time.", next = "defy" },
        { text = "I'll leave you to your den.", next = "END" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "Strength, cunning and obedience, mortal, and the skulls of my enemies as proof. Those who return to me with the right skulls may ascend, and the rest feed the bog." } },
      choices = {
        { text = "Whose skulls?", next = "skulls" },
        { text = "I wear the amulet. Test me.", next = "skulls", when = { questActive = TODO_QUEST("Emberstrife") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skulls = {
      lines = { { id = "sk_default", text = "Dragons of the other flights, the blue and the green and the bronze and the red, who think themselves Azeroth's guardians. Let them guard their own heads, if they can." } },
      choices = {
        { text = "That's no test. It's murder.", next = "BACK", reply = "Murder is a word for cattle. Dragons call it rank.", fx = { align = { light = 1 } } },
        { text = "Only the strong deserve to rise.", next = "BACK", reply = "Ah, you understand. How very unusual in a mortal.", fx = { align = { light = -1 } } },
      },
    },
    onyxia = {
      lines = { { id = "o_default", text = "She keeps a lair in the south of this marsh and a mask in your human kingdom, and she needs loyal claws in both. I would say more, but you would only understand half of it." } },
      choices = {
        { text = "A mask in Stormwind?", next = "mask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mask = {
      lines = { { id = "m_default", text = "Did I say Stormwind? You mortals hear what you fear to hear. Go home and look closely at your nobles, and see how long you keep your head after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defy = {
      lines = { { id = "df_default", text = "Bold words in a black dragon's den. Your kind built your little kingdoms in the ashes we left, and you will build them again when we have burned them a second time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    black_dragonflight = { { id = "tp_black", text = "We are the eldest flight and the greatest, and the world will remember it." } },
    _none = { { id = "tp_none", text = "I do not answer the questions of insects. Ask something worth my breath." } },
  },
}

-- Falgran Hastil: a Theramore tracker sent to follow the hoofprints after "Suspicious Hoofprints".
P:NPC {
  key = "dw_falgran_hastil", id = 5088, name = "Falgran Hastil", gender = "male",
  role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "dutiful", "terse" }, values = { "duty", "order" },
  notices = { "class", "travel" },
  impression = {
    first = "A lean tracker with mud to his knees and a map he keeps folding.",
    third = "{name} met Falgran Hastil, a tracker of the Theramore Guard.",
  },
  greetings = {
    { id = "g_default", text = "Falgran Hastil, Theramore Guard. If you've come about the hoofprints, I'm the one they're sending after them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've not found where those tracks end yet, but I will." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "A hunter, good. You'll know a fresh print from an old one, which is more than half the Guard can say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Somebody left hoofprints by the burnt-out inn on the Barrens road, and the Lady Jaina wants to know whose they were. I'm to follow them wherever they go and report back to the citadel." } },
      again = { { id = "h_again", text = "Make it quick, friend. Tracks don't wait for anyone, least of all in a swamp." } },
      choices = {
        { text = "Whose hoofprints do you think they are?", next = "whose" },
        { text = "How do you track anything in this mud?", next = "mud" },
        { text = "How long have you tracked for the Guard?", next = "xpast" },
        { text = "What does a tracker carry into the marsh?", next = "xkit" },
        { text = "You seem uneasy about where those tracks lead.", next = "xuneasy" },
        { text = "Tauren tracks, maybe? I'm tauren myself.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Good hunting, Falgran.", next = "END" },
      },
    },
    whose = {
      lines = { { id = "w_default", text = "Tauren, by the size of them, which is what has the Guard worried. Some say it's the Horde stirring up trouble, and others say someone wants it to look that way, so we can't afford to guess wrong." } },
      choices = {
        { text = "It's the Horde. Treat it as an attack.", next = "BACK", reply = "Plenty in the barracks would agree, but Lady Proudmoore wants proof before she wants war. I'll bring her proof.", fx = { align = { order = -1 } } },
        { text = "Find the truth before anyone draws a sword.", next = "BACK", reply = "That's exactly my orders, and I mean to keep them. A wrong guess here costs lives on both sides.", fx = { align = { order = 1 } } },
      },
    },
    mud = {
      lines = { { id = "m_default", text = "Patience, mostly, and a good eye for broken reeds. The marsh swallows a print within a day, so you follow what the creature brushed past rather than what it stepped on." } },
      choices = {
        { text = "Have you seen anything strange out there?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "Plenty, and none of it friendly. Black dragonspawn in the Wyrmbog, the Grimtotem moving through the reeds, and things in the water I'd rather not describe before supper." } },
      choices = { { text = "Then watch your back. Something else.", next = "BACK" } },
    },
    xpast = {
      lines = { { id = "xxpast_d", text = "Since Lordaeron, when I tracked deserters and orcs both for the old army. I came over with the Lady's fleet because I'd nobody left at home, and a man who can read mud is useful in a place made of it." } },
      choices = {
        { text = "Do you miss Lordaeron?", next = "xmiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = { { id = "xxmiss_d", text = "I miss the hills and the dry roads, but not what came after. There's nothing back there now but ghouls, and I'd rather follow hoofprints in a swamp than footprints that don't belong to the living." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xkit = {
      lines = { { id = "xxkit_d", text = "A good knife, a waterskin, oil for the boots and a length of cord to measure stride. The cord tells me how tall the walker was and how fast it was going, and the mud tells me the rest." } },
      choices = {
        { text = "What did the cord tell you here?", next = "xstride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstride = {
      lines = { { id = "xxstride_d", text = "Long stride, heavy body, cloven hoof, and walking calm, not running. Whoever left them wasn't afraid of anyone finding them, and that's what bothers me most about it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xuneasy = {
      narr = "He rubs a thumb along the edge of his knife and doesn't look up.",
      lines = { { id = "xxuneasy_d", text = "Uneasy's a fair word. If those tracks lead to the Horde, the peace with Thrall gets tested, and if they lead somewhere else, someone wants us to think they lead to the Horde. Either way, I'm the one who has to report it." } },
      choices = {
        { text = "What would you tell the Lady if it's the Horde?", next = "xtell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtell = {
      lines = { { id = "xxtell_d", text = "The truth, plain, and let her decide what to do with it. Some in the garrison would rather I bent a report toward war, and some toward peace." } },
      choices = {
        { text = "Report it plain. The Lady can only judge what she's told.", next = "BACK", reply = "Aye. That's the job, and I'll not dress it up for anyone.", fx = { align = { order = 1 } } },
        { text = "If it keeps the peace, soften it a little.", next = "BACK", reply = "I hear you, and I won't pretend I've not thought it. But a soft report gets soldiers killed later.", fx = { align = { order = -1 } } },
      },
    },
    xtauren = {
      lines = { { id = "xxtauren_d", text = "Maybe, and you'd know a tauren hoof better than I would. Look at these prints sometime and tell me if they're a tauren walking honest, or one walking to be seen, because I've a feeling it's the second." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hoofprints = { { id = "tp_xhoofprints", text = "Cloven, heavy, walking calm. Whoever left them wanted them found, or didn't care." } },
    lordaeron = { { id = "tp_xlordaeron", text = "I tracked for the old army. Lordaeron's gone, and I don't track there any more." } },
   
    _none = { { id = "tp_none", text = "Not my concern, friend. Ask someone at the citadel who sits behind a desk." } },
  },
}

-- Medic Tamberlyn: a neophyte First Aid medic on Theramore Isle, still learning the trade.
P:NPC {
  key = "dw_medic_tamberlyn", id = 5199, name = "Medic Tamberlyn", gender = "female",
  role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "earnest", "nervous" }, values = { "compassion", "duty" },
  notices = { "kit" },
  impression = {
    first = "A young medic with bandage rolls tucked into every pocket.",
    third = "{name} met Medic Tamberlyn, a young First Aid medic on Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! You're not bleeding, are you? I mean, I could help if you were, I've been practising all week." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still in one piece, which is the best kind of patient there is." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.5 } }, text = "Light above, you're hurt! Sit down, keep the pressure on it, and please don't faint until I've found my scissors." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Tamberlyn, and I'm learning field medicine here at Theramore, though I'm still a neophyte, so mostly I roll bandages and fetch water. My teacher says every medic starts that way, and I hope he's right." } },
      again = { { id = "h_again", text = "Anything else? I've a basket of linen to cut, but I can talk while I do it." } },
      choices = {
        { text = "Why become a medic?", next = "why" },
        { text = "What's the hardest part of the work?", next = "hard" },
        { text = "Who's your teacher?", next = "xteacher" },
        { text = "Have you ever treated a real wound?", next = "xreal" },
        { text = "Your bandages look very neat.", next = "xneat" },
        { text = "I'm a paladin. May the Light guide your hands.", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "Keep up the good work.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "My brother came home from the Barrens road with a wound nobody knew how to dress, and he very nearly didn't recover. I decided then that I'd never stand by and watch somebody bleed again because I didn't know what to do." } },
      choices = {
        { text = "Do you tend Horde wounded too?", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Lady Jaina wants peace with Thrall's people, and I think a medic ought to treat whoever's in front of her. Some of the soldiers say I'm soft for thinking it, but blood looks the same on everyone." } },
      choices = {
        { text = "A wound is a wound. You're right.", next = "BACK", reply = "Thank you! I'll tell the sergeant someone agreed with me, though he won't care.", fx = { align = { light = 1 } } },
        { text = "Our own soldiers come first, always.", next = "BACK", reply = "Well, yes, of course they would, if it came to choosing. I just hope it never does.", fx = { align = { light = -1 } } },
      },
    },
    hard = {
      lines = { { id = "h2_default", text = "Keeping my hands steady when someone is screaming, honestly. The bandaging I can do in my sleep now, but the noise and the blood still make my stomach turn over." } },
      choices = { { text = "That gets easier with time. Something else.", next = "BACK" } },
    },
    xteacher = {
      lines = { { id = "xxteacher_d", text = "Doctor VanHowzen, and he's very strict, but he knows everything. He says I hold a bandage like it might bite me, and he's not wrong, because the first one I tied came undone on the soldier's arm." } },
      choices = {
        { text = "What happened to the soldier?", next = "xsoldier" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsoldier = {
      lines = { { id = "xxsoldier_d", text = "He was fine, thank the Light, it was only a scratch from a crocolisk. But he told the whole barracks, and now they all ask for 'the neophyte' when they want a laugh." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xreal = {
      narr = "She looks down at her own hands as though checking they're still steady.",
      lines = { { id = "xxreal_d", text = "Once, when a sentry came in from the marsh with a raptor bite, and the doctor was busy with a fever case. My hands were shaking the whole time, but I stopped the bleeding, and he walked out on his own legs." } },
      choices = {
        { text = "That's a real start.", next = "xstart" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstart = {
      lines = { { id = "xxstart_d", text = "That's what the doctor said, more or less, though he also said I used twice the linen I needed. Do you think a healer should be brave, or careful?" } },
      choices = {
        { text = "Careful. A steady hand saves more lives than courage.", next = "BACK", reply = "That's very sensible, and I'll try to remember it when my hands are shaking.", fx = { align = { order = 1 } } },
        { text = "Brave. Sometimes you must act before you're sure.", next = "BACK", reply = "Oh, I like that. I'll tell the doctor you said so, and he'll frown at me.", fx = { align = { order = -1 } } },
      },
    },
    xneat = {
      lines = { { id = "xxneat_d", text = "Thank you! I practise on a rolled-up blanket every night, and I've named it Sergeant Linen. He's very patient and never complains." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaladin = {
      lines = { { id = "xxpaladin_d", text = "Oh, thank you, that's kind. I've seen a paladin close a wound with a touch, and I wish I could, but I'll have to make do with linen and practice." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    vanhowzen = { { id = "tp_xvanhowzen", text = "My teacher. He's stern, but every soldier in Theramore owes her a scar that healed clean." } },
    first_aid = { { id = "tp_xfirst_aid", text = "Pressure, clean water, tight wraps. I'm learning, slowly." } },
   
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask my teacher at the infirmary; he knows everything, or at least he sounds like he does." } },
  },
}

-- Theramore Guard: Lady Jaina Proudmoore's soldiers who keep the walls and docks of Theramore Isle.
P:NPC {
  key = "dw_theramore_guard", id = 4979, name = "Theramore Guard", gender = "male",
  role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "steady", "polite" }, values = { "duty", "peace" },
  notices = { "race" },
  impression = {
    first = "A guard in Theramore's blue and white stands at his post, damp from the marsh air.",
    third = "{name} spoke with one of the Theramore Guard.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Theramore, traveller. Lady Proudmoore keeps the peace here, and we keep it for her, so please do the same." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "One of Thrall's people, and walking openly in Theramore. Lady Jaina says we're at peace, so keep your weapon sheathed and we'll stay that way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm with the Theramore Guard, and I'll point you to the inn, the docks or the citadel, wherever you need. Is there something I can help with?" } },
      again = { { id = "h_again", text = "Anything else? The marsh breeds trouble faster than flies." } },
      choices = {
        { text = "I need directions.", next = "BUSINESS" },
        { text = "What's the trouble in the marsh?", next = "marsh" },
        { text = "How do you feel about peace with the Horde?", next = "peace" },
        { text = "How long have you served the Lady?", next = "xserve" },
        { text = "What's the worst post on the isle?", next = "xpost" },
        { text = "Theramore feels quieter than Stormwind.", next = "xquiet" },
        { text = "I'm human too. Where did you come from?", next = "xhuman", when = { race = "Human" } },
        { text = "Thank you.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "m_default", text = "Black dragons in the Wyrmbog, murlocs and crocolisks along the shore, and the Grimtotem and the Defias hiding out in the swamp. And now some of our own deserters are talking treason in the old shacks to the north." } },
      choices = { { text = "I'll keep my eyes open. Something else.", next = "BACK" } },
    },
    peace = {
      lines = { { id = "p_default", text = "Lady Jaina fought beside Thrall against the Burning Legion at Mount Hyjal, and she says the orcs have changed, and I believe her. Not everyone who came with her from Lordaeron does, though, and some of them would sooner see the Horde burn." } },
      choices = {
        { text = "Then who's against it?", next = "against" },
        { text = "Something else.", next = "BACK" },
      },
    },
    against = {
      lines = { { id = "a_default", text = "Men who lost families in the Second War, mostly, and some who served under the Lady's father, Admiral Proudmoore, before the orcs killed him. I understand the anger, but I swore to serve her, and I'll keep her peace." } },
      choices = {
        { text = "Jaina is right. The peace is worth keeping.", next = "BACK", reply = "Glad to hear it from a traveller. Not everyone says so.", fx = { align = { order = 1 } } },
        { text = "The orcs haven't earned forgiveness yet.", next = "BACK", reply = "Plenty here would agree, but keep it quiet near the citadel.", fx = { align = { order = -1 } } },
      },
    },
    xserve = {
      lines = { { id = "xxserve_d", text = "Since the fleet sailed from Lordaeron, when she gathered everyone who'd listen and led us west across the sea. I was a farm boy from Hillsbrad with a borrowed spear, and now I've a proper sword and a city to guard." } },
      choices = {
        { text = "What was the crossing like?", next = "xcross" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcross = {
      lines = { { id = "xxcross_d", text = "Long, wet and frightening, with half the fleet seasick and the other half praying. Then we landed and fought demons beside orcs, which nobody would have believed back home." } },
      choices = {
        { text = "You fought beside orcs?", next = "xbeside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbeside = {
      lines = { { id = "xxbeside_d", text = "At Mount Hyjal, against the Legion. I'll not say I like them, but I watched an orc grunt pull one of ours out from under a demon, and I've not forgotten it. Should we trust them now?" } },
      choices = {
        { text = "They earned some trust at Hyjal. Keep the peace.", next = "BACK", reply = "Aye, that's what I tell the new lads, though not all of them want to hear it.", fx = { align = { light = 1 } } },
        { text = "One good deed doesn't wipe out the old wars.", next = "BACK", reply = "Plenty of the old soldiers feel that way. I just do as the Lady says.", fx = { align = { light = -1 } } },
      },
    },
    xpost = {
      narr = "He shifts his grip on his halberd and looks toward the gate without meaning to.",
      lines = { { id = "xxpost_d", text = "The north gate at night, facing the marsh road. You hear things moving out there all night, and in the morning there's always a new set of tracks in the mud, and nobody ever saw who made them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xquiet = {
      lines = { { id = "xxquiet_d", text = "Quieter, aye, but don't let it fool you. Between the Grimtotem, the black dragons and the deserters in the marsh, the quiet's just the marsh holding its breath." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = { { id = "xxhuman_d", text = "Hillsbrad, near Southshore, before the plague. Most of us here are Lordaeron folk, and we look at Stormwind people a bit like rich cousins, so don't mind if the lads tease you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hyjal = { { id = "tp_xhyjal", text = "We fought the Legion beside orcs and night elves at Hyjal. Strange days." } },
    jaina = { { id = "tp_xjaina", text = "The Lady Jaina built this city. Every man on these walls would die for her, and some have." } },
    _none = { { id = "tp_none", text = "Couldn't say, traveller. Ask at the inn by the docks, someone there will know." } } },
}
