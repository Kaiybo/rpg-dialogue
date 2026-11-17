-- Canal-side tradesfolk with no quests: the Cordells' enchanting shop, Catherine Leland's
-- fishing stall and the Canal Tailor and Fit Shop's clothier. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Lucan Cordell: the city's foremost enchanter; supplies the Mage Quarter since Dalaran fell.
P:NPC {
  key = "lucan_cordell", id = TODO_NPC("Lucan Cordell"), name = "Lucan Cordell", title = "Expert Enchanter",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "measured" }, values = { "craft", "arcane" },
  notices = { "craft", "arcane" },
  impression = {
    first = "Lucan Cordell is the enchanter the rest of Stormwind's merchants name when they talk about where their good wares come from. He spoke slowly and chose his words like reagents, and he expected the same care from a student.",
    third = "{name} met Lucan Cordell, the foremost enchanter in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Welcome. If you have what it takes, I'll gladly show you the way." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hope your rods have been keeping their charge." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" }, place = "before",
      text = "There's strange dust in the creases of your pack, which tells me you've been taking things apart. Good; every enchanter begins by unmaking." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" }, place = "before",
      text = "A mage, and you'll think enchanting is beneath you, because your spells fade and mine last. Stay a while, and you may change your mind." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They might, but I'd not trust it. Arcane enchantment is precise; spirits are moods. Still, I'd be curious." } },
      choices = {
        { text = "Precision and patience make the best work. I'll learn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Moods can be powerful too. Don't scorn them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "An enchanted blade bites deeper and a crusader's edge holds longer, and I'll put either on any weapon a paying customer brings me. I will not, however, enchant lockpicks, though I've been asked more times than you'd believe, because an enchanter who helps open other people's doors soon finds his own door kicked in." },
      },
      choices = {
        { text = "Fair. Enchant my blade, and leave the picks alone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every lock in the city would open for an enchanted pick.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lucan.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Used carefully, I believe it can, but the word carefully has done a great deal of work in history and failed most of it. I put a little of myself into every enchantment, and I watch for the day it asks for more." } },
      choices = {
        { text = "Bind it with strict rules and watch it closely, and keep working.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No rule tamed it for my people. Put it down before it's too late.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Dalaran shut its gates and the Alliance still needed its blades enchanted, and somebody had to keep the old methods alive. I wasn't the best student in my year, but I was the one who stayed in Stormwind." } },
      choices = {
        { text = "Someone has to keep the old ways going. Good for you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The old masters are gone. Make new methods.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They twist them, which is worse, because a twisted enchantment looks perfectly sound until the day it fails. I once had a warlock's cloak come back to me burning green at the hem, and I've kept the scorch mark on my bench as a warning." } },
      choices = {
        { text = "I'll keep my demon away from your bench, Lucan.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A little green flame never hurt anyone worth worrying about.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A plain one, honestly, a little more strength or a little more stamina, rather than fire that runs down the blade. The old masters of Dalaran used to say that an enchantment should help the hand, not show off for it." } },
      choices = {
        { text = "Then a plain enchantment, honestly made, is what I'll take.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I want the fire down the blade. Let them see it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A bow, yes, with patience, and a rifle's scope, if a gnome will mount it for me afterwards. Since Dalaran fell, much of the old craft has been lost, and I'm still learning which of the bow runes survived." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps sniffing at the dust on the bench; please don't let it, because arcane dust tastes worse than you'd think, I'm told." },
      },
      choices = {
        { text = "Some of the old craft should be found again, for everyone's sake.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Lost is lost. Make new runes and move on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Both put something into an object that wasn't there before, and both depend on the one who does it. The difference, I suppose, is that I know exactly where my power comes from, and you trust that yours will come when you call." } },
      choices = {
        { text = "Trust is the heart of faith. I'd not trade it for certainty.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Certainty is better, Lucan. I'd rather know than hope.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fewer than you'd think, for some of your order hold that the Light needs no help from the arcane. Others come quietly, at dusk, and I respect both kinds equally, since it isn't my place to judge." } },
      choices = {
        { text = "My order's ways are enough. I'll trust the Light alone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll use every tool I can to protect the innocent.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've often thought an enchantment and a blessing are close cousins, though the Cathedral would never forgive me for saying so." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I've enchanted a few hammers for your order, and I'll tell you what I told them: the enchantment holds only as long as the arm behind it." },
        { id = "h_default", text = "Lucan Cordell. I teach enchanting, and since Dalaran fell, much of the enchanted work sold in this city has passed through this shop first. It's more responsibility than I asked for, but someone had to take it." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "A kaldorei. Your people distrust the arcane, I know, and I won't try to argue you out of it. Enchanting is a careful craft, and I think even your elders would find little in it to fear." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll know the difference between enchanting a blade and blasting a hole in one. Most of my customers don't, sadly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll enchant your gear like anyone's, but I'll ask you to keep your demon outside the shop, because the essences react badly to fel." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want your blade enchanted, I suppose, as every warrior does, and you'll want it done by tomorrow, as every warrior does." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Enchanting a bow is delicate work, because the string flexes and the magic doesn't like being stretched." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your people turned away from the arcane long ago, so I'll be curious to hear what you make of my work, and I'll ask you to be honest." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came in without the bell ringing, which I find more interesting than alarming. Is it enchanting you want, or merely a look at the stock?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Enchanting takes care and patience. Do your spirits have patience, or do they rush?" },
      },
      again = {
        { id = "h_again", text = "Is there more you'd learn? I have a little time before the next rod needs charging." },
        { id = "h_again2", text = "Go on; the rod can rest a moment." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "What does an enchanter actually do?", next = "craft" },
        { text = "You supply the whole Mage Quarter?", next = "supply" },
        { text = "Why take on Dalaran's work yourself, Lucan?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What enchantment serves a warrior best, Lucan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you enchant a hunter's bow or rifle, Lucan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do fel energies really spoil your enchantments?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are blessings and enchantments truly alike, Lucan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins often seek enchantments from you, Lucan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can the arcane ever be used without wounding the land, Lucan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could an enchanter's work help someone in my trade, Lucan?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think the elements could enchant a blade, Lucan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Lucan.", next = "END" },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "We take the magic out of one thing and bind it into another. You'll learn to break a glowing trinket into dust, and then to work that dust into a blade or a cloak with a copper rod." } },
      choices = {
        { text = "So you destroy things to make things?", next = "craft2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft2 = {
      lines = { { id = "c2_default", text = "Every craft does; the smith melts ore and the tailor cuts cloth. The difference is that what we unmake was often made by someone long dead, and I like to think we honour them by using it well." } },
      choices = {
        { text = "Old work should be preserved, not broken down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better used than gathering dust on a shelf.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "Much of it, yes, with the help of a few others. When Dalaran fell and Quel'Thalas burned, the old suppliers went with them, and the shops had nowhere else to turn." } },
      choices = {
        { text = "Did you know anyone in Dalaran?", next = "dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "I studied there for a summer, long ago, and I wrote to an old teacher until the letters stopped coming. I don't speak of it often, and I'd rather not now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An enchanter of Stormwind, trained in part in Dalaran, and teaching now because there are too few of us left." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to pretend that I do." } },
  },
}

-- Jessara Cordell: enchanting supplies in the family shop; brisk and protective of Lucan.
P:NPC {
  key = "jessara_cordell", id = TODO_NPC("Jessara Cordell"), name = "Jessara Cordell", title = "Enchanting Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "family" },
  notices = { "craft" },
  impression = {
    first = "Jessara Cordell sells rods, vials and formulae in the Cordells' shop and guards Lucan's time as fiercely as his stock. She was brisk with me and kind to the apprentices, which seemed the right way round.",
    third = "{name} met Jessara Cordell, who sells enchanting supplies in the Cordells' shop.",
  },
  greetings = {
    { id = "g_default", text = "Rods, vials and formulae. If you want Lucan, he's teaching, so please be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me guess: you've broken another rod." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" }, place = "before",
      text = "You'll want a runed copper rod soon, if you haven't got one already. Everyone thinks they can do without it, and nobody can." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They're frightened of everything, which is useful. A shaman won't help that, so be gentle." } },
      choices = {
        { text = "I'll be gentle with them, Jessara. Fear isn't respect.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little fear keeps them sharp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It does, and I've the ruined rods in a box at the back to prove it, because a customer from the Lamb once leaned on the counter for half an hour. Lucan was so cross he didn't speak for a day, which for Lucan is the same as shouting, so you'll understand why I'm careful." },
      },
      choices = {
        { text = "I'll keep clear of the counter, Jessara.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Lucan's work should be tougher than that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jessara.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Lucan's asked twice about moonwell water, and I've told him twice that nobody sells it, and he's sulked about it both times. If you'd tell him to his face that it's not for sale, I'd be grateful." } },
      choices = {
        { text = "Moonwell water is sacred. I'll tell him myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything has a price, Jessara, even moonwell water.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every day, and always the same three, so I could recite their names in my sleep. He's proud of where he learned, and I don't begrudge him that, but someone has to look forward while he looks back." } },
      choices = {
        { text = "Remembering the masters keeps the craft honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. The future matters more than old names.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The illusion dust, oddly, because the Defias pay twice its worth to hide their camps from the Westfall patrols. I won't sell it to anyone I don't know, which loses me money, but I sleep well." } },
      choices = {
        { text = "Good. Sleeping well is worth more than coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin's coin. You could sleep on the money.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not many, because most of them pay someone else to do the work and complain about the price. The ones who learn the craft themselves tend to be the clever ones, and they come back." } },
      choices = {
        { text = "I'd rather learn the craft than pay someone else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd sooner pay someone to do it for me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Little enough, because an arrow is only used once, and nobody enchants a thing they mean to lose. The best I can offer is a blessed bowstring, and even that's mostly for luck." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is very well behaved for a shop full of glass. I wish I could say the same of Lucan's students." },
      },
      choices = {
        { text = "Skill matters more than any trinket. I'll trust my aim.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it's lucky, I'll take two.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Vials, mostly, and the occasional rod for some brother who's taken an interest in enchanting. They pay promptly, which is more than the Mage Quarter does." } },
      choices = {
        { text = "Then the Church keeps faith in small things too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Church has more gold than prayers, it seems.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every day, but if I didn't, he'd spend the whole morning explaining the old masters to a farmhand. Someone has to keep the shop running, and Lucan won't." } },
      choices = {
        { text = "Keeping things in order is a duty too, Jessara.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let him talk. Knowledge shared is never wasted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you need vials for holy water, I've a few, but Lucan has a lesson in a minute, so don't keep him." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Lucan's teaching, so if you've come for him you'll have to wait, and if you've come for me you'll need to be quick." },
        { id = "h_default", text = "Jessara Cordell. Lucan teaches and I sell, and I keep the shop running while he talks about the old masters." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, so you'll want dust and essences, and you'll want to tell me how to sort them. Lucan's already told me, thank you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in an enchanting shop is usually after something shiny, so I'll keep the cases locked. Ask, though, and I'll show you anything." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I'll sell you rods and dust, but not opinions, because Lucan has enough of those for the whole family." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be wanting something to make the arrows fly truer, I suppose, and I'll tell you honestly that most of what's sold for that is nonsense." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you'll not be wanting dust or essences, so I'll ask you to step aside for the paying customers, kindly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll sell you rods and vials, but I'll ask you not to try out anything near Lucan's formulae, because fel residue ruins a week's work." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Lucan's busy. If you need supplies, I'll help, but don't let your spirits bother the apprentices." },
      },
      again = {
        { id = "h_again", text = "Rods, vials or Lucan's time: which do you need next?" },
        { id = "h_again2", text = "Quickly, please, because I've orders to fill." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Whose orders are you filling?", next = "orders" },
        { text = "You keep Lucan's time well.", next = "lucan" },
        { text = "Does Lucan talk about the old masters often?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's the most valuable thing you keep here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do many warriors buy enchanting supplies, Jessara?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there any real magic for arrows, Jessara?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Cathedral buy from your shop, Jessara?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you ever tire of guarding Lucan's time, Jessara?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would an enchanter ever want something a druid could gather, Jessara?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does fel residue really spoil Lucan's work, Jessara?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are the apprentices frightened of shamans, Jessara?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Jessara.", next = "END" },
      },
    },
    orders = {
      lines = { { id = "o_default", text = "Half the Mage Quarter's: Stormwind Staves, Duncan's Textiles, Ancient Curios. They've all been sending to us since Dalaran fell, and Lucan won't refuse any of them." } },
      choices = {
        { text = "Is that too much for one shop?", next = "orders2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders2 = {
      lines = { { id = "o2_default", text = "It's too much for one man, which is why he teaches, so there'll be more of us. I'd sooner he turned a few away, but he says the city needs it." } },
      choices = {
        { text = "He's right. The city does need it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He should look after himself first.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucan = {
      lines = { { id = "l_default", text = "Someone must, because he never says no. Every apprentice who wanders in thinks they're the next archmage, and he gives each one an hour he hasn't got." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Cordell, and this shop is my family's. I sell what Lucan needs and what his students break." } },
    _none = { { id = "tp_none", text = "No idea. Ask Lucan, if you can catch him." } },
  },
}

-- Catherine Leland: fishing supplies on the canals; salty saleswoman, Arnold's fishing partner.
P:NPC {
  key = "catherine_leland", id = TODO_NPC("Catherine Leland"), name = "Catherine Leland", title = "Fishing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "salty" }, values = { "practical", "nature" },
  notices = { "craft" },
  impression = {
    first = "Catherine Leland sells poles and bait on the Stormwind canals beside Arnold Leland, and she swears her prices are the best in the city. She talked about fish the way soldiers talk about old campaigns.",
    third = "{name} met Catherine Leland, who sells fishing supplies on the Stormwind canals.",
  },
  greetings = {
    { id = "g_default", text = "Best deals in all of Stormwind, friend, you won't find better. Browsing, or after something in particular?" },
    { id = "g_back", when = { metBefore = true }, text = "There's my angler again! Did the lakes treat you kindly, or did the big one slip the hook?" },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" }, place = "before",
      text = "You've got the smell of the lake on you, friend, which is the best perfume there is. Need bait?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Same as the soldiers come back from campaign. Fewer every year, but they come. Your spirits might bring more." } },
      choices = {
        { text = "Then fish the canals fairly, Catherine. Leave some for next year.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fish while they're biting. Next year's not certain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Patient folk make good fishermen, and your sort seem patient enough, sitting up all night with your candles and your circles. Just don't go summoning anything into the canal to chase the fish, because Arnold tried a firework once and the guards still talk about it." },
      },
      choices = {
        { text = "Just a pole and patience, then, Catherine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A summoned thing in the canal would fish faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Catherine.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Of course not, it's a fair trade, a worm for a fish, and the fish agreed to it when it bit. Arnold says that's a merchant's view of the world, and he isn't wrong, but he buys his worms from me all the same." } },
      choices = {
        { text = "Fishing needs limits and seasons, or the canal empties.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let everyone fish as they please. The canal will manage.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than you'd think, because the best catch always goes to whoever sits stillest and strikes last. Arnold says the canal fish are cleverer than the Westfall ones, because they've watched a whole city's worth of tricks go by." } },
      choices = {
        { text = "Patience and method win. I'll learn to sit still.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Strike first and ask questions later, I say.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It froze half of Arnold's lines and none of the fish, and the Watch fined him for blocking the barges. Fishing doesn't care how clever you are, which is the thing I like best about it." } },
      choices = {
        { text = "The Watch was right to fine him. Rules are rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A fine for trying something new seems unfair.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, because a man who's spent all week being shouted at by a sergeant wants an afternoon of nobody shouting at him. Arnold says the best fishermen he's taught were all soldiers, and the worst were all mages." } },
      choices = {
        { text = "Everyone needs a quiet afternoon now and then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warrior should be training, not fishing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Shiny baubles for the pike and nightcrawlers for everything else, and never the stale bread the children use. The rivers around Elwynn are kind to beginners, and the lakes in Redridge are kind to nobody." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will want to help, I'm sure, and it'll scare every fish in the river. Leave it on the bank with a biscuit." },
      },
      choices = {
        { text = "I'll take only what I need from the rivers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fish the river empty if they're biting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than you'd think, and they usually catch nothing, because they're not watching the line. Arnold says the fish know who's paying attention, and I'm starting to believe him." } },
      choices = {
        { text = "There's more to a quiet morning than fish, Catherine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you're fishing, fish. Pray somewhere else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Three soldiers, a drunk and a very surprised noble, and the noble never thanked me. I keep a long pole by the stall for the purpose, and it's caught more people than fish." } },
      choices = {
        { text = "That's real service, Catherine, whether they thank you or not.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time, let the noble swim. He'll learn to watch his step.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll be wanting a quiet spot to fish and pray, I expect, and the canal's as quiet as it gets in this city." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Arnold will want to teach you, but I'll warn you now that a fish doesn't care for plate, and plate doesn't care for water." },
        { id = "h_default", text = "Catherine Leland. Arnold there teaches the fishing and I sell the poles, the line and the bait, and between us we've fished every water a day's walk from this city." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Your lot fish Loch Modan like it owes you money, and I respect that. You'll want a strong pole, then." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue at the bait counter. You've the patience for fishing, I'd wager, since your trade is mostly waiting for the right moment." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Don't freeze my canal, please; the last mage who tried it thought he'd catch fish easier through a hole in the ice." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, with a fishing question? Don't look so sheepish; half the Barracks fishes on its day off, and they're better at it than they let on." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I suppose you'll want bait for the pike in Stonewatch, or you'll want to tell me you can catch them with your hands." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the bait counter. Arnold says your people never use bait, only patience, and I'd thank you not to say so loudly near my stock." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, buying fishing line? I've sold stranger things to stranger folk, and the fish don't care either way." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman by the canal! My prices are the best in the city. Do your spirits fish?" },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask away, friend; the bait keeps better than my temper, and that's saying something." },
      },
      choices = {
        { text = "Let me see your poles.", next = "BUSINESS" },
        { text = "Is there anything in these canals?", next = "canals" },
        { text = "What's the best fish you've caught?", next = "best" },
        { text = "Is fishing so much like my trade, then?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did freezing the canal actually work?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do soldiers really fish, Catherine?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What bait should a hunter use in Elwynn, Catherine?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do people ever come to the canals to pray, Catherine?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have you ever pulled anyone out of the canals, Catherine?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is bait really cheating the fish, Catherine?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would a warlock make a good fisherman, Catherine?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the fish come back each season, Catherine?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Catherine.", next = "END" },
      },
    },
    canals = {
      lines = { { id = "c_default", text = "Small fry and old boots, mostly, and the odd fat fish nobody can explain. The children say there are crocolisks down there, but I've fished these canals for years and never seen so much as a tail." } },
      choices = {
        { text = "Are you sure there aren't?", next = "canals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canals2 = {
      lines = { { id = "c2_default", text = "Sure enough that I'd still dip my feet, though I won't tell the children that. A bit of fear keeps them away from the edge, and that's no bad thing." } },
      choices = {
        { text = "Better to tell them the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A useful story never hurt anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "A longjaw mud snapper out of Crystal Lake, big as my arm, and Arnold still says it was smaller. He was there, so I suppose he'd know, but he's wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold tackle on these canals for years, beside Arnold. We fished together long before either of us made a living at it." } },
    _none = { { id = "tp_none", text = "Haven't a clue, friend; I know hooks, line and worms, and not much past the canal wall." } },
  },
}

-- Lisbeth Schneider: clothier at the Canal Tailor and Fit Shop; brisk, sizes people up.
P:NPC {
  key = "lisbeth_schneider", id = TODO_NPC("Lisbeth Schneider"), name = "Lisbeth Schneider", title = "Clothier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "community" },
  notices = { "kit" },
  impression = {
    first = "Lisbeth Schneider sells cloth armour in the Canal Tailor and Fit Shop and measured me with her eyes before I'd said a word. She was brisk and good-humoured, and she knew the price of everything on the canals.",
    third = "{name} met Lisbeth Schneider, the clothier of the Canal Tailor and Fit Shop.",
  },
  greetings = {
    { id = "g_default", text = "Come in, friend, and mind the damp. Are you browsing, or do you need something fitted?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I remember your size, you know. I never forget a size." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Look at the state of your sleeves, friend. Whatever it was, it won, and you'll want something new before you go out again." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Whatever won't burn when lightning goes off, I'd guess. Come back and I'll fit you properly." } },
      choices = {
        { text = "A proper fit is worth paying for. Thank you, Lisbeth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll make do. Fancy clothes don't fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I make dark cloaks with deep hoods for anyone who asks, and half of them say they're for the rain. Rema puts an extra pocket inside the left breast if you ask her nicely, and I don't ask what goes in it, because I sell clothes and not questions." },
      },
      choices = {
        { text = "The rain, Lisbeth. Truly. I'll pay for the pocket.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "An extra pocket for free would be kind.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lisbeth.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It's lovely, and loose, and it would never survive a week on the canals, because everything here snags on something. Your tailors sew for forests, dear, and mine sew for bridges and barrels." } },
      choices = {
        { text = "Then sew me something sturdy. A druid must suit the place.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my loose hems. Snags are better than stiff cloth.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I can make one that scorches less, and I can make one that looks better scorched, but nobody's managed a robe that won't burn at all. The Sanctum's tailors claim otherwise, and I've seen their hems." } },
      choices = {
        { text = "I'll wear my scorch marks honestly. They're earned.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take whichever one hides the scorching best.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I dress the Cathedral's novices and the Lamb's cellar alike, and I measure them all the same, though I say a little prayer after the cellar's lot leave. A seam doesn't care who wears it, and I try to be like a seam." } },
      choices = {
        { text = "Say the prayer, Lisbeth. I could probably use it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep your prayers. I didn't come here for those.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one I've met, though most of them won't admit it until the mail has rubbed through their skin. Rema makes the padding, and I sell it, and between us we keep half the Barracks from being miserable." } },
      choices = {
        { text = "A well-made shirt is worth its price. I'll take one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A soldier should learn to bear a little chafing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wool in the cold and linen in the heat, dyed brown or green, and nothing that rustles when you crouch. I fitted a hunter last month who'd been wearing a bright red cloak to stalk deer, and he couldn't work out why he never caught anything." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't need a coat, of course, but it's shedding on my racks, and I'll ask you to keep it a step back." },
      },
      choices = {
        { text = "Quiet clothes make for a quiet hunt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I wear what I like. The deer can deal with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because the Cathedral cuts robes for the tallest novice and the shortest purse, and expects everyone else to make do. Humility is a fine thing, but nobody ever healed better for tripping over their hem." } },
      choices = {
        { text = "Humility matters more than a good fit, Lisbeth.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A healer should look the part. Fit me properly.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stout cloth, a long cut and colours that hold, because nobody wants to see a faded Silver Hand on the field. The old knights were very particular about it, and I think they were right." } },
      choices = {
        { text = "The colours should hold. They stand for something.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's only cloth, Lisbeth. What matters is under it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Another priest! I'll find you something that doesn't make you look like a sack of flour, if you'll stand still long enough." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a tabard that doesn't ride up under the plate, and the Cathedral's tailors never get that right." },
        { id = "h_default", text = "Lisbeth Schneider. Rema makes, Corbett carries, and I sell the finished pieces off these racks, and I'll fit you properly, which is more than the market stalls will do." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! The Cathedral sends us all its novices, and they come in looking like sacks of flour tied in the middle. Let me find you something that fits." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Let me guess: everything you own has a scorch mark on the left sleeve, because you cast with your right hand." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I measure all sorts here, and I'll measure you too, though I'd thank you to keep anything with horns outside the curtain." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want a good padded shirt under that mail, or you'll be raw by Goldshire, and I'll fit it properly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll want something dull and quiet that won't snag on every briar in Elwynn, I'd wager." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I can tell your cloth was sewn in Darnassus, because no human tailor would leave the hems that loose." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Leather, not cloth, for you, I'd guess, but I'll measure you anyway, because quiet folk always have one good cloak and never look after it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Let me look at you. Your robes are rough; mail, perhaps? Totems are heavy." },
      },
      again = {
        { id = "h_again", text = "Something more, friend? I'll keep measuring you while you think of it." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why does everyone want armour lately?", next = "armour" },
        { text = "What's the canal like to work on?", next = "canal" },
        { text = "Can you make a robe that won't scorch?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does a warrior really need a tailor, Lisbeth?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter wear in the woods, Lisbeth?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you mind dressing someone like me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do the Cathedral's novices dress so badly, Lisbeth?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What makes a good paladin's tabard, Lisbeth?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you make of kaldorei stitching, Lisbeth?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you ever make cloaks for people who'd rather not be seen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do shamans wear, Lisbeth?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Lisbeth.", next = "END" },
      },
    },
    armour = {
      lines = { { id = "a_default", text = "Because the roads aren't safe from here to Westfall, and even the clerks want a padded vest under their coats. Rema thinks the nobles know something they're not telling us, and I'm starting to agree." } },
      choices = {
        { text = "What do you think they know?", next = "armour2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    armour2 = {
      lines = { { id = "a2_default", text = "That the king isn't coming home soon, and nobody wants to say it aloud. I could be wrong; I sell clothes, not secrets." } },
      choices = {
        { text = "Trust the regent, because he'll keep us safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the nobles hide things, people should demand answers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    canal = {
      lines = { { id = "c_default", text = "Damp, always, and the cloth hates it, so I keep everything on the top racks. But you see the whole city pass by on the bridges, and I wouldn't trade it for a dry shop anywhere else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept the racks at the Canal Tailor and Fit Shop for years, with Rema at her needle behind me." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid, but I can tell you anything about wool and linen." } },
  },
}
