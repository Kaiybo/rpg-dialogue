-- Three goblins at Marshal's Refuge: Shizzle and his half-built flyer, Quixxil the expedition's
-- fixer, and Gibbert who sells the weapons. Voice: bibles/refuge_goblins.md (goblin standard, CONTENT_GUIDE §2)
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Shizzle: stranded, building a flying machine, scared of pterrordax
---------------------------------------------------------------------------
P:NPC {
  key = "shizzle", id = TODO_NPC("Shizzle"), name = "Shizzle",
  bible = "bibles/refuge_goblins.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "cowardly", "eager" }, values = { "inventive", "ambitious" },
  notices = { "craft", "race", "level" },

  impression = {
    first = "Shizzle is a goblin stranded in Un'Goro who means to fly out on a machine of his own making. He has everything but the wings, and he is far too frightened of pterrordax to go and get them himself.",
    third = "{name} met Shizzle, a stranded goblin tinker at Marshal's Refuge building a flying machine to get out of Un'Goro.",
  },

  greetings = {
    { id = "g_default", text = "Hey, hey, pal, you look like somebody who isn't scared of big flappy lizards. Got a minute? Got a minute for a business opportunity?" },
    { id = "g_flyer", when = { questActive = TODO_QUEST("Shizzle's Flyer") }, text = "Scales, buddy, webbed scales, off the pterrordax out west in the Screaming Reaches. Every one you bring is a rivet in my ticket home." },
    { id = "g_flyer_done", when = { questDone = TODO_QUEST("Shizzle's Flyer") }, text = "She's got wings now, pal, real wings! I haven't flown her yet, but I've sat in her and made the noises, and that's practically the same." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'm still here, which tells ya how the flyer's going. Don't ask about the flyer." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, by my last copper, finally somebody who knows a rotor from a rolling pin. Don't look too close at my welds, though; I was in a hurry and the welds know it." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, huh? No offense, sweetheart, but if you so much as breathe on my flyer it'll probably grow a second propeller and explode. I've heard about you people." },
    { id = "n_high", cat = "level", when = { minLevel = 58 },
      text = "Whoa, look at you, all scarred up and confident. A pterrordax would take one look at you and fly the other way, and frankly I'd pay to see it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Shizzle, inventor, entrepreneur and, at present, a castaway, so here's the deal, friend. I came down into this crater on a job, the job went sideways, and now I'm stuck, so I'm building myself a flyer out of parts and stubbornness, and all she needs now is a pair of wings." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Shizzle's Flyer") },
          text = "The best wing stuff in the crater is webbed scales off the pterrordax in the Screaming Reaches, out west, light as paper and tough as a banker. I'd go get 'em myself, but I've seen what those things do to a goblin, and I'm attached to my arms." },
        { id = "h_active", when = { questActive = TODO_QUEST("Shizzle's Flyer") },
          text = "Thirty-five scales, pal, that's what the math says, and I checked the math twice because I'm the one who's gonna be flying on it. Watch the beaks; they go for the eyes." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Shizzle's Flyer"), days = 3 } },
          text = "Look at these, look at the webbing on 'em, they're perfect! I could kiss ya, but I'll pay ya instead, because that's how I show I care, and frankly it's less awkward for everybody." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I got nothin' but time and spare bolts." },
        { id = "h_again2", text = "Go on, ask. Talking keeps me from staring at the sky." },
      },
      choices = {
        { text = "How did you end up stranded?", next = "stranded" },
        { text = "Tell me about this flyer.", next = "flyer" },
        { text = "Why not just walk out of the crater?", next = "walk" },
        { text = "Are you really that scared of pterrordax?", next = "scared" },
        { text = "Let me see your engine work.", next = "xeng", when = { profession = "Engineering" } },
        { text = "I'll leave you to your bolts.", next = "END" },
      },
    },
    stranded = {
      lines = {
        { id = "s_default", text = "Came down with a crew to see if there was money in the crystals, and there was, right up until a devilsaur stepped on the wagon. The crew ran one way and I ran the other, and when I stopped running I was here and they were nowhere." },
      },
      choices = {
        { text = "Who were you working for?", next = "employer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    employer = {
      big = true,
      lines = {
        { id = "e_default", text = "Let's say a fella in Gadgetzan with a big desk and a short memory, and leave it there, huh? I signed a paper that said 'liability' on it about nine times, so I don't expect anybody's coming to fetch me." },
      },
      choices = {
        { text = "Then they owe you. Make them pay when you're out.", next = "BACK", reply = "Make 'em pay? Pal, I'm gonna send 'em an invoice so big it'll need its own zeppelin. Liability works both ways, I figure.", fx = { align = { honor = -1 } } },
        { text = "You signed it. A deal's a deal, even a bad one.", next = "BACK", reply = "Yeah, yeah, a deal's a deal, and I'm the sucker who signed it. Next time I'm readin' the back of the paper too.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flyer = {
      lines = {
        { id = "f_default", text = "Engine off a wrecked shredder, seat out of a crate, a propeller I traded off Gibbert for a sword I'll never see again, and a fuel line made out of somethin' I'd rather not discuss. Put wings on that and she'll go up, I promise ya, or at least she'll go somewhere." },
      },
      choices = {
        { text = "Has anything you've built ever flown?", next = "flown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flown = {
      big = true,
      lines = {
        { id = "fl_default", text = "Define flown, pal. My cousin's rocket chair went up beautiful and came down in three pieces, and he lost his eyebrows but kept the rest, so technically that's a success in my family. This one's gonna be better, because I'm the one sitting in it." },
      },
      choices = {
        { text = "Take your time and test it properly.", next = "BACK", reply = "Test it properly, sure, pal, if the pterrordax give me the time. Patience is cheap, but rescue's expensive.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Strap in and light it. That's the goblin way.", next = "BACK", reply = "That's the spirit, pal, that's how my cousin lost his eyebrows! Give me a week and I'll light it, maybe.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    walk = {
      lines = {
        { id = "w_default", text = "Walk, he says! Past the devilsaurs and the stegodons and the raptors and the big angry rock fellas at the volcano? The ramp to Tanaris is a long way off, friend, and I'd make it maybe halfway, which is the worst way to make it." },
      },
      choices = {
        { text = "I could escort you.", next = "escort" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escort = {
      lines = {
        { id = "es_default", text = "That's sweet of ya, but I'm not leavin' my flyer here for some Venture Company scrapper to strip for parts. She's my investment, pal, and you don't walk out on an investment." },
      },
      choices = {
        { text = "Fair. I'll fetch the scales instead.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scared = {
      lines = {
        { id = "sc_default", text = "Scared? Ha! No, well, yes, completely, from the tips of my ears down. I saw one pick up a raptor like it was a sandwich and fly off with it, and the raptor was bigger than me and much braver." },
      },
      choices = {
        { text = "There's no shame in being afraid.", next = "scared_shame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scared_shame = {
      big = true,
      lines = {
        { id = "ss_default", text = "That's easy for you to say with all that armour on. Goblins who get brave around big lizards end up as stories other goblins tell to scare their kids, so I'll be a coward with a flyer before I'm a hero in a nest, pal." },
      },
      choices = {
        { text = "Courage is facing fear. You'll find yours.", next = "BACK", reply = "You think so, pal? Maybe I'll find it under a crate somewhere. I'll let you know.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Smart. Let the fools do the fighting.", next = "BACK", reply = "Now that's sound business advice, pal! Fools fight, and smart goblins sell 'em the bandages.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xe_default", text = "Sure, take a look, but don't touch the red wire, the blue wire or, come to think of it, any of the wires. She's a shredder engine bored out twice and running hot, and I've got her geared for lift over speed, because I'd rather go up slow than come down fast." },
      },
      choices = {
        { text = "Your gearing's sound. Your fuel line worries me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_sw", text = "Good people, the Cartel, until you're stuck in a crater and they've got your contract in a drawer. Then they're very good at not answering letters." } },
    venture_company = { { id = "tp_vc", text = "Venture boys would strip my flyer to the frame and sell me the bolts back, pal. Keep 'em away from her." } },
    _none = { { id = "tp_none", text = "Dunno, pal, and I'm not paid to know. I'm not paid at all, come to think of it." } },
  },
}

---------------------------------------------------------------------------
-- Quixxil: Marshal Expeditions' goblin fixer
---------------------------------------------------------------------------
P:NPC {
  key = "quixxil", id = TODO_NPC("Quixxil"), name = "Quixxil", title = "Marshal Expeditions",
  bible = "bibles/refuge_goblins.md", role = "worker", tier = "service",
  communities = { "marshals_refuge" }, temper = { "sly", "brisk" }, values = { "profit", "cunning" },
  notices = { "race", "class" },

  impression = {
    first = "Quixxil works for the Marshal Expedition and somehow also for himself, and he sees a price on everything in the crater. He was friendly, fast-talking and very careful not to say anything the scientists might overhear.",
    third = "{name} met Quixxil, a goblin fixer with the Marshal Expedition who sees a profit in every corner of Un'Goro.",
  },

  greetings = {
    { id = "g_default", text = "Psst, friend, over here, out of the scientists' earshot. You look like somebody who appreciates an opportunity." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer, back again! Well, one of 'em; I've got several favourites, and you're near the top." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, huh? I figured you were dinosaur dinner and I was already writing off your account, pal." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin, sparks and sprockets, finally somebody down here who knows what a margin is! These expedition folks think 'profit' is a dirty word, if you can believe it." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've got quick hands and quick eyes, pal, I can tell. We oughta talk sometime, quietly, about the value of things nobody's watching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Quixxil, fixer for the Marshal Expedition, which means I get things the scientists need and they don't ask how. The crater's a gold mine, friend, crystals and hides and eggs and scales, and these eggheads are so busy writing it all down they never think to put a price on it." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, huh? Doesn't matter to me, pal; the Expedition takes help from anybody who'll climb down the rim, and so do I. Your coin's as round as anybody's." },
      },
      again = {
        { id = "h_again", text = "What else can Quixxil do for ya, friend?" },
        { id = "h_again2", text = "Talk fast, pal. Williden walks by every ten minutes." },
      },
      choices = {
        { text = "What does a fixer actually do here?", next = "fixer" },
        { text = "What's worth money in the crater?", next = "worth" },
        { text = "Do the scientists know about your side business?", next = "scientists" },
        { text = "I'll be on my way, Quixxil.", next = "END" },
      },
    },
    fixer = {
      lines = {
        { id = "fx_default", text = "Somebody needs rope, I find rope, somebody needs a crate of Gadgetzan water hauled down the ramp, I find a fella with a kodo. I take a little off the top for the trouble, and everybody's happy, mostly because nobody else wants to do it." },
      },
      choices = {
        { text = "And the little off the top?", next = "top" },
        { text = "Something else.", next = "BACK" },
      },
    },
    top = {
      big = true,
      lines = {
        { id = "t_default", text = "Listen, listen, it's called overhead, and every honest operation has it. I'm only skimming what they'd lose anyway to spoilage, and theft, and devilsaurs, so you could say I'm saving it from the devilsaurs." },
      },
      choices = {
        { text = "It's still skimming. They trust you.", next = "BACK", reply = "Trust is the most valuable thing I've got, friend, which is why I only skim a little. But you're makin' me feel bad about it, and I don't like that.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Overhead's overhead. Everyone takes a cut.", next = "BACK", reply = "Exactly, friend, that's how the world works! Everybody takes a cut, and mine's very modest.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth = {
      lines = {
        { id = "w_default", text = "Everything, pal, that's the beauty of it! Power crystals for the gnomes, devilsaur leather for the tanners, raptor eggs for the collectors, and those big glowing plants for some alchemist who wants 'em so bad he won't tell me why." },
      },
      choices = {
        { text = "Isn't selling eggs a little cruel?", next = "eggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eggs = {
      big = true,
      lines = {
        { id = "e_default", text = "Cruel's a strong word, friend. There's a million raptors down here and they'd eat you or me without a second thought, so a few eggs going to a nice collector in Booty Bay is practically charity, for the egg." },
      },
      choices = {
        { text = "Leave the nests alone. This place should stay wild.", next = "BACK", reply = "Wild, sure, friend, but wild doesn't pay the bills. Fine, fine, I'll ease off the nests a bit, for my conscience.", fx = { align = { order = 1 } } },
        { text = "The crater's huge. A few eggs won't matter.", next = "BACK", reply = "That's what I keep sayin', friend! A million raptors, a few eggs, and everybody's happy except the eggs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scientists = {
      lines = {
        { id = "s_default", text = "They know I'm good at finding things, and they don't ask where, which is the healthiest arrangement for everybody. Williden's a decent sort, but he'd turn purple if he saw my books, so my books stay where he can't see 'em." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_sw", text = "Good outfit, the Cartel. I learned everything I know from 'em, including what not to write down." } },
    venture_company = { { id = "tp_vc", text = "Competition, pal, and dirty competition at that. They strip a place bare; I just take a little off the edges." } },
    _none = { { id = "tp_none", text = "Never heard of it, friend, but if it's worth anything, let me know and we'll talk percentages." } },
  },
}

---------------------------------------------------------------------------
-- Gibbert, Weapon Merchant
---------------------------------------------------------------------------
P:NPC {
  key = "gibbert", id = TODO_NPC("Gibbert"), name = "Gibbert", title = "Weapon Merchant",
  bible = "bibles/refuge_goblins.md", role = "vendor", tier = "service",
  communities = { "marshals_refuge" }, temper = { "jovial", "brisk" }, values = { "profit", "practical" },
  notices = { "class" },

  impression = {
    first = "Gibbert sells weapons at Marshal's Refuge and talks about devilsaurs the way a baker talks about bread. He seemed to think every blade on his rack would be the one that saved me.",
    third = "{name} met Gibbert, the goblin weapon merchant at Marshal's Refuge.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, welcome, step right up! Nothin' sells a sword like a crater full of things that want to eat ya." },
    { id = "g_worn", when = { durability = { max = 0.3 } }, text = "Whoa, buddy, that blade's held together with spit and hope. Let's get you something with an edge before a raptor notices." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and still got both arms! That's good for you, and good for business, because you need arms to swing a sword." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's a customer who knows the value of a heavy blade. You'll want two-handed, I'm guessing, because devilsaurs don't care about your shield." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "A spellcaster, huh? I've got a staff or two, but between you and me, sweetheart, a fireball doesn't stop a stegodon like a mace does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gibbert's the name, weapons are the game, and in Un'Goro the game is staying alive, friend. Swords, axes, maces, a few staves, all hauled down the ramp from Gadgetzan at great personal expense, and that personal expense goes straight on the price tag." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! I've got nothing that shoots, pal, but when a raptor gets inside your bow range you'll want somethin' sharp in the other hand, believe me." },
      },
      again = {
        { id = "h_again", text = "What else, chum? The rack's not getting any lighter." },
        { id = "h_again2", text = "Ask away, friend. Questions are free; swords aren't." },
      },
      choices = {
        { text = "What's the best weapon for the crater?", next = "best" },
        { text = "Business must be good down here.", next = "business" },
        { text = "Did you trade Shizzle a propeller?", next = "shizzle" },
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "Later, Gibbert.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "b_default", text = "Depends what you're fighting, pal. Raptors, somethin' quick; stegodons, somethin' heavy; devilsaurs, a fast pair of boots, but I don't sell those, so buy the biggest axe on the rack and hope." },
      },
      choices = {
        { text = "Have you ever fought a devilsaur?", next = "devilsaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    devilsaur = {
      big = true,
      lines = {
        { id = "d_default", text = "Me? Ha! I hid under a crate while one walked past, and the ground shook so hard the crate fell over and I had to hide under a different crate. That's my one devilsaur story, and I tell it to every customer, so now you've heard it too." },
      },
      choices = {
        { text = "Smart. Living merchants sell more swords.", next = "BACK", reply = "That's what I say too, friend! A dead merchant's got no inventory and no customers.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "You should know the beasts your blades are meant for.", next = "BACK", reply = "Know 'em, sure, friend, from a safe distance under a crate. I know they're big, and that's all the research I need.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      lines = {
        { id = "bu_default", text = "Good? Pal, it's beautiful. Everybody who comes down the rim breaks somethin' on a dinosaur within a week, and the nearest other weapon merchant is in Gadgetzan, so you could say I've got what we in the trade call a captive market." },
      },
      choices = {
        { text = "So you overcharge them?", next = "prices" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prices = {
      big = true,
      lines = {
        { id = "p_default", text = "Overcharge is such an ugly word, friend; I prefer 'charging for the walk.' Every sword on that rack came down a ramp past three kinds of lizard, and the kodo driver wanted hazard pay, and so did his kodo." },
      },
      choices = {
        { text = "Then your prices are honest enough.", next = "BACK", reply = "Glad you see it my way, friend! Honest prices for a dishonest walk, that's my motto.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A captive market is still robbery, Gibbert.", next = "BACK", reply = "Robbery? Friend, I walked those swords down a ramp past three kinds of teeth. Call it hazard pay and we're square.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shizzle = {
      lines = {
        { id = "s_default", text = "I did, and he owes me a sword for it, which he will never pay, because the sword's in the propeller now, sorta. I like the kid, though, and if that flyer ever gets off the ground, I want it in writing that I was an investor." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_sw", text = "Gadgetzan's my supplier and the Cartel's my landlord, pal, and both of 'em get their cut." } },
    _none = { { id = "tp_none", text = "Don't know, chum. Ask me about blades and I'll talk all day." } },
  },
}
