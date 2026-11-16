-- Sentinel Hill's working people: the inn, the stores, the gryphons, the tower and the bows.
-- Voice: bibles/sentinel_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "heather", id = TODO_NPC("Innkeeper Heather"), name = "Innkeeper Heather",
  bible = "bibles/sentinel_folk.md", role = "innkeeper", tier = "service",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "kind", "practical" },
  notices = { "weary", "drink" },
  impression = {
    first = "Innkeeper Heather fights the Westfall dust with a broom and a sense of humour, and the dust is winning. Most of her guests sleep in their boots, she says, and she has stopped minding.",
    third = "{name} met Innkeeper Heather, who keeps the inn on Sentinel Hill and feeds the hungry militia.",
  },

  greetings = {
    { id = "g_inn", text = "In off the road with you. Dust on the mat, please, not on my floor. It's the one clean thing in Westfall." },
    { id = "g_home", when = { homeInn = { "Sentinel Hill" } }, text = "Your bed's made, and I've shaken the grit out of the blankets, though it'll be back by morning. It always is." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late for the road. Sit down before the militia mistakes you for a bandit; it happens more than they'd admit." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've been out to Moonbrook, or somewhere just as bad, by the look of you. Sit down; it's stew first and questions after." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "That'll do for tonight. The militia's got a cell for brawlers, and it's mostly full of hay." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Heather, and I keep the inn on the hill. Most of my guests are militia between watches, and most of them sleep in their boots." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "You've eaten at Salma's? Then you've had the best stew in Westfall and you'll be disappointed in mine. I've made my peace with it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves, out here? We've only dust and gulls to offer you, and the gulls are rude and the dust gets everywhere." },
        { id = "h_militia", when = { metBefore = true }, text = "The militia eats more than any army I've ever fed. I've never fed an army. I'm fairly sure this is worse." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The night watch comes in for soup about now, the same faces every night. I worry on the nights one's missing." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You came back up out of Moonbrook. The whole hill's been singing about it, badly, and I've let them, because it's the first singing in here for a year." },
        { id = "h_patrol", when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Out after gnolls for Captain Danuvin? Wash your hands before you sit at my table. Gnoll paws are no kind of thing to bring to supper." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the dust on the bench; I've only just swept it." },
        { id = "h_again2", text = "Ask away while I pour; the militia drink faster than they talk, so I've a moment." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How's the hill holding up?", next = "hill" },
        { text = "Who stays here, mostly?", next = "guests" },
        { text = "Do any of the militia need tending?", next = "tending", when = { class = "PRIEST" } },
        { text = "You said some Defias drank here once?", next = "masons", when = { topicKnown = "defias" } },
        { text = "Any chance of a proper dwarven ale?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Just resting.", next = "END" },
      },
    },
    hill = {
      lines = { { id = "hi_default", text = "Better than the farms. We've walls of a sort and Gryan's word. Out there they've only got locks, and the Defias have keys." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } } },
    },
    guests = {
      lines = { { id = "gu_default", text = "Militia between watches, the odd carter brave enough for the road, and whoever Gryan's put to work. The carters pay and the militia sleep, and I call that even." } },
      choices = {
        { text = "Do the militia ever pay?", next = "guests_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_pay = {
      lines = { { id = "gp_default", text = "When Gryan can, which isn't often. I keep a slate for them, and I've never once rubbed it clean or asked for a copper of it." } },
      choices = { { text = "That's generous.", next = "BACK", fx = { affinity = 1 } } },
    },
    masons = {
      big = true,
      lines = { { id = "ma_default", text = "Masons, the first of them to come out from the city after the trouble there. They paid for their ale and sang dreadful songs, and then one week they stopped coming in, and now I hear their names on Gryan's lists." } },
      choices = {
        { text = "The city wronged them first. That should count for something.", next = "BACK", fx = { align = { order = -1 }, learn = { "stonemasons" } } },
        { text = "Whatever they were owed, they chose to become thieves.", next = "BACK", fx = { align = { order = 1 }, learn = { "stonemasons" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "stonemasons" } } },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Proper? I've what the wagon brought, and the wagon brought what the Defias didn't want. You're welcome to it, but don't say 'proper' again, or I'll cry into the jug." } },
      choices = { { text = "It'll do nicely. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tending = {
      lines = { { id = "te_default", text = "Always: burns, cuts, and the ones who've stopped sleeping. Sit with that last lot, if you can; they'll talk to a priest who won't be here next week." } },
      choices = {
        { text = "I'll sit with them tonight.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { sentinel_hill = 1 } } },
        { text = "I'll leave the sleepless ones to someone who's staying.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone on the hill comes through my door for a bed or a bowl, and they all talk. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm an innkeeper. The inn came with the hill and I came with the inn, and that's as far back as anyone here cares." } },
    advice = { { id = "tp_ad", text = "Bind your hearthstone here. You'll want somewhere to come back to that isn't a field." } },
    defias = { { id = "tp_defias", text = "Some of them drank here, before all this, a few masons among them, and nice enough men they were. I try not to think about that." } },
    people_militia = { { id = "tp_militia", text = "Farmers with spears and no pay, so they eat for free here. Gryan pays when he can, which is hardly ever." } },
    _none = { { id = "tp_none", text = "Ask Gryan. Or ask the gulls, they'll tell you just as much." } },
  },
}

P:NPC {
  key = "lewis", id = TODO_NPC("Quartermaster Lewis"), name = "Quartermaster Lewis",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "harried" }, values = { "dutiful", "practical" },
  notices = { "kit" },
  impression = {
    first = "One ledger and a much-robbed wagon keep Sentinel Hill supplied, and Quartermaster Lewis manages both with weary good grace. He'd rather not know how gear gets damaged, because then he'd have to write it down.",
    third = "{name} met Quartermaster Lewis, who keeps Sentinel Hill fed and armed with far too little.",
  },

  greetings = {
    { id = "g_stores", text = "The stores are open, as they always are, and half empty, as they always are. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "More business? Good, buy something; it'll make my ledger feel useful." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "I can mend that, but don't tell me how it happened, or I'll only have to write it down." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lewis, quartermaster. I keep Sentinel Hill fed, armed and patched, which is a lot to ask of one ledger and a wagon that keeps getting robbed." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "Our armor's running thin. That note goes to the one man in the city who can fix it, faster than a wagon and without a Defias reading it first. Thor will put you in the air." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Lewis") },
          text = "Osric's crate? Armor at last, and it goes to whoever's in the worst shape first. Now you know the way by gryphon, so use it often; the roads are worse." },
      },
      again = {
        { id = "h_again", text = "What's next? I've a ledger waiting on me." },
        { id = "h_again2", text = "Go on, and quickly, before another wagon goes missing." },
      },
      choices = {
        { text = "Why so short on supplies?", next = "short" },
        { text = "How do you get word to the city?", next = "message" },
        { text = "What's in the ledger?", next = "ledger" },
        { text = "Got arrows, shot, throwing knives?", next = "ammo", when = { class = { "HUNTER", "ROGUE", "WARRIOR" } } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    short = {
      big = true,
      lines = {
        { id = "s_default", text = "Every wagon from the city passes three farms the Defias hold. One in two arrives, in a good week. The ledger counts the bad weeks so I don't have to." },
      },
      choices = {
        { text = "I'll clear the road.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 1 } } },
        { text = "Can't the city send guards?", next = "guards" },
      },
    },
    guards = {
      lines = { { id = "g2_default", text = "The city sends me forms, and I fill them in. That's the arrangement, and it's never once put a guard on the road." } },
      choices = {
        { text = "What happens to the forms?", next = "forms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forms = {
      lines = { { id = "fo_default", text = "Three copies. One goes to the city, one comes back stamped, and one keeps the stove going. The third's the only one that's ever helped." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    message = {
      lines = { { id = "me_default", text = "By gryphon. There's a man in Old Town, Osric Strang, who keeps an armor shop and sends us what he can spare, and while the wagons never reach him, the gryphons do." } },
      choices = {
        { text = "A friend in the city, then.", next = "message_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message_friend = {
      lines = { { id = "mf_default", text = "The only one we've got. The Keep sends nothing and Osric sends steel, and I know which I'd rather have, and which I'd rather thank." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { westfall = "abandoned" } } } },
    },
    ledger = {
      lines = { { id = "le_default", text = "Bread, water, arrows, shot and mending, in and out and stolen. The stolen column's the longest, and I've had to rule extra pages for it." } },
      choices = {
        { text = "Who steals the most?", next = "ledger_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_who = {
      lines = { { id = "lw_default", text = "The Defias on the north road, the gnolls on the south, and the militia from the bread bin at night. Those last ones I forgive." } },
      choices = { { text = "Generous of you.", next = "BACK", fx = { affinity = 1 } } },
    },
    ammo = {
      lines = { { id = "am_default", text = "Arrows, shot, throwing knives and axes. They're not the best in the kingdom, only the best that got through, and I'd not be picky out here." } },
      choices = {
        { text = "Let me see them.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A quartermaster. The ledger's the only history I keep, and it's mostly losses." } },
    advice = { { id = "tp_ad", text = "Buy food before you need it. Out here the bread runs out before the hunger does." } },
    trade = { { id = "tp_tr", text = "General goods for a hill at war: what I have, I sell, and what I don't have was stolen.", next = "ledger" } },
    defias = { { id = "tp_defias", text = "They eat better than we do, I'm told, off our wagons. I'd like that told to someone who can do something about it." } },
    people_militia = { { id = "tp_militia", text = "My best customers and my worst payers. I wouldn't change either." } },
    _none = { { id = "tp_none", text = "That's not in my ledger, and if it's not in my ledger, it either doesn't exist or it's been stolen." } },
  },
}

P:NPC {
  key = "thor", id = TODO_NPC("Thor"), name = "Thor",
  bible = "bibles/sentinel_folk.md", role = "flightmaster", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "proud" },
  notices = { "travel", "animal" },
  impression = {
    first = "Thor speaks of his gryphons as if they were moody old friends, and he seems to like them better than most people. The birds, I think, know it.",
    third = "{name} met Thor, the gryphon master of Sentinel Hill, whose birds are the one way out of Westfall the Defias haven't robbed.",
  },

  greetings = {
    { id = "g_fly", text = "Need a ride? The birds are fed and cross, which is the best time to fly, since they'll get you there quicker just to be rid of you." },
    { id = "g_back", when = { metBefore = true }, text = "Landed well, did you? Good, because the birds talk about the bad ones." },
  },

  notice = {
    { id = "n_hunter", cat = "animal", when = { pet = true },
      text = "Keep that beast back from my gryphons. They don't share, and they've had a hard week." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid, eh? Don't go turning into anything with feathers near my birds, or they'll get jealous, and then they get bitey." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Name's Thor, and I keep the gryphons. They're the fastest way out of Westfall, and the only one the Defias haven't managed to rob, so far." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "From Lewis, and urgent? They're all urgent, with Lewis. Up you go, then, and hold on with your knees, not your hands; the bird hates being strangled." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lot glide, I hear, off cliffs and the like. Gryphons don't glide, they haul, so strap in; it's not the same thing at all." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick, the birds are restless." },
        { id = "h_again2", text = "Go on, then. Quick, before one of them bites somebody." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What are the gryphons like?", next = "birds" },
        { text = "Where do your routes go?", next = "routes" },
        { text = "Ever lost a rider?", next = "lost" },
        { text = "Lewis's note has to reach Stormwind.", next = "message", when = { questActive = TODO_QUEST("Continue to Stormwind") } },
        { text = "Ironforge's gryphons look sturdier than these.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "The winds over Westfall are restless today, Thor.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Not today.", next = "END" },
      },
    },
    birds = {
      lines = { { id = "b_default", text = "Proud, hungry and loyal, in that order. Treat them like soldiers and they'll treat you like cargo. That's a compliment, from a gryphon." } },
      choices = {
        { text = "I'll be good cargo.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do they have names?", next = "names" },
      },
    },
    names = {
      lines = { { id = "na_default", text = "They do, but they've never told me what they are. I call them all 'you', and they answer when they feel like it." } },
      choices = { { text = "Sounds like the militia.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
    routes = {
      lines = { { id = "ro_default", text = "Stormwind, always. Lakeshire over the mountains, Darkshire when the wind's kind, Booty Bay if you've the stomach for it." } },
      choices = {
        { text = "Why only the places I've been?", next = "routes_been" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_been = {
      lines = { { id = "rb_default", text = "Every bird knows the way home to the capital, but a strange roost they won't trust until you've shown them it once. Once is enough, mind; they're smarter than they let on." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    lost = {
      lines = { { id = "lo_default", text = "Never a rider, but I lost a crate of Lewis's arrows over the Dagger Hills once. Somewhere out there a Defias is very well stocked." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    message = {
      lines = { { id = "ms_default", text = "Then you want Osric Strang, in Old Town. His shop's called Limited Immunity. Pay the bird's fare and I'll have you there before Lewis finishes fretting." } },
      choices = {
        { text = "Saddle up, then.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Sturdier, maybe, but mine fly through sea wind and dust every day and come home grumbling. That's all the sturdy I need." } },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Aye, the birds felt it too; they've been snapping at each other since dawn. If you can tell when the wind turns, you're welcome to stand by the roost and warn me before it does." } },
      choices = {
        { text = "It'll turn by dusk. Ground the birds.", next = "BACK", fx = { affinity = 2 } },
        { text = "The wind doesn't take orders from me.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the gryphon master, and that's the whole of it. The birds don't care where I came from, so neither do I." } },
    advice = { { id = "tp_ad", text = "Fly over trouble, not through it, and never feed a gryphon from your hand. I did it once, and never again." } },
    trade = { { id = "tp_tr", text = "Rides out of Westfall for a little coin. Cheaper than walking, safer than the road.", next = "routes" } },
    westfall = { { id = "tp_westfall", text = "From up there it's all gold and grey. Pretty, if you don't know what's in the grey." } },
    _none = { { id = "tp_none", text = "I fly birds, friend, so you'd best ask someone who walks." } },
  },
}

P:NPC {
  key = "riell", id = TODO_NPC("Scout Riell"), name = "Scout Riell",
  bible = "bibles/sentinel_folk.md", role = "militia", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "watchful" }, values = { "dutiful", "loyal" },
  notices = { "stealth", "kit" },
  impression = {
    first = "Scout Riell sees every road into Sentinel Hill from her tower, and she saw me long before I saw her. She likes the Defias nervous, and she's working hard at it.",
    third = "{name} met Scout Riell, who watches the roads from Sentinel Hill's tower and reports to Gryan Stoutmantle.",
  },

  greetings = {
    { id = "g_tower", text = "Up here you can see every road into the hill. Which means I see you coming long before you say hello." },
    { id = "g_back", when = { metBefore = true }, text = "I saw you on the north track an hour ago. You walk like you're looking for a fight, which suits me fine." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { stealthed = true },
      text = "Nice try. You can hide from the road, but not from the tower." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Riell, scout for the People's Militia. I watch from the tower and tell Gryan what's coming. Lately it's always the same answer: more." },
        { id = "h_silk", tags = { "news" }, when = { questActive = TODO_QUEST("Red Silk Bandanas") },
          text = "I want the red silk off Defias necks, so bring me the bandanas. Every one on my table is one less on the road." },
        { id = "h_silk_done", when = { questDone = TODO_QUEST("Red Silk Bandanas") },
          text = "There are fewer red silks on the roads this week, and the ones that are left look nervous. I like them nervous." },
        { id = "h_gryan", when = { heardLine = "gryan.w_default" },
          text = "Gryan told you how it was? He tells it like he was there because he was, and so were we all. That's why we stayed." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm watching the road, not you, but talk anyway." },
        { id = "h_again2", text = "Go on. Up here the wind carries every word, so I'll hear you fine while I watch Moonbrook." },
      },
      choices = {
        { text = "What can you see from the tower?", next = "see" },
        { text = "Why red silk, not leather?", next = "silk" },
        { text = "What's it like, living up here?", next = "tower" },
        { text = "Bet I could slip past your watch.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Sentinels keep watches like this at home.", next = "nightelf", when = { race = "NightElf" } },
        { text = "I could scout the hills for you as a cat.", next = "druid", when = { class = "DRUID" } },
        { text = "Carry on, scout.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Smoke from Moonbrook, riders on the coast road at odd hours, and lights at the old farms that shouldn't have lights. I write it all down, and Gryan reads every word." } },
      choices = {
        { text = "Lights at the old farms?", next = "see_lights" },
        { text = "Who rides the coast road?", next = "see_riders" },
        { text = "I'll look into it.", next = "BACK", fx = { affinity = 1, learn = { "moonbrook" } } },
      },
    },
    see_lights = {
      lines = { { id = "sl_default", text = "Defias camped in houses that were farmers' homes not long ago: the Molsen place, Furlbrow's, and the farms near the Jangolode Mine. They don't even bother to close the shutters." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    see_riders = {
      lines = { { id = "sr_default", text = "A messenger, riding from Moonbrook to the quarry, the quarry to the mine, and back again, the same route every time like a clock. I've told Gryan, and Gryan has plans for clocks." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    silk = {
      lines = {
        { id = "si_default", text = "The red marks the gang and the cloth marks the rank: leather on the road, silk on the ones who give the orders. You'll find the silk under Moonbrook." },
        { id = "si_known", when = { deed = "dungeon:The Deadmines" },
          text = "You've been under Moonbrook. Then you've seen what silk looks like up close, and what it costs to take it off them." },
      },
      choices = {
        { text = "Under Moonbrook?", next = "silk_under" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silk_under = {
      big = true,
      lines = { { id = "su_default", text = "There's a way down somewhere in the town. The high ranks hole up beneath it. When you go, go with friends, and bring me ten silks for my table." } },
      choices = {
        { text = "Ten silks. I'll remember.", next = "BACK", fx = { affinity = 1, learn = { "moonbrook" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      lines = { { id = "to_default", text = "Cold at night, hot by noon, and the wind never stops. On a clear day I can see Moonbrook's smoke from here. I'd trade the view for a quiet one." } },
      choices = {
        { text = "Do you ever sleep?", next = "tower_sleep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower_sleep = {
      lines = { { id = "ts_default", text = "Between watches, when I can. Heather keeps a bed for me at the inn, and I've used it twice; it was very nice both times." } },
      choices = { { text = "Use it a third time.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Try it, then; every thief in red has tried. A shadow moving against dry grass is the easiest thing in Westfall to see." } },
      choices = {
        { text = "Challenge accepted.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 }, affinity = 1 } },
        { text = "Good. Keep it that way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "In trees, I've heard. We've no trees to speak of out here, only plenty of sky and nothing to hide in, which suits a lookout fine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "druid_l", text = "As a cat? Well, the Defias shoot at anything that moves on two legs out there, so a cat would get further than I would. Mind the coyotes, and come back before dawn, or I'll assume you've been eaten." } },
      choices = {
        { text = "I'll be back before the watch changes.", next = "BACK", fx = { affinity = 1 } },
        { text = "Coyotes are the ones who should be careful.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I scout for the militia, and before that there's nothing worth the telling. The tower's where I live now, near enough." } },
    advice = { { id = "tp_ad", text = "Look up before you walk into a valley, because someone's always on the ridge. Make sure it's me." } },
    defias = { { id = "tp_defias", text = "They're organised, and that's what scares me. Bandits don't post watches, but these do." } },
    people_militia = { { id = "tp_militia", text = "We're what's left when the lords leave: not much, but more than nothing." } },
    moonbrook = { { id = "tp_moonbrook", text = "I watch its smoke every morning. One day I'd like to watch it stop.", next = "silk" } },
    _none = { { id = "tp_none", text = "I can't see that from up here. Ask someone on the ground." } },
  },
}

P:NPC {
  key = "macgregor", id = TODO_NPC("William MacGregor"), name = "William MacGregor",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "dry" }, values = { "craft" },
  notices = { "class" },
  impression = {
    first = "Westfall wood is poor, according to William MacGregor, so he makes up the difference with patience. Strings, he reminded me more than once, are always extra.",
    third = "{name} met William MacGregor, the Sentinel Hill bowyer, who coaxes good bows from Westfall's poor wood.",
  },

  greetings = {
    { id = "g_bows", text = "Bows, arrows, and a quiver if you've the coin. Strings are extra, mind; strings are always extra." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Let me see that bow of yours. Hm, it'll do, though it'd do better with a new string, and those are extra." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior buying arrows, for pulling things to you, I suppose. Fair enough, though the things out here usually come anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "MacGregor's the name. I make bows for the militia and sell what's left to whoever walks up; Westfall wood's poor, so I make it up with patience." },
        { id = "h_yew", when = { metBefore = true }, text = "I found a decent stave of yew out by the Dagger Hills, decent but not good. In Westfall, decent is a holiday." },
        { id = "h_patrol", when = { questDone = TODO_QUEST("Patrolling Westfall") },
          text = "The gnolls to the south are thinner on the ground since you went out. The militia are wasting fewer arrows, which I'm told is good news and I take as bad for business." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You went under Moonbrook and came back with your bowstring still whole. Either you're good, or you didn't let the hunters shoot. Either way, well done." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm listening, though I'm waxing a string while I do." },
      },
      choices = {
        { text = "Where did you learn bowmaking?", next = "learn" },
        { text = "Poor wood?", next = "wood" },
        { text = "What bow would you give a hunter?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Who gets your best bows?", next = "best" },
        { text = "Gina MacGregor says she sells your strings.", next = "gina", when = { heardLine = "gina.h_default" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Just looking.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Dry country and crooked trees. Elwynn wood's better, but the wagons don't get through often enough, so I bend what we've got, slowly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learn = {
      lines = {
        { id = "l_father", text = "I made bows for farmers who hunted rabbits, at first. Then the thieves came and the farmers wanted bigger bows, so it's the same wood in worse times." },
      },
      choices = { { text = "Times will turn.", next = "BACK", fx = { affinity = 1 } } },
    },
    best = {
      big = true,
      lines = { { id = "be_default", text = "The militia, every time, before I'll sell one to a stranger. A farmer with a good bow on the wall is a farm the Defias think twice about, and that's worth more than your coin." } },
      choices = {
        { text = "Right. The hill's defenders come first.", next = "BACK", fx = { align = { honor = 1 }, standing = { sentinel_hill = 1 } } },
        { text = "Coin's coin. Sell to whoever pays the most.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gina = {
      lines = { { id = "gi_default", text = "She does, and she charges me for them too, which is why mine are extra. That's all the family business you'll get out of me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Something that pulls smooth and forgives a cold morning. Not the prettiest on the rack. The one you'll still trust in the Dagger Hills at dusk." } },
      choices = {
        { text = "Show me that one.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a bowyer, working Westfall wood with Westfall patience, and there's nothing else worth telling." } },
    advice = { { id = "tp_ad", text = "Keep your string dry and your quiver full. Out here you won't get a second chance to restock." } },
    _none = { { id = "tp_none", text = "I sell bows, friend, so ask me about bows." } },
  },
}
