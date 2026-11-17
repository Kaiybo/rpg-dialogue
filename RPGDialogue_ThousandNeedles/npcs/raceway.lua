-- The Mirage Raceway on the Shimmering Flats: a gnome and a goblin settling an argument with rockets. Voice: bibles/thousandneedles.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pozzik", id = TODO_NPC("Pozzik"), name = "Pozzik",
  rivals = { "fizzle", "wizzle" },
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "eager" }, values = { "ambitious", "proud" },
  notices = { "craft", "status" },

  impression = {
    first = "Pozzik built a raceway to prove goblins are better engineers than gnomes, and he means to keep proving it every single day. He talks like a man always ten minutes from the next heat.",
    third = "{name} met Pozzik, the goblin half of the rivalry that runs the Mirage Raceway.",
  },

  greetings = {
    { id = "g_race", text = "Hey hey! Here for the race? There's always a race, every day, rain or shine, and mostly shine, since it's a salt flat." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite spectator returns! You bet on us last time? Smart, so bet again." },
    { id = "g_away", when = { away = 14 }, text = "My favorite spectator, back after {away}! You missed a dozen races, and we won most of them, so bet on us again." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word around the track is somebody fell for one of your stories, and I respect that. Half of racing is getting the other guy to believe something, ask any gnome." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked somebody into seeing things your way out here. You ever want to sell race tickets, kid, you've got a job waiting." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Ever thought about rockets, or about bigger rockets? We should talk." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? Bet you're cheering for the gnomes, and that's fine; cheer loud, it makes winning sweeter." },
  },

  start = "hello",
  nodes = {
    xpt_pozzik = {
      big = true,
      lines = { { id = "xpt_pozzik_default", text = "The goblin car, obviously, because it's built by people who know what speed is for, which is getting paid. The gnomes build to show off, and they'll keep losing to us until they learn the difference." } },
      choices = {
        { text = "Hard work and hunger win races. Go goblins.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gnomes build better, and my coin's on them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Brains build the car, but muscle gets it out of the crater, and on this track that happens more than I'd like. Half my crew used to bust heads for the cartels, and they can change a wheel faster than any gnome with a wrench." } },
      choices = {
        { text = "Brains matter more. Muscle without a plan just breaks things.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Muscle wins. A plan never lifted an engine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once, unofficially, when a vulture followed the gnome car all the way round and landed on the finish post first. I've been telling folks it was goblin-trained ever since, and nobody's been able to prove me wrong." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hey, {pet} looks fast. Real fast. Ever thought about racing it against Fizzle's car? We'd sell tickets, I'm just saying." },
      },
      choices = {
        { text = "That vulture won fair. Don't claim it for the goblins.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good story beats the truth. I'd claim it too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Disturb them? There's nothing out here but salt, scorpids and vultures, and the vultures love us, because every crash is lunch. The flats were dead long before I built a track on them." } },
      choices = {
        { text = "Even salt flats have life. Race with care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dead ground is fair ground. Race all you like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shame, because I've got a list. Still, honest folk are good for the track, and goblins don't need sabotage when we've got better engineering anyway." } },
      choices = {
        { text = "Cheating ruins racing. Win fairly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good racer uses every trick.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Pozzik.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Faster, sure, until it melts the engine and sends the driver into orbit! Racing's about engineering, friend, and I'd rather lose fair than win with a fireball in the fuel tank, mostly." } },
      choices = {
        { text = "Engineering's the true test. Keep it pure.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Use every edge you can get.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fair? I play to win, friend, and that's fairer than pretending you don't want to. The gnomes write long reports about honor and safety, and then they lose, so you tell me which of us has got it figured out." } },
      choices = {
        { text = "Winning by cheating isn't winning. Race them honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A race goes to the cleverest, not the nicest.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_pozzik", tags = { "news" }, when = { party = { size = 4 } },
          text = "A whole crowd! Grab a spot on the rocks, and if any of you fancy a wager on the next heat, I'll tell you for free that the goblin car is the smart bet." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "Word around the pits is you've been handing the gnomes your best advice. Fine, it's a free track, but don't expect me to show you the new fuel mixture." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "The gnomes have been grumbling about you all week, and anybody who ruins their week is welcome in my pit. What can I do for you?" },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Ever think about crewing? I need somebody who can lift an engine off a driver without asking too many questions." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You don't happen to have a beast that can outrun a rocket car, do you? Because I'd love to see a gnome lose to a cat." },
        { id = "h_default", key = true,
          text = "Pozzik. I built this raceway with that gnome, Fizzle, to settle whose engineers are better, and the answer's goblins. We just have to prove it every day." },
        { id = "h_load", when = { questActive = TODO_QUEST("Load Lightening") },
          text = "Vulture bones: light, strong, and the flats are covered in vultures. Bring me a sack and I'll pay a fair price, fair for me." },
        { id = "h_pilot", when = { questActive = TODO_QUEST("The Eighteenth Pilot") },
          text = "Razzeric's our pilot, the eighteenth, if you're counting, and he does his own modifications. Try not to look surprised when you meet him." },
        { id = "h_rizzle", when = { questActive = TODO_QUEST("Rizzle's Schematics") },
          text = "Rizzle's plans! Let me see them, for safety reasons; our safety, from losing." },
        { id = "h_ore", when = { questActive = TODO_QUEST("Indurium Ore") },
          text = "Indurium. The gnomes found it first, which is how they've been beating us, but not for much longer." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at the raceway? Don't tell me the vultures sent you, because I only take the bones they're done with." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you talk the earth into staying flat? Every rumble on the Shimmering Flats knocks a bolt loose somewhere." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Say, do the gods take sides in racing? Because if they do, I'd like to know which ones, so I can thank them properly when we win." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! I've never seen a demon race, but I'd sell tickets to it, so keep that in mind if your little friend gets restless." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You're not working for that gnome Fizzle, are you? Because if you are, I'll double whatever he's paying, and you can sabotage his car instead." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't go telling Fizzle you've got spells, because he'll want to strap you to his car, and I'll want to strap you to mine first." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin at my raceway! Don't look at the gnomes' car like that, look at mine, because ours is the one built with real goblin genius." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, the next heat's in ten minutes." },
        { id = "h_again2", text = "Still here? Good, because spectators who stay, bet." },
      },
      choices = {
        { text = "Does the racing disturb the salt flats?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who usually wins?", next = "wins" },
        { text = "Why race at all?", next = "why" },
        { text = "How do you make a rocket car faster?", next = "faster" },
        { text = "Who pays for all this?", next = "sponsors" },
        { text = "I'm cheering for the goblins.", next = "cheer", when = { faction = "Horde" } },
        { text = "Aren't you worried I'm a gnome spy?", next = "spy", when = { race = "Gnome" } },
        { text = "Could a tauren even fit in one of those cars?", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Do the earth spirits mind your raceway, Pozzik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does Fizzle's team use magic on their car?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "I'm not here for sabotage, Pozzik.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would magic make your car faster?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you play fair against the gnomes, Pozzik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does your crew need strength more than brains, Pozzik?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have any beasts ever raced on your track, Pozzik?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Who do you think will win the next race, Pozzik?", next = "xpt_pozzik", when = { party = { size = 4 } } },
        { text = "Good luck out there.", next = "END" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "Depends who you ask. Ask me, and it's goblins; ask Fizzle, and he'll lie to you with a straight face and a crooked wrench." } },
      choices = {
        { text = "And lately?", next = "wins_lately" },
        { text = "Something else.", next = "BACK", fx = { learn = { "mirage_raceway" } } },
      },
    },
    wins_lately = {
      lines = { { id = "wl_default", text = "Lately the gnomes are faster, with the same designs, and nobody can say why. Rizzle Brassbolts has been scribbling something day and night. I'd love a look at it." } },
      choices = {
        { text = "I could get you a look.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Stealing their plans would be cheating, Pozzik.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe they're just better.", next = "BACK", fx = { affinity = -2, trait = { witty = 1 } } },
      },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "Because some arguments you can't win talking. You need a mile of salt, two rockets and a crowd, plus wagers, mostly wagers." } },
      choices = { { text = "Makes a strange kind of sense.", next = "BACK", fx = { affinity = 2, learn = { "mirage_raceway" } } } },
    },
    faster = {
      lines = { { id = "f_default", text = "Every bit counts: tension coils, power output, weight. We use vulture bones for the small frame work, because they're light and strong, and the sky here rains vultures." } },
      choices = {
        { text = "What about fuel?", next = "faster_fuel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faster_fuel = {
      lines = { { id = "ff_default", text = "Fuel's where races are won, and I'm fitting a new regulator, if it ever arrives. Fizzle's cooking his out of scorpid venom, I hear: brilliant and disgusting." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    sponsors = {
      lines = { { id = "sp_default", text = "You'd be surprised who chips in. Gazlowe, over in Ratchet, finds us parts from all over. He even worked on one of our rigs once." } },
      choices = {
        { text = "What's he sending now?", next = "sponsors_part" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sponsors_part = {
      lines = { { id = "spp_default", text = "A prototype fuel regulator, weeks ago, and Gazlowe's never late. I wouldn't be pushy, except the gnomes are gaining, so ask him for me, if you're passing Ratchet?" } },
      choices = {
        { text = "I'll ask him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer = {
      lines = { { id = "c_default", text = "Ha! Somebody with taste! Cheer loud; the gnomes' pit crew pretends not to hear it, but their ears go pink." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3 } } },
    },
    spy = {
      lines = { { id = "s_default", text = "A gnome spy would've stolen the plans already, not walked up and asked, unless that's the trick. Is that the trick? Stand over there, just in case." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Fit? Sure, sure, if we took out the seat, the wheel and most of the car! But you'd make a fantastic counterweight, pal, and I've got a design in my head right now with your name on it, so don't go anywhere." },
      },
      choices = {
        { text = "Build it, and I'll ride it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll stay on the ground, thanks.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Fizzle swears they don't, but gnomes say that about everything right before it blows up. I'd love to know what's really in their engine, and a spellcaster could probably tell from a few feet away." } },
      choices = {
        { text = "I'll look, and maybe loosen a bolt while I'm there.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll look, but I won't sabotage anyone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they mind, they've never filed a complaint, and I keep the noise down after sundown, mostly. The flats were nothing but empty salt before we came, so I figure we gave the spirits something worth watching." } },
      choices = {
        { text = "Respect the land, Pozzik, and it'll put up with the racing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits can watch, and buy a seat like everybody else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },


  topics = {
    knows = {
      { id = "tp_knows", text = "I know everything worth knowing about these flats, and most of it's about engines! Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "I grew up with grease under my nails and a stopwatch in my hand, and now I own half a racetrack, the better half." } },
    advice = { { id = "tp_ad", text = "Never bet against a goblin on a straight line. Corners, maybe, but straight lines, never." } },
    mirage_raceway = { { id = "tp_raceway", text = "Best thing ever built on a salt flat! Also the only thing, but that counts." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel likes anything that sells tickets. We sell tickets." } },
    _none = { { id = "tp_none", text = "Does it go fast? If not, I don't follow it." } },
  },
}

P:NPC {
  key = "fizzle", id = TODO_NPC("Fizzle Brassbolts"), name = "Fizzle Brassbolts",
  rivals = { "pozzik", "razzeric" },
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "excitable" }, values = { "proud", "curious" },
  notices = { "craft", "race" },

  impression = {
    first = "Fizzle Brassbolts told me to stand very still before he said hello. He is the gnomish half of a rivalry at the Mirage Raceway, and he treats a cracked piston as a personal tragedy.",
    third = "{name} met Fizzle Brassbolts, the excitable gnome who runs the Mirage Raceway alongside his goblin rival.",
  },

  greetings = {
    { id = "g_track", text = "Mind the track, and the fuel lines, and the nitro... actually, just stand very still!" },
    { id = "g_back", when = { metBefore = true }, text = "You, excellent! I've recalibrated everything since you were here, twice." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "A fellow engineer, and from the gnomish school, I hope! No? Well, there's always time to improve." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, splendid! Gnomeregan may be lost, but gnomish engineering still wins races... well, most of them." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very like, really, because both involve careful preparation followed by a loud noise and somebody shouting. The difference is that when my work goes wrong I lose a piston, and when yours goes wrong you lose rather more than that." } },
      choices = {
        { text = "Preparation matters in both. Plan first, then strike.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fighting is instinct. You can't plan for every swing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Constantly, and with what I can only call malice, because the scorpids nest in the exhaust and the vultures peck at anything shiny. I once found a tortoise asleep under the chassis, which explained why the car wouldn't go any faster than a tortoise." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, keep {pet} away from the fuel line, please. It smells like venom to a beast, and I've seen what happens when one decides to chew it." },
      },
      choices = {
        { text = "The creatures were here first. Build around them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Clear them off. A track should be clean.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Salty venom burns hot and clean, very efficient! I need dozens of tails a week, though, and I'll admit the scorpids are starting to look at me funny." } },
      choices = {
        { text = "Take fewer tails. The flats need their scorpids.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "There are plenty of scorpids. Keep racing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Help, maybe, but magic doesn't care about blueprints, and I care about blueprints very much! A spell that works once is a trick, but an engine that works every time is an achievement." } },
      choices = {
        { text = "You're right. Reliable beats brilliant.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic's brilliance is worth the risk.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Fizzle.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's exactly what the last warlock said, right before it happened! I'd ask you to keep your friend well back, because I've worked too hard on this engine to lose it to an imp's appetite." } },
      choices = {
        { text = "I'll keep my demon away. Your work's safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A demon goes where it pleases.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every single heat, and I've drawn up three hundred pages of safety improvements that Pozzik calls gnome nonsense. The goblins treat a crash like a party, but I've pulled drivers out of the wreckage, and there's nothing funny about it, not one bit." } },
      choices = {
        { text = "Keep pressing for safety. Every life matters, even a goblin's.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Racers know the risks. Let them crash if they want to.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I trust Pozzik to want to win more than anything else in the world, which isn't quite the same thing. Still, we built this raceway together, and when a car flips on the salt, he's the first one running to help, though I'd never tell him I noticed." } },
      choices = {
        { text = "Tell him so. A rival who respects you deserves honesty.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep it to yourself. Never give a goblin an edge.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Kravel Koalbeard, if I had to bet, because he's always near the workshop and his story never quite adds up. But I can't prove it, and Pozzik would laugh himself sick if I accused a dwarf who works for both teams." } },
      choices = {
        { text = "I'll watch Kravel for you and bring you proof.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget proof. Throw him off the Flats.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Constantly. The heat swells the pistons, the salt eats the gears and the lightning makes the compass spin, and every time Pozzik says it's my engineering. I'd love to know whether the elements here simply dislike machines." } },
      choices = {
        { text = "Respect the land, and it may treat your machines kinder.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Build better machines. The elements don't care.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "The goblins tell everyone you're on their side now. I don't believe them, of course, but I've locked the blueprints away until you prove otherwise." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "The goblins spent a whole morning complaining about you, which is a morning they didn't spend on their car. Thank you kindly; that's worth a lap at least." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Please don't lean on anything, because half of what's in this tent is more fragile than it looks and the other half is about to explode." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Wonderful, because I'm told you lot are rather good at getting close to dangerous things, and the flats are full of them." },
        { id = "h_default", key = true,
          text = "Fizzle Brassbolts, engineer and proud member of MEGA! Pozzik and I built this raceway to see whose engineering is superior, and it's gnomish, obviously." },
        { id = "h_venom", when = { questActive = TODO_QUEST("Salt Flat Venom") },
          text = "That venom is going into the fuel mix, because the scorpids' venom is full of salt, and salt burns hot, very hot! Don't ask about the math." },
        { id = "h_martek", when = { questActive = TODO_QUEST("Martek the Exiled") },
          text = "Martek! Out in the Badlands, in a camp, with a goblin! He knows more about metal than anyone alive, and I need pistons that won't crack." },
        { id = "h_news", tags = { "news" }, when = { questActive = TODO_QUEST("News for Fizzle") },
          text = "News, for me, from Martek? Give it here!" },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery to the Gnomes") },
          text = "My hydro ratchets and repeater bolts! Let me check them for rattles, because rattles are bad, and ticking is worse." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Stand very still, druid, because the last time somebody turned into a bear near my pit, the whole piston rack fell over!" },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Gnomes have studied the arcane as long as we've studied gears, you know, but on the track, engineering is king, and I'd thank you not to disagree." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Stand very still, please, because the last time a demon came near my car, it ate a valve and I had to rebuild the entire intake." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "Stand very still, priest, because that pipe is under pressure! There, now, hello, and if you happen to have any healing about you, Wizzle burned his hand on the manifold again this morning." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Stand still, please, because plate armor and an open fuel line are a combination I've only seen once, and I'd prefer not to see it again." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! I'll ask you straight, are you working for Pozzik? Because I've had three spanners and an indurium coil go missing this month, and I'm running out of suspects." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I don't hold with spirits much, being an engineer, but I've seen a lightning storm melt a perfectly good engine, so I'll be polite." },
      },
      again = {
        { id = "h_again", text = "Yes? Yes? Quickly, the pistons are cooling!" },
        { id = "h_again2", text = "Another question? Splendid, I love questions, nearly as much as rockets!" },
      },
      choices = {
        { text = "Your fuel uses scorpid venom, Fizzle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's MEGA?", next = "mega" },
        { text = "Why race the goblins?", next = "why" },
        { text = "What are you building now?", next = "engine" },
        { text = "Is it true about your brothers?", next = "brothers" },
        { text = "Martek told me about indurium.", next = "indurium", when = { questDone = TODO_QUEST("News for Fizzle") } },
        { text = "I'm an engineer too.", next = "engineer", when = { profession = "Engineering" } },
        { text = "Could a haste spell help your rocket car?", next = "x_mage", when = { class = "MAGE" } },
        { text = "Couldn't magic help your engines, Fizzle?", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon wouldn't eat your car, Fizzle.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you ever worry someone will die on your track?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you trust Pozzik to race honestly?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is engineering anything like fighting, Fizzle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the flats' creatures ever damage your car, Fizzle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Who do you think has been stealing from you, Fizzle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the elements ever interfere with your machines, Fizzle?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'll stand very still. Goodbye.", next = "END" },
      },
    },
    mega = {
      lines = { { id = "m_default", text = "The Mechanical Engineers' Guild of Azeroth! We meet, we argue, and we blow things up on purpose; it's very civilized." } },
      choices = {
        { text = "On purpose?", next = "mega_purpose" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    mega_purpose = {
      lines = { { id = "mp_default", text = "Mostly! An explosion you planned is an experiment, and one you didn't is a lesson. Both are very educational for the eyebrows." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    why = {
      lines = { { id = "y_default", text = "Because they're there, and because they're wrong. Mostly the second." } },
      choices = { { text = "Good to know. I'll keep clear of the salt.", next = "BACK", fx = { affinity = 1, learn = { "mirage_raceway" } } } },
    },
    engine = {
      big = true,
      lines = { { id = "e_default", text = "An engine so fast the car will fly, I know it! But every piston I make cracks under the stress, so I need metal that doesn't care how hot it gets." } },
      choices = {
        { text = "Cars aren't meant to fly.", next = "engine_fly", fx = { trait = { skeptical = 1 } } },
        { text = "Who could make that metal?", next = "engine_who" },
      },
    },
    engine_fly = {
      lines = { { id = "ef_default", text = "Neither were gnomes, and here we are, flying all over the place. Mostly downward, I grant you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    engine_who = {
      lines = { { id = "ew_default", text = "Martek the Exiled! He's a smith, the best, far away in the Badlands, and nobody knows more about metal. Somebody should take him a letter... hint, hint." } },
      choices = {
        { text = "I'll take it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers = {
      lines = { { id = "b_default", text = "The Brassbolts brothers, yes! Wizzle handles the shells and fins, Rizzle handles the plans, and I handle the genius. It's a very efficient arrangement." } },
      choices = {
        { text = "Pozzik wants Rizzle's plans.", next = "brothers_plans", fx = { align = { honor = 1 } } },
        { text = "I'll keep what I know about Pozzik to myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_plans = {
      lines = { { id = "bp_default", text = "Of course he does, everyone does! That's why Rizzle sleeps on them, well, near them, well, he means to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    indurium = {
      lines = { { id = "i_default", text = "Indurium! It laughs at heat, and Martek's a genius, but flakes won't do; I need true ore, and that's deep in Uldaman. Have you been to Uldaman? You'll love it, probably." } },
      choices = {
        { text = "I'll bring you ore.", next = "BACK", fx = { affinity = 2, learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    engineer = {
      lines = { { id = "en_default", text = "Wonderful! Then you understand that 'it works' and 'it works twice' are entirely different claims. Keep your goggles on, always, even asleep." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "A spell, on my engine? Absolutely not, the tolerances are tuned to a hair, and one sparkle of arcane would throw off every gauge on the dash! Although, between us, if you could make the goblin car go slower, I'd call that science." },
        { id = "xm_orc", when = { race = "Orc", class = "MAGE" }, text = "An orc who studies magic instead of hitting things with it? That's a marvelous inversion, and I'd love to see your notes, though please don't cast anything near the fuel." },
      },
      choices = {
        { text = "Slowing the goblins would be cheating, Fizzle.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Name a price, and their car will crawl.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },


  topics = {
    background = { { id = "tp_ba", text = "Gnome, engineer, and the brains of the Brassbolts brothers. My brothers would say otherwise, but they'd be wrong.", next = "brothers" } },
    advice = { { id = "tp_ad", text = "Goggles, always! I can't say it enough, and some of my colleagues can't see it at all, any more." } },
    mirage_raceway = { { id = "tp_raceway", text = "My finest achievement, shared, regrettably, with a goblin." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I'd rather not. Let's talk about rockets instead, because rockets go up, and things should go up." } },
    _none = { { id = "tp_none", text = "Not my department, unless it has an engine!" } },
  },
}

P:NPC {
  key = "kravel", id = TODO_NPC("Kravel Koalbeard"), name = "Kravel Koalbeard",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "quest",
  communities = { "mirage_raceway" }, temper = { "sly" }, values = { "cunning", "ambitious" },
  notices = { "purse", "drink" },

  impression = {
    first = "Kravel Koalbeard speaks in a low voice and treats every conversation like a bet he's already won. Neither racing crew should trust him, and I'd wager both of them do.",
    third = "{name} met Kravel Koalbeard, a sly dwarf who fetches parts and whispers tips at the Mirage Raceway.",
  },

  greetings = {
    { id = "g_flap", text = "Close the flap behind ye. Walls have ears, an' at a racetrack the ears are usually bettin'." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my discreet friend. Ye've kept quiet, I trust?" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That's a fine heavy purse. Ever had a sure thing on a race? I might know of one." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Had a few, have ye? Grand, but who bought 'em for ye? Not me, I hope, for that'd be a waste." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only when they're losin', an' that's when they come tae me first, because I know which bruisers can keep their mouths shut. Nobody gets hurt that doesnae deserve it, mind, an' the winnin' car usually wins anyway." } },
      choices = {
        { text = "I don't hire out to rig races. Find someone else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin's coin. If the crew pays, I'll stand where you say.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Who walks intae the gnome tent after dark, who drinks wi' which goblin, an' who's got a new purse they shouldnae have. I watch it all, an' I make a decent livin' tellin' the right folk what I've seen." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} o' yours doesnae miss much either, does it? A beast like that would be worth its weight in gold, keepin' watch outside the right tent." },
      },
      choices = {
        { text = "What I see, I keep to myself. I'm no informer.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Information is coin. I'd sell it too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, just a little whisper here an' there, maybe a loose bolt that wasn't loose a minute ago. Nothin' that'd hurt anybody, mind, just enough to make the right car win." } },
      choices = {
        { text = "I don't fix races.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every race has a price.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Kravel.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'm only sayin' it's possible, friend, and a dwarf can wonder aloud. The crews would never suspect a curse, an' I'd never suspect anyone who did it." } },
      choices = {
        { text = "Curses aren't for cheating at races.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A curse might be worth the coin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothin' I'd tell a druid, or anyone else with a straight face. Let's say a car runs faster when the right man's paid, an' slower when the wrong man hasn't, an' leave the rest to the wind." } },
      choices = {
        { text = "Everyone cheats. At least you're honest about it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Cheating spoils the race. Stop it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Big, strong an' noticeable, which is a fine thing in a fight an' a terrible thing in my line o' work." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Ye've got patient eyes, an' patience is worth more out here than any engine, believe me." },
        { id = "h_default", key = true,
          text = "Kravel Koalbeard. I fetch parts for the crews, pass along a word here an' there, an' now an' then the right car wins. Funny how that works." },
        { id = "h_parts", when = { any = { { questActive = TODO_QUEST("Rocket Car Parts") }, { questActive = TODO_QUEST("Parts for Kravel") } } },
          text = "There's bits of rocket all over the flats from cars that didnae finish. Bring 'em to me, an' both teams'll pay for 'em, separately." },
        { id = "h_rumors", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Rumormonger") }, { questActive = TODO_QUEST("Rumors for Kravel") } } },
          text = "Krazek, in Booty Bay. That goblin sells rumors by the pound, an' I buy 'em by the ounce an' sell 'em by the word." },
        { id = "h_goblins", when = { questActive = TODO_QUEST("Get the Goblins Drunk") },
          text = "Here's the plan: the goblin pit boss gets a stout, on me, which is very generous of me. Tomorrow, his crew's a wee bit slow." },
        { id = "h_gnomes", when = { questActive = TODO_QUEST("Get the Gnomes Drunk") },
          text = "Now the gnomes, for fair's fair. If everybody's slow, nobody's slow, an' I collect on my wager." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? A fella who talks to rocks probably hears things, an' I like a fella who hears things." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, eh? Folk who can spot a spell on a car before the heat are worth a lot to me, an' I'd keep it quiet, if you catch my meanin'." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, eh? Now there's someone I could do business with, quiet-like, if ye know what I mean. Both crews pay well for the right word in the right ear." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock at the races! I'll bet ye've got ways of makin' a car go wrong that'd leave no tracks at all. Not that I'd ever ask, of course." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? Ye've a nose for things that aren't what they seem, so I'll keep me distance, if it's all the same to ye." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quietly, now." },
        { id = "h_again2", text = "Aye? Lean in, the tent's thin." },
      },
      choices = {
        { text = "What isn't what it seems on these flats, Kravel?", next = "xdruid", when = { class = "DRUID" } },
        { text = "You're rigging races. I could tell the crews.", tag = "Intimidate", next = "hush",
          check = { pass = { any = { { trait = "stern" }, { minLevel = 40 } } } },
          fail = { next = "laugh" } },
        { text = "What's the sure thing?", next = "sure" },
        { text = "What exactly do you sell?", next = "trade" },
        { text = "What was in that stout?", next = "stout", when = { any = { { questActive = TODO_QUEST("Get the Goblins Drunk") }, { questActive = TODO_QUEST("Get the Gnomes Drunk") }, { questDone = TODO_QUEST("Get the Goblins Drunk") } } } },
        { text = "The Light frowns on rigged races.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "A dwarf, out here among goblins?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "One schemer to another: what's the angle?", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "What would you pay to hear what the elements know, Kravel?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would a spellcaster be worth to you here?", next = "xhcast", when = { class = "MAGE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What kind of business, Kravel?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You want me to curse a car?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the racing crews ever hire muscle, Kravel?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What would patient eyes see around the raceway, Kravel?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I didn't hear any of this.", next = "END", fx = { affinity = 1 } },
      },
    },
    hush = {
      lines = { { id = "hu_default", text = "Now, now, nobody's rigged a thing. Here, for yer trouble an' yer short memory; we understand each other." } },
      choices = {
        { text = "We do.", next = "END", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Keep your coin, Kravel. I saw what I saw.", next = "END", fx = { align = { order = 1 } } },
      },
    },
    laugh = {
      lines = { { id = "la_default", text = "Tell 'em! Pozzik'll think I'm helpin' Fizzle, Fizzle'll think I'm helpin' Pozzik, an' both'll pay me to stop." } },
      choices = { { text = "...", next = "BACK" } },
    },
    sure = {
      lines = { { id = "s_default", text = "There's no such thing as a sure thing. That's why I make 'em." } },
      choices = {
        { text = "How?", next = "sure_how" },
        { text = "Of course you do.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
    sure_how = {
      lines = { { id = "sh_default", text = "Little things, like a delivery that arrives one wee piece short. Who'd miss one small worthless piece? Only a car doin' its top speed, that's who." } },
      choices = {
        { text = "That's Fizzle's order you're talking about.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Clever.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "Parts, mostly, since there's rocket scattered all over these flats, an' errands, an' words. A word from Booty Bay is worth more here than a gear, if it's the right word." } },
      choices = {
        { text = "Who do you buy words from?", next = "trade_words" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_words = {
      lines = { { id = "tw_default", text = "Krazek, in Booty Bay, an' a few others who'd rather I didnae say. Every rumor has a buyer, an' the trick's sellin' it twice." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    stout = {
      lines = { { id = "st_default", text = "A Fool's Stout, an' a wee bit of somethin' extra from a friend in Booty Bay. Nothin' harmful, mostly; they'll wake up a touch slow an' very thirsty." } },
      choices = {
        { text = "That's poisoning, Kravel.", next = "BACK", fx = { align = { honor = 1 }, affinity = -2 } },
        { text = "Slow and thirsty sounds like fair racing to me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = { { id = "li_default", text = "Does it? Well, the Light's no' placin' bets, so it's no' my concern. Pray for the losers if ye like; they'll need it more than me." } },
      choices = {
        { text = "I'll pray for you too.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "The losers can pray for themselves, then.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Ironforge has its forges an' its rules. Out here there's no rules, just goblins an' gnomes with more gold than sense. A dwarf could get used to it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Keep your voice down, friend, and your hands where I can see them, because I know exactly what you are. Nobody's rigged a thing out here, and if somebody had, the last soul they'd tell is a professional." },
      },
      choices = {
        { text = "Cut me in, or I talk to the crews.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'm not working today, Kravel. Relax.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A fair bit, if they could tell me which engine's runnin' hot before the heat, an' nothin' at all if they talked about it after. Information's the only thing on these flats worth more than fuel." } },
      choices = {
        { text = "Name your price, Kravel, and I'll name mine.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't sell tips on rigged races.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Depends what they know, don't it? If the wind tells you which car's runnin' rough before the heat, that's worth a coin or two, an' nobody needs to know where the tip came from." } },
      choices = {
        { text = "The spirits aren't for sale, Kravel, and certainly not to you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make me an offer, and we'll see what the wind says.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },


  topics = {
    background = { { id = "tp_ba", text = "A dwarf who found the flats more profitable than the mountain. That's all the story ye need." } },
    advice = { { id = "tp_ad", text = "Never drink anythin' at a racetrack ye didnae pour yerself. Trust me on that one." } },
    mirage_raceway = { { id = "tp_raceway", text = "Two crews, one track, an' a crowd that'll bet on anything. Paradise." } },
    _none = { { id = "tp_none", text = "That one's not for sale, an' the trouble is, I don't have it." } },
  },
}
