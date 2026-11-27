-- Folk an earlier pass missed. Voice: bibles/missed_folk.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Dane Winslow: demon trainer in the Northshire Abbey graveyard, beside Drusilla La Salle; unmakes a warlock's unwanted minion for a fee.
P:NPC {
  key = "dane_winslow", id = TODO_NPC("Dane Winslow"), name = "Dane Winslow", title = "Demon Trainer", gender = "male",
  bible = "bibles/missed_folk.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "polite", "cold" }, values = { "discretion", "profit" },
  notices = { "fel", "class", "light" },
  impression = {
    first = "Dane Winslow stands among the graves at Northshire with the manner of a notary and a trade no notary would own to. For a price he will see a warlock's minion unmade, and he speaks of it as tidying.",
    third = "{name} met Dane Winslow, who trains warlocks' demons in the graveyard at Northshire Abbey.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good, you're back. Your bindings have grown stronger, and I confess I've been looking forward to seeing them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak your business, and briefly. My patience with you is thinner than the veil." },
    { id = "g_default", text = "Good day. If you've no business with the things beyond, then mine isn't with you, and we may part friends." },
    { id = "g_2", when = { metBefore = true }, text = "You again. The Brothers haven't driven me off yet, as you see." },
    { id = "g_3", when = { class = "WARLOCK" }, text = "Ah, a practitioner. Are you weary of one of your charges, or only hoping for one with a more agreeable name?" },
  },
  notice = {
    { id = "n_1", cat = "fel", when = { class = "WARLOCK" },
      text = "If you'll forgive a professional remark, your minion's bound a touch loosely. It hasn't noticed yet, and I'd see to it before it does." },
    { id = "n_2", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Abbey's own. I pay my respects to the graves and trouble no one, and I'd be obliged if that were reported accurately." },
    { id = "n_3", cat = "class", when = { class = "MAGE" },
      text = "A student of the arcane. We're cousins of a sort, you and I, though your side of the family prefers not to say so at table." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I'm Dane Winslow. I instruct the servants that warlocks call up, and when a servant has outlived its use, I arrange for its dismissal, permanently, so that another may be summoned in its place. It's delicate work, and I'm paid for the delicacy." },
        { id = "hello_2", when = { class = "WARLOCK" }, narr = "He takes a small notebook from his coat and opens it to a clean page, pencil ready.", text = "I'm Dane Winslow. You know the art, so I'll be plain: I can teach your minions what they're slow to learn, and I can unmake one you've tired of, for a consideration. Mistress La Salle teaches the summoner, and I see to the summoned." },
        { id = "hello_3", when = { class = { "PRIEST", "PALADIN" } }, text = "I'm Dane Winslow. I expect you'd rather I gave my trade another name, so let us say I'm a keeper of difficult animals, and that none of them has ever got loose on consecrated ground." },
        { id = "hello_4", when = { class = "WARLOCK", minLevel = 20 }, text = "You've come a long way back to a graveyard, and with a good deal more on your books than when you left. I keep notes on every pairing I've seen, so tell me how they've treated you." },
      },
      again = {
        { id = "hello_again1", text = "Was there something further? Speak plainly; the dead here keep better hours than the living." },
        { id = "hello_again2", text = "Go on. I've a great deal of patience, because the work requires it." },
        { id = "hello_again3", when = { class = "WARLOCK" }, text = "Something more for the ledger, then?" },
      },
      choices = {
        { text = "Any pact I make, I'll honour to the letter.", next = "BACK", reply = "Wise. The things beyond read their contracts more carefully than any banker.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever binder breaks his pacts before the demon can.", next = "BACK", reply = "Many have thought so. Their headstones are in this very graveyard, if you'd like to read them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I need your services.", next = "BUSINESS" },
        { text = "Why work in a graveyard?", next = "graveyard" },
        { text = "What becomes of a minion you unmake?", next = "unmake" },
        { text = "What you do is an abomination.", next = "abomination" },
        { text = "My imp never stops talking. Is that usual, or should I silence it?", next = "imp", when = { class = "WARLOCK" } },
        { text = "Which servant is likeliest to slip its chains, Winslow?", next = "hardest", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "How do the abbey's brothers stand you?", next = "brothers" },
        { text = "You talk about binding as if it were a contract.", next = "contract", when = { class = "WARLOCK" } },
        { text = "Good day, Winslow.", next = "END" },
      },
    },
    graveyard = {
      lines = {
        { id = "graveyard_1", text = "It's quiet, the Brothers come out here only to bury, and nobody lingers to ask what a gentleman is doing among the headstones. Besides, the dead make undemanding neighbours; they don't inform on one, and they never ask to borrow anything." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    unmake = {
      lines = {
        { id = "unmake_1", text = "It goes back to wherever such things wait, with its bond to the summoner cut cleanly. I'm told it's unpleasant for the creature, though I've never heard one thank me; the imps have a great deal else to say on the way out." },
      },
      choices = {
        { text = "And the warlock?", next = "warlock" },
        { text = "I'd rather not know more. Something else.", next = "BACK" },
      },
    },
    warlock = {
      lines = {
        { id = "warlock_1", text = "The warlock is free to call another, with a new name and, one hopes, better manners. People imagine a warlock commands demons by the dozen, but in truth each has one particular servant of each kind, and some pairings are simply unhappy." },
      },
      choices = {
        { text = "Does the old one remember the warlock?", next = "warlock_remember", when = { class = "WARLOCK" } },
        { text = "Back to other matters, then.", next = "BACK" },
      },
    },
    warlock_remember = {
      lines = { { id = "wr_1", text = "I've always assumed so, and I've never met anyone who wanted to test it. That's the one clause in the arrangement I can't strike out for you, so I'd advise you not to unmake too many of them." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    abomination = {
      big = true,
      lines = {
        { id = "abomination_1", text = "So the Brothers tell me, in gentler words. I'd ask you to consider that these creatures are being summoned whether I stand here or not, and that I only make certain the ones in Elwynn are obedient and the disobedient ones are gone." },
      },
      choices = {
        { text = "Then better a careful hand than none.", next = "BACK", reply = "Just so. I'm glad to meet someone who thinks past the first shudder.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "No leash makes a demon safe. This should end.", next = "BACK", reply = "It's a common view, and an honest one. I'll go on being careful all the same.", fx = { align = { light = 1 } } },
        { text = "Let's leave it there.", next = "BACK" },
      },
    },
    imp = {
      lines = {
        { id = "imp_1", text = "Entirely usual, I regret to say. An imp obeys because it must and talks because it can, and the talking is where it keeps its rebellion, so give it work. A busy imp complains about the work instead, which is at least a change of subject." },
        { id = "imp_named", when = { pet = { family = "Imp" } }, text = "Entirely usual, I regret to say, and {pet} has been commenting on my coat since you arrived. An imp obeys because it must and talks because it can, so give it work; a busy imp complains about the work, which is at least a change of subject." },
      },
      choices = {
        { text = "What does it say when you're not listening?", next = "imp_say" },
        { text = "I'll keep it busy. Something else.", next = "BACK" },
      },
    },
    imp_say = {
      lines = { { id = "imp_say_1", text = "Mostly it boasts of the Legion's great lords, as though it had dined with them, and of what it will do to you when it's free. I write the boasts down, because now and then one of them is true, and Mistress La Salle likes to know which." } },
      choices = { { text = "That's unsettling. Let's talk of something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    contract = {
      lines = {
        { id = "contract_1", text = "Because it is one, and a far stricter one than any I drew up in Stormwind. The circle is the witness, the shard is the seal, and the terms are whatever your will can hold; the moment it holds less, the demon reads the clause you forgot." },
      },
      choices = {
        { text = "Then what clause do most warlocks forget?", next = "contract_clause" },
        { text = "Contracts can be broken by the stronger party.", next = "contract_broken" },
      },
    },
    contract_clause = {
      lines = { { id = "cc_1", text = "Duration. Young warlocks bind a servant and assume it's settled, as though a contract were a thing that happened once. It isn't; you are renewing it every moment the demon stands beside you, and the day you're tired, or frightened, or drunk in that inn, the term lapses." } },
      choices = { { text = "Every moment, then. I'll remember.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    contract_broken = {
      big = true,
      lines = { { id = "cb_1", text = "They can, and that's why one never wants to be the weaker party. Tell me, when you look at your servant, which of you do you believe is stronger?" } },
      choices = {
        { text = "I am. It obeys because I make it.", next = "BACK", reply = "Good, and keep believing it; belief is half the binding. The other half is never being wrong about it.", fx = { align = { order = 1 } } },
        { text = "It is, and it's only biding its time.", next = "BACK", reply = "An honest answer, and a rare one. Come and see me before it finishes biding.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_1", text = "The succubus, without question. A voidwalker resents you honestly and a felhunter only wants feeding, but she'll agree with everything you say for a month, and on the first day of the next you'll find you've been obeying her for three weeks." },
        { id = "hardest_succ", when = { pet = { family = "Succubus" } }, text = "The one at your side, and I say it with her listening, because she knows it already. She'll agree with everything you say for a month, and on the first day of the next you'll find you've been obeying her for three weeks." },
      },
      choices = {
        { text = "How do I know if it's already happened?", next = "hardest_know" },
        { text = "Then I'll watch her. Something else.", next = "BACK" },
      },
    },
    hardest_know = {
      lines = { { id = "hk_1", text = "Ask yourself when you last gave her an order she disliked. If you can't remember, then I'm afraid you have your answer, and you'll want to give one today, in front of witnesses." } },
      choices = { { text = "I'll give one today.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    brothers = {
      lines = {
        { id = "brothers_1", text = "With effort, on both sides. Brother Sammuel won't look at me, and Brother Neals looked once and then offered me wine, which I thought handsome of him. Marshal McBride has decided that so long as nothing follows me out of the graveyard, I'm the Abbey's problem and not his." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I kept accounts for a merchant house in Stormwind, once. One learns a great deal about binding contracts in that trade, and I found it carried over." } },
    northshire_abbey = { { id = "tp_northshire_abbey", text = "It's a good, plain house of the Light, and more tolerant than it knows. I've stood in its graveyard a good while now, and it has only prayed at me." } },
    advice = { { id = "tp_advice", text = "Never let a servant choose its own task, however small, because that's the first inch, and they are all of them patient." } },
    rumors = { { id = "tp_rumors", text = "A novice of the Abbey ran off with a book he'd no business reading. Mistress La Salle is displeased, and I'd not care to be the novice." } },
    _none = { { id = "tp_none", text = "That lies outside my field, and I never speak outside my field; it's how I've kept it." } },
  },
}

-- Donni Anthania: sells house cats from her cottage in the woods between Northshire, Goldshire and Stormwind; tea parties for the cats, and a small gravestone out front.
P:NPC {
  key = "donni_anthania", id = TODO_NPC("Donni Anthania"), name = "Donni Anthania", title = "Crazy Cat Lady", gender = "female",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "doting", "dotty" }, values = { "cats", "comfort" },
  notices = { "pet", "race", "class" },
  impression = {
    first = "Donni Anthania lives in a cottage full of cats in the woods above Goldshire and sells them only to people the cats approve of. She lays the tea table for a dozen, and only she uses a cup.",
    third = "{name} met Donni Anthania, who keeps and sells cats in a cottage in Elwynn Forest.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, dear! Come in, come in; the bombay's been at the window all morning waiting for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Mind Mister Whiskers, and the kittens cost what they cost, dear." },
    { id = "g_default", text = "Oh, hello, dear! Mind where you step, that's Mister Whiskers, and he was there first. Have you come about a kitten?" },
    { id = "g_2", when = { metBefore = true }, text = "You came back! The bombay's been asking after you. Well, she looked at the door twice, which is the same thing." },
    { id = "g_3", when = { class = "HUNTER" }, text = "Now you keep that beast of yours on its manners, dear. My babies were here first, and the tabby has never lost a fight." },
  },
  notice = {
    { id = "n_1", cat = "pet", when = { pet = { family = "Cat" } },
      text = "Oh, my word, look at the size of that one! Is it friendly? Does it like cream? {pet}, is it? What a dignified name. Come and meet everyone, {pet}." },
    { id = "n_2", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a great deal of animal to bring to a cat house, dear. If {pet} so much as sniffs at my silver tabby, I shall be very cross with the both of you." },
    { id = "n_3", cat = "race", when = { race = "NightElf" },
      text = "A night elf! Is it true your people ride cats as big as horses? Don't tell mine. They've quite enough ideas above their station as it is." },
  },
  start = "hello",
  nodes = {
    d6_buyers = {
      lines = { { id = "d6_buyers_a", text = "All sorts, dear, and the cats decide which of them goes home happy. A lady from Stormwind came last month in a carriage and the tabby wouldn't come out from under the stove for her, and the next day a farmer's girl from Goldshire took him home in her apron." } },
      choices = {
        { text = "The cats choose their owners, then.", next = "d6_buyers2" },
        { text = "My beast would like to meet your cats.", next = "d6_buyers2", when = { class = "HUNTER" } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    d6_buyers2 = {
      lines = {
        { id = "d6_buyers2_a", text = "Of course they do, dear, they always have, and anyone who thinks otherwise has never owned one. I only take the coin and pour the tea, and I write down where each one has gone, so I can send a card at midwinter." },
        { id = "d6_buyers2_hunter", when = { class = "HUNTER" }, text = "Oh, no, dear, please leave it outside the gate, there's a good hunter. The bombay would never forgive me, and the old ginger would go up the chimney and not come down till spring, and I'd have to talk him down with sardines again." },
      },
      choices = {
        { text = "A card at midwinter. That's sweet.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Donni.", next = "BACK" },
      },
    },
    d6_wolves = {
      lines = { { id = "d6_wolves_a", text = "They come sniffing round the fence in winter, dear, but a wolf's no match for seventeen cats on a rooftop all hissing at once. I once watched a big grey prowler turn tail and run from the cornish rex, who weighs less than a loaf of bread." } },
      choices = {
        { text = "Surely you worry for them at night?", next = "d6_wolves2" },
        { text = "A loaf of bread chasing a wolf. Brave cat.", next = "d6_wolves2" },
        { text = "Let's leave the wolves.", next = "BACK" },
      },
    },
    d6_wolves2 = {
      lines = { { id = "d6_wolves2_a", text = "Every night, dear, which is why they all come in at dusk and I count them on the hearth. I lost one to the woods three years ago, a little silver tabby, and I still leave a saucer by the door in case she remembers the way home." } },
      choices = {
        { text = "I hope she finds her way back.", next = "BACK" },
        { text = "Something else to ask you.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "I'm Donni, dear, and these are my babies. That's the bombay on the windowsill, the cornish rex is under the stove, the tabby's wherever she pleases, and the orange one doesn't have a name because he's never answered to any." },
        { id = "hello_2", when = { class = "DRUID" }, text = "I'm Donni, dear, and oh, you're one of the ones who can be a cat, aren't you? Don't do it in here, please. It upsets the silver tabby, and the last time the tabby proposed marriage." },
      },
      again = {
        { id = "hello_again1", text = "What else, dear? Sit down, don't mind the fur." },
        { id = "hello_again2", text = "Go on. The kettle's nearly ready." },
        { id = "hello_again3", text = "Yes, dear? Speak up, there's purring." },
      },
      choices = {
        { text = "A kitten should go to a good home, whatever it fetches.", next = "BACK", reply = "Oh, exactly, dear! I'd sooner keep one forever than sell it to someone unkind.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them to whoever pays most, kind or not.", next = "BACK", reply = "Oh, no, dear, no. Mister Whiskers would never forgive me, and nor would I.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'd like to see the kittens.", next = "BUSINESS" },
        { text = "How many cats live here?", next = "many" },
        { text = "Tell me about these tea parties.", next = "tea" },
        { text = "This many cats isn't healthy for a person.", next = "healthy" },
        { text = "There's a small gravestone outside your door.", next = "stone" },
        { text = "How do you keep so many beasts so calm?", next = "calm", when = { class = "HUNTER" } },
        { text = "A gnome could build you a self-filling milk dish.", next = "dish", when = { race = "Gnome" } },
        { text = "Who comes all this way to buy a kitten?", next = "d6_buyers" },
        { text = "Do the forest wolves ever bother the cats?", next = "d6_wolves" },
        { text = "Why doesn't the orange one have a name?", next = "e3_names" },
        { text = "Goodbye, Donni.", next = "END" },
      },
    },
    many = {
      lines = {
        { id = "many_1", text = "Seventeen at breakfast, dear, and I've never got the same number twice at supper. Some are mine and some are only visiting, and one of them I'm fairly sure belongs to Marshal Dughan, though he's too proud to come and ask." },
      },
      choices = {
        { text = "Don't you ever run short?", next = "short" },
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "Of cats? Bless you, no, dear, they find me. I open the door of a morning and there's a new one on the step, washing, as if it had an appointment. I only sell the ones who tell me they'd like to see the world." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tea = {
      lines = {
        { id = "tea_1", text = "Every afternoon at four. I put out the good cups and a saucer of cream at each place, and we talk over the day. The rex doesn't say much, but the bombay has opinions on everything, and the tabby usually leaves early." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    healthy = {
      big = true,
      lines = {
        { id = "healthy_1", text = "That's what my sister said, and she went to live in Stormwind with a husband who doesn't purr. I've a warm house and a full table and somebody pleased to see me every morning. I'd like to know what she's got that's healthier." },
      },
      choices = {
        { text = "If it makes you happy, it's nobody else's business.", next = "BACK", reply = "There, now. I knew you were a sensible one. The tabby said so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You've shut yourself away from people. That's no life.", next = "BACK", reply = "People are very loud, dear, and they never wash. But I shall think about it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = {
        { id = "stone_1", text = "That's Lord Underfoot, dear. He was the first, and the grandest, and he tripped every guest I ever had. I've told the bombay she's to be buried with me when my time comes, and she's agreed, provided it isn't soon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    calm = {
      lines = {
        { id = "calm_1", text = "I don't keep them anything, dear. You'd know that, having a beast of your own. I'm polite to them, I feed them on time, and I never pick one up that hasn't asked. It's more than most people manage with each other." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dish = {
      lines = {
        { id = "dish_1", text = "Would it bite? The last clever thing a gnome sold me was a mouse on a spring, and the tabby took it apart in a morning and left the pieces in my slipper. But a milk dish, now. I'd think about a milk dish." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_names = {
      lines = {
        { id = "e3_names_l0", text = "Oh, I've tried, dear, I've tried a dozen, and he looks at me as if I'd insulted his mother every time. I called him Marmalade for a month and he wouldn't come in for supper once, so now I just say \"you there\", and he comes running." },
      },
      choices = {
        { text = "Perhaps he already has a name, and won't tell.", next = "e3_names2" },
        { text = "\"You there\" suits him, then.", next = "BACK" },
      },
    },
    e3_names2 = {
      lines = {
        { id = "e3_names2_l0", text = "That's exactly what I think, dear, and I'd love to know what it is. The bombay knows, I'm certain, because she looks at him in a particular way when I get it wrong, and she's never once been unkind about it." },
      },
      choices = {
        { text = "Cats keep their own counsel. Something else.", next = "BACK" },
        { text = "He's just a stubborn cat, Donni.", next = "BACK" },
      },
    },
  },
  topics = {
    northshire_abbey = { { id = "tp_y_northshire_abbey", text = "The brothers send me their kitchen mousers when they get too old to mouse. I've three abbey cats, and they're the only ones who sit still for grace." } },
    kobolds = { { id = "tp_y_kobolds", text = "Nasty little things, with their candles. One came sniffing round the cream last winter, and the bombay saw it off before I'd found my broom." } },
    background = { { id = "tp_background", text = "I've always been here, dear, or it feels so. The cottage was my mother's, and the first cat was hers, and I've only added to the collection." } },
    advice = { { id = "tp_advice", text = "Let a cat come to you. It's the same with people, only people take longer and aren't so soft." } },
    rumors = { { id = "tp_rumors", text = "The tabby brought home a kobold's candle last week, still warm. I don't ask where she goes, but I do wish she'd stay off the mine road." } },
    goldshire = { { id = "tp_goldshire", text = "I go down for cream and fish on market days, and they're always kind. The innkeeper saves me the fish heads." } },
    _none = { { id = "tp_none", text = "I don't know about that, dear. Is it about cats? No? Then I shouldn't think I'd know." } },
  },
}

-- Eldrin: tailoring trainer in a house at the west end of the Eastvale Logging Camp. (Forever: ends Camping 101: Tailoring.)
P:NPC {
  key = "eldrin", id = TODO_NPC("Eldrin"), name = "Eldrin", title = "Tailoring Trainer", gender = "male",
  bible = "bibles/missed_folk.md", role = "trainer", tier = "service",
  communities = { "eastvale" }, temper = { "fastidious", "gentle" }, values = { "craft", "order" },
  notices = { "craft", "kit", "class" },
  impression = {
    first = "Eldrin teaches tailoring from a tidy house at the Eastvale Logging Camp and winces at a frayed cuff as other men wince at a wound. He will take up a needle for any stranger whose wardrobe offends him enough.",
    third = "{name} met Eldrin, the tailoring trainer at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, my student. Turn round, please; yes, your stitches have come along beautifully." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak your business, please. I'll teach you, but I'd rather you didn't touch the good linen." },
    { id = "g_default", text = "Good day, and oh, dear, I can tell at a glance that your wardrobe is in dire need of care. Do come in." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, you're back. Turn round for me, please; yes, the seam's held, and I'm gratified." },
    { id = "g_3", when = { questActive = TODO_QUEST("Camping 101: Tailoring") }, text = "You've the look of someone sent on an errand. Is this about a camp? I was told to expect it, and I've laid out the canvas." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, I see it in how you looked at my hems before my face. Splendid. We shall get on." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Forgive me, but that garment is being held together by habit. Sit down, and at least let me show you a whipstitch before it leaves you altogether." },
    { id = "n_3", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe. A real one, with a lining. You've no idea what a comfort that is to a tailor who lives among lumberjacks." },
  },
  start = "hello",
  nodes = {
    d6_eastvale = {
      lines = { { id = "d6_eastvale_a", text = "Quiet, at least between the axes, and the air smells of cut pine all day, which I find agrees with me. Marshal Haggard keeps the camp, and Rallic Finn makes bows two doors down, and between us we're very nearly a village." } },
      choices = {
        { text = "Is the camp safe this far from Goldshire?", next = "d6_eastvale2" },
        { text = "A tailor, a bowyer and a marshal. Quite a village.", next = "d6_eastvale2" },
        { text = "Let us move to another subject.", next = "BACK" },
      },
    },
    d6_eastvale2 = {
      lines = { { id = "d6_eastvale2_a", text = "Safe enough, though Marshal Haggard says the prowlers and bears in the woods grow bolder every season. He posts a notice for anyone who will thin them, and I mend the coats of those who answer it, which keeps me busier than I expected." } },
      choices = {
        { text = "Then I'll see the Marshal's notice.", next = "BACK", fx = { learn = { "eastvale" } } },
        { text = "Something else, Eldrin.", next = "BACK" },
      },
    },
    d6_finest = {
      lines = { { id = "d6_finest_a", text = "A christening gown for a logger's daughter, in plain white linen with a single row of tiny stitches at the hem. It took me a fortnight, because I unpicked it twice, and the logger cried when he saw it, which is the only review I've ever kept." } },
      choices = {
        { text = "Can you line my robes against the cold?", next = "d6_finest2", when = { class = "MAGE" } },
        { text = "Why unpick it twice?", next = "d6_finest2" },
        { text = "Plain work done perfectly. I see.", next = "d6_finest2" },
      },
    },
    d6_finest2 = {
      lines = {
        { id = "d6_finest2_a", text = "The first time, a stitch was crooked, and the second, the stitches were even but I was not happy, and that is reason enough. A child wears a christening gown for an hour and a family keeps it for a hundred years, so it ought to be worth keeping." },
        { id = "d6_finest2_mage", when = { class = "MAGE" }, text = "I can, with a layer of wool between the silk and the lining, and I can do it without spoiling the drape, which your Stormwind tailors never manage. Mages always come to me shivering and insisting they aren't, so you'll forgive me for having anticipated you." },
      },
      choices = {
        { text = "That's a craftsman's answer.", next = "BACK" },
        { text = "Something else I'd ask.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "I am Eldrin, and I teach the tailor's craft, from the first hem to a lined cloak. I keep house here at Eastvale because the air is clean, the rent is nothing, and the loggers go through shirts at a rate you would not believe." },
        { id = "hello_2", when = { profession = "Tailoring" }, text = "I am Eldrin, and you already have the needle-hand, so we may skip the thimble lecture. Tell me what you last made and what went wrong with it, and we'll begin from there." },
      },
      again = {
        { id = "hello_again1", text = "Is there anything else? I've a sleeve to set, but it will keep." },
        { id = "hello_again2", text = "Do go on. I can baste and listen." },
        { id = "hello_again3", text = "Yes? Ask away, and do stand still; your hem is crooked and it pains me." },
      },
      choices = {
        { text = "A tailor learns by stitching, seam after seam, without shortcuts.", next = "BACK", reply = "Just so. Every crooked seam teaches what a straight one cannot.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Glue the hems; nobody looks that closely.", next = "BACK", reply = "Oh, dear me. Somebody always looks, and usually at a wedding.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Why would a tailor live at a logging camp?", next = "camp" },
        { text = "What's the first thing a tailor should learn?", next = "learn" },
        { text = "Fine clothes are a waste out here.", next = "waste" },
        { text = "Sam Sarsaparilla sent me about a camp.", next = "camping", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "Where does good cloth come from, this far out?", next = "cloth", when = { profession = "Tailoring" } },
        { text = "What does a tailor make for someone in plate?", next = "plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "What's Eastvale like to live in?", next = "d6_eastvale" },
        { text = "What's the finest thing you've ever sewn?", next = "d6_finest" },
        { text = "Which logger tears the most shirts?", next = "e3_loggers" },
        { text = "Good day, Eldrin.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "camp_1", text = "For the quiet, at first. Stormwind's tailors are forever looking over one another's shoulders. Here the only one who watches me work is Supervisor Raelen, and she only wants to know when her foremen's shirts will be done." },
      },
      choices = {
        { text = "And the loggers?", next = "loggers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loggers = {
      lines = {
        { id = "loggers_1", text = "They tear a sleeve a day, each, and they'd wear the rags if I let them. I mend at cost. A man swinging an axe in a shirt that fits swings it better, and I've told Raelen she may count me as an improvement to her timber yield." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = {
        { id = "learn_1", text = "The plain running stitch, done evenly, a thousand times. Everyone wishes to begin with silk and embroidery. But a straight seam in honest linen is the whole craft in small, and I can tell a tailor's character from six inches of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      big = true,
      lines = {
        { id = "waste_1", text = "I hear that weekly, usually from someone whose trousers are tied on with twine. Clothes are the first thing anyone knows of you. A woodsman who keeps his collar mended is telling the world he hasn't given up, and the world answers accordingly." },
      },
      choices = {
        { text = "Care in small things shows care in all things.", next = "BACK", reply = "Precisely! I shall embroider that on something.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A man's worth isn't in his collar. Let them wear rags.", next = "BACK", reply = "His worth, no. But I notice the ones in rags are seldom the happy ones.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camping = {
      lines = {
        { id = "camping_1", text = "So he did. A camp wants canvas that sheds rain and a seam that won't open when the wind gets under it, and neither is difficult once you've been shown. Sit there, take this awl, and mind that you wax the thread; it's the wax that keeps the weather out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = {
        { id = "cloth_1", text = "Linen from the Stormwind weavers, by the wagon that brings the camp its flour, and wool from the farms along the river when the wolves have left any sheep. For anything finer, you want Rema Schneider in the city, and you may tell her I sent you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    plate = {
      lines = {
        { id = "plate_1", text = "Everything you don't see, and can't fight without. The padded arming coat, the cap under the helm, the lining that keeps a pauldron from flaying your shoulder. A smith makes the armour, but a tailor decides whether you can bear to wear it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_loggers = {
      lines = {
        { id = "e3_loggers_l0", text = "A great ox of a man called Rory, who swings an axe as if the tree had insulted him personally and splits a seam at the shoulder every second day. I've taken to sewing his shirts with a gusset under the arm, which he calls fussy and wears without complaint." },
      },
      choices = {
        { text = "Does he pay for all that mending?", next = "e3_loggers2" },
        { text = "A gusset for an ox. Practical.", next = "BACK" },
      },
    },
    e3_loggers2 = {
      lines = {
        { id = "e3_loggers2_l0", text = "In firewood, mostly, which I accept because Eastvale winters are cruel and Rory cuts beautifully even logs. It is the most honest bargain I have ever struck, and the warmest." },
      },
      choices = {
        { text = "That's a good trade. Something else.", next = "BACK" },
        { text = "Firewood won't pay the rent, surely.", next = "BACK" },
      },
    },
  },
  topics = {
    stormwind = { { id = "tp_y_stormwind", text = "Fine cloth and sharp tongues. I go in twice a year for silk thread, and I'm always glad of the road home." } },
    camping = { { id = "tp_y_camping", text = "A well-made camp is mostly good sewing, though nobody credits the tailor. Canvas, wax and a patient seam will keep out more weather than a fire will." } },
    background = { { id = "tp_background", text = "I trained in the Stormwind cloth halls and left when I could no longer stand the gossip. Eastvale has very little gossip, and what there is concerns horses." } },
    eastvale = { { id = "tp_eastvale", text = "Sawdust, horses, and decent, tired people. I've grown fond of it, though I do wish they'd wipe their boots." } },
    advice = { { id = "tp_advice", text = "Wax your thread, press your seams, and never cut cloth when you're angry." } },
    rumors = { { id = "tp_rumors", text = "The loggers say the wolves and bears have grown bold along the east road. I've mended three torn cloaks this week that bear them out." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my province. I know cloth, and I try not to have opinions on the rest." } },
  },
}

-- Jason Mathers: a fisherman who sells his catch from the small pier on Crystal Lake, beside Lee Brown, near Adele Fielder's house. (Forever: A Man About a Murloc, A Net Disaster, Baited for Success, Slimy Menace.)
P:NPC {
  key = "jason_mathers", id = TODO_NPC("Jason Mathers"), name = "Jason Mathers", title = "Fishmonger", gender = "male",
  bible = "bibles/missed_folk.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "plain", "wry" }, values = { "livelihood", "peace" },
  notices = { "craft", "hunger", "class" },
  impression = {
    first = "Jason Mathers sells the day's catch from a small pier on Crystal Lake, with one eye on the far shore where the murlocs are. He fishes for a living, which he says is not what Lee Brown does beside him.",
    third = "{name} met Jason Mathers, a fishmonger on the pier at Crystal Lake.",
  },
  greetings = {
    { id = "g_default", text = "Morning. Fresh off the lake, if you're buying. If you're only looking, look quietly, or Lee will give you the speech." },
    { id = "g_2", when = { metBefore = true }, text = "Back again. The fish haven't got any cheaper, nor any scarcer, which is about all I ask of a day." },
    { id = "g_3", when = { questActive = TODO_QUEST("A Net Disaster") }, text = "Any luck with what I asked? I've been fishing with a hand line since, like a boy, and Lee's enjoying it far too much." },
    { id = "g_4", when = { questActive = TODO_QUEST("Slimy Menace") }, text = "You're still in one piece, so they haven't had you yet. How many of the slimy devils are left on that shore?" },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Fishing" },
      text = "You fish. Good. Then you'll know what it is to have something else on the lake that wants your catch more than you do." },
    { id = "n_2", cat = "hunger", when = { profession = "Cooking" },
      text = "A cook, by the look of that pan on your pack. Take the longjaw; it holds together over a fire, and the smallfish don't." },
    { id = "n_3", cat = "class", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "You're armed, and you look as if you know the use of it. I might have work for you that pays better than buying my fish." },
  },
  start = "hello",
  nodes = {
    d6_catch = {
      lines = { { id = "d6_catch_a", text = "The Lion's Pride, every morning, for the stew and the fried plates, and Innkeeper Farley haggles like his own money's at stake, which it is. The rest goes to travellers, and to anyone cooking over a campfire who doesn't fancy another night of boar." } },
      choices = {
        { text = "What's the best way to cook longjaw snapper?", next = "d6_catch2", when = { profession = "Cooking" } },
        { text = "Does Farley pay you fairly?", next = "d6_catch2" },
        { text = "Boar every night does wear thin.", next = "d6_catch2" },
      },
    },
    d6_catch2 = {
      lines = {
        { id = "d6_catch2_a", text = "Fair enough, and on time, which matters more than a copper either way. He's never once short-changed me, and he's never once said a kind word about my fish, and I've decided those two things are related." },
        { id = "d6_catch2_cook", when = { profession = "Cooking" }, text = "Slow, over a low fire, with the skin on, so it doesn't fall apart on you. Longjaw's an ugly fish and a sweet one, and a bit of salt and a squeeze of something sour is all it wants; don't drown it in sauce like the inn does." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
        { text = "Something else, Jason.", next = "BACK" },
      },
    },
    d6_night = {
      lines = { { id = "d6_night_a", text = "Still as glass, mostly, and then you hear the murlocs singing on the east shore, if you can call it singing. Lee Brown says it's how they call each other in for the night, and I say it's how they tell each other where my nets are." } },
      choices = {
        { text = "Have you ever seen them come this far?", next = "d6_night2" },
        { text = "Lee Brown might be right.", next = "d6_night2" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    d6_night2 = {
      lines = { { id = "d6_night2_a", text = "Once, last autumn, three of them on the far end of this very pier, poking at the buckets. I threw a bucket at them and they threw it back, and I've wondered ever since whether that was a fight or a game to them." } },
      choices = {
        { text = "Murlocs with a sense of fair play.", next = "BACK", fx = { learn = { "murlocs_east" } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Jason Mathers, fishmonger. I net this lake at dawn and sell what I take by noon, to Goldshire's inn and to whoever walks down the path. It was a quiet trade until the murlocs moved onto the east shore and took to the same waters." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Slimy Menace") }, text = "Jason Mathers, and you're the one who cleared the east shore for me. I've had three full nets this week and not one webbed footprint on my pier. I'd forgotten the lake could be this dull, and I've missed it." },
        { id = "hello_3", when = { questActive = TODO_QUEST("A Man About a Murloc") }, text = "Jason Mathers. I've said my piece on those murlocs, and you've the errand in hand. Go and see about it, and then come and tell me I was right." },
      },
      again = {
        { id = "hello_again1", text = "Something else? The catch won't keep all day." },
        { id = "hello_again2", text = "Go on. I can gut and talk." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Let me see today's catch.", next = "BUSINESS" },
        { text = "What trouble are the murlocs giving you?", next = "murlocs" },
        { text = "You and Lee Brown share this pier.", next = "lee" },
        { text = "It's their lake as much as yours.", next = "theirs" },
        { text = "What's biting in Crystal Lake?", next = "biting", when = { profession = "Fishing" } },
        { text = "How are the nets holding up now?", next = "nets", when = { questDone = TODO_QUEST("A Net Disaster") } },
        { text = "What's this work you spoke of?", next = "work", when = { class = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE" } } },
        { text = "Who buys most of your catch?", next = "d6_catch" },
        { text = "What's the lake like after dark?", next = "d6_night" },
        { text = "How do you mend a net the murlocs have cut?", next = "e3_nets" },
        { text = "Good day, Jason.", next = "END" },
      },
    },
    murlocs = {
      lines = {
        { id = "murlocs_1", text = "They cut my nets for the fish in them, and when there are no fish they cut them anyway. I lost two good nets in a week and found one of my floats on a murloc's spear. I don't mind sharing a lake, but they don't share.", fx = { learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "Has anyone tried to drive them off?", next = "drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drive = {
      lines = {
        { id = "drive_1", text = "Marshal Dughan sent two guards east to look at the murlocs and the kobolds both, and they've not been seen since. After that the Marshal had fewer guards and no more time for a fishmonger's nets, and I can't fault him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lee = {
      lines = {
        { id = "lee_1", text = "We do. He fishes for the art of it and teaches anyone who'll stand still, and I fish for the inn's supper. He says I've no poetry in me. I say poetry doesn't fetch four coppers a pound, and we've stood side by side on these boards for years." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    theirs = {
      big = true,
      lines = {
        { id = "theirs_1", text = "I've thought that, some mornings. They were in the streams before there was a Goldshire. But I've a living to make and they've knives, and there's not a magistrate in the kingdom who'll hear a fisherman's suit against a murloc." },
      },
      choices = {
        { text = "Folk here have to eat. You've a right to defend your living.", next = "BACK", reply = "That's how it comes out, when I've done thinking. Thank you.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They were here first. Fish another shore.", next = "BACK", reply = "There's the one lake, friend. But you're not the first to say it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    biting = {
      lines = {
        { id = "biting_1", text = "Brilliant smallfish in the shallows and longjaw mud snapper off the deep end of the pier. Fish at first light and from the west bank. The east bank has more fish, and it has what eats them, and what cuts nets." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    nets = {
      lines = {
        { id = "nets_1", text = "Whole, for the first time in a month. I've mended and tarred them and hung them where I can see them from the house. Adele Fielder says I look at those nets the way her husband used to look at his sword." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_1", text = "It's the east shore. Somebody who can handle themselves needs to go round and make that camp think again about my side of the lake. I'd pay in coin and in fish, and I'd see you got the pick of the catch as long as I had this pier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_nets = {
      lines = {
        { id = "e3_nets_l0", text = "With a netting needle, a ball of tarred twine and a long evening by the fire, cursing the murlocs knot by knot. A torn net takes longer to mend than to make new, which they've no notion of, the slimy devils." },
        { id = "e3_nets_l1", when = { profession = "Fishing" }, text = "You'll know the job, I expect: a netting needle, tarred twine and an evening of cursing. A torn net takes longer to mend than to make, and the murlocs cut them in the middle where it's worst." },
      },
      choices = {
        { text = "Could you make a net they can't cut?", next = "e3_nets2" },
        { text = "I'd sooner fight the murlocs than mend nets.", next = "BACK" },
      },
    },
    e3_nets2 = {
      lines = {
        { id = "e3_nets2_l0", text = "I've tried wire, which rusted, and leather, which rotted, and Lee Brown's idea of hanging bells on it, which only told me they were cutting it while I lay in bed. The best net is one the murlocs aren't near, and that's a job for a sword, not a needle." },
      },
      choices = {
        { text = "Then I'll bring a sword. Something else.", next = "BACK" },
        { text = "Bells were a clever idea, at least.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "My father fished this lake, and his before. The house has changed and the pier's been rebuilt twice, but there's always been a Mathers with a net on Crystal Lake." } },
    goldshire = { { id = "tp_goldshire", text = "Farley at the inn takes half my catch, and Toddrick the butcher takes what's too ugly to serve whole. It's a good town for a man who sells supper." } },
    advice = { { id = "tp_advice", text = "Fish the dawn, mend at noon, and never leave a net in the water overnight on a lake with murlocs." } },
    rumors = { { id = "tp_rumors", text = "Lee swears he hooked something in the deep end that pulled like a horse. Lee's fish have a way of growing, so halve it, and it's still a big fish." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it's not in this lake, I've likely never seen it." } },
  },
}

-- Quartermaster Hicks: weapons quartermaster at the Westbrook Garrison, in the room to the right of the entrance, beside Hudson and Veldan Lightfoot.
P:NPC {
  key = "quartermaster_hicks", id = TODO_NPC("Quartermaster Hicks"), name = "Quartermaster Hicks", title = "Master Weaponsmith", gender = "male",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "steady", "terse" }, values = { "dutiful", "craft" },
  notices = { "soldier", "kit", "craft" },
  impression = {
    first = "Quartermaster Hicks keeps the weapons at Westbrook Garrison racked, oiled and counted, and can lay his hand on any of them in the dark. He says little, checks an edge twice, and trusts a blade more than a promise.",
    third = "{name} met Quartermaster Hicks, who keeps the weapons at Westbrook Garrison in Elwynn Forest.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again. Good. The better blades are in the back rack; sign for what you take." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Sign for what you take and move along. I've a garrison to arm." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Night issue. Sign for what you take, and bring it back with blood on it or not at all." },
    { id = "g_default", text = "Westbrook armoury. Swords on the left, axes on the right, and hands off the rack until you've said what you want." },
    { id = "g_2", when = { metBefore = true }, text = "You're back. How did the edge hold?" },
    { id = "g_3", when = { questActive = TODO_QUEST("Wanted: \"Hogger\"") }, text = "You're after Hogger, by that look. Then you'll want something that keeps its edge on bone. Come here." },
  },
  notice = {
    { id = "n_1", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry it properly, point down and hand loose. Good. I've had recruits in this week who hold a sword like a ladle." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That weapon's notched to the spine. I sell new ones, and there's a grindstone outside for the one you've got. Use both." },
    { id = "n_3", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've worked a forge. Tell me what you make of this tempering, and be honest; the garrison's smith is in Stormwind and I've nobody to ask." },
  },
  start = "hello",
  nodes = {
    d6_thin = {
      lines = { { id = "d6_thin_a", text = "It is. A dozen guards for a road that wants forty, because the rest went north with the army or east to Redridge. Deputy Rainer posts bounties so that adventurers do the work the men can't." } },
      choices = {
        { text = "And does it work?", next = "d6_thin2" },
        { text = "So we're the garrison's missing men.", next = "d6_thin2" },
        { text = "On to something else.", next = "BACK" },
      },
    },
    d6_thin2 = {
      lines = { { id = "d6_thin2_a", text = "Well enough, when the adventurers stay. Most leave for Westfall within the month, and the gnolls come back the week after, so I keep the racks full for whoever's next." } },
      choices = {
        { text = "Then I'll stay a while longer.", next = "BACK", fx = { learn = { "riverpaw" } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    d6_order = {
      lines = { { id = "d6_order_a", text = "Oil every blade on the first of the week, count every blade at the end of each day. A sword that's missing is a sword in a gnoll's hand, and I'd sooner be the one who notices." } },
      choices = {
        { text = "Have any gone missing?", next = "d6_order2" },
        { text = "Do you stock anything for a dwarf's hand?", next = "d6_order2", when = { race = "Dwarf" } },
        { text = "Let's leave it there.", next = "BACK" },
      },
    },
    d6_order2 = {
      lines = {
        { id = "d6_order2_a", text = "Two, since spring. One turned up in the river, and the other turned up in Hogger's camp, and the guard who'd signed for it is cleaning the stables until midsummer." },
        { id = "d6_order2_dwarf", when = { race = "Dwarf" }, text = "Axes and hammers, Ironforge pattern, three on the left rack. They were sent for a dwarven company that never came, and they're the best steel in this room." },
      },
      choices = {
        { text = "The stables seem a fair punishment.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Quartermaster Hicks, weapons, Westbrook Garrison. This post holds the west road against the Riverpaw gnolls and whatever comes over from Westfall, and every blade the guards carry out of that door was through my hands first." },
        { id = "hello_2", when = { origin = "human_city_guard" }, text = "Quartermaster Hicks, weapons. You've the city guard's training, so you'll know the issue sword. Mine are the same pattern, only I've put a proper edge on them, which the royal armoury never troubles to." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? Say it short; the rack needs counting." },
        { id = "hello_again2", text = "Go on. Short, if you can." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Garrison steel should go where it's needed, not where the coin is.", next = "BACK", reply = "Agreed. That's why I keep a ledger, and why I sleep at night.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A few blades could go missing; the garrison wouldn't notice.", next = "BACK", reply = "I'd notice. I count every one, and so would the man left without one.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the weapons.", next = "BUSINESS" },
        { text = "What does the garrison fight out here?", next = "fight" },
        { text = "You share this room with Hudson.", next = "hudson" },
        { text = "Peasants with weapons are just a danger to themselves.", next = "peasants" },
        { text = "What would you carry against gnolls?", next = "gnolls", when = { class = { "WARRIOR", "PALADIN", "ROGUE" } } },
        { text = "Would the garrison buy blades from me?", next = "buy", when = { profession = "Blacksmithing" } },
        { text = "Hogger's finished. I thought you'd want to know.", next = "hogger", when = { questDone = TODO_QUEST("Wanted: \"Hogger\"") } },
        { text = "This garrison seems thin on men.", next = "d6_thin" },
        { text = "How do you keep the blades in order?", next = "d6_order" },
        { text = "Who signed out the sword found in Hogger's camp?", next = "e3_signed" },
        { text = "Carry on, Quartermaster.", next = "END" },
      },
    },
    fight = {
      lines = {
        { id = "fight_1", text = "Riverpaw gnolls, in the woods south and west, more of them every month. Defias on the Westfall road, who are cleverer and fewer. And wolves and boars, which the recruits practise on before I'll let them near either of the others.", fx = { learn = { "riverpaw" } } },
      },
      choices = {
        { text = "Who leads the gnolls?", next = "leads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leads = {
      lines = {
        { id = "leads_1", text = "One they call Hogger, down by the river fork. Deputy Rainer has a bill posted for him. I've issued swords to four parties who went after him, and I've had two of the swords back, without the parties." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hudson = {
      lines = {
        { id = "hudson_1", text = "Him and Veldan Lightfoot both. Hudson has the armour and the shields, and never stops talking about what's going to kill us all. Lightfoot has the leathers and never stops selling. I stand between them and count swords." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peasants = {
      big = true,
      lines = {
        { id = "peasants_1", text = "I've heard officers say it. But the guard can't be at every farm, and the gnolls can. I'd sooner sell a farmer a short sword and show him which end to hold than read his name on the Deputy's list." },
      },
      choices = {
        { text = "Folk have a right to defend their own doors.", next = "BACK", reply = "They do. And I'll see they've something sharp to do it with.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Arms belong with trained soldiers. Leave defence to the guard.", next = "BACK", reply = "That's regulation, and I'd follow it if there were guards enough.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls = {
      lines = {
        { id = "gnolls_1", text = "An axe, or a mace. Gnolls wear whatever they've stolen, in layers, and a sword skates on it. Hit the shoulder, since they lead with it, and don't follow one that runs, because it's running toward its friends." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buy = {
      lines = {
        { id = "buy_1", text = "If they're plain and sound. I've no use for a pretty hilt. Bring me six short swords that'll take an edge and hold it through a week of bad handling, and I'll pay garrison rate and ask for six more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hogger = {
      lines = {
        { id = "hogger_1", text = "Is he, now. Then that's the first good report to cross this counter since spring. I'll tell the Deputy, and I'll tell Hudson, who'll explain to me why it only makes things worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_signed = {
      lines = {
        { id = "e3_signed_l0", text = "A young guard from Goldshire, Talan, who went out on the river road alone because he thought he could manage. He didn't come back, and his blade did, in a gnoll's fist." },
      },
      choices = {
        { text = "What did you do with the sword?", next = "e3_signed2" },
        { text = "The road's no place to go alone.", next = "BACK" },
      },
    },
    e3_signed2 = {
      lines = {
        { id = "e3_signed2_l0", text = "Cleaned it, sharpened it and put it back on the rack with his name scratched on the tang. It's the best blade I've got now, and I give it only to someone I think will come back." },
      },
      choices = {
        { text = "That's a fitting end for it. Something else.", next = "BACK" },
        { text = "I hope I'm worth that sword.", next = "BACK" },
      },
    },
  },
  topics = {
    riverpaw = { { id = "tp_y_riverpaw", text = "They fight in a pack and break when the big one falls. Kill the big one first." } },
    defias = { { id = "tp_y_defias", text = "Better armed every month, and with good Stormwind steel. Somebody inside the walls is selling to them." } },
    background = { { id = "tp_background", text = "Twelve years a footman, then a quartermaster when my shield arm went. I know what a bad blade costs because I've carried one." } },
    westfall = { { id = "tp_westfall", text = "The road west used to bring grain. Now it brings refugees, and the men who robbed them come a day behind." } },
    advice = { { id = "tp_advice", text = "Check your edge before you sleep, not when you wake. You'll not get time when you wake." } },
    rumors = { { id = "tp_rumors", text = "The guards say the gnolls have started wearing Stormwind mail. That mail came off somebody, and I'd like to know which patrol." } },
    _none = { { id = "tp_none", text = "Not my store. Ask Hudson; he'll have an opinion whether he knows or not." } },
  },
}

-- Quartermaster Hudson: armour and shield quartermaster at the Westbrook Garrison, beside Hicks and Veldan Lightfoot; the garrison's pessimist.
P:NPC {
  key = "quartermaster_hudson", id = TODO_NPC("Quartermaster Hudson"), name = "Quartermaster Hudson", title = "Armorer & Shieldcrafter", gender = "male",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "gloomy", "talkative" }, values = { "survival", "comrades" },
  notices = { "soldier", "kit", "greenness" },
  impression = {
    first = "Quartermaster Hudson issues armour and shields at Westbrook Garrison and expects the worst of every patrol, loudly. For all his gloom, nobody leaves his counter with a loose strap or an unpadded helm.",
    third = "{name} met Quartermaster Hudson, who keeps the armour and shields at Westbrook Garrison.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, you survived! That's rare enough out here that I kept a good shield back, just in case you did." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need; you'll be dead in those woods soon enough anyway, mark my words." },
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Out at night, are you? Wonderful. They can see in the dark, you know, and you can't. Take a second shield." },
    { id = "g_default", text = "Come for armour? Good, because you'll need it. Have you seen what's out in those woods? No, you haven't, or you'd be wearing more." },
    { id = "g_2", when = { metBefore = true }, text = "You're alive! That's a pleasant surprise, and I don't get many." },
    { id = "g_3", when = { maxLevel = 8 }, text = "Look at you, fresh off the abbey road with a wooden shield. They're sending us children now. Come here, let me find you something that'll stop a spear." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's had it, friend. One more gnoll and you'll be wearing it as a necklace. Sit down; I'm not letting you out of that door like that." },
    { id = "n_2", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A shield arm, and one that's been used. Good. Tell that to the recruits, will you? They think the shield's the thing you drop when you run." },
    { id = "n_3", cat = "greenness", when = { maxLevel = 10 },
      text = "You're new to this, aren't you? Don't be a hero. Heroes come back on a cart. Strap that tighter." },
  },
  start = "hello",
  nodes = {
    d6_worst = {
      lines = { { id = "d6_worst_a", text = "A young guard with his shield split clean in two by a gnoll's axe, and not a scratch on him, because he'd strapped it properly. I keep the halves on the wall behind the counter, and the recruits laugh at them until I tell them why they're there." } },
      choices = {
        { text = "That's a lesson worth hanging up.", next = "d6_worst2" },
        { text = "I'm a paladin. Would you fit my shield properly?", next = "d6_worst2", when = { class = "PALADIN" } },
        { text = "On to something else.", next = "BACK" },
      },
    },
    d6_worst2 = {
      lines = {
        { id = "d6_worst2_a", text = "It's the only cheerful thing in this room, if you ask me, and nobody does. The lad's still on the road, and he comes in every month to look at those halves and touch the wood, and I don't say a word when he does." },
        { id = "d6_worst2_pal", when = { class = "PALADIN" }, text = "I would, and I'll do it now, and I'll do it again next month when you've let the straps go slack. Paladins lean into a blow instead of away from it, so you'll want the upper strap tighter than most, or you'll be wearing the shield on your elbow by the second gnoll." },
      },
      choices = {
        { text = "You're more cheerful than you let on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Hudson.", next = "BACK" },
      },
    },
    d6_rainer = {
      lines = { { id = "d6_rainer_a", text = "He's a good deputy with too much road and too few men, and he knows it, and he still gets up every morning and posts another bounty. He tells me I'm too gloomy, and I tell him he's too hopeful, and between us we're about right." } },
      choices = {
        { text = "Does he ever take your warnings?", next = "d6_rainer2" },
        { text = "You two balance each other.", next = "d6_rainer2" },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    d6_rainer2 = {
      lines = { { id = "d6_rainer2_a", text = "When it matters. I told him Hogger was more than a big gnoll, and he laughed, and then he posted the bounty the next week. I don't say I told him so, because he'd stop listening, and then where would we be?" } },
      choices = {
        { text = "That's wisdom, not gloom.", next = "BACK", fx = { learn = { "hogger" } } },
        { text = "Something else I'd ask.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Quartermaster Hudson, armour and shields. We're a dozen guards holding a road with gnolls on one side and thieves on the other, and Stormwind's forgotten we're here. So I make sure that what we've got at least fits, because it's all that's between us and the end." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Wanted: \"Hogger\"") }, text = "Quartermaster Hudson, and you're the one who put down Hogger. I'll admit that's good news. Mind you, there'll be another just like him by harvest; there always is." },
      },
      again = {
        { id = "hello_again1", text = "What else? We've time, probably." },
        { id = "hello_again2", text = "Go on, I'm only counting what we've got left." },
        { id = "hello_again3", text = "Aye, what?" },
      },
      choices = {
        { text = "Every soldier here deserves armour that actually holds.", next = "BACK", reply = "They do, and I fight for it. Not that it'll help much against what's out there.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the dented mail to raw recruits; they won't last anyway.", next = "BACK", reply = "That's the gloomiest thing I've ever heard, and I'm the garrison's gloomiest man. No.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the armour.", next = "BUSINESS" },
        { text = "Is it really as bad as you say?", next = "bad" },
        { text = "What makes a good shield?", next = "shield" },
        { text = "Your gloom does the garrison no good.", next = "gloom" },
        { text = "What should I wear on the Westfall road?", next = "road", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm new to this. What do I need first?", next = "first", when = { maxLevel = 10 } },
        { text = "How do you get on with Hicks?", next = "hicks" },
        { text = "What's the worst you've seen come back through that door?", next = "d6_worst" },
        { text = "What do you make of Deputy Rainer?", next = "d6_rainer" },
        { text = "Why does everyone forget the helm?", next = "e3_helms" },
        { text = "Stay safe, Quartermaster.", next = "END" },
      },
    },
    bad = {
      lines = {
        { id = "bad_1", text = "Worse. The gnolls used to raid and run, and now they're building camps. The Defias used to rob wagons, and now they're recruiting. And every month the keep sends us fewer guards and a longer letter about how valued we are." },
      },
      choices = {
        { text = "Then why do you stay?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = {
        { id = "stay_1", text = "Where would I go? Besides, these lads would walk out of here with their helms on backwards if I weren't checking. Somebody has to expect the worst, so the rest of them are allowed to hope." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shield = {
      lines = {
        { id = "shield_1", text = "Seasoned oak, a steel rim, and straps you've fitted to your own arm and nobody else's. A shield that slips is worse than none, because you'll trust it. I fit every one myself, and I make them hit me with a stick before they leave." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gloom = {
      big = true,
      lines = {
        { id = "gloom_1", text = "So the Deputy says. But I've noticed that the ones who laugh at me check their straps all the same, on the way out. I'd sooner they were frightened and buckled than cheerful and dead." },
      },
      choices = {
        { text = "A warning that keeps men alive is worth the grumbling.", next = "BACK", reply = "There, you see, somebody understands! It won't help, mind, but thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fear spreads. A garrison needs courage, not doom.", next = "BACK", reply = "Courage, aye. I issue it in oak and steel. The talk's free.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_1", text = "Mail, and a full helm, never mind the heat. The Defias use bows from the hedgerows, and they aim for faces. Carry your shield on your arm, not your back, from the bridge onward. You'll feel a fool until the first arrow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_1", text = "A helm. Everybody buys the breastplate, because it looks the part, and then takes a club to the head from a kobold half their size. Helm, then shield, then boots that fit. The rest can wait until you've lived a month." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hicks = {
      lines = {
        { id = "hicks_1", text = "Hicks is the best quartermaster on this road, and he's said eleven words to me since midsummer. I do the talking for both of us. He thinks a sharp sword solves most things, and I think it only gets you close enough to need my armour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_helms = {
      lines = {
        { id = "e3_helms_l0", text = "Because a helm is hot and heavy and makes you look like a kettle, and a young fighter would sooner look brave than be alive. I've seen three lads come through this door with kobold dents in their skulls, and each of them swore he'd never needed one before." },
      },
      choices = {
        { text = "Did they buy one afterwards?", next = "e3_helms2" },
        { text = "I'll wear mine, Hudson.", next = "BACK" },
      },
    },
    e3_helms2 = {
      lines = {
        { id = "e3_helms2_l0", text = "All three, and two of them came back again with their helms dented instead, which I consider a triumph. The third went to Westfall and I've not heard, which is the sort of thing I mostly hear." },
      },
      choices = {
        { text = "Two out of three isn't bad. Something else.", next = "BACK" },
        { text = "You might cheer up a little.", next = "BACK" },
      },
    },
  },
  topics = {
    riverpaw = { { id = "tp_y_riverpaw", text = "Gnolls. Big, mean, and too many. I've counted their campfires from the wall, and I stopped at forty." } },
    defias = { { id = "tp_y_defias", text = "Masks and knives, and they know the patrol times better than we do. Don't tell me that's luck." } },
    background = { { id = "tp_background", text = "I was a shield-bearer in the king's levy, and I've the dents to show for it. They put me behind a counter when I started flinching at loud noises." } },
    westfall = { { id = "tp_westfall", text = "It's gone, as far as the crown's concerned. The folk there have a militia now, I hear, and good luck to them. They'll need it." } },
    advice = { { id = "tp_advice", text = "Tighten every strap, then tighten it again when you're tired. Tired is when it matters." } },
    rumors = { { id = "tp_rumors", text = "A patrol found a gnoll camp with a forge in it. A forge! We're finished the day they learn to make shields." } },
    _none = { { id = "tp_none", text = "I don't know, and I expect it's bad news whatever it is." } },
  },
}

-- Veldan Lightfoot: sells leather armour at the Westbrook Garrison, beside Quartermasters Hicks and Hudson.
P:NPC {
  key = "veldan_lightfoot", id = TODO_NPC("Veldan Lightfoot"), name = "Veldan Lightfoot", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "easy", "persuasive" }, values = { "trade", "craft" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Veldan Lightfoot sells leather armour from a corner of the Westbrook armoury, the only one of the three there who is no soldier. He talks while he fits a jerkin, and has usually sold the gloves too before he stops.",
    third = "{name} met Veldan Lightfoot, who sells leather armour at Westbrook Garrison.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, welcome back! That jerkin's worn in beautifully, and I've just the oil for it, as it happens." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need, friend, and save the small talk for someone else." },
    { id = "g_default", text = "Good day, good day! Leather's my line, friend, light on the shoulders and quiet in the woods. Let me look at the length of your arm." },
    { id = "g_2", when = { metBefore = true }, text = "Welcome back! That jerkin's worn in nicely. It'll be the better for a little oil, mind, which I happen to sell." },
    { id = "g_3", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "Now here's somebody who knows what they need. Step past the ironmongers, friend, the good stuff's in my corner." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those seams are opening, friend. I've a needle and I've better leather, and you may have the choice of either before you go back into those woods." },
    { id = "n_2", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll be for Hudson's counter, in all that plate. But think of a leather jerkin underneath, for the chafing. Every soldier here wears one of mine and won't admit it." },
    { id = "n_3", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You know hides! Then feel that one, there. Elwynn boar, bark-tanned, eight months in the pit. Nobody in Goldshire can show you its equal." },
  },
  start = "hello",
  nodes = {
    d6_bargain = {
      lines = { { id = "d6_bargain_a", text = "Gently, friend, and with a pot of tea on, because a hunter who's been in the woods for a week wants to sit down more than he wants to haggle. I pay a fair rate for clean hides and a poor one for butchered ones, and I tell them why, every time." } },
      choices = {
        { text = "Soft-soled boots? I'll take a pair of those.", next = "d6_bargain2", when = { class = "ROGUE" } },
        { text = "Do they listen to you?", next = "d6_bargain2" },
        { text = "Tea and honesty. A good method.", next = "d6_bargain2" },
      },
    },
    d6_bargain2 = {
      lines = {
        { id = "d6_bargain2_a", text = "The good ones do, and they come back with better hides the next time. The others go to Goldshire and get less for the same hide, and then they come back to me anyway, a little humbler, and I pour them a second cup." },
        { id = "d6_bargain2_rogue", when = { class = "ROGUE" }, text = "I thought you might, by the way you came in without my hearing the door. Doubled sole, boar leather, waxed at the seams, and I'll not ask what you need them quiet for, because the scouts never tell me either." },
      },
      choices = {
        { text = "You're a patient merchant, Veldan.", next = "BACK" },
        { text = "Something else, friend.", next = "BACK" },
      },
    },
    d6_west = {
      lines = { { id = "d6_west_a", text = "That it's worse every month, and the farmers who are left have given up on Stormwind and started guarding themselves. There's a man named Stoutmantle gathering them at Sentinel Hill, I hear, and calling it a People's Militia." } },
      choices = {
        { text = "Good on them for standing up.", next = "d6_west2" },
        { text = "A militia of farmers won't hold for long.", next = "d6_west2" },
        { text = "Let's leave Westfall.", next = "BACK" },
      },
    },
    d6_west2 = {
      lines = { { id = "d6_west2_a", text = "Maybe not, but they've nowhere else to stand. A militiaman came through last month to buy leather for twenty jerkins and paid me half in coin and half in promises, and I took the promises, because I'd want someone to take mine." } },
      choices = {
        { text = "That's generous of you.", next = "BACK", fx = { learn = { "people_militia" } } },
        { text = "Something else to ask.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "hello_1", text = "Veldan Lightfoot, leather armour. The garrison lets me keep a corner because the scouts won't wear mail, and because I pay my rent in mended belts. Hicks and Hudson handle the iron, and I look after everyone who has to move quietly." },
        { id = "hello_2", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "Veldan Lightfoot, and leather's your trade as much as mine, I see. I've jerkins, bracers and soft-soled boots, all cut for somebody who'd rather not be heard, and you may try on anything you like." },
      },
      again = {
        { id = "hello_again1", text = "What else can I show you? I've bracers just in, and a pair of gloves that'd suit you." },
        { id = "hello_again2", text = "Go on, friend. I can stitch and listen." },
        { id = "hello_again3", text = "Yes, yes, ask, friend, and I'll have measured your wrist before you've finished." },
      },
      choices = {
        { text = "A good salesman tells the buyer what the leather can't do.", next = "BACK", reply = "Ha! You've found me out. I do, though I make it sound charming.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good salesman sells anything, whether it fits or not.", next = "BACK", reply = "Oh, I could sell you anything, friend. But a poor fit walks back here angry.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your leathers.", next = "BUSINESS" },
        { text = "How does a merchant end up in a garrison?", next = "garrison" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "Leather won't stop a gnoll's axe.", next = "axe" },
        { text = "What do the garrison's scouts wear?", next = "scouts", when = { class = { "ROGUE", "HUNTER", "DRUID" } } },
        { text = "Would you buy hides or finished work?", next = "hides", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "What are Hicks and Hudson like to share a room with?", next = "neighbours" },
        { text = "How do you bargain with the hunters?", next = "d6_bargain" },
        { text = "What do the travellers say about Westfall?", next = "d6_west" },
        { text = "What did you sell on the old roadside stall?", next = "e3_stall" },
        { text = "Good day, Veldan.", next = "END" },
      },
    },
    garrison = {
      lines = {
        { id = "garrison_1", text = "I'd a stall on the west road, and the Riverpaw burned it one night with all my stock. Deputy Rainer said I could set up inside the walls if I'd see to the guards' straps and scabbards. It's the safest shop in Elwynn, and I've a captive market." },
      },
      choices = {
        { text = "Do you miss the road?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_1", text = "I miss the travellers. Farmers going in to market, pedlars, the odd dwarf. Now the only folk who use that road are soldiers and people running from Westfall, and neither has much to spend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = {
        { id = "leather_1", text = "Boar, from these woods, and the hunters bring it to me by the armful. Wolf, when I can get it, which is soft and warm. I tan behind the stables, downwind, and Hudson still complains, though Hudson would complain of roses." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    axe = {
      big = true,
      lines = {
        { id = "axe_1", text = "No, friend, it won't. It's not meant to. Leather's for the one who isn't there when the axe comes down. I've outfitted every scout this garrison has, and it's the scouts who come back to tell the men in plate where the gnolls are." },
      },
      choices = {
        { text = "Not being hit is the best armour there is.", next = "BACK", reply = "Ha! I may paint that over my corner, if Hicks will lend me the brush.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A soldier should stand and take the blow, not dodge it.", next = "BACK", reply = "Hudson says the same. And then he buys my padding for under his mail.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouts = {
      lines = {
        { id = "scouts_1", text = "Dark boar leather, oiled dull so it doesn't catch the light, and boots with a doubled sole that I stitch on the inside. They've walked up to Riverpaw fires in my boots and counted heads. One of them told me a gnoll looked straight at him and went back to its bone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hides_1", text = "Both, and gladly. Raw hides I'll take by weight, if they're cleanly skinned. Finished work I'll look over, and if the stitching's even I'll put it on my shelf with your mark on it. I'm one man with eleven guards to keep in belts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_1", text = "Like a day with no weather and a day with nothing but. Hicks hasn't an unnecessary word in him, and Hudson's convinced we'll all be dead by the first frost. I stand between them and sell gloves. Somebody in here has to be cheerful." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_stall = {
      lines = {
        { id = "e3_stall_l0", text = "Leather, boots, and a little of everything a traveller forgets: needles, laces, soap, and a very good line in waterskins. The Riverpaw took the waterskins when they burned it, and I still wonder what a gnoll wants with forty waterskins." },
      },
      choices = {
        { text = "Would you ever set up on the road again?", next = "e3_stall2" },
        { text = "Gnolls get thirsty, I suppose.", next = "BACK" },
      },
    },
    e3_stall2 = {
      lines = {
        { id = "e3_stall2_l0", text = "The day the Riverpaw go back to the hills and the Defias stop watching the hedges, friend, I'll be out there with a new awning before the dust settles. Until then, the garrison's corner is the safest stall on the road." },
      },
      choices = {
        { text = "I hope that day comes soon. Something else.", next = "BACK" },
        { text = "It may never come.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A tanner's son from the west road. I learned the trade over a pit behind the house and the selling at my mother's knee, and she was the better merchant." } },
    westfall = { { id = "tp_westfall", text = "I bought half my hides from Westfall farmers, once. They've no stock left to skin now, poor souls." } },
    advice = { { id = "tp_advice", text = "Oil your leather after rain and before frost. A cracked strap gives way at the worst moment it can find." } },
    rumors = { { id = "tp_rumors", text = "A hunter sold me a hide last week with a brand on it that I didn't know. Somebody's keeping cattle in those hills, and it isn't a farmer." } },
    riverpaw = { { id = "tp_riverpaw", text = "They burned my stall and wore my stock. I saw one last spring in a jerkin I'd cut myself, and I was nearly as flattered as I was furious." } },
    _none = { { id = "tp_none", text = "Can't help you there, friend, but have you thought about gloves?" } },
  },
}
