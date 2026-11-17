-- Ratchet: the Steamwheedle port on the Barrens coast, neutral ground. Voice: bibles/crossroads.md
-- Goblins first, factions second: everyone pays, nobody fights on the docks.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gazlowe", id = TODO_NPC("Gazlowe"), name = "Gazlowe",
  bible = "bibles/crossroads.md", role = "noble", tier = "major",
  temper = { "brash" }, values = { "ambitious", "practical" },
  notices = { "race" },
  impression = {
    first = "Gazlowe runs Ratchet for the Steamwheedle Cartel, and he will tell anyone who stands still that he built Orgrimmar for Thrall. He is loud and greedy and sharper than he lets on, and the Southsea pirates on his coast cost him money every day.",
    third = "{name} met Gazlowe, the goblin boss of Ratchet who once helped build Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, hey, a new face in my town! You buying, selling, or just admiring the view?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, repeat customers are the backbone of this whole operation." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } },
      text = "Alliance, huh? Don't sweat it, pal, because in Ratchet your gold's the same color as everybody else's." },
  },
  start = "hello",
  nodes = {
    xpt_gazlowe = {
      big = true,
      lines = { { id = "xpt_gazlowe_default", text = "Ratchet loves crews, pal, as long as they pay their tabs and keep their quarrels off my docks. Crews from both sides come through here, and the only rule I care about is that nobody starts a war where my boats can see it." } },
      choices = {
        { text = "Neutral ground is worth protecting. We'll keep the peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If trouble starts, we'll finish it, docks or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    xcl_dm = {
      big = true,
      lines = { { id = "xcl_dm_default", text = "Yeah, and I'll tell you what bugs me about it. VanCleef was a builder, same as me, and he and his masons rebuilt Stormwind and never got paid, so they took their tools and went to war. I built Orgrimmar for Thrall, and he paid me on time every time, which is why I'm running a port and not hiding in a mine with a rag over my face." } },
      choices = {
        { text = "Always pay the builders. Stormwind had it coming.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "VanCleef was owed, Gazlowe, but that doesn't make him right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Were the goblins down there Steamwheedle?", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "Not a chance, pal. They were freelancers and Venture Company leftovers, the kind of goblins who'd build a cannon for anyone with gold and never ask where it's pointed, and they give the rest of us a bad name." } },
      choices = { { text = "Sounds like the Cartel has standards after all, Gazlowe.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Ratchet welcomes coin. I've built for orcs, sold to humans and haggled with pirates, so a dead paladin is barely a novelty. Just don't go smiting anybody on my docks, because the Cartel charges for cleanup, and it's not cheap." } },
      choices = {
        { text = "I'll keep the peace on your docks, Gazlowe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll smite whoever deserves it, docks or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Pay? Pal, I'd put you on retainer if the Cartel let me, because every sailor the Southsea pirates carve up is a sailor I'm not shipping cargo with. Heal 'em quick and heal 'em cheap, and we'll get along fine." } },
      choices = {
        { text = "I don't heal for coin, Gazlowe. I heal because they're hurt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My prayers cost the same as anyone's work. Name a price.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Southsea pirates keep raiding my ships off the coast, and the Venture Company keeps making eyes at my docks, and neither of 'em understands polite letters. You go knock a few heads together on the beach, and Ratchet stays open for business, which is good for everybody, pal." } },
      choices = {
        { text = "I'll protect Ratchet's docks for the honest traders.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll knock heads for whoever pays the best rate.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Good hunting? Pal, there's crocolisks in the water, raptors in the hills and pirates on the beach, and I'd pay to see fewer of all three. The crocolisk hides sell nice down at the docks, too, so if you're out there anyway, you might as well turn a profit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours looks hungry, and I know that look, pal. Feed it before it comes down to the fish market, alright?" },
      },
      choices = {
        { text = "I'll hunt to keep the roads safe, Gazlowe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt whatever turns the best profit, Gazlowe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "He talked to 'em plenty, sure, but the walls went up because my crews worked double shifts, and he paid us, which I respect. He said the earth there was willing, whatever that means, and I'll take willing earth over a lazy goblin any day." } },
      choices = {
        { text = "A spirit's blessing holds a city up better than mortar.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Walls are walls, and coin and labor built them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Now you're talking my language, pal! Somebody on my own docks is tipping off the Southsea about which boats carry what, and I'd love to know who, though the bruisers won't lay a hand on anybody without proof, so bring me something better than a hunch." },
      },
      choices = {
        { text = "Leave it to me. Nobody will even know I was looking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll catch them openly, in front of your bruisers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What's the trouble with the pirates, anyway?", next = "pirates" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Expensive is the best word in the language, pal, and I respect a professional. The last mage who worked my docks froze a Southsea boarding party solid and then froze half my pier along with 'em, so if you want work around here, you aim better than he did." },
      },
      choices = {
        { text = "I'll be careful with your pier. Precision is the job.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little damage to the pier is part of the price.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who else should I know around Ratchet?", next = "town" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The bruisers care about one thing, which is whether you start trouble on my docks. Your demon's welcome to stand around looking scary for all I care, but if it sets fire to so much as one crate, you're paying for the crate, the fire and the bruiser who puts it out." },
      },
      choices = {
        { text = "Fair rules. My demon won't touch a crate.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If your docks burn, they burn. I'm not paying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How does a goblin town stay neutral?", next = "neutral" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sure, every time the fish get scarce, because empty nets cost me money. I'm a businessman, not a monster, so I keep the worst of the dumping out past the point where nobody swims, and I call that a compromise." } },
      choices = {
        { text = "Trade can be clean. You owe this coast better than that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A port is a port. The sea can take a little filth.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "A whole crew! Now that's good business, because five of you need five times the repairs, five times the bandages and five times the boat tickets, and Ratchet sells all of it." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin, in my town! Keep that hammer sheathed on the docks like everyone else, and we'll get along fine, glow or no glow." },
        { id = "h_default", key = true,
          text = "Name's Gazlowe, and Ratchet's my town, so whatever you need, it goes through me eventually. Keep your blades sheathed on the docks and we'll get along just fine." },
        { id = "h_pirates", when = { questActive = TODO_QUEST("Southsea Freebooters") },
          text = "Those Southsea freebooters are camped right down the coast, bleeding my shipping dry. Thin 'em out for me, and Ratchet breathes easier." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The big guy, Thrall, is one of you, and I'll tell you what I told him, which is that lightning's great but a good crane is better for building a city." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Look, I know the look you're about to give me about the docks and the smoke, so I'll tell you up front that Ratchet's cleaner than any port the pirates run." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, huh? Great, I've always got work for somebody who hits hard and doesn't ask me why." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Keep that beast of yours off my docks, pal, because the last one ate half a crate of fish and I'm still getting complaints." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Great, because Ratchet's always got somebody bleeding on the docks, and the pirates sure aren't paying for bandages." },
        { id = "h_cl_dm", tags = { "news" }, when = { cleared = "The Deadmines" }, text = "Heard you went down into the Deadmines and put VanCleef out of business. Can't say I'm crying, pal, but whoever built that juggernaut down there knew what they were doing." },
      },
      choices = {
        { text = "Did Thrall use the spirits to build Orgrimmar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does Ratchet ever think about what it does to the coast?", next = "xdruid", when = { class = "DRUID" } },
        { text = "You built Orgrimmar?", next = "orgrimmar" },
        { text = "What's the trouble with the pirates?", next = "pirates" },
        { text = "Who else should I know in Ratchet?", next = "town" },
        { text = "Tell me about the Steamwheedle Cartel.", next = "cartel" },
        { text = "What do you make of the big bosses, Thrall and the rest?", next = "bosses" },
        { text = "I'm a tinker's apprentice. Who designs your shredders?", next = "o_tinker", when = { origin = "gnome_tinker_apprentice" } },
        { text = "I pull parts out of Gnomeregan. Interested?", next = "o_salvage", when = { origin = "gnome_scavenger" } },
        { text = "I used to run ale through Loch Modan, Gazlowe.", next = "o_smuggler", when = { origin = "dwarf_loch_smuggler" } },
        { text = "Nice purse, Gazlowe. You should keep it closer.", next = "o_pickpocket", when = { origin = "human_canal_pickpocket" } },
        { text = "I came over on Thrall's boats, Gazlowe.", next = "o_sailed", when = { origin = "troll_sailed_with_thrall" } },
        { text = "How does a goblin town stay neutral?", next = "neutral", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } } },
        { text = "Your docks leak cargo. I could find out who's helping it along.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Need a mage for anything? I'm told I'm expensive.", next = "xmage", when = { class = "MAGE" } },
        { text = "What kind of work, Gazlowe?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is there good hunting near Ratchet, Gazlowe?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "A warlock walks into Ratchet. Do the bruisers care?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Would Ratchet pay for a priest, Gazlowe?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does Ratchet welcome paladins, Gazlowe?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I cleared out VanCleef's crew in the Deadmines, Gazlowe.", next = "xcl_dm", when = { cleared = "The Deadmines" } },
        { text = "We're a crew now. What does Ratchet think of crews?", next = "xpt_gazlowe", when = { party = { size = { min = 2 } } } },
        { text = "I'll see you around, Gazlowe.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, but I'll spot you a little." },
        { id = "h_again2", text = "Still here? Good, ask away, the first questions are free." },
      },
    },
    orgrimmar = {
      lines = { { id = "o_default", text = "Me and my crew, sure, back when Thrall first landed with a bunch of orcs and no idea how to raise a wall that didn't fall over. We built him a city, and he paid us, and then he let us keep this little harbor besides." } },
      choices = { { text = "And you've been here since?", next = "orgrimmar_since" } },
    },
    orgrimmar_since = {
      lines = { { id = "os_default", text = "Ratchet was nothing but sand and a broken pier when I got here. Now look at it: a bank, a boat to Booty Bay, and every caravan from the Crossroads to the coast pays a toll somewhere along the way." } },
      choices = { { text = "Do you miss building?", next = "orgrimmar_miss" } },
    },
    orgrimmar_miss = {
      lines = { { id = "om_default", text = "Building's fine, but owning is better, pal, and I learned that the hard way. Still, I'd take another big job if the Warchief came asking and the price was right." } },
      choices = {
        { text = "A deal's a deal. Thrall was right to pay you fairly.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You should have squeezed him for twice as much.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "The Southsea Freebooters think anything floating off my coast belongs to them. They've cost me cargo, crews and two very nice boats, and I'm running out of patience and polite words." } },
      choices = { { text = "I'll handle them.", next = "BACK", fx = { affinity = 2 } } },
    },
    town = {
      lines = { { id = "t_default", text = "Wharfmaster Dizzywig keeps the docks, Mebok Mizzyrix is always cooking up some deal, and Sputtervalve, well, he lost a very important gizmo and won't shut up about it." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    neutral = {
      lines = { { id = "n_default", text = "Easy: the bruisers on the docks hit anybody who starts trouble, Horde or Alliance, and nobody wants to lose the only decent harbor on this coast. Business keeps the peace better than any treaty." } },
      choices = {
        { text = "Peace bought with gold is still peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace that's for sale can be bought out from under you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    -- 0.71.0 depth: the Cartel, the big bosses, and the people who wash up in Ratchet.
    cartel = {
      hub = true,
      lines = { { id = "ca_default", text = "The Steamwheedle Cartel's the biggest outfit on the water, pal: Booty Bay, Gadgetzan, Everlook and my own Ratchet, and every one of us stays neutral because war's terrible for repeat customers. Ask away, the brochure's free." } },
      again = {
        { id = "ca_again", text = "What else about the Cartel? I've got a speech for every question." },
        { id = "ca_again2", text = "Keep 'em coming, pal, I love talking shop." },
      },
      choices = {
        { text = "Who runs Booty Bay?", next = "c_revilgaz" },
        { text = "What about the Venture Company?", next = "c_venture" },
        { text = "What's this I hear about racing at the Shimmering Flats?", next = "c_race" },
        { text = "So does gold come before loyalty, Gazlowe?", next = "big_profit" },
        { text = "Revilgaz says you owe him money, Gazlowe.", tag = "Deceive", next = "d_owed",
          check = { pass = { any = { { disposition = { min = 55 } }, { trait = "witty" }, { class = "ROGUE" }, { origin = "human_canal_pickpocket" }, { origin = "dwarf_loch_smuggler" } } } },
          fail = { next = "d_caught", fx = { affinity = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    c_revilgaz = {
      lines = { { id = "cr_default", text = "Baron Revilgaz, up on his balcony over the Salty Sailor, counting coins and yelling at the Bloodsail, and he's the only goblin I know who could out-haggle me on a good day. We run the boat back and forth, we split the gossip, and we both pretend the other guy's port is smaller." } },
      choices = {
        { text = "Sounds like a friendly rivalry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_venture = {
      lines = { { id = "cv_default", text = "The Venture Company's what you get when a goblin decides contracts are for suckers. They strip a hill bare, foul the water and shoot the locals, and then they wonder why nobody wants to trade with goblins, so every tauren who spits on my boots is really spitting at them." } },
      choices = {
        { text = "Aren't you all goblins, though?", next = "c_venture2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_venture2 = {
      lines = { { id = "cv2_default", text = "Sure, and humans are all humans, but you don't see Stormwind taking the blame for the Defias, do ya? The Cartel builds a port and sticks around to collect rent, so we need the neighbors happy, while the Venture Co. grabs the ore and runs. So what about you, pal, are you a buyer or a seller?" } },
      choices = {
        { text = "A buyer. I like nice things.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "A seller. Everything's got a price.", next = "BACK", fx = { affinity = 1, trait = { greedy = 1 } } },
        { text = "Neither. I fight for what's right, not for coin.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    c_race = {
      lines = {
        { id = "crc_default", text = "Down at the Shimmering Flats, the Cartel's racing team and the gnomes blow each other up for the honor of going fastest. I find parts for our boys, I used to work on a rig myself, and I owe 'em a prototype fuel regulator, which I'll get to just as soon as somebody stops shooting at my boats." },
        { id = "crc_gnome", when = { race = "Gnome" }, text = "Your people and mine race rockets across the salt down at the Shimmering Flats, and lately your team's been getting faster with the same designs, which I'll only admit because you'll hear it anyway. I find parts for our boys, and I owe 'em a fuel regulator I haven't built yet, so don't tell 'em you saw me." },
      },
      choices = {
        { text = "Who usually wins?", next = "c_race2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_race2 = {
      lines = { { id = "crc2_default", text = "Depends who you ask and how many pieces they found afterwards. The gnomes build slow and blow up less, our boys build fast and blow up spectacular, and the crowd pays to watch both, so frankly, pal, the Cartel wins every single race." } },
      choices = {
        { text = "Spoken like a true bookie.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big_profit = {
      big = true,
      lines = { { id = "bp_default", text = "Gold doesn't care who's holding it, pal, which is the most honest thing about it. I sold nails to Orgrimmar and rope to Theramore in the same week, and I'll sleep fine tonight, because the day Ratchet picks a side is the day the other side burns it down." } },
      choices = {
        { text = "Smart. Never tie your purse to a banner.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Pick a side and stand by it, or you stand for nothing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Doesn't Thrall mind you trading with Theramore?", next = "b_theramore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_owed = {
      lines = { { id = "do_default", text = "He said WHAT? I don't owe Revilgaz a copper, pal, it's the racing team I owe, and if the Baron's telling people I'm behind on payments, the Cartel's gonna start asking about Ratchet's books. And since the Southsea started hitting my boats, I've been padding the dock fees a little to cover the losses, so the books really don't want to be asked about." } },
      choices = {
        { text = "Your secret's safe with me, Gazlowe.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Revilgaz never said a word, by the way.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    d_caught = {
      lines = { { id = "dc_default", text = "Nice try, pal. Revilgaz and I settle up every month on the boat, in writing, with witnesses, because neither of us trusts the other as far as we could throw a shredder, so you'll have to get up a lot earlier than that to hustle a goblin." } },
      choices = { { text = "Worth a shot.", next = "BACK" } },
    },
    bosses = {
      hub = true,
      lines = { { id = "bo_default", text = "The big bosses? Pal, I've built for some of 'em, sold to the rest and been yelled at by all of 'em, so I've got opinions. Pick one, and I'll tell you what I'd never say to their faces." } },
      again = {
        { id = "bo_again", text = "Who else? I've got plenty of opinions left." },
        { id = "bo_again2", text = "Next boss, pal. This is the fun part." },
      },
      choices = {
        { text = "What's Thrall like as a customer?", next = "b_thrall" },
        { text = "What do the tauren make of you?", next = "b_cairne" },
        { text = "And Theramore, across the water?", next = "b_theramore" },
        { text = "I'm Alliance. Does Thrall mind you serving us?", next = "b_alliance", when = { faction = "Alliance" } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    b_thrall = {
      lines = {
        { id = "bt_default", text = "Best client I ever had, and I've had a lot of clients. He paid on time, he never haggled down a fair quote, and when my crew finished the walls he came down personally and said thanks, which no warlord in history has ever done for a goblin." },
        { id = "bt_warm", when = { disposition = { min = 70 } }, text = "Between you and me, pal, Thrall's the only client who ever thanked me, and I've never told anybody this, but I'd have built that city for half if he'd pushed. Don't you dare tell him, because I've got a reputation." },
      },
      choices = {
        { text = "Sounds like you respect him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b_cairne = {
      lines = { { id = "bc_default", text = "The big bull up on Thunder Bluff is polite as anything, but the Venture Company fouled his wells, so every goblin who walks into Mulgore gets looked at like a weasel in a henhouse. I'm working on it, pal, one honest deal at a time." } },
      choices = {
        { text = "Good luck with that, Gazlowe.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b_theramore = {
      lines = { { id = "bth_default", text = "Lady Proudmoore runs a tidy town and pays her freight on time, which puts her ahead of most kings. Her soldiers up at Northwatch Hold, now, they're another story, sitting up the coast glaring at my docks like I'm hiding orcs in the crates." } },
      choices = {
        { text = "Are you hiding orcs in the crates?", next = "b_theramore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b_theramore2 = {
      lines = { { id = "bth2_default", text = "Only paying ones, pal, and they get off at the dock like everybody else. Thrall knows I trade with Theramore and Lady Proudmoore knows I trade with Orgrimmar, and as long as neither of 'em catches me playing favorites, Ratchet stays the one spot on this coast where nobody gets shot." } },
      choices = {
        { text = "That's a fine line to walk, Gazlowe.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b_alliance = {
      lines = { { id = "ba_default", text = "Mind? Pal, a port that only serves orcs is a port the Alliance has a reason to burn, and Thrall's smart enough to know it. Your gold keeps my bruisers paid, and my bruisers keep your head on your shoulders while you're here, so everybody wins." } },
      choices = {
        { text = "Fair enough, Gazlowe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    o_tinker = {
      lines = { { id = "ot_default", text = "A gnome tinker! Okay, cards on the table: my shredders are goblin design, built fast and cheap, and you lot would build 'em safer and slower and charge twice as much. So tell me, pal, how many explosions does a gnome apprentice get before they stop counting?" } },
      choices = {
        { text = "Three so far, and one workshop fire.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Safety's worth the extra cost, Gazlowe.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'd never tell a goblin our secrets.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    o_salvage = {
      lines = { { id = "osv_default", text = "Gnomeregan parts, huh? Now we're talking. I hear the troggs and that crazy Thermaplugg run the place now and the whole city's leaking something green, so anything you drag out of there gets a good wash before it goes near my cranes. What've you got?" } },
      choices = {
        { text = "Gears, mostly, and a few things that still tick.", next = "BACK", fx = { affinity = 1, trait = { practical = 1 } } },
        { text = "Nothing for sale. Those parts belong to my people.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Mostly sludge and bad memories, Gazlowe.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    o_smuggler = {
      lines = { { id = "osm_default", text = "Ha! A runner! Now look, Ratchet's an honest port, mostly, so everything that comes off a boat here goes past Dizzywig and pays its toll. But I'll tell you what I tell every smuggler who washes up here: the toll's cheaper than the Southsea, and it's a whole lot cheaper than my bruisers." } },
      choices = {
        { text = "Fair rules. I'm retired anyway.", next = "BACK", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "Tolls are for people who get caught.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    o_pickpocket = {
      lines = { { id = "opp_default", text = "You've got quick eyes, pal, I'll give you that, but my purse is chained to my belt with a goblin lock, because I grew up on docks too. Stormwind's canals, right? Tell me, is it true the city still hasn't paid its stonemasons?" } },
      choices = {
        { text = "Still hasn't. That's half of why Westfall's burning.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 }, opinion = { stormwind_masons = "owed" } } },
        { text = "Not my business. I just lift purses.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'm not a pickpocket anymore, Gazlowe.", next = "BACK", fx = { trait = { honest = 1 } } },
      },
    },
    o_sailed = {
      lines = { { id = "osl_default", text = "Thrall's boats! You lot came off those ships soaked and hungry and arguing about a sea witch, and a week later you'd built half of Sen'jin out of driftwood and stubbornness. I quoted Vol'jin a fair price on proper lumber, and he looked at me like I'd tried to sell him his own island, so I've had a soft spot for trolls ever since." } },
      choices = {
        { text = "We were grateful, Gazlowe, even if Vol'jin didn't show it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Driftwood was free, goblin.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "Pal, every rumor on this coast comes through my docks sooner or later, and half of 'em pay a toll on the way. Ask me about any of these, and the first answer's on the house." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, because answers are cheap, but don't expect me to throw in the good stuff for somebody I don't trust yet." },
    },
    _none = { { id = "tp_none", text = "Never heard of it, and if I haven't heard of it, it isn't making anybody any money." } },
  },
}

P:NPC {
  key = "sputtervalve", id = TODO_NPC("Sputtervalve"), name = "Sputtervalve",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  temper = { "anxious" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Sputtervalve is a goblin tinker in Ratchet who cannot stop talking about the Samophlange, a contraption he lost out in the Barrens. He means well and frets constantly, and his sentences rarely end where they started.",
    third = "{name} met Sputtervalve, a fretful goblin tinker in Ratchet.",
  },
  greetings = {
    { id = "g_hi", text = "Oh! A customer, or a helper, or maybe both, which would be best of all, really." },
  },
  notice = {
    { id = "n_eng", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A spellcaster, huh? You folks never appreciate a good gear, but I won't hold that against you." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Probably not, but I'd love to try, mostly. I once tried to make a lamp that runs on prayer, and it exploded, which I think means it worked a little. You wouldn't happen to want to pray at my Samophlange, if I ever find it?" } },
      choices = {
        { text = "The Light isn't a tool for gadgets, Sputtervalve.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If it pays, I'll pray at your contraption.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Well, I don't know how prayer works, exactly, or at all, but I've tried wrenches and maps and shouting, so it can't do any worse! If your loa or your shadow or whatever you've got happens to see a big brass contraption out in the Barrens, you'd tell me, wouldn't you?" } },
      choices = {
        { text = "I'll pray for it with you, Sputtervalve. It can't hurt.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The gods have better things to find than your contraption.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sputtervalve.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, they're fine, mostly, though one of them still can't hear on his left side. The Venture Company boys at the Sludge Fen are worse, though, because they've got shredders and guards, and somebody with a big axe could get my Samophlange back a lot quicker than I could." } },
      choices = {
        { text = "I'll get your Samophlange back, Sputtervalve.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep whatever the Venture Company has worth taking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Troubled them? A raptor ate a whole fuel regulator last month, and it was the only one I had! The beasts of the Barrens are curious about anything that rattles, so if you see something out there that looks like a bit of a machine, it's probably mine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from my workbench, please. I'm sure it's lovely, but the last beast that sniffed it set off a very small explosion." },
      },
      choices = {
        { text = "I'll bring back any of your parts I find.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Finders keepers, Sputtervalve. Salvage pays well.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Anger them? I hope not, but now that you mention it, the Samophlange did spark something terrible right before I lost it. That was probably just the coil, though, wasn't it? Please say it was the coil." } },
      choices = {
        { text = "Respect the elements, and your machines will fare better.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It was the coil. Gears need no spirit's permission.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would I! The Venture Company boys out at the Sludge Fen have it, I'm almost certain, and they'll have it locked up tighter than a gnome's toolbox, so if you can slip in without blowing anything up, which is more than I've ever managed, you'll be the best friend a tinker ever had." },
      },
      choices = {
        { text = "I'll take it back quietly. They stole it first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll take it fair and square, even if it means a fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What exactly is a Samophlange, anyway?", next = "samo" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Oh, I couldn't, I really couldn't, because there's a year of my work in it and most of my eyebrows. But if something has nested in it I'll move the nest very gently, or I'll find someone who knows how, which might be you." } },
      choices = {
        { text = "Your work matters. Bring it home, nest or no nest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the Barrens claimed it, let the Barrens keep it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Fascinating, absolutely fascinating, mostly. Does the Light run on anything? Gears? Faith? Something I could build?" },
        { id = "h_default", key = true,
          text = "Sputtervalve, inventor and tinker, at your service, mostly. You wouldn't happen to have seen a Samophlange lying around out in the Barrens, would you?" },
        { id = "h_samo", when = { questActive = TODO_QUEST("Samophlange") },
          text = "The Samophlange is still out there, and every day it sits in the dust I lose another year off my life. Please hurry, and please don't drop it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, you don't happen to know a spirit who finds lost things, do you, because the Samophlange is still out there and I've asked everyone else already." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Oh, you wouldn't know whether the Samophlange counts as part of nature now, would you, because it's been lying out in the grass so long that something's probably nesting in it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Oh, splendid, you look sturdy enough to stand next to my experiments, which is more than my last three assistants could say." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, how marvellous! Tell me, does your beast ever chase things that go bang? Because I've had some trouble with that." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, a real one, which is good, because I've been saying a little prayer for my Samophlange every night and I'm not sure I've been doing it right." },
      },
      choices = {
        { text = "Do your machines ever anger the elements, Sputtervalve?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you leave the Samophlange where it lies, if something nested there?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What is a Samophlange?", next = "samo" },
        { text = "How did you lose it?", next = "lost" },
        { text = "Is Ratchet good for a tinker?", next = "ratchet" },
        { text = "Magic does what gears can't, little tinker.", next = "magic", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I get into places quietly. Shall I fetch your Samophlange?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What happened to your last assistants, Sputtervalve?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have beasts troubled your inventions, Sputtervalve?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you think prayer could find your Samophlange?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could you build something with the Light, Sputtervalve?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good luck with it.", next = "END" },
      },
      again = { { id = "h_again", text = "More questions? I love questions, almost as much as I love gears, almost." } },
    },
    samo = {
      lines = { { id = "s_default", text = "It's a pressure-regulating, flow-correcting, all-purpose mechanical marvel, and it's the heart of a very big project. I can't tell you what the project is, because it isn't finished and I'm superstitious." } },
      choices = { { text = "Can you give me a hint?", next = "samo_hint" } },
    },
    samo_hint = {
      lines = { { id = "sh_default", text = "Let's just say there's oil under the Barrens, and the Venture Company isn't the only outfit that knows it. A goblin with the right machine could make a fortune, and keep it out of the wrong hands besides." } },
      choices = { { text = "Out of the Venture Company's hands?", next = "samo_venture" } },
    },
    samo_venture = {
      lines = { { id = "sv_default", text = "Those thugs would drill the whole plain dry and leave the tauren nothing but holes. I'm greedy, sure, but I'm a Steamwheedle goblin, and we like our customers alive." } },
      choices = {
        { text = "Better you than the Venture Company, then.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The land isn't anyone's to drill, goblin.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I was testing it in the field, and then there were centaur, and then there was running, and then there wasn't a Samophlange anymore. It's not the most dignified story." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK" } },
    },
    ratchet = {
      lines = { { id = "r_default", text = "Good enough! Gazlowe keeps the peace and the boats bring parts from Booty Bay, though they charge me a fortune for every bolt." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magic = {
      lines = { { id = "m_default", text = "Sure, until it doesn't, and then you've got nothing but a headache and a puff of smoke. A gear you can fix, but try fixing a fireball after it's gone off." } },
      choices = { { text = "Fair point.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of that, but if it's got moving parts, bring it by and I'll take a look." } },
  },
}

P:NPC {
  key = "mebok", id = TODO_NPC("Mebok Mizzyrix"), name = "Mebok Mizzyrix",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  temper = { "smooth" }, values = { "ambitious" },
  notices = { "race" },
  impression = {
    first = "Mebok Mizzyrix sells concoctions out of Ratchet and wants raptor horns and other odd ingredients for them. He is a pure salesman, all promises and grins, and he never says exactly what the drinks are for.",
    third = "{name} met Mebok Mizzyrix, a goblin peddler of tonics in Ratchet.",
  },
  greetings = {
    { id = "g_hi", text = "Step right up, friend, because Mebok Mizzyrix has exactly what you need, even if you don't know it yet." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Of course! I always have something. The question is whether you want to know what's in it, and most of my customers don't. A paladin might, of course, being so very honest, but honesty is terrible for business." } },
      choices = {
        { text = "I'll want to know what's in it, Mebok.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Don't tell me. I'll just drink it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Anything a priest gives away for free, I sell in a bottle, which is why your lot and I don't always get along. But a long day of healing grunts leaves anybody dry, and there's nothing a little raptor horn can't fix, if you catch my meaning." } },
      choices = {
        { text = "Healing shouldn't come in a bottle at a goblin's price.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sell what you like. People pay for what they need.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Mebok.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Rage tonic, courage brew and something I call Mebok's Battle Breakfast, though you'll want to drink that one standing up. They're mostly harmless and occasionally helpful, which is more than you can say for most of what the Southsea pirates sell." } },
      choices = {
        { text = "I'll fight on my own strength, Mebok, not your tonics.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it helps me fight harder, I'll drink anything.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisk eyes, zhevra hooves and the odd plainstrider gizzard, if you're not too squeamish. The beasts of the Barrens are full of useful things, as long as somebody else does the collecting, and that somebody could be you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it could sniff out a good ingredient. I don't suppose it'd like a job? No, I didn't think so." },
      },
      choices = {
        { text = "I'll only take what the beast can spare.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Name your ingredient, Mebok. I'll take it, whatever it costs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Anger them? Friend, I give those raptors a second life in a bottle, which is more than the Barrens ever gave them. The tauren don't see it that way, of course, but the tauren don't pay my rent either." } },
      choices = {
        { text = "A beast killed for its horn deserves better than a sales pitch.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead raptors need no apology. Business is business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Oh, it would, and I've had three customers ask this week alone, but I'm a purveyor of fine refreshment, not poisons! Of course, a strong enough sleeping draught does help a fellow sleep very soundly, and who's to say which guard ends up drinking it." },
      },
      choices = {
        { text = "Sleeping guards make for easy work. Count me in.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "No. I'd rather keep my business honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Do your tonics actually work, Mebok?", next = "work" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Shh, not so loud, pal! Nobody said magic, I said refreshment, and if a customer feels a little brighter after a swig, who am I to argue with a satisfied customer?" },
      },
      choices = {
        { text = "Fair enough. A good sale is a good sale.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Your customers deserve to know what they're drinking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What do you use the raptor horns for?", next = "horns" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Trade secret, my friend, though I'll admit a raptor horn or two goes into the better ones. Everything I use comes out of the Barrens, so you could say it's natural, and I'd like you to say so to all your friends." } },
      choices = {
        { text = "A seller should tell buyers what they're drinking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Secrets are fair in trade. Buyers should ask better questions.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, though they never tell me what for, and I never ask, because that's how a goblin stays in business. Bring me a few raptor horns and I'll mix you something to keep your hands steady while you're shouting at a demon." },
      },
      choices = {
        { text = "A deal's a deal, Mebok. I'll bring the horns.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the tonic now and see about the horns later.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Now there's a customer with special needs. My tonics refresh the living, but I'm sure I can find something for you." },
        { id = "h_default", key = true,
          text = "Mebok Mizzyrix, purveyor of fine tonics and quality refreshment. I'm always looking for a few special ingredients, and the Barrens is full of them, if you've got the stomach to collect." },
        { id = "h_horns", when = { questActive = TODO_QUEST("Raptor Horns") },
          text = "Raptor horns, friend, the bigger the better! The thunderheads and stormsnouts out west have the good ones." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now there's a customer who appreciates a tonic with a little lightning in it, and I happen to have exactly that, if you take my meaning." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! A customer like you knows herbs, so you'll appreciate that every one of my tonics is made from the finest things the Barrens has to offer, more or less." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You'll be wanting a little something to steady the nerves before a fight, and I've got just the thing." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Now you're exactly the sort of customer I like, because you go places I wouldn't, and you bring back interesting bits." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Now there's a customer who appreciates a good restorative, and I've got tonics that'll put a bit of zip back in your prayers." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now there's a customer with interesting tastes, and I've got a tonic for nearly every taste there is." },
      },
      choices = {
        { text = "Do your tonics anger the spirits of the beasts you use?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's actually in your tonics, Mebok?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do you use raptor horns for?", next = "horns" },
        { text = "Do your tonics actually work?", next = "work" },
        { text = "What's Ratchet like for business?", next = "biz" },
        { text = "Tauren medicine doesn't need goblin salesmanship.", next = "tauren", when = { race = "Tauren" } },
        { text = "A tonic that puts a guard to sleep would sell well, Mebok.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your tonics aren't magic, Mebok. I'd know.", next = "xmage", when = { class = "MAGE" } },
        { text = "What do you sell for warriors, Mebok?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What ingredients do you need from the Barrens, Mebok?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would a priest want with your tonics, Mebok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warlocks ever buy your tonics, Mebok?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Do you have anything for a Forsaken, Mebok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Maybe later.", next = "END" },
      },
      again = { { id = "h_again", text = "Another question, friend? Mebok's always happy to talk, especially about Mebok." } },
    },
    horns = {
      lines = { { id = "h1_default", text = "Ground fine, they put a little kick in a drink that the customers just love. Don't ask me why it works, because I'm a businessman, not an alchemist." } },
      choices = { { text = "And who buys them?", next = "horns_who" } },
    },
    horns_who = {
      lines = { { id = "h2_default", text = "Sailors, mostly, and caravan guards, and anybody who wants to feel ten feet tall after a long day. A few orcs from the Crossroads come in on the quiet, too." } },
      choices = { { text = "And it's safe?", next = "horns_safe" } },
    },
    horns_safe = {
      lines = { { id = "h3_default", text = "Safe is a strong word, friend, and I'm a careful man with strong words. Nobody's complained yet, and the ones who might have aren't in any shape to." } },
      choices = {
        { text = "People deserve to know what they're drinking.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "If they buy it, that's their lookout.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Never mind, then.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Of course they work, friend, because the customers keep coming back, and nobody comes back for a drink that doesn't do something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    biz = {
      lines = { { id = "b_default", text = "Couldn't be better, friend, what with pirates and quilboar and centaur keeping everyone thirsty and nervous. Trouble's good for trade, as long as it stays off the docks." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "No offense meant, big fella, I'd never sell against the Earth Mother. My stuff's for folks who want a quick kick, not a spiritual journey." } },
      choices = { { text = "See that you don't.", next = "BACK", fx = { affinity = -1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Can't say I know it, friend, but if it sells, Mebok will learn quick." } },
  },
}

P:NPC {
  key = "dizzywig", id = TODO_NPC("Wharfmaster Dizzywig"), name = "Wharfmaster Dizzywig",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  temper = { "harried" }, values = { "practical", "dutiful" },
  notices = { "race" },
  impression = {
    first = "Wharfmaster Dizzywig keeps Ratchet's docks running and keeps a ledger of every crate that never arrived. He is harried and exact, and a missing shipment makes him take it personally.",
    third = "{name} met Wharfmaster Dizzywig, who runs Ratchet's docks.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the crates, and mind the ropes, and mind the edge, because I'm not fishing anybody out today." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I doubt it, but the pirates do take the crates, and I'd love to see a paladin explain to them that stealing is wrong. They'd laugh, and then you'd hit them, and then I'd get my crates back. That's my kind of sermon." } },
      choices = {
        { text = "Then I'll give the pirates a sermon they won't forget.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find your crates, for a share of them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Three of my dockhands came back from a run past the Southsea pirates with cuts I didn't want to look at, and I had to mark them down as 'damaged' like a split crate. If you've any healing left in you, they're resting in the warehouse, and I'd write that down as a kindness." } },
      choices = {
        { text = "Point me to your dockhands. They'll be mended today.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your dockhands are a goblin problem, Wharfmaster, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Wharfmaster.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Southsea pirates, mostly, and somebody right here in Ratchet, I'd wager, because some crates go missing before they're even unloaded. If you see anybody hauling cargo up the beach at night, stand in their way and ask them nicely, and if that doesn't work, ask them less nicely." } },
      choices = {
        { text = "I'll guard the docks and turn the thieves over to you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll guard them, if I get a cut of what I recover.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hides and teeth go to Booty Bay, and the crocolisk skins fetch the best prices, though the pirates like them too. Keep your crates labelled and your manifest honest, and I'll make sure your goods reach the boat, or at least that I know who took them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} isn't going on any boat without a proper manifest, before you ask. I've had to write up a monkey once, and it wasn't pretty." },
      },
      choices = {
        { text = "I'll keep my manifest honest, wharfmaster.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little cargo off the books never hurt anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The orc crews do, and they tip a cup of grog overboard before they cast off, which comes out of my stores, so I log it. The goblin crews call it a waste, and the goblin crews lose more cargo, and I've started to wonder whether those two things are related." } },
      choices = {
        { text = "Then log the offering as a proper cost of business.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No ledger will ever strike a bargain with the sea.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "No, they don't, and I've got a whole page in my ledger for crates that walked off with somebody's help. Half go to the Southsea, but the other half go missing right here between the ship and my scales, and that tells me somebody in Ratchet knows how to lift a lid quietly." },
      },
      choices = {
        { text = "Then I'll help you catch them, wharfmaster.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Somebody's good at their job. I respect that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where do the shipments usually go missing?", next = "missing" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Have you seen what a mage does to a crate of eggs when he teleports it? The boat to Booty Bay works fine and the sea never sends me a bill, so I'll keep my cargo on the water where I can count it." },
      },
      choices = {
        { text = "Fair enough. The old ways work well enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is the future. Your boats are behind the times.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do your boats sail?", next = "boats" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Southsea pirates, most likely, though the ledger can't prove it and the Cartel wants proof before it spends a single copper. I've been keeping my own count of their sails off the coast, and it goes up every time a shipment goes missing." } },
      choices = {
        { text = "Get the proof first. The Cartel is right to want it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the ledger. Board their ships and take the crates back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "A demon that watches crates? It'd eat the crates, or the dockhands, and then I'd have to write it all down. No, my shipments go missing on the coast south of town, where the Southsea pirates camp, so if you want to help, take your demon there and leave my docks alone." },
      },
      choices = {
        { text = "I'll get your shipments back, wharfmaster.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll get them back, for a share of what's inside.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Let me guess: you've come to find my missing crates through the power of the Light. That would be a first." },
        { id = "h_default", key = true,
          text = "Wharfmaster Dizzywig, and every crate that comes through Ratchet goes through my ledger first. Lately too many of them have been going missing before they ever reach it." },
        { id = "h_ship", when = { questActive = TODO_QUEST("The Missing Shipment") },
          text = "That shipment should have come in days ago, and the only thing the sea brought back was rumors. Find out what happened to it, would you?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good. If you can talk to the sea, ask it where my shipments went, because it's taken nine crates since the spring and it hasn't filed a single report." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. If you've a way of talking to the gulls, I'd like to know whether they've seen my missing crates, because the gulls see everything that floats past this dock." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You've got the look of somebody who could stand on my docks and make crates stop wandering off." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. You'll be shipping hides out of Ratchet, I expect, and every one of them will go through my ledger." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Unless you can pray my missing crates back onto the dock, I'm afraid I've no time for blessings, though I'll note your visit in the ledger." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock on my docks. Keep that imp of yours off the cargo, because I've no column in the ledger for things set on fire by imps." },
      },
      choices = {
        { text = "Do your sailors ask the sea spirits for safe passage?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who do you think is taking your crates, Dizzywig?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Where do the shipments go missing?", next = "missing" },
        { text = "Where do your boats sail?", next = "boats" },
        { text = "How long have you kept the docks?", next = "dock" },
        { text = "Do you check Alliance cargo as hard as Horde?", next = "fair", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } } },
        { text = "Your missing crates don't vanish on their own, wharfmaster.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Couldn't a mage just teleport your cargo for you?", next = "xmage", when = { class = "MAGE" } },
        { text = "Who's stealing from your docks, Dizzywig?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters' goods sell well off Ratchet's docks, Dizzywig?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has anyone on the docks needed a priest lately?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a demon help guard your docks, Dizzywig?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Can the Light help find your crates, Dizzywig?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll let you work.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Make it quick, because the tide doesn't wait and neither do my crews." } },
    },
    missing = {
      lines = { { id = "m_default", text = "Somewhere along the coast between here and the southern isles, and I'd bet my ledger the Southsea pirates have something to do with it. They know our schedules better than some of my own dockhands." } },
      choices = { { text = "Someone on the docks is talking?", next = "missing_spy" } },
    },
    missing_spy = {
      lines = { { id = "ms_default", text = "I didn't say that, and I'd rather you didn't say it either, not loud. But somebody's selling our sailing times, and when I find out who, Gazlowe will want a word." } },
      choices = { { text = "What will Gazlowe do?", next = "missing_gaz" } },
    },
    missing_gaz = {
      lines = { { id = "mg_default", text = "Docked wages, a swim with the sharks, or a job in the Venture Company's mines, depending on his mood. Gazlowe doesn't forgive people who cost him money." } },
      choices = {
        { text = "A thief on the docks gets what he deserves.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sharks seem a bit much for loose lips.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    boats = {
      lines = { { id = "b_default", text = "The big run is to Booty Bay, across the sea to Stranglethorn, and it's the only boat in Kalimdor that takes Horde and Alliance alike. Everything else is coastal hauling and fishing." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    dock = {
      lines = { { id = "d_default", text = "Since Gazlowe drove the first pile into the mud, and I've hauled more cargo than you've seen in your life. I've never lost a crate I could blame on myself, either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fair = {
      lines = { { id = "f_default", text = "Harder, if you want the truth, because your lot sneak more contraband. But I take your coin the same, and that's as fair as Ratchet gets." } },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it isn't in my ledger, it doesn't exist as far as I'm concerned." } },
  },
}
