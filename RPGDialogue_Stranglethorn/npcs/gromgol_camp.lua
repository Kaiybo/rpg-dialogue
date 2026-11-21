-- Grom'gol, the camp's working hands: Durik (stable master), Squibby Overspeck (zeppelin master, the Undercity line),
-- Vharr (weaponsmith), Mudduk (cook) and Nerrist (trade goods).
-- Voice: bibles/gromgol_camp.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_QUEST = P.TODO_QUEST
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Durik, stable master
---------------------------------------------------------------------------
P:NPC {
  key = "durik", id = TODO_NPC("Durik"), name = "Durik",
  title = "Stable Master",
  bible = "bibles/gromgol_camp.md", role = "stablemaster", tier = "service",
  communities = { "gromgol" }, temper = { "gruff", "patient" }, values = { "beasts", "duty" },
  notices = { "pet", "race" },

  impression = {
    first = "He speaks more gently to a raptor than to me.",
    third = "{name} met Durik, the orc who stables hunters' beasts at Grom'gol and keeps the raptors fed.",
  },

  greetings = {
    { id = "g_default", text = "Mind the stakes and keep your hands where the raptors can see them, because they bite what surprises them." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your beast remembers me, even if you have forgotten my name, so come in." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You are a long way from your own kind, and the grunts at the gate are watching you. Say what you want and go." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has jungle mud to the shoulders and a thorn in the left forefoot, I would wager. Let me look before you go anywhere." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren keeps a beast the way it should be kept, as kin and not as a tool. I can always tell whose animals have been raised in Mulgore." },
  },

  start = "hello",
  nodes = {
    dd_durik_b = {
      lines = {
        { id = "dd_durik_b_a", text = "Maybe, and maybe he'd have taken my arm off, which is how most taming begins. A beast like that respects strength and patience both, and the humans at their camp only bring strength, so they come back with skins instead of friends." },
      },
      choices = {
        { text = "A beast that kills raptors deserves death, not a collar.", next = "dd_durik_b2", fx = { align = { order = 1 } } },
        { text = "I'd rather have seen him run free in the jungle.", next = "dd_durik_b2", fx = { align = { order = -1 } } },
      },
    },
    dd_durik_b2 = {
      lines = {
        { id = "dd_durik_b2a", text = "Both are honest answers, and I've had both thoughts on the same night. Come and see the raptors before you go, because they settle when someone strong is near, and you smell of a good hunt." },
      },
      choices = { { text = "I'll do that. Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "dd_bangalash_durik", when = { killed = { name = "Bangalash" } },
          text = "You killed the great white tiger that the human hunter wanted, Bangalash. I'd have tamed him, given a season, but I won't pretend he didn't need killing, because he'd taken three of our raptors off the jungle trail." },

        { id = "h_default", key = true,
          text = "Durik, stable master of Grom'gol. I keep beasts fed, rested and out of the jaws of what lives in this jungle, and that last part is most of the work." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good. Leave your beast with me if you need to, and I will feed it raptor flank and keep the flies out of its eyes until you come back for it." },
        { id = "h_hunter_pet", when = { class = "HUNTER", pet = { type = "Beast" } },
          text = "That beast of yours has been running too long in this heat, hunter, and I can see it in the way {pet} holds its tongue. Let it rest a night here and it will thank you for it." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear. Your people knew these beasts before the Horde ever set foot here, so if you see me doing something wrong with the raptors, tell me now." },
      },
      again = {
        { id = "h_again", text = "Something else? Speak, but quietly, because the young raptor startles." },
        { id = "h_again2", text = "Ask what you want. The beasts are fed and I have a little time." },
      },
      choices = {
        { text = "Could you really have tamed Bangalash, Durik?", next = "dd_durik_b", when = { killed = { name = "Bangalash" } } },

        { text = "I need to stable a beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you keep beasts alive in this jungle?", next = "jungle" },
        { text = "Do you keep raptors of your own?", next = "raptors" },
        { text = "What do you think of Nesingwary's hunters?", next = "nesingwary" },
        { text = "I'll leave you to your beasts.", next = "END" },
      },
    },

    jungle = {
      lines = { { id = "ju_default", text = "Clean water, shade, and a fence the panthers cannot climb, which took three tries to build. The heat kills more beasts than the tigers do, and the fever that comes off the swamp water kills more than both." } },
      choices = {
        { text = "Three tries? What happened to the first two?", next = "fence" },
        { text = "Something else, Durik.", next = "BACK" },
      },
    },
    fence = {
      lines = { { id = "fe_default", text = "A shadowmaw panther went over the first one in the night and took a wolf that belonged to a grunt from Durotar. The second one I built higher, and a gorilla pulled it down for no reason I have ever understood, so now the stakes are sharp and the gorillas stay away." } },
      choices = {
        { text = "The grunt must have taken the wolf's death hard.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    raptors = {
      big = true,
      lines = { { id = "ra_default", text = "Two hatchlings, taken from a nest the lashtails left behind outside the gate. Some of the grunts say we should crack the eggs before they hatch and be done with it, but a raptor raised by an orc hand will run for the Horde one day." } },
      choices = {
        { text = "Tame them. The jungle's beasts should serve the Horde.", next = "BACK", reply = "A tame raptor is a strong friend, and a fed one even better. I'll raise them well, and the grunts who wanted eggs for breakfast can find their own.", fx = { align = { order = 1 } } },
        { text = "Leave them wild. A raptor isn't meant for a pen.", next = "BACK", reply = "Maybe so, and I won't pretend they'll ever love a fence. But two hatchlings alone outside the gate are panther food by morning, so the pen is kinder.", fx = { align = { order = -1 } } },
        { text = "Has anyone ever ridden one?", next = "ride" },
      },
    },
    ride = {
      lines = { { id = "ri_default", text = "The Darkspear say their people rode them long ago, and old Kin'weelay, the Darkspear here in camp, tells it as though it were yesterday. I have tried once, and I have the scar on my thigh to show you how that went." } },
      choices = {
        { text = "Keep trying, and you'll get there.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nesingwary = {
      lines = { { id = "ne_default", text = "They kill the jungle's beasts for trophies and leave the meat for the flies, and I have no love for that. Still, every tiger they shoot is one less that comes sniffing at my fence at night, so I do not curse them as loudly as I could." } },
      choices = {
        { text = "Hunting for sport is a waste of good meat.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else, Durik.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the commander about that. I know beasts, and beasts do not gossip." } },
  },
}

---------------------------------------------------------------------------
-- Squibby Overspeck, zeppelin master (the Undercity line)
---------------------------------------------------------------------------
P:NPC {
  key = "squibby", id = TODO_NPC("Squibby Overspeck"), name = "Squibby Overspeck",
  title = "Zeppelin Master",
  bible = "bibles/gromgol_camp.md", role = "flightmaster", tier = "service",
  communities = { "gromgol" }, temper = { "chatty", "nervous" }, values = { "profit", "schedule" },
  notices = { "race", "weary" },

  impression = {
    first = "He says the Undercity pays on time but never smiles.",
    third = "{name} met Squibby Overspeck, the goblin who sends the zeppelin north from Grom'gol to the Undercity.",
  },

  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Night flight, pal, best view of nothin' you'll ever pay for! She leaves when she leaves, so stay close to the tower." },
    { id = "g_default", text = "Tirisfal Glades, pal, the Undercity line, leaving from the top of the tower whenever the wind and the Cartel agree, which is about twice a day if the gas bags behave!" },
    { id = "g_back", when = { metBefore = true }, text = "My favorite repeat customer! Well, top five, but the list is short and you're on it." },
  },

  notice = {
    { id = "n_x1", cat = "weary", when = { minLevel = 40 },
      text = "You look like a frequent flyer, friend. I oughta start a ledger for folks like you, ten trips and the eleventh costs exactly the same." },
    { id = "n_x2", cat = "race", when = { race = "Troll" },
      text = "A Darkspear headin' north! The Forsaken don't say much to your people, pal, but they don't say much to anybody, so don't take it personal." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Going home, are ya? Lovely, lovely, and listen, you folks don't breathe, so you won't need a seat by the rail for the air, and I'll sell that one to a troll." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Whoa, you look like you've been run through the Spirit Healer twice, buddy. Sit down at the top of the tower and don't fall off, because the paperwork's murder." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Squibby Overspeck, Steamwheedle Cartel, zeppelin master of the Tirisfal run. Nez'raz has the Orgrimmar ship and the nice view, and I've got the long haul north to the gloomiest port in the world, so ask me anything, friend, it passes the time." },
        { id = "h_undead", when = { race = "Scourge" },
          text = "Ahh, one of the Forsaken, a valued customer, a very valued customer! You folks never get airsick, you never eat the ship's biscuits, and you never complain about the cold, so frankly you're my favorite cargo." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren for the northern run! Stand in the middle, big fella, because the last time a tauren leaned on the starboard rail we came down in Hillsbrad with a lot of explaining to do." },
      },
      again = {
        { id = "h_x_again1", text = "What else, pal? She's not in yet, so I'm all yours." },
        { id = "h_again", text = "What else, pal? The ship's late, so I've got nothing but time and opinions." },
        { id = "h_again2", text = "Go on, go on, ask away, every question's free until it's a ticket." },
      },
      choices = {
        { text = "Is the zeppelin really safe?", next = "safe" },
        { text = "What's the Undercity like to deal with?", next = "undercity" },
        { text = "Why does a goblin run Horde zeppelins?", next = "cartel" },
        { text = "How long is the run to Tirisfal?", next = "run" },
        { text = "You and Nez'raz split the towers.", next = "nezraz" },
        { text = "I'd sooner march than fly in that thing.", next = "march", when = { race = "Orc", class = "WARRIOR" } },
        { text = "I'll go and wait for the zeppelin.", next = "END" },
      },
    },

    safe = {
      lines = { { id = "sa_default", text = "Safe as houses, pal, and in Booty Bay the houses only fall in the water about once a year. The gas bag's patched, the ropes are new, the pilot's mostly sober, and if anything does go wrong you'll have a lovely view on the way down." } },
      choices = {
        { text = "Mostly sober?", next = "pilot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pilot = {
      big = true,
      lines = { { id = "pi_default", text = "He drinks a little to calm his nerves, and he flies a little better calm, so I call it a safety measure and I bill it as one. You want a nervous pilot over Arathi with the wind coming off the mountains? I didn't think so." } },
      choices = {
        { text = "A pilot who drinks shouldn't fly. Ground him.", next = "BACK", reply = "Ground him? Pal, do you know what a grounded pilot costs me per day in idle zeppelin? I'll take a calm drunk over an empty sky every time, and so will my ledger.", fx = { align = { order = 1 } } },
        { text = "If he gets us there, I don't care what he drinks.", next = "BACK", reply = "Now that's a customer I can work with, friend! Arrival's what you paid for, and arrival's what you get, give or take a bit of tree on the gondola.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    undercity = {
      lines = { { id = "uc_default", text = "Cold, quiet and very particular about the paperwork, which I respect, being a goblin. The Forsaken pay on time to the copper, and they never haggle, and then they look at you with those eyes and you start offering discounts just to make 'em stop." } },
      choices = {
        { text = "They frighten you, then.", next = "uc_fear" },
        { text = "Something else, Squibby.", next = "BACK" },
      },
    },
    uc_fear = {
      lines = { { id = "uf_default", text = "Frighten? No, no, no, I'm a professional, pal. I just keep a ledger of every Forsaken passenger's name, and I make sure every one of 'em gets off at the other end, so nobody can say I lost one on the way and owe their next of kin, if they've got any." } },
      choices = {
        { text = "That's careful bookkeeping.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cartel = {
      lines = { { id = "ca_default", text = "Because the Horde needed ships that fly and the Cartel needed customers who pay, and neither of us cared much what the other one looked like. The orcs built the towers and we built the zeppelins, and every ticket goes in a ledger in Booty Bay, where the Baron reads 'em like poetry." } },
      choices = {
        { text = "So you'd fly the Alliance too, for the right price.", next = "BACK", fx = { learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    run = {
      lines = {
        { id = "run_1", text = "Depends on the wind and the pilot, friend, and whether we go round the storm or through it. Call it long enough to regret your lunch and short enough that you can't ask for your money back." },
      },
      choices = {
        { text = "What's below, on the way?", next = "below" },
        { text = "Something else.", next = "BACK" },
      },
    },
    below = {
      lines = {
        { id = "below_1", text = "Jungle, then swamp, then mountains with dwarves in 'em who'd love a shot at us, then a whole lot of dead farmland. I tell passengers to look at the clouds, on account of the clouds haven't got opinions." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    nezraz = {
      lines = {
        { id = "nezraz_1", text = "We flipped a coin for Orgrimmar and I'd like it on record that it was his coin. He gets warriors goin' home happy, and I get folks goin' to the Undercity, who tip like they're already dead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    march = {
      lines = {
        { id = "march_1", text = "From here to Tirisfal? Pal, that's through Duskwood, Stormwind's whole kingdom, three dwarf lands and the plague, and I admire the spirit, I do. The zeppelin's faster and the only thing shootin' at you is weather." },
      },
      choices = {
        { text = "You make a fair case. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_x_background", text = "Steamwheedle through and through, pal. I started on the Booty Bay docks countin' crates, and now I count passengers, which complain more." } },
    rumors = { { id = "tp_x_rumors", text = "Word from the Tirisfal tower is the apothecaries are shipping crates south marked \"do not open\". I do not open 'em, friend, and I charge extra for not openin' 'em." } },
    gromgol = { { id = "tp_x_gromgol", text = "Nice little camp, good customers, terrible weather for canvas. I patch that gas bag more than I patch my trousers." } },
    advice = { { id = "tp_x_advice", text = "Stand in the middle of the deck, hold the rail, and don't lean out to wave. I've lost two hats and one passenger that way." } },
    _none = { { id = "tp_none", text = "No idea, pal, and I don't charge for not knowing, so you're getting a bargain." } },
  },
}

---------------------------------------------------------------------------
-- Vharr, weaponsmith
---------------------------------------------------------------------------
P:NPC {
  key = "vharr", id = TODO_NPC("Vharr"), name = "Vharr",
  title = "Superior Weaponsmith",
  bible = "bibles/gromgol_camp.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "proud", "blunt" }, values = { "strength", "craft" },
  notices = { "class", "kit" },

  impression = {
    first = "His thumb has more scars than mine from testing edges.",
    third = "{name} met Vharr, the orc who sells blades and axes to the soldiers at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "Blades, axes and maces, and each will hold an edge through a troll's skull. Look, but do not touch the edges." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and still in one piece, so the steel I sold you did its work." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior with a notched blade is a warrior who will be dead by the next moon. Show me what you carry." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear is falling off you. Buy a weapon from me, and then go and find someone to fix the rest." },
  },

  start = "hello",
  nodes = {
    dd_vharr_b = {
      lines = {
        { id = "dd_vharr_b_a", text = "Good, because the Bloodscalp raid our supply lines every week and take heads for their shrines. The Darkspear in this camp say they were kin once, long ago, but kin who takes your head is no kin of yours." },
      },
      choices = {
        { text = "Kin or not, they chose blood. They get blood back.", next = "dd_vharr_b2", fx = { align = { light = -1 } } },
        { text = "If they were kin, maybe some could still be turned.", next = "dd_vharr_b2", fx = { align = { light = 1 } } },
      },
    },
    dd_vharr_b2 = {
      lines = {
        { id = "dd_vharr_b2a", text = "Talk to the Darkspear about that, not to me, because I only sell steel and keep it sharp. Whatever you choose, carry a good blade while you choose it." },
      },
      choices = { { text = "Something else, Vharr.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "dd_bloodscalp_vharr", when = { killed = { name = "Bloodscalp", min = 50 } },
          text = "Your blade's notched with Bloodscalp bone, I can see it from here, and a lot of it. They're trolls who forgot the Darkspear were ever their cousins, so I'll not mourn a single one of them, and I'll sharpen that edge for the next." },

        { id = "h_default", key = true,
          text = "I am Vharr, and I arm Grom'gol. The steel comes on the zeppelin from Orgrimmar, and the rest comes from goblins in Booty Bay who charge too much and smile while they do it." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc who knows what a good axe is worth, I hope. The grunts here buy whatever is cheapest, and then they come back missing fingers and blame my steel." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Darkspear, you will want something light that throws well, I think. Your people kill from the trees, and I have learned to stock for it." },
      },
      again = {
        { id = "h_again", text = "What else? I have steel to sharpen." },
        { id = "h_again2", text = "Speak. The grindstone can wait a little." },
      },
      choices = {
        { text = "I've cut down many Bloodscalp, Vharr.", next = "dd_vharr_b", when = { killed = { name = "Bloodscalp", min = 50 } } },

        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What weapon works best against the trolls here?", next = "trolls" },
        { text = "You don't think much of the goblins.", next = "goblins" },
        { text = "Your thumb has more scars than mine.", next = "thumb" },
        { text = "What about the ogres in the Mosh'Ogg mound?", next = "ogres" },
        { text = "I need a blade that bites, smith. What do you have?", next = "warrior", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "Do Forsaken hands suit an orc's axe?", next = "undead", when = { race = "Scourge" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    trolls = {
      lines = { { id = "tr_default", text = "Something heavy, because the Bloodscalp and the Skullsplitter come at you fast and wild, and a light blade only makes them angry. An axe takes the arm off before the spear reaches you, and that is the whole of my advice." } },
      choices = {
        { text = "And the Darkspear among us?", next = "darkspear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkspear = {
      big = true,
      lines = { { id = "da_default", text = "The Darkspear are Horde, and I sell to them gladly. But a troll is a troll in the jungle at night, and some of the grunts here have trouble telling one kind from another when the screaming starts." } },
      choices = {
        { text = "The Darkspear are our brothers. Tell your grunts to learn the difference.", next = "BACK", reply = "I have told them, and I will tell them again, louder. A Darkspear speared by a grunt in the dark is a shame on the whole camp.", fx = { align = { honor = 1 } } },
        { text = "Then the Darkspear should keep clear of the fighting.", next = "BACK", reply = "That would be easier, but it would not be Horde. Thrall made them our brothers, and we will learn to see in the dark before we send them away.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thumb = {
      lines = { { id = "th_default", text = "Every scar is a blade I would not sell. If it cuts my thumb with no weight behind it, it will cut a troll with my arm behind it, and if it does not, it goes back on the zeppelin to the smith who made it." } },
      choices = {
        { text = "Who makes your steel in Orgrimmar?", next = "th_smith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    th_smith = {
      lines = { { id = "ths_default", text = "The forges in the Valley of Honor, where the smiths remember the old ways from before the demon blood. The steel there is honest, and I send them back the bad blades with a note so they remember Vharr's thumb." } },
      choices = {
        { text = "Do you ever forge your own?", next = "th_own" },
        { text = "Something else.", next = "BACK" },
      },
    },
    th_own = {
      lines = { { id = "tho_default", text = "Not here; the damp would rust my anvil in a week. One day, when the jungle is ours and the camp has stone walls, I will build a forge here, and the grunts will carry Grom'gol steel. Until then I sharpen and I sell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ogres = {
      lines = { { id = "og_default", text = "Big, slow and stupid, until one of their mages throws fire at you, and then only big and slow. A mace for an ogre, because their hides turn a blade, and aim for the knees, because you will not reach the head." } },
      choices = {
        { text = "Some ogres fight for the Horde now.", next = "BACK", fx = { learn = { "mosh_ogg" } },
          reply = "Some do, the Stonemaul down in the Dustwallow marsh. These do not, and they will learn the difference from my maces." },
        { text = "Something else.", next = "BACK", fx = { learn = { "mosh_ogg" } } },
      },
    },

    warrior = {
      lines = { { id = "wa_default", text = "Then hold out your hand and let me see how you grip. Too tight, and the blade will turn in your palm the first time it strikes bone. Loosen it, {class}, and let the weight do the work." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },

    undead = {
      lines = { { id = "un_default", text = "Forsaken hands are weaker and colder, but they do not flinch, and that counts for a great deal. Take something lighter than an orc would carry and strike more often, and do not let the troll's spear reach what is left of your ribs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    goblins = {
      lines = { { id = "go_default", text = "They make good steel and they sell it to anyone, Horde or Alliance, and then they sit in Booty Bay counting it while we bleed for this ground. An orc forges for his own people, and a goblin forges for his purse, and I know which I trust in battle." } },
      choices = {
        { text = "Their steel spends just as well as yours.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I sell weapons. Ask someone who sells talk." } },
    mosh_ogg = { { id = "tp_moshogg", text = "Take a mace and aim for the knees. You will not reach the head." } },
    goblins = { { id = "tp_goblins", text = "They forge for their purse, and they sell to anyone. I trust orc steel." } },
  },
}

---------------------------------------------------------------------------
-- Mudduk, cook
---------------------------------------------------------------------------
P:NPC {
  key = "mudduk", id = TODO_NPC("Mudduk"), name = "Mudduk",
  title = "Superior Cook",
  bible = "bibles/gromgol_camp.md", role = "trainer", tier = "service",
  communities = { "gromgol" }, temper = { "cheerful", "proud" }, values = { "food", "comfort" },
  notices = { "craft", "race" },

  impression = {
    first = "He hands you a spiced bowl before he tells you his name.",
    third = "{name} ate from Mudduk's pot at Grom'gol, where the orc cook teaches anyone who will stand still long enough.",
  },

  greetings = {
    { id = "g_default", text = "Eat first and talk after, that is the rule at my fire, and nobody in this camp has broken it and kept their supper." },
    { id = "g_back", when = { metBefore = true }, text = "You came back for the stew, I knew it. Everyone comes back for the stew." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell of woodsmoke and raptor fat, so you cook. Good, then you will understand why I do not let the grunts near my spices." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Do not look in the pot, friend. There is no kodo in it, I promise, but you will feel better if you do not look." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "dd_defense_mudduk", when = { questDone = TODO_QUEST("The Defense of Grom'gol") },
          text = "Commander Aggro'gosh says you helped hold Grom'gol against the jungle beasts, so you'll eat first tonight. I'll put an extra piece of meat in the bowl, because a warrior who bleeds for the camp should be fed like one." },

        { id = "h_default", key = true,
          text = "Mudduk, cook of Grom'gol, and I feed every grunt, every shaman and every wind rider in this camp. Soldiers fight on their bellies, and in this jungle there is always something new to put in the pot." },
        { id = "h_cook", when = { profession = "Cooking" },
          text = "Another cook! Come, come, I will teach you what I know, and you will tell me what they are eating in Orgrimmar these days, because the zeppelin brings me nothing but salt pork." },
      },
      again = {
        { id = "h_again", text = "What else? Stir while you ask, it keeps the bottom from burning." },
        { id = "h_again2", text = "Ask, ask. The stew is not going anywhere, and neither am I." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's in the stew?", next = "stew" },
        { text = "What's the strangest thing you've cooked here?", next = "strange" },
        { text = "Who eats at your fire?", next = "who" },
        { text = "Your pot looks older than the camp.", next = "pot" },
        { text = "Is there really no kodo in that pot?", next = "kodo", when = { race = "Tauren" } },
        { text = "That root you use, mon, I know it.", next = "troll", when = { race = "Troll" } },
        { text = "I'm not hungry, thanks.", next = "END" },
      },
    },

    stew = {
      lines = { { id = "st_default", text = "Raptor, mostly, and river crocolisk when the hunters bring it, and a root the Darkspear showed me that makes your tongue go numb for a moment. Nobody has died of it yet, so I keep using it." } },
      choices = {
        { text = "Yet?", next = "yet" },
        { text = "Something else, Mudduk.", next = "BACK" },
      },
    },
    yet = {
      big = true,
      lines = { { id = "ye_default", text = "One grunt went very quiet for a day, but he was a quiet one already, so I do not count him. The commander says I am to tell the grunts what goes in the pot, and I say a cook who explains himself never gets to cook anything new." } },
      choices = {
        { text = "The commander's right. Tell them what they're eating.", next = "BACK", reply = "The commander's right about many things, but not about my pot. Tell a grunt what he eats and he stops eating it, and a hungry grunt is a weak one.", fx = { align = { honor = 1 } } },
        { text = "They'll eat what you give them. Keep your secrets.", next = "BACK", reply = "Ha! Now you talk like a cook, and I like you for it. Full bellies ask no questions, and that is how the camp stays strong.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    who = {
      lines = { { id = "wh_default", text = "Every grunt, every scout back from the Mosh'Ogg mound, and Commander Aggro'gosh himself, who eats standing up so no one thinks he is resting. The Far Seer eats last and least, and I save him the best of the pot, though he never notices." } },
      choices = {
        { text = "Why does the Far Seer eat so little?", next = "wh_seer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_seer = {
      lines = { { id = "whs_default", text = "Mok'thardin says the spirits speak more clearly to an empty belly. I say the spirits would speak more kindly to a full one, and we have had this argument every night since we landed on this shore." } },
      choices = {
        { text = "Who wins the argument?", next = "wh_win" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_win = {
      lines = { { id = "whw_default", text = "He does, because he is a Far Seer and I am a cook. But I notice his bowl comes back empty, and the spirits have never once complained about my stew." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    pot = {
      lines = { { id = "po_default", text = "It is older than the camp and older than me, almost. It hung over a fire in the internment camps, and when Thrall freed us I carried it out on my back, because a cook without his pot is just another orc with a spoon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kodo = {
      lines = { { id = "ko_default", text = "No kodo, I swear it on my pot. There is no kodo in all of Stranglethorn, and if there were I would leave it for your people to honour. Raptor only, and a little crocolisk, and the root." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    troll = {
      lines = { { id = "tr_default", text = "Of course you know it, it was a Darkspear who showed it to me, and he laughed for an hour when I tasted it raw. Tell me, how much do your people put in? I have been guessing, and the grunts have been paying for my guesses." } },
      choices = {
        { text = "A pinch only. You're using far too much.", next = "BACK",
          reply = "A pinch! That explains the quiet grunt. Thank you, friend." },
        { text = "Something else.", next = "BACK" },
      },
    },

    strange = {
      lines = { { id = "sr_default", text = "A basilisk, from up by the crystal mines, and the meat glittered in the pot like it was full of little stones. It tasted of nothing at all, and Kin'weelay, the Darkspear by the north gate, would not touch it, which tells you something." } },
      choices = {
        { text = "I'll take the raptor, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I do not know that, but I know you look hungry. Eat something." } },
    advice = { { id = "tp_ad", text = "Never go into the jungle hungry. The jungle is always hungry too." } },
    mokthardin = { { id = "tp_seer", text = "He says the spirits like an empty belly. His bowl always comes back empty, though." } },
  },
}

---------------------------------------------------------------------------
-- Nerrist, trade goods
---------------------------------------------------------------------------
P:NPC {
  key = "nerrist", id = TODO_NPC("Nerrist"), name = "Nerrist",
  title = "Trade Goods",
  bible = "bibles/gromgol_camp.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "sharp", "dry" }, values = { "order", "thrift" },
  notices = { "craft" },

  impression = {
    first = "She knows to the last spool what is in each crate.",
    third = "{name} bought from Nerrist, the orc who keeps the trade goods at Grom'gol in good order.",
  },

  greetings = {
    { id = "g_default", text = "Thread, flux, vials and salt, and none of it is free. Tell me what you need and I will tell you which crate." },
    { id = "g_back", when = { metBefore = true }, text = "You again. What did you run out of this time?" },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Blacksmithing" } },
      text = "A crafter. Then you know that thread rots in this damp, so buy what you need for a week and no more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nerrist. I keep the trade goods for Grom'gol, and I keep them dry, which in this jungle is a war of its own. The rot gets into everything if you let it, and I do not let it." },
        { id = "h_goblin", when = { race = "Goblin" },
          text = "A goblin, come to see what an orc charges. Less than Booty Bay, and you may tell them so." },
      },
      again = {
        { id = "h_again", text = "What else? I have a crate to count." },
        { id = "h_again2", text = "Ask quickly. The damp does not wait." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How do you keep anything dry here?", next = "damp" },
        { text = "Where do your goods come from?", next = "supply" },
        { text = "What sells fastest in a war camp?", next = "sells" },
        { text = "You count those crates like a quartermaster.", next = "count" },
        { text = "I came down on the zeppelin from the Undercity.", next = "undead", when = { race = "Scourge" } },
        { text = "How do you keep silk from rotting?", next = "silk", when = { profession = "Tailoring" } },
        { text = "Nothing today.", next = "END" },
      },
    },

    damp = {
      lines = { { id = "dm_default", text = "Salt in the bottom of every crate, oilcloth over the top, and nothing ever touches the ground, and so my stall stands on stones. A grunt laughed at my stones once, and then his tent flooded in the rains, and he has not laughed since." } },
      choices = {
        { text = "That's careful work.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "What rots the worst?", next = "dm_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dm_worst = {
      lines = { { id = "dmw_default", text = "Leather, then thread, then the grunts' boots, and the boots I cannot help. A hide left out for one night grows a green fur by morning, so the hunters bring their skins to me before they bring them to the fire." } },
      choices = {
        { text = "And the vials? Does the damp spoil them?", next = "dm_vials" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dm_vials = {
      lines = { { id = "dmv_default", text = "The glass does not rot, but the corks swell and split, and then whatever is inside turns to swamp water. I seal them with wax from the Undercity, which the Forsaken make from things I do not ask about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sells = {
      lines = { { id = "se_default", text = "Linen for bandages, before everything else, and after that salt for the meat and flux for the smiths. A camp at war bleeds and eats and breaks things, and I sell to all three." } },
      choices = {
        { text = "Do the wounded pay for their own bandages?", next = "se_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    se_pay = {
      lines = { { id = "sep_default", text = "The commander's purse pays for the grunts, and the travellers pay for themselves, and that is the rule. Some say the Horde should give freely to any who bleed for it, and some say a trader who gives freely has nothing left to give." } },
      choices = {
        { text = "Give the wounded what they need. The Horde is family.", next = "BACK", fx = { align = { light = 1 } },
          reply = "Family still needs thread, and thread still costs coin. But I will not turn away a bleeding grunt." },
        { text = "Charge everyone. Free goods make soft warriors.", next = "BACK", fx = { align = { light = -1 } },
          reply = "Then we agree, and my crates stay full." },
        { text = "Something else.", next = "BACK" },
      },
    },

    count = {
      lines = { { id = "co_default", text = "I was one, at the internment camps, before Thrall broke them open. A camp guard counted us every morning, and when I was free I swore that I would do the counting from then on, and I have counted ever since." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },

    undead = {
      lines = { { id = "un_default", text = "Then you know the zeppelin smells of goblin oil and the rain does not stop when you land. Keep your bandages in oilcloth, Forsaken; you heal slower than we do, and the jungle knows it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    silk = {
      lines = { { id = "si_default", text = "Wrap it in linen, pack it in salt, and keep it off the ground, the same as everything else. Silk is costly and rot is cheap, so do not trust a trader who keeps silk in a basket." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },

    supply = {
      big = true,
      lines = { { id = "su_default", text = "Most of it comes by zeppelin from Orgrimmar and the Undercity, and the rest I buy from goblins on the coast road who do not ask where I am taking it. The commander says I should buy only from the Horde, but the Horde does not make enough thread to sew a sail." } },
      choices = {
        { text = "Buy from the Horde first. Our coin should stay with our own.", next = "BACK", reply = "That is my thinking too, and I do it when I can. But Orgrimmar's thread rots in this damp as fast as any goblin's, so I buy what lasts.", fx = { align = { order = 1 } } },
        { text = "Buy wherever it's cheapest. The commander needn't know.", next = "BACK", reply = "The commander knows more than he says, and he would say I am being sneaky if he caught me. Still, a dry tent matters more to the grunts than where the thread came from.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I sell goods. I do not sell answers." } },
    knows = { { id = "tp_knows", text = "Every crate in Grom'gol, and what is in it, and how long before it rots." } },
    advice = { { id = "tp_ad", text = "Keep everything off the ground. Everything." } },
    aggrogosh = { { id = "tp_aggro", text = "The commander pays for the grunts' bandages and asks me to buy Horde thread. I do one of those." } },
  },
}
