-- Desolace folk the roster scan found unwritten. Goblins: Bibbly F'utzbuckle at Kormek's Hut (Bone
-- Collector), Hornizz Brimbuzzle at the Kodo Graveyard (Ghost-o-plasm Round Up) and his sister Melizza,
-- caged in the Valley of Spears (Get Me Out of Here!). Shadowprey Village: Hae'Wilani (axes),
-- Lah'Mawhani (trade goods), Mai'Lahii (fishing supplies, Clam Bait), Tukk (general goods), Wulan
-- (cooking supplies). Ghost Walker Post: Narv Hidecrafter. Sar'theris Strand: the dryad Selendra
-- (Corruption of Earth and Seed). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bibbly F'utzbuckle: goblin bone dealer at Kormek's Hut. Bone Collector.
---------------------------------------------------------------------------
P:NPC {
  key = "bibbly_futzbuckle", id = TODO_NPC("Bibbly F'utzbuckle"), name = "Bibbly F'utzbuckle", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "jaunty" }, values = { "profit", "fun" },
  notices = { "class", "race" },
  impression = {
    first = "Bibbly F'utzbuckle cannot stand still outside Kormek's Hut, and every so often his shuffling turns into an outright dance. He is the only cheerful thing for a mile in any direction, and he seems to regard the Kodo Graveyard as a warehouse nobody has locked.",
    third = "{name} met Bibbly F'utzbuckle, a goblin at Kormek's Hut with an eye on the Kodo Graveyard.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, a customer! Or a supplier, which is even better, so step right up, pal, and don't mind the dancing." },
    { id = "g_back", when = { metBefore = true }, text = "There's my favourite business associate! Tell me you've come back with your pockets rattling, friend, because I love that sound." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Whoa, whoa, a tauren, and I can already see the look you're giving me. Listen, the kodos are done with the bones, and I'm only making sure they don't go to waste." },
    { id = "n_lock", cat = "class", when = { class = { "WARLOCK", "PRIEST" } },
      text = "You look like somebody who knows a thing or two about what's left after the dying's done. We should talk, pal, because I've got a stock problem and it keeps getting up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bibbly F'utzbuckle, dealer in fine antique kodo bone, at your service! There's a whole valley of the stuff lying around just north of here with no owner and no overhead, and all I'm short of is somebody to go and pick it up." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Bone Collector") }, text = "How's the bone business going, pal? I need ten good ones from the graveyard, clean and uncracked, and if something big and see-through objects, well, that's what I've got you for." },
        { id = "h_done", when = { questDone = TODO_QUEST("Bone Collector") }, text = "My best supplier walks again! Those bones went out on the first caravan, and I've been dancing ever since, though to be fair I was dancing before as well." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Talk fast, I've got a rhythm going here." },
        { id = "h_again2", text = "Still here? Great, I love an audience, so ask away." },
      },
      choices = {
        { text = "Who buys kodo bones?", next = "buyers" },
        { text = "Why don't you collect them yourself?", next = "yourself" },
        { text = "Why are you dancing?", next = "dance" },
        { text = "The tauren hold that graveyard sacred.", next = "sacred" },
        { text = "The spirits there took it badly.", next = "spirits", when = { questDone = TODO_QUEST("Bone Collector") } },
        { text = "I'll see about your bones.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Everybody, pal, that's the beauty of it! Carvers want it, alchemists grind it, and there's a fella in Ratchet who makes buttons, and the margin on a button would bring a tear to your eye." } },
      choices = {
        { text = "Buttons? From a great kodo?", next = "buyers_buttons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_buttons = {
      lines = { { id = "bb_default", text = "Do the sums with me, friend. One kodo rib makes four hundred buttons, and a coat needs six, so every bone you carry out of there is sixty-odd coats that somebody in Booty Bay can't close without me.", fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "And my share of four hundred buttons?", next = "buyers_share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_share = {
      lines = { { id = "bs_default", text = "Listen, listen, you get a fair finder's rate, the same as anybody. I've got cartage, breakage and the fact that I'm standing in Desolace to cover, so don't go thinking the whole four hundred lands in my pocket." } },
      choices = {
        { text = "Your overhead is a hut you don't own.", next = "BACK", when = { any = { { class = "ROGUE" }, { race = "Goblin" } } }, reply = "Ha! All right, you've done this before. Keep that between us and we'll get along fine, pal.", fx = { affinity = 1 } },
        { text = "Fair is fair. Something else.", next = "BACK" },
      },
    },
    yourself = {
      lines = { { id = "y_default", text = "Because the stock has a liability issue, is why. You lift a bone and now and then a kodo the size of a zeppelin comes up out of the ground, all glowing and upset, and I'm a management type with a delicate build." } },
      choices = { { text = "So the risk is all mine. Something else.", next = "BACK" } },
    },
    dance = {
      lines = { { id = "d_default", text = "Because I'm standing next to free inventory, friend, and there's no feeling like it! Also the ground out here gets hot enough to cook on, and if I stop moving my boots start to smell like supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sacred = {
      big = true,
      lines = { { id = "s_default", text = "Sure, sure, and I respect that, I really do. But nobody's filed a claim, nobody's posted a guard, and in my line of work sacred is just a word for stock that hasn't been priced yet." } },
      choices = {
        { text = "The dead should be left in peace.", next = "BACK", reply = "Then leave 'em in peace, pal, nobody's twisting your arm. I'll only say the next fella along won't ask so nicely.", fx = { align = { light = 1 } } },
        { text = "Bones are bones. They're no use to the kodo.", next = "BACK", reply = "Now that's the attitude that built Ratchet! We're going to do very well together, you and me.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "Yeah, I heard the bellowing from here, and I'm writing it down as a cost of doing business. You came back with all your limbs and I got my bones, so by my ledger that's a clean transaction." } },
      choices = { { text = "Your ledger is missing a column. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came out from Ratchet on a tip about unclaimed goods, and for once the tip was good." } },
    steamwheedle = { { id = "tp_sw", text = "Everything I ship goes through Cartel ports, and they take their slice, same as the tide." } },
    centaur = { { id = "tp_ce", text = "Terrible customers, pal, since they take what they want and they've never heard of an invoice." } },
    _none = { { id = "tp_none", text = "Can't help you there, friend, unless there's a bone in it somewhere." } },
  },
}

---------------------------------------------------------------------------
-- Hornizz Brimbuzzle: goblin at the southwest end of the Kodo Graveyard. Ghost-o-plasm Round Up.
---------------------------------------------------------------------------
P:NPC {
  key = "hornizz_brimbuzzle", id = TODO_NPC("Hornizz Brimbuzzle"), name = "Hornizz Brimbuzzle", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "harried" }, values = { "profit", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Hornizz Brimbuzzle has a small camp at the southwest end of the Kodo Graveyard, crowded with crates that hum faintly. He talks about his scheme very fast, and then he looks south toward the centaur camps and goes quiet.",
    third = "{name} met Hornizz Brimbuzzle, a goblin with a camp at the edge of the Kodo Graveyard.",
  },
  greetings = {
    { id = "g_default", text = "You're not a centaur and you're not a ghost, so you're the best thing I've seen all week. Pull up a crate, pal, but not that one, because that one bites." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, good, because the work hasn't gone anywhere and neither have I." },
    { id = "g_sister", when = { questDone = TODO_QUEST("Get Me Out of Here!") }, text = "There's the one who got my sister out! Sit down, friend, your credit's good at this camp for as long as I've got one." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "WARLOCK" } },
      text = "You're the type who deals with spirits for a living, right? Great, then maybe you can tell me why mine keep trying to kill the help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hornizz Brimbuzzle, out of Ratchet. I've got a product nobody else has thought of and a sister nobody's seen in days, and I'd trade the first for the second in a heartbeat, so don't tell anyone I said that." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Ghost-o-plasm Round Up") }, text = "You've got the crate of magnets, right? Set it down in the Valley of Bones, stand well back, and scrape up what the spooks leave behind, because that's my whole season's revenue in there." },
        { id = "h_freed", tags = { "news" }, when = { questDone = TODO_QUEST("Get Me Out of Here!") }, text = "Hornizz Brimbuzzle, and a happier one than you met before, because Melizza's back and already telling me everything I've done wrong. I've never been so glad to be yelled at." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Keep it quick, the crates get restless." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "What exactly is ghost-o-plasm?", next = "plasm" },
        { text = "Tell me about your sister.", next = "sister", when = { ["not"] = { questDone = TODO_QUEST("Get Me Out of Here!") } } },
        { text = "I found Melizza. She's safe now.", next = "sister_safe", when = { questDone = TODO_QUEST("Get Me Out of Here!") } },
        { text = "Why camp beside a graveyard?", next = "camp" },
        { text = "Ghost magnets sound like a bad idea.", next = "magnets" },
        { text = "I'll be going.", next = "END" },
      },
    },
    plasm = {
      lines = { { id = "p_default", text = "It's the residue a spirit leaves when you pull it out of the air too fast, sort of a glowing slime. Stinks like a wet ogre, and it'll hold a charge better than anything I ever bought in Ratchet." } },
      choices = {
        { text = "And who pays for glowing slime?", next = "plasm_buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plasm_buyers = {
      lines = { { id = "pb_default", text = "The Magram, that's who! They're crazy for anything to do with their dead, and I figure a clan that worships its ancestors will pay through the nose for a jar of one.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "You'd sell centaur their own ancestors?", next = "plasm_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plasm_sell = {
      big = true,
      lines = { { id = "ps_default", text = "When you say it like that it sounds bad, sure. I prefer to think I'm reuniting families, at a reasonable markup, with a no-returns policy on account of the customers being centaur." } },
      choices = {
        { text = "Some things shouldn't be for sale, Hornizz.", next = "BACK", reply = "Yeah, my sister says the same thing, and then she asks what my margins are. I'll think about it, pal, which is more than I usually do.", fx = { align = { light = 1 } } },
        { text = "If they'll pay, sell it to them.", next = "BACK", reply = "That's what I keep telling myself! Time is money, friend, and so, it turns out, are dead centaur.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = { { id = "s_default", text = "Melizza came out from Gadgetzan to help me with the books, and she went south to scout for buyers, because she's the one with the nerve in the family. She hasn't come back, and the Maraudine don't take prisoners for the conversation." } },
      choices = {
        { text = "Where would they hold her?", next = "sister_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister_where = {
      lines = { { id = "sw_default", text = "They've got cages in the Valley of Spears, down south where the Maraudine keep their big camp. I can't fight my way in and I can't pay my way in, so if you're ever down that way, pal, keep an eye out for a goblin with a very loud voice." } },
      choices = { { text = "I'll look for her.", next = "BACK", fx = { affinity = 2 } } },
    },
    sister_safe = {
      lines = { { id = "ss_default", text = "I know it, and I owe you more than I can put on an invoice. She walked into camp cursing the centaur, the weather and my bookkeeping in that order, and I had to turn around so she wouldn't see my face." } },
      choices = { { text = "Look after each other. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "c_default", text = "Location, friend. The kodos come here to die, the centaur come here to fight over it, and wherever there's that much dying there's spirits, and spirits are my raw material. The rent's nothing, too, on account of nobody sane wanting the place." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magnets = {
      lines = { { id = "m_default", text = "They're a great idea with a couple of wrinkles. The first batch pulled in more ghosts than my last crew could handle, which is why they're lying up in the Valley of Bones, and why I'm hiring instead of going myself." } },
      choices = {
        { text = "You left your crew where they fell?", next = "BACK", reply = "I sent their pay home to their families, every copper, and I'm not going back in there for a burial detail. Call me what you like, pal." },
        { text = "I can settle a restless spirit.", next = "BACK", when = { class = { "PRIEST", "SHAMAN" } }, reply = "Then you're worth double to me, and I mean that as a figure of speech, so don't go quoting it.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ratchet born, Ratchet trained, and out here because every good idea back home already had six partners in it." } },
    centaur = { { id = "tp_ce", text = "The Magram might be customers, the Maraudine took my sister, and none of them are what you'd call good for business." } },
    steamwheedle = { { id = "tp_sw", text = "I've got no Cartel backing out here, pal, which means no Cartel cut and no Cartel bruisers either." } },
    gadgetzan = { { id = "tp_gz", text = "Melizza's town, down in Tanaris. She says it's civilised, by which she means the sand's been swept." } },
    _none = { { id = "tp_none", text = "No idea, friend, and I've got ghosts in crates to worry about." } },
  },
}

---------------------------------------------------------------------------
-- Melizza Brimbuzzle: goblin caged by the Maraudine in the Valley of Spears. Get Me Out of Here!
---------------------------------------------------------------------------
P:NPC {
  key = "melizza_brimbuzzle", id = TODO_NPC("Melizza Brimbuzzle"), name = "Melizza Brimbuzzle", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "sharp" }, values = { "nerve", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Melizza Brimbuzzle is locked in a wooden cage in the Maraudine camp at the north of the Valley of Spears, and she is furious about it rather than frightened. She starts negotiating her rescue before anyone has offered one.",
    third = "{name} found Melizza Brimbuzzle, a goblin caged by the Maraudine centaur in the Valley of Spears.",
  },
  greetings = {
    { id = "g_default", text = "Psst, over here, and keep your voice down! You've got two legs and you're not trying to eat me, so you're hired." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Good, because I'd nearly finished chewing through this bar and I'd hate to waste the teeth." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Tell me you can pick a lock, sweetheart. It's a centaur lock, so it's mostly a knot, but I can't reach it from in here." },
    { id = "n_big", cat = "race", when = { race = { "Tauren", "Orc" } },
      text = "Oh, perfect, somebody big! You go in front, and I'll stay behind and tell you who to hit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Melizza Brimbuzzle, of Gadgetzan, and currently the property of a bunch of four-legged morons. Get me out of this cage and walk me clear of their camp, and I'll make it worth your while the minute I'm somewhere I can reach my purse." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Get Me Out of Here!") }, text = "What are we standing around for? Stay close, hit anything with hooves, and don't let me out of your sight until we're well clear of the spears." },
        { id = "h_done", when = { questDone = TODO_QUEST("Get Me Out of Here!") }, text = "Well, look who it is, my own personal bodyguard! I meant what I said about making it worth your while, and a Brimbuzzle pays her debts, unlike some brothers I could name." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it fast, the big ugly one comes back on the hour." },
        { id = "h_again2", text = "Talk quick, friend." },
      },
      choices = {
        { text = "How did you end up in a cage?", next = "how" },
        { text = "What do the Maraudine want with you?", next = "want" },
        { text = "Your brother is sick with worry.", next = "brother", when = { heardLine = "hornizz_brimbuzzle.s_default" } },
        { text = "What's the plan once you're out?", next = "plan" },
        { text = "Hold on. I'll get you out.", next = "END", fx = { affinity = 1 } },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "I came down here to find my brother some buyers, because he's got a head for product and none for people. I figured the Maraudine were the biggest clan, so they'd have the biggest purse, and it turns out what they've got is the biggest cages." } },
      choices = {
        { text = "You tried to sell to the Maraudine?", next = "how_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_sell = {
      lines = { { id = "hs_default", text = "I got as far as hello, sweetheart. Then one of them picked me up by the collar like a sack of oats, and I've been in here ever since, listening to them argue about whether goblins taste better roasted.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "What did they decide?", next = "how_decide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_decide = {
      lines = { { id = "hd_default", text = "They hadn't, last I heard, which is the only reason I'm still talking. I told them I was poisonous and worth a ransom, and they're not sure enough of either one to light the fire yet." } },
      choices = {
        { text = "Quick thinking.", next = "BACK", reply = "It's the family business, friend, and I'm the one who's good at it.", fx = { affinity = 1 } },
        { text = "Are goblins poisonous?", next = "BACK", when = { class = { "ROGUE", "HUNTER" } }, reply = "Only the ones from Gadgetzan, and only if you believe us. Don't spoil it for me." },
      },
    },
    want = {
      lines = { { id = "w_default", text = "Search me. They've got prisoners from the other clans in the cages down the row, and those they shout at, but me they just come and stare at. I think I'm the entertainment, and I resent not being paid for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Hornizz is worried? Good, he ought to be, this was his idea in everything but the details. He's camped up at the Kodo Graveyard with his crates, and when I get there he's going to hear about this until one of us retires." } },
      choices = { { text = "He'd trade his whole scheme for you.", next = "BACK", reply = "He said that? Huh. Well, don't you dare tell him I went soft about it.", fx = { affinity = 1 } } },
    },
    plan = {
      lines = { { id = "p_default", text = "We go north, fast, and we don't stop to loot. Once I'm past the last of the spears I can find my own way to my brother's camp, and you can go back to whatever a {class} does for fun around here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep books in Gadgetzan, and I came to Desolace as a favour, which is the last favour I do this year." } },
    centaur = { { id = "tp_ce", text = "Loud, smelly and no head for commerce. The Maraudine are the worst of the lot, and I say that with authority." } },
    gadgetzan = { { id = "tp_gz", text = "It's a walled town in the Tanaris sand with cold drinks and a law against stabbing. I miss it something awful." } },
    _none = { { id = "tp_none", text = "Ask me when I'm not in a cage, friend." } },
  },
}

---------------------------------------------------------------------------
-- Mai'Lahii: fishing supplies at Shadowprey Village. Clam Bait.
---------------------------------------------------------------------------
P:NPC {
  key = "mai_lahii", id = TODO_NPC("Mai'Lahii"), name = "Mai'Lahii", title = "Fishing Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "quest",
  communities = { "shadowprey" }, temper = { "laughing" }, values = { "sea", "plenty" },
  notices = { "craft", "race" },
  impression = {
    first = "Mai'Lahii sells hooks, line and bait on the Shadowprey waterfront, with her feet hanging over the edge of the dock. She laughs easily and often, and she always seems to know what is biting.",
    third = "{name} met Mai'Lahii, who sells fishing supplies at Shadowprey Village.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon! Come sit by de water, because you look like you've been breathing Desolace dust for too long." },
    { id = "g_back", when = { metBefore = true }, text = "Dere you are again! De fish been asking about you, and I told dem you'd be back." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a pole like you know what to do with it. Good, because dis coast has fish dat would pull a careless fisher right off de dock." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, all de way out here! Sit, sit, and tell me if de fishing on de Echo Isles is still as good as my mother swore it was." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Mai'Lahii, and I sell everything you need to take a fish out of dis sea. De one thing I can't keep on de shelf is good bait, and for dat I could use a hand from somebody who doesn't mind getting wet." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Clam Bait") }, text = "How goes de clamming, mon? I need de soft-shelled meat, de kind from de big clams along de strand, and de fish here won't look at anything else." },
        { id = "h_done", when = { questDone = TODO_QUEST("Clam Bait") }, text = "My clam-digger returns! De whole village been catching better since you filled my bait barrel, and Lui'Mala even said thank you, which he never does." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De tide's in no hurry." },
        { id = "h_again2", text = "Ask away, I got line to wind anyhow." },
      },
      choices = {
        { text = "Why clam meat for bait?", next = "clams" },
        { text = "How's the fishing on this coast?", next = "coast" },
        { text = "Why would trolls settle in Desolace?", next = "village" },
        { text = "The Echo Isles are lost to Zalazane now.", next = "isles", when = { race = "Troll" } },
        { text = "Show me your tackle.", next = "END" },
      },
    },
    clams = {
      lines = { { id = "c_default", text = "Because de big fish off dis shore grew up eating it, and dey be picky as old chiefs. De giant softshell clams lie in de shallows along Sar'theris Strand, and you just have to crack dem open and take de meat." } },
      choices = {
        { text = "Just crack them open? Nothing else out there?", next = "clams_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clams_naga = {
      lines = { { id = "cn_default", text = "Ha, you be sharper dan you look! De Slitherblade naga hold dat strand, and dey think everything in de water belongs to dem, clams and fishers both. Dat's why I ask a fighter to go, and not my little cousins." } },
      choices = {
        { text = "How long have the naga been a trouble?", next = "clams_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clams_long = {
      lines = { { id = "cl_default", text = "Since before de first hut went up, mon. Drulzegar lost his whole boat crew to dem, and he's de only one who swam home, so go ask him if you want to know how dey fight. Just don't ask him when he's been drinking." } },
      choices = {
        { text = "I breathe water well enough. They won't catch me.", next = "BACK", when = { class = { "SHAMAN", "DRUID", "WARLOCK" } }, reply = "Den you'll do better dan most, but mind dat de naga breathe it better still.", fx = { affinity = 1 } },
        { text = "I'll talk to Drulzegar. Something else.", next = "BACK" },
      },
    },
    coast = {
      lines = { { id = "co_default", text = "It's de best thing in Desolace, and I know dat's not saying much. De land behind us is dead grey dust, but de sea never heard about it, and she gives us more dan we can eat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "v_default", text = "Because a Darkspear can live anywhere dere's a shore and a fish, and de Warchief wanted eyes on dis coast. De centaur don't like water and de demons don't like us, so we get left alone more dan you'd think." } },
      choices = {
        { text = "And the tauren who live here with you?", next = "village_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_tauren = {
      lines = { { id = "vt_default", text = "Dey be good neighbours, quiet and steady, and dey worry about de land so we don't have to. Taiga Wisemane's always watching de hills for de Burning Blade, and I say let her, while I watch de water.", fx = { learn = { "burning_blade" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    isles = {
      lines = { { id = "i_default", text = "I heard, and it sits heavy in me, mon. My mother's people fished dose waters, and now a witch doctor's got dem dancing on strings. Vol'jin will take dem back one day, and I'll send him a barrel of bait for de feast.", fx = { learn = { "echo_isles" } } } },
      choices = { { text = "May the loa see it done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came up de coast with de first boats to Shadowprey, and I been selling hooks off dis dock ever since." } },
    echo_isles = { { id = "tp_ei", text = "De old home, taken by Zalazane and his voodoo. We don't forget it, even dis far away." } },
    burning_blade = { { id = "tp_bb", text = "Dey keep to de hills and de old fortress, and I'm glad dey got no taste for fish." } },
    advice = { { id = "tp_adv", text = "Fish de evening tide here, mon, when de light goes gold and de big ones come in close." } },
    _none = { { id = "tp_none", text = "Dat one's not in my tackle box, mon, so ask up at de inn." } },
  },
}

---------------------------------------------------------------------------
-- Hae'Wilani: axecrafter at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "hae_wilani", id = TODO_NPC("Hae'Wilani"), name = "Hae'Wilani", title = "Axecrafter", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "fierce" }, values = { "craft", "strength" },
  notices = { "class", "kit" },
  impression = {
    first = "Hae'Wilani hangs her axes from a rack at Shadowprey Village where the sea wind can keep them singing. She tests an edge on her own thumbnail, and she grins when it bites.",
    third = "{name} met Hae'Wilani, the axecrafter of Shadowprey Village.",
  },
  greetings = {
    { id = "g_default", text = "You be looking at my axes, {class}, and dat's de right place to look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, eh? Show me de edge on what you carry, and I'll tell you if you been treating it right." },
  },
  notice = {
    { id = "n_axe", cat = "class", when = { class = { "WARRIOR", "HUNTER", "SHAMAN" } },
      text = "Now you got de arms for a proper axe. Pick one up, mon, and feel how de head wants to fall all by itself." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You be a spell-thrower, so my axes are not for you. Dat's all right, you can still admire dem, and it costs nothing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Hae'Wilani, and I make de best axes on dis coast, which I can say because I make de only ones. Desolace be full of things dat need cutting down to size, so I never run short of customers." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon?" },
        { id = "h_again2", text = "Speak up over de wind." },
      },
      choices = {
        { text = "Why axes, and nothing else?", next = "why" },
        { text = "What needs cutting down around here?", next = "cutting" },
        { text = "How do you keep an edge in sea air?", next = "edge" },
        { text = "Show me your axes.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because a sword is for showing off and a mace is for folk who can't sharpen. An axe does honest work, mon, for it will split a skull or a log or a crab, and it doesn't ask you to be clever about it." } },
      choices = {
        { text = "And the throwing axes of your people?", next = "why_throw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_throw = {
      lines = { { id = "wt_default", text = "Ah, you know de Darkspear way! My father was a headhunter and he could take a bird off a branch at forty paces. I make de big ones now, but I learned de balance on de little ones, and it's de same secret." } },
      choices = {
        { text = "A Darkspear never forgets the throwing arm.", next = "BACK", when = { race = "Troll" }, reply = "Ha! True enough, {g:brother|sister}. Come by when de light's good and we'll see whose arm remembers more.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cutting = {
      lines = { { id = "c_default", text = "Centaur, first of all, for dere be four clans of dem and not one with manners. Den de naga on de strand, and de demon-lovers of de Burning Blade up in de hills, who bleed just like anybody when you hit dem right.", fx = { learn = { "burning_blade" } } } },
      choices = { { text = "A long list. Something else.", next = "BACK" } },
    },
    edge = {
      lines = { { id = "e_default", text = "With fish oil every night, and no excuses. De salt will eat a blade in one moon if you let it, so I tell every buyer de same thing, and half of dem come back with rust and a sad face." } },
      choices = {
        { text = "I oil mine every night.", next = "BACK", when = { class = "WARRIOR" }, reply = "Den you and me will get along, mon, because dat's all I ask of anybody.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Headhunter's daughter, born on de islands and raised on de move, and I set up my rack here when de village was three huts." } },
    burning_blade = { { id = "tp_bb", text = "Dey hide in de old fortress to de north and whisper to demons. An axe don't care what you whisper to." } },
    centaur = { { id = "tp_ce", text = "Too many legs and too little sense, and dey break on a good axe like anything else." } },
    _none = { { id = "tp_none", text = "I don't know dat, mon. I know axes." } },
  },
}

---------------------------------------------------------------------------
-- Lah'Mawhani: trade goods at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "lah_mawhani", id = TODO_NPC("Lah'Mawhani"), name = "Lah'Mawhani", title = "Trade Goods", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "sly" }, values = { "trade", "patience" },
  notices = { "craft" },
  impression = {
    first = "Lah'Mawhani keeps Shadowprey's trade goods in tightly lidded jars and oiled bundles against the sea damp. She watches a customer's hands and not their face, and she names her price only after they have picked something up.",
    third = "{name} met Lah'Mawhani, who sells trade goods at Shadowprey Village.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of de wind, {class}. Whatever your craft be, I likely got de little thing you forgot to bring." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. You ran out of thread, or flux, or patience, and I only sell two of dose." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { any = { { profession = "Tailoring" }, { profession = "Leatherworking" }, { profession = "Blacksmithing" }, { profession = "Alchemy" } } },
      text = "You got a crafter's hands, I see de marks. Den you know already dat de nearest other shop be days away, and you'll be kind about my prices." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Lah'Mawhani. Everything a crafter needs comes to dis village by boat or on somebody's back, and I be de one who keeps it dry until you want it." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I'm not going anywhere." },
        { id = "h_again2", text = "Ask, den." },
      },
      choices = {
        { text = "How do goods even reach Desolace?", next = "reach" },
        { text = "Who buys from you out here?", next = "buys" },
        { text = "You watch hands, not faces.", next = "hands" },
        { text = "Let me see what you have.", next = "END" },
      },
    },
    reach = {
      lines = { { id = "r_default", text = "Some comes by sea, when de boats get past de naga, and some comes by de wind riders dat Thalon keeps at de end of de dock. De road through de centaur lands I don't count, because what leaves on it doesn't always arrive." } },
      choices = {
        { text = "What about the goblin caravan?", next = "reach_caravan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reach_caravan = {
      lines = { { id = "rc_default", text = "De Gizelton brothers, you mean, with deir kodo and deir robots. Dey pass up on de main road and never come down to de shore, and when I do buy from dem I count my fingers after." } },
      choices = {
        { text = "A goblin counts his fingers after you, too.", next = "BACK", when = { race = "Goblin" }, reply = "Ha! Den we understand each other, and nobody gets cheated but de slow." },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = { { id = "b_default", text = "Malux sends me his skinners when dey need salt, and Hae'Wilani takes all de oil I can get for her axes. De rest be travellers like you, who come through for Maraudon or for de demons and find dey packed for neither.", fx = { learn = { "maraudon" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hands = {
      lines = { { id = "ha_default", text = "A face will tell you what somebody wants you to think, mon. De hands tell you what dey do all day, and what dey do all day tells me what dey'll buy before dey know it demselves." } },
      choices = {
        { text = "And what do mine tell you?", next = "hands_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hands_mine = {
      lines = {
        { id = "hm_default", text = "Dey tell me you been fighting more dan crafting, and dat you'll want bandage cloth before you want dye. I'm not often wrong." },
        { id = "hm_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Soft hands with ink on dem, so you be a spell-reader. You'll want de fine thread for robes, and you'll complain about de price." },
      },
      choices = { { text = "Close enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My mother traded between de island villages, and I trade on a harder shore dan she ever saw." } },
    maraudon = { { id = "tp_ma", text = "De great caves to de south and east, where de centaur go to worship. Folk buy a lot of supplies before dey go in, and not so many come back for more." } },
    advice = { { id = "tp_adv", text = "Buy double of anything small out here, mon, because de next shop be a long ride." } },
    _none = { { id = "tp_none", text = "Dat I don't stock, not even as a rumour." } },
  },
}

---------------------------------------------------------------------------
-- Tukk: general goods at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "tukk", id = TODO_NPC("Tukk"), name = "Tukk", title = "General Goods", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "lazy" }, values = { "ease", "sea" },
  notices = { "race", "weary" },
  impression = {
    first = "Tukk sells Shadowprey's general goods from the shade, leaning back against a post with his hat over his eyes. He serves a customer without quite getting up, and somehow never keeps one waiting.",
    third = "{name} met Tukk, who sells general goods at Shadowprey Village.",
  },
  greetings = {
    { id = "g_default", text = "Easy, mon, no need to rush. Tukk got what you need, and it'll still be here when you finish catching your breath." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's you. Good to see you still walking, because not everybody comes back down dat road." },
  },
  notice = {
    { id = "n_dust", cat = "weary", when = { race = { "Orc", "Tauren", "Scourge" } },
      text = "You got half of Desolace on your boots, friend. Shake dem off away from my bread, and den tell me what you ran out of." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Tukk. I got wood for your fire, flint to light it and a few odds and ends besides, and dat be about all anybody needs in a place like dis." },
      },
      again = {
        { id = "h_again", text = "Something more, mon? Take your time." },
        { id = "h_again2", text = "I'm listening, even if my eyes be shut." },
      },
      choices = {
        { text = "You don't seem troubled by Desolace.", next = "easy" },
        { text = "Why does anyone need firewood on a beach?", next = "fire" },
        { text = "Who else should I see in the village?", next = "village" },
        { text = "Let me see your goods.", next = "END" },
      },
    },
    easy = {
      lines = { { id = "e_default", text = "What's to be troubled about? De centaur be up dere killing each other, de demons be up dere doing whatever demons do, and I be down here in de shade with de sea at my back." } },
      choices = {
        { text = "And if they come down here?", next = "easy_come" },
        { text = "Something else.", next = "BACK" },
      },
    },
    easy_come = {
      lines = { { id = "ec_default", text = "Den I get up, mon, and it's a terrible thing to see. I was a raider with Sen'jin's boats before I was a shopkeeper, and I only sit dis still because I already did my share of running." } },
      choices = {
        { text = "You sailed under Sen'jin himself?", next = "BACK", when = { race = "Troll" }, reply = "I did, loa keep him, and I was dere de day de sea witch took him. Dat's all I'll say about it on a nice day like dis.", fx = { affinity = 1 } },
        { text = "I'll believe it. Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "f_default", text = "De nights get cold on dis coast, and a fire keeps de crawlers off your bedroll. Driftwood's too wet and too salty to burn right, so everybody buys mine in de end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "v_default", text = "Sikewa at de inn if you be hungry, and Wulan if you want to cook it yourself. For work, go see Taiga Wisemane or old Drulzegar on de dock, because dey both got more troubles dan I'd ever want." } },
      choices = { { text = "Thanks, Tukk. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I rowed with de Darkspear boats when I was young, and I sell firewood now, which be a lot easier on de back." } },
    echo_isles = { { id = "tp_ei", text = "Home, once. I don't talk about it much, because talking don't get it back." } },
    advice = { { id = "tp_adv", text = "Don't hurry in Desolace, mon. Everything dat wants to kill you here be faster dan you anyway." } },
    _none = { { id = "tp_none", text = "No idea, mon, and I'm too comfortable to guess." } },
  },
}

---------------------------------------------------------------------------
-- Wulan: cooking supplies at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "wulan", id = TODO_NPC("Wulan"), name = "Wulan", title = "Cooking Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "jolly" }, values = { "plenty", "hospitality" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Wulan stands over a row of spice jars and a smoking fish rack at Shadowprey Village, tasting something from a ladle. He offers an opinion on what you ought to be eating before he has learned your name.",
    third = "{name} met Wulan, who sells cooking supplies at Shadowprey Village.",
  },
  greetings = {
    { id = "g_default", text = "Hey now, {class}, you look underfed! Come smell dis, and tell me it don't make de whole grey land worth de walk." },
    { id = "g_back", when = { metBefore = true }, text = "You came back for de spice, eh? Dey all do, mon, once dey've tried eating Desolace plain." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "Ah, a cook! I can tell by how you sniffed before you looked, so now we can talk properly, and not just about what's cheapest." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Wulan, and I sell de spice, de salt and de pots dat turn a dead fish into a supper. Dere's nothing growing in Desolace worth eating, mon, so everything good here comes out of de sea and through my hands." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I stir." },
        { id = "h_again2", text = "Go on, mon, de pot can wait a little." },
      },
      choices = {
        { text = "What's the best eating on this coast?", next = "best" },
        { text = "Does nothing in Desolace taste good?", next = "land" },
        { text = "How does a troll season a fish?", next = "season" },
        { text = "Show me your supplies.", next = "END" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "De big clams off de strand, steamed in deir own shells with a little pepper, and nothing else comes close. Mai'Lahii wants de meat for bait, and we fight about it every single week." } },
      choices = {
        { text = "Who wins?", next = "best_wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_wins = {
      lines = { { id = "bw_default", text = "She does, mostly, because she tells me dat bait catches ten fish and a supper feeds one troll. I say de one troll is me, and dat seems to matter less to her dan it ought to." } },
      choices = { { text = "A hard argument to win. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    land = {
      lines = { { id = "l_default", text = "De kodo, if you can bring yourself to do it in front of de tauren, and de scorpids if you know which part to throw away. De rest be vultures and hyenas, mon, and I'd sooner eat my sandals." } },
      choices = {
        { text = "My people don't waste a fallen kodo.", next = "BACK", when = { race = "Tauren" }, reply = "So Sikewa tells me, and she cooks it better dan I do, though I'll deny I said so." },
        { text = "Something else.", next = "BACK" },
      },
    },
    season = {
      lines = { { id = "s_default", text = "Hot, mon, always hot, with pepper enough dat an orc will cry and thank you for it. My grandmother said a meal should let de spirits know you're still alive, and she lived a very long time." } },
      choices = {
        { text = "I'd like to cook it that way.", next = "BACK", when = { profession = "Cooking" }, reply = "Den buy de red pepper and not de mild, and start with half of what you think. You can always add, but you can't take away.", fx = { affinity = 1 } },
        { text = "I'll trust you on that. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I cooked for a whole Darkspear war band once, and now I feed one small village, which complains more." } },
    advice = { { id = "tp_adv", text = "Eat de fish de same day it's caught, mon, because de Desolace heat don't forgive." } },
    echo_isles = { { id = "tp_ei", text = "De peppers grew wild on de islands. Here I have to pay a goblin for dem, and dat hurts me." } },
    _none = { { id = "tp_none", text = "If it can't be cooked, mon, I don't know about it." } },
  },
}

---------------------------------------------------------------------------
-- Narv Hidecrafter: leatherworking trainer at Ghost Walker Post.
---------------------------------------------------------------------------
P:NPC {
  key = "narv_hidecrafter", id = TODO_NPC("Narv Hidecrafter"), name = "Narv Hidecrafter", title = "Leatherworking Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "ghost_walker" }, temper = { "grave" }, values = { "craft", "reverent" },
  notices = { "craft" },
  impression = {
    first = "Narv Hidecrafter works great grey kodo hides at Ghost Walker Post, within sight of the graveyard they came from. He handles each one slowly, and he speaks of his craft as a duty to the dead more than a trade.",
    third = "{name} met Narv Hidecrafter, the leatherworking trainer of Ghost Walker Post.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, {class}. Sit, if you wish, but do not step on the hides, for they have been walked on enough in life." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the Post, and I am glad the grey land has been merciful to you." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather, and so you will understand what I do here. Few craftsmen are given hides as old or as heavy as these." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinner's knife. Use it with care in Desolace, friend, and never on a kodo that has not finished its dying." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Narv Hidecrafter, and I teach the working of leather to those skilled enough to learn it. The great kodo come to this valley to die, and I see that what they leave behind shelters the living." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The hides are patient." },
        { id = "h_again2", text = "Speak, friend." },
      },
      choices = {
        { text = "You take hides from the Kodo Graveyard?", next = "graveyard" },
        { text = "What is hard about kodo hide?", next = "hide" },
        { text = "A goblin nearby is selling the bones.", next = "goblin", when = { any = { { heardLine = "bibbly_futzbuckle.h_default" }, { questActive = TODO_QUEST("Bone Collector") }, { questDone = TODO_QUEST("Bone Collector") } } } },
        { text = "Why live in a land this dead?", next = "land" },
        { text = "I'd learn from you.", next = "END" },
      },
    },
    graveyard = {
      lines = { { id = "gy_default", text = "Only from those newly fallen at its edge, and only after the rites have been spoken over them. The old bones and what lies among them I leave alone, for that ground belongs to the spirits of the herd.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "Do their spirits truly linger there?", next = "graveyard_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graveyard_spirits = {
      lines = { { id = "gs_default", text = "I have seen them rise, pale and vast, when the bones are disturbed by careless hands. That is why Ghost Walker Post bears the name it does, and why we who live here walk softly." } },
      choices = { { text = "I'll walk softly too. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hide = {
      lines = { { id = "hi_default", text = "It is as thick as two fingers and as stubborn as the beast that wore it. You cannot hurry a kodo hide, for it must be soaked for days and scraped for days more, and a needle that will pierce it must be forged for the purpose." } },
      choices = {
        { text = "I've broken needles on thinner leather.", next = "BACK", when = { profession = "Leatherworking" }, reply = "Then you are ready to break better ones here, and to learn why they broke.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin = {
      lines = { { id = "gb_default", text = "I know of him, and of his dancing. Felgur and the others at the Post have less patience with it than I do, but I will tell you plainly that no good comes of bones carried off without a word of thanks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    land = {
      lines = { { id = "l_default", text = "Because the kodo chose it, long before the land died around them, and we do not abandon our dead for want of grass. Someone must keep faith with the herd here, and the centaur will not." , fx = { learn = { "centaur" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the craft in Mulgore and came to Desolace to work the hides that no one else was tending." } },
    earth_mother = { { id = "tp_em", text = "Even here, under the grey dust, she is the ground we stand on, and I believe she grieves for this place." } },
    centaur = { { id = "tp_ce", text = "They hunt the kodo for sport and leave the bodies where they fall. I have no words for them that I would say aloud." } },
    advice = { { id = "tp_adv", text = "Soak the hide longer than you think it needs, and then longer again." } },
    _none = { { id = "tp_none", text = "That is beyond my craft, friend, so ask Gurda Wildmane." } },
  },
}

---------------------------------------------------------------------------
-- Selendra: dryad on Sar'theris Strand, south of Shadowprey. Corruption of Earth and Seed (Horde).
---------------------------------------------------------------------------
P:NPC {
  key = "selendra", id = TODO_NPC("Selendra"), name = "Selendra", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "earnest" }, values = { "nature", "kinship" },
  notices = { "class", "race" },
  impression = {
    first = "Selendra is a dryad, and she stands among her sisters on Sar'theris Strand as though the grey land behind her hurt to look at. She is quick and bright in her speech, and under it there is a grief much older than she seems.",
    third = "{name} met Selendra, a dryad of the Cenarion Circle on Sar'theris Strand.",
  },
  greetings = {
    { id = "g_default", text = "Oh! A traveller, and one with kind eyes, I hope. Come closer, for I will not harm you, and I have need of someone brave." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the strand! My sisters said you would, and I am glad they were right." },
    { id = "g_cleared", when = { cleared = "Maraudon" }, text = "I felt it when she fell, like a stone lifted from the earth. Come, tell me everything, for I have waited a very long while to hear it." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle! Then you will feel what I feel in this place, how the land lies sick and silent where a forest ought to sing." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The shu'halo have always walked gently, and my father's kin remember it. I am glad it is one of you who has come." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the taint of the Legion's magic, and it makes my skin crawl to stand near you. Still, I will not send away anyone who would help me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Selendra, and I came down from the Stonetalon Mountains with my brother Marandis and my sisters. We seek one of our own who lies in the caverns of Maraudon, and we cannot reach him while the earth-princess lives.", fx = { learn = { "maraudon" } } },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") }, text = "You have not yet gone into the deep places, have you? Princess Theradras waits at the very heart of Maraudon, and until she is ended my kinsman cannot rest." },
        { id = "h_done", when = { questDone = TODO_QUEST("Corruption of Earth and Seed") }, text = "You did what the Circle itself could not, and Zaetar is free of her at last. My sisters and I will sing of you in Stonetalon, when we have taken him home." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Ask, and I will try not to wander in the telling." },
        { id = "h_again2", text = "Yes? I am listening, truly." },
      },
      choices = {
        { text = "Who lies in Maraudon?", next = "zaetar" },
        { text = "Why is a dryad standing on a troll beach?", next = "strand" },
        { text = "Your brother is at Nijel's Point.", next = "brother" },
        { text = "What happened to this land?", next = "land" },
        { text = "Theradras is dead. I was there.", next = "dead", when = { cleared = "Maraudon" } },
        { text = "I'll do what I can.", next = "END", fx = { affinity = 1 } },
      },
    },
    zaetar = {
      lines = { { id = "z_default", text = "Zaetar, the first son of Cenarius, who was a keeper of the groves as Marandis is. Long ago he came to this land and loved Theradras, a princess of the earth elementals, though all his kin begged him not to.", fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "What came of that love?", next = "zaetar_children" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_children = {
      lines = { { id = "zc_default", text = "The centaur came of it. They were born misshapen and full of rage, and when they saw how fair their father was they hated him for it, and they killed him. Every clan that tramples this land is his child and his murderer both.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "And the princess?", next = "zaetar_theradras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_theradras = {
      lines = { { id = "zt_default", text = "She keeps his body in the crystal caverns and will not let his spirit go, and her grief has soured into something that poisons every root it touches. I think she loved him, in the way that stone loves, which is to hold on forever." } },
      choices = {
        { text = "Then ending her is a mercy.", next = "BACK", reply = "I believe it is, for both of them. Thank you for seeing it so, because I did not know how to ask it of a stranger.", fx = { affinity = 1 } },
        { text = "The spirits of earth will mourn her.", next = "BACK", when = { class = "SHAMAN" }, reply = "They will, and they should. But ask them what she has done to the ground beneath Maraudon, and I think they will not stay your hand." },
        { text = "A grim story. Something else.", next = "BACK" },
      },
    },
    strand = {
      lines = { { id = "s_default", text = "It is the only place in Desolace where I can hear water, and I cannot bear to be far from it here. The trolls of the village let us be, for they know the centaur are no friends of theirs, and we ask nothing of them but the shore." } },
      choices = {
        { text = "The naga don't trouble you?", next = "strand_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strand_naga = {
      lines = { { id = "sn_default", text = "They watch us from the shallows, and my sisters watch them back with their spears ready. The naga were Highborne once, before the Sundering, and I think they remember enough to be wary of the forest's daughters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "He is, among the Alliance, asking of them what I ask of you. Marandis is very grave about it, and he would not approve of how much I talk, but we want the same thing, and the Circle cares little whose banner the help comes under." } },
      choices = {
        { text = "The Horde will see it done first.", next = "BACK", when = { faction = "Horde" }, reply = "Then do, and I shall enjoy telling him so! Only be careful, for I would rather you came back than won." },
        { text = "Something else.", next = "BACK" },
      },
    },
    land = {
      lines = { { id = "l_default", text = "It was green once, or so the oldest of us say. Then the centaur were born into it, and they have warred across it ever since, and the demons came after and found it already half dead. A land can only be hated for so long before it stops growing." } },
      choices = {
        { text = "Could it ever be healed?", next = "BACK", when = { class = "DRUID" }, reply = "I have to believe so, and so must you, or why else would we serve the Circle? But not while Theradras sits at its root." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Then it is over, and he is free, and I do not know whether to laugh or to weep. Tell me, did his spirit speak before the end, or was there only the dark and the stone?" } },
      choices = {
        { text = "He is at peace now. That much I saw.", next = "BACK", reply = "Then that is enough, and more than I dared to hope for. We will take him home to Stonetalon, where the trees still know his name.", fx = { affinity = 2 } },
        { text = "There was only the fighting.", next = "BACK", reply = "Of course there was, and it was foolish of me to ask. You went into that place for us, and I will not ask you for comfort as well." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a daughter of the forest, of Cenarius's line, and Stonetalon was my home until this errand called us south." } },
    maraudon = { { id = "tp_ma", text = "It is the great cavern where the centaur bury their dead, and where Theradras keeps Zaetar's body in the crystal dark." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle tends the wild places of the world, and it does not ask whether a helping hand belongs to Horde or Alliance." } },
    centaur = { { id = "tp_ce", text = "They are my kin, in a way I do not like to think on, and they have never forgiven the world for their own making." } },
    _none = { { id = "tp_none", text = "Oh, I do not know that! I know trees and rivers, and there are so few of either here." } },
  },
}
