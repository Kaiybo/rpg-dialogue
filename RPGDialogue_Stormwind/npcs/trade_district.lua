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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Renato Gallina, at your service! My family keeps the Gallina Winery along the canals, and if you've drunk better wine in Stormwind, I'd like to know who poured it." },
        { id = "h_ticket", tags = { "news" }, when = { questActive = TODO_QUEST("Wine Shop Advert") },
          text = "You've still got my ticket, good! Take it down to the canals and give it to my sister Suzetta, and she'll hand you a bottle of the house red for nothing." },
        { id = "h_ticket_done", tags = { "news" }, when = { questDone = TODO_QUEST("Wine Shop Advert") },
          text = "So, you tried it? Don't tell me, I can see it on your face. That's the face of a customer for life, friend." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The square's quiet at this hour, so I'm shouting for the night watch. They never buy, but somebody has to keep the habit up." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The Cathedral's own, in my square! Wine and the Light have kept company a long time, and I'd hate to come between them." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've a square full of customers who don't know it yet." },
        { id = "h_again2", text = "Go on, ask me anything. Wine first, if you can manage it." },
      },
      choices = {
        { text = "What's this about a free bottle?", next = "offer", when = { ["not"] = { questDone = TODO_QUEST("Wine Shop Advert") } } },
        { text = "Why should I believe it's the best?", next = "best" },
        { text = "Who else works the winery?", next = "family" },
        { text = "Do you shout like this all day?", next = "square" },
        { text = "Wine and the Light do keep company.", next = "priest", when = { class = "PRIEST" } },
        { text = "Dwarves drink ale, Renato, not wine.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Not today, Renato.", next = "END" },
      },
    },

    offer = {
      lines = { { id = "o_default", text = "One bottle, on the house, for anyone with my ticket in their hand. Once you've tasted it you'll come back and pay for the next one, and that's the whole of my scheme." } },
      choices = {
        { text = "Where do I take it?", next = "offer_where" },
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
    knows = { { id = "tp_knows", text = "A man who stands in the Trade District all day hears everybody's business whether he wants to or not. Ask, and I'll tell you what the square's been saying." } },
    background = { { id = "tp_bg", text = "I'm a Gallina, and the Gallinas sell wine. The rest is just the years I've spent shouting about it.", next = "family" } },
    advice = { { id = "tp_ad", text = "Never buy wine from a man who won't drink it in front of you. I drink mine in front of everybody, friend, which is why I trust it." } },
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
      text = "A Stormwind face. You'll have eaten my cheese before, then, whether you knew it or not; half the taverns in Elwynn buy from us." },
    { id = "n_rogue", cat = "watch", when = { class = "ROGUE" },
      text = "You looked at my stairs before you looked at my cheese. Most people do it the other way round, and the ones who don't usually end up as friends of my husband's." },
    { id = "n_elf", cat = "kin", when = { race = "NightElf" },
      text = "We sell a Darnassian bleu, you know, and I'd value a kaldorei opinion of it. Elling says it has opinions of its own." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Elaine Trias. I make the cheese, my son Ben sells it, and my husband Elling stands at the counter looking trustworthy, which takes more effort than you'd think." },
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
      },
      again = {
        { id = "h_again", text = "Anything else? Cheese questions are free; the cheese isn't." },
        { id = "h_again2", text = "Ask what you like; I can wrap a wheel of cheddar and listen at once." },
      },
      choices = {
        { text = "Let me see your cheese.", next = "BUSINESS" },
        { text = "You make all of this yourself?", next = "craft" },
        { text = "What's upstairs?", next = "upstairs" },
        { text = "How does Ben like the trade?", next = "ben" },
        { text = "I've a shipment from the harbor.", next = "shipment",
          when = { any = { { questActive = TODO_QUEST("Philmor's Favor") }, { questActive = TODO_QUEST("Gatehouse Goods") } } } },
        { text = "I have business with your husband, of a sort.", next = "rogue", when = { class = "ROGUE" } },
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
      lines = { { id = "cg_default", text = "Patience, cold and keeping your hands off it. Most people can manage the cold, and very few can manage the patience, which is why most people buy their cheese from me." } },
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
        { text = "And Elling?", next = "ben_elling" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Thurman Mullby. Water, bread, bags and the little things, and if you're going out through the gate, I can tell you what you've forgotten before you've forgotten it." },
        { id = "h_back", when = { metBefore = true }, text = "Back for more? Then you've learned the road eats bread faster than you'd think." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late shoppers are the ones who forgot something, so let's find out what it was." },
      },
      again = {
        { id = "h_again", text = "Anything else on your list? Or shall I read you mine?" },
        { id = "h_again2", text = "What else, friend?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What do people forget?", next = "list" },
        { text = "Who's at the other counter?", next = "edna" },
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
    knows = { { id = "tp_knows", text = "I hear what people say while they count their coins, which is more than you'd think. Ask away." } },
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
    first = "Gunther Weller judges a buyer by how they hold a blade, not by what they say about it. He has little patience for shine and a great deal for balance.",
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
    hello = {
      lines = {
        { id = "h_default", text = "Gunther Weller. Marda and I keep this arsenal, and we sell steel that does what it's meant to, which is more than I can say for half the shine on the auction house floor." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "You've got a fighter's grip, so you'll want something with weight. Try the axes on the far wall and see what your arm says." },
      },
      again = {
        { id = "h_again", text = "What else? I've a blade to finish." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "What's wrong with the auction house?", next = "auction" },
        { text = "Who's the fellow teaching in the corner?", next = "woo" },
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
    first = "Crier Goodman carries the city's news in a voice made for a parade ground and a heart that loves gossip. He announced me to half the street before I'd introduced myself.",
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
      text = "A priest of the Cathedral! The Light's servants answer more of my calls than you'd think, and they come home more often, too." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A son or daughter of Stormwind! I cry the King's news, friend, and it's yours before anyone's." },
    { id = "n_level", cat = "deed", when = { minLevel = 55 },
      text = "I know that look, hero. You've been where my notices point, haven't you, and come back to read the next one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
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
      },
      again = {
        { id = "h_again", text = "More news, hero? I've barely cleared my throat." },
        { id = "h_again2", text = "What else would you hear? Ask, and I'll proclaim it." },
      },
      choices = {
        { text = "What's the news from the north?", next = "plague", when = { minLevel = 50 } },
        { text = "What's this new frontier in Kalimdor?", next = "frontier", when = { minLevel = 50 } },
        { text = "Who's calling for help in Feralas?", next = "feralas", when = { minLevel = 50 } },
        { text = "Do you believe everything you cry?", next = "believe" },
        { text = "What do the heroes say when they come back?", next = "heroes" },
        { text = "Do you cry any news of the Skyborne?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Not now, Goodman.", next = "END" },
      },
    },

    plague = {
      big = true,
      lines = { { id = "p_default", text = "The kingdom calls all able heroes north against the Scourge! Commander Ashlam Valorfist has made his camp at Chillwind, beyond the Alterac Mountains, and he needs every blade and every prayer that'll go.",
        fx = { learn = { "argent_dawn", "scholomance" } } } },
      choices = {
        { text = "Who's left in the Plaguelands to save?", next = "plague_who" },
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
    knows = { { id = "tp_knows", text = "Every notice in the city crosses my throat sooner or later! Ask, and I'll cry what I can." } },
    background = { { id = "tp_bg", text = "A crier, born with a voice and the sense to use it for the crown. I've shouted the news on these streets longer than some of those statues have stood." } },
    advice = { { id = "tp_ad", text = "Read the whole notice before you set off, hero. Half the dead in this world only read the reward." } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dungar Longdrink, gryphon master of Stormwind. Every bird on this roost flies home to me, and they'll take you anywhere you've already been, as long as you've been there." },
        { id = "h_crate", tags = { "news" }, when = { questActive = TODO_QUEST("Dungar Longdrink") },
          text = "That's Osric's crate! You walked all the way here with it, did you? Look at your brow; next time you take a gryphon, and that's the first lesson." },
        { id = "h_lewis", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Lewis") },
          text = "If you've met Thor at Sentinel Hill, one of mine will take you straight to him. Then hand the crate to Quartermaster Lewis before the Westfall lads go without." },
        { id = "h_storm", when = { timeOfDay = "night" },
          text = "Night flights are smooth, but the birds don't like them. Hold tight over the Westfall coast; the wind's always worse after dark." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}? The birds are getting restless." },
        { id = "h_again2", text = "Ask away. I've a gryphon to feed, but I can talk while I do it." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why only where I've already been?", next = "routes" },
        { text = "How do you keep them all?", next = "birds" },
        { text = "What's in Osric's crate?", next = "crate",
          when = { any = { { questActive = TODO_QUEST("Dungar Longdrink") }, { questActive = TODO_QUEST("Return to Lewis") } } } },
        { text = "I'll walk.", next = "walk" },
        { text = "Would a gryphon ever take to a hunter?", next = "hunter", when = { class = "HUNTER" } },
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
        { text = "Fair enough. I'll fly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Morgan Pestle. My brother William keeps our shop in Goldshire and I keep this one, and the Bouchers by the door sell the reagents so I can get on with the brewing." },
        { id = "h_shipment", tags = { "news" }, when = { questActive = TODO_QUEST("Shipment to Stormwind") },
          text = "William's candles, at last! He sends them with whoever's walking this way, and you're the first in weeks who hasn't dropped the box. I'll pay you properly, don't worry." },
        { id = "h_shipment_done", tags = { "news" }, when = { questDone = TODO_QUEST("Shipment to Stormwind") },
          text = "The candles you brought are already half gone, rendered for wax. I'll need another box before the month's out, so if you see William, remind him." },
        { id = "h_william", when = { heardLine = "pestle.l_default" },
          text = "William's been telling you about the young lovers, hasn't he? He's soft about that sort of thing, always was, and I tell him so in every letter." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a flask on the heat." },
        { id = "h_again2", text = "Go on, briefly." },
      },
      choices = {
        { text = "Let me see your potions.", next = "BUSINESS" },
        { text = "Why does an apothecary need candles?", next = "candles" },
        { text = "Tell me about your brother.", next = "william" },
        { text = "Teach me something about the craft.", next = "craft", when = { profession = "Alchemy" } },
        { text = "Do you brew poisons, Morgan?", next = "rogue", when = { class = "ROGUE" } },
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
        { text = "Do you miss Goldshire?", next = "william_goldshire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    william_goldshire = {
      lines = { { id = "wg_default", text = "I miss the quiet. I don't miss the inn's ale or the stories William tells over it, and I'd thank you not to repeat that to him." } },
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
      lines = { { id = "rogue_l", text = "No, and if you've come to ask, you've come to the wrong Pestle and the wrong street. Jasper Fel in Old Town sells that sort of thing, and I'd rather not know what's in his bottles." } },
      choices = {
        { text = "A poison's just a potion with a purpose.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fair. I'll keep your shop clean of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
  },

  topics = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Harlan Bagley, and this is my armory. Carla sells the cloth, Lara the leather and Aldric the mail, and I count the coin, which is more of it lately than I know what to do with." },
        { id = "h_resupply", tags = { "news" }, when = { questActive = TODO_QUEST("Harlan Needs a Resupply") },
          text = "You've got my note for Rema? Good. The Canal Tailor and Fit Shop, just by the bridge to Cathedral Square, and tell her I'll take every knitted shirt she can spare." },
        { id = "h_resupply_done", tags = { "news" }, when = { questDone = TODO_QUEST("Harlan Needs a Resupply") },
          text = "Rema's load came in this morning, and half of it's sold already. I owe you thanks, and I'm starting to think I owe her a share." },
        { id = "h_rema", when = { heardLine = "rema.h_default" },
          text = "Rema asked you why I need so much, didn't she? She asks me every time, and every time I tell her I don't know, and that's the truth." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick; there's a queue." },
        { id = "h_again2", text = "Anything more you need before you go? Armor doesn't mend itself." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Why is business so good?", next = "boom" },
        { text = "Do you need anything carried?", next = "resupply", when = { ["not"] = { questDone = TODO_QUEST("Harlan Needs a Resupply") } } },
        { text = "Who are your three sellers?", next = "staff" },
        { text = "Warriors go through armor fast. Who else is buying?", next = "warrior", when = { class = "WARRIOR" } },
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
        { text = "Which is better?", next = "staff_better" },
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
    knows = { { id = "tp_knows", text = "When folk buy armor they tell you where they're going, and why. Ask me what I've heard." } },
    background = { { id = "tp_bg", text = "I keep an armory, and I keep the books for it. There's no more to tell than that, though the books have got thicker this year." } },
    advice = { { id = "tp_ad", text = "Buy the armor before you need it. Everyone's figured that out this year except the ones still standing in my queue." } },
    defias = { { id = "tp_defias", text = "They're one reason folk buy armor, I'd guess. Westfall's not far enough away for anyone's comfort.", next = "boom" } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I sell armor, and I've barely time for that." } },
  },
}
