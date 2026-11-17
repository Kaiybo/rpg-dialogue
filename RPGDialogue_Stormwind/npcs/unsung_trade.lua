-- Trade District people with no quests and no gossip worth the name: the bank, the
-- auction house, the guild registry, Weller's Arsenal and Pestle's Apothecary.
-- Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Olivia Burnside: banker, proud of the vault's record, and a little too insistent about it.
P:NPC {
  key = "olivia_burnside", id = TODO_NPC("Olivia Burnside"), name = "Olivia Burnside", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "order", "proud" },
  notices = { "purse", "watch" },
  impression = {
    first = "Olivia Burnside keeps the vaults at the Bank of Stormwind and told me twice that nothing has ever been stolen from them. The second time she sounded as if she were reassuring herself.",
    third = "{name} met Olivia Burnside, a banker of Stormwind who is very proud of her vaults.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Bank of Stormwind. Your valuables are safer here than anywhere else in the kingdom, and I mean that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your box is exactly where you left it, as it always will be." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } }, place = "before",
      text = "Goodness, that's a great deal of coin to be carrying about the Trade District. Do let us look after some of it before a cutpurse does." },
    { id = "n_rogue", cat = "watch", when = { class = "ROGUE" }, place = "before",
      text = "You'll forgive me if I keep my eyes on your hands while we talk. It's nothing personal; I do it with everyone who walks the way you do." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never once, I promise you. I tell everyone that twice, because some people seem to doubt it. Your spirits won't find any gaps." } },
      choices = {
        { text = "A well-kept vault is worth trusting, Olivia.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Everything has gaps. Someone will find them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't look, and I'd never tell, but I've noticed the warlock boxes tend to be the warmest in the vault, which is odd for a stone room underground. Nothing has ever been stolen from this bank, as I say, though I sometimes wonder whether that's the locks or the fact that nobody wants to open those boxes." },
      },
      choices = {
        { text = "The locks, Olivia. I'll keep my box quiet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Mine stays warm. That's all you need to know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Olivia.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A cat got in once, and the guards chased it for an hour before it turned out to be only a cat. I've had the bars narrowed since, so you'll forgive me if I watch every animal in the hall." } },
      choices = {
        { text = "Watch away. A bank should guard against every shape.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You'll never guard against everything, Olivia, so don't try.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the vaults were built by the same stonemasons who built the walls, and they did a very good job before the crown stopped paying them. I do sometimes wonder whether any of them still remember the plans." } },
      choices = {
        { text = "The crown should have paid them. That was dishonourable.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The crown pays what it can. Masons are masons.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I've never looked, and I never will, because a bank that looks inside its boxes is just a cupboard. The boxes are warm to the touch, mind, and one of them hums on rainy days." } },
      choices = {
        { text = "Good. Some boxes are better left shut.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd have peeked by now. Curiosity's half of magic.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It goes to the family named in the ledger, if there is one, and to the crown if there isn't. I've handed over a great many accounts to widows in the last few years, and I've never grown used to it." } },
      choices = {
        { text = "I'll name my family. They'll need it more than the crown.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the crown have it. Gold's no use to the dead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than you'd think, because a fine pelt fetches more than a pouch of silver if you wait for the right buyer. We had a whole winter's worth of wolf pelts from Duskwood last year, and the whole vault smelled of wet dog until spring." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can't come into the vault, I'm sorry to say. The rules are very clear on beasts, though I'll admit it's very sweet." },
      },
      choices = {
        { text = "Patience pays. I'll wait for the right buyer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Quick coin is better than waiting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I couldn't possibly say, but I'll tell you it's very old and very carefully wrapped. Nothing's ever been stolen from the Bank of Stormwind, and I'd rather not test that with anything holy." } },
      choices = {
        { text = "Holy things belong in the Cathedral, not a vault.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A vault's safer than any altar. The Church chose well.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Tried, yes, and failed every time, though I'll not tell you how. Nothing's ever been stolen from the Bank of Stormwind, and I'd like to keep saying that until I retire." } },
      choices = {
        { text = "The law protects honest folk's savings. Good.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Any lock can be picked. You're trusting luck, Olivia.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The Cathedral keeps a few boxes with us, you know, and I promise you they're as safe as anything in the kingdom." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want to see your box, I expect, and your order's boxes are some of the best kept in the bank." },
        { id = "h_default", text = "Olivia Burnside, at your service. We keep accounts and safe deposit boxes, and no one has ever stolen a thing out of this bank, not in its whole history." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Ah, a dwarf! You'll want to see our vaults, I expect, and compare them with Ironforge's. I promise ours will stand the comparison." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. I'll say it again, because it bears repeating: no one has ever stolen a thing from this bank, and I'd rather you weren't the first." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! We keep a few boxes for the Sanctum, and they always come with a note asking us not to open them, which I think is rather sweet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Your gold is safe with us, I promise, whatever happens to you out in Westfall." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Pelts and trophies in the vault? We can store them, though I'll ask you to make sure they're properly salted first." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll say it before you ask: nobody has ever stolen from this bank, not even a cat that walked through the bars." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll open your box like anyone else's, but I'll ask you to keep nothing in it that breathes." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Nothing has ever been stolen from these vaults. Nothing. Your spirits would find nothing to complain about." },
      },
      again = {
        { id = "h_again", text = "Is there something more the Bank of Stormwind can do for you?" },
        { id = "h_again2", text = "Please, ask whatever you like. The queue can wait a moment." },
      },
      choices = {
        { text = "I'd like to see my box.", next = "BUSINESS" },
        { text = "Nothing has ever been stolen, not even once?", next = "thief" },
        { text = "Who keeps their money here?", next = "who" },
        { text = "How has nobody ever robbed this bank?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What does the Sanctum keep in your boxes?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What happens to a warrior's gold if they don't come back, Olivia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters store pelts in the bank, Olivia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does the Cathedral keep in your vaults, Olivia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Has anyone ever tried to rob the bank, Olivia?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has anyone tried to slip into the vaults in another shape, Olivia?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do warlocks keep in your vaults, Olivia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Has anything ever gone missing from the bank, Olivia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Olivia.", next = "END" },
      },
    },
    thief = {
      lines = { { id = "t_default", text = "Not once! Well, there was a fellow last winter who tried the cellar door, but he never got past the first lock, so that doesn't count. The guards walk past every hour, and the vault doors were forged in Ironforge." } },
      choices = {
        { text = "What happened to the fellow?", next = "thief2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thief2 = {
      lines = { { id = "t2_default", text = "The guards took him to the Stockade, and I'm told he's still there with the Defias who were thrown in after him. I don't like to think about it, so I think about the locks instead." } },
      choices = {
        { text = "Good. A thief belongs behind bars.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Desperate people try desperate things. Hard to blame him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Merchants, nobles, soldiers home on leave, and more adventurers every week. The nobles keep the largest boxes, and they visit the least, which I've always found rather curious." } },
      choices = {
        { text = "Do the stonemasons keep money here?", next = "masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    masons = {
      lines = { { id = "m_default", text = "Some did, before the trouble over their wages, and then they came in one by one and closed their accounts. It's not my place to say who owed them what, so I don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    the_stockade = { { id = "tp_the_stockade", text = "The prisoners may have the Stockade, but nobody's ever stolen anything from the Bank of Stormwind, not in the whole history of it! I check the vaults twice a day now, just to be sure." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias have stolen from every farm in Westfall, and not one copper from this bank, and I'd like to keep it that way. I've had the locks changed three times this year, just in case." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are thieves of the worst kind, nobles who think they're owed. They've never stolen from us, and they never will, and I'll say that as many times as I must." } },
    background = { { id = "tp_bg", text = "I've worked these counters since the city was rebuilt, and my family has kept the ledgers longer than that." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't something we keep on record here." } },
  },
}

-- Newton Burnside: the dry one, who reads people by what they deposit.
P:NPC {
  key = "newton_burnside", id = TODO_NPC("Newton Burnside"), name = "Newton Burnside", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "stormwind" }, temper = { "dry" }, values = { "order", "discreet" },
  notices = { "purse", "trophy" },
  impression = {
    first = "Newton Burnside says the bank sees more of the kingdom than the king does, because everyone sooner or later comes to put something away. He was polite, precise and quietly amused by all of it.",
    third = "{name} met Newton Burnside, a dry and observant banker of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Is it a deposit or a withdrawal? I can usually tell, but I've been wrong once or twice." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Let me guess: something heavier going in than coming out." },
  },
  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } }, place = "before",
      text = "You'll not need a large box, I think, and there's no shame in that. Most fortunes in this city began with a small one." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everyone's fears, in gold and silver. A shaman's deposit would be interesting. I'd wager your spirits don't use coin." } },
      choices = {
        { text = "A careful bank keeps a careful kingdom, Newton.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear is a poor reason to hoard coin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Notes, chiefly, and a surprising number of them in cipher, as though the bank's clerks had nothing better to do than steal spells. The older mages put away things from Dalaran, before the city was walled off, and they visit them the way other folk visit a grave." },
      },
      choices = {
        { text = "Then I'll treat those boxes with respect, Newton.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dalaran's gone. Those things should be studied, not mourned.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Newton.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Seeds, mostly, wrapped in cloth and labelled in your script, and the odd letter home that was never sent. I find it touching, though I'd never say so to the depositor." } },
      choices = {
        { text = "A bank is a fine place for seeds. Keep them safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Seeds belong in soil, Newton, not locked in a vault.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Soldiers keep letters, nobles keep jewels, and the quietest customers keep nothing at all, which tells me most of all. I suspect at least one of the city's quieter offices rents a box here under a very dull name." } },
      choices = {
        { text = "A banker's silence is a matter of honour.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Secrets are worth something. I'd sell that one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A gentleman from the Mage Quarter tried to deposit a small bound box that scratched at night, and we gave it back to him the very next morning. I've stopped asking what people keep, but I do still listen." } },
      choices = {
        { text = "You were right to refuse it. Some things don't belong here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A scratching box is harmless if it's bound properly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Things they want to come back for, mostly, and that tells you more about them than any medal. One old soldier kept a child's drawing of a horse in his box for twenty years, and never once let me see it." } },
      choices = {
        { text = "Everyone needs something to come home to.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I keep nothing. Attachments slow you down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Teeth, claws and feathers, mostly, and one memorable hunter kept a stuffed murloc that he swore was the biggest ever caught in Westfall. I believed him, because nobody would make that up." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has its eye on the coin trays, I notice. Clever beast; it knows where the shiny things are kept." },
      },
      choices = {
        { text = "A trophy honours the hunt, not my pride.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A trophy shows everyone what I can do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Letters from home, mostly, and keepsakes from people they couldn't save. I've seen priests open a box just to look at a ribbon, and then close it again without taking anything out." } },
      choices = {
        { text = "I still say their names at night. That's part of the calling.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keepsakes only weigh you down. Better to let them go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the Silver Hand has been everywhere, and lost a great deal. I've seen boxes left untouched for years, and I keep them, because someone might come back." } },
      choices = {
        { text = "Keep them, Newton. Some of us will come home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If no one comes back, the boxes should go to the living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Your boxes are always the same, candles and letters and a spare robe, and I find that rather comforting." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your order's boxes tell me more about the kingdom than the crown's dispatches do, if you'll forgive me saying so." },
        { id = "h_default", text = "Newton Burnside. I keep boxes and accounts for half the Trade District, and I've learned that what people put away tells you more about them than anything they say across a counter." },
        { id = "h_lowlevel", when = { maxLevel = 15 }, text = "A new face, and a young one. Most of our new customers start with a few spare linen shirts and a sword they've outgrown, so don't be shy about what you bring." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. I can tell a great deal from what someone puts in a box, and I'll be very interested to see what you put in yours." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I've a rule that nothing alive goes in the boxes, and I'd like to remind you of it before you ask." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. People keep strange things in their boxes, and warriors keep the strangest: old letters, lockets and the occasional broken sword." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll keep trophies in your box, I suppose, as hunters do, and you'll tell me a story about each one if I let you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I can tell a great deal about someone from their box, and I confess I'm curious what your people put away, since you seem to own so little." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I've a fair idea what's in your box already, and I'd wager it's mostly reagents and a scroll you've forgotten about." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The bank sees more of the kingdom than the king does, and I've never seen a shaman deposit before." },
      },
      again = {
        { id = "h_again", text = "Something else? I have time, and the ledger certainly isn't going anywhere." },
        { id = "h_again2", text = "Ask away. I'll answer what a banker can." },
      },
      choices = {
        { text = "Open my box, please.", next = "BUSINESS" },
        { text = "So what do people put away?", next = "boxes" },
        { text = "What does my box say about me?", next = "mine" },
        { text = "What can you tell about people from their boxes?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do warriors keep in their boxes, Newton?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do hunters keep in their boxes, Newton?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone tried to store something alive?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do priests keep in their boxes, Newton?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do a paladin's things tell you about the kingdom?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do druids usually put in their bank boxes, Newton?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do mages put away, Newton?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does the bank see of the kingdom, Newton?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Newton.", next = "END" },
      },
    },
    boxes = {
      lines = { { id = "b_default", text = "Soldiers leave letters home and their good boots, merchants leave coin, and adventurers leave the oddest things: a tusk, a stone that hums, a lock of somebody's hair. I don't ask, and they don't tell me." } },
      choices = {
        { text = "Don't you ever wonder?", next = "boxes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boxes2 = {
      lines = { { id = "b2_default", text = "Every day, but a banker who asks questions soon has no customers. What a person keeps is their own business, so long as it doesn't start whispering at night." } },
      choices = {
        { text = "Quite right, some things should stay private.", next = "BACK", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "If it were dangerous, I'd want somebody to look.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mi_default", text = "That you come back alive, which is more than I can say for some. The ones who stop coming are the reason we keep the boxes sealed for a year before anyone may claim them." },
        { id = "mi_priest", when = { class = "PRIEST" }, text = "That you keep more cloth than coin, which is common among the Cathedral's people. You'd be surprised how many priests store a spare set of vestments and nothing else." },
      },
      choices = {
        { text = "What happens after the year?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "The family may claim it if they can prove themselves, and if no one comes, it goes to the crown. I'd rather it went to the families, but nobody asked my opinion when the law was written." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Merchants from Booty Bay keep accounts here, and they deposit more than any noble. That tells you where the money is in this world, if you've the eyes to see it." } },
    scourge = { { id = "tp_scourge", text = "The Lordaeron refugees come in with whatever they managed to carry, and some of them deposit everything they have left. I keep their accounts very carefully, because some of those accounts are all that's left of whole families." } },
    the_stockade = { { id = "tp_the_stockade", text = "Some of the Stockade's prisoners have accounts here, and they've not been touched since the riot. I'm curious what they'll do with them when they get out, and I keep a careful note." } },
    background = { { id = "tp_bg", text = "A Burnside, like the others behind these windows. We've counted Stormwind's coin for generations, and I expect we'll go on counting it." } },
    _none = { { id = "tp_none", text = "No ledger of mine records that, and a banker who guesses soon loses his post." } },
  },
}

-- John Burnside: first window on the right, so he greets everyone first; cheerful and young.
P:NPC {
  key = "john_burnside", id = TODO_NPC("John Burnside"), name = "John Burnside", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "community", "order" },
  notices = { "kin", "travel" },
  impression = {
    first = "John Burnside has the first window inside the bank's door, so he greets everyone who comes in, and he seems to genuinely enjoy it. He wanted to know where I'd been more than what I'd brought.",
    third = "{name} met John Burnside, the cheerful banker at the first window of the Bank of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Good day, and welcome in! First window on the right, which is me, and I'm free." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Where's the road taken you since I last saw you?" },
  },
  notice = {
    { id = "n_human", cat = "kin", when = { race = "Human" }, place = "before",
      text = "Stormwind born, are you? Then you'll know my family's name from the old bank, before the orcs burned it down with everything else." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They tell me about Ironforge, Darnassus and Westfall, and all sorts besides. A shaman's stories must be wonderful. Do tell." } },
      choices = {
        { text = "Kindness at the door is a fine welcome, John.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Stories don't pay. Let's talk coin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Every morning, on their way from the Quarter to the auction house, with their pockets full of whatever they enchanted the night before. They're polite, mostly, but they've a way of looking at the counter as though they could turn it to sand if they cared to, and I'm always glad when they don't." },
      },
      choices = {
        { text = "I'll leave your counter as it is, John.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sand would be an improvement, John.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Your boots have Darkshore sand in the seams and Wetlands mud on top, and I've heard that road described a hundred times. Mind, I've never been further than Goldshire, so you'll have to tell me if I'm right." } },
      choices = {
        { text = "Stay at your window, John. Somebody has to keep the bank.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the window and see it yourself someday, John.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only as a joke, mostly, though my uncle lost a ring across this counter years ago and never found out how. We've all smiled a little more carefully since, and kept our rings in our pockets." } },
      choices = {
        { text = "Robbing a banker at his own window is a mean trick.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whoever did it had skill. You have to admire that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only the queue, because nobody wants to stand behind a thing with horns for ten minutes. My cousins say I'm too friendly, but I'd rather be friendly to a warlock than give one a reason to be otherwise." } },
      choices = {
        { text = "I'll send it away while I'm here. Your customers deserve that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they mind, they can let me go first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most of the Barracks, because a soldier's wages are safer here than in a barracks chest. I see them every payday, and I can always tell which ones are about to march, because they leave everything with me." } },
      choices = {
        { text = "I'll leave my coin here and march light.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take my coin with me. You never know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and some keep it in a sack under their bedroll, and I worry for the second sort. A hunter who's been robbed on the road once usually becomes my best customer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} would be your guard, I suppose, if you did keep your coin on the road. A fine guard, too, by the look of those teeth." },
      },
      choices = {
        { text = "I'll trust the bank with my coin. It's safer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my coin close, where I can see it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some of them, about the sick they've healed and the dead they've buried, and some just stand there quietly, which tells its own story. I listen either way, because I think everyone should have somebody at the door." } },
      choices = {
        { text = "Sometimes an ear does more than a bandage, John.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some stories are better left untold, John.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Near enough, from the mud on their boots and the look in their eye. Paladins come in tired and leave lighter, and I like to think the bank has something to do with that." } },
      choices = {
        { text = "Folk remember who held the door for them, John.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's the gold that lightens us, John, not the welcome.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Welcome, welcome, and tell me where you've been, because the Cathedral's people always come back with the best stories." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Welcome, welcome, and you'll have been somewhere dangerous, I can see it in the way you're standing." },
        { id = "h_default", text = "John Burnside. I've the first window, so I see everyone before my kin do, and I like to think I give the city a friendly face when they've only come to count their coin." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! We've had a few of your people in since Gnomeregan, and every one of them has asked to see how the locks work. I'm not allowed to show you, I'm sorry to say." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue at the first window! I'll give you the same smile I give everyone, but I'll be counting my fingers when you go." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Hello there! I'll smile at you the same as anyone, but I'll ask your little companion to stay out of the queue, if it's no trouble." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Welcome to the first window, friend; your coin's safe here, and so are you, at least until you go back out that door." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I see a lot of hunters through this window, and you all have the same look, as if you'd rather be anywhere but indoors." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the first window! You've come a long way, I can tell by your boots, and I'd guess Auberdine and then Menethil, which is a very wet journey." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Welcome, welcome. Where have you been, and did you see anything worth telling about?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Welcome to the bank! A shaman! Where have you been? I want to hear about it more than what you're depositing." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? The others can wait." },
        { id = "h_again2", text = "Go on, I like the talk better than the counting." },
      },
      choices = {
        { text = "Just my box, John.", next = "BUSINESS" },
        { text = "The orcs burned the old bank?", next = "old" },
        { text = "Who comes in through that door?", next = "door" },
        { text = "Do you really count your fingers, John?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do many warriors bank with you, John?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever bank their earnings, John?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do my companions bother your customers, John?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do priests really tell you their stories, John?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can you really tell where someone's been, John?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can you really tell I came by way of Auberdine, John?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do many mages come through your door, John?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do travellers tell you about the world, John?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "When the Horde sacked the city, yes. My grandfather carried the ledgers out in a handcart, and that's how we knew whose gold was whose when the stonemasons built this place again." } },
      choices = {
        { text = "Your grandfather sounds like a brave man.", next = "old2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old2 = {
      lines = { { id = "o2_default", text = "Brave, or too stubborn to leave the books behind, which is the Burnside way. He used to say a city can be rebuilt but a debt forgotten is gone forever." } },
      choices = {
        { text = "He was right, and debts should be honored.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Some debts are better forgotten, I'd say.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    door = {
      lines = { { id = "d_default", text = "Everyone, sooner or later. Dwarves from the district by the gate, night elves who look at the ceiling as if it might fall on them, and lately a great many folk from Westfall with nothing much to put away at all." } },
      choices = {
        { text = "What do the Westfall folk want?", next = "westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    westfall = {
      lines = { { id = "wf_default", text = "Mostly to ask whether a farm's deed is worth anything now, and I have to tell them it's only paper while the Defias hold the land. It's the worst part of the work, and I try to say it gently." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's folk keep an account here, and they deposit the strangest things. Last week it was a stuffed murloc and a jar of something that winked at me." } },
    booty_bay = { { id = "tp_booty_bay", text = "A merchant from Booty Bay asked me last week whether we'd take goblin gold. I said gold is gold, and he looked at me as though I'd said something very naive." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "My grandfather carved stone for the Valley of Heroes, and he said every statue there is a debt the city owes. I think of that every morning, when I open the door." } },
    background = { { id = "tp_bg", text = "Born a Burnside, raised behind a counter, and happy enough there. My grandfather saved the ledgers when the city burned, and we've kept them since." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, I wouldn't know about that. Ask me about the bank and I'm your man." } },
  },
}

-- Auctioneer Chilton: leftmost podium; a showman with a rule for everything.
P:NPC {
  key = "auctioneer_chilton", id = TODO_NPC("Auctioneer Chilton"), name = "Auctioneer Chilton", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "showy" }, values = { "trade", "order" },
  notices = { "purse", "craft" },
  impression = {
    first = "Auctioneer Chilton runs the left-hand podium of Stormwind's auction house and believes a fair sale needs rules, a deposit and a little theatre. He talked about a linen cloth as though it were a crown.",
    third = "{name} met Auctioneer Chilton, a showman of Stormwind's auction house.",
  },
  greetings = {
    { id = "g_default", text = "Buying or selling, friend? Either way, step up; the hall is open and the bidding is warm." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the hall! Did your last lot sell, or are we trying again with a better price?" },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking" } }, place = "before",
      text = "A crafter! Then you're the reason this hall exists, because adventurers sell us the raw stuff and folk like you turn it into something worth bidding on." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It needs rules, mostly. Everyone bids honestly, and the deposit keeps them so. Your spirits must have rules too." } },
      choices = {
        { text = "Rules keep the market fair. I respect that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Theatre sells better than rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Never knowingly, and I check every consignment against the guard's list of reported thefts, which is longer than you'd think. The auction house is a temple to fair dealing, and I'll not have it turned into a fence's market, however good the goods." },
      },
      choices = {
        { text = "Fair dealing it is, Chilton. My goods are clean.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your list is long, Chilton, but never complete.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Chilton.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everything here was taken from somewhere, friend, from a mine or a field or a wolf that didn't want to give up its pelt. I can't ask where every hide came from, but I do ask the seller to sign for it, and that's the rule." } },
      choices = {
        { text = "Ask more, Chilton. A fair sale needs a fair source.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Not your concern, Chilton. Sell what comes and keep the theatre going.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Always, and sometimes better than they deserve, because buyers see a glow and stop asking questions. I warn them when I can, but an auctioneer can only call what's put in front of him." } },
      choices = {
        { text = "Then sellers should be honest about their glow.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If buyers don't ask, that's their own fault.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, a book that turned its own pages at night, and the guards refused to sit with it. It sold for a great deal of gold to a buyer I never saw, and I've tried very hard not to wonder where it went." } },
      choices = {
        { text = "You should have burned it, Chilton.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A book like that deserves a worthy owner.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Good swords and good mail, especially anything with an enchantment on it, and they go faster than I can call the bids. A warrior who knows his gear can make a fair living selling what he finds on the road." } },
      choices = {
        { text = "I'll sell what I don't need at a fair price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll sell high and let the buyers fight over it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Leather, by far, since the tailors and leatherworkers are always hungry for it. Last week a single pristine hide from a Redridge bear went for three times what the vendors offer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can stay by the podium, but please don't let it put its paw on anything. The bidders get very jumpy." },
      },
      choices = {
        { text = "I'll price my goods fairly for everyone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll ask whatever the market will bear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better at auction than in a back alley, where anyone might take them. I keep the bidding honest and the deposits fair, and I like to think the Light approves of a well-run sale." } },
      choices = {
        { text = "Holy things shouldn't be sold at all, Chilton.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A fair sale is fair, whatever's being sold.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Now and then, and the deposit helps, because a thief doesn't like to pay first. Fitch keeps the book, and between us we catch most of them." } },
      choices = {
        { text = "The guard should hear of every theft you catch.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they've paid the deposit, it's their business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The auction house sees a fair few holy relics, and I always make sure they go to a good home." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your order's old gear fetches a fine price, and I'll see it's sold honestly if you ever bring any in." },
        { id = "h_default", text = "Auctioneer Chilton, at the left podium. Leave your goods with me, set your price and your deposit, and every buyer in Stormwind will have the chance to fight over them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Your people do run a fine auction in Ironforge, but I'll wager ours is warmer, and the bidders here haven't learned to haggle as hard." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Enchanted goods always fetch a fine price at my podium, so if you've anything that glows, I'd be delighted to see it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll list your goods like anyone's, though I'd ask that nothing you consign is still moving." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Arms and armour sell well these days, with all the fighting in Westfall and Redridge, so set your price with confidence." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Leather, pelts and meat sell steadily, and the occasional rare feather can start a proper bidding war." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'd be amazed what a bundle of Darnassian herbs fetches at my podium, and I'd be delighted to show you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Ah, one of the quiet bidders. You'll be pleased to know the deposit is the same for everyone, and so are the rules." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! A fair sale needs rules, a deposit, and a little theatre. Your spirits would enjoy the theatre." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The hall never closes, but my voice does." },
        { id = "h_again2", text = "Go on, ask while the bidding's slow." },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "Why do I have to pay a deposit?", next = "deposit" },
        { text = "What sells best here?", next = "sells" },
        { text = "Do enchanted goods sell better than plain ones?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What arms sell best at the auction house, Chilton?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What sells best from a hunter's haul, Chilton?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone consigned something that moved?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should holy relics be sold at auction, Chilton?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do people try to sell stolen goods here, Chilton?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does anyone sell things here that were taken from the wild, Chilton?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does stolen property ever turn up at your podium, Chilton?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What makes a fair auction, Chilton?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Chilton.", next = "END" },
      },
    },
    deposit = {
      lines = { { id = "dp_default", text = "Because without one, every rogue in the city would list a rusty dagger for a thousand gold and clog the hall for a week. The deposit keeps you honest, and you get it back if your lot sells." } },
      choices = {
        { text = "And if it doesn't sell?", next = "deposit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deposit2 = {
      lines = { { id = "dp2_default", text = "Then the hall keeps the deposit and the goods come back to you by post. It stings, I know, but a sale that doesn't happen still costs us a clerk's afternoon." } },
      choices = {
        { text = "That's fair. Rules keep the hall honest.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sounds like the hall wins either way.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "s_default", text = "Cloth, always, because every tailor in the city needs it and no tailor wants to fight a gnoll for it. After that, ore and herbs, and then anything that glows." },
        { id = "s_mage", when = { class = "MAGE" }, text = "Cloth first, and then anything that glows, which is your people's fault. Half the bids on enchanted goods come from the Mage Quarter, and they always want it yesterday." },
      },
      choices = {
        { text = "Who buys the glowing things?", next = "glow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glow = {
      lines = { { id = "gl_default", text = "Nobles, mostly, who buy them to look dangerous at dinner. Since Dalaran fell there's been precious little enchanted work coming into the city, so anything with a shine fetches twice what it's worth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay run an auction house of their own, and they think ours is very quaint. I think theirs is very loud, and very crooked, and I'll not say more than that." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's folk put strange things up for auction now and then, and I always sell them. Last month it was a cursed bell, and the buyer's never complained, because he's never been seen again." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins of Gadgetzan sell everything they can lift and some things they can't. I've learned a few tricks of theatre from them, and I use them every day." } },
    background = { { id = "tp_bg", text = "I started as a clerk in this hall, carrying parcels to the post, and talked my way onto the podium. It's the best job in the city for a man who likes the sound of his own voice." } },
    _none = { { id = "tp_none", text = "Never heard of it, friend, and if it were worth anything, I would have." } },
  },
}

-- Auctioneer Fitch: middle podium; careful, quiet, a stickler for the clerk's book.
P:NPC {
  key = "auctioneer_fitch", id = TODO_NPC("Auctioneer Fitch"), name = "Auctioneer Fitch", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "precise" }, values = { "order", "honest" },
  notices = { "purse" },
  impression = {
    first = "Auctioneer Fitch keeps the middle podium and the auction house's book, and he writes every bid down in a small, careful hand. He seemed to think fraud was the greatest danger the city faced.",
    third = "{name} met Auctioneer Fitch, the careful keeper of the auction house's book.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you'll give me your name for the book, we can begin." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I have you in the book already. Welcome back." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than you'd think. I write it all down so nobody can say otherwise. Your spirits could help, if they're honest." } },
      choices = {
        { text = "Honest records keep honest people. Keep writing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fraud's a minor danger. Worry about the Defias.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Twice, and both times they paid the full price and signed in a hand I couldn't read. I wrote it down as a purchase, though I suspect the higher record would call it something else." } },
      choices = {
        { text = "Paying for it was right. Honest coin for an honest burial.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They should have just taken them. Those pelts were never anyone's to sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, and only once, because the Sanctum enchanted my ink after an apprentice tried changing his figures with a cantrip. Now the ledger simply refuses to be wrong, and I find that very restful." } },
      choices = {
        { text = "Good. Honest records keep a city honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A ledger that can't be changed makes me nervous.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the book keeps names forever, and I'd hate to be remembered as the clerk who sold a cursed thing to a stranger. But the law says I must take your goods, and I'm a man who follows the law to the letter." } },
      choices = {
        { text = "The law protects everyone, warlocks too. You're right to follow it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The law's only ink, Fitch. Some days it bends.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They've tried, and every time I've caught them, because my ledgers balance and theirs never do. A dishonest seller once listed a rusted sword as Lothar's own, and I had him out the door before Chilton finished the call." } },
      choices = {
        { text = "Good. Honest dealing is the only kind worth having.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Buyers should know what they're buying. Not your problem.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than you'd think, because two wolf pelts look much alike to most people. I keep a note of every scar and every colour, and I've settled more arguments with my ledger than any guard has with his sword." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sitting very still by my desk, which I appreciate. The last animal in here chewed through a ledger." },
      },
      choices = {
        { text = "Careful records keep everyone honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A pelt's a pelt. Nobody cares about scars.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd like to think so, because mine has gaps, and I lose sleep over every one. If someone else is watching, then perhaps the frauds I miss aren't really missed." } },
      choices = {
        { text = "Nothing escapes the divine, Fitch. Rest easy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Don't count on heaven's ledger, Fitch. Keep your own sharp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I trust the book, and the book trusts no one. That's why it works, and why the Silver Hand's name goes in the same as a goblin's." } },
      choices = {
        { text = "The rules should be the same for everyone. Good.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A paladin's word should be enough, Fitch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I'll write your name down, if you don't mind, though I'm sure there's a better book than mine being kept somewhere above." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'll still write your name down, {class}, because the book doesn't make exceptions, even for the Silver Hand." },
        { id = "h_default", text = "Auctioneer Fitch. Chilton calls the bids and Jaxon charms the buyers, and I write everything down, which is why nobody in this hall has ever been cheated on my watch." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I'll note your name very carefully, if you don't mind. It isn't an accusation; it's simply that the book has a long memory and I'd like you to know that." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll be the first to write the correct price down without my help, I expect. Most of our customers can't do sums." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll write your name in the book like anyone's, though I'll admit my quill hesitates a little." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want to list your spare blades, I suppose, and I'll write every one down correctly, which is my entire job." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Pelts, leather and meat, I suppose, and I'll write each one down so that nobody can claim it was a different hide." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll write you down as I write everyone down, though I don't suppose you'll be bidding on anything with a pelt attached." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Every bid is written down. Fraud is the greatest danger this city faces, and your spirits won't change that." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I'd like to finish this page before the ink dries." },
        { id = "h_again2", text = "Go on, I'm listening, though I'll keep writing." },
      },
      choices = {
        { text = "Show me what's up for auction.", next = "BUSINESS" },
        { text = "Has anyone tried to cheat the hall?", next = "cheat" },
        { text = "Why keep such a careful book?", next = "book" },
        { text = "Has anyone tried to fool your ledger with magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has anyone ever cheated at the auction house, Fitch?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters often have disputes at the auction house, Fitch?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why should your quill hesitate, Fitch?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you believe a higher record is kept, Fitch?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you trust anyone at the auction house, Fitch?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has a druid ever bought a pelt just to bury it, Fitch?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is fraud really so common, Fitch?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Fitch.", next = "END" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "Every month someone tries to sell a painted copper ring as gold, or bid with a name that isn't theirs. The book catches them, because a swindler can change his face but not his handwriting." } },
      choices = {
        { text = "What happens to them?", next = "cheat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat2 = {
      lines = { { id = "c2_default", text = "They are barred from the hall and their names go to the guard, and in a city this size, word gets round. A merchant who can't sell in Stormwind soon has to try his luck in Booty Bay." } },
      choices = {
        { text = "Good. Cheats deserve no second chance.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Everyone deserves a second chance, even a swindler.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      lines = { { id = "b_default", text = "Because coin is only trust that clinks, and trust needs a record. If every buyer knows the book is honest, they'll bid, and if they bid, the whole Trade District eats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay keep their books in a code I've never been able to break. I keep mine in plain Common, because fraud is the greatest sin in this trade, and I'll not commit it." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Steamwheedle Cartel runs auction houses in every goblin port, and they're very good at it, I'll grant them. But they'll sell to anyone, and I'd rather know where my goods are going." } },
    the_stockade = { { id = "tp_the_stockade", text = "Some of the goods that come up for auction have very suspicious origins, and I note every one. I've sent a few names to the Stockade, back when the Stockade held anyone." } },
    background = { { id = "tp_bg", text = "I was a scribe in the House of Nobles once, copying deeds, and I left because I preferred honest bidding to what I saw written there." } },
    _none = { { id = "tp_none", text = "I have nothing written on that, I'm afraid, and I don't repeat what isn't written." } },
  },
}

-- Auctioneer Jaxon: right podium; warm, practical, a mother who knows every regular.
P:NPC {
  key = "auctioneer_jaxon", id = TODO_NPC("Auctioneer Jaxon"), name = "Auctioneer Jaxon", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "warm" }, values = { "practical", "community" },
  notices = { "greenness", "purse" },
  impression = {
    first = "Auctioneer Jaxon knows every regular in Stormwind's auction house by name and most of them by their habits. She gave me sensible advice about prices and then teased me for not taking it sooner.",
    third = "{name} met Auctioneer Jaxon, the warm and practical auctioneer of Stormwind's hall.",
  },
  greetings = {
    { id = "g_default", text = "Hello, love. Selling something, or just looking at what everyone else is selling?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I wondered when you'd be back with more of that cloth." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 }, place = "before",
      text = "Oh, you're new to the hall, aren't you? Don't list your first linen at the price the nobles pay for silk, love, or it'll be back in your mailbox by morning." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "List early, price fair, and don't argue with the market. Your spirits might argue, but the market wins." } },
      choices = {
        { text = "Fair prices win in the long run. Good advice.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The market can be bent. I'll find a way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "More than you'd guess, love, because your lot buy cloth by the stack and sell the bags you make, and you never haggle. Chilton gets nervous when one of you comes to his podium, but I've always found warlocks pay their deposits on time and never argue the fee." },
      },
      choices = {
        { text = "Then I'll keep paying on time, Jaxon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Perhaps I'll argue the fee this time.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jaxon.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That you're here to judge them for selling wolf pelts, mostly, and half of them hide their stock under the counter. The other half double their prices, because they think you'll pay anything to set a beast free." } },
      choices = {
        { text = "Then the ones doubling prices should be reported to the house.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them think what they like. I'll bid however I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every day, dear, because a crowd of excited bidders is the easiest crowd in the city to rob. I keep an eye on the doors and a word with the Watch, and I warn the young ones to keep their purses inside their coats." } },
      choices = {
        { text = "I'll watch out for them too, Jaxon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A careless bidder deserves to lose a purse.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not you, dear, but someone tried it last winter, and the coins vanished from Chilton's tray while he was counting them. He's never been the same, and he weighs every purse twice now." } },
      choices = {
        { text = "That's shameful. No true mage would cheat like that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Chilton should have checked more carefully.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Condition, mostly, and whether it's the sort of thing the new recruits want. Plain mail sells steady, but a good shield with a lion on it will go for twice what a plain one does." } },
      choices = {
        { text = "Then I'll keep my gear in good order.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll paint a lion on everything I sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than last month, because the leatherworkers can't keep up with the new adventurers. A clean wolf hide fetches a fair price, but a torn one's worth half, so skin carefully." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a handsome creature, and well kept. I'll say this for nothing: a beast like that would fetch a fortune, if anyone were fool enough to sell one." },
      },
      choices = {
        { text = "I'll skin carefully and sell honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Torn or not, I'll sell it as clean.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than you'd think, dear, and usually to pay for something they can't ask the Cathedral for. I don't pry, but I make sure they get a fair price." } },
      choices = {
        { text = "That's kind of you, Jaxon. Fairness is its own blessing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they're selling, they should haggle like anyone else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, a good deal, dear, because collectors like Count Ridgewell will pay handsomely for a bit of history. I always ask whether the seller has the right to part with it, though." } },
      choices = {
        { text = "The crest shouldn't be sold for profit, Jaxon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If someone pays well, I'd sell the crest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Hello, dear, a priest! Do ask me before you price your robes, because the Cathedral's novices always ask too little." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Hello, dear, a paladin! Do price that old shield with me before you list it, because the Silver Hand's crest adds a fair bit." },
        { id = "h_default", text = "Auctioneer Jaxon. I have the right-hand podium, and I'll tell you honestly what your goods will fetch, which is more than Chilton will, bless him." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "Hello, dear. Your people bring the loveliest things in from Darnassus, and they never know what to charge for them, so do ask me before you list anything." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Hello, dear. You've a sharp eye for a bargain, I can tell, and I'd rather you used it on the listings than on the bidders' purses." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Hello, dear. A mage at the auction always makes me a little nervous, because I'm never quite sure the gold you bid is really there." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Your gear would fetch more than you think, I'd wager, and I'll tell you to the copper what it's worth." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll have a pack full of hides, I expect, and I'll tell you honestly what each is worth, which is more than Chilton will, bless him." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at my podium! I don't see many of your people bid, dear, so I'll give you the same sensible advice I give everyone, and you'll ignore it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You'll want to sell your bags, I suppose, because your sort always end up with more bags than sense." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You should've listed your goods sooner. Prices are falling, and your spirits can't help that." },
      },
      again = {
        { id = "h_again", text = "What else, love?" },
        { id = "h_again2", text = "Ask me quick, love, before Chilton starts shouting the next lot." },
      },
      choices = {
        { text = "Let me browse the auctions.", next = "BUSINESS" },
        { text = "So how do I price something?", next = "price" },
        { text = "Who are your regulars?", next = "regulars" },
        { text = "Do thieves really work the auction floor?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think I'd bid with conjured gold?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What makes a warrior's gear valuable, Jaxon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What are hides worth right now, Jaxon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do priests often sell their things here, Jaxon?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the Silver Hand's crest really raise the price, Jaxon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the regulars think when a druid walks in, Jaxon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks do much business here, Jaxon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What advice would you give a new seller, Jaxon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Jaxon.", next = "END" },
      },
    },
    price = {
      lines = { { id = "p_default", text = "Look at what's already listed, then come in a few coppers under the cheapest. Greedy folk wait a week for a sale and patient folk eat supper, and I've seen enough of both to know." } },
      choices = {
        { text = "I'd rather hold out for a fair price.", next = "price2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price2 = {
      lines = { { id = "p2_default", text = "Then hold out, love, and good luck to you. Mind you, a fair price is whatever somebody pays, and there's no shame in a quick sale when you need the coin." } },
      choices = {
        { text = "Underselling everyone hurts the honest crafters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Business is business, and the quick sale wins.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = { { id = "r_default", text = "Tailors from the Mage Quarter, buying every bolt of wool we get, and an old soldier who comes in each morning to bid on swords he never wins. And the nobles' stewards, who never say whose money they're spending." } },
      choices = {
        { text = "Why does the soldier never win?", next = "soldier" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "Because he bids a silver and a copper on everything, every time, and he's done it since before the Second War ended. I think he only comes for the company, and I don't mind at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay will sell you anything, love, but they'll charge you twice what it's worth. Our prices are fair, and our deposit's reasonable, and I'll stand by both." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's folk come in to sell their prizes, love, and I've bought a few myself. My favourite's a little stuffed murloc with a crooked smile, and he's on my mantel at home." } },
    the_stockade = { { id = "tp_the_stockade", text = "Since the Stockade riot, love, everyone's selling their silver and buying swords. I've told them it'll pass, and I hope I'm right, because swords don't fetch much once the trouble's over." } },
    background = { { id = "tp_bg", text = "I've a family at home and a podium here, and between the two I never sit down. I wouldn't change it, though." } },
    _none = { { id = "tp_none", text = "No idea, love, but if it's for sale, I'll have heard the price." } },
  },
}

-- Aldwin Laughlin: guild master; registers charters and crests, and takes it seriously.
P:NPC {
  key = "aldwin_laughlin", id = TODO_NPC("Aldwin Laughlin"), name = "Aldwin Laughlin", title = "Guild Master",
  bible = "bibles/unsung.md", role = "worker", tier = "service",
  communities = { "stormwind" }, temper = { "formal" }, values = { "order", "loyal" },
  notices = { "status" },
  impression = {
    first = "Aldwin Laughlin registers Stormwind's guilds and designs their crests, and he treats every charter as a small promise made in front of the crown. He was formal, kind and very fond of his paperwork.",
    third = "{name} met Aldwin Laughlin, who keeps the Stormwind guild registry.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the guild registry. Are you here to found a guild, or to give an old one a new crest?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope your companions are keeping their oaths to one another." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It promises loyalty, to each other and to the crown. A shaman's guild would be unusual, but promises are promises." } },
      choices = {
        { text = "Promises made before the crown should be kept, Aldwin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Charters are paperwork. Loyalty is earned.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A fair few, and they're always very particular about the crest, wanting runes and stars and complicated geometry, which I'm happy to draw. The trouble comes when they want the charter enchanted, because the registry is a matter of ink and law, and I'll not have a spell deciding who's a member." },
      },
      choices = {
        { text = "Ink and law, then. I'll sign it properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "An enchanted charter would keep out traitors, Aldwin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Aldwin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I did, with the moon behind the tree and the owl on a branch, and I'm still rather proud of it. They thanked me with a little bow and then asked if the shield had to be square, which I'm afraid it did." } },
      choices = {
        { text = "Rules are rules, Aldwin. A crest needs a proper shield.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Why square? Let them have a round crest, like the moon.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than you'd think, and they always want crests with no animals, no colours and nothing anyone could recognise. I design them anyway, and I sign them properly, because a charter's a charter whoever holds it." } },
      choices = {
        { text = "A charter should be honest about who signs it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A crest nobody recognises is a sensible crest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Lord Wishock would try, and loudly, but the law says a guild is a guild so long as it pays its fee and breaks no statute. I've already had to talk him out of burning one crest, which was a very handsome crest." } },
      choices = {
        { text = "The law protects every guild equally. Good.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let Wishock rage. A crest is my own affair.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A shield, I think, rather than a sword, because a sword says you fight and a shield says you protect, and that's a better promise. I've designed forty crests this year, and only two had shields on them." } },
      choices = {
        { text = "A shield, then. Protecting others is the better promise.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sword. People should know we fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a beast on a crest is alive in a way a sword never is. I once designed a crest with a stag for a hunting lodge in Elwynn, and the old man who ordered it wept when he saw it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a fine crest, you know. If you ever form a guild, bring it to me, and I'll draw it properly." },
      },
      choices = {
        { text = "A crest should honour the beasts we hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A crest should frighten anyone who sees it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Charitable ones, mostly, for the orphans or the sick, and they always sign properly, which I appreciate. A charter is a promise, and priests understand promises." } },
      choices = {
        { text = "A promise made in faith should never be broken.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A promise is only paper, Aldwin, until someone keeps it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That every knight shall protect the weak and serve the Light, and that the oath binds for life. It's a beautiful thing, and I've often wondered whether every guild should have such a clause." } },
      choices = {
        { text = "An oath for life is the only oath worth taking.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "An oath for life is too much to ask of anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The Church's guilds are the tidiest I register, and their crests are always lovely, though they do insist on so many suns." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Your order's oath is the oldest promise I can think of in this city, {class}, and I keep a copy of the words framed above my desk." },
        { id = "h_default", text = "Aldwin Laughlin, guild master of the Stormwind registry. I keep the charters of every guild that calls this city home, and I design their crests, which I'll admit is the part I enjoy." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "One of the Silver Hand! Your order is the oldest brotherhood I can think of, so you'll understand better than most why I insist that a charter be signed properly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You'll be wanting to register a guild with a very dull name, I expect, and I'll tell you now that I've seen them all." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll register your guild like any other, but I'll warn you that the House of Nobles reads my charters, and they're not fond of horns on a crest." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Thinking of forming a guild, perhaps? Warriors' guilds always want a crest with a sword on it, and I'm always trying to talk them into something more original." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Hunters' guilds always want a wolf or a hawk on their crest, and I'll admit they're the ones I most enjoy designing." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've only ever designed one crest for a guild of your people, and they wanted an owl, a moon and a tree all on one shield." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Your kind found some of the finest guilds in the city, though their charters tend to run to thirty pages." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! A guild charter is a promise made in front of the crown. Would your spirits sign one?" },
      },
      again = {
        { id = "h_again", text = "What else may the registry help you with, friend?" },
        { id = "h_again2", text = "Ask what you will; I enjoy talking about guilds more than filing their papers." },
      },
      choices = {
        { text = "I'd like to see about a charter or crest.", next = "BUSINESS" },
        { text = "How does someone found a guild?", next = "found" },
        { text = "What makes a good crest?", next = "crest" },
        { text = "Do rogues form many guilds, Aldwin?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What crest would you design for a warrior's guild, Aldwin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do you enjoy designing hunters' crests, Aldwin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would the House refuse a warlocks' guild?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many priests found guilds, Aldwin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does the Silver Hand's oath say, Aldwin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did you fit an owl, a moon and a tree on one shield, Aldwin?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages found many guilds, Aldwin?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does a guild charter promise, Aldwin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Aldwin.", next = "END" },
      },
    },
    found = {
      lines = { { id = "f_default", text = "You buy a charter from me, and then you find enough others to sign it, real people who mean it. When it's full, bring it back, and I enter your guild's name in the registry for as long as it stands." } },
      choices = {
        { text = "Why does it need so many signatures?", next = "found2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found2 = {
      lines = { { id = "f2_default", text = "Because a guild of one is only a person with a fancy name. A charter is a promise that you'll stand by each other, and the crown likes to know that a promise has witnesses." } },
      choices = {
        { text = "A guild should answer to the crown.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A guild answers to its members, not the crown.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest = {
      lines = { { id = "c_default", text = "Something simple enough to paint on a shield in a hurry, and bold enough to be seen across a battlefield. The worst crests I've seen tried to say everything at once, and the best said one thing very clearly." } },
      choices = {
        { text = "Which crest is your favourite?", next = "crest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest2 = {
      lines = { { id = "c2_default", text = "There was a company of Lordaeron refugees who chose a plain white tower on grey, for the home they'd lost. I've never designed anything sadder or finer, and I don't know whether they're still alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The heroes in the Valley were a fellowship as much as an army, and every guild charter I write is meant to honour that. A guild is a promise made in front of the crown, and I treat it as such." } },
    silver_hand = { { id = "tp_silver_hand", text = "The Silver Hand was the finest fellowship in the world, and its crest is still the one I most admire. I've designed a hundred crests, and not one of them is as fine as that hand." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn has a crest that's simple and fine, and I'd have designed it myself if they'd asked. They're a good fellowship, by every account, and I'd charter them in a heartbeat." } },
    background = { { id = "tp_bg", text = "I was a herald's clerk before the city's guilds needed a registry, so I've spent my whole life drawing other people's banners." } },
    _none = { { id = "tp_none", text = "That's not in the registry, friend, and I'd rather not guess." } },
  },
}

-- Woo Ping: weapon master in Weller's Arsenal; patient teacher, unflappable.
P:NPC {
  key = "woo_ping", id = TODO_NPC("Woo Ping"), name = "Woo Ping", title = "Weapon Master",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "discipline", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Woo Ping teaches weapons in a corner of Weller's Arsenal and watches how a student stands before he looks at what they hold. He was calm and patient, and said more with one correction than most do with a speech.",
    third = "{name} met Woo Ping, the weapon master who teaches in Weller's Arsenal.",
  },
  greetings = {
    { id = "g_default", text = "Stand still a moment and let me see how you hold yourself. Good, now we may talk." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your feet are better placed than before. I noticed." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, place = "before",
      text = "A priest who wants to fight with more than prayer. I can teach you the staff and the dagger, and you'll find that both reward patience, as your faith does." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, place = "before",
      text = "A hunter. You'll want the crossbow from me, I expect, and perhaps a polearm for when the beast reaches you before your bolt does." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It tells me everything. A steady stance is steady faith. Your spirits would agree, I think." } },
      choices = {
        { text = "Steady feet, steady faith. I'll keep that close.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Faith's for priests. I'll fight my own way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because claws are a shape, and a shape can be taken from you, but a trained hand stays trained. I have seen a druid lose a fight because she could not change, and I would not see it twice." } },
      choices = {
        { text = "Then teach me. A wise fighter needs more than one answer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My claws are enough. I will trust the wild, not the drill.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because one day you will be seen, and on that day you will need reach as well as surprise. The SI:7 agents who train with me learn the sword first and the dagger last, and the ones who complain the loudest live the longest." } },
      choices = {
        { text = "Then I'll learn to fight in the open as well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better never to be seen at all, Woo Ping.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a master who cannot defend himself is only a prisoner who has not been caught yet, and your demon knows this better than you. Learn the staff, so that your servant has a reason to stay obedient." } },
      choices = {
        { text = "I'll learn, then, and depend less on my demons.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demons obey me. They'll never need a reason.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one you can hold longest without tiring, because the fight does not end when your arm does. Most young warriors want the greatest sword, but the best warriors I've taught started with the staff and learned to move." } },
      choices = {
        { text = "I'll start with the basics and learn properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I want the greatest sword. I'll learn as I go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Always, because a hunter who cannot fight up close is a hunter who will one day be caught up close. The polearm keeps the beast at a distance, and the staff lets you move while you wait for your pet to come back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} fights at your side, but it cannot fight for you. Learn the hand, and the two of you will be a true pair." },
      },
      choices = {
        { text = "I'll learn to fight beside my pet.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My pet does the close work. I'll stay back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A priest should learn to protect, which is not the same thing as fighting. Stand well and hold your weapon gently, and you will find that most battles end before they begin." } },
      choices = {
        { text = "I'll learn to protect, and fight only when I must.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If I must fight, I'll fight to win.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That you lean forward, as paladins do, and that you trust the Light more than your feet. Trust the Light, but stand well, because the Light will not catch you if you fall." } },
      choices = {
        { text = "Then I'll train my feet as well as my faith.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light has never let me fall yet.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Even a healer should know the staff and the mace, because the day will come when your prayers are not enough." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Show me your stance, and I'll tell you what your hammer has been doing." },
        { id = "h_default", text = "I am Woo Ping, and I teach the weapons this arsenal sells: swords, staves, daggers, polearms and the crossbow. Gunther sells the steel and I teach the hand, and between us we make soldiers out of shopkeepers." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior should know every weapon, because the one you favour will break at the worst moment. Learn the polearm from me, and learn it well." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage at my door is rare, and welcome. I can teach you the sword or the staff, so that when your spells are spent, you are not yet helpless." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You will want the dagger, of course, but I will teach you the sword too, because a dagger alone is a very short argument." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. Your demons fight for you, I know, but I will teach you the staff all the same, so that you are never only the master of something else." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You will want to learn the polearm, I think, or the staff, for when the beast gets past your arrows." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You will want the staff, I think, or the mace, because your people fight with what the forest gives. I will teach you either, if you are patient." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Show me how you stand. Your spirits may guide you, but your feet carry the weapon." },
      },
      again = {
        { id = "h_again", text = "Ask. A student who asks learns twice as fast." },
        { id = "h_again2", text = "Speak, and keep your feet where I placed them while you do." },
      },
      choices = {
        { text = "Teach me a new weapon.", next = "BUSINESS" },
        { text = "Where do I learn axes, maces or bows?", next = "elsewhere" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Which weapon do you prefer?", next = "prefer" },
        { text = "Why should a rogue learn the sword?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which weapon should a warrior master first, Woo Ping?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Should a hunter train with a melee weapon, Woo Ping?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why does it matter if I fight for myself?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a priest learn to fight, Woo Ping?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does my stance tell you, Woo Ping?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why teach a druid weapons when we fight with claws, Woo Ping?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does a fighter's stance tell you, Woo Ping?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, master.", next = "END" },
      },
    },
    elsewhere = {
      lines = { { id = "e_default", text = "Axes, maces and guns belong to the dwarves, so go to Ironforge and find their weapon master there. For the bow, the night elves of Darnassus are the finest teachers, and they will tell you so themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "How to stand, before I ever put a weapon in your hand. A fighter who stands badly is beaten by their own weight, and no blade can save them from that." } },
      choices = {
        { text = "I'd rather learn to strike first.", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "Everyone would, and everyone who learns that way spends their second lesson on the floor. Patience is cheap, and a fool's courage is very expensive." } },
      choices = {
        { text = "Then I'll learn patience first, master.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "I learn best by getting knocked down.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prefer = {
      lines = { { id = "pr_default", text = "The staff, because it forgives a mistake and punishes arrogance. But I don't tell my students which weapon to love; that is something they discover on their own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The fighters of the Gurubashi Arena stand badly and swing worse, and they die young. I'd teach them, but they'd not listen, because they think gold teaches better." } },
    second_war = { { id = "tp_second_war", text = "I was a boy in the Second War, and I watched soldiers who stood badly die for it. I teach stance before steel now, because I've learned which matters more." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons fight with a stance I've never seen anywhere else, low and heavy, like the mountain itself. I'd like to study it, though I'd not like to be on the end of it." } },
    background = { { id = "tp_bg", text = "I have taught here for many years, and before that I trained the city's recruits. It is better work to teach a hand than to command a thousand of them." } },
    _none = { { id = "tp_none", text = "I don't know that. Ask me how to hold a blade, and I'll answer properly." } },
  },
}

-- Marda Weller: the other counter of Weller's Arsenal; brisk, sharp with the ledger.
P:NPC {
  key = "marda_weller", id = TODO_NPC("Marda Weller"), name = "Marda Weller", title = "Weapons Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "honest" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Marda Weller keeps the second counter of Weller's Arsenal and the shop's books with it. She was brisk and sharp, and plainly the reason the arsenal still turns a profit.",
    third = "{name} met Marda Weller, who keeps the books and the second counter at Weller's Arsenal.",
  },
  greetings = {
    { id = "g_default", text = "Weller's Arsenal. If Gunther's busy talking about balance, I can sell you a sword much faster." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? Good, because that blade you bought should be needing an edge by now." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 10 }, place = "before",
      text = "Fresh from Northshire, are you? Then buy something cheap and sturdy from me today, and save your silver for something good once you know what you like." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Look at that edge, it's nearly gone. Get it seen to before you go anywhere, or the next thing you hit will be the last." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I keep every copper of them, because Gunther can't count past ten. Your spirits must be better with numbers than he is." } },
      choices = {
        { text = "Good books keep a good business, Marda.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Numbers don't matter. Weapons sell themselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because Gunther once threw a hammer at an imp that was sniffing round his forge, and missed, and hit a customer, and I spent a week writing apologies. He's a good smith and a poor judge of what to throw things at, so it's easier if your friend waits by the door." },
      },
      choices = {
        { text = "It'll wait by the door, Marda.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let Gunther throw. My imp dodges better than customers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Marda.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Three this season, which is three more than last, so the night elves are either arming or finally finding the city. I'll sell to whoever pays, though I'll admit your people haggle more politely than anyone." } },
      choices = {
        { text = "I'll pay your price, Marda. A fair price needs no haggling.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll haggle politely too, Marda, and I'll win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not twice, because I keep a ledger, a cudgel and a cousin in the Watch, in that order. The ledger is usually enough, because nobody wants their name written down in a weapons shop." } },
      choices = {
        { text = "A ledger and the Watch are what keep a city honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ledgers only catch the careless ones, Marda.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of the old Dalaran masters do, because they think a mage holding a sword is a mage who's given up on thinking. The young ones disagree, mostly because they've been to Westfall and seen what the Defias do to anyone who runs out of mana." } },
      choices = {
        { text = "The old masters are right. A mage should trust their art.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The young ones have it right. Survive first, theory later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "He talks about nothing else, and I love him for it, but somebody has to sell the blades or we'd have no roof. Still, he's right, and I've never once sold a sword that came back because it was badly made." } },
      choices = {
        { text = "A craftsman who cares is worth listening to.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Just tell me the price. I don't need a lecture.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hand axes and short swords, light enough to swing while you're backing away, which is how most hunters fight up close. Gunther says a hunter's axe is the hardest thing to get right, and he grumbles about it for days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is very well behaved, thank you. The last one knocked over a rack of daggers, and Gunther hasn't stopped talking about it." },
      },
      choices = {
        { text = "Quality steel is worth the extra coin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The cheapest axe will do. It's for emergencies.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than they used to, which tells you something about the roads. A priest who can't defend themselves gets taken first, and I'd rather sell a mace than hear about it." } },
      choices = {
        { text = "I'll carry one, but faith is my first defence.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A good mace has saved more priests than prayer.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A steady trade, and they're the only customers who never haggle. Gunther says it's because they're honourable, and I say it's because they don't know what things cost." } },
      choices = {
        { text = "A fair price deserves to be paid in full.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Perhaps I'll learn to haggle, then, Marda.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a mace or a staff, I expect, and Gunther will want to lecture you about balance, so I'd buy quickly." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "You'll know your way to the back wall, {class}, since that's where every paladin goes first." },
        { id = "h_default", text = "Marda Weller. Gunther forges and fusses, Woo Ping teaches, and I keep the counter and the ledger, which is why this shop still has a roof." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, so it's a mace or a two-hander you're after. We've a few heavy pieces on the back wall, though Gerik Koen in Old Town has more if ours don't suit you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll be after the daggers, which Gunther will have told you I count. He's right, and I count the coin too." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in an arsenal. Woo Ping will want to teach you the staff, and you'd do well to listen, whatever the Sanctum says." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Gunther will tell you about balance for an hour, so let me tell you the price before he starts." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! We've axes and short swords for the close work, and Woo Ping teaches the polearm if you've a mind to learn." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at Weller's. You'll want a staff or a mace, and you'll pay at my counter, because Gunther will give you a speech about balance and forget the price." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Dagger or staff, and I'll write it in the ledger, and you can keep your companion out of Gunther's way." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Gunther's busy judging grips. Need anything, or just here to talk to the spirits?" },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I've a customer waiting at the other counter." },
        { id = "h_again2", text = "Quickly, then; the shop doesn't run itself." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How's business since the auction house opened?", next = "auction" },
        { text = "Who buys the most weapons?", next = "buyers" },
        { text = "Has anyone stolen from you, Marda?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Sanctum disapprove of weapons training?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does Gunther really talk about balance that much, Marda?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does Weller's sell for hunters, Marda?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do many priests buy weapons, Marda?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you sell much to the Silver Hand, Marda?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you sell many staves to druids, Marda?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why keep my companion away from Gunther, Marda?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you keep the arsenal's books, Marda?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it, Marda.", next = "END" },
      },
    },
    auction = {
      lines = { { id = "a_default", text = "Gunther grumbles about it, but I've no complaint, because the folk who buy cheap blades there come to us when they break. Woo Ping's students keep us busy too, though they knock things off the walls." } },
      choices = {
        { text = "Does Woo Ping send you much custom?", next = "woo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woo = {
      lines = { { id = "w_default", text = "Every student he teaches walks ten paces to my counter afterwards, and I call it the best arrangement this shop ever made. Gunther says it was his idea, and I let him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Adventurers, mostly, now that the army buys straight from Ironforge. And frightened merchants who want something to keep under the counter in case the Defias come into the city." } },
      choices = {
        { text = "Do you sell to anyone who asks?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "b2_default", text = "Anyone who pays and doesn't look like a cutthroat, and I've turned a few away. Gunther thinks I'm too fussy, and I think he's too trusting." } },
      choices = {
        { text = "Good. Better to turn away a buyer than arm a thief.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A shopkeeper can't judge everyone. Sell, and let the guard sort it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay would sell their mothers for a good margin, and I respect that more than I'd say aloud. Gunther thinks we should be more honest, and I think we should be more profitable." } },
    the_stockade = { { id = "tp_the_stockade", text = "Since the Stockade riot, every noble in the city wants a sword, and Gunther's working night and day. I keep the books, and the books have never looked better, and I've never slept worse." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The fighters of the Gurubashi Arena buy weapons in bulk, and they pay in advance, which I appreciate. I don't ask what happens to them after, because the books don't need to know." } },
    background = { { id = "tp_bg", text = "I've kept this counter with Gunther for many years, and I know every blade on these walls by its price." } },
    _none = { { id = "tp_none", text = "No idea. Ask me what a sword costs, though, and I'll tell you to the copper." } },
  },
}

-- Keldric Boucher: arcane goods at Pestle's Apothecary; knowledgeable, a little superior.
P:NPC {
  key = "keldric_boucher", id = TODO_NPC("Keldric Boucher"), name = "Keldric Boucher", title = "Arcane Goods Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "learned" }, values = { "craft", "proud" },
  notices = { "arcane", "craft" },
  impression = {
    first = "Keldric Boucher sells vials and arcane goods in Pestle's Apothecary and can explain every powder on his shelves at length. He liked being asked, and liked being right even more.",
    third = "{name} met Keldric Boucher, who sells arcane goods at Pestle's Apothecary.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Pestle's. If it comes in a vial or a pouch, I most likely have it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Running short on something already, are we?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" }, place = "before",
      text = "An alchemist, I can always tell by the stains. You'll be wanting vials, and I'd buy a few more than you think you need, because you'll drop one." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" }, place = "before",
      text = "A mage, good. You'll want arcane powder for your brilliance and runes for your portals, and I keep both, which is more than the Mage Quarter's shops can always say." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "All of them, but especially the volatile ones. Your spirits might enjoy them too, though I'd keep them away from the fire." } },
      choices = {
        { text = "Knowledge shared is knowledge doubled, Keldric.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your powders. I don't need them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I sell vials, and what goes into them is the buyer's business, though I'll tell you which ones are crystal and which are mere glass. A good poison needs a good vial, and a bad vial leaks into your coat lining, and I've seen what that does to a man." },
      },
      choices = {
        { text = "Crystal, then, and for honest purposes.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the crystal, and the purpose is mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Keldric.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They carve them from something that isn't quite wood and isn't quite glass, and I've studied one for a year without learning how. I'd give a great deal to know, though I suspect the answer is that a tree agreed to it." } },
      choices = {
        { text = "Study it properly, Keldric, and write down what you learn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some secrets aren't for writing down. Leave it be, Keldric.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Sand from the Westfall shore, blown thick and cooled slowly, the way the old Dalaran glassblowers did it before they went home behind their wall. Kyra says I lecture, and she's right, but glass deserves a lecture." } },
      choices = {
        { text = "Craft done slowly and properly is worth the price.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fast and cheap serves most people well enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, and I didn't ask, but the glass frosted over from the inside and I had to throw the whole case in the canal. I've had my doubts about the fish ever since." } },
      choices = {
        { text = "I'm sorry for that. I'll fill mine far from here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A screaming vial sounds rather useful to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a cheap vial cracks in a pack, and a cracked vial means a warrior with no healing potion when he needs one most. I sell only the thick glass, and I've seen soldiers come back alive because of it." } },
      choices = {
        { text = "Then I'll buy the good vials. My life depends on it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Glass is glass. I'll buy whatever's cheapest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The wise ones do, for their beasts as much as for themselves, because a hunter far from town can't run to Morgan every time their pet gets bitten. A simple salve in a good vial can save a beast's life." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would benefit from a salve kept in your pack. Ask Morgan for the recipe, and buy the vial from me." },
      },
      choices = {
        { text = "I'll keep a salve for my pet in my pack.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My pet heals on its own. It's tough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The glass is clearer and the stopper's tighter, so yes, though the Cathedral says it's the blessing that matters. I'd say a blessing in a leaky vial is a blessing on the floor." } },
      choices = {
        { text = "The blessing matters more than the glass, Keldric.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Good glass is half the work.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Vials for holy water, mostly, and some for oils, and they always want them sturdy. A broken vial in the middle of a fight is no use to anyone, and I've made sure mine don't break." } },
      choices = {
        { text = "Good preparation saves lives. Your work matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "In a fight, I'd sooner trust my hammer than a vial.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want holy water vials, and I've the best in the city, though I'll grant the Cathedral thinks theirs are better." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll not need my vials, I expect, but if you ever need to carry holy water to the front, ask me first." },
        { id = "h_default", text = "Keldric Boucher. Morgan Pestle has the potions, Kyra has the reagents by the door, and I keep the vials and the finer arcane goods for alchemists and spellcasters who know what they're doing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll know your reagents, then, and you'll know that cheap vials crack under a heating charm, though mine don't." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I sell you the same vials as anyone, but I'll ask you not to fill them in my shop, because the last time, one of them screamed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, among the vials. You'll want potions, I expect, and Morgan has those, but I'll tell you why the glass matters." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll not need my vials, I suppose, unless you brew your own salves, which some hunters do." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll want vials for your herbs, and I'll tell you why mine won't spoil them, whether you ask or not." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Ah, someone with careful hands. You'll want the stoppered vials, then, the ones that don't leak in a pocket." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Do your spirits use powders? Let me explain the virtues of each vial on my shelves." },
      },
      again = {
        { id = "h_again", text = "Anything else? I do enjoy a question I can answer." },
        { id = "h_again2", text = "Do continue; I rarely get questions from anyone who listens to the answers." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What makes a vial so special?", next = "vial" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "What makes your vials better, Keldric?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why does the glass matter for a potion, Keldric?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters brew their own remedies, Keldric?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What screamed in your vial, Keldric?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are your vials really better than the Cathedral's, Keldric?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have you supplied the Silver Hand before, Keldric?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the night elves make their own vials, Keldric?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you sell anything for poisons, Keldric?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's your favourite powder, Keldric?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Keldric.", next = "END" },
      },
    },
    vial = {
      lines = { { id = "v_default", text = "A good vial doesn't react with what you put in it, and a bad one ruins a potion before you've corked it. The cheap ones are fine for healing draughts, but anything stronger wants leaded glass." } },
      choices = {
        { text = "Why leaded glass?", next = "vial2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vial2 = {
      lines = { { id = "v2_default", text = "Because it holds a stronger draught without cracking, though nobody can tell me exactly why. The gnomes have theories, which is what gnomes always have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "Ironforge, mostly, since Dalaran fell and its suppliers with it. The dwarves make fine glass but they charge for every bubble, and I pass the cost along, I'm sorry to say." } },
      choices = {
        { text = "You could try cheaper suppliers.", next = "stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = { { id = "s2_default", text = "I could, and I'd sell cheaper glass that cracks in an alchemist's hand. Morgan won't have it in the shop, and frankly, neither will I." } },
      choices = {
        { text = "Quality is worth paying for.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Most buyers would never know the difference.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "The arcane goods on my shelves were once supplied by Dalaran, and the Kirin Tor's quality was beyond compare. I make do with what I can find now, and I explain the difference to anyone who asks." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor were the finest arcanists in the world, and I'd have joined them if I'd had the talent. Instead I sell their leftovers, and I know more about them than most of their students did." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad bought reagents from my master in Dalaran, years ago, and he was very particular. I've often wondered whether any of them went into the plague, and I've decided not to wonder too hard." } },
    background = { { id = "tp_bg", text = "I studied alchemy for a few years before I learned I preferred selling the tools to using them. Kyra and I have worked in Pestle's shop ever since." } },
    _none = { { id = "tp_none", text = "That's outside my shelves, I'm afraid." } },
  },
}

-- Kyra Boucher: reagents by the door of Pestle's; quick, friendly, knows every class's needs.
P:NPC {
  key = "kyra_boucher", id = TODO_NPC("Kyra Boucher"), name = "Kyra Boucher", title = "Reagent Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "quick" }, values = { "practical", "community" },
  notices = { "class" },
  impression = {
    first = "Kyra Boucher sells reagents just inside the door of Pestle's Apothecary and knows what every sort of spellcaster runs out of. She seemed to have memorised half the city's habits by what they bought.",
    third = "{name} met Kyra Boucher, the reagent seller at Pestle's Apothecary.",
  },
  greetings = {
    { id = "g_default", text = "Welcome! Let me know if you need help finding anything; I keep it all right here by the door." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Let me guess what you've run out of." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", minLevel = 34 }, place = "before",
      text = "Light feathers, I expect, for when you'd rather float than fall. The Cathedral's priests buy them by the handful before they go out into the hills." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, place = "before",
      text = "A druid! I keep seeds for your rebirth and berries for your gifts, though I'll admit I don't fully understand what you do with them." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Reagents for their spells, mostly. I've learned what every sort needs by watching what they buy." } },
      choices = {
        { text = "You know your customers well, Kyra. That's good business.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find what I need myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a paladin once saw what one of yours had bought and followed him all the way to the Mage Quarter, and I lost both customers. Plain paper keeps the peace, and it keeps my door busy." } },
      choices = {
        { text = "The paladin was only doing his duty, Kyra.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Plain paper's wise. Paladins should mind their own business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Mine comes with a receipt, and his comes with a wink and a question you'd better not answer. I've nothing against Jasper, mind, but I'd rather my powder ended up in an honest pocket." } },
      choices = {
        { text = "I'll take the receipt, Kyra. Honest trade suits me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the wink. Receipts leave trails.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only for someone else, usually a mage they're travelling with who's forgotten to stock up. I always tell them to make the mage carry it, because a warrior's pack is full enough." } },
      choices = {
        { text = "I'll carry what my companions need. That's teamwork.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The mage can carry their own reagents.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A few, buying for their friends, and they always ask whether any of it would help their pets. None of it would, but I like that they ask." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is sniffing at the reagents, and I'd stop it if I were you, because some of these smell nicer than they are." },
      },
      choices = {
        { text = "I'd rather ask than risk my pet's health.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My pet's tough. A sniff won't hurt it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because you only need one when someone's died, and I've sold enough of them to know what that means. I wrap each one carefully, and I try not to think about where it's going." } },
      choices = {
        { text = "Every one I use brings someone back. That's a blessing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death is part of war, Kyra. You can't wrap it away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Symbols of divinity, I expect, {class}, and I've a fresh crate, though I always hope your sort never has to use them." },
        { id = "h_default", text = "Kyra Boucher. Reagents for every kind of spellcaster, right by the door so nobody has to walk past Keldric's lectures on glass. Keldric is my kin, so I'm allowed to say that." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. You'll want symbols of divinity, I expect, though I hope you never need to use one. The Silver Hand's people always look so solemn when they buy them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, so you'll want your reagents quickly and quietly, and I've learned to wrap them in plain paper for your sort." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want flash powder, and I'd like you to buy it from me rather than Jasper Fel. His is good, but mine's honest." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? You've wandered to the reagent counter, I'm afraid, and none of this is any use to you, unless you've a mage at home." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've nothing for you here, I'm afraid, unless you've a spellcaster in your party who needs looking after." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your kind runs out of totems, I'd guess. Or do spirits keep you stocked?" },
      },
      again = {
        { id = "h_again", text = "Who's next, then? Oh, still you; what else have you run short of?" },
        { id = "h_again2", text = "Anything else? I've another customer at the door." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "What do priests buy from you?", next = "priest", when = { class = "PRIEST" } },
        { text = "What do mages run out of?", next = "mage", when = { class = "MAGE" } },
        { text = "Who are your best customers?", next = "customers" },
        { text = "Why wrap a warlock's reagents in plain paper?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's the difference between yours and Jasper's?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors ever buy reagents, Kyra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you get many hunters at your counter, Kyra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why hope paladins never use their symbols, Kyra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do shamans usually buy, Kyra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Kyra.", next = "END" },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Light feathers for levitating, and holy candles for the prayers that strengthen a whole company at once. The Cathedral's sisters buy candles by the box before they go to the front." },
        { id = "pr_low", when = { maxLevel = 33 }, text = "Not much yet, I'm afraid, but once you learn to float, you'll need light feathers, and later holy candles for the bigger prayers. I'll be here when you do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Runes of teleportation, always, because a mage would rather walk home by magic than by foot. Arcane powder, too, once you're strong enough to grant your brilliance to a whole group." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "The Mage Quarter, when its own shops run dry, and the Cathedral, which never does. Rogues buy flash powder from me and never look me in the eye, which I find rather sweet." } },
      choices = {
        { text = "You sell to rogues without asking questions?", next = "rogues" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogues = {
      lines = { { id = "r_default", text = "Flash powder isn't a crime, and half the guard's own scouts buy it from me. If I asked every customer what they meant to do with their reagents, I'd sell nothing at all." } },
      choices = {
        { text = "Leave it, then. What they do isn't your concern.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A careful seller should still keep an eye out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "The mages who come in here all mourn Dalaran, and they all buy the same reagents they'd have bought there. I've learned to stock what they need before they know they need it." } },
    burning_legion = { { id = "tp_burning_legion", text = "The warlocks from under the Lamb buy their reagents by the bag, and they never say what for. I don't ask, because I'd rather not know, and because they pay very well." } },
    holy_light = { { id = "tp_holy_light", text = "The priests buy holy candles by the box, and I've never seen one of them haggle. I think the Light teaches them patience, or maybe it just teaches them to count." } },
    background = { { id = "tp_bg", text = "Keldric and I have kept these shelves in Morgan Pestle's shop for years, and I like the door better than the back room." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that, but if it fits in a pouch, ask me." } },
  },
}
