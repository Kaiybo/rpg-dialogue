-- Winterspring folk an earlier pass missed. Everlook: Blixxrak and Nixxrak the armour merchants, Xizzer
-- Fizzbolt, Gogo and Jack Sterling. Starfall Village: Lyranne Feathersong and Syurana. The snows: Chal
-- Fairwind, Sar Browneye, Rilan Howard, and the imp Vi'el in Darkwhisper Gorge. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Blixxrak: Light Armor Merchant, Everlook.
P:NPC {
  key = "blixxrak", id = TODO_NPC("Blixxrak"), name = "Blixxrak", title = "Light Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "chatty", "smooth" }, values = { "profit", "practical" },
  notices = { "kit" },
  impression = {
    first = "Blixxrak sells cloth and leather armour in Everlook and can tell you the price of frostbite by the toe. He shares a shop with Nixxrak, who sells the heavy stuff, and the two of them argue about which of them the customer came in for.",
    third = "{name} met Blixxrak, who sells light armour in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in, and shut the door, pal, I'm payin' to heat this place! You want cloth or leather, because either way I got it lined with fur." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, you still got all your fingers! See, that's what buyin' quality does for ya." },
  },
  notice = {
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Whoa, whoa, you walked up here in a robe? Friend, that ain't an outfit in Winterspring, that's a shroud, and I can fix it for a very fair price." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Blixxrak, light armor, best margins north of Felwood. Robes, jerkins, gloves and boots, all of it cut for folks who like to move fast and stay warm, and I don't care which banner you march under so long as your coin's round." } },
      again = {
        { id = "h_again", text = "What else, friend? Time is money, and so is firewood." },
        { id = "h_again2", text = "Keep talkin', I'm only countin' stock." },
      },
      choices = {
        { text = "Who buys light armour in this cold?", next = "who" },
        { text = "You share the shop with Nixxrak.", next = "nixx" },
        { text = "Where do you get your furs?", next = "furs" },
        { text = "I'll browse later.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Everybody who got here wearin' the wrong thing, which is everybody. Mages, hunters, those druid types passin' through from Moonglade, they all show up blue in the lips and suddenly real interested in my prices." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nixx = {
      lines = { { id = "n_default", text = "Yeah, he's got the plate and mail on the other side, and we split the rent down the middle. He figures the big spenders are his on account of steel costs more, but I move three robes for every breastplate he shifts, so you do the sums." } },
      choices = {
        { text = "Is he family?", next = "family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "With a name like that, what do you think? Him, me and Wixxrak with the guns, we came up from the south together, and it's worked out, because a customer who buys a sword from one of us gets sent next door for the armor." } },
      choices = { { text = "A tidy arrangement. Something else.", next = "BACK" } },
    },
    furs = {
      lines = { { id = "fu_default", text = "The trappers bring 'em in off the hills, bear and owlbeast mostly, and I pay by the pelt. I don't buy frostsaber, before you ask, because the night elves up at the Rock take it personal and I got enough overhead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Steamwheedle born, pal, and I came north because nobody sells coats in Tanaris." } },
    _none = { { id = "tp_none", text = "Can't help ya there, friend. If it ain't on the rack, it ain't in my head." } },
  },
}

-- Nixxrak: Heavy Armor Merchant, Everlook.
P:NPC {
  key = "nixxrak", id = TODO_NPC("Nixxrak"), name = "Nixxrak", title = "Heavy Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "gruff", "shrewd" }, values = { "profit", "craft" },
  notices = { "kit" },
  impression = {
    first = "Nixxrak sells mail and plate in Everlook and raps every piece with his knuckles before he hands it over, to prove it rings. He is the quieter of the two armour merchants, which for a goblin still means he talks a good deal.",
    third = "{name} met Nixxrak, who sells heavy armour in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Mail and plate, friend, the real thing. Don't lick it, don't laugh, I've had to say that to three customers this winter." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Something got dented, or something got outgrown?" },
  },
  notice = {
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now here's somebody who knows what a pauldron's for. Listen, cold steel on bare skin up here will take the skin with it, so you want the padded lining, and I'm tellin' you that as a friend who also sells it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Nixxrak, heavy armor. Everything in here's been tested against the cold, because cheap steel goes brittle in Winterspring and cracks like a dinner plate, and a refund's no use to a customer in two pieces." } },
      again = {
        { id = "h_again", text = "Anything else, boss?" },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Steel really cracks in the cold?", next = "cracks" },
        { text = "Blixxrak says he outsells you.", next = "blix" },
        { text = "Who are your best customers?", next = "best" },
        { text = "I'll come back when I need plate.", next = "END" },
      },
    },
    cracks = {
      lines = { { id = "c_default", text = "The bad stuff does, and there's plenty of bad stuff sold south of here by people who never saw snow. I had a fella come in with a helmet split clean across from one yeti's backhand, and he bought the whole suit off me before he'd stopped shakin'." } },
      choices = {
        { text = "What makes yours better?", next = "better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = { { id = "b_default", text = "I buy from smiths who work thorium and know how to temper it slow, and I leave every piece out in the yard overnight before I'll put a price on it. If it rings in the mornin', it sells, and if it don't, it goes back with an invoice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blix = {
      lines = { { id = "bl_default", text = "By count, sure, because he's sellin' mittens. Ask him what one of his robes brings in next to one of my breastplates and watch him change the subject." } },
      choices = { { text = "I'll stay out of it. Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "be_default", text = "Dwarves and orcs, and I don't play favorites between 'em. They both buy heavy, they both pay on the spot, and they both spend the whole sale tellin' me how their people would've made it better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold armor from Ratchet to Everlook. Up here the weather does half my sellin' for me." } },
    _none = { { id = "tp_none", text = "Not my line, pal. Ask around the inn." } },
  },
}

-- Xizzer Fizzbolt: Engineering Supplies, Everlook.
P:NPC {
  key = "xizzer_fizzbolt", id = TODO_NPC("Xizzer Fizzbolt"), name = "Xizzer Fizzbolt", title = "Engineering Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "eager", "chatty" }, values = { "craft", "profit" },
  notices = { "craft" },
  impression = {
    first = "Xizzer Fizzbolt sells engineering supplies in Everlook from behind a counter with scorch marks on it. He says the cold is hard on machinery and wonderful for business, and he has one eyebrow to show for his own experiments.",
    third = "{name} met Xizzer Fizzbolt, who sells engineering supplies in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Bolts, fuses, powder, tubes! Whatever you're buildin', pal, I got the parts, and I don't ask what it's for." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's you, and nothing's on fire! So it worked, or you ain't tried it yet?" },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "That's grease under your nails and a burn on your sleeve, so you're in the trade. Sparks and sprockets, it's good to talk to somebody who knows a gyro from a gasket!" },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome in my shop, lookin' at my stock like it's homework. Go on, tell me how your people would've built it, I can take it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Xizzer Fizzbolt, engineering supplies. I keep every part a tinkerer could want this far north, because when your gizmo seizes up in a snowdrift you ain't walkin' back to Gadgetzan for a spring." } },
      again = {
        { id = "h_again", text = "What else ya need, friend?" },
        { id = "h_again2", text = "Ask away, I got a fuse to trim anyhow." },
      },
      choices = {
        { text = "What does the cold do to machines?", next = "cold" },
        { text = "What happened to your eyebrow?", next = "eyebrow" },
        { text = "Is there much engineering done in Everlook?", next = "town" },
        { text = "I'll be back for parts.", next = "END" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "Oil goes thick as porridge, springs snap, and blasting powder takes on damp and sulks. So you buy the thin oil and the dry powder off me, and it costs a little more, and that's still cheaper than a shredder that won't start with a yeti lookin' at ya." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eyebrow = {
      lines = { { id = "e_default", text = "A little disagreement with a batch of powder I was dryin' by the stove, which I now accept was a mistake in the method. The other one grew back fine last time, so I ain't worried, and the stove needed replacin' anyway." } },
      choices = {
        { text = "You dried blasting powder by a stove?", next = "stove" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stove = {
      lines = { { id = "s_default", text = "Look, it was a cold mornin' and it seemed efficient, and for about four seconds it was the driest powder in Kalimdor. I filed it under research costs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "More than you'd guess. The whole town's goblin-built, the walls and the heat both, and we got a gnome here, Umi, who's cooked up some kinda mechanical yeti that I'd pay good money to see the plans for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Tinker by trade, supplier by necessity. Sellin' the parts is safer than assemblin' 'em." } },
    _none = { { id = "tp_none", text = "Beats me, pal. If it don't tick, spin or blow up, I ain't studied it." } },
  },
}

-- Gogo: a goblin woman in Everlook.
P:NPC {
  key = "gogo", id = TODO_NPC("Gogo"), name = "Gogo", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "everlook" }, temper = { "cheerful", "smooth" }, values = { "friendly", "cunning" },
  notices = { "purse" },
  impression = {
    first = "Gogo is a goblin who idles about Everlook in a coat too fine for the weather and knows everybody's business in town. She laughed at most of what I said, and I am not sure all of it was meant to be funny.",
    third = "{name} met Gogo, a goblin woman with an ear for gossip in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Well, hello there, sweetheart! You look half frozen and all the way lost, and I just love a new face in town." },
    { id = "g_back", when = { metBefore = true }, text = "Look who's back! I was just tellin' somebody about you, and don't worry, it was mostly nice." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Oh, one of us, and not from around here! Sit down, hon, and tell me what they're wearin' in the south these days." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Gogo, and I don't sell a thing, which makes me the only honest goblin in Everlook. I keep folks company, I hear what's goin' on, and I pass it along to whoever asks nice." } },
      again = {
        { id = "h_again", text = "What else, sweetheart? I got all day." },
        { id = "h_again2", text = "Ooh, go on, ask me another." },
      },
      choices = {
        { text = "So what's going on in Everlook?", next = "news" },
        { text = "How do you make a living, then?", next = "living" },
        { text = "You have an admirer, I hear.", next = "kezzig" },
        { text = "Keep warm, Gogo.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The furbolgs on the road have gone mean, the yetis are worse, and Vizzie at the inn has raised her prices and blames the furbolgs. Oh, and somebody's been scarin' the daylights out of folks with a clockwork yeti, which is the best thing to happen here all winter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "l_default", text = "Friends, hon, I got a lot of generous friends. A girl who's good company never pays for her own dinner in a town where everybody else is countin' coppers and starin' at the snow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kezzig = {
      lines = { { id = "k_default", text = "You mean Kezzig Klackwhistle, and he's just a friend who likes to stop and chat. He's meant to be courtin' Lunnix at the mining shop, so if he spends a little long over here, well, I ain't the one who ought to be watchin' the clock." } },
      choices = {
        { text = "Lunnix won't like that.", next = "lunnix" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lunnix = {
      lines = { { id = "lx_default", text = "Lunnix has a pickaxe and a temper, and I'm fond of my head where it is. So let's say you never saw him here and I never said a word, and everybody in Everlook stays friends." } },
      choices = { { text = "I saw nothing. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came up to Everlook with a friend and stayed for the company. The weather sure wasn't the draw." } },
    _none = { { id = "tp_none", text = "Ooh, that one I ain't heard yet. Come back in a day or two, hon, I'll know by then." } },
  },
}

-- Jack Sterling: a human in Everlook.
P:NPC {
  key = "jack_sterling", id = TODO_NPC("Jack Sterling"), name = "Jack Sterling", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "everlook" }, temper = { "jovial", "wry" }, values = { "friendly", "practical" },
  notices = { "drink" },
  impression = {
    first = "Jack Sterling is a human who has settled into Everlook as though it were a seaside tavern with the wrong weather. He seems to be waiting out the winter, which in Winterspring is a long wait.",
    third = "{name} met Jack Sterling, a human passing a very long winter in Everlook.",
  },
  greetings = {
    { id = "g_default", text = "Pull up to the fire, {class}. Nobody in Everlook is in a hurry, since there's nowhere to hurry to that isn't under snow." },
    { id = "g_back", when = { metBefore = true }, text = "Still in Winterspring, are you? It gets hold of a person, though I couldn't tell you why." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've found the cure for the cold, I see. Go easy on it, friend, because the snow outside is a hard bed for a man who can't find the door." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human, this far north of anywhere! Tell me you've news from the Eastern Kingdoms, and I'll forgive you if it's old." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jack Sterling. I came to Everlook on a goblin's promise that there was money to be made up here, and there is, only it all seems to be made by goblins." } },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on, the fire's not going anywhere and neither am I." },
      },
      choices = {
        { text = "What money did the goblin promise?", next = "money" },
        { text = "Why not go home?", next = "home" },
        { text = "What's Everlook like to live in?", next = "town" },
        { text = "Stay warm, Jack.", next = "END" },
      },
    },
    money = {
      lines = { { id = "m_default", text = "Furs, thorium and rare herbs, all lying about for anyone with a strong back. What he left out was that the furs are still on the bears, the thorium is under the yetis, and the herbs grow where the furbolgs have gone mad." } },
      choices = {
        { text = "So you never made your fortune.", next = "fortune" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fortune = {
      lines = { { id = "f_default", text = "I made enough to pay Vizzie for the room, and I've counted that a victory. A man learns his measure in a place like this, and mine turned out to be a warm chair and a modest tab." } },
      choices = { { text = "There are worse measures. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = { { id = "ho_default", text = "It's a long road back through Felwood, and I liked that forest even less than I like the snow. I tell myself I'll go in the spring, though nobody here has been able to tell me when that is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "It's the only place I've lived where an orc, a dwarf and a dead man will stand in the same queue for stew without a word said. The goblins' bruisers see to the peace, and the cold sees to the rest, since nobody wants to be thrown out into it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a southerner who came north after easy money, and found it wasn't easy and wasn't much." } },
    _none = { { id = "tp_none", text = "You've got me there. Ask one of the goblins; they'll know, and they'll charge you." } },
  },
}

-- Lyranne Feathersong: Food & Drink, Starfall Village.
P:NPC {
  key = "lyranne_feathersong", id = TODO_NPC("Lyranne Feathersong"), name = "Lyranne Feathersong", title = "Food & Drink", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "gentle", "calm" }, values = { "kind", "nature" },
  notices = { "hunger" },
  impression = {
    first = "Lyranne Feathersong keeps the larder at Starfall Village, where everything must be carried up through the snow or coaxed out of it. She serves food the way a priestess gives a blessing, without hurry.",
    third = "{name} met Lyranne Feathersong, who sells food and drink at Starfall Village in Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. Come in from the wind and eat, for the snow takes more from the body than you will notice until it is too late." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned to Starfall. Sit, and I will see what is still warm." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Elune-adore, {g:brother|sister}. It is good to hear our own tongue on this hill, where the wind is usually the only one speaking." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "You are far from your own fires, and Starfall is not a place your people are often welcome. I will not refuse food to the hungry, but I ask that you eat quietly and go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Lyranne Feathersong, and I see that those who keep watch at Starfall are fed. It is a small duty beside the Sentinels' and the druids', but none of theirs could be done on an empty stomach." } },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, and warm yourself while you do." },
      },
      choices = {
        { text = "What grows in a land of snow?", next = "grows" },
        { text = "Why do your people keep a village here?", next = "village" },
        { text = "You share the larder's work with Natheril.", next = "natheril" },
        { text = "Thank you, Lyranne.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "g_default", text = "More than a stranger would think. There are winter squid in the lake and berries under the drifts, and the hot springs to the west keep a little green alive all year for those who know where to look." } },
      choices = {
        { text = "And the rest is carried up?", next = "carried" },
        { text = "Tell me of something else.", next = "BACK" },
      },
    },
    carried = {
      lines = { { id = "c_default", text = "From Darnassus by way of the coast, and then through Felwood, which spoils much of it. I have learned to trust dried fruit and hard bread, since neither has anything left for the corruption to take." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "v_default", text = "Because the ruins below us were Highborne, and what the Highborne left behind should not go unwatched. Wynd Nightchaser can tell you what stirs in them, and I think he would rather he could not." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
    natheril = {
      lines = { { id = "n_default", text = "Natheril sees to the traveller's pack, and I see to the traveller. He frets over everyone who walks out into the snow, and I have stopped telling him that fretting does not bring them back any sooner." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Starfall to serve those who watch the ruins. I have found the snow more peaceful than I expected." } },
    _none = { { id = "tp_none", text = "That is beyond what I know. Wynd Nightchaser keeps the watch here, and hears more than I do." } },
  },
}

-- Syurana: Trade Supplies, Starfall Village.
P:NPC {
  key = "syurana", id = TODO_NPC("Syurana"), name = "Syurana", title = "Trade Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "precise", "calm" }, values = { "craft", "careful" },
  notices = { "craft" },
  impression = {
    first = "Syurana sells thread, flux, vials and salt at Starfall Village, and keeps each in its own labelled box against the damp. She regards the goblins' town down the road with the patience of someone watching a child play with fire.",
    third = "{name} met Syurana, who sells trade supplies at Starfall Village in Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. If your craft needs thread, flux or a clean vial, I have them, and they have not been through goblin hands." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Did the last of it serve, or did the cold get into it?" },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy" } },
      text = "You have the hands of one who makes things. Then you will know why I keep my thread dry and my vials wrapped, and you will not ask me to hurry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Syurana. I keep the small things a crafter cannot work without, so that nobody at Starfall need walk to Everlook and be sold three things they did not ask for alongside the one they did." } },
      again = {
        { id = "h_again", text = "Is there something more?" },
        { id = "h_again2", text = "Ask, and I will answer as I am able." },
      },
      choices = {
        { text = "You don't care for Everlook.", next = "everlook" },
        { text = "Who crafts at Starfall?", next = "who" },
        { text = "Is it hard to keep stock in this cold?", next = "stock" },
        { text = "Elune light your work.", next = "END" },
      },
    },
    everlook = {
      lines = { { id = "e_default", text = "I do not dislike it, and I will say the goblins keep their walls well. But they have been in these mountains for a handful of years and already speak as though they owned the snow, and I have seen where that manner of thinking leads." } },
      choices = {
        { text = "Where does it lead?", next = "leads" },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    leads = {
      lines = { { id = "l_default", text = "Look down the hill at the ruins of Kel'Theril, under the ice. The Highborne were certain that the land was theirs to spend, and the land has outlasted them by ten thousand years." } },
      choices = { { text = "Let us speak of other things.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "The Sentinels mend their own leathers, and the druids brew what they need against the cold. We are few here, and so each of us has learned a second craft, and some a third." } },
      choices = { { text = "Let us speak of other things.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "The cold is kind to most of it, for nothing rots. It is the damp from the thaw at midday that I must guard against, since wet thread frays and wet flux is good for nothing." } },
      choices = { { text = "Let us speak of other things.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept a crafter's stores in one village or another for longer than the goblins have had a town." } },
    _none = { { id = "tp_none", text = "I cannot say. I keep supplies, and leave the wider world to those who walk in it." } },
  },
}

-- Chal Fairwind: Wintersaber Trainers, the small camp in north-eastern Winterspring near Umbranse's house.
P:NPC {
  key = "chal_fairwind", id = TODO_NPC("Chal Fairwind"), name = "Chal Fairwind", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "calm", "watchful" }, values = { "nature", "patient" },
  notices = { "pet" },
  impression = {
    first = "Chal Fairwind of the Wintersaber Trainers keeps a small camp in the hills north-east of Everlook, close by the Spiritspeaker's house. She watches the snow for sabers and says very little about why she is posted so far from Frostsaber Rock.",
    third = "{name} met Chal Fairwind of the Wintersaber Trainers, camped in the north-eastern hills of Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "Tread quietly, {class}. There is a frostsaber on the ridge above us, and she has not yet decided what she thinks of you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the sabers did not trouble you on the way. That speaks well of you." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = true },
      text = "{pet} walks at your heel without a leash, and watches where you watch. That is a true bond, hunter, and the trainers would respect it." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "The Horde has no friends among the Wintersaber Trainers. I will not raise a hand while you keep yours from the cats, but do not linger." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Chal Fairwind, of the Wintersaber Trainers. Rivern Frostwind keeps the Rock, where the sabers are raised, and I keep this side of the hills, where the wild ones come down to hunt." } },
      again = {
        { id = "h_again", text = "What more would you know?" },
        { id = "h_again2", text = "Ask softly, and I will answer." },
      },
      choices = {
        { text = "What do you watch for out here?", next = "watch" },
        { text = "Could you teach me to ride a frostsaber?", next = "ride" },
        { text = "A human lives in the house nearby.", next = "umbranse" },
        { text = "Elune watch your camp.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Which cats range where, which mothers have cubs, and who is taking pelts that are not theirs to take. The goblins' trappers know that we count, and most of them have learned to hunt bear instead." } },
      choices = {
        { text = "And those who haven't learned?", next = "poachers" },
        { text = "Another question.", next = "BACK" },
      },
    },
    poachers = {
      lines = { { id = "p_default", text = "The sabers usually teach them before I must. A frostsaber remembers a scent for years, and I have never yet had to bury a poacher that the cats did not find first." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    ride = {
      lines = { { id = "r_default", text = "That is not mine to grant. Go to Rivern Frostwind at Frostsaber Rock, north of here, and expect to labour a long while for the sabers before one of them will carry you." } },
      choices = { { text = "I'll seek Rivern out. Another question.", next = "BACK" } },
    },
    umbranse = {
      lines = { { id = "u_default", text = "Umbranse, who says he speaks with the dead. He keeps to his house and I keep to my fire, and the sabers give his door a wide berth, which tells me there is something to his claim." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have walked with the frostsabers since before these hills had a goblin town in them." } },
    _none = { { id = "tp_none", text = "The snow has not told me, and little else speaks out here." } },
  },
}

-- Sar Browneye: a tauren in northern Winterspring.
P:NPC {
  key = "sar_browneye", id = TODO_NPC("Sar Browneye"), name = "Sar Browneye", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "calm", "gentle" }, values = { "nature", "patient" },
  notices = { "race" },
  impression = {
    first = "Sar Browneye is a tauren who has made a camp in the northern snows of Winterspring, a long way from any grass. She watches the frostsabers hunt with a hunter's respect and has not once been heard to complain of the cold.",
    third = "{name} met Sar Browneye, a tauren hunter camped in northern Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "The winds bring you a long way north, {class}. Sit by the fire, for the Earth Mother sleeps very deeply under this snow and gives little warmth." },
    { id = "g_back", when = { metBefore = true }, text = "The snow has not kept you away. It is good to see a face I know." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains, here in the white country! Tell me that the grass still stands tall around Thunder Bluff, for I have begun to forget its colour." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "I have no quarrel with you, and the night elves on the Rock have left my fire alone. Let us both keep that peace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sar Browneye, of Thunder Bluff. I came north to see the great white cats that the night elves ride, because a hunter should know every beast the Earth Mother made, even the ones she hid in the snow." } },
      again = {
        { id = "h_again", text = "What else would you hear?" },
        { id = "h_again2", text = "Speak. The fire is patient, and so am I." },
      },
      choices = {
        { text = "What have you learned of the frostsabers?", next = "sabers" },
        { text = "This is hard country for a tauren.", next = "hard" },
        { text = "Who is the Forsaken who shares your camp?", next = "rilan" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    sabers = {
      lines = { { id = "s_default", text = "They hunt as the plainstriders run, without wasting a step, and a mother will go hungry for days before her cubs do. I had thought to take a pelt home, and I find now that I would rather take the story." } },
      choices = {
        { text = "The night elves ride them. Could a tauren?", next = "ride" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    ride = {
      lines = { { id = "r_default", text = "No cat ever born could carry one of us far, and the elves would not allow the trying. They have earned the sabers' trust over more years than my tribe can count, and I will not take by cunning what they gained by patience." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    hard = {
      lines = { { id = "h_default2", text = "It is, and I miss the smell of rain on warm earth more than I can say. But the ancestors walked through worse than snow to find Mulgore, and I am only visiting." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    rilan = {
      lines = { { id = "ri_default", text = "Rilan Howard, of the Undercity. He does not feel the cold and I do not understand his purpose here, but he keeps the fire through the night while I sleep, and that is enough for travelling companions." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a hunter of Thunder Bluff, come to look upon beasts the plains never showed me." } },
    _none = { { id = "tp_none", text = "The wind has carried me no word of that. Perhaps they know in Everlook." } },
  },
}

-- Rilan Howard: a Forsaken in northern Winterspring.
P:NPC {
  key = "rilan_howard", id = TODO_NPC("Rilan Howard"), name = "Rilan Howard", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "dry", "cold" }, values = { "curious", "practical" },
  notices = { "race" },
  impression = {
    first = "Rilan Howard is a Forsaken standing in the northern snows of Winterspring with frost on his shoulders that he has not troubled to brush off. He says the cold preserves him nicely, and he watches the night elves' saber ground with a clerk's attention.",
    third = "{name} met Rilan Howard, a Forsaken keeping watch in northern Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "You're shivering, {class}. I'd offer sympathy, but I gave up feeling the cold some years ago, along with most other things." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the snow. You living do enjoy testing how much you can endure." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of ours, this far from the Undercity. You'll have noticed that nothing rots up here, which makes it the healthiest climate either of us is likely to find." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf. You may tell your saber-keepers that I am only looking, and that I've no use at all for a cat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rilan Howard, late of Lordaeron and lately of the Undercity. I was sent to see what the night elves are about on that rock of theirs, and I have discovered that they are raising large cats, which I could have reported from a warmer distance." } },
      again = {
        { id = "h_again", text = "Was there more? I've nothing but time and ice." },
        { id = "h_again2", text = "Ask. It breaks up the watching." },
      },
      choices = {
        { text = "Who sent you?", next = "sent" },
        { text = "The cold doesn't trouble you at all?", next = "cold" },
        { text = "You travel with a tauren.", next = "sar" },
        { text = "I'll leave you to the snow.", next = "END" },
      },
    },
    sent = {
      lines = { { id = "s_default", text = "Someone in the Undercity who wished to know how the Alliance comes by its mounts, and whether the method might be borrowed. I shall tell them it requires several years of kindness, and I expect that to end the inquiry." } },
      choices = {
        { text = "The Forsaken can't manage kindness?", next = "kindness" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kindness = {
      lines = { { id = "k_default", text = "We can imitate it for an afternoon, as a rule. A frostsaber takes one sniff of a dead man and remembers urgent business elsewhere, and I find I can't fault the animal's judgment." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cold = {
      lines = { { id = "c_default", text = "It stiffens the joints a little in the mornings, and that is all. I'll confess there's a certain peace in a country where everything is as cold as I am." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sar = {
      lines = { { id = "sa_default", text = "Sar Browneye, who came for the cats and stays for reasons she calls reverence. She talks to the mountain and it doesn't answer, and she seems entirely content with the arrangement, which I envy more than I'd tell her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept accounts in Lordaeron before the plague. Now I keep them for the Undercity, on rather stranger subjects." } },
    _none = { { id = "tp_none", text = "I haven't been asked to look into that, and I don't volunteer." } },
  },
}

-- Vi'el: imp, Exotic Reagent Merchant, at the bottom of Darkwhisper Gorge.
P:NPC {
  key = "viel", id = TODO_NPC("Vi'el"), name = "Vi'el", title = "Exotic Reagent Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "sharp", "chatty" }, values = { "greedy", "cunning" },
  notices = { "warlock" },
  impression = {
    first = "At the bottom of Darkwhisper Gorge, past the demons, an imp called Vi'el keeps a shop of reagents I had never seen before. He was astonished that I had got in, and recovered quickly enough to try to sell me something.",
    third = "{name} met Vi'el, an imp who sells exotic reagents at the bottom of Darkwhisper Gorge in Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "What?! How did you get past the big fellow at the door? Oh, never mind, business has been dreadful, so come in and tell me which of your infernal needs I can meet." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {name}! Yes, I know your name, I'm a demon, it's what we do, and I know your true one as well, so I'd buy something expensive." },
  },
  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "A warlock! Don't get ideas, I'm already spoken for, and my master's contract has very ugly penalty clauses for anyone who tries to poach the help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Vi'el, exotic reagents, sole proprietor and, I regret to say, sole employee. I've got rods, runes and things in jars that would make your alchemist faint, and I can't stop myself buying whatever you put on the counter either, which is a curse I'd thank you not to abuse." } },
      again = {
        { id = "h_again", text = "Well? Buy, sell or ask, but do one of them!" },
        { id = "h_again2", text = "Yes, yes, what now?" },
      },
      choices = {
        { text = "Why is an imp keeping shop down here?", next = "why" },
        { text = "Who is your master?", next = "master" },
        { text = "Can you repair my armour?", next = "repair" },
        { text = "What would it cost to bind you instead?", next = "bind", when = { class = "WARLOCK" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the stock keeps better near the gorge's own foulness, and because nobody robs a shop with a doomguard on the path. The drawback, which nobody thought of, is that nobody shops at one either." } },
      choices = {
        { text = "Who are your customers, then?", next = "customers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Warlocks who want something they oughtn't to have, and the odd lunatic who fought his way down for the sport of it. You're the second kind, I'd guess, and I mean that as a compliment to your purse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = { { id = "m_default", text = "My warlock, and that's as much of a name as you're getting. Cause trouble in here and I'll call for him, and then we'll both be sorry, because he's in a foul mood whenever he's interrupted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    repair = {
      lines = { { id = "r_default", text = "Do I look like I own a hammer? Everlook's a mile or so north, and the goblins there will bang out your dents, so buy something from me first and then go and bother them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bind = {
      lines = { { id = "b_default", text = "Ooh, a new posting? It has been dull down here, and I shouldn't say that. No, no, forget I spoke, because the price would be a slice of your life, you'd never pay it, and my master reads my thoughts on alternate days." } },
      choices = { { text = "Keep your post, imp. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Summoned, bound and put behind a counter. I've had worse masters, and far worse hours." } },
    _none = { { id = "tp_none", text = "I might know, and I might sell it to you, but not at the price you're thinking of." } },
  },
}
