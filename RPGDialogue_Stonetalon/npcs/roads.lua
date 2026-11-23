-- Stonetalon between the towns (0.38.0): a goblin's hut at Windshear Crag, Sun Rock's seed-keeper, and Kaya on the road home. Voice: bibles/stonetalon.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "ziz", id = TODO_NPC("Ziz Fizziks"), name = "Ziz Fizziks", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "windshear_crag" }, temper = { "shifty" }, values = { "ambitious", "inventive" },
  impression = {
    first = "He wants the shredder plans and isn't fussy about who fetches them.",
    third = "{name} met Ziz Fizziks, a goblin at Windshear Crag with designs on the Venture Company's machines.",
  },

  greetings = {
    { id = "g_default", text = "Psst, over here, and keep it down! The Venture boys have ears like bats and tempers like trolls, and one of 'em still owes me six silver for a gearbox." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and nobody followed you, right, pal? Good, because I'm not set up for visitors with axes, and the last ones broke a very expensive door." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sure it would, because that's what reapers are for, but mine would cut them neater and faster and twice as profitable. Look, the trees are coming down either way, so you might as well get on the side with the money." } },
      choices = {
        { text = "Then I won't help you build another tree-killer.", next = "BACK", reply = "Your loss, pal, and the Venture boys' gain. The trees are still coming down, you'll just be poorer while you watch.", fx = { align = { honor = 1 } } },
        { text = "The trees fall either way. Better you profit than Venture Co.", next = "BACK", reply = "Now you're thinkin', pal! At least my reaper would put the money in a goblin pocket that says thank you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tough enough when they're sitting in a shredder, and soft as a cream puff when they're not, so hit 'em on their lunch break. The blueprints are on their belts, and I'll want those in one piece, so try not to cut them in half along with the operator." } },
      choices = {
        { text = "I'll fight them fair, shredder and all.", next = "BACK", reply = "Fair, shredder and all? Pal, you're braver than my accountant, and he's very brave. Just bring back the blueprints in one piece.", fx = { align = { honor = 1 } } },
        { text = "I'll catch them on their lunch break, like you said.", next = "BACK", reply = "That's the spirit, pal, catch 'em with a sandwich in one hand. The blueprints are on their belts, so mind the mustard.", fx = { align = { honor = -1 } } },
        { text = "Something else, Ziz.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Driven 'em right up the slopes, pal, and now the Deepmoss spiders are nesting closer to my hut than I'd like. If you're thinning them out anyway, take a swing past the Venture camp, because their operators hate spiders more than I do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Driven 'em right up the slopes, pal, and now the Deepmoss spiders are nesting closer to my hut than I'd like. Hey, keep that {pet} away from my blueprints, pal. It's got the look of something that chews paper, and I've only got the one copy." },
      },
      choices = {
        { text = "I'll hunt the spiders and leave the forest be.", next = "BACK", reply = "Fine by me, pal, just as long as they stop nesting under my hut. The forest can have whatever's left.", fx = { align = { honor = 1 } } },
        { text = "I'll drive the spiders into the Venture camp.", next = "BACK", reply = "Ha! Now that's what I call a business strategy, pal. Herd 'em right into the Venture camp and watch the operators run.", fx = { align = { honor = -1 } } },
        { text = "Something else, Ziz.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray for Venture Company goons? Well, between you and me, pal, the poor slobs on the shredders get worked half to death for a copper a day and docked for lunch, so I suppose a prayer wouldn't cost me anything." } },
      choices = {
        { text = "I'll pray for them. They're workers, not villains.", next = "BACK", reply = "Huh, that's real decent of you, pal, and I won't argue. The poor slobs could use somebody on their side.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose their masters. They get no prayer from me.", next = "BACK", reply = "Can't say I blame you, pal, though they're mostly just tired. Pray for me instead, then, since I'm the one doing the hard thinking.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Steal? I'd call it liberating, because they're cutting down a whole mountain's worth of trees and I'm only after a few pieces of paper. Besides, you'll be stopping a menace, and I'll be getting rich, which is good for everyone." } },
      choices = {
        { text = "I'll stop the Venture Company, but not for your profit.", next = "BACK", reply = "Your reasons, my profit, and everybody's happy, pal. I'll take the plans however they come.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fine. A cut of the profits sounds fair to me.", next = "BACK", reply = "Now that's what I call a partnership, pal, and I'll draw up the papers tonight. Fair split, I promise, mostly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Name's Ziz Fizziks, pal, freelance engineer and a man of vision, and that vision is the Venture Company's Super Reaper 6000. Their operators carry the blueprints, so if you happen to take some off 'em, I'll make it worth your while, with a percentage to be negotiated." },
        { id = "h_cond", when = { race = "Gnome" }, text = "A gnome! Now you'd appreciate a good set of shredder schematics, wouldn't you? Don't answer that, I don't want any competition." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, huh? Can you get the ground to swallow a Venture Company operator or two? I'm asking for a friend, and the friend is me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, out here? If you've got a prayer that makes the Venture Company forget this hut exists, I'd love to hear it, pal, because mine sure aren't working." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, huh? You know what's a lot like magic? Engineering, except it works every time, mostly, and no offense meant, pal." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! Great, terrific, just keep the imp away from the blueprints, will ya, because imps and paper don't mix and I've only got the one copy." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Now you're my kind of customer, pal. Those Venture operators carry their blueprints right on their belts, and nobody's quicker than a pair of hands that don't want to be noticed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, huh? Big, loud, likes hittin' things, and that's exactly the kind of help I need with the Venture Company, pal, at very competitive day rates." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You see that wildlife out there? The Venture Company's been chopping its home down for months, so it's real cranky, and that's useful to a guy like me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? Don't suppose you've got a blessing for a goblin's bank account, because the Venture Company's been bleeding mine dry." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now you look like someone who doesn't mind roughing up a few Venture Co. thugs for a good cause, and I've got a good cause right here." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, huh? Look, pal, I don't cut down any trees myself, I just want the plans for the machine that does, and that's a whole different thing." },
      },
      again = {
        { id = "h_again1", text = "What else, pal? Make it quick, because the shift changes soon and those goons count heads." },
        { id = "h_again2", text = "Anything else, pal? Talk's cheap, but I'm still on the clock." },
      },
      choices = {
        { text = "What's the Super Reaper 6000?", next = "reaper" },
        { text = "You seem to hate the Venture Company.", next = "venture" },
        { text = "Isn't it dangerous hiding here?", next = "crag" },
        { text = "I'd only want a peek at the schematics.", next = "gnome", when = { race = "Gnome" } },
        { text = "The earth here hates the Venture Company. Does that bother you, Ziz?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Venture Company must be doing more than cutting at Windshear.", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How many guards on the Venture Company's camp?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "How tough are the Venture Company's operators, Ziz?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Have the Venture Company's saws driven the beasts out, Ziz?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does anyone pray for the workers the Venture Company drives here?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should a paladin help you steal from them, Ziz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would your reaper cut down trees just like the Venture Company's?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good luck with your machine.", next = "END" },
      },
    },
    reaper = {
      lines = {
        { id = "reaper_default", text = "Only the finest tree-chopping shredder ever built, pal, and the Venture Company's using it to strip Stonetalon bare for a lumber contract I'd kill to see. Me, I'd put it to better uses, and sell it to the highest bidder, naturally." },
      },
      choices = {
        { text = "Better uses? You'd sell it too.", next = "reaper2" },
      },
    },
    reaper2 = {
      lines = {
        { id = "reaper2_default", text = "Course I would, pal, I'm a goblin! The druids say the machines are killing the mountain, and the Venture boys say it's only business, and I say both can be true at once and one of 'em pays better." },
      },
      choices = {
        { text = "The mountain matters more than profit.", next = "BACK", reply = "Spoken like a druid, pal, and I respect it, I really do. I'll still sell the plans, but I'll feel bad about it for a whole minute.", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Business is business. Get the plans, sell them.", next = "BACK", reply = "Ha! That's my kind of thinkin', pal, simple and profitable. You get the plans, I sell 'em, and everybody goes home happy.", fx = { align = { order = -1 }, trait = { greedy = 1 } } },
      },
    },
    venture = {
      lines = {
        { id = "venture_default", text = "Hate's a strong word, pal, I just don't like being fired. I built half their gears, and they sacked me without so much as a copper bonus, and then they billed me for the toolbox." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crag = {
      lines = {
        { id = "crag_default", text = "Sure it is, pal, but nobody looks for a goblin right under their own noses, and the rent's free. Besides, the view of the burning forest is very inspiring, for an engineer." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gnome_default", text = "A peek, says the gnome, as if a gnome ever stopped at a peek! Fine, bring me the blueprints and you can look, pal, but no taking notes, because I've got the patent pending in my head." },
      },
      choices = {
        { text = "Deal.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Cutting, mostly, and building bigger things to cut with, which is what got me interested in the first place. Their shredders run on more than steam, pal, and if you could find out what they're burning in those engines, I'd be very grateful." } },
      choices = {
        { text = "Sounds profitable. I'm in for a share.", next = "BACK", reply = "Now you're talkin' my language, pal, and I'll draw up a contract. Find out what's in those engines, and we'll split it fair.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Those shredders should be scrapped, not copied.", next = "BACK", reply = "Scrapped? Pal, that's a lot of good metal going to waste, but I hear you. Maybe I'll just copy the good bits and scrap the rest.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "More than they need and fewer than they think, pal, which is the Venture Company all over, cutting wages and cutting corners. The operators knock off for lunch at the same time every day like clockwork, so if you were a clever sort, that's when you'd go in." } },
      choices = {
        { text = "I'll take whatever else isn't nailed down too.", next = "BACK", reply = "Ha! A sticky-fingered partner, my favourite kind, pal. Just make sure the plans come back first, and the rest is your business.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll take the plans and leave the workers alone.", next = "BACK", reply = "A gentleman thief, pal, how refreshing. The workers will never know they were robbed, and that's the best kind of job.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bother me? I hate 'em too, pal, though for business reasons and not spiritual ones. Their shredders chew through these woods like the trees owe them money, so if your rocks want revenge, we're on the same side for once." } },
      choices = {
        { text = "I'd fight the Venture Company openly, for the earth's sake.", next = "BACK", reply = "Openly, huh? Your rocks and my ledger, side by side, pal, and nobody's ever seen that before. Go knock 'em around.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather lift their plans quietly and let the shredders rust.", next = "BACK", reply = "Now that's a plan I can get behind, pal. Quiet and profitable, with a little rust for flavour.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an engineer, pal, between employers, with very big plans and a very small hut." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company's got the best shredder plans this side of Undermine and the worst security, pal, so I'm liberatin' 'em in the name of free trade. They'd do the same to me, and they'd charge me for the privilege." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I'm selling these plans, once I've got 'em, to the highest bidder with the shortest memory. Every engineer in the Cartel wants a shredder, and every one of 'em's too cheap to build their own." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's full of engineers who'd kill for a good shredder design, and some of 'em would, given the chance. That's why I'm selling through a cousin, at a reasonable markup." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's Gazlowe's town, and he don't ask where your goods come from as long as the duty gets paid. My kinda place, chum." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's legit, and the Venture boys ain't, and I'm somewhere in the middle, with a hut and a pair of binoculars. Business is business, kid." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal, and I don't do anything for free, including not knowing things." } },
  },
}

P:NPC {
  key = "tsunaman", id = TODO_NPC("Tsunaman"), name = "Tsunaman", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "gentle" }, values = { "patient", "nature" },
  impression = {
    first = "He ripples like a held breath and glares at every campfire.",
    third = "{name} met Tsunaman, a water elemental at Sun Rock Retreat who serves Duke Hydraxis in his war against fire.",
  },

  greetings = {
    { id = "g_default", text = "Stand clear of that campfire, mortal, for I have a quarrel with it. The tide brings you to Sun Rock, and the tide brings nothing without purpose." },
    { id = "g_back", when = { metBefore = true }, text = "You return, as the tide returns, and the fires in the vale burn a little lower than when you left. The Duke will hear of it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Your Light burns, and I distrust all things that burn, yet it does not hunger the way fire hungers. If it will stand against the flame spirits in the vale, then let it shine beside the rain for a while." } },
      choices = {
        { text = "My Light will stand beside the rain, Tsunaman.", next = "BACK", reply = "Then go into the vale and let the flames see you shining. Water and Light together may drown a fire neither could alone.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My Light serves me, not your Duke's war.", next = "BACK", reply = "Then serve yourself, but the fire spirits will not ask whom you serve before they burn you. Remember that in the vale.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Your roots and leaves drink from my kind, druid, so we are not strangers. Grow what you will in the Charred Vale, but grow it after the fire is quenched, or you only feed the flames a fresh meal." } },
      choices = {
        { text = "Quench the fire first, then let the vale grow slowly.", next = "BACK", reply = "Spoken like still water, which runs deep and is not easily stirred. The vale will thank you in its own long season.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll grow it now. Green wood resists fire.", next = "BACK", reply = "Green wood burns slower, that much is true, but it still burns. Plant if you must, and I will keep the flames from your saplings while I can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fought, warrior, and fought until nothing in the vale still glows. Fire is not a foe that retreats or bargains; it only feeds, and the servants of Ragnaros would feed on this whole world if we let them." } },
      choices = {
        { text = "I'll fight them openly and give no quarter.", next = "BACK", reply = "Good, for fire gives none either. Strike like a breaking wave, and do not stop until there is only steam.", fx = { align = { honor = 1 } } },
        { text = "I'll take them however I can, fair or not.", next = "BACK", reply = "Fairness means nothing to a flame, so I will not scold you. Use every trick you know and drown them where they stand.", fx = { align = { honor = -1 } } },
        { text = "Something else, Tsunaman.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up the slopes and away from the burning, as all living things flee from fire. The beasts of Stonetalon know what my kind knows, that a flame spirit does not hunt to eat but only to consume." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Up the slopes and away from the burning, as all living things flee from fire. Your {pet} shies from the campfire as I do, {class}, and I find I like it the better for that." },
      },
      choices = {
        { text = "I'll hunt the flame spirits fairly, as I'd hunt any beast.", next = "BACK", reply = "Then hunt them with patience, as the tide wears down the cliff. They will tire before you do.", fx = { align = { honor = 1 } } },
        { text = "I'll set traps and let them burn themselves out.", next = "BACK", reply = "Trap them, then, and I will not call it shameful. A fire caught in a snare is still a fire that will not reach the trees.", fx = { align = { honor = -1 } } },
        { text = "Something else, Tsunaman.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light, here at the edge of the burning. I have seen the Light warm and I have seen it scorch, and I wonder which yours will do." },
        { id = "h_default", text = "I am Tsunaman, servant of Duke Hydraxis, and I have come to Sun Rock to wage war on fire. The flame spirits have crept into the Charred Vale, and where they walk, nothing grows and nothing drinks." },
        { id = "h_cond", when = { race = "Tauren" }, text = "Shu'halo, your people call the rain a gift of the Earth Mother, and I do not argue with them. I only ask that you help the rain put out what burns." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, who speaks with water and with fire alike. Speak with me, then, and tell your fire totems that I am watching them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You pray, and your prayers do not smell of smoke, which is more than I can say for most mortals here. The vale needs every power that does not burn." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, and I see the spark at your fingertips. Keep your fire to yourself while you stand near me, and turn your frost on the vale instead." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "There is a fire in you that is not clean fire, warlock, and I like it even less than the ordinary kind. The Warchief trusts you, so I will tolerate you, but do not burn anything near me." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You move quietly, like water under ice, and I approve. Quiet hands can snuff a flame before it knows it is in danger." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, strong as a spring flood. The fire spirits in the vale respect nothing but force, so you and I may yet be of use to each other." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, who has surely seen the beasts fleeing the vale. They know what the fire is, even if most mortals here do not." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, who tends the green things that drink from my kind. The fire in the vale is your enemy as much as mine, and I am glad you have come." },
      },
      again = {
        { id = "h_again1", text = "Speak, mortal; the tide is patient, though the fire is not." },
        { id = "h_again2", text = "Ask what you will, while I keep one eye on that campfire." },
      },
      choices = {
        { text = "What brings a water spirit to Sun Rock?", next = "seeds" },
        { text = "The Charred Vale looks like it burned for days.", next = "vale" },
        { text = "How do the tauren of Sun Rock treat you?", next = "sunrock" },
        { text = "Does the rain truly answer the Earth Mother?", next = "tauren", when = { race = "Tauren" } },
        { text = "How can the land here heal, Tsunaman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic help quench the fires faster?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where do the fire spirits gather in the vale?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Should the fire spirits be fought or contained, Tsunaman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Where have the beasts gone since the vale burned, Tsunaman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a druid's magic help the vale recover, Tsunaman?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Can the Light help against the fire, Tsunaman?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "May the tide favour you.", next = "END" },
      },
    },
    seeds = {
      lines = {
        { id = "seeds_default", text = "Duke Hydraxis sent me, for he wars against the servants of Ragnaros wherever they rise, and they have risen in the Charred Vale. I need mortal hands to strike at them, and mortal hands to go where I cannot, into the drowned halls of Blackfathom." },
      },
      choices = {
        { text = "The fire spirits only burn what's in reach.", next = "seeds2" },
      },
    },
    seeds2 = {
      lines = {
        { id = "seeds2_default", text = "And everything is in reach of fire, given time, which is why the Duke does not rest. Some say the vale should simply be left to burn out, and I say a fire never burns out while anything is left to feed it." },
      },
      choices = {
        { text = "Patience, then. Wear them down like the tide wears stone.", next = "BACK", reply = "You understand water better than most who are made of meat. The tide never hurries, and the tide always wins.", fx = { align = { light = 1 }, trait = { patient = 1 } } },
        { text = "Strike hard and fast, before the fire spreads.", next = "BACK", reply = "A flood rather than a tide, then, and a flood has its place too. Go, and do not let them rekindle behind you.", fx = { align = { light = -1 }, trait = { fierce = 1 } } },
      },
    },
    vale = {
      lines = {
        { id = "vale_default", text = "It burned, and it still burns, because something fed the flames until the flame spirits themselves woke there. I strike every campfire I pass, mortal, so you will understand that I take this personally." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sunrock = {
      lines = {
        { id = "sunrock_default", text = "Kindly enough, though they keep their cookfires lit, and I keep putting them out. Maggran Earthbinder tells me I frighten the braves, and I tell him the braves should be more frightened of fire." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "The rain answers many voices, shu'halo, and your Earth Mother's is an old and gentle one. Call to her when you walk into the vale, and I will call to the tide, and between us the fire will have no peace." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Frost would help, and shadow would not hurt, but fire only makes the flame spirits stronger, for they drink it the way I drink rain. Whatever you cast, cast it at them and not near the trees." } },
      choices = {
        { text = "Then I'll fight them with frost and steel, not fire.", next = "BACK", reply = "Good, for a spark thrown at a flame spirit is only a gift to it. You learn quickly, mortal.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fire's what I know. I'll burn them anyway.", next = "BACK", reply = "Then you will feed them, and I will have to drown what you fed. Do not expect my thanks for that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "In the deepest part of the burned ground, where the ash is still warm underfoot. A flame spirit cannot hide its light, so it cannot hide from you, but it will feel you the moment your blade touches it." } },
      choices = {
        { text = "I'll slip in and snuff them one by one.", next = "BACK", reply = "Like rain finding every crack in the stone. Go quietly, and let none of them warn the others.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll leave that to the Horde's proper soldiers.", next = "BACK", reply = "As you wish, though fire does not care whose soldiers come. I will find other hands.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "First the fire must be put out, and then the rain can do the rest in its own season. You know the elements are not all friends, shaman, and fire and water have been at war since before your kind first lit a torch." } },
      choices = {
        { text = "Balance and patience. That's how the land heals.", next = "BACK", reply = "Balance, yes, though I confess I would balance the world with a great deal less fire in it. Go well, shaman.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The fire spirits should be destroyed, not balanced.", next = "BACK", reply = "Now you speak like the Duke himself, and I will not argue. Drown every one of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a servant of Duke Hydraxis, sent from the waters to fight fire wherever it rises." } },
    venture_company = { { id = "tp_venture_company", text = "The goblins burn oil and wood in their machines, so I count them as fire's friends, whether they know it or not." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren tell me their Earth Mother weeps rain over the land. If that is so, then she and I want the same thing." } },
    cairne = { { id = "tp_cairne", text = "The tauren chieftain lets me stand on his people's rock, and I am grateful. I only wish his people kept fewer fires." } },
    centaur = { { id = "tp_centaur", text = "The centaur of Desolace care nothing for the war of the elements, and that is their loss. Fire will come for them too, in time." } },
    _none = { { id = "tp_none", text = "That is not a matter of water or fire, mortal, so it is not a matter for me." } },
  },
}

P:NPC {
  key = "kaya", id = TODO_NPC("Kaya Flathoof"), name = "Kaya Flathoof", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "brave" }, values = { "family", "determined" },
  impression = {
    first = "She is frightened and refuses to show it.",
    third = "{name} met Kaya Flathoof, a young tauren trying to get home to Sun Rock after the Grimtotem attack.",
  },

  greetings = {
    { id = "g_default", text = "You're not Grimtotem! Oh, thank the Earth Mother, I thought they'd found me." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Please, are we leaving now? I'd like to see Sun Rock before nightfall." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "My aunt told me the Forsaken were our allies, but he never said anything about the Light. I don't care, though, not really. If you'll walk me home to Sun Rock, you can glow all you like." } },
      choices = {
        { text = "I'll walk you home and keep you safe.", next = "BACK", reply = "Thank you, thank you, I knew you were kind the moment I saw you. I'll walk right behind you the whole way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep up. I won't wait for stragglers.", next = "BACK", reply = "I'll keep up, I promise, I'm faster than I look. Please don't leave me behind, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I did, before the Grimtotem came, because I wanted to run with the plainstriders and listen to the land. Now I only want to get home to Sun Rock, and I'll think about everything else when I'm not afraid any more." } },
      choices = {
        { text = "I'll keep you safe, and you can dream again tomorrow.", next = "BACK", reply = "Thank you, and maybe tomorrow I'll think about the plainstriders again. Tonight I'd just like to see my uncle's tent.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dreams get you killed out here. Stay quiet and stay close.", next = "BACK", reply = "I will, I'll be quiet as a mouse. I don't want to dream about anything right now anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I don't know, ten, maybe more, and they came at night with axes and torches. I hid in the rocks and listened to them, and I can still hear it, so if you walk me home, please walk in front." } },
      choices = {
        { text = "I'll walk in front, Kaya. Nothing will touch you.", next = "BACK", reply = "Thank you, oh, thank you, I'll stay right behind you. The Earth Mother sent you, I think.", fx = { align = { honor = 1 } } },
        { text = "I'll walk you home, but you'll need to keep up.", next = "BACK", reply = "I'll keep up, I promise, even if my legs are shaking. Just don't walk too fast.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kaya.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and they set snares the way my father taught me, because they're tauren and they learned the same as we did. If you see a snare, there's a Grimtotem watching it, and we should go around." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, and they set snares the way my father taught me, because they're tauren and they learned the same as we did. Your {pet} makes me feel safer, {class}, because it would hear the Grimtotem before I would. May I walk on its side?" },
      },
      choices = {
        { text = "We'll go around the snares, and keep you safe.", next = "BACK", reply = "Thank you, because I've seen what those snares do. My father would be glad you listened.", fx = { align = { honor = 1 } } },
        { text = "We'll cut through the snares. Speed matters more.", next = "BACK", reply = "But the Grimtotem will hear us, I know they will. Please, can we at least go quietly?", fx = { align = { honor = -1 } } },
        { text = "Something else, Kaya.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You're... you're dead, and you're glowing. Are you here to help me, or are you another thing I should hide from?" },
        { id = "h_default", text = "I'm Kaya Flathoof, and the Grimtotem fell on our camp, and I've been hiding ever since. My aunt Tammra is at Sun Rock, and I think she must believe I'm dead, so will you walk me home?" },
        { id = "h_cond", when = { race = "Tauren" }, text = "Shu'halo! You'll know the Grimtotem are tauren too, which makes this worse, doesn't it? They're our own people, and they did this." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman, aren't you? The Grimtotem had shamans too, but they never looked at anyone kindly, so please be different." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You're a priest? Could you say a prayer for the people at the camp, please, because I don't think anyone else has yet." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "Are you a mage? I've never seen one up close, and I'm sorry for staring, but I think I'd feel much safer walking home beside someone who can throw fire." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "I'm sorry, you have a look about you that reminds me of frightening stories. Please be patient with me if I jump." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh! I didn't hear you come up at all, and I'm so glad you're not Grimtotem. Can you walk that quietly with me all the way to Sun Rock?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Oh, thank the Earth Mother, because the Grimtotem were big and there were so many of them, and I didn't have anything but a walking stick." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know how to stay hidden, then, and you'll know the Grimtotem are hunters too, which frightens me more than anything." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "You're a druid, aren't you? My uncle says druids can become a bear, and if you did that now, I think I'd feel a whole lot safer." },
      },
      again = {
        { id = "h_again1", text = "I'll answer anything you like, if it means we're closer to leaving." },
        { id = "h_again2", text = "Ask, but please, let's not wait too long." },
      },
      choices = {
        { text = "Why did the Grimtotem attack?", next = "grimtotem" },
        { text = "Someone must be waiting for you at Sun Rock.", next = "uncle" },
        { text = "Is the road dangerous?", next = "road" },
        { text = "They've betrayed every tauren.", next = "tauren", when = { race = "Tauren" } },
        { text = "Did the Grimtotem bring shamans to your camp, Kaya?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Grimtotem must have used magic when they attacked you.", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Did you see where the Grimtotem went after the attack?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "How many Grimtotem attacked your camp, Kaya?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'd guess the Grimtotem hunt along this road, Kaya.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you want to become a druid one day, Kaya?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I'm here to help, Kaya. You're safe.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll take you home soon, Kaya.", next = "END" },
      },
    },
    grimtotem = {
      lines = {
        { id = "grimtotem_default", text = "They hate anyone who follows Cairne, and they want Stonetalon for themselves. They came at night with clubs and torches, and they didn't care who was asleep." },
      },
      choices = {
        { text = "What should be done with them?", next = "grimtotem2" },
      },
    },
    grimtotem2 = {
      lines = {
        { id = "grimtotem2_default", text = "Some of the elders say we must make peace with them for the sake of the shu'halo, and others say they've earned a war. I'm too tired to know which is right." },
      },
      choices = {
        { text = "Peace, if they'll take it. They're still tauren.", next = "BACK", reply = "That's what my uncle says, and I want to believe him. Maybe one day they'll come home to the tribes.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They attacked sleeping people. They've earned a war.", next = "BACK", reply = "They did, and I can't forget their torches. But I'm too tired to want anything but my bed.", fx = { align = { order = -1 }, trait = { fierce = 1 } } },
      },
    },
    uncle = {
      lines = {
        { id = "uncle_default", text = "My aunt Tammra, and she worries about everything, so she'll be beside herself by now. I'd like to see her face when I walk in, even if she shouts at me after." },
      },
      choices = {
        { text = "He'll be glad to see you.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_default", text = "The Grimtotem watch it, and they'll ambush us if they see me leave. Stay close, please, and don't let me fall behind." },
      },
      choices = {
        { text = "I'll stay close.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "They have, and when I'm home I'll tell the Bluff so, if anyone asks a young cow what she thinks. Thank you for saying it out loud." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They had shamans chanting before the braves came, and something made the ground shake under our tents. If you can do magic too, I think the Grimtotem might think twice about following us, and I would be very grateful for that." } },
      choices = {
        { text = "I'll protect you, Kaya. No one will hurt you on the road.", next = "BACK", reply = "Thank you, oh, thank you, and I'll stay close the whole way. I feel braver already.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get you home, but I'm not risking my neck needlessly.", next = "BACK", reply = "That's fair, I don't want you hurt either. Just get me to Sun Rock, and I'll be the bravest I can.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Up toward the hills, I think, carrying everything they could take from our camp. I don't want you to go after them alone, but if you find anything of ours up there, I'd like it back." } },
      choices = {
        { text = "Let Sun Rock's braves handle them. I'll take you home.", next = "BACK", reply = "Thank you, because I'd worry about you all night if you went. Maggran's braves will find them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go after them myself, tonight.", next = "BACK", reply = "Please be careful, and come back. If you find anything from our camp, I'd like it back more than anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think so, because I heard them chanting before the braves came over the ridge. I don't understand how anyone can ask the Earth Mother's spirits to help them kill other tauren." } },
      choices = {
        { text = "The spirits don't belong to killers. They'll answer someone better.", next = "BACK", reply = "That's what I hope too, and I'll ask the Earth Mother tonight. Thank you for saying it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits answer strength, and the Grimtotem simply have more.", next = "BACK", reply = "I don't want to believe that, because then the spirits would be on their side. Please don't say it again.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Kaya, from Camp Aparaje, though there isn't much of the camp left now." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem fell on Camp Aparaje and killed people I knew, and they did it smiling. I do not understand how a tauren could do that, and I do not want to." } },
    cairne = { { id = "tp_cairne", text = "Cairne will punish the Grimtotem for what they did, I know he will. He is the High Chieftain, and he does not forgive cruelty." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother saw what the Grimtotem did, and she will judge them. I only want to go home, and let her do the judging." } },
    centaur = { { id = "tp_centaur", text = "The centaur were the monsters of my grandmother's stories, but the Grimtotem are worse. They look like us, and that is the most frightening thing of all." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. I only want to get home, Earth Mother keep me." } },
  },
}
