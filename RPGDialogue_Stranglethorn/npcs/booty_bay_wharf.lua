-- Booty Bay's wharf and trade halls: Crazk Sparks the fireworks seller, Wigcik the fishmonger, Myizz Luckycatch the fishing trainer, Grimestack the stable master, Scooty and his transporter, and the three auctioneers. Voice: bibles/booty_bay_wharf.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

------------------------------------------------------------------------
-- Crazk Sparks: fireworks, no eyebrows, no regrets
------------------------------------------------------------------------
P:NPC {
  key = "crazk", id = TODO_NPC("Crazk Sparks"), name = "Crazk Sparks", title = "Fireworks Merchant",
  bible = "bibles/booty_bay_wharf.md", role = "vendor", tier = "quest",
  communities = { "booty_bay" }, temper = { "showy", "quick" }, values = { "trade", "inventive" },
  notices = { "class", "race", "profession" },

  impression = {
    first = "He has no eyebrows, which he swears is a sign of quality.",
    third = "{name} met Crazk Sparks, the eyebrowless goblin who sells fireworks on the Booty Bay wharf.",
  },

  greetings = {
    { id = "g_default", text = "Step up, buddy, step up, and keep that torch on the far side of the railing while you do it!" },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's my favourite customer, or my second favourite, since the Baron buys by the crate. What's it gonna be today, buddy?" },
    { id = "g_away", when = { away = 14 }, text = "Look who's back after {away}! I was startin' to think you'd gone off with a bang somewhere, and not one of mine, which would be a real waste." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, Alliance, it's all the same colour once it's up in the sky, buddy. Red bursts are on special for the orcs, just so you know." },
    { id = "g_word", when = { word = "helped" }, text = "Word on the wharf is you did somebody a good turn. That's the sort of thing that deserves a rocket, and I happen to sell rockets, buddy." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, huh? You throw fire around for free, and I gotta tell ya, that's terrible for my business, so please don't do it near the stock." },
    { id = "n_engineer", cat = "profession", when = { profession = { name = "Engineering", min = 1 } },
      text = "You've got blasting powder under your fingernails, buddy, I can smell it from here. Takes one to know one, so keep your hands out of my crates." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Your people know a good boom when they hear one, so I'll skip the safety talk, mostly because you'd ignore it anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Crazk Sparks, fireworks for every occasion, and some occasions you didn't know needed fireworks till I showed up. Weddings, ship launches, the Baron's fishing tournament, a really good funeral, you name it, buddy, I've lit it." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome at my stall, and you're gonna tell me my fuses are too short, ain't ya? Everybody's a critic, buddy, but my rockets go up and come down when I say they will, mostly." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Whoa, whoa, keep the beast back a step, buddy, because animals and my merchandise don't get along. The last raptor that sniffed a crate here is still runnin', as far as I know." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "A warlock! Listen, I sell green fire too, real nice, perfectly harmless, and it don't come with any whispering, which I hear is a plus for you people." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Now this is the hour, buddy, when the sky's dark and the rum's flowin' and everybody on the wharf suddenly wants to see somethin' explode. Business is booming, if you'll pardon the expression." },
      },
      again = {
        { id = "h_again", text = "What else, buddy? I got all night, and a fuse that's only got about half of that." },
        { id = "h_again2", text = "Go on, go on, ask me anything except where my eyebrows went." },
        { id = "h_again3", text = "Still here? Good, that means nothing's gone off yet. What else?" },
      },
      choices = {
        { text = "What happened to your eyebrows?", next = "brows" },
        { text = "Fireworks seem an odd thing to sell in a pirate town.", next = "buyers" },
        { text = "Why sell fireworks on a wooden wharf?", next = "safety" },
        { text = "What's the best thing you've ever lit?", next = "best" },
        { text = "Do you make these yourself?", next = "workshop" },
        { text = "I can make my own blasting powder, Crazk.", next = "xeng", when = { profession = { name = "Engineering", min = 1 } } },
        { text = "I could light your whole stall with a word.", next = "xmage", when = { class = "MAGE" } },
        { text = "Don't your fireworks frighten the animals?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I'd wager the Bloodsail buy from you now and then.", next = "bloodsail", when = { faction = "Alliance" } },
        { text = "Do the Horde get the same prices as the Alliance?", next = "prices", when = { faction = "Horde" } },
        { text = "I'll keep my torch away. Goodbye, Crazk.", next = "END" },
      },
    },

    -- The eyebrows
    brows = {
      lines = {
        { id = "br_default", text = "Product testing, buddy, every single batch, because I don't sell nothin' I wouldn't light under my own nose. The eyebrows went in Ratchet, the shop went in Ratchet, and Ratchet's harbour master asked me very nicely to set up shop somewhere else." },
      },
      choices = {
        { text = "You burned down a shop in Ratchet?", next = "ratchet" },
        { text = "Will they grow back?", next = "brows_grow" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    brows_grow = {
      lines = { { id = "bg_default", text = "They did, twice, and then I tested the Festival Blue batch and that was the end of that. I tell the customers it's so I can watch the sky without anything in the way, and you'd be amazed how many of 'em buy it." } },
      choices = {
        { text = "I'd buy it. It's a good line.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Maybe test them at arm's length next time.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    ratchet = {
      big = true,
      lines = { { id = "rt_default", text = "Not the whole shop, just the roof and the back wall and a little bit of the dock, and nobody got hurt except a crate of somebody else's oranges. The Cartel said I owed for the oranges, so I paid for the oranges, and then I got on the next boat south before they found out about the dock." } },
      choices = {
        { text = "You should have paid for the dock too.", next = "BACK", reply = "Pay for the dock? Buddy, the dock was already half rotten, I just finished the job for 'em at no extra charge. The Cartel oughta be sendin' me a thank-you card.", fx = { align = { honor = 1 } } },
        { text = "Running before the bill came was the smart move.", next = "BACK", reply = "Now you get it, buddy! A bill can't find you if you're three days down the coast in a goblin port with a brand-new stall and a fake mustache.", fx = { align = { honor = -1 } } },
        { text = "I'd guess Ratchet still wants you back.", next = "ratchet_back" },
      },
    },
    ratchet_back = {
      lines = { { id = "rb_default", text = "Gazlowe, who runs Ratchet, sends me a letter every year asking for fireworks for the harbour festival, and every year he adds a line at the bottom sayin' I'm to set 'em off from a boat, a good long way out. I think that's what you call a compliment with conditions, buddy." } },
      choices = { { text = "That sounds like a friendship, of sorts.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } } },
    },

    -- Who buys
    buyers = {
      lines = {
        { id = "by_default", text = "Everybody, buddy, everybody! The Baron takes a crate every Sunday for the winner of the fishing tournament, the Blackwater crews buy rockets every time they bring a prize in, and the Salty Sailor buys sparklers for birthdays, which in this town is anybody who's survived another year." },
      },
      choices = {
        { text = "The Baron's a good customer, then?", next = "baron" },
        { text = "What do the Blackwater crews like best?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    baron = {
      lines = { { id = "bn_default", text = "The best, because he pays on time and never haggles, which makes me real nervous, buddy, because a goblin who don't haggle is a goblin who's already won. I think he likes to see the sky lit up over his town, so the ships out at sea know whose cove this is." } },
      choices = {
        { text = "A show of strength, dressed up as a party.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Maybe he just likes fireworks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    pirates = {
      lines = { { id = "pi_default", text = "Big loud reds, the louder the better, so the whole bay knows they've taken somethin'. Once a crew lit a whole crate on the deck of the ship they'd just captured, and the ship went up with it, so they came back with nothin' but a good story and a bill from me." } },
      choices = {
        { text = "I'd wager they never paid that bill.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Pirates and powder. Who'd have guessed?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- Safety
    safety = {
      lines = {
        { id = "sf_default", text = "Because this is where the customers are, buddy, and the Bruisers made me a deal: I keep the real stock in a cellar below the tideline, so if anything goes off, the sea comes in and puts it out. I keep a bucket too, for the little stuff." },
      },
      choices = {
        { text = "Has the cellar ever flooded on purpose?", next = "safety_cellar" },
        { text = "A bucket. That's your whole safety plan.", next = "safety_rules" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safety_cellar = {
      lines = { { id = "sc_default", text = "Twice, and both times I lost the whole stock and saved the whole town, and nobody threw me a parade. That's the fireworks trade for ya, buddy: when it works, they cheer, and when it don't, they bill ya." } },
      choices = { { text = "I'd have thrown you a parade.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    safety_rules = {
      big = true,
      lines = { { id = "sr_default", text = "A bucket and good instincts, buddy, and a very fast pair of legs. The Bruisers want me to put up a sign with rules on it, but nobody in this town reads signs, and the ones who do are the careful ones who didn't need the sign." } },
      choices = {
        { text = "Put up the sign. Rules keep people alive.", next = "BACK", reply = "You and the Bruisers both, pal, and I'll think about it, honest. Thing is, a sign's just one more thing that catches fire.", fx = { align = { order = 1 } } },
        { text = "Signs are for people with no instincts. Skip it.", next = "BACK", reply = "That's what I keep sayin'! Instincts are free, signs cost two silver, and nobody reads 'em anyway, so the math's real simple.", fx = { align = { order = -1 } } },
        { text = "I'll stand a little further back, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Best show
    best = {
      lines = { { id = "bs_default", text = "The night the Blackwater brought in the Bloodsail's flagship mast as a trophy, I put two hundred rockets up off the end of the pier, and you could see the glow from Grom'gol, buddy. I didn't sleep for three days and I couldn't hear for four, and it was worth every copper." } },
      choices = {
        { text = "Two hundred rockets? Who paid for that?", next = "best_pay" },
        { text = "I'd have liked to see that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    best_pay = {
      lines = { { id = "bp_default", text = "The Baron paid for a hundred, and I paid for the other hundred myself, which my accountant still won't talk to me about. Some nights a goblin's gotta spend money just to remind himself why he makes it." } },
      choices = { { text = "That's a very un-goblin thing to say.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    -- Workshop
    workshop = {
      lines = { { id = "wk_default", text = "Every one, in a shed out past the tunnel where the only neighbours are panthers, and the panthers have learned to keep their distance. The powder comes in from Gadgetzan, the paper comes from wherever I can get it, and the colours are a family secret, buddy, which means I'll tell ya for gold." } },
      choices = {
        { text = "I'd pay good gold for that secret.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "Keep your secret. I like being surprised.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    -- Class and faction
    xeng = {
      big = true,
      lines = { { id = "xe_default", text = "Sure you can, buddy, and so can every apprentice with a mortar and a death wish. Making the powder's easy, it's making it go up pretty instead of sideways that takes the talent, and most engineers I know only care that it goes up at all." } },
      choices = {
        { text = "Pretty is pointless. Powder is for work.", next = "BACK", reply = "Pointless? Buddy, nobody ever paid a premium to watch a mine shaft go boom. Work powder is cheap, pretty powder is where the profit lives.", fx = { align = { order = 1 } } },
        { text = "Making it pretty is the whole art, Crazk.", next = "BACK", reply = "See, you get it, pal! Any fool can blow up a shed, but makin' the sky go gold and green over the harbour, that's art, and art sells.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "You could, buddy, and then you'd owe me for every crate, plus the stall, plus the dock, plus my emotional distress, which I price very high. The Cartel's got paper on all of it, so maybe keep your word to yourself." } },
      choices = { { text = "Relax, Crazk. It was a joke.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    xhunt = {
      lines = {
        { id = "xh_default", text = "Every animal in Stranglethorn hates 'em, buddy, so the tiger hunters up at Nesingwary's camp buy my flash-bangs to flush game out of the brush. Real sporting, they tell me, though I notice they never ask the tigers." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "Every animal in Stranglethorn hates 'em, buddy, and your {pet} there is already lookin' at my crates like they owe it money. Nesingwary's hunters buy my flash-bangs to flush game out, so maybe keep a tight hold on the leash, huh?" },
      },
      choices = { { text = "I'll keep my companion well clear of your stall.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    bloodsail = {
      big = true,
      lines = { { id = "bl_default", text = "Whoa, whoa, never, buddy, not knowingly, because the Baron would hang me off the pier by my ears. Course, a guy in a long coat who don't say which ship he's from, well, I can't go checkin' under everybody's coat for a red sash, can I?" } },
      choices = {
        { text = "You should check. Selling to them helps them kill.", next = "BACK", reply = "Check? Pal, you want me askin' a big guy with a cutlass what his politics are? I'll keep my questions to how many and how soon, and keep my ears.", fx = { align = { honor = 1 }, learn = { "bloodsail" } } },
        { text = "Gold is gold. You can't police every customer.", next = "BACK", reply = "Exactly, buddy, I'm a fireworks dealer, not a magistrate. If the Baron wants every buyer checked, he can put a Bruiser on my stall and pay his wages.", fx = { align = { honor = -1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prices = {
      lines = { { id = "pr_default", text = "Same prices, buddy, by Cartel rule and by my own good sense, because I don't care whose army you march in as long as your copper's real. The dwarves haggle harder, but the orcs buy bigger, so it all comes out even." } },
      choices = { { text = "Good to know the Bay plays fair.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what burns, what bangs and who paid for it, buddy, and I know the wharf from one end to the other." } },
    background = { { id = "tp_bg", text = "I had a shop in Ratchet till it went up, and I've had a stall here ever since. Business is better, and the sea's closer, which helps.", next = "brows" } },
    advice = { { id = "tp_ad", text = "Light the fuse, step back, then step back again, buddy. Everybody forgets the second step." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel takes its cut off every rocket I sell, and in return they don't let anybody burn my stall down except me." } },
    _none = { { id = "tp_none", text = "No idea, buddy, and if it don't explode, I probably wasn't payin' attention." } },
  },
}

------------------------------------------------------------------------
-- Wigcik: fishmonger, haggler, Heming's oldest customer and critic
------------------------------------------------------------------------
P:NPC {
  key = "wigcik", id = TODO_NPC("Wigcik"), name = "Wigcik", title = "Superior Fisherman",
  bible = "bibles/booty_bay_wharf.md", role = "vendor", tier = "quest",
  communities = { "booty_bay" }, temper = { "sour", "sharp" }, values = { "trade", "practical" },
  notices = { "profession", "race", "purse" },

  impression = {
    first = "He argues with each fish before he sells it.",
    third = "{name} met Wigcik, the sour goblin fishmonger of the Booty Bay docks.",
  },

  greetings = {
    { id = "g_default", text = "Fish, chum, fresh this morning, and if it ain't fresh it's cured, and if it ain't cured it's bait. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, chum. You buyin' this time, or just standin' in my smell for free?" },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, chum, and the catch has gone up two coppers a pound while you were out. Don't look at me, look at the sharks." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? Fish don't care what flag you fly, chum, and neither do I, so long as your coin don't smell worse than my stock." },
  },

  notice = {
    { id = "n_fisher", cat = "profession", when = { profession = { name = "Fishing", min = 1 } },
      text = "You fish, chum, I can tell by the hands and the squint. You sellin' or buyin', because I do both and the prices ain't the same." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, huh? Your folk were netting this bay before Old Man Heming was born, whatever he tells ya, so you can have the honest price." },
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } },
      text = "Your purse is lighter than a minnow, chum. There's bait in the bucket that's cheaper than the fish, and some days it tastes about the same." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wigcik, superior fisherman, which means I sell superior fish, and if anybody on these docks tells ya different they're sellin' you something that died on Tuesday. Mackerel, snapper, the odd tastyfish when the tide's kind, chum, take your pick." },
        { id = "h_fisher", when = { profession = { name = "Fishing", min = 1 } },
          text = "A fisher, eh? Then you know a good catch when you see one, chum, which is more than half my customers. If you've got a sackful to sell, I'll look, but I'll tell ya now I don't pay for anything that's been sittin' in the sun." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf on my dock! Your lot eat a surprisin' amount of fish for mountain folk, chum, and you always want it fried in somethin' that'd stop a goblin's heart." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, buying fish? Don't laugh, chum, plenty of you do, though you always look sorry for 'em first, which I find real touching." },
        { id = "h_morning", when = { timeOfDay = "dawn" },
          text = "Mornin', chum, and you're just in time, because the boats came in an hour ago and the gulls haven't had the good ones yet. Look sharp, they're circling." },
      },
      again = {
        { id = "h_again", text = "What else, chum? The fish ain't gettin' any fresher while we chat." },
        { id = "h_again2", text = "Go on, I'm listenin', though I'm guttin' this snapper while I do it." },
        { id = "h_again3", text = "Anything else, or are ya just enjoying the smell?" },
      },
      choices = {
        { text = "What's the best fish you've got today?", next = "catch" },
        { text = "You know Old Man Heming?", next = "heming" },
        { text = "Who catches all this for you?", next = "boats" },
        { text = "You must have pulled strange things out of the bay.", next = "strange" },
        { text = "Why 'superior' fisherman?", next = "title" },
        { text = "I'd sell you my catch, if the price is right.", next = "xfisher", when = { profession = { name = "Fishing", min = 1 } } },
        { text = "Do you sell fish to cooks?", next = "xcook", when = { profession = { name = "Cooking", min = 1 } } },
        { text = "My people fished this coast long before goblins.", next = "xtroll", when = { race = "Troll" } },
        { text = "I'll take my nose elsewhere. Good day, Wigcik.", next = "END" },
      },
    },

    -- The catch
    catch = {
      lines = { { id = "ct_default", text = "Rockscale cod in from the outer reef, and a barrel of mackerel that'll keep for a week if ya salt it. Stay away from anything caught near the Vile Reef, chum, because the naga have been doin' somethin' to the water out there and I don't sell what glows." } },
      choices = {
        { text = "The fish glow near the Vile Reef?", next = "glow" },
        { text = "I'll take the cod.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glow = {
      big = true,
      lines = { { id = "gl_default", text = "Faint green, round the gills, and only at night, which is just about the worst way a fish can glow. Some of the boys sell 'em to tourists as a Stranglethorn delicacy, chum, and I tell 'em that's how you lose customers, one at a time and permanently." } },
      choices = {
        { text = "Selling poisoned fish to strangers is wrong. Report them.", next = "BACK", reply = "Report 'em? Pal, half of 'em are my cousins, and the other half owe me money. I'll have a quiet word, though, because a dead tourist is bad for everybody's business.", fx = { align = { honor = 1 } } },
        { text = "Tourists should know better. That's their lookout.", next = "BACK", reply = "Ha! That's what I tell myself, chum, but I still don't sell 'em. Glowin' fish are bad for repeat customers, if you catch my meaning.", fx = { align = { honor = -1 } } },
        { text = "Heming said much the same about the reef.", next = "BACK", when = { heardLine = "heming.xhcast_default" }, fx = { affinity = 1 } },
      },
    },

    -- Heming
    heming = {
      lines = {
        { id = "hm_default", text = "Know him? I've bought his catch for twenty years, chum, and he's told me the same story about fishin' this bay before the goblins came every single time. I've never once had the heart to ask him how old that would make him." },
      },
      choices = {
        { text = "Do you think he's telling the truth?", next = "heming_truth" },
        { text = "Is his fish any good?", next = "heming_fish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heming_truth = {
      big = true,
      lines = { { id = "ht_default", text = "Maybe, maybe not, but he knows where every snapper in this bay sleeps, so I don't much care how he learned it. He tells the young fishers at the Baron's tournament that he taught most of the winners, and you know what, chum, he probably did." } },
      choices = {
        { text = "A man's stories are his own. Let him tell them.", next = "BACK", reply = "My thinking exactly, pal. He's the best fisher in this bay, and if he wants to have wrestled a sea giant too, who am I to argue?", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Somebody should set the record straight, gently.", next = "BACK", reply = "Gently, sure, and you can be the one to do it, pal. I've tried, and the old man just smiled and told me a longer story.", fx = { align = { order = 1 } } },
        { text = "You're fond of him, I can tell.", next = "heming_fond" },
      },
    },
    heming_fond = {
      lines = { { id = "hf_default", text = "Don't you go spreadin' that around the docks, chum. I pay him a copper more a pound than anybody else, and if he ever finds out it's on purpose, he'll stop sellin' to me out of pride." } },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    heming_fish = {
      lines = { { id = "hfi_default", text = "Best on the docks, which I'll deny if you tell him, because his prices would go up by Sunday. He catches with a hand line and a lot of patience, chum, and I swear the fish come to him just to get it over with." } },
      choices = { { text = "Patience pays, it seems.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },

    -- The boats
    boats = {
      lines = { { id = "bt_default", text = "Six skiffs, a dozen hand liners on the docks and anybody who walks up with a sack and a good story. The skiffs go out past the Cape at dawn, chum, and on a bad week only five come back, because the sharks out there don't care whose skiff it is." } },
      choices = {
        { text = "You lose a boat a week?", next = "boats_loss" },
        { text = "I'd fish for you, if you paid fairly.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    boats_loss = {
      big = true,
      lines = { { id = "bl_default", text = "Not every week, but more than I'd like, and the Cartel charges me for the skiff whether the crew comes back or not. I put a copper in a jar for each crew that's lost, chum, and when it's full the Salty Sailor pours a round for the ones still standin'." } },
      choices = {
        { text = "The Cartel should pay for lost crews, not charge you.", next = "BACK", reply = "You go tell the Cartel that, chum, and let me know how the conversation goes. My jar's got room for one more copper, though.", fx = { align = { order = -1 }, learn = { "steamwheedle" } } },
        { text = "A contract's a contract. The skiffs cost money.", next = "BACK", reply = "Spoken like a Cartel accountant, pal, and you're right, which is the worst part. I still keep the jar, though, because ledgers don't remember faces.", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "That jar is a good tradition, Wigcik.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    -- Strange catches
    strange = {
      lines = { { id = "sg_default", text = "A Bloodsail captain's hat with the captain's head still in it, a chest full of Stormwind letters nobody ever claimed, and once a murloc in a pair of goblin boots. I sold the boots, chum, and the murloc went back in, because I ain't a monster." } },
      choices = {
        { text = "What happened to the letters?", next = "strange_letters" },
        { text = "A murloc in goblin boots? I'd have paid to see that.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    strange_letters = {
      lines = { { id = "sl_default", text = "I gave 'em to the human up on the landing, Smythe, who swore he'd send 'em north on the next ship. Most of 'em were love letters, he said, which is a terrible thing to find at the bottom of the sea, chum." } },
      choices = { { text = "I hope a few of them reached home.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    -- The title
    title = {
      lines = { { id = "ti_default", text = "Because 'adequate fisherman' don't sell, chum, and 'Wigcik who mostly buys from other people' sells even worse. The Cartel let me paint whatever I wanted on the sign, so I painted the biggest word I could spell." } },
      choices = { { text = "That's honest, at least.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    -- Who you are
    xfisher = {
      lines = {
        { id = "xf_default", text = "Then bring it to me gutted, chum, not whole, and not after it's spent the afternoon in your pack beside your boots. I pay best for what Heming won't catch, which is anything out past the Cape, and worst for anything from the shallows, because any kid with a stick can catch those." },
      },
      choices = {
        { text = "What's out past the Cape?", next = "xfisher_cape" },
        { text = "Gutted, not whole. I'll remember.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xfisher_cape = {
      lines = { { id = "xfc_default", text = "Big ones, chum, and the sharks that eat the big ones. Myizz, the fishing teacher down the dock, will teach ya to cast that far, and Heming'll tell ya not to bother, and they're both right, which is the trouble with fishin'." } },
      choices = { { text = "I'll ask Myizz, then.", next = "BACK" } },
    },
    xcook = {
      lines = { { id = "xc_default", text = "To cooks most of all, chum, because a cook knows what they're lookin' at and don't waste my time poking the eyes. Take the mackerel, salt it hard and smoke it, and you've got supper for a week in the jungle that won't go off in the heat." } },
      choices = { { text = "Smoked mackerel it is. Thanks, Wigcik.", next = "BACK", fx = { affinity = 1 } } },
    },
    xtroll = {
      lines = { { id = "xt_default", text = "So I hear, chum, and I believe it, because the old fish traps under the north pier ain't goblin make and they ain't human. Heming says they were there when he came, and that's the only time he's ever admitted somethin' was older than him." } },
      choices = { { text = "Those traps are ours. Leave them be.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Fish, boats, the price of both, and what the bay's been doin' lately, chum. Ask away." } },
    background = { { id = "tp_bg", text = "Been sellin' fish on these docks for twenty years. Before that I sold fish somewhere else, and before that I was a kid stealin' fish, so it's a family trade.", next = "title" } },
    advice = { { id = "tp_ad", text = "Smell it before ya buy it, chum, and never buy fish from a guy who's smiling." } },
    _none = { { id = "tp_none", text = "Don't know, chum, and it ain't got fins, so I don't care." } },
  },
}

------------------------------------------------------------------------
-- Myizz Luckycatch: fishing trainer, superstitious, patient for a goblin
------------------------------------------------------------------------
P:NPC {
  key = "myizz", id = TODO_NPC("Myizz Luckycatch"), name = "Myizz Luckycatch", title = "Fishing Trainer",
  bible = "bibles/booty_bay_wharf.md", role = "trainer", tier = "quest",
  communities = { "booty_bay" }, temper = { "warm", "quick" }, values = { "patient", "trade" },
  notices = { "profession", "class", "race" },

  impression = {
    first = "No other goblin I know thinks patience is worth paying for.",
    third = "{name} met Myizz Luckycatch, the superstitious goblin who trains fishers on the Booty Bay docks.",
  },

  greetings = {
    { id = "g_default", text = "Come on down, sweetheart, mind the loose board, and don't whistle on my dock, because whistling scares off the luck." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, sweetheart! Did you keep your line wet and your thumbs crossed, like I told ya?" },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, sweetheart, and I bet you didn't fish once the whole time. I can see it in your wrists, they've gone all stiff." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde or not, the fish bite the same for everybody, sweetheart, and so does my price, which is the nicest thing about both of us." },
  },

  notice = {
    { id = "n_fisher", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "Look at that casting hand, sweetheart, you've been at it a while. A bit more and you'll be ready for the big book, and the big book ain't cheap." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You talk to the water, don't ya, sweetheart? Ask it where the snapper are, would ya, and I'll split the take with you." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf, all the way down here! Your people have the patience for fishing, sweetheart, I'll give ya that, since you've had a few thousand years to practise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Myizz Luckycatch, sweetheart, and yes, that's my real name, and yes, it works. I teach anybody with two hands and a little patience how to pull supper out of the sea, and if you've only got the hands, I'll sell you the patience too." },
        { id = "h_fisher", when = { profession = { name = "Fishing", min = 1 } },
          text = "Ooh, a fisher! Let me see your knots, sweetheart, because I can tell everything about a person from their knots, and most folk who come down here tie 'em like they're angry at the line." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and you'll take to fishing like a heron to a pond, sweetheart, since it's the same trade with wetter feet. Bring your beast down by the water, it can have the heads." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! Now don't you go turnin' into a seal and stealing my students' fish, sweetheart, because it happened once and I still don't know who did it." },
        { id = "h_sunday", when = { questActive = TODO_QUEST("Master Angler") },
          text = "You're in the tournament, sweetheart, I can see it in your eyes! Go east along the coast, cast where the gulls are diving, and don't you dare whistle." },
      },
      again = {
        { id = "h_again", text = "What else, sweetheart? I've got till the tide turns." },
        { id = "h_again2", text = "Go on, ask me, but cross your fingers first. Can't hurt." },
        { id = "h_again3", text = "More questions, sweetheart? You'll make a fisher yet, you've got the curiosity." },
      },
      choices = {
        { text = "Teach me something about fishing.", next = "lesson" },
        { text = "What's all this about luck?", next = "luck" },
        { text = "Tell me about the Sunday tournament.", next = "tournament" },
        { text = "Who's the best fisher you know?", next = "best" },
        { text = "How did a goblin end up teaching patience?", next = "past" },
        { text = "I've fished a while. What comes next for me?", next = "xfisher", when = { profession = { name = "Fishing", min = 1 } } },
        { text = "I can feel the water spirits here, Myizz.", next = "xsham", when = { class = "SHAMAN" } },
        { text = "Fishing's just hunting with a longer reach.", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I'll leave you to the fish. Goodbye, Myizz.", next = "END" },
      },
    },

    -- A lesson
    lesson = {
      lines = { { id = "ls_default", text = "First lesson, sweetheart: the fish ain't stupid, they're just hungry, and the trick is to be the most interesting thing they see all day. Second lesson is don't stand where your shadow falls on the water, and the third lesson costs money." } },
      choices = {
        { text = "There must be a third lesson.", next = "lesson_third" },
        { text = "Why does the shadow matter?", next = "lesson_shadow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_shadow = {
      lines = { { id = "lsh_default", text = "Because to a fish, a shadow is a heron or a shark or a goblin with a net, and every one of those means dinner, only not theirs. Fish with the sun in your face, sweetheart, and you'll squint, but you'll eat." } },
      choices = { { text = "Sun in my face. I'll remember.", next = "BACK", fx = { affinity = 1 } } },
    },
    lesson_third = {
      big = true,
      lines = { { id = "lt_default", text = "All right, since you asked so nicely: keep the first fish you catch in a day and throw back the second, every time. Heming throws back the first one, and we've argued about it for fifteen years, sweetheart, and neither of us has ever gone hungry." } },
      choices = {
        { text = "Old customs keep the sea honest. Keep yours.", next = "BACK", reply = "That's the spirit, sweetheart, and the sea'll thank you for it. Heming laughs at me, but my nets have never once come up empty.", fx = { align = { order = 1 } } },
        { text = "I'll keep every fish that bites, thanks.", next = "BACK", reply = "Suit yourself, sweetheart, but don't come cryin' to me when the sea decides you've had your share. She keeps her own ledger, and she always collects.", fx = { align = { order = -1 } } },
        { text = "I suspect you're both right.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    -- Luck
    luck = {
      lines = { { id = "lk_default", text = "Luck's real, sweetheart, it's just lazy, and you've gotta give it reasons to stick around. Never fish on a Thursday, never step over a rod, and never, ever whistle on a dock, and the sea'll treat you like family." } },
      choices = {
        { text = "What happens if you fish on a Thursday?", next = "luck_thursday" },
        { text = "You've got a lot of charms on your fingers.", next = "luck_charms" },
        { text = "That's all just superstition, Myizz.", next = "luck_doubt" },
      },
    },
    luck_thursday = {
      lines = { { id = "lth_default", text = "My uncle fished on a Thursday, and he caught the biggest grouper anybody'd ever seen, and then it pulled him in, sweetheart, and that's the last we saw of either of 'em. Well, of him, anyway, because the grouper came back the next Thursday and took his boat." } },
      choices = { { text = "That's a terrible story, Myizz.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    luck_charms = {
      lines = { { id = "lch_default", text = "A shark's tooth, a ring off a Blackwater captain who owed me money, a tin cricket from my grandma, and this one's a pearl from the Vile Reef I'm not allowed to talk about. The tin cricket's the real luck, sweetheart, and the rest are just there to keep it company." } },
      choices = {
        { text = "A pearl you can't talk about? Now I'm curious.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Your grandmother sounds like a wise woman.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    luck_doubt = {
      big = true,
      lines = { { id = "ld_default", text = "Sure it is, sweetheart, and I've caught more fish than anybody on this dock but Heming, so you tell me which part of it isn't working. The way I see it, you can trust a habit that's fed ya for years, or you can trust somebody who just walked up and called it silly." } },
      choices = {
        { text = "A good habit is worth trusting, whatever the reason.", next = "BACK", reply = "Now you're fishin' like a pro, sweetheart. Doesn't matter if it's luck or sense, so long as it puts dinner on the line.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll trust skill, not charms. Luck is for gamblers.", next = "BACK", reply = "Fair enough for a gambler's town, sweetheart, but even the gamblers in this port carry a lucky coin. Skill catches fish, and luck decides which ones.", fx = { align = { order = -1 } } },
        { text = "I'll keep an open mind about the whistling.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- The tournament
    tournament = {
      lines = { { id = "tn_default", text = "Every Sunday afternoon, sweetheart, the Baron's man Riggle Bassbait stands on the dock and shouts until somebody brings him forty tastyfish, and whoever's first wins the prize. The whole coast goes fishing at once, the gulls go mad and the Bruisers bet on the whole thing." } },
      choices = {
        { text = "Any advice for winning it?", next = "tourn_tips" },
        { text = "Do the Bruisers bet fair?", next = "tourn_bets" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tourn_tips = {
      lines = { { id = "tt_default", text = "Find a pool nobody else has found yet, sweetheart, and get there before the shout, and don't stop for nothing, not murlocs, not pirates and definitely not pretty sunsets. Last year a gnome won it by fishing off the back of a raptor, and I still don't know how that's allowed." } },
      choices = { { text = "Off a raptor? I like that gnome.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    tourn_bets = {
      lines = { { id = "tb_default", text = "Honest as Bruisers get, sweetheart, which means they'd never fix a race, but they would stand next to the favourite and talk loudly about sharks. I bet on whoever looks the most nervous, because a nervous fisher's paying attention." } },
      choices = { { text = "That's clever reasoning, Myizz.", next = "BACK", fx = { affinity = 1 } } },
    },

    -- The best fisher
    best = {
      lines = { { id = "bt_default", text = "Nat Pagle, sweetheart, and don't you tell Heming I said so. He's a human who sits out on an island in Dustwallow Bay doing nothing but fishing, and folk say if you bring him the right catch, he'll teach you things no book in Booty Bay knows." } },
      choices = {
        { text = "Where in Dustwallow can I find him?", next = "best_pagle" },
        { text = "Better than you? I find that hard to believe.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    best_pagle = {
      lines = { { id = "bp_default", text = "South of Theramore, on a little spit of land with a tent and a lot of empty bottles, sweetheart. He's grumpy and he don't like company, but he'll talk all day to anybody who can tell a sea bass from a snapper." } },
      choices = { { text = "I'll go and find him one day.", next = "BACK" } },
    },

    -- Her past
    past = {
      lines = { { id = "pt_default", text = "I didn't start patient, sweetheart, I started in the Cartel's counting house in Gadgetzan, adding up other people's money till my eyes crossed. One day I quit, came down here, sat on this dock with a rod, and didn't move for three days, and that was the best trade I ever made." } },
      choices = {
        { text = "Do you miss the counting house?", next = "past_miss" },
        { text = "Three days without moving? I don't believe it.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    past_miss = {
      big = true,
      lines = { { id = "pm_default", text = "Not one copper of it, though I still count my students' fish faster than they can. My cousins think I've gone soft, sweetheart, but I eat every day and sleep every night, and I don't know a single one of them who can say that." } },
      choices = {
        { text = "You chose a good life. Gold isn't everything.", next = "BACK", reply = "You sound like my mother, and she was right about most things, sweetheart. I eat, I sleep and I fish, and that's a better deal than most goblins ever get.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Your cousins have a point. Gold buys good sleep too.", next = "BACK", reply = "Ha! My cousins buy good sleep and then lie awake countin' it, sweetheart. I'll keep my hammock and my fishin' line, thanks.", fx = { align = { honor = -1 } } },
        { text = "Something else, Myizz.", next = "BACK" },
      },
    },

    -- Who you are
    xfisher = {
      lines = {
        { id = "xf_default", text = "Next comes reading, sweetheart, and I mean the book Old Man Heming sells, the one about bass, which he wrote himself or says he did. Past that you'll need Nat Pagle in Dustwallow, because there's only so much a goblin on a dock can teach ya." },
      },
      choices = {
        { text = "Heming wrote a book. I'd never have guessed it.", next = "xfisher_book" },
        { text = "Thanks, Myizz. I'll keep at it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xfisher_book = {
      lines = { { id = "xfb_default", text = "He says so, sweetheart, though the handwriting in my copy looks an awful lot like Wigcik's, and Wigcik won't say a word about it. Whoever wrote it knew bass, I'll give 'em that." } },
      choices = { { text = "Now there's a mystery.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    xsham = {
      lines = { { id = "xs_default", text = "Oh, I knew it! What do they say, sweetheart, and do they mind the whistling? I've always thought the sea had moods, and now you're tellin' me it's got a whole family down there." } },
      choices = {
        { text = "They say you treat them kindly, Myizz.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "They don't care about whistling. Sorry.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xhunt = {
      lines = {
        { id = "xh_default", text = "Longer reach and a lot more sitting, sweetheart, but you've got the right idea. A beast you track, a fish you tempt, and the hunters who can switch between the two eat better than anybody in the jungle." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "Longer reach and a lot more sitting, sweetheart, but you've got the right idea. Bring {pet} by when you're practising and I'll toss it the heads, because a well-fed beast don't jump in the water after the line." },
      },
      choices = { { text = "That's sound advice, Myizz.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Fishing, sweetheart, and luck, and who on this dock is good at either. Ask me." } },
    background = { { id = "tp_bg", text = "Counting house in Gadgetzan, then a rod and a dock, and I've never looked back, sweetheart.", next = "past" } },
    advice = { { id = "tp_ad", text = "Sun in your face, line in the water, and don't whistle. That's three lessons free, sweetheart, so don't tell anybody." } },
    _none = { { id = "tp_none", text = "No idea, sweetheart, but cross your fingers and maybe somebody else'll know." } },
  },
}

------------------------------------------------------------------------
-- Grimestack: stable master, ex-Venture muleskinner, likes beasts more than people
------------------------------------------------------------------------
P:NPC {
  key = "grimestack", id = TODO_NPC("Grimestack"), name = "Grimestack", title = "Stable Master",
  bible = "bibles/booty_bay_wharf.md", role = "stablemaster", tier = "quest",
  communities = { "booty_bay" }, temper = { "gruff", "dry" }, values = { "practical", "loyal" },
  notices = { "pet", "mount", "class" },

  impression = {
    first = "He talks to the animals first, and he is kinder to them.",
    third = "{name} met Grimestack, the grimy goblin stable master of Booty Bay.",
  },

  greetings = {
    { id = "g_default", text = "Stables, boss. Mind the bucket, mind the raptor, and mind your fingers, in that order." },
    { id = "g_back", when = { metBefore = true }, text = "You again, boss. Your beasts were better company than you, but I'll take both." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, boss. I hope whatever you left in my stalls didn't notice, 'cause I did." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh, boss? Wolves bed down at the back where they can't see the horses, and that's the only rule I've got about it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That {pet} of yours has a good coat and a bad attitude, boss, which is the right way round. Feed it fish, not bread, while you're down here." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get down off that before you come any closer, boss. My stalls are for beasts that are resting, not ones that are working." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good, you'll know which end bites, boss, so I won't waste my breath tellin' ya." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grimestack, stable master, and yes, boss, the name's earned, and no, I ain't washing for nobody. I keep beasts for hunters, horses for the rich and the odd raptor for whoever paid last, and every one of 'em gets fed before I do." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and that's my kind of customer, boss, because you keep your beasts like they're family and not like they're furniture. Need a stall? I've got a dry one at the back, away from the parrots." },
        { id = "h_hunter_pet", when = { class = "HUNTER", pet = { type = "Beast" } },
          text = "A hunter, and that {pet} of yours is lookin' at my stalls like it's been here before, boss. Need a stall? I've got a dry one at the back, away from the parrots, and I'll give it the good straw." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, huh? Do me a favour, boss, and don't turn into anything while you're in my stables, because the horses lose their minds and I'm the one who has to calm 'em down." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren in my stable, and every beast in here's gone quiet, boss. Your people have a way with 'em that I'd pay good gold to learn." },
      },
      again = {
        { id = "h_again", text = "What else, boss? I've got eleven mouths to feed before dark." },
        { id = "h_again2", text = "Go on, I'm listenin'. The raptor ain't, but I am." },
        { id = "h_again3", text = "Anything else? Hand me that bucket while you think about it, boss." },
      },
      choices = {
        { text = "How did you come to keep a stable here?", next = "past" },
        { text = "You must keep all sorts of beasts here.", next = "beasts" },
        { text = "Any trouble around the stables lately?", next = "parrots" },
        { text = "Is it hard keeping animals in this heat?", next = "heat" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "How do you keep a stabled beast happy?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I could talk to your animals for you.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you have a stall for my steed?", next = "xsteed", when = { class = { "PALADIN", "WARLOCK" } } },
        { text = "I'll leave you to your beasts, Grimestack.", next = "END" },
      },
    },

    -- His past
    past = {
      lines = { { id = "pt_default", text = "I drove pack mules for the Venture Company up north, boss, hauling timber out of the jungle near the Venture camps, and I was good at it. Then a foreman whipped a mule to death on a hill for being slow, and I put him in the mud and walked down to the coast." } },
      choices = {
        { text = "You hit your foreman over a mule?", next = "past_mule" },
        { text = "The Venture Company can't have been kind to work for.", next = "past_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_mule = {
      big = true,
      lines = { { id = "pm_default", text = "I did, boss, and I'd do it again, because that mule carried more for that company than he ever did. The Venture boys put a price on my ears for a while, but the Baron don't let 'em collect on his docks, so here I am, ears and all." } },
      choices = {
        { text = "He deserved it. Cruelty to beasts is cowardice.", next = "BACK", reply = "You got that right, boss. A guy who whips a mule that's carryin' his load ain't brave, he's just stupid with a whip, and I don't miss workin' for him.", fx = { align = { light = 1 }, learn = { "venture_company" } } },
        { text = "A mule's a tool. You threw away a good job.", next = "BACK", reply = "A tool, huh? Boss, that tool carried a ton of ore up a mountain for a Venture foreman who couldn't lift his own lunch. I'll take the mule's company over yours.", fx = { align = { light = -1 }, learn = { "venture_company" } } },
        { text = "I hope your ears are safe these days.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "venture_company" } } },
      },
    },
    past_venture = {
      lines = { { id = "pv_default", text = "Good pay, boss, and they'll work ya till the pay's no use to ya. They cut the jungle down faster than it grows back, and the trolls and the panthers know it, so every camp's half lumber yard and half fort." } },
      choices = { { text = "Sounds like the jungle has reason to be angry.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    -- Beasts
    beasts = {
      lines = { { id = "bs_default", text = "Hunters' cats and wolves, a few horses for folk who came down from the north and won't admit they're seasick, and a raptor called Moody who belongs to nobody, boss. Some fella left him two years ago and never came back, so now he's mine, and he's the best guard dog in the Bay." } },
      choices = {
        { text = "Tell me about Moody.", next = "moody" },
        { text = "Horses in a jungle port? I'd never have guessed.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moody = {
      lines = { { id = "md_default", text = "He bites everybody once, boss, just to see how you take it, and then he decides if he likes ya. He likes me, he likes the Bruisers' cook and he likes one old dwarf from Ironforge who comes through every spring, and the rest of the world can take its chances." } },
      choices = {
        { text = "Can I meet him?", next = "moody_meet" },
        { text = "I'll take my chances from a distance.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    moody_meet = {
      big = true,
      lines = { { id = "mm_default", text = "If you want to lose a glove, boss, sure. Hunters always ask, and they always want to tame him, but a raptor that picked his own home ain't yours to take, and I'll fight anybody who tries." } },
      choices = {
        { text = "Right. A beast that chose its home should keep it.", next = "BACK", reply = "Glad you see it, boss. Moody's got his corner and his ribbon, and nobody's takin' either one off him while I've got the stable.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "An abandoned beast needs a proper owner and training.", next = "BACK", reply = "Proper owner, sure, boss, and he thinks that's him. You want to explain otherwise, I'll hold your gloves, but I won't hold the bandages.", fx = { align = { order = 1 } } },
        { text = "I'll leave him be, Grimestack.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    -- Parrots
    parrots = {
      lines = { { id = "pr_default", text = "There's a panther been slippin' into town at night and eating the parrots off the balconies, boss, and the Baron wants it caught before it starts on something more expensive. Everybody comes to me, like I keep panthers in my pocket." } },
      choices = {
        { text = "Have you tried to catch it?", next = "parrots_catch" },
        { text = "I could hunt it down for the Baron.", next = "parrots_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parrots_catch = {
      lines = { { id = "pc_default", text = "Set a trap with a parrot in it, boss, and the next morning the trap was empty and so was the parrot. She's smarter than half the Bruisers, which ain't saying much, but it's saying somethin'." } },
      choices = { { text = "A panther with a taste for parrots. Clever cat.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    parrots_hunt = {
      big = true,
      lines = { { id = "ph_default", text = "You could, boss, and the Baron'd thank ya, but I'd rather she was caught and carried back up the jungle than skinned on the dock. She's just a cat doin' what cats do, and it ain't her fault we hung the snacks out on balconies." } },
      choices = {
        { text = "Then I'd carry her back alive. She's done no real harm.", next = "BACK", reply = "That's a good heart, boss, and the Baron'll grumble but he'll pay. Carry her gentle, she bites when she's scared and she's always scared.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A beast that hunts in town has to die.", next = "BACK", reply = "Ain't her fault the town's built on her huntin' ground, boss. You do what you gotta, but don't expect me to come watch.", fx = { align = { light = -1 } } },
        { text = "I'll leave that to the Baron.", next = "BACK" },
      },
    },

    -- Heat
    heat = {
      lines = { { id = "ht_default", text = "Hard on the horses and the wolves, boss, easy on the cats and the raptors, which tells ya which ones belong down here. I keep wet sacks over the stalls, I water 'em three times a day, and I pull ticks till my fingers are green, which, I'll grant ya, they already were." } },
      choices = { { text = "That's a lot of work for one goblin.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    -- Customers
    customers = {
      lines = { { id = "cu_default", text = "Hunters off to Nesingwary's camp, boss, who leave their cats with me while they shoot the jungle's, which I've never found funny. And the Blackwater officers who keep horses they never ride, just so they can say they've got one." } },
      choices = {
        { text = "I can tell Nesingwary's hunters bother you.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "A horse they never ride? That's goblin money.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    -- Who you are
    xhunt = {
      lines = {
        { id = "xh_default", text = "Same as a person, boss: feed it what it likes, let it see you every day and don't leave it longer than you promised. Beasts can't read a calendar, but they know when they've been forgotten, and they don't forget it back." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "Same as a person, boss: feed it what it likes, let it see you every day and don't leave it longer than you promised. Your {pet} would tell ya the same if it could, and I'd bet it's been thinkin' it." },
      },
      choices = {
        { text = "I always come back for my companions.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Folk must leave their beasts with you a long while.", next = "xhunt_long" },
      },
    },
    xhunt_long = {
      lines = { { id = "xhl_default", text = "A week, usually, boss, and a month sometimes, and twice a year somebody just never comes back, and then I've got a cat who sits by the door. I keep 'em on for a season, and after that they go to a hunter who'll treat 'em right." } },
      choices = { { text = "That's a kindness, Grimestack.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Sure, boss, ask the big grey horse why he kicks the wall every night at midnight, 'cause it's drivin' me mad. Actually, don't, because if it's the panther, I don't wanna know." } },
      choices = { { text = "He says the panther. Sorry, Grimestack.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    xsteed = {
      lines = { { id = "xs_default", text = "Your steed? The kind you call up out of thin air? No offence, boss, but no, because the last one of those stood in my stall glowing all night and the other horses wouldn't eat. Send it back wherever it comes from and we'll stay friends." } },
      choices = { { text = "Fair. It doesn't need the straw anyway.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, boss, what they eat, what they're scared of, and who in this town treats 'em badly." } },
    background = { { id = "tp_bg", text = "Drove mules for the Venture Company. Quit with my fists. Been here since, boss.", next = "past" } },
    advice = { { id = "tp_ad", text = "Feed your beast before you feed yourself, boss. It'll remember." } },
    venture_company = { { id = "tp_venture", text = "They work the jungle and the beasts and their own crews into the ground, boss, and they call it profit." } },
    _none = { { id = "tp_none", text = "Don't know, boss. Ask the raptor, he hears more than I do." } },
  },
}

------------------------------------------------------------------------
-- Scooty: chief engineer, the transporter, and his faith in it
------------------------------------------------------------------------
P:NPC {
  key = "scooty", id = TODO_NPC("Scooty"), name = "Scooty", title = "Chief Engineer",
  bible = "bibles/booty_bay_wharf.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "eager", "quick" }, values = { "inventive", "trade" },
  notices = { "profession", "race", "class" },

  impression = {
    first = "He lists the transporter's side effects as though they were features.",
    third = "{name} met Scooty, the goblin chief engineer who runs Booty Bay's transporter to Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Hey, pal, step right up, step right up, but not on the pad, not yet, the pad's warming up!" },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's you, pal, and you've still got all your bits! See, I told everybody the pad's fine." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, pal! You didn't take the pad, did ya? 'Cause if you did, and you just got here, that's a new record." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, Alliance, I don't care, pal, the pad scrambles everybody equal, and I mean that as a selling point." },
  },

  notice = {
    { id = "n_eng", cat = "profession", when = { profession = { name = "Engineering", min = 1 } },
      text = "Hey, an engineer! You got grease on your cuffs, pal, I can smell it, and I'd shake your hand but mine's holding a live wire." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Now don't start, pal, I know what you're gonna say about the wiring, and Oglethorpe, the gnome engineer up the way, already said it, louder." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, huh? You can teleport for free, pal, I know, I know, but can you do it while eatin' a sandwich? Neither can the pad, but I'm workin' on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Scooty, chief engineer, and this here's the finest goblin transporter in the South Seas, pal, linked straight to the receiving pad in Gadgetzan. Step on, think of sand, and before you can say 'wait a minute', you're there, mostly in one piece." },
        { id = "h_eng", when = { profession = { name = "Engineering", min = 1 } },
          text = "An engineer, pal! Come here, come here, look at these coils, ain't they beautiful? Ninety-two percent arrival rate, and the other eight percent arrive too, just not where they meant to." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, and you're lookin' at my transporter like it owes ya an apology. It works, pal, it works great, it's just got opinions about where you're going." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "Oh, a mage, come to sneer at my pad, huh? Go ahead, pal, but you can't teleport to Gadgetzan, and I can, sort of." },
        { id = "h_chicken", when = { metBefore = true, chance = 0.3 },
          text = "Hey, pal, you're just in time, the last customer arrived in Gadgetzan as a chicken, but a really healthy chicken. It wore off in an hour, and he said it was very restful." },
      },
      again = {
        { id = "h_again", text = "What else, pal? The pad needs ten minutes to cool down anyway." },
        { id = "h_again2", text = "Go on, go on, ask me about the pad, everybody does." },
        { id = "h_again3", text = "Anything else? Stand a little left, pal, the pad's humming." },
      },
      choices = {
        { text = "How does the transporter work?", next = "how" },
        { text = "What exactly are the side effects?", next = "effects" },
        { text = "Who's allowed to use it?", next = "rules" },
        { text = "Why build one to Gadgetzan?", next = "why" },
        { text = "Is there any other engineer in town?", next = "oglethorpe" },
        { text = "I'm an engineer. Show me the wiring.", next = "xeng", when = { profession = { name = "Engineering", min = 1 } } },
        { text = "Gnomish engineering would make that pad safer.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Why not just ask a mage for a portal?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll walk, thanks. Goodbye, Scooty.", next = "END" },
      },
    },

    -- How it works
    how = {
      lines = { { id = "hw_default", text = "Real simple, pal: the pad takes you apart, writes ya down real small, sends the notes to Gadgetzan, and the pad over there puts ya back together from the notes. The trick is handwriting, because if the Gadgetzan pad misreads a squiggle, well, that's a side effect." } },
      choices = {
        { text = "It takes me apart? Completely?", next = "how_apart" },
        { text = "Who reads the notes in Gadgetzan?", next = "how_cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_apart = {
      lines = { { id = "ha_default", text = "Completely, pal, every last whisker, but only for a second, and you don't feel a thing, or if you do, you don't remember it, which is the same thing legally. I been through it forty times myself and I'm fine, mostly, except I can hear colours on Tuesdays." } },
      choices = { { text = "Hearing colours. I'll take your word for it.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    how_cousin = {
      lines = { { id = "hc_default", text = "My cousin Fizzik minds the Gadgetzan pad, pal, and he's a fine engineer, except for the time he went to lunch and left it on. Three caravans of sand came through to Booty Bay, and the Baron still bills me for sweeping." } },
      choices = { { text = "Sand into Booty Bay. That's almost poetic.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    -- Side effects
    effects = {
      lines = { { id = "ef_default", text = "Minor ones, pal, all minor! Some folks turn into a chicken for an hour, some folks come out with their hair on fire, and once in a while somebody arrives a little bit to the left, which in Gadgetzan means a sand dune and over here means the bay." } },
      choices = {
        { text = "Has anybody ever not arrived?", next = "effects_lost" },
        { text = "There must be one side effect worse than the rest.", next = "effects_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    effects_worst = {
      lines = { { id = "ew_default", text = "Worst one I ever saw, pal, a dwarf went in and two dwarves came out, and one of 'em was real rude. The rude one went off toward the Shimmering Flats and we never heard from him again, and the nice one tips me every spring." } },
      choices = { { text = "So there's a rude dwarf loose in Kalimdor somewhere.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    effects_lost = {
      big = true,
      lines = { { id = "el_default", text = "Not that we can prove, pal, and the waiver covers it anyway, page nine, real small print. Everybody who steps on the pad signs first, and if you sign, it's your choice, and that's the whole beauty of free trade." } },
      choices = {
        { text = "Waivers don't make it right. People should know the risk.", next = "BACK", reply = "Hey, pal, it's in the waiver, and the waiver's right there to read, nine pages, all of 'em true. Folks who skip the reading take the ride, that's science.", fx = { align = { honor = 1 } } },
        { text = "They signed. Their risk, their problem.", next = "BACK", reply = "Exactly, pal, and they get a free chicken ride half the time, so who's complaining? Page nine says it all, and nobody ever sues from Ratchet.", fx = { align = { honor = -1 } } },
        { text = "Page nine. Of course it's page nine.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- Rules
    rules = {
      lines = { { id = "ru_default", text = "Goblin engineers only, pal, by Cartel rule, because only goblin engineers understand the waiver, and frankly only goblin engineers are brave enough to sign it. Everybody else takes the boat, or the bird, or the long walk round." } },
      choices = {
        { text = "That seems unfair to everyone else.", next = "rules_fair" },
        { text = "I'd like to watch somebody use it sometime.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    rules_fair = {
      big = true,
      lines = { { id = "rf_default", text = "Unfair? Pal, it's the nicest thing we do for ya. The day the Cartel opens it up to everybody, I'll have half of Stormwind on my pad and a queue of chickens all the way to Gadgetzan." } },
      choices = {
        { text = "Rules keep people safe. Keep it closed.", next = "BACK", reply = "Thank you, pal, that's the voice of reason right there. Nobody wants to share a pad with a queue of chickens, trust me.", fx = { align = { order = 1 } } },
        { text = "Let anyone use it who's willing to sign.", next = "BACK", reply = "Sure, and then you can clean up after the chickens, pal. I like the idea, I just don't like the mess, and the Cartel likes the mess even less.", fx = { align = { order = -1 } } },
        { text = "A queue of chickens. I'd pay to see that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- Why Gadgetzan
    why = {
      lines = { { id = "wy_default", text = "'Cause the boat to Ratchet and the long road south through the Barrens takes days, pal, and days are money. Water comes up from Booty Bay, gadgets come down from Gadgetzan, and the Cartel figured it'd be cheaper to move goblins than crates." } },
      choices = {
        { text = "Do you ever send crates through?", next = "why_crates" },
        { text = "Time is money, I suppose.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    why_crates = {
      lines = { { id = "wc_default", text = "Once, pal, a crate of eggs, and they arrived as a crate of omelettes, so now it's goblins only. Goblins come out a little scrambled too, but they can still sign for themselves." } },
      choices = { { text = "I'll stick to the boat.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    -- Oglethorpe
    oglethorpe = {
      lines = { { id = "og_default", text = "Oglethorpe Obnoticus, pal, the gnome who teaches gnomish engineering up the way, and he comes down here every week to tell me my pad's a disaster. Then he takes notes, real quiet, when he thinks I ain't lookin'." } },
      choices = {
        { text = "So he's stealing your designs?", next = "ogle_steal" },
        { text = "Maybe he's right about the pad.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    ogle_steal = {
      big = true,
      lines = { { id = "os_default", text = "Stealin', borrowing, it's all the same in engineering, pal, everybody builds on everybody. I took his idea for the cooling fins, he took my idea for the waiver, and if either of us ever builds somethin' that works perfect, the other one's gonna be furious." } },
      choices = {
        { text = "Stealing ideas is still stealing. Credit him.", next = "BACK", reply = "Credit him? Pal, then I'd have to credit his teacher and his teacher's teacher, and the whole transporter'd be covered in gnome names. I'll buy him a drink, though.", fx = { align = { honor = 1 } } },
        { text = "Ideas are free, so take whatever works.", next = "BACK", reply = "That's the spirit, pal, that's engineering! You take the fins, you take the waiver, and the only thing you don't take is the blame.", fx = { align = { honor = -1 } } },
        { text = "So you two are friends, really.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    -- Who you are
    xeng = {
      lines = {
        { id = "xe_default", text = "Look here, pal, the main coil, wound by hand, every turn, and this little copper box is the part that remembers who ya are. I don't know what this big lever does, the last chief engineer put it in, and I'm scared to touch it." },
      },
      choices = {
        { text = "You don't know what the lever does?", next = "xeng_lever" },
        { text = "That's lovely work on the coil, Scooty.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xeng_lever = {
      lines = { { id = "xel_default", text = "Nobody does, pal, and the last chief engineer went through the pad one morning and never sent word, so I can't ask him. I like to think he's somewhere nice, maybe a little to the left of here." } },
      choices = { { text = "I'll leave the lever alone, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "Safer, sure, and it'd take you three weeks to calibrate and it'd talk to ya the whole time. Gnomish transporters go wherever they feel like, pal, ours just go a little to the left, and I'll take a little to the left over 'somewhere in Kalimdor' any day." } },
      choices = {
        { text = "That's not fair to gnomish engineering.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Alright, a little to the left is better.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "Mages charge by the portal, pal, and they won't go to Gadgetzan anyway, because a mage who opens a portal into a goblin town gets a bill for the landing. My pad's already paid for, mostly, and it never once asked me for reagents." } },
      choices = { { text = "Fair point about the reagents.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The pad, pal, everything about the pad, and a bit about Gadgetzan, and all the ways a goblin can come apart and go back together." } },
    background = { { id = "tp_bg", text = "Took over the pad when the last chief engineer went through it and didn't write back. Been the boss of it ever since, pal.", next = "xeng_lever" } },
    advice = { { id = "tp_ad", text = "Read the waiver, pal, all the way down to page nine, then sign it anyway, 'cause where's the fun otherwise?" } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel paid for the pad, pal, and they own the pad, and I just make sure it goes off in the right direction." } },
    _none = { { id = "tp_none", text = "No idea, pal, but I could send ya to Gadgetzan to ask somebody there." } },
  },
}

------------------------------------------------------------------------
-- The auctioneers of Booty Bay: Graves (dour), Kresky (nervy gossip), O'reely (storyteller)
------------------------------------------------------------------------
P:NPC {
  key = "bb_graves", id = TODO_NPC("Auctioneer Graves"), name = "Auctioneer Graves", title = "Auctioneer",
  bible = "bibles/booty_bay_wharf.md", role = "auctioneer", tier = "service",
  communities = { "booty_bay" }, temper = { "dour", "dry" }, values = { "practical", "honest" },
  notices = { "purse", "class" },

  impression = {
    first = "He treats drowned sailors' belongings with a respect nobody else bothers with.",
    third = "{name} met Auctioneer Graves, the gloomy goblin who sells salvage and wreck goods at the Booty Bay auction house.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Still alive, friend, and still bidding. That's the best kind of customer, and you know how rare they are in my trade." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Bid, pay the cut, and go, friend; I've handled drowned men's lots with more charm than you." },
    { id = "g_default", text = "Good day, friend, or a day, anyway. Bids are open, and the cut is what it is." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, friend. The last owners of most of my lots weren't so lucky, and that's how they became my lots." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde coin bids the same as Alliance coin here, friend. In the end it all goes to the same place, which is usually the bottom of the bay." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a heavy purse, friend. I've sold the effects of several men who carried one like it through the jungle, so keep it close." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Say a word for my lots sometime, friend, because most of 'em came from people who didn't get one." },
  },

  start = "hello",
  nodes = {
    w8_un = {
      lines = { { id = "w8_un_a", text = "They sit, friend, and then they sit a while longer, and then the Cartel sells them by the crate to the shops on the lower docks. A drowned man's boots are a hard sell, though you'd be surprised how often someone takes them in the end." } },
      choices = {
        { text = "Who would buy a drowned man's boots?", next = "w8_un2" },
        { text = "That's a grim way to stock a shop.", next = "w8_un2" },
        { text = "Every lot sells eventually. That's the Cartel way.", next = "w8_un2", when = { race = "Goblin" } },
        { text = "Something else, Graves.", next = "BACK" },
      },
    },
    w8_un2 = {
      lines = {
        { id = "w8_un2_a", text = "New arrivals off the Ratchet boat, mostly, who came south with nothing and mean to go up the jungle road tomorrow. I sell them the boots and I don't tell them where they came from, friend, and some of them come back to sell them to me again." },
        { id = "w8_un2_gob", when = { race = "Goblin" }, text = "You know the house well, friend. Everything sells, and everything comes back, and the Cartel takes a cut each way, which is as close to a religion as this bay has." },
      },
      choices = {
        { text = "And some of them don't come back at all.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    d6_odd = {
      lines = { { id = "d6_odd_a", text = "A ship's figurehead, friend, a mermaid with half her face gone, pulled off the reef after a storm. It sat behind the counter for thirty days and watched me while I worked, and I'll admit I didn't mind the company." } },
      choices = {
        { text = "Who bought a mermaid with half a face?", next = "d6_odd2" },
        { text = "You sound sorry to see her go.", next = "d6_odd2" },
        { text = "Something else, Graves.", next = "BACK" },
      },
    },
    d6_odd2 = {
      lines = { { id = "d6_odd2_a", text = "An orc captain, of all people, who said a ship without a face gets lost at sea. He paid twice what she was worth and didn't haggle, which made him the most sentimental buyer I've had in eleven years." } },
      choices = {
        { text = "Does anyone ever come back for their things?", next = "d6_odd3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d6_odd3 = {
      lines = { { id = "d6_odd3_a", text = "Widows, sometimes, after the thirty days are up, and they find out what the Cartel thinks a wedding ring is worth. I tell them the price and then I tell them the next bid closes slowly, and they usually understand me, friend." } },
      choices = {
        { text = "That's kinder than the Cartel would like.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d6_peace = {
      lines = { { id = "d6_peace_a", text = "They stand at the door and they're paid by the Baron to look bored, friend, which they're very good at. Nobody draws steel in Booty Bay's auction house, because the Bruisers remember faces and the Baron remembers debts." } },
      choices = {
        { text = "Has nobody ever tried?", next = "d6_peace2" },
        { text = "Does Stormwind coin spend the same as Horde gold?", next = "d6_peace2", when = { faction = "Alliance" } },
        { text = "Something else, Graves.", next = "BACK" },
      },
    },
    d6_peace2 = {
      lines = {
        { id = "d6_peace2_a", text = "Once, a dwarf and an orc over a mace that neither of them could afford. The Bruisers carried them both out and the Cartel fined them both, and the mace sold the next week to a gnome who'd been standing behind them the whole time." },
        { id = "d6_peace2_ally", when = { faction = "Alliance" }, text = "Gold is gold, friend, and the scales don't know whose face is stamped on it. The Cartel takes its cut in whatever you bring and changes it on the boardwalk, and the money-changers take a cut of their own, which is how this town stays standing." },
      },
      choices = {
        { text = "The Cartel profits whichever side wins.", next = "d6_peace3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d6_peace3 = {
      lines = { { id = "d6_peace3_a", text = "The Cartel profits whether anyone wins or not, friend, and that's the whole trick of it. Wars end and kings die, but somebody always has to sell what's left behind, and that somebody is usually standing behind this counter." } },
      choices = {
        { text = "A grim way to see the world.", next = "BACK", fx = { learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Auctioneer Graves, friend, and before you ask, yes, the name's always been funny to everybody but me. Booty Bay's auction house is open to both sides, the deposit's steeper than in the capitals, and the Cartel's cut is steeper again, so think before you post." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue at the auction house, friend, which always makes me check my ledger twice. Most of what you lot post was somebody else's last week, and I don't ask, but I do notice." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? The bids won't close themselves, though they do close eventually, like everything." },
        { id = "h_again2", text = "Go on, friend. I'm in no hurry. Nobody in my line ever is." },
      },
      choices = {
        { text = "Why is the cut so steep here?", next = "cut" },
        { text = "Where do your lots come from?", next = "salvage" },
        { text = "You look gloomy, Graves.", next = "gloom" },
        { text = "What's the oddest lot you've ever sold?", next = "d6_odd" },
        { text = "Do the Bruisers keep the peace in here?", next = "d6_peace" },
        { text = "What happens to the lots nobody bids on?", next = "w8_un" },
        { text = "Nothing today. Good day, Graves.", next = "END" },
      },
    },
    cut = {
      lines = { { id = "ct_default", text = "Because you're selling to both sides of a war, friend, and the Cartel figures that's worth paying for. In Stormwind or Orgrimmar you sell to your own, and here you can sell a dwarf's axe to an orc, which is a service, and services cost." } },
      choices = {
        { text = "Fair, I suppose. Neutral ground has a price.", next = "BACK", fx = { learn = { "steamwheedle" } } },
        { text = "Sounds like robbery with a ledger.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    salvage = {
      lines = { { id = "sv_default", text = "Wrecks, mostly, friend, from the Cape and the reefs, and the belongings of folk who went up the jungle road and didn't come down again. The Bruisers bring me what they find, I write down where it came from, and I sell it for a fair price, which is the last kindness anybody can do for the dead." } },
      choices = {
        { text = "Do the families ever claim anything?", next = "salvage_claim" },
        { text = "Selling dead men's goods seems grim.", next = "salvage_claim" },
      },
    },
    salvage_claim = {
      big = true,
      lines = { { id = "sc_default", text = "I hold every lot thirty days before it goes up, friend, in case someone comes asking, and in eleven years four people have. The Cartel calls that waste, and I call it manners, and since I'm the one holding the key, manners win." } },
      choices = {
        { text = "Thirty days is decent of you. Keep doing it.", next = "BACK", reply = "Decent, friend, and expensive, as the Cartel likes to remind me. Four in eleven years is four I'd not want on my conscience, so the shelf stays.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The dead don't need their things. Sell them sooner.", next = "BACK", reply = "They don't, and neither does the Cartel's ledger, but the widows sometimes do. I'll keep my thirty days and my sleep, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else, Graves.", next = "BACK" },
      },
    },
    gloom = {
      lines = { { id = "gl_default", text = "I'm not gloomy, friend, I'm accurate, and in Booty Bay that comes out sounding the same. Kresky over there gets the gossip and O'reely gets the laughs, and I get the lots nobody else wants to handle, and somebody has to." } },
      choices = {
        { text = "What do you make of Kresky and O'reely?", next = "others" },
        { text = "Somebody has to, and I respect that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    others = {
      lines = { { id = "ot_default", text = "Kresky knows everything about everybody and can't keep any of it, friend, and O'reely tells stories about his grandfather that get longer every year. They're good auctioneers, both of 'em, and they think I'm a ghost, and we get along fine." } },
      choices = { { text = "A ghost who balances the books.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Lots, deposits, wrecks, and who didn't come back from the jungle, friend. Ask." } },
    background = { { id = "tp_bg", text = "Eleven years at this counter, friend, selling what the sea and the jungle leave behind.", next = "salvage" } },
    advice = { { id = "tp_ad", text = "Post it for the long duration, friend. People bid late, and they bid foolish." } },
    _none = { { id = "tp_none", text = "Not in my ledger, friend, and if it's not in my ledger, it's not my business." } },
  },
}

P:NPC {
  key = "bb_kresky", id = TODO_NPC("Auctioneer Kresky"), name = "Auctioneer Kresky", title = "Auctioneer",
  bible = "bibles/booty_bay_wharf.md", role = "auctioneer", tier = "service",
  communities = { "booty_bay" }, temper = { "nervy", "quick" }, values = { "trade", "curious" },
  notices = { "purse", "race" },

  impression = {
    first = "He seems delighted and frightened by everything at once.",
    third = "{name} met Auctioneer Kresky, the jittery, gossiping goblin auctioneer of Booty Bay.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Chief, my favourite chief! Sit down, sit down, I got three bits of gossip and one of 'em's even true." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you, chief. I ain't sayin' nothin' to ya tonight, 'cause everybody says you're bad for my reputation." },
    { id = "g_default", text = "Hey, hey, chief, come in, quick, quick, before somebody outbids ya on somethin' you didn't even know you wanted!" },
    { id = "g_back", when = { metBefore = true }, text = "Chief! You're back! Listen, listen, you'll never guess who bought a wedding ring last night." },
    { id = "g_word", when = { word = { "angered", "caughtLying" } }, text = "Chief, word is you made somebody in town real mad. I ain't sayin' who told me, but it was everybody." },
  },

  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Oof, chief, you're runnin' light. Don't worry, I won't tell anybody, except maybe Graves, and he don't talk to nobody." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You folks always buy the weird stuff, chief, the springs and the gears and the broken clocks, and I love ya for it." },
  },

  start = "hello",
  nodes = {
    w8_sea = {
      lines = { { id = "w8_sea_a", text = "Oh, oh, chief, you didn't hear it from me, but Fleet Master Seahorn's people have been buyin' every Bloodsail chart that turns up, every one, top bid, no haggling. Somebody up in the Baron's tower wants to know where those pirates sleep, and it ain't for a social call." } },
      choices = {
        { text = "Why would Seahorn want their charts?", next = "w8_sea2" },
        { text = "You'll get yourself killed talking like that.", next = "w8_sea2" },
        { text = "A rogue could fetch those charts cheaper.", next = "w8_sea2", when = { class = "ROGUE" } },
        { text = "Something else, Kresky.", next = "BACK" },
      },
    },
    w8_sea2 = {
      lines = {
        { id = "w8_sea2_a", text = "'Cause the Bloodsail want the Baron dead and the bay for themselves, chief, everybody knows it, and Seahorn means to hit 'em first. If you're lookin' for work and you don't mind pirates shootin' at ya, he's up the tower near the Baron, and he pays real coin." },
        { id = "w8_sea2_rogue", when = { class = "ROGUE" }, text = "Cheaper, sure, and quieter, and then I lose my cut, chief, so let's pretend you didn't say that. But if you're the sort who slips aboard a Bloodsail ship at night, Seahorn up the tower would love to meet you, and I never said a word." },
      },
      choices = {
        { text = "I'll go and see Seahorn.", next = "BACK" },
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kresky, auctioneer, night shift mostly, chief, 'cause that's when the interesting stuff gets posted. You want to know who's selling, who's buying and who's broke, I'm your goblin, and I'm also, technically, the guy who runs your bids." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night shift, chief, my favourite! This is when the pirates post their loot and the captains post their debts, and I see all of it, and I remember all of it, and I tell all of it." },
      },
      again = {
        { id = "h_again", text = "What else, chief, what else? I got news, I got rumours, I got bids." },
        { id = "h_again2", text = "Go on, go on, I'm listenin', I'm always listenin', it's a problem." },
      },
      choices = {
        { text = "What's the gossip tonight?", next = "gossip" },
        { text = "Some things must sell better than others in Booty Bay.", next = "sells" },
        { text = "Why do you work the night shift?", next = "night" },
        { text = "So the Horde bids in the same house as me?", next = "factions" },
        { text = "You look like you're scared of half of what you know.", next = "scared" },
        { text = "Any hot goods come through that nobody asks about?", next = "hot", when = { class = "ROGUE" } },
        { text = "What's the weirdest gear a gnome ever bought here?", next = "gnome", when = { race = "Gnome" } },
        { text = "Who's bidding against the Bloodsail these days?", next = "w8_sea" },
        { text = "I'm not here to chat. Goodbye, Kresky.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "Right, right, so a Blackwater bosun posted a Bloodsail captain's spyglass, but it's got a Stormwind maker's mark, chief, which means somebody stole it twice. And somebody's been buyin' up every bolt of red cloth in the house, and red cloth's only good for one thing on this coast." } },
      choices = {
        { text = "Red cloth? Someone's making Bloodsail sashes?", next = "gossip_red" },
        { text = "You shouldn't spread other people's business.", next = "gossip_red" },
        { text = "Tell me about this spyglass.", next = "spyglass" },
      },
    },
    spyglass = {
      lines = { { id = "sp_default", text = "Okay, okay, so it's brass, Stormwind make, with a little anchor scratched by the eyepiece, chief, which is a navy thing. So some Stormwind officer lost it to the Bloodsail, and the Bloodsail lost it to the Blackwater, and now it's sittin' in my house with a reserve price of four gold." } },
      choices = {
        { text = "Shouldn't it go back to the Stormwind navy?", next = "spyglass_back" },
        { text = "Something else, Kresky.", next = "BACK" },
      },
    },
    spyglass_back = {
      lines = { { id = "spb_default", text = "Back? Chief, chief, this is Booty Bay, nothin' goes back, it goes forward, to the highest bidder, minus the Cartel's cut. If the navy wants it, the navy can bid like everybody else, and between you and me, they'd probably win, 'cause nobody else wants a spyglass that's been stolen twice." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    factions = {
      lines = { { id = "fa_default", text = "Same house, same counter, same Cartel cut, chief, just a steeper deposit, 'cause the Cartel don't care whose gold it is so long as it's gold. Orc posts an axe, human buys it, nobody has to look anybody in the eye, and that's the beauty of the trade." } },
      choices = {
        { text = "Trading with the enemy? That's a disgrace.", next = "BACK", fx = { align = { order = 1 } },
          reply = "Disgrace, sure, chief, but a profitable one, and you're still standin' at my counter." },
        { text = "Gold doesn't care about banners. Good for the Cartel.", next = "BACK", fx = { align = { order = -1 } },
          reply = "Now you're talkin' like a goblin, chief! I'd hug ya but I'm busy." },
        { text = "Something else.", next = "BACK" },
      },
    },

    scared = {
      lines = { { id = "sc_default", text = "Half? Chief, I'm scared of all of it, listen, listen, you know what happens to a goblin who knows too much in this town? He gets a real nice offer of a long sea voyage, and nobody ever sees him come back from it." } },
      choices = {
        { text = "Then why keep listening?", next = "sc_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sc_why = {
      lines = { { id = "scw_default", text = "'Cause knowin' stuff is the only thing I'm good at, chief, and it pays, a little. Baron Revilgaz knows I listen, and as long as I tell his Bruisers the important bits first, he lets me keep my ears, and I'm real attached to my ears." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "revilgaz" } } } },
    },

    hot = {
      lines = { { id = "ho_default", text = "Hot? Chief, nothin' in my house is hot, it's all very properly owned by whoever's sellin' it, as of about ten minutes before they post it. Just don't buy anything with a Bloodsail mark, 'cause they come lookin' for their stuff and they ain't polite." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gnome = {
      lines = { { id = "gn_default", text = "Oh, oh, a fella bought forty pounds of copper tubing and a stuffed parrot, chief, same bid, and when I asked him why he just said 'calibration'. I still think about it, honest, I think about it every night." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gossip_red = {
      big = true,
      lines = { { id = "gr_default", text = "Could be sashes, chief, could be curtains, and I can't see the buyer's name, only the bids, and they come in through three different runners. I could tell the Bruisers, but then they'd know I've been readin' the runners' faces, and that's bad for business." } },
      choices = {
        { text = "Tell the Bruisers. The town's safety comes first.", next = "BACK", reply = "Tell the Bruisers? Chief, a broker who talks don't stay a broker long, but a town that burns don't need brokers neither. Okay, okay, I'll think about it, all right?", fx = { align = { order = 1 }, learn = { "bloodsail" } } },
        { text = "Keep quiet. A broker shouldn't snitch on bidders.", next = "BACK", reply = "Thanks, chief, that's what my gut says too. Bidders trust me 'cause I keep my lips sewn, and lips are my livelihood.", fx = { align = { order = -1 }, learn = { "bloodsail" } } },
        { text = "Maybe they just like red curtains.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    sells = {
      lines = { { id = "sl_default", text = "Silk and spices go fast, chief, and anything from the jungle trolls, 'cause the collectors in Stormwind and Undercity both want 'em. Tigers' fangs, panther pelts, voodoo junk, it all goes north for three times what I sell it for, and I don't think about that too much." } },
      choices = {
        { text = "Selling sacred troll things sits badly with me.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Good to know what's worth gathering.", next = "BACK", fx = { trait = { greedy = 1 } } },
      },
    },
    night = {
      lines = { { id = "nt_default", text = "Can't sleep, chief, never could, my mother said I was born talkin' and never stopped. O'reely does the mornings and tells his stories, Graves does the afternoons and scares the customers, and I do the nights, which is when everybody gets honest, 'cause they're tired or drunk." } },
      choices = { { text = "Some folk are just born talking.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everything, chief, or close to it, and if I don't know it now I'll know it by midnight." } },
    background = { { id = "tp_bg", text = "Been runnin' the night bids for six years, chief, and I've slept maybe a week of it." } },
    advice = { { id = "tp_ad", text = "Post your stuff at night, chief, when the pirates are drunk and generous." } },
    bloodsail = { { id = "tp_blood", text = "Somebody's buyin' red cloth by the bolt, chief, and I'm just sayin', that's somethin'." } },
    revilgaz = { { id = "tp_revilgaz", text = "The Baron lets me keep my ears, chief, so long as his Bruisers hear the important bits first." } },
    graves = { { id = "tp_graves", text = "He does the afternoons, chief, and scares the customers, but he's a real nice guy if you like quiet." } },
    _none = { { id = "tp_none", text = "Don't know, chief, which is real embarrassing, so don't tell anybody." } },
  },
}

P:NPC {
  key = "bb_oreely", id = TODO_NPC("Auctioneer O'reely"), name = "Auctioneer O'reely", title = "Auctioneer",
  bible = "bibles/booty_bay_wharf.md", role = "auctioneer", tier = "service",
  communities = { "booty_bay" }, temper = { "showy", "warm" }, values = { "trade", "proud" },
  notices = { "purse", "class" },

  impression = {
    first = "His grandfather's story changes every time he tells it.",
    third = "{name} met Auctioneer O'reely, the boisterous goblin auctioneer who tells tall tales over the Booty Bay bids.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Champ, the champ of champs, back at my counter! Grandpa O'reely would've auctioned your autograph, I swear it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you, champ. The bids are open, but the romance is closed for the evening." },
    { id = "g_default", text = "Ah, champ, welcome, welcome to the finest auction house south of anywhere! What're we buyin', what're we sellin', what're we dreamin' of?" },
    { id = "g_back", when = { metBefore = true }, text = "Champ! Back for more, I knew it, I knew it, nobody leaves O'reely's counter for long." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, champ, and the bids got dull without ya. Graves tried to tell a joke, and it was awful." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that's a purse with ambition, champ! My granddad used to say a heavy purse is just a bid waiting to happen." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Champ, I got an axe in the back that once belonged to a famous ogre, and I'll tell ya the story for free." },
  },

  start = "hello",
  nodes = {
    w8_ar = {
      lines = { { id = "w8_ar_a", text = "Does it, champ! Every time Short John drops that chest in the pit, somebody fights their way to it, and somebody else stabs 'em on the way out, and the winner comes straight to O'reely to sell the prize. Blood on the lot, champ, and the bids go through the roof." } },
      choices = {
        { text = "Why does blood make the bids go up?", next = "w8_ar2" },
        { text = "I'd sooner win the chest than buy it.", next = "w8_ar2" },
        { text = "I've fought in that pit myself.", next = "w8_ar2", when = { class = "WARRIOR" } },
        { text = "Something else, O'reely.", next = "BACK" },
      },
    },
    w8_ar2 = {
      lines = {
        { id = "w8_ar2_a", text = "'Cause it's a story, champ, and a story's worth more than steel any day. Grandpa O'reely used to say a sword's just a sword until somebody died for it, and then it's an heirloom, and heirlooms sell at a premium." },
        { id = "w8_ar2_war", when = { class = "WARRIOR" }, text = "Have you, champ! Then next time you come out of that pit with the chest, come straight here, still bleedin' if you can manage it, and I'll tell the whole room how you won it. That's worth a few extra bids, I promise ya." },
      },
      choices = {
        { text = "Your grandfather sounds like quite a goblin.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "O'reely, champ, auctioneer and grandson of the great O'reely, who once auctioned an entire ship off the end of a pier with the crew still aboard and singing. I do the morning bids, and I like to think I bring a little romance to the trade." },
        { id = "h_bard", when = { class = { "WARRIOR", "PALADIN" } },
          text = "A fighter, champ, and you've got stories in ya, I can tell. Sell me one sometime, I'll put it up for auction, and we'll split the take." },
      },
      again = {
        { id = "h_again", text = "What else, champ? I got stories and I got bids, and I'm better at the stories." },
        { id = "h_again2", text = "Go on, champ, ask away, the morning's young and so am I, almost." },
      },
      choices = {
        { text = "Tell me about your grandfather.", next = "granddad" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "You must have a secret to a good auction.", next = "secret" },
        { text = "What's up for bid this morning?", next = "lots" },
        { text = "You and Graves can't be much alike.", next = "graves" },
        { text = "Tell me about this famous ogre's axe.", next = "axe", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Got anything from the old dwarven holds?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Does anything from the Gurubashi Arena come across your counter?", next = "w8_ar" },
        { text = "I've heard enough stories. Goodbye, O'reely.", next = "END" },
      },
    },
    granddad = {
      lines = { { id = "gd_default", text = "The great O'reely, champ, who sold a ship with the crew aboard, though in some tellings it was two ships, and in my favourite telling the crew bid on themselves and won. He's the reason I'm in this trade, and also the reason my family still owes the Cartel for a ship." } },
      choices = {
        { text = "Is any of that true?", next = "granddad_true" },
        { text = "Your family still owes the Cartel for a ship?", next = "debt" },
        { text = "The crew bought themselves? I love it.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },
    debt = {
      lines = { { id = "de_default", text = "Every copper of it, champ, plus interest, plus the interest on the interest, which the Cartel's accountants call 'heritage'. My dad paid on it, I pay on it, and some day my kid'll pay on it, and that's what I call a family business." } },
      choices = {
        { text = "Why did the Cartel make you pay for it?", next = "debt_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_why = {
      lines = { { id = "dw_default", text = "'Cause it turned out the ship wasn't granddad's to sell, champ, it belonged to a trade prince's cousin, and the crew he sold were the cousin's crew. Granddad said it was a misunderstandin', and the Cartel said it was a ship, and the Cartel won." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    lots = {
      lines = { { id = "lo_default", text = "Ah, champ, what a mornin'! A cutlass pulled out of a shark off the Wild Shore, a crate of Gadgetzan water nobody can explain, and a troll mask from the jungle that I'm told stares back at ya. I'm givin' the mask a story about a cursed king, just a small one." } },
      choices = {
        { text = "Was the cutlass really in a shark?", next = "lo_shark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lo_shark = {
      lines = { { id = "los_default", text = "It was in a fisherman's net next to a shark, champ, which is near enough a shark that I can say it with a straight face. Who's to say the shark didn't swallow it and cough it up? Not me, and not the next owner, if I've done my job." } },
      choices = {
        { text = "That's lying, O'reely. Tell bidders the truth.", next = "BACK", fx = { align = { light = 1 } },
          reply = "The truth, champ? The truth is a fisherman's net. Nobody bids on a net." },
        { text = "Every merchant dresses up his wares. No harm done.", next = "BACK", fx = { align = { light = -1 } },
          reply = "My kinda customer! Granddad would've loved ya." },
        { text = "Something else.", next = "BACK" },
      },
    },

    graves = {
      lines = { { id = "gr_default", text = "Ha! Graves is the best auctioneer in this town and the worst company, champ, and I mean that with love. He reads every lot like it's a eulogy, and the thing is, the bidders trust him more than me, which hurts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    axe = {
      lines = { { id = "ax_default", text = "It's big and double-bladed, champ, and chipped on one side from the night an ogre mage up at the Mosh'Ogg mound fought three heroes at once with it. Or it fell off a cart in Grom'gol, I forget which story I'm usin' this week." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    dwarf = {
      lines = { { id = "dw2_default", text = "Do I, champ! Bits of carved stone, an old rune-plate, and a helm the seller swore came from Uldaman, which means it came from somebody who heard of Uldaman. Your folk always outbid everybody on the old stuff, and I love ya for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    granddad_true = {
      big = true,
      lines = { { id = "gt_default", text = "Some of it, champ, and the parts that aren't true are the parts people remember, so what's the difference? Graves says a ledger's the only honest story, and I say a ledger never made anybody bid an extra gold." } },
      choices = {
        { text = "Graves is right. Honest records matter more than tales.", next = "BACK", reply = "Graves'd hug you for that, champ, if Graves ever hugged anybody. But nobody ever bought a ledger for the story in it.", fx = { align = { honor = 1 } } },
        { text = "A good story sells. Stretch it all you like.", next = "BACK", reply = "Now that's the spirit, champ! Granddad had a story for every lot, and the bids went up every time he told one.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else, O'reely.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "sg_default", text = "A wooden leg, champ, from a Blackwater captain who wanted to buy himself a better one, and the bidding went to eleven gold because somebody started a rumour it was lucky. It wasn't lucky, the next owner fell off the pier, but he fell off very stylishly." } },
      choices = { { text = "I'd wager that rumour was yours, O'reely.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    secret = {
      lines = { { id = "sc_default", text = "Every lot has a story, champ, and if it don't, you give it one, nothing too big, just enough. A plain old sword's a sword, but a sword found on a beach after a storm, now that's somethin' a person wants to hang on their wall." } },
      choices = {
        { text = "So you invent stories for ordinary goods.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "That's a showman's trick. I like it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Auctions, champ, and stories, and the stories behind the auctions, which are the best kind." } },
    background = { { id = "tp_bg", text = "Third O'reely to work a counter, champ, and the first one without a ship debt of his own.", next = "granddad" } },
    advice = { { id = "tp_ad", text = "Give your lot a good story, champ, and keep the price just high enough to be believed." } },
    graves = { { id = "tp_graves", text = "Best auctioneer in town and the worst company, champ, and I mean that with love." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "My family's been payin' them for granddad's ship for three generations, champ." } },
    _none = { { id = "tp_none", text = "Never heard of it, champ, but give me a minute and I'll have a story about it." } },
  },
}
