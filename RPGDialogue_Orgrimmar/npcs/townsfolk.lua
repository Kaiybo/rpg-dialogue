-- Orgrimmar's working people: the bank, the auction house, the wind riders and the kennels,
-- the Valley of Honor's crafters, and the officer who walks the Valley of Strength.
-- None of them gives a quest or has much to say in the game. Voice: bibles/townsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Valley of Strength
---------------------------------------------------------------------------

-- Karus: a banker who remembers when orcs owned nothing worth locking up.
P:NPC {
  key = "karus", id = TODO_NPC("Karus"), name = "Karus", title = "Banker",
  bible = "bibles/townsfolk.md", role = "banker", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical", "honest" },
  impression = {
    first = "Karus guards the vaults of Orgrimmar with a ledger and a long memory. He remembers when no orc owned anything worth locking up, and he treats every deposit like proof of how far the Horde has come.",
    third = "{name} met Karus, a banker of Orgrimmar who keeps the Horde's vaults and remembers the camps that came before them.",
  },

  greetings = {
    { id = "g_hi", text = "Your vault is where you left it, and so is everything in it. I'd know if it weren't." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Put it in or take it out, and I'll write it down either way." },
    { id = "g_goblin", when = { race = "Goblin" }, text = "A goblin at an orc's counter. Count it twice if you like, but you'll find I counted it three times." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The bank trusts the ledger. In the camps the Silver Hand counted us like stock, and now an orc counts gold for whoever walks in, even a knight of the Light. I'd call that progress, and I write it down." } },
      choices = {
        { text = "Fair dealing for everyone is the right way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your ledger matters less than what I do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Prayer beads, old letters and the odd relic they won't say a word about, mostly. The Forsaken bring things from Lordaeron that still smell of incense, and the trolls bring masks I'd rather not look at twice. I lock it all away the same and ask no questions." } },
      choices = {
        { text = "A banker who asks no questions keeps an honest trade.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some of those relics deserve a few questions.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, though most come in with packs full of blunted blades and broken shields they can't bear to throw away. I keep them safe all the same, because a grunt's first axe means something to him, even when it's bent." } },
      choices = {
        { text = "A warrior honours his old gear. I keep mine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sentiment is dead weight. I'd sell the lot.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I take anything that fits, though I'd thank you to clean it first. One hunter left a whole kodo horn with me last summer, and the grunts at the door still talk about the stink, so tan your hides before they reach my counter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And no, your {pet} can't come into the vault with you. The last one chewed through a strongbox, and I've never managed to explain that to the owner." },
      },
      choices = {
        { text = "I'll tan every hide properly. Waste insults the beast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hides are coin. I'll sell them raw and quick.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I doubt it, but the orcs who listen to them seem to keep less of it and sleep better for it. In the camps we couldn't own a copper, and now we lock up chests of it, so perhaps the spirits are right to laugh at us." } },
      choices = {
        { text = "Gold kept in good order serves the Horde well.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hoarded gold is just another chain, like the camps.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Never, and I've watched plenty of quick fingers walk past my counter. The vaults of Orgrimmar are cut into the mountain, and the grunts at the door have orders that don't involve asking questions." },
      },
      choices = {
        { text = "Good. A bank should be safe for all of the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every vault has a weakness. Someone will find it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Has anyone ever tried to rob you?", next = "rob" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The Warchief doesn't like wards he can't see, and neither do I. Iron, stone and grunts who don't drink on duty have served this bank well enough, and I'll keep it that way." },
      },
      choices = {
        { text = "Iron and stone, then. Fair enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wards would serve you better than tired grunts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How can every bank reach the same vault?", next = "vault" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every druid I've met keeps a little, though they're shy about it, and it's mostly seeds and herbs they swear can't be bought anywhere else. I keep their chests by the cool wall, because I learned the hard way that seeds sprout in a warm vault." } },
      choices = {
        { text = "A sensible druid plans for lean seasons, like any good banker.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land provides. A druid shouldn't hoard anything at all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I think the camps taught us what happens when orcs hand their will to something else, and I won't forget it. But the Warchief lets you serve, so I'll keep your vault as well as anyone's, as long as nothing in it scratches at the door." },
      },
      choices = {
        { text = "My power serves the Horde, Karus, and nothing else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What I keep in my vault is my own business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I've seen stranger deposits, but not many stranger depositors. Your vault is your own, whatever you pray to." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my counter. Your kind don't deposit much, I find, though you come back for your coin more often than most." },
        { id = "h_default", key = true, text = "Karus, of the bank of Orgrimmar. Whatever you leave with me stays locked away until you come for it, and you can reach the same vault from any bank in the Horde." },
        { id = "h_orc", when = { race = "Orc" }, text = "When we were in the camps, the only thing an orc could own was his anger. Now look at us, queuing for our own vaults like merchants. Your vault is ready, {g:brother|sister}." },
        { id = "h_rich", when = { money = { min = 1000000 } }, text = "You carry more gold than most warbands ever saw. Leave some of it with me before a Kolkar cuts your purse off your belt in the Barrens." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at the vaults. Your kind give back to the earth what they take from it, which is more than most of my depositors do with their gold." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at the vaults. Your kind carry less than anyone who walks in here, so I'll wager you've come for gold and not to leave any." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior with full packs, I see. Leave the spare axes with me, because nobody ever won a fight carrying three of them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and you'll have hides and teeth to stow, I expect. They go in the back vault, where the smell won't trouble anyone." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your vault's ready, though I'll ask you not to store anything in it that whispers." },
      },
      again = {
        { id = "h_again", text = "Something else, or shall I open the vault?" },
        { id = "h_again2", text = "Go on. The ledger can wait a moment, though not a long one." },
      },
      choices = {
        { text = "What do priests usually leave in your vaults, Karus?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the spirits care about gold, Karus?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does a druid need a bank at all, Karus?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Open my vault, please.", next = "BUSINESS" },
        { text = "How can every bank reach the same vault?", next = "vault" },
        { text = "What do orcs keep in a bank?", next = "keep" },
        { text = "Has anyone ever tried to rob you?", next = "rob" },
        { text = "Ever lost a deposit to someone with quick fingers, Karus?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage could guard your vaults with wards, Karus.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warriors bank much, Karus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you take a hunter's trophies in the vault, Karus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you make of warlocks, Karus?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Horde's bank trust a paladin, Karus?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Nothing today, Karus.", next = "END" },
      },
    },
    vault = {
      lines = { { id = "v_default", text = "Couriers, ledgers and a great deal of trust between bankers who've never met. The goblins worked out most of it, and they'd want me to add that they charge for the idea." } },
      choices = {
        { text = "Do you trust goblins with that much?", next = "vault_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault_goblins = {
      lines = { { id = "vg_default", text = "I trust their greed, which is steadier than most people's honour. A goblin who steals from a vault loses every vault after it, and they all know that arithmetic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "Less gold than you'd think. Mostly it's things they can't carry and won't sell: a father's axe, a clan banner from before the camps, letters from a cousin at Hammerfall." } },
      choices = {
        { text = "Keepsakes are worth guarding.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sentiment is dead weight in a war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you keep here yourself?", next = "keep_own" },
      },
    },
    keep_own = {
      lines = { { id = "ko_default", text = "The chain from the internment camp at Durnholde, which a guard struck off my ankle the day the Warchief freed us. I take it out once a year and look at it, and then I put it back." } },
      choices = {
        { text = "I'm glad you're free of it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob = {
      lines = { { id = "r_default", text = "A rogue tried it once, all shadows and soft boots. He didn't count on the Grunts at the door, who aren't clever, but who are very, very large." } },
      choices = {
        { text = "What happened to him?", next = "rob_after" },
        { text = "I'd never try it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    rob_after = {
      lines = { { id = "ra_default", text = "He spent a season hauling stone for the city walls. He hauls crates in the Drag now, and honestly, I hear, which is more than most rogues can say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Bring it to me if you want it safe, or take it to the auction house if you want it gone." } },
    _none = { { id = "tp_none", text = "I keep coin and keepsakes, not answers. Ask Gryshka at the inn; people tell her everything." } },
  },
}

-- Auctioneer Thathung: runs bids at Orgrimmar's auction house, and wishes people would read the slips.
P:NPC {
  key = "thathung", id = TODO_NPC("Auctioneer Thathung"), name = "Auctioneer Thathung", title = "Auctioneer",
  bible = "bibles/townsfolk.md", role = "auctioneer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "practical" },
  impression = {
    first = "Auctioneer Thathung runs the bids at Orgrimmar's auction house in a voice made for a battlefield. He would rather explain the deposit once, clearly, than hear one more complaint about it.",
    third = "{name} met Auctioneer Thathung, who keeps the bids honest at the auction house of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Buying or selling? Either way, read the slip before you sign it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did it sell? Then you're welcome; and if it didn't, price it lower." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Gold doesn't care who carries it, and neither do I. A few old-timers might bid against you out of spite, because they remember that light on the guards at the camps, but spite costs them coin, and I take the cut either way." } },
      choices = {
        { text = "Then I'll trade honestly and let them see it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they bid out of spite, I'll take their gold.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They list them, and some fool always bids, though I couldn't tell you how many are real. The house takes a deposit and a cut whatever the thing is, and I don't hold with judging a buyer's faith by what he pays for it." } },
      choices = {
        { text = "The house should refuse any relic it can't vouch for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A free market sorts out its own fools.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cheap is a word for buyers, and I don't use it near sellers. Blades out of Ragefire Chasm come through every week, and some are better than anything in the Drag, so watch the lists in the evening and bid before the grunts come off duty." } },
      choices = {
        { text = "I'll earn my weapons in battle, not at auction.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin buys a good axe without all the bleeding.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Well enough if they're whole, and the leatherworkers pay best for the thick ones out of the Barrens. Bring me raptor hides and scorpid scales untorn, and the house takes its cut and you take the rest, without haggling with any trader in the Drag." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't go on the lists, before you ask. Somebody always asks, and the answer is always no." },
      },
      choices = {
        { text = "I sell only what the hunt leaves over.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt whatever sells best, and keep hunting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Elemental earth and fire, mostly, scraped off the creatures in the Badlands and Searing Gorge, and the smiths fight over every scrap of it. The shamans who list it always look a little guilty, so I don't ask where it came from." } },
      choices = {
        { text = "Selling the remains of elementals dishonors the spirits.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If an elemental attacks me, what's left of it is mine to sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "If they do, I don't know about it, and I'd rather not know, because the deposit is the same either way. But the Warchief's guards read the lists, so if you're thinking of selling something with somebody else's name scratched on it, you'd best scratch harder." },
      },
      choices = {
        { text = "Then I'll scratch harder. Good advice.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'd never sell stolen goods here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What sells best in Orgrimmar?", next = "sells" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Conjured water fades away if you leave it too long, and nobody would pay for it anyway, so no, they don't. Mages sell cloth and the odd wand, and they complain about the deposit louder than any warrior, which surprises me every time." },
      },
      choices = {
        { text = "The deposit is fair. Rules keep the house honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your deposit is robbery with a gavel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do I pay a deposit?", next = "deposit" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Fair is whatever the bidding says it is, and right now the alchemists are paying well for anything green out of the Barrens. A druid who picks clean and lists early will do better than one who sits on a full bag waiting for a better day." } },
      choices = {
        { text = "I'll ask a fair price. Gouging the alchemists isn't honourable.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they're paying well, I'll squeeze every copper out of them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Cloth, mostly, because your kind wears through robes faster than a grunt wears through boots, and runecloth goes to the highest bidder. I don't care what the buyer does with it, and neither does the house, as long as the deposit's paid." },
      },
      choices = {
        { text = "I'll pay the deposit and bid fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "There's always a way around a deposit, Thathung.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin at the auction house. You list your goods like anyone else, and if any grunt complains about the glow, he can complain to me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the auction house. If you've come to bid on bandages, you're in luck, because the warriors keep selling theirs for ale money." },
        { id = "h_default", key = true, text = "Auctioneer Thathung. You list your goods, other people bid, and the house takes a deposit and a cut. That's the whole of it, though you'd be amazed how many warriors want it explained twice." },
        { id = "h_low", when = { maxLevel = 15 }, text = "New to the house, are you? Start by selling the linen and the copper you've been carrying around, because somebody here always needs it more than you do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you're selling totems this isn't the place, and if you're buying them it isn't either, because no shaman I know would trust one made by another hand." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at the auction house! You'll be selling herbs, I expect, because every druid who comes through that arch has a bag of peacebloom and an opinion on the price." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and I can guess what you're after: a better axe for less coin than it's worth. Everybody wants that, and the bidding usually tells them no." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want arrows and a better bow, and you'll find both on the lists, if you've the patience to wait for them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock at the auction house. Felcloth sells well, if you've any, and don't tell me where you found it." },
      },
      again = { { id = "h_again", text = "Another question? Ask it quickly; the bids don't wait." } },
      choices = {
        { text = "Do people bid on holy relics here?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do shamans ever sell anything through the house?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do herbs fetch a fair price here, Thathung?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Show me what's for sale.", next = "BUSINESS" },
        { text = "Why do I pay a deposit?", next = "deposit" },
        { text = "What sells best in Orgrimmar?", next = "sells" },
        { text = "How is this house different from Booty Bay's?", next = "neutral" },
        { text = "Do stolen goods ever pass through your auction house?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages sell their conjured water here?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Are good weapons going cheap at auction, Thathung?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do a hunter's hides sell well at auction, Thathung?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What sells best to warlocks, Thathung?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will the bidders deal with a Forsaken paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    deposit = {
      lines = { { id = "d_default", text = "So nobody lists a hundred rusty swords for a fortune and clogs the house for a day. Sell it and you get the deposit back; leave it unsold and the house keeps it for its trouble." } },
      choices = {
        { text = "That seems fair enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's a tax on the poor, and you know it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who keeps the deposits?", next = "deposit_tax" },
      },
    },
    deposit_tax = {
      lines = { { id = "dt_default", text = "The house does, and it pays the Grunts at the door and the clerks who sort the mail with it. None of it goes into my pocket, before you ask, and I'd be a richer orc if it did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "s_default", text = "Cloth and herbs, every day, because tailors and alchemists are always short. Copper bars when the smiths in the Valley of Honor are busy, and anything that glows when the warlocks from the Cleft come up for air." } },
      choices = {
        { text = "The warlocks shop here?", next = "sells_cleft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_cleft = {
      lines = { { id = "sc_default", text = "They pay in good coin and they don't haggle, which I like. They also don't say what they want it for, which I like less, but the house doesn't ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neutral = {
      lines = { { id = "n_default", text = "This house trades only within the Horde. The goblins in Booty Bay and Gadgetzan will sell to anyone, Alliance included, and they take a much bigger cut for the privilege." } },
      choices = {
        { text = "Trading with the Alliance seems wrong.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gold is gold, whoever's hand it comes from.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_steam", text = "The goblins' cartel runs the neutral houses. They're cheerful, they're thorough, and they always get paid." } },
    trade = { { id = "tp_trade", text = "Price it fairly and it sells. Price it greedily and it comes back to you in the mail." } },
    _none = { { id = "tp_none", text = "If it isn't for sale, I don't know much about it. Try the bank across the valley." } },
  },
}

-- Doras: the wind rider master on the tower above the Valley of Strength.
P:NPC {
  key = "doras", id = TODO_NPC("Doras"), name = "Doras", title = "Wind Rider Master",
  bible = "bibles/townsfolk.md", role = "flightmaster", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "loyal" },
  notices = { "mount" },
  impression = {
    first = "Doras keeps the wind riders on the tower above the Valley of Strength and talks about them the way some orcs talk about wolves. He trusts the beasts more than most riders, and says so.",
    third = "{name} met Doras, the wind rider master of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Where to? The wind riders are rested, so don't keep them waiting." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the tower. Mind the one on the end; she bites when she's bored." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get that beast off my tower before the wind riders decide it's dinner. They're fed, but they're not that well fed." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They'll carry anyone who sits still and doesn't kick, and the beasts don't care what you pray to. The riders are another matter; a few of them flew against human knights in the Second War and still flinch at that glow." } },
      choices = {
        { text = "I'll ride quietly and give no one cause to flinch.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Riders who flinch at me should find other work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "When the Crossroads sends word, they do, and I've strapped more than one grunt across a saddle with a healer holding him on. The beasts fly gentler with the wounded, which no rider believes until they've seen it for themselves." } },
      choices = {
        { text = "Then I'll ride with the wounded whenever you need me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A wounded grunt should walk home and learn from it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To the Crossroads, aye, which is as near a front line as the Barrens has, with the Kolkar and the quilboar raiding the roads. Grunts fly out with their axes strapped tight and walk back covered in centaur dust, and the riders always seem pleased to see them go." } },
      choices = {
        { text = "Then send me wherever the Horde needs blades.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fly wherever the coin is best, Doras.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Slowly, and with a great deal of raw meat. A wind rider is part lion and part bat and all temper, so you earn its trust the way a hunter earns a beast's, by feeding it and never once lying to it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} close on the roost. The wind riders have never eaten a hunter's beast, but they look at them sometimes, and I don't like the look." },
      },
      choices = {
        { text = "Patience and trust. That's the only way to tame anything.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A firm hand works faster than patience, in my experience.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and they listen better than their riders. Before a storm comes in off the sea every wind rider on this tower goes quiet and tucks its head, and I've learned to cancel the flights when they do, whatever the passengers say." } },
      choices = {
        { text = "You're right to keep that rule, Doras.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd fly straight into it. The air spirits wouldn't harm me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Once, and the wind rider brought him straight back here and dropped him in the Valley of Strength. They know their roosts better than any thief knows a road, and they won't fly anywhere they haven't been." },
      },
      choices = {
        { text = "Clever beasts. I'd never try it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good thief would steal the saddle instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why can't I fly somewhere new?", next = "roosts" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, and thank the ancestors for that, because my wind riders would buck the whole sky to get it off. Send the thing away before you climb up, and call it back when you land." },
      },
      choices = {
        { text = "As you say. The beasts come first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's my demon. Your beasts should learn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do the wind riders come from?", next = "beasts" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They mind a bear on the tower more than anything else, because a bear weighs twice what a rider should and smells like something to fight. Change on the ground and climb up as yourself, and they'll carry you anywhere the Horde has a roost." } },
      choices = {
        { text = "Your tower, your rules. I'll keep to my own shape up here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A wind rider should learn to carry whatever a druid becomes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Plenty, once they learn that a teleport only goes where the Horde has a city and my beasts go wherever it has a perch. Treat them well, too, because a wind rider remembers a rider who kicks, and it'll take the long way round next time." },
      },
      choices = {
        { text = "I'll treat them well. They carry the Horde.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a beast. It goes where I say.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin wants a wind rider? They don't like the smell of the dead, and I can't say how they'll take the Light, so we'll learn together." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Then you'll be calm in the saddle, I hope, because the wind riders can smell a nervous passenger and they don't like it." },
        { id = "h_default", key = true, text = "Doras. I keep the wind riders, and they'll carry you to the Crossroads, to Thunder Bluff, or anywhere else the Horde has a roost. Have you flown before, or will you be holding on with your eyes shut?" },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren up my tower! You'd make a wind rider sweat, but they've carried heavier, so climb on and keep your hooves tucked in." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders like your kind, because you smell of storms, and they were flying through storms long before the Horde came to this land." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. The wind riders get skittish when your kind change shape on the platform, so stay on two legs until you're in the saddle, if you please." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Hold on with both hands when you fly, because the wind riders don't care how strong you are, and neither does the drop." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Your beast will grumble all the way to the Crossroads, but they always do, and they always land happier than they left." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage on my tower. You could teleport home, I know, but the wind riders go places your spells don't." },
      },
      again = { { id = "h_again", text = "Is that all, or do I saddle one? They get restless when people stand about talking." } },
      choices = {
        { text = "Do the wind riders ever carry the wounded home?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the wind riders hear the air spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the wind riders mind a druid's beast shapes, Doras?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "Where do the wind riders come from?", next = "beasts" },
        { text = "Why can't I fly somewhere new?", next = "roosts" },
        { text = "What about the zeppelins?", next = "zeppelin" },
        { text = "Has anyone ever stolen one of your wind riders?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the wind riders carry warriors to the fighting, Doras?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do you train a wind rider, Doras?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My demon won't ride with me, will it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do mages fly your wind riders, Doras?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will your wind riders carry a paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "From the wild, and they don't come willingly. A wind rider has to decide you're worth carrying, and it takes a season of feeding and patience before one stops trying to take your arm off." } },
      choices = {
        { text = "That sounds like taming a wolf.", next = "beasts_wolf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_wolf = {
      lines = { { id = "bw_default", text = "It's harder. A wolf wants a pack, but a wind rider only wants the sky, so you're asking it to share. The ones on this tower have agreed to, and I thank them for it every morning." } },
      choices = {
        { text = "Beasts deserve that respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast serves, or it's no use to us.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    roosts = {
      lines = { { id = "r_default", text = "Because a wind rider flies to a roost it knows, and you have to show yourself at the roost first so the master there knows you. Walk there once, speak to the keeper, and you'll fly there ever after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zeppelin = {
      lines = { { id = "z_default", text = "The goblins' airships leave from the towers outside the city gates, bound for Tirisfal and for Grom'gol in Stranglethorn. They're full of gas that burns, they're flown by goblins, and I'll never set foot on one." } },
      choices = {
        { text = "I'll take a goblin airship any day.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'd rather trust a beast I can see.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "From up here everything below looks small, so I couldn't tell you. Ask someone on the ground." } },
  },
}

-- Urtrun Clanbringer: the city's guild master, who registers new warbands and their colours.
P:NPC {
  key = "urtrun", id = TODO_NPC("Urtrun Clanbringer"), name = "Urtrun Clanbringer", title = "Guild Master",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "proud" }, values = { "honorable", "loyal" },
  impression = {
    first = "Urtrun Clanbringer registers new guilds for the Warchief and treats every charter like a clan being born. He talks about the old clans with pride and about what they became with care.",
    third = "{name} met Urtrun Clanbringer, the guild master of Orgrimmar, who sees every new guild as a new clan.",
  },

  greetings = {
    { id = "g_hi", text = "Come to found a clan of your own? Or have you come to see what one costs?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you gathered your names yet, or are you still persuading them?" },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A guild is a clan, and a clan takes in whoever will stand with it. The old clans remember the Silver Hand from the camps, so you will have to show them you stand with us and not with the knights who held the keys." } },
      choices = {
        { text = "My clan is the Horde, and I'll prove it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I stand for the Light first, and any clan second.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not as you mean it, no; we had shaman until the Horde forgot them, and then we had warlocks, and we know how that ended. A guild with healers in it is something new for orcs, and I think it's a better thing than most of what the clans became." } },
      choices = {
        { text = "Then I'll found a guild that heals before it fights.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A guild needs strength first. Healers come after.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Should a wolf join a pack? The Warsong and the Blackrock were great because their warriors fought under one name, and a lone axe in Ragefire Chasm is only a meal for whatever lives down there, so find people you trust and put your name in my book beside theirs." } },
      choices = {
        { text = "A warrior fights beside his clan. I'll find mine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fight alone. Clans and guilds only slow me down.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every clan had them, and the good ones fed the whole camp through the winter. The Frostwolves still ride their wolves up in Alterac, and the old clans had trackers who could follow a scent across a river, so don't let anyone tell you hunters stand outside the clans." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} counts as one of the guild too, as far as I'm concerned, though I've never managed to make one sign the book." },
      },
      choices = {
        { text = "Then I'll put my name beside a clan's.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast is all the clan I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every one I register, if I had my way. The Frostwolves kept their shamans when the other clans traded theirs for warlocks, and that is why Drek'Thar still speaks for them while the rest of us had to learn it all again from Thrall." } },
      choices = {
        { text = "A guild needs an elder to keep it honest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A guild should choose its own way, not copy the old clans.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Tribes, they call them, Bloodhoof and Runetotem and the rest, and Cairne holds them together the way the Warchief holds us. I envy them that, because the camps scattered our clans and left half of us with no name to give." } },
      choices = {
        { text = "Old names should be remembered and kept.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "New names are earned. Let the old ones go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A guild of anything can register, so long as it fights for the Horde and pays its fee. I've had warriors, shaman and once a band of goblin engineers, and I never asked what any of them did after dark." },
      },
      choices = {
        { text = "Then we'll register properly, under the Warchief's law.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A thieves' guild should stay off your books.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What makes a good guild?", next = "good" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "There were warlocks in every clan, once, and the Shadow Council behind them all, whispering in the chieftains' ears. I record the new guilds so the Horde never again has a clan whose real masters hide in the dark, and I'll be watching yours." },
      },
      choices = {
        { text = "Good. Openness keeps the Horde strong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some power is best kept in the dark.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What were the old clans like?", next = "clans" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They had shaman, and later warlocks, which is a story I tell carefully, but never mages, because those came to us with the trolls and the Forsaken. A guild of mages would be a new clan with no old name to live up to, and I think that's a fine thing." },
      },
      choices = {
        { text = "Then we'll make a name the Horde is proud of.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't need a clan to make my name.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The old clans would never have known what to make of you, and I am not sure I do either, but the Horde has room for strange guilds now." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The old clans had their shaman and their warlocks, and few enough healers, so I'll write your guild's name down with some pleasure if you ever bring me one." },
        { id = "h_default", key = true, text = "I am Urtrun Clanbringer, and the Warchief has charged me with recording every new guild of the Horde. In the old days we had clans, and now we have guilds, but a band of warriors who share a name is a clan, whatever you call it." },
        { id = "h_orc", when = { race = "Orc" }, text = "Which clan were your parents, {g:brother|sister}? Never mind; many don't know any more, and the camps took the names from more of us than the war did. Start a new one, then, and make it worth remembering." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, come to the registry of guilds! Your people never had much need for the word clan, I think, because a whole tribe stands behind every one of you." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at the guild registry! In the old clans every warband had a shaman to speak for its ancestors, and I'll say plainly that the guilds could use a few more." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! In the old clans you'd have had a warband and a chieftain by now, so tell me you've at least found a guild to fight beside." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Hunters join guilds last of anyone, because they think a beast is all the company they need, and they're usually wrong." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, come to found a guild? The old clans never had mages, but the Horde is a new thing." },
      },
      again = { { id = "h_again", text = "What else? Ask, and I'll answer like a clan elder." } },
      choices = {
        { text = "Did the old clans ever have priests among them, Urtrun?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should every guild keep a shaman, as the clans did?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the tauren keep clans as the orcs do?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I want to start a guild.", next = "BUSINESS" },
        { text = "What were the old clans like?", next = "clans" },
        { text = "What makes a good guild?", next = "good" },
        { text = "I'm Frostwolf.", next = "frostwolf", when = { origin = "orc_frostwolf" } },
        { text = "Could a guild of thieves register with you, Urtrun?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Should a warrior join a guild, Urtrun?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Did the old clans have hunters, Urtrun?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Were there warlocks in the old clans?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Did the old clans have mages, Urtrun?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would a guild of the Horde accept a paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Urtrun.", next = "END" },
      },
    },
    clans = {
      lines = { { id = "c_default", text = "Proud, and quarrelsome, and each one sure it was the greatest. The Warsong and the Blackrock and the Frostwolves, the Dragonmaw with their beasts, and a dozen more. Then the demons' blood bound most of them into one Horde, and some never came back from it." } },
      choices = {
        { text = "Were the clans better before the Horde?", next = "clans_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clans_better = {
      big = true,
      lines = { { id = "cb_default", text = "Freer, perhaps, and also always at each other's throats. The Warchief's Horde is the first that chose to be one, and I'd rather record a hundred small guilds who chose it than one great clan that was forced." } },
      choices = {
        { text = "Unity is worth more than old names.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A people without their clans has lost something.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    good = {
      lines = { { id = "g_default", text = "Names on the charter are easy to find, but loyalty when the fight goes badly is not. Pick the ones who'll come back for you in the Wailing Caverns, not the ones who'll split the loot fastest." } },
      choices = {
        { text = "And the tabard?", next = "good_tabard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_tabard = {
      lines = { { id = "gt_default", text = "Choose your colours carefully, because you'll be wearing them in front of every enemy the Horde has. The old clans painted their banners in blood; you only need gold, but treat it as seriously." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    frostwolf = {
      lines = { { id = "f_default", text = "Then you're of the one clan that never drank. Drek'Thar's people kept the old ways in Alterac while the rest of us forgot them, and the Warchief owes them his life. Bring that honour into any guild you join." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "That's a clan I'll never record, whatever name they come in under." } },
    _none = { { id = "tp_none", text = "That's no clan's business I've recorded. Ask the Grunts; they hear everything on their walls." } },
  },
}

-- Overlord Runthak: an officer of Orgrimmar who walks the Valley of Strength.
P:NPC {
  key = "runthak", id = TODO_NPC("Overlord Runthak"), name = "Overlord Runthak", title = "Orgrimmar Officer",
  bible = "bibles/townsfolk.md", role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "loyal", "disciplined" },
  notices = { "class", "race" },
  impression = {
    first = "Overlord Runthak walks the Valley of Strength like he's inspecting troops, and to him the whole city is troops. He's loyal to Thrall without a flicker of doubt and suspicious of everyone else on principle.",
    third = "{name} met Overlord Runthak, an officer who walks the Valley of Strength in Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Keep moving, citizen, and keep your weapon sheathed in the Warchief's city." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still in one piece, I see. Good; the Horde needs you that way." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I've got my eye on you, warlock. Do your business in the Cleft and keep your little demons out of my valley." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's. The Warchief says you're Horde, so you're Horde, but don't breathe on the bread at the market." },
  },

  start = "hello",
  nodes = {
    xcl_ony = {
      big = true,
      lines = { { id = "xcl_ony_default", text = "Then you've done what most warriors in this city only boast about. That beast sat in her swamp in Dustwallow for too long, close enough to Theramore and to our own outposts to be trouble for both. When a dragon's head goes up over the city gates, the recruits stand straighter for a month, and I make sure of it." } },
      choices = {
        { text = "The glory belongs to the Horde, Overlord, not to me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I killed her. Let the whole city know my name.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Was she ever a threat to Orgrimmar itself?", next = "xcl_ony2" },
      },
    },
    xcl_ony2 = {
      lines = { { id = "xcl_ony2_default", text = "Not to these walls, but to every caravan and outpost within a dragon's flight of her swamp, and that's more of them than I'd like. A dragon doesn't need to attack a city to bleed it; it only needs to be hungry. I'm told she has a brother up in Blackrock, too, so don't hang up your axe yet." } },
      choices = { { text = "Then I'll keep my axe close, Overlord.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I trust the Warchief. He says the Forsaken are our allies, so I let you walk my valley, but the Silver Hand rode past the camps with that same light on their hammers. Keep it sheathed and keep your oath to the Horde, and we'll have no quarrel." } },
      choices = {
        { text = "My oath is to the Horde, Overlord. You'll see.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll wield the Light however I see fit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I trust the Warchief, and the Warchief allows you, so that settles it. I'll say this much, though: the Forsaken priests make my grunts uneasy, and I've no wish to find out what they pray to when nobody's looking." } },
      choices = {
        { text = "Then watch me, Overlord, and you'll see nothing worth fearing.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What I pray to is none of your business, Overlord.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Troggs, and worse than troggs, because the Searing Blade cultists have dug in under the city and think nobody's noticed. Take four or five with you, keep your shields up, and come back with fewer of them living under my feet." } },
      choices = {
        { text = "I'll clear the chasm for the city's sake, Overlord.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll clear it for whatever loot they're hoarding.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Durotar's thin on game and thick on teeth, which tells you something. Go south past Razor Hill for the boar and the scorpids, and if you want a real fight, the raptors of the Barrens will give you one before you've walked a day past the Southfury." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours stands straighter than half my recruits. If it ever wants to join the guard, it'll have to learn to salute." },
      },
      choices = {
        { text = "I hunt to feed the Horde, Overlord, not for sport.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt for the challenge. The meat is a bonus.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every day, though he'd say he never left it. Drek'Thar taught him among the Frostwolves, and he carries the Doomhammer that Orgrim gave him, and I've seen the sky darken when he's angry, which is why I'd rather he wasn't." } },
      choices = {
        { text = "Then I'll hold myself to the Warchief's standard.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Warchief walks his path, and I'll walk my own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not a chance, and I'd let them try if I didn't have to explain the broken bones afterward. The Warchief wants orcs and tauren to stand as brothers, so I keep the bloody noses to a minimum." } },
      choices = {
        { text = "Keep them in line, Overlord. The Warchief is right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them try. A beating teaches faster than orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Good, because I've got enough recruits waving their axes outside the Broken Tusk. Keep your knives hidden and your business quiet, and if I catch you cutting purses in the Drag, you'll find out how little I care for quiet work." },
      },
      choices = {
        { text = "No purses will be cut, Overlord. You have my word.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You'd have to catch me first, Overlord.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What trouble do you see in the city?", next = "trouble" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It trains loud ones, and I've had to put out two fires in the Drag this month already. The trolls say it's all part of learning, and I say learning can happen outside the walls." },
      },
      choices = {
        { text = "Fair. I'll practice outside the walls.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Learning needs room. The Drag can spare a little.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do I find my way around?", next = "around" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin in the Valley of Strength. I fought the humans' knights in the Second War, recruit, and I know that glow. Mind yourself here." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Keep your prayers quiet in the Valley of Strength, because the recruits will think you're casting at them and start a fight over it." },
        { id = "h_default", key = true, text = "Overlord Runthak. I keep the peace in the Valley of Strength, which mostly means stopping new recruits from fighting each other outside the inn. What do you want?" },
        { id = "h_young", when = { maxLevel = 10 }, text = "Fresh from the Valley of Trials, by the look of you. Don't get lost in the Drag, and don't buy anything a goblin calls a bargain." },
        { id = "h_vet", when = { minLevel = 50 }, text = "You've seen real fighting; it's in how you stand. The young ones here could learn something from watching you walk, so walk slowly." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, eh? Mind the recruits, because they've heard your kind can turn into bears, and half of them want to find out whether they could win." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The Warchief walks your path himself, so you'll hold yourself to his standard in my valley, and that means no lightning near the inn." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Keep your axe in its loop while you're in my valley, and save the swinging for Ragefire Chasm." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a beast in my valley. Keep it close near the inn, because the recruits are bored enough to start something with it." },
        { id = "h_cl_ony", tags = { "news" }, when = { cleared = "Onyxia's Lair", faction = "Horde" }, text = "So you've been into Onyxia's lair and come out with your hide on. Every grunt in the Valley of Strength has heard about it, and half of them are lying about having been there with you." },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick; I'm on my rounds." } },
      choices = {
        { text = "Do you trust priests in Orgrimmar, Overlord?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Warchief still walk the shaman's path, Overlord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would any of them win, Overlord?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who was the city named for?", next = "name" },
        { text = "What trouble do you see in the city?", next = "trouble" },
        { text = "How do I find my way around?", next = "around" },
        { text = "I keep my blades hidden in the city, Overlord.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Valley of Spirits trains good mages, Overlord.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What's down in Ragefire Chasm, Overlord?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is there game worth hunting near Orgrimmar, Overlord?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you trust a Forsaken paladin, Overlord?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Onyxia is dead, Overlord.", next = "xcl_ony", when = { cleared = "Onyxia's Lair", faction = "Horde" } },
        { text = "Dismissed, Overlord.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "Orgrim Doomhammer, the Warchief before Thrall, who died fighting free of the humans and gave Thrall his armour and his hammer. And the land outside is Durotar, for Durotan of the Frostwolves, Thrall's father. Remember both names." } },
      choices = {
        { text = "I'll honour them both.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Dead heroes don't win new wars.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Did you know Doomhammer?", next = "name_dead" },
      },
    },
    name_dead = {
      lines = { { id = "nd_default", text = "I saw him once, from the back of a crowd of slaves he'd just freed, and he looked tired and enormous. I've never forgotten either thing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Drunks at the Broken Tusk, thieves in the Drag, and quarrels between clans that ended a generation ago. And there are whispers about cultists down in Ragefire Chasm, under the Cleft of Shadow, which the Warchief takes more seriously than he lets on." } },
      choices = {
        { text = "Cultists? Under the city?", next = "trouble_chasm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_chasm = {
      lines = { { id = "tc_default", text = "The Burning Blade, or so they say, hiding in the fire under our feet with troggs for company. If you're strong enough, go down and clear them out, but don't let anyone in the Cleft see you going." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    around = {
      lines = { { id = "a_default", text = "You're in the Valley of Strength, with the bank, the auction house and the inn. Go north up the Drag for the shops and the Cleft of Shadow, west for the Valley of Spirits and the trolls, and east for the Valley of Honor and its trainers." } },
      choices = {
        { text = "And Grommash Hold?", next = "around_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    around_hold = {
      lines = { { id = "ah_default", text = "At the top of the Drag, in the Valley of Wisdom; you can't miss it. Speak respectfully in front of the Warchief, and do not touch the hammer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Traitors who miss the demons. I'd hang every one of them from the city walls, if the Warchief would let me." } },
    wailing_caverns = { { id = "tp_caverns", text = "A druid's den in the Barrens with something sick inside it. That's the tauren's mess, but our young ones go and help." } },
    _none = { { id = "tp_none", text = "That isn't my concern unless it starts a fight in my valley." } },
  },
}

---------------------------------------------------------------------------
-- Valley of Honor
---------------------------------------------------------------------------

-- Ogunaro Wolfrunner: the kennel master, who sells wolves to orcs and to friends of the city.
P:NPC {
  key = "ogunaro", id = TODO_NPC("Ogunaro Wolfrunner"), name = "Ogunaro Wolfrunner", title = "Kennel Master",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "warm" }, values = { "loyal", "proud" },
  impression = {
    first = "Ogunaro Wolfrunner raises the Horde's riding wolves and speaks of each one by name. He will sell a wolf to any orc and to anyone the city has truly accepted, and he means both rules.",
    third = "{name} met Ogunaro Wolfrunner, the kennel master who raises the riding wolves of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the pups; they nip, but they mean it kindly." },
    { id = "g_orc", when = { race = "Orc" }, text = "{g:Brother|Sister}! Come and meet the new litter. There's a grey one that looks at you like an old chieftain." },
    { id = "g_back", when = { metBefore = true }, text = "Back to visit the wolves, are you? They remember your smell, which is more than I can say for most visitors." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A wolf judges you by how you treat it, and nothing else. My people learned that light on the end of a human's hammer, but a wolf knows nothing of the camps, so if it takes you, I'll sell it to you, as long as the city has accepted you too." } },
      choices = {
        { text = "I'll earn the wolf's trust, and the city's.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wolf is a mount. I'll pay and take one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Some will and some won't, the same as orcs. A wolf that's been hurt in a fight remembers who held it down, so if you'd mend one, let it see your hands first and speak to it the whole while, because they trust a voice before they trust a touch." } },
      choices = {
        { text = "I'll mend them gently, the way you'd want.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A wolf that bites its healer deserves to limp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They do, and better than half the riders, though I'd not say that in the Valley of Honor. A war wolf learns to snap at the legs of anything that charges and keep its rider in the saddle, so treat yours like a shield-brother and it'll carry you out of fights you had no business walking into." } },
      choices = {
        { text = "A wolf is a shield-brother. I'll treat mine that way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A wolf is a mount. I'll ride it till it drops.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every one, and a stubborn one at that. The shamans say a wolf's spirit is half the beast and half the wind on the plains, and when one of mine dies I sit with it until the spirit has gone, because a wolf should never run alone." } },
      choices = {
        { text = "A wolf that served the Horde deserves that kindness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A wolf is a mount, and mourning it seems a waste.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "A wolf raised by my hand knows no other life, and I've never seen one that didn't want to run beside its rider. Still, I'll admit the wild wolves of Durotar look at mine as if they pity them." } },
      choices = {
        { text = "A wolf's place is beside its rider.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every wolf should know the wild at least once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They'd make terrible ones for you, because a wolf howls when it smells a stranger and goes quiet when it smells a friend. You'll have to earn their silence like any orc, by feeding them and never sneaking up on them." },
      },
      choices = {
        { text = "I'll earn it honestly, then.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Silence can be bought with meat. I'll manage.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "How do you train a wolf to carry a rider?", next = "train" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They don't fear them, they hate them, and they're right to. A wolf knows a thing that doesn't belong in the world before you do, so keep your demon away from my kennels, or I can't answer for what's left of it." },
      },
      choices = {
        { text = "I'll keep it away. Your wolves are wise.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your wolves will learn their place.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Have orcs always ridden wolves?", next = "history" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They'll carry anyone the city has truly accepted, and a troll or Forsaken mage who's earned that can ride one of mine, though not before. Don't ever freeze one to stop it running, because I'll hear about it, and so will the wolf." },
      },
      choices = {
        { text = "I'd never harm a wolf, Ogunaro.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mount that bolts gets frozen. That's that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin wants to see the wolves. They'll smell the grave on you, and they'll smell that light too, so stand still and let them decide." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The wolves don't care what you pray to, but they'll know if you're afraid of them, so don't be." },
        { id = "h_default", key = true, text = "Ogunaro Wolfrunner, kennel master. I raise the wolves the Horde rides to war, and every one of them was raised by my hand. Have you come to look, or have you come to buy?" },
        { id = "h_orc", when = { race = "Orc", minLevel = 40 }, text = "You're ready for one of my wolves, and they can tell. Come and choose, though the truth is the wolf will choose you." },
        { id = "h_friend", when = { ["not"] = { race = "Orc" }, reputation = { faction = "Orgrimmar", min = "exalted" } },
          text = "The whole city speaks well of you, and that's enough for me to sell you a wolf, whoever your people are. Come and choose one." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The wolves smell something on you they can't name, and look, they've gone quiet, which is more respect than they show most orcs." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The wolves know your kind, because the Frostwolves have run with shamans for as long as there have been Frostwolves, and see, they're already watching you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and you'll be wanting a wolf to ride into battle, I'd wager. Every warrior does, once they've crossed the Barrens on their own feet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. My wolves don't like the smell of burnt air, so keep your hands still while you're in the kennels." },
      },
      again = { { id = "h_again", text = "Anything else? The wolves are listening, so ask nicely." } },
      choices = {
        { text = "Do your wolves let a priest tend their wounds?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do wolves have spirits of their own, Ogunaro?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the wolves mind being raised for war?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your wolves.", next = "BUSINESS" },
        { text = "Why only orcs?", next = "orcs", when = { ["not"] = { race = "Orc" } } },
        { text = "How do you train a wolf to carry a rider?", next = "train" },
        { text = "Orcs have always ridden wolves, haven't they?", next = "history" },
        { text = "My companion is a wolf too.", next = "hunter", when = { class = "HUNTER", pet = { family = "Wolf" } } },
        { text = "Your wolves would make good lookouts for a rogue.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your wolves fight beside their riders, Ogunaro?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your wolves fear demons, Ogunaro?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will your wolves carry a mage, Ogunaro?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will your wolves accept a paladin rider?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll come back.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "Because a wolf is a bond between orc and beast that goes back to before the Dark Portal, and I won't sell that to just anyone. Earn the city's full trust and I'll sell you one, whatever you are; plenty of tauren and trolls have." } },
      choices = {
        { text = "That's fair. Trust should be earned.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gold should be enough for any merchant.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    train = {
      lines = { { id = "t_default", text = "Slowly, and from the day they open their eyes. They learn your weight before they learn your voice, so I carry them across my shoulders as pups and then I let them carry me. By the time they're grown, they think it was their idea." } },
      choices = {
        { text = "Do they ever refuse a rider?", next = "train_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    train_refuse = {
      lines = { { id = "tr_default", text = "Sometimes, and I don't argue with them. A wolf that won't carry you will throw you in the middle of a charge, so I'd rather it said so in my kennel than in the Barrens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history = {
      lines = { { id = "hi_default", text = "Since long before the Horde, on the old world. The Frostwolves are named for them, and the wolves they keep in Alterac are as white as the snow. Mine are smaller and greyer, but they're as loyal as any." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "alterac" } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "So I see, and a fine one. Bring {pet} round to the kennels any time; mine will want to smell your wolf, and your wolf will want to show off. Feed it before you leave, though, or it'll steal from mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    alterac = { { id = "tp_alterac", text = "The Frostwolves' mountains. The wolves there are bigger than mine, and I'm not too proud to say so." } },
    _none = { { id = "tp_none", text = "I know wolves, and that's about all. Ask the wolves; they're better company than half this city." } },
  },
}

-- Lumak: the fishing trainer, who learned to fish because the camps never fed anyone enough.
P:NPC {
  key = "lumak", id = TODO_NPC("Lumak"), name = "Lumak", title = "Fishing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "profession" },
  impression = {
    first = "Lumak teaches fishing to orcs who think it's beneath them, and he's patient about it. He learned the trade to keep himself fed after the camps, and he says a quiet river was the first peace he ever had.",
    third = "{name} heard how Lumak, fishing trainer of Orgrimmar, found his first peace by a river after the camps.",
  },

  greetings = {
    { id = "g_hi", text = "Sit if you like. Fishing teaches you to sit still before it teaches you anything else." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Caught anything, or only the weeds and the Barrens' boots?" },
  },

  notice = {
    { id = "n_angler", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "You hold yourself like an angler now, with your shoulders loose and your eyes on the water. I can always tell." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It does. The guards had a priest who glowed like that when he blessed them, and never once did he bless us. But you didn't stand on that wall, and the fish don't know the difference, so cast your line and we'll leave the past on the bank." } },
      choices = {
        { text = "I'll leave it there with you. Fair enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The past is the past. It's not my concern.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I never called it that, but I suppose it is. After the camps I couldn't sit still without my hands shaking, and a pole and a quiet river were the first things that let them stop, so whatever you'd call that, I'm grateful for it." } },
      choices = {
        { text = "Peace you find yourself is still a gift worth honouring.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's only fishing, Lumak. The peace was yours alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because an army marches on its belly, and the Barrens won't feed you unless you know where to look. The Southfury runs past the city full of fish, and a grunt who can catch his own supper won't sit by a cold fire waiting for a supply kodo that never comes." } },
      choices = {
        { text = "A warrior should never be a burden on the supply lines.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fishing is peon work. I'll take my rations.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Closer than most hunters think. You read the water the way you read tracks, you wait where the prey wants to be, and you never take more than you'll eat, because the river remembers greed the same way the plains do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would like a fish, I think, by the way it's watching my bucket. Fair enough; it's earned one more than most of the grunts who walk past." },
      },
      choices = {
        { text = "Take only what you'll eat. That's the rule I live by.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather fill the bucket while the fish are biting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Help, if you're patient with them, and patience is the only bait I've ever needed. On a still morning at the river below the city I can feel something watching the line with me, and I haven't felt alone out there since the camps." } },
      choices = {
        { text = "Peace on the river is a gift worth guarding.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The water gives what you take from it, and that's all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Patience, aye, though a fish doesn't hold a grudge when you catch it. I learned to fish in the internment camps, from an old orc who said the river was the one thing the humans couldn't lock up, and I've been patient ever since." },
      },
      choices = {
        { text = "Then let patience bring peace, not just prey.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Patience is a weapon, and I use it like one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why did you take up fishing?", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, and you'd scare off every fish from here to Razor Hill. Fishing's about letting the river come to you, and no spell has ever caught a fish worth eating." },
      },
      choices = {
        { text = "Then I'll learn the old way, with a pole.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Frozen fish are still fish. I'll take the shortcut.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where's good fishing near Orgrimmar?", next = "where" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I try to, because I fished a pool dry in my first year out of the camps and it never came back. Now I throw the small ones in and leave a stretch alone each season, though most orcs laugh when they see me do it." } },
      choices = {
        { text = "That's the right way. Take only what you need.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fish don't keep promises. Catch what you can while you can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I found mine on a river after the camps, and I had more to forget than most. Sit by the water in the Valley of Spirits, send your demon away for an hour, and see whether the fish teach you something it can't." },
      },
      choices = {
        { text = "I'll try it, Lumak. Some quiet would do me good.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't need peace. I need power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin wants to fish. Well, the river doesn't care, and it was a river that gave me my first peace after the camps, so sit down." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the river. Sit a while if you like; the water's the quietest temple in Orgrimmar." },
        { id = "h_default", key = true, text = "Lumak. I teach fishing, though most orcs who walk past me think it's a job for peons. Then they spend a week in the Barrens with nothing but dry jerky, and they come back asking for a pole." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear wants fishing lessons from an orc? Your people were fishing off the Echo Isles before mine ever saw the sea. You could probably teach me." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here by the water. Keep your voice low, because the water spirits are easier to frighten than the fish, and a good deal harder to catch." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, here at the river. Sit down and be quiet a while, because you'll know better than most that the water gives more to those who wait for it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior with a fishing question, I hope? More come to me after a long patrol than you'd think, wanting something to do with their hands that isn't killing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll know about patience already, so you'll make a better fisher than any warrior, though I'll not tell them I said it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock wants to fish? Good, because a quiet river is the best place to forget whatever you've been listening to." },
      },
      again = { { id = "h_again", text = "Something else? Keep your voice low; voices carry over water." } },
      choices = {
        { text = "Is fishing a kind of prayer to you, Lumak?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the water spirits help or hinder a fisherman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you take only what the water can spare, Lumak?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's good fishing near Orgrimmar?", next = "where" },
        { text = "Why did you take up fishing?", next = "why" },
        { text = "Fishing is a waste of a warrior's time.", next = "waste" },
        { text = "Fishing teaches patience, Lumak. So does my trade.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could freeze the river and pick the fish out.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would a warrior need to fish, Lumak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is fishing much like hunting, Lumak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a warlock find peace fishing, Lumak?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Light remind you of the camps, Lumak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Lumak.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "The coast below Razor Hill, for a start, and the shore by Sen'jin Village, where the trolls will tell you you're doing it wrong. The oases of the Barrens are good too, if you don't mind the crocolisks watching you." } },
      choices = {
        { text = "Do the crocolisks bother you?", next = "where_croc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_croc = {
      lines = { { id = "wc_default", text = "Only when I catch something they wanted. Throw them a small fish and they'll leave you alone, and keep the big ones for yourself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "y_default", text = "In the internment camps we were fed whatever the humans had left over, and some days that was nothing. When the Warchief freed us, I found a river and sat by it for three days, and I caught enough fish to feed eleven of us. I've fished ever since." } },
      choices = {
        { text = "That's a good reason.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'm sorry the camps were so cruel.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    waste = {
      lines = { { id = "wa_default", text = "Is it? A warrior with a fishing pole eats on the road, and one without eats his boots. Fishing taught me patience, too, and I've never met a warrior who had too much of that." } },
      choices = {
        { text = "Patience wins more fights than rage.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rage wins the ones that matter.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    echo_isles = { { id = "tp_isles", text = "The trolls say the fishing there was the best on the coast. They don't talk about what's there now." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Throw a line in the water and think about it; that's what I'd do." } },
  },
}

-- Makaru: the mining trainer, who reads Durotar's hills like a map.
P:NPC {
  key = "makaru", id = TODO_NPC("Makaru"), name = "Makaru", title = "Mining Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "diligent" },
  notices = { "profession" },
  impression = {
    first = "Makaru teaches mining as if the rock were an opponent who fights fair if you respect it. Durotar's hills are a map in Makaru's head, vein by vein.",
    third = "{name} was told by Makaru, who teaches mining in the Valley of Honor, to listen for the ore in the rock.",
  },

  greetings = {
    { id = "g_hi", text = "Come to learn to dig? Then roll your sleeves up; there's no clean way to do it." },
    { id = "g_back", when = { metBefore = true }, text = "Still swinging a pick? Show me your hands and I'll tell you how long you've been at it." },
  },

  notice = {
    { id = "n_miner", cat = "profession", when = { profession = { name = "Mining", min = 125 } },
      text = "There's iron dust in the creases of your knuckles. You've been past the copper and the tin, then, and it shows." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not fear, no. The Silver Hand broke stone and orc alike to build their camps, and we remember it. A paladin swinging a pick in Durotar for the Horde is a strange sight, and I'd be lying if I said I didn't enjoy it a little." } },
      choices = {
        { text = "Then I'll dig for the Horde, and gladly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I dig for my own coin, not anyone's satisfaction.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I've seen the altars they leave behind, and the scorch marks where something was called that shouldn't have been. A miner learns to feel when the rock is wrong, and those caves feel wrong, so if your prayers can do anything about that, I'd be glad of them." } },
      choices = {
        { text = "I'll pray over those caves and cleanse what I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't help. Burn the altars and kill the cultists.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Better than most, because mining is only swinging something heavy at something hard until it gives up. The copper in Durotar's hills will do to start with, and when you're ready, the Barrens has tin and silver, though the Venture Company goblins will tell you they own it all." } },
      choices = {
        { text = "I'll dig my own ore and forge my own blade.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the peons dig. I'll buy the ore.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The hills around Razor Hill and the canyons near Skull Rock are thick with copper, and the harpies of Dustwind Cave nest on some of the best of it. Keep an eye on the cliffs while you track, and you'll come home with more than hides." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And mind your {pet} near the cliff edges, because a beast after a lizard doesn't look where it's running, and Durotar's canyons are deep." },
      },
      choices = {
        { text = "I'll take what ore I need and leave the rest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every vein I pass is coin. I'll strip them all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, but I listen before I swing the pick, and stone tells you when it's angry if you're quiet enough. The shamans say the earth spirits of Durotar are hard and slow to forgive, and every vein I've worked agrees with them." } },
      choices = {
        { text = "Ask first and dig carefully. That's the right way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The ore is there to be taken, so I'll take it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It does, and I'll not pretend otherwise, because Durotar heals slower than any land I know. But Orgrimmar's walls had to come from somewhere, and I'd rather the Horde dug its own stone than begged it from anyone." } },
      choices = {
        { text = "The Horde needs walls. The hills can bear the cost.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then dig less, and let the hills heal before the city grows.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Anyone can, if they respect the rock, because it fights fair and only punishes the careless. Rogues pick up the trade quickly, too, because you already know how to find the weak point and wait for the right moment to strike." },
      },
      choices = {
        { text = "I'll learn it properly and respect the rock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Easier to pick a miner's pocket than the rock.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It is, because every mage I've met wants a wand and a ring, and the ore for both comes out of a hill somebody had to dig. Start with the copper in the hills around Razor Hill, and don't try to melt the rock with fire, because it's been tried, and it only cracks." },
      },
      choices = {
        { text = "I'll learn the trade your way, Makaru.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find my own way to work the rock.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They fear cave-ins, and anything that makes a loud noise in a narrow tunnel, and a demon does both. Dig with your own hands, and let the rock teach you the patience your power doesn't, because it will, whether you want it to or not." },
      },
      choices = {
        { text = "I'll dig with my own hands, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon can dig faster than any miner.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin with a pick? The rock won't care about your Light, but it'll test your back, if the dead still have backs that ache." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll not want to learn mining, I expect, but you'll want to know which caves the Burning Blade have taken, and I can tell you that." },
        { id = "h_default", key = true, text = "Makaru, and I teach mining. The city was built from the stone of these hills, and every forge in the Valley of Honor burns ore that somebody dug out with a pick." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "A smith! Then you know what bad ore does to a blade, so learn to dig your own and never trust a stranger's bars." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the miners' hall. You'll ask the earth's leave before you dig, I suppose, and I won't laugh at you for it, because the hills here have dropped a roof on more than one miner who didn't." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid among the miners. You'll not like what a pick does to a hillside, I expect, so say your piece about it now and let's be done with it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and a strong back on you! You'd swing a pick as well as an axe, and the forges in the Valley of Honor would thank you for it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll be out in the hills more than anyone, so you'll pass more copper veins than anyone, and I'd learn to see them if I were you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'll know about locks, then, and the rock is only a lock nobody's picked yet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, at the mines? You'll find the rock doesn't care how clever you are." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock at the mines. Keep your demon out of the tunnels, because the miners are jumpy enough already." },
      },
      again = { { id = "h_again", text = "What else? Make it quick; the light's going in the hills." } },
      choices = {
        { text = "Have you seen what the Burning Blade do in the caves?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you ask the earth's leave before you dig?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does all this digging scar the hills, Makaru?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do warriors make good miners, Makaru?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Where's the best ore in Durotar, Makaru?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where can I find ore near here?", next = "where" },
        { text = "What makes a good miner?", next = "good" },
        { text = "Who buys the ore?", next = "who" },
        { text = "Can a rogue learn mining, Makaru?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is mining worth a mage's time, Makaru?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the miners fear warlocks, Makaru?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do orcs still fear the Light, Makaru?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Makaru.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "There's copper in the hills of Durotar, if you look in the gullies and around the caves. For tin and silver, go out into the Barrens, and for iron, further still, into Stonetalon or Ashenvale." } },
      choices = {
        { text = "Any caves I should avoid?", next = "where_caves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_caves = {
      lines = { { id = "wc_default", text = "Skull Rock, east of here, because the Burning Blade's cultists hide in it and they don't like visitors. Mine the copper outside it and leave the cave to someone with a bigger axe." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    good = {
      lines = { { id = "g_default", text = "A strong back and a good ear. Ore sounds different from rock when the pick hits it, and once you hear the difference you'll never forget it." } },
      choices = {
        { text = "I'll learn to listen to the rock.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd rather just hit it harder.", next = "good_hard" },
      },
    },
    good_hard = {
      lines = { { id = "gh_default", text = "Then you'll break more picks than veins. Plenty of young orcs have tried that, and the rock wins every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "Every smith in the Valley, the engineer in his machine shop across the way, and the auction house, when the smiths have more than they need. Mine it, smelt it into bars, and someone will pay you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Cultists in the caves around Durotar. They frighten off the miners, and I'll never forgive them that." } },
    _none = { { id = "tp_none", text = "I know rock, and I know what's in it. For anything else, ask someone who works above ground." } },
  },
}

-- Saru Steelfury: the blacksmithing trainer at the forges of the Valley of Honor.
P:NPC {
  key = "saru", id = TODO_NPC("Saru Steelfury"), name = "Saru Steelfury", title = "Blacksmithing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "proud", "diligent" },
  notices = { "wounds", "profession" },
  impression = {
    first = "Saru Steelfury teaches blacksmithing at the forges of the Valley of Honor and talks over the hammer without ever missing a stroke. To Saru, a weapon is only honest if the smith would carry it into battle.",
    third = "{name} met Saru Steelfury, the blacksmithing trainer at the forges of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the sparks; they don't care who you are." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my forge. Did that blade hold, or have you come to tell me otherwise?" },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Look at the state of that armour! Somebody's been hitting you and you've been letting them. Get it mended before you go back out." },
    { id = "n_smith", cat = "profession", when = { profession = { name = "Blacksmithing", min = 150 } },
      text = "Burn scars on the forearms. You've stood at a forge for more than a season, then, and I'll speak to you as a smith." },
  },

  start = "hello",
  nodes = {
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then you've seen their forges, and I envy you that much. Dark iron comes from the mountain's heart and takes a heat no orc forge can give it, so the dwarves down there make things I can only guess at from the broken pieces traders bring me. They make fine weapons for a wicked master, and that's always been the trouble with good steel." } },
      choices = {
        { text = "A smith should know whose hand will hold the blade.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Good steel should go to whoever has the coin, Saru.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Can an orc ever learn their craft?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Not easily, because the dwarves guard it like gold and the Thorium Brotherhood teaches only those it trusts. A few of their smiths have made some strange bargains down there, I'm told, and if I were younger I'd be tempted to make one of my own." } },
      choices = { { text = "I'll keep an eye out for their work, Saru.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd forge it honest, the same as for any grunt. The Silver Hand's hammers came down on my people in the camps, and I've hated the shape since, but a smith judges the arm swinging it. Swing it for the Horde and it's a good hammer." } },
      choices = {
        { text = "It will only ever swing for the Horde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hammer swings where its owner chooses.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Everyone in Durotar should carry something, because the scorpids don't ask what you are. I'll make you a mace that's honest about what it does, and you can decide for yourself whether you'd rather heal the wound or make it." } },
      choices = {
        { text = "I'd rather heal, but I'll carry it honestly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll make whatever wound the fight needs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That you hit hard and sharpen seldom, like every young warrior I've met. A blade is a promise between the smith and the one who carries it, so keep the edge clean and oil it after every fight, and it'll keep its end of the bargain when a Kolkar spear comes at your ribs." } },
      choices = {
        { text = "I'll care for my blade. It's earned that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "When it dulls, I'll buy another. Smiths need the work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than a hunter likes to admit, because arrowheads, skinning knives and the axe on your back all come from a forge like mine. A good skinning knife takes a hide off clean in one pull and a bad one tears it, and the leatherworkers will pay you for the difference." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't care for the forge noise, I see. Most beasts don't, though I had a boar once who'd sleep right beside the anvil." },
      },
      choices = {
        { text = "A clean skinning honours the kill. I'll buy the better knife.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A torn hide still sells. I'll keep my coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My teacher thought so, and he never lit a forge without a word to the flame first. I'm less sure, but I still do it, because the one morning I forgot, my best blade cracked in the quench and I never found another reason why." } },
      choices = {
        { text = "The old rites at the forge are worth keeping.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Good steel needs skill, not rituals.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I can forge a blade for anyone, but quiet is a smith's least favourite word, because a good blade rings. Show me your dagger and I'll tell you if it's honest, though I'll warn you I'm hard on daggers." },
      },
      choices = {
        { text = "An honest blade suits me. Let it ring.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honest blades get noticed. I want mine silent.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What makes a good weapon?", next = "weapon" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I forge for the Horde, and some of the Horde are warlocks, so yes, though I don't like it. I remember what the old Horde's smiths were asked to make for the warlocks' rites, and I'll never put my hammer to that kind of work again." },
      },
      choices = {
        { text = "Good. Honest steel, for honest work.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Steel is steel. Your scruples won't stop me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How did orcs learn to smith?", next = "history" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Any fighter who walks out of this city should carry something they'd trust their life to, and that goes for you too. Your claws are fine in the open, but you'll be on two legs when you're tired and cornered, and that's when a good mace earns its keep." } },
      choices = {
        { text = "I'll carry your mace and fight in the open, like a warrior.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use whatever wins, claws or steel or a knife in the back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A dagger, or a cap for your staff, and I'd make it honest, though you'll swing it less than you think. A weapon's only honest if the smith would carry it into battle, and I'd carry anything I made for you, so mind you do the same." },
      },
      choices = {
        { text = "I'll carry it with pride, Saru.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll sell it the moment I find a better wand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. I'd want to see your hammer before I trusted you, and I'd want to know who forged it, because that matters more than who you pray to." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the forges. You'll want a mace, then, because a priest who carries a blade is either a liar or a Forsaken, and I've met both." },
        { id = "h_default", key = true, text = "Saru Steelfury. I teach smithing at these forges, and everything the Grunts on the walls carry was hammered here. Do you want to learn, or have you only come to watch?" },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior at my forge! Good, because you'll understand why a blade's balance matters more than its shine. Learn to make your own, and you'll never have to trust a trader's." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at my forge! Good, because you'll want a weapon that can take a jolt of lightning, and most of what the traders sell will crack the first time you try." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at my forge, with claws you grew yourself. I'll not pretend I can make a better weapon than that, but I can make you a staff that won't split on a centaur's skull." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Let me see your blade, then, because I can tell a lot about a fighter by the nicks in the edge and how they've been kept." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll carry a knife for skinning and an axe for when the beast gets too close, so let me see that both are sharp enough to do their work." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at my forge! You'll want a blade you'll never swing, I suppose, but I'll teach you to forge one anyway." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths", faction = "Horde" }, text = "You've been through the Dark Iron halls under Blackrock and walked out again. I'd give a good deal to see what's on their anvils, because no smith alive works iron the way they do." },
      },
      again = { { id = "h_again", text = "What else? Speak up over the hammer." } },
      choices = {
        { text = "Should a priest carry a weapon at all, Saru?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the fire spirits help you at the forge?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Should a druid carry steel at all, Saru?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Teach me blacksmithing.", next = "BUSINESS" },
        { text = "What makes a good weapon?", next = "weapon" },
        { text = "How did orcs learn to smith?", next = "history" },
        { text = "What do you think of dwarven steel?", next = "dwarves" },
        { text = "Can you forge a blade that's quiet in the sheath?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does my blade tell you, Saru?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Does a hunter really need a smith, Saru?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you forge for warlocks, Saru?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What would a smith make for a mage, Saru?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you forge a hammer for a Forsaken paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I fought my way to Thaurissan's throne, Saru.", next = "xcl_brd", when = { cleared = "Blackrock Depths", faction = "Horde" } },
        { text = "Farewell, smith.", next = "END" },
      },
    },
    weapon = {
      lines = { { id = "w_default", text = "One the smith would carry himself. A blade made only to sell will break on the first good shield, and someone will die because a smith was lazy, so I don't make those, and I won't teach you to make them either." } },
      choices = {
        { text = "A smith's honour is in the steel.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some customers only want something cheap.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where do the cheap blades come from, then?", next = "weapon_cheap" },
      },
    },
    weapon_cheap = {
      lines = { { id = "wc_default", text = "From the goblin traders in the Drag, who'll sell anything to anyone. I'd rather lose a sale to them than see my mark on a broken blade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history = {
      lines = { { id = "h2_default", text = "We had forges on the old world long before we came here, and our axes were famous long before the humans learned to fear them. The camps took the craft from a whole generation, and we've spent the years since teaching it again." } },
      choices = {
        { text = "Who taught you?", next = "history_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_teacher = {
      lines = { { id = "ht_default", text = "An old smith who'd forged for the Horde before the camps, and who'd kept it all in his head through ten years of captivity. He made me forge the same nail a hundred times before he let me touch a blade." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "It's good, I'll admit, because the dwarves have been at it a long time and they have better mountains. But they fight like they smith, slow and stubborn, and I'll take an orc's axe in a quick fight every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Unless it's made of metal, I'm no use to you. Ask at the inn." } },
  },
}

-- Nogg: the goblin engineer of the Valley of Honor, who has a machine shop and a sales pitch.
P:NPC {
  key = "nogg", id = TODO_NPC("Nogg"), name = "Nogg", title = "Engineering Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "eager" }, values = { "ambitious", "curious" },
  notices = { "profession" },
  impression = {
    first = "Nogg runs a goblin machine shop in the middle of an orc city and treats engineering as a sound business plan with occasional explosions. He's cheerful about the risks, which is either reassuring or the opposite.",
    third = "{name} met Nogg, the goblin engineer who runs a machine shop in Orgrimmar's Valley of Honor.",
  },

  greetings = {
    { id = "g_hi", text = "Customer! Or student! Either way, don't touch the red one." },
    { id = "g_back", when = { metBefore = true }, text = "Still got all your fingers? Excellent, that means you're doing it right!" },
  },

  notice = {
    { id = "n_eng", cat = "profession", when = { profession = { name = "Engineering", min = 100 } },
      text = "Oh, look at those singed eyebrows! You're an engineer, all right, and a dedicated one." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Only from behind a very large crate, back when the humans ran this side of the world. Now they're on my side of the counter, dead and glowing and paying in silver, and frankly I think that's a great improvement." } },
      choices = {
        { text = "I'll pay fairly for honest goods, Nogg.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Give me a discount and I'll keep my opinions.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Need is a strong word, but it's good for business, isn't it? A student who knows a healer's standing by takes bigger risks, and bigger risks make better gadgets, so I'd call you an investment and pay you in spare parts." } },
      choices = {
        { text = "Safety first, Nogg. I'll heal them, but slow down.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them take the risks. I'll patch whatever's left.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a sapper charge opens a gate faster than any battering ram, pal, and a stick of dynamite in a crowd of quilboar does what ten axes can't. The orcs laughed at me for a year, and now the grunts on the walls ask for my bombs by name." } },
      choices = {
        { text = "A warrior fights face to face. Bombs are for cowards.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If dynamite wins the fight faster, I'll carry dynamite.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Your aim, no, but your gun, absolutely! A good scope and some proper black powder, and you'll put a shot through a harpy's wing from the far side of a canyon, though I'll admit the first few scopes I made were mostly decorative." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And that {pet} of yours could use some goggles, pal. Don't laugh; I've sold three pairs to hunters already, and only one of the beasts ate them." },
      },
      choices = {
        { text = "A true hunter relies on skill, not gadgets.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a gadget makes the kill sure, I'll buy it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Tried it twice, and I've still got most of my eyebrows to prove it. The orcs tell me the storm has a spirit and it doesn't like being put in a jar, and after the second time I'm inclined to agree with them." } },
      choices = {
        { text = "Leave the storm alone. Some things shouldn't be bottled.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you ever manage it, I want to see it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Depends on who's paying, pal! Magic's flashy, sure, but my gadgets don't need a nap after every fight, and when they blow up, at least they do it on purpose most of the time." },
      },
      choices = {
        { text = "Magic wins. Your gadgets explode too often.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair. A good machine is reliable.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Is engineering dangerous?", next = "danger" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Once, for a warlock who swore it was for his own safety, and the imp melted the lock in an afternoon. I don't build for demons anymore, pal, and not because of any scruples, but because they never pay for the damage." },
      },
      choices = {
        { text = "Demons are tools. They just need better cages.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Wise. Some things shouldn't be summoned at all.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What can an engineer make?", next = "make" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sure they can, as long as the wild doesn't mind the occasional explosion, and I'll admit it usually does. The tauren kept asking me to stop testing rockets out by the cactus fields, and I kept telling them it was for science, but I did move the test range." } },
      choices = {
        { text = "Good. Build what you like, but keep it out of the wild.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Progress always costs something. Test wherever you need to.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Explosives, mostly, and a rogue with a good charge can open any door in Kalimdor, or make a new one where there wasn't one before. I sell to whoever pays and I never ask about the door, because that's sound business." },
      },
      choices = {
        { text = "I'll use them on the Horde's enemies only.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What I blow open is my own business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Now there's a market I never thought to tap. Light-powered explosives, maybe? No? Pity. What can I sell you?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Excellent, because my last apprentice set his eyebrows on fire, and I'd like someone handy who can grow them back." },
        { id = "h_default", key = true, text = "Nogg, engineer and proprietor! I teach engineering to anyone with the coin and the nerve, and the orcs here have plenty of nerve. Want to learn how to make things that go boom on purpose?" },
        { id = "h_goblin", when = { race = "Goblin" }, text = "A fellow goblin! You know how it is: these orcs think a wrench is a club, but they pay on time, so I'm not complaining." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "Ah, a colleague! How are your bombs holding up? Not too stable, I hope, because a stable bomb is a boring bomb." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You call lightning out of the sky for free, and I spend a fortune on copper wire to do half as much, so we should talk business sometime." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I've always wanted to ask one of you how the shapeshifting works, because I tried it once with a stolen gnomish gadget and spent most of a day as a chicken." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You know what's better than a big axe? A big axe with a bomb on the end of it, and I've been working on that design for months." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Ever thought about a scope on that gun? I can make you hit a plainstrider from so far away it'll never know you were there." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! Don't touch anything on the bench, friend, because half of it explodes and the other half isn't paid for." },
      },
      again = { { id = "h_again", text = "Got another question? Ask quick; something's smoking in the back." } },
      choices = {
        { text = "Do your students really need a priest on hand, Nogg?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Have you ever tried to bottle lightning, Nogg?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Can your machines live alongside the wild, Nogg?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "Why does a goblin work in Orgrimmar?", next = "why" },
        { text = "Is engineering dangerous?", next = "danger" },
        { text = "What can an engineer make?", next = "make" },
        { text = "Your machines or my magic. Which wins, Nogg?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why should a warrior learn engineering, Nogg?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can you really improve my aim, Nogg?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Ever tried to build a cage for a demon, Nogg?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you make anything for rogues, Nogg?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Have you met paladins before, Nogg?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Nogg.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else here does what I do, and that's the best kind of market there is! The orcs need explosives for mining and guns for the wall, and they don't haggle, they just grunt and pay." } },
      choices = {
        { text = "Do the orcs trust you?", next = "why_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_trust = {
      lines = { { id = "wt_default", text = "They trust me exactly as much as they trust any goblin, which is to say not at all, but they need me. In my experience that's a much better arrangement than trust." } },
      choices = {
        { text = "I'd rather be trusted.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Being needed is safer.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Dangerous? It's only dangerous if you do it wrong, and you'll do it wrong a few times first. Keep a bandage handy and don't light anything near your face." } },
      choices = {
        { text = "Have you ever blown yourself up?", next = "danger_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_self = {
      lines = { { id = "ds_default", text = "Only twice, and once was a misunderstanding about which fuse was which. The shop's been rebuilt since then and it's better than ever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    make = {
      lines = { { id = "m_default", text = "Bombs, guns, scopes, goggles, and devices that may or may not work as designed! Go far enough and you'll choose between goblin and gnome methods, and I don't need to tell you which one I'd pick." } },
      choices = {
        { text = "Goblin methods, obviously.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll see what the gnomes offer first.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_steam", text = "Good people, rich people, and they'd want me to say I don't work for them. I don't, at least not officially." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if you find out what it's worth, let me know!" } },
  },
}

-- Xon'cha: the stable master, a Darkspear who tends the hunters' beasts.
P:NPC {
  key = "xoncha", id = TODO_NPC("Xon'cha"), name = "Xon'cha", title = "Stable Master",
  bible = "bibles/townsfolk.md", role = "stablemaster", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "kind", "patient" },
  notices = { "pet" },
  impression = {
    first = "Xon'cha keeps the stables for Orgrimmar's hunters and talks to the animals more than to their owners. The troll is unhurried and easy, and every beast in the pens seems to know the voice.",
    third = "{name} met Xon'cha, the troll stable master of Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Come, come. The beasts be calm today, so don't you be the one to change that." },
    { id = "g_back", when = { metBefore = true }, text = "Back for your beast, or leavin' it with me? Either be fine." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet} be lookin' well fed. Good. A hungry beast be a sulky beast, and a sulky beast be a bitey one." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They smell death and see Light, and those two don't sit together in nature. Trolls watch the dead careful, and so do I. But you speak soft, and I don't hear the Scourge in your voice, so maybe you be somethin' new." } },
      choices = {
        { text = "Something new, and I'll prove it good.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm what I am. They'll get used to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Of course they do, mon, the loa be beasts as much as anything. My grandmother say every animal got a spirit lookin' after it, and if you treat the beast bad, the spirit remember you long after the beast be gone." } },
      choices = {
        { text = "Then every beast deserves a priest's care too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is a beast. Spirits have better things to do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sometimes a warrior ride in on a wolf or a raptor and leave it with me while he go down into Ragefire, and I look after it like it be my own. The raptor always know when its rider come back hurt, mon, and it squawk at me like I be the one who did it." } },
      choices = {
        { text = "A good mount deserves good care. Thank you, Xon'cha.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A mount is a mount. Feed it and I'm satisfied.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than me, mon. A cat will stare all night at a corner of the stable where there be nothin' at all, and the old witch doctors say that be a spirit passin' through, so I leave a little water in that corner and the cat sleep fine." } },
      choices = {
        { text = "Small kindnesses to the spirits keep everything in balance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast spooked by nothing needs firmer handling.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quiet like a beast, maybe, but a beast don't steal, mon. The animals in my pens can smell a thief before he crosses the Drag, so if they start growling when you walk past, I'll know why." },
      },
      choices = {
        { text = "They won't growl at me. I'm no thief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll stay downwind of your pens.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Do you speak to the beasts?", next = "speak" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, mon, I won't, and don't you ask me twice. A demon in my stables would set every beast screaming, and the loa would laugh at me for being so foolish." },
      },
      choices = {
        { text = "Fair enough. It stays with me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your beasts should get used to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What's the strangest beast you've kept?", next = "strange" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some do, mon, and I let those ones run in the canyon whenever I can, because a beast that never runs forget what it be. The others be happy with a full trough and a voice in the morning, and I don't think less of them for it." } },
      choices = {
        { text = "A beast in good hands is cared for, and that's enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every beast belongs in the wild. The pens are only cages.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They fear the smell of it, mon, the burnt air after a fire spell and the cold after the frost. Talk to them softly and they'll forget it, because they forget faster than people do, and they forgive faster too." },
      },
      choices = {
        { text = "I'll talk softly to them, Xon'cha.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're beasts. They'll learn to cope.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one carryin' the Light. The beasts in my pens be nervous of you, mon, so speak soft and let them get used to you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest come to the stables, mon. The beasts be calm around you already, which tell me you got a quiet way about you." },
        { id = "h_default", key = true, text = "Xon'cha, and I keep the stables. You leave your beast with me and it be fed, brushed and talked to every day until you come back for it. Most hunters forget the talkin', but I don't." },
        { id = "h_troll", when = { race = "Troll" }, text = "Ah, a Darkspear! You come up from Sen'jin, or from further? Leave your beast here and I treat it like family." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, mon! The beasts in my pens feel you comin' before they see you, so walk slow and let them get a good look at you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, mon! The beasts in my pens know you be half one of them, so don't be surprised if they all want to say hello." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon, and no beast with you. That be fine, because I keep the beasts and you keep the fightin', and between us the Horde do alright." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, mon! The beasts don't like magic much, so be gentle when you walk past the pens." },
      },
      again = { { id = "h_again", text = "Somethin' else? The beasts don't mind waitin', but I do." } },
      choices = {
        { text = "Do you think the loa watch over beasts too, Xon'cha?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the beasts feel the spirits, Xon'cha?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the beasts here ever long for the wild, Xon'cha?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need the stables.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Do you speak to the beasts?", next = "speak" },
        { text = "What's the strangest beast you've kept?", next = "strange" },
        { text = "How did a troll end up in Orgrimmar?", next = "troll" },
        { text = "I'm quiet like a beast in the grass, Xon'cha.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do warriors ever leave their mounts with you, Xon'cha?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Could you stable my demon, Xon'cha?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the beasts fear mages, Xon'cha?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why are the beasts nervous of me, Xon'cha?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Xon'cha.", next = "END" },
      },
    },
    speak = {
      lines = { { id = "s_default", text = "Every day, and they speak back, in their way. A cat tells you with its tail, a bear tells you with its ears, and a wolf tells you everything with its whole body if you be watchin'." } },
      choices = {
        { text = "Beasts know more than we think.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast only knows what it's trained to.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A crab from the coast near Sen'jin, big as a shield, that a young hunter loved like a child. It snapped at every other beast and pinched me twice, but it let him scratch its shell, and I learned somethin' from that." } },
      choices = {
        { text = "What did you learn?", next = "strange_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_learn = {
      lines = { { id = "sl_default", text = "That a beast doesn't choose you for bein' strong or clever. It chooses you for comin' back, again and again, and that be the only trick there is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "t_default", text = "When Thrall saved the Darkspear and brought us to Durotar, Vol'jin say we go wherever the Horde go. Some of us stayed at Sen'jin and some of us came to the city, and the city needed someone who knew beasts." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
  },

  topics = {
    echo_isles = { { id = "tp_isles", text = "Home, mon, and not home right now. We get it back one day." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask the beasts, maybe; they know more than they say." } },
  },
}
