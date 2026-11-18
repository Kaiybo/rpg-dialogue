-- Stormwind, the Trade District: the wine barker, the cheese mistress, the shops on the square,
-- the town crier, the gryphon master, the apothecary and the armory. Voice: bibles/trade_district.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "renato", id = TODO_NPC("Renato Gallina"), name = "Renato Gallina",
  bible = "bibles/trade_district.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "proud", "friendly" },
  notices = { "light", "kin", "drink" },
  impression = {
    first = "Renato Gallina sells his family's wine to the whole Trade District square at the top of his voice. He'd decided I had discerning taste before I'd said a word, which I suspect he decides about everyone.",
    third = "{name} met Renato Gallina, who cries the Gallina Winery's wine across the Trade District square.",
  },

  barks = {
    { id = "b_wine", text = "The Gallina Winery, friends, just down by the canals! The finest wine in Stormwind, and I'll argue with anyone who says otherwise!" },
  },

  greetings = {
    { id = "g_wine", text = "My friend! You have the look of someone who knows a good glass of wine when it's put in front of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did my sister treat you well? Tell everyone you meet, and tell them twice." },
    { id = "g_away", when = { away = 14 }, text = "My friend, you've been gone {away}! The wine has aged without you, and I confess it aged rather well, so you must come and taste it." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round in the city! A silver tongue, my friend, and I could use one like it shouting for the winery." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "There's talk in the square that somebody bought a fine story from you. In my trade we call that salesmanship, but my sister calls it something worse." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest! The Cathedral pours wine on holy days, you know, and I've always thought it deserved better than what they pour. Tell the Archbishop the Gallinas would be honoured." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "You're a Stormwind face, I can tell, so you've no excuse never to have tried our red. It's a crime against your own city, friend." },
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "A dwarf, and a dwarf who'll tell me wine is for elves, I expect. Try a glass before you say it, and then say it if you still can." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ah, you've started without us! Not on Gallina wine, though, I can smell that from here, and it's a shame." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My sister Suzetta keeps a tally, and she sighs, but good wine wants sharing! Your spirits would agree, surely." } },
      choices = {
        { text = "Sharing's generous, but pay your sister her due.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pour freely, Renato. Generosity always returns.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The very best, friend, because they sit up all night in cold cellars reading cursed books, and a man in a cold cellar learns to appreciate a full-bodied red. My sister says I'm not to give free bottles to anyone from the Slaughtered Lamb, but my sister is not here, and you have such a discerning face." },
      },
      choices = {
        { text = "I'll pay for the bottle, Renato. Your sister's right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll take the free bottle, before she comes back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Renato.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The land, the sun and my family's sweat, friend, and the boars eat the rest! Taste it and tell me you can't hear the hills of Elwynn in it, though I warn you most people only hear me." } },
      choices = {
        { text = "A wine that honours its soil is worth every coin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wine is wine, Renato. Don't sell me poetry.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a whole cask, rolled down the canal steps in the middle of the night by two boys who couldn't have been fifteen. Suzetta caught them at the bottom, and now they work for her, and I swear they're the best barrel men we've ever had." } },
      choices = {
        { text = "They should've gone to the Stockade. A thief's a thief.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good of her. A second chance beats the Stockade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More than the soldiers, and the soldiers drink like sponges, so you can imagine. Every tower in the Sanctum sends down for a bottle each week, though I'd thank you not to tell them I said so." } },
      choices = {
        { text = "A mage should keep a clear head. I'll pass.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Study goes better with a glass of red, Renato.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Officers, mostly, because the privates can't afford a bottle, which I think is a terrible injustice. When a man's marching off to Redridge, he deserves something better than the Pig and Whistle's watered ale." } },
      choices = {
        { text = "Then sell them a cheaper bottle, Renato. They've earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fine wine is for those who can pay. That's business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They're devouring them, my friend, every grape and the vines besides! I've asked the guards and the guards laugh, so I'm left to ask honest hunters, and here you are, looking very honest indeed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And this must be {pet}! A noble beast, and I'd wager a vintage it could frighten off a boar or two if it had a mind to." },
      },
      choices = {
        { text = "I'll drive them off, and leave the sows with young.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every boar I find will end up on a spit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Ruin it? It's building it! Every hero who drinks a free Gallina tells ten friends, and those ten pay full price, or so I keep telling Suzetta, who doesn't believe me." } },
      choices = {
        { text = "I'll pay for my bottle, Renato. Your sister deserves fair dealing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A free bottle's a free bottle. I'll take it gladly.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Here, a ticket for a free bottle, because a hero should never have to pay for a good red, and don't tell my sister." },
        { id = "h_default", key = true,
          text = "Renato Gallina, at your service! My family keeps the Gallina Winery along the canals, and if you've drunk better wine in Stormwind, I'd like to know who poured it. Take a ticket, friend, and your first bottle's free." },
        { id = "h_ticket", tags = { "news" }, when = { questActive = TODO_QUEST("Wine Shop Advert") },
          text = "You've still got my ticket, good! Take it down to the canals and give it to my sister Suzetta, and she'll hand you a bottle of the house red for nothing." },
        { id = "h_ticket_done", tags = { "news" }, when = { questDone = TODO_QUEST("Wine Shop Advert") },
          text = "So, you tried it? Don't tell me, I can see it on your face. That's the face of a customer for life, friend." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The square's quiet at this hour, so I'm shouting for the night watch. They never buy, but somebody has to keep the habit up." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The Cathedral's own, in my square! Wine and the Light have kept company a long time, and I'd hate to come between them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ah, a light-fingered look, and in my square! I'll keep the bottles close, friend, and you keep your hands where the wine can see them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! The Mage Quarter buys my red by the case, you know, because they say it clears the head after a long day's study. I say it does the opposite, and they're welcome to it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Every hero in the old stories drank wine before the battle, and I'm happy to report the Gallinas have kept that tradition alive." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Tell me, have you seen the vineyards outside the city? The boars are at them again, and Roberto's beside himself." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in my square! Oh, you'll appreciate this, friend, because a good wine is only the land in a bottle, and nobody knows the land like your people." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, a connoisseur of the dark arts, and I'd wager a connoisseur of a fine dark red as well! Come, come, taste this." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman with discerning taste, I can tell! Do your spirits prefer a red or a white? Try both, my friend!" },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've a square full of customers who don't know it yet." },
        { id = "h_again2", text = "Go on, ask me anything. Wine first, if you can manage it." },
      },
      choices = {
        { text = "You mentioned a free bottle.", next = "offer", when = { ["not"] = { questDone = TODO_QUEST("Wine Shop Advert") } } },
        { text = "Why should I believe it's the best?", next = "best" },
        { text = "You can't run the winery alone.", next = "family" },
        { text = "You must shout like this all day.", next = "square" },
        { text = "Wine and the Light do keep company.", next = "priest", when = { class = "PRIEST" } },
        { text = "Dwarves drink ale, Renato, not wine.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Has anyone ever stolen from the Gallina Winery?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I wouldn't have thought mages drank much wine.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do soldiers really drink your wine, Renato?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are the boars really ruining the Gallina vineyards?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Won't giving bottles away ruin the winery, Renato?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is wine really only the land in a bottle, Renato?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks have good taste in wine, Renato?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does your family mind you giving wine away, Renato?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today, Renato.", next = "END" },
      },
    },

    offer = {
      lines = { { id = "o_default", text = "One bottle, on the house, for anyone with my ticket in their hand. Once you've tasted it you'll come back and pay for the next one, and that's the whole of my scheme." } },
      choices = {
        { text = "I'll need to know where to take it.", next = "offer_where" },
        { text = "Nothing's ever free, Renato.", next = "offer_doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    offer_where = {
      lines = { { id = "ow_default", text = "Down where the Trade District meets the canals, the shop with the barrels outside. Ask for Suzetta; she keeps the books and she'll pretend to sigh at you, but she'll pour." } },
      choices = {
        { text = "Free wine is free wine. I'll go.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    offer_doubt = {
      lines = { { id = "od_default", text = "Nothing but that bottle, friend, I promise you. The rest costs coin, and Suzetta will make sure of it, because she likes my generosity a good deal less than I do." } },
      choices = {
        { text = "An honest pitch, and I like that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hook them cheap and bleed them later. Smart.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },

    best = {
      lines = { { id = "b2_default", text = "Because I've drunk all the others, friend, in the name of fairness. The Pig and Whistle's red would strip the paint off a ship, and the nobles drink whatever's dearest, which isn't the same thing at all." } },
      choices = {
        { text = "What's wrong with dear wine?", next = "best_nobles" },
        { text = "A barker's word is worth what it costs.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_nobles = {
      lines = { { id = "bn_default", text = "Nothing, if you like paying for the label. The House of Nobles would drink vinegar from a gold cup and call it a vintage, and my family would rather sell honest wine to honest people." } },
      choices = {
        { text = "Honest wine for honest people. Well said.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The nobles keep this city running, wine and all.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },

    family = {
      lines = { { id = "f_default", text = "Suzetta runs the shop and Julia minds the counter, and Roberto down in the cellar knows more about merlot than any man alive. I'm the voice, because somebody in the family had to be loud." } },
      choices = {
        { text = "Who buys the merlot?", next = "family_merlot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_merlot = {
      lines = { { id = "fm_default", text = "Taverns, mostly, and some from far off. Barkeep Daniels in Lakeshire sends for a cask whenever the roads let him, though with orcs on the hills, they don't let him often." } },
      choices = {
        { text = "I've carried a cask to Lakeshire.", next = "BACK", when = { questDone = TODO_QUEST("Dry Times") }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    square = {
      lines = { { id = "s_default", text = "From the morning bells until the lamps are lit. The Trade District square sees every soul who comes into Stormwind, sooner or later, and I mean to say hello to all of them." } },
      choices = {
        { text = "Doesn't your voice give out?", next = "square_voice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    square_voice = {
      lines = { { id = "sv_default", text = "Not yet, though the town crier gives me filthy looks. Goodman thinks the square's his to shout in, and I think a man with wine to sell has the better reason." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      lines = { { id = "pr_default", text = "Then you'll understand me when I say a good red is a small kindness of the Light. Not a sermon, mind, I leave those to you, but a kindness all the same." } },
      choices = {
        { text = "A small kindness, in moderation.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather keep my kindnesses sober.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    dwarf = {
      lines = { { id = "dwarf_l", text = "Only because nobody ever poured them a proper Gallina red! Try the house red, friend, one cup, and if you don't say it's better than Thunderbrew, I'll eat this ticket." } },
      choices = {
        { text = "Nothing's better than Thunderbrew.", next = "dwarf2", fx = { trait = { stern = 1 } } },
        { text = "One cup, then.", next = "dwarf2", fx = { affinity = 1 } },
      },
    },
    dwarf2 = {
      lines = { { id = "dwarf2_l", text = "Ha! I'll convert Ironforge one beard at a time, you'll see, and then Suzetta will have to admit my tickets were good business." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I sold wine at the Darkmoon Faire last summer, and I gave away only half of it, which Suzetta says is a record for me. The fire-eaters loved it, and that's the finest compliment a wine can have." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay buys our wine by the barrel, and the goblins sell it to pirates, and the pirates sing about it. That's fame, my friend, and fame is worth more than any tally Suzetta keeps." } },
    gilneas = { { id = "tp_gilneas", text = "Gilnean wine was our only rival in the north, and now it's all behind their wall. I miss the competition, and I don't miss it at all, which is a very Gallina sort of feeling." } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran were our finest customers, and they had the most refined palates in the world. When they open their gates again, I'll be first in line with a case of our best." } },
    knows = { { id = "tp_knows", text = "A man who stands in the Trade District all day hears everybody's business whether he wants to or not. Ask, and I'll tell you what the square's been saying." } },
    background = { { id = "tp_bg", text = "I'm a Gallina, and the Gallinas sell wine. The rest is just the years I've spent shouting about it.", next = "family" } },
    advice = { { id = "tp_ad", text = "Never buy wine from a man who won't drink it in front of you. I drink mine in front of everybody, friend, and I've never once been sick from it." } },
    trade = { { id = "tp_tr", text = "Wine, red and white, by the bottle or the cask, at the winery along the canals. I only sell it with my mouth; my sisters sell it with their hands.", next = "offer" } },
    _none = { { id = "tp_none", text = "That's not something a wine man knows, friend. Ask me about grapes and I'll talk till dusk." } },
  },
}

P:NPC {
  key = "elaine_trias", id = TODO_NPC("Elaine Trias"), name = "Elaine Trias", title = "Mistress of Cheese",
  bible = "bibles/trade_district.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "practical", "cunning" },
  notices = { "light", "kin", "watch" },
  impression = {
    first = "Elaine Trias makes the cheese her husband sells, and she watches the shop's stairs as closely as the counter. Very little gets past her, and she let me see that on purpose.",
    third = "{name} met Elaine Trias, the Mistress of Cheese in the Trias family's Trade District shop.",
  },

  greetings = {
    { id = "g_cheese", text = "Good day. If you're here for cheese, you're in the right place, and if you're here for anything else, you're still buying cheese." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The cheddar remembers you, and so do I." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest in a cheese shop. If you'd like to bless the cellar, Elling won't object, though he'll want to watch you do it." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A Stormwind face. You'll have eaten my cheese before, then, whether you knew it or not; every tavern from Goldshire to the Lion's Pride buys from us." },
    { id = "n_rogue", cat = "watch", when = { class = "ROGUE" },
      text = "You looked at my stairs before you looked at my cheese. Most people do it the other way round, and the ones who don't usually end up as friends of my husband's." },
    { id = "n_elf", cat = "kin", when = { race = "NightElf" },
      text = "We sell a Darnassian bleu, you know, and I'd value a kaldorei opinion of it. Elling says it has opinions of its own." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Nothing that concerns cheese buyers. I make the cheese, Elling sells it, and the rest is our business. Your spirits can keep out." } },
      choices = {
        { text = "Your business is your own, Elaine. I'll respect that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Secrets on the stairs? Someone ought to look.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because everyone's does sooner or later, and yours would get there first. I'll tell you what I tell them, which is that the stairs are steep and the cheese is down here." } },
      choices = {
        { text = "If something's hidden up there, the guards ought to know of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your stairs are your own business, Elaine. I trust you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Mostly the soft ones, because they forget to eat until midnight and then complain that the Sanctum's kitchens have closed. Elling says if the Quarter spent less on books and more on bread, the city would have fewer hungry scholars and more grateful ones." } },
      choices = {
        { text = "The city should feed its scholars, and everyone else too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Scholars can buy their own bread like anyone else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I mind anyone who frightens the other customers, and your imps frighten them. But Elling says the Lamb's people pay on time and tell no tales, which is more than he can say for some of the nobles." } },
      choices = {
        { text = "Then I'll come alone next time and keep the peace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they frighten easily, that's their own concern.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Salt, age and a good hard rind, and a recipe I learned from a dwarf in Ironforge who'd fought in the Second War. He said it fed his whole company for a month in the Alterac mountains, and I believe him." } },
      choices = {
        { text = "Good provisions win wars. I'll take a wheel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take meat over cheese on the march.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When a hunter brings it in, I do, and nothing goes better with a slice of sharp than a strip of venison. Ben eats more of it than he sells, but that's sons for you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has its nose in the air, and I know exactly why. I'll not give it any, mind, or it'll be at my door every morning." },
      },
      choices = {
        { text = "I'll bring you good venison, fairly taken.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep my venison. Cheese doesn't need it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every week, a wheel for the orphans and one for the brothers, and the Cathedral pays in prayers more often than coin. Elling grumbles, but he carries it there himself, and I've seen him linger at the door." } },
      choices = {
        { text = "Kindness like that is its own blessing, Elaine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't pay your suppliers. Charge them, Elaine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My family's business, which is cheese, and a few other things that are none of yours. Let's say we help the kingdom in our own way, and leave it there, shall we?" } },
      choices = {
        { text = "I'll ask no more. A family's secrets are its own.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it's lawful, you'd have no reason to hide it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want the soft cheese for the orphans, I expect, which is what the Cathedral always sends for." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in my shop. I'm sure you're here for cheese, {class}, and I'm sure you'll keep your eyes off my stairs." },
        { id = "h_default", key = true,
          text = "Elaine Trias. I make the cheese, my son Ben sells it, and my husband Elling stands at the counter looking trustworthy, which is harder work than it looks." },
        { id = "h_philmor", tags = { "news" }, when = { questActive = TODO_QUEST("Philmor's Favor") },
          text = "From the harbor? Philmor sends his crates with whoever's willing these days. Carry it upstairs to the stockroom door, please, and don't set it down until you're there." },
        { id = "h_philmor_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Philmor's Favor"), days = 3 } },
          text = "The Gatehouse shipment arrived in one piece, thanks to you. I'll tell Philmor his new dockhand has good knees." },
        { id = "h_gatehouse", tags = { "news" }, when = { questActive = TODO_QUEST("Gatehouse Goods") },
          text = "The Gatehouse's goods, yes. Take them as they are and ask me nothing about them, and we'll both have a pleasant afternoon." },
        { id = "h_elling", when = { heardLine = "elling.h_default" },
          text = "You've met Elling, then, and he told you he only sells cheese. He says it beautifully, doesn't he? I've been listening to him say it for years." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "We're closing, so be quick. The cheese is going to bed, and so am I, eventually." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll be wanting something that keeps on the road. Don't conjure cheese at me, please; I've tasted it, and it's an insult." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've a smell of sulphur about you, and I'll have to air the shop out after. Buy something, at least, so the airing's worth it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll be wanting something that keeps in a pack, and nothing keeps like my dwarven sharp; ask any soldier in the Barracks." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I'd wager you've some game to trade. Elling won't tell you this, but I smoke the best venison in the Trade District." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'd guess you've a nose sharper than any guard's, so you'll know there's nothing upstairs but cheese." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Elling sells cheese. Only cheese. I watch the stairs, so don't let your spirits wander up them." },
      },
      again = {
        { id = "h_again", text = "Anything else? Cheese questions are free; the cheese isn't." },
        { id = "h_again2", text = "Ask what you like; I can wrap a wheel of cheddar and listen at once." },
      },
      choices = {
        { text = "Let me see your cheese.", next = "BUSINESS" },
        { text = "I'd guess you make all of this yourself.", next = "craft" },
        { text = "There's something upstairs, I'd guess.", next = "upstairs" },
        { text = "Ben seems to be learning the trade.", next = "ben" },
        { text = "I've a shipment from the harbor.", next = "shipment",
          when = { any = { { questActive = TODO_QUEST("Philmor's Favor") }, { questActive = TODO_QUEST("Gatehouse Goods") } } } },
        { text = "I have business with your husband, of a sort.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do mages buy much cheese, Elaine?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your cheese seems made for soldiers, Elaine.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you smoke game alongside your cheese, Elaine?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you mind the Lamb's people shopping here?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you send cheese to the Cathedral, Elaine?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's upstairs that needs watching, Elaine?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would you think my nose would wander upstairs, Elaine?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What's up those stairs, Elaine?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    craft = {
      lines = { { id = "c_default", text = "Every wheel. The cheddar ages in our own cellar, the gouda's my mother's way of doing it, and the bleu is the one I'm proudest of, because it took me the longest to get right." } },
      choices = {
        { text = "What makes a good cheese?", next = "craft_good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_good = {
      lines = { { id = "cg_default", text = "Patience, cold and keeping your hands off it. Most people can manage the cold, and very few can manage the patience, and so most people buy their cheese from me." } },
      choices = {
        { text = "Patience is a virtue I respect.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    upstairs = {
      big = true,
      lines = { { id = "u_default", text = "The stockroom. The Gatehouse keeps its deliveries up there, and they come and go more discreetly than cheese, for the guard officers' ceremonies and such. It isn't a room for customers." } },
      choices = {
        { text = "Ceremonies. Of course.", next = "upstairs_cover" },
        { text = "A shop shouldn't keep secrets from the city.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "What the guard keeps is the guard's business.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    upstairs_cover = {
      lines = { { id = "uc_default", text = "Of course. The guard's officers are very fond of surprises, and surprises have to be kept somewhere. You've a good ear for how things are said; Elling would like you." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ben = {
      lines = { { id = "b_default", text = "He likes the selling and hates the waiting, which is the wrong way round for a cheesemaker. He'll learn, or he'll take over the counter and leave the cellar to me, which suits me well enough." } },
      choices = {
        { text = "Elling seems a friendly sort.", next = "ben_elling" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ben_elling = {
      lines = { { id = "be_default", text = "Elling tastes everything, tells every customer it's only cheese and has a remarkable number of friends for a cheesemaker. I married him knowing all three." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    shipment = {
      lines = { { id = "sh_default", text = "Up the stairs, to the stockroom door, and set it down there yourself. I don't carry crates upstairs, and until it's on that landing it's yours to drop and yours to answer for." } },
      choices = {
        { text = "What's in it?", next = "shipment_contents" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shipment_contents = {
      lines = { { id = "sc_default", text = "Things for the Gatehouse, which is all the label says and all I need to know. If you need to know more, there's a man in Old Town who'll ask you why." } },
      choices = {
        { text = "Then I don't need to know.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I carry things I can't see; I'll look if I like.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    rogue = {
      lines = { { id = "r_default", text = "Then buy a quarter of cheddar and take the long way home, and someone will find you if they want you. That's how it's done in this shop." } },
      choices = { { text = "A quarter of cheddar, then.", next = "BUSINESS", fx = { affinity = 2 } } },
    },
  },

  topics = {
    the_stockade = { { id = "tp_the_stockade", text = "The prisoners have the Stockade, and I'm told a few of them are friends of friends. I keep my shop's stairs well watched, and I'd advise everyone in the Trade District to do the same." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate sent a man to my shop once, very polite, asking about the cellar. I sent him away with a wheel of cheese, and I've had the cellar watched ever since." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "I've heard of Ravenholdt, and I've heard enough to know I'd rather not hear more. Some names are best left unspoken in a cheese shop." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor buys her cheese from us, through a servant who never smiles. I've never seen her myself, which is odd for a lady with such fine taste." } },
    knows = { { id = "tp_knows", text = "I hear what's said across the counter and a little of what's said upstairs. Ask, and I'll tell you what a cheesemaker can." } },
    background = { { id = "tp_bg", text = "I make cheese, I married a cheesemaker's husband, and I raised a cheesemaker's son. That's the story I tell, and it's a good one.", next = "craft" } },
    advice = { { id = "tp_ad", text = "Keep your hands off what's aging, whether it's cheese or a plan. Poke at either and it spoils." } },
    trade = { { id = "tp_tr", text = "Cheddar, gouda and a Darnassian bleu, all made here. Elling will tell you the same, in a great many more words.", next = "craft" } },
    si7 = { { id = "tp_si7", text = "I've heard the name. Old Town's full of names, and I'm in the Trade District, selling cheese." } },
    _none = { { id = "tp_none", text = "That's not a cheese question. Elling might know; he knows a remarkable number of things for a cheesemaker." } },
  },
}

P:NPC {
  key = "mullby", id = TODO_NPC("Thurman Mullby"), name = "Thurman Mullby", title = "General Goods",
  bible = "bibles/trade_district.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "warm" }, values = { "practical", "hardworking" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Thurman Mullby keeps a list of everything travellers forget to pack and reads it aloud to anyone who stands still. He sold me water and a bag I hadn't known I needed.",
    third = "{name} met Thurman Mullby of Everyday Merchandise, who sells the Trade District what it forgot to pack.",
  },

  greetings = {
    { id = "g_goods", text = "Everyday Merchandise, friend, and everything you'll wish you'd brought, right here on the corner." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Priests always pack candles and forget water. I don't know why, but you're the twentieth this month, so let me sell you a skin." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City born or Elwynn born, you'll know the corner shop, then. My counter's been here longer than the auction house next door." },
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "Light's sake, friend, you're carrying nothing at all. Start with a bag, and we'll work our way up from there." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Water, always, and a spare bag. Even shamans need to drink, I'd wager, whatever the water spirits say." } },
      choices = {
        { text = "A prepared traveller lives longer. Thanks for the advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll trust my spirits to provide. They always have.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Food, nearly always, because your sort get so caught up in your circles and your candles that you forget the body needs feeding as well as the demon. Then it's rope, because things that are summoned sometimes need tying, and then it's a spare cloak, because the first one always gets scorched." },
      },
      choices = {
        { text = "Bread, rope and a cloak, then. Good advice, Thurman.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I need none of it. My demon carries what I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Thurman.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Coin, mostly, because a bear has no pockets, and you'd be amazed how many of your people reach my counter with nothing but leaves in their hands. Rope, too, because even a druid has to tie something down eventually." } },
      choices = {
        { text = "Fair point. Even a druid needs a little forethought.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land gives me all I need. I'll keep carrying nothing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "For walls, windows and getting out of the places you shouldn't have got into, which is most of them. I sell it to adventurers and burglars alike, and I've stopped asking which is which, because they all say adventurer." } },
      choices = {
        { text = "I'm an adventurer, Thurman, and that's the honest truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Most of us are a bit of both, I reckon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the spell runs dry when you do, and I've sold a skin to every mage who ever fainted in the Badlands thinking they'd conjure another drink in a minute. They come back sunburnt and sheepish, and they always buy two." } },
      choices = {
        { text = "Then I'll carry water and plan properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll trust my magic. Waterskins are for the unprepared.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Water, which you'd think nobody would forget, but they do, because they're thinking about the fight. A warrior who's thirsty swings slower, and a warrior who swings slower doesn't come back to buy more water." } },
      choices = {
        { text = "I'll never march without water again.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find water on the road. Always do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good bag, plenty of salt and a sharp skinning knife, and most hunters remember the knife and forget the salt. A hide goes off in a day without it, and then all you've got is a smelly fur and a long walk home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And food for {pet}, of course, if you're not hunting enough for two. Don't forget it; nobody wants to share a camp with a hungry beast." },
      },
      choices = {
        { text = "My pet eats before I do, every time.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My pet can hunt its own dinner.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Food, mostly, because they spend all day tending others and forget they've a stomach of their own. I've a list of it, and the top of the priest page says bread, then water, then more bread." } },
      choices = {
        { text = "Caring for others is worth an empty stomach now and then.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. A healer must look after themselves first.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oil, rope and patience, in that order, and the last one I can't sell you. The young knights come in a hurry, buy half of what they need and ride off to save someone, and I see them a week later with rusted greaves." } },
      choices = {
        { text = "Then sell me everything on the list. Preparation is a duty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "When someone needs saving, there's no time for lists.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll have forgotten candles, I expect, every priest does, and bandages, and a spare pair of socks." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll have remembered your hammer and forgotten the oil for your plate, I'd wager, because they always do." },
        { id = "h_default", text = "Thurman Mullby. Water, bread, bags and the little things, and if you're going out through the gate, I can tell you what you've forgotten before you've forgotten it." },
        { id = "h_back", when = { metBefore = true }, text = "Back for more? Then you've learned the road eats bread faster than any traveller expects." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late shoppers are the ones who forgot something, so let's find out what it was." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so I'll guess you've forgotten nothing and brought nothing, because you travel light. Rope, though; your sort always forgets rope." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'll tell me you can conjure water, and you can, but you can't conjure a waterskin to carry it in, can you?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Off through the gate, are you? You've forgotten your flint, or your bandages, or a spare bowstring for the camp, I'd bet on it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, headed out. You'll want salt for the hides and twine for the snares, and I'll bet you've forgotten at least one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Now, your sort never forgets anything, because you carry nothing, and that's very bad for business." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Now, you'll have forgotten soul shards, and I don't sell them, but you'll have forgotten bread too, and I do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Do you have everything? Water, rope, bandages? Your spirits won't carry your pack for you, I'd guess." },
      },
      again = {
        { id = "h_again", text = "Anything else on your list? Or shall I read you mine?" },
        { id = "h_again2", text = "What else, friend?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "People forget all sorts of things, I expect.", next = "list" },
        { text = "There's someone at the other counter.", next = "edna" },
        { text = "I can't think why a rogue would need rope, Thurman.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a mage need a waterskin?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd guess warriors forget things too, Thurman.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does a hunter need most on the road, Thurman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do priests forget most on the road, Thurman?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a paladin usually forget, Thurman?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What could a druid possibly forget to pack, Thurman?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do warlocks usually forget, Thurman?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do travellers forget most, Thurman?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Nothing, thanks.", next = "END" },
      },
    },
    list = {
      lines = { { id = "l_default", text = "Water first, always, because nobody thinks of it until they're thirsty in Westfall. Then bags, because they always find more than they can carry, and then something to eat that isn't the thing they just killed." } },
      choices = {
        { text = "And you sell all three.", next = "list_sold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    list_sold = {
      lines = { { id = "ls_default", text = "I do, and I'm not ashamed of it. A man can be honest and well stocked both, and the honest part is telling you to buy two skins instead of one." } },
      choices = {
        { text = "Good advice is worth the coin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Advice that sells more water is just a sales pitch.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    edna = {
      lines = { { id = "e_default", text = "Edna Mullby, with the trade supplies: thread, flux, salt and the like, for crafters. She'll tell you she's the brains of this shop, and I've learned not to argue in front of customers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's folk buy more water than anyone in Stormwind, and they never say why. I suspect it's the fire-eaters, though I've never asked." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Water in Gadgetzan costs more than ale in Stormwind, so I'm told, and the goblins don't apologise for it. I've added an extra waterskin to my list, for anyone going that way." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a long way from here, and travellers forget half their kit on the way. I keep a list of what they forget, and I'll read it to you, if you've a minute." } },
    camping = { { id = "tp_camping", text = "Everyone forgets a bedroll, and everyone regrets it on the first cold night. I've sold more bedrolls than anything else, and I've never once been thanked for the warning, only for the bedroll." } },
    knows = { { id = "tp_knows", text = "I hear what people say while they count their coins, and folk say all sorts with their purse open. Ask away." } },
    background = { { id = "tp_bg", text = "A shopkeeper on a corner, and glad of it. Not much of a story, but it's a steady one." } },
    advice = { { id = "tp_ad", text = "Two waterskins, always. You'll drink one and spill the other, and you'll thank me for both." } },
    _none = { { id = "tp_none", text = "I sell bags, friend, not answers. Try the crier; he'll tell you anything at all." } },
  },
}

P:NPC {
  key = "gunther_weller", id = TODO_NPC("Gunther Weller"), name = "Gunther Weller", title = "Weapons Merchant",
  bible = "bibles/trade_district.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "proud", "honest" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Gunther Weller judges a buyer by how they hold a blade, not by what they say about it. He has little patience for shine and endless patience for balance.",
    third = "{name} met Gunther Weller of Weller's Arsenal, a blunt weapons merchant by the auction house.",
  },

  greetings = {
    { id = "g_arsenal", text = "Weller's Arsenal. Look all you like, and pick it up before you buy it." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. You'll want a mace, then, or a staff; the Church has rules about edges, and I've stopped asking why." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind steel for a Stormwind hand. You'll find nothing on these walls made further off than Ironforge." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that. You've been hitting stone with it, or something harder, and it's telling you so." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Balance, not shine. A shaman needs a weapon that answers like the elements do: honest and steady." } },
      choices = {
        { text = "Honest balance beats any shine. I'll pick carefully.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Shine sells, Gunther. Don't knock it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A dagger for the close work and a staff for the walking, and nothing heavier, because I've watched warlocks swing a sword and it's an embarrassment for everyone. Marda says I'm too blunt with your sort, but a blunt word is cheaper than a funeral." },
      },
      choices = {
        { text = "A dagger and a staff, then. Your word's worth having.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll carry what I please, Gunther.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gunther.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Yours shifts, because you never know what you'll be standing on, two feet or four. A swordsman trains one stance until it's carved into him, and I've not decided yet whether that makes you better or worse." } },
      choices = {
        { text = "One stance, trained hard, beats any number of shapes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Being able to change beats any stance carved in stone.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "To anyone with coin and a reason, though I'll not sell a blade to a man in a red bandana, whatever the coin. The Defias have enough steel of their own, and I'll not have any of mine in a Westfall farmer's back." } },
      choices = {
        { text = "Good. A merchant should care where his steel ends up.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Steel's steel. Where it goes isn't your business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every mage I've known who said no is buried in Duskwood, and every one who said yes still comes in for a sharpening. A short blade weighs nothing, and it's there when the mana isn't." } },
      choices = {
        { text = "I'll carry one and use it if I must.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather let someone else hold the steel.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hold it at the hilt and see where it wants to fall, because a good sword wants to stay level and a bad one wants to dive. Most of the blades on the auction house floor are all shine and no balance, and they'll get you killed." } },
      choices = {
        { text = "I'll buy the plain blade that balances well.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the shiny one. Looks matter too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Need one? You'll die without one, because sooner or later something gets past the arrows and the pet both. A good hunter's axe should be light enough to swing one-handed while you're backing away." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} will be grateful you can fight up close, I'd wager. Nobody likes being the only one in the brawl." },
      },
      choices = {
        { text = "I'll fight beside my pet, not hide behind it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "That's what the pet's for. I'll stay back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everyone should, because the road doesn't care what you believe. A healer who can't defend themselves is just another body to protect, and I'd sooner sell you a mace than read your name on a list." } },
      choices = {
        { text = "I'll carry one, but I'd always rather heal than harm.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they come at me, I'll put them down without a second thought.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They're taught to swing for the crowd, not for the fight, and a pretty swing leaves your side wide open. A weapon is a tool, and it should feel like one, not like something out of a tapestry." } },
      choices = {
        { text = "The order's drills have served us for generations, Gunther.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Show me your way, then. I'll fight however wins.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a mace, then, or a staff, though you hold yourself like someone who'd rather not hit anything at all." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Let me see your grip, {class}, because too many knights I sell to hold a hammer like it's a candle." },
        { id = "h_default", text = "Gunther Weller. Marda and I keep this arsenal, and we sell steel that does what it's meant to, and not one piece of it was bought for its polish." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "You've got a fighter's grip, so you'll want something with weight. Try the axes on the far wall and see what your arm says." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll be looking at the daggers, and you'll be looking at them closely. Ask before you test the edge, because Marda counts them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in an arsenal, which is like a fish in a stable. You'll be wanting a dagger for the day the spells run out, I'd guess." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Finally, someone who won't ask me which sword is the prettiest. Pick it up, feel the balance, and tell me what your hands say." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've no bows here, mind, but I've got axes and short swords for when the beast gets too close for arrows." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, so you'll not want a blade, I suppose, since you've claws when you need them. Hold a staff for me, though, so I can see your balance." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, at my arsenal. I'll sell you a dagger or a staff, and that's all a warlock's arm is good for." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Show me how you hold a weapon. Talk to spirits all you like, but your grip will tell me more." },
      },
      again = {
        { id = "h_again", text = "What else? I've a blade to finish." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "What's wrong with the auction house?", next = "auction" },
        { text = "There's a fellow teaching in the corner.", next = "woo" },
        { text = "I'd guess you sell blades to anyone who asks.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A mage hardly needs a blade at all.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Telling a good sword from a bad one must take an eye, Gunther.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does a hunter need a melee weapon, Gunther?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest carry a weapon at all, Gunther?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's wrong with how knights hold their weapons, Gunther?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a druid's balance any different from a swordsman's, Gunther?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What weapon suits a warlock, Gunther?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you look for in a fighter's grip, Gunther?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll look elsewhere.", next = "END" },
      },
    },
    auction = {
      lines = { { id = "a_default", text = "Nothing, if you like buying from someone you'll never meet. A blade from a stranger might be a fine one or a pretty one, and you won't know which until it's too late to complain." } },
      choices = {
        { text = "A good blade is worth paying a craftsman for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good price is a good price, whoever sells it.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    woo = {
      lines = { { id = "w_default", text = "Woo Ping, the weapon master. He teaches people how to hold what I sell them, and he's very good at it, though his students do knock things off my walls." } },
      choices = {
        { text = "Does he send you customers?", next = "woo_customers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woo_customers = {
      lines = { { id = "wc_default", text = "Every day. They learn the sword from him, then walk ten paces to buy one from me, and Marda calls it the best arrangement we ever made." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons forge blades with a balance I've never been able to match, and I've studied every one that's come through this shop. I'd sell them if I could get them, and I'd keep one for myself." } },
    silver_hand = { { id = "tp_silver_hand", text = "The knights of the Silver Hand carried hammers that were balanced for the Light, I'm told, and I've tried to make one. It's very heavy, and it doesn't glow, so I suppose I failed." } },
    second_war = { { id = "tp_second_war", text = "The orcs carried axes in the Second War that were all weight and no balance, and still they cut through everything. I've spent my life making blades that do the opposite." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The fighters at the Gurubashi Arena buy weapons from anyone who'll sell them, and I've sold a few. I've heard most of them don't come back to complain." } },
    knows = { { id = "tp_knows", text = "Folk talk while they test an edge. Ask what you like, and I'll tell you if I've heard it over the whetstone." } },
    background = { { id = "tp_bg", text = "I sell steel with Marda, by the auction house. That's the part of my life anybody needs to hear about." } },
    advice = { { id = "tp_ad", text = "Hold it before you buy it, and swing it before you trust it. Shine never saved anybody." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, but ask me about steel and I'll talk all day." } },
  },
}

P:NPC {
  key = "crier_goodman", id = TODO_NPC("Crier Goodman"), name = "Crier Goodman",
  bible = "bibles/trade_district.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "eager" }, values = { "loyal", "proud" },
  notices = { "light", "kin", "deed" },
  impression = {
    first = "Crier Goodman carries the city's news in a voice made for a parade ground and a heart that loves gossip. He announced me to the whole street before I'd introduced myself.",
    third = "{name} met Crier Goodman, Stormwind's town crier, who calls heroes to the far corners of the world.",
  },

  barks = {
    { id = "b_hear", text = "Hear ye, hear ye! News from both continents and beyond, for any who'll stop and listen!" },
  },

  greetings = {
    { id = "g_news", text = "Well met, hero! I've news from near and far, and a throat that's ready to tell it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Come for fresh news, or come to make some? Either suits me." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest of the Cathedral! The Light's servants answer my calls more often than the sellswords do, and they come home more often, too." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A son or daughter of Stormwind! I cry the King's news, friend, and it's yours before anyone's." },
    { id = "n_level", cat = "deed", when = { minLevel = 55 },
      text = "I know that look, hero. You've been where my notices point, haven't you, and come back to read the next one." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Mostly that they're orcs, friend! But you're no orc, and I'll say so loudly. The city loves a good surprise." } },
      choices = {
        { text = "Announce me properly, Crier. Let them know I'm Alliance.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep me out of your news. I'll make my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Only when the Cathedral tells me to, and then it's always a warning, which is my least favourite kind of news to cry, since nobody ever tips a man for a plague warning. I'd much rather shout about heroes coming back from Blackrock, though between you and me, half of those heroes are your sort and nobody ever mentions it." },
      },
      choices = {
        { text = "Then cry the warnings, Goodman. The city needs them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Cry my name with the heroes, Goodman.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Goodman.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everything's news if you shout it properly, but a druid is real news, because the city still doesn't know what to make of your people. I cried the night elves joining the Alliance myself, and the whole square asked me where Darnassus was." } },
      choices = {
        { text = "Then cry it properly. People should know their allies.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Better they don't know. Let my people stay a rumour.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Never by name, though now and then a quiet gentleman hands me a notice that's a little odd, and I read it out exactly as written. I don't ask who it's meant for, because I like my throat as it is." } },
      choices = {
        { text = "SI:7 serves the crown. You're right to help them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd want to know who's using my voice, if I were you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Never, because a notice shouted from the rooftops by magic is only noise, and a notice cried by a man in the square is news. People listen to a voice that can get hoarse, friend." } },
      choices = {
        { text = "Tradition matters. Keep crying your notices the old way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A spell would reach more people. Progress is progress.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Gnolls in Redridge, orcs in the Blackrock passes and the Defias in Westfall, and each of them begs for strong arms! Lakeshire's magistrate sends a new notice every week, and every week fewer volunteers answer it." } },
      choices = {
        { text = "Then I'll answer it. Lakeshire won't be forgotten.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Notices don't pay much. I'll wait for better work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wolves in Duskwood, spiders in the Brightwood Grove and murlocs on the Westfall coast, all asking for someone with a sharp eye! I read them out every morning, and I'd dearly love to read out that one had been answered." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And with a fine {pet} at your side, no less! I'll mention it in the next announcement, if you don't mind: a hero, a bow and a faithful beast." },
      },
      choices = {
        { text = "I'll answer them for the people's sake, not the fame.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Mention my name loudly. A hunter needs a reputation.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The refugees from Lordaeron keep coming, and the Cathedral's asking for help at the kitchens and the hospice, and nobody's crying it but me. Good news sells better, but someone has to shout the other kind too." } },
      choices = {
        { text = "Then I'll go to the kitchens. The refugees need us.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stormwind has enough hungry mouths of its own, Crier.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Calls for aid from Redridge and Westfall, mostly, and one from Darkshire I've been crying for a month now. They're not glamorous postings, but there's honour in them, and somebody ought to answer." } },
      choices = {
        { text = "Then I'll answer, Crier. Someone must.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A paladin's skill is wasted on village errands.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Hear ye, hear ye, the Cathedral seeks volunteers for the refugee kitchens, and here's one already!" },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Hear ye, hear ye, a champion of the Silver Hand walks among us, and the city is the safer for it!" },
        { id = "h_default", key = true,
          text = "Crier Goodman, voice of the city! Every notice that's nailed up in Stormwind passes through my throat first, and I'll tell it to anyone who's willing to be a hero." },
        { id = "h_young", when = { maxLevel = 49 },
          text = "My best notices are for seasoned heroes, I'm afraid, and you've a way to go yet. Come back when the road's made you harder, and I'll have something worth hearing." },
        { id = "h_plague", tags = { "news" }, when = { questActive = TODO_QUEST("A Call to Arms: The Plaguelands!") },
          text = "Chillwind Camp, north of the Alterac Mountains, and Commander Valorfist waiting! The Scourge won't wait for you, so neither should you." },
        { id = "h_plague_done", tags = { "news" }, when = { questDone = TODO_QUEST("A Call to Arms: The Plaguelands!") },
          text = "You answered the call to the Plaguelands! I tell everyone that heroes went north, and now I can say I know one of them." },
        { id = "h_frontier", tags = { "news" }, when = { questActive = TODO_QUEST("The New Frontier") },
          text = "Off to Darnassus to see the Arch Druid? I hear he's not fond of visitors, so be polite and be quick." },
        { id = "h_feathermoon", tags = { "news" }, when = { questActive = TODO_QUEST("Feathermoon Stronghold") },
          text = "Feralas and Feathermoon, and a rogue mage to catch! Latronicus Moonspear will be glad to see you, mark my words." },
        { id = "h_dawn", when = { timeOfDay = "dawn" },
          text = "You're up early! I practise on the canal bridges at dawn, where the echo's best, before the city wakes and starts talking over me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I've cried more notices about thieves than anything else, so please don't make me cry one about you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You could make my voice carry across the whole city with one spell, I'm sure, and I'd be out of work by supper." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Hear ye, hear ye, the kingdom needs heroes, and here stands one in a proper set of armour!" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Hear ye, hear ye, the kingdom's roads are full of beasts, and here comes someone to thin them!" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Hear ye, hear ye, a druid in the Trade District, and I'll cry it to the whole street if you'll stand still for it!" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Hear ye, hear ye, a warlock in the Trade District, and a polite one by the look of it! I'll cry that, if you don't mind." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Hear ye! A dwarf shaman in the Trade District! I'll announce you, friend, unless your spirits object." },
      },
      again = {
        { id = "h_again", text = "More news, hero? I've barely cleared my throat." },
        { id = "h_again2", text = "What else would you hear? Ask, and I'll proclaim it." },
      },
      choices = {
        { text = "There's news from the north, I hear.", next = "plague", when = { minLevel = 50 } },
        { text = "What's the news from Kalimdor?", next = "frontier", when = { minLevel = 50 } },
        { text = "Any other calls for heroes, Crier?", next = "feralas", when = { minLevel = 50 } },
        { text = "I doubt you believe everything you cry.", next = "believe" },
        { text = "What do the heroes say when they come back?", next = "heroes" },
        { text = "Do you cry any news of the Skyborne?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do you ever cry notices for SI:7?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you ever want a spell to carry your voice?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd expect notices for warriors too, Crier.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are there notices posted for hunters, Crier?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What news do you have for the Church, Crier?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you cry any notices for the Silver Hand, Crier?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a druid in the Trade District really news, Crier?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you ever cry news about warlocks, Goodman?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do people say about shamans in the city, Crier?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not now, Goodman.", next = "END" },
      },
    },

    plague = {
      big = true,
      lines = { { id = "p_default", text = "The kingdom calls all able heroes north against the Scourge! Commander Ashlam Valorfist has made his camp at Chillwind, beyond the Alterac Mountains, and he needs every blade and every prayer that'll go.",
        fx = { learn = { "argent_dawn", "scholomance" } } } },
      choices = {
        { text = "There can't be many left in the Plaguelands to save.", next = "plague_who" },
        { text = "Then I'll go north.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Lordaeron's dead; let the dead keep it.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague_who = {
      lines = { { id = "pw_default", text = "Farmers who wouldn't leave, the Argent Dawn and the Crusaders, though nobody agrees about them, and the folk in Hearthglen. I only cry the notice; the men who come back tell the rest, and they don't tell much." } },
      choices = {
        { text = "My people came from Lordaeron.", next = "BACK", when = { origin = "human_lordaeron_refugee" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    frontier = {
      lines = { { id = "f_default", text = "The Cenarion Circle wants able folk to explore a wasteland west of Tanaris, beyond Gadgetzan. Speak to Arch Druid Fandral Staghelm in Darnassus, and don't ask me what's out there, because the notice doesn't say.",
        fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "You don't know?", next = "frontier_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frontier_know = {
      lines = { { id = "fk_default", text = "Not a word of it, and it vexes me terribly. A crier who doesn't know is just a man shouting, so if you go, come back and tell me, and I'll tell the city." } },
      choices = {
        { text = "I'll bring you the news first.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    feralas = {
      lines = { { id = "fe_default", text = "Latronicus Moonspear at Feathermoon Stronghold, off the Feralas coast. A mage called Lethtendris has fled into the old elven ruins they call Dire Maul with something dangerous, and the Sentinels want it back." } },
      choices = {
        { text = "Dangerous how?", next = "feralas_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feralas_how = {
      lines = { { id = "fh_default", text = "Magical, the notice says, and I'm told the elves don't say dangerous lightly. Mind yourself in those ruins; I'd hate to cry your name for the wrong reason." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    believe = {
      lines = { { id = "b_default", text = "I believe every notice that comes with a seal on it, and I'm careful about the ones that don't. A crier who spreads rumours is no better than a gossip with a loud voice." } },
      choices = {
        { text = "The crown's word is good enough for me.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A seal on a lie is still a lie.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heroes = {
      lines = { { id = "he_default", text = "Some come back and tell me everything, and some come back and say nothing at all, and those are the ones who've seen the most. A few don't come back, and I don't cry their names; that's for the Cathedral." } },
      choices = {
        { text = "The Cathedral remembers them.", next = "BACK", when = { class = "PRIEST" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "Only the one notice, and I've cried it a hundred times: elves from the sky, friends of the Kirin Tor, welcome in Stormwind! Nobody's given me a second notice, so I'd be glad of anything you'd let me proclaim." } },
      choices = {
        { text = "Proclaim that we keep our word.", next = "skyborne2", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Proclaim nothing. Let them wonder.", next = "skyborne2", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    skyborne2 = {
      lines = { { id = "skyborne2_l", text = "Hear ye, then, and I'll have it on the bridges by dawn. A crier lives on new words, friend, and you've given me a few." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    varian = { { id = "tp_varian", text = "Hear ye, hear ye: the King is missing, and the Regent asks all good citizens to pray for his return! I've said it every morning for months, and I'll say it every morning until I'm told to stop." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord Regent rules in the King's name, and he's a fine man, and you'll hear no word against him from me! I'll shout that to anyone who asks, and to many who don't." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor is the Regent's adviser, and a great lady of the court, and I've been told to say so whenever she's mentioned. I'll say it louder, if you like, though I've never met her." } },
    the_stockade = { { id = "tp_the_stockade", text = "Hear ye: the Stockade is held by its prisoners, and the guard advises all citizens to avoid the Canals after dark! I'm told it's temporary, and I'm told that every morning." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Hear ye, hear ye: the Darkmoon Faire comes to Goldshire again soon, with games and wonders for all! I'm not told when, but I shout it anyway, because people like to hear it." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "Hear ye: visitors to the city are welcome through the Valley of Heroes, and are asked not to climb the statues! That last part's for the children, mostly, though not entirely." } },
    knows = { { id = "tp_knows", text = "Every notice in the city crosses my throat sooner or later! Ask, and I'll cry what I can." } },
    background = { { id = "tp_bg", text = "A crier, born with a voice and the sense to use it for the crown. I've shouted the news on these streets longer than some of those statues have stood." } },
    advice = { { id = "tp_ad", text = "Read the whole notice before you set off, hero. Too many of the dead in this world only read the reward." } },
    _none = { { id = "tp_none", text = "No notice on that, hero, so no news. If you hear anything, bring it to me." } },
  },
}

P:NPC {
  key = "dungar", id = TODO_NPC("Dungar Longdrink"), name = "Dungar Longdrink", title = "Gryphon Master",
  bible = "bibles/trade_district.md", role = "flightmaster", tier = "quest",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "practical", "patient" },
  notices = { "light", "kin", "dwarf" },
  impression = {
    first = "Dungar Longdrink talks about his gryphons the way a captain talks about his crew, and about walking the way a priest talks about sin. He's human, whatever his name suggests, and tired of saying so.",
    third = "{name} met Dungar Longdrink, Stormwind's gryphon master at the roost in the Trade District.",
  },

  greetings = {
    { id = "g_roost", text = "Need a gryphon, {g:lad|lass}? Tell me where you're bound, and I'll tell you if they know the way." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the roost! Good, you've learned not to walk." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Tuck those robes in before you mount, friend, because the birds take a flapping hem for something to chase." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "One of ours! A Stormwind {g:lad|lass} ought to know a gryphon from a griffon, so tell me you do." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "No, I'm not a dwarf, whatever my name says. I've heard the joke from every dwarf who's ever come up these stairs, so you can save yours." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They trust anyone who walks up calm and doesn't wave a totem in their faces. Gryphons are Wildhammer-bred, so maybe your spirit-talk sounds like home to them." } },
      choices = {
        { text = "Calm and steady, then. I'll mind your crew's manners, Dungar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let me ride one without a saddle. The wind will hold me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll carry you, so long as you've sent your friend back where it came from before you mount, because a gryphon smells a demon from across the square and won't stop screaming. I had a warlock try to sneak an imp aboard in a satchel once, and he spent the whole flight to Lakeshire upside down." },
      },
      choices = {
        { text = "The demon stays behind, then. Your birds, your rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your birds can learn to tolerate it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Dungar.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They mind anything that smells of the wild, because they think you're a rival or a meal and I haven't worked out which. Sit still on the saddle and don't change halfway across Elwynn, and they'll settle." } },
      choices = {
        { text = "I'll ride quietly, Dungar. Your birds, your rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner run beside them than sit strapped to a saddle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not while the Sanctum's portals only reach the capitals, and not while a portal costs more than a bird. Gryphons have been carrying Alliance riders since the Second War, and I'd like to think some things are too good to be replaced." } },
      choices = {
        { text = "Some traditions are worth keeping, Dungar. Your birds are one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Everything gets replaced in time, even gryphons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Harbor Master reads it for the tariffs, and now and then a quiet fellow from Old Town reads it for reasons of his own. I don't mind, because a gryphon master who keeps honest books has nothing to fear from SI:7." } },
      choices = {
        { text = "Honest books are the best defence. You're wise.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every ledger has a page that ought to go missing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, the Wildhammer did it in the Second War, droppin' straight down on the orcs from the clouds. My birds are Aerie Peak stock, an' some o' the old ones still remember carryin' soldiers, so they're braver than ye'd think." } },
      choices = {
        { text = "I'd be proud to fly with them into battle.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my feet on the ground, thank you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When there's a gryphon free and a rider who can hold a man in the saddle, yes. Some of them don't make it, and I've had to settle a bird whose passenger stopped breathing on the way, and that's a long, quiet flight home." } },
      choices = {
        { text = "That's merciful work, Dungar. They all deserve the flight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The roads would do. Gryphons are for messages, not the dying.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I keep its perch empty for a season and write its name in the back of my ledger, and then I train another, because the roost can't stand idle. People think I'm soft for it, but every one of those birds died carrying somebody's message or somebody's son." } },
      choices = {
        { text = "Remembering them is right. They bled the same as any soldier.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A bird's a bird, Dungar. Train another and move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! My gryphons fly the wounded home from Lakeshire more often than I'd like, so I'm always glad to see a healer on the roost." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a gryphon to take you somewhere dangerous, I expect, and they'll go, so long as you've been there before." },
        { id = "h_default", key = true,
          text = "Dungar Longdrink, gryphon master of Stormwind. Every bird on this roost flies home to me, and they'll take you anywhere you've already been, as long as you've been there." },
        { id = "h_crate", tags = { "news" }, when = { questActive = TODO_QUEST("Dungar Longdrink") },
          text = "That's Osric's crate! You walked all the way here with it, did you? Look at your brow; next time you take a gryphon, and that's the first lesson." },
        { id = "h_lewis", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Lewis") },
          text = "If you've met Thor at Sentinel Hill, one of mine will take you straight to him. Then hand the crate to Quartermaster Lewis before the Westfall lads go without." },
        { id = "h_storm", when = { timeOfDay = "night" },
          text = "Night flights are smooth, but the birds don't like them. Hold tight over the Westfall coast; the wind's always worse after dark." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, which means you'll tell me you can teleport home and don't need my birds. You can't teleport to Sentinel Hill, though, and my gryphons can." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want to fly at night with nobody watching. My birds don't gossip, but I do keep a ledger." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, wantin' a gryphon! Mind ye don't wear too much plate, {g:lad|lass}, for my birds can carry a dwarf in full armour, but they'll complain about it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and I hear your lot run faster on four legs than my gryphons fly, which I'll believe when I see it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Your demon stays on the ground, and so does whatever smells of brimstone, because my gryphons won't fly with it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, and I'm not one, whatever my name says. The gryphons have gone quiet looking at you; I think they can smell the wind on you." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}? The birds are getting restless." },
        { id = "h_again2", text = "Ask away. I've a gryphon to feed, but I can talk while I do it." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why only where I've already been?", next = "routes" },
        { text = "Keeping them all must be hard work.", next = "birds" },
        { text = "Osric's crate must hold something important.", next = "crate",
          when = { any = { { questActive = TODO_QUEST("Dungar Longdrink") }, { questActive = TODO_QUEST("Return to Lewis") } } } },
        { text = "I'll walk.", next = "walk" },
        { text = "Will portals ever put your gryphons out of work?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Somebody reads that ledger, I expect, Dungar.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do gryphons ever fly warriors into battle, Dungar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A gryphon could take to a hunter, I'd think.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do you really fly the wounded home, Dungar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What happens when a gryphon doesn't come home, Dungar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your gryphons mind carrying a druid, Dungar?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your gryphons carry a warlock, Dungar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your gryphons trust a shaman, Dungar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
      },
    },

    routes = {
      lines = { { id = "r_default", text = "Because a gryphon always knows the way home to its capital, but it learns a new roost only once it's seen a rider land there. Fly to Thor in Westfall once, on foot or otherwise, and after that the birds know him too." } },
      choices = {
        { text = "So the walking's not wasted.", next = "routes_walk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_walk = {
      lines = { { id = "rw_default", text = "Once, no. You walk a road once so you never have to walk it twice. Anyone who walks it twice is just being stubborn, and I don't hold with stubborn." } },
      choices = {
        { text = "Some roads are worth walking twice.", next = "BACK", fx = { align = { order = -1 }, trait = { stubborn = 1 } } },
        { text = "Then I'll fly, and try to keep my breakfast down.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    birds = {
      lines = { { id = "b_default", text = "Meat, patience and a good deal of shouting. They're proud animals and they'll sulk if you don't praise them, so I praise them every morning, by name." } },
      choices = {
        { text = "By name? How many are there?", next = "birds_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds_names = {
      lines = { { id = "bn_default", text = "More than I'll recite to you. The Wildhammer lads in the Hinterlands would laugh at how I spoil them, but these birds carry the King's post, and they've earned a little spoiling." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    crate = {
      lines = { { id = "c_default", text = "Kit for the People's Militia at Sentinel Hill, from Osric's shop in Old Town. Westfall's fighting folk shouldn't be short of armour because someone was too slow to fly it out.",
        fx = { learn = { "people_militia", "westfall" } } } },
      choices = {
        { text = "Then I'll fly it today.", next = "BUSINESS", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The militia can wait a little longer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    walk = {
      lines = { { id = "w_default", text = "Walk! You'll be in Westfall by nightfall with no feet left, and the Defias will be pleased to see you. Suit yourself, {g:lad|lass}, but the bird's here when you've had enough." } },
      choices = {
        { text = "Fine. Show me the routes.", next = "BUSINESS" },
        { text = "I like the road.", next = "END" },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_l", text = "Take to you, aye, the way a cat takes to a lap; follow you about and fetch, never. The Wildhammer raise them from eggs and still lose a finger now and then, so leave them to me." },
        { id = "hunter_kin", when = { origin = "dwarf_wildhammer_kin" },
          text = "You've Wildhammer kin; you'll know better than to ask, then. They raise them from eggs in the Hinterlands and still lose a finger now and then, so leave these to me." },
      },
      choices = {
        { text = "I'll stick to my own beasts.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Someday I'll tame one.", next = "hunter2" },
      },
    },
    hunter2 = {
      lines = { { id = "hunter2_l", text = "And someday I'll be king of Ironforge. Until then, pay your fare and keep your hands out of the roost, {g:lad|lass}." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    wildhammer = { { id = "tp_wildhammer", text = "My gryphons came from the Wildhammers of Aerie Peak, and they've a better temper than most of the nobles I fly. I'll take the birds every time, and I'll thank the Wildhammers for them." } },
    theramore = { { id = "tp_theramore", text = "The ships to Theramore sail from Menethil, but I've a bird or two who'd fly there if you asked nicely. I'd not ask, though, because the swamp's no place for a gryphon." } },
    booty_bay = { { id = "tp_booty_bay", text = "I fly folk south to Booty Bay now and then, and the birds always come back smelling of rum. I don't ask, and they don't tell." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "My birds won't fly near the black mountain north of Redridge, and I'd not ask them to. There's something up there they don't like, and I trust their noses more than my maps." } },
    knows = { { id = "tp_knows", text = "My birds come home from every corner of the kingdom, and so do their riders, with all their gossip. Ask what you like." } },
    background = { { id = "tp_bg", text = "Gryphons all my working life, and I'm human, before you ask. The name came with the family, and so did the thirst, according to my wife." } },
    advice = { { id = "tp_ad", text = "Learn the roost at every town you reach, even if you're only passing. You'll thank yourself the day you need to get home fast." } },
    trade = { { id = "tp_tr", text = "I send riders and post to every roost the birds have learned. Speak to me, pick a place, and hold on tight.", next = "routes" } },
    westfall = { { id = "tp_westfall", text = "Thor keeps the roost at Sentinel Hill, and the militia there needs every crate we fly out.", next = "crate" } },
    _none = { { id = "tp_none", text = "Couldn't say, {g:lad|lass}. The birds don't tell me much beyond where they've been." } },
  },
}

P:NPC {
  key = "morgan_pestle", id = TODO_NPC("Morgan Pestle"), name = "Morgan Pestle",
  bible = "bibles/trade_district.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "practical", "careful" },
  notices = { "light", "kin", "craft" },
  impression = {
    first = "Morgan Pestle runs the city half of the Pestle family's apothecary with a careful hand and a running grumble about his brother in Goldshire. He measured me up the way he'd measure a powder.",
    third = "{name} met Morgan Pestle, alchemist of Pestle's Apothecary in the Trade District.",
  },

  greetings = {
    { id = "g_shop", text = "Pestle's Apothecary. Don't touch the blue jars, and mind your elbows near the shelves." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. You heal with prayers and I heal with tinctures, and between us I'd say we keep the city on its feet." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "From Elwynn, by the look of you? Then you may have met my brother William, at the Goldshire inn, smelling of candle wax." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've stained fingers, and that's an alchemist's stain. Who taught you? Someone who didn't make you wear gloves, I see." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Same as anyone. My brother in Goldshire would claim otherwise, but he claims a lot. A shaman's body is still a body." } },
      choices = {
        { text = "You measure fairly, Morgan. I trust your work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your brother may know something. Don't dismiss him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I buy them, mostly from my brother in Goldshire, and he cuts them wrong, so you'd be right to complain. If your people ever sold their herbs in Stormwind, I'd buy every bundle before he heard of it." } },
      choices = {
        { text = "Buy from your brother, Morgan. Family should come first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Cut your brother out. Better herbs make better potions.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They try, and every winter one of them blows the shutters off a window in the Mage Quarter, and every winter they come to me afterwards. A potion's a craft like any other, and cleverness without patience only makes smoke." } },
      choices = {
        { text = "Patience and method, then. I'll learn properly or not at all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A few blown shutters is how anyone learns anything.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd say no, politely, and then I'd tell the Watch, less politely. William thinks I'm too strict, but William doesn't live a short walk from the Slaughtered Lamb, and I do." } },
      choices = {
        { text = "You're right to refuse. Some things shouldn't be sold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Watch can't stop what it doesn't understand, Morgan.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you think you'll need, and then one more for the friend who forgot his. My brother William in Goldshire sells half his stock to soldiers bound for Westfall, and he says it's never enough." } },
      choices = {
        { text = "I'll carry extra for anyone who needs it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll carry what I need. Others can buy their own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I do, though I'll admit I started it for my own cat, who has an unfortunate habit of fighting things bigger than her. It's peacebloom and a little silverleaf, and it soothes a bite as well on a wolf as on a man." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks healthy enough, I'm glad to say, but if it ever comes home limping, you know where to find me." },
      },
      choices = {
        { text = "My pet gets the best care I can give it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My pet heals on its own. Save the salve.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The careful ones do, and they're the ones who come back from Duskwood. My brother in Goldshire says priests are too proud to carry potions, but I say they're too busy healing everyone else to think about it." } },
      choices = {
        { text = "A healer's first trust should be in faith, Morgan, not a flask.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A potion is more reliable than a prayer, Morgan.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think it's far more reliable than my brother, and less reliable than a well-brewed potion. I've never once had a potion refuse to work because I'd been sinning, and I'm not certain the Light can say as much." } },
      choices = {
        { text = "The Light doesn't fail, Morgan. People do.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll stuff my pack with potions and pray a bit less.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want mana potions, I expect, or you'll want them and then say a prayer instead, like most of your lot." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll heal yourself, I suppose, and never buy a thing, but at least take a potion for the road in case the Light's busy." },
        { id = "h_default", key = true,
          text = "Morgan Pestle. My brother William keeps our shop in Goldshire and I keep this one, and the Bouchers by the door sell the reagents so I can get on with the brewing." },
        { id = "h_shipment", tags = { "news" }, when = { questActive = TODO_QUEST("Shipment to Stormwind") },
          text = "William's candles, at last! He sends them with whoever's walking this way, and you're the first in weeks who hasn't dropped the box. I'll pay you properly, don't worry." },
        { id = "h_shipment_done", tags = { "news" }, when = { questDone = TODO_QUEST("Shipment to Stormwind") },
          text = "The candles you brought are already half gone, rendered for wax. I'll need another box before the month's out, so if you see William, remind him." },
        { id = "h_william", when = { heardLine = "pestle.l_default" },
          text = "William's been telling you about the young lovers, hasn't he? He's soft about that sort of thing, always was, and I tell him so in every letter." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'll want mana potions, and you'll want them stronger than whatever the Sanctum's apprentices brew in their rooms." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "One of the Lamb's people, so I'll guess you're not here for a healing draught. I don't sell anything that calls up anything, so don't bother asking." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want healing potions, then, and plenty, because I've never met a warrior who came home with as many as he left with." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've a salve for beasts as well as men, if your companion's been in a scrape, and nobody else in the city bothers to brew one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll know half my ingredients by their first names, I expect, and you'll want to tell me I've cut them wrong." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Let me measure you. Hmm. Your spirits must take powders differently from most folk." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a flask on the heat." },
        { id = "h_again2", text = "Go on, briefly." },
      },
      choices = {
        { text = "Let me see your potions.", next = "BUSINESS" },
        { text = "Candles seem an odd thing for an apothecary to need.", next = "candles", when = { any = { { questActive = TODO_QUEST("Shipment to Stormwind") }, { questDone = TODO_QUEST("Shipment to Stormwind") } } } },
        { text = "Tell me about your brother.", next = "william" },
        { text = "Teach me something about the craft.", next = "craft", when = { profession = "Alchemy" } },
        { text = "Do you brew poisons, Morgan?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'd wager the Sanctum's apprentices brew their own.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "A warrior should carry a few healing potions, Morgan.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you really brew salves for pets, Morgan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you do if a warlock asked anyway?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do priests buy much from your apothecary, Morgan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you really think the Light can be busy, Morgan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you gather your herbs yourself, Morgan, or buy them in?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your powders work on shamans, Morgan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    candles = {
      lines = { { id = "c_default", text = "For the wax. Kobold candles from the Elwynn mines burn dirty, but the wax is good once it's rendered, and a good wax seals a jar the way nothing else does." } },
      choices = {
        { text = "Taken from kobolds, then.", next = "candles_kobolds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    candles_kobolds = {
      lines = { { id = "ck_default", text = "From Fargodeep and Jasperlode, by whoever William can persuade to go down there. The kobolds won't miss them; they'll steal more from somebody else by morning.",
        fx = { learn = { "kobolds" } } } },
      choices = {
        { text = "Taking from thieves is still taking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Kobolds earn what they get.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    william = {
      lines = { { id = "w_default", text = "Older than me, kinder than me and a worse businessman by a mile. He'd give the shop away for a good story, so I keep the city half where he can't reach it." } },
      choices = {
        { text = "You must miss Goldshire.", next = "william_goldshire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    william_goldshire = {
      lines = { { id = "wg_default", text = "I miss the crickets at night and the smell of the bread ovens. I don't miss the inn's ale or the stories William tells over it, and I'd thank you not to repeat that to him." } },
      choices = { { text = "Not a word.", next = "BACK", fx = { affinity = 1 } } },
    },

    craft = {
      lines = { { id = "cr_default", text = "Measure twice and heat slowly, and if a mixture smokes, leave the room before you wonder why. Most of the alchemists I've known who didn't follow that rule have eyebrows that never grew back." } },
      choices = {
        { text = "I'll keep my eyebrows, thank you.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "rogue_l", text = "No, and if you've come to ask, you've come to the wrong Pestle and the wrong street. Jasper Fel in Old Town sells that sort of thing, and I've never once asked what's in his bottles." } },
      choices = {
        { text = "A poison's just a potion with a purpose.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fair. I'll keep your shop clean of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
  },

  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins of Gadgetzan sell potions that do three things at once, and two of them are bad for you. I'd not stock them, though my brother in Goldshire would." } },
    booty_bay = { { id = "tp_booty_bay", text = "The herbs that come up from Booty Bay are the finest in the world, and the most expensive. I buy them anyway, because a potion's only as good as what goes into it." } },
    scourge = { { id = "tp_scourge", text = "The refugees from Lordaeron ask for remedies for the plague, and I've nothing to give them. I'd give my shop for a cure, and so would every apothecary in the city." } },
    new_plague = { { id = "tp_new_plague", text = "The plague in Lordaeron was brewed in cauldrons, they say, by the Cult of the Damned. I'd like to see the recipe, so I could brew the cure, and then burn the recipe after." } },
    knows = { { id = "tp_knows", text = "Folk tell their apothecary things they wouldn't tell their priest. Ask, and I'll tell you what's proper to repeat." } },
    background = { { id = "tp_bg", text = "A Pestle, an alchemist and William's younger brother, in about that order.", next = "william" } },
    advice = { { id = "tp_ad", text = "Carry a healing potion you hope you'll never drink. It's the cheapest insurance in Stormwind." } },
    _none = { { id = "tp_none", text = "Not my field. Try William; he has opinions on everything." } },
  },
}

P:NPC {
  key = "harlan", id = TODO_NPC("Harlan Bagley"), name = "Harlan Bagley",
  bible = "bibles/trade_district.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "hardworking" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Harlan Bagley's armory is doing better business than it ever has, and it worries him that he doesn't know why. He told me so between two sales.",
    third = "{name} met Harlan Bagley, who keeps the Lionheart Armory on the Trade District square.",
  },

  greetings = {
    { id = "g_armory", text = "Welcome to the Lionheart Armory! Cloth, leather or mail, we've got it, as long as you're quick." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Cloth for a priest, I'd guess, and Carla's the one to see for that. Sturdy robes are selling faster than she can fold them." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A Stormwind customer! You'll know the Lionheart's been here since the city was rebuilt, then, and that we've never been this busy." },
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "Light above, you're nearly bare! Step in before the guards think you've been robbed on the bridge." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "People are afraid of what's happening in Westfall and Redridge and Duskwood. Something's coming, and they're arming. I just wish I knew what." } },
      choices = {
        { text = "Arm them well, Harlan. The kingdom needs strong guards.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Profit while you can. Fear sells better than hope.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "More than ever, which is part of what worries me, because when even the folk from the Lamb start buying padded vests, something's coming. Business is booming, and I can't tell if I should be pleased or packing." },
      },
      choices = {
        { text = "Then sell to the guard first, Harlan, not to the Lamb.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell to whoever pays, Harlan. That's business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Harlan.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because your people never needed armour in a city before, and now everyone does, from farmers to priests. When a druid wants something between their skin and a blade, I start wondering what's coming that I haven't heard about." } },
      choices = {
        { text = "Whatever comes, we'll face it together. Keep your shop open, Harlan.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell what you can, Harlan, and let others do the worrying.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice this year, and both times the thief got stuck halfway, because I had it built narrow on purpose. The Watch found the second one asleep there in the morning, and I let him finish his nap before I called them over." } },
      choices = {
        { text = "Kind of you. A night's mercy costs nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You should've left him there a week, Harlan.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Better than good, because every apprentice in the Quarter seems to be heading out of the gates this year, and they all need a robe that won't tear on the first bramble. I don't know where they're all going, and I've stopped asking." } },
      choices = {
        { text = "A mage should finish their studies before roaming.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A mage belongs out in the world, not in a library.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Reinforced leather and a good pair of boots, and more of it every month, with so many going out to fight in Westfall and Redridge. I've never seen trade like it, and some nights I count the till and feel a bit sick about where the coin comes from." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't need armour, I suppose, which is a pity, because I'd sell it some. Just a jest, friend, just a jest." },
      },
      choices = {
        { text = "Profit from a war is hard to take pride in.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Trade is trade. War's good business, Harlan.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "That somebody expects a war, and nobody's told the rest of us. I count more coin every week, and every coin feels like a soldier going out, and I've started to wonder whether I'd rather be poor." } },
      choices = {
        { text = "Then pray it's for nothing, Harlan, and keep your good heart.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Coin's coin. If there's a war, you'll be glad of it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Merchants' guards, noble houses, men heading to Westfall and men heading north, and none of them say why. I sell fair and ask nothing, but I'd like to know what's coming as much as anyone." } },
      choices = {
        { text = "Whatever comes, the Silver Hand will stand against it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell to the highest bidder, Harlan. That's how trade works.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want cloth from Carla, I expect, though lately I'm selling more mail than cloth and I can't say I like what that means." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Aldric has plate in the back, and he'll want to show it to you before anyone else gets their hands on it." },
        { id = "h_default", key = true,
          text = "Harlan Bagley, and this is my armory. Carla sells the cloth, Lara the leather and Aldric the mail, and I count the coin, which is more of it lately than I know what to do with." },
        { id = "h_resupply", tags = { "news" }, when = { questActive = TODO_QUEST("Harlan Needs a Resupply") },
          text = "You've got my note for Rema? Good. The Canal Tailor and Fit Shop, just by the bridge to Cathedral Square, and tell her I'll take every knitted shirt she can spare." },
        { id = "h_resupply_done", tags = { "news" }, when = { questDone = TODO_QUEST("Harlan Needs a Resupply") },
          text = "Rema's load came in this morning, and half of it's sold already. I owe you thanks, and I'm starting to think I owe her a share." },
        { id = "h_rema", when = { heardLine = "rema.h_default" },
          text = "Rema asked you why I need so much, didn't she? She asks me every time, and every time I tell her I don't know, and that's the truth." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so it's leather you'll be wanting, and Lara keeps the best of it. Pay at my counter, please, and not through the back window." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, so it's cloth for you, and Carla will measure you properly. Don't let her talk you into anything with brass buttons, because they spark." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Lara has leather in every cut a hunter could want, and I'll count the coin, which is the part of the trade I'm best at." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, in my armory. Business is better than it's ever been, and even your people are buying leather now, which worries me more than I can say." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, in an armory? I've cloth and a little leather, and I'll not ask what scorched your last robe." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, buying armour. Business has never been better, and it worries me. Do your spirits know why?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick; there's a queue." },
        { id = "h_again2", text = "Anything more you need before you go? Armor doesn't mend itself." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Why is business so good?", next = "boom" },
        { text = "I could carry something for you.", next = "resupply", when = { ["not"] = { questDone = TODO_QUEST("Harlan Needs a Resupply") } } },
        { text = "You mentioned three sellers.", next = "staff" },
        { text = "Warriors go through armor fast. Who else is buying?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'd wager someone tries the back window now and then.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Trade with the Mage Quarter looks good from here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What leather armour do hunters buy most, Harlan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do you think the rush for armour means, Harlan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who's buying all this armour, Harlan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does a druid buying leather worry you, Harlan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks buy armour from you, Harlan?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do you think business is so good, Harlan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },

    boom = {
      big = true,
      lines = { { id = "bo_default", text = "Everyone wants armor and good sturdy clothes, all at once, like they're expecting a hard season. I've no complaint about the coin, but I'd sleep better if somebody told me what they're bracing for." } },
      choices = {
        { text = "What do you think it is?", next = "boom_guess" },
        { text = "War's coming. People can feel it.", next = "BACK", fx = { align = { order = -1 }, opinion = { stormwind_mood = "war_coming" } } },
        { text = "The crown would tell us if there were danger.", next = "BACK", fx = { align = { order = 1 }, opinion = { stormwind_mood = "trust_crown" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boom_guess = {
      lines = { { id = "bg_default", text = "Orcs in Redridge, the Defias in Westfall, and every adventurer in the kingdom going somewhere dangerous. Maybe that's all it is, but a man in my trade notices when the city starts buying for winter in the spring.",
        fx = { learn = { "defias", "blackrock" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    resupply = {
      lines = { { id = "r_default", text = "I'm nearly out of knitted shirts and trousers. Take this request down to Rema Schneider at the Canal Tailor and Fit Shop, and she'll send another load, and I'll pay you for the walk." } },
      choices = {
        { text = "Who's Rema?", next = "resupply_rema" },
        { text = "Something else.", next = "BACK" },
      },
    },
    resupply_rema = {
      lines = { { id = "rr_default", text = "The best tailor on the canals and my supplier these ten years. She'll ask you a dozen questions about why I need it, so take your time with her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    staff = {
      lines = { { id = "s_default", text = "Carla for cloth, and she'll fit you with her eyes alone. Lara and Aldric Moore share the leather and the mail, and they argue about which is better every single day." } },
      choices = {
        { text = "One of them must be better.", next = "staff_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff_better = {
      lines = { { id = "sb_default", text = "Whichever one you've bought, friend; that's how a shopkeeper answers. Between us, it depends on whether you'd rather run or stand." } },
      choices = {
        { text = "I'd rather stand.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'd rather run.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "warrior_l", text = "Everyone, and that's what bothers me. Men with soft hands buying mail by the crate, paying in coin that smells of the coast, and never once asking about fit." } },
      choices = {
        { text = "The coast? Westfall?", next = "warrior2" },
        { text = "Coin's coin, Harlan. Sell it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You should tell the Watch.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    warrior2 = {
      lines = { { id = "warrior2_l", text = "I didn't say Westfall, and neither did you. But you're a warrior, and you know what men buy armor for, so you'll draw your own conclusions." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
  },

  topics = {
    the_stockade = { { id = "tp_the_stockade", text = "The prisoners took the Stockade, and suddenly every noble in the city wants a sword by his bed. Business is good, and I don't like what it's telling me." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are dug in under Moonbrook, and adventurers come through here every day to buy armour before they go down. Some of them come back to sell it, dented, and I don't ask after the ones who don't." } },
    syndicate = { { id = "tp_syndicate", text = "A man from Alterac came in last week and bought six daggers, all the same. He paid in old Alterac gold, and I've never seen a coin like it since the kingdom fell." } },
    scourge = { { id = "tp_scourge", text = "The Lordaeron refugees come in looking for weapons that'll put the dead down for good. I tell them anything will, if you hit hard enough, and I hope I'm right." } },
    knows = { { id = "tp_knows", text = "When folk buy armor they tell you where they're going, and why. Ask me what I've heard." } },
    background = { { id = "tp_bg", text = "I keep an armory, and I keep the books for it. There's no more to tell than that, though the books have got thicker this year." } },
    advice = { { id = "tp_ad", text = "Buy the armor before you need it. Everyone's figured that out this year except the ones still standing in my queue." } },
    defias = { { id = "tp_defias", text = "They're one reason folk buy armor, I'd guess. Westfall's not far enough away for anyone's comfort.", next = "boom" } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I sell armor, and I've barely time for that." } },
  },
}
