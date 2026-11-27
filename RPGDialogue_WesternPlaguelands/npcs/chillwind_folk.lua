-- Chillwind Camp's quiet hands (0.39.0): the Argent Dawn's quartermaster and the leather merchant.
-- Voice: bibles/westernplaguelands.md ("Chillwind Camp's quiet hands")
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_QUEST = P.TODO_QUEST
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "lightspark", id = TODO_NPC("Argent Quartermaster Lightspark"), name = "Argent Quartermaster Lightspark", title = "The Argent Dawn",
  bible = "bibles/westernplaguelands.md", role = "vendor", tier = "service",
  communities = { "chillwind_camp", "argent_dawn" }, temper = { "brisk" }, values = { "dutiful", "careful" },
  notices = { "race", "status", "lock_shards" },

  impression = {
    first = "His ledgers are tidier than most people keep their weapons.",
    third = "{name} met Argent Quartermaster Lightspark, who keeps the Argent Dawn's stores at Chillwind Camp.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Argent Dawn stores, Chillwind Camp. If the Dawn knows your name, I've something for you, and if it doesn't yet, I can tell you how to change that." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
      text = "Ah, a name I've written in the good column more than once! The Dawn is grateful, and so is its quartermaster." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome this far north, and in this muck! We're a long way from home, you and I, and we're the only two in camp who can reach the bottom shelf without a stool." },
    { id = "n_dawn", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered among the Dawn! I'll fetch you the good stock from the back, since you've more than earned it out there." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 20 } },
      text = "Twenty shards at the least, by the clink of it, and my pen hand is twitching to write them in the ledger. The Dawn doesn't take shards in trade, of course, so I'd only be counting them out of habit." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not in the slightest, for my ledger records names and deeds, not prayers, and it's never once asked whether someone kneels to the Light or to the earth. Some of the soldiers mutter, true, but they muttered about the Forsaken in the Dawn's ranks too, and they've mostly got over that." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Deeds should be all that matter. The Dawn has it right.", next = "BACK", reply = "It does, and I'm glad you see it, because the ledger's only as fair as the people who trust it. Bring me Scourgestones and the column will speak for you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Belief matters, Quartermaster. A ledger can't see a heart.", next = "BACK", reply = "It can't, no, and I've never pretended it could. But a heart is very hard to audit, {class}, and a tally is very easy.", fx = { align = { honor = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "With all who fight the Scourge, yes, but not with all who ask, for the stores are thin and the war is long. I'd give you anything on my shelves if I could, but I've got to keep something for tomorrow." } },
      choices = {
        { text = "Keep it for the ones who've earned it. That's fair.", next = "BACK", reply = "Fair is all I'm trying to be, and it's nice to hear it from someone on the other side of the counter. Thank you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give freely. Thrift won't matter if the Scourge wins.", next = "BACK", reply = "If the Scourge wins, there won't be anyone left to give to. I'll keep a little back for tomorrow, as I said.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whatever they've earned and nothing more, which is a rule I find very restful. Bring me Scourgestones and the Dawn's trust in you grows, and as it grows I'm allowed to sell you things that hit harder and hold longer." } },
      choices = {
        { text = "Earned trust is the only kind worth having. It's a fair rule.", next = "BACK", reply = "Exactly, and I'll show you the column whenever you like. It's very tidy.", fx = { align = { order = 1 } } },
        { text = "Ledgers in a war zone? Sell to whoever's still alive.", next = "BACK", reply = "And who'd decide who's still alive at the end of the week, {class}? The ledger keeps us honest, and honest keeps us fed.", fx = { align = { order = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because every scout in the Plaguelands shoots at shadows, and the shadows here are usually worth shooting. The fletchers are working day and night, but good feathers are hard to come by when half the birds are plagued." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because every scout in the Plaguelands shoots at shadows, and the shadows here are usually worth shooting. The fletchers are working day and night, but good feathers are hard to come by when half the birds are plagued. And I'll thank you to keep {pet} off the sacks of meal, {class}." },
      },
      choices = {
        { text = "I'll gather my arrows and keep an honest count of what I take.", next = "BACK", reply = "An honest count is all I ask, and you'd be astonished how rarely I get one. Thank you.", fx = { align = { honor = 1 } } },
        { text = "I'll take what I need off the dead and say nothing.", next = "BACK", reply = "Then the fletchers will work a little harder and the dead will be a little lighter. I'll pretend I didn't hear.", fx = { align = { honor = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some would like them to be, and some would rather forget the Silver Hand altogether, after how it ended. I don't take sides in that, because I keep the stores, and a plate of armour weighs the same whatever crest is painted on it." } },
      choices = {
        { text = "The Silver Hand's name should be carried with pride.", next = "BACK", reply = "Carried with care, I'd say, and with the memory of how it ended. I'll not argue either way, but I'll sell you the plate.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "New names for new times. The old order failed.", next = "BACK", reply = "Some would agree, and some would throw a shield at you for it. I keep the stores and stay out of the way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It welcomes anyone who'll stand against the Scourge, and that's the whole point of us. A priest of Stormwind and a Forsaken apothecary have both bought holy water from my shelves, and the Dawn doesn't ask which church they'd rather pray in." } },
      choices = {
        { text = "The Light should judge, not the Dawn. That's wise.", next = "BACK", reply = "It is, and it saves me a great many arguments at the counter. Holy water for anyone who fights.", fx = { align = { order = -1 } } },
        { text = "Faith should have rules. The Cathedral's order matters.", next = "BACK", reply = "The Cathedral can keep its order in Stormwind. Out here, the Scourge doesn't care who's ordained.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It serves everyone who fights the Scourge, and the ledger doesn't know an orc from a dwarf, only a name and a tally. Some of the soldiers here grumble about it, and I let them, because grumbling is cheaper than arguing, and the Scourge doesn't grumble about anything." } },
      choices = {
        { text = "One enemy, one ledger. The Dawn has it right.", next = "BACK", reply = "It does, and I'm very pleased to hear an orc or a dwarf say so. One ledger, one tally, one enemy.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The soldiers have a point. Old grudges run deep.", next = "BACK", reply = "They do, and I let them grumble, because grumbling is cheaper than fighting. The tally stays the same.", fx = { align = { honor = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Dawn trusts what you do, and it writes that down, and I'm the one holding the pen. If you bring in Scourgestones and fight where the Dawn fights, your tally goes up like anyone's, and no knight at Light's Hope can argue with a ledger, though some have certainly tried." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The Dawn trusts what you do, and it writes that down, and I'm the one holding the pen. I'll even note that {pet} stood politely by the counter, though I'd rather it stopped reading the ledger upside down, since no knight at Light's Hope can argue with a ledger and I'd hate for a demon to start." },
      },
      choices = {
        { text = "Then let my deeds speak, and your ledger record them.", next = "BACK", reply = "They will, and I'll write every word of it down. That's what the pen is for.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need the Dawn's trust. Only its goods.", next = "BACK", reply = "The goods come with the trust, and the trust comes with the tally. Bring me Scourgestones and we'll talk.", fx = { align = { light = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    dd_scourge = {
      lines = {
        { id = "dd_scourge_1",
          text = "Not by name, but we count the stones that come in, and we hear the scouts talk. A soldier who keeps the ghouls off the road is worth more to the Dawn than any noble's donation, and the Dawn remembers who did the work." },
      },
      choices = {
        { text = "Good. I want the Dawn to know my name.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I don't need counting. The dead need putting down.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_scourge", when = { killed = { name = { "Skeletal", "Ghoul", "Rotting", "Zombie" }, min = 60 } },
          text = "The scouts keep a tally of the dead that stay dead around Andorhal, and an uncommon share of it seems to be yours. The Dawn notices that sort of thing, and so does my ledger." },
        { id = "h_default", key = true,
          text = "Argent Quartermaster Lightspark, keeper of the Dawn's stores at Chillwind, with every crate counted to the last bolt. Everything on my shelves goes to those who've fought the Scourge alongside us, and the more the Dawn trusts you, the more I'm allowed to sell." },
        { id = "h_stranger", when = { reputation = { faction = "Argent Dawn", max = "neutral" } },
          text = "I'm afraid my shelves are closed to strangers, friend, though that's no insult. The Dawn sells only to people it knows, and it gets to know people by what they do against the Scourge." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, good, {class}, for I've a requisition here asking for frost-proof crates, and I've no idea what that means or who thought of it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Before you ask, {class}, everything on my shelves is counted twice, and the count is written in a ledger nobody but me can read. I find it saves time." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, and welcome, {class}. The Dawn takes its faith from the Cathedral and its funding from anyone kind enough to give it, and my ledgers know which is which." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! The Dawn has a great many knights who once wore the Silver Hand's tabard, and each of them counts their supplies as carefully as I do, or I make them." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. I keep a crate of whetstones under the counter for your sort, {class}, since nothing goes out of the Dawn's stores faster except bandages." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The Dawn's stores are short on arrows again, {class}, so bring your own, and gather them up afterwards if you can." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The Dawn's stores are open to any friend of the Dawn, and a druid who heals the land is about the best friend we could ask for." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at Chillwind! The Dawn's stores are open to you as to anyone who's earned them, {class}, though I'll ask you to keep your totems off my counter, as I've only just dusted it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "The Dawn will trade with you if you've earned it, {name}. I'll tell you plainly, though, that a few of the knights at Light's Hope have asked me what you keep in that satchel." },
      },
      again = {
        { id = "h_again", text = "What else can the Dawn's quartermaster do for you today? I've the whole inventory memorised, all four hundred and twelve lines of it." },
        { id = "h_again2", text = "Anything more? I've a crate of holy water to count before the light goes." },
      },
      choices = {
        { text = "Does the Dawn really count the Scourge I've killed?", next = "dd_scourge", when = { killed = { name = { "Skeletal", "Ghoul", "Rotting", "Zombie" }, min = 60 } } },
        { text = "Show me what the Dawn has to offer.", next = "BUSINESS" },
        { text = "How do I earn the Dawn's trust?", next = "trust" },
        { text = "I keep hearing of the Argent Dawn.", next = "dawn" },
        { text = "I doubt the Dawn's goods come cheap.", next = "price" },
        { text = "What does a mage get from the Dawn's quartermaster?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the Dawn trust rogues as far as paladins?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does the Dawn welcome priests of the Cathedral, Quartermaster?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Dawn's knights look like the Silver Hand by another name.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does the Dawn give the soldiers who fight for it?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why are the Dawn's stores short on arrows?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should the Dawn share its stores with all who ask?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the Dawn really serve the Horde as well, Quartermaster?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "I doubt the Dawn really trusts my sort, Quartermaster.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does the Dawn care what a dwarf shaman believes, Quartermaster?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Dawn trusts what you do, not what you are, and I keep the ledger that proves it. A rogue who stands against the Scourge earns the same standing as a paladin who does the same, and I've seen no reason to think otherwise." } },
      choices = {
        { text = "Deeds over titles. I'll earn my place.", next = "BACK", reply = "Good. The ledger can't tell a rogue from a knight, and I like it that way.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Order needs ranks. Paladins should lead.", next = "BACK", reply = "Some knights would agree with you, and they're welcome to lead from the front. My column doesn't care either way.", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Whatever the Dawn decides you've earned and not a copper more, for I don't make the rules, I only write them down. Keep fighting at Andorhal and Caer Darrow, and you'll find my shelves get more interesting." } },
      choices = {
        { text = "Fair rules, fairly kept. I respect that.", next = "BACK", reply = "Thank you. Fairness is the one thing I can keep in stock no matter how thin the shelves get.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules like that keep good fighters ill-equipped.", next = "BACK", reply = "Perhaps, but the alternative is no rules at all, and then the shelves empty in a week. Fight on, and the shelves will open up.", fx = { align = { order = -1 } } },
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
        { text = "That's how it should be. Everyone against the Scourge.", next = "BACK", reply = "It is, and it's the only way we'll win. Light's Hope welcomes anyone who means it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner fight beside my own people.", next = "BACK", reply = "Then fight beside them, and fight the Scourge while you do it. The Dawn won't mind which side of the line you stand on.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    price = {
      lines = { { id = "p_default", text = "Nothing out here is cheap, friend, but the coin goes back into the fight, into bandages and blessed water and arrows. I keep every copper written down, so you'll know it wasn't wasted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I count crates for the Dawn. Before that I counted gears and pressure readings in Gnomeregan, until there was nothing left down there worth counting, and I find this a much better use of my arithmetic." } },
    advice = { { id = "tp_ad", text = "Always carry more bandages than you think, because the plague doesn't care how brave you are." } },
    argent_dawn = { { id = "tp_dawn", text = "The Dawn is everyone who's decided the Scourge matters more than old grudges, and I write all their names down." } },
    scourge = { { id = "tp_scourge", text = "The Scourge eats supplies faster than any army I've ever stocked, because every battle costs us bandages, blades and soldiers, and it costs them nothing. I keep the ledgers straight so at least we know what we've lost." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad's necropolis floats over the east, and the Dawn keeps a careful eye on it. I keep a careful eye on the scourgestones, which is a smaller job, but somebody has to do it." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is where the Dawn will need the most supplies when we finally move on it. I'm stocking for that day already, and the sooner it comes, the happier my ledger will be." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken trade with the Dawn the same as anyone, and they're careful about their accounts. I respect that in a customer, dead or alive." } },
    _none = { { id = "tp_none", text = "That's not in any of my ledgers, I'm afraid, and I've cross-referenced all six of them, so I can't help you." } },
  },
}

P:NPC {
  key = "leonard_porter", id = TODO_NPC("Leonard Porter"), name = "Leonard Porter", title = "Leatherworking Supplies",
  bible = "bibles/westernplaguelands.md", role = "vendor", tier = "service",
  communities = { "chillwind_camp" }, temper = { "dour" }, values = { "craft", "careful" },
  notices = { "craft", "lock_armor" },

  impression = {
    first = "He inspects every hide brought to him for plague.",
    third = "{name} met Leonard Porter, who sells leatherworking supplies at Chillwind Camp.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_default", text = "Thread, dye and salt for curing, and a few patterns besides. Whatever you skinned out there, show me before you sell it to anyone." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You've got a tanner's hands, friend, all stained to the wrist. Tell me you didn't touch anything that was already dead before you killed it." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That isn't leather on your shoulders, and I know leather. Whatever beast that ward was skinned from never walked on this earth, and I'll not be asked to stitch it when it tears." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because I've been working hides for twenty years and never gave it a second thought, until the wolves around here started getting up again after they'd died. If a shaman can tell the clean ones from the tainted, I'd sleep better, and so would my customers." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Every beast deserves thanks for its hide, Porter.", next = "BACK", reply = "That's what my old master used to say, and I'd forgotten it until now. Thank you, {class}.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hide's a hide. Skin it and sell it.", next = "BACK", reply = "It was, before Andorhal. Now I want to know what it was first, and whether it'll stay dead.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every plate you wear hangs off a leather strap somewhere, and soldiers forget it until one snaps in the middle of a fight. I saw a fellow lose his breastplate on Sorrow Hill, and he only lived because the skeletons were as surprised as he was." } },
      choices = {
        { text = "I'll check my straps every night. Good advice, Leonard.", next = "BACK", reply = "Good. I mended a knight's plate last month after a strap gave way mid-swing, and he was lucky to keep the arm.", fx = { align = { order = 1 } } },
        { text = "If a strap snaps, I'll fight on without the plate.", next = "BACK", reply = "Brave, and you'll be lighter on your feet, but I'd still rather mend the strap. Check it anyway.", fx = { align = { order = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up in the hills toward Alterac, where the wind carries the cauldron stink the other way. There are fewer of them every season, mind, and the ones that come down to the farms have usually caught mange or worse." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Up in the hills toward Alterac, where the wind carries the cauldron stink the other way. There are fewer of them every season, mind, and the ones that come down to the farms have usually caught mange or worse. That's a fine coat on {pet}, {class}, and I'm a leatherworker, so I'll say that once and never again." },
      },
      choices = {
        { text = "Then I'll leave the last clean packs alone to breed.", next = "BACK", reply = "That's a hunter with sense. There'll be pelts next year, if we're careful.", fx = { align = { light = 1 } } },
        { text = "Clean pelts fetch the best price. I'll take them while they last.", next = "BACK", reply = "They do, and I'll buy them, but leave a few for next season, eh? There won't be any left otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Saddles and sword belts, every year before the plague, and they paid on the nail and never haggled, which I can't say for this lot. I made Uther a belt once, and I don't know where it lies now, but I hope it's with him." } },
      choices = {
        { text = "He'd want it on a knight still fighting, not in a grave.", next = "BACK", reply = "He might, at that, and I'd be proud to see it. Find me a knight still worth it.", fx = { align = { honor = -1 } } },
        { text = "Then it's where it belongs, with an honoured man.", next = "BACK", reply = "It is, and I'll rest easier thinking so. He wore it well.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "One of the chaplains tried, and it did some good, I'll grant him, but I still wouldn't make boots out of it. I burn what's tainted and say a word over the smoke, which is the closest I come to praying these days." } },
      choices = {
        { text = "Prayer and fire together. That's the right way here.", next = "BACK", reply = "It is, and I'm glad a priest agrees. The smoke goes up either way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn it all and save the prayers for people.", next = "BACK", reply = "Fair enough, and practical. I'll keep saying my word anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Frost kills what the plague leaves in the hair, if it's cold enough and quick enough, and I can't afford to lose a whole bundle because one pelt came off a sick wolf. Salt does most of the work, but it's slow and soldiers are impatient, so a mage with steady hands would save me a week of scraping." } },
      choices = {
        { text = "Bring me the hides. I'll freeze them properly.", next = "BACK", reply = "Bless you, {class}, that'll save half my bundle. Bring them round the back and mind the salt.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the doubtful ones. Fire's surer than frost.", next = "BACK", reply = "Fire's surer, aye, but it's dearer too. I'll burn the worst and freeze the rest.", fx = { align = { order = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    dd_wildlife = {
      lines = {
        { id = "dd_wildlife_1",
          text = "So I heard, and a hunter came through yesterday and said the hills past the Haunt are quieter than they've been in a year. It's a grim mercy, but it's mercy all the same, and that dwarf hasn't long to see it." },
        { id = "dd_wildlife_2",
          text = "Did you skin any of them? Please tell me you didn't, because those hides are poison right through, and I've burned enough of them to know." },
      },
      choices = {
        { text = "I burned them. I'm not a fool.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I sold a few hides. Somebody downwind can worry about it.", next = "BACK", fx = { align = { order = -1, light = -1 } } },
        { text = "Something else, Leonard.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_wildlife", when = { questDone = TODO_QUEST("The Wildlife Suffers Too") },
          text = "I hear you put down the sick wolves for that dwarf out at the Writhing Haunt. Fewer plagued beasts on the hills means fewer plagued hides at my table, so you've my thanks, for what a tanner's thanks are worth." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarven one even! Tell me, {class}, do the beasts out here still have spirits, or has the plague taken those too?" },
        { id = "h_default", key = true,
          text = "Leonard Porter, leatherworking supplies. The soldiers here go through boots and jerkins faster than you'd believe, so I keep the tanners in thread and salt, and I keep a careful eye on what they bring me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Some hides make poor leather, {name}, and I can smell where yours have been, so don't ask. Keep whatever follows you away from my drying racks." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll want soft leather for quiet boots, {class}, and I can tell by your walk you already know how to use them. Just don't bring me plagued hides." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! If you're heading into the fields, {class}, you'll want gloves, because a plagued hide can sicken you through a cut finger before you ever know it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I'll have a look at those gauntlet straps if you like, because the damp up here rots good leather faster than the ghouls do." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Your armour straps are near worn through, {class}, and a strap that breaks at the wrong moment will kill you quicker than any ghoul." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, good, for you'll know a clean pelt when you skin one, {class}, and the soldiers who bring me hides mostly hack them to rags." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll not be needing leather, I expect, {class}, but if you can freeze a hide without cracking it, I've a few soldiers who'd thank you for their boots." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've hides soaking, and they won't wait long." },
        { id = "h_again2", text = "Go on, then. I'm listening, and I'm still working." },
      },
      choices = {
        { text = "I put down the sick wolves for Mulgris.", next = "dd_wildlife", when = { questDone = TODO_QUEST("The Wildlife Suffers Too") } },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why check every hide so closely?", next = "plague" },
        { text = "There can't be much worth skinning around here.", next = "hides" },
        { text = "Does a druid's fur bother you?", next = "druid", when = { class = "DRUID" } },
        { text = "Why are you so sure I'd ask?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Telling a plagued hide from a clean one must be hard.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can the Light cleanse a plagued hide, Leonard?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did the Silver Hand ever buy leather from you?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Leather can't matter much to a warrior in plate.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the clean wolves still run, Leonard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why would anyone freeze a hide, Leonard?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do you ask about the beasts' spirits, Porter?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "By the smell, mostly, and by the way the fur comes away in the hand. Anything from near Andorhal I burn without asking, for I'd rather lose a sale than lose a soldier to a pair of boots." } },
      choices = {
        { text = "Better a lost sale than a lost life. Agreed.", next = "BACK", reply = "Agreed, and I'm glad to hear it. Most folk only care about the price.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hide's a hide. Soldiers can't be choosy.", next = "BACK", reply = "They can't, but they can live through the week, and that's what I'm for. I'll keep burning the doubtful ones.", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because someone always does, usually a soldier who's been out too long. I'll tan anything that walked on this earth, but not a thing that came through a crack in the sky, and I'll thank whatever you keep at heel to remember it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because someone always does, and with that thing standing at your heel I half expect it to ask on your behalf. I'll tan anything that walked on this earth, but not a thing that came through a crack in the sky, so tell your demon to stop eyeing my hides." },
      },
      choices = {
        { text = "Fair rule. Nothing from beyond belongs on your racks.", next = "BACK", reply = "Thank you. My racks have enough trouble as it is.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leather from beyond the sky would be the toughest there is.", next = "BACK", reply = "It might, and it might bite you in the night as well. I'll stick to wolves.", fx = { align = { light = -1 } } },
        { text = "Let's change the subject.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "p_default", text = "Because the plague lives in flesh, and I won't be the man who stitches it into a soldier's collar. Anything that came off a Scourge beast gets burned, and I don't care how pretty the fur is." } },
      choices = {
        { text = "I'd not have thought plague could pass through leather.", next = "plague_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague_how = {
      lines = { { id = "ph_default", text = "I don't know for certain, and I don't mean to find out. Nobody believed plague could ride in a sack of grain, either, until Andorhal, so I salt everything twice and burn what smells wrong." } },
      choices = {
        { text = "Better too careful than sorry.", next = "BACK", reply = "That's my motto, near enough. Better twice-salted than dead.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're wasting good hides on a guess.", next = "BACK", reply = "A guess, yes, but Andorhal was a guess until it wasn't. I'll keep wasting them.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Not much, since the land's sick and so's everything on it. Bring me a clean wolf or a bear from the edges of the forest, but leave the plaguebats and the rotting hounds alone." },
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
    scourge = { { id = "tp_scourge", text = "The Scourge has plagued most of the beasts in these lands, and their hides are worthless or worse. I check each one that comes to me, and I burn more than I keep." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron had the finest leather in the north, from the cattle of the Eastweald and the deer of the Alterac foothills. Now I'm lucky to find a hide that doesn't rot in my hands." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was the great market town of the north, and every tanner worth his salt sold there. I'd never set foot in it now." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. I know leather, and that's about where it ends." } },
  },
}
