-- Zul'Farrak: the sandfury troll city in Tanaris. Sergeant Bly and Weegli Blastfuse, captives
-- waiting in the cages atop the pyramid, who join the fight on the steps once freed.
-- Voices: bibles/dg_bly.md, bibles/dg_weegli.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sergeant Bly: leader of a band of treasure hunters, caged by the Sandfury.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_bly", id = TODO_NPC("Sergeant Bly"), name = "Sergeant Bly", title = "Captive",
  bible = "bibles/dg_bly.md", role = "questgiver", tier = "quest",
  temper = { "brash", "shifty" }, values = { "greedy", "practical" },
  notices = { "class" },
  impression = {
    first = "Grateful, loud and already counting the angles. You'd not turn your back on him.",
    third = "{name} freed Sergeant Bly from the Sandfury cages atop Zul'Farrak's pyramid.",
  },
  greetings = {
    { id = "g_default", text = "Well, look at that! Somebody actually made it up here with a sword and all their limbs." },
    { id = "g_rod", when = { questActive = TODO_QUEST("Divino-matic Rod") }, text = "Gadgetzan sent you for the rod, didn't they? Funny thing about that rod. Let's talk once these trolls stop trying to sacrifice us." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "A professional, I see. You and I could do business, friend, once we're out of this oven." },
  },
  start = "hello",
  nodes = {
    w8_long = {
      lines = { { id = "w8_long_a", text = "Long enough that Murta's started naming the vultures, pal, and that's a bad sign for everybody's sanity. The trolls feed us just enough to keep us fresh for the sacrifice, which is very thoughtful of them, if you think about it." } },
      choices = {
        { text = "What has Murta named them?", next = "w8_long2" },
        { text = "You don't seem too worried.", next = "w8_long2" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    w8_long2 = {
      lines = { { id = "w8_long2_a", text = "The big one's called Bly, because she says it's got my nose, and I'm choosing to take that as a compliment. Worried? Sure I'm worried, but worryin' don't open cages, and you just might." } },
      choices = {
        { text = "Then let's open some cages.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sergeant Bly, at your service, and I mean that very sincerely right now. Me and my crew came for troll gold and got a cage and a sunburn instead. Get us off this pyramid and we'll fight alongside you." },
      },
      again = { { id = "h_again", text = "Still here? The trolls aren't getting any friendlier, pal." } },
      choices = {
        { text = "Who are your friends here?", next = "crew" },
        { text = "What were you doing in Zul'Farrak?", next = "why" },
        { text = "Do you have the Divino-matic Rod?", next = "rod" },
        { text = "Fight with us down the steps.", next = "fight" },
        { text = "You're a thief, Sergeant. I can tell.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Gadgetzan's goblins know your name, I'll bet.", next = "gadgetzan", when = { race = { "Gnome", "Dwarf", "Human" } } },
        { text = "How long have you been stuck on this pyramid?", next = "w8_long" },
        { text = "I'll be back for you.", next = "END" },
      },
    },
    crew = {
      lines = { { id = "c_default", text = "Weegli's our goblin, handy with explosives and not much else, and Raven, Oro Eyegouge and Murta Grimgut round out the rest. We're not heroes, but we're not dead yet, which is better than most who come here." } },
      choices = {
        { text = "How did the trolls catch all of you?", next = "caught" },
        { text = "Can I trust your crew in a fight?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "ca_default", text = "Weegli was supposed to blow the temple doors, and instead he blew the alarm, more or less. Next thing we knew there were Sandfury priests everywhere and we were hanging in cages over the pit, waiting to be dinner or a sacrifice." } },
      choices = {
        { text = "Why hasn't Weegli blown the doors since?", next = "caught_weegli" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught_weegli = {
      lines = { { id = "cw_default", text = "Because he's in a separate cage, pal, and he won't light a fuse unless he's sure he won't be standing next to it. Get him out and he'll make you a door, I promise you that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "tr_default", text = "In a fight against trolls? Absolutely, because nobody hates these trolls more than the folks who've been sitting in their cages. After the fight, well, that's a conversation for after the fight." } },
      choices = {
        { text = "Honest about being dishonest, at least.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Takes one to know one, huh? Then you know the rule: everybody gets out alive first, and the split comes later. I'd hate for us to disagree about the split." } },
      choices = {
        { text = "Fair shares for everyone who bled for it.", next = "BACK", reply = "Fair shares, sure, and we'll see who's still bleeding at the end.", fx = { align = { order = 1 } } },
        { text = "Whoever's quickest keeps the loot.", next = "BACK", reply = "Now that's a philosophy I respect. Just don't turn your back on me, and I won't turn mine on you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gadgetzan = {
      lines = { { id = "gz_default", text = "Gadgetzan? Sure, I've done jobs for half the goblins in that town, and the other half want me arrested. If you're running errands for the Cartel, don't mention my name to the bruisers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Treasure, obviously. These trolls have been piling up gold since before Gadgetzan was a sandbar, and somebody's got to liberate it. We just underestimated how much they like throwing people into the pit." } },
      choices = {
        { text = "Robbing tombs is honest work, I suppose.", next = "BACK", reply = "Ha! You get it. The trolls stole it all first anyway, so really we're returning it to circulation.", fx = { align = { light = -1 } } },
        { text = "You got what grave-robbers deserve.", next = "BACK", reply = "Hey, that's harsh, even if it's true. Save the sermon for after we're off this pyramid.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rod = {
      lines = { { id = "r_default", text = "The rod? Oh, I've got it. Thing is, I've grown attached to it, and you've grown attached to staying alive, so let's see how the next few minutes go before we talk ownership." } },
      choices = {
        { text = "That sounds like a threat, Sergeant.", next = "BACK", reply = "A threat? Me? I'm a captive in a cage, pal. I'm just saying the desert's a long walk and a man has to look after his interests." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Now you're talking! Weegli, get ready to blow those doors when we're down. Everybody else, grab something sharp and stay behind the big one." } },
      choices = { { text = "Let's go.", next = "END" } },
    },
  },
  topics = {
    zulfarrak = { { id = "tp_zf", text = "Troll city, lots of sand, lots of gold, lots of very angry priests." } },
    _none = { { id = "tp_none", text = "No clue, pal. Ask me about treasure." } },
  },
}

---------------------------------------------------------------------------
-- Weegli Blastfuse: Bly's goblin demolitionist.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_weegli", id = TODO_NPC("Weegli Blastfuse"), name = "Weegli Blastfuse", title = "Captive",
  bible = "bibles/dg_weegli.md", role = "event", tier = "quest",
  temper = { "excitable", "cheerful" }, values = { "practical", "curious" },
  notices = { "race" },
  impression = {
    first = "Happiest goblin you've ever met, provided something is about to explode.",
    third = "{name} met Weegli Blastfuse, the goblin demolitionist caged with Sergeant Bly's crew in Zul'Farrak.",
  },
  greetings = {
    { id = "g_default", text = "Ooh, rescuers! Did you bring any blasting powder? No? That's fine, I've got plenty hidden in my boot." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "A gnome! Do you have any of those fancy timer fuses? Mine are mostly just string and hope." },
  },
  start = "hello",
  nodes = {
    w8_boot = {
      lines = { { id = "w8_boot_a", text = "Enough to open one door, pal, or two small ones, or one door and most of a troll, if he's standin' close! I keep it wrapped in oilcloth with a sock round it, and I've only set my foot on fire the once." } },
      choices = {
        { text = "The trolls didn't search your boots?", next = "w8_boot2" },
        { text = "Walking around on powder seems unwise.", next = "w8_boot2" },
        { text = "I'm an engineer. Show me that charge.", next = "w8_boot2", when = { profession = "Engineering" } },
        { text = "Something else, Weegli.", next = "BACK" },
      },
    },
    w8_boot2 = {
      lines = {
        { id = "w8_boot2_a", text = "They tried, but I told 'em it was a goblin foot ointment and they backed right off, 'cause nobody wants to touch goblin foot ointment. Unwise, sure, but every goblin in Gadgetzan walks around on somethin' that could go bang, and most of us still got toes." },
        { id = "w8_boot2_eng", when = { profession = "Engineering" }, text = "Ooh, a colleague! See this? Double-wrapped, short fuse, and a little cap I filed out of a troll's tooth, so it won't spark till I want it to. Don't tell Sarge I showed you, he thinks the boot's only full of socks." },
      },
      choices = {
        { text = "Keep your toes, Weegli.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Weegli Blastfuse, demolitions expert! Well, expert-ish. The trolls took my good charges, but I can still blow the door at the bottom of the steps if you keep them off me for a minute." },
      },
      again = { { id = "h_again", text = "Need something blown up? It's always yes." } },
      choices = {
        { text = "Which door do you mean?", next = "door" },
        { text = "How did a goblin end up with Bly?", next = "bly" },
        { text = "Isn't all this dynamite dangerous?", next = "danger" },
        { text = "Where did you learn to blow things up?", next = "learned" },
        { text = "My fuses run on clockwork, not string.", next = "fuses", when = { race = "Gnome" } },
        { text = "I know a thing or two about explosives.", next = "fuses", when = { profession = { "Engineering" } } },
        { text = "What's the biggest thing you ever blew up?", next = "ybig" },
        { text = "Got any family back in Gadgetzan?", next = "yfamily" },
        { text = "How much powder do you actually have in that boot?", next = "w8_boot" },
        { text = "Get ready, Weegli.", next = "END" },
      },
    },
    door = {
      lines = { { id = "d_default", text = "The big one into the inner city, where Chief Ukorz Sandscalp sits. Trolls lock it tight, but no lock ever made can argue with a good bundle of powder." } },
      choices = {
        { text = "What happens once it's open?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Then every troll on the steps comes runnin' down at once, which is the exciting part, and Sarge and the boys hold the line while you go in after Ukorz. I'd help, but my job ends when the smoke clears." } },
      choices = {
        { text = "And the treasure inside?", next = "treasure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    treasure = {
      lines = { { id = "tr_default", text = "Ooh, that's Sarge's department, and he gets very particular about it. Between you and me, I'd count my share twice before I left, because Sarge does his arithmetic with a knife handy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learned = {
      lines = { { id = "le_default", text = "Mining camps in the Badlands, mostly, where a goblin with steady hands can earn a fortune if he keeps both of them. I've still got all my fingers, which makes me the most successful blaster my family ever had!" } },
      choices = {
        { text = "That's a low bar, Weegli.", next = "BACK", reply = "Low bars are the easiest to clear, pal! That's just good business.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fuses = {
      lines = { { id = "fu_default", text = "Oh, you're one of those! Clockwork's lovely, but sand gets in the gears out here, and string never jams. If we live through this, you can show me yours and I'll show you how to make a charge out of a lunch tin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bly = {
      lines = { { id = "b_default", text = "Sarge pays in shares, and I like shares! Also he lets me blow things up without filling out any forms. In Gadgetzan you need a permit just to light a candle." } },
      choices = {
        { text = "Can Bly be trusted?", next = "BACK", reply = "Sarge? Sure! Mostly. He's never left me behind, anyway, except that one time, and the time after that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "Dangerous? Only if you're standing in the wrong place, and I'll yell first. Usually. Probably." } },
      choices = {
        { text = "Rules exist for good reasons.", next = "BACK", reply = "Oh, sure, rules are lovely! I just think they look better from a safe distance after the boom.", fx = { align = { order = 1 } } },
        { text = "Ha! Blow it all sky-high.", next = "BACK", reply = "Now there's a friend! You and me are going to get along just fine.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybig = {
      lines = {
        { id = "yb_default", text = "A whole hillside in the Badlands, pal, for a Venture Company crew lookin' for an iron seam. Brought the whole thing down in one go, and the seam with it, and a rockslide that took out the foreman's outhouse. They docked my pay but I still say it was a success." },
        { id = "yb_dwarf", when = { race = "Dwarf" }, text = "A hillside in the Badlands, for a crew diggin' near Uldaman, with a bunch of your Explorers' League types standin' too close. Nobody got hurt, mostly, but your lot still won't sell me powder." },
      },
      choices = {
        { text = "You worked for the Venture Company?", next = "yventure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yventure = {
      lines = { { id = "yv_default", text = "For a season, till I saw what they were doin' to the land, and the pay was rotten besides. Some say a goblin should take whatever job pays, and some say there's jobs you don't take. You'd say which, pal?" } },
      choices = {
        { text = "A job's a job. Take the coin.", next = "BACK", reply = "That's the goblin way! Though they did short me on the last invoice.", fx = { align = { light = -1 } } },
        { text = "Some jobs aren't worth the coin.", next = "BACK", reply = "Yeah. Yeah, I figured that one out the hard way.", fx = { align = { light = 1 } } },
      },
    },
    yfamily = {
      narr = "He pats his boot, where something lumpy clinks.",
      lines = {
        { id = "yfa_default", text = "A ma who sells fuses on the Gadgetzan market and a cousin who lost both eyebrows testin' her stock. She thinks I'm doin' honest mining work. If you ever meet her, I'm doin' honest mining work, all right?" },
        { id = "yfa_horde", when = { faction = "Horde" }, text = "A ma in Gadgetzan who sells fuses, and a cousin with no eyebrows. She sells to Horde and Alliance both, so you'll get a fair price, buddy. Just tell her I'm doin' honest mining work, all right?" },
      },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    bly = { { id = "yt_bly", text = "Sergeant Bly's the boss. He's got a plan, and plans are great, as long as there's dynamite in 'em." } },
    ukorz = { { id = "yt_ukorz", text = "Chief Ukorz Sandscalp sits behind that big door. I'm gonna open it for you, real loud." } },
    gadgetzan = { { id = "yt_gadget", text = "Gadgetzan's got the best fuses in Tanaris and the worst permits. My ma sells the former." } },
    _none = { { id = "tp_none", text = "Dunno! Is it flammable? If not, I didn't pay attention." } },
  },
}
