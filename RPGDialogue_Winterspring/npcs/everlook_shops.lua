-- More of Everlook's goblins: Izzy Coppergrab (banker), Lunnix Sprocketslip (mining supplies),
-- Zap Farflinger (the "unbalanced engineer" with the dimensional ripper).
-- Voice: bibles/everlook_shops.md (goblin standard, CONTENT_GUIDE §2)
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Izzy Coppergrab
---------------------------------------------------------------------------
P:NPC {
  key = "izzy_coppergrab", id = TODO_NPC("Izzy Coppergrab"), name = "Izzy Coppergrab", title = "Banker",
  bible = "bibles/everlook_shops.md", role = "banker", tier = "service",
  communities = { "everlook" }, temper = { "smooth", "shrewd" }, values = { "profit", "careful" },
  notices = { "purse" },

  impression = {
    first = "Izzy Coppergrab runs the bank in Everlook and counts your coins while you're still holding them. He swears his vault is the safest in Kalimdor and charges accordingly.",
    third = "{name} met Izzy Coppergrab, the goblin banker of Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Bank of Everlook, friend, where your valuables are safe, warm and very modestly charged." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! My favorite kind, pal, because returning customers have already read the small print." },
  },

  notice = {
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Whoa, whoa, is that a hundred gold I hear jingling? Buddy, you shouldn't be walkin' around Winterspring with that, not when I've got a perfectly good vault right here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Izzy Coppergrab, banker, and the Bank of Everlook is the only vault between Felwood and the end of the world, so you're not gonna find a better one, pal, or a cheaper one, or any other one. Deposits, withdrawals, safe storage, all on account." },
        { id = "h_poor", when = { money = { max = 1000 } },
          text = "Izzy Coppergrab, banker, and I can see by the way you're walkin' that your purse is light, chum. That's fine, that's fine, the vault holds more than gold, and a poor customer today is a rich one next season." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Izzy Coppergrab, banker, and a dwarf at my counter is a fine sight, pal, 'cause your people respect a good vault. Mind you, I've seen the Ironforge vaults, and mine's smaller, colder and much better run, so don't go gettin' homesick on me." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Questions are free, interest isn't." },
        { id = "h_again2", text = "Go on, chum, I'm billin' by the hour, but only metaphorically." },
      },
      choices = {
        { text = "Open my vault.", next = "BUSINESS" },
        { text = "How safe is your vault, really?", next = "safe" },
        { text = "Does the bank serve both factions?", next = "factions" },
        { text = "Who banks in Everlook, anyway?", next = "clients" },
        { text = "Why would a goblin bank at the end of the world?", next = "why" },
        { text = "Any work going for a quick pair of hands?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Goodbye, Izzy.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safer than a dwarf's beard in a blizzard, pal. Three locks, two guards, and one Bruiser who doesn't understand the word 'bribe', which cost me a fortune to find. Nobody's robbed this bank, and the last fella who tried is still payin' off the damages." } },
      choices = {
        { text = "What did he try?", next = "safe_tried" },
        { text = "A Bruiser you can't bribe? How?", next = "safe_bruiser" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_tried = {
      lines = { { id = "st_default", text = "Tunnelled up through the floor, the genius, right into the bit of the vault where I keep the blasting powder for the miners. Took his eyebrows, took my floorboards, and took him six months of sweeping to pay back the floorboards." } },
      choices = { { text = "That's a hard lesson.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    safe_bruiser = {
      lines = { { id = "sb_default", text = "Easy, buddy: I pay him more than anybody else could ever offer, every week, in advance, with a bonus for every crook he sits on. Honesty's real expensive, but it's the cheapest thing in this building when you count what it saves me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    factions = {
      big = true,
      lines = { { id = "fa_default", text = "Both, all, everybody, pal. Gold doesn't fly a flag, and neither does a Steamwheedle banker. I've had Horde and Alliance in my queue at the same time, glarin' at each other, and they both paid the same fee." } },
      choices = {
        { text = "That's how it should be. Business keeps the peace.", next = "BACK", reply = "You get it, pal, and that's why nobody's ever drawn steel in my line, because they both know the vault closes on whoever starts it. Nobody fights where their money sleeps.", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "Some things should matter more than coin, Izzy.", next = "BACK", reply = "Sure, sweetheart, and when you find one of those things, bring it by and I'll see if I can store it for you. Until then, the vault only takes what jingles.", fx = { align = { order = -1 } } },
        { text = "What happens if they start a fight in here?", next = "factions_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    factions_fight = {
      lines = { { id = "ff_default", text = "Then the Bruisers throw 'em both in the snow, and I add a cleanin' fee to both accounts, and the next time they come in they're real polite. Nothin' calms a soldier down like an itemized bill, pal, believe me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clients = {
      lines = { { id = "cl_default", text = "Everybody worth knowin'. Malyfous keeps thorium bars with me, the Argent Dawn keeps donations, and half the hunters in Winterspring keep pelts they swear they'll sell next week. I keep the books on all of 'em, and I never tell, 'cause that's the job." } },
      choices = {
        { text = "Never tell? Not even for a price?", next = "clients_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clients_price = {
      lines = { { id = "cp_default", text = "Whoa, whoa, pal, a banker who sells secrets is a banker with no clients by Tuesday. I'll tell you this for free: the Argent Dawn's account goes up every month, and somebody in Everlook is very generous, and it ain't me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },
    why = {
      lines = { { id = "wh_default", text = "'Cause where there's a crossroads there's trade, and where there's trade there's gold that needs somewhere to sit. Everlook's the only warm room between Felwood, the Timbermaw and the Frostsaber cliffs, so everybody comes through, and everybody's carryin'." } },
      choices = {
        { text = "You must miss somewhere warmer.", next = "why_warm" },
        { text = "Something else.", next = "BACK", fx = { learn = { "everlook" } } },
      },
    },
    why_warm = {
      lines = { { id = "ww_default", text = "Every day, pal, and I put the money I'd spend on a beach in Booty Bay into the vault instead, and watch it grow. The cold's good for business; nobody's in a hurry to leave a bank with a stove in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Ha! I know that look, buddy, and I know those soft boots. The only work I got for your kind is standin' on the other side of my Bruiser and admirin' the locks, so let's keep it friendly, and you keep your hands where my ledger can see 'em." } },
      choices = { { text = "I was just asking. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Gold, vaults, and who in Everlook owes who what. I only sell two of those." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel keeps the books, pal, and I keep the Cartel's books, so we get along great." } },
    everlook = { { id = "tp_ev", text = "A warm room at the end of the world, and every warm room needs a vault in the back." } },
    _none = { { id = "tp_none", text = "That's not a currency I deal in, friend." } },
  },
}

---------------------------------------------------------------------------
-- Lunnix Sprocketslip
---------------------------------------------------------------------------
P:NPC {
  key = "lunnix", id = TODO_NPC("Lunnix Sprocketslip"), name = "Lunnix Sprocketslip", title = "Mining Supplies",
  bible = "bibles/everlook_shops.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "brisk", "cheerful" }, values = { "profit", "practical" },
  notices = { "miner" },

  impression = {
    first = "Lunnix Sprocketslip sells picks, flux and coal in Everlook and talks about thorium the way some people talk about sweethearts. Everyone calls her Lunny, and she lets them, for a price.",
    third = "{name} met Lunnix Sprocketslip, who sells mining supplies in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Picks, flux, coal, all the things a miner forgets to pack! Step on in, sweetheart." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The mountains eat picks, don't they, pal? Good for me, bad for you." },
  },

  notice = {
    { id = "n_miner", cat = "miner", when = { profession = "Mining" },
      text = "You've got rock dust in every crease, sweetheart, so you're a miner or you fell down a very long hole. Either way, you're my kind of customer." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lunnix Sprocketslip, mining supplies, and you can call me Lunny if you're buyin'. Winterspring's hills are full of thorium and the yetis are full of opinions about who gets to dig it, so you'll want a good pick and a fast pair of boots." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! You lot can smell ore through a mountain, I swear by my mother's ledger. Tell me where the thorium is and I'll owe you one, and you know how rare it is to hear a goblin say that." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I've got a crate of picks to price." },
        { id = "h_again2", text = "Talk to me, sweetheart, the coal ain't goin' anywhere and neither am I." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where's the best mining in Winterspring?", next = "veins" },
        { text = "Who buys the ore around here?", next = "buyers" },
        { text = "Why does everyone call you Lunny?", next = "lunny" },
        { text = "What's so special about thorium?", next = "thorium" },
        { text = "I've mined plenty. What's the trick in this cold?", next = "cold", when = { profession = "Mining" } },
        { text = "Goodbye, Lunny.", next = "END" },
      },
    },
    veins = {
      lines = { { id = "ve_default", text = "That's the question, ain't it, and the answer costs extra, but I'll tell you the free part: the hills to the east and the caves the yetis live in. The yetis don't like visitors, so the ore's still there, and the ore bein' there is a thing I like very much." } },
      choices = {
        { text = "So you send miners into yeti caves?", next = "veins_yeti" },
        { text = "And the part that costs extra?", next = "veins_extra" },
        { text = "Something else.", next = "BACK" },
      },
    },
    veins_yeti = {
      big = true,
      lines = { { id = "vy_default", text = "I don't send anybody anywhere, pal, I just sell 'em picks and wave goodbye. What they do with the picks is between them and the yeti, and some of 'em come back rich, and some of 'em come back in pieces, and both kinds paid up front." } },
      choices = {
        { text = "You should warn them properly.", next = "BACK", reply = "Warn 'em? Pal, I put a sign up, and the yetis ate the sign. Anybody who walks into those caves without hearin' the roaring first wasn't gonna listen to me anyway.", fx = { align = { honor = 1 } } },
        { text = "Their risk, your profit. Smart.", next = "BACK", reply = "Now there's a customer who reads the small print! Every pick that walks out that door is paid for in full, and whatever comes back is a happy bonus.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    veins_extra = {
      lines = { { id = "vx_default", text = "Nice try, sweetheart. I'll give you a hint on account, though: where the frostsabers den, nobody digs, and where nobody digs, the rich veins sit around waitin' for somebody with a big pick and a bigger death wish. Pay me when you're rich." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Malyfous and the Brotherhood buy thorium by the cartload, Wixxrak buys iron for his guns, and the auction house takes the rest for whoever's payin' most this week. Everybody in Everlook needs metal, sweetheart, and everybody needs me to sell 'em the pick to dig it." } },
      choices = {
        { text = "The Brotherhood? Aren't they Dark Iron?", next = "buyers_brotherhood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_brotherhood = {
      lines = { { id = "bb_default", text = "The Thorium Brotherhood, pal, Dark Irons who don't take Ragnaros's orders, or so they tell me, and their money's real either way. Malyfous calls me an ant to my face and pays me in full, and I'll take that over polite and late any day of the week." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    lunny = {
      lines = { { id = "lu_default", text = "'Cause Lunnix Sprocketslip is a mouthful, and a customer with a mouthful of name ain't got room to haggle. Lunny's friendly, Lunny's quick, and Lunny's prices are exactly the same as Lunnix's, so everybody wins, mostly me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    thorium = {
      lines = { { id = "th_default", text = "Hardest metal you can dig without a dragon helpin', and the Brotherhood can turn it into armour that shrugs off fire, which in their line of work is a real selling point. It's heavy, it's stubborn, and it's worth more than its weight in silver, so it's basically my ideal man." } },
      choices = {
        { text = "Fire? Why do they care about fire?", next = "thorium_fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thorium_fire = {
      lines = { { id = "tf_default", text = "'Cause back home in Blackrock Mountain, the stuff that lives under the stuff is made of fire, pal, and it ain't friendly. I don't ask the details; I sell the picks, they make the armour, and somewhere far away somebody very hot gets very annoyed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock_depths" } } } },
    },
    cold = {
      lines = { { id = "co_default", text = "Warm your pick before you swing it, sweetheart, 'cause cold steel snaps on cold rock, and then you're halfway up a yeti cave holdin' a stick. Keep it inside your coat on the walk up, and keep a spare, and buy the spare from me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ore, picks, and which hill's worth climbing. The last one costs extra." } },
    dark_iron = { { id = "tp_di", text = "The Brotherhood ones pay on time. The other ones I don't sell to, 'cause they don't pay at all." } },
    _none = { { id = "tp_none", text = "If it ain't rock, pal, I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Zap Farflinger
---------------------------------------------------------------------------
P:NPC {
  key = "zap_farflinger", id = TODO_NPC("Zap Farflinger"), name = "Zap Farflinger", title = "Unbalanced Engineer",
  bible = "bibles/everlook_shops.md", role = "trainer", tier = "service",
  communities = { "everlook" }, temper = { "excitable", "chatty" }, values = { "inventive", "ambitious" },
  notices = { "goblin_eng", "gnome_eng" },

  impression = {
    first = "Zap Farflinger calls himself an unbalanced engineer and means it as a boast. He has built a dimensional imploder in Everlook and is looking for a goblin engineer brave enough to blow themselves up with it.",
    third = "{name} met Zap Farflinger, the goblin engineer in Everlook with the dimensional imploder.",
  },

  greetings = {
    { id = "g_default", text = "Hey, hey, careful where you step, pal, that's a live wire and it's very proud of itself!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Most people don't, and I'm still workin' out whether that's the imploder or my personality." },
  },

  notice = {
    { id = "n_goblin", cat = "goblin_eng", when = { profession = "Engineering", race = "Goblin" },
      text = "A goblin engineer! Sparks and sprockets, you're exactly who I've been waitin' for, chum, and I've got a business proposal that's gonna change your life or end it." },
    { id = "n_gnome", cat = "gnome_eng", when = { profession = "Engineering", race = "Gnome" },
      text = "Oh, a gnome engineer. Very nice, very neat, very safe. Come back when you've lost an eyebrow, kid, and we'll talk shop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zap Farflinger, unbalanced engineer, and I've just finished a dimensional imploder that'll make me rich beyond my wildest goblin dreams. All I need is a skilled goblin engineer to build a dimensional ripper that connects to it and try it out, and the line for that job is, let's say, short." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "An engineer! Now we're talkin', pal. The question is: are you the careful kind, or the real kind, because the careful kind never gets rich and the real kind sometimes gets rich and always gets interesting." },
      },
      again = {
        { id = "h_again", text = "What else, buddy? Talk fast, the imploder's humming." },
        { id = "h_again2", text = "Go on, ask, I love questions. Questions are just orders that haven't paid yet." },
      },
      choices = {
        { text = "How does the dimensional imploder work?", next = "imploder" },
        { text = "Why do you call yourself unbalanced?", next = "unbalanced" },
        { text = "Teach me what you know.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Why build it here, in Everlook?", next = "where" },
        { text = "The gnomes build transporters too, don't they?", next = "gnomes" },
        { text = "A mage can open a portal without exploding anyone.", next = "mage", when = { class = "MAGE" } },
        { text = "I'll stand somewhere else, thanks.", next = "END" },
      },
    },
    imploder = {
      lines = { { id = "im_default", text = "The theory is beautiful, pal. We completely destroy you with a massive explosion wherever you are, send the particles through a dimensional rip, and re-implode you right here in Everlook. Instant transport! It might not work all the time, but what kind of goblin engineer worries about that?" } },
      choices = {
        { text = "That sounds incredibly dangerous.", next = "imploder_danger" },
        { text = "Has anyone tried it?", next = "imploder_tried" },
      },
    },
    imploder_danger = {
      big = true,
      lines = { { id = "id_default", text = "Course it's dangerous, chum! If survival was your first priority, you could never be a real goblin engineer. We goblin engineers laugh at danger, and sometimes danger laughs back, and that's just the overhead." } },
      choices = {
        { text = "Fortune favors the bold. I'd try it.", next = "BACK", reply = "Ha! That's the spirit, chum, and I'll put you down as a test subject, I mean a valued customer, right after I find my other eyebrow. Sign here, and here, and initial where it says 'probably'.", fx = { align = { order = -1 } } },
        { text = "Some risks aren't worth any profit.", next = "BACK", reply = "Sure, and some folks never leave the house, and they never get to see a yeti turn inside out either. Your loss, pal, but I respect a coward who knows his own mind.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    imploder_tried = {
      lines = { { id = "it_default", text = "Plenty! Well, some. Well, a couple, and they mostly arrived, and the ones who arrived in the wrong place sent very angry letters, which proves they arrived somewhere. That's a success in my ledger, pal." } },
      choices = {
        { text = "Where did the wrong ones end up?", next = "imploder_wrong" },
        { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    imploder_wrong = {
      lines = { { id = "iw_default", text = "One fella came down in the middle of the Winterfall camp and had a very long walk home, and another landed in the lake, upside down, which ain't technically my fault since I never said which way up. The third one we're still waitin' on, but I'm sure he's fine." } },
      choices = {
        { text = "You're sure he's fine?", next = "imploder_third" },
        { text = "Something else.", next = "BACK" },
      },
    },
    imploder_third = {
      lines = { { id = "i3_default", text = "Real sure, pal, almost totally sure, and if he ain't, the waiver he signed covers it on page four. Read your waivers, buddy, that's my advice, and I give it free, which you'll notice I almost never do." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    unbalanced = {
      lines = { { id = "un_default", text = "Because balanced engineers build bridges, and bridges are boring, and I'd sooner build somethin' that makes the bridge unnecessary. My cousin's a balanced engineer, and he's got all his fingers and no money, so you tell me which of us got it right." } },
      choices = {
        { text = "Your cousin, I'd say.", next = "unbalanced_cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unbalanced_cousin = {
      lines = { { id = "uc_default", text = "Ha! That's what my mother says, and she counts his fingers every holiday, and then she counts mine, and then she sighs. But he's still buildin' bridges in Booty Bay, and I'm about to fold the whole world in half, so we'll see who's sighin' next year." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    where = {
      lines = { { id = "wh_default", text = "'Cause it's the end of the line, pal, and every merchant who comes up here spends three days on a mountain road or pays through the nose for a bird. Picture it: one boom in Gadgetzan, one boom here, and a customer arrives fresh, more or less, and the market's all mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "everlook" } } } },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "The ultrasafe transporter, they call theirs, and it's ultrasafe, all right, except when it ain't, and then you're a chicken or you're on fire, and they write it down very neatly in a notebook. We're both blowin' people up, kid; we're just honest about it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    mage = {
      lines = { { id = "ma_default", text = "Sure, and how much did that cost ya, pal, in years of study and robes and tea with old men in towers? My way, you pay once, you pull a lever, and you're there, in one piece or several. That's the free market, buddy, and that's progress." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Explosions, rips in reality, and how to sell both." } },
    gnomeregan = { { id = "tp_gnomer", text = "Gnomes, buddy. Very tidy, very careful, very irradiated. No offense." } },
    gadgetzan = { { id = "tp_gz", text = "Other end of my imploder line, someday, pal. Warm, sandy, and very good for business." } },
    _none = { { id = "tp_none", text = "No idea, pal, but if you find out, I bet I can make it explode." } },
  },
}
