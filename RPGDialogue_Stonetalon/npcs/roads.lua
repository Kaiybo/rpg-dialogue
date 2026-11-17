-- Stonetalon between the towns (0.38.0): a goblin's hut at Windshear Crag, Sun Rock's seed-keeper, and Kaya on the road home. Voice: bibles/stonetalon.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "ziz", id = TODO_NPC("Ziz Fizziks"), name = "Ziz Fizziks", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "windshear_crag" }, temper = { "shifty" }, values = { "ambitious", "inventive" },
  impression = {
    first = "Ziz Fizziks is a goblin hiding in a hut at Windshear Crag, right under the Venture Company's nose. He wants their shredder plans, and he isn't fussy about who fetches them.",
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
        { text = "Then I won't help you build another tree-killer.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The trees fall either way. Better you profit than Venture Co.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tough enough when they're sitting in a shredder, and soft as a cream puff when they're not, so hit 'em on their lunch break. The blueprints are on their belts, and I'll want those in one piece, so try not to cut them in half along with the operator." } },
      choices = {
        { text = "I'll fight them fair, shredder and all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll catch them on their lunch break, like you said.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ziz.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Driven 'em right up the slopes, pal, and now the Deepmoss spiders are nesting closer to my hut than I'd like. If you're thinning them out anyway, take a swing past the Venture camp, because their operators hate spiders more than I do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hey, keep that {pet} away from my blueprints, pal. It's got the look of something that chews paper, and I've only got the one copy." },
      },
      choices = {
        { text = "I'll hunt the spiders and leave the forest be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll drive the spiders into the Venture camp.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ziz.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray for Venture Company goons? Well, between you and me, pal, the poor slobs on the shredders get worked half to death for a copper a day and docked for lunch, so I suppose a prayer wouldn't cost me anything." } },
      choices = {
        { text = "I'll pray for them. They're workers, not villains.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose their masters. They get no prayer from me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Steal? I'd call it liberating, because they're cutting down a whole mountain's worth of trees and I'm only after a few pieces of paper. Besides, you'll be stopping a menace, and I'll be getting rich, which is good for everyone." } },
      choices = {
        { text = "I'll stop the Venture Company, but not for your profit.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fine. A cut of the profits sounds fair to me.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "The mountain matters more than profit.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Business is business. Get the plans, sell them.", next = "BACK", fx = { align = { order = -1 }, trait = { greedy = 1 } } },
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
        { id = "gnome_default", text = "A peek, he says, as if a gnome ever stopped at a peek! Fine, bring me the blueprints and you can look, pal, but no taking notes, because I've got the patent pending in my head." },
      },
      choices = {
        { text = "Deal. Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Cutting, mostly, and building bigger things to cut with, which is what got me interested in the first place. Their shredders run on more than steam, pal, and if you could find out what they're burning in those engines, I'd be very grateful." } },
      choices = {
        { text = "Sounds profitable. I'm in for a share.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Those shredders should be scrapped, not copied.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "More than they need and fewer than they think, pal, which is the Venture Company all over, cutting wages and cutting corners. The operators knock off for lunch at the same time every day like clockwork, so if you were a clever sort, that's when you'd go in." } },
      choices = {
        { text = "I'll take whatever else isn't nailed down too.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll take the plans and leave the workers alone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bother me? I hate 'em too, pal, though for business reasons and not spiritual ones. Their shredders chew through these woods like the trees owe them money, so if your rocks want revenge, we're on the same side for once." } },
      choices = {
        { text = "I'd fight the Venture Company openly, for the earth's sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather lift their plans quietly and let the shredders rust.", next = "BACK", fx = { align = { honor = -1 } } },
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
  communities = { "sun_rock" }, temper = { "gentle" }, values = { "hopeful", "nature" },
  impression = {
    first = "Tsunaman is a tauren of Sun Rock Retreat who plants new life where the Venture Company has cut the forest down. He works slowly, and he means to outlast the machines.",
    third = "{name} met Tsunaman, a tauren of Sun Rock Retreat replanting the scarred woods of Stonetalon.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Sun Rock, traveller. Mind the seedlings by the path; they're younger than they look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and the seedlings are taller than when you left. You see, it works." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I don't know. The Earth Mother heals slowly, and the Venture Company cuts quickly, and I'll take any help that tips the balance. If your Light mends, come and mend beside me for a day, and we'll see what grows." } },
      choices = {
        { text = "I'll mend beside you, Tsunaman. Gladly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My Light's for the Venture Company, not seedlings.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It can quicken them a little, but the earth must still do the real work, because a tree hurried into growing is a tree that breaks in the first hard wind. What the vale needs most from you is to keep the shredders away while the roots go deep." } },
      choices = {
        { text = "The earth sets the pace. I'll guard the vale and let it grow.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting is how the vale was lost. I'll push the growth.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Driven off, if the Earth Mother had her way, because she does not delight in blood. But the goblins will not leave while the trees still stand, and a warrior who breaks their machines may do more for the forest than any planting of mine." } },
      choices = {
        { text = "I'll break the machines and spare the goblins where I can.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The goblins brought this on themselves. I'll show them no mercy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Tsunaman.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up the slopes, and into each other's hunting grounds, which means they fight where they once lived side by side. The Pridewing wyverns have grown bolder too, because the forest no longer hides their prey." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} walks lightly among my seedlings, {class}, and the earth is glad of it. Feed it well; the land will remember." },
      },
      choices = {
        { text = "I'll hunt only what I need, and the rest can recover.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The balance is broken. I'll hunt what I can, while I can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Tsunaman.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light, here among the stumps. I plant what others cut down, and I wonder whether the Light can plant anything." },
        { id = "h_default", text = "I am Tsunaman, and I plant what others cut down. The Venture Company has stripped the Charred Vale and the woods below, and the Earth Mother will heal them, but she's glad of a little help." },
        { id = "h_cond", when = { race = "Tauren" }, text = "A shu'halo! Then you know the land is our mother, and a child does not stand by while his mother is hurt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The earth here cries out under the Venture Company's saws, and I'm glad someone who can hear it has come." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You pray, I can see it in how you hold your hands. Then pray for the Charred Vale, whatever answers you, because it needs every voice it can get." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. I've seen what fire does to a forest, and I've spent years undoing a little of it, so I hope you'll forgive me for watching your hands." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "There is something in you that the earth draws away from, I can feel it. I will not send you off, because the Warchief does not, but please don't call your demons among my seedlings." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You walk softly, and I like that, because the ground here has had enough heavy boots. If you're going down to the Venture camps, step lighter there than they ever did." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Your strength is welcome here, though I ask you to remember the seedlings when you walk among them, because they can't move out of your way." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have seen the creatures fleeing the vale, then, and you'll know the forest is not only trees." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! The Earth Mother's own healers, here at last, and the Charred Vale has waited a long time for hands like yours." },
      },
      again = {
        { id = "h_again1", text = "What else, friend? Speak freely; the seedlings like a gentle voice." },
        { id = "h_again2", text = "Ask what you like while I sort these seeds by size." },
      },
      choices = {
        { text = "What are you planting?", next = "seeds" },
        { text = "The Charred Vale looks like it burned for days.", next = "vale" },
        { text = "How is Sun Rock holding?", next = "sunrock" },
        { text = "I'll help heal her.", next = "tauren", when = { race = "Tauren" } },
        { text = "How can the land here heal, Tsunaman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic help the land here heal faster?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "The Venture Company must keep their fuel and machines somewhere close.", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "The Venture Company will have to be fought, Tsunaman.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Where have the beasts gone since the vale burned, Tsunaman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a druid's magic help the seedlings take root, Tsunaman?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Can the Light heal the forest, Tsunaman?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "May the seeds take root.", next = "END" },
      },
    },
    seeds = {
      lines = {
        { id = "seeds_default", text = "Gaea seeds, which grow quickly where the earth is wounded, if they're planted in the right places. I need hands to carry them to the burned ground, where the Venture shredders still roam." },
      },
      choices = {
        { text = "The goblins will only cut them down again.", next = "seeds2" },
      },
    },
    seeds2 = {
      lines = {
        { id = "seeds2_default", text = "Perhaps, but then I'll plant more, and the forest is more patient than any goblin's purse. Some of my people would rather drive the Venture Company out first, and some say we should heal before we fight." },
      },
      choices = {
        { text = "Heal first. Anger only burns more forest.", next = "BACK", fx = { align = { light = 1 }, trait = { patient = 1 } } },
        { text = "Drive them out first, or the planting is wasted.", next = "BACK", fx = { align = { light = -1 }, trait = { fierce = 1 } } },
      },
    },
    vale = {
      lines = {
        { id = "vale_default", text = "Fire, and the Venture Company, and the Grimtotem who don't care either way. The vale was green when I was a calf, and I mean for it to be green again before I'm an elder." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sunrock = {
      lines = {
        { id = "sunrock_default", text = "We are a small place, but the cliffs keep us safe and Maggran Earthbinder keeps us steady. The Grimtotem trouble us more than the goblins do, lately." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "Then take a seed with you when you leave Stonetalon, and plant it somewhere that needs it. The Earth Mother keeps track, I think, of every one." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Perhaps, though I've never met a spell that grew a tree as well as rain and time do. What would help more is fewer shredders, and that is a task for any hand, magic or not." } },
      choices = {
        { text = "Then I'll stop the shredders before I try any spell.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the land wait. The Horde needs timber too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "In the camps below Windshear Crag, where the trees were thickest, because that is where the money was. I do not ask you to break their machines, but I would not weep if one of them stopped working." } },
      choices = {
        { text = "I'll wreck their machines, quietly and thoroughly.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll leave that to the Horde's proper soldiers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Slowly, as it always does, with seeds in the ash and rain in its season. The earth spirits are angry and I don't blame them, but anger won't plant a single tree, so I ask them to let me work while they rage." } },
      choices = {
        { text = "Patience and planting. That's how we answer the machines.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The machines should burn the way the forest burned.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a planter of seeds, and Sun Rock is my home." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company cuts the forest faster than I can plant it, but trees grow slowly and goblins grow old. I will outlast them, and so will the forest." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us seeds to remind us that nothing ends for good. I plant her reminders where the goblins have been, and she does the rest." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent us here to heal the land, and he trusts me with the seeds. I would rather plant a hundred trees than fight one goblin, and he understands that." } },
    centaur = { { id = "tp_centaur", text = "The Gelkis and Magram to the south fight each other, and the land in Desolace suffers for it. I worry that Stonetalon will become the same if no one plants anything here." } },
    _none = { { id = "tp_none", text = "That I don't know, but the Earth Mother might, if you put your hand on the soil and listen long enough." } },
  },
}

P:NPC {
  key = "kaya", id = TODO_NPC("Kaya Flathoof"), name = "Kaya Flathoof", title = "",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "brave" }, values = { "family", "determined" },
  impression = {
    first = "Kaya Flathoof is a young tauren who survived the Grimtotem attack on Camp Aparaje and wants only to get home to Sun Rock. She is frightened and refuses to show it.",
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
      lines = { { id = "xfpala_default", text = "My uncle told me the Forsaken were our allies, but he never said anything about the Light. I don't care, though, not really. If you'll walk me home to Sun Rock, you can glow all you like." } },
      choices = {
        { text = "I'll walk you home and keep you safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep up. I won't wait for stragglers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I did, before the Grimtotem came, because I wanted to run with the plainstriders and listen to the land. Now I only want to get home to Sun Rock, and I'll think about everything else when I'm not afraid any more." } },
      choices = {
        { text = "I'll keep you safe, and you can dream again tomorrow.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dreams get you killed out here. Stay quiet and stay close.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I don't know, ten, maybe more, and they came at night with axes and torches. I hid in the rocks and listened to them, and I can still hear it, so if you walk me home, please walk in front." } },
      choices = {
        { text = "I'll walk in front, Kaya. Nothing will touch you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll walk you home, but you'll need to keep up.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kaya.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and they set snares the way my father taught me, because they're tauren and they learned the same as we did. If you see a snare, there's a Grimtotem watching it, and we should go around." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} makes me feel safer, {class}, because it would hear the Grimtotem before I would. May I walk on its side?" },
      },
      choices = {
        { text = "We'll go around the snares, and keep you safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "We'll cut through the snares. Speed matters more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kaya.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You're... you're dead, and you're glowing. Are you here to help me, or are you another thing I should hide from?" },
        { id = "h_default", text = "I'm Kaya Flathoof, and the Grimtotem fell on our camp, and I've been hiding ever since. My uncle is at Sun Rock, and I think he must believe I'm dead, so will you walk me home?" },
        { id = "h_cond", when = { race = "Tauren" }, text = "Shu'halo! You'll know the Grimtotem are tauren too, which makes this worse, doesn't it? They're our own people, and they did this." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman, aren't you? The Grimtotem had shamans too, but they never looked at anyone kindly, so please be different." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You're a priest? Could you say a prayer for the people at the camp, please, because I don't think anyone else has yet." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "Are you a mage? I've never seen one up close, and I'm sorry for staring, but I think I'd feel much safer walking home beside someone who can throw fire." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "You're a warlock? I'm sorry, I've only ever heard frightening stories about warlocks, so please be patient with me if I jump." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh! I didn't hear you come up at all, and I'm so glad you're not Grimtotem. Can you walk that quietly with me all the way to Sun Rock?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Oh, thank the Earth Mother, because the Grimtotem were big and there were so many of them, and I didn't have anything but a walking stick." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know how to stay hidden, then, and you'll know the Grimtotem are hunters too, which frightens me more than anything." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "You're a druid, aren't you? My uncle says druids can become a bear, and if you did that now, I think I'd feel a great deal safer." },
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
        { text = "Were there Grimtotem shamans at Camp Aparaje, Kaya?", next = "xhsham", when = { class = "SHAMAN" } },
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
        { text = "Peace, if they'll take it. They're still tauren.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They attacked sleeping people. They've earned a war.", next = "BACK", fx = { align = { order = -1 }, trait = { fierce = 1 } } },
      },
    },
    uncle = {
      lines = {
        { id = "uncle_default", text = "My uncle, and he worries about everything, so he'll be beside himself by now. I'd like to see his face when I walk in, even if he shouts at me after." },
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
        { text = "I'll protect you, Kaya. No one will hurt you on the road.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get you home, but I'm not risking my neck needlessly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Up toward the hills, I think, carrying everything they could take from our camp. I don't want you to go after them alone, but if you find anything of ours up there, I'd like it back." } },
      choices = {
        { text = "Let Sun Rock's braves handle them. I'll take you home.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go after them myself, tonight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think so, because I heard them chanting before the braves came over the ridge. I don't understand how anyone can ask the Earth Mother's spirits to help them kill other tauren." } },
      choices = {
        { text = "The spirits don't belong to killers. They'll answer someone better.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits answer strength, and the Grimtotem simply have more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Kaya, from Camp Aparaje, though there isn't much of the camp left now." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem killed my family at Camp Aparaje and took me, and they did it smiling. I do not understand how a tauren could do that, and I do not want to." } },
    cairne = { { id = "tp_cairne", text = "Cairne will punish the Grimtotem for what they did, I know he will. He is the High Chieftain, and he does not forgive cruelty." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother saw what the Grimtotem did, and she will judge them. I only want to go home, and let her do the judging." } },
    centaur = { { id = "tp_centaur", text = "The centaur were the monsters of my grandmother's stories, but the Grimtotem are worse. They look like us, and that is the most frightening thing of all." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. I only want to get home, Earth Mother keep me." } },
  },
}
