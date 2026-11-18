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
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "From the ridges on the north side, mostly, where the ground's high and the sun's at their backs. And keep {pet} away from the kodos' heels, friend, because a kodo spooked by a beast can kick a wagon over, and I've the bills to prove it." },
      },
      choices = {
        { text = "I'll warn you first and fight second. The caravan comes first.", next = "BACK", reply = "That's what I want to hear, friend, because a warning on time saves more kodos than any arrow ever has.", fx = { align = { honor = 1 } } },
        { text = "I'd rather pick off centaurs than mind your wagons.", next = "BACK", reply = "Pick off all you like, friend, but if the wagons burn while you're up on the ridge, you'll walk to Feralas.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Better than I treat myself, friend, because a lame kodo out here means a lost caravan. The Kolkar know it too, and they go for the beasts first, every time." } },
      choices = {
        { text = "Guard the beasts first. They carry everyone.", next = "BACK", reply = "Exactly right, because a caravan without kodos is just a heap of crates waiting for the Kolkar to collect.", fx = { align = { honor = 1 } } },
        { text = "Let the Kolkar have a kodo. It buys the wagons time.", next = "BACK", reply = "I've thought about it on the bad days, but those beasts are family to the drivers, and I'll not throw one away.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a hired guard who thought a crate of Gadgetzan whiskey wouldn't be missed between two centaur raids. My brother Rigger caught it in the ledger by sundown, and we left him at the next waystone with a waterskin and a long walk." } },
      choices = {
        { text = "That's fair justice. A caravan runs on trust.", next = "BACK", reply = "It does, and Rigger never forgets a crate, so anyone who tries it on this road learns fast.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Harsh. Out here, a man takes what he can.", next = "BACK", reply = "Maybe out here he does, but not from my wagons, and not while Rigger's keeping the books.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "One, a gnome with a temper, who set the Magram's arrows alight in midair and then set fire to our flour by mistake. We went hungry for three days and I'd still hire him again, because we didn't lose a single kodo." } },
      choices = {
        { text = "Better a scorched cart than a dead kodo. Burn first, count later.", next = "BACK", reply = "That's the gnome's philosophy exactly, and I'm half inclined to agree, so long as there's flour left at the end.", fx = { align = { order = -1 } } },
        { text = "I'd rather protect the cargo carefully than scorch it.", next = "BACK", reply = "Careful is good, and I'd hire you for it, but the centaur don't wait for anybody to be careful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Stubbornness and pay, mostly, and knowing that the caravan doesn't stop for anybody. The Kolkar and the Magram both reckon a kodo train is a gift on legs, so my folk pray in their own fashion, which is loudly and with a crossbow handy." } },
      choices = {
        { text = "Faith steadies the hand better than coin. I'll pray with them.", next = "BACK", reply = "Then you'll be welcome at the evening fire, friend, because the drivers could use a bit of steadying.", fx = { align = { light = 1 } } },
        { text = "A crossbow answers faster than any prayer. Keep them armed.", next = "BACK", reply = "They're armed, believe me, but a crossbow and a prayer together never hurt anybody on this road.", fx = { align = { light = -1 } } },
        { text = "Something else, Cork.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd say a caravan's as worthy as anything else, because there's grain and cloth and medicine on these kodos, and half of it's going to folk who've got nothing else. Not that I'm asking you for anything, mind, I just want it said." } },
      choices = {
        { text = "I'll stand between your drivers and the centaur, and gladly.", next = "BACK", reply = "You're a better soul than most who walk this road, and the drivers will be glad to see you riding with them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make it worth my while, and I'll think about it.", next = "BACK", reply = "Fair enough, friend, and I'll have Rigger look at what we can spare, which won't be much, but it'll be honest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Walk out on the flank, would you, because if the Kolkar come down off the ridge I want to know before they reach the kodos." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Well, that's a fine thing to see on the Desolace road, because the Kolkar have hit us twice this season, and my drivers would sleep a sight better knowing somebody up front can patch an arrow wound." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, out here on my road! If you're heading the same way as the caravan, the kodos won't mind the company, and the centaurs might think twice before they come down off the ridge." },
        { id = "h_default", key = true, text = "I'm Cork Gizelton, and this is the Gizelton caravan, the only honest freight between the Kodo Graveyard and the south road. My brother Rigger runs the back half and I run the front, and the centaurs would happily run off with both." },
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
        { text = "Someone's been hitting this caravan hard.", next = "b1_1" },
        { text = "What do you haul?", next = "b2_1" },
        { text = "Tell me about your brother.", next = "b3_1" },
        { text = "I can hold a line against centaurs.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Do the Kolkar and the Magram trouble the caravan often, Cork?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your caravan could use a spellcaster on the road.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why not just pay the centaurs off?", next = "s_1" },
        { text = "Someone must have tried robbing the caravan from inside, Cork.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Mages must have guarded the caravan before, Cork.", next = "xmage", when = { class = "MAGE" } },
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
      choices = { { text = "A deal is a deal. Pay the toll and keep the road quiet.", next = "BACK", reply = "You might be right, and I'd sleep easier, but once you pay one clan, the other wants double.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Pay them once and they'll take everything next time.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Pal, I could use ten, because the Kolkar and the Magram both hit us on the same run and my guards only get paid for one fight. Walk alongside the wagons for a stretch, and you'll see more centaur than you ever wanted to." } },
      choices = {
        { text = "I'll guard the wagons. Honest freight deserves to get through.", next = "BACK", reply = "That's the spirit, friend, and you'll find the drivers share their water with anyone who walks beside them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Guard duty's for hire, Cork, if the pay is right.", next = "BACK", reply = "Rigger keeps the purse, and he'll pay what's fair, but don't expect Stormwind wages out here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every trip, without fail, because the Kolkar hit us on one stretch of road and the Magram on the next, and we're stuck in the middle with the freight. The kodos feel the ground shake before the centaurs come over the hill, so I trust a twitchy kodo over any scout." } },
      choices = {
        { text = "Pay the clans for safe passage. Fair dealing saves lives.", next = "BACK", reply = "I've tried, friend, but the Kolkar and the Magram each want to be paid to keep the other off, and that's no bargain.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Set a trap ahead of them and end it for good.", next = "BACK", reply = "Now there's a plan, and if you set it, I'll be right behind you with every guard I've got.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_centaur", text = "The centaur hit the caravan two, three times a season, and every time, I lose a kodo, a crate and a mercenary. Kodos are the most expensive, by the way, so guard those first." } },
    booty_bay = { { id = "tp_booty_bay", text = "My cousin runs ships out of Booty Bay, and he says the pirates are getting bolder. I say the centaur are getting bolder, and he says at least they don't have cannons." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's where the real money is, pal, but the road's longer and the sand gets into everything. Desolace is cheaper, if you don't count the funerals." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel takes its cut and keeps the docks safe, more or less, and on the road we keep ourselves safe. That's why I hire people like you." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon is centaur holy ground, and the centaur don't like caravans parking on it. Believe me, we learned that the hard way." } },
    _none = { { id = "tp_none", text = "Not my cargo, not my concern, friend. Ask me about the road instead." } },
  },
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
        { text = "I'll hold the tail. Chasing them is what they want.", next = "BACK", reply = "That's the guard I've been looking for, and the drivers at the back will sleep easier knowing you're there.", fx = { align = { order = 1 } } },
        { text = "If they run, I'll run them down. Let them learn.", next = "BACK", reply = "Then you'll leave the tail open while you're gone, and that's when the next band hits us, every time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Twice this year, both to hyenas that followed us for three days before they tried it. The ledger says two kodos lost to wildlife, but it doesn't say how long I sat up watching for them on the third night." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Twice this year, both to hyenas that followed us for three days before they tried it. {pet} can walk by the tail wagon with me. The kodos are used to beasts on the road, and frankly yours looks better behaved than some of the drivers." },
      },
      choices = {
        { text = "Then I'll keep watch on the tail through the night.", next = "BACK", reply = "Thank you, friend, and I'll take the first half of the night, because I'm awake anyway.", fx = { align = { order = 1 } } },
        { text = "Hunt the hyenas down before they follow you again.", next = "BACK", reply = "I'd like that, and so would the kodos, though I'd ask you to come back before the next stretch.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cork thinks so and I've half come round to it, because the Kolkar know our timings better than our own drivers do. Somebody at one of the waystones is talking, and I'd pay well for a quiet word with whoever's listening." } },
      choices = {
        { text = "Find the leak and make an example of him.", next = "BACK", reply = "An example? Maybe, though I'd rather just have him stop talking, and Nijel's Point has a cell for that.", fx = { align = { honor = -1 } } },
        { text = "Find the leak and turn him over to Nijel's Point.", next = "BACK", reply = "That's the right way, and I'll put it in the ledger, which is how I like everything settled.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Rigger.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only since we hauled past Thunder Axe Fortress and a pair of the Burning Blade's felhounds came down the slope at us. The kodos stampeded halfway to the Kodo Graveyard, and it took us two days to round them up again." } },
      choices = {
        { text = "My minion follows my word. Your kodos are safe.", next = "BACK", reply = "Thank you, and I'll mark it in the ledger, because a promise like that is worth writing down.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your kodos will learn. Demons aren't going anywhere.", next = "BACK", reply = "They won't, I promise you, and if they stampede again, I'll be adding the cost to your account.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "We do, from the Kolkar mostly, and from the odd pack of hyenas that think the kodos are dinner. Cork wants me to pay guards by the centaur killed, but I'd rather pay by the wagon that arrives whole, because that's the number that matters." } },
      choices = {
        { text = "Pay by the wagon. Protecting people is the point.", next = "BACK", reply = "That's what I've been telling Cork, and it's nice to have someone say it back to me.", fx = { align = { light = 1 } } },
        { text = "Pay by the kill. Fewer centaur means safer roads.", next = "BACK", reply = "Fewer centaur, maybe, but a guard paid by the kill wanders off chasing ears, and the wagons pay for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Water at every stop, whether they want it or not, and I count every barrel twice. Cork thinks I fuss, but we've lost three kodos to this road in five years and I can tell you the date and the cause of every one." } },
      choices = {
        { text = "Good. Beasts that work for you deserve that much care.", next = "BACK", reply = "I think so too, and I'll keep fussing, whatever Cork says about it.", fx = { align = { light = 1 } } },
        { text = "Three kodos in five years? That's a fair cost of business.", next = "BACK", reply = "It is, by the ledger, but each one had a name, and the drivers remember them better than the ledger does.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than Cork admits, because he's taken two arrows on this route and called both of them scratches. I keep bandages on the ledger as an expense, and every time I use one, I write the reason beside it, so I can prove to him later that I was right." } },
      choices = {
        { text = "I'll patch up anyone on the caravan, guard or kodo.", next = "BACK", reply = "Thank you, friend, and you'll find the drivers are very good patients, unlike my brother.", fx = { align = { light = 1 } } },
        { text = "If Cork wants to bleed, that's his choice to make.", next = "BACK", reply = "It's his choice, but I'm the one who writes it down, so I'll keep the bandages close all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It would! I'd have to write it in, and then who paid for it, and then what it's worth, and conjured water is worth nothing once it's gone. Still, if a kodo's dying of thirst halfway to Feralas, I'll take the ruined page." } },
      choices = {
        { text = "Then the kodos come first, and your ledger second.", next = "BACK", reply = "Then you'll get along with the drivers just fine, because they'd say the same and never mind the book.", fx = { align = { light = 1 } } },
        { text = "Conjured water is worth something. Charge for it.", next = "BACK", reply = "I'll try, but Cork would say it's priceless and refuse to charge, so we'll argue about it on the road.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Stand at the back with me, then, because the Kolkar like to hit the last wagon and run, and Cork never hears it over his own shouting." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Keep a count of the centaur you see on the ridges and tell me, because I count everything else on this caravan and I'd hate to leave them out." },
        { id = "h_default", key = true, text = "I'm Rigger Gizelton, the half of the Gizelton caravan that does the counting. Cork shouts at the front and I make sure everything we started with is still here when we stop." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Gizelton Caravan") }, text = "You're guarding us through the Kolkar country, then. Stay by the wagons and don't chase them into the hills, because that's exactly what they want." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. I don't suppose the spirits can count, because I could use a second pair of eyes on this ledger." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, good. If anything goes wrong on this run, you'll be the one patching up the drivers, and I'll write down how many bandages you used." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Don't conjure anything into my wagons, please, because I count the crates, and an extra one is just as much trouble as a missing one." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? Then you'll appreciate that every lock on this caravan was bought from a goblin who swore it couldn't be picked, and I'd hate to find out he lied." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Please keep that little fellow of yours away from the kodos, because they spook at the smell of him and I'm the one who has to calm them down." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in full plate, in Desolace! You'll cook in that, you know, but I'll gladly put you on the books as caravan guard if you can keep up with a kodo." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, would you mind having a word with the kodos? They've been sulking since Feralas, and a sulking kodo walks half as fast and eats twice as much." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, because if anything goes wrong between here and Feralas, you're the closest thing to a healer this caravan has ever had." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Don't conjure anything into my wagons, please, because I count every crate and a crate of water that wasn't there yesterday ruins a whole page of the ledger." },
      },
      again = { { id = "h_again", text = "Anything else? I've a ledger waiting." }, { id = "h_again2", text = "Go on, I'm listening, and counting." } },
      choices = {
        { text = "What's it like working with Cork?", next = "b1_1" },
        { text = "That ledger looks heavier than the cargo.", next = "b2_1" },
        { text = "Is Desolace worth the risk?", next = "b3_1" },
        { text = "I've kept a few ledgers myself.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Does the caravan ever carry anything for shamans, Rigger?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the back of the caravan need most?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do you ever cheat the books?", next = "s_1" },
        { text = "Someone seems to be selling your route, Rigger.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have your kodos always feared demons, Rigger?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do the centaur hit the back of the caravan, Rigger?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does the caravan ever lose kodos to wild beasts, Rigger?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You'll want protecting on this road, Rigger.", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you keep the kodos healthy out here, Rigger?", next = "xdruid", when = { class = "DRUID" } },
        { text = "This road must keep a healer busy, Rigger.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
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
      lines = { { id = "b1_3_l", text = "So if you're guarding us, keep close to him at the front. He'll never admit he needs it, and I won't be counting him among the losses." } },
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
      lines = { { id = "s_1_l", text = "I've been offered good coin to lose a crate or two on the road, and I've never taken it, though I came close the winter my mule died." } },
      choices = { { text = "Honest books keep honest roads. You did right.", next = "BACK", reply = "Thank you, friend, and it's nice to know someone else thinks the ledger matters as much as I do.", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Out here, a little skimming keeps a family fed.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Somebody who watches behind us, because the centaur always hit the back half while Cork's busy shouting at the front. A spell or two at the right moment saves me a crate, and a crate saved is the best kind of crate." } },
      choices = {
        { text = "I'll ride at the back and guard every crate.", next = "BACK", reply = "The back half will be the safest it's been all year, and I'll write that down with a smile.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Crates don't bleed. I'll guard the drivers, not your freight.", next = "BACK", reply = "Fair enough, and the drivers will thank you, though the crates will grumble in the ledger later.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Sacred stones bound for Shadowprey Village, once, and a crate of totems from the Barrens that nobody ever signed for. I counted them twice and never opened the crate, because I've seen what happens to folk who rattle the wrong box." } },
      choices = {
        { text = "Good. Sacred things should arrive untouched.", next = "BACK", reply = "That's how I see it too, and the shaman at Shadowprey thanked me for it, which is more than most people do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quick look inside never hurt anyone.", next = "BACK", reply = "Maybe not, but I've heard stories of what's in some of those crates, so I'll leave the lid on.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_centaur", text = "Every raid costs me crates, kodos and wages, and I've got a column in the ledger called \"centaur\" that keeps getting longer. Someday I'll cross it out, but not this year." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "We sell in Gadgetzan when the goods are worth the trip, and they never are until we get there. That's the trade, kid." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel charges us dues for the privilege of being robbed on our own roads. I pay because the alternative is being robbed by the Cartel too." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's prices make my eyes water, and I've seen what our goods sell for there. If I could get this caravan onto a boat I'd be a rich goblin." } },
    _none = { { id = "tp_none", text = "That's not in the ledger, friend, so I couldn't tell you." } },
  },
}

P:NPC {
  key = "smeed", id = TODO_NPC("Smeed Scrabblescrew"), name = "Smeed Scrabblescrew",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Smeed Scrabblescrew runs a goblin camp at the edge of the Kodo Graveyard and wants live kodos rounded up, preferably by somebody else.",
    third = "{name} met the goblin Smeed Scrabblescrew at his camp near the Kodo Graveyard in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Hey, hey, buddy! A fresh face, and you look like someone who can handle a kodo, so come here, come here, because I've got a business opportunity and the paperwork's already drawn up." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor's back! Got time for a little roundup work, buddy? The rates haven't changed, which in Desolace is practically a gift." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very, but only if you're doing it wrong, and you're doing it wrong if you get kicked. The Kombobulator makes them docile, mostly, but an old bull can still flatten a fella, so you'll want plate and a cheerful attitude." } },
      choices = {
        { text = "I'll do it, but the old kodos deserve better than a sale.", next = "BACK", reply = "Deserve? Pal, they get grass, water and a job, which is more than most goblins get, so I call that a good home.", fx = { align = { honor = 1 } } },
        { text = "A job's a job, Smeed. Point me at the kodos.", next = "BACK", reply = "That's what I like to hear, pal, and the Kombobulator's on the cart, so mind the bull with the bent horn.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Same thing, give or take the paperwork. You bond with your beast and I bond with my buyers, and everybody walks away with something big and loyal, so I really don't see why the tauren get so upset about it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Same thing, give or take the paperwork. Say, how much for {pet}? I'm kidding, kidding, put the bow down, I can see it's not for sale." },
      },
      choices = {
        { text = "A hunter's bond isn't a sale. It's nothing like your trade.", next = "BACK", reply = "Sure it is, pal, sure, but I'd point out we both end up with a big loyal beast and a happy customer.", fx = { align = { honor = 1 } } },
        { text = "Coin is coin. I won't judge your business.", next = "BACK", reply = "Now you're thinkin' like a businessman, pal, and I'll remember that when the next job comes up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They go to good homes, mostly caravans and the odd tauren who's short a beast of burden. It beats wandering into the Graveyard to die alone, if you ask me, and since you're asking, I'm telling you." } },
      choices = {
        { text = "Let the old ones die in peace where they choose.", next = "BACK", reply = "Peace, sure, pal, but peace doesn't pay, and those old fellas still have a few good years of pulling in 'em.", fx = { align = { light = 1 } } },
        { text = "A working kodo beats a dead one. Fair trade.", next = "BACK", reply = "Exactly what I keep tellin' the tauren, pal, and they keep lookin' at me like I've kicked their grandmother.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Discreet folk, pal, and they stay discreet because I don't spread their names around Desolace. Let's just say a kodo fetches a better price in Booty Bay than it does here, and the Cartel's cut is a lot friendlier than the tax at Nijel's Point." } },
      choices = {
        { text = "I don't care who buys. Show me the coin.", next = "BACK", reply = "Now there's a partner I can work with, pal, and I'll see your share comes in a nice heavy pouch.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd want to know where the beasts end up first.", next = "BACK", reply = "Want to know, eh? Pal, knowing costs extra, and my buyers pay a premium for not being known.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I want kodos rounded up, pal, and I'm not fussy about the shepherd. The trouble is every kodo in the Graveyard bolts at the first whiff of brimstone, so your demon would cost me more in runaways than it saves." } },
      choices = {
        { text = "My demons aren't hired hands. Find another shepherd.", next = "BACK", reply = "Fair enough, pal, and I'll find someone without the brimstone smell, though it'll cost me more.", fx = { align = { order = 1 } } },
        { text = "A demon will work if the price is right. Make an offer.", next = "BACK", reply = "Ha, now you're talkin', but you'll keep the little horror well downwind of the herd, or it's on your bill.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Right, wrong, it's a market, friend, and somebody's going to sell those kodos sooner or later, so it might as well be the goblin with the good rope. The tauren don't like it and the bones out there don't seem to either, though neither has filed a complaint yet." } },
      choices = {
        { text = "Let the old ones die in peace, Smeed. That's their right.", next = "BACK", reply = "Right, wrong, pal, it's all the same in the ledger, but I'll leave the really old ones, out of courtesy.", fx = { align = { light = 1 } } },
        { text = "A live kodo sells better than a dead one. Sell away.", next = "BACK", reply = "Now that's the attitude that keeps my rope business thriving, pal, and you'll get a cut of the next sale.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mostly! Some go to tauren who want a quiet old beast for the farm, and some go to goblins who want something that can pull a cart without stopping to argue. I don't ask what happens after the sale, because asking is how you lose customers." } },
      choices = {
        { text = "You should ask. Those kodos deserve a decent end.", next = "BACK", reply = "Maybe I should, pal, but if I ask, I might not like the answer, and then I'd have to stop selling.", fx = { align = { light = 1 } } },
        { text = "A sale's a sale. It's no worse than leaving them to die.", next = "BACK", reply = "Exactly what I keep tellin' myself, pal, and most nights I even believe it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a full-grown kodo eats its own weight in grass every week, and there's no grass between here and anywhere. If you mages ever invent a spell to make a kodo small and quiet, you come and find me first, because we'd both be rich." } },
      choices = {
        { text = "Some magic shouldn't be sold, Smeed.", next = "BACK", reply = "Some magic, sure, pal, but a pocket-sized kodo would sell like hot cakes, and I'd hate to miss that.", fx = { align = { order = 1 } } },
        { text = "Find me the gold and I'll find the spell.", next = "BACK", reply = "Now that's a partner with vision, pal, and I'll start saving the gold right now.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Perfect, buddy, because kodos are big and kodos are grumpy, and I need somebody who can take a kick, keep walking and not bill me for the bruise." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Now you'll understand the business, because you tame beasts for a living and I'm just trying to do it at a profit." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Now don't go looking at me like that, because I'm not robbing any graves, I'm just rounding up the live kodos before they lie down and join the dead ones, which is practically a mercy if you think about it." },
        { id = "h_default", key = true, text = "Name's Smeed Scrabblescrew, entrepreneur, buddy. The Graveyard's full of old bones, sure, but the live kodos that wander in are worth real money to the right buyers, and by my last copper, I've got the buyers and a Kodo Kombobulator to bring 'em in." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Kodo Roundup") }, text = "Take the Kodo Kombobulator, get close to an aged or dying kodo, and give it a little zap, buddy. Then lead the tame ones back here and I'll do the rest, which is the part with the money." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid? Look, before you start, the kodos don't mind the Kombobulator, or at least none of them has ever complained to me about it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you call a kodo over for me, pal? I've got buyers waiting, and the blasted things won't come when I whistle, and every day they don't come costs me feed." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, huh? The tauren get awful touchy about this place, so if you can say a word over the bones that keeps them off my back, I'd call it a public service." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage! Can you shrink a kodo, by any chance? Because the shipping costs on these things are murder." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Ah, a professional! You've got the look of someone who knows how to slip a rope round something big without it noticing, and that's a skill I pay for." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, don't take this wrong, but could one of your demons herd kodos? I'd pay double for a felhound that works for free." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Uh oh, a paladin. Now before you say anything, every kodo I take out of here is old, sick, or just plain lost, and I'm basically running a retirement home." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you shrink a kodo, by any chance? Because the shipping costs on these things would make a trade prince weep." },
      },
      again = { { id = "h_again", text = "Another question? Fine, but make it quick, buddy, because time's money out here." }, { id = "h_again2", text = "Ask, ask! Every question's free, for now." } },
      choices = {
        { text = "What happens to the kodos you tame?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You picked kodos, of all beasts.", next = "b1_1" },
        { text = "What is the Kombobulator?", next = "b2_1" },
        { text = "How's business?", next = "b3_1" },
        { text = "My people do not sell the kodo's last walk.", next = "x_1", when = { race = "Tauren" } },
        { text = "Why sell the kodos of the Graveyard at all, Smeed?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "People don't seem to like the Kodo Graveyard.", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Graverobbing kodos seems wrong to me.", next = "s_1" },
        { text = "Who are your buyers for these kodos, Smeed?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Demons herding your kodos seems an odd choice, Smeed.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is it right to sell the kodos that come here to die?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How dangerous is leading a kodo out of the Graveyard?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Taming kodos for coin sounds like a hunter's work.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is this really a retirement home for kodos, Smeed?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does shipping a kodo cost so much, Smeed?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Kodos are the wagons of Kalimdor, friend, and I'm the wagon dealer. Caravans, armies and tauren villages all need beasts that'll carry a ton of goods and not complain, and the Graveyard draws 'em in like flies." } },
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
      lines = { { id = "b2_1_l", text = "A goblin marvel, buddy! It calms a kodo right down so it follows you like a lost puppy, mostly. Don't point it at your own face, and don't ask what happened to the last guy who did, because the settlement's still being argued." } },
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
      choices = { { text = "The dead deserve their rest, even beasts.", next = "BACK", reply = "Rest is free, pal, and free doesn't pay my rope bills, but I'll grant you the old ones look tired.", fx = { affinity = 1, align = { light = 1 } } }, { text = "A beast that can still walk can still work.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Beats me, pal, it's just bones, though I'll admit the place gets quiet in a way I don't love. The tauren say the old kodos come here to die and the spirits keep watch, and the spirits haven't paid me a copper, so I don't see why they get a vote." } },
      choices = {
        { text = "Business is business. Bones can't complain.", next = "BACK", reply = "Exactly, pal, and if the bones ever do complain, I'll sell 'em a nice rug to lie on.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The tauren are right. Leave the Graveyard in peace.", next = "BACK", reply = "You sound just like the tauren, pal, and they still haven't offered me a better deal, so the kodos go.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because live kodos fetch a fine price, pal, and the dead ones fetch nothing. Your elders can sing over the bones all they like, but the live ones need a buyer, and I've got the buyers." } },
      choices = {
        { text = "The Graveyard is sacred, and its kodos should be left in peace.", next = "BACK", reply = "Sacred, sure, pal, but the live ones are walking out of it on their own, so I'm just helping them along.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Live kodos are fair game. Money is money.", next = "BACK", reply = "Now you're talkin' like a true goblin, pal, and I'll put you on the payroll if you ever need work.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's a fine institution, buddy, and I'm a fine member of it, and that fine membership costs me a fine fee every quarter. You see how the word fine gets less fine every time I say it." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company would be wrangling kodos out here too if they could, but they'd just strip the bones and sell the graveyard. I've got a little more vision than that, pal." } },
    booty_bay = { { id = "tp_booty_bay", text = "Kodos fetch a good price in Booty Bay, if you can get one on a boat, and you can't, which I learned with a very expensive boat. Never again, pal." } },
    centaur = { { id = "tp_centaur", text = "The centaur don't like my operation and I don't like their arrows, and so far the arrows are winning. That's why I hire contractors, see." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan'll buy a tame kodo for a small fortune, and a wild one for less than you'd hope. Getting from wild to tame is where you come in." } },
    _none = { { id = "tp_none", text = "Never heard of it, buddy, but if it's for sale, I'm interested, and if it ain't, I'm still interested in why not." } },
  },
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
        { text = "Stay close. I won't leave you behind.", next = "BACK", reply = "Thank you, truly, and I'll be right behind you, and I won't let go of your cloak until we're out.", fx = { align = { honor = 1 } } },
        { text = "Keep up. I won't wait if the cult comes.", next = "BACK", reply = "I'll keep up, I promise, I've been waiting too long for this to slow down now.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Quickly, and by the side passages, because the cultists gather in the great hall when the watch changes. If they come at us, keep them off me long enough to run, and I'll make sure Vahlarriel knows who carried me out." } },
      choices = {
        { text = "We stick to your plan. Side passages, no detours.", next = "BACK", reply = "Thank you, that's the safest way, and I've walked it a hundred times in my head every night.", fx = { align = { order = 1 } } },
        { text = "No sneaking. We go through the hall and break them.", next = "BACK", reply = "Through the hall? Then I'll follow, but I'll be shutting my eyes for most of it, I warn you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They kept me fed, mostly, because they wanted me well enough to answer questions about Nijel's Point. What they wanted most was to know how many soldiers Captain Pentigast had on the ridge, and I'm proud to say I lied about it every time." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They kept me fed, mostly, because they wanted me well enough to answer questions about Nijel's Point. Keep {pet} close by, please. The cultists' demons hate animals, and I've heard what an imp does to a hound when nobody's watching." },
      },
      choices = {
        { text = "You held firm under guard. That took real discipline.", next = "BACK", reply = "Thank you, it didn't feel like discipline, it felt like holding my breath for weeks on end.", fx = { align = { order = 1 } } },
        { text = "Lying to captors is a gamble. You were lucky.", next = "BACK", reply = "Maybe I was, and maybe that's all courage is, but I'd do it again if it meant keeping the Point safe.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Their guards change at dusk, and the warlocks spend their nights in the lower halls with the demons they keep. I counted the footsteps every night because there was nothing else to do, and I'll tell Vahlarriel all of it once we're clear of this place." } },
      choices = {
        { text = "We go quietly. No one needs to know we were here.", next = "BACK", reply = "That suits me, because I want to leave this place and never think of it again.", fx = { align = { order = 1 } } },
        { text = "We'll leave a few cultists dead on the way, as a message.", next = "BACK", reply = "I won't stop you, but please don't make me look at them, because I've seen enough of their faces.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More than I could count from my cell, and they practice on anything that moves, which includes their own people when they get careless. They summon things in the deep chambers too, and the walls go hot when they do." } },
      choices = {
        { text = "I'll fight their fire carefully, and only as much as I must.", next = "BACK", reply = "Thank you, because I've seen what happens when their fire meets fire, and the whole hall shakes.", fx = { align = { order = 1 } } },
        { text = "Then I'll burn the whole cult out of this fortress.", next = "BACK", reply = "Then burn it, and I'll watch from outside, but get me out of here before you start.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know enough to say, and I hope I never will. All I know is that they kneel to their demons and pray to them, and I've never once heard any of them give an order to one." } },
      choices = {
        { text = "I command my demon. I'll never kneel to one.", next = "BACK", reply = "Good, because I've seen what happens to those who kneel, and it isn't power that they get.", fx = { align = { order = 1 } } },
        { text = "Perhaps they know something I don't. Power is power.", next = "BACK", reply = "Please don't say that, not here, because those are the exact words they used when they took me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The ground outside the fortress is black and cracked, and the water in the cisterns tastes of metal. I don't think anything will grow here for a long time, though I'd like to hope I'm wrong." } },
      choices = {
        { text = "It will heal, given time and care.", next = "BACK", reply = "I hope you're right, and I'd like to come back one day and see it green, if I ever dare.", fx = { align = { light = 1 } } },
        { text = "Some places should be left to rot. This is one.", next = "BACK", reply = "Perhaps you're right, and I'd be glad to never see it again, though it seems a sad thing to say of any place.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Thank the Light, because the cultists in this fortress keep demons at heel, and I'd much rather they met your shield than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, then, and you tracked me all the way into this place. If you could follow a trail in, you can follow it back out, and I've never been so glad to think it." },
        { id = "h_default", key = true, text = "I'm Dalinda Malem, and I've been the Burning Blade's guest far longer than I wanted. Vahlarriel Demonslayer at Nijel's Point sent people to find me, and I can only hope you're one of them." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Return to Vahlarriel") }, text = "If you're taking me out, stay close and watch the corners, because the cultists won't simply let me walk out the front gate." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You got in here without the cultists raising the alarm, so I'm hoping you know how to get us both out the same way." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, thank the Light. The cultists' sorcerers throw fel fire about as if it were nothing, and I'd feel far better with someone who can answer it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You smell of the same smoke as the cultists, and that frightens me. But you came for me, so I'll follow you out and ask no questions until we're home." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've not seen anything green in weeks, and you look like you might remember what it was like." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Whatever the Burning Blade did with fel in here, I hope your spirits can still hear you, because I'd rather not walk out of this fortress alone." },
      },
      again = { { id = "h_again", text = "What else? Speak quickly, please." }, { id = "h_again2", text = "Ask, but softly." } },
      choices = {
        { text = "What happened to you?", next = "b1_1" },
        { text = "You keep speaking of Vahlarriel.", next = "b2_1" },
        { text = "Are you hurt?", next = "b3_1" },
        { text = "The Light will see you home.", next = "x_1", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Should we burn this fortress down?", next = "s_1" },
        { text = "How should we fight our way out of here, Dalinda?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Did they treat you badly in here, Dalinda?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "They must have let things slip while they held you, Dalinda.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How many sorcerers do they have here, Dalinda?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Burning Blade warlocks differ from me, Dalinda?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The cult has ruined the land around here.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can the spirits help us out of here, Dalinda?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I came to Desolace looking into the Burning Blade, and they found me before I found them. They brought me to Thunder Axe and kept me alive, which frightened me more than anything else they did." } },
      choices = { { text = "Why keep you alive?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "They wanted to know about Nijel's Point, and I think they wanted more than that, because I heard them chanting at night, names of demons I won't say aloud. Whatever they're building here, it isn't finished yet." } },
      choices = { { text = "What are they building?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "I don't know, and that's what frightens me. Vahlarriel needs to hear everything I've seen, so if I don't make it back, tell her the fortress is only the beginning." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Vahlarriel Demonslayer, a night elf at Nijel's Point who has hunted the Burning Blade longer than I've been alive. She is fierce and she doesn't give up, and that's what keeps me hoping." } },
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
      choices = { { text = "Burn it. Some evils deserve no second chance.", next = "BACK", reply = "Then burn it, and I'll stand at Nijel's Point and watch the smoke rise, and maybe that will be enough.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Get you out first. Vengeance can wait for an army.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Blade held me in Thunder Axe Fortress, and I heard them chanting to things that answered. I don't sleep well since, and I don't think I ever will." } },
    centaur = { { id = "tp_centaur", text = "The centaur harried us on the road before the cultists ever took me, so I've no kind word for them either. Desolace has a great many things that want you dead." } },
    theramore = { { id = "tp_theramore", text = "I'd like to go to Theramore, someday, where the walls are high and there's a lady who keeps the peace. That sounds like the most restful place in the world to me." } },
    holy_light = { { id = "tp_holy_light", text = "I prayed to the Light every night in that fortress, and every morning I was still there. Then you came, so perhaps the Light just took its time." } },
    _none = { { id = "tp_none", text = "I don't know, and I've had a long time in here to think about everything." } },
  },
}

P:NPC {
  key = "vahlarriel", id = TODO_NPC("Vahlarriel Demonslayer"), name = "Vahlarriel Demonslayer",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  prejudice = { class = "WARLOCK", amount = 15, why = "years on the Burning Blade's trail; every cultist she caught began by calling the demon a tool" },
  impression = {
    first = "Vahlarriel Demonslayer keeps her watch at Nijel's Point with the stillness of a hunter who has been tracking the same prey for years.",
    third = "{name} met Vahlarriel Demonslayer, a night elf demon hunter of the Burning Blade's trail, at Nijel's Point.",
  },
  greetings = {
    { id = "g_pj_lock", when = { prejudiced = true }, text = "A warlock, at Nijel's Point. I have spent years following the Burning Blade across this waste, and each of them began as somebody who promised the demon was only a tool." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "I've watched how you use your demon, and I've watched how the Burning Blade use theirs, and they aren't the same. I didn't want to see it, but I'm not so stubborn that I can't." },
    { id = "g_main", text = "Ishnu-alah. You walked in from the hills, so you've seen what Desolace has become." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; I've more work than allies, and Elune has given me a long time to notice the difference." },
  },
  start = "hello",
  nodes = {
    pj_vahl = {
      lines = { { id = "pj_vahl_default", text = "Not yet, but I count everyone who bargains with demons as one step from it. The Blade didn't begin as a cult; it began as fighters who wanted a little more strength, and the Legion was glad to lend it until the debt came due." } },
      choices = {
        { text = "How would you know where that step is?", next = "pj_vahl2" },
        { text = "I hold the leash, and I'll never kneel to what's on it.", next = "BACK", reply = "Every warlock says so, and some of them believe it until the very end, so forgive me if I wait to see.", fx = { align = { order = 1 } } },
        { text = "Strength is strength. Your fear only slows you down.", next = "BACK", reply = "Fear has kept me alive for many years, and it has killed many who thought as you do.", fx = { align = { order = -1 } } },
        { text = "Watch me, then. I'd rather be watched than blindly trusted.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_vahl2 = {
      lines = { { id = "pj_vahl2_default", text = "I don't, and that's what keeps me awake at night. The cultists I've questioned couldn't tell me when they crossed it either; they simply woke one morning on their knees." } },
      choices = {
        { text = "Then I'll keep an eye on my own step.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We trust deeds. The Burning Blade bargain with demons in that fortress, and if your spirits help bring Dalinda home, that's all the trust I need." } },
      choices = {
        { text = "Then I'll earn your trust with deeds.", next = "BACK", reply = "Bring Dalinda home, and you will have it, and more than you asked for.", fx = { align = { honor = 1 } } },
        { text = "I don't need your trust. Just your coin.", next = "BACK", reply = "Then earn your coin, and I will pay it gladly, as long as she comes home alive.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They fight with a fury that isn't wholly their own, because the demons they serve lend them strength and take something in payment. A disciplined warrior will outlast them, since that borrowed fury burns hot and gives out before the fight is done." } },
      choices = {
        { text = "My strength is my own. I need no demon's gift.", next = "BACK", reply = "Good, then you will outlast them, and I will be glad to stand beside you when you do.", fx = { align = { light = 1 } } },
        { text = "Borrowed fury still wins fights. I wouldn't turn it down.", next = "BACK", reply = "It wins them, for a while, and then it takes them, and I have seen what is left after.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Long enough that I know their marks better than my own name: the scorched grass where they summon, the satyr hoofprints that don't match the rest of the herd. A demon's trail is like any other, except that it runs colder, and it leads you somewhere you'll wish you'd never gone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Long enough that I know their marks better than my own name: the scorched grass where they summon, the satyr hoofprints that don't match the rest of the herd. Your {pet} would have their scent within the hour, I think. Demons leave a stink no beast mistakes for prey, and every animal I've ever hunted beside hated it." },
      },
      choices = {
        { text = "I'll follow the trail to the end, however long it runs.", next = "BACK", reply = "You hunt as a demon hunter hunts, and I will be glad to have you on the trail.", fx = { align = { honor = 1 } } },
        { text = "A hunt that never ends isn't worth following.", next = "BACK", reply = "Perhaps not for you, but for me, it is the only hunt that matters, and it ends when the last of them falls.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "What they always do, which is drink it dry and leave the husk. Their warlocks draw on fel power in the fortress and the Mannoroc Coven, nothing green grows near either, and they still hold Dalinda Malem inside those walls." } },
      choices = {
        { text = "Free their captives first. Dalinda matters more than revenge.", next = "BACK", reply = "You are right, and I know it, though my heart wants the other more than I care to admit.", fx = { align = { honor = 1 } } },
        { text = "Kill every warlock. Demon-servants deserve no quarter.", next = "BACK", reply = "They do, and I will not argue, but Dalinda comes out first, and then we finish them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Patience, mostly, and a good look at the walls before the sun goes down. The cult changes its watch at dusk, and for a few breaths the north side of the fortress is looking the wrong way, which is how Dalinda's trail came back to me at all." } },
      choices = {
        { text = "Then I'll slip in at dusk and leave no one alive.", next = "BACK", reply = "Leave the killing to the cult's own demons, and bring Dalinda out, because she is the reason I wait here.", fx = { align = { honor = -1 } } },
        { text = "I'll go in quietly and bring her out alive. Nothing more.", next = "BACK", reply = "Then you are the one I have been waiting for, and I will be ready at the wall when you come out.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Shadow and fel, the same gifts the Legion gave the orcs before Thrall cast them off. They bind imps and felhounds to guard their halls, and I've seen a single sorcerer hold a doorway against three Sentinels." } },
      choices = {
        { text = "Burn them out. They gave up mercy when they bowed to demons.", next = "BACK", reply = "They did, and I will not mourn them, but do not burn the captives with them.", fx = { align = { light = -1 } } },
        { text = "I'll stop them, but the captives come first.", next = "BACK", reply = "Thank you, that is the right order, and Elune will see your hand steadier for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They break them slowly, with fear and fel magic, until the prisoner forgets there was ever a world outside Thunder Axe Fortress. I have seen what comes out of those halls, and it is not always the person who went in." } },
      choices = {
        { text = "The Light can mend even that, given time. I believe it.", next = "BACK", reply = "Then I hope you are right, and I hope you are there when the captives need you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some wounds don't close. Kill the cultists and be done.", next = "BACK", reply = "Some do not, and I have seen them, but I would not give up on the captives yet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Thunder Axe Fortress in the north is their stronghold, and there are worse things than cultists down at Mannoroc Coven. Go carefully, because the cult has learned how to fight people who wear the Light like armor." } },
      choices = {
        { text = "I'll go in openly, under the Light. Let them see me coming.", next = "BACK", reply = "Then they will see you, and they will be ready, so let your Light burn brighter than their fires.", fx = { align = { honor = 1 } } },
        { text = "I'll slip in quietly and take them before they call their demons.", next = "BACK", reply = "That is wiser than most paladins choose, and you may come back alive because of it.", fx = { align = { honor = -1 } } },
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
        { id = "h_default", key = true, text = "I am Vahlarriel Demonslayer. I hunt the Burning Blade, the cult that bends the knee to demons, and their trail runs straight through Thunder Axe Fortress. One of ours, Dalinda Malem, went missing there." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Return to Vahlarriel") }, text = "Bring Dalinda back to me alive, and whatever she's learned inside that fortress may serve us better than anything we could take by force." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Ishnu-alah, druid. The Burning Blade has fouled the earth around Thunder Axe Fortress, and you will feel it in your bones before you see it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You walk quietly, and I've learned to value that, because the Burning Blade post sentries at Thunder Axe who are better at listening than at fighting." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The Burning Blade's sorcerers at Thunder Axe throw fel fire, and I'd welcome someone who knows how to throw something back." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Burning Blade", min = 30 } }, text = "I've been counting the Burning Blade's patrols, and they're thinner than they were before you came. Whatever you've been doing out at Thunder Axe, don't stop." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Our druids say the elements were wounded when the Well of Eternity fell, and I wonder whether you can hear them still aching." },
      },
      again = { { id = "h_again", text = "Ask, but quickly; the Burning Blade does not rest while we talk, any more than the Legion did in my grandmother's day." }, { id = "h_again2", text = "Speak, then, but briefly; the Burning Blade won't hunt themselves down." } },
      choices = {
        { text = "What have the demon-worshippers done to this land?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about the Burning Blade.", next = "b1_1" },
        { text = "Why do they call you Demonslayer?", next = "b2_1" },
        { text = "What of Dalinda Malem?", next = "b3_1" },
        { text = "I command demons too, and I serve no cult.", next = "x_1", when = { class = "WARLOCK" } },
        { text = "Some of the Blade's followers might still be saved.", next = "s_1" },
        { text = "How do you get past the Blade's sentries, Vahlarriel?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What kind of magic do the Blade's sorcerers use, Vahlarriel?", next = "xmage", when = { class = "MAGE" } },
        { text = "The Burning Blade seem to do terrible things to the people they take.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Burning Blade must gather somewhere in Desolace.", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do the Burning Blade's fighters compare, Vahlarriel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You seem to have hunted the Burning Blade a long while.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the kaldorei trust a dwarf who speaks to elements?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "You'd count me with the Burning Blade, Demonslayer?", next = "pj_vahl", when = { prejudiced = true } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are mortals who sold themselves to the Burning Legion's servants, orcs once, and now anyone desperate enough to join them, and they call up demons for their masters. In Desolace they've made Thunder Axe Fortress their den." } },
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
      choices = { { text = "Spare those who surrender. Not all of them chose this.", next = "BACK", reply = "You are kinder than I have the strength to be, and perhaps you are right, but I will watch them closely.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Show none of them mercy. They chose demons over their own.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "The Legion is not gone, it only waits, and the Burning Blade in Thunder Axe Fortress keep its door oiled. I have tracked its servants for longer than you have been alive." } },
    satyrs = { { id = "tp_satyrs", text = "The satyrs are our own kin, twisted, and they still sing the songs of Azshara's court. I do not hesitate when I hear them." } },
    elune = { { id = "tp_elune", text = "Elune's light does not reach Desolace easily, but it reaches, and I keep my watch by it." } },
    tyrande = { { id = "tp_tyrande", text = "High Priestess Tyrande knows the Legion's face as well as anyone living. She would understand why I am still here." } },
    highborne = { { id = "tp_highborne", text = "The Highborne opened the door to the Legion, and their descendants still sit in Dire Maul pretending it was a misfortune. I have not forgiven them, and I will not." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that. The Blade is enough to hunt." } },
  },
}

P:NPC {
  key = "rexxar", id = TODO_NPC("Rexxar"), name = "Rexxar",
  bible = "bibles/desolace.md", role = "citizen", tier = "major",
  temper = { "gruff" }, values = { "honest", "brave" },
  likesTone = "blunt",
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
        { text = "A pack is stronger than a lone wolf, Rexxar.", next = "BACK", reply = "It is, for some, and the Horde is proof of it, but Misha and I have always hunted better alone.", fx = { align = { order = 1 } } },
        { text = "I understand. Some of us are meant to walk alone.", next = "BACK", reply = "You know the wilds, and you know Misha, and that is more than most who ask me questions.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I trust anyone who has walked the wilds long enough to know the elements are not servants. Banners mean little to Misha and me, but the ones who wave them hardest usually listen least." } },
      choices = {
        { text = "The elements serve no banner, and neither do I.", next = "BACK", reply = "Misha will not growl at you, then. That is rarer than you would think.", fx = { align = { order = -1 } } },
        { text = "I'm loyal to the Alliance first, Rexxar.", next = "BACK", reply = "Then be loyal, but remember the wilds do not care whose flag you carry when the thunder lizard comes.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I judge it by what it does when no one's watching. I've seen the Light carried by men who burned villages, and I've seen the dead fight harder for their friends than the living. Show me which you are, and Misha will decide whether she likes you." } },
      choices = {
        { text = "Judge me by my deeds. I keep my word, watched or not.", next = "BACK", reply = "Then I will watch, and Misha will watch, and we will know soon enough which of us was right.", fx = { align = { honor = 1 } } },
        { text = "Deeds are deeds. Whether anyone's watching changes nothing.", next = "BACK", reply = "That is the only answer that means anything, and few have the courage to say it to my face.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That nobody's behind you, mostly, and that no banner will hold your ground when a thunder lizard decides it's hungry. The cities teach soldiers to fight in ranks, but only the wild teaches them when not to fight at all." } },
      choices = {
        { text = "The ranks are the Horde's strength. I'll keep to them.", next = "BACK", reply = "Stand in the ranks, and they will stand with you. Learn the wild too, though, because ranks break, and the wild does not.", fx = { align = { order = 1 } } },
        { text = "Ranks make soldiers soft. I'll learn the wild's way.", next = "BACK", reply = "The wild will teach you, but it is a harsh teacher, and it does not forgive mistakes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That's between Misha and me, and she's never told anyone, so neither will I. What I'll say is that she's saved my life more times than I've saved hers, and I've stopped keeping count, because a true bond doesn't keep a ledger." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's between Misha and me, and she's never told anyone, so neither will I. Misha's watching {pet}, and she hasn't growled yet. That's the highest praise she gives anyone, so take it." },
      },
      choices = {
        { text = "A true companion is family. I'd die for mine.", next = "BACK", reply = "Misha understands that, and she will understand you, which is rare.", fx = { align = { honor = 1 } } },
        { text = "A beast is a tool, Rexxar, however loyal.", next = "BACK", reply = "Say that where Misha can hear, and you will find out how loyal a tool can be.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I am not alone; Misha is with me. Cities make people forget what they owe the land, and out here, nothing lets me forget it." } },
      choices = {
        { text = "The Horde needs its champions near its cities.", next = "BACK", reply = "Perhaps it does, but it has Thrall, and it has Saurfang, and it does not need me at its gates.", fx = { align = { order = 1 } } },
        { text = "The wilds are freer than any city. You chose well.", next = "BACK", reply = "I did, and I would choose it again, because the wilds have never once asked me to lie.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That every creature here kills only what it must, and leaves the rest alone. The cities are full of people who stab for coin and call it cunning, and I trust Misha's instincts over theirs every day." } },
      choices = {
        { text = "I strike only when there's need. That's the hunter's way.", next = "BACK", reply = "That is the hunter's way. Walk with us a while, and Misha will decide if she agrees.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Coin is need enough. The wilds aren't my home.", next = "BACK", reply = "Then the wilds will never be your home, and you will never understand why I left the cities.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I hold it against anyone who thinks the demons can be mastered, because the Horde believed that too and paid for it with its soul. Thrall broke that chain, and I'll not watch someone forge a new link in it." } },
      choices = {
        { text = "I master my demons. The old Horde was weak, not cursed.", next = "BACK", reply = "The old Horde thought itself strong too, and it drank the blood, so do not tell me it was weak.", fx = { align = { order = -1 } } },
        { text = "I know the price. I won't let the Horde pay it again.", next = "BACK", reply = "Remember it every day, because the Horde has forgotten once already, and I was there when it did.", fx = { affinity = 1, align = { order = 1 } } },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "You stink of demons. My father's people drank from that cup once, and I've seen what it did to them, so speak carefully." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one carrying the Light. Misha doesn't like your smell, and I'm not sure I do either, but I've learned not to judge a creature by its scent alone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I have seen orcs and tauren walk with the elements, never one of the mountain folk, so I'll hear you out." },
      },
      again = { { id = "h_again", text = "Speak your mind, plainly. The wilds have no patience for wasted words, and neither do I." }, { id = "h_again2", text = "Misha's listening too." } },
      choices = {
        { text = "Why do you walk the wilds alone, Rexxar?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do you trust the shamans of the Horde, Rexxar?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What do you hunt in Desolace, Rexxar?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You seem to travel with no one but Misha.", next = "b1_1" },
        { text = "Tell me about Misha.", next = "b2_1" },
        { text = "Is the Horde worth fighting for?", next = "s_1" },
        { text = "What brings you to Desolace?", next = "ds_1" },
        { text = "You fought for Thrall. Tell me about it.", next = "war" },
        { text = "You're the Horde's champion. Why talk to me at all?", next = "ally_why", when = { faction = "Alliance" } },
        { text = "My clan is Frostwolf, from the Alterac valleys.", next = "o_frostwolf", when = { origin = "orc_frostwolf" } },
        { text = "I was born behind a fence in the human camps.", next = "o_camp", when = { origin = "orc_camp_born" } },
        { text = "My clan cuts Ashenvale's trees. Does that sit badly with you?", next = "big_wild", when = { origin = "orc_warsong_kin" } },
        { text = "What do the wilds teach that the cities don't, Rexxar?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you hold the orcs' past against warlocks, Rexxar?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The wilds must teach a warrior things no city can.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How did you and Misha come to hunt together, Rexxar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You seem to judge creatures differently from most, Rexxar.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do you trust a shaman of the Alliance, Rexxar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Why do you walk alone, Rexxar?", next = "xpt_rexxar", when = { party = { size = { min = 1 } }, faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I'm Mok'Nathal, and my father's people are few and scattered. I fought beside Thrall when the Horde needed it, and when the fighting ended, I returned to the road." } },
      choices = { { text = "You fought beside Thrall?", next = "b1_2" }, { text = "Don't you miss having kin?", next = "lonely" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I did, against the centaur and against Admiral Proudmoore's men, and I'd do it again if he asked. But cities are full of people who want something from me, and out here the only thing that wants anything is the land, and it tells you plainly." } },
      choices = { { text = "Why did you leave the old Horde?", next = "war_old" }, { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Misha is my companion and my friend, and she has saved my life more times than any warrior I've fought beside. Treat her with respect, and she'll do the same for you." } },
      choices = {
        { text = "How did you two find each other?", next = "misha_2" },
        { text = "I track bears too. One follows me now.", next = "misha_kin", when = { origin = "dwarf_bear_tracker" } },
        { text = "I learned to trail wolves in Eastvale's pines.", next = "misha_kin", when = { origin = "human_eastvale_woodsman" } },
        { text = "My first companion was a nightsaber cub.", next = "misha_kin", when = { origin = "nightelf_nightsaber_rider" } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    -- 0.71.0 depth: Misha, Desolace, the wars he fought for Thrall, the wild.
    lonely = {
      lines = {
        { id = "lo_default", text = "Kin is a word for people who stay. My father's people were few when I was born and fewer when I left them, and I've stopped looking for another face like mine on the road." },
        { id = "lo_warm", when = { disposition = { min = 70 } }, text = "I'll tell you something, since Misha's decided you're worth the trouble. Some nights I wonder whether there's another Mok'nathal left anywhere at all, and I've never said that aloud to anyone who walks on two legs." },
      },
      choices = {
        { text = "Misha's kin enough, I'd say.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You have the Horde, Rexxar, whether you want it or not.", next = "BACK", fx = { trait = { blunt = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    misha_2 = {
      lines = { { id = "m2_default", text = "She was a cub in the hills, bawling beside a mother some trapper had killed for the pelt, and I meant to walk past, because a cub alone doesn't last long out here. She followed me for three days anyway, and on the fourth I gave her my supper, and that was the end of my walking alone." } },
      choices = {
        { text = "So she chose you, not the other way round.", next = "misha_3", fx = { trait = { witty = 1 } } },
        { text = "That was kind of you, Rexxar.", next = "misha_3", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    misha_3 = {
      lines = {
        { id = "m3_default", text = "She did, and she's never let me forget it. Now you answer me one, since I've answered you: has a beast ever chosen you, or have you only ever done the choosing?" },
        { id = "m3_pet", when = { pet = { type = "Beast" } }, text = "She did, and she's never let me forget it. Your {pet} is standing closer to you than to me, so I already know half the answer, but tell me anyway: did it choose you, or did you choose it?" },
      },
      choices = {
        { text = "One chose me. I'd die before I let it down.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I've never trusted an animal that far.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
        { text = "I prefer people, for all their faults.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    misha_kin = {
      lines = {
        { id = "mk_default", text = "You've run with beasts too, then, so you know it's never the hunter who decides how it goes. Misha's sniffing at you, which means she thinks so too." },
        { id = "mk_bear", when = { origin = "dwarf_bear_tracker" }, text = "A dwarf who follows bears through the snow, and Misha's sniffing at you like she smells a cousin, which she doesn't do for many. Between Misha and me it isn't me in charge either, so don't feel bad about it." },
        { id = "mk_eastvale", when = { origin = "human_eastvale_woodsman" }, text = "Most of your people cut their forests down to build walls, and you went the other way and learned to read them, which earns you more from me than most humans get. Misha thinks you smell of pine, and she means that kindly." },
        { id = "mk_saber", when = { origin = "nightelf_nightsaber_rider" }, text = "I watched a nightsaber stalk a stag through Ashenvale once, for an hour, without breaking a twig, and I've never seen better hunting outside Misha herself. Your people have reason to hate the Horde in that forest, but the cats were never part of that quarrel." },
      },
      choices = {
        { text = "The beast decides. We just try to keep up.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Rexxar.", next = "BACK" },
      },
    },
    ds_1 = {
      lines = { { id = "ds1_default", text = "The centaur, mostly, and what they leave behind them. The Magram and the Gelkis tear at each other across this valley, the Kolkar take whatever's left, and somewhere in the middle the old kodos still walk south to the graveyard to die, the way they always have." } },
      choices = {
        { text = "A kodo graveyard?", next = "ds_2" },
        { text = "The Burning Blade are out here too.", next = "ds_blade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ds_2 = {
      lines = { { id = "ds2_default", text = "Old kodos walk there when their time comes, and nobody knows how they find the way. The tauren call it sacred and the centaur call it a quarry for bones, and some evenings I sit on the ridge and watch, because it's the only thing in Desolace that dies with any dignity." } },
      choices = {
        { text = "Should the Horde take whatever the land gives, then?", next = "big_wild" },
        { text = "Something else, Rexxar.", next = "BACK" },
      },
    },
    ds_blade = {
      lines = { { id = "dsb_default", text = "They hide in Thunder Axe Fortress and call things up from the Nether, and they're orcs, which shames me more than I can say, because I saw what the old Horde became after it drank that poison. I'd kill them all myself if Misha could stand the stink of them." } },
      choices = {
        { text = "Then I'll help you thin them out.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big_wild = {
      big = true,
      lines = {
        { id = "bw_default", text = "Take what you need and thank whatever gave it, the tauren say, and they're right. The Warsong cut Ashenvale because Orgrimmar needs timber, the night elves kill them for it, and both sides call themselves wronged, but nobody ever asked the forest." },
        { id = "bw_warsong", when = { origin = "orc_warsong_kin" }, text = "I don't hate you for it, because Orgrimmar needs its walls, but every tree your clan fells is another reason for the night elves to send a sentinel after you. Misha and I have buried enough dead on both sides of that forest to know nobody's winning it." },
      },
      choices = {
        { text = "Take only what you need, and leave the forest standing.", next = "BACK", reply = "That is what the tauren understand, and what the Warsong and the elves have both forgotten in Ashenvale.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Nobody owns the wilds. The strong take what they can.", next = "BACK", reply = "Then the strong will take until nothing is left, and the wilds will take them in the end.", fx = { align = { light = -1 } } },
        { text = "Something else, Rexxar.", next = "BACK" },
      },
    },
    war = {
      hub = true,
      lines = { { id = "war_default", text = "I fought for the Horde twice, once when it was a plague on the land and once when it was worth fighting for. Ask what you want to know, and I'll answer what I can stand to." } },
      again = {
        { id = "war_again", text = "What else? Make it quick, Misha's getting restless." },
        { id = "war_again2", text = "Ask the rest, then, while I'm in the mood to answer." },
      },
      choices = {
        { text = "Why did you leave the old Horde?", next = "war_old" },
        { text = "What happened at Theramore?", next = "war_daelin" },
        { text = "Tell me about the harpies of the Barrens.", next = "war_harpy" },
        { text = "I'd guess the Stonemaul ogres took some convincing to join the Horde.", next = "war_stonemaul" },
        { text = "Something else, Rexxar.", next = "BACK" },
      },
    },
    war_old = {
      lines = { { id = "wo_default", text = "Because it was rotten, and everyone in it could smell it, and they fought harder so they wouldn't have to say so. I was young and strong and they used me like an axe, and one day I looked at what the axe had done and put it down." } },
      choices = {
        { text = "What did you see that day?", tag = "Persuade", next = "war_left",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "HUNTER" }, { origin = "orc_frostwolf" } } } },
          fail = { next = "war_left_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_left = {
      lines = { { id = "wl_default", text = "A village with nothing in it worth taking, and the warlocks wanted it burned anyway, so the grunts burned it laughing. I walked into the hills that night and didn't come back until Thrall gave me a reason, and I've never told Misha, because she'd think less of me for staying as long as I did." } },
      choices = {
        { text = "You walked away, Rexxar. Most of them never did.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_left_no = {
      lines = { { id = "wln_default", text = "That's mine to carry, and I don't hand it to strangers on the road. Ask me again when Misha stops watching your hands." } },
      choices = { { text = "Misha can watch all she likes.", next = "BACK" } },
    },
    war_daelin = {
      lines = {
        { id = "wd_default", text = "Admiral Proudmoore came across the sea to finish a war his people had already lost, and he burned our camps on the coast before Durotar had a single wall. His daughter Jaina stood aside and let us end it, and I'm the one who ended it, so that's a debt between her and Thrall I'll never fully understand." },
        { id = "wd_alliance", when = { faction = "Alliance" }, text = "Your people still talk about the admiral, I suppose. He came across the sea and burned our camps, his own daughter stood aside, and I'm the one who killed him, so say what you came to say, and Misha and I will listen." },
      },
      choices = {
        { text = "Theramore remembers. Some there call it murder.", next = "war_daelin2", when = { faction = "Alliance" } },
        { text = "Did Jaina ever forgive you?", next = "war_daelin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_daelin2 = {
      lines = { { id = "wd2_default", text = "I don't know, and I've never asked, because some questions aren't mine to put to a daughter. She chose peace over her father's war, which is harder than anything I did with an axe that day, and the Horde owes her more than any grunt will admit." } },
      choices = {
        { text = "Then she's braver than her father was.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_harpy = {
      lines = { { id = "wh_default", text = "The Bloodfeather harpies plagued the Barrens when Durotar was new, and Rokhan of the Darkspear and I went after their eldest sister together. Rokhan talks more than any troll alive, but he's the only one besides Misha I'd let watch my back, so if you ever see him, tell him the bear still owes him a fish." } },
      choices = {
        { text = "I'll tell him, if I find him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_stonemaul = {
      lines = { { id = "ws_default", text = "Their chieftain Korgall wanted to fight me for the right to speak, so I let him, and when it was done the Stonemaul listened to Thrall. Ogres respect strength more than words, and that's the part of my blood I've never had to argue with." } },
      choices = {
        { text = "Where do the Stonemaul live now?", next = "war_dragon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_dragon = {
      lines = {
        { id = "wdr_default", text = "In Brackenwall, in the Dustwallow marsh, because black dragons burned their old village out of the swamp and the trees there hide them from the sky. The ogres still flinch at every shadow overhead, and I don't blame them." },
        { id = "wdr_high", when = { minLevel = 50 }, text = "In Brackenwall, because black dragons burned their old village out of the marsh. There's a dragon in that swamp who's more than she looks, and the ogres won't speak her name, so watch the sky if you go there." },
      },
      choices = {
        { text = "I'll watch the sky, Rexxar.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    o_frostwolf = {
      lines = { { id = "of_default", text = "Your clan never drank the blood, and Drek'Thar kept the old ways alive in the snow when the rest forgot them, so you're one of the few orcs I don't have to wonder about. Do the wolves still run with you up there?" } },
      choices = {
        { text = "They do. Mine is never far from me.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Fewer every winter, Rexxar.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    o_camp = {
      lines = { { id = "oc_default", text = "And now you walk the open road. I won't ask how it feels, because I can see it on you, the way a caged animal keeps looking for the bars long after they're gone." } },
      choices = {
        { text = "Some days I still look for them.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "The bars are gone. I don't look back.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    ally_why = {
      lines = { { id = "aw_default", text = "Because Misha hasn't growled at you, and she's a better judge than any banner. I fought for the Horde when it needed me, but I've no quarrel with a stranger on the road who keeps their blade sheathed, Alliance or not." } },
      choices = {
        { text = "Then we understand each other.", next = "BACK", fx = { affinity = 1 } },
        { text = "Banners still matter to me, Rexxar.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "The Horde gave the orcs a home and a future, and Thrall leads it well. Still, I've seen what the old Horde did, and I don't forget it." } },
      choices = { { text = "It's worth fighting for, whatever it was.", next = "BACK", reply = "It is, and I would fight for it, as long as it never becomes what it was.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Loyalty to a banner is a cage. Trust yourself first.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Whatever threatens the Horde and the beasts both, and in Desolace that is often the same thing. The centaur kill more than they need and the Burning Blade foul the ground, so a spellcaster with steady hands would find work enough out here." } },
      choices = {
        { text = "Then I'll hunt beside you, where the Horde needs it.", next = "BACK", reply = "Hunt with your eyes open, then. Misha and I will find you if we need you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt what pays. The rest is someone else's war.", next = "BACK", reply = "Then hunt what pays, but do not come to me when the war you ignored reaches your door.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I trust Thrall, and I trust a shaman who has walked the wilds long enough to know the elements are not servants. The ones who stay in Orgrimmar arguing politics I leave to the cities, because Misha and I have no patience for them." } },
      choices = {
        { text = "The Horde needs its shamans in Orgrimmar, guiding the Warchief.", next = "BACK", reply = "Some, perhaps, but the ones who stay in Orgrimmar forget what the elements sound like out here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A shaman belongs in the wilds, far from walls and politics.", next = "BACK", reply = "You understand, and you will find the wilds have more to teach you than any city ever could.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Hm. I don't hear that often, mostly because I don't stay anywhere long enough. Misha seems to think you meant it, so I'll take it." },
        { id = "s2", text = "Kind words don't weigh much to carry, and I travel light. I'll keep those, stranger." },
      },
      fail = {
        { id = "f1", text = "I left the cities to get away from that kind of talk, and Misha doesn't like it any better than I do." },
        { id = "f2", text = "Flattery is what people use when they want something they haven't earned. Say what you want, or leave us to the road." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha. Not many will bait a man with a bear at his side, and fewer still make me laugh doing it. You've got some nerve, and I like nerve.", narr = "Misha huffs, and Rexxar very nearly smiles." },
        { id = "s2", text = "You've a wild streak, and you don't hide it behind manners. That's the first thing about you I've liked." },
      },
      fail = {
        { id = "f1", text = "Misha has stopped watching the road and started watching you. I'd choose my next words with care." },
        { id = "f2", text = "I've been called a half-breed and worse by better than you, and I outlived most of them. Walk on." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I've hunted long enough to know a predator when one stands in front of me. I'll not turn my back on you, and I mean that as respect." },
        { id = "s2", text = "Even Misha's gone quiet, and she's hard to impress. All right, you've made yourself understood." },
      },
      fail = {
        { id = "f1", text = "I've stood alone against things that would swallow you whole, and I didn't flinch then either. Put your hackles down." },
        { id = "f2", text = "A beast that snarls that loudly is usually afraid, and Misha knows it as well as I do." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's mine to keep, and I don't share it with someone I've known for the length of one conversation." },
      { id = "gt2", text = "I'll not speak of that. Earn Misha's trust first, and mine may follow." },
    },
    knows = {
      { id = "tp_knows", text = "I hear things on the road, mostly from people who don't know I'm listening. Ask, and I'll tell you what I know." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Misha doesn't trust you yet, so neither do I, but I'll answer a question or two if you keep it short." },
    },
    thrall = {
      { id = "tp_thrall", text = "Thrall's a good leader and a better friend, and I helped him carve Durotar out of the dust. I wouldn't do it again, but I don't regret it." },
      { id = "tp_thrall2", when = { race = "Orc" }, text = "You're one of his, then, from the camps or born after them. Tell him Rexxar is well and Misha is fat, and he'll laugh." },
    },
    cairne = { { id = "tp_cairne", text = "Cairne is the wisest creature on this continent, and he knows it, and he still listens. That makes him rare." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin and Rokhan's people stood with us against the humans at Theramore. The Darkspear are sly, and they're loyal, and those two things don't often go together." } },
    jaina = { { id = "tp_jaina", text = "The Proudmoore girl stood beside us against her own father, and she meant it. I didn't trust her then, and I trust her now." } },
    theramore = { { id = "tp_theramore", text = "I fought at the gates of Theramore when Admiral Proudmoore came to burn Durotar. His daughter wept for him, and she still kept the peace, and that's all anyone needs to know of her." } },
    centaur = { { id = "tp_centaur", text = "The centaur think they own every plain they run across, and they kill anything that disagrees. Misha and I disagree often." } },
    maraudon = { { id = "tp_maraudon", text = "The centaur guard Maraudon like a grave, and from what I hear, it is one. I leave the dead to the dead." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren speak of the Earth Mother, and out here in the wilds, I think I've heard her once or twice. She doesn't say much, which I like." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Banshee Queen's people joined the Horde after I left it. I've met dead men I liked, but I haven't met her." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken smell like the grave and talk like scholars, and I don't know what they want. That's enough for me to keep my distance." } },
    _none = { { id = "tp_none", text = "I don't know that, and I don't much care to. Misha cares even less." } },
  },
}
