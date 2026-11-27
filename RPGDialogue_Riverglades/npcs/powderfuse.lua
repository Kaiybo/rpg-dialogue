-- Powderfuse Port: the goblin town on the Riverglades coast, at the end of the Steamwheedle boat. Neutral. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "melbin", id = TODO_NPC("Melbin Powderfuse"), name = "Melbin Powderfuse", title = "Master Goblin Engineer",
  bible = "bibles/riverglades.md", role = "trainer", tier = "major",
  communities = { "powderfuse_port" }, temper = { "shrewd" }, values = { "greedy", "proud" },
  notices = { "craft", "purse", "race" },

  impression = {
    first = "He watches my hands as if I might carry off a wall.",
    third = "{name} met Melbin Powderfuse, Master Goblin Engineer, who claims to have built Powderfuse Port from nothing but sand.",
  },

  greetings = {
    { id = "g_default", text = "Hands off the walls, pal, I built those, and every fingerprint's a cleaning fee." },
    { id = "g_back", when = { metBefore = true }, text = "You again, kid! Spending today, or just admiring? Because admiring's how the gnomes do it, and look where it got them." },
    { id = "g_engineer", when = { profession = "Engineering" }, text = "A fellow engineer! That's lovely, pal, really lovely, but touch nothin' anyway." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, pal, and in that time I've put up two new walls, so keep your hands off those too." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word around the port is you sold somebody a story and they paid full price for it, which is good business, I gotta say. Just don't try it on me, kid, because I own the building you'd be lying in." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked somebody round here in the port, kid, and talent like that's worth coin, so I'd hate to see you give it away for nothin'." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "So you're an engineer, are you? Gnomish or goblin... no, don't answer, I can tell by the eyebrows, since some of yours are missing." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Rich, eh? I like you, pal, and I like your purse even more. Ever thought about property? I've got some, all of it, actually, and it's very reasonably priced for the right buyer." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in MY port, measuring things with your eyes; I can see you doing it, kid, so stop it, or I start charging by the inch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Melbin Powderfuse, Master Goblin Engineer, and before you ask, yes, the docks, the inn, every plank and every nail are mine, and I built it all. Before me there was nothin' here but sand and murlocs, and the murlocs weren't paying rent either.",
          fx = { hear = "melbin_built_port", learn = { "powderfuse_port" } } },
        { id = "h_partner", when = { townStanding = { town = "powderfuse_port", min = 30 } },
          text = "My favourite customer! Everybody in the port says so, pal, because I told them to, and I don't tell 'em that for free." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You look like you break things, pal, so let's agree right now that anything you break in MY port, you pay for, at replacement cost plus labour." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Shiny armour, honest face, and a terrible negotiator, I'd bet my last copper, so I like you already." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, with a pet. If that beast sheds on my dock, it's a cleaning fee, and if it bites a customer, it's a bigger fee." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light! Bless the docks if you like, but the blessing becomes MY property the moment it lands." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest! Doesn't matter which flavour, pal, your gold's the same colour as anybody's. Pray all you want, just not near the cash box." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Tell your elements this coast is zoned for business, kid, and no earthquakes without a permit, which I sell." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, eh? Don't you go portallin' my customers out of here before they've spent anything, pal, because that's theft with extra steps." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, and an imp, or whatever that thing is. It doesn't pay rent, pal, so it doesn't stay, unless you're payin' for it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! If you're going to complain about the trees, get in line; the line is long, and it's also mine." },
      },
      again = {
        { id = "h_again", text = "More questions? Questions are free, and answers are free too, but the building you're standing in is not." },
        { id = "h_again2", text = "Go on, go on, kid, I'm listening and invoicing at the same time." },
      },
      choices = {
        { text = "You really built all of this yourself?", next = "built" },
        { text = "What can I do for you?", next = "deal" },
        { text = "This seems an odd place to build a port.", next = "why" },
        { text = "You must have some interesting neighbours.", next = "neighbors" },
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
        { text = "What would you charge my demon in rent, Melbin?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Somebody's forest went into this port.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    built = {
      lines = { { id = "b_default", text = "Every board, pal! Well, I designed every board, and some goblins I paid did the nailing, and I paid 'em well, too, so ask them... actually, don't ask them." } },
      choices = {
        { text = "So you didn't build it.", next = "built_push", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    built_push = {
      lines = { { id = "bp_default", text = "I built it the way Baron Revilgaz built Booty Bay: by being the one who owns it afterwards. That's what building means, kid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deal = {
      lines = { { id = "d_default", text = "Now you're talkin', pal. The Brotherhood buys, the Horde buys, the pirates buy when they think I'm not looking, and I need hands that can carry things past all three without getting stabbed, because stabbings are bad for the insurance." } },
      choices = {
        { text = "What's the pay?", next = "deal_pay", fx = { trait = { greedy = 1 } } },
        { text = "I don't work for goblins.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    deal_pay = {
      lines = { { id = "dp_default", text = "Fair pay, pal: goblin fair, which means you'll complain and come back anyway, and I'll have the contract ready when you do." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Rivers, kid! Three of 'em, bending like a drunk's walk home, all coming down to this coast, so timber, ore and pelts all float right to me. All I had to do was be here first and put up a sign." } },
      choices = {
        { text = "Smart.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Steamwheedle Cartel?", next = "why_cartel" },
      },
    },
    why_cartel = {
      lines = { { id = "wc_default", text = "The Cartel says I owe 'em a cut, and I do, pal: a small one, a very carefully calculated small one, by my last copper.",
        fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "Is the Cartel worth paying at all?", next = "wc_ask" },
        { text = "Something else.", next = "BACK" },
        { text = "The Cartel sent me to audit that small cut.", tag = "Deceive", next = "audit",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 60 } } } } },
          fail = { next = "audit_no", fx = { affinity = -1 } } },
      },
    },
    -- Opinion pass: Melbin wants the player's view on the Cartel (and is selling it back).
    wc_ask = {
      big = true,
      lines = { { id = "wq_default", text = "Worth it? Pal, that's the question every goblin asks himself at night, right after counting the till. You've seen Booty Bay and Ratchet, so tell me straight: is the Cartel the best friend a port could have, or just the most expensive?" } },
      choices = {
        { text = "The Cartel keeps the peace. That's worth every copper.", next = "wc_ask_pay", fx = { opinion = { steamwheedle = "trust" }, align = { order = 1 } } },
        { text = "Cut them loose. Powderfuse can stand on its own.", next = "wc_ask_cut", fx = { opinion = { steamwheedle = "distrust" }, align = { order = -1 }, affinity = 1 } },
        { text = "The Venture Company would treat you far worse.", next = "wc_ask_venture", fx = { opinion = { venture_company = "hate" }, trait = { practical = 1 } } },
        { text = "Goblins pay goblins. I'll stay out of it.", next = "BACK" },
      },
    },
    wc_ask_pay = {
      lines = { { id = "wqp_default", text = "Every copper, says you! You sound like the Cartel's own collector, kid, and he's the only goblin I know with a smile I'd pay to wipe off. Fine, fine, peace is good for business, I'll give you that one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wc_ask_cut = {
      lines = { { id = "wqc_default", text = "Now that's what I like to hear! Melbin Powderfuse, independent port, no cut, no collector, no nothin'. I'll never do it, of course, because the Cartel's got very long arms, but I like hearing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wc_ask_venture = {
      lines = { { id = "wqv_default", text = "Don't say that name in my port, pal! The Venture Company would strip these rivers bare in a season and call it a quarterly report. Okay, okay, the Cartel's not so bad, put like that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbors = {
      lines = {
        { id = "n_default", text = "The Brotherhood's south of here, honest and broke, and the Horde's west, honest, broke and louder. The cultists in the middle aren't paying, and up north there's ogres who changed sides, the most goblin thing I ever saw an ogre do.",
          fx = { learn = { "twilights_hammer", "brotherhood_horse" } } },
      },
      choices = {
        { text = "Any pirates on this coast?", next = "neighbors_pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_pirates = {
      lines = { { id = "np_default", text = "They're customers, is what they are, pal, and good ones, so don't you go telling the Brotherhood, or I'll be charging you for the lost business." } },
      choices = {
        { text = "My lips are sealed.", next = "BACK", reply = "Now that's what I like to hear, pal! A sealed lip is worth its weight in gold, and I'm the guy who knows the exchange rate.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I might.", next = "BACK", reply = "You might, huh? Then I might remember that next time you need a boat, and boats are very expensive to forget.", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Faster, sure, and then it'd explode, kid, because they always do. Mine's only exploded twice, and once was on purpose, for the insurance." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    partner = {
      lines = { { id = "p_default", text = "Partner? Ha! No, pal, but you're a valued customer, and in Powderfuse that's better, because partners pay rent." } },
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
        { text = "Deal. I'll sell you the flaws.", next = "BACK", reply = "A partner! See, that's how you do business, pal, and I'll pay a fair rate for every flaw, fair being whatever I say.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Flaws are worth more if nobody knows them.", next = "BACK", reply = "Ooh, you're cold, kid, I like it. Just remember who built the locks, and who's got the spare keys.", fx = { affinity = -2, align = { honor = -1 } } },
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
        { text = "I'll stand your dock, fair and square.", next = "BACK", reply = "Fair and square, the rarest thing on this coast. You're hired, pal, and you start whenever the next boat docks.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll stand it, and skim a crate or two.", next = "BACK", reply = "A crate or two, {g:he|she} says! I count 'em twice, pal, so skim lightly or skim somewhere else.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Give? Like, for free? I gave the Brotherhood a discount on rope once, and the Knight Commander still hasn't thanked me, so there you go; that's what giving gets you." },
      },
      choices = {
        { text = "Charity isn't about thanks, Melbin.", next = "BACK", reply = "No thanks, no profit, no point, as my old mentor used to say. But I hear you, and I'll think about it, for free.", fx = { align = { light = 1 } } },
        { text = "Smart. Nobody values what they get for free.", next = "BACK", reply = "See? Finally, somebody who gets it! Demar could learn a thing or two from you, pal.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Do I buy pelts! The Horde trappers bring them down from the west, the Brotherhood brings them up from the south, and I sell the lot to Tanaris at a markup that'd make you cry." },
      },
      choices = {
        { text = "Selling to both sides is dirty business, Melbin.", next = "BACK", reply = "Dirty? Pal, it's a ledger, not a bathtub, and everybody's money comes out the same color.", fx = { align = { order = 1 } } },
        { text = "Smart. Everyone's money spends the same.", next = "BACK", reply = "Exactly! Horde gold, Alliance gold, it all goes in the same chest, and the chest don't ask questions.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Look after? Sure, Zizplink at the inn feeds whoever she likes and puts it on my tab, and Fimbo at the cafe gives away the stew nobody bought. I pretend not to notice, which costs me plenty, so I'm basically a saint." },
      },
      choices = {
        { text = "Then stop pretending. It's good of you.", next = "BACK", reply = "Pretending? I am deeply offended, pal, and I'll be putting that on your tab. Just don't tell Zizplink you noticed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity's bad business. You should stop them.", next = "BACK", reply = "Stop 'em? Zizplink would brain me with a ladle, and Fimbo would cry. I'd lose more than I'd save.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "The spirits? I asked the murlocs, pal, and they said 'mrgl', which I took as a yes and had notarised. If the earth's got a complaint, it can file it with me like everybody else." },
      },
      choices = {
        { text = "Respect the land, Melbin, or it'll take its due.", next = "BACK", reply = "The land can file a complaint with my office, pal, and I'll get to it after the rent's in. Noted, though.", fx = { align = { light = 1 } } },
        { text = "Ha. If the spirits wanted this coast, they should've built first.", next = "BACK", reply = "That's what I said to the murlocs! Built first, owned first, and they're welcome to rent a stall.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Good for business? A portal's terrible for business! People step through and never buy a drink, never rent a bed, never pay a boat fare. Boats, kid; boats are the future, because you can charge for boats." },
      },
      choices = {
        { text = "Free travel helps everyone, Melbin.", next = "BACK", reply = "Helps everyone except the innkeeper, the boatman and me, pal. You're bad for business, you know that?", fx = { align = { light = 1 } } },
        { text = "Spoken like a true goblin. Charge them all.", next = "BACK", reply = "A kindred spirit! I'm gonna get a toll booth installed right next to the portal, see how they like that.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Imp rate's three silver a week, voidwalker's five on account of the size, and anything with wings pays double because it blocks the view. Pay up front, and keep it off the furniture." },
      },
      choices = {
        { text = "Three silver for the imp, then. Up front.", next = "BACK", reply = "Three silver, up front, and a pleasure doin' business with you. Keep the little guy outta the fuse shed.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Try collecting it from the demon yourself. I'll watch.", next = "BACK", reply = "I've collected from worse, pal, and I've got the burns to prove it. The rate just went up, by the way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Nobody's! Every log drifted down the rivers, so the forest gave them to me. Well, Turner's camp sold me a few, and I paid, mostly, so that's ownership." },
      },
      choices = {
        { text = "Driftwood's fair. Cutting more isn't.", next = "BACK", reply = "Driftwood's fair, see? That's what I keep tellin' Turner, and he keeps not believing me.", fx = { align = { light = 1 } } },
        { text = "Wood's wood. Build what you like.", next = "BACK", reply = "Now that's the right attitude! Wood's wood, and a dock's a dock, and the river's the best supplier I've got.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Now you're talkin', pal! Every plank and every nail, built from nothin' by yours truly, and it's about time somebody walked in here and appreciated the workmanship. You've got taste, kid, and taste is rare inventory." },
        { id = "s2", text = "Say that again a little louder, kid, so the rest of the port can hear it, because those ingrates never do. I like you, pal, and I don't usually like anybody before they've paid." },
      },
      fail = {
        { id = "f1", text = "Nice try, pal, but I've been softened up by Cartel auditors with better patter than that, and they left with nothin' too. Compliments aren't currency in my port." },
        { id = "f2", text = "You're butterin' me up, kid, and butter costs money, so what's the angle? Nobody admires a goblin's walls unless they're figurin' on walkin' off with one." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've got a mouth on you, kid, and a mouth like that could sell sand on a beach, which I happen to know somethin' about. I oughta charge you for the entertainment, but I'll waive it." },
        { id = "s2", text = "Oh, a wise guy, in MY port! I love it, pal, because nobody around here has the nerve to rib the landlord anymore, and it's been bad for my reflexes." },
      },
      fail = {
        { id = "f1", text = "Watch it, pal. You're standin' on my dock, breathin' my air and insultin' my port, and all three of those are billable." },
        { id = "f2", text = "I built this place out of nothin' while smarter mouths than yours were laughin', and now I own it and they don't. So laugh it up, kid, somewhere that isn't mine." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Whoa, easy, pal, easy! I'm lookin' at you and I'm lookin' at the repair bill if this goes badly, and the repair bill wins. Let's keep the port in one piece and talk like business people." },
        { id = "s2", text = "All right, kid, I can do sums, and you plus my walls plus a bad mood comes out to a loss on my side of the page. You've got my attention, so say your piece." },
      },
      fail = {
        { id = "f1", text = "You're threatenin' a master goblin engineer in a port he wired himself, pal, and you've got no idea which planks you shouldn't be standin' on. Take a nice slow step back." },
        { id = "f2", text = "Kid, I've had the Venture Company lean on me with lawyers and dynamite both, and it's still my name on the sign. You don't even make the top ten." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The port's charter is in my name only because the Cartel's clerk owed me a very large favour. If anybody in Undermine ever looks too closely, I'm in trouble." },
    { id = "bl2", text = "The Venture Company's had a man asking prices on my warehouses for months. I'll burn the place to the waterline before I sell, and I've already bought the oil." },
    { id = "bl3", text = "Those Twilight types pay in coin that's cold to the touch, pal. I take it anyway, and I don't keep it in the same strongbox as the rest." },
  },
  alignment = { honor = -1 },
  confides = {
    { id = "cnf_1", text = "Sleebo's gas vents by the southwest ponds go up like a firework if a spark gets near 'em, so don't throw fire around over there. Ask me how I know, pal." },
    { id = "cnf_2", text = "The Venture Company fella who keeps askin' about my warehouses goes back to Tanaris on the second boat every week, regular as a clock. If anybody wanted to know who he reports to, that's where I'd start." },
    { id = "cnf_3", text = "The murloc islands off the coast have more wreckage on 'em than any beach in the Riverglades, and wreckage means salvage, kid. Go at low tide, and go armed." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "My problem, kid? You cost me money, or you cost me time, and time is money, so either way you're in the red." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You tried to squeeze me, pal, in my own port. Nobody squeezes Melbin Powderfuse, because I'm the one who does the squeezing round here." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You talked about my port like it was a heap of sand with some planks on it. It is, pal, but it's my heap, and I built every plank." },
      { id = "gv_rival", when = { grudge = "rival" }, text = "I hear you've been doing favours for the Venture Company boys. Anybody who helps those clowns can find another port to dock in." },
    },
    amends = {
      { id = "am1", text = "Spend some money, kid, a lot of it, and spend it here. Gold has a lovely way of healing old wounds." },
      { id = "am_pers", when = { grudge = "persuade" }, text = "Stop trying to haggle me down and pay full price for once. You'd be amazed how friendly I get." },
    },
    spite = {
      { id = "sp1", text = "I think you're a bad investment, pal, and I never make bad investments twice. Off my dock before I charge you for the standing." },
      { id = "sp_wronged", when = { grudge = { worst = "wronged" } }, text = "I think you're the kind of customer who breaks the merchandise and blames the shop. I've got a sign about your kind, and it's not friendly." },
    },
    knows = {
      { id = "tp_knows", text = "Information's like timber, pal: it floats down to me eventually, and I sell it on at a markup. Ask, and we'll talk terms later." },
    },
    background = { { id = "tp_bg", text = "Born with nothin', somewhere with less, and now I own a port, kid. Do the sums; it's a very inspiring story, and I'll sell you the book when I write it." } },
    advice = { { id = "tp_ad", text = "Never build on land somebody else owns, pal. Build first, and make them prove it, and bill them for the inconvenience." } },
    powderfuse_port = { { id = "tp_port", text = "Mine, all of it, every grain of sand, so next question, pal." } },
    steamwheedle = { { id = "tp_cartel", text = "Fine people, thirsty people, and every cut they take, I take back from the boat fares, so it all comes out in the wash." } },
    twilights_hammer = { { id = "tp_hammer", text = "Terrible customers, pal. They never buy anything, and they keep looking at the sky like it owes 'em money, which, I mean, I understand the feeling." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's a fine town, but it's not mine, and Powderfuse Port is. Every plank, every nail, every bucket of tar, all mine, pal." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the big port, sure, but it's crowded, and it's expensive, and it's run by a committee. Here, you deal with me, and I'm reasonable." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company would love to get its hands on Powderfuse Port, and it never will. I'll burn the place to the waterline before I let those clowns have it." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a nice little port on the Barrens coast, and it does a fair trade. Not as fair as mine, pal, but fair." } },
    thrall = { { id = "tp_thrall", text = "The Horde pays in gold like anybody else, and I'm happy to take it. The Brotherhood too, pal, gold is gold." } },
    _gated = {
      { id = "gt1", text = "That's proprietary, pal, and I don't hand out proprietary to somebody who hasn't done a lick of business in my port. Get on my good side first, and it's a real small side." },
      { id = "gt2", text = "Nope, not for you, kid, not yet. Some information I keep locked up with the good tools, and you haven't earned the key." },
    },
    _none = { { id = "tp_none", text = "Is it for sale? If it isn't, kid, I haven't got an opinion, and if it is, it's probably mine." } },
    regard = {
      { id = "rg_1", text = "You, pal? You're a good customer, and you know what that makes you in my book? Practically family, and family's the one thing I don't put a price on, mostly." },
      { id = "rg_2", text = "I think you're the best investment that's walked down my dock all year, kid, and I've seen some ships come in. You keep payin' off, and I keep noticin'." },
      { id = "rg_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You know when to bend a rule and when to snap it clean in half, and I respect that, pal. Honest folk are lovely, but they're murder on the margins." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've done right by the port, kid, and I've got it all written down in the good ledger, the one with the leather cover. That's where I keep my friends." },
    },
    confide = {
      { id = "cf_1", text = "Half the planks in this port came off a wreck I didn't exactly find, pal. The other half came off a wreck I did find, after I'd helped it along a little." },
      { id = "cf_2", text = "The other goblins tease me about the port being mine, and I laugh along, but it gets under the plating. I really did build most of it, give or take a few hundred workers." },
    },
    trust = {
      { id = "tr_1", text = "Zizplink at the inn, because she's too cheerful to lie, and Gritta, because she's too rude to bother. Everybody else in this port I trust about as far as I can throw a steam pump." },
      { id = "tr_2", text = "Trust the Cartel's paperwork and nobody's handshake, pal. And if a fella in a Venture Company hat offers you a job, you never met me." },
    },
    watchout = {
      { id = "wo_1", text = "Watch Sleebo Fizzlespout and his gas jars, kid, because he thinks I don't know about his little operation down by the southwest ponds. I know, and so does anything with a match." },
      { id = "wo_2", text = "Don't drink with Argo Brinewhistle unless you want to end up rowing out to the murloc islands at midnight. He's a lovely fella, but he's a terrible plan with legs." },
    },
    worries = {
      { id = "wy_1", text = "Overhead, pal, always overhead, and the Venture Company sniffin' round my warehouses with an offer I keep tearin' up. One of these days they stop offerin', and then what?" },
      { id = "wy_2", text = "The salt eats the pilings faster than I can pitch 'em, kid, and one morning the whole south dock's goin' into the bay with somebody's cargo on it. Probably mine, knowin' my luck." },
    },
    hopes = {
      { id = "hp_1", text = "A statue, pal, right at the end of the dock, of me holding a wrench, in bronze with a bit of gold leaf and a little plaque so nobody forgets who built the place." },
      { id = "hp_2", text = "Honestly? That the port's still standing when I'm gone and somebody says 'Melbin built this.' That's the only profit you can't spend, and I want it anyway." },
    },
    favor = {
      { id = "fv_1", text = "Tell folk in Booty Bay and Gadgetzan that Powderfuse Port's open for business, kid. Word of mouth's the cheapest advertising there is, and I love cheap." },
      { id = "fv_2", text = "If you ever see a Venture Company surveyor on my sand with a measuring chain, I want to know about it the same day. That's a favour I'd remember, pal." },
    },
    friendship = {
      { id = "fr_1", text = "Friend? Kid, you're a valued customer, a business partner and a friend, in that order, and two out of three is the best rate anybody gets from me." },
      { id = "fr_2", text = "Yeah, all right, you're a friend, and don't go spreadin' it round the dock or everybody'll want one. I've only got so much goodwill in stock." },
      { id = "fr_rival", when = { fondness = "rival" }, text = "Anybody who gives the Venture Company a black eye is a friend of Melbin Powderfuse for life, pal. That's a lifetime contract, and there's no small print." },
    },
    never_told = {
      { id = "nt_1", text = "I got thrown out of a workshop in Undermine for blowin' up my cousin's half of it, and it wasn't an accident, pal. He had it coming, but I still send his mother a crate of fish every year." },
      { id = "nt_2", text = "I came here on the first Steamwheedle boat with four coppers and a wrench, and I slept under the pier for a month. Every plank I nailed down after that, I nailed down so I'd never sleep under one again." },
    },
  },
}

P:NPC {
  key = "zizplink", id = TODO_NPC("Innkeeper Zizplink"), name = "Innkeeper Zizplink",
  bible = "bibles/riverglades.md", role = "innkeeper", tier = "service",
  communities = { "powderfuse_port" }, temper = { "cheerful", "chatty" }, values = { "generous" },
  notices = { "guest", "drink" },

  impression = {
    first = "She hears every rumor that comes off the Tanaris boat.",
    third = "{name} met Innkeeper Zizplink, the cheerful goblin who keeps the inn at Powderfuse Port.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite guest. The fire's warm and the room's ready." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll rent you a room, but there'll be no trouble in my house tonight." },
    { id = "g_default", text = "Another explorer! Come in, come in, honey, and mind the smell, because it's the sea, mostly, and the sea doesn't pay for cleaning." },
    { id = "g_home", when = { homeInn = { "Powderfuse Port" } }, text = "Your room's ready, explorer! I aired it out, but the air came back in, so it smells like fish again, and I'm not knocking anything off for that." },
    { id = "g_away", when = { away = 14 }, text = "You're back after {away}, explorer, and right on time, because I aired your room this mornin' and only the fish smell came back, which is half the rent's worth of fresh air." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word off the boat is somebody caught you in a fib, explorer, and in this port a rumour gets round faster than one of Captain Argo's sea-monster stories, so I'd lie low a while and keep your tab paid." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody sat at the bar tonight grinning about somethin' you'd said, explorer, and good moods sell stew, so come in and say something nice to me too, honey, it's good for business." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Oh, you've been drinking with Captain Argo, I can tell! Sit down before the floor comes up to meet you, honey, because it does that here, and broken chairs go on the bill." },
  },

  start = "hello",
  nodes = {
    -- Deeds pass: the sea monster the player killed for Argo.
    dd_monster = {
      lines = { { id = "dm_default", text = "Good for business? Honey, folks come off the Tanaris boat just to gawk at the ugly thing, and then they need a drink, and then a bed. I've been thinkin' about chargin' Argo rent for the view." } },
      choices = {
        { text = "You should cut me in. I killed it.", next = "BACK", fx = { trait = { greedy = 1 } },
          reply = "Ha! I like you, explorer, but I like my margins more. I'll tell every customer it was you, though, and in this port that's worth more than coin." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_monster", tags = { "news" }, when = { questDone = TODO_QUEST("The Monster Surfaces") },
          text = "You're the one who put that sea monster's head on Argo's stern! He's bought drinks for the whole bar three nights runnin', honey, and I'm not complainin', because he drinks on account and I charge interest." },
        { id = "h_dd_stew", when = { questDone = TODO_QUEST("A Taste of the Sea") },
          text = "Fimbo's been sellin' seafood stew at two silver a bowl since you brought him those murloc eyes, and half my supper trade's gone across the dock. I'm not sore, explorer, I'm just keepin' a list." },
        { id = "h_default", key = true, text = "Zizplink, innkeeper, at your service and at very fair rates! Beds upstairs, food down here, and everybody off the Tanaris boat comes through that door, so you hear things, explorer, and a good rumour's worth more than a bed." },
        { id = "h_list", tags = { "news" }, when = { questActive = TODO_QUEST("Zizplink's Grocery List") },
          text = "You've got my list! Don't lose it, explorer, and don't read it out loud, because some of those are for Fimbo's cafe, and he's sensitive about his budget." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, back from the fields! Sit down, explorer, the stew's hot and the chairs are sturdy, mostly, and if one breaks under you, we'll talk." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! We don't get many of you down here, explorer, because the Brotherhood's knights mostly stay up at their keep and drink their own ale, which is a terrible loss of custom." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "Oh, a hunter, and a pet! Your friend can sleep by the fire, explorer, for a small fee, so long as it leaves the kitchen's fish alone." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! I didn't hear you come in, explorer, and I hear everything, so that's a real talent, and talents like that could make somebody a lot of money." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, all the way from Stormwind, I'd guess! Sit, honey, sit, because the Brotherhood boys at the bar could use a kind word, and they drink more when they're cheered up." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest, off the Tanaris boat? Welcome, explorer, the inn's neutral, and so's the stew, and so's the price." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you smell the sea in here? Course you can, honey, everybody can, and the spirits must love it, so tell 'em the rooms are cheap." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! If you can conjure water, explorer, we can talk about a room for a barrel, because the well's gone brackish again and Melbin won't pay to fix it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Oh my, a warlock, and your little friend too. Welcome, explorer, but the little one sleeps outside, and that's a house rule I just made and I'll be charging for." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Please don't turn into anything in the dining room, explorer, because Captain Argo gets confused enough as it is, and he never pays for what he breaks." },
      },
      again = { { id = "h_again", text = "Anything else, explorer? Ask away, honey, the questions are free and the soup is not." }, { id = "h_again2", text = "More? I'll top you up while you think, and I'll only charge you for half." } },
      choices = {
        { text = "Argo's new figurehead seems good for business.", next = "dd_monster", when = { questDone = TODO_QUEST("The Monster Surfaces") } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "You must hear plenty, running an inn.", next = "gossip" },
        { text = "The one at the bar looks grumpy.", next = "gray" },
        { text = "Who owns this port, anyway?", next = "melbin" },
        { text = "What do the fighters talk about at the bar?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why don't the knights come down to the port?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the trappers say about the wilds?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What's the quietest rumor you've heard lately?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Who here needs a kind word most?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What do the sailors say about the sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your well's gone brackish, by the taste of it.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why does my companion have to sleep outside?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Seen any strange beasts on the coast?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How did you end up running the inn here?", next = "origin" },
        { text = "Goodbye.", next = "END" },
      },
    },
    gossip = {
      lines = {
        { id = "gs_default", text = "Plenty, honey! Most of it's Argo's, so most of it's sea monsters, but sit a while, have a bowl, and the true bits come round eventually." },
        -- Opinion pass: what the port has heard the player say.
        { id = "gs_o_cartel_cut", once = true, when = { gossip = { topic = "steamwheedle", stance = "distrust" } },
          text = "Well, explorer, the whole port's heard you told Melbin to cut the Cartel loose! He's been strutting about all week, and the Cartel's man has been writing things down in a very small book." },
        { id = "gs_o_cartel_pay", once = true, when = { gossip = { topic = "steamwheedle", stance = "trust" } },
          text = "Word is you told Melbin the Cartel's worth every copper. He's been sulking over his ledger ever since, honey, so I'd keep out of his way for a day or two." },
        { id = "gs_o_demar", once = true, when = { gossip = { topic = "rg_demar", stance = "bitter" } },
          text = "Gray says you think the Knight Commander's grief has got the better of him. He's not wrong to tell me, and you're not wrong to think it, but I'd not say it up at the keep." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gray = {
      lines = { { id = "gr_default", text = "That's Gray Dawnbright, honey, a Brotherhood rider. He comes down from the keep, drinks, grumbles, tips well and goes back up again, and a good tipper gets his own chair, so don't sit in it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
    },
    melbin = {
      lines = { { id = "m_default", text = "Melbin Powderfuse owns the land, or so he says, explorer. I own the stew pot and the good blankets, and I never once let him forget it, especially on rent day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Who hit who, mostly, and who's paying for the next round, which is the important bit. The Brotherhood boys tell the same siege stories every night and the Horde ones off the boat tell theirs, and somehow they never sit at the same table, which is lovely, because I sell twice the ale." },
      },
      choices = {
        { text = "Maybe one day they'll share a table.", next = "BACK", reply = "Maybe, honey, and I'll be the one charging for the table. Until then, I'll keep 'em at opposite ends.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better they don't. Some grudges are earned.", next = "BACK", reply = "Some are, sweetie, and I've seen 'em earned right here at my bar. I keep a mop handy for that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Oh, Melbin's prices, and their Commander, who thinks goblins are only one step up from the Horde, honey. Gray comes down, though, and he's Brotherhood through and through, whatever he says when he's had a few and run up a tab." },
      },
      choices = {
        { text = "Demar's right to be careful. Goblins sell to everyone.", next = "BACK", reply = "Careful's one word for it, honey. Still, I'd be careful of Melbin too, if I didn't own half his tab.", fx = { align = { order = 1 } } },
        { text = "Demar should loosen up. Neighbours matter.", next = "BACK", reply = "That's what I keep telling 'em, honey. Neighbours who drink together don't burn each other's docks.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Big cats in the hills, catfish in the rivers with whiskers like Melbin's, and ogres up north who've started tradin' with the Horde instead of eating them. That last one's my favourite, explorer, because it means more customers." },
      },
      choices = {
        { text = "Hunt only what you need out there.", next = "BACK", reply = "That's the way, sweetie, and the cats won't hold a grudge. Mind the ogres, though.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Everything out there is worth a pelt to someone.", next = "BACK", reply = "Everything's worth somethin', honey, but some of 'em bite back first. Bring me a catfish if you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Ooh, a quiet one? Gray's been writing letters he doesn't send, and Melbin's been counting boat fares twice, once out loud and once under his breath. That's all I'll say, explorer, because gossip's free but I like my customers coming back." },
      },
      choices = {
        { text = "I'll keep that to myself, Zizplink.", next = "BACK", reply = "Good, sweetie, 'cause I like you and I'd hate to stop pouring for you. My lips are as sealed as yours.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Letters he doesn't send? Somebody would pay for those.", next = "BACK", reply = "Somebody would, honey, and that somebody would get a ladle in the ear. Gray's mine to worry about.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Gray, every night, though he'd throw his mug at you for saying so, and I'd charge him for the mug. And Captain Argo, who laughs a little too loud for a man who says he's not frightened of anything." },
      },
      choices = {
        { text = "Then I'll sit with them both tonight.", next = "BACK", reply = "You're a sweetheart, and they'll both pretend not to like it. I'll keep your mug warm.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grown men can carry their own troubles.", next = "BACK", reply = "They can, honey, and they do, badly. Somebody's got to pour.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "That somethin' big lives off the murloc islands, which is Captain Argo's story, so it's probably silly, except his boat came back with teeth marks. I keep the shutters closed on stormy nights, explorer, just in case." },
      },
      choices = {
        { text = "Respect the sea, and it'll leave you be.", next = "BACK", reply = "That's what I tell everybody, sweetie, and the sea's been good to me so far. Mostly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever lives out there, I'll hunt it down.", next = "BACK", reply = "Ooh, brave, honey, and I'll sell tickets. Bring me back a scale for the wall.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "The tide gets into it, honey, because Melbin dug it too close to the shore to save on rope. He says it's a feature, a saltwater well, very fashionable, and I say it makes the tea taste like Argo's boots and costs me customers." },
      },
      choices = {
        { text = "Make Melbin dig a proper well.", next = "BACK", reply = "Make him? Honey, nobody makes Melbin do anything, but I'll tell him you said so, loudly.", fx = { align = { order = 1 } } },
        { text = "I'll conjure you water. Leave Melbin out of it.", next = "BACK", reply = "Aren't you sweet! I'll still bill Melbin for the bad water, though, out of principle.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Because the last guest with a little friend like that let it loose in the pantry, and it ate three silver's worth of cheese, and Fimbo the cook didn't speak to me for a week! I'm sure yours is lovely, explorer, but rules are rules." },
      },
      choices = {
        { text = "Fine, it'll wait outside with the gulls. They'll be fewer by morning.", next = "BACK", reply = "Thank you, sweetie. My pantry thanks you, and so does my cheese.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules made up today don't count.", next = "BACK", reply = "My inn, my rules, honey, and I make 'em up whenever I like. Outside it goes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Murlocs, more than anybody wants, and crabs the size of cartwheels off the islands, and once a turtle so old it had barnacles on its barnacles. Fimbo from the cafe wanted to cook it, and I wouldn't let him, honey, and that's the only meal I ever turned down for free." },
      },
      choices = {
        { text = "Good. Something that old deserves to live.", next = "BACK", reply = "Me too, honey. I fed it a fish once, and it looked at me like it remembered the world being young.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fimbo had the right idea. Turtle soup is good.", next = "BACK", reply = "Don't you dare, sweetie! Fimbo still feels guilty about the last one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin = {
      lines = { { id = "or_default", text = "I was cooking in a galley on the Tanaris run, explorer, and the day the boat first tied up here, Melbin said he needed an innkeeper and I said I needed a kitchen that didn't roll. We shook on it, haggled for a week, and I've not been seasick once since." } },
      choices = {
        { text = "Do you miss the sea?", next = "origin_sea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_sea = {
      lines = { { id = "orb_default", text = "Miss it? I can smell it from every room, honey! But I do miss the stars from a deck at night, and some evenings I sit at the end of the dock and pretend the whole port is rocking." } },
      choices = {
        { text = "A home that stays put is worth a lot.", next = "BACK", reply = "It is, honey, it really is. Stars or no stars, I like waking up where I went to sleep.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have stayed on the boat and kept moving.", next = "BACK", reply = "Moving's fun till the hull leaks, sweetie. I'll take my leaky well over a leaky boat.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everybody off the Tanaris boat comes through that door with a story, and half of 'em pay for their bed in gossip! Ask, explorer, and I'll tell you everything I've heard." },
    },
    background = { { id = "tp_bg", text = "I ran a kitchen, then a galley, and now an inn, honey, and every step was a bigger pot and a bigger profit." } },
    advice = { { id = "tp_ad", text = "Breathe through your mouth on the docks at low tide, explorer, and never let Melbin hold your coin purse." } },
    powderfuse_port = { { id = "tp_port", text = "Best little port on the coast, honey! It's the only little port on the coast, but that still counts, and the rent says so." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The Tanaris boat brings news from Gadgetzan every week, and it's always the same news. Too much sand, too many scorpids, and not enough water." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a fine place for an explorer, full of pirates and trouble. I'd send you there, but you'd come back with fewer coins and more stories." } },
    theramore = { { id = "tp_theramore", text = "Theramore's a nice little town on the coast of Dustwallow, and Lady Proudmoore keeps it tidy. I hear they don't care much for goblins, though." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a good port for anyone heading into the Barrens, explorer. The beer's warm and the sharks are hungry, so watch your toes." } },
    _none = { { id = "tp_none", text = "Never heard of it, explorer! Ask me tomorrow, though, because somebody'll have told me by then over a bowl of stew." } },
  },
}

P:NPC {
  key = "gray", id = TODO_NPC("Gray Dawnbright"), name = "Gray Dawnbright",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port", "brotherhood_horse" }, temper = { "surly" }, values = { "loyal" },
  notices = { "standing", "drink" },

  impression = {
    first = "Something is eating at him that drink isn't fixing.",
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
      lines = { { id = "xdsham_default", text = "Not unless your spirits can tell me whether to go back up to the keep. If they're busy, ask Zizplink to fill this mug." } },
      choices = {
        { text = "Go back to the Brotherhood and face it.", next = "BACK", reply = "Face it? You make it sound easy, friend. Maybe after one more drink.", fx = { align = { honor = 1 } } },
        { text = "Drink, then. The Brotherhood can wait.", next = "BACK", reply = "That's the best advice I've had all week. Zizplink, another!", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Deeds pass: Marshal Ryan's death, heard at the port.
    dd_ryan = {
      lines = { { id = "dr_default", text = "Then you saw more than I did; I was down here drinking when he rode west. He was the best of us, the only one who could make Demar laugh, and the Hammer got him anyway. Did he say anything about the keep?" } },
      choices = {
        { text = "He asked me to carry his crest to Demar.", next = "dd_ryan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_ryan2 = {
      lines = { { id = "dr2_default", text = "That sounds like him: duty to the last, and never a word for himself. Maybe I ought to go up and look at that crest on the wall, though I'm not sure I've earned the right." } },
      choices = {
        { text = "Go up. He'd want you back with the Brotherhood.", next = "BACK", reply = "Maybe. Pour me one more, and then maybe.", fx = { align = { order = 1 } } },
        { text = "You owe them nothing. Stay here if you like.", next = "BACK", reply = "That's what I keep telling myself, and it sounds no better coming from you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ryan", tags = { "news" }, when = { questDone = TODO_QUEST("Dying Wish") },
          text = "Word came down from the keep that Ryan's dead, and that you were with him at the end. I rode beside him, back when I still rode, so sit down and tell me he didn't go easy, because he'd have hated that." },
        { id = "h_dd_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") },
          text = "So you killed Mugg. Demar's been after that ogre since before I left the keep, and now a stranger walks in and does it in a week, which tells you everything about Stormwind's idea of reinforcements." },
        { id = "h_default", key = true, text = "Gray Dawnbright, Brotherhood of the Horse, on leave from it, or it's on leave from me; I haven't decided. Make yourself useful and get Zizplink, the innkeeper, to fill this." },
        { id = "h_resolved", tags = { "news" }, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "I went up to the keep and sat with Demar. We didn't talk about Fern, not really; we drank to her, alive or not, and that's the first time in years." },
        { id = "h_soured", when = { thread = { id = "farholde_lost", state = "soured" } },
          text = "Don't. Whatever it is, I've heard it." },
        { id = "h_tessa", key = true, when = { metBefore = true }, text = "I wrote Tessa a letter, tore it up and wrote another, and that one's in the stew, I think. Don't eat the stew." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Sir Howard, who led our charge at the siege, was one of you, and the last thing I need tonight is reminding of him, so sit if you're sitting." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. If that animal drinks out of my mug, you're buying the next one." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You've got the walk. Fern Crimsonleaf, our old agent, had that walk, so don't do it in here, please; it makes me look up." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you're here to save my soul, it's at the bottom of this mug, so you'll have to wait your turn." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Can you turn water into ale? No? Then what good are you?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Whatever that thing is, it's looking at my drink, so tell it to stop." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Turn into a bear and frighten Zizplink into giving me credit, and I'll love you forever." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Great. Can your spirits fetch me a drink, or are they as useless as the rest of Powderfuse?" },
      },
      again = { { id = "h_again", text = "Still here? Fine, then, talk." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "I was with Marshal Ryan when he died.", next = "dd_ryan", when = { questDone = TODO_QUEST("Dying Wish") } },
        { text = "Why aren't you up at the keep?", next = "keep" },
        { text = "Tell me about the Brotherhood.", next = "brotherhood" },
        { text = "Who's Tessa?", next = "tessa", when = { heardLine = "gray.h_tessa" } },
        { text = "Fern Crimsonleaf. Did you know her?", next = "fern", when = { topicKnown = "fern_crimsonleaf" } },
        { text = "I spoke to Demar about Fern.", next = "fern_word",
          when = { thread = { id = "farholde_lost", beat = "b4_demar", state = { "stirring", "unfolding" } } } },
        { text = "Buy you a drink?", next = "drink" },
        { text = "You hold a tankard like a man who held a shield.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Tell me about Howard.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did the Brotherhood ever ride with hunters?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You knew Fern's walk?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "There's more than ale at the bottom of that mug, Gray.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did the Brotherhood ever ride with mages?", next = "xmage", when = { class = "MAGE" } },
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
      choices = {
        { text = "Is he right about Stormwind?", next = "kd_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Opinion pass: Gray asks the player about Stormwind, and about Demar.
    kd_ask = {
      big = true,
      lines = { { id = "kq_default", text = "You tell me. You've been to the capital, I'd wager, and I haven't in years; is it full of cowards, the way the Commander says, or just folk with troubles of their own?" } },
      choices = {
        { text = "Cowards. They left you all here to die.", next = "kd_ask_cowards", fx = { opinion = { stormwind = "abandoned_its_own" }, align = { order = -1 } } },
        { text = "Just people. Stormwind had its own wars to fight.", next = "kd_ask_people", fx = { opinion = { stormwind = "patience" }, align = { order = 1 } } },
        { text = "Demar's grief talks louder than his sense.", next = "kd_ask_grief", fx = { opinion = { rg_demar = "bitter" }, trait = { kind = 1 } } },
        { text = "I'd rather not drink to either answer.", next = "BACK" },
      },
    },
    kd_ask_cowards = {
      lines = { { id = "kqc_default", text = "There, you see, you'd fit right in up at the keep. Say it to the Commander and he'll pour you a drink himself, which he's never once done for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kd_ask_people = {
      lines = { { id = "kqp_default", text = "That's what I tell myself, on the nights I miss home. Then I go back up to the keep, look at those memorials, and stop believing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kd_ask_grief = {
      lines = { { id = "kqg_default", text = "Careful. He's earned his grief, every name of it, and I'll not hear him run down in a goblin's tavern. You're not wrong, mind, but you're not allowed to be right about it down here." } },
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
        { text = "He died well, and you saw it. Someone should.", next = "BACK", reply = "Somebody should, and I did, and I can't stop seeing it. Thank you, though.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dying well is still dying, Gray.", next = "BACK", reply = "It is, and that's what nobody says at the memorial. You're the first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Rosalind Ashwood, best scout we ever had; she could spot a cultist in fog that would hide a castle. She's on the stone now, and she'd be ashamed of what passes for scouting these days, so don't you go telling her." },
      },
      choices = {
        { text = "I'll scout for the Brotherhood, in her memory.", next = "BACK", reply = "She'd like that, Rosalind would. She always said the Brotherhood needed more eyes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Scouting's for the living. Let the stone rest.", next = "BACK", reply = "Maybe the stone can rest, but I can't. Not yet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Everyone in the Brotherhood knew it, because she'd be standing behind you before you heard a thing. Ravenholdt trained her, and they don't train people who die easy, which is all I'll say till you buy me another." },
      },
      choices = {
        { text = "Some people are hard to kill. Maybe she is.", next = "BACK", reply = "Maybe she is, and maybe she's out there somewhere, watching me drink. I'd like to think so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Everyone dies, Gray. Even the good ones.", next = "BACK", reply = "They do, I know they do. I just keep forgetting, and then I remember.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Ale, mostly, and under that more ale, and under that a lot of names on a stone up the hill. If you want to pray for something, pray Zizplink doesn't cut me off." },
      },
      choices = {
        { text = "I'll pray for you, and for the names.", next = "BACK", reply = "Thank you. The names will like it, and maybe I will, eventually.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then drink. Grief has to go somewhere.", next = "BACK", reply = "It does, and mine goes here, every night. Zizplink keeps the tab.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Alden Amberhall, Ashe's father, the only one of the charge who rode back through that gate. He threw fire like he was angry at it, and the Horde camp was burning before Howard's lances reached it." },
      },
      choices = {
        { text = "He rode back. That's its own kind of courage.", next = "BACK", reply = "It is, and Alden knows it, even if he won't say so. Thank you for seeing it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire wins wars. Courage only fills the memorials.", next = "BACK", reply = "Maybe it does, but I'd still rather have courage in the ground than fire in my mug. Leave me be.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Bother me? Nothing bothers me tonight, friend; that's the whole point of the mug. But if it touches my drink, I'll introduce it to the floor, demon or no." },
      },
      choices = {
        { text = "It'll keep its claws off your mug, Gray.", next = "BACK", reply = "Good. Then we'll get along fine, friend, and so will the mug.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Try it, Gray. See how that goes.", next = "BACK", reply = "I've had worse nights, friend. Go on, then, if it'll make you feel better.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Because she's got a tab with my name on it as long as the dock, and a bear would make a fine argument for forgetting it. I'm joking, mostly; she's the only one in this port who'd carry me home." },
      },
      choices = {
        { text = "Pay your tab, Gray. She deserves it.", next = "BACK", reply = "I will, I will, one day. When the names stop following me home.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll be the bear. Let's see her face.", next = "BACK", reply = "Ha! Please do. I'd pay to see it, if I could pay anything.", fx = { align = { honor = -1 } } },
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
    bolvar = { { id = "tp_bolvar", text = "The Regent can rot in his palace, for all I care. He never sent anybody when we needed them, and he won't now." } },
    holy_light = { { id = "tp_holy_light", text = "I used to pray, before. I don't anymore, and I'd thank you to stop asking about it." } },
    second_war = { { id = "tp_second_war", text = "The old war's what the Brotherhood was built for, and look where it got us. Stuck on an island with a drink in my hand." } },
    _none = { { id = "tp_none", text = "Ask somebody sober, and that's not me, not tonight." } },
  },
}

P:NPC {
  key = "jazzle", id = TODO_NPC("Jazzle Cheapshot"), name = "Jazzle Cheapshot",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "brash" }, values = { "greedy", "ambitious" },
  notices = { "class", "form" },

  impression = {
    first = "He looks me over like a poster he hasn't painted yet.",
    third = "{name} met Jazzle Cheapshot, who runs an empty arena at Powderfuse Port and dreams of filling it.",
  },

  greetings = {
    { id = "g_default", text = "No fights today, pal, but soon, very soon, and you can get in on the ground floor!" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Look at the shoulders on you, champ! I can see the poster already, and I can hear the ticket booth ringin'." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear! A talking bear? Could you do that on command, pal, twice a night, maybe with a little hat? Hats sell." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jazzle Cheapshot, and this is my arena! It's empty, yeah, for now, while the Horde and the Alliance are out in the fields killing each other for free. For free, pal, with no ticket sales, no snack cart, nothin'!" },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter with a beast! Two fighters for the price of one ticket, and I can sell that, pal, oh, I can sell that." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Every arena needs a healer by the ring, and the crowd loves a comeback, so you'd be the comeback." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest! Ringside healer, pal, that's the job; somebody's gotta patch them up for round two." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Lightning, earthquakes, a big spirit wolf? That's not a fight, that's a fireworks show, and I want it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Fireballs sell tickets, pal; people love a fireball, especially when it isn't coming at them." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock with a demon! Now that's a headliner: Bring Your Own Monster Night." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've got your poster half-painted already, 'The Bear Who Was a Person', and you'd be perfect." },
      },
      again = { { id = "h_again", text = "What else, champ? Make it quick, I've posters to paint and a crowd to invent." } },
      choices = {
        { text = "When does it open?", next = "open" },
        { text = "I can't think who would even fight here.", next = "fighters" },
        { text = "Put me on the card.", next = "card", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Isn't selling tickets to a fight a bit grim?", next = "grim" },
        { text = "Would a tauren draw a crowd?", next = "xtauren", when = { race = "Tauren" } },
        { text = "Would my pet fight on the card too?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would an arena need a healer?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Is a fight for coin worthy of the elements?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A mage would make quite a show in your arena.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really put a demon in the ring?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do I get any say in my own poster?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    open = {
      lines = { { id = "o_default", text = "When I've got fighters, a crowd, and Melbin off my back about the rent, so soon, pal. Goblin soon, which means as soon as somebody pays a deposit!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fighters = {
      lines = { { id = "f_default", text = "Ogres, if the Bolder'ok clan'll sign, and Brotherhood knights, if they'd stop bein' so noble about it. Pirates, if I can get 'em to fight one at a time, and you, champ, if you've got a gimmick." } },
      choices = {
        { text = "A gimmick?", next = "gimmick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gimmick = {
      lines = { { id = "gm_default", text = "Everybody needs one, pal! 'The Bear Who Was a Person', say, or 'The Gnome With the Big Hammer', so think on it, and come back with a name I can sell." } },
      choices = {
        { text = "'The One Who Gets On With It.'", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'll pass.", next = "BACK" },
      },
    },
    card = {
      lines = { { id = "c_default", text = "Opening night, top of the bill, champ! There's no opening night yet, but you're on it, and that's a promise from a promoter, which is worth exactly what you think it is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    grim = {
      lines = { { id = "gr_default", text = "Grim? It's the same fighting with a roof and a snack cart, pal, so I'm civilizing it, and I'm charging admission for the civilization." } },
      choices = {
        { text = "Selling seats to a bloodbath isn't civilizing it, Jazzle.", next = "BACK", reply = "Ouch, pal, that one stung. But the seats are padded, and nobody's dying who didn't sign the contract.", fx = { align = { honor = 1 }, trait = { skeptical = 1 } } },
        { text = "Fair point, actually.", next = "BACK", reply = "Thank you! Finally somebody sees the vision, pal, and I can tell you got an eye for business.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "My companion fights to survive, not for a crowd.", next = "BACK", reply = "Sure, pal, survival's a fine motive. If it ever wants an audience, you know where to find me.", fx = { align = { honor = 1 } } },
        { text = "Book it. My pet loves an audience.", next = "BACK", reply = "That's what I like to hear! I'll put your pet's name on the poster in big letters.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Because a dead fighter fights once, pal, and a healed fighter fights every week! That's not cruelty, that's repeat business." },
      },
      choices = {
        { text = "I'll heal them, but I won't help you profit.", next = "BACK", reply = "Fine by me, pal. You heal 'em, I sell the tickets, and we'll never talk about the books.", fx = { align = { light = 1 } } },
        { text = "Repeat business keeps fighters paid. I'll take your coin.", next = "BACK", reply = "Now that's a professional! Healing's an investment, and I always pay my investors.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Worthy? Pal, the Horde and the Alliance are out in those fields throwing lightning at each other for nothing! I'm offering the elements a roof, a crowd and a cut, and they've never had a better deal." },
      },
      choices = {
        { text = "The elements aren't for sale, Jazzle.", next = "BACK", reply = "They're not, huh? Shame, 'cause I had a great poster planned. Lightning nights, two silver a seat.", fx = { align = { light = 1 } } },
        { text = "A cut for the elements? Now you're talking.", next = "BACK", reply = "You and me, pal, we're gonna be very rich. The elements get fifteen percent, and not a copper more.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Big and loud, that's all I ask! Blink around, freeze the other guy, set a little fire, but nothing near the snack cart, because Fimbo from the cafe is catering and he's very sensitive." },
      },
      choices = {
        { text = "I'll fight fair, with no tricks for the crowd.", next = "BACK", reply = "No tricks? Pal, the crowd loves tricks, but fine, I'll bill it as an honest fight and charge extra for the novelty.", fx = { align = { honor = 1 } } },
        { text = "I'll give them a show they'll never forget.", next = "BACK", reply = "That's the spirit! Big, loud, unforgettable, and nobody sues. You're on the card, pal.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Really, really! Under supervision, with a fence, a waiver, and a goblin standing well back with a bucket. The crowd's gonna scream, pal, and screaming is the best sound a ticket booth ever hears." },
      },
      choices = {
        { text = "Demons aren't entertainment. Forget it.", next = "BACK", reply = "Not entertainment, {g:he|she} says, and then walks around with one on a leash. Suit yourself, pal.", fx = { align = { light = 1 } } },
        { text = "Build the fence high. We'll be there, and hungry.", next = "BACK", reply = "Higher than high, pal, and I'll be standing behind it with a very long pole. Thursday night, top of the card.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "A say? Sure, pal, you can say whatever you like, and then I'll paint the poster. 'The Bear Who Was a Person' tested great with the dockhands; very dignified." },
      },
      choices = {
        { text = "My shapes aren't a gimmick for your posters.", next = "BACK", reply = "A gimmick? Pal, everything's a gimmick if you sell it right, but okay, okay, no poster.", fx = { align = { honor = 1 } } },
        { text = "Paint it bigger, and give the bear a hat.", next = "BACK", reply = "A hat! Why didn't I think of a hat? You're a natural, pal, a real natural.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a promoter, born one. Some goblins come out with a silver tongue; mine came with a ticket booth." } },
    advice = { { id = "tp_ad", text = "Every fight's a show. Win it pretty and somebody'll pay to watch the next one." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Gurubashi Arena's the gold standard, pal, and I'm building the next one right here. No fights yet, but they're coming, and you could be the first." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's crowds would kill for a show like mine, and some of them would kill in it. That's what makes it a good show." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got its own fights, but they're small time. I'm thinking bigger, pal, much bigger." } },
    thrall = { { id = "tp_thrall", text = "The orcs fight for free out in the fields every day, and that's money walking out the door. I'd put them in the ring and sell tickets." } },
    _none = { { id = "tp_none", text = "Can it fight? If it can't, I don't book it." } },
  },
}

P:NPC {
  key = "fimbo", id = TODO_NPC("Fimbo Greasemitz"), name = "Fimbo Greasemitz",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "dramatic" }, values = { "curious" },
  notices = { "craft" },

  impression = {
    first = "One new ingredient would make him weep with joy.",
    third = "{name} met Fimbo Greasemitz, who keeps a cafe on the water at Powderfuse Port and is bored of his own menu.",
  },

  greetings = {
    { id = "g_default", text = "Table for one, buddy? Every table's for one, since nobody eats here in pairs, and the chowder's only got the one bone in it this week, which I'm calling a special." },
    { id = "g_menu", text = "It's boar or fish, buddy, same as yesterday, same as forever, and same price, so at least it's consistent." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Finally, somebody who'll understand my sufferin', and maybe split the cost of a peppercorn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fimbo Greasemitz, and welcome to my cafe on the water, buddy! Today we have roast boar and roast fish, and tomorrow, roast boar and roast fish, and I'm dyin' inside, but the prices are very reasonable." },
        { id = "h_stew", tags = { "news" }, when = { questActive = TODO_QUEST("A Taste of the Sea") },
          text = "For the stew I need murloc eyes and crab meat off the beaches, buddy. The eyes go in the pan fast, that's the secret, because it keeps the sea in 'em." },
        { id = "h_stew_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("A Taste of the Sea"), days = 3 } },
          text = "Seafood stew, on the menu, at two silver a bowl! Three customers tried it and two came back, which is the best return this cafe has ever done." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A fighter! You look hungry, buddy, and hungry is my favourite kind of customer, because hungry doesn't haggle. Boar or fish? I already know your answer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Do you bless food, buddy? Because my boar could use a miracle, and I can't afford a priest." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Please, please tell me you've brought somethin' that isn't boar, because I'll pay good coin for it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You snuck up on my kitchen, buddy! Good, I like a customer who doesn't knock over the pans, because pans cost money." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Say grace over my roast, would you, buddy? It's the only thing that'll make it taste different, and I'd put it on the menu as a blessed special." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A priest off the Horde boat! Do your people say grace? Say it, please, buddy, because the boar needs all the help it can get and I need the repeat business." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can the spirits make a fish taste like somethin' other than fish? I'd pay, buddy, I'd pay a lot." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you conjure food? Don't answer, buddy, because if you can, I'm out of business, and I've still got a loan on the stove." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Does your little friend eat? Please say it eats, buddy, because I've got so much boar and nobody to sell it to." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You know herbs, wild ones, out of the glades, and herbs are worth their weight in silver to a cook like me, so please tell me you know herbs." },
      },
      again = { { id = "h_again", text = "What else, buddy? The pot's on, so I can talk, and talkin' is cheaper than eating." } },
      choices = {
        { text = "Why not cook something else?", next = "menu" },
        { text = "Murloc eyes? Really?", next = "eyes" },
        { text = "You must get all sorts eating here.", next = "customers" },
        { text = "Trade recipes?", next = "recipes", when = { profession = "Cooking" } },
        { text = "Darkspear cooks use a lot more pepper.", next = "xtroll", when = { race = "Troll" } },
        { text = "What should a warrior eat before a fight?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could the Light help your cooking?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you cook, if I brought you game?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You must have a secret ingredient or two.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'd guess you feed people who can't pay.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Do you thank the sea for its fish?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why fear conjured food, Fimbo?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really feed my demon, Fimbo?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What herbs are you looking for?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Goodbye, Fimbo.", next = "END" },
      },
    },
    menu = {
      lines = { { id = "m_default", text = "Because boars walk up to the door and fish jump in the pot, and both of 'em are free, buddy! Everything else costs money and imagination, and I've only got the imagination." } },
      choices = {
        { text = "What would you cook, if you could?", next = "menu_dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menu_dream = {
      lines = { { id = "md_default", text = "A stew so good the Brotherhood and the Horde sit at the same table to eat it, and pay full price for the privilege. They'd fight over seconds, sure, buddy, but at the same table!" } },
      choices = {
        { text = "I'd eat that.", next = "BACK", fx = { affinity = 2, opinion = { peace = "for" } } },
        { text = "They'd fight over the table first.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "Really, buddy! Crunchy outside, salty inside, like the sea gave you a little kiss, a wet, crunchy kiss, and it costs me nothin' but a walk on the beach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "Sailors, goblins, Gray from the Brotherhood when Zizplink at the inn cuts him off, and Captain Argo, who'll eat anything you raise a toast to and never asks the price, bless him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recipes = {
      lines = { { id = "r_default", text = "Yes! Give me somethin' with a sauce, buddy, anything with a sauce, and I'll give you the boar, as a straight trade. You'll never need another boar recipe as long as you live." } },
      choices = { { text = "Deal.", next = "BACK", fx = { affinity = 2 } } },
    },
    xtroll = {
      lines = { { id = "xtr_default", text = "Pepper! Real pepper, the hot kind? I haven't seen a peppercorn since the last Tanaris boat, buddy, and that one cost me a week's takings and went into the stew before anyone could stop me." } },
      choices = {
        { text = "I'll bring you some next time.", next = "BACK", fx = { affinity = 2 } },
        { text = "What would you cook with it?", next = "menu" },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Boar, because it's always boar, but cooked slow overnight with river onions so it sits in you like a brick and keeps you standing, and it's cheap, buddy. The Brotherhood boys eat it before patrols, and they've never once complained, at least not to my face." },
      },
      choices = {
        { text = "Plain food for plain work. That's how it should be.", next = "BACK", reply = "That's what I keep sayin', buddy! Plain food, full bellies, and nobody complains till payday.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bland food makes bland fighters. Spice it up.", next = "BACK", reply = "Spice it up, {g:he|she} says, like I'm made of pepper! Okay, buddy, I'll throw in a little somethin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Maybe! Sister Rowland sends a lad down for my broth sometimes, and they tell me the sick up at the keep ask for it by name, which is the best advertising I ever got for free. I'd like to think that's my seasoning, buddy, but I'd take a blessing too." },
      },
      choices = {
        { text = "Your broth is a blessing all its own.", next = "BACK", reply = "Aw, shucks, buddy, you're gonna make me blush. I'll send the next pot up with a little extra.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's skill, not miracles. Take the credit.", next = "BACK", reply = "Skill, huh? I'll take that, buddy, and I'll tell Melbin it was a miracle anyway. Costs more that way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Venison with juniper, river duck in a salt crust, or a big cat from the hills, if they're edible, which nobody's told me. Anything with a new taste, buddy, and I'll cook it so well you'll cry, and then you'll pay." },
      },
      choices = {
        { text = "I'll bring game, hunted fair and clean.", next = "BACK", reply = "Fair and clean, that's how the best meat comes in, buddy. Bring it by and I'll show you what I can do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring whatever I catch, however I catch it.", next = "BACK", reply = "However you catch it, buddy, I'll cook it, so long as it ain't still twitching.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "One, and I'll tell you because you look like you can keep it, buddy: a splash of Captain Argo's rum in every stew. That's why the stew's good, and it means Argo buys his own rum back from me in every bowl, at a markup." },
      },
      choices = {
        { text = "You should tell Argo. It's his rum.", next = "BACK", reply = "Tell Argo? He'd want a cut of the stew, buddy, and he'd drink it before it hit the pot.", fx = { align = { honor = 1 } } },
        { text = "Clever. I won't say a word.", next = "BACK", reply = "You're a pal, buddy! Argo's rum is half the flavour and none of the bill, so mum's the word.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Every day, the stew nobody bought by closing. Melbin says it's bad business, so I tell him it's spoiled and write it off, and give it to the dockhands, and they've never once got sick from it." },
      },
      choices = {
        { text = "That's kindness, Fimbo. Keep doing it.", next = "BACK", reply = "Thanks, buddy. Melbin will grumble, but Melbin always grumbles.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Melbin's right. Charge them something.", next = "BACK", reply = "Charge 'em what, buddy? They ain't got nothin'. Melbin can grumble all he likes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Thank it? I've thanked it, cursed it, sung to it, and once threw a whole boar in as a trade, buddy, and it still sends me the same fish every mornin'. If you can talk it round, I'll name a soup after you." },
      },
      choices = {
        { text = "The sea gives what it gives. Be grateful.", next = "BACK", reply = "Grateful, sure, buddy, but grateful don't fill the pot. I'll keep singin' to it anyway.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bargain harder. Even the sea can be talked round.", next = "BACK", reply = "Now you're talkin' like a goblin, buddy! I'll try a better offer next time, maybe two boars.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Because it tastes of nothing, buddy! It fills you up and leaves your tongue lonely, and if people start eating air-bread, nobody will ever pay a cook again, and then where will I be?" },
      },
      choices = {
        { text = "Conjured bread feeds the hungry. That matters more.", next = "BACK", reply = "Feeds 'em, sure, buddy, and leaves 'em sad. I'll take your point, though, and make the soup better.", fx = { align = { order = 1 } } },
        { text = "Agreed. Conjured bread tastes like wet parchment.", next = "BACK", reply = "Thank you, buddy! Somebody's got to stand up for flavour around here.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Would I! Boar, fish, yesterday's boar, last week's fish, whatever it likes, buddy. Does it eat bones? Please say it eats bones, because I've got barrels of bones and nobody buying." },
      },
      choices = {
        { text = "Keep your scraps for the dockhands, Fimbo.", next = "BACK", reply = "Fine, buddy, fine, the dockhands get the scraps. Your little friend can sniff the steam, at least.", fx = { align = { light = 1 } } },
        { text = "It eats things you'd rather not know about.", next = "BACK", reply = "Then I'll keep my kitchen door locked, buddy, and you can keep the details to yourself.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Wild thyme, sage, anything green that isn't seaweed, and I'd pay by the bunch. The glades are full of it, buddy, but the Brotherhood says the woods are dangerous, and the Horde says the same, and I'm a cook, not a fighter." },
      },
      choices = {
        { text = "I'll gather some, and only what grows back.", next = "BACK", reply = "Only what grows back, that's the right way, buddy. The glades'll thank you, and so will my stew.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll strip a few patches. The glades have plenty.", next = "BACK", reply = "Strip a few, huh? Okay, buddy, but if the thyme stops growin', I know who to blame.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A cook, always a cook, buddy. This cafe's the first kitchen that's mine, paid off nearly, and it's on the water, which counts as floating." } },
    advice = { { id = "tp_ad", text = "Murloc eyes go in last, buddy. Everything goes in before the murloc eyes, including the bill." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best seafood in the world, and I've had to settle for boar and fish every single day. One week in Booty Bay, that's all I ask." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got nothing but scorpid meat and cactus, and it's the only place in the world where my cooking would look exotic. I'm not going." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's got good fish too, but they're the same fish I've got. I want something new, pal, something nobody's ever cooked before." } },
    _none = { { id = "tp_none", text = "Is it a recipe? If it isn't, buddy, it's wasted on me." } },
  },
}

P:NPC {
  key = "argo", id = TODO_NPC("Argo Brinewhistle"), name = "Argo Brinewhistle",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "jovial" }, values = { "brave", "generous" },
  notices = { "drink", "craft" },

  impression = {
    first = "Drunk or not, there is a real sailor's nerve in him.",
    third = "{name} met Argo Brinewhistle, a hard-drinking captain at Powderfuse Port with a sea monster problem.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy, matey! *hic* Pull up a crate, and the crate's free, which is more than I can say for the rum." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're keepin' up, and nobody keeps up! Have another, matey, have mine, and I'll put it on Zizplink's tab." },
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Good, matey, then you know there's things in this water bigger than your pole and a lot more expensive to replace." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Argo Brinewhistle, captain of the finest boat in the port, matey. *hic* Well, the finest boat with a monster problem, which is the only kind of boat I can afford." },
        { id = "h_monster", tags = { "news" }, when = { questActive = TODO_QUEST("The Monster Surfaces") },
          text = "Drop the bait by the fresh wreckage off the murloc islands, matey, not here, out there! When the monster comes up, you take its head for my stern, and I'll pay in rum till you can't stand." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Monster Surfaces"), days = 3 } },
          text = "Look at 'er, up on my stern! Ugliest, finest figurehead on the whole coast, worth more than the boat, and drinks are on me, again, matey." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A fighter! *hic* You've got the arms for a harpoon, matey, and I've got a harpoon, slightly used, so that's fate, that is." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! *hic* Bless my boat, would you, matey? She's leaky, but she's got a good heart and a very reasonable mooring fee." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Ever hunted somethin' with more teeth than a shark's grandmother? *hic* I have, matey, and I'm doing it now, on credit." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Whoa, whoa! *hic* Don't sneak up on a sailor, matey, because we throw things, and then we charge you for 'em." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! *hic* Come to save my soul? It's pickled, matey, and probably mortgaged, but you're welcome to try." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A Horde priest on my dock! *hic* Never mind, matey, the monster doesn't care who's who, and neither do I, so long as you tip." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you freeze the sea? *hic* Just a bit, matey, just round my boat? I'd pay you in fish." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that a demon? *hic* Can it swim? Because I've got a job for somethin' that swims and bites, matey, and the pay's rum." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! *hic* Turn into a seal and go have a look at my monster for me, would you, matey? I'll make it worth your while, somehow." },
      },
      again = { { id = "h_again", text = "What else can I do for you, matey? *hic* Speak up, the rum's wearin' off and that costs money." } },
      choices = {
        { text = "What kind of monster?", next = "monster" },
        { text = "Are you ever sober?", next = "sober" },
        { text = "Tell me about your boat.", next = "boat" },
        { text = "I fish these waters too.", next = "fish", when = { profession = "Fishing" } },
        { text = "The sea spirits around here aren't happy, Argo.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "A harpoon ought to kill your monster.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why does your boat need a blessing?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you hunt a sea monster?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Someone must have tried to steal your boat.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why is your soul pickled, Argo?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Why would you want the sea frozen?", next = "xmage", when = { class = "MAGE" } },
        { text = "What job would you give my demon, Argo?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Where would I find your monster?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Cheers, Argo.", next = "END" },
      },
    },
    monster = {
      lines = { { id = "m_default", text = "Big, with teeth, and more teeth than that, matey. It sank three boats I know of, and one I made up to scare Gritta, who sells the bait, into lowerin' her chum prices." } },
      choices = {
        { text = "Which one did you make up?", next = "monster_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monster_lie = {
      lines = { { id = "ml_default", text = "Ha! Wouldn't you like to know, matey? *hic* The third, or maybe the second, but I've only paid for one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    sober = {
      lines = { { id = "s_default", text = "Once, matey, and I didn't care for it, because everything was so clear, and I could see my debts." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    boat = {
      lines = { { id = "b_default", text = "Little, leaky and loyal, like me, matey! She's never sunk, though she's thought about it, and she's paid for, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = { { id = "f_default", text = "Then stay off the murloc islands at dusk, matey, because that's when it feeds, and not on fish, on fishermen, and fishermen are expensive to replace." } },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "Not happy? *hic* Well, neither's the monster, and neither am I, so that's all of us, matey. You tell those spirits that Argo Brinewhistle tips a drop overboard every night, and you won't find another sailor in port who does, and at these prices that's generous." } },
      choices = {
        { text = "They'd like you sober.", next = "sober" },
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Kill it? *hic* No, matey, but it'd make it very cross, and a cross monster comes up to see who did it. That's when you take its head for my stern, and I'll steer, and scream." },
      },
      choices = {
        { text = "Face to face, a fair fight. That's my way.", next = "BACK", reply = "Fair fight with a sea monster, matey? *hic* You're braver than me, or drunker, and that's sayin' somethin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bait it, trap it, then strike. No fair fights.", next = "BACK", reply = "Now that's a plan, matey, and a sober one too, which makes one of us. *hic* I'll fetch the bait.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Because she's carried me home drunk more times than I can count, matey, *hic*, and never once charged me for it. A boat like that deserves a blessing more than I do." },
      },
      choices = {
        { text = "Then I'll bless her, and you as well.", next = "BACK", reply = "Bless her and me both, matey? *hic* That's the nicest thing anyone's said to me since the last round.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "She'd do better with a sober captain.", next = "BACK", reply = "A sober captain would sink her in a week, matey, out of sheer boredom. *hic* She likes me as I am.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Same as anything, matey: bait, patience, and a big stick. *hic* Chum by the fresh wreckage, wait for the bubbles, and don't, whatever you do, lean over to look." },
      },
      choices = {
        { text = "Patience and bait. I'll wait it out.", next = "BACK", reply = "That's the way, matey, slow and steady, like a good drink. *hic* I'll wait with you, if you've a flask.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll dive in after it. It's faster.", next = "BACK", reply = "Dive in after it? *hic* I'll write your name on the hull, matey, so they'll know who to mourn.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Steal her? *hic* Who'd want her, matey? Well, a pirate did once, and got as far as the harbour mouth, then bailed for an hour and rowed her back to apologize, and I charged him for the bailing." },
      },
      choices = {
        { text = "He brought her back. Give the man some credit.", next = "BACK", reply = "He did, matey, and I bought him a drink for it. *hic* Best night of my life, that was.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He should have hanged for it anyway.", next = "BACK", reply = "Hanged? For my boat? *hic* That's harsh, matey, even for a pirate. I only took his boots.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Brined, matey, like a good herring. *hic* Boats have gone down out there, and I'm the only one who keeps sailing, so I drink to the lads who didn't come back, because somebody has to, and the rum's on my tab." },
      },
      choices = {
        { text = "Drink to them, then, and pray for them too.", next = "BACK", reply = "I do, matey, every night, and I'll pray too, if you show me how. *hic* Couldn't hurt.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need your rum, Argo.", next = "BACK", reply = "Maybe not, matey, but I do. *hic* Somebody's got to drink for 'em.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "So the monster can't get under her, matey! *hic* Freeze a ring round my boat, she sits pretty, the monster bangs its head, and I sell tickets to Jazzle's arena crowd at two silver a head." },
      },
      choices = {
        { text = "Ice won't hold it. Face the thing properly.", next = "BACK", reply = "Face it properly, {g:he|she} says! *hic* You go face it, matey, and I'll stay right here and face my rum.", fx = { align = { honor = 1 } } },
        { text = "Freeze it, and charge Jazzle double.", next = "BACK", reply = "Double! Now you're thinkin' like a goblin, matey. *hic* Jazzle won't know what hit him.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Swim out, find the beastie, and bite it somewhere it'll remember, matey. *hic* I'll pay in rum, or in fish, or in the eternal gratitude of a very drunk goblin, which is worth more than it sounds." },
      },
      choices = {
        { text = "I'll do it myself, without the demon.", next = "BACK", reply = "Without the demon? *hic* Brave, matey, very brave. I'll keep the rum warm for you.", fx = { align = { light = 1 } } },
        { text = "Done. It's been hungry lately anyway.", next = "BACK", reply = "Good, matey, good. *hic* Tell it to bite somewhere tender, and I'll throw in a bottle.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Off the murloc islands, *hic*, by the fresh wreckage, matey. Swim careful, though, because it likes things that swim, and you'd look like a snack in that shape, no offence." },
      },
      choices = {
        { text = "I'll look, and leave it be if it's only hungry.", next = "BACK", reply = "Live and let live, matey, I always say. *hic* Just don't let it live under my boat.", fx = { align = { light = 1 } } },
        { text = "I'll find it and lead it to your harpoon.", next = "BACK", reply = "That's the stuff, matey! *hic* I'll have the harpoon ready, if I can find it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born on a boat, matey, *hic*, and I'll die on a boat, and in between, I'm on a boat, owin' money to somebody." } },
    advice = { { id = "tp_ad", text = "Never trust a calm sea or a sober sailor, matey, and never lend either of 'em coin." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's *hic* the finest port in the world, and my boat's the finest in this one. I've sailed into Booty Bay a dozen times, and I've sailed out of it eleven." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail Buccaneers are pirates, and pirates are bad for business. I'd fight 'em myself, *hic*, if they ever came this far east." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a fine port, but the water's too calm. I like a sea that fights back, *hic*, like the one out by the murloc islands." } },
    _none = { { id = "tp_none", text = "Don't know, matey! *hic* Ask me after the next one, and you're buyin'." } },
  },
}

P:NPC {
  key = "gritta", id = TODO_NPC("Gritta Chumwater"), name = "Gritta Chumwater", title = "Fisherman",
  bible = "bibles/riverglades.md", role = "vendor", tier = "service",
  communities = { "powderfuse_port" }, temper = { "blunt" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "Only her advice comes free, and she doesn't dress it up.",
    third = "{name} met Gritta Chumwater, the blunt goblin who sells fishing supplies at Powderfuse Port.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Chum's fresh, kid, or as fresh as chum gets, and it's priced by the bucket." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a fisher's squint, kid, good. The catfish up the rivers bite like dogs, so you'll want a better pole, and I happen to sell 'em." },
  },

  start = "hello",
  nodes = {
    -- Deeds pass: the player drowned.
    dd_drown = {
      lines = { { id = "dd_default", text = "Most of 'em can't swim, kid, and they say that's on purpose: if ya go over, ya go quick and don't waste the sea's time. I learned anyway, because I'd rather argue with the sea than agree with it." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then I'll learn to fight it, same as you.", next = "BACK", reply = "Good answer. Start in the shallows, and don't go past the wreckage until ya can swim back from it.", fx = { align = { order = -1 } } },
        { text = "I'll respect it and keep to the shore.", next = "BACK", reply = "Plenty of old fishermen say the same, and they're old for a reason, kid.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_monster", when = { questDone = TODO_QUEST("The Monster Surfaces") },
          text = "So you're the one who pulled Argo's monster up out of the wreckage. The fish came back to the near water the week after, kid, and I've had my best catches since spring, so I owe ya, and I'll pay in advice." },
        { id = "h_dd_drown", when = { deathCause = "drowning" },
          text = "You drowned, didn't ya, kid? Don't look so surprised; ya stand back from the edge of my dock like it owes ya money." },
        { id = "h_default", key = true, text = "Gritta Chumwater, kid. I sell chum, lures, fish and advice, and only the advice is free, so don't get used to it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? You'll want somethin' to do between fights, kid, so take up fishing, because it'll teach you patience, which you lack, and the pole's three silver." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, eh? Fish don't care how holy you are, kid, so don't stand over the water glowing, because it's costing me customers." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? Keep your pet off my chum barrel, kid, or it pays for what it eats, at full price." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Quiet feet, good. Fish hear clumsy people from the next cove, kid, and clumsy people don't buy bait twice." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? Fishing's the closest thing to prayer I know, kid: you sit, you wait, and mostly nothing happens, except fishing pays better." },
        { id = "h_hpriest", when = { class = "PRIEST", faction = "Horde" }, text = "A priest off the Horde boat, eh? Sit and fish a while, kid, because it's the same as praying, only you get supper, and I sell the bait." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Tell the water to send me bigger fish, would you, kid? It never listens to me, and bigger fish sell for more." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, eh? Don't freeze my bait, don't boil my chum, kid, and we'll get on fine." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, eh? Whatever that is, kid, it's scaring off the fish, so stand back from the water before I start billing you for the catch." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? Can you talk to fish, kid? No? Then you're no use to me, but you can buy something anyway." },
      },
      again = { { id = "h_again", text = "What else, kid? Buy somethin' while you think." }, { id = "h_again2", text = "Still standin' there, kid? Standin's free, but the dock space isn't, so buy a lure." } },
      choices = {
        { text = "I drowned out there. How do sailors stand it?", next = "dd_drown", when = { deathCause = "drowning" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where's the best fishing?", next = "fishing" },
        { text = "I can't think who would buy chum.", next = "chum" },
        { text = "Why would a warrior need patience?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does glowing really scare fish?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What bites hardest in these rivers?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You can't be the only one fishing these coves.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Fishing as prayer? Do you believe that?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Why won't the water listen to you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A mage seems to have given you trouble before.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do fish really sense demons, Gritta?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do you need someone to talk to fish?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What's the biggest fish you've ever caught?", next = "biggest" },
        { text = "Goodbye.", next = "END" },
      },
    },
    fishing = {
      lines = { { id = "f_default", text = "Where the rivers come down to the sea, kid. The catfish up there have whiskers like Melbin's, but don't tell him, or he'll claim he owns 'em." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chum = {
      lines = { { id = "c_default", text = "Fimbo buys it for his cafe's soup and Captain Argo baits his monster with it, and they both pay on time, kid, which is all I need to know. I don't ask which pot it ends up in, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Because you swing first and look second, kid, same as every fighter I've sold a pole to. A fish teaches you to wait, and waiting's what keeps you alive when the swinging's done." },
      },
      choices = {
        { text = "Fair enough. I'll sit still and let the fish come to me.", next = "BACK", reply = "Now you're talkin' sense, kid. Sit down, keep quiet, and maybe a fish'll find you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep swinging first. It's worked so far.", next = "BACK", reply = "Then you'll catch nothin' but splinters, kid, but suit yourself. I've seen stranger.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Everything scares fish, kid: shadows, boots, loud prayers, Argo. Stand back from the edge and keep the shine down, and you'll do, and so will my sales." },
      },
      choices = {
        { text = "I'll dim it. Your water, your rules.", next = "BACK", reply = "Thanks, kid. The fish'll thank you too, by showing up.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light shines where it likes, Gritta.", next = "BACK", reply = "Sure it does, kid, and so do the fish, someplace else. Stand back, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "The catfish up the rivers, whiskers and all, kid. They'll take a hand off if you're slow, and the old ones are bigger than your pet and worth twice as much at market." },
      },
      choices = {
        { text = "Then I'll leave the old ones be.", next = "BACK", reply = "Good, kid. The old ones have earned their quiet, same as me.", fx = { align = { light = 1 } } },
        { text = "Big catfish make big meals. I'll hunt one.", next = "BACK", reply = "Big meal, big bite, kid, and they bite back. Bring a thick glove.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Pirates from up the coast, when they think nobody's watching, and they're always watching, kid. They pay in good coin and never haggle, so I don't ask where the coin came from, because that's bad for business." },
      },
      choices = {
        { text = "Coin from pirates is still stolen coin.", next = "BACK", reply = "Maybe it is, kid, but it buys bait same as yours. I don't ask, and I don't tell.", fx = { align = { honor = 1 } } },
        { text = "Coin's coin. Smart of you not to ask.", next = "BACK", reply = "Smart's the only way to live on this coast, kid. You're catchin' on.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Believe it? I've sat on that dock every dawn for years, kid, and I've never felt closer to anything than I do with a line in the water. Call it what you like, but I don't charge for it." },
      },
      choices = {
        { text = "That sounds like faith to me, Gritta.", next = "BACK", reply = "Maybe it is, kid. I never had a word for it before.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's just quiet, Gritta. Nothing out there is listening.", next = "BACK", reply = "Maybe so, kid, but it's my quiet, and I like it. You can keep your nothing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Because I take from it every day and never give anything back but chum, kid, and that's a lousy deal for the water. If I were the water, I wouldn't listen to me either." },
      },
      choices = {
        { text = "Give something back, then. Respect the water.", next = "BACK", reply = "I've been tryin', kid, and the sea's been patient. Maybe I'll throw back a few more.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea takes plenty. It owes you fish.", next = "BACK", reply = "Owes me, huh? You've got a goblin's heart, kid, and I mean that kindly. Mostly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Some fool off the Tanaris boat, showin' off for Jazzle at the arena, kid. He froze my bait barrel solid and laughed about it, and I charged him for the barrel, the bait and the laugh." },
      },
      choices = {
        { text = "Good. Show-offs should pay for their fun.", next = "BACK", reply = "That's what I said, kid! I sent him the bill and he sailed off without paying. Next time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Lighten up, Gritta. It was only a barrel.", next = "BACK", reply = "Only a barrel, {g:he|she} says! That barrel was a week's bait, kid. You can pay for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Fish sense everything, kid. A demon's a big wrong shadow on the water, and every fish in the cove goes to the bottom and sulks, so stand back, like I said, because sulking fish don't sell." },
      },
      choices = {
        { text = "All right, I'll keep it well back from the water.", next = "BACK", reply = "Thanks, kid. The fish'll be grateful, and so will my profits.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your fish can sulk. It stays with me.", next = "BACK", reply = "Then the fish'll sulk, kid, and I'll sulk with 'em. Stand way back, at least.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Because they won't bite, kid, and I want to know why, since I'm losin' money every day they don't. Three days now I've pulled up nothing but weed, and Argo's blaming his monster, which I'd rather not believe." },
      },
      choices = {
        { text = "Maybe they're frightened. Give the cove a rest.", next = "BACK", reply = "Maybe they are, kid. I'll give it a week and see.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Use more chum. Hungry fish forget their fear.", next = "BACK", reply = "More chum, more money, kid, and I'm already losin' money. But maybe you're right.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    biggest = {
      lines = { { id = "bg_default", text = "A river catfish as long as Melbin's dock is wide, kid, up where the rivers meet. It took me all morning to land and all afternoon to sell, for a very nice sum, and Fimbo at the cafe cried when he cooked it, though he says that was the onions." } },
      choices = {
        { text = "You must let the big ones go now and then.", next = "biggest_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    biggest_go = {
      lines = { { id = "bgb_default", text = "Once, kid. She was old and scarred and fought like she'd done it a hundred times before, so I cut the line and wrote off the lure. Don't tell anybody, because it's bad for business." } },
      choices = {
        { text = "Good. She earned her freedom, Gritta.", next = "BACK", reply = "That's how I figured it, kid. I still dream about her some nights, which is more than a stuffed one on the wall would give me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A catch is a catch. I'd have kept her.", next = "BACK", reply = "You'd have kept her, huh? Then you'd never know what I know. Some catches you let go, kid.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've fished every coast a boat can reach, kid, and came here because the fish are stupider and the rent's cheaper. Don't tell them." } },
    advice = { { id = "tp_ad", text = "Fish at dawn, sell by noon, kid, and never eat what you can't name or can't sell." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best fishing in the world, if you don't mind the sharks. I don't mind the sharks, because they mind me." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail pirates steal my catch when they think I'm not looking. I'm always looking." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's waters are calm and lazy, and the fish there are fat and stupid. I'll take a smart fish any day." } },
    _none = { { id = "tp_none", text = "Fish don't talk about that, kid, so neither do I, unless you're buyin'." } },
  },
}
