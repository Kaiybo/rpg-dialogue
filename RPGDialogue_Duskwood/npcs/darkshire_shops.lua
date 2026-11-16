-- Darkshire's shops and petitioners: Mabel Solaj and Gunder Thornbush in the Scarlet Raven,
-- Morg Gnarltree's armour, Matt Johnson's mining lessons, the Zipstitches upstairs in
-- Madame Eva's house, Hogan Ference at the Town Hall, and Kzixx by the Darkened Bank road.
-- Voice: bibles/darkshire_shops.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC = P.TODO_NPC

-- Mabel Solaj: general goods in the Scarlet Raven Tavern.
P:NPC {
  key = "mabel", id = TODO_NPC("Mabel Solaj"), name = "Mabel Solaj", title = "General Goods",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "warm" }, values = { "practical", "kind" },
  notices = { "hunger" },
  impression = {
    first = "Mabel Solaj sells candles, flour and lamp oil from a corner of the Scarlet Raven, and she mothers every customer whether they want it or not. In Darkshire, I suspect most of them do.",
    third = "{name} met Mabel Solaj, who sells general goods in Darkshire's Scarlet Raven Tavern.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of the fog, dear. Candles are on the left, bread on the right." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, and still in one piece. Sit a moment before you go back out." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of you! Buy a loaf, dear, and eat it here where it's warm, before you go anywhere near that wood again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mabel Solaj, and I keep Darkshire in candles, lamp oil and flour, which is to say I keep it in light and bread. Neither one is easy to come by in this wood, so I don't apologise for my prices." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Bless you for coming so far into the dark. I sell more candles to the Night Watch than I ever sold to a chapel, and they need the light just as badly." },
        { id = "h_undead", when = { race = "Scourge" }, text = "Oh, my word, you're one of the... well, you're standing here buying candles and not trying to eat me, so I'll be civil if you will." },
      },
      again = {
        { id = "h_again", text = "What else, dear? The kettle's on, and there's no hurry in this fog." },
        { id = "h_again2", text = "Ask away. It's dark out, and nobody's in a hurry to leave." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What sells best in Darkshire?", next = "sells" },
        { text = "How do supplies reach you?", next = "supplies" },
        { text = "Why stay in Darkshire?", next = "stay" },
        { text = "Good night, Mabel.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Candles and lamp oil, before anything else. The sun hasn't properly shone on Darkshire in years, and folk here would rather go without supper than sit in the dark." } },
      choices = {
        { text = "Why does the dark frighten them so?", next = "sells_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_dark = {
      lines = { { id = "sd_default", fx = { learn = { "worgen" } }, text = "Because things come out of it, dear. Worgen in the woods, the dead from Raven Hill, and worse things nobody names, and every one of them seems to prefer a dark window." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies = {
      lines = { { id = "su_default", text = "By cart from Stormwind, when the drivers are brave enough, which isn't often. The road from Elwynn runs straight through the forest, and the drivers whip their horses the whole way and won't stay the night." } },
      choices = {
        { text = "Does Stormwind send anything else?", next = "supplies_sw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_sw = {
      big = true,
      lines = { { id = "ss_default", text = "Flour and letters, and the letters say help is coming. Lord Ebonlocke reads them aloud at the Town Hall, and every year fewer people come to listen." } },
      choices = {
        { text = "Stormwind hasn't forgotten you. Keep faith.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop waiting on Stormwind. Darkshire must save itself.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Because somebody has to sell the candles, dear, and because my husband's buried here, and I'll not leave him to the dark. I talk to him on the way to market, and he's a better listener now than he ever was." } },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a shop on the square when this was still Brightwood, before the dark came, and I simply never closed it." } },
    advice = { { id = "tp_ad", text = "Carry a spare candle, dear, and never let it be your last one." } },
    night_watch = { { id = "tp_nw", text = "Good lads and lasses, all of them, and they buy more lamp oil than anyone." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask Smitts; he collects stories." } },
  },
}

-- Gunder Thornbush: tradesman in the Scarlet Raven Tavern.
P:NPC {
  key = "gunder", id = TODO_NPC("Gunder Thornbush"), name = "Gunder Thornbush", title = "Tradesman",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "dry" }, values = { "practical", "shrewd" },
  notices = { "craft" },
  impression = {
    first = "Gunder Thornbush sells thread, vials and flux in the Scarlet Raven and counts his stock aloud as though it might wander off. He seems to think Darkshire's trade died with its sunlight.",
    third = "{name} met Gunder Thornbush, a tradesman in Darkshire's Scarlet Raven Tavern.",
  },
  greetings = {
    { id = "g_default", text = "Thread, flux, vials and parchment. Whatever your craft needs, I've a little of it." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer. I'll write the date down; it's rare enough." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy" } },
      text = "You've a crafter's hands, friend, and you'll know my prices are fair for a town at the end of a bad road. Have a look at the vials before the alchemists take them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gunder Thornbush, tradesman, and I've stock for every craft in Darkshire, though there are fewer crafts every year. Mabel sells the bread and candles, and I sell everything you'd need to make something of your own." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! Herble on the hill sells the clever bits, so I'll not pretend to compete, but if you need plain flux, mine's cheaper." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "You'll be after parchment, I expect, and I'll not ask what you write on it. In this town, the less a tradesman asks, the longer he trades." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've stock to count." },
        { id = "h_again2", text = "Go on. Smitts says I talk too little, so I'm practising." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why are there fewer crafts every year?", next = "crafts" },
        { text = "What do you think of the Night Watch?", next = "watch" },
        { text = "Who buys from you most?", next = "buyers" },
        { text = "Farewell.", next = "END" },
      },
    },
    crafts = {
      lines = { { id = "c_default", text = "Because the crafters leave, or die, or stop working and start drinking at Smitts's bar. The tanner went to Stormwind, the weaver's in the churchyard, and the cooper just stopped coming out of his house one winter." } },
      choices = {
        { text = "Why do you stay, then?", next = "crafts_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafts_stay = {
      big = true,
      lines = { { id = "cs_default", text = "Because if I left, the last crafters would have nothing to work with, and then they'd leave too. Some days I think that's duty, and some days I think I'm just too stubborn to admit the town's dying." } },
      choices = {
        { text = "That's duty. The town needs you.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then go. No one owes a dying town their life.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", fx = { learn = { "night_watch" } }, text = "Brave fools, the lot of them. Commander Ebonlocke formed them when Stormwind pulled its soldiers out, and they've held this town with farmers' sons and old swords ever since." } },
      choices = {
        { text = "Fools?", next = "watch_fools" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_fools = {
      lines = { { id = "wf_default", text = "Only a fool walks into that forest at night with a lantern and a sword, and only a fool like that keeps the rest of us alive. I pay them in thread and say thank you, which is more than Stormwind does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "The Watch, for thread to mend their cloaks, and adventurers like you, for vials and flux. Viktori up the hill buys parchment by the ream to write down what he sees in the stars." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family traded in Brightwood for three generations, and I'll likely be the last of us to do it." } },
    advice = { { id = "tp_ad", text = "Buy what you need before nightfall, friend. Nobody opens a door here after dark." } },
    _none = { { id = "tp_none", text = "That's not in my ledger, and what's not in my ledger I don't bother with." } },
  },
}

-- Morg Gnarltree: Darkshire's armorer.
P:NPC {
  key = "morg", id = TODO_NPC("Morg Gnarltree"), name = "Morg Gnarltree", title = "Armorer",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "gruff" }, values = { "craft", "duty" },
  notices = { "kit", "class" },
  impression = {
    first = "Morg Gnarltree makes armour for Darkshire and studies every customer's gear for claw marks before he says hello. He is gruff, and he plainly cares whether the people he outfits come back.",
    third = "{name} met Morg Gnarltree, Darkshire's armorer.",
  },
  greetings = {
    { id = "g_default", text = "Armour, mail and plate. Let me see what you're wearing first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Turn round, and let me see the damage." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those are claw marks, and they've gone through. You'll not go back out in that, not while I'm standing here, so take it off and let me look." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Cloth, in Duskwood? You'd do as well walking out there in your nightshirt, though I suppose your magic is meant to be the armour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Morg Gnarltree, armorer. Gavin sells you the blade to fight with and I sell you the steel to survive it, and in this wood the second matters more." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. Your plate's good, but it was made for Stormwind's streets, not Duskwood's claws, and the joints at the elbow will fail you first." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf. Your people taught mine half of what we know about plate, so if you see something wrong in my work, say it plainly." },
      },
      again = {
        { id = "h_again", text = "What else? The forge won't keep." },
        { id = "h_again2", text = "Speak up. I've been at the anvil all day and my ears are ringing." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "What armour works against worgen?", next = "worgen" },
        { text = "Are you kin to Gavin and Clarise?", next = "kin" },
        { text = "Who wears your armour?", next = "who" },
        { text = "Good day, Morg.", next = "END" },
      },
    },
    worgen = {
      lines = { { id = "w_default", fx = { learn = { "worgen" } }, text = "Mail at the throat and the inside of the arm, because that's where they bite. Plate's better if you can carry it, but a worgen is faster than any man in plate, so most of the Watch choose mail and hope." } },
      choices = {
        { text = "And against the dead?", next = "worgen_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen_dead = {
      lines = { { id = "wd_default", text = "Anything at all, because the dead are slow and they hit like old men. It's the smell you can't armour against, and the knowing that some of them used to buy from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "We're all Gnarltrees, and that's all any of us says about it. Clarise teaches, Gavin sharpens and I hammer, and none of us has had a full night's sleep in years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "The Night Watch, mostly, and I give them what I can afford to. Commander Ebonlocke pays when she has coin, and when she doesn't, I send the armour out anyway." } },
      choices = {
        { text = "Why give it away?", next = "who_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_why = {
      big = true,
      lines = { { id = "ww_default", text = "Because an unarmoured watchman is a dead one, and a dead watchman doesn't guard my door. Some would call that charity, and I call it good sense, and I don't much care which you call it." } },
      choices = {
        { text = "It's charity, whatever you call it. It's good.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Good sense. Charity wouldn't keep your forge lit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've hammered armour in Darkshire since it was Brightwood, and I've mended more of it since the dark came than I made before." } },
    advice = { { id = "tp_ad", text = "Mend it before it fails, friend, not after." } },
    _none = { { id = "tp_none", text = "Don't know a thing about that, friend, so ask me about rivets instead." } },
  },
}

-- Matt Johnson: mining trainer.
P:NPC {
  key = "matt_johnson", id = TODO_NPC("Matt Johnson"), name = "Matt Johnson", title = "Mining Trainer",
  bible = "bibles/darkshire_shops.md", role = "trainer", tier = "service",
  communities = { "darkshire" }, temper = { "weary" }, values = { "craft", "cautious" },
  notices = { "craft" },
  impression = {
    first = "Matt Johnson teaches mining in a town where nobody dares go down a mine any more. He seemed glad of a student, and a little worried for me.",
    third = "{name} met Matt Johnson, Darkshire's mining trainer.",
  },
  greetings = {
    { id = "g_default", text = "Here to learn mining? You'll be the first this month." },
    { id = "g_back", when = { metBefore = true }, text = "Still digging, are you? Good, because somebody in this wood ought to be." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You've dust in the creases of your hands, so you've been underground. Did you come out the same way you went in? That's all I ask of my students." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Matt Johnson, and I teach mining, though there's precious little of it done in Duskwood now. Most of the men I worked with put their picks down years ago, and the rest are buried with them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf wants mining lessons from a human? You're having me on, but I'll teach you what I know about these hills, and that might be worth something." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior who wants to dig? Good, because in Duskwood you'll need both a pick and a sword, often at the same time." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've no students waiting, more's the pity." },
        { id = "h_again2", text = "Ask away. It's nice to talk shop with somebody." },
      },
      choices = {
        { text = "Train me in mining.", next = "BUSINESS" },
        { text = "Why did the miners stop?", next = "stopped" },
        { text = "Is there still ore in these hills?", next = "ore" },
        { text = "Any advice for mining in Duskwood?", next = "advice" },
        { text = "Good day.", next = "END" },
      },
    },
    stopped = {
      lines = { { id = "s_default", fx = { learn = { "worgen" } }, text = "There was a good mine south-east of here, past the Rotting Orchard, and one season the worgen made their den in it. We lost good men in that mine. Folk call it Roland's Doom now, and nobody's gone back down since." } },
      choices = {
        { text = "What drew the worgen there?", next = "stopped_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stopped_why = {
      big = true,
      lines = { { id = "sw_default", text = "I don't know, and I've stopped wanting to. Some in town say it's the same curse that darkened the wood, and some say the beasts are guarding something down there, and the Watch says to stay away either way." } },
      choices = {
        { text = "Someone should go down and find out.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "The Watch is right. Stay out of it.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper and tin, and iron in the deeper veins, more than anyone's dug in years. The hills are rich, and that's the cruelty of it, because the ore's just lying there and nobody's alive enough to take it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Mine by daylight, and never go into a cave you can't see the far end of. If you hear digging that isn't yours, don't stop to wonder who it is, just leave." } },
      choices = {
        { text = "That's unsettling advice.", next = "advice_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice_more = {
      lines = { { id = "am_default", text = "It's Duskwood, friend, and all the advice here is unsettling. The settling kind is for Elwynn." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I mined these hills since I was a boy, and now I teach other people to do what I won't." } },
    advice = { { id = "tp_ad", text = "Bring a lantern and a friend, and if you can only bring one, bring the friend." } },
    _none = { { id = "tp_none", text = "Not something you can dig up, so I couldn't tell you." } },
  },
}

-- Danielle Zipstitch: tailoring supplies, upstairs in Madame Eva's house.
P:NPC {
  key = "danielle", id = TODO_NPC("Danielle Zipstitch"), name = "Danielle Zipstitch", title = "Tailoring Supplies",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "chatty" }, values = { "craft", "curious" },
  notices = { "craft" },
  impression = {
    first = "Danielle Zipstitch sells thread and cloth upstairs in Madame Eva's house and knows everything Eva's visitors say on the stairs. She talks the way she sews, quickly and without dropping a stitch.",
    third = "{name} met Danielle Zipstitch, who sells tailoring supplies upstairs in Madame Eva's house in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Up the stairs already! Mind the cat, and mind the thread on the floor." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread, or more gossip? I've plenty of both." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! I could tell by the neat hem on your cloak, and I'm never wrong about hems. Come and look at the dyes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Danielle Zipstitch, and Sheri and I keep Darkshire in thread, cloth and dye from up here, above Madame Eva's parlour. You'd be amazed what you hear through the floorboards when you sell thread in a fortune teller's house." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage! Your robes are lovely, but the seams are coming apart under the arms, and you'll want that seen to before a worgen sees to it for you." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Oh, a night elf! I've never seen weaving like yours. Is it true your people use spider silk? We've plenty of spiders here, if you'd care to show me." },
      },
      again = {
        { id = "h_again", text = "What else? Oh, I do love a visitor." },
        { id = "h_again2", text = "Go on, ask. Sheri says I talk too much, but Sheri isn't here." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What do you hear through the floor?", next = "floor" },
        { text = "What's Madame Eva like?", next = "eva" },
        { text = "Who buys your cloth?", next = "cloth" },
        { text = "Goodbye, Danielle.", next = "END" },
      },
    },
    floor = {
      lines = { { id = "f_default", text = "Everyone in Darkshire comes to Eva sooner or later, wanting to know if their husband will come home or if the curse will lift. I shouldn't listen, but the floorboards are thin and I'm only human." } },
      choices = {
        { text = "You shouldn't repeat what you hear.", next = "floor_repeat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    floor_repeat = {
      big = true,
      lines = { { id = "fr_default", text = "I don't, mostly, only to Sheri and the cat. Though if it would help someone, like knowing the Watch is short of men, I think I ought to tell, don't you?" } },
      choices = {
        { text = "Secrets told in trust should stay secret.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it helps the town, tell.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eva = {
      lines = { { id = "e_default", text = "Kind, strange and never wrong, or so she says, and I've never caught her out. She tells people hard things gently, which is a rare gift, and she pays her share of the candles without complaint." } },
      choices = {
        { text = "Do you believe in her fortunes?", next = "eva_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eva_believe = {
      lines = { { id = "eb_default", text = "I believe she sees something, and I believe she's careful about what she tells. I asked her once about my own future, and she only said I'd always have work, which is either a blessing or a curse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "c_default", text = "The Watch, for their cloaks, which they tear on every bramble in the forest. And widows, for black cloth, and there are more of those every season than I'd like to say." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Zipstitches have sewn in Darkshire since before it was dark, and Sheri and I don't mean to be the last." } },
    advice = { { id = "tp_ad", text = "Mend a tear the day you get it, love. In Duskwood, tomorrow you'll have three." } },
    _none = { { id = "tp_none", text = "I haven't heard a thing about that, and believe me, I hear a great deal." } },
  },
}

-- Sheri Zipstitch: tailoring supplies, upstairs with Danielle.
P:NPC {
  key = "sheri", id = TODO_NPC("Sheri Zipstitch"), name = "Sheri Zipstitch", title = "Tailoring Supplies",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "anxious" }, values = { "cautious", "craft" },
  notices = { "craft" },
  impression = {
    first = "Sheri Zipstitch keeps the accounts and the good scissors in the Zipstitch shop, and she jumps at every creak on the stairs. She's the careful half of the business and knows it.",
    third = "{name} met Sheri Zipstitch, who sells tailoring supplies with Danielle above Madame Eva's house.",
  },
  greetings = {
    { id = "g_default", text = "Oh! You startled me. Come in, but quietly, please." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again, thank the Light. I thought it was another knock in the night." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, don't you? Then you'll understand why I keep the good thread locked up; Danielle gives it away to anyone with a sad story." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sheri Zipstitch. Danielle does the talking and I do the accounts, which means I'm the one who worries whether we'll eat this winter. Was there something you needed?" },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "You move very quietly, don't you? Please don't do that up here; my heart can't stand it." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "Oh, a priest. I don't suppose you could say a prayer over the window? Something scratches at it most nights, and I'd feel better." },
      },
      again = {
        { id = "h_again", text = "What else? Only quietly, please." },
        { id = "h_again2", text = "Go on. Danielle's gone down to Eva's, so it's just me." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What scratches at your window?", next = "window" },
        { text = "How is business?", next = "business" },
        { text = "You and Danielle seem very different.", next = "danielle" },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    window = {
      lines = { { id = "w_default", text = "I don't know, and I've never looked. Danielle says it's a branch, but there's no tree on that side of the house, and the Watch says to keep the shutters closed and not ask." } },
      choices = {
        { text = "Do you want me to look?", next = "window_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    window_look = {
      big = true,
      lines = { { id = "wl_default", text = "No! Please don't. Whatever it is, it hasn't come in, and I'd rather not give it a reason. Some things in Duskwood are better left unseen." } },
      choices = {
        { text = "Fear only grows in the dark. Face it.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "You're right. Leave it alone.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "Poor, and getting poorer, though black cloth sells well enough. Danielle won't charge the Watch full price, and I can't make her, so I charge everyone else a little extra and feel terrible about it." } },
      choices = {
        { text = "Including me?", next = "business_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business_me = {
      lines = { { id = "bm_default", text = "Only a little, and only because you look like you can afford it. I'm sorry; it's for the Watch, if that helps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danielle = {
      lines = { { id = "d_default", text = "We are, and it's why the shop works. She charms them in and I make sure they pay on the way out, and between us we've kept the doors open longer than half of Darkshire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sewn in this house since I was a girl, and I've never once slept well in it." } },
    advice = { { id = "tp_ad", text = "Keep the shutters closed and the candles lit, and don't open the door to anyone who won't say their name." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd rather not find out, if it's all the same to you." } },
  },
}

-- Hogan Ference: a townsman who haunts the Town Hall.
P:NPC {
  key = "hogan", id = TODO_NPC("Hogan Ference"), name = "Hogan Ference",
  bible = "bibles/darkshire_shops.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "bitter" }, values = { "justice", "family" },
  impression = {
    first = "Hogan Ference waits in Darkshire's Town Hall every day to ask the council what they mean to do about the dead. Nobody has given him an answer, and he has stopped expecting one.",
    third = "{name} met Hogan Ference, a frustrated townsman who waits in Darkshire's Town Hall.",
  },
  greetings = {
    { id = "g_default", text = "You're not from Stormwind, are you? Then you're no use to me, but you may as well sit." },
    { id = "g_back", when = { metBefore = true }, text = "Still here, and so am I. The council still hasn't said a word." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hogan Ference, and I've been coming to this hall every morning for a month to ask the council one question, which is what they mean to do about the undead. I'll keep coming until somebody gives me an answer." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, at last! Are you here for the dead at Raven Hill? Say you are, because this town has prayed for one of you for years." },
        { id = "h_soldier", when = { origin = "human_city_guard" }, text = "You've the bearing of a Stormwind guardsman. Tell me, then, why your lot haven't come back for us, because nobody else in this hall will." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere better to be, more's the pity." },
        { id = "h_again2", text = "Ask, then. The council certainly won't." },
      },
      choices = {
        { text = "What do you want the council to do?", next = "council" },
        { text = "Why haven't Stormwind's guards come?", next = "stormwind" },
        { text = "What's happening at Raven Hill?", next = "raven" },
        { text = "I'll see what I can do.", next = "help" },
        { text = "Good luck, Hogan.", next = "END" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Something, anything at all. Lord Ebonlocke writes letters to Stormwind, Councilman Millstipe makes speeches, and Clerk Daltry files it all in a drawer, and meanwhile the dead walk the road to Raven Hill every night." } },
      choices = {
        { text = "They're doing what they can.", next = "council_can" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_can = {
      big = true,
      lines = { { id = "cc_default", text = "Then what they can isn't enough, and someone should say so. I'm not asking for miracles, only for the council to stop waiting and spend what coin we have on swords instead of letters." } },
      choices = {
        { text = "The council must follow proper channels. Be patient.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Stop writing and start fighting.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormwind = {
      lines = { { id = "s_default", text = "They pulled their soldiers out when the king went missing, and they've never sent them back. Now we have the Night Watch, which is brave, and small, and not nearly enough." } },
      choices = {
        { text = "Why don't you join the Watch?", next = "stormwind_watch" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    stormwind_watch = {
      lines = { { id = "sw_default", text = "I tried, and the commander said a man with my knees would only get someone killed. So I do what I can do, which is stand in this hall and make a nuisance of myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raven = {
      lines = { { id = "r_default", fx = { learn = { "raven_hill" } }, text = "The cemetery there won't keep its dead. They climb out at night and wander, and some say it isn't the curse at all but someone raising them on purpose." } },
      choices = {
        { text = "Who would do that?", next = "raven_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raven_who = {
      lines = { { id = "rw_default", text = "Someone who's lost his mind, or his heart, or both. Ask the Watch; they know more than they tell the rest of us, and maybe they'll tell you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = { { id = "h2_default", text = "Will you, now? Everyone says that, and then they go to the tavern. If you mean it, speak to Commander Ebonlocke, because she's the only one in Darkshire who actually does anything." } },
      choices = {
        { text = "I mean it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I farmed east of town until the dark came, and now I petition the council for a living, if you call it living." } },
    advice = { { id = "tp_ad", text = "Don't trust any promise made in this hall, friend. Trust the Watch, and your own two feet." } },
    _none = { { id = "tp_none", text = "Don't know, and don't care. Ask me about the dead, that's all anyone here talks about." } },
  },
}

-- Kzixx: a goblin selling rare goods by the road near the Darkened Bank.
P:NPC {
  key = "kzixx", id = TODO_NPC("Kzixx"), name = "Kzixx", title = "Rare Goods",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = {}, temper = { "smooth" }, values = { "greedy", "freedom" },
  notices = { "race" },
  impression = {
    first = "Kzixx sells rare goods from a roadside spot near the Darkened Bank and swears every item is unique. He claims nothing in the forest worries him much, so long as business is good.",
    third = "{name} met Kzixx, a goblin trader selling rare goods by the Darkened Bank road in Duskwood.",
  },
  greetings = {
    { id = "g_default", text = "Rare goods, friend, rare goods! Can't find these anywhere else, guaranteed." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer, back again! I've new stock, and it's even rarer." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Ha! Another goblin out in this wet dump? Don't you dare undercut me, pal; this road's mine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kzixx, purveyor of rare goods to the discerning traveller, and the less discerning ones too. Everything I sell is one of a kind, or at least one of a few, which is still pretty rare." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde, huh? Out here in Alliance country? Never mind, I don't care who you fight, I care who you pay, and your gold's as shiny as theirs." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! You folks appreciate quality, and quality's what I've got, at a quality price." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, and I'm losing both." },
        { id = "h_again2", text = "Ask away! Questions are free, but answers might cost ya." },
      },
      choices = {
        { text = "Show me what's rare.", next = "BUSINESS" },
        { text = "Why sell out here, in Duskwood?", next = "why" },
        { text = "Where do you get your stock?", next = "stock" },
        { text = "Aren't you afraid of the worgen?", next = "worgen" },
        { text = "I'll pass.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else is out here, so I've got no competition! Everybody passing through this forest is scared and in a hurry, and scared, hurried people buy things." } },
      choices = {
        { text = "That's taking advantage of frightened people.", next = "why_advantage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_advantage = {
      big = true,
      lines = { { id = "wa_default", text = "Taking advantage? I'm providing a service! They need something rare and powerful to get through this dump, and I happen to have it, at a fair price, considering the risk." } },
      choices = {
        { text = "A fair price would be lower.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Business is business. I respect that.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "s_default", text = "Here and there, pal, here and there. Adventurers sell me what they don't want, traders bring things up from Booty Bay, and sometimes a thing just turns up and I don't ask too many questions about where." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      lines = { { id = "wo_default", text = "Afraid? Sure, a little. But a worgen doesn't want my wares, and a goblin with a loud enough voice and a fast enough pair of legs can outrun most things in this forest." } },
      choices = {
        { text = "Has it come to running before?", next = "worgen_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen_run = {
      lines = { { id = "wr_default", text = "Twice! Once from a worgen, once from a customer who didn't like the price. The customer was faster, if you can believe it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Booty Bay born, Duskwood stuck, and rich enough to leave whenever I want, which is never, because business is good." } },
    advice = { { id = "tp_ad", text = "Never pay the first price, pal, unless it's mine; mine's always fair." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if you find one, I'll buy it from you." } },
  },
}
