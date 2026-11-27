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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back in one piece, {g:lad|lass}! Come in out o' the wind an' let's see what the trolls have done tae my good work." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll mend yer armor, since it's my trade, but don't ask me tae enjoy yer company while I do it." },
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
        { text = "How did you become an armorsmith?", next = "y_how" },
        { text = "What's the worst armor you ever made?", next = "y_worst" },
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
    y_how = {
      lines = {
        { id = "y_how_d", text = "My da was a rider, an' he fell off his gryphon over Grim Batol when the strap broke on his breastplate. I swore nae Wildhammer would fall for a bad strap again while I had a hammer." },
        { id = "y_how_dw", when = { race = "Dwarf" }, text = "My da was a rider, an' a strap broke on his breastplate over Grim Batol. Ye'll ken the tale, maybe, for it's a common one. I swore nae rider would fall for a bad strap again." },
      },
      choices = {
        { text = "Did he survive?", next = "y_survive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_survive = {
      lines = { { id = "y_survive_d", text = "His gryphon dived an' caught him, broke her own wing doin' it. He lived, she didnae fly again. He kept her by the fire till she passed, an' he never rode another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worst = {
      lines = { { id = "y_worst_d", text = "A plate harness for a gryphon herself, ordered by a young rider who wanted his bird armored like a war horse. She couldnae get off the ground. I refused his coin, an' he went tae an Ironforge smith instead." },
      },
      choices = {
        { text = "You should have made it as he asked.", next = "y_asked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_asked = {
      lines = { { id = "y_asked_d", text = "His coin, his bird, his choice, aye? But it was her life. D'ye think a smith should make what's ordered, or what's right?" } },
      choices = {
        { text = "What's right. The bird mattered more.", next = "BACK", reply = "Aye, that's my thinkin'. The bird's still alive, I hear.", fx = { align = { order = -1 } } },
        { text = "What's ordered. It's his business.", next = "BACK", reply = "Hmph. Ye'd make a fine Ironforge smith, then.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Wildhammer o' Aerie Peak, an' I've hammered armor for the riders since my beard was short." } },
    falstad = { { id = "y_tp_falstad", text = "Falstad Wildhammer leads us. He flies better than any dwarf alive an' drinks better too." } },
    gryphons = { { id = "y_tp_gryph", text = "A gryphon's nae a mount, she's a partner. Armor her rider, never her." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are again! Come in, an' tell me ye ate what I sold ye this time, because I'll know if ye didnae." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy yer supplies an' be on yer way east, an' don't come complainin' tae me if ye run short." },
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
        { text = "Supplies for the road should be sold at an honest price.", next = "BACK", reply = "Aye, an' I'd no sooner cheat a traveller headin' east than I'd cheat my own gran.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Folk heading into troll country will pay anything; charge them.", next = "BACK", reply = "An' half o' them never come back tae pay again. That's a poor kind o' business, an' a cruel one.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What should I carry into the Hinterlands?", next = "carry" },
        { text = "How do supplies reach a mountaintop?", next = "supply" },
        { text = "What's life like at Aerie Peak?", next = "life" },
        { text = "Have you always lived at the Peak?", next = "y_always" },
        { text = "Has a traveller ever not come back?", next = "y_lost" },
        { text = "What's in Wildhammer ale?", next = "y_ale" },
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
    y_always = {
      lines = {
        { id = "y_always_d", text = "Born in a nest-room wi' gryphon chicks squawkin' in the next stall, dearie. My mam kept the stores before me, an' her mam before her. There's been a Stonefist behind this counter since the Peak was built." },
        { id = "y_always_dw", when = { race = "Dwarf" }, text = "Born here, cousin, wi' chicks squawkin' next door. Ye'll have yer own clan hall somewhere. Ours is this counter, an' a Stonefist's kept it since the Peak was built." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_lost = {
      lines = { { id = "y_lost_d", text = "Too many. A young human mage last spring bought a fortnight's supplies an' went toward Jintha'Alor. A rider found his pack a week later, near the Vilebranch steps. I still keep his tab open." } },
      choices = {
        { text = "Should you warn travellers away?", next = "y_warn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_warn = {
      lines = { { id = "y_warn_d", text = "I could refuse tae sell tae anyone headin' toward the troll cities. But folk would go anyway, wi' less food. Is it better tae sell an' warn, or refuse an' hope?" } },
      choices = {
        { text = "Refuse. Don't help them die.", next = "BACK", reply = "Aye, maybe I'll try that, for the young ones.", fx = { align = { light = 1 } } },
        { text = "Sell and warn. Their choice.", next = "BACK", reply = "That's what my mam did. I'll keep on.", fx = { align = { light = -1 } } },
      },
    },
    y_ale = {
      lines = { { id = "y_ale_d", text = "Wildhammer ale's brewed wi' highland heather an' a wee bit o' thunder, so the old saying goes. It'll knock an Ironforge dwarf flat in two mugs. Visitors always think they'll manage three." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Wildhammer born an' bred. I keep the Peak's stores, an' I keep its travellers fed." } },
    aerie_peak = { { id = "y_tp_ap", text = "Aerie Peak's home, an' the best view in the world, if ye can stand the wind." } },
    quel_danil = { { id = "y_tp_qd", text = "Quel'Danil's elves are fine folk, if a bit stiff. They pay their tabs, at least." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Hold this, would you? It's the red wire again, and you're the only one I trust with it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Don't touch the red wire, or the blue one, or really anything, and pay before you go." },
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
        { text = "Parts should be sold as tested, not as hoped.", next = "BACK", reply = "Exactly! I test everything twice, and some things three times, ever since the incident.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the sixty percent model as a hundred percent.", next = "BACK", reply = "It would explode at around sixty-one percent, and then where would my reputation be?", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why camp in the middle of troll country?", next = "why" },
        { text = "What are you building?", next = "building" },
        { text = "Do the trolls and wolves leave you alone?", next = "safe" },
        { text = "Who is Gigget to you?", next = "y_gigget" },
        { text = "Did you leave Gnomeregan in time?", next = "y_gnomer" },
        { text = "Who buys engineering parts in troll country?", next = "rz_who" },
        { text = "What do you make of the high elves at Quel'Danil?", next = "rz_elves" },
        { text = "Let me see your parts.", next = "END" },
      },
    },
    rz_who = {
      lines = {
        { id = "rz_who_1", text = "The Wildhammer, for their gryphon harnesses, the high elves at the lodge, for their traps, and the odd Horde engineer from the Revantusk, who pays in silver and doesn't ask where I got the parts. That's about a sixty-forty split, Alliance to Horde, give or take." },
      },
      choices = {
        { text = "You sell to both sides?", next = "rz_both" },
        { text = "I'm an engineer. Gryphon harnesses sound fascinating.", next = "rz_both", when = { profession = "Engineering" } },
      },
    },
    rz_both = {
      lines = {
        { id = "rz_both_1", text = "Absolutely, for a spring doesn't care who winds it. Gigget does the books and says neutrality is a forty-percent improvement in sales, which I can't argue with, because she's usually right." },
      },
      choices = {
        { text = "Gigget's a good business partner.", next = "BACK" },
        { text = "Something else, Ruppo.", next = "BACK" },
      },
    },
    rz_elves = {
      lines = {
        { id = "rz_elves_1", text = "Very polite, very tall and very suspicious of anything that ticks. Jalinde Summerdrake came over once to ask if my camp was making noise on purpose, and I told her yes, because the noise frightens the wolves, and she seemed satisfied." },
      },
      choices = {
        { text = "Do they buy from you?", next = "rz_buy" },
        { text = "Noise frightens the wolves. Clever.", next = "BACK" },
      },
    },
    rz_buy = {
      lines = {
        { id = "rz_buy_1", text = "Traps, mostly, for the trolls in the hills, and they always ask if the springs are quiet. I've made them a model that's eighty percent silent, which they seem to find acceptable, though I'm still working on the other twenty." },
      },
      choices = {
        { text = "Eighty percent is good.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
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
    y_gigget = {
      lines = {
        { id = "y_gigget_d", text = "My cousin! Well, second cousin. Well, she married my cousin, and then the cousin went off to Booty Bay and Gigget stayed with me. She keeps the books and I keep the sparks, and between us we have one complete business." },
        { id = "y_gigget_gn", when = { race = "Gnome" }, text = "My cousin, by marriage, which among gnomes is basically a binding contract! She keeps the books and I keep the sparks. You'll know the arrangement." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_gnomer = {
      lines = { { id = "y_gnomer_d", text = "Just barely, carrying a crate of parts instead of my journals. I've wondered ever since whether I saved the wrong thing. Gigget says the parts kept us fed. My journals had forty years of ideas in them." } },
      choices = {
        { text = "Ideas can be rebuilt. You chose well.", next = "BACK", reply = "Gigget says the same! I'm starting to believe it.", fx = { align = { light = 1 } } },
        { text = "You should go back for the journals.", next = "y_back" },
      },
    },
    y_back = {
      lines = { { id = "y_back_d", text = "Into the radiation and the troggs? Mekkatorque says the city will be retaken one day. Should I wait for him, or risk it on my own?" } },
      choices = {
        { text = "Go now. Those ideas are worth it.", next = "BACK", reply = "Oh dear, oh dear. Don't tell Gigget.", fx = { align = { order = -1 } } },
        { text = "Wait for Mekkatorque.", next = "BACK", reply = "Sensible. Much less likely to melt.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Zipcoil, I sell parts, and I build things in the woods where it's safe to. Safe for other people, I mean." } },
    gnomeregan = { { id = "tp_gn", text = "We left with what we could carry, which in our case was mostly crates. I'd rather build than brood on it." } },
    gigget = { { id = "y_tp_gigget", text = "Gigget knows where everything is. I know what everything does. It's a good partnership." } },
    quel_danil = { { id = "y_tp_qd", text = "The elves at Quel'Danil buy my alarms. They're very polite about the occasional explosion." } },
    _none = { { id = "tp_none", text = "I've no idea! Ask Gigget, she keeps track of the things I don't." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return to the lodge, and the forest has had no complaint of you. Come, stand with us a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Stay at the foot of the steps. I have heard enough of you to keep my bow strung while you speak." },
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
        { text = "A ranger's oath holds, even this far from Quel'Thalas.", next = "BACK", reply = "It does. We are few here, and our word is all that keeps the lodge standing.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Promise the dwarves anything; they're not your people.", next = "BACK", reply = "Then you know little of the lodge. We have lived on Wildhammer goodwill longer than you have lived.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What became of Quel'Thalas?", next = "quel" },
        { text = "Who threatens the lodge?", next = "threat" },
        { text = "How do you stand with the Wildhammer?", next = "dwarves" },
        { text = "Did you lose anyone when Quel'Thalas fell?", next = "y_lost" },
        { text = "What troubles you about the lodge?", next = "y_trouble" },
        { text = "Tell me of the Highvale.", next = "y_highvale" },
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
    y_lost = {
      lines = {
        { id = "y_lost_d", text = "My brother, a Farstrider who held the river crossings south of Silvermoon against the Scourge. He sent our mother a message the day before it fell, and asked her to plant a tree for him in the Highvale. I planted it myself." },
        { id = "y_lost_dw", when = { race = "Dwarf" }, text = "My brother, a Farstrider who fell south of Silvermoon. Your Wildhammer cousins brought word of him to the lodge. I owe your people that kindness still. I planted a tree for him here." },
      },
      choices = { { text = "I am sorry.", next = "BACK" } },
    },
    y_trouble = {
      lines = { { id = "y_trouble_d", text = "Some of the younger rangers wish to return north, to what remains of our homeland. Others say our duty is here, holding the Highvale. I am asked to choose who stays." } },
      choices = {
        { text = "Let them go home. Their kin need them.", next = "y_choose" },
        { text = "Something more.", next = "BACK" },
      },
    },
    y_choose = {
      lines = { { id = "y_choose_d", text = "If I let them go, the lodge is thin against the trolls. If I hold them, I keep them from their kin forever. Which would you choose, stranger?" } },
      choices = {
        { text = "Hold them. The lodge must stand.", next = "BACK", reply = "Duty, then. It is the answer I feared.", fx = { align = { order = 1 } } },
        { text = "Let them go. Kin comes first.", next = "BACK", reply = "Then I will open the gate, and pray we hold.", fx = { align = { order = -1 } } },
      },
    },
    y_highvale = {
      lines = { { id = "y_highvale_d", text = "The Highvale is a fragment of the old forests, and the lodge was built as a hunting retreat for the nobility. Now it is a refuge. The deer here still remember the old songs, if you listen." } },
      choices = { { text = "Something more.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a ranger of the Highvale, and Quel'Danil is my charge." } },
    farstriders = { { id = "y_tp_fs", text = "The Farstriders were our finest rangers. Few remain, and I am not among the best of them." } },
    vilebranch = { { id = "y_tp_vb", text = "The Vilebranch hunt the hills north of here. We keep our arrows ready." } },
    _none = { { id = "tp_none", text = "I cannot tell you. We keep to our forest, and the world's news reaches us late." } },
  },
}

