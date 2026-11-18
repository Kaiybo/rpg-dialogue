-- Lakeshire's law, its road, its kitchen, and a bunch of daffodils. Voice: bibles/lakeshire_folk.md
-- Bailiff Conacher, Deputy Feldon, Guard Parker on the Duskwood road, Darcy at the inn,
-- Martie Jainrose in her garden, Chef Breanna feeding the garrison.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "conacher", id = TODO_NPC("Bailiff Conacher"), name = "Bailiff Conacher",
  bible = "bibles/lakeshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "formal" }, values = { "lawful", "dutiful" },
  notices = { "soldier", "stealth" },

  impression = {
    first = "Bailiff Conacher carries out the Magistrate's rulings and says the work is less glamorous than it sounds. He addressed me as citizen, and somehow it felt like a summons.",
    third = "{name} was received by Bailiff Conacher of the Court of Lakeshire, who sees the Magistrate's rulings carried out.",
  },

  greetings = {
    { id = "g_op_dragons", when = { gossip = { topic = "black_dragonflight", stance = "fight" } }, text = "The Magistrate's been in a fine temper since you told him the black dragons were real. He's writing his forty-somethingth letter, and he's humming." },
    { id = "g_court", text = "The Court of Lakeshire is in session whenever the Magistrate is at his desk, which is always, so state your matter." },
    { id = "g_back", when = { metBefore = true }, text = "Citizen, the court recognises you. You may approach." },
    { id = "g_away", when = { away = 14 }, text = "Citizen, the court notes your return after {away} away. You may state your matter." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "It has been reported that you were found out in a falsehood here in Lakeshire, citizen. The court has a long memory, and so do I." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "Complaints have reached me that you've been threatening the good folk of this town, citizen. I'd advise you not to give me cause to write them down." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "PALADIN", "WARRIOR" } },
      text = "You carry yourself like someone who's been sworn to something, and that's good. The law appreciates people who keep their oaths." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "I'll note for the record that you came in quietly. The record notes everything, so remember that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Magistrate distrusts anything that isn't on paper, citizen, so as a newcomer you'll be written down, and that's all." } },
      choices = {
        { text = "Write it down, then. I've nothing to hide, Bailiff.", next = "BACK", reply = "It is written, citizen, and filed under arrivals. The Magistrate will be pleased to have one more name that causes no trouble.", fx = { align = { order = 1 } } },
        { text = "Paper won't stop orcs. Spend your time on the walls.", next = "BACK", reply = "The walls are the Marshal's concern, citizen, and the paper is mine. Without the paper, nobody would know who held the walls.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The court pays nothing, citizen, because the court has nothing; the Lakeshire guard pays, out of the Magistrate's purse, for proof of the deed. Bring it to Marshal Marris, and he'll see the books are kept straight." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The court pays nothing, citizen; the Lakeshire guard pays, out of the Magistrate's purse, so bring proof to Marshal Marris. Your {pet} is not, strictly speaking, a citizen, {class}, but the court will overlook it, so long as it doesn't eat one." },
      },
      choices = {
        { text = "I'll bring proof to the Marshal, as the law asks.", next = "BACK", reply = "Very good, citizen, and the Marshal will see it entered properly. The court appreciates a hunter who respects procedure.", fx = { align = { order = 1 } } },
        { text = "I'll hunt for my own reasons. The law can keep its books.", next = "BACK", reply = "Your reasons are your own, citizen, but the books will still want a tally. I'll note you as a private party.", fx = { align = { order = -1 } } },
        { text = "Something else, Bailiff.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "It covers setting fire to things, citizen, whether you use a torch or a spell. The Magistrate's last ruling on the matter was very clear, and I wrote it down myself." } },
      choices = {
        { text = "Laws should bind mages like anyone else.", next = "BACK", reply = "Precisely, citizen, and I'm pleased to hear a mage say it. I'll add your name to the list of the cooperative.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic answers to the Kirin Tor, not a bailiff.", next = "BACK", reply = "The Kirin Tor are very far from Lakeshire, citizen, and I am not. I'd keep that in mind before lighting anything.", fx = { align = { order = -1 } } },
        { text = "What's on the docket now?", next = "docket" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "He does, citizen, and it says that what you summon, you answer for, as though you'd done the deed with your own hands. I'd keep that in mind if anything with horns wanders into town." } },
      choices = {
        { text = "Fair ruling. I'll answer for it.", next = "BACK", reply = "A sensible answer, citizen, and the court will remember it. I hope the occasion never arises.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Prove it was mine first, Bailiff.", next = "BACK", reply = "I'd prefer not to have to, citizen, and I suspect you'd prefer it too. Keep it out of town, and we'll both be spared the paperwork.", fx = { align = { honor = -1 } } },
        { text = "What does justice mean here?", next = "justice" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Under Lakeshire law they are entitled to one, citizen, and under Lakeshire circumstances they rarely get one, since the nearest is a long ride away. The Magistrate would welcome a volunteer, though I should warn you the gnolls seldom wish to hear it." } },
      choices = {
        { text = "Even the condemned deserve the words. I'll volunteer.", next = "BACK", reply = "The Magistrate will be grateful, citizen, and so will the condemned, whether they show it or not. I'll note it in the record.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Traitors to the kingdom have forfeited any prayer.", next = "BACK", reply = "That is a view the law permits, citizen, though it does not require it. I'll leave the volunteering to others, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Bailiff.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It says plenty, citizen, about licences and seasons and the Magistrate's share, though none of it has been enforced since the gnolls arrived. If you mean to take game in Redridge, I'd ask you to keep a tally, so the Magistrate can pretend the law still holds." } },
      choices = {
        { text = "I'll keep the tally. Law matters most when it's hard.", next = "BACK", reply = "Exactly so, citizen, and you've made a bailiff very happy. The tally sheet is on my desk.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hunting laws mean nothing while gnolls roam the hills.", next = "BACK", reply = "They mean less than they did, I grant you, but they still mean something on paper. I'll hope you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bailiff Conacher, of the Court of Lakeshire. The Magistrate rules; I see the rulings carried out. It's less glamorous than it sounds, and it doesn't sound glamorous." },
        { id = "h_law", tags = { "news" }, when = { questActive = TODO_QUEST("Solomon's Law") },
          text = "Morganth commands the Shadowhide gnolls from the eastern hills, and aiding an enemy of the kingdom is a hanging matter under Lakeshire law. Bring me their pendants." },
        { id = "h_law_done", when = { questDone = TODO_QUEST("Solomon's Law") },
          text = "Every pendant is entered into evidence, and the clerk has asked me, politely, to stop bringing him gnoll jewellery." },
        { id = "h_solomon", when = { heardLine = "solomon.s_default" },
          text = "The Magistrate told you about his letters? I carry them to the courier myself. They are very thorough letters, and they come back very thin." },
        { id = "h_morning", when = { metBefore = true }, text = "It's been a long morning and my temper's short, so talk fast." },
        { id = "h_cityguard", when = { origin = "human_city_guard" },
          text = "You stand like a city guardsman, citizen, while my deputies still stand like farmhands at a dance. The court could use someone who knows how a warrant is served." },
        { id = "h_lakeborn", when = { origin = "human_redridge_born" },
          text = "Citizen, the court's register says you were born in Lakeshire, and the court is glad to see a local name come home. The register also records what the orcs did to the names beside yours, so it's a gladness with some weight to it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, citizen. You'll be glad to know that hunting in Redridge is entirely lawful, provided the quarry isn't the Magistrate's cattle." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, citizen. The court has no objection to prayer, provided it is conducted in an orderly fashion and does not block the steps." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "Citizen, and a druid of the kaldorei, I see. The Magistrate will want your name for the register, since it has never yet listed a night elf." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Citizen. A shaman, I see. The Magistrate will want your name written down. That's not a threat, just procedure." },
      },
      again = {
        { id = "h_again", text = "The court will hear further business." },
        { id = "h_again2", text = "Proceed, and briefly, if the court may ask." },
      },
      choices = {
        { text = "What does a bailiff do?", next = "duty" },
        { text = "How is the town holding?", next = "town" },
        { text = "Tell me about Magistrate Solomon.", next = "solomon" },
        { text = "Theocritus says Morganth stole a book from Stormwind's mages.", next = "theft", when = { heardLine = "theocritus.mo_default" } },
        { text = "I'm sworn to the Light, Bailiff.", next = "oath", when = { class = "PALADIN" } },
        { text = "Was justice done, Bailiff?", next = "justice", when = { questDone = TODO_QUEST("Solomon's Law") } },
        { text = "I've kept the peace with a sword before, Bailiff.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Does the law in Lakeshire cover spellcraft?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the court pay a bounty on gnolls, Bailiff?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I suppose the Magistrate has a ruling on warlocks too.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the condemned get a priest before the sentence is carried out?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Lakeshire law say anything about hunting in the hills?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the Magistrate distrust shamans, Bailiff?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Bailiff.", next = "END" },
      },
    },
    duty = {
      lines = {
        { id = "d_default", text = "Serve writs, keep order in the hall, swear in witnesses. These days it's mostly writing death warrants for orcs who'll never read them." },
      },
      choices = {
        { text = "Someone has to keep the law.", next = "BACK", reply = "Precisely, citizen, and I'm glad someone outside the court understands it. It is mostly ink and patience.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Death warrants for orcs who'll never read them are a waste of ink.", next = "BACK", reply = "It is, citizen, but the law requires it, and I'll write them until the ink runs out. Procedure is all we have.", fx = { align = { order = -1 } } },
        { text = "Sounds like a lot of paper.", next = "paper" },
        { text = "Your docket must be a full one these days.", next = "docket" },
      },
    },
    paper = {
      lines = { { id = "p_default", text = "Paper is how a town remembers it was a town. Without it we're a camp by a lake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    docket = {
      lines = { { id = "dk_default", text = "Gath'Ilzogg the warlord, Fangore the gnoll and Morganth the sorcerer. Not one has answered a summons, and the court has stopped sending them." } },
      choices = {
        { text = "What's the charge against Morganth?", next = "law" },
        { text = "Something else.", next = "BACK" },
      },
    },
    law = {
      big = true,
      lines = {
        { id = "lw_default", text = "Under the Law of Lakeshire, aiding an enemy of the kingdom carries death. Morganth is the enemy; the Shadowhides are the aid. The court finds the arithmetic simple.",
          fx = { learn = { "morganth", "redridge_gnolls" } } },
      },
      choices = {
        { text = "Then I'll carry out the sentence.", next = "BUSINESS", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Gnolls who only follow orders don't deserve death.", next = "BACK", reply = "The court does not distinguish, citizen, and I'm not empowered to. Take it up with the Magistrate if you feel strongly.", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
    town = {
      lines = { { id = "t_default", text = "It's holding, citizen. The court has ruled that it will continue to hold, though the orcs have not yet been informed." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    solomon = {
      lines = { { id = "so_default", text = "The Honourable Magistrate works longer than anyone in this hall, which the court considers improper. He writes every letter himself; I only carry them." } },
      choices = {
        { text = "Does anyone answer?", next = "answers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    answers = {
      lines = { { id = "an_default", text = "They answer politely, and only politely. The court keeps a drawer for polite replies, and it is a large drawer." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    theft = {
      lines = { { id = "th_default", text = "Then the court adds theft to the warrant, a small charge beside the others, but the court likes a complete record." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    oath = {
      lines = { { id = "oa_default", text = "Then you'll appreciate that the law is an oath too, only with more paperwork. Keep yours; I'll keep mine." } },
      choices = {
        { text = "Agreed.", next = "BACK", reply = "Then we understand each other, citizen. It's a rare pleasure.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I keep my oaths, but I've no patience for your paperwork.", next = "BACK", reply = "Then keep your oaths, citizen, and I'll do the paperwork for both of us. It's what I'm for.", fx = { align = { order = -1 } } },
      },
    },
    justice = {
      lines = { { id = "ju_default", text = "Justice was carried out on the Shadowhides, by the record. Whether it was done is for the Light to say, not a bailiff." } },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Keeping the peace with a sword is how it's mostly done here, citizen, though the court prefers a warrant first and the sword after. Out in the hills, I'm told, they come in the other order." } },
      choices = {
        { text = "Law means nothing to a gnoll. Swing first.", next = "BACK", reply = "Out in the hills, citizen, that's often the only order that works. I'll write the warrant afterward.", fx = { align = { order = -1 } } },
        { text = "Warrant first. That's what makes us different.", next = "BACK", reply = "Precisely, citizen, and I'm glad to hear a warrior say it. The court thanks you.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade holds the worst of Stormwind, and when the Magistrate sentences a man to it, I'm the one who walks him to the cart. Now they tell me the prisoners hold the place, which makes my job look rather pointless." } },
    syndicate = { { id = "tp_syndicate", text = "We've had letters from the north about a gang of disgraced Alterac nobles called the Syndicate, and the Magistrate wants their faces posted. So far nobody here has seen one, and I'd like to keep it that way." } },
    bolvar = { { id = "tp_bolvar", text = "The Magistrate writes to Highlord Fordragon every week, citizen, and I carry the letters to the gryphon master. I'd like to believe someone in the Keep reads them, and I'd like it in writing." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor sends very gracious replies to the Magistrate's letters, I'm told, and not one soldier with them. Gracious doesn't hold a bridge, though I'd not say that in her hearing." } },
    second_war = { { id = "tp_second_war", text = "Lakeshire burned in the Second War and was built again from the ground up, and the Magistrate's books go back only that far. Everything before the orcs came is just a story the old folk tell." } },
    background = { { id = "tp_bg", text = "Bailiff to the Court of Lakeshire. I serve writs, swear in witnesses, and stand where the Magistrate points." } },
    advice = { { id = "tp_ad", text = "Answer a court plainly; it saves everyone a morning." } },
    morganth = { { id = "tp_morganth", text = "A sorcerer in the eastern foothills, with the Shadowhides at his heel. Formally he's an enemy of the kingdom, and informally he's worse." } },
    blackrock = { { id = "tp_blackrock", text = "Every warrant on my desk has a Blackrock name on it. Not one has been served." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Redridge gnolls and Shadowhide gnolls: the law makes a distinction, even if the gnolls don't." } },
    _none = { { id = "tp_none", text = "Not a matter before the court. Take it up with the Magistrate if you must." } },
  },
}

P:NPC {
  key = "feldon", id = TODO_NPC("Deputy Feldon"), name = "Deputy Feldon",
  bible = "bibles/lakeshire_folk.md", role = "soldier", tier = "quest",
  communities = { "lakeshire" }, temper = { "anxious" }, values = { "dutiful" },
  notices = { "kit" },

  impression = {
    first = "Deputy Feldon counts gnolls at the south end of the bridge, and the count keeps going up. He has a dry sense of humour about it that I suspect keeps him upright.",
    third = "{name} met Deputy Feldon, who watches the south end of Lakeshire's bridge and keeps a rising count of gnolls.",
  },

  greetings = {
    { id = "g_bridge", text = "Keep to the bridge and keep to the road, because what's south of here bites." },
    { id = "g_back", when = { metBefore = true }, text = "Still walking? Good. I think there are fewer gnolls on the road this week, or I hope so." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Gnolls had a go at you, did they? Get that mended before you cross back over, because they smell weakness." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "There are more than yesterday and fewer than tomorrow. That's my joke, and it keeps me standing. Your spirits might have a better one." } },
      choices = {
        { text = "Then I'll help bring the count down, Feldon.", next = "BACK", reply = "You'd be the first to try in earnest, and I'd be grateful. I've run out of jokes and fingers both.", fx = { align = { honor = 1 } } },
        { text = "Gnolls are endless. Count something else.", next = "BACK", reply = "What else is there, the wolves? No, I'll keep counting gnolls, because someone has to know how bad it is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's what I can't decide, because the gnolls go in one and the soldiers in the other, and you're not quite either. Help me bring the gnoll count down and I'll put you with the soldiers, and the Magistrate needn't hear about the rest." } },
      choices = {
        { text = "Put me with the soldiers. I'll earn it.", next = "BACK", reply = "Then the soldiers' column it is, once the count drops. The Magistrate needn't trouble himself with details.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep me out of your columns entirely, Deputy.", next = "BACK", reply = "That's harder than it sounds, but I'll do my best. Some things don't fit in a ledger.", fx = { align = { order = -1 } } },
        { text = "Something else, Deputy.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Last night's count was forty-two, which is six more than the night before. They come up from the south end of the valley in packs, and they've got bolder since the orcs started feeding them scraps." } },
      choices = {
        { text = "I'll bring the count down, Deputy. One gnoll at a time.", next = "BACK", reply = "That's music to me, friend, every gnoll you take off the count. I'll write each one down with relish.", fx = { align = { honor = 1 } } },
        { text = "Forty-two? I'll wait until it's someone else's problem.", next = "BACK", reply = "It's someone else's problem every night, which is how it got to forty-two. Suit yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else, Deputy.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "You could, and I'd love a proper number for once instead of my guess with fifty added for luck. Come back with the count and your ears still on your head, and I might finally sleep a night through." } },
      choices = {
        { text = "I'll count them, and cut a few throats while I'm there.", next = "BACK", reply = "Come back with your ears and the count, and I'll ask no questions about the rest. That's the deal.", fx = { align = { honor = -1 } } },
        { text = "I'll count them and come back clean.", next = "BACK", reply = "Then you're more careful than I'd be, and I'll sleep easier for it. Bring me a real number.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "How bad is it out there?", next = "bad" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "A blizzard? I'd pay good money to see it, if I had any, since the Shadowhide like the cold no better than I do. Just warn me first, so I'm not standing in the middle of my own count." } },
      choices = {
        { text = "Careful aim, Deputy. You'll be well clear.", next = "BACK", reply = "Thank you, that's all I ask. I'll stand well back and enjoy it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gnolls don't wait for warnings, and neither will I.", next = "BACK", reply = "Then I'll stand very far back, if it's all the same to you. Warn the gnolls for me.", fx = { align = { order = -1 } } },
        { text = "Why do you need the numbers?", next = "need" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More carefully, because the gnolls I can estimate and the fallen I have to spell right. The list goes to Stormwind with the report, and I suspect it's the page they read least." } },
      choices = {
        { text = "Then I'll pray over every name on that list.", next = "BACK", reply = "That's kind, and someone ought to. I'll make sure the names are spelled right for you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Counting the dead won't help the living, Deputy.", next = "BACK", reply = "Maybe not, but it's the only thing I can do for them now. Someone has to remember.", fx = { align = { light = -1 } } },
        { text = "Something else, Deputy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It sends a receipt, which is something, and once it sent a sergeant with six men and no horses. I keep writing, because one day someone important will read past the first page, and I'd like the numbers to be right when they do." } },
      choices = {
        { text = "Keep writing. The proper channels will answer in time.", next = "BACK", reply = "I will, and I'll make sure the numbers are right when they do. Thank you for saying so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop writing and start fighting. Stormwind isn't coming.", next = "BACK", reply = "I do both, friend, and the writing's the part they can't ignore forever. I'll keep at it.", fx = { align = { order = -1 } } },
        { text = "Something else, Feldon.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Blackrock arm them and drive them ahead like hounds, so they come at us with orc steel and orc courage. Left alone, I think they'd squabble over carrion in the hills and never bother the bridge at all." } },
      choices = {
        { text = "Spare the gnolls who flee. They're only driven beasts.", next = "BACK", reply = "Maybe, and I'd spare them if they'd stop coming. But they don't flee often.", fx = { align = { honor = 1 } } },
        { text = "Show them no mercy. They chose to raid.", next = "BACK", reply = "They do, and they keep raiding, so I can't fault you. I'll mark them down either way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deputy Feldon. I watch the south end of the bridge and count gnolls. The count keeps going up, which is not how counting's meant to go." },
        { id = "h_parker", tags = { "news" }, when = { questActive = TODO_QUEST("Encroaching Gnolls") },
          text = "Guard Parker sent you down from the Three Corners? He says there are camps to the north and east, so it's worse than I reported, and I reported it bad." },
        { id = "h_assess", when = { questActive = TODO_QUEST("Assessing the Threat") },
          text = "Thin them out along the road, and look hard while you're at it. I need numbers I can put in a letter that Stormwind can't wave away." },
        { id = "h_assess_done", when = { questDone = TODO_QUEST("Assessing the Threat") },
          text = "Good work; it's in the report. If Stormwind reads past the first page they'll be very worried, but they won't read past the first page." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because every gnoll you drop is one I can take off the count, and I've been waiting a long time for the count to go down." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've any blessing that makes the count go down, I'd take it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Good, because the count is getting to the point where I'd like someone who can stand in front of it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I don't suppose you can tell how many gnolls are in those trees just by sniffing, because I've lost count again." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll add you to the count, I suppose, though I'm not sure which column you go in." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Redridge", min = 40 } }, text = "For the first time since I took this post, the gnoll count's gone down instead of up, and I've a fair idea why. Keep at it, and I might have to learn to count backwards." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Good, I'm counting gnolls and the count keeps going up. Your lightning might bring it down again." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, please; I've lost count once today already." },
        { id = "h_again2", text = "Go on, and I'll keep one eye on the road. The other's still swollen from a gnoll's elbow, so it's no use anyway." },
      },
      choices = {
        { text = "How bad is it?", next = "bad" },
        { text = "Why count gnolls at all?", next = "counting" },
        { text = "Someone must be watching the road south.", next = "parker" },
        { text = "I'm good with numbers. Let me help.", next = "gnome", when = { race = "Gnome" } },
        { text = "I counted them for you. What now?", next = "after", when = { questDone = TODO_QUEST("Assessing the Threat") } },
        { text = "I track things for a living. Want help counting?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I could count the gnolls from inside their camp.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "One blizzard could cut your count in half, Deputy.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How many gnolls are out there now, Deputy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you count the fallen as carefully as the gnolls, Deputy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Has Stormwind answered any of your reports, Deputy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The gnolls seem to have grown bold, Deputy.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Which column would you put a warlock in, Deputy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many gnolls are there now, Deputy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay safe, Deputy.", next = "END" },
      },
    },
    bad = {
      big = true,
      lines = {
        { id = "b_default", text = "Bad enough that if they push through here, there's nothing between them and Elwynn but farmers. And Elwynn doesn't know it." },
      },
      choices = {
        { text = "Then we hold them here.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 }, learn = { "redridge_gnolls" } } },
        { text = "Elwynn has the city's guard.", next = "guard" },
        { text = "What do you need from me?", next = "need" },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "Elwynn has a few guards at its bridges and whoever's drinking at the inn in Goldshire. I've been there, so I know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "lions_pride" } } } },
    },
    need = {
      lines = { { id = "ne_default", text = "I need numbers. Scout the southern road, thin the camps and count what you see; I can't send men, so I'm sending you." } },
      choices = {
        { text = "I'll scout it.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    counting = {
      lines = { { id = "c_default", text = "Because a report without numbers is only a complaint. Stormwind ignores complaints, and it ignores numbers more slowly." } },
      choices = {
        { text = "I'd guess nobody in Stormwind reads your reports.", next = "reports" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reports = {
      lines = { { id = "r_default", text = "The Marshal, then the Magistrate, then a courier, then someone in Stormwind who's very busy. I picture him often, sitting at a lovely desk." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    parker = {
      lines = { { id = "pa_default", text = "Guard Parker, out at the Three Corners. He sends me word, and now and then somebody's lunch goes past me on its way to him." } },
      choices = {
        { text = "Just Parker? Alone?", next = "alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "Alone, yes. That's our whole watch toward Elwynn, one guard and a crossroads, so don't repeat that." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, learn = { "redridge_gnolls" } } },
        { text = "Stormwind should hear that.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Are you? Then tell me how many gnolls make a war. I've been trying to work it out, and every answer frightens me." } },
      choices = {
        { text = "More than you've got guards.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Fewer than you fear. Count again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Now the count goes up the hill, and the Magistrate adds it to his letter. You've made the letter heavier, and that's something." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Help? I'd weep with gratitude, and I might yet. You read tracks, so tell me whether those gnolls are coming down from the hills in packs or wandering in by ones and twos, because my count changes depending." } },
      choices = {
        { text = "Packs. Someone's organizing them.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "I'll go look and tell you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Parker swears the Duskwood road has wolves walking on two legs past the border, and I'd laugh if he weren't the soberest man in Lakeshire. I count gnolls, and gnolls are bad enough." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The gnolls answer to the orcs, the orcs answer to that mountain, and the mountain answers to nobody, as far as I can tell. I'd like to count what's inside it, but I'd need a bigger ledger." } },
    second_war = { { id = "tp_second_war", text = "Every old man in Lakeshire fought in the Second War, and each of them will tell you about it whether you ask or not. I've learned to count gnolls while they talk, which is the only skill the war gave me." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I went to the Darkmoon Faire on my one leave last year and lost to a gnome at a shooting gallery. I've told everyone it was a rigged gun, and I've half convinced myself." } },
    background = { { id = "tp_bg", text = "I'm a deputy at the south end of the bridge, and I count." } },
    advice = { { id = "tp_ad", text = "Stay on the road after dark. If the road's not safe, stay in town. If the town's not safe, tell me first." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Redridge clans, mostly, bigger than the Riverpaw in Westfall and meaner than the Elwynn ones, and they've started building camps of their own." } },
    blackrock = { { id = "tp_blackrock", text = "The gnolls do the raiding, but I think the orcs are giving the orders. Don't tell anyone I said so until I can prove it." } },
    _none = { { id = "tp_none", text = "Not my patrol, friend; ask in town." } },
  },
}

P:NPC {
  key = "parker", id = TODO_NPC("Guard Parker"), name = "Guard Parker",
  bible = "bibles/lakeshire_folk.md", role = "guard", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "dutiful", "shy" },
  notices = { "kit", "travel" },

  impression = {
    first = "Guard Parker walks the road between Lakeshire and the Duskwood line and watches the hills like they owe him money. He wanted to know exactly where I was going.",
    third = "{name} was stopped on the road by Guard Parker, who patrols between Lakeshire and the Duskwood line.",
  },

  greetings = {
    { id = "g_road", text = "Hold up, where are you headed? The road's watched, but not as well as I'd like." },
    { id = "g_back", when = { metBefore = true }, text = "The road's been quiet. Too quiet, or just quiet; you can never tell out here." },
  },

  notice = {
    { id = "n_dusk", cat = "travel", when = { visited = "Darkshire" },
      text = "Come up from Darkshire? You've got the fog on you, and it takes a day to wash off." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, with gnolls and orcs both and too few guards to watch them. That's why I ask everyone where they're walking, and your spirits won't stop me asking." } },
      choices = {
        { text = "Ask all you like, Parker. Order keeps us safe.", next = "BACK", reply = "I will, and I'll keep asking until the last orc's gone. Where are you headed, then?", fx = { align = { order = 1 } } },
        { text = "Ask less, guard more. That's what you're for.", next = "BACK", reply = "I do both, friend, and I'll keep doing both. Now, where are you headed?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Gnolls, mostly, out of Redridge's high country, and once in a while a Blackrock scout looking for a fight. A warrior on this road can save a farmer's life just by being seen, because the gnolls don't like a fair fight." } },
      choices = {
        { text = "Then I'll walk your road and let them see me.", next = "BACK", reply = "That's all I'd ask, and the farmers will thank you. Walk where the gnolls can see you.", fx = { align = { order = 1 } } },
        { text = "I don't walk roads for show. I go where the fighting is.", next = "BACK", reply = "Then go where the fighting is, and I'll keep watching the road. Mind the hills.", fx = { align = { order = -1 } } },
        { text = "Something else, Parker.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Smoke, first, because it means orcs, and dogs barking, because it means gnolls. The condors are only birds, but they circle where something's died, so I watch them too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Smoke, first, because it means orcs, and dogs barking, because it means gnolls, and condors circling where something's died. Your {pet} keeps its eye on the hills same as me, {class}, and I'd sign it up for the guard if it could hold a spear." },
      },
      choices = {
        { text = "I'll report anything I find to the guard.", next = "BACK", reply = "Good, and the Marshal will want to hear it. Report it at the bridge.", fx = { align = { order = 1 } } },
        { text = "I'll hunt what I see. Reporting's your job.", next = "BACK", reply = "Then hunt, and I'll keep my eyes open for the rest. Mind the smoke.", fx = { align = { order = -1 } } },
        { text = "Something else, Parker.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Can you blink past the Blackrock outriders and the gnolls in the hills both? I've walked that road for three years, and the only safe way I've found is eyes open and feet quick." } },
      choices = {
        { text = "Eyes open, then. I'll walk it your way.", next = "BACK", reply = "Good, and you'll get there in one piece. Eyes open, feet quick.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My way's quicker. I'll trust the spell.", next = "BACK", reply = "Then I'll not be the one picking you up when it goes wrong. Good luck.", fx = { align = { order = -1 } } },
        { text = "What's the worst you've seen out there?", next = "worst" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Safer for whom, I'd like to know? There's a girl at the inn who'd never speak to me again if I let something like that near her, so walk your demon on the far side of the road, if you please." } },
      choices = {
        { text = "Far side it is. Your girl's safe from it.", next = "BACK", reply = "Thank you, and she'll thank you too, if she ever hears of it. The far side, please.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "She'll get used to it, Parker.", next = "BACK", reply = "She won't, I promise you that, and neither will I. The far side, if you please.", fx = { align = { light = -1 } } },
        { text = "Who's the girl at the inn?", next = "darcy" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every time I walk out of Lakeshire, and every time I walk back in I'm a little surprised. It's not so bad, though, because someone at the inn always leaves me lunch, and a man can face a lot of road for a good lunch." } },
      choices = {
        { text = "Someone's looking out for you, Parker. Trust in that.", next = "BACK", reply = "Someone is, and I'm grateful for it every day. I'll keep walking, then.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope won't save you out there. Only your eyes will.", next = "BACK", reply = "Maybe not, but lunch helps. I'll keep my eyes open all the same.", fx = { align = { light = -1 } } },
        { text = "Something else, Parker.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It'd be welcome, but the Marshal hasn't the men, and they're better used on the walls than holding my hand. One guard can see trouble coming and run to warn the town, and that's the job; two guards would only argue." } },
      choices = {
        { text = "Then I'll walk with you a while. Nobody should guard alone.", next = "BACK", reply = "That's kind, and I'll not say no. It's a long road alone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your road, your risk, Parker. I've my own business.", next = "BACK", reply = "Fair enough, and I'll watch the hills for both of us. Mind yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else, Parker.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The quiet stretches, because a gnoll pack never makes a sound until it's on you. I've walked this road eleven years and I still can't tell a bird going silent from a bird that was never there." } },
      choices = {
        { text = "Keep to the road and keep your patrol to schedule.", next = "BACK", reply = "That's what I do, and it's kept me alive eleven years. The schedule's my friend.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave the road sometimes. The trees hide you as well as them.", next = "BACK", reply = "Maybe, but I'd get lost and the Marshal would have my hide. I'll stick to the road.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Parker. I walk this road between Lakeshire and the Duskwood line with my eye on the hills, and keeping my eye on the job is the whole trick." },
        { id = "h_gnolls", tags = { "news" }, when = { questActive = TODO_QUEST("Encroaching Gnolls") },
          text = "There are camps north and east of here, more every week. Get word to Deputy Feldon at the bridge; he'll know what to do, or I hope he does." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("A Free Lunch") },
          text = "Lunch, from Darcy? That's, er, that's very kind of her. Tell her it was very kind, no, tell her something better than that, once I've thought of something." },
        { id = "h_herbalist", when = { questActive = TODO_QUEST("Visit the Herbalist") },
          text = "Martie Jainrose keeps a garden at the west end of town, so ask her for some flowers, something nice. And please don't tell her who they're from, or who they're for." },
        { id = "h_after", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          text = "She liked them, and she said so? Well, that's good, that's... eyes on the road, Parker, eyes on the road." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Eye on the hills, always, and you'll do fine here, because the hills have plenty to say about anyone who doesn't watch them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Eye on the job, always, and yours is the hills, so tell me if you see anything moving that shouldn't be." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest on the road. Eye on the hills, always, though I'll spare one for a blessing if you're offering." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Eye on the road, always, but I'll admit it's good to see someone walk it who isn't afraid." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, walking my road. I'll need to know where you're bound, same as anyone, even if you mean to get there on four legs." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Where are you going, exactly? The hills owe me answers, and so do you." },
      },
      again = {
        { id = "h_again", text = "Something else? Talk while I watch; I can do both, mostly." },
        { id = "h_again2", text = "Go on. My eyes are on the road, but my ears are yours." },
      },
      choices = {
        { text = "What's out on the road?", next = "road" },
        { text = "Is there anyone waiting for you back in town?", next = "darcy" },
        { text = "Redridge seems full of trouble these days.", next = "trouble" },
        { text = "Darcy made you lunch.", next = "lunch", when = { questActive = TODO_QUEST("A Free Lunch") } },
        { text = "Darcy loved the daffodils.", next = "flowers", when = { questDone = TODO_QUEST("Delivering Daffodils") } },
        { text = "I came up that road and you never saw me.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I can blink past anything on that road.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What comes down from the hills onto your road, Parker?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I watch for in the hills, Parker?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your road would be safer with a demon walking it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you worry about not coming back from the road, Parker?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should someone walk the road with you, Parker?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Something about these hills worries you, Parker.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the hills hold more trouble than usual, Parker?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Carry on.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Gnolls in the hills, and worse in the woods past the Duskwood line, where things come up out of the fog that I don't have names for." } },
      choices = {
        { text = "Stay sharp.", next = "BACK", fx = { learn = { "redridge_gnolls" } } },
        { text = "That's far too close to Elwynn for gnolls.", next = "elwynn" },
      },
    },
    elwynn = {
      big = true,
      lines = { { id = "e_default", text = "Camps north and east of here, more every week. If they push west, the first thing they find is Goldshire, and Goldshire's mostly farmers and one inn." } },
      choices = {
        { text = "I'll warn Deputy Feldon.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darcy = {
      lines = { { id = "d_default", text = "Darcy's a friend, a good friend, and she works at the inn, and that's all there is to say. Why, has she said something?" } },
      choices = {
        { text = "She asks after you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Nothing at all.", next = "BACK", fx = { affinity = -1 } },
        { text = "You could just tell her.", next = "tell" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "Tell her what? I'm on this road from dawn to dark with my eye on the job... though maybe flowers. Flowers say things so you don't have to." } },
      choices = { { text = "Flowers, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "Ill times. The Blackrock hold Stonewatch, the Shadowhides crowd round their tower, and the Redridge pack grows every season. I hope you didn't come for a holiday.",
          fx = { learn = { "blackrock", "redridge_gnolls" } } },
      },
      choices = {
        { text = "Which is worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Whichever's closest to my road that night. Tonight I'd say the gnolls. Ask me again at dawn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lunch = {
      lines = { { id = "l_default", text = "She did? It's still warm, too. Tell her thank you, properly, and not the way I just said it." } },
      choices = { { text = "I'll tell her properly.", next = "BACK", fx = { affinity = 2 } } },
    },
    flowers = {
      lines = { { id = "f_default", text = "She did, and she said so? Daffodils, though... I only asked Martie for something nice, and she picked daffodils. Huh." } },
      choices = {
        { text = "Martie's favourites, I hear.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Didn't I? Well, that's a fine thing to tell a man whose whole job is seeing people on that road. If you can slip past me, so can a Blackrock scout, and that's a thought to keep a man up nights." } },
      choices = {
        { text = "Watch the ditches, not the road.", next = "BACK", fx = { affinity = 1 } },
        { text = "Don't worry. Orcs are louder than me.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    dark_riders = { { id = "tp_dark_riders", text = "Some nights a rider in black comes down the road from Duskwood and doesn't stop at my challenge. I've never seen his face, and I'd sooner the next fellow on this road had one." } },
    stalvan = { { id = "tp_stalvan", text = "Old folk on the Darkshire side tell of a man named Stalvan who did something terrible in a tower long ago. They won't say what, and I've stopped asking because I've started believing them." } },
    night_watch = { { id = "tp_night_watch", text = "The Night Watch in Darkshire are farmers and old soldiers holding a town with lanterns. I've a lot of time for them, because I'm one man on a road holding nothing at all." } },
    shadowfang = { { id = "tp_shadowfang", text = "A wizard in Silverpine let loose the same sort of beast that walks Duskwood now, or so the merchants say, and he's holed up in a keep there called Shadowfang. I'd like to have a word with any mage who thinks wolves need help." } },
    scourge = { { id = "tp_scourge", text = "The dead walk in the north, I'm told, and I've stood on this road at midnight enough to imagine what that's like. I'd take a hundred gnolls over one of those, because a gnoll at least stays down." } },
    background = { { id = "tp_bg", text = "I'm a Stormwind guard. They gave me a road and told me to watch it, and I'm watching it." } },
    advice = { { id = "tp_ad", text = "Keep your eye on the job, because everything else is how you get jumped." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They move at dusk and they're getting bolder. Last week one came right down to the road and just looked at me." } },
    worgen = { { id = "tp_worgen", text = "I've heard them past the line, but never seen one, and I'd like to keep it that way." } },
    _none = { { id = "tp_none", text = "I just walk the road, friend; ask in Lakeshire." } },
  },
}

P:NPC {
  key = "darcy", id = TODO_NPC("Darcy"), name = "Darcy",
  bible = "bibles/lakeshire_folk.md", role = "citizen", tier = "quest",
  communities = { "lakeshire" }, temper = { "bright" }, values = { "kind", "romantic" },
  notices = { "hunger", "drink" },

  impression = {
    first = "Darcy called me love and seated me away from the wobbly table. She hears all the gossip in Lakeshire and swears she passes on only the nice parts.",
    third = "{name} was served at the Lakeshire inn by Darcy, who hears all the town's gossip and claims to repeat only the kind parts.",
  },

  greetings = {
    { id = "g_inn", text = "Sit anywhere, love, I'll be right round. Anywhere but that table, mind, because it wobbles." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, and I bet it's the same as last time. I remember, love; I always remember." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, easy, water next. I'm not having you fall in the lake on my shift." },
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half-starved and fully beaten, so sit down. Breanna's got something on, and I'll bring it out." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That folk still help each other, love, even with the orcs so close. Your spirits might like that bit best." } },
      choices = {
        { text = "Kindness is the best gossip, Darcy. Keep spreading it.", next = "BACK", reply = "It is, love, and I'll keep spreading it, because Light knows we need it. Thank you.", fx = { align = { light = 1 } } },
        { text = "The nasty gossip's more useful. Tell me that instead.", next = "BACK", reply = "Oh, love, I don't keep that sort, and I'd not tell you if I did. Nice parts only.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That they eat babies and curse the crops, which is silly, because the gnolls already ate the crops. I only pass on the nice parts, so I'll tell everyone you said please and thank you, if you'll let me." } },
      choices = {
        { text = "Tell them that, Darcy. I'll live up to it.", next = "BACK", reply = "Oh, I knew you would, love. I'll tell them you said thank you twice.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them believe the worst. It keeps them away.", next = "BACK", reply = "They'll believe what I tell them, love, and I'll tell them nice things. You can't stop me.", fx = { align = { light = -1 } } },
        { text = "Something else, Darcy.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, the usual, love: who's courting who, who's been caught asleep on watch, and whether the orcs will come across the lake this year. The nice parts are mostly about the courting, and I keep the rest to myself." } },
      choices = {
        { text = "Then I'll give them something brave to gossip about.", next = "BACK", reply = "Oh, would you, love? I'd love a bit of brave gossip for a change. Off you go, then.", fx = { align = { honor = 1 } } },
        { text = "I'm only passing through. Let them gossip about someone else.", next = "BACK", reply = "Then I'll gossip about you as you pass, love, and only the nice parts. I promise.", fx = { align = { honor = -1 } } },
        { text = "Something else, Darcy.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The best, love, though the true ones are the hardest to believe. There's one about a boar called Bellygrub who ate a guard's boot right off his foot, and I've heard it told twelve different ways." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a sweetheart, love, and I'll not hear a word against it. Would it like a bit of ham?" },
      },
      choices = {
        { text = "I'll tell only true stories, Darcy.", next = "BACK", reply = "True ones are rare, love, but I'll take one if you've got it. They're my favourite.", fx = { align = { honor = 1 } } },
        { text = "A good story's better than a true one.", next = "BACK", reply = "Oh, love, now you're talking. Bellygrub's boot gets bigger every time I hear it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Darcy.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Oh, love, I don't sell it, I give it away, but only the nice parts. The rest I keep under the counter where it can't hurt anybody, and you won't get it out of me with that smile." } },
      choices = {
        { text = "Then keep it. Secrets are safe with you.", next = "BACK", reply = "They are, love, every one. The nice parts I'll share; the rest stays with me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everyone has a price, Darcy. Even gossip.", next = "BACK", reply = "Not mine, love, not for any coin. Try that smile on someone else.", fx = { align = { honor = -1 } } },
        { text = "What's the latest, then?", next = "gossip" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not in so many words, love, but they ask me to keep their seat warm, and that's the same thing, isn't it? When a seat stays empty too long, I keep it warm anyway, and I don't tell anyone why." } },
      choices = {
        { text = "That's a prayer of its own, Darcy. Keep doing it.", next = "BACK", reply = "Do you think so, love? Then I'll keep doing it, and I'll think of it like that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Empty seats should be filled. Mourning doesn't help anyone.", next = "BACK", reply = "Oh, love, they will be, someday. Until then I'll keep them warm, and that's that.", fx = { align = { light = -1 } } },
        { text = "Something else, Darcy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The children on the docks, love, Shawn and Hilary and the rest, because they think the war is a game and nobody's had the heart to tell them otherwise. Parker keeps an eye on them when he's in town, but he's hardly ever in town." } },
      choices = {
        { text = "Then I'll look in on them, Darcy. Children come first.", next = "BACK", reply = "Would you, love? They'd like that, and so would I. They're good children.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Children aren't my concern. I've orcs to fight.", next = "BACK", reply = "Oh, love, that's a hard thing to say about children. Mind the orcs, then.", fx = { align = { honor = -1 } } },
        { text = "Something else, Darcy.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Mostly that you're tall and quiet and never seem to sleep, love, which is what they say about the Watch too. Some of the older folk mutter that elves are trouble, but they say that about anyone from past the mountains, so don't take it to heart." } },
      choices = {
        { text = "Then I'll earn their trust fairly, one meal at a time.", next = "BACK", reply = "That's the way, love, and you'll win them round quicker than you think. They like a polite face.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them mutter. I don't need their good opinion.", next = "BACK", reply = "Then you'll not have it, love, and that's a shame. I'll put in a good word anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Darcy. I wait tables at the inn and I hear all the gossip, and I pass on only the nice parts, mostly." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("A Free Lunch") },
          text = "It's only lunch, for Parker out on the road. He forgets to eat, so somebody has to remember for him, but don't tell him I said that." },
        { id = "h_daffodils", tags = { "news" }, when = { questActive = TODO_QUEST("Delivering Daffodils") },
          text = "Daffodils from Parker? Oh, they're lovely, they really are! They're Martie's favourites, though, so did she pick these on purpose?" },
        { id = "h_after", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          text = "Parker's daffodils are in a jar on the windowsill, and I've moved them twice. Don't say anything." },
        { id = "h_parker", when = { heardLine = "parker.h_default" },
          text = "You met Parker, out on the road? Was he eating, because he never eats, and did he say anything, about anything at all?" },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Is it true your folk wear feathers in your hair? Hippogryph, a traveller told me. I'd never get them to stay put." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, love! Sit here, by the window, where the soldiers can see you and feel a bit braver for it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, love, and a beast besides! I'll find it a bowl of scraps if you'll promise it won't chase the inn's cat." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, love! Sit by the window, because the soldiers behave themselves better with someone holy in the room." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, love! Parker will want to meet you, because he says the Silver Hand are the bravest lot in the kingdom." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid, love, and a night elf besides! The whole inn will be talking about you by supper, and I'll only pass on the nice parts." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh, a warlock! I won't tell anyone, I promise, though the whole inn will know by supper, because it's that sort of inn." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Hello, love. A shaman! Sit away from the wobbly table. I'll tell you only the nice gossip, promise." },
      },
      again = {
        { id = "h_again", text = "What else, love? The tables can wait a minute." },
        { id = "h_again2", text = "Go on, I'm all ears, love. Well, ears and plates." },
      },
      choices = {
        { text = "Something smells good tonight.", next = "food" },
        { text = "Heard any gossip?", next = "gossip" },
        { text = "Is there anyone special in your life, Darcy?", next = "parker" },
        { text = "I delivered the lunch. He ate every bite.", next = "lunch_done", when = { questDone = TODO_QUEST("A Free Lunch") } },
        { text = "Do you like the daffodils?", next = "daffodils", when = { questDone = TODO_QUEST("Delivering Daffodils") } },
        { text = "I could conjure you bread for the tables.", next = "mage", when = { class = "MAGE" } },
        { text = "You hear all the gossip, Darcy. Any of it worth selling?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do the soldiers gossip about, Darcy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the hunters around here tell good stories, Darcy?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the soldiers ever ask you to pray for them, Darcy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who in Lakeshire needs protecting most, Darcy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does Lakeshire say about my people, Darcy?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does Lakeshire's gossip say about warlocks, Darcy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's the nicest gossip in Lakeshire, Darcy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I grew up in Lakeshire, Darcy. What gossip have I missed?", next = "xorig_lake", when = { origin = "human_redridge_born" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    xorig_lake = {
      lines = {
        { id = "xol_default", text = "You're a Lakeshire child? Oh, love, then you've missed the worst and the best of it, because half the families who fled the orcs never came back, and the half who did married each other. Have you still got people here, then?" },
      },
      choices = {
        { text = "Some. I don't visit as often as I should.", next = "xorig_lake2", fx = { trait = { kind = 1 } } },
        { text = "Nobody now. That's partly why I left.", next = "xorig_lake2", fx = { trait = { stern = 1 } } },
        { text = "I'd rather hear the gossip than talk about me.", next = "gossip", fx = { trait = { witty = 1 } } },
      },
    },
    xorig_lake2 = {
      lines = {
        { id = "xol2_default", text = "Well, you've got the inn, at least, and the inn remembers everyone who ever sat at the wobbly table. Come by of an evening and I'll tell you who's still about, though only the nice parts." },
      },
      choices = {
        { text = "I'd like that, Darcy.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Whatever Breanna's making, and she's always making goulash. You'll like it; everyone pretends not to, and then has seconds." } },
      choices = {
        { text = "Goulash it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who's Breanna?", next = "breanna" },
      },
    },
    breanna = {
      lines = { { id = "br_default", text = "Chef Breanna, up the north end. She fed the whole Stormwind brigade through the last attack, and her cupboard's never recovered." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gossip = {
      lines = { { id = "g2_default", text = "A great boar's been in Martie Jainrose's garden again, and the Marshal's gone and named it Bellygrub. Now nobody can take it seriously, which is a problem, because it's enormous." } },
      choices = {
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
        { text = "Martie herself seems a sweet sort.", next = "martie" },
      },
    },
    martie = {
      lines = { { id = "m_default", text = "Martie Jainrose? She's sweet as honey to your face, love, but I'd not tell her anything I wanted kept." } },
      choices = {
        { text = "That's unkind, Darcy.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
        { text = "It sounds as if she likes Parker.", next = "martie_parker" },
      },
    },
    martie_parker = {
      lines = { { id = "mp_default", text = "Everyone likes Parker, and that's the trouble with Parker." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    parker = {
      lines = { { id = "p_default", text = "Parker's a big, brave Stormwind guard who forgets his own lunch, so somebody has to remember. That's all it is." } },
      choices = {
        { text = "That's all?", next = "parker_all" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parker_all = {
      lines = { { id = "pa_default", text = "That's all! Well, mostly, and don't you dare tell him." } },
      choices = {
        { text = "Not a word.", next = "BACK", fx = { affinity = 2 } },
        { text = "He might want to know.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    lunch_done = {
      lines = { { id = "ld_default", text = "Every bite? Did he say anything? What did he say, exactly, word for word?" } },
      choices = {
        { text = "That you have a kind heart.", next = "BACK", fx = { affinity = 3 } },
        { text = "He said it was tough work, guarding.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    daffodils = {
      lines = { { id = "da_default", text = "I love them. They're Martie's favourites, though, and I can't stop wondering whether she knew. If they wilt early, I'll know why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "ma_default", text = "Oh, love, that's sweet, and I've tasted that conjured bread; a soldier left a loaf on the counter once. It filled him up fine, but nobody ever sat at a table and lingered over it, did they?" } },
      choices = {
        { text = "Food's food when people are hungry.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Fair point. Yours smells better.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    sylvanas = { { id = "tp_sylvanas", text = "A soldier at table four says the dead have a queen now, love, a dead elf with a voice that kills. I took his plate away, because nobody needs to hear that over stew." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's a lovely day out, and I heard the fortune-teller there told Brianna she'd marry a sailor. She's been watching the docks ever since, though she'll deny it." } },
    jaina = { { id = "tp_jaina", text = "I hear Lady Jaina Proudmoore keeps an island all her own over the sea, and she's not wed, love, not to anyone. The girls of Lakeshire can't decide whether that's romantic or just sensible." } },
    onyxia = { { id = "tp_onyxia", text = "Somebody told me there's a black dragon in a swamp past Theramore, sleeping on the gold of every ship that ever sank there. I don't believe a word of it, love, but it made a lovely story for the table by the window." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord's a handsome man for a regent, love, and I'll hear nothing said against him. I've only seen a portrait, mind, but a portrait's enough for me." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor's at the Highlord's side every day, the soldiers say, and I've no love for her. Call it gossip if you like, love, but a lady who's never been seen in a market makes me suspicious." } },
    knows = {
      { id = "tp_knows", text = "I hear everything at the tables, though I only pass on the nice parts, mostly. Ask me about any of this!" },
    },
    background = { { id = "tp_bg", text = "I carry plates at the inn. Everyone talks to the one carrying the plates." } },
    advice = { { id = "tp_ad", text = "Eat something before you go out there, because nobody fights well hungry, and Parker certainly doesn't." } },
    blackrock = { { id = "tp_blackrock", text = "Every soldier who comes through here talks about them and then orders a second drink. That tells you enough." } },
    _none = { { id = "tp_none", text = "Couldn't say, love; I just carry the plates. Ask Daniels, he hears more." } },
  },
}

P:NPC {
  key = "martie", id = TODO_NPC("Martie Jainrose"), name = "Martie Jainrose",
  bible = "bibles/lakeshire_folk.md", role = "farmer", tier = "quest",
  communities = { "lakeshire" }, temper = { "warm" }, values = { "patient", "proud" },
  notices = { "craft", "animal" },

  impression = {
    first = "Martie Jainrose grows herbs for the healer and flowers for nobody in particular. Her garden by the lake is the gentlest thing I've seen in Redridge.",
    third = "{name} met Martie Jainrose, who keeps a garden by the lake in Lakeshire and grows herbs for the town's healer.",
  },

  greetings = {
    { id = "g_op_gnolls_driven", when = { gossip = { topic = "redridge_gnolls", stance = "driven" } }, text = "Verner tells me you think the gnolls were driven down off the mountains, same as I do. Well, Bellygrub's still eating my garden, but I'm glad somebody listens to an old woman." },
    { id = "g_garden", text = "Step round the beds, dear, they're only just coming up. Lovely weather for it, if it holds." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! The tulips have opened, well, two of them have, and two's a start." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Then you'll know not to step on anything green. Thank you in advance." },
    { id = "n_pet", cat = "animal", when = { pet = true },
      text = "Keep your animal off my garden, please. I've had enough animals in my garden for one season." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid! You'll know how to talk to plants, then. Mine won't listen to me, so perhaps they'll listen to you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because something gentle ought to grow in Redridge. The orcs trample the hills, but my garden stays soft." } },
      choices = {
        { text = "Keep it growing, Martie. Gentleness is worth guarding.", next = "BACK", reply = "I will, and thank you for saying so. It's the one soft thing I can give this town.", fx = { align = { light = 1 } } },
        { text = "Grow food instead. Flowers don't feed soldiers.", next = "BACK", reply = "Flowers feed the spirit, love, and the herbs feed the healer. I grow both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I've always thought so, though nobody in Lakeshire has ever tried it. Flowers want sun and patience, and I can manage the patience, but the sun's been poor this spring and the gnolls trample whatever comes up." } },
      choices = {
        { text = "Patience suits a garden better than spells.", next = "BACK", reply = "It does, and I've plenty of patience. The sun I'll leave to the Light.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little magic would do your flowers good.", next = "BACK", reply = "Perhaps, but I'd like to see them grow on their own. I'll think about it.", fx = { align = { order = -1 } } },
        { text = "Something else, Martie.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not yet, thank the Light, though I've seen their tracks by the far fence once or twice. The herbs I grow keep the healer stocked, and the healer keeps the guards alive, so a warrior by my gate would be guarding more than flowers." } },
      choices = {
        { text = "I'll watch your garden while I'm in Lakeshire.", next = "BACK", reply = "Oh, would you? I'd feel safer with you nearby, and so would the beans.", fx = { align = { honor = 1 } } },
        { text = "Flowers aren't my concern. I'll fight out in the hills.", next = "BACK", reply = "That's fair, and the hills need you more than my garden does. Mind yourself out there.", fx = { align = { honor = -1 } } },
        { text = "Something else, Martie.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "They would, and that's why I grow them down by the lake where I can see them, not by the road. Alma Jainrose, who teaches herbcraft in town, taught me which ones mend and which ones kill, and she made me promise to sell only the first sort." } },
      choices = {
        { text = "Every blade needs an edge, Martie.", next = "BACK", reply = "Not mine, love, not ever. I made Alma a promise, and I'll keep it.", fx = { align = { honor = -1 } } },
        { text = "Your promise is a good one. Keep it.", next = "BACK", reply = "I will, and I'm glad you think so. Alma would be pleased.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What do you grow here?", next = "grow" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "That's a strange thing to say, but I suppose it's true, since the flowers don't know about the orcs. I'll ask you not to stand on the marigolds, though, because something about you makes the bees go quiet." } },
      choices = {
        { text = "I'll step carefully. Your garden's worth keeping.", next = "BACK", reply = "Thank you, and mind the marigolds especially. The bees will come back once you've gone.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Quiet bees are no great loss.", next = "BACK", reply = "It is to me, and to the flowers. Mind your step, please.", fx = { align = { light = -1 } } },
        { text = "Who buys your flowers?", next = "buyers" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Peacebloom and silverleaf, mostly, and a bit of earthroot when I can find it, because the healer swears by it for a fever. I grow the flowers for nobody in particular, but the herbs I grow for everybody, and that's the difference." } },
      choices = {
        { text = "Your herbs do the Light's work too, Martie. Keep growing them.", next = "BACK", reply = "They do, I think, and that's why I grow them. Thank you for seeing it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Herbs are just plants. The healer does the real work.", next = "BACK", reply = "The healer would say otherwise, and so would the fevered. Herbs are a start.", fx = { align = { light = -1 } } },
        { text = "Something else, Martie.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, I'd hate it, someone standing in the beans all day looking stern. The boar was the worst of it, and the gnolls don't care for gardens, so I'll keep my spade and my wits, thank you." } },
      choices = {
        { text = "Then I'll look in on your garden whenever I pass.", next = "BACK", reply = "That's lovely of you, and the beans will be glad of the company. Mind where you step, though.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your spade will do, Martie. The guard has better work.", next = "BACK", reply = "It will, love, and I'll keep my wits about me. Thank you all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else, Martie.", next = "BACK" },
      },
    },
    xorig_home = {
      lines = {
        { id = "xoh_default", text = "Smaller, dear, and the boar's had half of it, but it's still here, same as the lake. The town's thinner than when you were little, though, since the orcs came down out of the hills, and Stormwind never seems to count who's missing." },
      },
      choices = {
        { text = "Lakeshire always gets forgotten. I learned that young.", next = "xorig_home2", fx = { trait = { stern = 1 } } },
        { text = "It's good to see something still growing here.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 } } },
        { text = "Something else, Martie.", next = "BACK" },
      },
    },
    xorig_home2 = {
      lines = {
        { id = "xoh2_default", text = "We all learned it, dear, and some of us learned it at a graveside. But you came back, which is more than Stormwind ever does, so I'll put that in the garden's favour." },
      },
      choices = {
        { text = "Someone has to remember this place.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Martie Jainrose. I keep the garden by the lake and grow what the town needs: herbs for the healer, and flowers for nobody in particular, whenever that great boar Bellygrub leaves them standing." },
        { id = "h_boar", tags = { "news" }, when = { questActive = TODO_QUEST("An Unwelcome Guest") },
          text = "That great fat boar the Marshal calls Bellygrub has trampled the beds I'd dug for daffodils, and that's a whole season gone. Bring me his tusk, would you?" },
        { id = "h_boar_done", when = { questDone = TODO_QUEST("An Unwelcome Guest") },
          text = "No more hoofprints, though I keep looking for them out of habit. I almost miss the brute... no, I don't." },
        { id = "h_parker", tags = { "news" }, when = { questActive = TODO_QUEST("Visit the Herbalist") },
          text = "Flowers? You've hardly arrived and you're buying flowers, so somebody's caught your eye. Daffodils, then; they're my favourite." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Mind the flowerbeds, please, because those boots look like they've trampled worse than marigolds." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I grow herbs for the healer, so you and I are in the same trade, more or less, only my patients are roots." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Mind the flowerbeds, please, because even holy boots trample marigolds." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could you warm the soil a little on frosty nights? My seedlings would thank you, and so would I." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My garden's gentle, so be gentle with it. Do your earth spirits like flowers?" },
        { id = "h_lakeborn", when = { origin = "human_redridge_born" },
          text = "Now there's a lake face if ever I saw one, dear! You grew up here, didn't you? Welcome home, whatever brought you back over that bridge." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? Just step around the seedling trays." },
        { id = "h_again2", text = "Go on, then. The weeds will wait, and so will that great lump of a boar, right until I turn my back." },
      },
      choices = {
        { text = "Your garden seems to grow well, for Redridge.", next = "grow" },
        { text = "I grew up on this lake, Martie. Is the garden what it was?", next = "xorig_home", when = { origin = "human_redridge_born" } },
        { text = "Tell me about Bellygrub.", next = "boar" },
        { text = "You seem sad about the flowers.", next = "sad" },
        { text = "I'm an herbalist too.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Your garden's struggling. Let me listen to it.", next = "druid", when = { class = "DRUID" } },
        { text = "The daffodils were from Parker. For Darcy.", next = "told", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          fx = { align = { honor = -1 } } },
        { text = "Why do you grow flowers for nobody, Martie?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Somebody asked me to deliver daffodils, and I won't say who.", next = "END", reply = "Daffodils, is it? Then I'll pick the prettiest ones I've got and keep my guesses to myself, though I've a fair idea. Off you go, and mind the boar on the way.", when = { questDone = TODO_QUEST("Delivering Daffodils") }, fx = { align = { honor = 1 } } },
        { text = "I could tame Bellygrub, I think.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Some of your herbs would make fine poisons.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The gnolls must come near your garden at times, Martie.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your garden is the only thing in Redridge that isn't frightened.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Which of your herbs go to the wounded, Martie?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the guard post someone at your garden, Martie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think magic could help a garden, Martie?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Peacebloom, silverleaf, a little briarthorn by the wall. Anything, really, if the boars and the orcs leave it alone." } },
      choices = {
        { text = "Thanks.", next = "BACK" },
        { text = "Your herbs must go to the healers.", next = "buyers" },
      },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Whoever's doing the healing, which is everyone lately. Peacebloom for the guards' cuts, silverleaf for the kitchen. Alma Jainrose teaches the craft in town, if you want it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    boar = {
      lines = { { id = "bo_default", text = "That forsaken boar roots in the field southwest of town and comes calling at night. The Marshal gave him a name, so now he's a character instead of a menace." } },
      choices = {
        { text = "I'll deal with him.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Why not let him be?", next = "boar_be" },
      },
    },
    boar_be = {
      lines = { { id = "bb_default", text = "Because I can't replant until next season now. Let him be, and there'll be no next season either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sad = {
      big = true,
      lines = {
        { id = "s_default", text = "Sad? No, dear. A garden teaches you that some things you plant come up in someone else's yard, that's all. Pass me that trowel, would you?" },
      },
      choices = {
        { text = "Here you are.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'd guess this is about Parker.", next = "parker" },
      },
    },
    parker = {
      lines = { { id = "pk_default", text = "Parker? He walks past the garden twice a day and says the weather's fine. It always is, when he says it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then you'll know peacebloom bruises if you look at it wrong. Come and look at the silverleaf and tell me why it's sulking." } },
      choices = {
        { text = "Too much shade, I'd say.", next = "BACK", fx = { affinity = 2 } },
        { text = "It's sulking because of the boar.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Well? What's it saying? Don't tell me it's the boar, because I know it's the boar." } },
      choices = { { text = "It's the boar.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    told = {
      lines = { { id = "to_default", text = "Ah. For Darcy, of course they were. Well, they'll look lovely on her windowsill." } },
      choices = {
        { text = "I'm sorry, Martie.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Tame him? Oh, I'd love to see you try, so long as you do it well away from my rows. He's had every carrot in this garden and bitten the last man who waved a stick at him." } },
      choices = {
        { text = "Would you miss him?", next = "hunter_miss" },
        { text = "Maybe not, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    hunter_miss = {
      lines = { { id = "hm_default", text = "That's a wicked question, and I'll answer it anyway: a little. He's a horrible pig, but he's our horrible pig, and the town's talked about nothing else for a year." } },
      choices = {
        { text = "Then he stays wild.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    elune = { { id = "tp_elune", text = "A night elf lady passed through once and told me my daffodils looked like little moons. She said her goddess would like them, and I've been leaving one by the window since, in case she does." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "That night elf I mentioned spoke of a dream-place where the whole world grows the way it was meant to. I'd like to see my garden there, before the gnolls trampled it." } },
    holy_light = { { id = "tp_holy_light", text = "I put a sprig of rosemary on the Light's altar every week, because I think anything as warm as the Light must like something that smells nice. The priests haven't said I'm wrong." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells seeds from places I can't pronounce, and I bought a packet once that grew something purple and shy. It only blooms at night, and I sit out with a candle to see it." } },
    background = { { id = "tp_bg", text = "I keep the garden at the west end of town. It keeps me, too, some years." } },
    advice = { { id = "tp_ad", text = "Plant early, weed young, and never let a soldier name your boar." } },
    blackrock = { { id = "tp_blackrock", text = "They burned a farm last month, and the smoke went on all day; you could smell it over the lake." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They've never come for the garden, small mercies, but the boar's worse." } },
    _none = { { id = "tp_none", text = "I'm only a gardener, dear, so you'd best ask the Magistrate." } },
  },
}

P:NPC {
  key = "breanna", id = TODO_NPC("Chef Breanna"), name = "Chef Breanna",
  bible = "bibles/lakeshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "harried" }, values = { "generous", "practical" },
  notices = { "craft", "soldier" },

  impression = {
    first = "Chef Breanna feeds every soldier Stormwind has sent to Lakeshire and makes it plain there aren't nearly enough of them. Her kitchen runs like a barracks, only louder.",
    third = "{name} met Chef Breanna, who cooks for every soldier stationed in Lakeshire and wishes there were more of them.",
  },

  greetings = {
    { id = "g_pots", text = "If you're here to eat, sit; if you're here to help, wash your hands. If you're here to complain, Gretchen will see you out." },
    { id = "g_back", when = { metBefore = true }, text = "The goulash brought you back, or you've nowhere else to go. Either way, sit down." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you look like you've lived on hardtack the whole time. Sit down and eat before you fall over in my kitchen." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the guards was saying good things about you over his goulash, and he doesn't say good things about anyone. Sit down, then." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you've got someone in town properly cross with you. Leave it outside, because I'll not have shouting over my pots." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Crystal will want to meet you, since she teaches the craft. I just make enough of it to feed an army, and I mean an actual one." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "You eat like a soldier, I can tell from here, so I'll tell the kitchen to make it a big portion." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Far too few, and I feed them all, because Stormwind sends promises instead of men. Your spirits might help fill the gap." } },
      choices = {
        { text = "Then I'll fight for Lakeshire, Chef. Count me in.", next = "BACK", reply = "That's the spirit, and I'll count you among my hungry soldiers. Mind you come back in one piece.", fx = { align = { order = 1 } } },
        { text = "Stormwind's forgotten you. Look after yourselves.", next = "BACK", reply = "We are, and we have been for a year. Stormwind can come when it remembers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It is, and it'll be worse by winter if the gnolls keep the farms. I've had food go missing from the back door twice this month, and I'd lay odds it was hungry children, not soldiers, so I've started leaving a bit out on purpose." } },
      choices = {
        { text = "That's kind of you. Keep leaving it out.", next = "BACK", reply = "I will, and I'll pretend I don't notice who takes it. It's the least I can do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Lock the door. The soldiers need it more.", next = "BACK", reply = "The soldiers eat first, don't you worry, and the children get the scraps. I'll not lock a hungry child out of my kitchen.", fx = { align = { light = -1 } } },
        { text = "Something else, Breanna.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tarantula legs, goretusk flank and condor, and don't make that face, because it's the best stew in Redridge. The soldiers don't care what's in it, so long as it's hot and there's plenty." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Tarantula legs, goretusk flank and condor, and don't make that face, because it's the best stew in Redridge. Your {pet} will want a bowl of its own, {class}, and it can have one when you bring me back enough for the soldiers." },
      },
      choices = {
        { text = "I'll bring what you need. The soldiers come first.", next = "BACK", reply = "That's a good heart, and the soldiers will eat well tonight. Bring it to the back door.", fx = { align = { honor = 1 } } },
        { text = "I'll bring enough for me and my pet first.", next = "BACK", reply = "Fair enough, a hunter's got to eat. Bring the extra if you've any.", fx = { align = { honor = -1 } } },
        { text = "Something else, Chef.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Conjured food fills a soldier for a march, but it won't warm him like a bowl of my goulash will. Bring me spiders from the hills and I'll do the rest, and you can keep your magic for the orcs." } },
      choices = {
        { text = "Your kitchen, your way. I'll fetch spiders.", next = "BACK", reply = "That's the way, and the soldiers will be glad of it. Spiders from the hills, mind, not whatever crawls out of the lake.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic's faster. Hungry soldiers won't care.", next = "BACK", reply = "They'd care by the third day, I promise you. Bring me spiders and keep your magic.", fx = { align = { order = -1 } } },
        { text = "What goes in the goulash?", next = "goulash" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "My kitchen has a fire that never goes out, and it's called me getting up at four. If you're offering something from wherever your sort draws their fire, I'll thank you kindly and keep cooking on plain wood." } },
      choices = {
        { text = "Plain wood suits honest food.", next = "BACK", reply = "It does, and it always has. Thank you for understanding.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel fire cooks faster, you know.", next = "BACK", reply = "Faster, maybe, but my soldiers would taste it. Plain wood, thank you.", fx = { align = { light = -1 } } },
        { text = "How many soldiers do you feed?", next = "count" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Enough to stand, not enough to grow, and there's a difference you can see in their faces by the end of a week. I'd feed them twice as much if Stormwind sent half of what it promised, and I've told the Magistrate so in words he had to write down twice." } },
      choices = {
        { text = "Stormwind will provide. Ration carefully until it does.", next = "BACK", reply = "I'll ration, and I'll keep writing. Stormwind will provide when it remembers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget Stormwind's promises. Take what the soldiers need.", next = "BACK", reply = "I'd take it gladly if there were anything out there to take. I'll make do with what we've got, as always.", fx = { align = { order = -1 } } },
        { text = "Something else, Chef.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Blackrock camps eat everything that walks, and what they don't eat the gnolls do, so the deer have gone up past Stonewatch where nobody follows. Sherman brings me what he can, but a butcher can't cut what nobody can catch." } },
      choices = {
        { text = "Hunt only what the hills can spare, or nothing will be left.", next = "BACK", reply = "That's wise, and Sherman would agree with you. I'll stretch what we've got.", fx = { align = { order = 1 } } },
        { text = "Your soldiers come first. Take whatever the hills have.", next = "BACK", reply = "They do, and I'll take whatever Sherman brings. The hills can recover later.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Breanna. I feed goulash to every soldier Stormwind's stationed in Lakeshire, and they're hungry, and there aren't nearly enough of them, and both of those are problems." },
        { id = "h_goulash", tags = { "news" }, when = { questActive = TODO_QUEST("Redridge Goulash") },
          text = "Goulash? My cupboard's bare; I fed the whole Stormwind brigade through the last attack. Bring me condor, spider and goretusk snouts, and your bowl's the first one filled." },
        { id = "h_goulash_done", when = { questDone = TODO_QUEST("Redridge Goulash") },
          text = "The pot's full again. You had your bowl, then the garrison smelled the rest and lined up, and that's how goulash works." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves eat goulash? Course you do; everyone eats goulash in Lakeshire, because it's that or the lake." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! At last, someone who can bring me something besides complaints, because I've a hundred soldiers to feed and nothing in the pot." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Sit down and eat, because I'll not have it said that the Silver Hand left my kitchen hungry." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! If you know where the boar have gone in these hills, tell me, because my soldiers have eaten nothing but lake trout for a week." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue in my kitchen. If you're after the pantry, you'll find it empty, because every scrap goes to the soldiers before you could lift it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Sit down and eat, because there aren't nearly enough soldiers in Lakeshire, and I'll feed anyone who fights beside them." },
      },
      again = {
        { id = "h_again", text = "What else, dear? You can talk while I get on with the chopping." },
        { id = "h_again2", text = "Go on. The onions won't cut themselves, and my eyes are streaming already, so don't take it personal." },
      },
      choices = {
        { text = "How are the soldiers?", next = "soldiers" },
        { text = "That goulash smells of something I can't place.", next = "goulash" },
        { text = "Who works your kitchen?", next = "kitchen" },
        { text = "I cook. Can I lend a hand?", next = "cook", when = { profession = "Cooking" } },
        { text = "Shall I bless the pot?", next = "priest", when = { class = "PRIEST" } },
        { text = "I've eaten army rations. This is a feast.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I could conjure food for your soldiers, Chef.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What meat do you need for the soldiers' stew, Chef?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your kitchen could use a fire that never goes out.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers you feed get enough to fight on, Chef?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The hills seem empty of game this season.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is food really that short in Lakeshire, Breanna?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are there too few soldiers in Lakeshire, Chef?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Smells good.", next = "END", fx = { affinity = 1 } },
      },
    },
    soldiers = {
      big = true,
      lines = {
        { id = "s_default", text = "Tired and thin. They eat like it might be their last hot meal, and some days it is. Stormwind keeps promising more of them; I keep cooking for the ones I've got." },
      },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "More are coming.", next = "coming" },
        { text = "How many do you feed?", next = "count" },
      },
    },
    coming = {
      lines = { { id = "c_default", text = "So everyone says. I'll set an extra pot on when I see them on the bridge, and not before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    count = {
      lines = { { id = "ct_default", text = "As many as Stormwind sends, which isn't enough, and as many as come back, which is fewer. I've stopped setting places by name." } },
      choices = {
        { text = "That's a hard thing to carry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goulash = {
      lines = { { id = "gl_default", text = "Condor, spider, and the snout off a great goretusk. Don't make that face; the snout's where the flavour lives." } },
      choices = {
        { text = "Spider?", next = "spider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spider = {
      lines = { { id = "sp_default", text = "Crisp spider, and it crunches. Everyone has seconds, and nobody asks what's in it twice." } },
      choices = { { text = "I'll take your word for it.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    kitchen = {
      lines = { { id = "k_default", text = "Crystal teaches cooking to anyone who'll stand still, and Gretchen carries plates and opinions. I do the rest, which is most of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Then you know a bare cupboard when you see one. Bring the meat and I'll show you the recipe, because that's how kitchens trade." } },
      choices = {
        { text = "Deal.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Bless it if you like. Then bless the ones eating from it; they need it more than the pot does." } },
      choices = {
        { text = "I'll bless them both.", next = "BACK", reply = "Bless you, and the soldiers will feel it, I'm sure. Now pass me that ladle.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A blessing won't fill anyone's stomach.", next = "BACK", reply = "No, but it doesn't hurt either. I'll fill them with stew, and you can do the rest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Then you know why I fight so hard over a pot of goulash. A soldier on hard biscuit loses heart a day before he loses the wall, and I won't have it in my kitchen." } },
      choices = {
        { text = "A full belly wins more fights than a sharp sword.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    second_war = { { id = "tp_second_war", text = "I was a cook in the army in the Second War, and I fed men who went out and didn't come back to eat. I swore then I'd never let a soldier go out hungry, and I haven't." } },
    bolvar = { { id = "tp_bolvar", text = "Tell the Highlord I'm feeding a garrison on what a garrison half this size would eat. That's not a complaint, it's a sum, and he can check it himself." } },
    booty_bay = { { id = "tp_booty_bay", text = "I'd trade my best knife for a crate of Booty Bay spice, because half my soldiers have forgotten what pepper tastes like. The orcs on the road aren't interested in my menu." } },
    holy_light = { { id = "tp_holy_light", text = "I say grace over every pot that leaves this kitchen, loud enough for the soldiers to hear. The Light doesn't fill bellies, but it does make thin soup go down easier." } },
    background = { { id = "tp_bg", text = "I cook for Lakeshire's garrison, with the same pots as before the attacks and a good many more mouths." } },
    advice = { { id = "tp_ad", text = "Eat when there's food, because in Redridge that isn't every day." } },
    blackrock = { { id = "tp_blackrock", text = "I count the bowls that don't come back to the kitchen. That's how I know how the fighting's going." } },
    _none = { { id = "tp_none", text = "Ask someone who isn't up to her elbows in onions." } },
  },
}
