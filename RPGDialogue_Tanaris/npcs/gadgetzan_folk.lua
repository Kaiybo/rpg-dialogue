-- Gadgetzan's working folk (0.37.0): the bank, the flight masters, the butcher, the gunsmith, the smith by the south gate,
-- and Yeh'kinya down at Steamwheedle Port. Voice: bibles/tanaris.md
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gimblethorn", id = TODO_NPC("Gimblethorn"), name = "Gimblethorn", title = "Banker",
  bible = "bibles/tanaris.md", role = "banker", tier = "service",
  communities = { "gadgetzan" }, temper = { "dry" }, values = { "careful", "profit" },
  notices = { "purse" },

  impression = {
    first = "Gimblethorn keeps Gadgetzan's vault and counts every coin twice, once for the Cartel and once for himself. He trusts the Bruisers more than the walls, and the walls more than anyone holding a sword.",
    third = "{name} met Gimblethorn, the goblin who keeps the bank in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Deposit, withdrawal, or are you just here for the shade? The shade's free, the vault isn't." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and your box is right where you left it, which in this town counts as a minor miracle, and miracles are not included in the standard fee." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a heavy purse to carry across a desert full of Wastewanders, friend. I'd let the vault carry it, if I were you." },
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } },
      text = "You can keep the vault for your things even with an empty purse, so don't look so worried, friend; nobody here charges you for being broke, though we do note it." },
  },

  start = "hello",
  nodes = {
    op_venture = {
      lines = {
        { id = "opv_q", text = "Now, the one outfit I'd never let past the vault door is the Venture Company, and I'd like to know if you see it the same way. What do you think of them, pal?" },
      },
      choices = {
        { text = "Butchers and strip-miners. They'd sell the world for scrap.", next = "op_venture_r1", fx = { affinity = 2, align = { light = 1 }, opinion = { venture_company = "hate" } } },
        { text = "They get rich, don't they? Can't argue with results.", next = "op_venture_r2", fx = { affinity = -2, align = { light = -1 }, trait = { greedy = 1 }, opinion = { venture_company = "admire" } } },
        { text = "They're goblins like you. The difference is the contract.", next = "op_venture_r3", fx = { trait = { witty = 1 }, opinion = { goblins = "contract" } } },
        { text = "I've no dealings with them, Gimblethorn.", next = "BACK" },
      },
    },
    op_venture_r1 = {
      lines = {
        { id = "op_venture_r1", text = "That's the spirit, and that's the right answer for anybody who wants an account here. Venture gold smells of burnt forest, and it never counts right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_venture_r2 = {
      lines = {
        { id = "op_venture_r2", text = "Results, sure, and so does a rockslide. I'll be countin' your deposits twice, kid, nothing personal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_venture_r3 = {
      lines = {
        { id = "op_venture_r3", text = "Ouch! Okay, fair, the difference is about forty percent and a conscience, but I'll give you the rest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I trust a warrior exactly as far as the Bruisers can throw one, and they're very strong. It's nothing personal, but a sword is a key that fits every lock, and I've spent my life, and a good deal of the Cartel's money, keeping keys away from the vault." } },
      choices = {
        { text = "Laws and walls keep gold safe. I respect the Bruisers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gold belongs to whoever's strong enough to hold it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The owner claimed the slip was for forty gold, the beast declined to testify, and the Cartel ruled it a matter for arbitration. I've kept his account frozen ever since, and he's kept his wolf on a very short leash." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The owner claimed the slip was for forty gold, the beast declined to testify, and I've kept his account frozen ever since. I'm sure {pet} is far better behaved, but I'll have the Bruisers watch the door all the same, purely as a matter of policy." },
      },
      choices = {
        { text = "Rules are rules, even for a beast. Your caution's fair.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Freezing a man's gold over a wolf's lunch is petty.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It buys water, which in Tanaris is about as holy as anything gets, and it buys the Bruisers who keep both factions from killing each other in the square. I'd call that a better return than most temples manage." } },
      choices = {
        { text = "Peace in the square is worth every coin. I'll not argue.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gold behind a Bruiser's club isn't peace. It's just a price.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Give it back? Every copper in this vault came up out of somebody's mine, and every last copper is staying right here, where the earth can't reach it and the interest can. The Cartel has never lost a coin to a landslide, and I'd like to keep it that way." } },
      choices = {
        { text = "Walls and Bruisers. That's how you keep what's yours.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The desert eats every vault eventually, banker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tried, three times, and the Bruisers caught all three before they reached the second lock, and billed them for the Bruisers' time. The fourth one is the one I worry about, because the fourth one will have learned from the first three." } },
      choices = {
        { text = "Your vault is safe. Rogues know better than to try.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No lock is perfect, banker. Remember that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's discuss something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not mine, because the Cartel paid for wards from people who know their business. But the price of those wards goes on every account, so in a sense, friend, every mage in Azeroth is making your banking more expensive." } },
      choices = {
        { text = "Good wards are worth any price.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You overcharge and blame the mages for it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gimblethorn.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Cartel spends gold on walls, Bruisers and water, and you could argue that keeps more poor folk alive than any almshouse would. Charity isn't written in the ledger, friend, but neither is letting a town die of thirst, and that counts for something." } },
      choices = {
        { text = "Gold piled in a vault feeds nobody. Give some away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Walls and water are charity enough. Keep your ledger.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Plenty of strange things, though I'm paid not to say which, so let's just say some of the deposits hum at night. Steamwheedle doesn't ask what goes in, only that it's paid for, and that rule has kept the peace in this town for years." } },
      choices = {
        { text = "Neutrality keeps the peace. Your rule is wise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things shouldn't be kept, paid for or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not in the least, because gold is gold and a vault doesn't take sides. That's the whole point of Gadgetzan, friend: everyone's money is safe here, and so everyone's safe here, which is more than you can say for most places in Kalimdor." } },
      choices = {
        { text = "A neutral vault keeps the peace. That's worth respecting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some gold is bought with blood. You should care whose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Twice, and the second time the box started knocking from the inside at midnight. I sent for the Bruisers, who sent for a mage, who sent for a priest, and finally we buried it in the dunes and charged the owner for the trouble." } },
      choices = {
        { text = "Sensible. Some things shouldn't be kept at all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You buried something valuable. That was a waste.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_gimblethorn = {
      lines = {
        { id = "xalt_gimblethorn_default", text = "I'll tell you what I tell everyone, friend, which is that an account is private, and {alt}'s box is as closed to you as yours is to {alt}. What I can say is that the deposits were regular, which in Gadgetzan is a rarer quality than courage." },
        { id = "xalt_gimblethorn_other", when = { alt = { faction = "other" } }, text = "A {altrace}, from the other side, and the Cartel keeps that box on the same shelf as yours, three slots apart, which I find very restful. Wars end, friend, but compound interest goes on forever." },
      },
      choices = {
        { text = "Good. A banker should keep every secret, whoever's asking.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "In this town, secrets are for sale like anything else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "That's all I wanted to know.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" } },
          text = "Hm, I've a {altrace} on my books by the name of {alt}, from the other side of the war, and the signature looks oddly like yours would, if you signed anything. Both sides bank with the Cartel, friend, and I keep their boxes on the same shelf, which is nobody's business but mine." },
        { id = "h_alt_same", when = { alt = { faction = "same" }, metBefore = false },
          text = "{alt} opened a box with me not long ago, and you've the same way of leaning on my counter, which I notice, because counters cost money. A relation, perhaps, or simply a careful sort of customer, and I like those either way." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here at the vault. Your totems may command the earth outside, friend, but in here the earth is a floor, the Bruisers stand on it, and the Cartel owns it." },
        { id = "h_default", key = true,
          text = "Gimblethorn, banker to the Steamwheedle Cartel in Gadgetzan. Horde gold and Alliance gold weigh the same on my scales, to the grain, and both go in the same vault behind the same Bruisers for the same fee." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The vault never closes, because a goblin bank that closes is a goblin bank somebody else is opening. Make it quick, though, pal; I'm on my third pot of coffee and coffee's dear out here." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "I'll ask you to keep both hands on the counter, friend. I'm sure you're an honest customer, but I'm surer still that my vault has seen your sort before." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Do you know how much it costs to keep a vault safe from someone who can walk through a wall, or turn a guard into a sheep? I do, pal: three extra wards, two extra Bruisers and a sheep clause in the insurance." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the vault. The Cartel doesn't tithe, I'm afraid, but you're welcome to pray over your deposit, and the Bruisers will watch you do it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. I won't be askin' you to bless the vault, because the last holy man through here asked how much the Cartel set aside for the poor, and I had no good answer for him." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Kindly keep your weapon sheathed in the bank, friend, since the Bruisers count a drawn blade as a withdrawal from your good standing, with penalties." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Your beast stays outside the vault, I'm afraid, because the last one that came in ate a deposit slip and the dispute is still unresolved." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at the bank. Bears don't carry much gold, I'd have thought, but you're welcome to keep what you have here, safe behind the Bruisers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at the bank. I'll keep your gold safe, friend, but I'll remind you that the Cartel's vault holds Horde gold too, and I won't hear any complaints about it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'll take your gold and keep it safe, but anything that glows, smokes or whispers stays out of my vault, by order of the Cartel." },
      },
      again = {
        { id = "h_again", text = "Anything else, or shall I open your box? Opening's included, closing's included, and everything else is itemized." },
        { id = "h_again2", text = "Still here? Time is money, friend, and so is the lamp oil." },
      },
      choices = {
        { text = "Is there anything in your vaults a druid should worry about?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Gold comes from the earth, and the Cartel never gives any back.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Open my box, please.", next = "BUSINESS" },
        { text = "Is anything in this town actually safe?", next = "safe" },
        { text = "You must keep accounts for half of Tanaris.", next = "clients" },
        { text = "Do the Horde keep their gold beside ours?", next = "both_sides", when = { faction = "Alliance" } },
        { text = "Do the Alliance keep their gold beside ours?", next = "both_sides", when = { faction = "Horde" } },
        { text = "A vault like this must tempt a thief or two.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can a mage really breach your vault?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the Cartel ever spend its gold on the poor?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the Cartel's gold ever buy anything holy, Gimblethorn?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you trust warriors less than other customers, Gimblethorn?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What happened with the beast that ate the deposit slip?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Doesn't it bother you to hold the Horde's gold, Gimblethorn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has someone tried to bank something cursed, Gimblethorn?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Tell me about this other customer of yours, Gimblethorn.", next = "xalt_gimblethorn", when = { alt = true } },
        { text = "That's all.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "The vault is safe, because the Cartel pays the Bruisers to make it safe, and pays them well, and the Bruisers don't care what colour your tabard is. Everything outside the walls belongs to the bandits and the sun, and neither one issues receipts." } },
      choices = {
        { text = "What about the Wastewanders?", next = "safe_bandits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_bandits = {
      lines = { { id = "sb_default", text = "They took the water towers, and if they could find a way through these doors they'd take the vault too. The Water Company pays bounties for them, so ask Bilgewhizzle, and bring the bounty money back here afterwards." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    clients = {
      lines = { { id = "c_default", text = "Everyone who means to come back. I won't name names, because a banker who talks about his customers doesn't stay a banker long, but Marin's box is very full of receipts and very short of gold." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    both_sides = {
      lines = {
        { id = "bs_default", text = "Side by side, in the same vault, and they've never once started a war down there. If the factions behaved half as well as their gold does, I'd be out of a job guarding it." },
      },
      choices = {
        { text = "Who would you never let into the vault?", next = "op_venture" },
        { text = "Neutral ground is good for everyone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner not share a roof with them.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I counted coins in Booty Bay until the Cartel needed a careful pair of hands out here, at a slightly better rate, and careful hands are rare in a desert." } },
    advice = { { id = "tp_ad", text = "Out in the dunes, a smart traveler buries half his coin and remembers where, and a smarter one leaves it with me and pays the fee." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel keeps the peace because peace is good for business, and the vault is where that business ends up." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's vault is the safest place in the desert, friend, because the Bruisers guard it and the sand guards the Bruisers. I've never lost a coin, and I've counted them all twice." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's vault was my first post, friend, and I learned there that pirates make wonderful depositors and terrible neighbors. Here it's sand thieves, and they're no better." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The adventurers who come back from Zul'Farrak deposit the strangest things, friend, troll idols and cursed coins and once a whole mummified hand. I don't ask, I just log it." } },
    everlook = { { id = "tp_everlook", text = "Everlook's vault has the coldest coins in the Cartel, friend, and I hear the banker wears mittens to count them. I'd rather count warm ones." } },
    _none = { { id = "tp_none", text = "That isn't something I can put a price on, friend, so I don't know anything about it." } },
  },
}

P:NPC {
  key = "bera", id = TODO_NPC("Bera Stonehammer"), name = "Bera Stonehammer", title = "Gryphon Master",
  bible = "bibles/tanaris.md", role = "flightmaster", tier = "service",
  communities = { "gadgetzan" }, temper = { "blunt" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Bera Stonehammer keeps the Alliance gryphons in Gadgetzan and spends half her day keeping sand out of their feathers. She speaks of the desert like a personal insult.",
    third = "{name} met Bera Stonehammer, the dwarf who keeps the Alliance gryphons in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird, {g:lad|lass}? Mind the sand on the perch, because it gets into everything, and the gryphons hate it even more than this old Dun Morogh lass does." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, this far south! Did you get lost on the way to the mountains, or did someone pay you to come and sweat?" },
  },

  start = "hello",
  nodes = {
    op_horde = {
      lines = {
        { id = "oph_q", text = "I'll not lie to you, there are dwarves in Ironforge who'd box my ears for nodding at an orc. You've seen more of the Horde than I have from this yard, so what do you make of them?" },
        { id = "oph_q_h", when = { faction = "Horde" }, text = "You're of the Horde yourself, so you'll know them better than any dwarf. Tell me straight what I should make of your lot." },
      },
      choices = {
        { text = "Most of them want what we want: a roof, a meal, no war.", next = "op_horde_r1", fx = { affinity = 2, align = { light = 1 }, opinion = { horde = "mixed" } } },
        { text = "They're the enemy. Gadgetzan's peace is only goblin coin.", next = "op_horde_r2", fx = { affinity = -1, align = { light = -1 }, opinion = { horde = "war" } } },
        { text = "Your clan would box your ears, Bera. Mine too.", next = "op_horde_r3", fx = { trait = { witty = 1 }, opinion = { horde = "distrust" } }, when = { race = "Dwarf" } },
        { text = "We keep our word, Bera, and Bulkrek keeps his.", next = "op_horde_r4", fx = { affinity = 1, opinion = { dwarves = "respect" } }, when = { faction = "Horde" } },
        { text = "I'll leave that to you and Bulkrek.", next = "BACK" },
      },
    },
    op_horde_r1 = {
      lines = {
        { id = "op_horde_r1", text = "Aye, that's what I see in Bulkrek, though he'd never say it in so many words. Maybe I'll tell him you said so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_horde_r2 = {
      lines = {
        { id = "op_horde_r2", text = "The enemy, maybe, back home. Out here the enemy's the sand and the bandits, and I'll fight those first, thank you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_horde_r3 = {
      lines = {
        { id = "op_horde_r3", text = "Ha! Aye, they would, and then they'd want to know how his wyverns stay so glossy. Ironforge is a very curious place." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_horde_r4 = {
      lines = {
        { id = "op_horde_r4", text = "Then the two of us will keep nodding in the mornings, and the Bruisers can have a quiet life. That suits me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_bera = {
      big = true,
      lines = { { id = "xpt_bera_default", text = "Every day, and twice when the sandstorms come, because there's no wind under the mountain and no sand in your ale. But the gryphons need someone who knows them, and a dwarf goes where the work is and complains about it later." } },
      choices = {
        { text = "Duty first. Home will still be there when the work's done.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Life's too short, Bera. Go home and let someone else do it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every day. Gryphons were made for mountain air, and this wind's full of sand and goblin smoke. If you've any pull with it, tell it we're only passing through." } },
      choices = {
        { text = "I'll ask the wind kindly, for your birds' sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The wind does as it likes. Your birds will cope.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not raiding, sniffing, because they know a crate by a gryphon post usually means something worth stealing. My birds can outfly any bandit, but they can't outfly the one waiting by the roost when they land, and that's what I need a warrior for." } },
      choices = {
        { text = "Guard the roost and hold it. That keeps the birds safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunt the bandits down in their own camps. That ends it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "About as well as I get on with sand, which is to say badly and loudly. Gryphons are bred in the snows of Dun Morogh, and they think anything with four legs and a tail is either lunch or a rival, and they haven't decided which." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Badly and loudly, because gryphons think anything with four legs and a tail is either lunch or a rival. {pet} is welcome to keep its distance from the roost, and I'll keep my birds from deciding it's lunch." },
      },
      choices = {
        { text = "Any beast learns its place with patient training.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wild things stay wild. Training only goes so far.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not well, by my beard. They're mountain birds, built for snow, and every morning I comb a fistful of sand out of their feathers and listen to them sulk about it." } },
      choices = {
        { text = "Send them home to the mountains. This is no place for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll adapt. Everything out here does, or it dies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "She keeps Theramore standing with the Horde on its doorstep, and that takes nerve as well as magic. I fly her people in and out of Dustwallow often enough, and I've never yet seen one of them complain about the heat, which I count to her credit." } },
      choices = {
        { text = "Theramore's peace with the Horde is wise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Making peace with the Horde is a mistake.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Now that would be telling, and I'm not a telling sort of dwarf. Let's just say Stormwind keeps an eye on the goblins, and the goblins know it, and both of them pretend otherwise over a pint at the inn." } },
      choices = {
        { text = "Stormwind's right to keep watch.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spying on neutral ground is dishonest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Bera.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Alliance folk who went in after the trolls, mostly, and came out with spear wounds and worse, poor souls. I fly them to Theramore as fast as a gryphon can go, but some of them don't last the crossing, and I'd dearly love a healer who'd ride along." } },
      choices = {
        { text = "No soldier should die in the saddle for want of a prayer.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose to raid Zul'Farrak. The risk was theirs to carry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Bulkrek? He keeps to his wind riders and I keep to my gryphons, and we nod across the yard every morning like two old soldiers who've run out of reasons to fight. The Cartel's truce holds here, and I'll say this for the orc, he treats his beasts better than some Alliance riders I've known." } },
      choices = {
        { text = "The Cartel's truce is law here. Keep to it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The truce is goblin paper. An orc is still an orc.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They'll carry ye, so long as the demon stays dismissed until ye land. I had a bird refuse tae fly once wi' an imp on the saddle, an' it took me an hour tae talk her down from the roof." } },
      choices = {
        { text = "I'll dismiss him before I ride. Spare the roof.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon goes where I go, Bera.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_bera", tags = { "news" }, when = { party = { race = "Dwarf" }, faction = "Alliance" },
          text = "Is that a dwarf in your company? {companion} is welcome at my roost, because it's nice to hear a proper accent among all these goblins." },
        { id = "h_default", key = true,
          text = "Bera Stonehammer, gryphon master for the Alliance in Gadgetzan, and aye, a long way from the snows. I'll get ye back to Theramore or Feathermoon, or wherever else your road runs, and if you're Horde, the orc with the wind riders is over there." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "My birds won't carry ye, I'm afraid, and they bite strangers anyway, same as any proper Wildhammer bird. Bulkrek keeps the wind riders a wee bit further on, and he'll see you right." },
        { id = "h_druidcl", when = { class = "DRUID", race = "NightElf" },
          text = "A druid of the Circle! You'll be heading for Feathermoon, I expect, since most of your folk do once they've had a taste of this sand." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Ye'll be wanting to fly to Theramore, I'd wager, and pay your respects to Lady Proudmoore's tower. The gryphons don't mind mages, so long as ye don't singe their feathers." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Quiet boots on the gryphon roost, eh? I've known a few of your sort, and they always want to know which gryphon flies fastest and lands quietest." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Good, because my gryphons fly hurt folk out of Zul'Farrak more often than I'd like, and I can mend a wing but not a soldier." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! My father fought beside your order in the Second War, and he swore he never saw a braver lot, though he also said they snored louder than dwarves." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior of the Alliance! Good, I've a crate of dispatches for Theramore that keeps drawin' bandits, and by my beard they could stand to meet you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, and one of ours! Mind your beast near my gryphons, though, because they're sick of the sand and in no mood to be sniffed." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Keep yer demon away from the roost, because my gryphons are jumpy enough in this heat, an' they've no love for anythin' that smells o' brimstone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I'll fly you anywhere, but if you could ask the wind to keep the sand out of my birds' feathers, I'd be in your debt." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are restless in this heat, and frankly so am I; it's no' a dwarf's climate." },
        { id = "h_again2", text = "Go on, then, ask; I've a bucket of water to fetch before the gryphons start complaining." },
      },
      choices = {
        { text = "How do your gryphons manage this desert, Bera?", next = "druid_q", when = { class = "DRUID", race = "NightElf" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do gryphons stand the desert?", next = "heat" },
        { text = "You and the orc get along?", next = "bulkrek" },
        { text = "What do you think of Lady Proudmoore, Bera?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do SI:7 agents fly through Gadgetzan often?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You must fly a good many wounded out of Zul'Farrak.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the orc across the yard give you any trouble?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are the Wastewanderers raiding your gryphon crates, Bera?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do your gryphons get on with hunters' beasts, Bera?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Will your gryphons carry a warlock at all, Bera?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The desert wind can't be kind to your gryphons, Bera.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do you miss Ironforge out here, Bera?", next = "xpt_bera", when = { party = { race = "Dwarf" }, faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    heat = {
      lines = { { id = "he_default", text = "Badly, and they let me know it, because a gryphon is a mountain bird with a mountain bird's opinions. I keep them in the shade and pay the Water Company for their troughs, and that's more water than some folk here drink." } },
      choices = {
        { text = "Water for birds, in a drought. That seems a waste.", next = "heat_water" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_water = {
      lines = { { id = "hw_default", text = "A thirsty gryphon drops you in the dunes, friend, so yes, water for birds, and gladly. If you want the price to come down, go and run those bandits off Waterspring Field." } },
      choices = {
        { text = "The birds come first. I'd not want to walk.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "People should drink before animals.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulkrek = {
      lines = {
        { id = "bk_default", text = "We share a well and a wall, and we nod in the mornings. The Bruisers make sure that's all we do, though truth be told, he keeps his beasts better than most of the gryphon masters I trained with in Ironforge." },
        { id = "bk_dwarf", when = { race = "Dwarf" }, text = "Aye, I know what Ironforge would say about it, and Ironforge isn't here sweating with me. He keeps his beasts well, and that's the measure I use." },
      },
      choices = {
        { text = "What do you make of the Horde, Bera?", next = "op_horde" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've kept gryphons since I was a lass in the snows of Dun Morogh, and the Alliance sent me where the birds were needed. Nobody asked whether I liked sand." } },
    advice = { { id = "tp_ad", text = "Carry water on the flight, because there's none to land for between here and Feralas." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer taught every gryphon master worth their salt, and I'd give my right arm to fly with them once at Aerie Peak. They ride without saddles, ye know, and I've tried it once and regretted it." } },
    magni = {
      { id = "tp_magni", text = "King Magni's a fine king, and he'd hate this sand as much as I do. I'd love to see him try to fly a gryphon through a Tanaris storm." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Ye've come a long way from the mountain too, then, and I'll bet ye miss the snow as much as I do. Raise a mug to the king for me next time ye're in Ironforge." },
    },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the worst place I've ever kept birds, and the goblins charge me double for water. The gryphons hate it, and I hate it more." } },
    theramore = { { id = "tp_theramore", text = "The Theramore flight's the best one I've got, over the water and into the marsh, and the birds love it. It's the only cool air they get." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye; ask somebody with less sand in their ears and less ale on their mind." } },
  },
}

P:NPC {
  key = "bulkrek", id = TODO_NPC("Bulkrek Ragefist"), name = "Bulkrek Ragefist", title = "Wind Rider Master",
  bible = "bibles/tanaris.md", role = "flightmaster", tier = "service",
  communities = { "gadgetzan" }, temper = { "gruff" }, values = { "dutiful", "honor" },
  notices = { "race" },

  impression = {
    first = "Bulkrek Ragefist keeps the Horde's wind riders in Gadgetzan and says very little that isn't about them. He nods at the dwarf across the yard every morning, and seems to mean it.",
    third = "{name} met Bulkrek Ragefist, the orc who keeps the Horde's wind riders in Gadgetzan.",
  },

  greetings = {
    { id = "o_horde_mixed", when = { gossip = { topic = "horde", stance = "mixed" } }, text = "Bera, the dwarf across the yard, says you told her the Horde wants a roof and a meal like anyone. She nodded at me twice this morning, so I suppose I owe you for it." },
    { id = "g_default", text = "You need a wind rider, or you need shade? Both are here; only one is free." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. It's good to see a face from Durotar in this goblin oven; the sun here is worse than ours, and the company talks more." },
  },

  start = "hello",
  nodes = {
    op_dwarves = {
      lines = {
        { id = "opd_q", text = "You've seen me nod at the dwarf. Tell me, traveller: what do you think of the dwarves?" },
      },
      choices = {
        { text = "Stubborn but honest. You could do worse for a neighbour.", next = "op_dwarves_r1", fx = { affinity = 1, align = { light = 1 }, opinion = { dwarves = "respect" } } },
        { text = "They fought the Horde in every war. Don't forget it.", next = "op_dwarves_r2", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { dwarves = "distrust" } } },
        { text = "I'm a dwarf, orc. We remember the Horde too.", next = "op_dwarves_r3", fx = { opinion = { horde = "distrust" } }, when = { race = "Dwarf" } },
        { text = "I've nothing to say about dwarves.", next = "BACK" },
      },
    },
    op_dwarves_r1 = {
      lines = {
        { id = "op_dwarves_r1", text = "Stubborn, yes, and her gryphons are as stubborn as she is. I can work with that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_dwarves_r2 = {
      lines = {
        { id = "op_dwarves_r2", text = "I don't forget it. I nod anyway, because the Bruisers are watching, and because she keeps her beasts well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_dwarves_r3 = {
      lines = {
        { id = "op_dwarves_r3", text = "Good. Then we remember together, and we keep the wall standing. That's enough for Gadgetzan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "She'll know by tomorrow, because she knows everything that happens in this yard, and so do I. We nod at each other every morning, and I think she'll nod a little longer when she sees you, since her paladins never smelled like that." } },
      choices = {
        { text = "Nod back to him. Gadgetzan's truce deserves respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "He's Alliance. I'd trust him with nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They bite whoever they please, but they bite less if you sit straight and do not flinch. A wind rider smells fear the way a wolf does, and a warrior who has stood against the Wastewanderers should have none left to show it." } },
      choices = {
        { text = "A warrior earns a beast's trust. He doesn't take it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A strong hand on the reins is all a beast needs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They accept a beast that stands still and does not stare, which is more than most hunters manage. The dwarf's gryphons across the yard have learned it too, and so we keep the peace, birds and beasts and two flight masters both." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They accept a beast that stands still and does not stare, which is more than most hunters manage. {pet} has good manners, I see, for it knows not to look a wind rider in the eye." },
      },
      choices = {
        { text = "Respect the old beasts' ways, and they'll respect yours.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast follows the strongest. Manners don't come into it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Most of them, and some I strap to the saddle because they cannot sit up. A troll priest once flew with them and kept them breathing all the way to the Crossroads, and I have not forgotten it." } },
      choices = {
        { text = "Then I'll fly with them when I can. That's my duty.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The weak should have stayed home. I won't nurse them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They hunt well here, scorpids and buzzards and whatever strays too far from the road. But the heat shortens their tempers, and a short-tempered wind rider has a long reach." } },
      choices = {
        { text = "Keep them on short tethers, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them hunt. A free beast is a better beast.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Badly, at first. The hot air rises off the dunes and throws them about, and the young ones fight it, so I teach them to ride it instead, the way an old shaman once taught me to ride my temper." } },
      choices = {
        { text = "The wind needs a firm hand, like any beast.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ride it, never rein it. The wind won't be owned.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I trust a wind rider, and a sharp axe, and the word of the Warchief. The warlocks once bound our people in chains no one could see, and every orc of my years still remembers how it felt to wear them, so I will carry you where you need to go, but I will not like your craft, and I will not say I do." } },
      choices = {
        { text = "The old Horde's sins aren't mine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is what made the Horde strong.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "In Orgrimmar, nothing; the Shattered Hand do the Warchief good work in back alleys. Here, a sly look is enough to get you thrown out into the sand, and I'd sooner not fly you home with Bruiser bruises on you." } },
      choices = {
        { text = "The Shattered Hand serve the Horde with honor.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honor doesn't win wars. Shadows do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Often, because a portal costs reagents and a wind rider costs a few coins and a strong stomach. The beasts don't care for the smell of the arcane, though, so I'll ask you to keep your hands still while you're on one." } },
      choices = {
        { text = "I'll ride quietly. Your beasts deserve that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the beast doesn't like it, it can get used to it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde. The wind riders are calmer when one of you is near, and so am I, so speak freely." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The riders who come in from Zul'Farrak are cut and sun-blind, and I would rather they met you than the long flight home." },
        { id = "h_default", key = true,
          text = "I am Bulkrek Ragefist, and I keep the wind riders for the Horde here. They will take you to Orgrimmar, the Crossroads, Camp Mojache and wherever else the Horde flies." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "My riders don't carry the Alliance, and they'd tell you so themselves, louder than I would. Stonehammer keeps your gryphons; go and see her." },
        { id = "h_druidcl", when = { class = "DRUID", race = "Tauren" },
          text = "A druid of Thunder Bluff. The riders trust your kind, and they say you smell of the plains." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock of the Horde. The old Horde drank deep of that well, and the Warchief has not forgotten it, so I hope you drink from it more carefully than they did." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You move softly for one of the Horde, which the wind riders will like, since they dislike stomping. I hope you move as softly around the Bruisers, because they don't take kindly to anyone who looks too sly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior of the Horde. Good, my wind riders respect a strong arm, and they bite the weak ones." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter of the Horde. My wind riders smell your beast already, so let it stand where they can see it, and they will settle." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could open a portal to Orgrimmar and save my wind riders the trouble, so I suppose you're here to tell me you like the view." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The dwarf across the yard keeps gryphons for paladins, and now I keep wind riders for one too." },
      },
      again = {
        { id = "h_again", text = "Speak, then. The riders are fed, and an orc does not waste a fed rider's patience." },
        { id = "h_again2", text = "More? The heat makes orcs short-tempered, but I will listen." },
      },
      choices = {
        { text = "How do the wind riders take this desert wind?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Your wind riders seem to have taken to the desert.", next = "druid_q", when = { class = "DRUID", race = "Tauren" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do the wind riders take the heat?", next = "riders" },
        { text = "Do you trust the goblins here?", next = "goblins" },
        { text = "You don't seem to trust warlocks, Bulkrek.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What's wrong with looking sly, Bulkrek?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the wounded fly out through you, Bulkrek?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your wind riders really bite weak riders, Bulkrek?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do wind riders accept other beasts near them, Bulkrek?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do mages ever use your wind riders, Bulkrek?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does the dwarf across the yard know about me, Bulkrek?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "Better than the dwarf's gryphons, because the Barrens raised them hard. They hunt the basilisks out past the walls when I let them, and the goblins pay me not to let them hunt anything else." } },
      choices = {
        { text = "What else would they hunt?", next = "riders_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders_hunt = {
      lines = { { id = "rh_default", text = "Goats, mostly, and once a goblin's chicken, which cost me a week's wages and a long apology to the Bruisers. A wind rider does not understand property, and I have stopped trying to teach it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    goblins = {
      lines = {
        { id = "g_line", text = "I trust them to want my coin, and they've never once let me down there. Their Bruisers keep the peace with the dwarf across the yard, and peace with a dwarf is a strange thing for an orc to get used to." },
        { id = "g_orc", when = { race = "Orc" }, text = "Every orc remembers the camps, or the stories of them, so you know what it means to nod at a dwarf each morning and not reach for an axe. I've done it for a year now, and some days I even mean the nod." },
      },
      choices = {
        { text = "What do you think of dwarves?", next = "op_dwarves" },
        { text = "Peace with the Alliance is worth keeping.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A truce bought by goblins won't last.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sat in the camps until Thrall broke them open, and I have flown for the Horde since. Now I fly goblins' customers, and I don't complain where the Warchief can hear." } },
    advice = { { id = "tp_ad", text = "Don't feed the riders from your hand unless you've spare fingers." } },
    thrall = { { id = "tp_thrall", text = "The Warchief broke the camps open, and I was in one of them. I fly for him, and for nobody else, whatever the goblins think they're paying me for." } },
    internment = {
      { id = "tp_internment", text = "I spent years in an internment camp, behind walls and under guards, until the Warchief came. I don't talk about it much, and I don't like being asked." },
      { id = "tp_internment2", when = { race = "Orc" }, text = "You'd know about the camps yourself, or your elders would. Don't let anyone tell you it made us weak, it taught us to wait." },
    },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's too hot for the beasts, and too loud for me. But the dwarf across the yard keeps her birds alive, and I respect that." } },
    centaur = { { id = "tp_centaur", text = "The centaur in the Barrens shoot at wind riders for sport. I've lost good beasts to their arrows, and I don't forget it." } },
    _none = { { id = "tp_none", text = "I know wind riders and I know the sky. That is neither." } },
  },
}

P:NPC {
  key = "dirge", id = TODO_NPC("Dirge Quikcleave"), name = "Dirge Quikcleave", title = "Butcher",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "boastful" }, values = { "pride", "profit" },
  notices = { "class" },

  impression = {
    first = "Dirge Quikcleave calls himself the greatest living chef in Azeroth and waves a cleaver to make the point. There is a drought in Gadgetzan, but somehow never a shortage of his meat.",
    third = "{name} met Dirge Quikcleave, the boastful goblin butcher of Gadgetzan's inn.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Course you're hungry, pal; everyone who smells my kitchen is hungry, even the Bruisers, and they pay with bruises, which I've stopped accepting." },
    { id = "g_chops", when = { questActive = TODO_QUEST("Dirge's Kickin' Chimaerok Chops") }, text = "Tenderloins! Tell me you brought tenderloins, buddy, because the pan's hot and my patience isn't, and I pay top copper for good ones." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then you know good meat when you skin it, pal, and you know my prices are fair for it, more or less, mostly less." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Red meat, rare, carved thick, and nothing green on the plate to insult it! I've fed Bruisers, caravan guards and a dwarf who lifted my table over his head to say thank you, and they all fought better for it." } },
      choices = {
        { text = "A full belly and a steady head win more fights than rage.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunger keeps a warrior's edge. I'll feast after the fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I buy meat from everyone and ask no one where it came from, which is the secret of a stocked kitchen in a drought and a very healthy margin. But a hunter's meat I trust, because you know the difference between a fresh kill and something the hyenas have already had a go at." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I buy meat from everyone, but a hunter's meat I trust, because you know a fresh kill from something the hyenas have had a go at. {pet} looks like a connoisseur, too, so if it ever turns its nose up at one of my chops, I want to know." },
      },
      choices = {
        { text = "A hunter kills clean and wastes nothing. That's the craft.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Meat is meat. How it died doesn't matter at the table.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "That, friend, is a chef's secret, and I'll take it to my grave, which, if you're Forsaken, I suppose isn't the end of anything. Let's just say the desert provides, and Dirge Quikcleave seasons." } },
      choices = {
        { text = "A chef who feeds the hungry earns more than boasting, Dirge.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let the hungry pay or starve. That's the desert's way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The desert, pal, which holds more meat than anyone thinks, and all of it free for the catching. Basilisk, scorpid, the odd roc that strays too close, and if you've a problem with any of it, the fire certainly doesn't." } },
      choices = {
        { text = "Thank the beasts' spirits for what you take, chef.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Meat is meat. The spirits can find their own supper.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It's food without a soul, friend, bread that nobody kneaded and water that never fell from the sky! Eat it if you must on the road, but in Gadgetzan you'll eat my chops like a civilised person, and you'll thank me for it." } },
      choices = {
        { text = "Conjured food feeds the hungry. Nobody cares how it tastes.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're right. Real food deserves real effort.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's change the subject.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Then it has better taste than my regulars, I'll give it that. But it can admire from over there, because I've seen what imps do with fire, and my kitchen isn't going to be the punchline." } },
      choices = {
        { text = "My servant goes where I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep the imp out of your soup.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Dirge.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The hungry who can't pay usually end up as somebody else's problem, friend, but now and again I leave a pot by the back door and pretend I forgot it there. Don't tell anybody, because the greatest living chef in Azeroth has a ruthless reputation to protect." } },
      choices = {
        { text = "That pot does more good than all your fancy dishes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity just teaches beggars where your door is, Dirge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not a scrap, because nothing comes cheap in this desert, pal! The hide goes to the leatherworkers at a profit, the bones go in the stock, and the bits nobody wants go to the vultures, and they're my best critics." } },
      choices = {
        { text = "Using everything honors the beast. Well done.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is meat. It doesn't need honoring.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The desert, friend, all of it, and fresher than you'd find in Stormwind. Basilisk, scorpid, hyena when I'm desperate, and every bit of it cooked so well you'd never guess what it used to be, which is the real art of the thing." } },
      choices = {
        { text = "Honest food from honest hunting. I respect that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hiding what it used to be sounds like a trick, Dirge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "One or two a season, mostly after my chimaerok chops, because word gets round. The last one got away with a whole rack, and the next week I saw it on a menu in Booty Bay at twice my price, and that's the only time I've ever wanted to leave Gadgetzan." } },
      choices = {
        { text = "Stealing a chef's recipe is low. I'd never do it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it's good enough to steal, it's good enough to sell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You talk to fire and I cook with it, and between the two of us I'll bet the fire likes me better, because I feed it the finest cuts in Azeroth." },
        { id = "h_default", key = true,
          text = "Dirge Quikcleave, greatest living chef in all of Azeroth, and the living part matters, pal, because the competition keeps dying in the desert. Water's short in Gadgetzan, but meat isn't, so what'll it be, and how much are you spending?" },
        { id = "h_chops_before", when = { minLevel = 58, questBefore = TODO_QUEST("Dirge's Kickin' Chimaerok Chops") },
          text = "You look like somebody who goes to dangerous places, buddy, and I've got a recipe that needs a dangerous place. Chimaerok, off the Isle of Dread, and nobody's tasted it the way I cook it, and nobody's paid what they'll pay for it." },
        { id = "h_chops_during", tags = { "news" }, when = { questActive = TODO_QUEST("Dirge's Kickin' Chimaerok Chops") },
          text = "The Isle of Dread's off the Feralas coast, and the chimaerok there are the size of houses and twice as mean. Bring me their tenderloins, and the rest of the recipe's my secret." },
        { id = "h_chops_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dirge's Kickin' Chimaerok Chops"), days = 3 } },
          text = "Kickin' Chimaerok Chops, made right, for the first time this side of the sea! I'd frame the pan if I didn't need it for dinner, and dinner's at a premium tonight." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't you dare conjure your little bread rolls in front of the greatest living chef in Azeroth, because I'll take it as a personal insult." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Your imp keeps looking at my meat, friend, and I'll thank you to tell it that the greatest chef in Azeroth doesn't cook for demons." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You can bless my meat if you like, but I'll tell you now, it's already the finest in Azeroth, and no loa or Light could improve on it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Wonderful, you can tell everybody my meat is perfectly clean, because I swear on my cleaver it comes from honest beasts and not from anywhere a priest wouldn't like." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You look like you eat for three, pal, and I cook for six and charge for nine, so you and I are going to be very good friends." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Ah, a fellow professional of the meat trade, buddy, and don't let anybody tell you otherwise." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Don't tell me you're one of those who won't eat meat, because I'll take it personally, and I've a cleaver right here." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now you look like someone who appreciates a proper meal, because nobody swings a hammer that size on a stomach full of conjured bread." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Hands off the cleaver, friend, because I'll know if it's moved, and I'll know who moved it, and I'm faster with it than I look." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk fast, the grill's on and the grill's eating coal I paid for." },
        { id = "h_again2", text = "Still standing there? Either buy something or tell me a secret ingredient, and the ingredient had better be good." },
        { id = "h_again3", text = "Go on, I can chop and listen at the same time." },
      },
      choices = {
        { text = "Do you waste any of what you butcher, Dirge?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Where does all your meat come from, Dirge, in a drought?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let's see what you're selling.", next = "BUSINESS" },
        { text = "That meat didn't come from any farm I know of.", next = "meat" },
        { text = "Greatest living chef? Says who?", next = "boast" },
        { text = "Tell me about these chimaerok chops.", next = "chops", when = { minLevel = 55 } },
        { text = "Any tips for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "You seem to have no love for conjured food, Dirge.", next = "xmage", when = { class = "MAGE" } },
        { text = "My imp only wants to admire your work.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you ever cook for the hungry who can't pay?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where does your meat come from in a drought, Dirge?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does the greatest living chef feed a warrior, Dirge?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you buy meat from hunters, Dirge?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Where does all your meat come from, Dirge?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you get many thieves in your kitchen, Dirge?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "Basilisks, mostly, and the odd hyena, and a few things the hunters bring in that I don't ask about. Out here you don't ask the meat where it's been, pal, you ask how long it's been dead and how much it costs." } },
      choices = {
        { text = "And how long has it been dead?", next = "meat_age" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_age = {
      lines = { { id = "ma_default", text = "Not long enough to matter, which is the important thing in a desert! Innkeeper Fizzgrimble serves it at the bar and nobody's died yet, or nobody's complained, which is nearly the same." } },
      choices = {
        { text = "I'll take my chances. Smells good.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I think I'll eat my own rations.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    boast = {
      lines = { { id = "b_default", text = "Says me, and says every Bruiser who's ever eaten here and come back for seconds at full price. Show me another cook in Kalimdor who can make a basilisk taste like a holiday, and I'll hand him my cleaver." } },
      choices = {
        { text = "I've eaten better in Stormwind.", next = "boast_rival", when = { faction = "Alliance" } },
        { text = "I've eaten better in Orgrimmar.", next = "boast_rival", when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boast_rival = {
      lines = { { id = "br_default", text = "Have you, now? Then they had water to cook with and a cellar full of herbs, and I've got sand, a grill and genius. You come back after a week in the dunes and tell me what tastes better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    chops = {
      lines = { { id = "c_default", text = "My masterpiece, Dirge's Kickin' Chimaerok Chops, and it needs chimaerok tenderloins, which means the Isle of Dread. The beasts there have two heads and both of them bite, so bring friends and come back with fewer bite marks than they do." } },
      choices = {
        { text = "I can't think who would eat chimaerok.", next = "chops_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chops_who = {
      lines = { { id = "cw_default", text = "People with money, pal, and people with money don't say why they're hungry. That's my favourite kind of customer, and I'd advise you not to ask either." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Season like you mean it, and never let a customer see what's in the pot. Half of cooking is the food, and the other half is not telling anyone how you made it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I cooked for pirates, for the Cartel and once for a trogg, who ate the plate and didn't pay for it. Now I cook for Gadgetzan, which is all of those at once." } },
    advice = { { id = "tp_ad", text = "In the desert, salt the meat and not your wounds. Learn that one the easy way." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the perfect town for the greatest chef in Azeroth, pal, because nobody here can cook but me. They line up for my meat every morning." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak tried to steal my recipes once, pal, and I chased them off with a cleaver. They haven't been back." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's cooks are all fish and no flair, pal, and I've told them so. They've thrown things at me, which only proves I'm right." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's food is a crime against cooking, pal, and I've tried to tell Silas so. He offered me a job instead, and I'm still thinking about it." } },
    _none = { { id = "tp_none", text = "If I can't fry it or sell it, pal, then I don't know a thing about it." } },
  },
}

P:NPC {
  key = "blizrik", id = TODO_NPC("Blizrik Buckshot"), name = "Blizrik Buckshot", title = "Gunsmith",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  communities = { "gadgetzan" }, temper = { "loud" }, values = { "profit", "inventive" },
  notices = { "class", "race" },

  impression = {
    first = "Blizrik Buckshot sells guns in a town where the Bruisers forbid using them, and sees no contradiction in it. He test-fires everything into the same unlucky sand dune.",
    third = "{name} met Blizrik Buckshot, the goblin gunsmith of Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Looking for a boomstick, pal? You came to the right goblin, and the only one, so either way you're in luck, and luck's included in the price." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and I can tell from the squint! Somebody who aims for a living deserves better than that rusty thing on your back, buddy, and I'll give you a fair trade-in, by goblin standards." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in my shop, so I'll keep my prices honest and my mouth shut about Ironforge barrels. Mostly shut." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To shoot the ogre before it gets close enough to make you regret your armor, of course, pal! A few of the Dunemaul have learned to fear my test dune, and I'd like the rest of the tribe to feel the same way, at forty silver a rifle." } },
      choices = {
        { text = "I meet my enemy face to face. I'll leave the guns to others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If a rifle ends a fight sooner, I'll carry one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A barrel that doesn't warp in the sun and a stock that doesn't crack, and you'd be amazed how many smiths forget the second part. Sand gets into everything, so clean it every night, and if it jams, don't blame Blizrik, blame Tanaris." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A barrel that doesn't warp in the sun and a stock that doesn't crack, and clean it every night. Keep {pet} well back when you test-fire, though, because a hunter's cat bolted into my workshop once and I lost a keg of powder and most of my eyebrows." },
      },
      choices = {
        { text = "A clean rifle is a disciplined hunter's rifle. I tend mine daily.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I trust my eye, not my gear. Any gun will do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Only when they're pointed at me, friend, and that dune's never once fired back. Sandfury, Wastewanderers, pirates down at the port, they all get what's coming, and if a priest wants to patch up whoever's left, that's good for repeat business on both sides of the counter." } },
      choices = {
        { text = "Every life you end, someone has to mourn. Think on that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sell me your loudest. Shadow and powder go well together.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "That dune's taken more lead than a dwarven graveyard, and lately it's been creeping a few yards every night, like it's trying to get away. I tell myself that's the wind, and I keep telling myself." } },
      choices = {
        { text = "Even sand tires of being shot. Find another target.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It's a dune. Keep shooting until it moves for good.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "And good guns favor rogues, because nobody expects the shot until it's already been fired! Don't go pointing it inside the walls, mind, because the Bruisers have a very simple rule about guns, and it's a rule I'd like you to live through." } },
      choices = {
        { text = "A shot from the dark is cowardly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A shot from the dark wins fights.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "And a gun never runs out of whatever magic is, which I'll admit I don't understand and can't sell. Still, I've watched a mage freeze a Wastewander solid at fifty paces, and I'll allow that was a good shot, for something that wasn't a gun." } },
      choices = {
        { text = "Magic needs discipline. Guns are crude.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A gun's simpler. Anyone can use it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Never mind wands.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every one for a mile, and the hyenas have learned to keep clear of the dune out back. The druids at the gate grumble about it, but a scared hyena is a living hyena, and one that wanders into town ends up as Dirge's special." } },
      choices = {
        { text = "Better scared than dead. That's a kindness, of sorts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Just shoot the hyenas. Fewer pests that way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everyone, friend, Horde and Alliance both, and they all ask me not to sell to the other lot. I tell them yes and sell to both, because that's what neutral means and that's where the money is, and because the Bruisers are better armed than either." } },
      choices = {
        { text = "Selling to both sides keeps the peace here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You profit from both sides killing each other.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only the dune out back, and only on purpose, mostly. I test every rifle before I sell it, and I've only lost my eyebrows twice, which for a gunsmith in Gadgetzan is a very good record." } },
      choices = {
        { text = "I'll keep him well away. Your eyebrows have suffered enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He does what he likes. Move the kegs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not much, because a rifle in the right hands keeps the bandits off the road. I'll admit I don't sleep well when I hear about a raid that used my rifles on the wrong side, but I can't follow every gun out of the shop, pal, and a sale's a sale." } },
      choices = {
        { text = "You can choose who to sell to. That's on you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A gunsmith can't answer for every buyer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Lightning in a bottle, that's you, pal, and lightning's the only thing in Tanaris louder than my rifles, which I take as a professional challenge." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You heal 'em and I shoot 'em, and between us we've got the whole business of Zul'Farrak sewn up, if you'd like to talk partnership." },
        { id = "h_default", key = true,
          text = "Blizrik Buckshot, gunsmith! Rifles, ammunition, and the occasional something special when a crate turns up from Booty Bay, priced to move, and every barrel tested on that dune out back." },
        { id = "h_bruisers", when = { metBefore = true },
          text = "The Bruisers came round again about my testing, so I'm aiming further left now and I've paid the fine, again. The dune didn't complain, but the goat behind it did." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You know the trick, then: a rifle for the first shot from the dark, and the knives for when they get close. I'll sell you both, but only one of 'em gets tested on my dune." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, eh? I'll bet you think a wand is better than a gun. Wrong, pal, because a gun never asks you to stop and think before it goes bang." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You know, a rifle's just a sword that reaches further, chum, and I've got a few in here that reach clear across the Shimmering Flats, for a price that reaches about as far." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Now you're a customer who understands craftsmanship, buddy, because a hunter's rifle has to work every time, not just on the test dune." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You've got claws, so I don't suppose you'll buy a rifle, but I've seen druids pay good coin to keep a hunter friend in shot, so think of it as a gift." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You're a hammer sort, I can tell, but have you ever thought about the advantages of hitting someone from a very long way off?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Keep your little friend away from the powder kegs, please, because I don't want to find out what happens when an imp sneezes near them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, in a gun shop! I won't ask you to buy anything, but if you could bless a crate of powder so it doesn't go off on the boat, I'd consider that a great service." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I've got powder drying and it doesn't like to wait, and when it gets impatient it gets loud." },
        { id = "h_again2", text = "Go ahead, ask, buddy, but keep your fingers off the triggers, because the triggers are hair-fine and the walls are new." },
      },
      choices = {
        { text = "Do your guns frighten the desert beasts?", next = "xdruid", when = { class = "DRUID" } },
        { text = "That dune you shoot at must be sick of you by now.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Guns in a town that bans fighting?", next = "peace" },
        { text = "Dwarven guns or goblin guns?", next = "rivals" },
        { text = "Rogues do favor a good gun, Blizrik.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A wand never needs powder or shot.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you ever think about who your guns are pointed at, Blizrik?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a warrior need a gun, Blizrik?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What makes a good hunting rifle in this heat, Blizrik?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'd guess Horde and Alliance both buy your guns, Blizrik.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has anything ever exploded in your shop, Blizrik?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does it trouble you, selling weapons all day, Blizrik?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "The Bruisers ban shooting people inside the walls, pal, not selling the means to shoot them outside. That's a distinction worth a small fortune, and I live in it." } },
      choices = {
        { text = "A neat loophole. Good for you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Seems the Bruisers should close it.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      lines = {
        { id = "r_default", text = "Dwarves make guns that last a hundred years, and goblins make guns that go bang a hundred times louder. You pick which you'd rather have in a fight, but mine come with a lot more personality." },
        { id = "r_dwarf", when = { race = "Dwarf" }, text = "You'll say Ironforge, of course, and you'll be right about the barrels and wrong about everything else. A goblin rifle has heart, and sometimes a little too much powder." },
      },
      choices = {
        { text = "Too much powder?", next = "rivals_powder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals_powder = {
      lines = { { id = "rp_default", text = "Only a little too much, and only on the cheaper ones, and the eyebrows grow back in a month. I tell every customer that before they buy, it's in the small print, which makes me the most honest gunsmith in Tanaris." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I blew up my first workshop in Ratchet and my second in Booty Bay, so Gadgetzan's got lots of open space, which I appreciate, and cheaper rent, which I appreciate more." } },
    advice = { { id = "tp_ad", text = "Clean the barrel after the sandstorm, pal, not before the next one." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's Bruisers won't let me fire a gun in town, pal, so I fire them into a dune outside. That dune's going to be famous one day." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak don't use guns, pal, which is a shame, because I'd sell them a lot of them. They throw axes, and that's a much worse business model." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay lets you fire a gun indoors, pal, so I left after the second fire. Gadgetzan's got rules, but at least the buildings are made of stone." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's where I blew up my first workshop, pal, and Gazlowe still sends me the bill every year. I've told him I'll pay when I'm rich." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, but if it needs shooting, I know a goblin, and he's got a sale on." } },
  },
}

P:NPC {
  key = "trenton", id = TODO_NPC("Trenton Lighthammer"), name = "Trenton Lighthammer",
  bible = "bibles/tanaris.md", role = "blacksmith", tier = "quest",
  communities = { "gadgetzan" }, temper = { "patient" }, values = { "craft", "dedication" },
  notices = { "class", "race" },

  impression = {
    first = "Trenton Lighthammer works a forge by Gadgetzan's south gate and speaks of metal the way a priest speaks of prayer. He wants something from Zul'Farrak's trolls, and he is patient about it.",
    third = "{name} met Trenton Lighthammer, the night elf smith by Gadgetzan's south gate.",
  },

  greetings = {
    { id = "g_default", text = "Mind the sparks, friend. The desert dries everything, even fire, and I've lost two aprons and an eyebrow this month." },
    { id = "g_temper", when = { questActive = TODO_QUEST("Troll Temper") }, text = "Have the Sandfury given up their temper yet, or are they still guarding it with their lives?" },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah. You're wondering what one of the kaldorei is doing at a goblin's anvil, and the answer is that steel doesn't care who strikes it." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Your blade's been well used and badly kept, and it'll fail you at the wrong moment. Bring it to an anvil before you go anywhere near the trolls." },
  },

  start = "hello",
  nodes = {
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "It helps the road, and the caravans will thank you before I do. But a city like that keeps its craft in a handful of old hands, and when the walls break those hands either flee or die, so the very thing I came here to learn might be gone for good." } },
      choices = {
        { text = "Find their surviving smiths and offer them a fair trade.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Take what's left in the ruins before the goblins do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Would a Sandfury smith ever teach an outsider?", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "Not in my lifetime, and mine is long. A troll smith would sooner bury his flask with him than hand it to a kaldorei, and I'll admit an old elf smith would do the same to a troll." } },
      choices = {
        { text = "Then you're more alike than either of you would admit.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It answers patience and nothing else. The Sandfury temper their steel with something darker than fire, and I'd value a shaman's opinion on what that is." } },
      choices = {
        { text = "Leave the trolls' dark methods to the trolls, Trenton.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If their methods work, learn them, Trenton.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Their smiths knew a way of tempering steel in the desert heat that I have never managed, and their old blades still carry it. I would learn it from the trolls themselves if they would teach me, but a warrior who brings me one of their weapons teaches me nearly as much." } },
      choices = {
        { text = "Learning from an enemy is wisdom, not weakness.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nothing the Sandfury make is worth learning. Melt it down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It is cut for forest air, still and damp, where an arrow flies true without asking much of its feathers. Here the wind comes off the dunes in gusts, and a basilisk's eye is a small target to miss by a hand's width." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It is cut for still forest air, and here the wind comes off the dunes in gusts. {pet} has learned the desert faster than your arrows have, I see, for it walks with its weight low and its nose to the wind." },
      },
      choices = {
        { text = "I'll learn the land before I hunt it. That's only respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sharp head matters more than feathers. Mine will do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "One who mends more than they break, I suppose, and who does not ask the dead of Zul'Farrak for favors. My craft is a patient one, and I have learned to judge a forge by its fire and a priest by the hands they lay on others." } },
      choices = {
        { text = "I mend, Trenton. Watch my hands and judge me by them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I take what power the dead offer. Judge me as you like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Their temper is brewed, not forged, and I can't tell you what's in it, only that steel quenched in it rings truer than any I've made. The Sandfury have worked metal in that desert far longer than Gadgetzan has had a well, and I suspect their loa have a hand in the recipe." } },
      choices = {
        { text = "Steel blessed by those loa should be melted down.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it rings true, use it. The loa needn't know.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, and I've met mages with more sense than many of my own people, which I'll say only once. Still, the Highborne said the same about themselves until the Well swallowed them, and I'd be a poor smith if I forgot how a fire gets out of hand." } },
      choices = {
        { text = "Magic can be used wisely. I'm proof of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Highborne weren't wrong, only unlucky.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Steel is steel, and I've said so to every customer who's asked. But the Legion broke my people once, and I'll not pretend I've forgiven those who call its servants by name, so take your gear and be on your way when it's done." } },
      choices = {
        { text = "I bind demons. I don't serve them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Legion's power is mine to use.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, smith.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something their smiths know and I don't, and I'll say no more than that. I've waited by this gate a long while for the right sort of adventurer to bring it back, and for all I know, you're that sort." } },
      choices = {
        { text = "Craft shouldn't be locked away. I'll help you get it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Their craft is theirs. Learn your own way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the Sandfury trolls have a way of tempering steel that no smith in Ironforge or Gadgetzan can match, and they keep it in stoppered flasks. I've spent years trying to work out what's in it, and the only way to learn is to get it in my hands." } },
      choices = {
        { text = "I'll take it fairly, and only from those who attack us.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take it from whoever has it. Trolls won't miss it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That it was forged well and swung often, and that someone's been patching it in the field with the wrong metal. If you bring me a little troll temper from Zul'Farrak, I'll show you what a properly tempered head can take." } },
      choices = {
        { text = "I'll keep using it until it breaks. That's its purpose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll take better care of it from now on.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, because a smith who doesn't is a fool. I sell to those who fight the Sandfury and the Wastewanders, mostly, and I like to think I'm making the road safer, though I know some of my steel ends up in the wrong hands." } },
      choices = {
        { text = "Choose your buyers carefully, and the Light will judge you fairly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Steel is steel. Don't lose sleep over it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak" }, text = "You've been to the bottom of Zul'Farrak, I hear, and Ukorz Sandscalp won't be guarding anything again. If the Sandfury smiths scatter now, their temper may scatter with them, and I'm not sure whether to thank you or mourn it." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde at a kaldorei's anvil. Our peoples have little love between them, but the fire in this forge answers to neither, so you may stand and watch if you like." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I have known Forsaken whose prayers set my teeth on edge, and trolls whose loa want blood, so I'll wait to hear which kind you are." },
        { id = "h_default", key = true,
          text = "Trenton Lighthammer, smith. I work here by the south gate because it's nearest the road to Zul'Farrak, and the trolls of that city have something I need for my craft." },
        { id = "h_before", when = { minLevel = 42, questBefore = TODO_QUEST("Troll Temper") },
          text = "You have the look of someone who could walk into Zul'Farrak and walk out again. The Sandfury carry a temper in vials, a troll-made thing for treating steel, and I'd pay well for it." },
        { id = "h_during", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Temper") },
          text = "Twenty vials of their temper is what I need, and the Sandfury carry it on their persons, not in some storeroom. You'll have to take it from them, one troll at a time." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Troll Temper"), days = 3 } },
          text = "The temper's already in the quench, and the steel took it better than I hoped. Whatever the Sandfury are, they know metal, and it galls me to say it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage at my anvil. My people know what arcane hunger can do to a land, friend, because the sea covers what it did to ours, so I'll be watching your hands." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "There's fel on you, and I don't need my eyes to see it. I'll mend your gear, because steel doesn't care who carries it, but I'll do it with my back to the wall." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. I can tell by the way you carry your weight, and by the nicks on that blade, that you've been fighting the Sandfury and not losing." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Your arrows are poorly fletched for this wind, and I would say so to any archer of Darnassus as plainly as I say it to you." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll know the trolls of Zul'Farrak keep their own beasts and their own gods, and neither is friendly to your kind or mine." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. If you're headed to Zul'Farrak, you'll get in and out quieter than anyone, and that's exactly the sort I need to bring me troll temper." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your hammer's seen good use, I can tell, and I'd be glad to look at the head, though I won't touch it without asking." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You're welcome at my forge, though I'll warn you the noise is not good for prayer, and the heat isn't either." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Sandfury", min = 40 } }, text = "You've been in among the Sandfury, I can tell, because there's been talk at the gate that their patrols are short of fighters. If any of them were carrying temper, I'd like to know." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman at a kaldorei's anvil. Your people learned the forge from the stone and I learned it from the moon, so watch and tell me which of us the fire prefers." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while the iron heats, and my people have never thought conversation a thing to rush." },
        { id = "h_again2", text = "Ask on. The forge is patient, and so am I." },
      },
      choices = {
        { text = "What do you need from Zul'Farrak, Trenton?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The Sandfury temper their steel with more than fire. What do they use?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What do the trolls have that you need?", next = "temper" },
        { text = "Zul'Farrak sounds like a place to stay clear of.", next = "zf" },
        { text = "A night elf working steel?", next = "kaldorei" },
        { text = "Tell me what a smith wants with trolls.", next = "smith_talk", when = { profession = "Blacksmithing" } },
        { text = "Not every mage follows the Highborne's road.", next = "xmage", when = { class = "MAGE" } },
        { text = "You'll still work for a warlock?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Which kind of priest would you trust, Trenton?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why do you need troll temper so badly, Trenton?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What can you tell from my hammer, Trenton?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever think about what your weapons are used for, Trenton?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll bring you their temper.", next = "END", when = { questBefore = TODO_QUEST("Troll Temper") }, fx = { affinity = 2 } },
        { text = "The Zul'Farrak trolls must have something a smith wants.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What's wrong with my fletching for the desert wind, Trenton?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does the forge's fire answer you, Trenton?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Sandscalp is dead, Trenton. Does that help your work or hurt it?", next = "xcl_zf", when = { cleared = "Zul'Farrak" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    temper = {
      lines = { { id = "t_default", text = "Troll temper, a quenching draught, made in vials and carried by their warriors. Steel quenched in it holds an edge longer than anything I can mix here, and I've tried every recipe a goblin will sell me." } },
      choices = {
        { text = "So the trolls are better smiths than you.", next = "temper_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temper_better = {
      lines = {
        { id = "tb_default", text = "At this, yes, and a smith who can't admit that has stopped learning. I'd sooner learn from an enemy than go on making blades that fail the people who carry them." },
        { id = "tb_troll", when = { race = "Troll" }, text = "You'd know better than I would, perhaps. The Darkspear and the Sandfury aren't kin in any way that matters now, I'm told, but some old knowledge runs through every tribe, and this is some of it." },
      },
      choices = {
        { text = "Wisdom is wisdom, whoever holds it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Take it from them. They'd take it from you.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zf = {
      lines = { { id = "z_default", text = "A walled city of the Sandfury trolls to the west, old and sunbaked and full of them. Gadgetzan trades with anyone who has coin, but nobody trades with Zul'Farrak, and the Bruisers watch that road closely." } },
      choices = {
        { text = "What do the Sandfury want?", next = "zf_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zf_want = {
      lines = { { id = "zw_default", text = "The desert back, I'd guess, and every outsider out of it, goblin and elf alike. Tran'rek knows more about what's inside the walls than I do, though getting him to say so is its own expedition." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    kaldorei = {
      lines = {
        { id = "k_default", text = "My people work wood and moonlight, mostly, and most of them think a forge is a dwarf's toy. I thought so too until I watched good steel save a sentinel's life, and then I stopped thinking it." },
        { id = "k_nelf", when = { race = "NightElf" }, text = "You'll have heard the elders on the subject, I expect, and I've heard them too, many times. The forest doesn't need my blades, but the people walking out of it into places like this do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smith_talk = {
      lines = { { id = "st_default", text = "A smith wants whatever makes the edge hold, and pride is the first thing that has to go. Krinkle by the forge on the south side sells good supplies, and he'll sell to anyone who doesn't ask awkward questions." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I left Kalimdor's forests for its forges, and the forges led me here, to sand and goblins and patience." } },
    advice = { { id = "tp_ad", text = "Keep your edge oiled in the desert. The sand eats a dry blade faster than the centuries eat anything but a kaldorei's memory." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak work metals the old way, with blood and fire and things I don't care to name. I'd like to learn their methods, and I'm patient enough to wait for the chance." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got good forges and better customers, and the goblins pay well for good work. The sand gets into everything, but steel doesn't mind." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons forge with fire from below, and their work is the finest and cruelest I've seen. I'd study it if I could do it without selling my soul." } },
    silithid = { { id = "tp_silithid", text = "The silithid carapaces are harder than most iron, and I've tried to work one. It took a week, and I'm still not sure I did it right." } },
    _none = { { id = "tp_none", text = "I can't say, though if it's made of metal I'll look at it." } },
  },
}

-- Steamwheedle Port.
P:NPC {
  key = "yehkinya", id = TODO_NPC("Yeh'kinya"), name = "Yeh'kinya",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "sly" }, values = { "secretive", "patient" },
  notices = { "race", "class" },

  impression = {
    first = "Yeh'kinya is an old troll at Steamwheedle Port who says drink has dulled his eyes but not his inner sight. He talks about a dead god very calmly for someone who claims not to believe in him.",
    third = "{name} met Yeh'kinya, an old jungle troll at Steamwheedle Port who studies the god Hakkar.",
  },

  greetings = {
    { id = "g_default", text = "Ah, mon, sit with old Yeh'kinya a while. The sea is loud, but the spirits are louder." },
    { id = "g_bramble", when = { questActive = TODO_QUEST("Screecher Spirits") }, text = "You still carry my bramble, mon, so wave it over a dead screecher and see what rises." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "One of the Darkspear, so far from the Echo Isles! Then you've heard the old tales of the Soulflayer, even if your elders hush the young ones when they tell them." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "SHAMAN" } },
      text = "You speak to powers too, mon, so you'll understand an old troll who listens to the dead. We're not so different, you and me." },
  },

  start = "hello",
  nodes = {
    xpt_yehkinya = {
      big = true,
      lines = { { id = "xpt_yehkinya_default", text = "The ones about the Soulflayer, and how the Atal'ai tried to call him back with blood until the green dragons drowned their temple. A young troll should know those stories, so they know which gods to leave sleeping." } },
      choices = {
        { text = "Some gods should be forgotten. They brought only ruin.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old gods are still gods. Troll tradition should be kept.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_st = {
      big = true,
      lines = { { id = "xcl_st_default", text = "Then the Atal'ai have fewer voices to sing with, and a god with no singers is a god who sleeps. But listen to Yeh'kinya, mon, because the Gurubashi built more than one altar to the Soulflayer, and the ones in Stranglethorn are older and bigger than that drowned temple." } },
      choices = {
        { text = "Then we finish it. Every altar to Hakkar should fall.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power like that shouldn't be wasted. Someone should study it first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why do green dragons guard that temple?", next = "xcl_st2" },
      },
    },
    xcl_st2 = {
      lines = { { id = "xcl_st2_default", text = "The temple sank because the dragons' mistress drowned it, mon, to punish the Atal'ai for their blood rites. She left her green ones to watch it, but a long watch over a bad place rots the watcher, and some of those dragons dream darker than the trolls they guard." } },
      choices = {
        { text = "Some watchers need watching. I'll remember that.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mourn them? No, mon, the Sandfury chose their gods and their gods are not kind, and Zul'Farrak breeds them hard. But a troll is a troll, and Yeh'kinya remembers when his people were more than bandits in the sand." } },
      choices = {
        { text = "Even an enemy deserves a clean and honest end.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Sandfury chose their side. I won't spare them a thought.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The hunter and the beast were one spirit with two bodies, mon, and the loa watched over them both. Now the young ones forget, but the beast never does, so Yeh'kinya listens to the beasts more than the trolls these days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The hunter and the beast were one spirit with two bodies, mon, and the loa watched over them both. {pet}, now, has a spirit Yeh'kinya can almost hear, and it says you feed it well and talk to it too much." },
      },
      choices = {
        { text = "My beast and I share one spirit. That bond is sacred.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a good companion, not a spirit. Keep your loa.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Soulflayer, mon, Hakkar, who the Gurubashi fed with blood and who some of the Sandfury still whisper to in Zul'Farrak. A priest who listens to the wrong voice out here can find himself serving a god who was meant to stay dead." } },
      choices = {
        { text = "Then I'll pray to the loa who guard us, not those who feed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dead god's voice might still teach me something worth hearing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They say the sand remembers the Sandfury, mon, and all the blood they spilled in Zul'Farrak. The old gods leave a stain on the land, and even the desert wind can't scour it clean." } },
      choices = {
        { text = "Then the stain must be cleansed, whatever it takes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Old gods have power. Perhaps it's worth studying.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Soulflayer was cast down long ago, but his priests still sing to him in the Sunken Temple, and gods that are sung to have a way of listening. A warlock who deals in souls should know better than most what Hakkar would do with yours." } },
      choices = {
        { text = "Hakkar's priests should be destroyed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. Even a dead god's.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Speak of something else, old one.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Book magic, spirit magic, it's all just different ways of asking the world to change, mon. The Atal'ai asked with blood and the Highborne asked with books, and both of them got more than they wanted, so I'd ask gently, if I were you." } },
      choices = {
        { text = "Every power has its price. Pay it carefully.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask as loudly as I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Enough riddles, old man. Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Maybe one day, mon, from a temple where the Atal'ai sing to a dead god. Not yet, though, because Yeh'kinya needs to be sure first, and being sure takes more time than a rogue usually likes to wait." } },
      choices = {
        { text = "I'll steal anything from Hakkar's priests.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather fight them in the open.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because a danger you don't understand is a danger you can't fight, mon. The Atal'ai still worship the Soulflayer down in the Sunken Temple, and somebody has to know his ways, even if knowin' them keeps that somebody up at night." } },
      choices = {
        { text = "Know your enemy. Your work is worth the risk.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some knowledge corrupts. Leave Hakkar alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No, mon, but the ones that are terrible are very terrible, and Hakkar is the worst. The loa give and take as they please, and a troll learns young to bargain with them carefully, because they always want somethin' back." } },
      choices = {
        { text = "The Light asks nothing back. Perhaps you'd find peace there.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every power wants something. At least the loa are honest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_yehkinya", tags = { "news" }, when = { party = { race = "Troll" } },
          text = "Yeh'kinya sees you walk with a troll, mon, and {companion} has the look of someone who still knows the old stories." },
        { id = "h_cl_st", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar" }, text = "You have been down in the Sunken Temple, mon, all the way to the bottom where the Atal'ai sing, and you came back up. The spirits told Yeh'kinya before you did, and for once they sounded frightened." },
        { id = "h_default", key = true,
          text = "Yeh'kinya, they call me, and I sit here by the water and study the old gods of my people. My eyes are tired and my hands shake from the drink, but the spirits still talk to me, mon." },
        { id = "h_screech_before", when = { minLevel = 42, questBefore = TODO_QUEST("Screecher Spirits") },
          text = "The screechers of Feralas are cousins to an old god of the trolls, and their spirits remember him. Bring me a few of those spirits, and I'll tell you a story most outsiders never hear." },
        { id = "h_screech_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Screecher Spirits"), days = 3 } },
          text = "The screecher spirits are restless in their jar, mon, and that's a good sign. Now Yeh'kinya can tell you of Hakkar, the Soulflayer." },
        { id = "h_moshaaru", tags = { "news" }, when = { questActive = TODO_QUEST("The Prophecy of Mosh'aru") },
          text = "The tablets of Mosh'aru are in Zul'Farrak, mon, and the Sandfury don't share their history with strangers. Bring them both to me." },
        { id = "h_egg", tags = { "news" }, when = { questActive = TODO_QUEST("The Ancient Egg") },
          text = "The egg, mon, the ancient egg! The tablets told us where to look, so be gentle when you find it, because old things break easily." },
        { id = "h_godhakkar", tags = { "news" }, when = { questActive = TODO_QUEST("The God Hakkar") },
          text = "Take the egg into the sunken temple of Atal'Hakkar, and let it drink what it was made to drink. Then bring it back to Yeh'kinya, mon, and we'll keep that power safe together." },
        { id = "h_bloodgod_resolved", tags = { "news" }, when = { thread = { id = "blood_god", state = "resolved" } },
          text = "The Soulflayer is fallen in Zul'Gurub, mon, and the Zandalar are singing about it all down the coast. Yeh'kinya will drink to that, though he notices nobody thought to ask what the Soulflayer knew before they cut him down." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, mon. The spirits around you are green and noisy, and Yeh'kinya can hear them even through the drink." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ah, you got the Shadow on you, mon, and they whisper back at Yeh'kinya. Be careful, because the Atal'ai thought they could whisper to their god too, and look what it made of them." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! The spirits say you smell of books, mon, and they don't care much for books, but Yeh'kinya doesn't mind them." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Quiet feet and quick hands, eh, mon? Yeh'kinya's eyes are tired, but he can still see a rogue coming, and a rogue going too." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon, with the Horde's mark on you. Old Yeh'kinya sees a little of the loa in you, or maybe a little of the shadow, and he don't mind either one." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, mon. Yeh'kinya sees how your shoulders sit from swingin' an axe at all the trolls it's cut down out there in the sand." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, mon! Yeh'kinya's people hunted the jungle long before there was any sand here, and your beast walks like it knows the old ways." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Light, come to sit by an old troll? Sit, then, mon, but don't be preachin' at me, because I've heard all of it before." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light. My people have their own gods, mon, and some of them are terrible, so I'm glad of anybody who prays to somethin' kinder." },
      },
      again = {
        { id = "h_again", text = "More questions? The spirits don't mind, and neither does Yeh'kinya." },
        { id = "h_again2", text = "Sit, sit. The tide's slow, and so am I." },
      },
      choices = {
        { text = "What do the spirits of Tanaris say, Yeh'kinya?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Which of the troll gods do you study?", next = "hakkar" },
        { text = "Why study the old gods at all?", next = "why" },
        { text = "Why live among goblins at a port?", next = "port" },
        { text = "My elders never spoke of such gods.", next = "darkspear", when = { race = "Troll" } },
        { text = "Is the Atal'ai god still a danger?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you put stock in book magic, Yeh'kinya?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is there something you need taken, old one?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Which loa should a priest fear in Tanaris, Yeh'kinya?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you mourn the Sandfury trolls I've fought, Yeh'kinya?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What were the old ways of the troll hunters, Yeh'kinya?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why study gods so dangerous, Yeh'kinya?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are all your people's gods terrible, Yeh'kinya?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I've been to the bottom of the Sunken Temple, Yeh'kinya.", next = "xcl_st", when = { cleared = "The Temple of Atal'Hakkar" } },
        { text = "What stories should a troll know, Yeh'kinya?", next = "xpt_yehkinya", when = { party = { race = "Troll" } } },
        { text = "Goodbye.", next = "END" },
      },
    },
    hakkar = {
      lines = {
        { id = "hk_default", text = "Hakkar the Soulflayer, a blood god the old Gurubashi served long ago, until the tribes turned on his priests and his temple sank into a swamp far across the sea. There's a prophecy among my people that he'll come back one day." },
        { id = "hk_done", when = { questDone = TODO_QUEST("Screecher Spirits") }, text = "You've heard the start of it already, mon. Some trolls say his return means glory for our people, and others say it means the end of everything, and Yeh'kinya listens to both." },
      },
      choices = {
        { text = "I'd like to know what you believe.", next = "hakkar_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hakkar_believe = {
      lines = { { id = "hb_default", text = "Me? I believe it's a myth, mon, a story for frightening children. But even a myth has power in it, and power like that should be kept from hands that would misuse it." } },
      choices = {
        { text = "Some power should be destroyed, not kept.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Power's only dangerous in the wrong hands.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else will, mon, not the Darkspear and not the goblins. If a god is going to stir, better someone old and careful is watching for it than nobody at all." } },
      choices = {
        { text = "Careful? You seem very eager.", next = "why_eager" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_eager = {
      lines = { { id = "we_default", text = "Eager, careful, they look the same on an old face, mon. You go on asking questions like that, and you'll live a long time in this world." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    port = {
      lines = { { id = "p_default", text = "Ships come here from every coast, and every ship carries rumours. A troll who listens at the docks hears more than one who sits in a jungle, and the goblins only care that I pay for my drink." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darkspear = {
      lines = { { id = "d_default", text = "No, they wouldn't, mon, and Sen'jin was wise to keep the young ones from it. But the Darkspear came out of the same old empire as the Gurubashi, and old blood remembers what the elders forget." } },
      choices = {
        { text = "Then let it stay forgotten.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "I'd rather know my people's history.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "An old troll from the old jungles, mon, with too much drink in him and too many stories." } },
    advice = { { id = "tp_ad", text = "Never wake something just to see if it's sleeping, mon." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The Sandfury in Zul'Farrak be cruel, mon, and their priests be crueler, and they keep a hydra in their pool like a pet. Yeh'kinya was young once in a place like that, and he got out." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Hakkar be the Soulflayer, mon, the blood god, and the Gurubashi be calling him back at Zul'Gurub. Yeh'kinya don't believe in him, but Yeh'kinya don't want to meet him either." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai in the Sunken Temple be trying to call Hakkar too, mon, in the swamp across the sea. Yeh'kinya know a thing or two about stopping them, if you be willing." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be good trolls, mon, better than the Sandfury or the Gurubashi. They remember what loyalty be, and that be rare in our people." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be a good chief, mon, and wise, and he keep his people out of the old madness. Yeh'kinya respect that." } },
    _none = { { id = "tp_none", text = "The spirits don't say, mon, and Yeh'kinya doesn't guess." } },
  },
}
