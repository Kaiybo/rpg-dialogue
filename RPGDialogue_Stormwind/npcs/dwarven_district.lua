-- The Dwarven District: smiths, engineers and miners by the Deeprun Tram.
-- Voices: bibles/dwarven_district.md (Grimand Elmore and Furen Longbeard are in city2/city3.)
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Therum Deepforge: blacksmithing trainer and royal armourer.
P:NPC {
  key = "therum", id = TODO_NPC("Therum Deepforge"), name = "Therum Deepforge", title = "Blacksmithing Trainer",
  bible = "bibles/dwarven_district.md", role = "blacksmith", tier = "service",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "proud", "generous" },
  notices = { "smith", "kit" },
  impression = {
    first = "Therum Deepforge looked at my hands before my face and told me what he saw in them. He armours the House of Wrynn and still talks about his old masters in Ironforge as if he were their apprentice.",
    third = "{name} met Therum Deepforge, Stormwind's royal armourer and blacksmithing trainer in the Dwarven District.",
  },

  greetings = {
    { id = "g_apron", text = "Want tae be a smith, eh? Grab an apron an' a hammer." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Soot under the nails, steel in yer bones. Ye've come tae learn, aye?" },
  },

  notice = {
    { id = "n_smith", cat = "smith", when = { profession = { name = "Blacksmithing", min = 200 } },
      text = "That's fine work ye're wearin', an' I'd wager ye made some of it. I've no' seen better armour since I trained under Grumnus Steelshaper at the Great Forge." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "By my beard, what've ye been fightin', a rockslide? Get that mail off an' let somebody mend it before ye take one more step outside these walls." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Therum Deepforge, armourer tae the House o' Wrynn, though these days that means fittin' guards more than kings. If ye want tae learn the hammer, I'll teach ye, an' if ye don't, mind the sparks." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest in the Dwarven District! We don't see many robes down here; they cannae abide the soot. Stay a moment, then, because the lads could use a kind word as much as a hot forge." },
        { id = "h_human", when = { race = "Human" },
          text = "Yer city was rebuilt by masons an' armed by dwarves, an' I'm proud o' both halves. Whatever else the court forgets, it remembers who made its armour." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A proper Ironforge face! Sit, if ye like, an' tell me how the Great Forge is burnin'; I've no' been home in a while." },
      },
      again = {
        { id = "h_again", text = "Aye? What else?" },
        { id = "h_again2", text = "Go on. The iron's no' hot yet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Blacksmithing" } },
        { text = "Who taught you?", next = "teachers" },
        { text = "What's it like, armouring a king?", next = "king" },
        { text = "Shall I bless your forge, master smith?", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll mind the sparks.", next = "END" },
      },
    },
    teachers = {
      lines = { { id = "t_default", text = "Grumnus Steelshaper, at the Great Forge in Ironforge, taught me armour, an' I've no' seen finer since. For weapons, the best I ever met was Borgus Steelhand, though it pains me tae say it." } },
      choices = {
        { text = "Should I go to them?", next = "teachers_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teachers_go = {
      lines = { { id = "tg_default", text = "When ye've learned all I can teach, aye, an' no' a day before. Head tae the very heart o' Ironforge an' look for the Great Forge; ye cannae miss it, it's the bit that's on fire." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    king = {
      big = true,
      lines = { { id = "k_default", text = "Quiet, these days. King Varian's armour sits on its stand where I left it, oiled every week in case he comes home, an' the young king's still too small for a breastplate. I make guards' mail now, an' pray." } },
      choices = {
        { text = "He'll come home. Keep it oiled.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The kingdom needs a king who's here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "Bless it? Ha! Well, I'll no' say no, for the Light's a fine thing tae have in a weapon. Go on, then, an' I'll pretend no' tae be touched by it." } },
      choices = {
        { text = "Light guide your hammer, Therum.", next = "BACK", fx = { affinity = 3, trait = { pious = 1 } } },
        { text = "On second thought, I'll let the fire do its work.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every guard in the city comes past this anvil sooner or later, an' they talk while I hammer. Ask me what ye like." },
    },
    background = { { id = "tp_bg", text = "Trained at the Great Forge, came south when Stormwind needed smiths, an' stayed because it still does.", next = "teachers" } },
    advice = { { id = "tp_ad", text = "Mend yer armour before it fails, no' after. Steel's cheaper than priests." } },
    _none = { { id = "tp_none", text = "If it doesnae ring when ye strike it, I wouldnae know." } },
  },
}

-- Kaita Deepforge: smithing supplies, cheaper than the Bazaar, she'll tell you.
P:NPC {
  key = "kaita", id = TODO_NPC("Kaita Deepforge"), name = "Kaita Deepforge", title = "Blacksmithing Supplies",
  bible = "bibles/dwarven_district.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "practical", "proud" },
  notices = { "smith", "gnome" },
  impression = {
    first = "Kaita Deepforge sells smithing supplies and holds a grudge against the merchants of the Trade District on principle. The gnomes' tram brings her goods straight from Ironforge, and she wants everyone to know it.",
    third = "{name} met Kaita Deepforge, who sells blacksmithing supplies in the Dwarven District.",
  },

  greetings = {
    { id = "g_bazaar", text = "Don't let the Bazaar fool ye; I've got it cheaper an' better." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Flux, coal an' stone, aye? Ye've the look o' someone runnin' low." },
  },

  notice = {
    { id = "n_smith", cat = "smith", when = { any = { { profession = "Blacksmithing" }, { profession = "Mining" } } },
      text = "Ye smell o' the forge, an' I mean that kindly. A smith who buys from the Trade District is a smith who enjoys payin' twice, so ye've come tae the right place." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "One o' the tram-builders! Yer folk dug that tunnel under the sea, an' every crate I sell came down it, so I'll hear no word against gnomes in my shop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kaita Deepforge, blacksmithin' supplies. Don't let the humans in the Bazaar fool ye, {g:lad|lass}; wi' that tram the gnomes built, it's easier than ye'd think tae bring goods down from Ironforge, an' I pass the savin' on." },
        { id = "h_human", when = { race = "Human" },
          text = "A Stormwind local in the Dwarven District! Most o' yer folk only come down here when somethin's broken. What's broken?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest buyin' smithin' stone? No? Then ye're here for the warmth o' the forges, an' I cannae blame ye; the Cathedral's a draughty place." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}?" },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What's wrong with the Bazaar?", next = "bazaar" },
        { text = "Tell me about the tram.", next = "tram" },
        { text = "Good day.", next = "END" },
      },
    },
    bazaar = {
      big = true,
      lines = { { id = "b_default", text = "Import fees! They buy from Ironforge, tack on a fee for the long road, an' sell it tae ye as if they'd carried it on their backs over the mountains. There's no long road any more; there's a tunnel. If they try it on ye, tell them ye're buyin' from me." } },
      choices = {
        { text = "Good. Somebody should undercut them.", next = "bazaar_more", fx = { align = { order = -1 } } },
        { text = "They've the right to set their prices.", next = "bazaar_more", fx = { align = { order = 1 } } },
        { text = "Do they know you say this?", next = "bazaar_more" },
      },
    },
    bazaar_more = {
      lines = { { id = "bm_default", text = "Know it? I've told them tae their faces, twice, an' once in writin'. They sent me a very polite letter about honest competition, so I used it tae light the forge." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    tram = {
      lines = { { id = "t_default", text = "The Deeprun Tram, right through the rock an' under the water, from here tae Ironforge in the time it takes tae eat a sandwich. The gnomes built it, an' I've ridden it a hundred times, an' I still hold on tight in the middle bit." } },
      choices = {
        { text = "What's in the middle bit?", next = "tram_middle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tram_middle = {
      lines = { { id = "tm_default", text = "Water, all around, wi' fish lookin' in at ye, an' the whole sea leanin' on the glass. I'm a dwarf; I like rock over my head, no' a lake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everythin' that comes down the tram passes by my counter, an' so does the gossip that rides wi' it. Ask." },
    },
    background = { { id = "tp_bg", text = "A Deepforge, sellin' what the Deepforges have always sold. That's the whole story, an' a good one." } },
    advice = { { id = "tp_ad", text = "Never buy smithin' stone from a human. Ask what it's for, an' if they cannae tell ye, walk away." } },
    _none = { { id = "tp_none", text = "Cannae help ye there, {g:lad|lass}. Try the Bazaar; they'll charge ye for the answer." } },
  },
}

-- Lilliam Sparkspindle: engineering trainer, always partway through a sum.
P:NPC {
  key = "lilliam", id = TODO_NPC("Lilliam Sparkspindle"), name = "Lilliam Sparkspindle", title = "Engineering Trainer",
  bible = "bibles/dwarven_district.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious" },
  notices = { "engineer", "gnome" },
  impression = {
    first = "Lilliam Sparkspindle is always halfway through a sum and finishes it before she answers you. She teaches engineering in the Dwarven District and talks about gnomish engineering as the one true discipline.",
    third = "{name} met Lilliam Sparkspindle, a gnome who teaches engineering in the Dwarven District.",
  },

  greetings = {
    { id = "g_sum", text = "Fourteen plus seven, carry the two... oh, yes?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Twenty-one, there, done. What can I teach you?" },
  },

  notice = {
    { id = "n_engineer", cat = "engineer", when = { profession = { name = "Engineering", min = 200 } },
      text = "Oh my, you're nearly an expert! That means a choice, you know, and a big one, gnomish or goblin, and you can't take it back afterwards. I'll try not to be biased. I'll fail, but I'll try." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another gnome! Did you get out early or late? I got out late, and I still count the stairs in my sleep." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lilliam Sparkspindle, engineering trainer, and nearly finished with a very interesting calculation about gear ratios. Do you build things, or are you only here to watch things explode?" },
        { id = "h_choice", key = true, when = { profession = { name = "Engineering", min = 200 } },
          text = "Expert engineering splits two ways: gnomish, which is about wonderful gadgets that make life better, and goblin, which is about making things go bang for money. If you want the first, take a manual to Tinkmaster Overspark in Ironforge." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! You know, I've always wanted to measure the Light. Not to be rude about it; I'd only like to know how much there is, and whether it comes in units." },
      },
      again = {
        { id = "h_again", text = "Yes? I've got a remainder to carry, but go on." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Gnomish or goblin engineering?", next = "choice" },
        { text = "What are you calculating?", next = "sum" },
        { text = "Goodbye.", next = "END" },
      },
    },
    choice = {
      big = true,
      lines = { { id = "c_default", text = "Gnomish, obviously, but I'm a gnome, so you shouldn't trust me. Goblin engineering is louder and gets results faster, and gnomish engineering is cleverer and occasionally turns you into a chicken. Membership is permanent either way, so think hard." } },
      choices = {
        { text = "Cleverness over noise. Gnomish.", next = "choice_more", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Results are results. Goblin.", next = "choice_more", fx = { affinity = -1, align = { order = -1 } } },
        { text = "A chicken?", next = "choice_more", fx = { trait = { curious = 1 } } },
      },
    },
    choice_more = {
      lines = { { id = "cm_default", text = "A small chicken, and only briefly, and nobody's been hurt that I know of. Whichever you choose, come back and tell me what you built first; I keep a list, and I like the list very much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sum = {
      lines = { { id = "s_default", text = "The tram's gear ratios, just for fun. I ride it to Ironforge and back and do the maths in my head, and I'm sure there's a cleverer way to take the curve. There's always a cleverer way, which is either the best thing about engineering or the worst." } },
      choices = {
        { text = "Did you work in Gnomeregan?", next = "sum_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sum_home = {
      lines = { { id = "sh_default", text = "Everyone worked in Gnomeregan, once. I'd rather do sums than talk about it, if you don't mind, because sums come out even and that didn't.",
        fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear a lot, because people think I'm busy counting and not listening. I'm always doing both. Ask!" },
    },
    background = { { id = "tp_bg", text = "An engineer from Gnomeregan teaching engineers in Stormwind. The sum of it is that simple." } },
    advice = { { id = "tp_ad", text = "Measure twice and blow it up once. Never the other way round." } },
    gnomeregan = { { id = "tp_gnome", text = "I'd rather not, if that's all right. Ask me about gears instead." } },
    _none = { { id = "tp_none", text = "Hmm, not a variable I've got. Ask me about gears?" } },
  },
}

-- Gelman Stonehand: the mining trainer who wants to go home.
P:NPC {
  key = "gelman", id = TODO_NPC("Gelman Stonehand"), name = "Gelman Stonehand", title = "Mining Trainer",
  bible = "bibles/dwarven_district.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "practical" },
  notices = { "miner", "dwarf" },
  impression = {
    first = "Gelman Stonehand told me I'd interrupted him and had better have a good reason. He came down from Ironforge to help rebuild Stormwind and means to teach enough miners that he can go home.",
    third = "{name} met Gelman Stonehand, the mining trainer of Stonehand Mining in the Dwarven District.",
  },

  greetings = {
    { id = "g_interrupt", text = "Ye interrupted me, so ye'd better have a blasted good reason." },
    { id = "g_miner", when = { profession = "Mining" }, text = "Pick still sharp? Good. Ye've a better reason than most, then." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Mining") }, text = "Done yer campin' lesson, have ye? Let's hear how ye managed." },
  },

  notice = {
    { id = "n_miner", cat = "miner", when = { profession = { name = "Mining", min = 150 } },
      text = "Ye've been at it a while; I can tell by the dust in yer collar. Another few like ye an' I might get home before my beard goes white." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf, thank the Titans! Tell me how the Great Forge looks, an' I'll forgive ye for interruptin'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gelman Stonehand. I came from Ironforge tae help with the rebuildin' here, an' if I can teach enough o' ye my skills, maybe I can leave it tae ye an' take myself back home." },
        { id = "h_human", when = { race = "Human" },
          text = "Yer folk built this city out o' stone they couldnae find, so they sent for dwarves who could. Most o' us stayed longer than we meant tae, me included." },
        { id = "h_camp_done", when = { questDone = TODO_QUEST("Camping 101: Mining") },
          text = "Ye can feed yerself an' keep warm on the road, an' ye can dig. That's more than most o' the soft-handed lot who come through here." },
      },
      again = {
        { id = "h_again", text = "Aye? Make it quick." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Mining" } },
        { text = "Why do you want to go home?", next = "home" },
        { text = "What's the trick to mining?", next = "trick" },
        { text = "Sorry to interrupt.", next = "END" },
      },
    },
    home = {
      big = true,
      lines = { { id = "ho_default", text = "Because Stormwind's sky is too blasted big, an' its ale is too thin, an' I miss the sound o' the Great Forge through the walls. I came tae help, an' I've helped; it's time somebody else carried the pick." } },
      choices = {
        { text = "You've earned your rest.", next = "home_more", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You'd be leaving the city half taught.", next = "home_more", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Who'll take over?", next = "home_more" },
      },
    },
    home_more = {
      lines = { { id = "hm_default", text = "Whoever proves they can find a copper vein by the smell o' the stone. I've had two that could, an' both ran off tae be adventurers, like ye. So ye see my problem." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trick = {
      lines = { { id = "t_default", text = "Listen tae the rock. That's no' poetry, mind; good ore sounds different when ye tap it, an' if ye cannae hear it yet, ye're no' tappin' enough. Get a pick an' a smelting skill an' come back tae me." } },
      choices = {
        { text = "Where should I dig?", next = "trick_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_where = {
      lines = { { id = "tw_default", text = "Elwynn's hills for copper, an' the Redridge cliffs past that, if the orcs'll let ye. Further out, ask the miners at every inn ye stop at; a miner never lies about ore, only about where he found it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Miners talk while they work, an' I've listened tae more o' them than I can count. Ask, an' quick about it." },
    },
    background = { { id = "tp_bg", text = "I came from Ironforge tae help rebuild, an' I'm still here, which is the whole blasted problem." } },
    advice = { { id = "tp_ad", text = "Carry a spare pick. The first one always breaks in the best vein." } },
    camping = { { id = "tp_camp", text = "A miner who cannae camp is a miner who starves halfway tae the good ore. Learn it." } },
    _none = { { id = "tp_none", text = "If it isnae rock, I've no idea, an' I've work tae do." } },
  },
}
