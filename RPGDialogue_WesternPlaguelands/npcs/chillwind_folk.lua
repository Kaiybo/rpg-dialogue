-- Chillwind Camp's quiet hands (0.39.0): the Argent Dawn's quartermaster and the leather merchant.
-- Voice: bibles/westernplaguelands.md ("Chillwind Camp's quiet hands")
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "lightspark", id = TODO_NPC("Argent Quartermaster Lightspark"), name = "Argent Quartermaster Lightspark", title = "The Argent Dawn",
  bible = "bibles/westernplaguelands.md", role = "vendor", tier = "service",
  communities = { "chillwind_camp", "argent_dawn" }, temper = { "brisk" }, values = { "dutiful", "careful" },
  notices = { "race", "status" },

  impression = {
    first = "Argent Quartermaster Lightspark keeps the Argent Dawn's stores at Chillwind Camp and keeps his ledgers tidier than most people keep their weapons. He sells only to those the Dawn has learned to trust, and he says so plainly.",
    third = "{name} met Argent Quartermaster Lightspark, who keeps the Argent Dawn's stores at Chillwind Camp.",
  },

  greetings = {
    { id = "g_default", text = "Argent Dawn stores, Chillwind Camp. If the Dawn knows your name, I've something for you, and if it doesn't yet, I can tell you how to change that." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
      text = "Ah, a name I've written in the good column more than once! The Dawn is grateful, and so is its quartermaster." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome this far north, and in this muck! We're a long way from home, you and I, and we're the only two in camp who can reach the bottom shelf without a stool." },
    { id = "n_dawn", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered among the Dawn! I'll fetch you the good stock from the back, since you've more than earned it out there." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "With all who fight the Scourge, yes, but not with all who ask, for the stores are thin and the war is long. I'd give you anything on my shelves if I could, but I've got to keep something for tomorrow." } },
      choices = {
        { text = "Keep it for the ones who've earned it. That's fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give freely. Thrift won't matter if the Scourge wins.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whatever they've earned and nothing more, which is a rule I find very restful. Bring me Scourgestones and the Dawn's trust in you grows, and as it grows I'm allowed to sell you things that hit harder and hold longer." } },
      choices = {
        { text = "Earned trust is the only kind worth having. It's a fair rule.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ledgers in a war zone? Sell to whoever's still alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because every scout in the Plaguelands shoots at shadows, and the shadows here are usually worth shooting. The fletchers are working day and night, but good feathers are hard to come by when half the birds are plagued." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And I'll thank you to keep {pet} off the sacks of meal, {class}. They're entered in the ledger as feed for soldiers, and I'd hate to rewrite the ledger." },
      },
      choices = {
        { text = "I'll gather my arrows and keep an honest count of what I take.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take what I need off the dead and say nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some would like them to be, and some would rather forget the Silver Hand altogether, after how it ended. I don't take sides in that, because I keep the stores, and a plate of armour weighs the same whatever crest is painted on it." } },
      choices = {
        { text = "The Silver Hand's name should be carried with pride.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "New names for new times. The old order failed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It welcomes anyone who'll stand against the Scourge, and that's the whole point of us. A priest of Stormwind and a Forsaken apothecary have both bought holy water from my shelves, and the Dawn doesn't ask which church they'd rather pray in." } },
      choices = {
        { text = "The Light should judge, not the Dawn. That's wise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Faith should have rules. The Cathedral's order matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It serves everyone who fights the Scourge, and the ledger doesn't know an orc from a dwarf, only a name and a tally. Some of the soldiers here grumble about it, and I let them, because grumbling is cheaper than arguing, and the Scourge doesn't grumble about anything." } },
      choices = {
        { text = "One enemy, one ledger. The Dawn has it right.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The soldiers have a point. Old grudges run deep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Dawn trusts what you do, and it writes that down, and I'm the one holding the pen. If you bring in Scourgestones and fight where the Dawn fights, your tally goes up like anyone's, and no knight at Light's Hope can argue with a ledger, though some have certainly tried." } },
      choices = {
        { text = "Then let my deeds speak, and your ledger record them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need the Dawn's trust, only its goods.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Argent Quartermaster Lightspark, keeper of the Dawn's stores at Chillwind. Everything on my shelves goes to those who've fought the Scourge alongside us, and the more the Dawn trusts you, the more I'm allowed to sell." },
        { id = "h_stranger", when = { reputation = { faction = "Argent Dawn", max = "neutral" } },
          text = "I'm afraid my shelves are closed to strangers, friend, though that's no insult. The Dawn sells only to people it knows, and it gets to know people by what they do against the Scourge." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, good, {class}, for I've a requisition here asking for frost-proof crates, and I've no idea what that means or who thought of it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Before you ask, {class}, everything on my shelves is counted twice, and the count is written in a ledger nobody but me can read. I find it saves time." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, and welcome, {class}. The Dawn takes its faith from the Cathedral and its funding from anyone kind enough to give it, and my ledgers know which is which." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! The Dawn has a great many knights who once wore the Silver Hand's tabard, and every one of them counts their supplies as carefully as I do, or I make them." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. I keep a crate of whetstones under the counter for your sort, {class}, since nothing goes out of the Dawn's stores faster except bandages." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The Dawn's stores are short on arrows again, {class}, so bring your own, and gather them up afterwards if you can." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The Dawn's stores are open to any friend of the Dawn, and a druid who heals the land is a very good friend indeed." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at Chillwind! The Dawn's stores are open to you as to anyone who's earned them, {class}, though I'll ask you to keep your totems off my counter, as I've only just dusted it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The Dawn will trade with you, {class}, if you've earned it, though I'll tell you plainly that a few of the knights at Light's Hope would rather it didn't." },
      },
      again = {
        { id = "h_again", text = "What else can the Dawn's quartermaster do for you today?" },
        { id = "h_again2", text = "Anything more? I've a crate of holy water to count before the light goes." },
      },
      choices = {
        { text = "Show me what the Dawn has to offer.", next = "BUSINESS" },
        { text = "How do I earn the Dawn's trust?", next = "trust" },
        { text = "What exactly is the Argent Dawn?", next = "dawn" },
        { text = "Do the Dawn's goods come cheap?", next = "price" },
        { text = "What does a mage get from the Dawn's quartermaster?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the Dawn trust rogues as far as paladins?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does the Dawn welcome priests of the Cathedral, Quartermaster?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are the Dawn's knights the Silver Hand by another name?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does the Dawn give the soldiers who fight for it?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why are the Dawn's stores short on arrows?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should the Dawn share its stores with all who ask?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the Dawn truly serve the Horde as well, Quartermaster?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the Dawn really trust warlocks, Quartermaster?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Dawn trusts what you do, not what you are, and I keep the ledger that proves it. A rogue who stands against the Scourge earns the same standing as a paladin who does the same, and I've seen no reason to think otherwise." } },
      choices = {
        { text = "Deeds over titles. I'll earn my place.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Order needs ranks. Paladins should lead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Whatever the Dawn decides you've earned and not a copper more, for I don't make the rules, I only write them down. Keep fighting at Andorhal and Caer Darrow, and you'll find my shelves get more interesting." } },
      choices = {
        { text = "Fair rules, fairly kept. I respect that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules like that keep good fighters ill-equipped.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Understood. Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Kill the Scourge, and bring proof of it. Scourgestones come off the dead that walk, and the Dawn's officers count them; Officer Pureheart here in camp will take them, and the Dawn remembers every one." } },
      choices = {
        { text = "What's a scourgestone?", next = "trust_stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_stones = {
      lines = { { id = "ts_default", text = "A little shard of the necromancy that holds them together, left behind when they fall. Carry the Dawn's commission and you'll find them; without it, you'll walk right past them, and I can't tell you why." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    dawn = {
      lines = { { id = "d_default", text = "Folk who'll fight the Scourge without caring what race or kingdom stands beside them. Lord Tyrosus leads us from Light's Hope Chapel, out east, and nobody asks your colours at the door." },
        { id = "d_scourge", when = { race = "Scourge" }, text = "Folk who'll fight the Scourge beside anyone willing, even the dead who've slipped their chains, like you. Lord Tyrosus leads us from Light's Hope Chapel, and he's not the sort to turn away help." } },
      choices = {
        { text = "That's how it should be. Everyone against the Scourge.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner fight beside my own people.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    price = {
      lines = { { id = "p_default", text = "Nothing out here is cheap, friend, but the coin goes back into the fight, into bandages and blessed water and arrows. I keep every copper written down, so you'll know it wasn't wasted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I count crates for the Dawn. Before that I counted other things, and I find this a much better use of my arithmetic." } },
    advice = { { id = "tp_ad", text = "Always carry more bandages than you think, because the plague doesn't care how brave you are." } },
    argent_dawn = { { id = "tp_dawn", text = "The Dawn is everyone who's decided the Scourge matters more than old grudges, and I write all their names down." } },
    _none = { { id = "tp_none", text = "That's not in any of my ledgers, I'm afraid, so I can't help you." } },
  },
}

P:NPC {
  key = "leonard_porter", id = TODO_NPC("Leonard Porter"), name = "Leonard Porter", title = "Leatherworking Supplies",
  bible = "bibles/westernplaguelands.md", role = "vendor", tier = "service",
  communities = { "chillwind_camp" }, temper = { "dour" }, values = { "craft", "careful" },
  notices = { "craft" },

  impression = {
    first = "Leonard Porter sells leatherworking supplies at Chillwind Camp and inspects every hide brought to him for plague. He has strong opinions about which animals in these lands are still worth skinning.",
    third = "{name} met Leonard Porter, who sells leatherworking supplies at Chillwind Camp.",
  },

  greetings = {
    { id = "g_default", text = "Thread, dye and salt for curing, and a few patterns besides. Whatever you skinned out there, show me before you sell it to anyone." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You've got a tanner's hands, friend, all stained to the wrist. Tell me you didn't touch anything that was already dead before you killed it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every plate you wear hangs off a leather strap somewhere, and soldiers forget it until one snaps in the middle of a fight. I saw a fellow lose his breastplate on Sorrow Hill, and he only lived because the skeletons were as surprised as he was." } },
      choices = {
        { text = "I'll check my straps every night. Good advice, Leonard.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a strap snaps, I'll fight on without the plate.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up in the hills toward Alterac, where the wind carries the cauldron stink the other way. There are fewer of them every season, mind, and the ones that come down to the farms have usually caught something." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's a fine coat on {pet}, {class}, and I'm a leatherworker, so I'll say that once and never again. Keep it away from the Felstone wolves, for their sickness gets into the fur first." },
      },
      choices = {
        { text = "Then I'll leave the last clean packs alone to breed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Clean pelts fetch the best price. I'll take them while they last.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Saddles and sword belts, every year before the plague, and they paid on the nail and never haggled, which I can't say for this lot. I made Uther a belt once, and I don't know where it lies now, but I hope it's with him." } },
      choices = {
        { text = "He'd want it on a knight still fighting, not in a grave.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then it's where it belongs, with an honoured man.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "One of the chaplains tried, and it did some good, I'll grant him, but I still wouldn't make boots out of it. I burn what's tainted and say a word over the smoke, which is the closest I come to praying these days." } },
      choices = {
        { text = "Prayer and fire together. That's the right way here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn it all and save the prayers for people.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Frost kills what the plague leaves in the hair, if it's cold enough and quick enough, and I can't afford to lose a whole bundle because one pelt came off a sick wolf. The salt does most of the work, but salt is slow and the soldiers are impatient, so a mage with steady hands would save me a week of scraping." } },
      choices = {
        { text = "Bring me the hides. I'll freeze them properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the doubtful ones. Fire's surer than frost.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Leonard Porter, leatherworking supplies. The soldiers here go through boots and jerkins faster than you'd believe, so I keep the tanners in thread and salt, and I keep a careful eye on what they bring me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Felhunter hides make poor leather, {class}, so don't ask, and keep that thing away from my drying racks." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll want soft leather for quiet boots, {class}, and I can tell by your walk you already know how to use them. Just don't bring me plagued hides." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! If you're heading into the fields, {class}, you'll want gloves, because a plagued hide can sicken you through a cut finger before you ever know it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I'll have a look at those gauntlet straps if you like, because the damp up here rots good leather faster than the ghouls do." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Your armour straps are near worn through, {class}, and a strap that breaks at the wrong moment will kill you quicker than any ghoul." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, good, for you'll know a clean pelt when you skin one, {class}, which is more than I can say for most of the soldiers who bring me hides." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll not be needing leather, I expect, {class}, but if you can freeze a hide without cracking it, I've a few soldiers who'd thank you for their boots." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've hides soaking, and they won't wait long." },
        { id = "h_again2", text = "Go on, then. I'm listening, and I'm still working." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why check every hide so closely?", next = "plague" },
        { text = "What's worth skinning around here?", next = "hides" },
        { text = "Does a druid's fur bother you?", next = "druid", when = { class = "DRUID" } },
        { text = "Why are you so sure I'd ask?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can you tell a plagued hide from a clean one?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can the Light cleanse a plagued hide, Leonard?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did the Silver Hand ever buy leather from you?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does leather really matter to a warrior in plate?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the clean wolves still run, Leonard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why would anyone freeze a hide, Leonard?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "By the smell, mostly, and by the way the fur comes away in the hand. Anything from near Andorhal I burn without asking, for I'd rather lose a sale than lose a soldier to a pair of boots." } },
      choices = {
        { text = "Better a lost sale than a lost life. Agreed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hide's a hide. Soldiers can't be choosy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because someone always does, usually a soldier who's been out too long. I'll tan anything that walked honestly on this earth, but not a thing that came through a crack in the sky, and I'll thank your demon to remember it." } },
      choices = {
        { text = "Fair rule. Demons don't belong on your racks.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Demon leather would be the toughest there is.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's change the subject.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "p_default", text = "Because the plague lives in flesh, and I won't be the man who stitches it into a soldier's collar. Anything that came off a Scourge beast gets burned, and I don't care how pretty the fur is." } },
      choices = {
        { text = "Can the plague really pass through leather?", next = "plague_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague_how = {
      lines = { { id = "ph_default", text = "I don't know for certain, and I don't mean to find out. Nobody believed plague could ride in a sack of grain, either, until Andorhal, so I salt everything twice and burn what smells wrong." } },
      choices = {
        { text = "Better too careful than sorry.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're wasting good hides on a guess.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Not much, honestly, since the land's sick and so's everything on it. Bring me a clean wolf or a bear from the edges of the forest, but leave the plaguebats and the rotting hounds alone." },
        { id = "hi_hunter", when = { class = "HUNTER" }, text = "You'll know a clean animal from a sick one better than most, being a hunter. Bring me wolves and bears from the forest's edge, and leave anything that walks wrong where it fell." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Not while you're standing on two legs and paying for thread. I'll admit I'd think twice about the bear, but I'm a merchant, not a fool, and I know what a druid is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a tanner who came north because the soldiers needed boots. That's the whole of it, and it's enough." } },
    advice = { { id = "tp_ad", text = "If a hide smells sweet, burn it, because nothing out here should smell sweet." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. I know leather, and that's about where it ends." } },
  },
}
