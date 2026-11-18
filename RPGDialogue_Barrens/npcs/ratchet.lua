-- Ratchet: the Steamwheedle port on the Barrens coast, neutral ground. Voice: bibles/crossroads.md
-- Goblins first, factions second: everyone pays, nobody fights on the docks.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gazlowe", id = TODO_NPC("Gazlowe"), name = "Gazlowe",
  prejudice = { race = "NightElf", amount = 6, why = "Night elves complain about the smoke and the logging contracts, buy nothing and haggle over the rest; to him they are bad customers first." },
  bible = "bibles/crossroads.md", role = "noble", tier = "major",
  temper = { "brash" }, values = { "ambitious", "practical" },
  notices = { "race" },
  impression = {
    first = "Gazlowe runs Ratchet for the Steamwheedle Cartel, and he will tell anyone who stands still that he built Orgrimmar for Thrall. He is loud and greedy and sharper than he lets on, and the Southsea pirates on his coast cost him money every day.",
    third = "{name} met Gazlowe, the goblin boss of Ratchet who once helped build Orgrimmar.",
  },
  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A night elf in Ratchet. Look, pal, before you start on the smoke, the docks, the trees and the sanctity of whatever, I already got the speech last week, and I'm still payin' off the headache." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Hey, it's my favourite night elf, and I don't say that 'cause there's a lot of competition! You pay your tab and you don't preach, pal, and that makes you a rare bird in my ledger." },
    { id = "g_hi", text = "Hey, hey, a new face in my town, and new faces are my favourite kind of customer! So what is it, pal, are you buying, selling, or just standing there admiring the real estate?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, good, because repeat customers are the backbone of this whole operation, and I've got the ledgers to prove it." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } },
      text = "Alliance, huh? Don't sweat it, pal, because in Ratchet your gold's the same color as everybody else's, and I count it just as fast." },
  },
  start = "hello",
  nodes = {
    prej_gazlowe = {
      big = true,
      lines = { { id = "prej_gazlowe_default", text = "Nothin' personal, pal, it's just the numbers. Every night elf who comes through here buys one bandage, complains about the smoke for an hour and writes a letter to Astranaar about the Venture Company, which ain't even us, by the way. That's a lot of overhead for one bandage." } },
      choices = {
        { text = "Then I'll be the first night elf to pay full price.", next = "BACK", reply = "Full price? Pal, you just became my favourite night elf in the whole of Kalimdor. Pay it in cash and complain about the smoke all you like, because the customer's always right.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Steamwheedle profits from the smoke. Expect more letters.", next = "BACK", reply = "Write all the letters you want, sweetheart, I'll sell you the stamps. Smoke means the forges are running, and running forges mean Ratchet's still open.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "I'll judge Ratchet on what Ratchet does, Gazlowe.", next = "prej_gazlowe_calm", fx = { affinity = 1 } },
        { text = "Is Ratchet tied up with the Venture Company?", next = "prej_gazlowe_why" },
      },
    },
    prej_gazlowe_why = {
      lines = { { id = "prej_gazlowe_why_default", text = "No! Well, they dock here sometimes, and they pay dock fees like anybody, and I can't help who pays dock fees. The Venture boys are strip-mining Stonetalon, which is bad for business 'cause it makes all of you angry at all of us, and that's the whole problem in one sentence." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_gazlowe" }, { text = "Something else.", next = "BACK" } },
    },
    prej_gazlowe_calm = {
      lines = { { id = "prej_gazlowe_calm_default", text = "Now that's a sentence I'd frame, pal. Spread that one around Darnassus for me and I'll owe you, figuratively, 'cause I don't owe anybody literally." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_gazlowe = {
      big = true,
      lines = { { id = "xpt_gazlowe_default", text = "Ratchet loves crews, pal, as long as they pay their tabs and keep their quarrels off my docks. Crews from both sides come through here, and the only rule I care about is that nobody starts a war where my boats can see it, because wars do terrible things to the insurance." } },
      choices = {
        { text = "Neutral ground is worth protecting. We'll keep the peace.", next = "BACK", reply = "That's the spirit, pal, and it's the kind of crew I like seein' on my docks. Pay your tabs and I'll even let you drink at the good end of the bar.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If trouble starts, we'll finish it, docks or not.", next = "BACK", reply = "Whoa, whoa, finish it on somebody else's beach, pal. A war on my docks costs me boats, and boats cost a fortune, so take it inland.", fx = { align = { order = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    xcl_dm = {
      big = true,
      lines = { { id = "xcl_dm_default", text = "Yeah, and I'll tell you what bugs me about it, pal. VanCleef was a builder, same as me, and he and his masons rebuilt Stormwind and never saw a copper of the bill, so they took their tools and went to war. I built Orgrimmar for Thrall, and he paid me on time every time, which is why I'm running a port and not hiding in a mine with a rag over my face." } },
      choices = {
        { text = "Always pay the builders. Stormwind had it coming.", next = "BACK", reply = "Ha! You'd make a fine builder, pal, and you're right about the bill. But a city with no walls is a bad customer, so I'd rather they paid than fell.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "VanCleef was owed, Gazlowe, but that doesn't make him right.", next = "BACK", reply = "Fair point, and I'll grant you a war's a lousy way to collect a debt. Still, I sleep better knowin' Thrall paid his invoice on time.", fx = { align = { order = 1 } } },
        { text = "The goblins down there looked like Steamwheedle men to me.", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "Not a chance, pal, not on my mother's ledger. They were freelancers and Venture Company leftovers, the kind of goblins who'd build a cannon for anyone with gold and never ask where it's pointed, and they give the rest of us a bad name and worse credit." } },
      choices = { { text = "Sounds like the Cartel has standards after all, Gazlowe.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Ratchet welcomes coin, whoever's carrying it. I've built for orcs, sold to humans and haggled with pirates, so a dead paladin is barely a novelty, pal. Just don't go smiting anybody on my docks, because the Cartel bills for cleanup by the hour, and it ain't cheap." } },
      choices = {
        { text = "I'll keep the peace on your docks, Gazlowe.", next = "BACK", reply = "That's all I ask, pal, and all the Cartel asks too. Smite on the open road, and do your shopping peaceful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll smite whoever deserves it, docks or not.", next = "BACK", reply = "Then do it on the road, friend, where nobody sends me an invoice. My bruisers don't care how holy you are, only who swung first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Pay? Pal, I'd put you on retainer if the Cartel let me, because every sailor the Southsea pirates carve up is a sailor I'm not shipping cargo with, and that's money walking right off the pier. Heal 'em quick and heal 'em cheap, and we'll get along fine." } },
      choices = {
        { text = "I don't heal for coin, Gazlowe. I heal because they're hurt.", next = "BACK", reply = "Huh, that's a new one on me, and a little bad for business. Go on, then, heal 'em for nothin', and I'll pretend I don't see the lost revenue.", fx = { align = { light = 1 } } },
        { text = "My prayers cost the same as anyone's work. Name a price.", next = "BACK", reply = "Now that's the kind of priest I can do business with. Name it fair, pal, and I'll see the dockhands get mended before the next shift.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Southsea pirates keep raiding my ships off the coast, and the Venture Company keeps making eyes at my docks, and neither of 'em answers polite letters, so I've stopped paying for the stamps. You go knock a few heads together on the beach, and Ratchet stays open for business, which is good for everybody's bottom line, pal." } },
      choices = {
        { text = "I'll protect Ratchet's docks for the honest traders.", next = "BACK", reply = "Good, because honest traders are the ones who pay my docking fees. Knock heads quick, pal, and leave the cargo in one piece.", fx = { align = { honor = 1 } } },
        { text = "I'll knock heads for whoever pays the best rate.", next = "BACK", reply = "And that'd be me, pal, at least this week, so start knockin'. Just don't take the Venture Company's coin while you're wearin' my colors.", fx = { align = { honor = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Good hunting? Pal, there's crocolisks in the water, raptors in the hills and pirates on the beach, and I'd pay good coin to see fewer of all three. Crocolisk hides sell nice down at the docks, too, so if you're out there anyway, you might as well turn a profit, right?" },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours looks hungry, pal, and I know that look, because I see it on my dockhands every payday. Feed it before it comes down to the fish market and starts runnin' up a tab, alright?" },
      },
      choices = {
        { text = "I'll hunt to keep the roads safe, Gazlowe.", next = "BACK", reply = "Safe roads mean happy caravans, and happy caravans mean full warehouses. You keep that up, friend, and I'll buy every hide you bring in.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt whatever turns the best profit, Gazlowe.", next = "BACK", reply = "A hunter after my own heart, pal. Bring me crocolisk skins and I'll show you what profit really smells like.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "He talked to 'em plenty, sure, but the walls went up because my crews worked double shifts, and he paid us the overtime, which I respect more than any spirit. He said the earth there was willing, whatever that means, and I'll take willing earth over a lazy goblin any day, because willing earth never asks for a raise." } },
      choices = {
        { text = "A spirit's blessing holds a city up better than mortar.", next = "BACK", reply = "You sound like the Warchief, friend, and I won't argue with a satisfied customer. I'll just note that the spirits never once asked for overtime.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Walls are walls, and coin and labor built them.", next = "BACK", reply = "Now you're talkin' sense, pal, and I'd put that on a plaque if plaques were cheaper. Spirits are fine, but mortar's what holds the roof on.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Now you're talking my language, pal! Somebody on my own docks is selling the Southsea a list of which boats carry what, and I'd pay real money to know who, but the bruisers won't lay a hand on anybody without proof, so bring me something better than a hunch." },
      },
      choices = {
        { text = "Leave it to me. Nobody will even know I was looking.", next = "BACK", reply = "That's what I like, a professional who knows the value of quiet. Bring me a name and proof, pal, and I'll handle the sharks myself.", fx = { align = { honor = -1 } } },
        { text = "I'll catch them openly, in front of your bruisers.", next = "BACK", reply = "Openly? Well, it's your neck, pal, and I won't complain about the show. Just make sure the bruisers see the proof before they see the brawl.", fx = { align = { honor = 1 } } },
        { text = "What's the trouble with the pirates, anyway?", next = "pirates" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Expensive is the best word in the language, pal, and I respect a professional who charges for it. The last mage who worked my docks froze a Southsea boarding party solid and then froze half my pier along with 'em, and I'm still payin' off the carpenters, so if you want work around here, you aim better than he did." },
      },
      choices = {
        { text = "I'll be careful with your pier. Precision is the job.", next = "BACK", reply = "Precision, he says, and I almost believe it. Do the job clean, pal, and I'll stop wincing every time you walk onto the pier.", fx = { align = { order = 1 } } },
        { text = "A little damage to the pier is part of the price.", next = "BACK", reply = "Part of the price, sure, and part of the bill too, which you'll be payin'. Freeze the pirates all you like, but the pier's not on your tab for free.", fx = { align = { order = -1 } } },
        { text = "Who else should I know around Ratchet?", next = "town" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The bruisers care about one thing, pal, which is whether you start trouble on my docks. Your demon's welcome to stand around looking scary for all I care, but if it sets fire to so much as one crate, you're paying for the crate, the fire, the bruiser who puts it out and the paperwork after." },
      },
      choices = {
        { text = "Fair rules. My demon won't touch a crate.", next = "BACK", reply = "Then we get along fine, pal, and your demon can loiter wherever it likes. Scary's good for business, as long as it don't touch the merchandise.", fx = { align = { order = 1 } } },
        { text = "If your docks burn, they burn. I'm not paying.", next = "BACK", reply = "Oh, you'll pay, pal, one way or another, because the bruisers don't take promissory notes. Mind the crates, or mind your back.", fx = { align = { order = -1 } } },
        { text = "How does a goblin town stay neutral?", next = "neutral" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sure, every time the fish get scarce, because empty nets cost me money. I'm a businessman, not a monster, so I keep the worst of the dumping out past the point where nobody swims, and in my line of work, pal, that's what we call a generous compromise." } },
      choices = {
        { text = "Trade can be clean. You owe this coast better than that.", next = "BACK", reply = "Better, huh? Pal, better costs money, and money's tighter than a gnome's grip. Still, I'll think about it, which is more than the Venture boys would do.", fx = { align = { honor = 1 } } },
        { text = "A port is a port. The sea can take a little filth.", next = "BACK", reply = "My kind of thinker, friend, and the fish mostly agree. Keep it quiet around the tauren, though, because they get loud about this stuff.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Whoa, whoa, I've seen that mug before, pal, on a {altrace} named {alt}, other side of the war, who paid the dock toll without arguing, which is how I remember. You two related? Doesn't matter, because Ratchet charges everybody the same, and I mean everybody." },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" } },
          text = "Another one of your lot! {alt} came through here a little while back, pal, a {altclass}, and asked who built Orgrimmar, so I'll save you the trouble: it was me, and I'm still waiting on the final payment." },
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "A whole crew! Now that's good business, because five of you need five times the repairs, five times the bandages and five times the boat tickets, and wouldn't ya know it, Ratchet sells all of it." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin, in my town! Keep that hammer sheathed on the docks like everybody else, pal, and we'll get along fine, glow or no glow." },
        { id = "h_default", key = true,
          text = "Name's Gazlowe, and Ratchet's my town, so whatever you need, it goes through me eventually and pays a little toll on the way. Keep your blades sheathed on the docks, pal, and we'll get along just fine." },
        { id = "h_pirates", when = { questActive = TODO_QUEST("Southsea Freebooters") },
          text = "Those Southsea freebooters are camped right down the coast, bleeding my shipping dry one crate at a time. Thin 'em out for me, pal, and Ratchet breathes easier, and so do my accounts." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The big guy, Thrall, is one of you, and I'll tell you what I told him, pal, which is that lightning's great but a good crane is better for building a city, and the crane doesn't need asking nicely." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Look, pal, I know the look you're about to give me about the docks and the smoke, so I'll save us both the time and tell you up front that Ratchet's cleaner than any port the pirates run." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, huh? Great, because I've always got work for somebody who hits hard, bills fair and doesn't ask me why." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Keep that beast of yours off my docks, pal, because the last one ate half a crate of fish and I'm still gettin' complaints from the buyer." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Great, because Ratchet's always got somebody bleeding on the docks, and the pirates sure aren't paying for the bandages." },
        { id = "h_cl_dm", tags = { "news" }, when = { cleared = "The Deadmines" }, text = "Heard you went down into the Deadmines and put VanCleef out of business, pal. Can't say I'm crying, but whoever built that juggernaut down there knew what they were doing, and I'd have paid good gold for a look at the blueprints first." },
      },
      choices = {
        { text = "You flinch when I walk in, Gazlowe. Something about night elves?", next = "prej_gazlowe", when = { prejudiced = true } },
        { text = "I'd guess Thrall used the spirits to build Orgrimmar.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does Ratchet ever think about what it does to the coast?", next = "xdruid", when = { class = "DRUID" } },
        { text = "So you're the one who built Orgrimmar.", next = "orgrimmar" },
        { text = "The pirates seem to be giving you trouble.", next = "pirates" },
        { text = "Who else should I know in Ratchet?", next = "town" },
        { text = "Tell me about the Steamwheedle Cartel.", next = "cartel" },
        { text = "You must have opinions on the big bosses, Thrall and the rest.", next = "bosses" },
        { text = "I'm a tinker's apprentice. Who designs your shredders?", next = "o_tinker", when = { origin = "gnome_tinker_apprentice" } },
        { text = "I pull parts out of Gnomeregan. Interested?", next = "o_salvage", when = { origin = "gnome_scavenger" } },
        { text = "I used to run ale through Loch Modan, Gazlowe.", next = "o_smuggler", when = { origin = "dwarf_loch_smuggler" } },
        { text = "Nice purse, Gazlowe. You should keep it closer.", next = "o_pickpocket", when = { origin = "human_canal_pickpocket" } },
        { text = "I came over on Thrall's boats, Gazlowe.", next = "o_sailed", when = { origin = "troll_sailed_with_thrall" } },
        { text = "A goblin town staying neutral can't be easy.", next = "neutral", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } } },
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
        { id = "h_again", text = "What else, pal? Time's money, but I'll spot you a little on account." },
        { id = "h_again2", text = "Still here? Good, ask away, because talking's the one thing in Ratchet I don't charge for." },
      },
    },
    orgrimmar = {
      lines = { { id = "o_default", text = "Me and my crew, sure, back when Thrall first landed with a bunch of orcs and no idea how to raise a wall that didn't fall over. We built him a city on schedule and near enough on budget, and he paid us, and then he let us keep this little harbor besides." } },
      choices = { { text = "And you've been here ever since, by the look of it.", next = "orgrimmar_since" } },
    },
    orgrimmar_since = {
      lines = { { id = "os_default", text = "Ratchet was nothing but sand and a broken pier when I got here, pal. Now look at it: a bank, a boat to Booty Bay, and every caravan from the Crossroads to the coast pays a toll somewhere along the way, with my name on the receipt." } },
      choices = { { text = "You must miss the building.", next = "orgrimmar_miss" } },
    },
    orgrimmar_miss = {
      lines = { { id = "om_default", text = "Building's fine, but owning is better, pal, and I learned that the hard way with a lien on my favourite boat. Still, I'd take another big job if the Warchief came asking and the price was right, and between you and me, I've kept the scaffolding." } },
      choices = {
        { text = "A deal's a deal. Thrall was right to pay you fairly.", next = "BACK", reply = "Fair and square, pal, and I respect him for it. A Warchief who pays on time is rarer than an honest pirate.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You should have squeezed him for twice as much.", next = "BACK", reply = "Twice as much? Pal, now you tell me, years too late. I'll keep you in mind for the next negotiation, friend.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "The Southsea Freebooters think anything floating off my coast belongs to them, pal. They've cost me cargo, crews and two very nice boats, and I've run out of patience, polite words and insurance, in that order." } },
      choices = {
        { text = "I'll handle them.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why not just pay them off?", next = "pirates_op" },
      },
    },
    pirates_op = {
      lines = { { id = "po_default", text = "Pay 'em? Pal, Revilgaz pays the Bloodsail off down in Booty Bay, and they come back every season asking for more, with interest. Some folks say a pirate's just a goblin without a license, so what's your take on the whole business?" } },
      choices = {
        { text = "Pirates are thieves. Hang every one of them.", next = "po_hang", fx = { affinity = 1, align = { order = 1 }, opinion = { pirates = "hate" } } },
        { text = "A free captain owes nobody. I almost admire them.", next = "po_admire", fx = { affinity = -2, align = { order = -1 }, opinion = { pirates = "admire" } } },
        { text = "Pay them. It's cheaper than a war at sea.", next = "po_pay", fx = { opinion = { pirates = "pay" } } },
        { text = "I've sailed with worse than the Southsea, Gazlowe.", next = "po_rogue", when = { class = "ROGUE" }, fx = { affinity = -1, opinion = { pirates = "mixed" } } },
        { text = "I'll leave the bookkeeping to you.", next = "BACK" },
      },
    },
    po_hang = {
      lines = { { id = "poh_default", text = "Now you're talkin' my language, pal! Rope's cheap in Ratchet, and I'll throw in the gallows wood at cost." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    po_admire = {
      lines = { { id = "poa_default", text = "Admire 'em? They sank two of my boats, pal! Admire 'em from somewhere other than my docks, if you don't mind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    po_pay = {
      lines = { { id = "pop_default", text = "Cheaper this quarter, sure, and then they double the rate, because a pirate who gets paid is a pirate who's just found a business model. Trust me, I know a business model when I see one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    po_rogue = {
      lines = { { id = "por_default", text = "I figured, pal, from the way you're eyeing my strongbox. Sail with whoever you like, just don't sail off with anything of mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "Wharfmaster Dizzywig keeps the docks and counts every crate twice, Mebok Mizzyrix is always cooking up some deal, and Sputtervalve, well, he lost a very important gizmo and won't shut up about it. Good people, pal, and every one of 'em pays rent on time." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    neutral = {
      lines = { { id = "n_default", text = "Easy, pal: the bruisers on the docks hit anybody who starts trouble, Horde or Alliance, and nobody wants to lose the only decent harbor on this coast. Business keeps the peace better than any treaty, because a treaty doesn't send you a bill when you break it." } },
      choices = {
        { text = "Peace bought with gold is still peace.", next = "BACK", reply = "That's what I keep sayin', pal, and nobody listens. Peace is the best investment on this whole coast, and it pays dividends every month.", fx = { affinity = 1, align = { order = 1 }, opinion = { steamwheedle = "trust" } } },
        { text = "Peace that's for sale can be bought out from under you.", next = "BACK", reply = "Only if somebody pays more than I'm makin', and nobody has yet. I watch the books close, pal, real close.", fx = { align = { order = -1 }, opinion = { steamwheedle = "distrust" } } },
      },
    },
    -- 0.71.0 depth: the Cartel, the big bosses, and the people who wash up in Ratchet.
    cartel = {
      hub = true,
      lines = { { id = "ca_default", text = "The Steamwheedle Cartel's the biggest outfit on the water, pal: Booty Bay, Gadgetzan, Everlook and my own Ratchet, and every one of us stays neutral because war's terrible for repeat customers. Ask away, the brochure's on the house." } },
      again = {
        { id = "ca_again", text = "What else about the Cartel? I've got a speech for every question and a price list for every speech." },
        { id = "ca_again2", text = "Keep 'em coming, pal, because talking shop beats counting losses any day." },
      },
      choices = {
        { text = "Who runs Booty Bay?", next = "c_revilgaz" },
        { text = "You haven't mentioned the Venture Company.", next = "c_venture" },
        { text = "What's this I hear about racing at the Shimmering Flats?", next = "c_race" },
        { text = "So does gold come before loyalty, Gazlowe?", next = "big_profit" },
        { text = "Revilgaz says you owe him money, Gazlowe.", tag = "Deceive", next = "d_owed",
          check = { pass = { any = { { disposition = { min = 55 } }, { trait = "witty" }, { class = "ROGUE" }, { origin = "human_canal_pickpocket" }, { origin = "dwarf_loch_smuggler" } } } },
          fail = { next = "d_caught", fx = { affinity = -1 } } },
        { text = "Something else, Gazlowe.", next = "BACK" },
      },
    },
    c_revilgaz = {
      lines = { { id = "cr_default", text = "Baron Revilgaz, up on his balcony over the Salty Sailor, counting coins and yelling at the Bloodsail, and by my last copper, he's the only goblin I know who could out-haggle me on a good day. We run the boat back and forth, we split the gossip, and we both pretend the other guy's port is smaller." } },
      choices = {
        { text = "Sounds like a friendly rivalry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_venture = {
      lines = { { id = "cv_default", text = "The Venture Company's what you get when a goblin decides contracts are for suckers, pal. They strip a hill bare, foul the water and shoot the locals, and then they wonder why nobody wants to trade with goblins, so every tauren who spits on my boots is really spitting at them, and I'm the one paying to have the boots cleaned." } },
      choices = {
        { text = "But you're all goblins, the Venture Company too.", next = "c_venture2" },
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
        { id = "crc_default", text = "Down at the Shimmering Flats, the Cartel's racing team and the gnomes blow each other up for the honor of going fastest, and I've lost good money betting on both. I find parts for our boys, I used to work on a rig myself, and I owe 'em a prototype fuel regulator, which I'll get to just as soon as somebody stops shooting at my boats." },
        { id = "crc_gnome", when = { race = "Gnome" }, text = "Your people and mine race rockets across the salt down at the Shimmering Flats, and lately your team's been getting faster with the same designs, which I'll only admit because you'll hear it anyway. I find parts for our boys, and I owe 'em a fuel regulator I haven't built yet, so don't tell 'em you saw me." },
      },
      choices = {
        { text = "Who usually wins?", next = "c_race2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_race2 = {
      lines = { { id = "crc2_default", text = "Depends who you ask and how many pieces they found afterwards. The gnomes build slow and blow up less, our boys build fast and blow up spectacular, and the crowd pays admission to watch both, so frankly, pal, the Cartel wins every single race." } },
      choices = {
        { text = "Spoken like a true bookie.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big_profit = {
      big = true,
      lines = { { id = "bp_default", text = "Gold doesn't care who's holding it, pal, which is the most honest thing about it. I sold nails to Orgrimmar and rope to Theramore in the same week, and I'll sleep fine tonight, because the day Ratchet picks a side is the day the other side burns it down." } },
      choices = {
        { text = "Smart. Never tie your purse to a banner.", next = "BACK", reply = "Now that's wisdom you can bank, pal. Banners change every few years, but gold's been gold since before the trolls built their temples.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Pick a side and stand by it, or you stand for nothing.", next = "BACK", reply = "Stand for nothing? Pal, I stand for profit, and profit's kept this port open while the banners were busy killin' each other.", fx = { align = { honor = 1 } } },
        { text = "Doesn't Thrall mind you trading with Theramore?", next = "b_theramore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_owed = {
      lines = { { id = "do_default", text = "He said WHAT? Sparks and sprockets, I don't owe Revilgaz a copper, pal, it's the racing team I owe, and if the Baron's telling people I'm behind on payments, the Cartel's gonna start asking about Ratchet's books. And since the Southsea started hitting my boats, I've been padding the dock fees a little to cover the losses, so the books really don't want to be asked about." } },
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
      lines = { { id = "bo_default", text = "The big bosses? Pal, I've built for some of 'em, sold to the rest and been yelled at by all of 'em, so I've got opinions to spare. Pick one, and I'll tell you what I'd never say to their faces." } },
      again = {
        { id = "bo_again", text = "Who else? I've got plenty of opinions left, pal, and no shortage of grudges." },
        { id = "bo_again2", text = "Next boss, pal. This is the fun part." },
      },
      choices = {
        { text = "What's Thrall like as a customer?", next = "b_thrall" },
        { text = "The tauren can't make much of goblins, I'd guess.", next = "b_cairne" },
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
        { text = "The Venture Company should answer for those wells.", next = "BACK", fx = { affinity = 1, opinion = { venture_company = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b_theramore = {
      lines = { { id = "bth_default", text = "Lady Proudmoore runs a tidy town and pays her freight on time, which puts her ahead of most kings I've ever invoiced. Her soldiers up at Northwatch Hold, now, they're another story, sitting up the coast glaring at my docks like I'm hiding orcs in the crates." } },
      choices = {
        { text = "Sounds like you might be hiding orcs in those crates.", next = "b_theramore2" },
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
        { text = "Can't argue with that kind of arithmetic, Gazlowe.", next = "BACK", fx = { affinity = 1 } },
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
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, pal, because answers are cheap, but the good stuff's for customers with a little credit built up, and you ain't there yet." },
    },
    thrall = {
      { id = "tp_thrall", text = "Thrall? Me and Thrall go way back, pal, because I built his whole city for him, Orgrimmar, every stone and every beam, and he paid me in Ratchet. Best deal I ever made, and I'll tell you the same thing tomorrow." },
      { id = "tp_thrall2", when = { race = "Orc" }, text = "You're one of Thrall's own, so let me say it plain: that orc paid on time, every time, which is more than I can say for the Cartel. Tell him Gazlowe says hi, and that the port's still standing." },
    },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's our sister port across the sea, and the boats run between us twice a day if the pirates don't get frisky. Baron Revilgaz runs it tight, and I'd say tighter than me, but I'd be lying." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Southsea pirates on my coast are bad enough, but the Bloodsail are worse, and they don't even pay to dock. Every ship they sink is a hole in my ledger the size of a cannonball." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's the Cartel, and Ratchet's one of its four jewels, if you count Booty Bay, Gadgetzan and Everlook, which I do. We sell to everybody, and that's what keeps the place neutral." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's way down south in Tanaris, sand in your boots and Noggenfogger in charge. Good town, and they've got water rights that'd make you weep." } },
    theramore = { { id = "tp_theramore", text = "Theramore's just up the coast, and Lady Proudmoore's folk buy as much as anyone. Northwatch Hold, though, that's her soldiers pointing cannons at my cousins, and that's bad for business." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company's a bunch of thugs with a mining permit nobody gave 'em. They give honest goblins a bad name, and I'd know about honest goblins, because I'm one." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's mine, pal, built from the docks up, and it's the only proper port on the Barrens coast. If it ships, it comes through here, and if it comes through here, I get a cut." } },
    everlook = { { id = "tp_everlook", text = "Everlook's way up in Winterspring, colder than a pirate's heart. Great market, terrible weather, and they charge for the blankets." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if I haven't heard of it, it isn't making anybody a single copper." } },
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
    { id = "g_hi", text = "Oh! A customer, or a helper, or maybe both, which would be best of all, pal, because a helper who pays is the rarest part in any workshop." },
  },
  notice = {
    { id = "n_eng", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A spellcaster, huh? You folks never appreciate a good gear, buddy, but I won't hold it against you, mostly, since your money spends the same." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Probably not, but I'd love to try, mostly. I once built a lamp that runs on prayer, and it blew the roof off my shed, which I think means it worked a little, so you wouldn't happen to want to pray at my Samophlange, if I ever find it?" } },
      choices = {
        { text = "The Light isn't a tool for gadgets, Sputtervalve.", next = "BACK", reply = "Not a tool, sure, but it might be a fuel, and that's somethin' else entirely, right? Okay, okay, I'll stop askin', mostly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If it pays, I'll pray at your contraption.", next = "BACK", reply = "You would? Oh, buddy, that's wonderful, and I'll pay in gears, if I can find any that aren't broken. We'll start the minute I find the thing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Well, I don't know how prayer works, exactly, or at all, but I've tried wrenches and maps and shouting, so it can't do any worse! If your loa or your shadow or whatever you've got happens to see a big brass contraption out in the Barrens, you'd tell me first, wouldn't you, before anybody tries to sell it back to me?" } },
      choices = {
        { text = "I'll pray for it with you, Sputtervalve. It can't hurt.", next = "BACK", reply = "Oh, thank you, pal, really, and you can pray in whatever direction feels right. I'll hold the wrench, just in case.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The gods have better things to find than your contraption.", next = "BACK", reply = "Well, sure, probably, but they don't have a year of my savings in it, do they? Okay, maybe they do, I don't know how gods work.", fx = { align = { light = -1 } } },
        { text = "Something else, Sputtervalve.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, they're fine, mostly, though one of 'em still can't hear on his left side and keeps billing me for it. The Venture Company boys at the Sludge Fen are worse, though, because they've got shredders and guards, and somebody with a big axe could get my Samophlange back a lot quicker and cheaper than I could." } },
      choices = {
        { text = "I'll get your Samophlange back, Sputtervalve.", next = "BACK", reply = "You will? Oh, pal, you're a lifesaver, really, and I won't forget it. Watch out for the shredders, though, because they don't stop to talk.", fx = { align = { order = 1 } } },
        { text = "I'll keep whatever the Venture Company has worth taking.", next = "BACK", reply = "Fine, fine, take whatever you like from those Venture thugs, buddy. Just bring back my Samophlange, please, because it's the only one there is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Troubled them? A raptor ate a whole fuel regulator last month, pal, and it was the only one I had, and do you know what those cost from Booty Bay? The beasts of the Barrens chew on anything that rattles, so if you see something out there that looks like a bit of a machine, it's probably mine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from my workbench, please, pal. I'm sure it's lovely, but the last beast that sniffed it set off a very small explosion, and I'm still paying for the window." },
      },
      choices = {
        { text = "I'll bring back any of your parts I find.", next = "BACK", reply = "Every part? Oh, you're a real pal, pal, and I'll name a gear after you. Watch the raptors, though, because they chew.", fx = { align = { order = 1 } } },
        { text = "Finders keepers, Sputtervalve. Salvage pays well.", next = "BACK", reply = "Salvage, yeah, I know how that goes, I've salvaged plenty myself. Just don't sell the regulator back to me at Booty Bay prices, okay?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Anger them? I hope not, but now that you mention it, the Samophlange did spark somethin' terrible right before I lost it. That was probably just the coil, though, wasn't it, buddy? Please say it was the coil." } },
      choices = {
        { text = "Respect the elements, and your machines will fare better.", next = "BACK", reply = "Respect them? Okay, sure, I can do that, I'll respect 'em right up to the next coil overload. Do the spirits take apologies in gears?", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It was the coil. Gears need no spirit's permission.", next = "BACK", reply = "Oh, thank you, I knew it, I knew it was the coil! The spirits can stay out of it, because I've got enough troubles with the coil.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would I! The Venture Company boys out at the Sludge Fen have it, I'm almost certain, and they'll have it locked up tighter than a gnome's toolbox, so if you can slip in without blowing anything up, which is more than I've ever managed, you'll be the best friend and the best investment a tinker ever had." },
      },
      choices = {
        { text = "I'll take it back quietly. They stole it first.", next = "BACK", reply = "Exactly, pal, they stole it first, so it's not even stealing, it's returning. I'll write you a receipt if you want, very official.", fx = { align = { honor = -1 } } },
        { text = "I'll take it fair and square, even if it means a fight.", next = "BACK", reply = "Oh, you're brave, buddy, braver than me, and I'll be sure to tell everybody. Just don't break the Samophlange while you're breaking heads.", fx = { align = { honor = 1 } } },
        { text = "What exactly is a Samophlange, anyway?", next = "samo" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Oh, I couldn't, pal, I really couldn't, because there's a year of my work in it, most of my savings and most of my eyebrows. But if something has nested in it I'll move the nest very gently, or I'll find someone who knows how, which might be you." } },
      choices = {
        { text = "Your work matters. Bring it home, nest or no nest.", next = "BACK", reply = "You mean it? Oh, buddy, I could hug you, but I'm covered in grease. Bring it home, and I'll find that nest a nice new spot.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the Barrens claimed it, let the Barrens keep it.", next = "BACK", reply = "Let the Barrens keep it? Pal, the Barrens has plenty of stuff, and it doesn't need my Samophlange. I'm getting it back, with or without help.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Fascinating, absolutely fascinating, mostly. Does the Light run on anything, pal, gears or faith or somethin' I could build and sell by the crate?" },
        { id = "h_default", key = true,
          text = "Sputtervalve, inventor and tinker, at your service, mostly, and at reasonable rates. You wouldn't happen to have seen a Samophlange lying around out in the Barrens, would you, pal?" },
        { id = "h_samo", when = { questActive = TODO_QUEST("Samophlange") },
          text = "The Samophlange is still out there, pal, and every day it sits in the dust I lose another year off my life and another week off my lease. Please hurry, and please, please don't drop it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, you don't happen to know a spirit who finds lost things, do you, because the Samophlange is still out there and I've asked everyone else already, and I'd pay a spirit's going rate, whatever that is." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Oh, you wouldn't know whether the Samophlange counts as part of nature now, would you, pal, because it's been lying out in the grass so long that something's probably nesting in it and charging the rest of the grass rent." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Oh, splendid, you look sturdy enough to stand next to my experiments, which is more than my last three assistants could say, and they all got hazard pay." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, how marvellous! Tell me, buddy, does your beast ever chase things that go bang? Because I've had some trouble with that, and some expensive trouble at that." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, a real one, which is good, because I've been saying a little prayer for my Samophlange every night, and I'm not sure I've been doing it right or whether I've been tithing enough." },
      },
      choices = {
        { text = "Do your machines ever anger the elements, Sputtervalve?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you leave the Samophlange where it lies, if something nested there?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What is a Samophlange?", next = "samo" },
        { text = "How did you lose it?", next = "lost" },
        { text = "Ratchet seems a fine place for a tinker.", next = "ratchet" },
        { text = "Magic does what gears can't, little tinker.", next = "magic", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I get into places quietly. Shall I fetch your Samophlange?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your last assistants don't seem to be around, Sputtervalve.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "I'd guess the beasts out here trouble your inventions.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you think prayer could find your Samophlange?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could you build something with the Light, Sputtervalve?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good luck with it.", next = "END" },
      },
      again = { { id = "h_again", text = "More questions? I love questions, pal, almost as much as I love gears, and they don't cost me a copper, mostly." } },
    },
    samo = {
      lines = { { id = "s_default", text = "It's a pressure-regulating, flow-correcting, all-purpose mechanical marvel, pal, and it's the heart of a very big and very profitable project. I can't tell you what the project is, because it isn't finished and I'm superstitious about counting coins before they're minted." } },
      choices = { { text = "Can you give me a hint?", next = "samo_hint" } },
    },
    samo_hint = {
      lines = { { id = "sh_default", text = "Let's just say there's oil under the Barrens, and the Venture Company isn't the only outfit that knows it. A goblin with the right machine could make a fortune, buddy, and keep it out of the wrong hands besides." } },
      choices = { { text = "So you want it out of the Venture Company's hands.", next = "samo_venture" } },
    },
    samo_venture = {
      lines = { { id = "sv_default", text = "Those thugs would drill the whole plain dry and leave the tauren nothing but holes and an invoice. I'm greedy, sure, but I'm a Steamwheedle goblin, and we like our customers alive and paying." } },
      choices = {
        { text = "Better you than the Venture Company, then.", next = "BACK", reply = "Exactly, pal, and you should tell that to the tauren next time they glare at me. At least I say thank you to the dirt.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The land isn't anyone's to drill, goblin.", next = "BACK", reply = "Okay, okay, but somebody's gonna drill it eventually, pal, and I'd rather it was somebody with manners. I'll take the scowl, though.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I was testing it in the field, and then there were centaur, and then there was running, and then there wasn't a Samophlange anymore. It's not the most dignified story, pal, and it's the most expensive one I've got." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK" } },
    },
    ratchet = {
      lines = { { id = "r_default", text = "Good enough! Gazlowe keeps the peace and the boats bring parts from Booty Bay, though they charge me a fortune for every bolt, and a little extra for the ones that fit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magic = {
      lines = { { id = "m_default", text = "Sure, until it doesn't, and then you've got nothin' but a headache and a puff of smoke. A gear you can fix and resell, pal, but try fixing a fireball after it's gone off." } },
      choices = { { text = "Fair point.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of that, pal, but if it's got moving parts, bring it by and I'll take a look, and I'll only charge you for the look." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's the best town on the coast, and I'd know, because I've lost things in all of them, and here people at least help you look. Not always for free, but they help." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company? Oh, I'd never, no, though they did offer me a job once, and it had a pension, which was tempting. But they blow things up for the wrong reasons, and that matters, I think." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got the best engineers in Kalimdor, except for me, and some of them would argue about that, loudly. I sent a crate of parts there once and it came back as a different crate." } },
    booty_bay = { { id = "tp_booty_bay", text = "I took the boat to Booty Bay once and lost a whole box of gears overboard, and a shark ate one, and I swear it looked pleased about it. I haven't been back." } },
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
    { id = "g_hi", text = "Step right up, friend, step right up, because Mebok Mizzyrix has exactly what you need, even if you don't know it yet, and the price is a steal, mostly for me." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Of course! I always have something. The question is whether you want to know what's in it, and most of my customers don't. A paladin might, of course, being so very honest, but honesty is terrible for business." } },
      choices = {
        { text = "I'll want to know what's in it, Mebok.", next = "BACK", reply = "Ooh, an honest customer, the rarest breed in Ratchet, and I'll admit it shakes me. Let's say it's mostly herbs and leave it there, shall we?", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Don't tell me. I'll just drink it.", next = "BACK", reply = "Now that's a customer who'll go far, pal. Bottoms up, and don't mind the tingling.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Anything a priest gives away for free, I sell in a bottle, which is why your lot and I don't always get along. But a long day of healing grunts leaves anybody dry, and there's nothing a little raptor horn can't fix, if you catch my meaning." } },
      choices = {
        { text = "Healing shouldn't come in a bottle at a goblin's price.", next = "BACK", reply = "And yet the bottles fly off the shelf faster than the priests can pray, friend. I'll leave the free stuff to you, and the convenient stuff to me.", fx = { align = { light = 1 } } },
        { text = "Sell what you like. People pay for what they need.", next = "BACK", reply = "Exactly, friend, and they pay what it's worth, which is a little more than it costs me. That's not greed, that's economics.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Mebok.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Rage tonic, courage brew and something I call Mebok's Battle Breakfast, though you'll want to drink that one standing up. They're mostly harmless and occasionally helpful, which is more than you can say for most of what the Southsea pirates sell." } },
      choices = {
        { text = "I'll fight on my own strength, Mebok, not your tonics.", next = "BACK", reply = "Your loss, pal, but I respect the pride. Come back when your strength's had a rough day, and I'll have a brew ready.", fx = { align = { order = 1 } } },
        { text = "If it helps me fight harder, I'll drink anything.", next = "BACK", reply = "That's the spirit, my friend, and the Battle Breakfast thanks you. Stand somewhere sturdy before you drink it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisk eyes, zhevra hooves and the odd plainstrider gizzard, if you're not too squeamish. The beasts of the Barrens are full of useful things, as long as somebody else does the collecting, and that somebody could be you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it could sniff out a good ingredient, chum. I don't suppose it'd take a job on commission? No, I didn't think so, they never read the contract." },
      },
      choices = {
        { text = "I'll only take what the beast can spare.", next = "BACK", reply = "Very noble, friend, and I'll pay the same rate either way. Just don't come back with half a horn and a lecture.", fx = { align = { honor = 1 } } },
        { text = "Name your ingredient, Mebok. I'll take it, whatever it costs.", next = "BACK", reply = "Oh, I like you, friend, you'll go far in this business. I'll write up a list, and you can start with the gizzards.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Anger them? Friend, I give those raptors a second life in a bottle at a very reasonable markup, which is more than the Barrens ever gave them. The tauren don't see it that way, of course, but the tauren don't pay my rent either." } },
      choices = {
        { text = "A beast killed for its horn deserves better than a sales pitch.", next = "BACK", reply = "Better, sure, so I give it a nice label and a good name. That's more dignity than the vultures gave it, friend.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead raptors need no apology. Business is business.", next = "BACK", reply = "Exactly what I've been telling the tauren for years, and they keep glaring at me. You and I should go into business, friend.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Oh, it would, and I've had three customers ask this week alone, but I'm a purveyor of fine refreshment, not poisons! Of course, a strong enough sleeping draught does help a fellow sleep very soundly, and who's to say which guard ends up drinking it." },
      },
      choices = {
        { text = "Sleeping guards make for easy work. Count me in.", next = "BACK", reply = "Shh, shh, I never said any such thing, pal, so don't go quoting me. But a fella who needs a good night's sleep knows where to find me.", fx = { align = { honor = -1 } } },
        { text = "No. I'd rather keep my business honest.", next = "BACK", reply = "Honest business, he says, and in Ratchet of all places. Well, good for you, friend, and I'll pretend I never mentioned the draught.", fx = { align = { honor = 1 } } },
        { text = "Do your tonics actually work, Mebok?", next = "work" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Shh, not so loud, pal! Nobody said magic, I said refreshment, and if a customer feels a little brighter after a swig, who am I to argue with a satisfied customer?" },
      },
      choices = {
        { text = "If they come back for seconds, it's working.", next = "BACK", reply = "Exactly, my friend, repeat business is the only proof I need. You understand the trade better than the Kirin Tor ever will.", fx = { align = { honor = -1 } } },
        { text = "Your customers deserve to know what they're drinking.", next = "BACK", reply = "Know? Pal, they know it's tasty and they know it works, and the rest is just paperwork. Nobody reads the label anyway.", fx = { align = { honor = 1 } } },
        { text = "What do you use the raptor horns for?", next = "horns" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Trade secret, my friend, though I'll admit a raptor horn or two goes into the better ones. Everything I use comes out of the Barrens, so you could say it's natural, and I'd like you to say so to all your friends." } },
      choices = {
        { text = "A seller should tell buyers what they're drinking.", next = "BACK", reply = "Tell them? Friend, I'd lose every customer I've got the minute they heard about the gizzards. Natural, that's what I say, and it's true.", fx = { align = { honor = 1 } } },
        { text = "Secrets are fair in trade. Buyers should ask better questions.", next = "BACK", reply = "Exactly, friend, and most of them never ask at all, which saves everyone a headache. Let's keep it that way.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, though they never tell me what for, and I never ask, because that's how a goblin stays in business. Bring me a few raptor horns and I'll mix you something to keep your hands steady while you're shouting at a demon." },
      },
      choices = {
        { text = "A deal's a deal, Mebok. I'll bring the horns.", next = "BACK", reply = "That's what I like, a customer with honor and a hunting knife. Bring me those horns, and your hands will be steady as stone.", fx = { align = { honor = 1 } } },
        { text = "I'll take the tonic now and see about the horns later.", next = "BACK", reply = "Later, he says, like I don't hear that every day. Horns first, pal, then tonic, because credit's for customers I've known longer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Now there's a customer with special needs, and special needs mean special prices. My tonics refresh the living, sweetheart, but I'm sure I can find something for you." },
        { id = "h_default", key = true,
          text = "Mebok Mizzyrix, purveyor of fine tonics and quality refreshment at prices that'll make you weep, with joy, naturally. I'm always looking for a few special ingredients, and the Barrens is full of 'em, if you've got the stomach to collect." },
        { id = "h_horns", when = { questActive = TODO_QUEST("Raptor Horns") },
          text = "Raptor horns, friend, the bigger the better, because I pay by the horn and charge by the swallow! The thunderheads and stormsnouts out west have the good ones." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now there's a customer who appreciates a tonic with a little lightning in it, and I happen to have exactly that, if you take my meaning." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! A customer like you knows herbs, so you'll appreciate that every one of my tonics is made from the finest things the Barrens has to offer, more or less." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You'll be wanting a little somethin' to steady the nerves before a fight, chum, and by my last copper, I've got just the thing." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Now you're exactly the sort of customer I like, because you go places I wouldn't, and you bring back interesting bits." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Now there's a customer who appreciates a good restorative, and I've got tonics that'll put a bit of zip back in your prayers." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now there's a customer with interesting tastes, and I've got a tonic for nearly every taste there is." },
      },
      choices = {
        { text = "Do your tonics anger the spirits of the beasts you use?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's actually in your tonics, Mebok?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do you use raptor horns for?", next = "horns" },
        { text = "I doubt your tonics actually work.", next = "work" },
        { text = "Ratchet must be good for business.", next = "biz" },
        { text = "Tauren medicine doesn't need goblin salesmanship.", next = "tauren", when = { race = "Tauren" } },
        { text = "A tonic that puts a guard to sleep would sell well, Mebok.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your tonics aren't magic, Mebok. I'd know.", next = "xmage", when = { class = "MAGE" } },
        { text = "What do you sell for warriors, Mebok?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What ingredients do you need from the Barrens, Mebok?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would a priest want with your tonics, Mebok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess warlocks buy your tonics too, Mebok.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Do you have anything for a Forsaken, Mebok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Maybe later.", next = "END" },
      },
      again = { { id = "h_again", text = "Another question, friend? Mebok's always happy to talk, especially about Mebok, and the first five minutes are only a small consulting fee. Kidding! Mostly." } },
    },
    horns = {
      lines = { { id = "h1_default", text = "Ground fine, they put a little kick in a drink that the customers just love, and the markup's lovely too. Don't ask me why it works, pal, because I'm a businessman, not an alchemist." } },
      choices = { { text = "And who buys them?", next = "horns_who" } },
    },
    horns_who = {
      lines = { { id = "h2_default", text = "Sailors, mostly, and caravan guards, and anybody who wants to feel ten feet tall after a long day and pay for the privilege. A few orcs from the Crossroads come in on the quiet, too, and they tip better than the sailors." } },
      choices = { { text = "That doesn't sound safe.", next = "horns_safe" } },
    },
    horns_safe = {
      lines = { { id = "h3_default", text = "Safe is a strong word, friend, and I'm a careful man with strong words, on account of the liability. Nobody's complained yet, and the ones who might have aren't in any shape to." } },
      choices = {
        { text = "People deserve to know what they're drinking.", next = "BACK", reply = "They know it's good, friend, and they know what it costs, and that's all anybody's ever needed to know. Ingredients are a trade secret.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "If they buy it, that's their lookout.", next = "BACK", reply = "Exactly my policy, friend, printed right there in very small letters on the bottle. Buyer beware, and buyer comes back.", fx = { affinity = 2, align = { light = -1 } } },
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
    _none = { { id = "tp_none", text = "Can't say I know it, friend, but if it sells, Mebok will learn it quick and charge you double for the lesson." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where half my ingredients end up and half my customers come from, and the boat's cheap if you don't mind the smell. Ask for the Salty Sailor and tell 'em Mebok sent you, for all the good it'll do." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got Noggenfogger and his elixirs, and between you and me, I like my drinks better. More flavour, fewer side effects, mostly." } },
    centaur = { { id = "tp_centaur", text = "Centaur hooves, centaur hair, I've had some interesting orders lately. The Kolkar don't sell, though, so you'll have to negotiate with an axe." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "Trolls in Zul'Farrak sit on more old gold than a trade prince, so I hear. I'm a businessman, not a fool, so I'm staying right here and buying your loot after." } },
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
    { id = "g_hi", text = "Mind the crates, mind the ropes and mind the edge, pal, because I'm not fishing anybody out today, and the sharks in this harbour bill by the limb." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I doubt it, but the pirates do take the crates, and I'd pay good coin to watch a paladin explain to 'em that stealing is wrong. They'd laugh, and then you'd hit 'em, and then I'd get my crates back, and that's the only kind of sermon that ever balanced a ledger." } },
      choices = {
        { text = "Then I'll give the pirates a sermon they won't forget.", next = "BACK", reply = "Oh, I want to watch that, pal, I'll bring a chair and a snack. Give 'em the sermon and then give 'em the hammer, in that order.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find your crates, for a share of them.", next = "BACK", reply = "A share? Pal, you sound just like the pirates, but at least you're asking first. Bring 'em back and we'll negotiate.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Three of my dockhands came back from a run past the Southsea pirates with cuts I didn't want to look at, and I had to mark 'em down as damaged goods like a split crate. If you've any healing left in you, they're resting in the warehouse, and I'd log it as a kindness in the credit column." } },
      choices = {
        { text = "Point me to your dockhands. They'll be mended today.", next = "BACK", reply = "You're a saint, pal, or the next best thing, a free worker. They're upstairs, and they'll be grateful even if they don't say it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your dockhands are a goblin problem, Wharfmaster, not mine.", next = "BACK", reply = "Goblin problem, sure, and a goblin solution is to bill whoever's around, so you're lucky I can't invoice you. Go on, then, I'll find some bandages.", fx = { align = { light = -1 } } },
        { text = "Something else, Wharfmaster.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Southsea pirates, mostly, and somebody right here in Ratchet, I'd wager my pension, because some crates go missing before they're even unloaded. If you see anybody hauling cargo up the beach at night, stand in their way and ask 'em nicely, and if that doesn't work, ask 'em less nicely." } },
      choices = {
        { text = "I'll guard the docks and turn the thieves over to you.", next = "BACK", reply = "Now that's service, pal, and I'll log every thief you catch with your name next to it. The Cartel likes good records.", fx = { align = { order = 1 } } },
        { text = "I'll guard them, if I get a cut of what I recover.", next = "BACK", reply = "A cut, eh? You'd make a decent goblin, pal, and I mean that kindly. Recover enough and we'll talk percentages.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hides and teeth go to Booty Bay, pal, and the crocolisk skins fetch the best prices, though the pirates like 'em too. Keep your crates labelled and your manifest honest, and I'll see your goods reach the boat, or at least I'll know who took 'em and what they owe." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} isn't going on any boat without a proper manifest and a passage fee, before you ask. I had to write up a monkey once, and the customs paperwork wasn't pretty." },
      },
      choices = {
        { text = "I'll keep my manifest honest, wharfmaster.", next = "BACK", reply = "That's music to my ears, pal, and it's all I ever ask. Honest manifests mean fewer headaches for everybody on this pier.", fx = { align = { order = 1 } } },
        { text = "A little cargo off the books never hurt anyone.", next = "BACK", reply = "Never hurt anyone? Pal, it hurts my ledger, and my ledger's the only thing on this dock that never lies. I'll be watching your crates.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The orc crews do, and they tip a cup of grog overboard before they cast off, which comes out of my stores, so I log it at cost plus handling. The goblin crews call it a waste, and the goblin crews lose more cargo, and I've started to wonder whether those two things are related." } },
      choices = {
        { text = "Then log the offering as a proper cost of business.", next = "BACK", reply = "Now you're thinking like a wharfmaster, pal, and I've already filed it under maritime overhead. Cost of business, plus a small blessing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No ledger will ever strike a bargain with the sea.", next = "BACK", reply = "No, but it's never stopped tryin', has it? I'll keep logging the grog, pal, just in case the sea's reading.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "No, they don't, pal, and I've got a whole page in my ledger for crates that walked off with somebody's help. Half go to the Southsea, but the other half go missing right here between the ship and my scales, and that tells me somebody in Ratchet knows how to lift a lid quietly." },
      },
      choices = {
        { text = "Then I'll help you catch them, wharfmaster.", next = "BACK", reply = "Good, because I've got the lists and you've got the legs. We'll catch the rat before he chews through another crate.", fx = { align = { honor = 1 } } },
        { text = "Somebody's good at their job. I respect that.", next = "BACK", reply = "Respect it all you like, pal, but don't you dare learn from it. I'll be counting your pockets on the way out.", fx = { align = { honor = -1 } } },
        { text = "Where do the shipments usually go missing?", next = "missing" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Have you seen what a mage does to a crate of eggs when he teleports it, pal? Scrambled, every one, and no refunds! The boat to Booty Bay works fine and the sea never sends me a bill, so I'll keep my cargo on the water where I can count it." },
      },
      choices = {
        { text = "Eggs and magic don't mix. Keep your boats.", next = "BACK", reply = "Finally, somebody with sense on this dock, and I'll drink to that. Boats are slow, pal, but they don't scramble anything.", fx = { align = { order = 1 } } },
        { text = "Magic is the future. Your boats are behind the times.", next = "BACK", reply = "The future can pay for its own eggs, pal. Until then, my boats are on time and my omelettes are cheap.", fx = { align = { order = -1 } } },
        { text = "Where do your boats sail?", next = "boats" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Southsea pirates, most likely, though the ledger can't prove it and the Cartel won't spend a single copper without proof in triplicate. I've been keeping my own count of their sails off the coast, and it goes up every time a shipment goes missing." } },
      choices = {
        { text = "Get the proof first. The Cartel is right to want it.", next = "BACK", reply = "Triplicate, pal, and signed in blue ink, so the Cartel can pretend to read it. Proof first, and then we'll see some action.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the ledger. Board their ships and take the crates back.", next = "BACK", reply = "You've got the right idea, pal, but the Cartel would bill me for the boarding. Bring the crates back quietly and I'll sign anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "A demon that watches crates? It'd eat the crates, or the dockhands, and then I'd have to write it all down and file a claim. No, my shipments go missing on the coast south of town where the Southsea pirates camp, so if you want to help, pal, take your demon there and leave my docks alone." },
      },
      choices = {
        { text = "I'll get your shipments back, wharfmaster.", next = "BACK", reply = "You're a real help, pal, a real help, and I'll put it in the ledger. Mind the pirates, and mind the sharks even more.", fx = { align = { honor = 1 } } },
        { text = "I'll get them back, for a share of what's inside.", next = "BACK", reply = "A share, sure, the usual salvage rate, which I'll calculate fair. Fair by goblin standards, anyway, so don't expect much.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "I've had your cargo through my ledger before, pal, or the cargo of a {altrace} called {alt}, other side of the war, with the same habit of not declaring half of it. I've got a column for that, and I've a feeling I'm about to use it again." },
        { id = "h_alt_same", when = { alt = { faction = "same", days = 30 } },
          text = "{alt} had crates on the last boat out, pal, all counted and taxed, and every one of 'em arrived, which is more than I can say for most. Same family, maybe? Then let's keep the streak going." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Let me guess, pal, you've come to find my missing crates through the power of the Light, and I suppose you'll want a finder's fee for it too." },
        { id = "h_default", key = true,
          text = "Wharfmaster Dizzywig, and every crate that comes through Ratchet goes through my ledger first, weighed, counted and taxed. Lately too many of 'em have been going missing before they ever reach it, and missing crates don't pay their tolls." },
        { id = "h_ship", when = { questActive = TODO_QUEST("The Missing Shipment") },
          text = "That shipment should've come in days ago, pal, and the only thing the sea brought back was rumors, and I can't sell rumors by the pound. Find out what happened to it, would you?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good. If you can talk to the sea, ask it where my shipments went, because it's taken nine crates since the spring and it hasn't filed a single claim form." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. If you've a way of talking to the gulls, pal, I'd like to know whether they've seen my missing crates, because the gulls see everything that floats past this dock and they never pay a toll either." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You've got the look of somebody who could stand on my docks and make crates stop wandering off, and I'd log that as money saved." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. You'll be shipping hides out of Ratchet, I expect, and every one of 'em will go through my ledger and pay its toll like everything else." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Unless you can pray my missing crates back onto the dock, pal, I've no time for blessings, though I'll note your visit in the ledger, free of charge." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock on my docks. Keep that imp of yours off the cargo, pal, because I've no column in the ledger for things set on fire by imps, and the insurance has a clause about it." },
      },
      choices = {
        { text = "Your sailors must ask the sea spirits for safe passage.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who do you think is taking your crates, Dizzywig?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Where do the shipments go missing?", next = "missing" },
        { text = "Where do your boats sail?", next = "boats" },
        { text = "You look like you've kept these docks a long while.", next = "dock" },
        { text = "Do you check Alliance cargo as hard as Horde?", next = "fair", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } } },
        { text = "Your missing crates don't vanish on their own, wharfmaster.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A mage could just teleport your cargo for you.", next = "xmage", when = { class = "MAGE" } },
        { text = "Who's stealing from your docks, Dizzywig?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters' goods sell well off Ratchet's docks, Dizzywig?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Your dockhands look like they could use a priest.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a demon help guard your docks, Dizzywig?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Can the Light help find your crates, Dizzywig?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll let you work.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Make it quick, pal, because the tide doesn't wait and every hour the crews stand around costs me wages." } },
    },
    missing = {
      lines = { { id = "m_default", text = "Somewhere along the coast between here and the southern isles, and I'd bet my ledger the Southsea pirates have somethin' to do with it. They know our schedules better than some of my own dockhands, and that's an expensive kind of knowing." } },
      choices = { { text = "So someone on the docks is talking.", next = "missing_spy" } },
    },
    missing_spy = {
      lines = { { id = "ms_default", text = "I didn't say that, pal, and I'd rather you didn't say it either, not loud. But somebody's selling our sailing times, and when I find out who, Gazlowe will want a word and an itemized apology." } },
      choices = { { text = "What will Gazlowe do?", next = "missing_gaz" } },
    },
    missing_gaz = {
      lines = { { id = "mg_default", text = "Docked wages, a swim with the sharks, or a job in the Venture Company's mines, depending on his mood. Gazlowe forgives a lot of things, pal, but he doesn't forgive anybody who costs him money." } },
      choices = {
        { text = "A thief on the docks gets what he deserves.", next = "BACK", reply = "He does, pal, and Gazlowe'll make sure of it. Ratchet runs on trust, and thieves are bad for the bottom line.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sharks seem a bit much for loose lips.", next = "BACK", reply = "A bit much? Pal, Gazlowe's sharks are well fed and very well paid. It's not personal, it's just bookkeeping.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    boats = {
      lines = { { id = "b_default", text = "The big run is to Booty Bay, across the sea to Stranglethorn, and it's the only boat in Kalimdor that takes Horde and Alliance alike, at the same fare and no questions. Everything else is coastal hauling and fishing, which pays in fish." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    dock = {
      lines = { { id = "d_default", text = "Since Gazlowe drove the first pile into the mud, pal, and I've hauled more cargo than you've seen in your life. I've never lost a crate I could blame on myself, either, and I've got the ledgers to prove it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fair = {
      lines = { { id = "f_default", text = "Harder, if you want the truth, because your lot sneak more contraband. But I take your coin the same, and a copper's a copper, which is as fair as Ratchet gets." } },
      choices = { { text = "That's about what I expected from Ratchet.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it isn't in my ledger, pal, it doesn't exist and it doesn't pay tolls, so as far as I'm concerned it can stay that way." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's on the other end of the route, and every crate leaves my dock with a mark and arrives with one fewer. Somebody over there can't count, and I'm starting to think it's on purpose." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail sink a ship a month, and I write down every crate of it, down to the last bottle. One day I'm going to send them the invoice, and I'm going to send it by cannon." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel keeps neutral and keeps ledgers, and I keep ledgers for the Cartel. That's the closest thing to a religion this town has." } },
    theramore = { { id = "tp_theramore", text = "Theramore ships come in regular, and their wharfmasters sign everything twice. I like them better than most of my own cousins, and you can quote me." } },
  },
}
