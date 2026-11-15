-- Sentinel Hill's working people: the inn, the stores, the gryphons, the tower and the bows.
-- Voice: bibles/sentinel_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "heather", id = TODO_NPC("Innkeeper Heather"), name = "Innkeeper Heather",
  bible = "bibles/sentinel_folk.md", role = "innkeeper", tier = "service",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "kind", "practical" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "In off the road with you. Dust on the mat, please, not on my floor. It's the one clean thing in Westfall." },
    { id = "g_home", when = { homeInn = { "Sentinel Hill" } }, text = "Your bed's made. I shook the grit out of the blankets. It'll be back by morning. It always is." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for the road. Sit down before the militia mistakes you for a bandit. It happens more than they'd admit." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've been out to Moonbrook, or somewhere like it. Sit. Stew first, questions after." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "That'll do for tonight. The militia's got a cell for brawlers, and it's mostly full of hay." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Heather. I keep the inn on the hill. Most of my guests are militia between watches, and most of them sleep in their boots." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "You've eaten at Salma's? Then you've had the best stew in Westfall and you'll be disappointed in mine. I've made my peace with it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves, out here? We've only dust and gulls to offer. The gulls are rude. The dust gets everywhere." },
        { id = "h_militia", when = { metBefore = true }, text = "The militia eats more than any army I've ever fed. I've never fed an army. I'm fairly sure this is worse." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night watch comes in for soup about now. Same faces, every night. I worry on the nights one's missing." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the dust on the bench; I've only just swept it." },
        { id = "h_again2", text = "Go on. I can pour and listen." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How's the hill holding up?", next = "hill" },
        { text = "Who stays here, mostly?", next = "guests" },
        { text = "Do any of the militia need tending?", next = "tending", when = { class = "PRIEST" } },
        { text = "Just resting.", next = "END" },
      },
    },
    hill = {
      lines = { { id = "hi_default", text = "Better than the farms. We've walls of a sort and Gryan's word. Out there they've only got locks, and the Defias have keys." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } } },
    },
    guests = {
      lines = { { id = "gu_default", text = "Militia between watches, the odd carter brave enough for the road, and whoever Gryan's put to work. The carters pay. The militia sleep. I count it even." } },
      choices = {
        { text = "Do the militia ever pay?", next = "guests_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_pay = {
      lines = { { id = "gp_default", text = "When Gryan can. He usually can't. I keep a slate. I've never once rubbed it clean, and I've never once asked." } },
      choices = { { text = "That's generous.", next = "BACK", fx = { affinity = 1 } } },
    },
    tending = {
      lines = { { id = "te_default", text = "Always. Burns, cuts, and the ones who've stopped sleeping. Sit with that last lot, if you can. They'll talk to a priest who won't be here next week." } },
      choices = {
        { text = "I'll sit with them tonight.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { sentinel_hill = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An innkeeper. The inn came with the hill, and I came with the inn. That's as far back as anyone here cares." } },
    advice = { { id = "tp_ad", text = "Bind your hearthstone here. You'll want somewhere to come back to that isn't a field." } },
    defias = { { id = "tp_defias", text = "Some of them drank here, before. Masons, a few. Nice enough. I try not to think about that." } },
    people_militia = { { id = "tp_militia", text = "Farmers with spears and no pay. They eat for free here. Gryan pays when he can. He usually can't." } },
    _none = { { id = "tp_none", text = "Ask Gryan. Or ask the gulls, they'll tell you just as much." } },
  },
}

P:NPC {
  key = "lewis", id = TODO_NPC("Quartermaster Lewis"), name = "Quartermaster Lewis",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "harried" }, values = { "dutiful", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_stores", text = "Stores are open. Stores are always open. Stores are also always half empty. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "More business? Good. Buy something, it'll make my ledger feel useful." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "I can mend that. Don't tell me how it happened. I'll only have to write it down." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lewis, quartermaster. I keep Sentinel Hill fed, armed and patched, which is a lot to ask of one ledger and a wagon that keeps getting robbed." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "Our armor's running thin. That note goes to the one man in the city who can fix it, faster than a wagon and without a Defias reading it first. Thor will put you in the air." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Lewis") },
          text = "Osric's crate? Armor, at last. It goes to whoever's in the worst shape first. And now you know the way by gryphon. Use it; the roads are worse." },
      },
      again = {
        { id = "h_again", text = "Next? I've a ledger waiting." },
        { id = "h_again2", text = "Go on. Quickly, before a wagon goes missing." },
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
      lines = { { id = "g2_default", text = "The city sends forms. I fill them in. That's the arrangement." } },
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
      lines = { { id = "me_default", text = "By gryphon. There's a man in Old Town, Osric Strang, who keeps an armor shop and sends us what he can spare. Wagons don't reach him. Gryphons do." } },
      choices = {
        { text = "A friend in the city, then.", next = "message_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message_friend = {
      lines = { { id = "mf_default", text = "The only one. The Keep sends nothing. Osric sends steel. I know which I'd rather have, and which I'd rather thank." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { westfall = "abandoned" } } } },
    },
    ledger = {
      lines = { { id = "le_default", text = "Bread, water, arrows, shot, mending. In, out, stolen. The stolen column's the longest. I've had to rule extra pages." } },
      choices = {
        { text = "Who steals the most?", next = "ledger_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_who = {
      lines = { { id = "lw_default", text = "Defias on the north road. Gnolls on the south. The militia, from the bread bin, at night. Those last ones I forgive." } },
      choices = { { text = "Generous of you.", next = "BACK", fx = { affinity = 1 } } },
    },
    ammo = {
      lines = { { id = "am_default", text = "Arrows, shot, throwing knives and axes. Not the best in the kingdom. The best that got through. I'd not be picky, out here." } },
      choices = {
        { text = "Let me see them.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A quartermaster. The ledger's the only history I keep, and it's mostly losses." } },
    advice = { { id = "tp_ad", text = "Buy food before you need it. Out here the bread runs out before the hunger does." } },
    trade = { { id = "tp_tr", text = "General goods for a hill at war. What I have, I sell. What I don't have was stolen.", next = "ledger" } },
    defias = { { id = "tp_defias", text = "They eat better than we do, I'm told. Off our wagons. I'd like that told to someone who can do something." } },
    people_militia = { { id = "tp_militia", text = "My best customers and my worst payers. I wouldn't change either." } },
    _none = { { id = "tp_none", text = "Not in my ledger. If it's not in my ledger it doesn't exist, or it's been stolen." } },
  },
}

P:NPC {
  key = "thor", id = TODO_NPC("Thor"), name = "Thor",
  bible = "bibles/sentinel_folk.md", role = "flightmaster", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "proud" },
  notices = { "travel", "animal" },

  greetings = {
    { id = "g_fly", text = "Need a ride? The birds are fed and cross. Best time to fly; they get you there quicker to be rid of you." },
    { id = "g_back", when = { metBefore = true }, text = "Landed well, did you? Good. The birds talk about the bad ones." },
  },

  notice = {
    { id = "n_hunter", cat = "animal", when = { pet = true },
      text = "Keep that beast back from my gryphons. They don't share, and they've had a hard week." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid. Don't go turning into anything with feathers near my birds. They get jealous, and then they get bitey." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thor. I keep the gryphons. Fastest way out of Westfall, and the only one the Defias can't rob, so far." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "From Lewis? Urgent? They're all urgent. Up you go, then. Hold on with your knees, not your hands; the bird hates being strangled." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lot glide, I hear. Off cliffs and the like. Gryphons don't glide, they haul. Strap in. It's not the same." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are restless." },
        { id = "h_again2", text = "Go on, then. Quick, before one of them bites somebody." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What are the gryphons like?", next = "birds" },
        { text = "Where do your routes go?", next = "routes" },
        { text = "Ever lost a rider?", next = "lost" },
        { text = "Lewis's note has to reach Stormwind.", next = "message", when = { questActive = TODO_QUEST("Continue to Stormwind") } },
        { text = "Ironforge's gryphons look sturdier than these.", next = "dwarf", when = { race = "Dwarf" } },
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
      lines = { { id = "na_default", text = "They do. They've never told me. I call them all 'you', and they answer when they feel like it." } },
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
      lines = { { id = "rb_default", text = "Every bird knows the way home to the capital. A strange roost, they won't trust till you've shown them it. Once is enough. They're smarter than they let on." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    lost = {
      lines = { { id = "lo_default", text = "Never a rider. Lost a crate of Lewis's arrows over the Dagger Hills once. Somewhere out there a Defias is very well stocked." } },
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
      lines = { { id = "dw_default", text = "Sturdier, maybe. Mine fly through sea wind and dust every day and come home grumbling. That's all the sturdy I need." } },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Gryphon master. That's the whole of it. The birds don't care where I came from, so neither do I." } },
    advice = { { id = "tp_ad", text = "Fly over trouble, not through it. And never feed a gryphon from your hand. Once. Never again." } },
    trade = { { id = "tp_tr", text = "Rides out of Westfall for a little coin. Cheaper than walking, safer than the road.", next = "routes" } },
    westfall = { { id = "tp_westfall", text = "From up there it's all gold and grey. Pretty, if you don't know what's in the grey." } },
    _none = { { id = "tp_none", text = "I fly birds. Ask someone who walks." } },
  },
}

P:NPC {
  key = "riell", id = TODO_NPC("Scout Riell"), name = "Scout Riell",
  bible = "bibles/sentinel_folk.md", role = "militia", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "watchful" }, values = { "dutiful", "loyal" },
  notices = { "stealth", "kit" },

  greetings = {
    { id = "g_tower", text = "Up here you can see every road into the hill. Which means I see you coming long before you say hello." },
    { id = "g_back", when = { metBefore = true }, text = "Saw you on the north track an hour ago. You walk like you're looking for a fight. Good." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { stealthed = true },
      text = "Nice try. You can hide from the road. Not from the tower." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Riell, scout for the People's Militia. I watch from the tower and tell Gryan what's coming. Lately it's always the same answer: more." },
        { id = "h_silk", tags = { "news" }, when = { questActive = TODO_QUEST("Red Silk Bandanas") },
          text = "Red silk off Defias necks. Bring me the bandanas. Every one on my table is one less on the road." },
        { id = "h_silk_done", when = { questDone = TODO_QUEST("Red Silk Bandanas") },
          text = "Fewer red silks on the roads this week. The ones that are left look nervous. I like them nervous." },
        { id = "h_gryan", when = { heardLine = "gryan.w_default" },
          text = "Gryan told you how it was. He tells it like he was there because he was. We all were. That's why we stayed." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm watching the road, not you. Talk anyway." },
        { id = "h_again2", text = "Go on. Eyes south, ears on you." },
      },
      choices = {
        { text = "What can you see from the tower?", next = "see" },
        { text = "Why red silk, not leather?", next = "silk" },
        { text = "What's it like, living up here?", next = "tower" },
        { text = "Bet I could slip past your watch.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Sentinels keep watches like this at home.", next = "nightelf", when = { race = "NightElf" } },
        { text = "Carry on, scout.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Smoke from Moonbrook. Riders on the coast road at odd hours. Lights at the old farms that shouldn't have lights. I write it all down. Gryan reads it all." } },
      choices = {
        { text = "Lights at the old farms?", next = "see_lights" },
        { text = "Who rides the coast road?", next = "see_riders" },
        { text = "I'll look into it.", next = "BACK", fx = { affinity = 1, learn = { "moonbrook" } } },
      },
    },
    see_lights = {
      lines = { { id = "sl_default", text = "Defias camped in houses that were farmers' homes not long ago. The Molsen place. Furlbrow's. Near the Jangolode Mine. They don't even close the shutters." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    see_riders = {
      lines = { { id = "sr_default", text = "A messenger. Moonbrook to the quarry, the quarry to the mine, and back. Same route every time, like a clock. I've told Gryan. Gryan has plans for clocks." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    silk = {
      lines = {
        { id = "si_default", text = "The red's the gang. The cloth's the rank. Leather on the road, silk on the ones who give orders. You'll find the silk under Moonbrook." },
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
      lines = { { id = "ts_default", text = "Between watches. Heather keeps a bed for me at the inn. I've used it twice. It was very nice both times." } },
      choices = { { text = "Use it a third time.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Try. Every thief in red has tried. A shadow moving against dry grass is the easiest thing in Westfall to see." } },
      choices = {
        { text = "Challenge accepted.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Good. Keep it that way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "In trees, I've heard. We've no trees to speak of out here. Plenty of sky, though, and nothing to hide in. Suits a lookout." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A scout for the militia. Before that, nothing worth the telling. The tower's where I live now, near enough." } },
    advice = { { id = "tp_ad", text = "Look up before you walk into a valley. Someone's always on the ridge. Make sure it's me." } },
    defias = { { id = "tp_defias", text = "Organised. That's what scares me. Bandits don't post watches. These do." } },
    people_militia = { { id = "tp_militia", text = "We're what's left when the lords leave. Not much. More than nothing." } },
    moonbrook = { { id = "tp_moonbrook", text = "I watch its smoke every morning. One day I'd like to watch it stop.", next = "silk" } },
    _none = { { id = "tp_none", text = "Not from up here. Ask someone on the ground." } },
  },
}

P:NPC {
  key = "macgregor", id = TODO_NPC("William MacGregor"), name = "William MacGregor",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "dry" }, values = { "craft" },
  notices = { "class" },

  greetings = {
    { id = "g_bows", text = "Bows, arrows, a quiver if you've the coin. Strings are extra. Strings are always extra." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Show me your bow. Hm. It'll do. It'll do better with a new string. They're extra." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior buying arrows. For pulling things to you, I suppose. Fair. The things out here usually come anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "MacGregor. I make bows for the militia, and sell what's left to whoever walks up. Westfall wood's poor, so I make it up with patience." },
        { id = "h_yew", when = { metBefore = true }, text = "Found a decent stave of yew out by the Dagger Hills. Decent. Not good. In Westfall, decent is a holiday." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm listening. I'm also waxing a string." },
      },
      choices = {
        { text = "Where did you learn bowmaking?", next = "learn" },
        { text = "Poor wood?", next = "wood" },
        { text = "What bow would you give a hunter?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Just looking.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Dry country, crooked trees. Elwynn wood's better, but the wagons don't get through often enough. So I bend what we've got, slowly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learn = {
      lines = {
        { id = "l_father", text = "Bows for farmers who hunted rabbits, first. Then the thieves came, and the farmers wanted bigger bows. Same wood. Worse times." },
      },
      choices = { { text = "Times will turn.", next = "BACK", fx = { affinity = 1 } } },
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
    background = { { id = "tp_bg", text = "Bowyer. Westfall wood, Westfall patience. Nothing else worth telling." } },
    advice = { { id = "tp_ad", text = "Keep your string dry and your quiver full. Out here you won't get a second chance to restock." } },
    _none = { { id = "tp_none", text = "I sell bows. Ask me about bows." } },
  },
}
