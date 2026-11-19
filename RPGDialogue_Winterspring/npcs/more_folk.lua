-- More of Winterspring: Bronn Fitzwrench, the goblin outside Everlook who lets those in the Cartel's bad books
-- buy their way back with runecloth and coal (Making Amends). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bronn Fitzwrench
---------------------------------------------------------------------------
P:NPC {
  key = "bronn", id = TODO_NPC("Bronn Fitzwrench"), name = "Bronn Fitzwrench",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "brisk", "shrewd" }, values = { "profit", "practical" },
  notices = { "reputation", "craft" },
  impression = {
    first = "He is entirely unembarrassed about putting a price on redemption.",
    third = "{name} met Bronn Fitzwrench, the goblin outside Everlook who sells the Cartel's forgiveness for runecloth and coal.",
  },
  greetings = {
    { id = "g_default", text = "What can I do for ya, pal? Make it quick, I don't have all day, and my toes are gettin' frostbit standing here." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Either you're back to settle up, or you did somethin' else bad, and either way I'm listening." },
    { id = "g_active", when = { questActive = TODO_QUEST("Making Amends") }, text = "Runecloth and coal, chum, that's the price. Bring it and we'll talk about your good name." },
    { id = "g_done", when = { questDone = TODO_QUEST("Making Amends") }, text = "Look at you, on the quick path to redemption! Keep the payments comin' and the town'll forget all about it." },
  },
  notice = {
    { id = "n_hated", cat = "reputation", when = { reputation = { faction = "Everlook", max = "unfriendly" } },
      text = "Whoa, whoa, the guards were pointin' at you when you came up the road. Whatever you did to us or our friends, it was bad, and I'm the fella who can fix it." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! You've got runecloth comin' out of your ears, I bet, and I happen to be in the market for exactly that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bronn Fitzwrench, at your service, for a price. Folks who've crossed the Cartel come to me when Everlook won't let 'em through the gate, and I give 'em a way back into our good graces." },
        { id = "h_hated", when = { reputation = { faction = "Everlook", max = "unfriendly" } },
          text = "You must've done somethin' really bad to us or our friends, pal, and I don't wanna know what. At any rate, I'm here to offer you a way back, and it's a good deal, I promise." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Making Amends") },
          text = "Every bundle you bring warms a few goblin toes and cools a few goblin tempers, and that's what I call a healthy return. Booty Bay and Gadgetzan hear about it too, ya know." },
      },
      again = {
        { id = "h_again", text = "What else? Time's money, and my feet are ice." },
        { id = "h_again2", text = "Go on, go on, I'm listenin'. Talk fast, though." },
      },
      choices = {
        { text = "What do you want from me?", next = "price" },
        { text = "Why runecloth and coal?", next = "cold" },
        { text = "So forgiveness is for sale?", next = "forgive" },
        { text = "Who's going to be cross about it?", next = "enemies" },
        { text = "I've done nothing to the Cartel.", next = "innocent", when = { reputation = { faction = "Everlook", min = "friendly" } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    price = {
      lines = { { id = "pr_default", text = "Runecloth, a nice thick bundle of it, and four lumps of coal, and I put in a good word for you with Everlook. Do it enough times and you're right back in good standing, no questions asked, no hard feelings, or at least fewer of 'em." } },
      choices = {
        { text = "How many times is enough?", next = "times" },
        { text = "Something else.", next = "BACK" },
      },
    },
    times = {
      lines = { { id = "ti_default", text = "Depends how bad you were, pal. Some folks come by once and they're square, and some folks I've seen so often I've started savin' 'em a chair. I'm not judging, I'm keeping books." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cold = {
      lines = { { id = "co_default", text = "Have you felt this place? Winterspring's cold enough to freeze the gears in your pocket watch, and most of us goblins came up here from Booty Bay and Gadgetzan where it's nice and toasty. We need blankets and we need fires, and you're gonna help." } },
      choices = {
        { text = "Why not just go back south?", next = "south" },
        { text = "Something else.", next = "BACK" },
      },
    },
    south = {
      lines = { { id = "so_default", text = "And leave Everlook? There's money up here, chum, furs and ore and every adventurer between here and the Plaguelands passing through with full pockets. A goblin'll put up with a lot of frostbite for a good margin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgive = {
      big = true,
      lines = { { id = "fo_default", text = "Course it is, everything's for sale, and forgiveness is a lot cheaper than a feud. You pay, we forget, everybody goes back to business, and nobody gets stabbed in an alley. What's wrong with that?" } },
      choices = {
        { text = "Nothing. Paying your debts is how it should work.", next = "BACK", reply = "Now there's a customer with sense! Bring me the goods and we'll call it square.", fx = { align = { honor = 1 } } },
        { text = "Bought forgiveness isn't worth much. I'll keep my grudge.", next = "BACK", reply = "Suit yourself, pal, but grudges don't buy you a bed in Everlook. Offer stands when you get cold.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = { { id = "en_default", text = "Our enemies, that's who, and the Cartel's got a few. Pirates, mostly, and other folks who don't like it when somebody's helpin' the goblins, so be warned, helpin' us won't make you popular with them." } },
      choices = {
        { text = "I can live with pirates being cross.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    innocent = {
      lines = { { id = "in_default", text = "Then what're you botherin' me for? Go on into Everlook and spend your money like a respectable customer, and if you ever do knock over a Cartel caravan, you know where to find me." } },
      choices = {
        { text = "I'll keep it in mind.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fix reputations, pal. Somebody's gotta, and it pays better than fixin' wagons." } },
    advice = { { id = "tp_ad", text = "Don't cross the Cartel, but if you do, come and see me." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if I can't sell it, I don't wanna." } },
  },
}

---------------------------------------------------------------------------
-- Nixxrak (Everlook, heavy armor)
---------------------------------------------------------------------------
P:NPC {
  key = "nixxrak", id = TODO_NPC("Nixxrak"), name = "Nixxrak", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "loud", "hearty" }, values = { "greedy", "proud" },
  notices = { "kit", "class" },
  impression = {
    first = "Nixxrak sells mail and plate in Everlook and thumps each piece as he names its price. He considers the cold his best salesman, since nobody haggles for long with numb fingers.",
    third = "{name} met Nixxrak, the heavy armor merchant of Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Get in here and shut that door, pal! Plate and mail, lined for the cold, and every piece guaranteed not to freeze to ya, mostly." },
    { id = "g_2", when = { metBefore = true }, text = "Back for more, buddy? Good, good. What'd the yetis break this time?" },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's a set of shoulders made for plate! Friend, come and stand next to the big stuff and let me do the arithmetic." },
    { id = "n_2", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Cloth, in this weather? Pal, my cousin Blixxrak's across the way, and he'll sell ya something that at least keeps the wind off." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Nixxrak, heavy armor, the heaviest north of Felwood! Everything that lives up here has claws, pal, the bears and the owlkin and the big blue dragonkin, and I'm the fella standing between you and all of 'em, for a price." },
        { id = "hello_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "A plate wearer, in Winterspring! Friend, you're gonna need the fur lining, and I ain't just saying that because it costs extra, though it does." },
      },
      again = {
        { id = "hello_again1", text = "What else, pal? Talk fast, the forge's the only warm spot and I'm standing in it." },
        { id = "hello_again2", text = "Go on, buddy. I got time, and you got coin, so we'll get along." },
        { id = "hello_again3", text = "Ask! Just don't ask for a discount." },
      },
      choices = {
        { text = "Show me the heavy stuff.", next = "BUSINESS" },
        { text = "How do you keep plate from freezing to the skin?", next = "freeze" },
        { text = "You, Blixxrak and Wixxrak share half a name.", next = "cousins" },
        { text = "Armor's a crutch. A good fighter doesn't get hit.", next = "crutch" },
        { text = "What's out there that can crack plate?", next = "crack", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } } },
        { text = "Who forges your stock?", next = "forges", when = { profession = "Blacksmithing" } },
        { text = "Stay warm, Nixxrak.", next = "END" },
      },
    },
    freeze = {
      lines = {
        { id = "freeze_default", text = "Fur on the inside and goose grease on the joints, pal. First winter I skipped the grease, and a customer came back with his own gauntlet stuck to his face. I refunded him, which shows ya how bad it was." },
      },
      choices = {
        { text = "You gave a refund?", next = "freeze_refund" },
        { text = "Something else.", next = "BACK" },
      },
    },
    freeze_refund = {
      lines = {
        { id = "freeze_refund_default", text = "Once! One time, and I still wake up sweating about it. But the fella had a gauntlet on his face, friend, and even the Cartel's got limits." },
      },
      choices = {
        { text = "That's nearly decent of you.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousins = {
      lines = {
        { id = "cousins_default", text = "Cousins, pal, all three of us. Wixxrak took weapons, Blixxrak took the light stuff, and I took the heavy stuff, on account of I'm the one who can lift it. We drew straws, and I'm pretty sure Wixxrak cheated." },
      },
      choices = {
        { text = "Do the three of you get along?", next = "cousins_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousins_along = {
      lines = {
        { id = "cousins_along_default", text = "Like family, which means we argue about money every night and then eat at the same table. The rule is that nobody undercuts a cousin, and anybody else in Everlook is fair game." },
      },
      choices = {
        { text = "And if someone breaks the rule?", next = "cousins_rule" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousins_rule = {
      lines = {
        { id = "cousins_rule_default", text = "Blixxrak ran a sale on leather helmets once without telling us. We don't talk about what happened to his sign, pal, but ya might notice that it's newer than mine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crutch = {
      big = true,
      lines = {
        { id = "crutch_default", text = "I've heard that one, buddy, from a real quick fella with two swords. A frostsaber showed him that quick ain't the same as quick enough, and I sold his widow a nice memorial plaque." },
      },
      choices = {
        { text = "Fair point. Even the best fighter gets hit once.", next = "BACK", reply = "And once is all it takes up here. Now you're talking sense, pal, so let's talk sizes.", fx = { align = { order = 1 } } },
        { text = "I'll trust my feet over your steel.", next = "BACK", reply = "Suit yourself, friend. I'll keep a plaque in the back with your name pencilled in, no charge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crack = {
      lines = {
        { id = "crack_default", text = "The frost giants up at Frostwhisper Gorge, pal, and the big dragonkin in Mazthoril. A chillwind'll dent ya, and a giant'll fold ya in half, so if ya see one, my professional advice is to be somewhere else." },
      },
      choices = {
        { text = "Somewhere else. Understood.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forges = {
      lines = {
        { id = "forges_default", text = "Some comes up from Gadgetzan, and the good thorium pieces I buy off the smiths right here in town. That Darkhammer fella does lovely work, pal, and he charges like he knows it." },
      },
      choices = {
        { text = "I may bring you some of mine.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Came up from Ratchet when the Cartel opened Everlook, pal. I figured cold folks buy more layers, and I figured right." } },
    advice = { { id = "tp_advice", text = "Buy it one size up and wear wool under it. You'll thank me around midnight." } },
    everlook = { { id = "tp_everlook", text = "It's a town full of goblins who hate the cold, selling to folks who hate it more. It's a perfect market, buddy." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel keeps the road open and the Bruisers fed, and I pay my dues on time. Ask my cousins if they can say the same." } },
    _none = { { id = "tp_none", text = "Not my line, pal. If it don't clank, I don't stock it." } },
  },
}

---------------------------------------------------------------------------
-- Blixxrak (Everlook, light armor)
---------------------------------------------------------------------------
P:NPC {
  key = "blixxrak", id = TODO_NPC("Blixxrak"), name = "Blixxrak", title = "Light Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "quick", "anxious" }, values = { "greedy", "careful" },
  notices = { "kit", "class" },
  impression = {
    first = "Blixxrak sells cloth and leather in Everlook and frets over every customer who walks out underdressed. He has opinions about his cousins' prices and offers them freely.",
    third = "{name} met Blixxrak, the light armor merchant of Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Oh good, a customer! Come in, come in, and look at what you're wearing, pal, you'll catch your death in that." },
    { id = "g_2", when = { metBefore = true }, text = "You're back, and you've still got all your toes? Then the boots worked, and I told ya they would." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Robes, in Winterspring! Friend, I've got quilted linings that'll change your whole life, and I ain't exaggerating, people have wept." },
    { id = "n_2", cat = "class", when = { class = { "ROGUE", "DRUID", "HUNTER" } },
      text = "Leather, good, good. But is it lined? Tell me it's lined, pal, because I can't watch another one of ya go blue." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Blixxrak, light armor, cloth and leather for the discerning and the freezing. My cousin Nixxrak thinks everybody ought to wear half a ton of plate, pal, but some folks need to move, and some folks need to cast, and all of 'em need to stay warm." },
        { id = "hello_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "You're a plate type, I can tell, and my cousin's already got his eye on ya. Still, pal, even you need something soft underneath, and that's where I come in." },
      },
      again = {
        { id = "hello_again1", text = "Something else, friend? Ask, ask, I worry when it's quiet." },
        { id = "hello_again2", text = "Go on, pal. I'm listening and I'm restocking." },
        { id = "hello_again3", text = "Yeah? What else do ya need?" },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What sells best in this cold?", next = "sells" },
        { text = "Your sign looks newer than your cousin's.", next = "sign" },
        { text = "Light armor is for people who plan to run.", next = "run" },
        { text = "What would you put on a spellcaster up here?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK", "DRUID" } } },
        { text = "Do you buy from crafters?", next = "crafters", when = { profession = { "Tailoring", "Leatherworking" } } },
        { text = "Thanks, Blixxrak.", next = "END" },
      },
    },
    sells = {
      lines = {
        { id = "sells_default", text = "Gloves, pal, by a mile. Nobody thinks about their hands till they can't feel 'em, and then they come running in here holding 'em out like a couple of dead fish." },
      },
      choices = {
        { text = "And after gloves?", next = "sells_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_after = {
      lines = {
        { id = "sells_after_default", text = "Hoods and boots. I had a mage come through who'd walked up from Felwood in sandals, friend, and I sold him the whole shop, near enough. He named his firstborn after me, or he said he would." },
      },
      choices = {
        { text = "Did you believe him?", next = "sells_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_believe = {
      lines = {
        { id = "sells_believe_default", text = "I wrote it on the receipt, pal, so he's committed. There's a little Blixxrak in Stormwind right now, probably, and that keeps me warm on the slow days." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sign = {
      lines = {
        { id = "sign_default", text = "Don't. Just don't, pal. I ran one little sale on helmets, and my cousins took it real personal, and now we got a rule. I'm told the old sign burned for an hour." },
      },
      choices = {
        { text = "That seems harsh for a sale.", next = "sign_harsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign_harsh = {
      lines = {
        { id = "sign_harsh_default", text = "That's family for ya. We made up at supper the same night, and Wixxrak paid for half the new sign, though he says it was a loan. I'm still waiting on the paperwork." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    run = {
      big = true,
      lines = {
        { id = "run_default", text = "I get that from every lunk in a breastplate, friend. And then I watch 'em try to chase an owlbeast uphill through four feet of snow, and I think that maybe running's a skill too." },
      },
      choices = {
        { text = "Speed and wits beat weight. You've got a point.", next = "BACK", reply = "Thank you! Go and tell Nixxrak that, pal, and do it loudly.", fx = { align = { order = -1 } } },
        { text = "A line holds because someone stands firm in steel.", next = "BACK", reply = "Sure, sure, and somebody's got to stand behind that fella and do the thinking. I dress the thinkers.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = {
        { id = "caster_default", text = "Runecloth with a wool lining, a hood ya can pull right down, and gloves with the fingertips off so ya can still wiggle 'em. It ain't pretty, pal, but frostbite's a lot uglier." },
      },
      choices = {
        { text = "Practical. I'll take the advice.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters = {
      lines = {
        { id = "crafters_default", text = "If the stitching's tight and it's lined, sure, bring it in. I get my best wool from Qia across the square, pal, so if you're short of thread, she's the one to see." },
      },
      choices = {
        { text = "I'll talk to Qia.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I sold shirts in Booty Bay, pal, where nobody wears one. Up here everybody needs three, so I'd call that a smart move." } },
    advice = { { id = "tp_advice", text = "Layers. Wear layers, and then put on another layer." } },
    everlook = { { id = "tp_everlook", text = "It's the coldest town I ever heard of, and I love it, because every single person in it needs my stock." } },
    rumors = { { id = "tp_rumors", text = "Folks say the furbolgs up at Timbermaw Hold wear nothing but their own fur. That's just showing off, pal." } },
    _none = { { id = "tp_none", text = "I dunno, pal. Is it something ya can wear?" } },
  },
}

---------------------------------------------------------------------------
-- Xizzer Fizzbolt (Everlook, engineering supplies)
---------------------------------------------------------------------------
P:NPC {
  key = "xizzer", id = TODO_NPC("Xizzer Fizzbolt"), name = "Xizzer Fizzbolt", title = "Engineering Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "excitable", "sly" }, values = { "craft", "greedy" },
  notices = { "craft", "race" },
  impression = {
    first = "Xizzer Fizzbolt sells engineering parts in Everlook and regards the cold mainly as a problem of lubrication. He lowers his voice whenever the talk turns to the schematics he keeps under the counter.",
    third = "{name} met Xizzer Fizzbolt, who sells engineering supplies in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome! Parts, powder, and the finest fuses north of anywhere. Stamp the snow off first, pal, because wet powder is sad powder." },
    { id = "g_2", when = { metBefore = true }, text = "You're back and you're in one piece! That's two for two, friend, and my customers don't always manage it." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! I can tell by the eyebrows, pal, or what's left of 'em. Come round the counter, I've got things here that I don't show the tourists." },
    { id = "n_2", cat = "race", when = { race = "Gnome" },
      text = "A gnome, huh? Sure, sure, I'll sell to ya, and I won't even say what I think of gnomish safety catches, because I'm a professional." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Xizzer Fizzbolt, engineering supplies, wholesale and retail and occasionally airborne. Everything seizes up in this cold, pal, gears and fuses and fingers, and I've got the fix for all three, at a real reasonable markup." },
        { id = "hello_2", when = { profession = "Engineering" }, text = "A colleague! Friend, you would not believe what the cold does to a delicate arcanite converter, and I've got a schematic for that and a few other things besides." },
      },
      again = {
        { id = "hello_again1", text = "Something else, pal? Ask, but don't touch the red crate." },
        { id = "hello_again2", text = "Go on, friend, I'm all ears, and I've still got both of 'em." },
        { id = "hello_again3", text = "Yeah? Make it quick, something back there's ticking." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What does this cold do to machinery?", next = "cold" },
        { text = "What's in the red crate?", next = "crate" },
        { text = "Goblin engineering is just gnomish with the safety off.", next = "gnomish" },
        { text = "Anything special under the counter?", next = "special", when = { profession = "Engineering" } },
        { text = "Do you sell much to Alliance tinkers?", next = "alliance", when = { race = { "Gnome", "Dwarf" } } },
        { text = "Keep your powder dry, Xizzer.", next = "END" },
      },
    },
    cold = {
      lines = {
        { id = "cold_default", text = "Oil goes to jelly, pal, and springs go brittle, and fuses burn at half speed until they don't. I had a rocket sit there fizzing for a full minute once, and then it left town with my awning." },
      },
      choices = {
        { text = "What's your fix?", next = "cold_fix" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_fix = {
      lines = {
        { id = "cold_fix_default", text = "Whale oil cut with a little frost oil, for the gears, and I keep the powder kegs by the stove. Yeah, I heard it as I said it, friend. I keep 'em near the stove, and not on it." },
      },
      choices = {
        { text = "How near is near?", next = "cold_near" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_near = {
      lines = {
        { id = "cold_near_default", text = "Near enough that Innkeeper Vizzie made me sign something. I got it down to a science, pal, and the science says about six feet, with a bucket of snow handy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crate = {
      lines = {
        { id = "crate_default", text = "Dense dynamite, for the miners, and it's sweating a little, which they tell me is normal. Lunnix Sprocketslip buys it by the case for the thorium seams, and he's still got most of his fingers." },
      },
      choices = {
        { text = "Most of them?", next = "crate_most" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate_most = {
      lines = {
        { id = "crate_most_default", text = "Eight and a half, pal, which is above average for the mining trade. He says the half one's the most useful, on account of it fits in the blasting caps." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomish = {
      big = true,
      lines = {
        { id = "gnomish_default", text = "Whoa, whoa, pal, them's fighting words in two languages. A gnome builds a thing so careful that it never does nothing, and a goblin builds it so it does something every single time, sometimes twice." },
      },
      choices = {
        { text = "Results matter. Better a bang than a blueprint.", next = "BACK", reply = "Now that's the goblin way! Friend, I'm gonna show ya the good fuses.", fx = { align = { order = -1 } } },
        { text = "Caution matters. A dead engineer builds nothing.", next = "BACK", reply = "Yeah, yeah, that's what the gnomes say, and I'll grant ya they got more old engineers than we do.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    special = {
      lines = {
        { id = "special_default", text = "Keep your voice down, pal. I got the schematic for a delicate arcanite converter, and one for a masterwork target dummy, and neither of 'em's cheap. The fella I got 'em from would like to stay unmentioned, so we won't discuss that." },
      },
      choices = {
        { text = "I didn't hear a thing.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = {
        { id = "alliance_default", text = "Plenty, friend! The Cartel's neutral and so's my cash box. There's a dwarf in town, Felnok Steelspring, who buys more thorium widgets than anybody, and he never once asked for a safety manual." },
      },
      choices = {
        { text = "I'll look him up.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I blew up my first shop in Gadgetzan, pal, by accident, mostly. The Cartel suggested somewhere with fewer neighbours and more snow." } },
    advice = { { id = "tp_advice", text = "Warm your fuses in your coat before ya light 'em. A cold fuse lies about how long it's got." } },
    everlook = { { id = "tp_everlook", text = "Good town, pal. Thick walls, lots of snow to put out fires, and the Bruisers hardly ever ask what the noise was." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Shame about that place, and I mean it, pal. All those beautiful machines, and nobody thought to put in a back door." } },
    _none = { { id = "tp_none", text = "No idea, pal. Does it explode? Then it ain't mine." } },
  },
}

---------------------------------------------------------------------------
-- Daleohm (Everlook, blacksmithing supplies; a high elf among goblins)
---------------------------------------------------------------------------
P:NPC {
  key = "daleohm", id = TODO_NPC("Daleohm"), name = "Daleohm", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "reserved", "dry" }, values = { "craft", "pride" },
  notices = { "craft", "race" },
  impression = {
    first = "Daleohm is a high elf who sells flux, coal and ingots to Everlook's smiths, and keeps his stall with a tidiness that the goblins find unsettling. He speaks of the south seldom, and carefully.",
    third = "{name} met Daleohm, the high elf who sells blacksmithing supplies in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Good day. Flux, coal and bar stock, all of it weighed honestly, which I am told is a novelty in this town." },
    { id = "g_2", when = { metBefore = true }, text = "You have returned. I trust that the last order was satisfactory, for I heard no complaint." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Those are a smith's hands, with the burns in the proper places. I shall not need to explain to you what flux is for, which will be a pleasant change." },
    { id = "n_2", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Our peoples parted a long time ago, and not kindly. I would as soon we were civil to each other, here where it is too cold for old quarrels." },
    { id = "n_3", cat = "race", when = { race = "Scourge" },
      text = "You will forgive me if I keep the counter between us. I saw what your kind did to Quel'Thalas, and I have not yet learned to see the difference." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Daleohm. I supply the smiths of Everlook with what their forges consume, and there are more forges in this little town than in many cities, for the thorium of Winterspring draws masters from everywhere." },
        { id = "hello_2", when = { profession = "Blacksmithing" }, text = "A smith. Then you will be here for the thorium, as they all are. I can supply the flux and the coal, and the patience you must bring yourself." },
      },
      again = {
        { id = "hello_again1", text = "Is there something further? I am in no haste." },
        { id = "hello_again2", text = "Ask, by all means. The scales will keep." },
        { id = "hello_again3", text = "Yes? I am listening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "A high elf is a long way from home here.", next = "far" },
        { text = "Everlook seems to be full of master smiths.", next = "smiths" },
        { text = "Goblins and honest weights don't usually mix.", next = "weights" },
        { text = "What's the secret to working thorium?", next = "thorium", when = { profession = { "Blacksmithing", "Mining" } } },
        { text = "Did you know Lordaeron before the plague?", next = "lordaeron", when = { race = "Human" } },
        { text = "Good trading, Daleohm.", next = "END" },
      },
    },
    far = {
      lines = {
        { id = "far_default", text = "Home is ash, and the Scourge walks its streets. I was abroad on a merchant's business when Quel'Thalas fell, and when I learned of it there was nowhere left to return to." },
      },
      choices = {
        { text = "Why come to Winterspring, of all places?", next = "far_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_why = {
      lines = {
        { id = "far_why_default", text = "Because it is as far from that as a ship and a road could carry me, and because the goblins do not ask where one is from, provided that one pays. I found that restful." },
      },
      choices = {
        { text = "And is it still restful?", next = "far_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_still = {
      lines = {
        { id = "far_still_default", text = "More than I expected it to be. The cold is clean, and the work is exact, and nobody here has ever asked me to explain what my people did or failed to do. I have built a small life out of not being asked." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = {
        { id = "smiths_default", text = "It is. Malyfous Darkhammer keeps his catalogue of thorium work, and there are Seril, Kilram and Lilith besides, who each teach a different weapon and each consider the other two to be misguided." },
      },
      choices = {
        { text = "Which of them is right?", next = "smiths_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths_right = {
      lines = {
        { id = "smiths_right_default", text = "I sell coal to all three, and so I have no opinion whatever. I will say that Seril pays on the day, that Kilram pays with a story attached, and that Lilith pays exactly, to the copper, and thanks me rather alarmingly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    weights = {
      big = true,
      lines = {
        { id = "weights_default", text = "So I was warned. The goblins weigh with a thumb on the pan, and they consider it a form of wit. I do not, and my neighbours have decided that I am either a fool or working some longer swindle." },
      },
      choices = {
        { text = "Keep your scales honest. A name is worth more than a margin.", next = "BACK", reply = "That is my own view. It has cost me a little coin and it has earned me every smith in town, so I do not regret it.", fx = { align = { honor = 1 } } },
        { text = "In a goblin town, play by goblin rules.", next = "BACK", reply = "I have considered it. But I should have to look at myself each morning, and I have lost enough already.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thorium = {
      lines = {
        { id = "thorium_default", text = "Heat, held far longer than seems reasonable, and a flux that is purer than you think you need. Most who fail with it fail by hurrying, and the metal punishes haste as nothing else does." },
      },
      choices = {
        { text = "Patience and pure flux. Thank you.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = {
        { id = "lordaeron_default", text = "I traded in its markets for thirty years. Stratholme bought our glass and Andorhal our wine, and they were good customers and decent people, nearly all of them. I try to remember them as they were." },
      },
      choices = {
        { text = "So do I.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I was a factor for a trading house of Silvermoon. The house is gone, and the trade is what I have left." } },
    advice = { { id = "tp_advice", text = "Buy your coal by weight, and watch the scale. Mine you need not watch, but form the habit." } },
    everlook = { { id = "tp_everlook", text = "It is a cold little town of thieves with excellent manners. I have grown quite attached to it." } },
    scourge = { { id = "tp_scourge", text = "I do not discuss them. You may draw your own conclusions from that." } },
    _none = { { id = "tp_none", text = "That is beyond what I know. I deal in flux and bar stock." } },
  },
}

---------------------------------------------------------------------------
-- Syurana (Starfall Village, trade supplies)
---------------------------------------------------------------------------
P:NPC {
  key = "syurana", id = TODO_NPC("Syurana"), name = "Syurana", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "quiet", "observant" }, values = { "patient", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Syurana sells thread, dyes and tools at Starfall Village, on the hill above the frozen lake. She has few customers and remembers every one of them.",
    third = "{name} met Syurana, who sells trade supplies at Starfall Village in Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveler. Few climb this hill merely to buy thread, so I think that you must truly need it." },
    { id = "g_2", when = { metBefore = true }, text = "You have come back to Starfall. The path is no easier the second time, I know." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Enchanting" } },
      text = "You work with your hands, and I can see that you count your materials as you walk. I may have what you are short of." },
    { id = "n_2", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You are welcome in Starfall, friend of the Alliance. Warm yourself first, for your people feel this cold more sharply than we do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Syurana, and I keep Starfall's small store of thread, vials, dyes and tools. The village is a watch-post more than a town, but those who watch must mend their cloaks like anyone else." },
        { id = "hello_2", when = { faction = "Horde" }, text = "You are of the Horde, and Starfall does not trade with you. Go down to the goblins at Everlook, who will sell you whatever you wish, and go in peace." },
      },
      again = {
        { id = "hello_again1", text = "Is there something more? The afternoons are long here." },
        { id = "hello_again2", text = "Ask, if you wish. I see few enough faces." },
        { id = "hello_again3", text = "Speak. The snow is not going anywhere." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Why keep a shop where nobody passes?", next = "shop" },
        { text = "What does Starfall watch for?", next = "watch" },
        { text = "The goblins at Everlook would undercut you.", next = "goblins" },
        { text = "What do crafters ask you for most?", next = "ask", when = { profession = { "Tailoring", "Leatherworking", "Skinning" } } },
        { text = "Do you miss the green of Ashenvale?", next = "green", when = { race = "NightElf" } },
        { text = "Elune keep you warm, Syurana.", next = "END" },
      },
    },
    shop = {
      lines = {
        { id = "shop_default", text = "Because the Sentinels here patrol in snow to the knee, and a torn strap in this cold is a lost foot. I am not here for the travellers, though they are welcome. I am here for the patrols." },
      },
      choices = {
        { text = "How many patrol from here?", next = "shop_patrol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_patrol = {
      lines = {
        { id = "shop_patrol_default", text = "Fewer than Wynd Nightchaser would like. He sends them to the lake, to the ruins, and north toward the furbolg tunnels, and he counts them back in each night himself." },
      },
      choices = {
        { text = "And if the count is short?", next = "shop_short" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_short = {
      lines = {
        { id = "shop_short_default", text = "Then no one sleeps, and I light the lamps in every window so that the hill may be seen from the valley. It has been short only twice, and both times they came home by the lamps." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "watch_default", text = "The Highborne ruins by the lake, where the dead do not rest, and the blue dragonkin who gather at Mazthoril. Jaron Stoneshaper studies the one, and Wynd watches the other." },
      },
      choices = {
        { text = "And which worries you more?", next = "watch_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_worry = {
      lines = {
        { id = "watch_worry_default", text = "The ruins, though I could not tell you why. The dragonkin are only strong, and strength is a thing that one may plan against. The ruins are sad, and I think that sorrow so old turns into something else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      big = true,
      lines = {
        { id = "goblins_default", text = "They would, and they do. I have seen their prices, and I have also seen their thread, which parts at the second washing. I sell what I would be willing to sew with." },
      },
      choices = {
        { text = "Good work at a fair price outlasts a cheap bargain.", next = "BACK", reply = "So I believe, and so my few customers have found. Thank you.", fx = { align = { honor = 1 } } },
        { text = "Cheap is what most people can afford.", next = "BACK", reply = "That is true, and I do not blame them for it. I only decline to sell them something that will fail in the snow.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = {
        { id = "ask_default", text = "Rune thread, and salt for curing. The hunters bring down frostsaber and bear, and a hide spoils slowly in this cold, but it does spoil." },
      },
      choices = {
        { text = "I'll stock up on salt.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    green = {
      lines = {
        { id = "green_default", text = "Every day, and most of all at dusk. But the snow has its own beauty when the moon is on it, and Elune seems very near on this hill. I would not trade that now." },
      },
      choices = {
        { text = "She is near here. I feel it too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I came to Winterspring when the Sentinels raised this post. Someone must keep the needles and the salt, and I do not mind the quiet." } },
    advice = { { id = "tp_advice", text = "Mend a tear on the day that you find it. The cold finds every gap by nightfall." } },
    highborne = { { id = "tp_highborne", text = "They lie restless by the lake, still grieving for what they did. I do not go down there." } },
    everlook = { { id = "tp_everlook", text = "It is a loud little place, and useful in its way. I buy my lamp oil there and I count my change." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Wynd, for he hears more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Lyranne Feathersong (Starfall Village, food and drink)
---------------------------------------------------------------------------
P:NPC {
  key = "lyranne", id = TODO_NPC("Lyranne Feathersong"), name = "Lyranne Feathersong", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "warm", "cheerful" }, values = { "kind", "hearth" },
  notices = { "hunger", "race" },
  impression = {
    first = "Lyranne Feathersong keeps the kettle and the larder at Starfall Village and presses something hot on everyone who comes up the hill. She seems to regard the cold as a personal rival.",
    third = "{name} met Lyranne Feathersong, who sells food and drink at Starfall Village.",
  },
  greetings = {
    { id = "g_default", text = "Come in from the wind! Sit by the brazier, and do not say a word until you have something hot in your hands." },
    { id = "g_2", when = { metBefore = true }, text = "There you are again. The kettle has been on since I saw you start up the path." },
  },
  notice = {
    { id = "n_1", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You look frozen through and half starved besides. Broth first, and then you may tell me what you were fighting." },
    { id = "n_2", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, {g:brother|sister}. I have moonberry juice, warmed and spiced, and it will taste like a festival night in Darnassus." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Lyranne Feathersong, and I feed Starfall. It is a small village on a cold hill, and so I have made it my business that nobody here should ever be both cold and hungry at once." },
        { id = "hello_2", when = { faction = "Horde" }, text = "I may not sell to you, traveler, for the Sentinels would not have it. But I will not see anyone freeze on my doorstep, so stand by the brazier a moment before you go." },
      },
      again = {
        { id = "hello_again1", text = "What else, dear? The broth can simmer by itself." },
        { id = "hello_again2", text = "Ask away. I talk while I stir." },
        { id = "hello_again3", text = "Yes? Go on, I am listening." },
      },
      choices = {
        { text = "What's hot today?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do you keep a larder stocked up here?", next = "larder" },
        { text = "Who are your hungriest customers?", next = "hungry" },
        { text = "Sentinels on watch shouldn't be coddled.", next = "coddle" },
        { text = "Do you ever want to go further than Starfall?", next = "world" },
        { text = "Rivern Frostwind has no patience for humans and dwarves.", next = "world_rivern", when = { heardLine = "rivern.lo_default" } },
        { text = "I've come a long way from Stormwind to taste this.", next = "world_human", when = { race = "Human" } },
        { text = "What's in the broth?", next = "broth", when = { profession = "Cooking" } },
        { text = "Have you anything stronger than juice?", next = "stronger", when = { race = { "Dwarf", "Human", "Gnome" } } },
        { text = "Thank you, Lyranne.", next = "END" },
      },
    },
    larder = {
      lines = {
        { id = "larder_default", text = "Natheril Raincaller brings up flour and dried fruit with the general stores, and the hunters bring me bear and whatever else they have taken. And I buy spices from the goblins at Everlook, though I haggle very badly." },
      },
      choices = {
        { text = "The goblins must enjoy that.", next = "larder_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder_goblins = {
      lines = {
        { id = "larder_goblins_default", text = "Himmik sees me coming, I am certain, and I am certain that he raises the price as I walk in. But he always slips an extra twist of pepper into the bag, so perhaps he feels a little guilty." },
      },
      choices = {
        { text = "A goblin with a conscience?", next = "larder_conscience" },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder_conscience = {
      lines = {
        { id = "larder_conscience_default", text = "A very small one, dear, which he keeps well hidden. I have decided to encourage it, and so I bring him a jar of my preserves at each midwinter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hungry = {
      lines = {
        { id = "hungry_default", text = "The Sentinels who come in from the lake patrol, always. They are blue to the ears and too proud to say so, and I have learned to put a bowl in their hands before they can refuse it." },
      },
      choices = {
        { text = "And Wynd Nightchaser?", next = "hungry_wynd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hungry_wynd = {
      lines = {
        { id = "hungry_wynd_default", text = "He eats standing at the window, watching the path, and I do not think that he tastes any of it. I have stopped being offended, for he is counting his patrols home, and that matters more than my cooking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    coddle = {
      big = true,
      lines = {
        { id = "coddle_default", text = "Wynd said something of the sort, in the first winter. Then two of his Sentinels came in with frost in their fingers, and I thawed them out with broth, and he has not said it since." },
      },
      choices = {
        { text = "Warm soldiers fight better. You were right.", next = "BACK", reply = "I thought so, and it is kind of you to say it aloud.", fx = { align = { light = 1 } } },
        { text = "Hardship is what makes a Sentinel.", next = "BACK", reply = "Perhaps it is. They will find hardship enough on that hill without my adding to it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    world = {
      lines = {
        { id = "wo_default", key = true,
          text = "Every day, dear, though I'd not say so in front of the elders. Since Hyjal we have only so many years, and I would like to spend a few of them tasting what the dwarves cook in Ironforge and what the humans eat in their great harbour, before I am old." },
        { id = "wo_nelf", when = { race = "NightElf" },
          text = "Every day, {g:brother|sister}, and I suspect you do as well, or you'd be home in Darnassus. Since Hyjal we have only so many years, and I don't mean to spend all of them on one cold hill, however much I love it." },
      },
      choices = {
        { text = "What do the elders say to that?", next = "world_elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    world_elders = {
      big = true,
      lines = {
        { id = "we_default", text = "That we've lived ten thousand years without human bread and can live a few hundred more, and that the young forget what the world outside did to us. Wynd told me the Highborne were curious too, which I thought was very unfair of him." },
      },
      choices = {
        { text = "Go and see it. Kaldorei have hidden from the world too long.", next = "BACK",
          reply = "That's what I tell myself over the kettle, and it's lovely to hear someone else say it. One spring, when Starfall can spare me, I'll take the boat from Auberdine.",
          fx = { affinity = 1, align = { order = -1 }, opinion = { kaldorei_immortality = "freed" } } },
        { text = "The elders have a point. Your place is here, with your people.", next = "BACK",
          reply = "Perhaps it is, and the Sentinels would go hungry without me, which I take very seriously. I'll stay, for now, but I'll keep the wanting.",
          fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    world_rivern = {
      lines = {
        { id = "wr_default", text = "No, she hasn't, and she'll tell you about the cave and the cubs if you let her, and she's right to grieve it. But Jaron eats at my brazier every evening and toasts my broth as if it were Ironforge ale, and I can't make myself think of him as a fire waiting to happen." },
      },
      choices = {
        { text = "Grief makes people judge whole races.", next = "BACK", reply = "It does, and I try not to blame her for it. I only bring her a bowl and talk about something else.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    world_human = {
      lines = {
        { id = "wh_default", text = "From Stormwind! Then sit, and tell me what your people eat there, all of it, and whether it's true you put meat inside bread and bake it. I have wanted to know since I was a novice cook in Darnassus." },
      },
      choices = {
        { text = "It's true. Meat pies are a Stormwind treasure.", next = "BACK", reply = "Then I'll make one this winter and see what the Sentinels say. Wynd will disapprove, and eat two.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    broth = {
      lines = {
        { id = "broth_default", text = "Bear, marrow bones, dried moonberries for the sharpness, and a pepper from Everlook that I use very sparingly. Let it go slowly, for a whole day if you can." },
      },
      choices = {
        { text = "A whole day. I'll be patient.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stronger = {
      lines = {
        { id = "stronger_default", text = "I keep one bottle of dwarven spirit for Jaron Stoneshaper, who says that it helps him to think. You may have a small cup, if you promise not to tell him how low it has got." },
      },
      choices = {
        { text = "Not a word to Jaron.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I cooked for the Temple's novices in Darnassus. I asked to be sent somewhere that I was needed more, and I was sent here." } },
    advice = { { id = "tp_advice", text = "Eat before you go out, even when you are not hungry. The cold burns through a meal twice as fast as you expect." } },
    elune = { { id = "tp_elune", text = "She is close on this hill, when the snow is bright. I say my thanks to her over the kettle." } },
    everlook = { { id = "tp_everlook", text = "It is noisy and greedy and oddly kind, underneath. I like it better than I admit." } },
    _none = { { id = "tp_none", text = "I could not tell you, dear. Have some broth while you think of another question." } },
  },
}
