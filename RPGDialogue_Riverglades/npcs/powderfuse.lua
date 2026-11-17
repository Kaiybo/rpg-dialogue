-- Powderfuse Port: the goblin town on the Riverglades coast, at the end of the Steamwheedle boat. Neutral. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "melbin", id = TODO_NPC("Melbin Powderfuse"), name = "Melbin Powderfuse", title = "Master Goblin Engineer",
  bible = "bibles/riverglades.md", role = "trainer", tier = "major",
  communities = { "powderfuse_port" }, temper = { "shrewd" }, values = { "greedy", "proud" },
  notices = { "craft", "purse", "race" },

  impression = {
    first = "According to Melbin Powderfuse, every plank in Powderfuse Port is his, and so is every nail. He watched my hands the whole time, as if I might carry off a wall.",
    third = "{name} met Melbin Powderfuse, Master Goblin Engineer, who claims to have built Powderfuse Port from nothing but sand.",
  },

  greetings = {
    { id = "g_default", text = "Hands off the walls, pal; I built those." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Spending today, or just admiring?" },
    { id = "g_engineer", when = { profession = "Engineering" }, text = "A fellow engineer! That's lovely, but touch nothing anyway." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, pal, and in that time I've put up two new walls, so keep your hands off those too." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word around the port is you sold somebody a story and they paid full price for it, which is good business, I gotta say. Just don't try it on me, because I own the building you'd be lying in." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked somebody round down at the port, kid, and talent like that's worth coin, so I'd hate to see you give it away for free." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "So you're an engineer, are you? Gnomish or goblin... no, don't answer, I can tell by the eyebrows, since some of yours are missing." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Rich, eh? I like you, and I like your purse even more. Ever thought about property? I've got some; all of it, actually." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in MY port, measuring things with your eyes; I can see you doing it, so stop it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Melbin Powderfuse, Master Goblin Engineer. The docks, the inn, every plank and every nail: mine, and I built it all. Before me there was nothing here but sand and murlocs.",
          fx = { hear = "melbin_built_port", learn = { "powderfuse_port" } } },
        { id = "h_partner", when = { townStanding = { town = "powderfuse_port", min = 30 } },
          text = "My favourite customer! Everybody in the port says so, because I told them to." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You look like you break things, so let's agree right now that anything you break in MY port, you pay for." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Shiny armour, honest face, and a terrible negotiator, I'd bet; I like you already." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, with a pet. If that beast sheds on my dock, it's a cleaning fee, and if it bites a customer, it's a bigger fee." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light! Bless the docks if you like, but the blessing becomes MY property the moment it lands." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest! Doesn't matter which flavour, your gold's the same colour as anyone's. Pray all you want, just not near the cash box." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Tell your elements this coast is zoned for business, and no earthquakes without a permit." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Don't you go portalling my customers out of here before they've spent anything." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, and an imp, or whatever that thing is. It doesn't pay rent, so it doesn't stay." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! If you're going to complain about the trees, get in line; the line is long, and it's also mine." },
      },
      again = {
        { id = "h_again", text = "More questions? Questions are free, and answers are free too, but the building you're standing in is not." },
        { id = "h_again2", text = "Go on, go on. I'm listening and invoicing at the same time." },
      },
      choices = {
        { text = "You really built all of this yourself?", next = "built" },
        { text = "What can I do for you?", next = "deal" },
        { text = "Why build a port here, of all places?", next = "why" },
        { text = "Who are your neighbours?", next = "neighbors" },
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "A gnome would have built it faster.", next = "gnome", when = { race = "Gnome" } },
        { text = "Am I a partner yet?", next = "partner", when = { townStanding = { town = "powderfuse_port", min = 30 } } },
        { text = "Nice locks. Shame if someone checked them.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your docks creak when I walk on them.", next = "xtauren", when = { race = "Tauren" } },
        { text = "The Forsaken trade too, goblin.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "What would you pay a warrior to do?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you ever give anything away, Melbin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you buy pelts?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does anyone here look after the poor?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Did you ask the spirits before building here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Wouldn't a portal here be good for business?", next = "xmage", when = { class = "MAGE" } },
        { text = "What would you charge my demon in rent?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Whose trees went into this port?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    built = {
      lines = { { id = "b_default", text = "Every board! Well, I designed every board, and some goblins I paid did the nailing. Paid them well, too, so ask them... actually, don't ask them." } },
      choices = {
        { text = "So you didn't build it.", next = "built_push", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    built_push = {
      lines = { { id = "bp_default", text = "I built it the way the Baron built Booty Bay: by being the one who owns it afterwards. That's what building means, kid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deal = {
      lines = { { id = "d_default", text = "Now you're talking. The Brotherhood buys, the Horde buys, the pirates buy when they think I'm not looking. I need hands that can carry things past all three without getting stabbed." } },
      choices = {
        { text = "What's the pay?", next = "deal_pay", fx = { trait = { greedy = 1 } } },
        { text = "I don't work for goblins.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    deal_pay = {
      lines = { { id = "dp_default", text = "Fair. Goblin fair, which means you'll complain and come back anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Rivers! Three of them, bending like a drunk's walk home, all coming down to this coast. Timber, ore, pelts, they all float to me, and I just had to be here first." } },
      choices = {
        { text = "Smart.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Steamwheedle Cartel?", next = "why_cartel" },
      },
    },
    why_cartel = {
      lines = { { id = "wc_default", text = "The Cartel says I owe them a cut, and I do: a small one, a very carefully calculated small one.",
        fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "The Cartel sent me to audit that small cut.", tag = "Deceive", next = "audit",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 60 } } } } },
          fail = { next = "audit_no", fx = { affinity = -1 } } },
      },
    },
    neighbors = {
      lines = {
        { id = "n_default", text = "The Brotherhood's south of here, honest and broke, and the Horde's west, honest, broke and louder. The cultists in the middle aren't paying, and up north there's ogres who changed sides, the most goblin thing I ever saw an ogre do.",
          fx = { learn = { "twilights_hammer", "brotherhood_horse" } } },
      },
      choices = {
        { text = "And the pirates at Windstead?", next = "neighbors_pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_pirates = {
      lines = { { id = "np_default", text = "They're customers, is what they are, so don't you go telling the Brotherhood." } },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I might.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Faster, sure, and then it'd explode. Mine's only exploded twice, and once was on purpose." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    partner = {
      lines = { { id = "p_default", text = "Partner? Ha! No, but you're a valued customer, and in Powderfuse that's better, because partners pay rent." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    audit = {
      lines = {
        { id = "au_default", text = "An audit? Here? All right, listen: the cut's figured on the boat fares I report, not the ones I collect, and nobody holds a deed to this sand, me included, so tell your bosses the books are being improved, and that I said so very respectfully." },
        { id = "au_gnome", when = { race = "Gnome" },
          text = "They sent a gnome to audit me? That's either an insult or a very clever move, so fine: the cut's figured on the fares I report, not the ones I collect, and nobody holds a deed to this sand, so tell them the books are being improved." },
      },
      choices = {
        { text = "I'll put in a good word.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    audit_no = {
      lines = {
        { id = "an_default", text = "The Cartel's auditors wear better shoes than that, kid, and they never, ever smile. Nice try; I respect it, and I'll be charging you for it." },
        { id = "an_paladin", when = { class = "PALADIN" },
          text = "A paladin, auditing for the Cartel? The Light would have to be very short of work, kid, so try that one on somebody else." },
      },
      choices = {
        { text = "You can't blame me for trying.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xro_default", text = "Checked them? Pal, those locks are mine, and so's the door, and so's the wall the door's in. Tell you what: you find a flaw, you tell me first, and I'll pay you for it instead of the guards paying you a visit." } },
      choices = {
        { text = "Deal. I'll sell you the flaws.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Flaws are worth more if nobody knows them.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
      },
    },
    xtauren = {
      lines = { { id = "xta_default", text = "Creak? That's the sound of quality, friend, the sound of timber earning its keep. But stick to the middle planks, would you, because I priced those for goblins and I'd hate to rebuild 'em at cost." } },
      choices = {
        { text = "I'll walk softly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Build stronger docks.", next = "built", fx = { trait = { stern = 1 } } },
      },
    },
    xforsaken = {
      lines = { { id = "xfo_default", text = "Sure they do, and their gold's as shiny as anybody's, even if it smells a bit of cellar. Undercity hasn't sent me a ship yet, so you tell the Dark Lady there's a dock here with her name on it, for the right price." } },
      choices = {
        { text = "I'll tell her nothing of the kind.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "What can I do for you?", next = "deal" },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Guard work, the kind where you stand on the dock looking big while the boat unloads. The pirates count the muscle before they count the cargo, see, and if the muscle's big enough, they go and rob the Brotherhood instead." },
      },
      choices = {
        { text = "I'll stand your dock, fair and square.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll stand it, and skim a crate or two.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Give? Like, for free? I gave the Brotherhood a discount on rope once, and Demar still hasn't thanked me, so there you go; that's what giving gets you." },
      },
      choices = {
        { text = "Charity isn't about thanks, Melbin.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Smart. Nobody values what they get for free.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Do I buy pelts! The Horde trappers bring them down from the west, the Brotherhood brings them up from the south, and I sell the lot to Tanaris at a markup that'd make you cry." },
      },
      choices = {
        { text = "Selling to both sides is dirty business, Melbin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Smart. Everyone's money spends the same.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Look after? Sure, Zizplink feeds whoever she likes and puts it on my tab, and Fimbo gives away the stew nobody bought. I pretend not to notice, which costs me plenty, so I'm basically a saint." },
      },
      choices = {
        { text = "Then stop pretending. It's good of you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity's bad business. You should stop them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "The spirits? I asked the murlocs, and they said 'mrgl', which I took as a yes. If the earth's got a complaint, it can file it with me like everybody else." },
      },
      choices = {
        { text = "Respect the land, Melbin, or it'll take its due.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Ha. If the spirits wanted this coast, they should've built first.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Good for business? A portal's terrible for business! People step through and never buy a drink, never rent a bed, never pay a boat fare. Boats, kid; boats are the future, because you can charge for boats." },
      },
      choices = {
        { text = "Free travel helps everyone, Melbin.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spoken like a true goblin. Charge them all.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Imp rate's three silver a week, voidwalker's five on account of the size, and anything with wings pays double because it blocks the view. Pay up front, and keep it off the furniture." },
      },
      choices = {
        { text = "Fair enough. I'll pay what's owed.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Try collecting it from the demon yourself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Nobody's! Every log drifted down the rivers, so the forest gave them to me. Well, Turner's camp sold me a few, and I paid, mostly, so that's ownership." },
      },
      choices = {
        { text = "Driftwood's fair. Cutting more isn't.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Wood's wood. Build what you like.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Information's like timber: it floats down to me eventually, and I sell it on. Ask, and we'll talk terms later." },
    },
    background = { { id = "tp_bg", text = "Born with nothing, somewhere with less, and now I own a port. Do the sums; it's a very inspiring story." } },
    advice = { { id = "tp_ad", text = "Never build on land somebody else owns. Build first, and make them prove it." } },
    powderfuse_port = { { id = "tp_port", text = "Mine, all of it, so next question." } },
    steamwheedle = { { id = "tp_cartel", text = "Fine people, thirsty people, and every cut they take, I take back from the boat fares." } },
    twilights_hammer = { { id = "tp_hammer", text = "Terrible customers. They never buy anything, and they keep looking at the sky like it owes them money." } },
    _none = { { id = "tp_none", text = "Is it for sale? If it isn't, I haven't got an opinion." } },
  },
}

P:NPC {
  key = "zizplink", id = TODO_NPC("Innkeeper Zizplink"), name = "Innkeeper Zizplink",
  bible = "bibles/riverglades.md", role = "innkeeper", tier = "service",
  communities = { "powderfuse_port" }, temper = { "cheerful", "chatty" }, values = { "generous" },
  notices = { "guest", "drink" },

  impression = {
    first = "Innkeeper Zizplink calls everyone an explorer and seems to mean it kindly. Her inn smells of the sea, and she hears every rumor that comes off the Tanaris boat.",
    third = "{name} met Innkeeper Zizplink, the cheerful goblin who keeps the inn at Powderfuse Port.",
  },

  greetings = {
    { id = "g_default", text = "Another explorer! Come in, come in, and mind the smell; it's the sea, mostly." },
    { id = "g_home", when = { homeInn = { "Powderfuse Port" } }, text = "Your room's ready! I aired it out, but the air came back in, so it smells like fish again." },
    { id = "g_away", when = { away = 14 }, text = "You're back after {away}, explorer, and right on time, because I aired your room this morning and only the fish smell came back." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word off the boat is somebody caught you in a fib, explorer, and in this port a rumor gets round faster than Argo's sea monsters, so I'd lie low a while." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody sat at the bar tonight grinning about something you'd said, explorer, and good moods sell stew, so come in and say something nice to me too." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Oh, you've been at Argo's bottle! Sit down before the floor comes up to meet you; it does that here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zizplink, innkeeper. Beds upstairs, food down here, and everybody off the Tanaris boat comes through that door. You hear things, running the inn at the end of a boat route." },
        { id = "h_list", tags = { "news" }, when = { questActive = TODO_QUEST("Zizplink's Grocery List") },
          text = "You've got my list! Don't lose it, and don't read it out loud; some of those are for Fimbo, and he's sensitive." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, back from the fields! Sit down, explorer; the stew's hot and the chairs are sturdy, mostly." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! We don't get many of you down here, explorer; the Brotherhood's knights mostly stay up at their keep." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "Oh, a hunter, and a pet! Your friend can sleep by the fire, explorer, so long as it leaves Fimbo's fish alone." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! I didn't hear you come in, explorer, and I hear everything, so that's a real talent." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, all the way from Stormwind, I'd guess! Sit; the Brotherhood boys at the bar could use a kind word." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest, off the Tanaris boat? Welcome, explorer; the inn's neutral, and so's the stew." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you smell the sea in here? Of course you can; everyone can, and the spirits must love it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! If you can conjure water, I'll trade you a room for a barrel; the well's gone brackish again." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Oh my, a warlock, and your little friend too. Welcome, explorer, but the little one sleeps outside, and that's a house rule I just made." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Please don't turn into anything in the dining room, explorer; Argo gets confused enough as it is." },
      },
      again = { { id = "h_again", text = "Anything else, explorer?" }, { id = "h_again2", text = "More? I'll top you up while you think." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Heard anything?", next = "gossip" },
        { text = "Who's the grumpy one at the bar?", next = "gray" },
        { text = "Does Melbin really own everything?", next = "melbin" },
        { text = "What do the fighters talk about at the bar?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why don't the knights come down to the port?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the trappers say about the wilds?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What's the quietest rumor you've heard lately?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Who here needs a kind word most?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What do the sailors say about the sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why has the well gone brackish?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why does my companion have to sleep outside?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Seen any strange beasts on the coast?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How did you end up running the inn here?", next = "origin" },
        { text = "Goodbye.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "Plenty! Most of it's Argo's, so half of it's sea monsters. Sit a while; the other half comes round eventually." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gray = {
      lines = { { id = "gr_default", text = "Gray? He's Brotherhood. He comes down from the keep, drinks, grumbles, tips well and goes back up again. Don't sit in his chair; he doesn't own it, but don't anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
    },
    melbin = {
      lines = { { id = "m_default", text = "He owns the land, or so he says. I own the stew pot and the good blankets, and I never once let him forget it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Who hit who, mostly, and who's paying for the next round. The Brotherhood boys tell the same siege stories every night and the Horde ones off the boat tell theirs, and somehow they never sit at the same table." },
      },
      choices = {
        { text = "Maybe one day they'll share a table.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better they don't. Some grudges are earned.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Oh, Melbin's prices, and their Commander, who thinks goblins are only one step up from the Horde. Gray comes down, though, and he's Brotherhood through and through, whatever he says when he's had a few." },
      },
      choices = {
        { text = "Demar's right to be careful. Goblins sell to everyone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Demar should loosen up. Neighbours matter.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Big cats in the hills, catfish in the rivers with whiskers like Melbin's, and ogres up north who've started trading with the Horde instead of eating them. That last one's my favourite." },
      },
      choices = {
        { text = "Hunt only what you need out there.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Everything out there is worth a pelt to someone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Ooh, a quiet one? Gray's been writing letters he doesn't send, and Melbin's been counting boat fares twice, once out loud and once under his breath. That's all I'll say, explorer, because I like my customers coming back." },
      },
      choices = {
        { text = "I'll keep that to myself, Zizplink.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Interesting. That might be worth something to someone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Gray, every night, though he'd throw his mug at you for saying so. And Argo, who laughs a little too loud for a man who's not frightened of anything." },
      },
      choices = {
        { text = "Then I'll sit with them both tonight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grown men can carry their own troubles.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "That it's bigger than it used to be, which is silly, and that something lives off the murloc islands, which is Argo's story, so that's silly too, except his boat came back with teeth marks. I keep the shutters closed on stormy nights, explorer, just in case." },
      },
      choices = {
        { text = "Respect the sea, and it'll leave you be.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever lives out there, I'll hunt it down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "The tide gets into it, because Melbin dug it too close to the shore to save on rope. He says it's a feature, a saltwater well, very fashionable, and I say it makes the tea taste like Argo's boots." },
      },
      choices = {
        { text = "Make Melbin dig a proper well.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll conjure you water. Leave Melbin out of it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Because the last guest with a little friend like that let it loose in the pantry, and Fimbo didn't speak to me for a week! I'm sure yours is lovely, explorer, but rules are rules." },
      },
      choices = {
        { text = "Fair. It'll stay outside.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules made up today don't count.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Murlocs, more than anybody wants, and crabs the size of cartwheels off the islands, and once a turtle so old it had barnacles on its barnacles. Fimbo wanted to cook it, and I wouldn't let him." },
      },
      choices = {
        { text = "Good. Something that old deserves to live.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fimbo had the right idea. Turtle soup is good.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin = {
      lines = { { id = "or_default", text = "I was cooking in a galley on the Tanaris run, explorer, and the day the boat first tied up here, Melbin said he needed an innkeeper and I said I needed a kitchen that didn't roll. That was that, and I've not been seasick once since." } },
      choices = {
        { text = "Do you miss the sea?", next = "origin_sea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_sea = {
      lines = { { id = "orb_default", text = "Miss it? I can smell it from every room! But I do miss the stars from a deck at night, and some evenings I sit at the end of the dock and pretend the whole port is rocking." } },
      choices = {
        { text = "A home that stays put is worth a lot.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have stayed on the boat and kept moving.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everybody off the Tanaris boat comes through that door with a story! Ask, explorer, and I'll tell you everything I've heard." },
    },
    background = { { id = "tp_bg", text = "I ran a kitchen, then a galley, and now an inn, and every step was a bigger pot." } },
    advice = { { id = "tp_ad", text = "Breathe through your mouth on the docks at low tide. Trust me." } },
    powderfuse_port = { { id = "tp_port", text = "Best little port on the coast! It's the only little port on the coast, but that still counts." } },
    _none = { { id = "tp_none", text = "Never heard of it! Ask me tomorrow, though; somebody'll have told me by then." } },
  },
}

P:NPC {
  key = "gray", id = TODO_NPC("Gray Dawnbright"), name = "Gray Dawnbright",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port", "brotherhood_horse" }, temper = { "surly" }, values = { "loyal" },
  notices = { "standing", "drink" },

  impression = {
    first = "Gray Dawnbright was rude to me before I had said a word, and I suspect he is rude to everyone. Something is eating at him that drink isn't fixing.",
    third = "{name} met Gray Dawnbright, a sour Brotherhood rider drinking away his leave at Powderfuse Port.",
  },

  greetings = {
    { id = "g_default", text = "What is it? Can't you see I'm busy?" },
    { id = "g_drink", text = "If you're going to stand there, stand there with a drink for me." },
  },

  notice = {
    { id = "n_hero", cat = "standing", when = { townStanding = { town = "farholde", min = 30 } },
      text = "You're the one they talk about up at the keep. Fine, sit, but don't make a habit of it." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're further gone than me, and that's a first this week. Sit, sit." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not unless your spirits can make the Brotherhood forget what I did. Go on, ask Zizplink for my drink, if the spirits are busy." } },
      choices = {
        { text = "Go back to the Brotherhood and face it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Drink, then. The Brotherhood can wait.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gray Dawnbright, Brotherhood of the Horse, on leave from it, or it's on leave from me; I haven't decided. Make yourself useful and get Zizplink to fill this." },
        { id = "h_resolved", tags = { "news" }, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "I went up to the keep and sat with Demar. We didn't talk about her, not really; we drank to her, alive or not, and that's the first time in years." },
        { id = "h_soured", when = { thread = { id = "farholde_lost", state = "soured" } },
          text = "Don't. Whatever it is, I've heard it." },
        { id = "h_tessa", when = { metBefore = true }, text = "I wrote Tessa a letter, tore it up and wrote another, and that one's in the stew, I think. Don't eat the stew." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Howard was one of you, and the last thing I need tonight is reminding of Howard, so sit if you're sitting." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. If that animal drinks out of my mug, you're buying the next one." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You've got the walk. Fern had that walk, so don't do it in here, please; it makes me look up." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you're here to save my soul, it's at the bottom of this mug, so you'll have to wait your turn." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Can you turn water into ale? No? Then what good are you?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Whatever that thing is, it's looking at my drink, so tell it to stop." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Turn into a bear and frighten Zizplink into giving me credit, and I'll love you forever." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Great. Can your spirits fetch me a drink, or are they as useless as the rest of Powderfuse?" },
      },
      again = { { id = "h_again", text = "Still here? Fine, then, talk." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "Why aren't you up at the keep?", next = "keep" },
        { text = "Tell me about the Brotherhood.", next = "brotherhood" },
        { text = "Who's Tessa?", next = "tessa", when = { metBefore = true } },
        { text = "Fern Crimsonleaf. Did you know her?", next = "fern", when = { topicKnown = "fern_crimsonleaf" } },
        { text = "I spoke to Demar about Fern.", next = "fern_word",
          when = { thread = { id = "farholde_lost", beat = "b4_demar", state = { "stirring", "unfolding" } } } },
        { text = "Buy you a drink?", next = "drink" },
        { text = "You hold a tankard like a man who held a shield.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Tell me about Howard.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did the Brotherhood ever ride with hunters?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You knew Fern's walk?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What's at the bottom of the mug, Gray?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Was there a mage in the Brotherhood before Ashe?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my companion bother you, Gray?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why would you want to frighten Zizplink?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you have any use for a shaman, Gray?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Leave you to it.", next = "END" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Because up at the keep everyone stands up straight and talks about the dead. Down here they slouch and talk about fish. A man needs a break from standing up straight." } },
      choices = {
        { text = "Demar would call that desertion.", next = "keep_demar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_demar = {
      lines = { { id = "kd_default", text = "Demar would call breathing desertion if you did it facing Stormwind. I'll go back; I always go back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brotherhood = {
      lines = {
        { id = "b_default", text = "Best riders east of the mountains, and nobody west of them remembers we exist. We ride, we bleed, we carve names into stone, and then we do it again.",
          fx = { learn = { "brotherhood_horse" } } },
      },
      choices = {
        { text = "Why stay with it?", next = "brotherhood_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_why = {
      lines = { { id = "bw_default", text = "Because I've stood in front of those names. You don't walk away from them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tessa = {
      lines = { { id = "t_default", text = "Tessa's my wife, and that's all you're getting. She'd tell you more; she always does." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fern = {
      big = true,
      lines = {
        { id = "f_alive", key = true,
          text = "Knew her? Everyone did, and nobody did. Here's what the stone doesn't say: nobody found her, only her knife, and Fern didn't drop knives.",
          fx = { hear = "fern_lives" } },
      },
      choices = {
        { text = "You think she's alive.", next = "fern_alive" },
        { text = "Demar says she's dead.", next = "fern_demar", when = { heardLine = "demar.fl_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fern_alive = {
      lines = { { id = "fa_default", text = "I think she's somewhere. Ravenholdt taught her to vanish, and maybe she just never stopped." } },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's a long time to stay vanished.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    fern_word = {
      big = true,
      lines = { { id = "fw_default", text = "Did you, now? Go on, and don't soften it; I've had years of soft." } },
      choices = {
        { text = "He found her dagger and nothing else. That's not a grave.", next = "fern_hope",
          fx = { thread = { id = "farholde_lost", state = "resolved" }, affinity = 3, align = { light = 1 } },
          journal = { first = "Told Gray that a dagger isn't a grave. He looked at me a long time, then got up and walked towards the keep.",
                      third = "{name} told Gray Dawnbright that Fern Crimsonleaf's dagger was no grave. He went up to the keep." } },
        { text = "Let her rest, Gray. He's right.", next = "fern_rest",
          fx = { thread = { id = "farholde_lost", state = "soured" }, affinity = -2, align = { light = -1 }, trait = { stern = 1 } },
          journal = { first = "Told Gray to let Fern Crimsonleaf rest. He didn't argue. He didn't say anything at all.",
                      third = "{name} told Gray Dawnbright to let Fern Crimsonleaf rest. He fell silent." } },
      },
    },
    fern_hope = {
      lines = { { id = "fh_default", text = "No... it isn't, is it? Hold my chair, because I'm going up to the keep. Someone ought to tell the Commander he's allowed to hope." } },
      choices = { { text = "Go on, then.", next = "END" } },
    },
    fern_rest = {
      lines = { { id = "fr_default", text = "Right, right. Zizplink, another one over here! No, I'm fine, so go on, then; you've done your bit." } },
      choices = { { text = "...", next = "END" } },
    },
    fern_demar = {
      lines = { { id = "fd_default", text = "Demar says a lot of things are dead. Half of them are just quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drink = {
      lines = { { id = "d_default", text = "Now you're talking sense! Zizplink, whatever this one's having, and one for me, on them." } },
      choices = {
        { text = "Cheers.", next = "BACK", fx = { affinity = 2 } },
        { text = "I said a drink. Not two.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xwarrior = {
      lines = { { id = "xwa_default", text = "Twenty years on the wall'll do that to your grip. Don't go thinking that makes us friends, though; I've got enough friends up at that keep who keep asking when I'm coming back." } },
      choices = {
        { text = "When are you going back?", next = "keep" },
        { text = "Drink, then. I'll leave you be.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Sir Howard the Stout opened the gate and rode at the Horde camp with the Light coming off him like noon, and I watched it from the wall. He didn't come back, and I've been sitting down ever since." },
      },
      choices = {
        { text = "He died well. That's what matters.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dying well is still dying, Gray.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Rosalind Ashwood, best scout we ever had; she could spot a cultist in fog that would hide a castle. She's on the stone now, and she'd be ashamed of what passes for scouting these days, so don't you go telling her." },
      },
      choices = {
        { text = "I'll scout for the Brotherhood, in her memory.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Scouting's for the living. Let the stone rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Everyone in the Brotherhood knew it, because she'd be standing behind you before you heard a thing. Ravenholdt trained her, and they don't train people who die easy, which is all I'll say till you buy me another." },
      },
      choices = {
        { text = "Some people are hard to kill. Maybe she is.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Everyone dies, Gray. Even the good ones.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Ale, mostly, and under that more ale, and under that a lot of names on a stone up the hill. If you want to pray for something, pray Zizplink doesn't cut me off." },
      },
      choices = {
        { text = "I'll pray for you, and for the names.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then drink. Grief has to go somewhere.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Alden Amberhall, Ashe's father, the only one of the charge who rode back through that gate. He threw fire like he was angry at it, and the Horde camp was burning before Howard's lances reached it." },
      },
      choices = {
        { text = "He rode back. That's its own kind of courage.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire wins wars. Courage only fills the memorials.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Bother me? Nothing bothers me tonight, friend; that's the whole point of the mug. But if it touches my drink, I'll introduce it to the floor, demon or no." },
      },
      choices = {
        { text = "Fair. It keeps its claws to itself.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Try it, Gray. See how that goes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Because she's got a tab with my name on it as long as the dock, and a bear would make a fine argument for forgetting it. I'm joking, mostly; she's the only one in this port who'd carry me home." },
      },
      choices = {
        { text = "Pay your tab, Gray. She deserves it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll be the bear. Let's see her face.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been drinking here long enough to hear a few things. Ask, if Zizplink's filled this mug." },
    },
    background = { { id = "tp_bg", text = "Brotherhood, married and thirsty, in that order, most days." } },
    advice = { { id = "tp_ad", text = "Don't stand too close to Demar when he's talking about Stormwind. He waves his hands." } },
    fern_crimsonleaf = { { id = "tp_fernnext", text = "Fern? Sit down and buy something, and then I'll tell you.", next = "fern" }, { id = "tp_fern", text = "She's alive, and don't argue with me about it." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Family, the kind you'd leave for an afternoon and never for good." } },
    _none = { { id = "tp_none", text = "Ask somebody sober, and that's not me, not tonight." } },
  },
}

P:NPC {
  key = "jazzle", id = TODO_NPC("Jazzle Cheapshot"), name = "Jazzle Cheapshot",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "brash" }, values = { "greedy", "ambitious" },
  notices = { "class", "form" },

  impression = {
    first = "Jazzle Cheapshot owns an arena with no fights in it yet, and that doesn't dent his enthusiasm one bit. He looked me over like a poster he hadn't painted.",
    third = "{name} met Jazzle Cheapshot, who runs an empty arena at Powderfuse Port and dreams of filling it.",
  },

  greetings = {
    { id = "g_default", text = "No fights today, pal, but soon, very soon!" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Look at the shoulders on you! I can see the poster already." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear! A talking bear? Could you do that on command, twice a night, maybe with a little hat?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jazzle Cheapshot, and this is my arena. It's empty, yeah, for now, while the Horde and the Alliance are out in the fields killing each other for free. For free!" },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter with a beast! Two fighters for the price of one ticket, and I can sell that, pal, oh, I can sell that." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Every arena needs a healer by the ring, and the crowd loves a comeback, so you'd be the comeback." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest! Ringside healer, pal, that's the job; somebody's gotta patch them up for round two." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Lightning, earthquakes, a big spirit wolf? That's not a fight, that's a fireworks show, and I want it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Fireballs sell tickets, pal; people love a fireball, especially when it isn't coming at them." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock with a demon! Now that's a headliner: Bring Your Own Monster Night." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've got your poster half-painted already, 'The Bear Who Was a Person', and you'd be perfect." },
      },
      again = { { id = "h_again", text = "What else? Make it quick, I've posters to paint." } },
      choices = {
        { text = "When does it open?", next = "open" },
        { text = "Who would even fight here?", next = "fighters" },
        { text = "Put me on the card.", next = "card", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Isn't selling tickets to a fight a bit grim?", next = "grim" },
        { text = "Would a tauren draw a crowd?", next = "xtauren", when = { race = "Tauren" } },
        { text = "Would my pet fight on the card too?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would an arena need a healer?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Is a fight for coin worthy of the elements?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would a mage do in your arena?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really put a demon in the ring?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do I get any say in my own poster?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    open = {
      lines = { { id = "o_default", text = "When I've got fighters, a crowd, and Melbin off my back about the rent, so soon. Goblin soon!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fighters = {
      lines = { { id = "f_default", text = "Ogres, if Bolder'ok'll sign, and Brotherhood knights, if they'd stop being so noble. Pirates, if I can get 'em to fight one at a time, and you, if you've got a gimmick." } },
      choices = {
        { text = "A gimmick?", next = "gimmick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gimmick = {
      lines = { { id = "gm_default", text = "Everybody needs one! 'The Bear Who Was a Person', say, or 'The Gnome With the Big Hammer'. Think on it, and come back with a name." } },
      choices = {
        { text = "'The One Who Gets On With It.'", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'll pass.", next = "BACK" },
      },
    },
    card = {
      lines = { { id = "c_default", text = "Opening night, top of the bill. There's no opening night yet, but you're on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    grim = {
      lines = { { id = "gr_default", text = "Grim? It's the same fighting with a roof and a snack cart, so I'm civilizing it." } },
      choices = {
        { text = "Selling seats to a bloodbath isn't civilizing it, Jazzle.", next = "BACK", fx = { align = { honor = 1 }, trait = { skeptical = 1 } } },
        { text = "Fair point, actually.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    xtauren = {
      lines = { { id = "xta_default", text = "Would a tauren draw a crowd? Look at you! I'd paint you ten feet tall on the poster, and you'd still be the most honest thing on it." } },
      choices = {
        { text = "My people don't fight for coin.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Put me on the card.", next = "card", fx = { affinity = 1 } },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Would it! Beast fights would be the hottest ticket in Gadgetzan, if Gadgetzan had any sense. Your pet against a crab off the islands, opening night, and the crab hasn't even got an agent." },
      },
      choices = {
        { text = "My companion fights to survive, not for a crowd.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Book it. My pet loves an audience.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Because a dead fighter fights once, pal, and a healed fighter fights every week! That's not cruelty, that's repeat business." },
      },
      choices = {
        { text = "I'll heal them, but I won't help you profit.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. Repeat business keeps fighters paid.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Worthy? Pal, the Horde and the Alliance are out in those fields throwing lightning at each other for nothing! I'm offering the elements a roof, a crowd and a cut, and they've never had a better deal." },
      },
      choices = {
        { text = "The elements aren't for sale, Jazzle.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A cut for the elements? Now you're talking.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Big and loud, that's all I ask! Blink around, freeze the other guy, set a little fire, but nothing near the snack cart, because Fimbo's catering and he's very sensitive." },
      },
      choices = {
        { text = "I'll fight fair, with no tricks for the crowd.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll give them a show they'll never forget.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Really, truly! Under supervision, with a fence, a waiver, and a goblin standing well back with a bucket. The crowd's gonna scream, pal, and screaming is the best sound a ticket booth ever hears." },
      },
      choices = {
        { text = "Demons aren't entertainment. Forget it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Build the fence high. We'll be there.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "A say? Sure, pal, you can say whatever you like, and then I'll paint the poster. 'The Bear Who Was a Person' tested great with the dockhands; very dignified." },
      },
      choices = {
        { text = "My shapes aren't a gimmick for your posters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Paint it bigger, and give the bear a hat.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a promoter, born one. Some goblins come out with a silver tongue; mine came with a ticket booth." } },
    advice = { { id = "tp_ad", text = "Every fight's a show. Win it pretty and somebody'll pay to watch the next one." } },
    _none = { { id = "tp_none", text = "Can it fight? If it can't, I don't book it." } },
  },
}

P:NPC {
  key = "fimbo", id = TODO_NPC("Fimbo Greasemitz"), name = "Fimbo Greasemitz",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "dramatic" }, values = { "curious" },
  notices = { "craft" },

  impression = {
    first = "Fimbo Greasemitz cooks boar and fish every single day and suffers loudly over it. Give him one new ingredient, I think, and he'd weep with joy.",
    third = "{name} met Fimbo Greasemitz, who keeps a cafe on the water at Powderfuse Port and is bored of his own menu.",
  },

  greetings = {
    { id = "g_default", text = "Table for one? Every table's for one, since nobody eats here in pairs." },
    { id = "g_menu", text = "It's boar or fish, same as yesterday, and same as forever." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Finally, somebody who'll understand my suffering." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fimbo Greasemitz, and welcome to my cafe on the water! Today we have roast boar and roast fish, and tomorrow, roast boar and roast fish. I'm dying inside." },
        { id = "h_stew", tags = { "news" }, when = { questActive = TODO_QUEST("A Taste of the Sea") },
          text = "Murloc eyes and crab meat, off the beaches. Fast in the pan with the eyes; that's the secret, because it keeps the sea in them." },
        { id = "h_stew_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("A Taste of the Sea"), days = 3 } },
          text = "Seafood stew, on the menu! Three customers tried it and two came back, which is the best this cafe has ever done." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A fighter! You look hungry, and hungry is my favourite kind of customer. Boar or fish? I already know your answer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Do you bless food? Because my boar could use a miracle, honestly." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Please, please tell me you've brought something that isn't boar." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You snuck up on my kitchen! Good; I like a customer who doesn't knock over the pans." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Say grace over my roast, would you? It's the only thing that'll make it taste different." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A priest off the Horde boat! Do your people say grace? Say it, please, because the boar needs all the help it can get." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can the spirits make a fish taste like something other than fish? I'd pay." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you conjure food? Don't answer, because if you can, I'm out of business." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Does your little friend eat? Please say it eats, because I've got so much boar." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You know herbs, wild ones, out of the glades. Please tell me you know herbs." },
      },
      again = { { id = "h_again", text = "What else? The pot's on, so I can talk." } },
      choices = {
        { text = "Why not cook something else?", next = "menu" },
        { text = "Murloc eyes? Really?", next = "eyes" },
        { text = "Who eats here?", next = "customers" },
        { text = "Trade recipes?", next = "recipes", when = { profession = "Cooking" } },
        { text = "Darkspear cooks use a lot more pepper.", next = "xtroll", when = { race = "Troll" } },
        { text = "What should a warrior eat before a fight?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could the Light help your cooking?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you cook, if I brought you game?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you have any secret ingredients?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you ever feed people who can't pay?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Do you thank the sea for its fish?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why fear conjured food, Fimbo?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really feed my demon?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What herbs are you looking for?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Goodbye, Fimbo.", next = "END" },
      },
    },
    menu = {
      lines = { { id = "m_default", text = "Because boars walk up to the door and fish jump in the pot! Everything else costs money and imagination. I've got the imagination." } },
      choices = {
        { text = "What would you cook, if you could?", next = "menu_dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menu_dream = {
      lines = { { id = "md_default", text = "A stew so good the Brotherhood and the Horde sit at the same table to eat it. They'd fight over seconds, sure, but at the same table!" } },
      choices = {
        { text = "I'd eat that.", next = "BACK", fx = { affinity = 2, opinion = { peace = "for" } } },
        { text = "They'd fight over the table first.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "Really! Crunchy outside, salty inside, like the sea gave you a little kiss... a wet, crunchy kiss." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "Sailors, goblins, Gray when Zizplink cuts him off, and Argo, who eats anything if you call it a toast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recipes = {
      lines = { { id = "r_default", text = "Yes! Give me something with a sauce, anything with a sauce, and I'll give you the boar. You'll never need another boar recipe as long as you live." } },
      choices = { { text = "Deal.", next = "BACK", fx = { affinity = 2 } } },
    },
    xtroll = {
      lines = { { id = "xtr_default", text = "Pepper! Real pepper, the hot kind? I haven't seen a peppercorn since the last Tanaris boat, and that one went into the stew before anyone could stop me." } },
      choices = {
        { text = "I'll bring you some next time.", next = "BACK", fx = { affinity = 2 } },
        { text = "What would you cook with it?", next = "menu" },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Boar, because it's always boar, but cooked slow overnight with river onions so it sits in you like a brick and keeps you standing. The Brotherhood boys eat it before patrols, and they've never once complained, at least not to my face." },
      },
      choices = {
        { text = "Plain food for plain work. That's how it should be.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bland food makes bland fighters. Spice it up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Maybe! Sister Rowland sends a lad down for my broth sometimes, and they tell me the sick up at the keep ask for it by name. I'd like to think that's my seasoning, but I'd take a blessing too." },
      },
      choices = {
        { text = "Your broth is a blessing all its own.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's skill, not miracles. Take the credit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Venison with juniper, river duck in a salt crust, or a big cat from the hills, if they're edible, which nobody's told me. Anything with a new taste, and I'll cook it so well you'll cry." },
      },
      choices = {
        { text = "I'll bring game, hunted fair and clean.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring whatever I catch, however I catch it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "One, and I'll tell you because you look like you can keep it: a splash of Argo's rum in every stew. That's why the stew's good, and it's why Argo thinks he's buying his own rum back from me at a markup." },
      },
      choices = {
        { text = "You should tell Argo. It's his rum.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Clever. I won't say a word.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Every day, the stew nobody bought by closing. Melbin says it's bad business, so I tell him it's spoiled and give it to the dockhands, and they've never once got sick from it." },
      },
      choices = {
        { text = "That's kindness, Fimbo. Keep doing it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Melbin's right. Charge them something.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Thank it? I've thanked it, cursed it, sung to it, and once threw a whole boar in as a trade, and it still sends me the same fish every morning. If you can talk it round, I'll name a soup after you." },
      },
      choices = {
        { text = "The sea gives what it gives. Be grateful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bargain harder. Even the sea can be talked round.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Because it tastes of nothing! It fills you up and leaves your tongue lonely, and if people start eating air-bread, nobody will ever need a cook again, and then where will I be?" },
      },
      choices = {
        { text = "Conjured bread feeds the hungry. That matters more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Real cooking is worth protecting.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Would I! Boar, fish, yesterday's boar, last week's fish, whatever it likes. Does it eat bones? Please say it eats bones, because I've got barrels of bones." },
      },
      choices = {
        { text = "Keep your scraps for the dockhands, Fimbo.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It eats things you'd rather not know about.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Wild thyme, sage, anything green that isn't seaweed. The glades are full of it, but the Brotherhood says the woods are dangerous, and the Horde says the same, and I'm a cook, not a fighter." },
      },
      choices = {
        { text = "I'll gather some, and only what grows back.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll strip a few patches. The glades have plenty.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A cook, always a cook. This cafe's the first kitchen that's mine, and it's on the water, which counts as floating." } },
    advice = { { id = "tp_ad", text = "Murloc eyes go in last. Everything goes in before the murloc eyes." } },
    _none = { { id = "tp_none", text = "Is it a recipe? If it isn't, it's wasted on me." } },
  },
}

P:NPC {
  key = "argo", id = TODO_NPC("Argo Brinewhistle"), name = "Argo Brinewhistle",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "jovial" }, values = { "brave", "generous" },
  notices = { "drink", "craft" },

  impression = {
    first = "Argo Brinewhistle hiccups through every sentence and calls his boat the finest in the port, sea monster and all. Drunk or not, there's a real sailor's nerve in him.",
    third = "{name} met Argo Brinewhistle, a hard-drinking captain at Powderfuse Port with a sea monster problem.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy! *hic* Pull up a crate." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're keeping up, and nobody keeps up! Have another, have mine." },
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Good, then you know there's things in this water bigger than your pole." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Argo Brinewhistle, captain of the finest boat in the port. *hic* Well, the finest boat with a monster problem." },
        { id = "h_monster", tags = { "news" }, when = { questActive = TODO_QUEST("The Monster Surfaces") },
          text = "The bait goes in by the fresh wreckage off the murloc islands, not here, out there! Then it comes up, and you take its head for my stern!" },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Monster Surfaces"), days = 3 } },
          text = "Look at 'er, up on my stern! Ugliest, finest figurehead on the whole coast, and drinks are on me, again." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A fighter! *hic* You've got the arms for a harpoon, and I've got a harpoon, so that's fate, that is." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! *hic* Bless my boat, would you? She's leaky, but she's got a good heart." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Ever hunted something with more teeth than a shark's grandmother? *hic* I have, and I'm doing it now." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Whoa! *hic* Don't sneak up on a sailor, friend; we throw things." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! *hic* Come to save my soul? It's pickled, friend, but you're welcome to try." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest on my dock! *hic* Never mind, the monster doesn't care who's who, and neither do I." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you freeze the sea? *hic* Just a bit, just round my boat?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that a demon? *hic* Can it swim? Because I've got a job for something that swims and bites." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! *hic* Turn into a seal and go have a look at my monster for me, would you?" },
      },
      again = { { id = "h_again", text = "What else can I do for you, matey? *hic*" } },
      choices = {
        { text = "What kind of monster?", next = "monster" },
        { text = "Are you ever sober?", next = "sober" },
        { text = "Tell me about your boat.", next = "boat" },
        { text = "I fish these waters too.", next = "fish", when = { profession = "Fishing" } },
        { text = "The sea spirits around here aren't happy, Argo.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Would a harpoon kill your monster?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why does your boat need a blessing?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you hunt a sea monster?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has anyone ever tried to steal your boat?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why is your soul pickled, Argo?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Why would you want the sea frozen?", next = "xmage", when = { class = "MAGE" } },
        { text = "What job would you give my demon?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Where would I find your monster?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Cheers, Argo.", next = "END" },
      },
    },
    monster = {
      lines = { { id = "m_default", text = "Big, with teeth, and more teeth than that. It sank three boats I know of, and one I made up to scare Gritta." } },
      choices = {
        { text = "Which one did you make up?", next = "monster_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monster_lie = {
      lines = { { id = "ml_default", text = "Ha! Wouldn't you like to know? *hic* The third, or maybe the second." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    sober = {
      lines = { { id = "s_default", text = "Once, and I didn't care for it; everything was so... clear." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    boat = {
      lines = { { id = "b_default", text = "Little, leaky and loyal, like me! She's never sunk, though she's thought about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = { { id = "f_default", text = "Then stay off the murloc islands at dusk, friend, because that's when it feeds, and not on fish, on fishermen." } },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "Not happy? Hic. Well, neither's the monster, and neither am I, so that's all of us. You tell those spirits that Argo Brinewhistle tips a drop overboard every night, which is more than most sailors do." } },
      choices = {
        { text = "They'd like you sober.", next = "sober" },
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Kill it? *hic* No, but it'd make it very cross, and a cross monster comes up to see who did it. That's when you take its head for my stern, friend, and I'll steer, and scream." },
      },
      choices = {
        { text = "Face to face, a fair fight. That's my way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bait it, trap it, then strike. No fair fights.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Because she's carried me home drunk more times than I can count, *hic*, and never once complained. A boat like that deserves a blessing more than I do." },
      },
      choices = {
        { text = "Then I'll bless her, and you as well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "She'd do better with a sober captain.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Same as anything, friend: bait, patience, and a big stick. *hic* Chum by the fresh wreckage, wait for the bubbles, and don't, whatever you do, lean over to look." },
      },
      choices = {
        { text = "Patience and bait. I'll wait it out.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll dive in after it. It's faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Steal her? *hic* Who'd want her? Well, a pirate did once, and got as far as the harbour mouth, then bailed for an hour and rowed her back to apologize." },
      },
      choices = {
        { text = "He brought her back. Give the man some credit.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He should have hanged for it anyway.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Brined, friend, like a good herring. *hic* Boats have gone down out there, and I'm the only one who keeps sailing, so I drink to the lads who didn't come back, because somebody has to." },
      },
      choices = {
        { text = "Drink to them, then, and pray for them too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need your rum, Argo.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "So the monster can't get under her! *hic* Freeze a ring round my boat, she sits pretty, the monster bangs its head, and I sell tickets to Jazzle's lot." },
      },
      choices = {
        { text = "Ice won't hold it. Face the thing properly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Freeze it, and charge Jazzle double.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Swim out, find the beastie, and bite it somewhere it'll remember. *hic* I'll pay in rum, or in fish, or in the eternal gratitude of a very drunk man." },
      },
      choices = {
        { text = "I'll do it myself, without the demon.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Done. It's been hungry lately anyway.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Off the murloc islands, *hic*, by the fresh wreckage. Swim careful, though; it likes things that swim, and you'd look like a snack in that shape, no offense." },
      },
      choices = {
        { text = "I'll look, and leave it be if it's only hungry.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll find it and lead it to your harpoon.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born on a boat, *hic* and I'll die on a boat, and in between, I'm on a boat." } },
    advice = { { id = "tp_ad", text = "Never trust a calm sea or a sober sailor." } },
    _none = { { id = "tp_none", text = "Don't know! *hic* Ask me after the next one." } },
  },
}

P:NPC {
  key = "gritta", id = TODO_NPC("Gritta Chumwater"), name = "Gritta Chumwater", title = "Fisherman",
  bible = "bibles/riverglades.md", role = "vendor", tier = "service",
  communities = { "powderfuse_port" }, temper = { "blunt" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "Gritta Chumwater sells chum, lures, fish and advice, and only the advice comes free. She says what she thinks and doesn't waste breath dressing it up.",
    third = "{name} met Gritta Chumwater, the blunt goblin who sells fishing supplies at Powderfuse Port.",
  },

  greetings = {
    { id = "g_default", text = "Chum's fresh, or as fresh as chum gets." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a fisher's squint, good. The catfish up the rivers bite like dogs, so you'll want a better pole." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gritta Chumwater. I sell chum, lures, fish and advice, and only the advice is free." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll want something to do between fights, so take up fishing; it'll teach you patience, which you lack." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Fish don't care how holy you are, so don't stand over the water glowing." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Keep your pet off my chum barrel, or it pays for what it eats." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Quiet feet, good. Fish hear clumsy people from the next cove." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Fishing's the closest thing to prayer I know: you sit, you wait, and mostly nothing happens." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A priest off the Horde boat. Sit and fish a while; it's the same as praying, only you get supper." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Tell the water to send me bigger fish, would you? It never listens to me." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Don't freeze my bait, don't boil my chum, and we'll get on fine." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Whatever that is, it's scaring off the fish, so stand back from the water." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Can you talk to fish? No? Then you're no use to me, but you can buy something anyway." },
      },
      again = { { id = "h_again", text = "What else? Buy something while you think." } },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where's the best fishing?", next = "fishing" },
        { text = "Who buys chum?", next = "chum" },
        { text = "Why would a warrior need patience?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does glowing really scare fish?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What bites hardest in these rivers?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Who else fishes these coves?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Fishing as prayer? Do you believe that?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Why won't the water listen to you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Has a mage given you trouble before?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do fish really sense demons?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do you need someone to talk to fish?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What's the biggest fish you've ever caught?", next = "biggest" },
        { text = "Goodbye.", next = "END" },
      },
    },
    fishing = {
      lines = { { id = "f_default", text = "Where the rivers come down to the sea. The catfish up there have whiskers like Melbin's, but don't tell him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chum = {
      lines = { { id = "c_default", text = "Fimbo buys it for soup and Argo for his monster. I don't ask which pot it ends up in, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Because you swing first and look second, same as every fighter I've sold a pole to. A fish teaches you to wait, and waiting's what keeps you alive when the swinging's done." },
      },
      choices = {
        { text = "Fair. Patience wins more fights than strength.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep swinging first. It's worked so far.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Everything scares fish: shadows, boots, loud prayers, Argo. Stand back from the edge and keep the shine down, and you'll do." },
      },
      choices = {
        { text = "I'll dim it. Your water, your rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light shines where it likes, Gritta.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "The catfish up the rivers, whiskers and all. They'll take a hand off if you're slow, and the old ones are bigger than your pet." },
      },
      choices = {
        { text = "Then I'll leave the old ones be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Big catfish make big meals. I'll hunt one.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Pirates from Windstead, when they think nobody's watching, and they're always watching. They pay in good coin and never haggle, so I don't ask where the coin came from." },
      },
      choices = {
        { text = "Coin from pirates is still stolen coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin's coin. Smart of you not to ask.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Believe it? I've sat on that dock every dawn for years, and I've never felt closer to anything than I do with a line in the water. Call it what you like." },
      },
      choices = {
        { text = "That sounds like faith to me, Gritta.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's just quiet. Nothing's listening.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Because I take from it every day and never give anything back but chum. If I were the water, I wouldn't listen to me either." },
      },
      choices = {
        { text = "Give something back, then. Respect the water.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea takes plenty. It owes you fish.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Some fool off the Tanaris boat, showing off for Jazzle. He froze my bait barrel solid and laughed about it, and I charged him for the barrel, the bait and the laugh." },
      },
      choices = {
        { text = "Good. Show-offs should pay for their fun.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Lighten up, Gritta. It was only a barrel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Fish sense everything. A demon's a big wrong shadow on the water, and every fish in the cove goes to the bottom and sulks, so stand back, like I said." },
      },
      choices = {
        { text = "Fair. I'll keep it well back.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your fish can sulk. It stays with me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Because they won't bite, and I want to know why. Three days now I've pulled up nothing but weed, and Argo's blaming his monster, which I'd rather not believe." },
      },
      choices = {
        { text = "Maybe they're frightened. Give the cove a rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Use more chum. Hunger beats fear.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    biggest = {
      lines = { { id = "bg_default", text = "A river catfish as long as Melbin's dock is wide, up where the rivers meet. It took me all morning to land and all afternoon to sell, and Fimbo cried when he cooked it, though he says that was the onions." } },
      choices = {
        { text = "Do you ever let the big ones go?", next = "biggest_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    biggest_go = {
      lines = { { id = "bgb_default", text = "Once. She was old and scarred and fought like she'd done it a hundred times before, so I cut the line. Don't tell anyone; it's bad for business." } },
      choices = {
        { text = "Good. Some fights are worth letting go.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A catch is a catch. I'd have kept her.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've fished every coast a boat can reach, and came here because the fish are stupider. Don't tell them." } },
    advice = { { id = "tp_ad", text = "Fish at dawn, sell by noon, and never eat what you can't name." } },
    _none = { { id = "tp_none", text = "Fish don't talk about that, so neither do I." } },
  },
}
