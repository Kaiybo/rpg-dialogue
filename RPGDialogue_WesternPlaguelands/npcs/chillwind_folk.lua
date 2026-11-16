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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Leonard Porter, leatherworking supplies. The soldiers here go through boots and jerkins faster than you'd believe, so I keep the tanners in thread and salt, and I keep a careful eye on what they bring me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Felhunter hides make poor leather, {class}, so don't ask, and keep that thing away from my drying racks." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll want soft leather for quiet boots, {class}, and I can tell by your walk you already know how to use them. Just don't bring me plagued hides." },
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
