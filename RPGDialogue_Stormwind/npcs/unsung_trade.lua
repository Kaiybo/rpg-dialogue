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
  notices = { "purse", "watch", "lock_shards" },
  impression = {
    first = "She says nothing was ever stolen, as if reassuring herself.",
    third = "{name} met Olivia Burnside, a banker of Stormwind who is very proud of her vaults.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "Welcome to the Bank of Stormwind. Your valuables are safer here than anywhere else in the kingdom, and I mean that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your box is exactly where you left it, as it always will be." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } }, place = "before",
      text = "Goodness, that's a heavy purse to be carrying about the Trade District. Do let us look after some of it before a cutpurse does." },
    { id = "n_rogue", cat = "watch", when = { class = "ROGUE" }, place = "before",
      text = "I'll keep my eyes on your hands while we talk, if you don't mind. It's nothing personal; I do it with everyone who walks the way you do." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Your pack's as cold as a vault, which is funny, because the warlock boxes downstairs run warm. I keep wondering where the heat goes, and now I think it might be going into bags like yours." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never once, I promise you. I tell everyone that twice, because some people seem to doubt it. Your spirits won't find any gaps." } },
      choices = {
        { text = "A well-kept vault is worth trusting, Olivia.", next = "BACK", reply = "Thank you. That's the nicest thing anyone's said about the vault this week.", fx = { align = { order = 1 } } },
        { text = "Everything has gaps. Someone will find them.", next = "BACK", reply = "Not in this vault, they won't. I check twice, and then I check again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't look, and I'd never tell, but the boxes kept by the Lamb's people tend to be the warmest in the vault, which is odd for a stone room underground. Nothing has ever been stolen from this bank, though I sometimes wonder whether that's the locks or that nobody wants to open those boxes." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I don't look, and I'd never tell, but the warlock boxes are always the warmest in the vault, and standing beside your servant I think I finally know why. Nothing has ever been stolen from this bank, and with that thing at the counter, I doubt anyone in the queue would dare try today." },
      },
      choices = {
        { text = "The locks, Olivia. I'll keep my box quiet.", next = "BACK", reply = "Thank you. The locks thank you too, I'm sure.", fx = { align = { order = 1 } } },
        { text = "Mine stays warm. That's all you need to know.", next = "BACK", reply = "That's quite enough, thank you. I'll not ask.", fx = { align = { order = -1 } } },
        { text = "Something else, Olivia.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A cat got in once, and the guards chased it for an hour before it turned out to be only a cat. I've had the bars narrowed since, so I watch every animal in the hall." } },
      choices = {
        { text = "Watch away. A bank should guard against every shape.", next = "BACK", reply = "Thank you for understanding. The bars stay narrow.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You'll never guard against everything, Olivia, so don't try.", next = "BACK", reply = "Perhaps not, but I'll try anyway. It's what we're paid for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the vaults were built by the same stonemasons who built the walls, and they did a very good job before the crown stopped paying them. I do sometimes wonder whether any of them still remember the plans." } },
      choices = {
        { text = "The crown should have paid them. That was dishonourable.", next = "BACK", reply = "It was, and the masons built the vault anyway. I think of them every morning.", fx = { align = { honor = 1 } } },
        { text = "The crown pays what it can. Masons are masons.", next = "BACK", reply = "Perhaps, but they built very good vaults. I'd have paid them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I've never looked, and I never will, because a bank that looks inside its boxes is just a cupboard. The boxes are warm to the touch, mind, and one of them hums on rainy days." } },
      choices = {
        { text = "Good. Some boxes are better left shut.", next = "BACK", reply = "Exactly so. In all my years at this counter I've never once opened a box without its owner, and I don't mean to start.", fx = { align = { honor = 1 } } },
        { text = "I'd have peeked by now. Curiosity's half of magic.", next = "BACK", reply = "Then you'd make a very poor banker, I'm afraid. The boxes stay shut.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It goes to the family named in the ledger, if there is one, and to the crown if there isn't. I've handed over a great many accounts to widows in the last few years, and I've never grown used to it." } },
      choices = {
        { text = "I'll name my family. They'll need it more than the crown.", next = "BACK", reply = "That's wise. It's the saddest part of my work, and the kindest.", fx = { align = { honor = 1 } } },
        { text = "Let the crown have it. Gold's no use to the dead.", next = "BACK", reply = "Then the crown will thank you, I suppose. It rarely says so.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Often, because a fine pelt fetches more than a pouch of silver if you wait for the right buyer. We had a whole winter's worth of wolf pelts from Duskwood last year, and the whole vault smelled of wet dog until spring." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can't come into the vault, I'm sorry to say. The rules are very clear on beasts, though I'll admit it's very sweet." },
      },
      choices = {
        { text = "Patience pays. I'll wait for the right buyer.", next = "BACK", reply = "Patience is the whole of banking. You'd do well here.", fx = { align = { order = 1 } } },
        { text = "Quick coin is better than waiting.", next = "BACK", reply = "Then you'll find the market's very quick to undercharge you. I'd wait.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I couldn't possibly say, but I'll tell you it's very old and very carefully wrapped. Nothing's ever been stolen from the Bank of Stormwind, and I'll not test that with anything holy." } },
      choices = {
        { text = "Holy things belong in the Cathedral, not a vault.", next = "BACK", reply = "Perhaps, but the Cathedral asked us to keep it. I'll not argue with the Archbishop.", fx = { align = { light = 1 } } },
        { text = "A vault's safer than any altar. The Church chose well.", next = "BACK", reply = "They did, and we'll keep it safe. Nothing's ever been stolen.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Tried, yes, and failed every time, though I'll not tell you how. Nothing's ever been stolen from the Bank of Stormwind, and I'd like to keep saying that until I retire." } },
      choices = {
        { text = "The law protects honest folk's savings. Good.", next = "BACK", reply = "The law and our vault both. Not a single copper has gone missing on my watch.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Any lock can be picked. You're trusting luck, Olivia.", next = "BACK", reply = "Perhaps, but they've tried, and failed. I'll trust the stonemasons.", fx = { align = { order = -1 } } },
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
          text = "A rogue. I'll say it again, because it bears repeating: no one has ever stolen a thing from this bank, and I'll not have you be the first." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! We keep a few boxes for the Sanctum, and they always come with a note asking us not to open them, which I think is rather sweet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Your gold is safe with us, I promise, whatever happens to you out in Westfall." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Pelts and trophies in the vault? We can store them, though I'll ask you to make sure they're properly salted first." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll say it before you ask: nobody has ever stolen from this bank, not even a cat that walked through the bars." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've the Lamb's chill on you. I'll open your box like anyone else's, but I'll ask you to keep nothing in it that breathes." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, welcome. Nothing has ever been stolen from these vaults, not once, so your spirits will find nothing to complain about." },
      },
      again = {
        { id = "h_again", text = "Is there something more the Bank of Stormwind can do for you?" },
        { id = "h_again2", text = "Please, ask whatever you like. The queue can wait a moment." },
      },
      choices = {
        { text = "I'd like to see my box.", next = "BUSINESS" },
        { text = "Nothing has ever been stolen, not even once?", next = "thief" },
        { text = "All sorts keep their money here, I'd wager.", next = "who" },
        { text = "How has nobody ever robbed this bank?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Sanctum must keep odd things in your boxes.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Some warriors must never come back for their gold, Olivia.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess hunters store pelts in the bank, Olivia.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does the Cathedral keep in your vaults, Olivia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Has anyone ever tried to rob the bank, Olivia?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has anyone tried to slip into the vaults in another shape, Olivia?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do the Lamb's people keep in your vaults, Olivia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
        { text = "Good. A thief belongs behind bars.", next = "BACK", reply = "That's what I tell myself, though I still feel sorry for him.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Desperate people try desperate things. Hard to blame him.", next = "BACK", reply = "I suppose not. He did look very hungry.", fx = { align = { order = -1 } } },
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
  notices = { "purse", "trophy", "lock_soulstone" },
  impression = {
    first = "He says the bank sees more of the kingdom than the king.",
    third = "{name} met Newton Burnside, a dry and observant banker of Stormwind.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_default", text = "Good day to you. Is it a deposit or a withdrawal? I can usually tell, but I've been wrong once or twice." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Let me guess: something heavier going in than coming out." },
  },
  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } }, place = "before",
      text = "You'll not need a large box, I think, and there's no shame in that. Most fortunes in this city began with a small one." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { class = "WARLOCK", carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "You carry a soulstone, and a man learns a great deal from what someone keeps in reserve. Most folk save gold, but you've saved a life, and I've never had a deposit box that could hold one." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everyone's fears, counted out in gold and silver. A shaman's deposit would be interesting, though I'd wager your spirits don't use coin." } },
      choices = {
        { text = "A careful bank keeps a careful kingdom, Newton.", next = "BACK", reply = "I keep this one very carefully, I assure you. Thank you.", fx = { align = { order = 1 } } },
        { text = "Hoarding coin out of fear? That's no way to live, Newton.", next = "BACK", reply = "Perhaps, but fear keeps my vault full. I'll not argue with it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Notes, chiefly, and a surprising number of them in cipher, as though the bank's clerks had nothing better to do than steal spells. The older mages put away things from Dalaran, before the city was walled off, and they visit them the way other folk visit a grave." },
      },
      choices = {
        { text = "Then I'll treat those boxes with respect, Newton.", next = "BACK", reply = "Thank you. They're the last of Dalaran in this city, some of them.", fx = { align = { light = 1 } } },
        { text = "Dalaran's gone. Those things should be studied, not mourned.", next = "BACK", reply = "Perhaps, but not by me. The owners might come back.", fx = { align = { light = -1 } } },
        { text = "Something else, Newton.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Seeds, mostly, wrapped in cloth and labelled in your script, and the odd letter home that was never sent. I find it touching, though I'd never say so to the depositor." } },
      choices = {
        { text = "A bank is a fine place for seeds. Keep them safe.", next = "BACK", reply = "They're safe here, I promise. The vault is cool and dry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Seeds belong in soil, Newton, not locked in a vault.", next = "BACK", reply = "They do, eventually. Until then, they're my responsibility.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Soldiers keep letters, nobles keep jewels, and the quietest customers keep nothing at all, which tells me most of all. I suspect at least one of the city's quieter offices rents a box here under a very dull name." } },
      choices = {
        { text = "A banker's silence is a matter of honour.", next = "BACK", reply = "I've kept mine for forty years, and I don't intend to stop now. Thank you.", fx = { align = { honor = 1 } } },
        { text = "Secrets are worth something. I'd sell that one.", next = "BACK", reply = "Then you'd make a very poor banker. My silence is not for sale.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A gentleman from the Mage Quarter tried to deposit a small bound box that scratched at night, and we gave it back to him the very next morning. I've stopped asking what people keep, but I do still listen." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A gentleman from the Mage Quarter tried to deposit a bound box that scratched at night, and we gave it back the next morning. I hope you're not thinking of anything like that, because your demon has been looking at the vault door since you arrived, and I'd rather not hear what scratches back." },
      },
      choices = {
        { text = "You were right to refuse it. Some things don't belong here.", next = "BACK", reply = "We were, and I'm still glad of it. The night clerk didn't sleep for a week.", fx = { align = { light = 1 } } },
        { text = "A scratching box is harmless if it's bound properly.", next = "BACK", reply = "Perhaps, but I'd rather not find out. Our vault is for things that stay still.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Things they want to come back for, mostly, and that tells you more about them than any medal. One old soldier kept a child's drawing of a horse in his box for twenty years, and never once let me see it." } },
      choices = {
        { text = "Keep it for him. Everyone needs something waiting at home.", next = "BACK", reply = "They do, and the drawing of the horse is still in its box. I hope he comes back.", fx = { align = { light = 1 } } },
        { text = "I keep nothing. Attachments slow you down.", next = "BACK", reply = "Then you'll have nothing to come back for. A sad thought.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Teeth, claws and feathers, mostly, and one memorable hunter kept a stuffed murloc that he swore was the biggest ever caught in Westfall. I believed him, because nobody would make that up." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Teeth, claws and feathers, mostly, and one memorable hunter kept a stuffed murloc that he swore was the biggest ever caught in Westfall. Your {pet} has its eye on the coin trays, I notice. Clever beast; it knows where the shiny things are kept." },
      },
      choices = {
        { text = "A trophy honours the hunt, not my pride.", next = "BACK", reply = "A fine sentiment. The murloc's owner might disagree.", fx = { align = { honor = 1 } } },
        { text = "A trophy shows everyone what I can do.", next = "BACK", reply = "Very loudly, yes. The murloc's in the back, and it smells like it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Letters from home, mostly, and keepsakes from people they couldn't save. I've seen priests open a box just to look at a ribbon, and then close it again without taking anything out." } },
      choices = {
        { text = "I still say their names at night. That's part of the calling.", next = "BACK", reply = "That's a kind calling. I'm glad to keep their keepsakes for them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keepsakes only weigh you down. Better to let them go.", next = "BACK", reply = "Perhaps, but they keep coming back to look. I'll keep the boxes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the Silver Hand has been everywhere, and lost more than it kept. I've seen boxes left untouched for years, and I keep them, because someone might come back." } },
      choices = {
        { text = "Keep them, Newton. Some of us will come home.", next = "BACK", reply = "I will. That's what the vault is for.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If no one comes back, the boxes should go to the living.", next = "BACK", reply = "They will, eventually, but not yet. Someone might still come.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Your boxes are always the same, candles and letters and a spare robe, and I find that rather comforting." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your order's boxes tell me more about the kingdom than the crown's dispatches do, if you'll forgive me saying so." },
        { id = "h_default", text = "Newton Burnside. I keep boxes and accounts for most of the Trade District, and I've learned that what people put away tells you more about them than anything they say across a counter." },
        { id = "h_lowlevel", when = { maxLevel = 15 }, text = "A new face, and a young one. Most of our new customers start with a few spare linen shirts and a sword they've outgrown, so don't be shy about what you bring." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. What someone puts in a box tells me most of what I need to know, and I'll be very interested to see what you put in yours." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Something in your satchel moved just now. I've a rule that nothing alive goes in the boxes, and I'd like to remind you of it before you ask." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. People keep strange things in their boxes, and warriors keep the strangest: old letters, lockets and the occasional broken sword." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll keep trophies in your box, I suppose, as hunters do, and you'll tell me a story about each one if I let you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. A box tells me about its owner, and I confess I'm curious what your people put away, since you seem to own so little." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I've a fair idea what's in your box already, and I'd wager it's mostly reagents and a scroll you've forgotten about." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The bank sees more of the kingdom than the king does, and I've never seen a shaman deposit before." },
      },
      again = {
        { id = "h_again", text = "Something else? I have time, and the ledger certainly isn't going anywhere." },
        { id = "h_again2", text = "Ask away. I'll answer what a banker can." },
      },
      choices = {
        { text = "Open my box, please.", next = "BUSINESS" },
        { text = "People put away all sorts, I expect.", next = "boxes" },
        { text = "My box must say something about me.", next = "mine" },
        { text = "You must learn a lot about people from their boxes.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd wager warriors keep odd things in their boxes, Newton.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
        { text = "Quite right, some things should stay private.", next = "BACK", reply = "Quite right, and it's kept me in business for decades.", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "If it were dangerous, I'd want somebody to look.", next = "BACK", reply = "Then you'd be the first to look, and the first to regret it. The boxes stay shut.", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mi_default", text = "It says you come back alive, and not every name in my ledger does. The ones who stop coming are the reason we keep the boxes sealed for a year before anyone may claim them." },
        { id = "mi_priest", when = { class = "PRIEST" }, text = "That you keep more cloth than coin, which is common among the Cathedral's people. You'd be surprised how many priests store a spare set of vestments and nothing else." },
      },
      choices = {
        { text = "The year can't be the end of it.", next = "after" },
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
  notices = { "kin", "travel", "lock_shadow" },
  impression = {
    first = "He would rather hear where I have been than what I brought.",
    third = "{name} met John Burnside, the cheerful banker at the first window of the Bank of Stormwind.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_default", text = "Good day, and welcome in! First window on the right, which is me, and I'm free." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Where's the road taken you since I last saw you?" },
  },
  notice = {
    { id = "n_human", cat = "kin", when = { race = "Human" }, place = "before",
      text = "Stormwind born, are you? Then you'll know my family's name from the old bank, before the orcs burned it down with everything else." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The queue's moved back a pace from you, I notice, and nobody in it quite knows why. It's the shadow on you, I think, though I'd rather be friendly to it than have it in a mood." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They tell me about Ironforge, Darnassus and Westfall, and all sorts besides. A shaman's stories must be wonderful. Do tell." } },
      choices = {
        { text = "Kindness at the door is a fine welcome, John.", next = "BACK", reply = "Thank you! It's the least a banker can do, and the best part of the job.", fx = { align = { light = 1 } } },
        { text = "Stories don't pay. Let's talk coin.", next = "BACK", reply = "Coin it is, then, though I'd still love a story. Maybe next time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Every morning, on their way from the Quarter to the auction house, with their pockets full of whatever they enchanted the night before. They're polite, mostly, but they've a way of looking at the counter as though they could turn it to sand if they cared to, and I'm always glad when they don't." },
      },
      choices = {
        { text = "I'll leave your counter as it is, John.", next = "BACK", reply = "Thank you! It's very well polished, I'll have you know.", fx = { align = { order = 1 } } },
        { text = "Sand would be an improvement, John.", next = "BACK", reply = "Ha! You're probably right. I'll ask the next mage to sweep it.", fx = { align = { order = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Your boots have Darkshore sand in the seams and Wetlands mud on top, and I've heard that road described a hundred times. Mind, I've never been further than Goldshire, so you'll have to tell me if I'm right." } },
      choices = {
        { text = "Stay at your window, John. Somebody has to keep the bank.", next = "BACK", reply = "I will. Someone has to, and I like it here.", fx = { align = { order = 1 } } },
        { text = "Leave the window and see it yourself someday, John.", next = "BACK", reply = "Maybe someday. For now, the window's view is plenty.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only as a joke, mostly, though my uncle lost a ring across this counter years ago and never found out how. We've all smiled a little more carefully since, and kept our rings in our pockets." } },
      choices = {
        { text = "Robbing a banker at his own window is a mean trick.", next = "BACK", reply = "It was, and my uncle never quite forgave the counter.", fx = { align = { honor = 1 } } },
        { text = "Whoever did it had skill. You have to admire that.", next = "BACK", reply = "I suppose you do, though my uncle never did.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Only the queue, because nobody wants to stand behind a thing with horns for ten minutes. My cousins say I'm too friendly, but I'd rather be friendly to your sort than give you a reason to be otherwise." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Only the queue, and you can see it for yourself, because they've all shuffled a pace back from your demon and none of them will step forward. My cousins say I'm too friendly, but I'd rather be friendly to a warlock than give one a reason to be otherwise." },
      },
      choices = {
        { text = "I'll send it away while I'm here. Your customers deserve that.", next = "BACK", reply = "Thank you! The queue will be very grateful.", fx = { align = { light = 1 } } },
        { text = "If they mind, they can let me go first.", next = "BACK", reply = "Ha! I'll ask them, but I doubt they'll be so generous.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most of the Barracks, because a soldier's wages are safer here than in a barracks chest. I see them every payday, and I can always tell which ones are about to march, because they leave everything with me." } },
      choices = {
        { text = "I'll leave my coin here and march light.", next = "BACK", reply = "A wise soldier. Your coin will be here when you come home.", fx = { align = { order = 1 } } },
        { text = "I'll take my coin with me. You never know.", next = "BACK", reply = "Then I'll worry for you, a little. Do come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and some keep it in a sack under their bedroll, and I worry for the second sort. A hunter who's been robbed on the road once usually becomes my best customer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and some keep it in a sack under their bedroll, and I worry for the second sort. And {pet} would be your guard, I suppose, if you did keep your coin on the road. A fine guard, too, by the look of those teeth." },
      },
      choices = {
        { text = "I'll trust the bank with my coin. It's safer.", next = "BACK", reply = "Good. I'll sleep easier knowing it.", fx = { align = { order = 1 } } },
        { text = "I'll keep my coin close, where I can see it.", next = "BACK", reply = "Then mind your bedroll, friend. The roads aren't kind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some of them, about the sick they've healed and the dead they've buried, and some just stand there quietly, which tells its own story. I listen either way, because I think everyone should have somebody at the door." } },
      choices = {
        { text = "Sometimes an ear does more than a bandage, John.", next = "BACK", reply = "Sometimes. I'm glad to be the ear, when it's needed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some stories are better left untold, John.", next = "BACK", reply = "Some are, and I'll not ask for them. I'll just listen.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Near enough, from the mud on their boots and the look in their eye. Paladins come in tired and leave lighter, and I like to think the bank has something to do with that." } },
      choices = {
        { text = "Folk remember who held the door for them, John.", next = "BACK", reply = "They do, and I'm glad to be the one at the door.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's the gold that lightens us, John, not the welcome.", next = "BACK", reply = "It's both, I think. I'll keep holding the door anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Welcome, welcome, and tell me where you've been, because the Cathedral's people always come back with the best stories." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Welcome, welcome, and you'll have been somewhere dangerous, I can see it in the way you're standing." },
        { id = "h_default", text = "John Burnside. I've the first window, so I see everyone before my kin do, and I like to think I give the city a friendly face when they've only come to count their coin." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! We've had a few of your people in since Gnomeregan, and each one has asked to see how the locks work. I'm not allowed to show you, I'm sorry to say." },
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
        { text = "Has the bank always stood here, John?", next = "old" },
        { text = "Who comes in through that door?", next = "door" },
        { text = "Do you really count your fingers, John?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I expect plenty of warriors bank with you, John.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever bank their earnings, John?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do my companions bother your customers, John?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do priests really tell you their stories, John?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I doubt you can really tell where someone's been, John.", next = "xapala", when = { class = "PALADIN" } },
        { text = "You seem to know I came by way of Auberdine, John.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd wager plenty of mages come through your door, John.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do travellers tell you about the world, John?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "Not this building; the old bank burned when the Horde sacked the city. My grandfather carried the ledgers out in a handcart, and that's how we knew whose gold was whose when the stonemasons built this place again." } },
      choices = {
        { text = "Your grandfather sounds like a brave man.", next = "old2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old2 = {
      lines = { { id = "o2_default", text = "Brave, or too stubborn to leave the books behind, which is the Burnside way. He used to say a city can be rebuilt but a debt forgotten is gone forever." } },
      choices = {
        { text = "He was right, and debts should be honored.", next = "BACK", reply = "He was, and I'll keep his ledger honest. Thank you.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Some debts are better forgotten, I'd say.", next = "BACK", reply = "Not in a Burnside's ledger. We remember everything.", fx = { align = { honor = -1 } } },
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
  notices = { "purse", "craft", "lock_soulstone" },
  impression = {
    first = "He talks about a linen cloth as though it were a crown.",
    third = "{name} met Auctioneer Chilton, a showman of Stormwind's auction house.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "Buying or selling, friend? Either way, step up; the hall is open and the bidding is warm." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the hall! Did your last lot sell, or are we trying again with a better price?" },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking" } }, place = "before",
      text = "A crafter! Then you're the reason this hall exists, because adventurers sell us the raw stuff and folk like you turn it into something worth bidding on." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Somebody's put a soulstone on you, and it's the one thing I've seen that this hall could never sell, because it's already spoken for. I can feel it faintly, like a second pulse in the room." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It needs rules, mostly. Everyone bids in good faith, and the deposit keeps them so. Your spirits must have rules too." } },
      choices = {
        { text = "Rules keep the market fair. I respect that.", next = "BACK", reply = "Splendid! Rules keep the bidding honest, and honest bidding keeps it lively.", fx = { align = { order = 1 } } },
        { text = "Theatre sells better than rules.", next = "BACK", reply = "It does, my friend, and I give them both! Let the bidding begin!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Never knowingly, and I check every consignment against the guard's list of reported thefts, which runs to forty pages this season. The auction house is a temple to fair dealing, and I'll not have it turned into a fence's market, however good the goods." },
      },
      choices = {
        { text = "Fair dealing it is, Chilton. My goods are clean.", next = "BACK", reply = "Splendid! Clean goods sell fastest, my friend.", fx = { align = { honor = 1 } } },
        { text = "Your list is long, Chilton, but never complete.", next = "BACK", reply = "It's never complete, but it's very thorough. Try me.", fx = { align = { honor = -1 } } },
        { text = "Something else, Chilton.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everything here was taken from somewhere, friend, from a mine or a field or a wolf that didn't want to give up its pelt. I can't ask where every hide came from, but I do ask the seller to sign for it, and that's the rule." } },
      choices = {
        { text = "Ask more, Chilton. A fair sale needs a fair source.", next = "BACK", reply = "I try, my friend, but the market's very busy. I'll ask what I can.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Not your concern, Chilton. Sell what comes and keep the theatre going.", next = "BACK", reply = "The theatre goes on, my friend, and so does the bidding!", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Always, and sometimes better than they deserve, because buyers see a glow and stop asking questions. I warn them when I can, but an auctioneer can only call what's put in front of him." } },
      choices = {
        { text = "Then sellers should be honest about their glow.", next = "BACK", reply = "They should, and some are. I warn the buyers when I can.", fx = { align = { honor = 1 } } },
        { text = "If buyers don't ask, that's their own fault.", next = "BACK", reply = "It is, mostly. Buyer beware, my friend, that's the oldest rule.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Once, a book that turned its own pages at night, and the guards refused to sit with it. It sold for a fortune in gold to a buyer I never saw, and I've tried very hard not to wonder where it went." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Once, a book that turned its own pages at night, and the guards refused to sit with it, much as my clerks are refusing to sit near your companion now. It sold for a fortune to a buyer I never saw, and I've tried very hard not to wonder whether he had a thing like that one at his heel." },
      },
      choices = {
        { text = "You should have burned it, Chilton.", next = "BACK", reply = "Perhaps I should have, but it fetched a great deal of gold. I'll think on it.", fx = { align = { light = 1 } } },
        { text = "A book like that deserves a worthy owner.", next = "BACK", reply = "It found one, I suppose, though I never saw him. I'd rather not have.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Good swords and good mail, especially anything with an enchantment on it, and they go faster than I can call the bids. A warrior who knows his gear can make a fair living selling what he finds on the road." } },
      choices = {
        { text = "I'll sell what I don't need at a fair price.", next = "BACK", reply = "A fair price sells quickest, my friend. You'll do well.", fx = { align = { honor = 1 } } },
        { text = "I'll sell high and let the buyers fight over it.", next = "BACK", reply = "Ha! Let them fight, my friend, and I'll call every bid.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Leather, by far, since the tailors and leatherworkers are always hungry for it. Last week a single pristine hide from a Redridge bear went for three times what the vendors offer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Leather, by far, since the tailors and leatherworkers are always hungry for it. Your {pet} can stay by the podium, but please don't let it put its paw on anything. The bidders get very jumpy." },
      },
      choices = {
        { text = "I'll price my goods fairly for everyone.", next = "BACK", reply = "Splendid, my friend. Fair prices keep the hall busy.", fx = { align = { honor = 1 } } },
        { text = "I'll ask whatever the market will bear.", next = "BACK", reply = "The market will bear a great deal, my friend. I'll call it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better at auction than in a back alley, where anyone might take them. I keep the bidding honest and the deposits fair, and I like to think the Light approves of a well-run sale." } },
      choices = {
        { text = "Holy things shouldn't be sold at all, Chilton.", next = "BACK", reply = "Perhaps not, but they'd be sold somewhere. Better here, with rules.", fx = { align = { light = 1 } } },
        { text = "A fair sale is fair, whatever's being sold.", next = "BACK", reply = "Exactly so. The Light approves of fair dealing, I'm sure.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Now and then, and the deposit helps, because a thief doesn't like to pay first. Fitch keeps the book, and between us we catch most of them." } },
      choices = {
        { text = "The guard should hear of every theft you catch.", next = "BACK", reply = "They hear of every one, my friend. Fitch writes it all down in that little book of his.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they've paid the deposit, it's their business.", next = "BACK", reply = "It's their business until they're caught. Then it's the guard's.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The auction house sees a fair few holy relics, and I always make sure they go to a good home." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your order's old gear fetches a fine price, and I'll see it's sold fairly if you ever bring any in." },
        { id = "h_default", text = "Auctioneer Chilton, at the left podium. Leave your goods with me, set your price and your deposit, and every buyer in Stormwind will have the chance to fight over them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Your people do run a fine auction in Ironforge, but I'll wager ours is warmer, and the bidders here haven't learned to haggle as hard." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Enchanted goods always fetch a fine price at my podium, so if you've anything that glows, I'd be delighted to see it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's a cold about you that I don't care for. I'll list your goods like anyone's, though I'd ask that nothing you consign is still moving." },
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
        { text = "I'd wager something sells better than the rest here.", next = "sells" },
        { text = "Do enchanted goods sell better than plain ones?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I expect arms sell well at the auction house, Chilton.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A hunter's haul must sell well here, Chilton.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone consigned something that moved?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Holy relics shouldn't be sold at auction, Chilton.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
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
        { text = "That's fair. Rules keep the hall honest.", next = "BACK", reply = "Splendid, and they keep the hall in business besides.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sounds like the hall wins either way.", next = "BACK", reply = "It does, my friend, but so do you, eventually. Patience.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "s_default", text = "Cloth, always, because every tailor in the city needs it and no tailor wants to fight a gnoll for it. After that, ore and herbs, and then anything that glows." },
        { id = "s_mage", when = { class = "MAGE" }, text = "Cloth first, and then anything that glows, which is your people's fault. Most bids on enchanted goods come from the Mage Quarter, and they always want it yesterday." },
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
  notices = { "purse", "lock_shards" },
  impression = {
    first = "He thinks fraud is the greatest danger the city faces.",
    third = "{name} met Auctioneer Fitch, the careful keeper of the auction house's book.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Good day. If you'll give me your name for the book, we can begin." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I have you in the book already. Welcome back." },
    { id = "g_word_deceived", when = { word = { "deceived", "caughtLying" } }, text = "I've heard a story about you that I've not yet written down, and I'd prefer to keep it that way. Shall we begin honestly?" },
  },
  notice = {
    { id = "n_purse_heavy", cat = "purse", when = { money = { min = 1000000 } }, place = "before",
      text = "That purse rides heavy, if you'll forgive a clerk for noticing. Large sums are where the mistakes hide, so I'll be counting twice today." },
    { id = "n_purse_light", cat = "purse", when = { money = { max = 500 } }, place = "before",
      text = "If you're selling to raise coin, I'd advise a modest starting bid. A greedy first price has stranded more goods in this hall than any thief." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 20 } },
      text = "You've at least twenty soul shards on you, and if you listed them I'd be required to record each one by origin. I'd hate to write twenty murlocs into the permanent book, so please don't." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Often enough, and I write it all down so nobody can say otherwise. Your spirits could help, if they're honest." } },
      choices = {
        { text = "Honest records keep honest people. Keep writing.", next = "BACK", reply = "I will. That's my whole job, and I'm very good at it.", fx = { align = { order = 1 } } },
        { text = "Fraud's a minor danger. Worry about the Defias.", next = "BACK", reply = "The Defias are the guard's problem. Fraud is mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Twice, and both times they paid the full price and signed in a hand I couldn't read. I wrote it down as a purchase, though I suspect the higher record would call it something else." } },
      choices = {
        { text = "Paying for it was right. Honest coin for an honest burial.", next = "BACK", reply = "That's how I recorded it, and I'm glad you agree. The ledger was satisfied, at least.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They should have just taken them. Those pelts were never anyone's to sell.", next = "BACK", reply = "Perhaps they should have, but the ledger says sold, and the ledger doesn't lie.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, and only once, because the Sanctum enchanted my ink after an apprentice tried changing his figures with a cantrip. Now the ledger simply refuses to be wrong, and I find that very restful." } },
      choices = {
        { text = "Good. Honest records keep a city honest.", next = "BACK", reply = "Exactly so. I sleep very well beside that ledger.", fx = { align = { order = 1 } } },
        { text = "A ledger that can't be changed makes me nervous.", next = "BACK", reply = "It makes the frauds nervous, which is the point. Honest folk find it soothing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the book keeps names forever, and I'd hate to be remembered as the clerk who sold a cursed thing to a stranger. But the law says I must take your goods, and I'm a man who follows the law to the letter." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because the book keeps names forever, and I'd hate to be remembered as the clerk who sold a cursed thing to a stranger whose demon read the ledger over my shoulder. But the law says I must take your goods, so I'll write your name, and I'll trust the thing beside you doesn't need one." },
      },
      choices = {
        { text = "The law protects everyone, even people like me. Follow it.", next = "BACK", reply = "Thank you. I follow it to the letter, however little I like it.", fx = { align = { order = 1 } } },
        { text = "The law's only ink, Fitch. Some days it bends.", next = "BACK", reply = "Not in my ledger, it doesn't. The ink stays where I put it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They've tried, and every time I've caught them, because my ledgers balance and theirs never do. A dishonest seller once listed a rusted sword as Lothar's own, and I had him out the door before Chilton finished the call." } },
      choices = {
        { text = "Good. Honest dealing is the only kind worth having.", next = "BACK", reply = "It is, and my ledgers prove it. Lothar's sword was nothing of the kind.", fx = { align = { honor = 1 } } },
        { text = "Buyers should know what they're buying. Not your problem.", next = "BACK", reply = "It is my problem, when they come back to complain. I'd rather catch it first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "All the time, because two wolf pelts look much alike to most people. I keep a note of every scar and every colour, and I've settled more arguments with my ledger than any guard has with his sword." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sitting very still by my desk, which I appreciate. The last animal in here chewed through a ledger." },
      },
      choices = {
        { text = "Careful records keep everyone honest.", next = "BACK", reply = "They do. I've settled a dozen quarrels with a single note about a torn ear.", fx = { align = { order = 1 } } },
        { text = "A pelt's a pelt. Nobody cares about scars.", next = "BACK", reply = "The buyers care, when they're arguing. I keep the notes for them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd like to think so, because mine has gaps, and I lose sleep over every one. If someone else is watching, then perhaps the frauds I miss aren't really missed." } },
      choices = {
        { text = "Nothing escapes the divine, Fitch. Rest easy.", next = "BACK", reply = "I'd like to rest easy, and some nights I do. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Don't count on heaven's ledger, Fitch. Keep your own sharp.", next = "BACK", reply = "I won't. My own ledger is the only one I can read.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I trust the book, and the book trusts no one. That's why it works, and why the Silver Hand's name goes in the same as a goblin's." } },
      choices = {
        { text = "The rules should be the same for everyone. Good.", next = "BACK", reply = "Exactly. The book doesn't care who you are.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A paladin's word should be enough, Fitch.", next = "BACK", reply = "Perhaps, but the book needs ink, not words. I'll write it down anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I'll write your name down, if you don't mind, though I'm sure there's a better book than mine being kept somewhere above." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'll still write your name down, {class}, because the book doesn't make exceptions, even for the Silver Hand." },
        { id = "h_default", text = "Auctioneer Fitch. Chilton calls the bids and Jaxon charms the buyers, and I write everything down, and so nobody in this hall has ever been cheated on my watch." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I'll note your name very carefully, if you don't mind. It isn't an accusation; it's simply that the book has a long memory and I'd like you to know that." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll be the first to write the correct price down without my help, I expect. Most of our customers can't do sums." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "The Lamb's crowd, by your look. I'll write your name in the book like anyone's, though I'll admit my quill hesitates a little." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want to list your spare blades, I suppose, and I'll write every one down correctly, which is my entire job." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Pelts, leather and meat, I suppose, and I'll write each one down so that nobody can claim it was a different hide." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll write you down as I write everyone down, though I don't suppose you'll be bidding on anything with a pelt attached." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Every bid in this hall is written down, because fraud is the danger I fear most, and your spirits won't change that." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I'd like to finish this page before the ink dries." },
        { id = "h_again2", text = "Go on, I'm listening, though I'll keep writing." },
        { id = "h_again3", text = "Yes? I've turned to a fresh page, so whatever you say next will have plenty of room." },
      },
      choices = {
        { text = "Show me what's up for auction.", next = "BUSINESS" },
        { text = "I'd wager someone has tried to cheat the hall.", next = "cheat" },
        { text = "Why keep such a careful book?", next = "book" },
        { text = "Has anyone tried to fool your ledger with magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Someone must have cheated at the auction house, Fitch.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I expect hunters squabble here now and then, Fitch.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why should your quill hesitate, Fitch?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you believe a higher record is kept, Fitch?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you trust anyone at the auction house, Fitch?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has a druid ever bought a pelt just to bury it, Fitch?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is fraud really so common, Fitch?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Who are the other two auctioneers?", next = "colleagues" },
        { text = "What's the strangest lot you've ever written down?", next = "strange" },
        { text = "Why does the hall take a cut of every sale?", next = "fees" },
        { text = "You don't trust a soul in here, do you?", next = "trust" },
        { text = "Where did you learn to keep books like that?", next = "nobles" },
        { text = "I worked these streets as a cutpurse once.", next = "xpickpocket", when = { origin = "human_canal_pickpocket" } },
        { text = "You'll know my family's name, I expect.", next = "xnoble", when = { origin = "human_minor_noble" } },
        { text = "I wore the Watch's colours before I took up the road.", next = "xguard", when = { origin = "human_city_guard" } },
        { text = "I'd like to sell what I carried out of Gnomeregan.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Your book doesn't frighten me, Fitch.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Thank you, Fitch.", next = "END" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "Every month someone tries to sell a painted copper ring as gold, or bid with a name that isn't theirs. The book catches them, because a swindler can change his face but not his handwriting." } },
      choices = {
        { text = "I'd guess cheats don't get off lightly.", next = "cheat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat2 = {
      lines = { { id = "c2_default", text = "They are barred from the hall and their names go to the guard, and in a city this size, word gets round. A merchant who can't sell in Stormwind soon has to try his luck in Booty Bay." } },
      choices = {
        { text = "Good. Cheats deserve no second chance.", next = "BACK", reply = "They get none here. The book remembers.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Everyone deserves a second chance, even a swindler.", next = "BACK", reply = "Perhaps, but not in my hall. They can try in Ironforge.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      lines = { { id = "b_default", text = "Because coin is only trust that clinks, and trust needs a record. If every buyer knows the book is honest, they'll bid, and if they bid, the whole Trade District eats." } },
      choices = {
        { text = "How far back do your books go?", next = "book_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_old = {
      lines = { { id = "bo_default", text = "To the day the hall reopened after the city was rebuilt, forty-one volumes, and I could tell you what sold on any morning you care to name. The first entry is a dented helm, sold for nine copper to a man who said it had been his father's." } },
      choices = {
        { text = "Where do you keep forty-one volumes?", next = "book_vault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_vault = {
      lines = { { id = "bv_default", text = "The finished ones go across the square to the bank, in a box the Burnsides keep for me, and the current one never leaves my hand. I'm told I sleep with it, which is an exaggeration; it sleeps on the chair beside me." } },
      choices = {
        { text = "That seems a very lonely way to live, Fitch.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Colleagues
    colleagues = {
      lines = { { id = "co_default", text = "Chilton on the left podium, who calls bids as though he were announcing a royal wedding, and Jaxon on the right, who can sell a cracked pot to a potter by asking after his mother. I'm in the middle, which suits me, because the middle is where you can hear both lies." } },
      choices = {
        { text = "Tell me more about Chilton.", next = "colleagues_chilton" },
        { text = "And Jaxon?", next = "colleagues_jaxon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    colleagues_chilton = {
      lines = { { id = "cc_default", text = "He started as a clerk, like me, and discovered he had a voice that carried, and he's never stopped using it since. He calls me the conscience of the hall, and he means it kindly, mostly." } },
      choices = {
        { text = "Every hall needs a conscience.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    colleagues_jaxon = {
      lines = { { id = "cj_default", text = "Warm, quick, and kinder to the old soldier who bids a silver and a copper on everything than I would have the patience to be. I write his bids down every time, I'll have you know, though they've never once won." } },
      choices = {
        { text = "You write down bids that never win?", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- His past
    nobles = {
      lines = { { id = "n_default", text = "In the House of Nobles, copying deeds and debts for men who never once looked up from their wine. I left after the rebuilding, because I didn't care for what I saw written there." } },
      choices = {
        { text = "What did you see written there?", next = "nobles_saw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nobles_saw = {
      lines = { { id = "ns_default", text = "Sums owed to the stonemasons who rebuilt this city, written in, then written smaller, then struck through with a note that said the treasury would review it. It's still under review, I imagine, and the masons are in Westfall now, wearing red.",
          fx = { learn = { "stonemasons", "defias" } } } },
      choices = {
        { text = "Did you ever tell anyone what you saw?", next = "nobles_silent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nobles_silent = {
      big = true,
      lines = { { id = "nsi_default", text = "Whom would I tell? The ledger was the House's own, the men who struck the lines sat in the House, and I was a scribe with a family to feed. I keep this book honest instead, and some nights I think that's penance and some nights I think it's cowardice." } },
      choices = {
        { text = "You did right to keep your head down. Nobody listens to scribes.", next = "BACK", reply = "That's what I've told myself for years. It doesn't help much.", fx = { align = { honor = -1 } } },
        { text = "You should have spoken. It might have changed everything.", next = "BACK", reply = "It might have, and I've thought about it every night since. Thank you for saying it.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The trade
    strange = {
      lines = { { id = "st_default", text = "A jar of something from Duskwood that the seller swore was a ghost, and which did, I'll grant, knock twice on the lid whenever Chilton raised his voice. It sold for four gold to a gentleman from the Mage Quarter, and I wrote it down as a jar." } },
      choices = {
        { text = "Do you ever turn goods away?", next = "strange_stolen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_stolen = {
      big = true,
      lines = { { id = "ss_default", text = "Stolen goods, when I can prove it, which isn't as often as I'd like. A good deal comes through here off dead Defias in Westfall, and the law says what's taken off a bandit belongs to the one who took it, though I don't always like how it was taken." } },
      choices = {
        { text = "Spoils of the fight belong to whoever fought. Fair's fair.", next = "BACK", reply = "That's the law, and I follow it. It still feels strange.", fx = { align = { light = -1 } } },
        { text = "Looting the dead sits ill with me, bandits or not.", next = "BACK", reply = "It sits ill with me too, but the law is clear. I write it down.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fees = {
      lines = { { id = "fe_default", text = "The deposit keeps people from listing rubbish to clutter the hall, and you get it back if your goods sell. The cut keeps the lamps lit and the guards paid, and a share goes to the crown, which I write down very clearly, so nobody can say it went into my pocket." } },
      choices = {
        { text = "The crown takes a share of everything, it seems.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "I trust the book, which is not the same as distrusting you. If everyone is written down, nobody has to be suspected, and that's a kindness, though people rarely take it as one." } },
      choices = {
        { text = "That's a strange sort of kindness, Fitch.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xpickpocket = {
      big = true,
      lines = { { id = "xpp_default", text = "Then I've almost certainly written you down already, under someone else's name, as the buyer of a ring that wasn't yours to sell. I'll not dig it up, provided whatever you sell me today was lawfully come by." } },
      choices = {
        { text = "It was. I've left that life behind.", next = "BACK", reply = "I'm glad to hear it. I'll leave the old entry where it is.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Honest enough. Don't ask too closely.", next = "BACK", reply = "Then I'll not ask. The book won't either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnoble = {
      lines = { { id = "xn_default", text = "I've copied it, at least, in a deed or two, and I'll say nothing more, because the House of Nobles taught me to forget what I copy. Your family's coin spends here the same as a farmer's, and I write it down in the same hand." } },
      choices = {
        { text = "That's how it should be.", next = "BACK", fx = { affinity = 1 } },
        { text = "What did those deeds say?", next = "nobles_saw" },
      },
    },
    xguard = {
      lines = { { id = "xg_default", text = "Then you'll know the names I've sent to the barracks, and perhaps you carried one or two of them yourself. It's a comfort to meet someone else who believes a list can keep the peace." } },
      choices = {
        { text = "A list and a truncheon, in my experience.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Many of your people have stood where you're standing, selling the only things they carried out, and I write each lot down with a note of where it came from. One day someone may want to know what Gnomeregan was, and my book will remember it.",
          fx = { learn = { "gnomeregan" } } } },
      choices = {
        { text = "Thank you for that, Fitch.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xr_default", text = "It isn't meant to frighten anyone, only to remember them. Though I'll admit the ones who say it doesn't frighten them are usually the ones I end up writing about twice." } },
      choices = {
        { text = "Fair enough. Your hall, your rules.", next = "BACK", reply = "Thank you. The hall thanks you too.", fx = { align = { order = 1 } } },
        { text = "Rules are for people who can't get around them.", next = "BACK", reply = "Then you'll find the book very difficult to get around. I wish you luck.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay keep their books in a code I've never been able to break. I keep mine in plain Common, because fraud is the greatest sin in this trade, and I'll not commit it." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Steamwheedle Cartel runs auction houses in every goblin port, and they're very good at it, I admit. But they'll sell to anyone, and I like to know where my goods are going." } },
    the_stockade = { { id = "tp_the_stockade", text = "Some of the goods that come up for auction have very suspicious origins, and I note every one. I've sent a few names to the Stockade, back when the Stockade held anyone." } },
    stonemasons = { { id = "tp_stonemasons", text = "I copied the debts owed to the stonemasons, once, and I watched the lines grow smaller on the page. I'll say no more than that in a public hall." } },
    background = { { id = "tp_bg", text = "I was a scribe in the House of Nobles once, copying deeds, and I left because I preferred honest bidding to what I saw written there." } },
    _none = { { id = "tp_none", text = "I have nothing written on that, I'm afraid, and I don't repeat what isn't written." } },
  },
}

-- Auctioneer Jaxon: right podium; warm, practical, a mother who knows every regular.
P:NPC {
  key = "auctioneer_jaxon", id = TODO_NPC("Auctioneer Jaxon"), name = "Auctioneer Jaxon", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "warm" }, values = { "practical", "community" },
  notices = { "greenness", "purse", "lock_steed" },
  impression = {
    first = "She gives sensible advice on prices and teases you for ignoring it.",
    third = "{name} met Auctioneer Jaxon, the warm and practical auctioneer of Stormwind's hall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "Hello, love. Selling something, or just looking at what everyone else is selling?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I wondered when you'd be back with more of that cloth." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 }, place = "before",
      text = "Oh, you're new to the hall, aren't you? Don't list your first linen at the price the nobles pay for silk, love, or it'll be back in your mailbox by morning." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "You rode a burning horse through the Trade District, love, and every buyer in the hall came out to look at it. If I could auction the attention, we'd both retire." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "List early, price fair, and don't argue with the market. Your spirits might argue, but the market wins." } },
      choices = {
        { text = "Fair prices win in the long run. Good advice.", next = "BACK", reply = "Spoken like a proper trader, love. You'll do well here.", fx = { align = { honor = 1 } } },
        { text = "The market can be bent. I'll find a way.", next = "BACK", reply = "Some try, love, and the market bends them back. Good luck.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "More than you'd guess, love, because your lot buy cloth by the stack and sell the bags you make, and you never haggle. Chilton gets nervous when one of you comes to his podium, but I've always found the cellar folk pay their deposits on time and never argue the fee." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "More than you'd guess, love, because your lot buy cloth by the stack and never haggle, though yours is the first to bring a servant up to the podium. Chilton's already backed away to the far end, so it's me you're dealing with today, and I don't mind the smell of brimstone if the deposit's on time." },
      },
      choices = {
        { text = "Then I'll keep paying on time, Jaxon.", next = "BACK", reply = "Thank you, love. Chilton will be relieved.", fx = { align = { honor = 1 } } },
        { text = "Perhaps I'll argue the fee this time.", next = "BACK", reply = "Argue away, love, but the fee's the fee. Chilton will faint.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jaxon.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That you're here to judge them for selling wolf pelts, mostly, and some of them hide their stock under the counter. The rest double their prices, because they think you'll pay anything to set a beast free." } },
      choices = {
        { text = "Then the ones doubling prices should be reported to the house.", next = "BACK", reply = "They should, and I've reported a few. The house is watching.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them think what they like. I'll bid however I please.", next = "BACK", reply = "Bid away, love. The house doesn't mind, so long as you pay.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every day, dear, because a crowd of excited bidders is the easiest crowd in the city to rob. I keep an eye on the doors and a word with the Watch, and I warn the young ones to keep their purses inside their coats." } },
      choices = {
        { text = "I'll watch out for them too, Jaxon.", next = "BACK", reply = "Thank you, love. Every pair of eyes helps.", fx = { align = { honor = 1 } } },
        { text = "A careless bidder deserves to lose a purse.", next = "BACK", reply = "Perhaps, love, but I'd rather they didn't lose it here. Keep an eye out.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not you, dear, but someone tried it last winter, and the coins vanished from Chilton's tray while he was counting them. He's never been the same, and he weighs every purse twice now." } },
      choices = {
        { text = "That's shameful. No true mage would cheat like that.", next = "BACK", reply = "That's what I said, love. Chilton agrees, now.", fx = { align = { honor = 1 } } },
        { text = "Chilton should have checked more carefully.", next = "BACK", reply = "He did, love, and the coins still vanished. Poor man.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Condition, mostly, and whether it's the sort of thing the new recruits want. Plain mail sells steady, but a good shield with a lion on it will go for twice what a plain one does." } },
      choices = {
        { text = "Then I'll keep my gear in good order.", next = "BACK", reply = "Good. It'll fetch more, and you'll fight better in it.", fx = { align = { honor = 1 } } },
        { text = "I'll paint a lion on everything I sell.", next = "BACK", reply = "Ha! A lion on a pair of boots? You'd sell them, love, I'm sure.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than last month, because the leatherworkers can't keep up with the new adventurers. A clean wolf hide fetches a fair price, but a torn one's worth half, so skin carefully." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than last month, because the leatherworkers can't keep up with the new adventurers. Your {pet} is a handsome creature, and well kept. I'll say this for nothing: a beast like that would fetch a fortune, if anyone were fool enough to sell one." },
      },
      choices = {
        { text = "I'll skin carefully and sell honestly.", next = "BACK", reply = "Good. You'll get a fair price, and the leatherworkers will thank you.", fx = { align = { honor = 1 } } },
        { text = "Torn or not, I'll sell it as clean.", next = "BACK", reply = "Then you'll get caught, love, and Fitch will write you down. I'd not.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, dear, and usually to pay for something they can't ask the Cathedral for. I don't pry, but I make sure they get a fair price." } },
      choices = {
        { text = "That's kind of you, Jaxon. Fairness is its own blessing.", next = "BACK", reply = "They deserve a fair price, love, after what they've been through. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they're selling, they should haggle like anyone else.", next = "BACK", reply = "They do, love, and they're very bad at it. I'll keep it fair.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, a good deal, dear, because collectors like Count Ridgewell will pay handsomely for a bit of history. I always ask whether the seller has the right to part with it, though." } },
      choices = {
        { text = "The crest shouldn't be sold for profit, Jaxon.", next = "BACK", reply = "Perhaps not, love, but it'll be sold somewhere. Better here, with questions asked.", fx = { align = { honor = 1 } } },
        { text = "If someone pays well, I'd sell the crest.", next = "BACK", reply = "Then you'd sell it to Ridgewell, love, and he'd put it in a glass case. Ask first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Hello, dear, a priest! Do ask me before you price your robes, because the Cathedral's novices always ask too little." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Hello, dear, a paladin! Do price that old shield with me before you list it, because the Silver Hand's crest adds a fair bit." },
        { id = "h_default", text = "Auctioneer Jaxon. I have the right-hand podium, and I'll tell you straight what your goods will fetch, while Chilton hums and haws, bless him." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "Hello, dear. Your people bring the loveliest things in from Darnassus, and they never know what to charge for them, so do ask me before you list anything." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Hello, dear. You've a sharp eye for a bargain, I can tell, so use it on the listings, dear, not on the bidders' purses." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Hello, dear. A mage at the auction always makes me a little nervous, because I'm never quite sure the gold you bid is really there." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Your gear would fetch more than you think, I'd wager, and I'll tell you to the copper what it's worth." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll have a pack full of hides, I expect, and I can price every one of them before you've unbuckled it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at my podium! I don't see many of your people bid, dear, so I'll give you the same sensible advice I give everyone, and you'll ignore it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "From the Lamb, love? You'll want to sell your bags, I suppose, because your sort always end up with more bags than sense." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You should've listed your goods sooner. Prices are falling, and your spirits can't help that." },
      },
      again = {
        { id = "h_again", text = "What else, love?" },
        { id = "h_again2", text = "Ask me quick, love, before Chilton starts shouting the next lot." },
      },
      choices = {
        { text = "Let me browse the auctions.", next = "BUSINESS" },
        { text = "I've no idea how to price anything.", next = "price" },
        { text = "You'll have your regulars, I expect.", next = "regulars" },
        { text = "This floor looks like a thief's dream.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think I'd bid with conjured gold?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Some warriors' gear must fetch more than others, Jaxon.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What are hides worth right now, Jaxon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do priests often sell their things here, Jaxon?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the Silver Hand's crest really raise the price, Jaxon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the regulars think when a druid walks in, Jaxon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the Lamb's people do much business here, Jaxon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
      lines = { { id = "p2_default", text = "Then hold out, love, and good luck to you. Still, a fair price is whatever somebody pays, and there's no shame in a quick sale when you need the coin." } },
      choices = {
        { text = "Underselling everyone hurts the honest crafters.", next = "BACK", reply = "It does, love, and I warn them. But the market's the market.", fx = { align = { honor = 1 } } },
        { text = "Business is business, and the quick sale wins.", next = "BACK", reply = "It does, love, sometimes. I'll not stop you.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
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
  notices = { "status", "lock_pact" },
  impression = {
    first = "He treats every charter as a small promise made before the crown.",
    third = "{name} met Aldwin Laughlin, who keeps the Stormwind guild registry.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
    { id = "g_default", text = "Welcome to the guild registry. Are you here to found a guild, or to give an old one a new crest?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope your companions are keeping their oaths to one another." },
  },
  notice = {
    { id = "n_lock_pact", cat = "lock_pact", when = { class = "WARLOCK", aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You carry a pact on you, I can see it in the flush of your skin, and a pact is a sort of charter, though a darker one than I'd ever register. I hope your demon keeps its side of the bargain better than some guilds keep theirs." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It promises loyalty, to each other and to the crown. A shaman's guild would be unusual, but promises are promises." } },
      choices = {
        { text = "Promises made before the crown should be kept, Aldwin.", next = "BACK", reply = "They should, and they are, in this office. Sign here.", fx = { align = { order = 1 } } },
        { text = "Charters are paperwork. Loyalty is earned.", next = "BACK", reply = "Paperwork is how loyalty is recorded, friend. Sign anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A fair few, and they're always very particular about the crest, wanting runes and stars and complicated geometry, which I'm happy to draw. The trouble comes when they want the charter enchanted, because the registry is a matter of ink and law, and I'll not have a spell deciding who's a member." },
      },
      choices = {
        { text = "Ink and law, then. I'll sign it properly.", next = "BACK", reply = "Splendid. Ink and law will serve you well.", fx = { align = { order = 1 } } },
        { text = "An enchanted charter would keep out traitors, Aldwin.", next = "BACK", reply = "Perhaps, but the crown doesn't recognise enchanted ink. Ink and law it is.", fx = { align = { order = -1 } } },
        { text = "Something else, Aldwin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I did, with the moon behind the tree and the owl on a branch, and I'm still rather proud of it. They thanked me with a little bow and then asked if the shield had to be square, which I'm afraid it did." } },
      choices = {
        { text = "Rules are rules, Aldwin. A crest needs a proper shield.", next = "BACK", reply = "Square it is, then. The moon will just have to squeeze in.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Why square? Let them have a round crest, like the moon.", next = "BACK", reply = "I'd love to, but the crown's registry insists. Square it is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice this year, and they always want crests with no animals, no colours and nothing anyone could recognise. I design them anyway, and I sign them properly, because a charter's a charter whoever holds it." } },
      choices = {
        { text = "A charter should be honest about who signs it.", next = "BACK", reply = "It should, and I sign every one of them myself. That's my honesty.", fx = { align = { order = 1 } } },
        { text = "A crest nobody recognises is a sensible crest.", next = "BACK", reply = "Sensible indeed, and I'll design it with pleasure. Nobody will have the faintest idea.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Lord Wishock would try, and loudly, but the law says a guild is a guild so long as it pays its fee and breaks no statute. I've already had to talk him out of burning one crest, which was a very handsome crest." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Lord Wishock would try, and loudly, and if he saw what you've brought into my office, he'd have the Watch here before you finished signing. The law says a guild is a guild so long as it pays its fee and breaks no statute, and I don't recall one about demons in the waiting room, so let's not go looking." },
      },
      choices = {
        { text = "The law protects every guild equally. Good.", next = "BACK", reply = "It does, and Lord Wishock will learn it. I'll draw your crest.", fx = { align = { order = 1 } } },
        { text = "Let Wishock rage. A crest is my own affair.", next = "BACK", reply = "Exactly, and I'll keep him at bay. I'm very good at it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A shield, I think, rather than a sword, because a sword says you fight and a shield says you protect, and that's a better promise. I've designed forty crests this year, and only two had shields on them." } },
      choices = {
        { text = "A shield, then. Protecting others is the better promise.", next = "BACK", reply = "A shield it is. A fine promise.", fx = { align = { honor = 1 } } },
        { text = "A sword. People should know we fight.", next = "BACK", reply = "A sword, then, and I'll make it handsome. People will know.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a beast on a crest is alive in a way a sword never is. I once designed a crest with a stag for a hunting lodge in Elwynn, and the old man who ordered it wept when he saw it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because a beast on a crest is alive in a way a sword never is. Your {pet} would make a fine crest, you know. If you ever form a guild, bring it to me, and I'll draw it properly." },
      },
      choices = {
        { text = "A crest should honour the beasts we hunt.", next = "BACK", reply = "It does, and the old man in Elwynn agreed. I'll draw you a stag.", fx = { align = { honor = 1 } } },
        { text = "A crest should frighten anyone who sees it.", next = "BACK", reply = "Then I'll give it a very fierce wolf. Teeth and all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Charitable ones, mostly, for the orphans or the sick, and they always sign properly, which I appreciate. A charter is a promise, and priests understand promises." } },
      choices = {
        { text = "A promise made in faith should never be broken.", next = "BACK", reply = "It shouldn't, and I'll draw it with care. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A promise is only paper, Aldwin, until someone keeps it.", next = "BACK", reply = "Exactly so. That's why I make them sign, in ink, in front of me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That every knight shall protect the weak and serve the Light, and that the oath binds for life. It's a beautiful thing, and I've often wondered whether every guild should have such a clause." } },
      choices = {
        { text = "An oath for life is the only oath worth taking.", next = "BACK", reply = "That's what the Silver Hand believed, and I'll draw it so.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "An oath for life is too much to ask of anyone.", next = "BACK", reply = "Perhaps it is, but it's beautiful all the same. I'll leave yours shorter.", fx = { align = { honor = -1 } } },
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
          text = "A guild from beneath the tavern, is it? I'll register it like any other, but I'll warn you that the House of Nobles reads my charters, and they're not fond of horns on a crest." },
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
        { text = "Founding a guild sounds like it takes some doing.", next = "found" },
        { text = "There must be an art to a good crest.", next = "crest" },
        { text = "I'd not expect rogues to form many guilds, Aldwin.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A warrior's guild would want a bold crest, Aldwin.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do you enjoy designing hunters' crests, Aldwin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would the House refuse a guild that meets beneath a tavern?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
        { text = "A guild should answer to the crown.", next = "BACK", reply = "The crown agrees with you entirely. Sign here, please.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A guild answers to its members, not the crown.", next = "BACK", reply = "To its members first, perhaps, but the crown keeps the registry. Sign anyway.", fx = { align = { order = -1 } } },
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
    _none = { { id = "tp_none", text = "That's not in the registry, friend, and I don't put guesses on parchment." } },
  },
}

-- Woo Ping: weapon master in Weller's Arsenal; patient teacher, unflappable.
P:NPC {
  key = "woo_ping", id = TODO_NPC("Woo Ping"), name = "Woo Ping", title = "Weapon Master",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "discipline", "craft" },
  notices = { "class", "kit", "lock_shadow" },
  impression = {
    first = "He says more with one correction than most do with a speech.",
    third = "{name} met Woo Ping, the weapon master who teaches in Weller's Arsenal.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good, you're back. I've been looking forward to seeing how far you've come." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak your business. My patience with you is shorter than my lessons." },
    { id = "g_default", text = "Stand still a moment and let me see how you hold yourself. Good, now we may talk." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your feet are better placed than before. I noticed." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, place = "before",
      text = "A priest who wants to fight with more than prayer. I can teach you the staff and the dagger, and you'll find that both reward patience, as your faith does." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, place = "before",
      text = "A hunter. You'll want the crossbow from me, I expect, and perhaps a polearm for when the beast reaches you before your bolt does." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Your shadow moves half a beat behind you, and a weapon master sees such things, because the feet must lead and everything else must follow. Learn the staff, and teach your shadow to keep up." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It tells me everything. A steady stance is steady faith. Your spirits would agree, I think." } },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Steady feet, steady faith. I'll keep that close.", next = "BACK", reply = "Good. Your spirits and your feet will thank you.", fx = { align = { honor = 1 } } },
        { text = "Faith's for priests. I'll fight my own way.", next = "BACK", reply = "Then fight your own way, and fall your own way. I will still be here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because claws are a shape, and a shape can be taken from you, but a trained hand stays trained. I have seen a druid lose a fight because she could not change, and I would not see it twice." } },
      choices = {
        { text = "Then teach me. A wise fighter needs more than one answer.", next = "BACK", reply = "Good. Come back at dawn, and bring your patience.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My claws are enough. I will trust the wild, not the drill.", next = "BACK", reply = "The wild is wise, but it does not teach the staff. I will be here when it fails you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because one day you will be seen, and on that day you will need reach as well as surprise. The SI:7 agents who train with me learn the sword first and the dagger last, and the ones who complain the loudest live the longest." } },
      choices = {
        { text = "Then I'll learn to fight in the open as well.", next = "BACK", reply = "Good. Learn to stand in the open and trade blows, and the shadows will be a choice and not a hiding place.", fx = { align = { honor = 1 } } },
        { text = "Better never to be seen at all, Woo Ping.", next = "BACK", reply = "Better, yes, and impossible. One day you will be seen.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because a master who cannot defend himself is only a prisoner who has not been caught yet, and your demon knows this better than you. Learn the staff, so that your servant has a reason to stay obedient." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because a master who cannot defend himself is only a prisoner who has not been caught, and your demon is watching us now to learn which you are. Learn the staff, so that your servant has a reason to stay obedient, and so that it stops looking at you like that." },
      },
      choices = {
        { text = "I'll learn, then, and lean less on what serves me.", next = "BACK", reply = "Good. What serves you will respect you more for it.", fx = { align = { light = 1 } } },
        { text = "What serves me obeys, Woo Ping. It'll never need a reason.", next = "BACK", reply = "They obey until they don't. Learn the staff.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one you can hold longest without tiring, because the fight does not end when your arm does. Most young warriors want the greatest sword, but the best warriors I've taught started with the staff and learned to move." } },
      choices = {
        { text = "I'll start with the basics and learn properly.", next = "BACK", reply = "Good. Footwork, grip and breath, in that order; most young warriors who die in the Deadmines skipped one of those.", fx = { align = { order = 1 } } },
        { text = "I want the greatest sword. I'll learn as I go.", next = "BACK", reply = "Then you will learn on the floor. I will help you up.", fx = { align = { order = -1 } } },
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
        { text = "I'll learn to fight beside my pet.", next = "BACK", reply = "Good. Your pet will be glad of the company.", fx = { align = { honor = 1 } } },
        { text = "My pet does the close work. I'll stay back.", next = "BACK", reply = "Then one day it will fall, and you will need the polearm. Learn it anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A priest should learn to protect, which is not the same thing as fighting. Stand well and hold your weapon gently, and you will find that most battles end before they begin." } },
      choices = {
        { text = "I'll learn to protect, and fight only when I must.", next = "BACK", reply = "That is the wisest answer. Come back at dawn.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If I must fight, I'll fight to win.", next = "BACK", reply = "Then fight to win, but plant your feet first. I've seen more priests go down to a slipping boot than to a sword.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That you lean forward, as paladins do, and that you trust the Light more than your feet. Trust the Light, but stand well, because the Light will not catch you if you fall." } },
      choices = {
        { text = "Then I'll train my feet as well as my faith.", next = "BACK", reply = "Good. The Light and your feet will work together.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light has never let me fall yet.", next = "BACK", reply = "Not yet. Train anyway.", fx = { align = { order = -1 } } },
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
          text = "Your servants fight for you, I see it in how you stand, but I will teach you the staff all the same, so that you are never only the master of something else." },
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
        { text = "I'd like to learn axes, maces or bows.", next = "elsewhere" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "I'd wager you have a weapon you prefer.", next = "prefer" },
        { text = "Why should a rogue learn the sword?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A warrior must master one weapon before the rest, Woo Ping.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Should a hunter train with a melee weapon, Woo Ping?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why does it matter if I fight for myself?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "A priest has little need to fight, Woo Ping.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
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
        { text = "Then I'll learn patience first, master.", next = "BACK", reply = "Good. You will save yourself a great many bruises.", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "I learn best by getting knocked down.", next = "BACK", reply = "Then you will learn very quickly, and very painfully. Come back at dawn.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
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
  notices = { "kit", "greenness", "lock_stones" },
  impression = {
    first = "She is plainly the reason the arsenal still turns a profit.",
    third = "{name} met Marda Weller, who keeps the books and the second counter at Weller's Arsenal.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "Weller's Arsenal. If Gunther's busy talking about balance, I can sell you a sword much faster." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? Good, because that blade you bought should be needing an edge by now." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 10 }, place = "before",
      text = "Fresh from Northshire, are you? Then buy something cheap and sturdy from me today, and save your silver for something good once you know what you like." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Look at that edge, it's nearly gone. Get it seen to before you go anywhere, or the next thing you hit will be the last." },
    { id = "n_lock_spellstone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "That firestone of yours is warming my whole counter, and Gunther will smell it from the forge and come out with a hammer. Please keep it in the bag, because I've no apologies left in me this month." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I keep every copper of them, because Gunther can't count past ten. Your spirits must be better with numbers than he is." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Good books keep a good business, Marda.", next = "BACK", reply = "They do, and mine are the best in the Trade District. Gunther's are a disgrace.", fx = { align = { order = 1 } } },
        { text = "Numbers don't matter. Weapons sell themselves.", next = "BACK", reply = "They don't, or Gunther would be rich. Somebody has to count.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because Gunther once threw a hammer at a little horned thing that was sniffing round his forge, and missed, and hit a customer, and I spent a week writing apologies. He's a good smith and a poor judge of what to throw things at, so it's easier if your friend waits by the door." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because Gunther once threw a hammer at an imp sniffing round his forge, missed, and hit a customer, and he's already reaching for another now that yours has come in. He's a good smith and a poor judge of what to throw things at, so please take your {pet} back to the door before I'm writing apologies again." },
      },
      choices = {
        { text = "It'll wait by the door, Marda.", next = "BACK", reply = "Thank you. Gunther's hammer is still a little bent.", fx = { align = { order = 1 } } },
        { text = "Let Gunther throw. My companion dodges better than customers.", next = "BACK", reply = "Ha! Maybe so, but I'll be the one writing the apologies again. Door, please.", fx = { align = { order = -1 } } },
        { text = "Something else, Marda.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Three this season, which is three more than last, so the night elves are either arming or finally finding the city. I'll sell to whoever pays, though I'll admit your people haggle more politely than anyone." } },
      choices = {
        { text = "I'll pay your price, Marda. A fair price needs no haggling.", next = "BACK", reply = "Thank you. Polite and fair, which is rare in this trade.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll haggle politely too, Marda, and I'll win.", next = "BACK", reply = "Win you may, but I'll enjoy the trying. Go on, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not twice, because I keep a ledger, a cudgel and a cousin in the Watch, in that order. The ledger is usually enough, because nobody wants their name written down in a weapons shop." } },
      choices = {
        { text = "A ledger and the Watch are what keep a city honest.", next = "BACK", reply = "Mine keep this shop honest, too, to the last copper.", fx = { align = { order = 1 } } },
        { text = "Ledgers only catch the careless ones, Marda.", next = "BACK", reply = "Then the careless ones are my best customers. The rest get the cudgel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of the old Dalaran masters do, because they think a mage holding a sword is a mage who's given up on thinking. The young ones disagree, mostly because they've been to Westfall and seen what the Defias do to anyone who runs out of mana." } },
      choices = {
        { text = "The old masters are right. A mage should trust their art.", next = "BACK", reply = "They might be, but the young ones keep coming back alive. I'll sell to both.", fx = { align = { order = 1 } } },
        { text = "The young ones have it right. Survive first, theory later.", next = "BACK", reply = "That's what the young ones say, and they keep buying. Good for business.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "He talks about nothing else, and I love him for it, but somebody has to sell the blades or we'd have no roof. Still, he's right: not one sword we've sold has come back because it was badly made." } },
      choices = {
        { text = "A craftsman who cares is worth listening to.", next = "BACK", reply = "He is, and I'll tell him you said so. He'll be insufferable for a week.", fx = { align = { order = 1 } } },
        { text = "Just tell me the price. I don't need a lecture.", next = "BACK", reply = "Fair enough. Twelve silver, and I'll spare you the lecture.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hand axes and short swords, light enough to swing while you're backing away, which is how most hunters fight up close. Gunther says a hunter's axe is the hardest thing to get right, and he grumbles about it for days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hand axes and short swords, light enough to swing while you're backing away, which is how most hunters fight up close. Your {pet} is very well behaved, thank you. The last one knocked over a rack of daggers, and Gunther hasn't stopped talking about it." },
      },
      choices = {
        { text = "Quality steel is worth the extra coin.", next = "BACK", reply = "Gunther will love you for saying it. He'll probably want to shake your hand.", fx = { align = { order = 1 } } },
        { text = "The cheapest axe will do. It's for emergencies.", next = "BACK", reply = "Then you'll be buying another in a week. Suit yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than they used to, and that's the roads talking. A priest who can't defend themselves gets taken first, and I'd sooner sell a mace than hear about it." } },
      choices = {
        { text = "I'll carry one, but faith is my first defence.", next = "BACK", reply = "Good. Faith first, mace second, and you'll come home.", fx = { align = { light = 1 } } },
        { text = "A good mace has saved more priests than prayer.", next = "BACK", reply = "It has, and I've the customers to prove it. Take two.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A steady trade, and they're the only customers who never haggle. Gunther says it's because they're honourable, and I say it's because they don't know what things cost." } },
      choices = {
        { text = "A fair price deserves to be paid in full.", next = "BACK", reply = "That's what Gunther says, and he's very pleased with himself about it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Perhaps I'll learn to haggle, then, Marda.", next = "BACK", reply = "Please don't. You're my favourite customers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a mace or a staff, I expect, and Gunther will want to lecture you about balance, so I'd buy quickly." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "You'll know your way to the back wall, {class}, since that's where every paladin goes first." },
        { id = "h_default", text = "Marda Weller. Gunther forges and fusses, Woo Ping teaches, and I keep the counter and the ledger, and that's how this shop still has a roof." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, so it's a mace or a two-hander you're after. We've a few heavy pieces on the back wall, though Gerik Koen in Old Town has more if ours don't suit you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll be after the daggers, which Gunther will have told you I count. He's right, and I count the coin too." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in an arsenal. Woo Ping will want to teach you the staff, and you'd do well to listen, whatever the Sanctum says." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Gunther will tell you about balance for an hour, so let me tell you the price before he starts." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! We've axes and short swords for the close work, and Woo Ping teaches the polearm if you've a mind to learn." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at Weller's. You'll want a staff or a mace, and you'll pay at my counter, because Gunther will give you a speech about balance and forget the price." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've the Lamb's look about you. Dagger or staff, and I'll write it in the ledger, and you can keep your companion out of Gunther's way." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Gunther's busy judging grips, so do you need anything, or are you only here to talk to the spirits?" },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I've a customer waiting at the other counter." },
        { id = "h_again2", text = "Quickly, then; the shop doesn't run itself." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "The auction house must have hurt your business.", next = "auction" },
        { text = "I'd have thought the army bought most of your weapons.", next = "buyers" },
        { text = "Has anyone stolen from you, Marda?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Sanctum disapprove of weapons training?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Gunther never stops talking about balance, Marda.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd wager Weller's has something for hunters, Marda.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
        { text = "I'd guess you sell to anyone who asks.", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "b2_default", text = "Anyone who pays and doesn't look like a cutthroat, and I've turned a few away. Gunther thinks I'm too fussy, and I think he's too trusting." } },
      choices = {
        { text = "Good. Better to turn away a buyer than arm a thief.", next = "BACK", reply = "Exactly, and Gunther will come round eventually.", fx = { align = { order = 1 } } },
        { text = "A shopkeeper can't judge everyone. Sell, and let the guard sort it.", next = "BACK", reply = "That's Gunther's view, and he's wrong. I'll keep turning them away.", fx = { align = { order = -1 } } },
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
  notices = { "arcane", "craft", "lock_shards" },
  impression = {
    first = "He likes being asked, and likes being right even more.",
    third = "{name} met Keldric Boucher, who sells arcane goods at Pestle's Apothecary.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Welcome to Pestle's. If it comes in a vial or a pouch, I most likely have it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Running short on something already, are we?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" }, place = "before",
      text = "An alchemist, I can always tell by the stains. You'll be wanting vials, and I'd buy a few more than you think you need, because you'll drop one." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" }, place = "before",
      text = "A mage, good. You'll want arcane powder for your brilliance and runes for your portals, and I keep both, which is more than the Mage Quarter's shops can always say." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "My vials have frosted over on your side of the counter, the way that case did before I threw it in the canal. It's the shards in your bag, I'd stake the shop on it." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "All of them, but especially the volatile ones. Your spirits might enjoy them too, though I'd keep them away from the fire." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Knowledge shared is knowledge doubled, Keldric.", next = "BACK", reply = "Then I'll teach you the volatile ones, carefully, and from behind a screen.", fx = { align = { order = 1 } } },
        { text = "Keep your powders. I don't need them.", next = "BACK", reply = "Suit yourself, but they're very interesting powders.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I sell vials, and what goes into them is the buyer's business, though I'll tell you which ones are crystal and which are mere glass. A good poison needs a good vial, and a bad vial leaks into your coat lining, and I've seen what that does to a man." },
      },
      choices = {
        { text = "Crystal, then, and for honest purposes.", next = "BACK", reply = "Crystal it is, and I'll not ask. Honest purposes sound lovely.", fx = { align = { honor = 1 } } },
        { text = "I'll take the crystal, and the purpose is mine.", next = "BACK", reply = "Then the crystal's yours, and the purpose too. I'll not ask.", fx = { align = { honor = -1 } } },
        { text = "Something else, Keldric.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They carve them from something that isn't quite wood and isn't quite glass, and I've studied one for a year without learning how. I'd give my best lens to know, though I suspect the answer is that a tree agreed to it." } },
      choices = {
        { text = "Study it properly, Keldric, and write down what you learn.", next = "BACK", reply = "I am, and I'll publish it when I understand it. Perhaps in another year.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some secrets aren't for writing down. Leave it be, Keldric.", next = "BACK", reply = "Perhaps you're right. I'll keep studying it quietly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Sand from the Westfall shore, blown thick and cooled slowly, the way the old Dalaran glassblowers did it before they went home behind their wall. Kyra says I lecture, and she's right, but glass deserves a lecture." } },
      choices = {
        { text = "Craft done slowly and properly is worth the price.", next = "BACK", reply = "It is, and Kyra agrees with me, though she says the same about her own goods.", fx = { align = { order = 1 } } },
        { text = "Fast and cheap serves most people well enough.", next = "BACK", reply = "It does, until the glass cracks in someone's hand. I'll keep blowing it slowly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't know, and I didn't ask, but the glass frosted over from the inside and I had to throw the whole case in the canal. I've had my doubts about the fish ever since." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I don't know, and I didn't ask, but the glass frosted over from the inside, and the vials nearest your servant have just started ticking against each other the way that one did. I threw the whole case in the canal that night, and I'd like you to know I'm keeping that in mind." },
      },
      choices = {
        { text = "I'm sorry for that. I'll fill mine far from here.", next = "BACK", reply = "Thank you. The canal's had enough of my glass.", fx = { align = { light = 1 } } },
        { text = "A screaming vial sounds rather useful to me.", next = "BACK", reply = "Useful, perhaps, but unsettling to sell. I'll pass.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a cheap vial cracks in a pack, and a cracked vial means a warrior with no healing potion when he needs one most. I sell only the thick glass, and I've seen soldiers come back alive because of it." } },
      choices = {
        { text = "Then I'll buy the good vials. My life depends on it.", next = "BACK", reply = "Good. You'll thank me when the vial survives the fall.", fx = { align = { order = 1 } } },
        { text = "Glass is glass. I'll buy whatever's cheapest.", next = "BACK", reply = "Then you'll be the warrior without a potion. I'd buy good glass.", fx = { align = { order = -1 } } },
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
        { text = "I'll keep a salve for my pet in my pack.", next = "BACK", reply = "Good. Your pet will be grateful.", fx = { align = { light = 1 } } },
        { text = "My pet heals on its own. It's tough.", next = "BACK", reply = "Tough right up until it isn't. Keep a salve in your pack anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The glass is clearer and the stopper's tighter, so yes, though the Cathedral says it's the blessing that matters. I'd say a blessing in a leaky vial is a blessing on the floor." } },
      choices = {
        { text = "The blessing matters more than the glass, Keldric.", next = "BACK", reply = "Perhaps, but a blessing on the floor helps nobody. I'll keep the glass good.", fx = { align = { light = 1 } } },
        { text = "You're right. Good glass is half the work.", next = "BACK", reply = "Exactly, and the Cathedral would never admit it. Thank you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Vials for holy water, mostly, and some for oils, and they always want them sturdy. A broken vial in the middle of a fight is no use to anyone, and I've made sure mine don't break." } },
      choices = {
        { text = "Good preparation saves lives. Your work matters.", next = "BACK", reply = "Thank you. Paladins are my favourite customers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "In a fight, I'd sooner trust my hammer than a vial.", next = "BACK", reply = "Then I hope your hammer never needs a potion. Take a vial anyway.", fx = { align = { order = -1 } } },
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
          text = "There's a cold coming off you. I sell you the same vials as anyone, but I'll ask you not to fill them in my shop, because the last time, one of them screamed." },
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
        { text = "A vial seems a simple enough thing.", next = "vial" },
        { text = "Good glass must be hard to come by now.", next = "stock" },
        { text = "Your vials seem finer than most, Keldric.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why does the glass matter for a potion, Keldric?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess hunters brew their own remedies, Keldric.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
      lines = { { id = "s_default", text = "Most of it comes from Ironforge, since Dalaran fell and its suppliers with it. The dwarves make fine glass but they charge for every bubble, and I pass the cost along, I'm sorry to say." } },
      choices = {
        { text = "You could try cheaper suppliers.", next = "stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = { { id = "s2_default", text = "I could, and I'd sell cheaper glass that cracks in an alchemist's hand. Morgan won't have it in the shop, and frankly, neither will I." } },
      choices = {
        { text = "I'd rather pay more once than buy the same thing twice.", next = "BACK", reply = "Morgan says the same, and he's never wrong about that. Thank you.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Most buyers would never know the difference.", next = "BACK", reply = "They'd know when it cracked. I'll keep it good.", fx = { align = { honor = -1 }, affinity = -1 } },
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
  notices = { "class", "lock_shards" },
  impression = {
    first = "She knows every caster's habits by what they buy.",
    third = "{name} met Kyra Boucher, the reagent seller at Pestle's Apothecary.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "Welcome! Let me know if you need help finding anything; I keep it all right here by the door." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Let me guess what you've run out of." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", minLevel = 34 }, place = "before",
      text = "Light feathers, I expect, for when you'd rather float than fall. The Cathedral's priests buy them by the handful before they go out into the hills." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, place = "before",
      text = "A druid! I keep seeds for your rebirth and berries for your gifts, though I'll admit I don't fully understand what you do with them." },
    { id = "n_lock_infernal", cat = "lock_shards", when = { class = "WARLOCK", carrying = 5565 },
      text = "That infernal stone in your bag was wrapped in plain paper by somebody, and I'd know my own fold anywhere. Keep it wrapped, please, because a paladin who sees one will follow you all the way to the Mage Quarter." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Ankhs, mostly, for when the spirits bring them back, and a few reagents. I've learned what every sort needs by watching what they buy." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "You know your customers well, Kyra. That's good business.", next = "BACK", reply = "Thank you. I can tell a mage from a warlock by how they look at the black lotus jar.", fx = { align = { order = 1 } } },
        { text = "I'll find what I need myself.", next = "BACK", reply = "Suit yourself, but I'll know what you need before you ask.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because a paladin once saw what one of yours had bought and followed him all the way to the Mage Quarter, and I lost both customers. Plain paper keeps the peace, and it keeps my door busy." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because a paladin once saw what one of yours had bought and followed him all the way to the Mage Quarter, and I lost both customers. Plain paper keeps the peace, but it won't hide that thing at your heel, so I'd ask you to send it off before you leave with your parcel." },
      },
      choices = {
        { text = "The paladin was only doing his duty, Kyra.", next = "BACK", reply = "He was, and he cost me two customers doing it. Plain paper it is.", fx = { align = { light = 1 } } },
        { text = "Plain paper's wise. Paladins should mind their own business.", next = "BACK", reply = "Exactly. I keep my customers, and the paladins keep their peace.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Mine comes with a receipt, and his comes with a wink and a question you'd better not answer. I've nothing against Jasper, mind, but I'd rather my powder ended up in an honest pocket." } },
      choices = {
        { text = "I'll take the receipt, Kyra. Honest trade suits me.", next = "BACK", reply = "Good. Receipts are honest, and so am I.", fx = { align = { honor = 1 } } },
        { text = "I'll take the wink. Receipts leave trails.", next = "BACK", reply = "Then Jasper's your man. I'll keep my receipts.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only for someone else, usually a mage they're travelling with who's forgotten to stock up. I always tell them to make the mage carry it, because a warrior's pack is full enough." } },
      choices = {
        { text = "I'll carry what my companions need. That's teamwork.", next = "BACK", reply = "That's the right spirit. Your mage will thank you.", fx = { align = { honor = 1 } } },
        { text = "The mage can carry their own reagents.", next = "BACK", reply = "They should, but they never do. You'll end up carrying it anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A few, buying for their friends, and they always ask whether any of it would help their pets. None of it would, but I like that they ask." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A few, buying for their friends, and they always ask whether any of it would help their pets. Your {pet} is sniffing at the reagents, and I'd stop it if I were you, because some of these smell nicer than they are." },
      },
      choices = {
        { text = "I'd rather ask than risk my pet's health.", next = "BACK", reply = "Good. I like customers who care about their pets.", fx = { align = { light = 1 } } },
        { text = "My pet's tough. A sniff won't hurt it.", next = "BACK", reply = "Tough, maybe, but still. Keep it away from the bright powders.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because you only need one when someone's died, and I've sold enough of them to know what that means. I wrap each one carefully, and I try not to think about where it's going." } },
      choices = {
        { text = "Every one I use brings someone back. That's a blessing.", next = "BACK", reply = "I'll try to think of it that way, next time I'm stitching one. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death is part of war, Kyra. You can't wrap it away.", next = "BACK", reply = "I can't, but I can wrap it carefully. That's all I can do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Symbols of divinity, I expect, {class}, and I've a fresh crate, though I always hope your sort never has to use them." },
        { id = "h_default", text = "Kyra Boucher. Reagents for every kind of spellcaster, right by the door so nobody has to walk past Keldric's lectures on glass. Keldric is my kin, so I'm allowed to say that." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. You'll want symbols of divinity, I expect, though I hope you never need to use one. The Silver Hand's people always look so solemn when they buy them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You'll want your reagents quickly and quietly, I'd guess, and I've learned to wrap them in plain paper for your sort." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want flash powder, and I'd like you to buy it from me rather than Jasper Fel. His is good, but mine's honest." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? You've wandered to the reagent counter, I'm afraid, and none of this is any use to you, unless you've a mage at home." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've nothing for you here, I'm afraid, unless you've a spellcaster in your party who needs looking after." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your kind runs out of totems, I'd guess. Or do spirits keep you stocked?" },
      },
      again = {
        { id = "h_again", text = "Who's next, then? Oh, still you; what else have you run short of?" },
        { id = "h_again2", text = "Anything else? I've another customer at the door." },
        { id = "h_again3", text = "Still here? Good, I like a customer who chats; most of them grab their powder and bolt." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Priests come to you for supplies too, I see.", next = "priest", when = { class = "PRIEST" } },
        { text = "Mages seem to run through their supplies quickly.", next = "mage", when = { class = "MAGE" } },
        { text = "You'll have some good customers, I expect.", next = "customers" },
        { text = "Tell me about Pestle's Apothecary.", next = "shop" },
        { text = "Why keep your counter right by the door?", next = "door" },
        { text = "You've already guessed what I'm here for, haven't you?", next = "guess" },
        { text = "Where do all these reagents come from?", next = "supply" },
        { text = "Seeds and berries, for a druid's rebirth. You stock them?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I learned my craft in the Lamb's cellar.", next = "xlamb", when = { origin = "human_lamb_cellar" } },
        { text = "I came south from Lordaeron, after the plague.", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Why wrap my reagents in plain paper, Kyra?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
      choices = {
        { text = "Where are the sisters going with all those candles?", next = "priest_front" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_front = {
      lines = { { id = "pf_default", text = "Lakeshire, mostly, where the orcs keep coming down out of the hills, and Darkshire, where nobody sleeps well. They buy candles for prayers and come back for more a month later, a little thinner and a little quieter each time." } },
      choices = {
        { text = "The Church does good work out there.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "Runes of teleportation, always, because a mage would rather walk home by magic than by foot. Arcane powder, too, once you're strong enough to grant your brilliance to a whole group." } },
      choices = {
        { text = "Do mages ever buy runes for anyone else?", next = "mage_runes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_runes = {
      lines = { { id = "mr_default", text = "Runes of portals, for when they've a whole party to send home, and I'll tell you those go quickly whenever there's trouble in the south. One young mage bought twenty at once and opened a portal into the Canals by mistake, and the ducks have never forgiven him." } },
      choices = {
        { text = "Into the Canals? I'd have paid to see that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "The Mage Quarter, when its own shops run dry, and the Cathedral, which never does. Rogues buy flash powder from me and never look me in the eye, which I find rather sweet." } },
      choices = {
        { text = "You sell to rogues without asking questions?", next = "rogues" },
        { text = "What's the oddest thing anyone's asked you for?", next = "customers_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_odd = {
      lines = { { id = "co_default", text = "A dwarf wanted arcane powder for his beard, because he'd heard it made a wizard's hair shine, and I couldn't talk him out of it. He came back a week later glittering faintly and very pleased with himself, and bought another pouch." } },
      choices = {
        { text = "Did it work?", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The shop
    shop = {
      lines = { { id = "s_default", text = "Morgan Pestle owns it and brews in the back, Keldric sells the arcane goods along the wall, and I keep the reagents by the door. It smells of three different herbs on any given day, and I've stopped noticing, but the customers never do." } },
      choices = {
        { text = "What's Morgan Pestle like?", next = "shop_pestle" },
        { text = "You and Keldric are family, then?", next = "shop_keldric" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_pestle = {
      lines = { { id = "sp_default", text = "Quiet, careful, and happiest with his sleeves rolled and something bubbling, which suits me, because I do the talking for the whole shop. He's never once raised his voice, except at a cat that got into the mandrake." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_keldric = {
      lines = { { id = "sk_default", text = "We share a name, and I call him kin, and he lets me, which is as much as either of us will say about it. He'll talk your ear off about Ironforge glass if you stand still too long, so I keep my counter well clear of his." } },
      choices = {
        { text = "That's not really an answer, Kyra.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The door
    door = {
      lines = { { id = "d_default", text = "Because folk in a hurry want what they came for without walking past three shelves of things they didn't. And because from the door I can see the whole Trade District go by, and I do love watching it." } },
      choices = {
        { text = "What have you seen go by lately?", next = "door_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    door_watch = {
      lines = { { id = "dw_default", text = "More guards than there used to be, and more of them looking worried. More carts from Westfall with families sitting on top, and fewer with grain, and folk from the north with Lordaeron in their voices, buying nothing and asking directions to the Cathedral." } },
      choices = {
        { text = "The refugees? What becomes of them here?", next = "door_refugees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    door_refugees = {
      big = true,
      lines = { { id = "dr_default", text = "Some find work, some find the Cathedral's soup line, and some find the Canals, where nobody asks questions. I hear people grumble that the city's too full already, and then I see a child with a Lordaeron accent and I can't think why anyone would grumble." } },
      choices = {
        { text = "Stormwind should take in everyone who needs it.", next = "BACK", reply = "It should, and I hope it does. The Cathedral's trying.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The city can only feed so many. There have to be limits.", next = "BACK", reply = "There have, and the city's at them already. I'll keep selling to whoever comes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- An observation
    guess = {
      lines = { { id = "g_default2", text = "I have, though I'll not say it aloud in case I'm wrong and you think less of me. I've stood at this counter long enough that I can usually tell a customer's trade before they've wiped their boots." } },
      choices = {
        { text = "How do you tell?", next = "guess_trick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guess_trick = {
      lines = { { id = "gt_default", text = "Mages smell faintly of a thunderstorm, priests of candle wax, and druids of cut grass, whatever they're wearing. Rogues are the easiest of all, because they're the only ones who check where the door is before they look at the shelves." },
        { id = "gt_rogue", when = { class = "ROGUE" }, text = "You, for instance, checked where the door was before you looked at a single shelf, which is what all your sort do. Mages smell of thunderstorms, priests of candle wax, and you smell of nothing at all, which gives you away worst of all." },
      },
      choices = {
        { text = "That's a clever trick, Kyra.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Supply
    supply = {
      lines = { { id = "su_default", text = "Feathers from the hill farms, candles from a chandler near the Cathedral who blesses every batch, and the arcane powder from mages who'd rather sell it than grind it themselves. The runes are the hard part, because they come from people who know runes, and those are fewer every year." } },
      choices = {
        { text = "Fewer every year? Why is that?", next = "supply_dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_dalaran = {
      lines = { { id = "sd_default", text = "Because Dalaran used to make most of the runes in the Seven Kingdoms, and Dalaran's been in ruins since the Scourge came through. The Kirin Tor are rebuilding, I'm told, but they're keeping what they make for themselves, and I can't say I blame them.",
          fx = { learn = { "dalaran", "scourge" } } } },
      choices = {
        { text = "The Kirin Tor owe the world better than that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xdruid = {
      lines = { { id = "xd_default", text = "Maple seeds for the rebirth, and wild berries for your gift to the whole party, and once you're older, thornroot for the stronger gift. I've no idea what you do with them, and I've decided I'd rather keep it a little mystery." } },
      choices = {
        { text = "The seed carries a life back into the world.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlamb = {
      big = true,
      lines = { { id = "xl_default", text = "Then you'll be one of the plain-paper customers, and I'll wrap yours the same as the rest. I don't hold the cellar against anyone, but I'd be lying if I said I never wondered what you all do down there." } },
      choices = {
        { text = "We study what others fear. Someone has to.", next = "BACK", reply = "Someone does, I suppose. I'll keep wrapping in plain paper.", fx = { align = { light = -1 } } },
        { text = "Some of it frightens me too. I'm careful.", next = "BACK", reply = "Good. The day it stops frightening you is the day you should put it down.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrefugee = {
      lines = { { id = "xr_default", text = "I've had a good many of your people through that door, and they always ask the same thing first, which is where the Cathedral is. I've drawn the way on so many scraps of paper that I've started keeping a stack of maps under the counter." },
        { id = "xr_priest", when = { class = "PRIEST" }, text = "A priest from Lordaeron. You'll have prayed over things I'd not want to hear about, I expect, and you still come in for candles, which says something good about you." },
      },
      choices = {
        { text = "That's a kindness. Thank you, Kyra.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogues = {
      lines = { { id = "r_default", text = "Flash powder isn't a crime, and the guard's own scouts buy it from me. If I asked every customer what they meant to do with their reagents, I'd sell nothing at all." } },
      choices = {
        { text = "Leave it, then. What they do isn't your concern.", next = "BACK", reply = "Thank you. I'll keep selling, and keep my eyes open.", fx = { align = { order = -1 } } },
        { text = "A careful seller should still keep an eye out.", next = "BACK", reply = "I do, and I'll keep doing it. Thank you.", fx = { align = { order = 1 } } },
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
