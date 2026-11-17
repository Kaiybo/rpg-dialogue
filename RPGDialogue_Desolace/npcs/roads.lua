-- Desolace between the towns: the Gizelton caravan, Scrabblescrew's camp at the Kodo Graveyard, Thunder Axe Fortress and Rexxar on the road.
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cork_gizelton", id = TODO_NPC("Cork Gizelton"), name = "Cork Gizelton",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Cork Gizelton runs the Gizelton caravan's kodos up and down the Desolace road, and he talks about bandits the way other folk talk about weather.",
    third = "{name} met Cork Gizelton of the Gizelton caravan on the road through Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Keep walking alongside, friend, because the kodos don't stop for conversation and neither do I." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, I can use another pair of eyes on these hills." },
  },
  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "From the ridges on the north side, mostly, where the ground's high and the sun's at their backs. A good hunter on the flank sees the dust go up before the arrows come down, and I'll take that warning over a dozen swords any day." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} away from the kodos' heels, friend, because a kodo spooked by a beast can kick a wagon over, and I've the bills to prove it." },
      },
      choices = {
        { text = "I'll warn you first and fight second. The caravan comes first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather pick off centaurs than mind your wagons.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Better than I treat myself, friend, because a lame kodo out here means a lost caravan. The Kolkar know it too, and they go for the beasts first, every time." } },
      choices = {
        { text = "Guard the beasts first. They carry everyone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the Kolkar have a kodo. It buys the wagons time.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a hired guard who thought a crate of Gadgetzan whiskey wouldn't be missed between two centaur raids. Rigger caught it in the ledger by sundown, and we left him at the next waystone with a waterskin and a long walk." } },
      choices = {
        { text = "That's fair justice. A caravan runs on trust.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Harsh. Out here, a man takes what he can.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "One, a gnome with a temper, who set the Magram's arrows alight in midair and then set fire to our flour by mistake. We went hungry for three days and I'd still hire him again, because we didn't lose a single kodo." } },
      choices = {
        { text = "Better a scorched cart than a dead kodo. Burn first, count later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'd rather protect the cargo carefully than scorch it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Stubbornness and pay, mostly, and knowing that the caravan doesn't stop for anybody. The Kolkar and the Magram both reckon a kodo train is a gift on legs, so my folk pray in their own fashion, which is loudly and with a crossbow handy." } },
      choices = {
        { text = "Faith steadies the hand better than coin. I'll pray with them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A crossbow answers faster than any prayer. Keep them armed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Cork.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd say a caravan's as worthy as anything else, because there's grain and cloth and medicine on these kodos, and half of it's going to folk who've got nothing else. Not that I'm asking you for anything, mind, I just want it said." } },
      choices = {
        { text = "I'll stand between your drivers and the centaur, and gladly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make it worth my while, and I'll think about it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Walk out on the flank, would you, because if the Kolkar come down off the ridge I want to know before they reach the kodos." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Well, that's a fine thing to see on the Desolace road, because the Kolkar have hit us twice this season, and my drivers would sleep a sight better knowing somebody up front can patch an arrow wound." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, out here on my road! If you're heading the same way as the caravan, the kodos won't mind the company, and the centaurs might think twice before they come down off the ridge." },
        { id = "h_default", key = true, text = "Cork Gizelton, and this is the Gizelton caravan, the only honest freight between the Kodo Graveyard and the south road. My brother Rigger runs the back half and I run the front, and the centaurs would happily run off with both." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Bodyguard for Hire") }, text = "You're my bodyguard for this stretch, so stay close to the wagons and watch the ridges, because that's where the Kolkar like to come down from." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, eh? If you can talk to kodos, tell mine to walk faster, because they've never once listened to me." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, huh? Ask your spirits to keep the centaurs off my kodos, because I'm tired of doing it with a crossbow." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Fine, you ride up front with me, and if the Kolkar come over the hill, you start praying loud enough to scare a centaur." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock, eh? Keep the demon back from my kodos, pal, because they spook easier than the customers and they're a lot harder to replace." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You've got a rogue's way of walking, friend, and I'll say this once: the cargo's counted, so if anything goes missing, I'll know whose boots to check." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage on the road! If you can freeze a centaur in its tracks, you can walk at the front with me, and I'll even let you pick the song." },
      },
      again = { { id = "h_again", text = "What else? Talk fast, the next ridge is a bad one." }, { id = "h_again2", text = "Ask away, but keep one eye on the hills." } },
      choices = {
        { text = "Are your kodos treated well, Cork?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who's attacking the caravan?", next = "b1_1" },
        { text = "What do you haul?", next = "b2_1" },
        { text = "Tell me about your brother.", next = "b3_1" },
        { text = "I can hold a line against centaurs.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Do the Kolkar and the Magram trouble the caravan often, Cork?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could your caravan use a spellcaster on the road?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why not just pay the centaurs off?", next = "s_1" },
        { text = "Does anyone ever try to rob the caravan from inside, Cork?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have mages guarded the caravan before, Cork?", next = "xmage", when = { class = "MAGE" } },
        { text = "How do your drivers keep their nerve out here?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should a paladin guard a merchant's caravan, Cork?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where do the Kolkar strike the caravan from, Cork?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Kolkar centaurs, mostly, and they've learned our timetable better than we have. They hit the slow wagons, grab what they can carry and scatter into the hills before anyone gets a bow up." } },
      choices = { { text = "Someone selling your route?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "We've tried changing the route and we've tried changing the hour, and they still find us, which makes me wonder if somebody's selling our plans. I can't prove it, so I hire guards instead of accusing people." } },
      choices = { { text = "What should I do if they come?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you see centaurs gathering on the high ground, shout early and shout loud. A warning in time saves more cargo than any sword I've ever paid for." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Whatever pays: supplies for Nijel's Point, goods for the Shadowprey docks, and the occasional crate I'd rather not ask about. Desolace is a poor land, but poor lands still need flour and nails." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Rigger's the sensible one, if you ask him, and the slow one, if you ask me. He keeps the back of the caravan honest, so if you've time, walk back and say hello." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Can you now? Then you're worth twice the coin, because most hired swords I get stand well behind the kodos when the arrows start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "The Magram have hinted they'd take a toll, and some days I'm tempted to pay it and be done with the whole bloody business." } },
      choices = { { text = "A deal is a deal. Pay the toll and keep the road quiet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Pay them once and they'll take everything next time.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Pal, I could use ten, because the Kolkar and the Magram both hit us on the same run and my guards only get paid for one fight. Walk alongside the wagons for a stretch, and you'll see more centaur than you ever wanted to." } },
      choices = {
        { text = "I'll guard the wagons. Honest freight deserves to get through.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Guard duty's for hire, Cork, if the pay is right.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every trip, without fail, because the Kolkar hit us on one stretch of road and the Magram on the next, and we're stuck in the middle with the freight. The kodos feel the ground shake before the centaurs come over the hill, so I trust a twitchy kodo over any scout." } },
      choices = {
        { text = "Pay the clans for safe passage. Fair dealing saves lives.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Set a trap ahead of them and end it for good.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my cargo, not my concern, friend. Ask me about the road instead." } } },
}

P:NPC {
  key = "rigger_gizelton", id = TODO_NPC("Rigger Gizelton"), name = "Rigger Gizelton",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Rigger Gizelton minds the back of his family's caravan with a ledger in one hand and a crossbow within reach of the other.",
    third = "{name} met Rigger Gizelton at the rear of the Gizelton caravan in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Mind the wheel, friend. That one's been squeaking since Thunder Axe and I'm not fixing it on the road." },
    { id = "g_back", when = { metBefore = true }, text = "Back with the caravan, are you? Good, I'll take any company that helps me watch our tail." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the back is where the slow kodos walk and the cargo's heaviest, and they've worked that out as well as I have. A warrior at the tail who doesn't chase them into the hills is worth more to me than three who do." } },
      choices = {
        { text = "I'll hold the tail. Chasing them is what they want.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they run, I'll run them down. Let them learn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Twice this year, both to hyenas that followed us for three days before they tried it. The ledger says two kodos lost to wildlife, but it doesn't say how long I sat up watching for them on the third night." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} can walk by the tail wagon with me. The kodos are used to beasts on the road, and frankly yours looks better behaved than some of the drivers." },
      },
      choices = {
        { text = "Then I'll keep watch on the tail through the night.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunt the hyenas down before they follow you again.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cork thinks so and I've half come round to it, because the Kolkar know our timings better than our own drivers do. Somebody at one of the waystones is talking, and I'd pay well for a quiet word with whoever's listening." } },
      choices = {
        { text = "Find the leak and make an example of him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Find the leak and turn him over to Nijel's Point.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Rigger.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ever since we hauled past Thunder Axe Fortress and a pair of the Burning Blade's felhounds came down the slope at us. The kodos stampeded halfway to the Kodo Graveyard, and it took us two days to round them up again." } },
      choices = {
        { text = "My minion follows my word. Your kodos are safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your kodos will learn. Demons aren't going anywhere.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Kolkar, mostly, and the odd pack of hyenas that think the kodos are dinner. Cork wants me to pay guards by the centaur killed, but I'd rather pay by the wagon that arrives whole, because that's the number that matters." } },
      choices = {
        { text = "Pay by the wagon. Protecting people is the point.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Pay by the kill. Fewer centaur means safer roads.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Water at every stop, whether they want it or not, and I count every barrel twice. Cork thinks I fuss, but we've lost three kodos to this road in five years and I can tell you the date and the cause of every one." } },
      choices = {
        { text = "Good. Beasts that work for you deserve that much care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Three kodos in five years? That's a fair cost of business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than Cork admits, because he's taken two arrows on this route and called both of them scratches. I keep bandages on the ledger as an expense, and every time I use one, I write the reason beside it, so I can prove to him later that I was right." } },
      choices = {
        { text = "I'll patch up anyone on the caravan, guard or kodo.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If Cork wants to bleed, that's his choice to make.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It would! I'd have to write it in, and then who paid for it, and then what it's worth, and conjured water is worth nothing once it's gone. Still, if a kodo's dying of thirst halfway to Feralas, I'll take the ruined page." } },
      choices = {
        { text = "Then the kodos come first, and your ledger second.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Conjured water is worth something. Charge for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Stand at the back with me, then, because the Kolkar like to hit the last wagon and run, and Cork never hears it over his own shouting." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Keep a count of the centaur you see on the ridges and tell me, because I count everything else on this caravan and I'd hate to leave them out." },
        { id = "h_default", key = true, text = "Rigger Gizelton, the half of the Gizelton caravan that does the counting. Cork shouts at the front and I make sure everything we started with is still here when we stop." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Gizelton Caravan") }, text = "You're guarding us through the Kolkar country, then. Stay by the wagons and don't chase them into the hills, because that's exactly what they want." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. I don't suppose the spirits can count, because I could use a second pair of eyes on this ledger." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, good. If anything goes wrong on this run, you'll be the one patching up the drivers, and I'll write down how many bandages you used." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Don't conjure anything into my wagons, please, because I count the crates, and an extra one is just as much trouble as a missing one." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? Then you'll appreciate that every lock on this caravan was bought from a goblin who swore it couldn't be picked, and I'd rather not find out he lied." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Please keep that little fellow of yours away from the kodos, because they spook at the smell of him and I'm the one who has to calm them down." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in full plate, in Desolace! You'll cook in that, you know, but I'll gladly put you on the books as caravan guard if you can keep up with a kodo." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, would you mind having a word with the kodos? They've been sulking since Feralas, and a sulking kodo walks half as fast and eats twice as much." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, because if anything goes wrong between here and Feralas, you're the closest thing to a healer this caravan has ever had." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Don't conjure anything into my wagons, please, because I count every crate and a crate of water that wasn't there yesterday ruins a whole page of the ledger." },
      },
      again = { { id = "h_again", text = "Anything else? I've a ledger waiting." }, { id = "h_again2", text = "Go on, I'm listening, and counting." } },
      choices = {
        { text = "What's it like working with Cork?", next = "b1_1" },
        { text = "What's in the ledger?", next = "b2_1" },
        { text = "Is Desolace worth the risk?", next = "b3_1" },
        { text = "I've kept a few ledgers myself.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Does the caravan ever carry anything for shamans, Rigger?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the back of the caravan need most?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do you ever cheat the books?", next = "s_1" },
        { text = "Do you think someone is selling your route, Rigger?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have your kodos always feared demons, Rigger?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do the centaur hit the back of the caravan, Rigger?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does the caravan ever lose kodos to wild beasts, Rigger?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Who do you need protecting from on this road, Rigger?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you keep the kodos healthy out here, Rigger?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the caravan often need a healer, Rigger?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would conjured water really ruin your ledger, Rigger?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Cork thinks every problem gets solved by shouting at it, and I think most problems get solved by writing them down. Between the two of us the caravan's still running, so one of us must be right." } },
      choices = { { text = "You worry about him.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Don't tell him I said so, but he's braver than me. He rides up front where the arrows land first, and he's never once asked me to swap." } },
      choices = { { text = "Anything I should do?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So if you're guarding us, keep close to him at the front. He'll never admit he needs it, and I'd rather not count him among the losses." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Every crate, every barrel and every kodo, and a column for what the centaurs took, which is a longer column than I'd like. Desolace eats profit the way it eats everything else." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "There's no one else running this road, so whoever brings the supplies gets paid what they're worth. If we stopped, Nijel's Point and the Shadowprey docks would go hungry inside a month." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then you'll know the worst sound in the world is a sum that won't come out even. Mine hasn't balanced since the spring raids." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "I've been offered good coin to lose a crate or two on the road, and I've never taken it, though I won't pretend I wasn't tempted." } },
      choices = { { text = "Honest books keep honest roads. You did right.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Out here, a little skimming keeps a family fed.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Somebody who watches behind us, because the centaur always hit the back half while Cork's busy shouting at the front. A spell or two at the right moment saves me a crate, and a crate saved is the best kind of crate." } },
      choices = {
        { text = "I'll ride at the back and guard every crate.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Crates don't bleed. I'll guard the drivers, not your freight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Sacred stones bound for Shadowprey Village, once, and a crate of totems from the Barrens that nobody ever signed for. I counted them twice and never opened the crate, because I've seen what happens to folk who rattle the wrong box." } },
      choices = {
        { text = "Good. Sacred things should arrive untouched.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quick look inside never hurt anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That's not in the ledger, friend, so I couldn't tell you." } } },
}

P:NPC {
  key = "smeed", id = TODO_NPC("Smeed Scrabblescrew"), name = "Smeed Scrabblescrew",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Smeed Scrabblescrew runs a goblin camp at the edge of the Kodo Graveyard and wants live kodos rounded up, preferably by somebody else.",
    third = "{name} met the goblin Smeed Scrabblescrew at his camp near the Kodo Graveyard in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Hey, hey! A fresh face, and you look like someone who can handle a kodo. Come here, I've got a business opportunity." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor's back! Got time for a little roundup work?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very, but only if you're doing it wrong, and you're doing it wrong if you get kicked. The Kombobulator makes them docile, mostly, but an old bull can still flatten a fella, so you'll want plate and a cheerful attitude." } },
      choices = {
        { text = "I'll do it, but the old kodos deserve better than a sale.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A job's a job, Smeed. Point me at the kodos.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Same thing, give or take the paperwork. You bond with your beast and I bond with my buyers, and everybody walks away with something big and loyal, so I really don't see why the tauren get so upset about it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Say, how much for {pet}? I'm kidding, kidding, put the bow down, I can see it's not for sale." },
      },
      choices = {
        { text = "A hunter's bond isn't a sale. It's nothing like your trade.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin is coin. I won't judge your business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They go to good homes, mostly caravans and the odd tauren who's short a beast of burden. It beats wandering into the Graveyard to die alone, if you ask me, and since you're asking, I'm telling you." } },
      choices = {
        { text = "Let the old ones die in peace where they choose.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A working kodo beats a dead one. Fair trade.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Discreet folk, pal, and they stay discreet because I don't spread their names around Desolace. Let's just say a kodo fetches a better price in Booty Bay than it does here, and the Cartel takes a smaller cut than you'd think." } },
      choices = {
        { text = "I don't care who buys. Show me the coin.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd want to know where the beasts end up first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I want kodos rounded up, pal, and I'm not fussy about the shepherd. The trouble is every kodo in the Graveyard bolts at the first whiff of brimstone, so your demon would cost me more in runaways than it saves." } },
      choices = {
        { text = "My demons aren't hired hands. Find another shepherd.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A demon will work if the price is right. Make an offer.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Right, wrong, it's a market, friend, and somebody's going to sell those kodos sooner or later, so it might as well be the goblin with the good rope. The tauren don't like it and the bones out there don't seem to either, though neither has filed a complaint yet." } },
      choices = {
        { text = "Let the old ones die in peace, Smeed. That's their right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A live kodo's worth more than a dead one. Sell away.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mostly! Some go to tauren who want a quiet old beast for the farm, and some go to goblins who want something that can pull a cart without stopping to argue. I don't ask what happens after the sale, because asking is how you lose customers." } },
      choices = {
        { text = "You should ask. Those kodos deserve a decent end.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A sale's a sale. It's no worse than leaving them to die.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a full-grown kodo eats its own weight in grass every week, and there's no grass between here and anywhere. If you mages ever invent a spell to make a kodo small and quiet, you come and find me first, because we'd both be rich." } },
      choices = {
        { text = "Some magic shouldn't be sold, Smeed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find me the gold and I'll find the spell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Perfect, because kodos are big and kodos are grumpy, and I need somebody who can take a kick and keep walking." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Now you'll understand the business, because you tame beasts for a living and I'm just trying to do it at a profit." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Now don't go looking at me like that, because I'm not robbing any graves, I'm just rounding up the live kodos before they lie down and join the dead ones, which is practically a mercy if you think about it." },
        { id = "h_default", key = true, text = "Smeed Scrabblescrew, entrepreneur. The Graveyard's full of old bones, sure, but the live kodos that wander in are worth real money to the right buyers, and I've got the buyers." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Kodo Roundup") }, text = "Take the Kodo Kombobulator, get close to an aged or dying kodo, and give it a little zap. Then lead the tame ones back here and I'll do the rest." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid? Look, before you start, the kodos don't mind the Kombobulator, or at least none of them has ever complained to me about it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you call a kodo over for me? I've got buyers waiting, and the blasted things won't come when I whistle." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, huh? The tauren get awful touchy about this place, so if you can say a word over the bones that keeps them off my back, I'd call it a public service." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage! Can you shrink a kodo, by any chance? Because the shipping costs on these things are murder." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Ah, a professional! You've got the look of someone who knows how to slip a rope round something big without it noticing, and that's a skill I pay for." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, don't take this wrong, but could one of your demons herd kodos? I'd pay double for a felhound that works for free." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Uh oh, a paladin. Now before you say anything, every kodo I take out of here is old, sick, or just plain lost, and I'm basically running a retirement home." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you shrink a kodo, by any chance? Because the shipping costs on these things would make a trade prince weep." },
      },
      again = { { id = "h_again", text = "Another question? Fine, but every one of 'em costs me a kodo bone I could be hauling." }, { id = "h_again2", text = "Ask, ask! Every question's free, for now." } },
      choices = {
        { text = "What happens to the kodos you tame?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why kodos?", next = "b1_1" },
        { text = "What is the Kombobulator?", next = "b2_1" },
        { text = "How's business?", next = "b3_1" },
        { text = "My people do not sell the kodo's last walk.", next = "x_1", when = { race = "Tauren" } },
        { text = "Why sell the kodos of the Graveyard at all, Smeed?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What is it about the Kodo Graveyard that troubles people?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Graverobbing kodos seems wrong to me.", next = "s_1" },
        { text = "Who are your buyers for these kodos, Smeed?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you really want demons herding your kodos, Smeed?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is it right to sell the kodos that come here to die?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How dangerous is leading a kodo out of the Graveyard?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is taming kodos for coin the same as what a hunter does?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is this truly a retirement home for kodos, Smeed?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why not just ship them whole, Smeed?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Kodos are the trucks of Kalimdor, friend. Caravans, armies and tauren villages all need beasts that'll carry a ton of goods and not complain, and the Graveyard draws them in like flies." } },
      choices = { { text = "That's a grim trade.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The old ones come here to die, and that's sad, sure, but some aren't as close to the end as they think. With a little encouragement from my Kombobulator, they walk out again and earn a living." } },
      choices = { { text = "Do the tauren mind?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Ask the tauren and they'll call it disrespectful, which I understand. Ask the caravans and they'll call it a bargain, and I'm the one with the receipts." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "A goblin marvel! It calms a kodo right down so it follows you like a lost puppy, mostly. Don't point it at your own face, and don't ask what happened to the last guy who did." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Business is booming, friend, apart from the centaurs, the bone-diggers and the smell. Three out of four ain't bad for Desolace." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Hey, no offense meant! I'm just giving the old fellas a second career, and you'd be surprised how many like it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Wrong's a strong word, friend. I call it recycling, and nobody's ever paid me to leave them where they lie." } },
      choices = { { text = "The dead deserve their rest, even beasts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "A beast that can still walk can still work.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Beats me, pal, it's just bones, though I'll admit the place gets quiet in a way I don't love. The tauren say the old kodos come here to die and the spirits keep watch, and the spirits haven't paid me a copper, so I don't see why they get a vote." } },
      choices = {
        { text = "Business is business. Bones can't complain.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The tauren are right. Leave the Graveyard in peace.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because live kodos fetch a fine price, pal, and the dead ones fetch nothing. Your elders can sing over the bones all they like, but the live ones need a buyer, and I've got the buyers." } },
      choices = {
        { text = "The Graveyard is sacred, and its kodos should be left in peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Live kodos are fair game. Money is money.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Never heard of it, but if it's for sale, I'm interested." } } },
}

P:NPC {
  key = "dalinda", id = TODO_NPC("Dalinda Malem"), name = "Dalinda Malem",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Dalinda Malem was held prisoner in Thunder Axe Fortress and needed a strong arm to walk her out of the Burning Blade's reach.",
    third = "{name} met Dalinda Malem, a captive of the Burning Blade at Thunder Axe Fortress in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Thank the Light, a friendly face! Please, keep your voice down; they walk past this door every hour." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I wasn't sure anyone would, not in this place." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they can, ask them now. The Burning Blade have been poisoning this place for years, and I've felt it in my teeth since the day they dragged me in." } },
      choices = {
        { text = "Stay close. I won't leave you behind.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep up. I won't wait if the cult comes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Quickly, and by the side passages, because the cultists gather in the great hall when the watch changes. If they come at us, keep them off me long enough to run, and I'll make sure Vahlarriel knows who carried me out." } },
      choices = {
        { text = "We stick to your plan. Side passages, no detours.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No sneaking. We go through the hall and break them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They kept me fed, mostly, because they wanted me well enough to answer questions about Nijel's Point. What they wanted most was to know how many soldiers Pentigast had on the ridge, and I'm proud to say I lied about it every time." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} close by, please. The cultists' demons hate animals, and I've heard what an imp does to a hound when nobody's watching." },
      },
      choices = {
        { text = "You held firm under guard. That took real discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Lying to captors is a gamble. You were lucky.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Their guards change at dusk, and the warlocks spend their nights in the lower halls with the demons they keep. I counted the footsteps every night because there was nothing else to do, and I'll tell Vahlarriel all of it once we're clear of this place." } },
      choices = {
        { text = "We go quietly. No one needs to know we were here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We'll leave a few cultists dead on the way, as a message.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More than I could count from my cell, and they practice on anything that moves, which includes their own people when they get careless. They summon things in the deep chambers too, and the walls go hot when they do." } },
      choices = {
        { text = "I'll fight their fire carefully, and only as much as I must.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll burn the whole cult out of this fortress.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know enough to say, and I hope I never will. All I know is that they kneel to their demons and pray to them, and I've never once heard any of them give an order to one." } },
      choices = {
        { text = "I command my demon. I'll never kneel to one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps they know something I don't. Power is power.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The ground outside the fortress is black and cracked, and the water in the cisterns tastes of metal. I don't think anything will grow here for a long time, though I'd like to hope I'm wrong." } },
      choices = {
        { text = "It will heal, given time and care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some places should be left to rot. This is one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Thank the Light, because the cultists in this fortress keep demons at heel, and I'd much rather they met your shield than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, then, and you tracked me all the way into this place. If you could follow a trail in, you can follow it back out, and I've never been so glad to think it." },
        { id = "h_default", key = true, text = "Dalinda Malem, and I've been the Burning Blade's guest far longer than I wanted. Vahlarriel Demonslayer at Nijel's Point sent people to find me, and I can only hope you're one of them." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Return to Vahlarriel") }, text = "If you're taking me out, stay close and watch the corners, because the cultists won't simply let me walk out the front gate." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You got in here without the cultists raising the alarm, so I'm hoping you know how to get us both out the same way." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, thank the Light. The cultists' sorcerers throw fel fire about as if it were nothing, and I'd feel far better with someone who can answer it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You smell of the same smoke as the cultists, and I won't pretend that doesn't frighten me. But you came for me, so I'll follow you out and ask no questions until we're home." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've not seen anything green in weeks, and you look like you might remember what it was like." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Whatever the Burning Blade did with fel in here, I hope your spirits can still hear you, because I'd rather not walk out of this fortress alone." },
      },
      again = { { id = "h_again", text = "What else? Speak quickly, please." }, { id = "h_again2", text = "Ask, but softly." } },
      choices = {
        { text = "What happened to you?", next = "b1_1" },
        { text = "Who is Vahlarriel?", next = "b2_1" },
        { text = "Are you hurt?", next = "b3_1" },
        { text = "The Light will see you home.", next = "x_1", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Should we burn this fortress down?", next = "s_1" },
        { text = "How should we fight our way out of here, Dalinda?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Did they treat you badly in here, Dalinda?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What did you learn while they held you, Dalinda?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How many sorcerers do they have here, Dalinda?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Burning Blade warlocks differ from me, Dalinda?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What has the cult done to the land around here?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can the spirits help us out of here, Dalinda?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I came to Desolace looking into the Burning Blade, and they found me before I found them. They brought me to Thunder Axe and kept me alive, which frightened me more than anything else they did." } },
      choices = { { text = "Why keep you alive?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I heard them chanting at night, and I heard names I wish I hadn't, names of demons I won't say aloud. Whatever they're building here, it isn't finished yet." } },
      choices = { { text = "What are they building?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Vahlarriel needs to hear everything I've seen. If I don't make it back, tell her the fortress is only the beginning." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Vahlarriel Demonslayer, a night elf at Nijel's Point who has hunted the Burning Blade longer than I've been alive. She is fierce and she doesn't give up, which is why I'm still hoping." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Bruised and tired, but I can walk, and I can run if I must. Just get me past the gate and I'll keep up with you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "I've prayed for exactly that every night in this cell. Having you here feels like an answer, and I'm not ashamed to say it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Part of me wants to see the whole place in ashes, but I'm not sure fire alone ends a thing like the Burning Blade." } },
      choices = { { text = "Burn it. Some evils deserve no second chance.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Get you out first. Vengeance can wait for an army.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, and I've had a long time in here to think about everything." } } },
}

P:NPC {
  key = "vahlarriel", id = TODO_NPC("Vahlarriel Demonslayer"), name = "Vahlarriel Demonslayer",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Vahlarriel Demonslayer keeps her watch at Nijel's Point with the stillness of a hunter who has been tracking the same prey for years.",
    third = "{name} met Vahlarriel Demonslayer, a night elf demon hunter of the Burning Blade's trail, at Nijel's Point.",
  },
  greetings = {
    { id = "g_main", text = "Ishnu-alah. You walked in from the hills, so you've seen what Desolace has become." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; I've more work than allies." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We trust deeds. The Burning Blade bargain with demons in that fortress, and if your spirits help bring Dalinda home, that's all the trust I need." } },
      choices = {
        { text = "Then I'll earn your trust with deeds.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I don't need your trust. Just your coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They fight with a fury that isn't wholly their own, because the demons they serve lend them strength and take something in payment. A disciplined warrior will outlast them, since that borrowed fury burns hot and gives out before the fight is done." } },
      choices = {
        { text = "My strength is my own. I need no demon's gift.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Borrowed fury still wins fights. I wouldn't turn it down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Long enough that I know their marks better than my own name: the scorched grass where they summon, the satyr hoofprints that don't match the rest of the herd. A demon's trail is like any other, except that it runs colder, and it leads you somewhere you'll wish you'd never gone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would have their scent within the hour, I think. Demons leave a stink no beast mistakes for prey, and every animal I've ever hunted beside hated it." },
      },
      choices = {
        { text = "I'll follow the trail to the end, however long it runs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hunt that never ends isn't worth following.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "What they always do: drunk it dry and left the husk. Their warlocks draw on fel power in the fortress and the Mannoroc Coven, and nothing green grows near either." } },
      choices = {
        { text = "Free their captives first. Dalinda matters more than revenge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Kill every warlock. Demon-servants deserve no quarter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Patience, mostly, and a good look at the walls before the sun goes down. The cult changes its watch at dusk, and for a few breaths the north side of the fortress is looking the wrong way, which is how Dalinda's trail came back to me at all." } },
      choices = {
        { text = "Then I'll slip in at dusk and leave no one alive.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll go in quietly and bring her out alive. Nothing more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Shadow and fel, the same gifts the Legion gave the orcs before Thrall cast them off. They bind imps and felhounds to guard their halls, and I've seen a single sorcerer hold a doorway against three Sentinels." } },
      choices = {
        { text = "Burn them out. They gave up mercy when they bowed to demons.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll stop them, but the captives come first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They break them slowly, with fear and fel magic, until the prisoner forgets there was ever a world outside Thunder Axe Fortress. I have seen what comes out of those halls, and it is not always the person who went in." } },
      choices = {
        { text = "The Light can mend even that, given time. I believe it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some wounds don't close. Kill the cultists and be done.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Thunder Axe Fortress in the north is their stronghold, and there are worse things than cultists down at Mannoroc Coven. Go carefully, because the cult has learned how to fight people who wear the Light like armor." } },
      choices = {
        { text = "I'll go in openly, under the Light. Let them see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll slip in quietly and take them before they call their demons.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. The Burning Blade train fighters of their own at Thunder Axe, and I'd like to see how one of ours measures up." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. You'll know what it is to follow a trail for years and still be glad of the next print, and that's all the Burning Blade have ever left me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because where the Burning Blade has been, the people they leave behind need more than a sword, and Dalinda Malem may need it most of all if anyone ever brings her home." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Burning Blade bow to demons in Thunder Axe Fortress, and I have waited a long time for someone who would walk into that place without flinching." },
        { id = "h_default", key = true, text = "Vahlarriel Demonslayer. I hunt the Burning Blade, the cult that bends the knee to demons, and their trail runs straight through Thunder Axe Fortress. One of ours, Dalinda Malem, went missing there." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Return to Vahlarriel") }, text = "Bring Dalinda back to me alive, and whatever she's learned inside that fortress may be worth more than anything we could take by force." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Ishnu-alah, druid. The Burning Blade has fouled the earth around Thunder Axe Fortress, and you will feel it in your bones before you see it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You walk quietly, and I've learned to value that, because the Burning Blade post sentries at Thunder Axe who are better at listening than at fighting." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The Burning Blade's sorcerers at Thunder Axe throw fel fire, and I'd welcome someone who knows how to throw something back." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Burning Blade", min = 30 } }, text = "I've been counting the Burning Blade's patrols, and they're thinner than they were before you came. Whatever you've been doing out at Thunder Axe, don't stop." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Our druids say the elements were wounded when the Well of Eternity fell, and I wonder whether you can hear the scars." },
      },
      again = { { id = "h_again", text = "Ask, but quickly; the Burning Blade does not rest while we talk." }, { id = "h_again2", text = "Speak, then, but briefly; the Burning Blade won't hunt themselves down." } },
      choices = {
        { text = "What have the demon-worshippers done to this land?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about the Burning Blade.", next = "b1_1" },
        { text = "Why do they call you Demonslayer?", next = "b2_1" },
        { text = "What of Dalinda Malem?", next = "b3_1" },
        { text = "I command demons too, and I serve no cult.", next = "x_1", when = { class = "WARLOCK" } },
        { text = "Can the Burning Blade's followers be saved?", next = "s_1" },
        { text = "How do you get past the Blade's sentries, Vahlarriel?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What kind of magic do the Blade's sorcerers use, Vahlarriel?", next = "xmage", when = { class = "MAGE" } },
        { text = "What does the Burning Blade do to the people they take?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where do the Burning Blade gather in Desolace?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do the Burning Blade's fighters compare, Vahlarriel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How long have you hunted the Burning Blade, Vahlarriel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the kaldorei trust a dwarf who speaks to elements?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are mortals who sold themselves to the Burning Legion's servants, orcs once, and now anyone desperate enough to join them. In Desolace they've made Thunder Axe Fortress their den." } },
      choices = { { text = "What are they summoning?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "They summon what they can and bargain for more. Every demon that walks out of Mannoroc Coven is one more thing this land will have to bury." } },
      choices = { { text = "How do I fight them?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Strike at their leaders and the rest will scatter, but do not let them speak to you for long. Their words are a second weapon." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because that is what I do, and I have done it longer than your kingdoms have had names. The name was earned, not given." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "She went into the fortress to learn what they plan and did not come out. I believe she still lives, because the Blade keeps prisoners who know things." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "I know what you are, and I know the line you walk. Step over it once, and you'll find me waiting on the other side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some came to the cult hungry, some came afraid, and some came because they liked it. I no longer have time to tell which is which." } },
      choices = { { text = "Spare those who surrender. Not all of them chose this.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Show none of them mercy. They chose demons over their own.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't concern myself with that. The Blade is enough to hunt." } } },
}

P:NPC {
  key = "rexxar", id = TODO_NPC("Rexxar"), name = "Rexxar",
  bible = "bibles/desolace.md", role = "citizen", tier = "service",
  impression = {
    first = "Rexxar walks the roads of Desolace with his bear Misha at his side, and he looks at strangers as though weighing whether they're worth the trouble.",
    third = "{name} met Rexxar, the half-ogre beastmaster, on the roads of Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Misha doesn't like you yet. Give her time, and don't make any sudden moves." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Misha remembers you, which is a good sign." },
  },
  start = "hello",
  nodes = {
    xpt_rexxar = {
      big = true,
      lines = { { id = "xpt_rexxar_default", text = "Because people ask things of you when you stay among them, and I've given the Horde all I mean to give. Misha asks for nothing but meat and quiet, and the wilds are honest in a way that cities never are." } },
      choices = {
        { text = "A pack is stronger than a lone wolf, Rexxar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I understand. Some of us are meant to walk alone.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I trust anyone who has walked the wilds long enough to know the elements are not servants. Banners mean little to Misha and me, but the ones who wave them hardest usually listen least." } },
      choices = {
        { text = "The elements serve no banner, and neither do I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'm loyal to the Alliance first, Rexxar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "By what it does when no one's watching. I've seen the Light carried by men who burned villages, and I've seen the dead fight harder for their friends than the living. Show me which you are, and Misha will decide whether she likes you." } },
      choices = {
        { text = "Judge me by my deeds. I keep my word, watched or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Deeds are deeds. Whether anyone's watching changes nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That nobody's behind you, mostly, and that no banner will hold your ground when a thunder lizard decides it's hungry. The cities teach soldiers to fight in ranks, but only the wild teaches them when not to fight at all." } },
      choices = {
        { text = "The ranks are the Horde's strength. I'll keep to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ranks make soldiers soft. I'll learn the wild's way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That's between Misha and me, and she's never told anyone, so neither will I. What I'll say is that she's saved my life more times than I've saved hers, and I've stopped keeping count, because a true bond doesn't keep a ledger." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Misha's watching {pet}, and she hasn't growled yet. That's the highest praise she gives anyone, so take it." },
      },
      choices = {
        { text = "A true companion is family. I'd die for mine.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast is a tool, Rexxar, however loyal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I am not alone; Misha is with me. Cities make people forget what they owe the land, and out here, nothing lets me forget it." } },
      choices = {
        { text = "The Horde needs its champions near its cities.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The wilds are freer than any city. You chose well.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That every creature here kills only what it must, and leaves the rest alone. The cities are full of people who stab for coin and call it cunning, and I trust Misha's instincts over theirs every day." } },
      choices = {
        { text = "I strike only when there's need. That's the hunter's way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Coin is need enough. The wilds aren't my home.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I hold it against anyone who thinks the demons can be mastered, because the Horde believed that too and paid for it with its soul. Thrall broke that chain, and I'll not watch someone forge a new link in it." } },
      choices = {
        { text = "I master my demons. The old Horde was weak, not cursed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I know the price. I won't let the Horde pay it again.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_rexxar", tags = { "news" }, when = { party = { size = { min = 1 } }, faction = "Horde" },
          text = "You travel with others. Misha and I walk alone and like it that way, but I won't tell you how to choose your pack." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You carry yourself like one of Orgrimmar's, all shoulders and orders, and Misha has already decided she doesn't trust you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Good, then you'll understand why I'd rather speak with Misha than with most of the Horde's chieftains." },
        { id = "h_default", key = true, text = "I am Rexxar, Champion of the Horde, though I spend little time near its cities. The wilds suit Misha and me better than walls and politics do." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. Misha likes you, which is more than she says for most who walk these roads." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. Thrall's shamans walk with the elements the way I walk with Misha, as partners, so I'll hear you out." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I have seen what the Light and the loa can mend, and I have seen what neither can, so do your work where it is needed and don't waste words on me." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Misha does not care for the smell of the arcane, but she has learned to tolerate it, and so have I." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'd do well in the wilds, for you already know how to move without being heard, and that's a lesson most of the Horde never learns." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "You carry the stink of demons. My father's people drank from that cup once, and I've seen what it did to them, so speak carefully." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one carrying the Light. Misha doesn't like your smell, and I'm not sure I do either, but I've learned not to judge a creature by its scent alone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I have seen orcs and tauren walk with the elements, never one of the mountain folk, so I'll hear you out." },
      },
      again = { { id = "h_again", text = "Speak your mind." }, { id = "h_again2", text = "Misha's listening too." } },
      choices = {
        { text = "Why do you walk the wilds alone, Rexxar?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do you trust the shamans of the Horde, Rexxar?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What do you hunt in Desolace, Rexxar?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why travel alone?", next = "b1_1" },
        { text = "Tell me about Misha.", next = "b2_1" },
        { text = "Is the Horde worth fighting for?", next = "s_1" },
        { text = "What do the wilds teach that the cities don't, Rexxar?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you hold the orcs' past against warlocks, Rexxar?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What does a warrior learn out in the wilds, Rexxar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How did you and Misha come to hunt together, Rexxar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you judge a creature by, Rexxar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do you trust a shaman of the Alliance, Rexxar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Why do you walk alone, Rexxar?", next = "xpt_rexxar", when = { party = { size = { min = 1 } }, faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I'm Mok'Nathal, and my father's people are few and scattered. I fought beside Thrall when the Horde needed it, and when the fighting ended, I returned to the road." } },
      choices = { { text = "You fought beside Thrall?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Cities are full of people who want something from me. Out here, the only thing that wants something is the land, and it tells you plainly." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Misha is my companion and my friend, and she has saved my life more times than any warrior I've fought beside. Treat her with respect, and she'll do the same for you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "The Horde gave the orcs a home and a future, and Thrall leads it well. Still, I've seen what the old Horde did, and I don't forget it." } },
      choices = { { text = "It's worth fighting for, whatever it was.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Loyalty to a banner is a cage. Trust yourself first.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Whatever threatens the Horde and the beasts both, and in Desolace that is often the same thing. The centaur kill more than they need and the Burning Blade foul the ground, so a spellcaster with steady hands would find work enough out here." } },
      choices = {
        { text = "Then I'll hunt beside you, where the Horde needs it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt what pays. The rest is someone else's war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I trust Thrall, and I trust a shaman who has walked the wilds long enough to know the elements are not servants. The ones who stay in Orgrimmar arguing politics I leave to the cities, because Misha and I have no patience for them." } },
      choices = {
        { text = "The Horde needs its shamans in Orgrimmar, guiding the Warchief.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A shaman belongs in the wilds, far from walls and politics.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know that, and I don't much care to." } } },
}
