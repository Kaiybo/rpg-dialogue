-- Stranglethorn folk a roster scan found missing: Corporal Kaleb (the Rebel Camp's cook), Cowardly
-- Crosby on the Wild Shore, Riggle Bassbait and Jang of the fishing contest, Jaxin Chong and McGavan in
-- Booty Bay, Knaz Blunderflame on his hill by the ogre mound, Krakk at Grom'gol and Maywiki of Zuldazar
-- on Yojamba Isle. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Corporal Kaleb: cooks for the Rebel Camp; his goblin-made pot has broken.
P:NPC {
  key = "corporal_kaleb", id = TODO_NPC("Corporal Kaleb"), name = "Corporal Kaleb", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "rebel_camp" }, temper = { "harried", "good-humoured" }, values = { "dutiful", "practical" },
  notices = { "craft", "food" },
  impression = {
    first = "Corporal Kaleb feeds the whole Rebel Camp from one fire, and lately from one dented kettle, since the mechanical pot a goblin built him has stopped working. He treats the men's supper as seriously as Lieutenant Doren treats the war, and he may be right to.",
    third = "{name} met Corporal Kaleb, who cooks for the Rebel Camp in northern Stranglethorn.",
  },
  greetings = {
    { id = "g_default", text = "If you're here to eat, {class}, it's stew, and if you're here to complain about the stew, the line forms behind the Lieutenant." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? You must have a stronger stomach than most who pass through." },
    { id = "g_pot", when = { questActive = TODO_QUEST("Krazek's Cookery") }, text = "Have you got that pot down to Krazek yet? The men are starting to look at me the way they look at Kurzen." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You know your way round a cook fire, I can tell by how you looked into the kettle. Don't judge me by what's in it today." },
    { id = "n_food", cat = "food", when = { hp = { max = 0.6 } },
      text = "Sit down before you fall down, and get a bowl of this inside you. It tastes better than it looks, which isn't saying much." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Corporal Kaleb. I fought my way down here the same as the rest, but somebody had to cook, and I was the only one who could boil water without burning it." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Corporal Kaleb") },
          text = "She's bubbling again, thanks to you, and the camp ate a hot supper for the first time in a fortnight. I've seen men cheer less for a victory." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Talk while I stir, because this sticks if I stop." },
        { id = "h_again2", text = "Go on, I'm listening, and so is the kettle." },
      },
      choices = {
        { text = "What's wrong with your cooking pot?", next = "pot" },
        { text = "What do you feed soldiers in a jungle?", next = "feed" },
        { text = "How is the camp holding together?", next = "camp" },
        { text = "A cook is worth ten swords out here.", next = "worth" },
        { text = "I can cook a little. Need a hand?", next = "hand", when = { profession = "Cooking" } },
        { text = "Keep them fed, Corporal.", next = "END" },
      },
    },
    pot = {
      hub = true,
      lines = { { id = "p_default", text = "It's a goblin contraption, all valves and a little furnace underneath, and it cooked for forty men on a handful of charcoal. It gave a cough and a bang last week, and now it does nothing but leak." } },
      again = { { id = "p_again", text = "What else about the pot? I miss it like a comrade, I don't mind saying." } },
      choices = {
        { text = "Who built the thing?", next = "p_who" },
        { text = "Can't one of your men mend it?", next = "p_mend" },
        { text = "How did you come by a goblin pot?", next = "p_how" },
        { text = "Enough about the pot.", next = "BACK" },
      },
    },
    p_who = {
      lines = { { id = "pw_default", text = "A goblin named Krazek, who keeps a shop down in Booty Bay and talks faster than I can listen. He's the only one who understands its insides, so the pot has to go to him, and I can't leave the camp without a cook to carry it.", fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "Will a goblin mend it for a soldier?", next = "p_price" },
        { text = "Back to the pot.", next = "BACK" },
      },
    },
    p_price = {
      lines = { { id = "pp_default", text = "He'll mend it for anyone, provided there's something in it for him, and with Krazek there's always something. I'd wager he sends the bearer off on an errand of his own before he so much as lifts a wrench." } },
      choices = { { text = "That sounds like a goblin. Back to the pot.", next = "BACK" } },
    },
    p_mend = {
      lines = { { id = "pm_default", text = "Private Thorsen had a try with a bayonet and made a second leak, so I've forbidden anyone else to touch it. These are good soldiers, {class}, but there isn't a tinker among them." } },
      choices = { { text = "Back to the pot.", next = "BACK" } },
    },
    p_how = {
      lines = { { id = "ph_default", text = "We bought it when we still drew pay from Stormwind and Kurzen was still our colonel. It's about the only thing from those days that I'd want back, apart from the men we lost to him.", fx = { learn = { "kurzen" } } } },
      choices = {
        { text = "You served under Kurzen?", next = "kurzen" },
        { text = "Back to the pot.", next = "BACK" },
      },
    },
    kurzen = {
      lines = { { id = "k_default", text = "We all did, and I cooked his supper for two years. He ate less and less toward the end and wouldn't say why, and Brother Nimetz reckons that's about when the jungle got into him." } },
      choices = { { text = "A cook notices such things. Something else.", next = "BACK" } },
    },
    feed = {
      lines = { { id = "f_default", text = "Whatever the patrols bring in, which is tiger when they're lucky and raptor when they aren't. Raptor's stringy and tastes of whatever it last ate, but stewed long enough it'll keep a man marching." } },
      choices = {
        { text = "And when the patrols bring nothing?", next = "nothing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nothing = {
      lines = { { id = "n_default", text = "Then it's hard biscuit and river water, and I boil the water twice because Nimetz has made me nervous about it. I've kept this camp clear of the flux so far, and I'm prouder of that than of anything I've done with a sword." } },
      choices = { { text = "You should be. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "c_default", text = "Lieutenant Doren holds it together by will, and Sergeant Yohwa by shouting, and between them it works. We're few and Kurzen's many, but every man here chose to walk out of that compound, and that counts for something." } },
      choices = { { text = "It counts for a great deal. Something else.", next = "BACK" } },
    },
    worth = {
      lines = { { id = "w_default", text = "I've told the Lieutenant that very thing, and he said he'd take the ten swords and eat cold rations. He didn't mean it, mind, because he was first in line the day the pot broke, asking when it'd be fixed." } },
      choices = { { text = "Officers always are. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hand = {
      lines = { { id = "ha_default", text = "I'd not refuse it. Take the long spoon and keep the bottom moving, and if you know anything that makes raptor taste less of raptor, I'll write it on the kettle." } },
      choices = { { text = "Mild spice and a long simmer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Corporal in what used to be Kurzen's command, and cook to what's left of the loyal part of it. I walked out with Doren and I've fed his men since." } },
    kurzen = { { id = "tp_kz", text = "He was our colonel and I cooked for him. Whatever he is now, he isn't the man who used to ask for seconds." } },
    steamwheedle = { { id = "tp_sw", text = "Goblins. One of them built my pot, and I'll not hear a word against him until it's mended." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, {class}. I see the inside of a kettle and not much else; try the Lieutenant." } },
  },
}

-- Cowardly Crosby: tailoring supplies, hiding on the Wild Shore among the Bloodsail camps.
P:NPC {
  key = "cowardly_crosby", id = TODO_NPC("Cowardly Crosby"), name = "Cowardly Crosby", title = "Tailoring Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = {}, temper = { "nervous", "apologetic" }, values = { "self-preserving" },
  notices = { "kit", "craft" },
  impression = {
    first = "Cowardly Crosby sells thread and patterns from a patch of sand on the Wild Shore, within earshot of the Bloodsail fires. He flinched when I spoke, apologised for flinching, and went on talking in one long worried breath.",
    third = "{name} met Cowardly Crosby, a jittery seller of tailoring supplies on the Wild Shore.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Oh, you're a customer, aren't you, please say you're a customer and not with the ones in the red sashes." },
    { id = "g_back", when = { metBefore = true }, text = "It's you, thank goodness, I know your footsteps now, and I only jumped a little that time." },
  },
  notice = {
    { id = "n_armed", cat = "kit", when = { class = { "WARRIOR", "ROGUE" } },
      text = "That's a great many blades for one person, and I'm sure you've an excellent reason for all of them, so I shan't ask." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew! Oh, that's a relief, because people who sew hardly ever stab anybody, in my experience." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Crosby, and I sell tailoring goods, and yes, they call me Cowardly, and no, I don't mind, because every brave man I ever sailed with is at the bottom of the bay." } },
      again = {
        { id = "h_again", text = "Was there something else? Only do keep your voice down, because sound carries on this beach." },
        { id = "h_again2", text = "Go on, I'm listening, and I'm watching the tree line as well, so forgive me if I look past you." },
      },
      choices = {
        { text = "What is a tailor doing out here?", next = "here" },
        { text = "Why not flee to Booty Bay?", next = "bay" },
        { text = "What do you sell?", next = "sell" },
        { text = "Being careful isn't cowardice.", next = "careful" },
        { text = "Steady, Crosby. I'm going.", next = "END" },
      },
    },
    here = {
      lines = { { id = "he_default", text = "I was a sailmaker's mate, and when the Bloodsail took our ship they kept the ones who could fight and I ran for the trees. Now they need their sails patched and their hats trimmed, so they leave me be, and I try very hard to stay useful.", fx = { learn = { "bloodsail" } } } },
      choices = {
        { text = "You sew for the pirates?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "I sell thread to whoever comes down the beach with coin and doesn't draw steel, and I don't ask to see anybody's colours. Please don't look at me like that, because a needle is all the sword I've got." } },
      choices = { { text = "I'm not judging you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bay = {
      lines = { { id = "b_default", text = "I've thought of it every night, but it's a long walk through the jungle with raptors in it, and the Baron's bruisers might ask who I've been selling to. Here I know exactly what there is to be frightened of, and I find that a comfort." } },
      choices = { { text = "There's a sort of sense in that. Something else.", next = "BACK" } },
    },
    sell = {
      lines = { { id = "s_default", text = "Thread, dye, bolts when I can get them, and a pattern for an admiral's hat that I drew from memory, with the plume and all. Every captain on this coast wants one, which is the only reason I've still got both my ears." } },
      choices = {
        { text = "An admiral's hat buys a lot of mercy.", next = "hat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hat = {
      lines = { { id = "ha_default", text = "You'd be astonished what a man with a cutlass will forgive for the sake of a good hat. I've started telling each of them that his is the finest I ever made, and so far none of them has compared notes." } },
      choices = { { text = "Pray they never do. Something else.", next = "BACK" } },
    },
    careful = {
      lines = { { id = "c_default", text = "That's kind, and nobody's said it to me before, but I know what I am. I'm the one who's still alive, though, and on this shore I've come to think that's a trade like any other." } },
      choices = { { text = "Then keep practising it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a sailmaker's mate until the pirates came, and now I'm a tailor on a beach. It isn't much of a life, but I do still have it." } },
    bloodsail = { { id = "tp_bs", text = "Please don't say that name so loudly. They're just up the shore, and they buy my thread, and that's all I'll say." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, truly I don't, and I'd rather not start knowing." } },
  },
}

-- Riggle Bassbait: goblin Fishmaster who runs the Sunday fishing contest from a Booty Bay dock.
P:NPC {
  key = "riggle_bassbait", id = TODO_NPC("Riggle Bassbait"), name = "Riggle Bassbait", title = "Fishmaster", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "loud", "showy" }, values = { "profit", "spectacle" },
  notices = { "craft", "purse" },
  impression = {
    first = "Riggle Bassbait stands on a Booty Bay dock and runs the Sunday fishing contest at a shout, with a clockwork helper beside him and an apprentice counting fish. He sold me on the glory of the thing before I'd asked what the prize was.",
    third = "{name} met Riggle Bassbait, the goblin Fishmaster who runs Booty Bay's fishing contest.",
  },
  greetings = {
    { id = "g_default", text = "Step right up, friend, step right up! You've got the look of somebody who's never won anything, and I'm the goblin who can change that." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, hey, a returning contestant! That's what I like to see, pal, because the house loves a regular." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "Whoa, whoa, look at the calluses on that casting hand! You're a contender, pal, and I can smell it, though that might be the bait." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now there's a purse that jingles. You don't need the prize, friend, so you must be here for the glory, and glory's my best seller." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "Riggle Bassbait, Fishmaster, and proprietor of the greatest sporting event on two continents! Every Sunday afternoon the tastyfish run along this coast, and the first angler to slap forty of 'em on my dock goes home a champion." } },
      again = {
        { id = "h_again", text = "What else ya want to know, pal? Talk fast, I've got a contest to shout about." },
        { id = "h_again2", text = "Go on, go on, the Fishmaster's listening." },
      },
      choices = {
        { text = "How does the contest work?", next = "rules" },
        { text = "What's in it for you, Riggle?", next = "angle" },
        { text = "Who are your helpers?", next = "helpers" },
        { text = "Fish don't seem worth this much noise.", next = "noise" },
        { text = "Any advice for a serious angler?", next = "tips", when = { profession = "Fishing" } },
        { text = "Maybe next Sunday, Riggle.", next = "END" },
      },
    },
    rules = {
      hub = true,
      lines = { { id = "r_default", text = "Simple as a hook, friend. The schools show up Sunday afternoon, you fish 'em anywhere on the Stranglethorn coast, and you run forty speckled tastyfish back here before anybody else does." } },
      again = { { id = "r_again", text = "What else about the rules? There's no small print, pal, and I'm as surprised as you are." } },
      choices = {
        { text = "And if I'm not the first?", next = "r_second" },
        { text = "What stops people cheating?", next = "r_cheat" },
        { text = "What about the odd fish in the schools?", next = "r_rare" },
        { text = "That's the rules covered.", next = "BACK" },
      },
    },
    r_second = {
      lines = { { id = "rs_default", text = "Then you've got a sack of perfectly good fish and a story about how close it was. Jang there buys tastyfish off anybody, five at a time, so nobody walks off my dock with nothin' but wet boots." } },
      choices = { { text = "Back to the rules.", next = "BACK" } },
    },
    r_cheat = {
      lines = { { id = "rc_default", text = "The Bruisers, mostly, and the fact that a tastyfish only bites on a Sunday, so you can't stock up early. A fella tried last month with a barrel of dyed mackerel, and the Baron let the dock crowd decide what happened to the barrel." } },
      choices = {
        { text = "And what happened to the fella?", next = "r_fella" },
        { text = "Back to the rules.", next = "BACK" },
      },
    },
    r_fella = {
      lines = { { id = "rf_default", text = "He was in the barrel at the time, pal. He swims pretty good now, I hear, and he's found himself another hobby." } },
      choices = { { text = "Lesson learned. Back to the rules.", next = "BACK" } },
    },
    r_rare = {
      lines = { { id = "rr_default", text = "Sharp eyes! Every so often a rare one comes up with the tastyfish, striped or spotted or with a face like my uncle, and I've got collectors who pay me to find 'em. Bring one to me before you sell it to a cook, is all I'm sayin'." } },
      choices = { { text = "Back to the rules.", next = "BACK" } },
    },
    angle = {
      lines = { { id = "a_default", text = "Me? I get four hundred anglers in town every week, all of 'em hungry, thirsty and breakin' their tackle. The inn's full, the bait shop's sold out, and the Baron takes his cut and calls me a genius, so everybody wins, and me most of all." } },
      choices = {
        { text = "So the contest is a sales pitch.", next = "pitch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pitch = {
      lines = { { id = "pi_default", text = "Everything's a sales pitch, friend, and at least mine comes with a trophy. Nobody ever went home from a tax collector with a story for the grandkids." } },
      choices = { { text = "I can't argue with that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    helpers = {
      lines = { { id = "he_default", text = "That's Jang, my apprentice, who's sharper than she lets on and is absolutely after my job. The tin fella is the Fishbot, who counts faster than either of us and has never once asked for a raise, which makes him the best employee I ever had." } },
      choices = { { text = "Watch your back with Jang. Something else.", next = "BACK" } },
    },
    noise = {
      lines = { { id = "n_default", text = "It ain't about the fish, pal, it's about beatin' the other guy to the dock with your boots full of seawater. I've seen an orc and a dwarf race up that ramp side by side and forget to hit each other, and you tell me what else in this world does that." } },
      choices = { { text = "Not much, I'll grant you. Something else.", next = "BACK" } },
    },
    tips = {
      lines = { { id = "t_default", text = "Off the record, since you're a professional: pick your stretch of coast before the bell and stay on it, because the ones who run about chasin' rumours never finish. And fish near a road home, friend, since forty fish are no good to you on the wrong side of a raptor." } },
      choices = { { text = "One stretch, near a road. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the Fishmaster, pal. I talked the Baron into a fishing contest, and it's been the best Sunday business in Booty Bay ever since." } },
    _none = { { id = "tp_none", text = "Is there a fish in it? No? Then I've got no line on that one, friend." } },
  },
}

-- Jang: Riggle Bassbait's apprentice; buys tastyfish from anglers who didn't win.
P:NPC {
  key = "jang", id = TODO_NPC("Jang"), name = "Jang", title = "Fishmaster Apprentice", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "sharp", "dry" }, values = { "profit", "ambition" },
  notices = { "craft" },
  impression = {
    first = "Jang counts fish beside Riggle Bassbait on the Booty Bay dock and buys the catch of everyone who didn't win. She is quieter than her boss and a good deal more exact, and she plainly knows what his job is worth.",
    third = "{name} met Jang, the Fishmaster's apprentice at Booty Bay's fishing contest.",
  },
  greetings = {
    { id = "g_default", text = "Tastyfish in lots of five, pal, and I count 'em myself. Don't hand me four and a boot." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, you count honest, and that puts you ahead of half this dock." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You hold that pole like you've done it before. Keep it quiet, though, or the boss'll put you on a poster." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "Jang, Fishmaster's apprentice. The boss does the shoutin' and hands out the glory, and I buy up every tastyfish that didn't win, which is where the actual margin is." } },
      again = {
        { id = "h_again", text = "What else? I've got a tally runnin', so make it worth the lost count." },
        { id = "h_again2", text = "Go on, I can count and listen." },
      },
      choices = {
        { text = "Why buy the losers' fish?", next = "buy" },
        { text = "What's it like working for Riggle?", next = "boss" },
        { text = "You sound like you want his job.", next = "job" },
        { text = "Who cheats worst on contest day?", next = "cheats" },
        { text = "Keep counting, Jang.", next = "END" },
      },
    },
    buy = {
      lines = { { id = "b_default", text = "Because one guy wins and three hundred don't, sweetheart, and every one of those three hundred is standin' on my dock with a sack of fish and a sour face. I take 'em five at a time for fair coin, they leave happy, and they come back next Sunday." } },
      choices = {
        { text = "And what happens to all that fish?", next = "fish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "The inn, the ships' cooks, and a fella in Ratchet who smokes 'em and won't say who buys it. By Monday mornin' I've sold every tail for more than I paid, and the boss still thinks the contest is the business." } },
      choices = {
        { text = "The contest is only the bait.", next = "bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "Now you're thinkin' like a goblin. Keep that under your hat, pal, because I've got another year on my contract and I'd like to finish it on good terms." } },
      choices = { { text = "Not a word from me. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    boss = {
      lines = { { id = "bo_default", text = "Loud, mostly. But he talked the Baron into lettin' strangers flood the town once a week, and nobody else on this wharf could've sold that, so I listen when he talks, and I write some of it down." } },
      choices = { { text = "He sounds worth studying. Something else.", next = "BACK" } },
    },
    job = {
      lines = { { id = "j_default", text = "Sure I do, and he knows it, and he'd think less of me if I didn't. That's what an apprentice is, friend: somebody who's learnin' your business so they can take it off you politely." } },
      choices = { { text = "Honest, in a goblin way. Something else.", next = "BACK" } },
    },
    cheats = {
      lines = { { id = "c_default", text = "It ain't the pirates, if you can believe that, because they just want to win. It's the respectable ones, who pad a lot of five with a mackerel in the middle and act hurt when I find it." } },
      choices = { { text = "It's always the respectable ones. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm apprenticed to the Fishmaster, on contract. I count the fish and I learn the trade, and both are goin' fine." } },
    _none = { { id = "tp_none", text = "Not my department, pal. If it don't come in lots of five, I can't price it." } },
  },
}

-- Jaxin Chong: goblin alchemy trainer, top level of Booty Bay (Boucher's Cauldron).
P:NPC {
  key = "jaxin_chong", id = TODO_NPC("Jaxin Chong"), name = "Jaxin Chong", title = "Alchemy Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "booty_bay" }, temper = { "aggrieved", "sharp" }, values = { "craft", "profit" },
  notices = { "craft" },
  impression = {
    first = "Jaxin Chong teaches alchemy from a shop on Booty Bay's top level, between cauldrons that never quite stop bubbling. He is a good teacher with one grievance, which is the price his supplier charges him for herbs, and he returned to it three times.",
    third = "{name} met Jaxin Chong, the goblin alchemy trainer in Booty Bay.",
  },
  greetings = {
    { id = "g_default", text = "Mind the green one, pal, it's at a delicate stage, and so's my temper. You here to learn or to breathe my fumes for free?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you've still got eyebrows, so some of what I taught ya must've stuck." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Stained fingers and a burn on the cuff, so you're in the trade. Good, I won't have to explain what a vial is." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Hold on, hold on, you pick your own herbs? Sit down, friend, because you and I might just cut out a middleman." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jaxin Chong, alchemy, and the best instruction south of the mountains. I'll teach anybody with coin and a steady pourin' hand, and I'd charge less for it if my herb man didn't bleed me dry." } },
      again = {
        { id = "h_again", text = "What else, pal? Quick, before somethin' boils over." },
        { id = "h_again2", text = "Go on, I'm stirrin' and listenin'." },
      },
      choices = {
        { text = "Who's bleeding you dry?", next = "glyx" },
        { text = "What does the jungle offer an alchemist?", next = "jungle" },
        { text = "Why teach rivals your trade?", next = "teach" },
        { text = "I could sell you herbs myself.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "I'll leave you to your cauldrons.", next = "END" },
      },
    },
    glyx = {
      lines = { { id = "g_default", text = "Glyx Brewright, down the boardwalk, and we've got an arrangement: he keeps me in supplies, and I keep him in luxury. What that pirate wants for one sad little pouch of kingsblood would make a banker blush." } },
      choices = {
        { text = "Why not buy elsewhere?", next = "elsewhere" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elsewhere = {
      lines = { { id = "e_default", text = "Because his glass is clean and his weights are honest, curse him, and in this town that's worth the markup. I complain about Glyx every day, friend, and I pay him every week, and that's about as close as two goblins get to friendship." } },
      choices = { { text = "A touching partnership. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    jungle = {
      lines = { { id = "j_default", text = "Everything, if you can get out of it alive with your basket. There's kingsblood and liferoot along the rivers, goldthorn up on the ridges and fadeleaf in every shadow, and each one's got a panther sittin' on it." } },
      choices = {
        { text = "Which is worth the panther?", next = "worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth = {
      lines = { { id = "w_default", text = "Goldthorn, every time, because half the potions a fightin' customer wants start with it. Fadeleaf sells too, but to the kind of buyer who doesn't sign for it, so I keep that side of the ledger in my head." } },
      choices = { { text = "Wise bookkeeping. Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "Rivals? Pal, every student I turn out needs vials, herbs and a new cauldron after the first accident, and they buy all of it in Booty Bay. I'm not trainin' competition, I'm growin' customers." } },
      choices = { { text = "Spoken like the Cartel. Something else.", next = "BACK" } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Whoa, whoa, not so loud, he's got ears all over this boardwalk. I buy what's fresh like any trader does, and I'll say no more than that until Glyx has gone to lunch." } },
      choices = { { text = "After lunch, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an alchemist and I teach it, up here where the fumes blow out to sea. Been at it since before the Baron ran this town." } },
    _none = { { id = "tp_none", text = "If it doesn't go in a cauldron, pal, I haven't priced it. Ask at the tavern." } },
  },
}

-- McGavan: human smith of the Mithril Order in Booty Bay; sends worthy armorsmiths to Galvan the Ancient.
P:NPC {
  key = "mcgavan", id = TODO_NPC("McGavan"), name = "McGavan", title = "The Mithril Order", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "blunt", "exacting" }, values = { "craft", "tradition" },
  notices = { "craft" },
  impression = {
    first = "McGavan keeps the Mithril Order's door in Booty Bay, which is to say he stands by a forge and decides who is fit to learn from his master in the jungle. He looked at my hands before my face, as smiths do, and gave his verdict without softening it.",
    third = "{name} met McGavan of the Mithril Order in Booty Bay.",
  },
  greetings = {
    { id = "g_default", when = { ["not"] = { profession = "Blacksmithing" } }, text = "If you're not a smith, you've no business with me, and no offence is meant by it. The goblins will sell you whatever you came for." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, by the burns on your wrists. Good, then we may have something to talk about, depending on what you've made." },
    { id = "g_back", when = { metBefore = true, profession = "Blacksmithing" }, text = "Back again. Show me your work before you tell me about it." },
    { id = "g_order", when = { questActive = TODO_QUEST("The Mithril Order") }, text = "So the city smiths sent you to me. They send a good many, and I send most of them home, so let's see which sort you are." },
  },
  notice = {
    { id = "n_dwarf", cat = "craft", when = { race = "Dwarf", profession = "Blacksmithing" },
      text = "A dwarven smith, at last. Your folk had mithril on the anvil before mine had learned to mine it, and I'll not pretend otherwise." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "McGavan, of the Mithril Order. We're armorsmiths who work mithril the old way, and I stand here to see that nobody wastes my master's time who hasn't earned the right to." },
        { id = "h_galvan", tags = { "news" }, when = { questActive = TODO_QUEST("In Search of Galvan") },
          text = "You've earned the road, so take it: north through the jungle, to the foot of the great troll city. You'll hear Galvan long before you see him." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up over the bellows." },
        { id = "h_again2", text = "Go on, I've an iron heating, so be brief." },
      },
      choices = {
        { text = "What is the Mithril Order?", next = "order" },
        { text = "Who is your master?", next = "galvan" },
        { text = "Why keep an order's door in Booty Bay?", next = "bay" },
        { text = "How does a smith earn your approval?", next = "earn", when = { profession = "Blacksmithing" } },
        { text = "Secrets make poor smiths, McGavan.", next = "secrets" },
        { text = "I'll leave you to your forge.", next = "END" },
      },
    },
    order = {
      lines = { { id = "o_default", text = "A brotherhood of armorsmiths, and a small one, because we take few and keep fewer. We hold that mithril is the noblest metal a smith can put a hammer to, and that there's a right way of working it which was nearly lost." } },
      choices = {
        { text = "Nearly lost? How so?", next = "lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "Two wars will do that. The smiths who knew the ornate work died at their forges or on the walls, and what they knew went with them, save for what one old man carried off into the jungle in his head." } },
      choices = {
        { text = "And that old man is your master.", next = "galvan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    galvan = {
      lines = { { id = "g_default", text = "Galvan the Ancient, and he's all that the name says and louder. He keeps his anvil up by the gates of Zul'Gurub, where no sane man would camp, and he speaks of himself as if he were someone else in the room." } },
      choices = {
        { text = "Why camp beside a troll city?", next = "why_zg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_zg = {
      lines = { { id = "wz_default", text = "He says the ore's good and the quiet suits him, and I've given up asking for a better answer. My own guess is that he likes a place where only the stubborn will come to find him, since stubbornness is the one thing he can't teach." } },
      choices = { { text = "A hard school. Something else.", next = "BACK" } },
    },
    bay = {
      lines = { { id = "b_default", text = "Because every ship from either continent puts in here, and the goblins don't care whose banner a smith marches under. An orc and a dwarf can both walk up to this forge, and the Order has never asked a hammer what side it's on." } },
      choices = { { text = "Steel has no banner. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    earn = {
      lines = { { id = "e_default", text = "You bring me work, finished, and I look at the seams. I don't care for fine talk or a master's letter, {class}, because a breastplate either turns a blade or it doesn't, and I can tell which before you've set it down." } },
      choices = {
        { text = "Then I'll bring you my best.", next = "BACK", reply = "Bring me your plainest, and make it true. Any fool can hide a bad weld under gilding.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    secrets = {
      lines = { { id = "s_default", text = "It's no secret, and I'd teach it in the street if the street could learn it. What we guard is the master's hours, for he's old and there's only one of him, and I'll not see them spent on a smith who'll quit at the first burn." } },
      choices = { { text = "That's fairer than I thought. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a smith of the Mithril Order, and Galvan's pupil. I keep the Order's door here in Booty Bay." } },
    _none = { { id = "tp_none", text = "I know metal, and little besides. One of the goblins will sell you an answer." } },
  },
}

-- Knaz Blunderflame: gnome engineering supplier camped on a hidden hill south of the Mosh'Ogg ogre mound.
P:NPC {
  key = "knaz", id = TODO_NPC("Knaz Blunderflame"), name = "Knaz Blunderflame", title = "Engineering Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = {}, temper = { "excitable", "precise" }, values = { "curious", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Knaz Blunderflame sells engineering supplies from a hilltop camp above the Mosh'Ogg ogres, a place he chose because nobody would complain about the noise. He was delighted to have a visitor and timed how long the climb had taken me.",
    third = "{name} met Knaz Blunderflame, a gnome who sells engineering supplies from a hidden hill in Stranglethorn.",
  },
  greetings = {
    { id = "g_default", text = "A customer! You found the path, which only about one visitor in six manages without falling off it, so well done." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and by my count you climbed it eleven seconds faster this time, which is a very respectable improvement." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that a spanner on your belt? Oh, marvellous, an actual engineer, and I've had nobody to talk tolerances with for seventeen days." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome, all the way out here! Tell me there's news from Tinker Town, and tell me whether anyone has made progress on getting our city back." },
    { id = "n_goblin", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Oh! You're with the Horde. Well, a gear is a gear, and my prices are the same for everybody, so please don't touch the red lever." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Knaz Blunderflame, engineering supplies and field testing! My brother Gnaz keeps the shop in Booty Bay, and I keep the hill, because some of our products can't responsibly be demonstrated inside a wooden town." } },
      again = {
        { id = "h_again", text = "What else would you like to know? I've a fuse burning, but it's a long one, about ninety seconds by my estimate." },
        { id = "h_again2", text = "Do go on, I so rarely get questions up here." },
      },
      choices = {
        { text = "Why set up above an ogre mound?", next = "ogres" },
        { text = "What do you test up here?", next = "test" },
        { text = "Tell me about your brother.", next = "gnaz" },
        { text = "What would you recommend to an engineer?", next = "recommend", when = { profession = "Engineering" } },
        { text = "Mind that fuse, Knaz.", next = "END" },
      },
    },
    ogres = {
      lines = { { id = "o_default", text = "Because ogres are the only neighbours who've never once complained about an explosion! I ran the figures on six sites, and this one had the best ratio of solitude to flat ground, with the Mosh'Ogg just far enough below not to look up.", fx = { learn = { "mosh_ogg" } } } },
      choices = {
        { text = "Have they ever looked up?", next = "lookup" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lookup = {
      lines = { { id = "l_default", text = "Twice, and both times they decided it was thunder and went back to shouting at each other. I've recorded it as a seventy percent probability that they believe this hill is haunted, which suits me very well." } },
      choices = { { text = "Long may they think so. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    test = {
      lines = { { id = "t_default", text = "Blasting powder in four grades, fuses, a diving helmet I've had the plans for since Gnomeregan, and whatever Gnaz sends up marked \"probably fine\". Roughly a third of it works the first time, which is a splendid rate for prototypes." } },
      choices = {
        { text = "And the other two thirds?", next = "thirds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thirds = {
      lines = { { id = "th_default", text = "Data! Every failure tells me exactly one thing not to do again, and I write each one down with the time, the wind and the size of the crater. I've filled nine notebooks, and I've only lost my eyebrows on four occasions." } },
      choices = { { text = "A rigorous method. Something else.", next = "BACK" } },
    },
    gnaz = {
      lines = { { id = "g_default", text = "Gnaz has the head for customers and the town for a shop, and he's picked up the goblins' way of talking, which our mother would not have liked. He sends up supplies by the month and I send down results, and it's a very efficient family." } },
      choices = { { text = "A good arrangement. Something else.", next = "BACK" } },
    },
    recommend = {
      lines = { { id = "r_default", text = "Measure your powder by weight and never by the scoop, because scoops vary by as much as an eighth and an eighth is the difference between a door and a doorway. Also, if you ever build the diving helmet, test the seals in a barrel before you test them in the sea." } },
      choices = { { text = "By weight, and barrel first. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Blunderflame, out of Gnomeregan before the trouble, and I test what my brother sells. The hill is my workshop." } },
    mosh_ogg = { { id = "tp_mo", text = "The ogres below me! They're excellent neighbours, in the sense that they never visit." } },
    _none = { { id = "tp_none", text = "I'm afraid I've no data on that at all. Gnaz hears everything in Booty Bay, if you're heading that way." } },
  },
}

-- Krakk: orc Superior Armorer at Grom'gol Base Camp.
P:NPC {
  key = "krakk", id = TODO_NPC("Krakk"), name = "Krakk", title = "Superior Armorer", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "proud", "blunt" }, values = { "strength", "craft" },
  notices = { "kit", "soldier" },
  impression = {
    first = "Krakk sells armor at Grom'gol Base Camp and holds that the jungle rots weak steel as surely as it rots weak warriors. He struck my breastplate with his knuckles to hear how it rang before he would speak of trade.",
    third = "{name} met Krakk, the armorer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "You want armor, {class}? Then you want Krakk, for no one else in this camp makes plate that outlasts the rains." },
    { id = "g_back", when = { metBefore = true }, text = "You live, and so my steel has done its work. Come, let me see what the jungle has done to it." },
  },
  notice = {
    { id = "n_rust", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor hangs on you like a beaten dog. A warrior who lets his steel rot dishonors the smith who made it." },
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR" },
      text = "Throm-ka, warrior. You carry the weight well, and I can see you were not born to leather." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Krakk. The Commander's grunts fight trolls, tigers and the humans of Kurzen's rabble, and it is my armor that brings them back to the fire at night." } },
      again = {
        { id = "h_again", text = "Speak, {class}. My forge cools while you think." },
        { id = "h_again2", text = "What more do you want of Krakk?" },
      },
      choices = {
        { text = "What does the jungle do to armor?", next = "jungle" },
        { text = "What dents your armor most?", next = "dents" },
        { text = "Where did you learn the forge?", next = "learn" },
        { text = "Which is better: shield or heavier plate?", next = "shield", when = { class = { "WARRIOR", "SHAMAN" } } },
        { text = "Strength and honor, Krakk.", next = "END" },
      },
    },
    jungle = {
      lines = { { id = "j_default", text = "It eats it. The rain gets under every strap, the leather rots in a season, and rust blooms overnight on steel that was bright at dusk, so I oil every piece twice and I curse this place while I do it." } },
      choices = {
        { text = "Then why does the Horde stay here?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because the Warchief wills it, and because whoever holds this coast holds the road south. Grom'gol bears the name of Hellscream, and no orc will be the one to abandon a camp that carries it." } },
      choices = { { text = "Lok'tar. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dents = {
      lines = { { id = "d_default", text = "Troll axes, for the Bloodscalp swing low and hard at the knees. After them come the raptors, whose claws find every gap, and I have learned more about where armor fails from those beasts than from any smith." } },
      choices = {
        { text = "And the humans?", next = "humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "Kurzen's soldiers shoot from the trees and will not stand, so they leave small holes and no honor. I mend those with a rivet and little respect, for a warrior should have the courage to dent my work to my face.", fx = { learn = { "kurzen" } } } },
      choices = { { text = "A coward's mark. Something else.", next = "BACK" } },
    },
    learn = {
      lines = { { id = "l_default", text = "In the camps, where the humans gave us scrap to beat into their plowshares so that we would forget we had ever made war. I did not forget, and when Thrall broke the walls I already knew how to turn a plowshare back into a blade." } },
      choices = { { text = "A lesson they did not intend. Something else.", next = "BACK" } },
    },
    shield = {
      lines = { { id = "sh_default", text = "The shield, if you will learn to use it, for plate only forgives a mistake and a shield prevents one. But a shield carried badly is dead weight on the arm, and I have buried grunts who thought the wood would fight for them." } },
      choices = { { text = "Then I will learn it well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am an armorer of the Horde, and I learned iron in the camps. Now I forge for Grom'gol, and my work answers for me." } },
    kurzen = { { id = "tp_kz", text = "The human colonel in the north and his rabble. They hide in leaves and shoot, and my armor has their marks to prove it." } },
    _none = { { id = "tp_none", text = "I know steel, {class}. Take your question to the Commander, or to the Far Seer." } },
  },
}

-- Maywiki of Zuldazar: Zandalari on Yojamba Isle who speaks for the tribe to druids and shaman.
P:NPC {
  key = "maywiki", id = TODO_NPC("Maywiki of Zuldazar"), name = "Maywiki of Zuldazar", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "serene", "sly" }, values = { "devout", "balance" },
  notices = { "class", "race" },
  impression = {
    first = "Maywiki of Zuldazar sits a little apart on Yojamba Isle, and speaks for the Zandalar to those who walk with spirits and wild things. She laughed softly before she answered anything, as though she'd heard my questions on the wind already.",
    third = "{name} met Maywiki of Zuldazar, who speaks for the Zandalar tribe to druids and shaman on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", when = { ["not"] = { class = { "DRUID", "SHAMAN" } } }, text = "De spirits did not send you to Maywiki, {class}, but sit if you like. Dere be others on dis isle who trade wit' your kind." },
    { id = "g_wild", when = { class = { "DRUID", "SHAMAN" } }, text = "Ah, here be one de wind was whispering about. Come and sit, child of de wild, for Maywiki has been waiting on you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and de jungle has not eaten you yet. Dat is good, and de spirits be pleased wit' it." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, far from de islands. Your tribe is young, little cousin, but de loa remember your name, and so does Maywiki." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "De big ones from de grasslands always walk softly here. Your Earth Mother and our loa would have much to say to each other, I think." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Your people and mine were old before de others learned to speak, and we have not always been kind to each other. Today we share an enemy, and dat is enough." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, when = { ["not"] = { class = { "DRUID", "SHAMAN" } } }, text = "I be Maywiki of Zuldazar. I listen to de spirits of dis jungle for my people, and I deal wit' those outsiders who can hear dem too, so you may ask, but my trade is not for you." },
        { id = "h_wild", when = { class = { "DRUID", "SHAMAN" } }, text = "I be Maywiki of Zuldazar. De king's speakers deal wit' warriors and priests, and I deal wit' your kind, because you can hear what is wrong in Zul'Gurub witout being told." },
      },
      again = {
        { id = "h_again", text = "Ask what else you will. De spirits be patient, and so is Maywiki." },
        { id = "h_again2", text = "Speak, and I will listen wit' both ears." },
      },
      choices = {
        { text = "What do the spirits say of Zul'Gurub?", next = "spirits" },
        { text = "Why do the Zandalar trust outsiders?", next = "outsiders" },
        { text = "What do you ask of my kind?", next = "ask", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Tell me of Zuldazar.", next = "zuldazar" },
        { text = "The elements here are troubled.", next = "elements", when = { class = "SHAMAN" } },
        { text = "The wild things here are afraid.", next = "beasts", when = { class = "DRUID" } },
        { text = "Spirits keep you, Maywiki.", next = "END" },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "Dey do not say, dey scream. De loa of dis land be bound by de priests of Hakkar, tiger and snake and bat and all de rest, and deir power is poured into de Blood God like water into a pit." } },
      choices = {
        { text = "Can a bound loa be freed?", next = "freed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    freed = {
      lines = { { id = "f_default", text = "When de priest dat holds it falls, de binding breaks, and de loa goes home angry. I would not wish to be standing in dat temple when it happens, but I would very much like someone to be." } },
      choices = {
        { text = "And you would like it to be me.", next = "me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    me = {
      lines = { { id = "m_default", text = "Maywiki would never say so. Maywiki only tells you where de door is, and what is behind it, and den she watches which way your feet point." } },
      choices = { { text = "A sly answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    outsiders = {
      lines = { { id = "o_default", text = "Trust is a big word, {class}. We be few on dis isle and de Gurubashi be many, and a wise hunter does not ask de spear what tribe its wood came from." } },
      choices = { { text = "Honest enough. Something else.", next = "BACK" } },
    },
    ask = {
      lines = { { id = "a_default", text = "De Hakkari carry tokens of deir god, coins and bijous and stranger things, and each one is a small piece of his strength. Bring dem out of de city and into Zandalari hands, and you weaken him while my people learn your worth." } },
      choices = {
        { text = "And what does your tribe give in return?", next = "return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["return"] = {
      lines = { { id = "r_default", text = "Dat is between you and de tribe, and it grows wit' de tribe's regard for you. Zandalari do not forget a friend, but we be slow to name one, so do de work first and ask de price after." } },
      choices = { { text = "Work first, then. Something else.", next = "BACK" } },
    },
    zuldazar = {
      lines = { { id = "z_default", text = "It is de first city of de first tribe, on an island far to de south, where King Rastakhan sits and de loa walk closer dan dey do here. Every troll people dere is came out of Zandalar once, and dat is why dis shame in Zul'Gurub is ours to mend." } },
      choices = { { text = "A long way from home. Something else.", next = "BACK" } },
    },
    elements = {
      lines = { { id = "e_default", text = "You feel it too, den. De water near de city tastes of iron and de wind will not go over de walls, and when de elements shun a place, a shaman should ask what dey know dat she does not." } },
      choices = { { text = "I mean to ask them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    beasts = {
      lines = { { id = "b_default", text = "Dey are, and well dey should be. De tigers and de raptors near Zul'Gurub have gone lean and strange, for de Blood God drinks from everyting dat lives in his shadow, and de wild knows a sickness before we do." } },
      choices = { { text = "Then it must be cut out. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I be of Zuldazar, of de Zandalar, and I came nort' wit' my people to see Hakkar put down again. I speak wit' de ones who hear de spirits." } },
    _none = { { id = "tp_none", text = "De spirits be silent on dat, and so Maywiki is silent too. Ask Molthor, who knows de king's mind." } },
  },
}
