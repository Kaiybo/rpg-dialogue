-- Stormwind, the Canals and the harbor: the winery, Ol' Emma and her buckets, the tailor by the
-- bridge, the fishing trainer, a beggar, a boy with fish stories and the harbor's clerk.
-- Voice: bibles/canals.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "suzetta", id = TODO_NPC("Suzetta Gallina"), name = "Suzetta Gallina",
  bible = "bibles/canals.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "practical", "loyal" },
  notices = { "light", "kin", "drink" },
  impression = {
    first = "Suzetta Gallina runs the Gallina Winery and keeps a tally of every free bottle her brother promises the city. She pours them anyway, with a sigh that is mostly for show.",
    third = "{name} met Suzetta Gallina, who runs her family's winery on the Stormwind canals.",
  },

  greetings = {
    { id = "g_winery", text = "Welcome to the Gallina Winery. Mind the barrels by the door; Roberto counts them." },
    { id = "g_ticket", when = { questActive = TODO_QUEST("Wine Shop Advert") }, text = "Let me guess: my brother gave you a ticket. Of course he did." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. The Cathedral orders its wine elsewhere, which I've never understood, so do tell them where you found a better red." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A Stormwind face. You've walked past our door a hundred times, I expect, and never once come in, until Renato shouted at you." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a few already, haven't you? I'll pour you something gentle and you'll thank me in the morning." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every tavern keeper from here to the Trade District drinks on his promises, and I keep the tally. He calls it good business, and I call it the reason I go grey." } },
      choices = {
        { text = "Keep your tally. Promises poured should be promises paid.", next = "BACK", reply = "That's what I keep telling him, and he pours anyway. You'd make a better wine merchant than my brother.", fx = { align = { honor = 1 } } },
        { text = "Let him pour. Generous men bring custom back.", next = "BACK", reply = "Generous men go broke too, friend, and slowly. I'll keep my tally, all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Oh, they buy, and they buy the cheapest red we stock by the barrel, and they never once ask the vintage. Renato once gave them a crate of tickets for free tastings, and I spent a month mopping up after a pack of grim folk in black robes who never once said thank you." },
      },
      choices = {
        { text = "Then I'll pay for my bottle and say thank you.", next = "BACK", reply = "Thank you. You're the first from that end of town who's said it.", fx = { align = { honor = 1 } } },
        { text = "Renato gives tickets away. I'll take one.", next = "BACK", reply = "Then you'll be the hundredth, and I'll write it in the tally with the rest.", fx = { align = { honor = -1 } } },
        { text = "Something else, Suzetta.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Give them a corner and they'd take the whole hillside and the cellar with it, because a boar has no idea of sharing. Still, Roberto says the old vines grew better when the woods came closer, and I've never known him to be wrong about grapes." } },
      choices = {
        { text = "The vines are yours. Fence the boars out and keep them out.", next = "BACK", reply = "That's what I'd do, but Roberto won't hear of it. He'd sooner talk to the boars.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The boars were there first. Leave them their corner and plant elsewhere.", next = "BACK", reply = "Elsewhere, he says, as if we had a second hillside. I'll tell Roberto you agree with him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He froze half a cask solid and the cask split, so we lost the wine and the barrel together. He offered to pay, which was decent of him, though he paid in copper and apologies, and I can only bank one of those." } },
      choices = {
        { text = "Then he owes you, and you should hold him to it.", next = "BACK", reply = "I did, and I'm still holding him. He's paying it off in copper, one week at a time.", fx = { align = { order = 1 } } },
        { text = "Let it go. Apprentices are poor, and it was only wine.", next = "BACK", reply = "Only wine? Tell that to Roberto, who nearly wept over the cask. I'll let it go, mostly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every blasted week, because the casks don't roll themselves up from Roberto's cellar. But I'll not pay a sword's wage for porter's work, so if you're here for coin, try the Barracks instead." } },
      choices = {
        { text = "An honest day's lifting never shamed anyone.", next = "BACK", reply = "There's a sensible soul. Grab the other end of this cask, then.", fx = { align = { order = 1 } } },
        { text = "I swing a sword. I don't roll barrels.", next = "BACK", reply = "Then I'll find someone who does, and I'll not pay a sword's wage for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They come down out of Elwynn's woods when the grapes ripen and they eat the lot, skins and all. Renato calls it a tragedy in three acts; I call it a line in my ledger that never balances." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They come down out of Elwynn's woods when the grapes ripen and they eat the lot, skins and all. Your {pet} has a good nose, I'd wager. If it ever wants work, the boars come at dusk and they come hungry." },
      },
      choices = {
        { text = "I'll thin the boars and take only what the vines can spare.", next = "BACK", reply = "Good. Thin them and spare the vines, and I'll pour you a glass for your trouble.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt them if the price is right, and not before.", next = "BACK", reply = "Then name your price, and I'll see whether the grapes are worth it. Often they aren't.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Bottle by bottle and ticket by ticket, and each one goes in my tally. He says it's good for the name, and I say a name doesn't pay the cellar's rent, but somehow I always end up pouring anyway." } },
      choices = {
        { text = "A promise made is a promise kept, even a free bottle.", next = "BACK", reply = "That's Renato's argument too. I'll honour it, but I'll grumble while I do.", fx = { align = { honor = 1 } } },
        { text = "Then stop honouring his tickets and let him answer for them.", next = "BACK", reply = "I'd love to, but then I'd have to explain it to the customers. He's cleverer than he looks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Renato will try to give you a free bottle, and I'll ask you, as someone sworn to honour, to pay for it anyway." },
        { id = "h_default", key = true,
          text = "Suzetta Gallina. My brother Renato sells the wine in the square and hands out tickets for free bottles, Julia sells it at the counter and Roberto keeps the cellar, so somebody has to keep the books, and that's me." },
        { id = "h_ticket", tags = { "news" }, when = { questActive = TODO_QUEST("Wine Shop Advert") },
          text = "Renato's ticket, and that's the fourth today. Here's your bottle of the house red, and if you like it, come back and pay for one, because that's the part he always forgets." },
        { id = "h_ticket_done", when = { questDone = TODO_QUEST("Wine Shop Advert") },
          text = "You came back! Renato will be insufferable about it, so I won't tell him, and you won't either." },
        { id = "h_merlot", when = { questActive = TODO_QUEST("Dry Times") },
          text = "A cask of merlot for Lakeshire? Roberto has one ready; Barkeep Daniels writes to us whenever the roads are open, and lately they rarely are." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Please don't conjure anything near my barrels, because Roberto still talks about the apprentice who tried to make the merlot colder." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Mind your elbows near the shelves, please; the last soldier who leaned on them cost us two casks and a very long argument with Roberto." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you smell of the woods, which is nicer than most of what walks in off the canals. Roberto will want to know if you've seen any wild boar near the vineyards." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! If you can talk sense into the boars at our vineyard you'd be the first, and Roberto would stop complaining for a whole week." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You'll take your wine like anyone else, I hope, and not ask me to pour a glass for the little one." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, is it? If your spirits can tell me where my brother sends all his free bottles, I'll pour you one myself." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've columns to add." },
        { id = "h_again2", text = "Another question? Pour yourself a taste while you think of it." },
      },
      choices = {
        { text = "Let me see the wines.", next = "BUSINESS" },
        { text = "Renato hands out a great many tickets, I notice.", next = "tickets" },
        { text = "Who is Roberto?", next = "roberto" },
        { text = "How does a winery do on the canals?", next = "canals" },
        { text = "A good red is a small blessing.", next = "priest", when = { class = "PRIEST" } },
        { text = "Someone's skimming your books, I'd wager.", next = "rogue_tally", when = { class = "ROGUE" } },
        { text = "Something tells me the apprentice ruined the merlot.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the winery ever need a strong back, Suzetta?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do boars really trouble the Gallina vines?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is Renato really giving the winery away, Suzetta?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you let the boars keep a corner of the vineyard, Suzetta?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the winery sell to the Slaughtered Lamb, Suzetta?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does Renato really give away so much wine, Suzetta?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    tickets = {
      lines = { { id = "t_default", text = "This month, sixty-one. I keep a tally, because if I didn't, he'd hand out the whole cellar and call it marketing." } },
      choices = {
        { text = "I doubt it works, though.", next = "tickets_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tickets_work = {
      lines = { { id = "tw_default", text = "Annoyingly, it does. One in three comes back to buy, which is better than any sign I could hang. Don't tell him I said so, or he'll start giving away casks." } },
      choices = {
        { text = "Generosity pays. He's right.", next = "BACK", reply = "It does, curse it. Don't tell him you agreed, or he'll give away the cellar.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Charge him for every bottle he gives away.", next = "BACK", reply = "I've tried, and he only gives away more to make up for it. Brothers.", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },

    roberto = {
      lines = { { id = "r_default", text = "Roberto knows more about merlot than any man in the kingdom, and he'll tell you so at length. He sells it by the cask, and taverns as far off as Lakeshire send for it." } },
      choices = {
        { text = "Why Lakeshire?", next = "roberto_lakeshire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roberto_lakeshire = {
      lines = { { id = "rl_default", text = "Because Barkeep Daniels has taste and no merchants willing to brave the road. With the orcs about, his cellar runs dry and he has to beg travellers to carry a cask up for him.",
        fx = { learn = { "blackrock" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    canals = {
      lines = { { id = "c_default", text = "Well enough, though the damp gets into everything but the wine. The canal folk drink less than the Trade District and pay more promptly, which I find I prefer." } },
      choices = {
        { text = "Who are the canal folk?", next = "canals_folk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canals_folk = {
      lines = { { id = "cf_default", text = "Tailors, fishers, the old women who carry water and the beggars who sit on the bridges. Ol' Emma comes by every day with her buckets and tells me my barrels are in her way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      lines = { { id = "p_default", text = "Then bless a bottle for me, if you're allowed. Renato would sell it for twice the price, which is exactly why I won't tell him." } },
      choices = {
        { text = "Blessings aren't for selling.", next = "BACK", reply = "No, they aren't, and that's why I'll keep it on my own shelf. Thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Sell it. The Light won't mind the profit.", next = "BACK", reply = "Ha! You're worse than Renato. I'll keep the blessing and the profit both to myself.", fx = { align = { light = -1 } } },
      },
    },
    rogue_tally = {
      lines = { { id = "rogue_tally_l", text = "Is that a guess or a confession? Because the numbers have been short by two bottles a week since spring, and I've been blaming Roberto's thirst." } },
      choices = {
        { text = "A guess. I'd look at the canal side door.", next = "rogue_tally2" },
        { text = "Nobody skims from family. Forget I said it.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    rogue_tally2 = {
      lines = { { id = "rogue_tally2_l", text = "The canal door, of course, where the barges tie up. I'll put a bell on it tonight, and if it's Roberto after all, I'll hang the bell round his neck." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Renato sold wine at the Darkmoon Faire one year and gave half of it away to the fire-eaters. I've still got the tally, and I'll show it to anyone who asks, and several who don't." } },
    gilneas = { { id = "tp_gilneas", text = "Gilnean wine was the finest in the north, and the vineyards are all behind that wall now. Renato says we'll make it someday ourselves, and I've told him to start with paying the cooper." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay buys our wine by the barrel and sells it to pirates by the cup, and the markup would make a goblin blush. Renato says it's good for the name, and the name's not paying the rent." } },
    dalaran = { { id = "tp_dalaran", text = "Before the plague, Dalaran's mages were our best customers, and they paid on time, which I miss more than I can say. I'd send them a case if they'd open their gates again." } },
    knows = { { id = "tp_knows", text = "A woman who keeps the books hears where the money goes, and money goes everywhere. Ask what you like." } },
    background = { { id = "tp_bg", text = "I'm a Gallina, and I'm the one who counts. Every family business needs one of us, or it's only a family." } },
    advice = { { id = "tp_ad", text = "Never let the loudest one in the family keep the money. Ours shouts in the square, and I keep the purse." } },
    _none = { { id = "tp_none", text = "Not in my ledger, I'm afraid. Try Renato; he'll make something up." } },
  },
}

P:NPC {
  key = "ol_emma", id = TODO_NPC("Ol' Emma"), name = "Ol' Emma",
  bible = "bibles/canals.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "prickly" }, values = { "stubborn", "loyal" },
  notices = { "light", "kin", "refugee" },
  impression = {
    first = "Ol' Emma carries water across the canals all day and talks to herself because, she says, nobody else in the city makes decent conversation. There's grief under the grumbling, and she doesn't want it noticed.",
    third = "{name} met Ol' Emma, the grumbling water carrier of the canals, who came south from Lordaeron long ago.",
  },

  barks = {
    { id = "b_water", text = "Water, water, always the water, and never a thank-you for the one who carries it." },
    { id = "b_rut", text = "I'll wear a rut in these stones before I'm done, see if I don't." },
  },

  greetings = {
    { id = "g_water", text = "What? Can't you see I've buckets to carry? Speak up, then, and be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, you're better company than the well, I'll give you that." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, is it? I've no sins worth your time, dearie, only bad knees, and I don't suppose the Light does knees." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City born, are you? You've the look of somebody who's never carried their own water, though I'll forgive you if you carry one bucket now." },
    { id = "n_refugee", cat = "refugee", when = { origin = "human_lordaeron_refugee" },
      text = "You talk like the north, you do. Don't tell me which village; I'd only ask after folk you won't have news of." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If it does, it's a tired one, dear, carrying the whole city's rubbish to the sea. I've carried it buckets for twenty years, so we'd understand each other." } },
      choices = {
        { text = "Then the two of you deserve some kindness from this city.", next = "BACK", reply = "Kindness? From this city? I'll believe it when I see it, dearie. Still, it's nice of you.", fx = { align = { light = 1 } } },
        { text = "Water's just water, Emma. Don't go soft on it.", next = "BACK", reply = "Soft? Me? I'm as hard as these cobbles, dearie. I only talk to the water when nobody's listening.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It could, I'm sure, and then what would I do with my days, sit on the bridge and talk to the ducks? The mages promised plenty of things in the north, before it all went to rot, and I'd sooner trust my own two arms than another spell." },
      },
      choices = {
        { text = "Then carry on, Emma. I'll not meddle with your work.", next = "BACK", reply = "Good. Somebody's got to carry it, and I'd go mad sitting still.", fx = { align = { order = 1 } } },
        { text = "Your arms won't last forever. Let the spells help.", next = "BACK", reply = "They'll last longer than the mages' promises did up north, dearie. I'll keep carrying.", fx = { align = { order = -1 } } },
        { text = "Something else, Emma.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Kinder? It's had the whole city emptied into it since before my Harold was born, and nobody's thanked it once. I carry from the well by the Cathedral now, because the canals stink worse every summer." } },
      choices = {
        { text = "The Crown should forbid fouling the canals and fine whoever does it.", next = "BACK", reply = "Fine whoever does it? Then they'd have to fine the whole Trade District, and the nobles first.", fx = { align = { order = 1 } } },
        { text = "No law fixes that. People must learn to care for water themselves.", next = "BACK", reply = "They'd have to learn a great deal, dearie, and I'm too old to wait. I'll keep carrying.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More every year, dearie, since the masons went off to Westfall and their boys stayed behind with nothing to do. They don't bother me, because a woman with buckets has nothing they want, but they bother everybody else." } },
      choices = {
        { text = "Those boys should be caught and made to answer for it.", next = "BACK", reply = "Caught by whom, the guards? They've their hands full, dearie. I'll keep my bucket handy.", fx = { align = { order = 1 } } },
        { text = "I can't blame them much, since the city gave them nothing.", next = "BACK", reply = "Nor can I, dearie, not really. Their fathers built this city and got nothing for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Frighten me? I came south with the plague at my back, dearie, so a few candles in a cellar don't keep me up at night. It's the folk who go down those stairs and come up looking hungry that I mind." } },
      choices = {
        { text = "I keep what I bind on a short leash, Emma.", next = "BACK", reply = "See that you do, dearie. I've seen what comes back up those stairs.", fx = { align = { light = 1 } } },
        { text = "Hungry is how you get anywhere in this world, Emma.", next = "BACK", reply = "Hungry gets you places, aye, and it gets you into the canal with a knife in your back, too. Mind yourself, dearie.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Just the one, dearie, and he came home with a broken nose and a story that got longer every winter. He always said the hardest part of soldiering was standing still while everyone else ran about." } },
      choices = {
        { text = "Standing your ground is the hardest thing there is.", next = "BACK", reply = "It is, and my Jem knew it. He'd have liked you, I think.", fx = { align = { order = 1 } } },
        { text = "Better to charge in than stand guarding an empty bridge.", next = "BACK", reply = "Then you'd have been the broken nose, dearie, and the story'd be about you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I grew up on a farm past Goldshire, dearie, and I miss the crickets and nothing else. The wolves took two of my father's sheep every spring, and he never once forgave them for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I grew up on a farm past Goldshire, dearie, and I miss the crickets and nothing else. And who's this, then? {pet}, is it?" },
      },
      choices = {
        { text = "The wolves only take what they need to live, Emma.", next = "BACK", reply = "They do, and my father never blamed them. He just shot them.", fx = { align = { light = 1 } } },
        { text = "A wolf that takes sheep should be put down, plain and simple.", next = "BACK", reply = "That's what my father said, and he wasn't wrong. Still, I miss the howling some nights.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "There's a farm in the north I won't name, and folk on it I won't name either, because the plague took them and I wasn't there. Say a word for them if you like, dearie, but don't make a fuss of it, and don't tell me when you've done it." } },
      choices = {
        { text = "I'll pray for them quietly, Emma, and never say a word.", next = "BACK", reply = "Thank you, dearie. That's more than I can say for myself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The north is lost, Emma. Better to let them go.", next = "BACK", reply = "Lost it is, but they're not, not to me. I'll keep them, if you don't mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_hogger_emma", when = { killed = { name = "Hogger" } },
          text = "My nephew drives a cart to Goldshire, and he came home saying Hogger's dead and a hero killed him. I told them I'd seen that very hero walk past my door with a sword on their back, and nobody believed me." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, is it? Well, don't go looking at me like I need saving, dearie, because I've only got sore arms and a long memory." },
        { id = "h_default", key = true,
          text = "They call me Ol' Emma, as if I'd never been young, and I carry the water for this whole street. Of course I talk to myself, dearie; it's the only decent conversation in this city." },
        { id = "h_parcel", tags = { "news" }, when = { questActive = TODO_QUEST("Good Natured Emma") },
          text = "Felstone? Who's been saying that name to you? I'd chase you off my lawn, if this city had left me one, so you'd better tell me what you're holding." },
        { id = "h_charm", tags = { "news" }, when = { questActive = TODO_QUEST("Good Luck Charm") },
          text = "You'll take it to her? Then go gently, because Janice always did startle easy, and I don't suppose being dead has helped." },
        { id = "h_charm_done", tags = { "news" }, when = { questDone = TODO_QUEST("Good Luck Charm") },
          text = "You took it back to Janice. I've not said thank you to anybody in a long while, and I'm not sure I remember how, but there it is." },
        { id = "h_janice", when = { heardLine = "janice.h_default" },
          text = "You've a look about you like you've seen a ghost, and you'd not be the first who came to me looking like that. Out with it." },
        { id = "h_rain", when = { timeOfDay = "dusk" },
          text = "Last trip of the day, and my arms know it. Back home we had a pump in the yard, and I never once thought I'd miss a pump." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've light fingers, I can see it in how you hold them, so keep them off my buckets. There's nothing in them worth stealing but water, and water's heavy." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's something cold coming off you, like the cellar of the Lamb down the way. I don't ask what goes on down there, and you'll not tell me, so we're even." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Oh, a warrior, dearie, all clank and shoulders. My Harold was a soldier once, though he spent the whole of the Second War guarding a bridge that nobody wanted to cross." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? You've mud on your boots and leaves in your hair, dearie, and you'll not track any of that across my clean step." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, carrying nothing at all, while I've two buckets and a bad back. Your lot can turn into beasts, so I'm told, though none of you ever turns into a mule." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Another one from the Quarter, with your nose in the air and your robes in the puddles. Mind the buckets." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Talking to spirits now, are you? Well, I talk to myself, so who am I to judge where folk find decent conversation?" },
      },
      again = {
        { id = "h_again", text = "Well? I've not got all day, and neither has this bucket." },
        { id = "h_again2", text = "Something else? Ask while I've a hand free." },
      },
      choices = {
        { text = "Let me carry a bucket for you.", next = "carry" },
        { text = "That's a lot of water for one woman to carry.", next = "water" },
        { text = "You don't sound like you're from Stormwind, Emma.", next = "home" },
        { text = "Is your name Felstone?", next = "felstone",
          when = { any = { { questActive = TODO_QUEST("Good Natured Emma") }, { questDone = TODO_QUEST("Good Natured Emma") } } } },
        { text = "You sound like the north, Emma. I'm from Lordaeron too.", next = "north", when = { origin = "human_lordaeron_refugee" } },
        { text = "The Silver Hand has always stood for common folk, Emma.", next = "silverhand", when = { class = "PALADIN" } },
        { text = "I'd wager plenty of thieves work these streets, Emma.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did your Harold ever see a real fight, Emma?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you ever miss the country, Emma?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Lamb's cellar frighten you, Emma?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you like me to pray for someone, Emma?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would the canal water be fit to drink if the city treated it kinder?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Couldn't magic carry your water for you, Emma?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think the canal water has a spirit, Emma?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    carry = {
      lines = { { id = "c_default", text = "Will you, now? Well, don't slop it, and don't expect a copper for it either, because I've none to give. There, you see, you're half wet already." } },
      choices = {
        { text = "Glad to help, Emma.", next = "carry_thanks", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_thanks = {
      lines = { { id = "ct_default", text = "Hmph. The young ones round here never offer, and here's you with places to be. I'll not say you're a good sort, mind, but I'll not say you aren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    water = {
      lines = { { id = "w_default", text = "For the shops and the houses and that fool in the blue robe with all his brooms. Get the water, Emma, fetch the water, Emma, and without me that lot would forget what water's for." } },
      choices = {
        { text = "Who's the fool in the blue robe?", next = "water_robe" },
        { text = "They ought to carry their own.", next = "BACK", reply = "They ought to, and they never will. That's why I've still got a job.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Every street needs someone to do the work.", next = "BACK", reply = "It does, and I'm it. Nobody thanks the bucket, dearie.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    water_robe = {
      lines = { { id = "wr_default", text = "Never you mind who, but one of these days I'll drown him in that robe, brooms and all. He thinks magic will sweep a floor, and then who mops up after? Me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    home = {
      big = true,
      lines = { { id = "h2_default", text = "North, a long way north, in Lordaeron, before the plague. A farm, with a pump in the yard, and I'll not say more than that, because there's nobody left there to say it to." } },
      choices = {
        { text = "Nobody at all?", next = "home_family" },
        { text = "I'm sorry, Emma.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_family = {
      lines = { { id = "hf_default", text = "My Jem went in the first war with the orcs, and I've had no word of my boys or my sister since the plague came. You do the sum yourself, dearie; I've done it more times than I can count." } },
      choices = {
        { text = "No word isn't the same as no hope.", next = "home_hope", fx = { align = { light = 1 } } },
        { text = "Some sums are better left alone.", next = "BACK", reply = "Some are, dearie. Thank you for not asking me to do it.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_hope = {
      lines = { { id = "hh_default", text = "Priests say that, and the young say it, and I said it too, for a year or two. Then you stop, because carrying hope's heavier than carrying water, and you've only two arms." } },
      choices = {
        { text = "The Light can carry some of it.", next = "BACK", when = { class = "PRIEST" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    felstone = {
      lines = {
        { id = "f_default", text = "Emma Felstone, of Felstone Field. Nobody in this city's called me that in years, and you'd better have a good reason for starting." },
        { id = "f_done", when = { questDone = TODO_QUEST("Good Natured Emma") },
          text = "Janice sent me the deed to the farm, as if I'd go back there and plough the plague under. I'll not, and you can tell her so, though I'd rather you told her I miss her." },
      },
      choices = {
        { text = "Your sister sent this for you.", next = "felstone_janice", when = { questActive = TODO_QUEST("Good Natured Emma") } },
        { text = "You could always go back one day.", next = "felstone_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felstone_janice = {
      lines = { { id = "fj_default", text = "Janice made this, my Janice? Then she's... no, don't tell me what you saw out there; I don't want to know how you came by it. Just give it here, and let me look." } },
      choices = { { text = "Take your time, Emma.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    felstone_back = {
      lines = { { id = "fb_default", text = "To what? A field full of the dead and a house with nobody in it. No, my place is here with my buckets, and I'll grumble about it till they bury me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    north = {
      lines = { { id = "n_default", text = "Then you know, and I don't have to say any of it. Carry on, dearie, and don't let them tell you to forget, because they all do, sooner or later." } },
      choices = {
        { text = "I won't forget.", next = "BACK", reply = "Good. That's all I ask of anybody.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "Forgetting's how some of us survived.", next = "BACK", reply = "Maybe so, dearie, but I'm too old for it now. I'll keep remembering.", fx = { align = { honor = -1 } } },
      },
    },
    silverhand = {
      big = true,
      lines = { { id = "silverhand_l", text = "Has it? Then where was it the week the grain carts came, dearie, and the sickness after? Your sort rode through our village once, all shining, and never came back when we needed you." } },
      choices = {
        { text = "You're right, and I'm sorry. We failed you.", next = "silverhand2", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Hand bled for Lordaeron. Don't forget that.", next = "silverhand2", fx = { affinity = -1, align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    silverhand2 = {
      lines = { { id = "silverhand2_l", text = "Well. You can carry a bucket, at least, which is more than the last one did. Pick it up, then, and we'll call it a start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "My boy went north to Lordaeron as a soldier, and he never came home, and they won't tell me whether he's dead or worse. I carry water so I don't have to think about it, and it mostly works." } },
    forsaken = { { id = "tp_forsaken", text = "They say the dead in Lordaeron have woken up and made a kingdom of their own, the Forsaken they call themselves. I'd ask after my boy if I thought they'd answer an old woman, and that's a terrible thing to want." } },
    holy_light = { { id = "tp_holy_light", text = "I go to the Cathedral every morning, and I sit at the back, and I tell the Light it owes me one. Bishop Farthing says that's a prayer too, and I'll take his word on it." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was a lovely town once, I had a cousin there who sold ribbons in the market. Now it's the dead and the madmen in red, and I've stopped asking after the ribbons." } },
    knows = { { id = "tp_knows", text = "I walk this street a hundred times a day, and folk talk in front of an old woman like she's a lamppost. Go on, ask." } },
    background = { { id = "tp_bg", text = "A farm wife from the north who carries water now, and that's all the story anybody needs.", next = "home" } },
    advice = { { id = "tp_ad", text = "Respect your elders, dearie, and carry their buckets now and again. You'll be old yourself, if you're lucky." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The Scarlet Crusade are burning half the north to save the other half, they tell me. I've seen enough burning; I don't need theirs." } },
    _none = { { id = "tp_none", text = "How should I know? I carry water, dearie, so ask somebody who sits down for a living." } },
  },
}

P:NPC {
  key = "rema", id = TODO_NPC("Rema Schneider"), name = "Rema Schneider",
  bible = "bibles/canals.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "warm" }, values = { "kind", "hardworking" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Rema Schneider sews for most of the Trade District's merchant families from her shop by the canal bridge, and she worries aloud about why everyone suddenly wants sturdy clothes. She suspects the nobles know something the rest of us don't.",
    third = "{name} met Rema Schneider, the tailor of the Canal Tailor and Fit Shop by the bridge to Cathedral Square.",
  },

  greetings = {
    { id = "g_shop", text = "Come in, dear, and mind the pins on the floor. Corbett, where's that bolt of linen?" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Those robes have seen some road, dear. Let me look at the hem before it lets you down at the altar." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City born, are you? I may have sewn your mother's wedding dress, then; I've sewn half of them on this side of the canal." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, look at the state of you, torn at every seam. Whatever you've been fighting, it's had the better of your clothes." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Hard roads or hard weather, and they won't say which. A tailor learns to read an order the way you might read the wind, and this one smells of trouble." } },
      choices = {
        { text = "Then sew what they ask and keep your ears open.", next = "BACK", reply = "That's what I'll do, dear. My ears are as sharp as my needles.", fx = { align = { order = 1 } } },
        { text = "The nobles hoard while the rest of us guess. Ask them outright.", next = "BACK", reply = "Ask them? They'd send me back with a bill for the asking. I'll keep guessing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not if you mean to keep the seams, dear, because nothing I sew stretches that far. Your people must have some trick to it, and I'd give a good deal to know it, though I suspect you'll say it's Elune's business and not a tailor's." } },
      choices = {
        { text = "A druid's secrets aren't mine to share, Rema, and I'll keep them.", next = "BACK", reply = "Of course, dear, and I'd not ask you to break a confidence. I'll keep wondering.", fx = { align = { honor = 1 } } },
        { text = "I'd tell you if I knew, and you could sell it citywide.", next = "BACK", reply = "That's sweet, dear, though I suspect the druids would have something to say about it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I sew for anyone who pays, dear, and some of them ask for deep pockets and quiet seams without telling me why. I don't ask either, because a tailor who asks questions soon sews for nobody." } },
      choices = {
        { text = "You should ask, because you don't know what those pockets carry.", next = "BACK", reply = "Perhaps I should, dear, but then I'd have fewer customers and more worries.", fx = { align = { order = 1 } } },
        { text = "Good. A tailor's business is the seams, not the customer.", next = "BACK", reply = "Exactly, dear. Seams are honest; customers are their own business.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Dozens a month, dear, and Thurman tells me Larson's shop sees even more, being right under the tower. I've started lining the cuffs with a second layer, because fire is fire whoever lit it." } },
      choices = {
        { text = "The apprentices should own up to their own scorch marks.", next = "BACK", reply = "They should, but they never do. I've stopped asking, and started doubling the cuffs.", fx = { align = { honor = 1 } } },
        { text = "A clever apprentice blames the next one over. That's just sense.", next = "BACK", reply = "Ha! That's a very Quarter way of thinking, dear. I'll keep doubling the cuffs.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Thick quilted under-padding, so the mail doesn't rub them raw on a long march. Most of them only come in after it's rubbed, of course, which is soldiers all over." } },
      choices = {
        { text = "I'll take your advice and pad it properly before the march.", next = "BACK", reply = "There's a soldier with sense. Come back before the march, not after.", fx = { align = { order = 1 } } },
        { text = "A little chafing never hurt anybody. Leave it be.", next = "BACK", reply = "You say that now, dear. Come and see me after Redridge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dull colours, tight weave and nothing that rustles, because a hunter in a silk shirt might as well ring a bell. We dye a woodland green that sells well to the Westbrook men, though they'll never admit they buy from a city shop." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Dull colours, tight weave and nothing that rustles, because a hunter in a silk shirt might as well ring a bell. Your {pet} is shedding on my bolts, love. I'll forgive it this once, because it has lovely eyes, but don't let it near the wool." },
      },
      choices = {
        { text = "Plain and quiet suits me. The hunt isn't for showing off.", next = "BACK", reply = "Exactly, dear. I'll find you something in woodland green.", fx = { align = { order = 1 } } },
        { text = "I'll wear what I like. The deer can look if they want.", next = "BACK", reply = "They'll do more than look, dear; they'll run. Still, I'll sew what you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Bandage linen by the bolt, more every month, and that's what frightens me. When the healers start buying cloth by the bolt, somebody somewhere expects a great many people to bleed." } },
      choices = {
        { text = "Whatever's coming, we'll meet it with faith, Rema.", next = "BACK", reply = "I hope so, dear, and I'll pray for it. I'll keep sewing in the meantime.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't stop it. Sell them the linen and save your coin.", next = "BACK", reply = "Prayers won't, but linen might. I'll sell it, dear, and I'll worry about it too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Merchants, nobles' stewards and the guard, and not one of them will tell me why. If the House of Nobles knows something's coming, it would be a fine thing if they told the people who'll be wearing the trousers." } },
      choices = {
        { text = "The crown has its reasons. Trust it to warn us in time.", next = "BACK", reply = "I hope so, dear. I'd like to think the crown's listening.", fx = { align = { order = 1 } } },
        { text = "The nobles hoard what they know. Folk deserve the truth.", next = "BACK", reply = "They do, and they always have. I'll keep my ears open, dear.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, and a hem worn thin from kneeling, I'd wager. The Cathedral's novices come to me in droves, though lately it isn't robes the Cathedral wants from me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and that tabard's been mended by someone who didn't know a needle from a nail. Let me see to it before you go out again." },
        { id = "h_default", key = true,
          text = "Rema Schneider, and this is the Canal Tailor and Fit Shop. We sew for merchant households all along the canal, and lately it's knitted shirts and sturdy trousers, more than we can manage." },
        { id = "h_harlan", tags = { "news" }, when = { questActive = TODO_QUEST("Harlan Needs a Resupply") },
          text = "A note from Harlan, and another order. Business is booming, he says, and that's good, but I wonder why the whole city needs armor all at once. I've heard of no war." },
        { id = "h_thurman", tags = { "news" }, when = { questActive = TODO_QUEST("Package for Thurman") },
          text = "Larson Clothiers, in the Mage Quarter, the shop further in by the tower. Give Thurman his kit and tell him his mother says he can't fool her." },
        { id = "h_thurman_done", tags = { "news" }, when = { questDone = TODO_QUEST("Package for Thurman") },
          text = "Thurman got his kit, and I hear he grumbled. He thought if he forgot it he'd get a day off; he's clever enough to scheme and not clever enough to get away with it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Dark cloth, soft soles and no buckles to catch the light, dear, so whoever outfitted you knew exactly what they were doing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Mage robes again! Every apprentice in the Quarter scorches the cuffs, and not one of them will admit it was his own spell." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you've torn your padding at the shoulder again, I can see it from here. Everyone in armor wants a cushion under the mail until they need one sewn." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in my shop! You'll be wanting something that doesn't flap in the wind and frighten the deer, I suppose." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and in good leather, though I've heard your sort change shape and leave their clothes behind. Tell me that's only a rumour, dear, because I can't sew for a bear." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Spirits of the earth, they say you hear. Ask them why every noble in town suddenly wants sturdy clothes, would you?" },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? Corbett, don't you dare sit down." },
        { id = "h_again2", text = "What else? I can talk with pins in my mouth, mostly." },
      },
      choices = {
        { text = "Let me see your clothes.", next = "BUSINESS" },
        { text = "Everyone seems to want sturdy clothes these days.", next = "worry" },
        { text = "Your son doesn't work here with you, I see.", next = "thurman" },
        { text = "I don't think I know Corbett.", next = "corbett" },
        { text = "Could you look at my robes?", next = "priest", when = { class = { "PRIEST", "MAGE", "WARLOCK" } } },
        { text = "Do you sew for people who'd rather not be seen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you mend many scorched robes from the Quarter?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do warriors usually ask of a tailor, Rema?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What makes good cloth for a hunter, Rema?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does the Cathedral want from you lately, Rema?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who's buying all this sturdy cloth, Rema?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could you make a robe that survives me becoming a bear, Rema?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do you think the nobles are expecting, Rema?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    worry = {
      big = true,
      lines = { { id = "w_default", text = "And I keep wondering what's behind it. Harlan can't sell armor fast enough, I can't sew fast enough, and nobody tells the likes of us why. Is there something the nobles aren't saying?" } },
      choices = {
        { text = "What have you heard?", next = "worry_heard" },
        { text = "The nobles keep plenty from the people.", next = "BACK", reply = "Always have, dear, since before the Second War. Doesn't make it sit any easier, though.", fx = { align = { order = -1 }, opinion = { stormwind_mood = "nobles_hide" } } },
        { text = "If it were serious, the crown would say so.", next = "BACK", reply = "I hope you're right, dear. I truly do.", fx = { align = { order = 1 }, opinion = { stormwind_mood = "trust_crown" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry_heard = {
      lines = { { id = "wh_default", text = "Orcs in Redridge, bandits in Westfall and the King gone these many months. I'm a tailor, dear, so I can't fix any of it, but I can make sure you're warm while you try.",
        fx = { learn = { "defias", "blackrock" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thurman = {
      lines = { { id = "t_default", text = "My Thurman, apprenticed to the Larsons in the Mage Quarter. He'd rather be anywhere but behind a needle, and he forgets his tools whenever he thinks he might get away with it." } },
      choices = {
        { text = "Will he make a tailor?", next = "thurman_tailor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thurman_tailor = {
      lines = { { id = "tt_default", text = "He has good hands and no patience, and patience can be learned, I tell myself. If the Larsons can't teach it to him, nobody can." } },
      choices = {
        { text = "Let the boy find his own trade.", next = "BACK", reply = "I'd let him, dear, if I thought he knew what it was. He's still looking.", fx = { align = { order = -1 } } },
        { text = "A trade's a gift, and he'll thank you.", next = "BACK", reply = "I hope he will, dear. He hasn't yet, but he will.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    corbett = {
      lines = { { id = "c_default", text = "Corbett carries the finished goods up to Harlan's and anywhere else they're wanted. Good lad, slow on the stairs, and he says the same about me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      lines = { { id = "p_default", text = "Hold still. There's a tear by the cuff and the hem's coming down, and a robe that drags will trip you at the worst moment. Come by with them off, and I'll mend them for the usual price." } },
      choices = {
        { text = "Thank you, Rema, I will.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    the_stockade = { { id = "tp_the_stockade", text = "They say the prisoners have the Stockade now, and everyone in the Trade District wants clothes that'll take a knife. I don't ask why, and I charge extra for the leather." } },
    deadmines = { { id = "tp_deadmines", text = "Somebody in the Trade District's buying sailcloth by the bolt and sending it west, and I hear it ends up in the old Moonbrook mines. I've stopped selling to anyone who won't tell me what it's for." } },
    scourge = { { id = "tp_scourge", text = "The refugees from Lordaeron come in wearing rags, and some of them have been walking for weeks. I sew for them for nothing when I can, though don't tell the nobles, or they'll want theirs free too." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's costumes are the finest work I've ever seen, all silk and sequins. I asked their tailor how he did it, and he said magic, and I think he was joking, but I'm not sure." } },
    knows = { { id = "tp_knows", text = "Folk stand very still while I pin them, dear, and they talk to fill the quiet. Ask me what I've heard." } },
    background = { { id = "tp_bg", text = "A tailor with a shop by the bridge and a son who forgets his shears. There's no more to me than thread and worry." } },
    advice = { { id = "tp_ad", text = "Mend a small tear today, or you'll be buying a whole new shirt next week. That goes for more than shirts." } },
    defias = { { id = "tp_defias", text = "Bandits in masks, they say, and some of them stonemasons' lads once. It frightens folk into buying sturdy clothes, I can tell you that.", next = "worry" } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. I hear plenty over the pins and the chalk, but not that." } },
  },
}

P:NPC {
  key = "arnold_leland", id = TODO_NPC("Arnold Leland"), name = "Arnold Leland", title = "Fishing Trainer",
  bible = "bibles/canals.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "light", "kin", "craft" },
  impression = {
    first = "Arnold Leland teaches fishing on the canals as though there were no hurry anywhere in the world. Talking to him slowed my pulse a little, which may be the point of fishing.",
    third = "{name} met Arnold Leland, who teaches fishing on the Stormwind canals beside Catherine Leland's supply stall.",
  },

  greetings = {
    { id = "g_fish", text = "Now then. You've the look of somebody who needs to sit by the water awhile." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. Fishing's a sort of prayer, if you ask me, because you sit, you wait and you take what's given." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind born? Then you'll have fished these canals as a nipper, everybody did, and caught nothing but boots." },
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've a fisher's hands, I can see the line calluses. Where have you been casting? Somewhere with better fish than this, I hope." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Only when the tide turns and the harbour noise gets in. Mostly they're like me, in no hurry, and that's the whole secret of it." } },
      choices = {
        { text = "Patience catches more than force ever will, Arnold.", next = "BACK", reply = "That it does, and the fish will agree with you. Sit down a while.", fx = { align = { order = 1 } } },
        { text = "Sometimes you have to rush the water to get anything.", next = "BACK", reply = "Then you'll scare off everything in the canal. Try it my way first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Fishing's use to everybody, because the fish don't care who you are or what you keep in your satchel. Sit on the bank for an hour with nothing to do but watch a float, and you'll learn what's been rattling around in your head, and maybe you'll want some of it out." },
      },
      choices = {
        { text = "I could use an hour of quiet. Teach me.", next = "BACK", reply = "Then sit down here and hold this line. The fish will do the teaching.", fx = { align = { light = 1 } } },
        { text = "My head's full of useful things, Arnold. I'll keep them.", next = "BACK", reply = "Then keep them, and keep thinking. I'll keep fishing.", fx = { align = { light = -1 } } },
        { text = "Something else, Arnold.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The little ones, always, and the old ones too when they've fought hard enough to earn it. A man who keeps every fish soon has no fish left to keep, and I'd guess your people knew that long before I did." } },
      choices = {
        { text = "Take only what you need, and the water keeps giving.", next = "BACK", reply = "That's it exactly. My old da fished this stretch on that rule for forty years and never once came home empty.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A catch is a catch. Keep it, and let the canal worry about tomorrow.", next = "BACK", reply = "Then the canal will worry, and so will I. Leave a few for tomorrow, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Very like it, because in both you sit still, you keep quiet and you let the other fellow make the mistake. The difference is that a fish never holds it against you afterwards." } },
      choices = {
        { text = "I'd rather face my mark than wait for him to slip.", next = "BACK", reply = "Brave of you, and noisy. The fish would disagree with your method.", fx = { align = { honor = 1 } } },
        { text = "Let them make the mistake. Patience wins every time.", next = "BACK", reply = "That's the secret of it. You'd make a good fisherman.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "You could, I suppose, and they'd taste of nothing at all, like most things made by magic. A fish you've waited for tastes of the morning you spent on the bank, and no spell can cook that in." } },
      choices = {
        { text = "Some things should be earned the slow way.", next = "BACK", reply = "They should, and the fish taste better for it. Pick up a line.", fx = { align = { order = 1 } } },
        { text = "Why wait, when a spell gets dinner on the table faster.", next = "BACK", reply = "Because a spell's dinner tastes of nothing, friend. Try it my way once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, mostly, and how to hold still while something angry thrashes on the end of a line. I've known old Barracks sergeants who said the canals taught them more about timing than the drill yard ever did." } },
      choices = {
        { text = "Patience wins more fights than strength does.", next = "BACK", reply = "Spoken like one of the old sergeants. Pick up a line, then, and let's see you prove it.", fx = { align = { order = 1 } } },
        { text = "Strength wins fights. Patience is for fishermen.", next = "BACK", reply = "Strength catches no fish, friend. I'll wait for you to change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The good ones do, because hunting and fishing are the same patience with different weather. Mind, a hunter who's used to a bow can't stand losing a fish, and I've seen one try to shoot a pike out of Stonewatch Lake." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The good ones do, because hunting and fishing are the same patience with different weather. And your {pet} will want the first fish, I suppose, like every beast that's ever sat on my dock. Throw it the small ones and it'll stop staring at you." },
      },
      choices = {
        { text = "I take only what I'll eat, whether it's fish or deer.", next = "BACK", reply = "Good. That's the hunter's way and the fisherman's both.", fx = { align = { honor = 1 } } },
        { text = "If it's in the water and I catch it, it's mine.", next = "BACK", reply = "Then the canal will be empty by spring. Mind the little ones, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near enough, I'd say. You cast your line into something you can't see, you wait longer than you'd like, and every so often something answers, and you never quite know why it was today." } },
      choices = {
        { text = "Sitting here, I could learn some patience. The canal's good at teaching it.", next = "BACK", reply = "Glad somebody sees it. Sit a while, then; the canal's in no hurry, and neither am I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith's nothing like fishing, Arnold. A fish is just luck.", next = "BACK", reply = "Luck's part of faith too, friend, or so I've always thought. Sit and wait.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Patience, mostly, and that the biggest fish doesn't always fight the hardest. Some of the young knights come down here wound tight as a bowstring, and an hour on the bank does them more good than a week of drill." } },
      choices = {
        { text = "A calm mind serves duty better than a restless one.", next = "BACK", reply = "That's what I tell the young knights, and they rarely listen. You might.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A paladin's place is in the fight, not on a canal bank.", next = "BACK", reply = "Maybe so, but the fight comes faster when you're wound tight. Sit a while.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Fishing's halfway to praying, you know, all waiting and hoping and not much said, so I expect you'll take to it quicker than most." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in all that plate! You'll want to stand well back from the edge, friend, because the canals are deeper than they look and armour floats about as well as an anvil." },
        { id = "h_default", text = "Arnold Leland. I teach fishing, and Catherine there sells the poles and bait, and between us we've fished every bit of water within a day's walk of this city." },
        { id = "h_back", when = { metBefore = true }, text = "Back again! Caught anything worth bragging about, or only the ones that got away?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a patient look, like you're used to waiting in one spot for a long while, and that's half of fishing already." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at my pier! Don't go freezing the canal to get at the fish, now, because one of your lot tried it last winter and fell straight through." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior with a fishing question? Don't look so surprised; plenty of soldiers fish, because it's the only time anybody lets them sit down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll fish well, I'd bet, because you already know how to wait for something to come to you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the water's edge. You've the stillness of someone who listens to rivers, and I'd say you were halfway to being a fisherman already." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, fishing? Well, the fish won't mind, and I'll not mind either, so long as your friend keeps out of the water." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman by the water, now. Sit a while. I hear your sort and the fish might have a word or two in common." },
      },
      again = {
        { id = "h_again", text = "What else? There's no rush; the fish certainly aren't in one." },
        { id = "h_again2", text = "Go on, then, I'm listening." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "There must be a secret to it.", next = "secret" },
        { text = "Are there really fish in the canals?", next = "canals" },
        { text = "Fishing sounds a lot like waiting in an alley for a mark.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could just conjure a fish, Arnold.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt fishing teaches a warrior much worth knowing.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters make good fishermen, Arnold?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is fishing really like prayer, Arnold?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could a paladin learn anything from fishing, Arnold?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever give a fish back to the canal, Arnold?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is fishing any use to someone like me, Arnold?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the canal fish ever seem restless to you, Arnold?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    secret = {
      lines = { { id = "s_default", text = "Patience, and a good lure, and knowing when to stop. Most folk fish too hard, as if the water owed them something, and the water owes nobody anything." } },
      choices = {
        { text = "I'd like to start somewhere easy.", next = "secret_start" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_start = {
      lines = { { id = "ss_default", text = "Somewhere quiet, Elwynn's lakes, say, with Catherine's cheapest pole. Learn to wait there, and every water after that will be easier." } },
      choices = {
        { text = "I can wait. I've sat through worse than fish.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    canals = {
      lines = { { id = "c_default", text = "A few, and the children swear there are monsters. I've caught boots, a teapot and once a very surprised cat, but I've never caught a monster, and I've been looking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The fishermen in Booty Bay pull in sharks and swordfish, and they talk about it like it's nothing. I'll take a canal trout and a quiet afternoon, but I'll admit I'm jealous." } },
    gilneas = { { id = "tp_gilneas", text = "I fished with a Gilnean once who could read the sea like a book. He said the Greymane Wall cut him off from his own harbour, and he never fished again, and that seemed the saddest thing in the world." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire runs a fishing game where you hook wooden fish out of a tub. I won seven times in a row and they asked me to leave, which I took as a compliment." } },
    holy_light = { { id = "tp_holy_light", text = "The Light's in the water too, I think, when the sun comes up over the canals. I've never said that to a priest, but I've a feeling they'd agree." } },
    knows = { { id = "tp_knows", text = "Folk say a lot to a man sitting still by the water. Ask, and I'll tell you what drifted past." } },
    background = { { id = "tp_bg", text = "A fisherman who teaches now, with Catherine, on these canals. Not much of a tale, but a peaceful one." } },
    advice = { { id = "tp_ad", text = "When the road's too much, find water and sit by it. You'll go back to it a better person." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Fish, I know, and very little else." } },
  },
}

P:NPC {
  key = "morris_lawry", id = TODO_NPC("Morris Lawry"), name = "Morris Lawry",
  bible = "bibles/canals.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "cunning" },
  notices = { "light", "kin", "purse" },
  impression = {
    first = "Morris Lawry begs on the canal bridges and tells two different stories about how he lost his farm, depending on who's listening. I couldn't tell whether either was true, and I suspect he's forgotten.",
    third = "{name} met Morris Lawry, a canal beggar with a story for every passer-by.",
  },

  barks = {
    { id = "b_alms", text = "Alms for a poor bloke? Anything at all, guv, anything!" },
    { id = "b_shine", text = "A copper, and I'll polish yer armor till it gleams like the King's own!" },
  },

  greetings = {
    { id = "g_beg", text = "Could ye spare a coin, friend? Just the one, for a poor man down on his luck." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest! Bless me, holy one, and if the blessing comes with a copper in it, so much the better." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A Stormwind face, ye'll know what it's like to fall on hard times in this city, then. Or ye will, one day, so be kind now." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Light above, ye clink when ye walk! Surely a coin or two won't be missed from a purse like that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The one with the well, or the one by the river, I can never remember which story's true. Maybe your spirits know better than I do." } },
      choices = {
        { text = "The truth is worth remembering, Morris. Try for it.", next = "BACK", reply = "I'll try, guv, though the truth doesn't fill a cup as quick as a story.", fx = { align = { honor = 1 } } },
        { text = "Tell whichever story feeds you. No one will check.", next = "BACK", reply = "Bless you, guv. You've got a beggar's heart, and I mean that kind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Conjured bread! I've had it once, from a lady mage on the bridge, and it went down like a cloud and left me hungry by noon, but it was kind of her and I'll not complain. If you're offering, guv, I'll take it, and I'll pay you back on Tuesday, same as always." },
      },
      choices = {
        { text = "Here, Morris. No need to pay me back.", next = "BACK", reply = "Bless you, guv! I'll not forget it, not ever.", fx = { align = { light = 1 } } },
        { text = "Earn it first. Carry my bags to the Quarter.", next = "BACK", reply = "Carry your bags? I'll do it, guv, though my back'll complain the whole way.", fx = { align = { light = -1 } } },
        { text = "Something else, Morris.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bit o' both, guv, an' it changes with the weather. The truth is the farm took itself, what with the Defias an' the drought, but nobody tips a man for a drought." } },
      choices = {
        { text = "Then tell the truth, Morris. It's harder, but it's yours.", next = "BACK", reply = "Yours, aye, and nobody pays for it. Still, you're kinder than most.", fx = { align = { honor = 1 } } },
        { text = "Keep the orcs. A good story feeds you better than the truth.", next = "BACK", reply = "That's what I've always said, guv. The wolf's done right by me.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Begging, polishing, a bit o' carrying, an' now an' then a purse falls into me hand, which ain't the same as takin' it. I'd never cross SI:7's lot, though, because they know every beggar in this city by name." } },
      choices = {
        { text = "A purse that falls into your hand still belongs to someone.", next = "BACK", reply = "It does, guv, it does, and I always give 'em back, mostly. Honest.", fx = { align = { honor = 1 } } },
        { text = "If they can't hold their purses, that's their lookout.", next = "BACK", reply = "That's just what I say, guv! Not that I'd ever, of course.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Blackmail? Me? Never, guv, I'm only a poor bloke who forgets things easier when his belly's full. Plenty o' folk go down those stairs, an' I've never told on one of 'em, so ye've nothing to fear from Morris." } },
      choices = {
        { text = "Keep your silence for its own sake, Morris, not for coin.", next = "BACK", reply = "That's a noble thought, guv, and an empty belly. I'll try.", fx = { align = { honor = 1 } } },
        { text = "Here's a copper, and your memory had better stay short.", next = "BACK", reply = "Bless you, guv! My memory's shorter than my last meal.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Course I do, guv, I polished for a captain in the Barracks for three whole weeks before we had our misunderstandin' about the silver buckles. Rust's the enemy, sweat's the cause, an' oil's the cure, an' that's all a soldier needs to know." } },
      choices = {
        { text = "I keep my own kit. A warrior should.", next = "BACK", reply = "Good on you, guv. Saves me a job.", fx = { align = { order = 1 } } },
        { text = "Polish it yourself. I've got kobolds to kill.", next = "BACK", reply = "Fair enough, guv, I'll find another pair of boots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Couldn't say his name, guv, on account of I promised, but he works the back of Old Town an' he pays in silver, mostly. The tanners in the city charge a fair bit to take a hide, so there's call for a quieter road." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Couldn't say his name, guv, on account of I promised, but he works the back of Old Town an' he pays in silver, mostly. That's a fine beast, guv, that {pet} of yours, an' I'll not try to sell it, I promise. Well, not unless ye ask." },
      },
      choices = {
        { text = "I'll sell my pelts at the tanners, honest and above board.", next = "BACK", reply = "Honest's good, guv, but slow. Still, I'll not tell my quiet man you said no.", fx = { align = { honor = 1 } } },
        { text = "Silver's silver. Introduce me to your quiet man.", next = "BACK", reply = "I'll see what I can do, guv, but he's a shy sort. Bring silver.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Why not both, and the coin first, since the blessing keeps better? I'll tell you true, though, there's nights on these bridges when I'd take a kind word over a copper, and that's not a thing I say to just anybody." } },
      choices = {
        { text = "You're not forgotten, Morris, whatever these bridges tell you.", next = "BACK", reply = "That's kind of you, guv. That's worth more than the coin, almost.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'll get neither. I know a beggar's patter when I hear it.", next = "BACK", reply = "Fair enough, guv. Can't blame a man for trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A loaf, a blanket and a pair of boots off a dead man by the canal, and he'd no more use for them, I promise you. I don't suppose the Silver Hand has a rule about boots, does it?" } },
      choices = {
        { text = "Taking from the dead is wrong, Morris, whatever the need.", next = "BACK", reply = "It's wrong, guv, but it's cold too. I'll say a word for him, if that helps.", fx = { align = { honor = 1 } } },
        { text = "A dead man's boots are better on living feet. Keep them.", next = "BACK", reply = "Bless you, guv. They're good boots, too.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_drown_morris", when = { deathCause = "drowning" },
          text = "You've drowned somewhere, haven't you? I can always tell, because folk who've done it look at the canal water like it owes them an apology, and mind you don't fall in on my watch." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Bless me, then, {class}, bless me twice, for I've been a terrible sinner and a terrible farmer both, or so the story goes." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Oh, a paladin. Now I never took a thing that wasn't given me, whatever the guards might say." },
        { id = "h_default", text = "Morris Lawry, at yer service, guv, an' blind as a mole, near enough. I'll polish yer armor for a copper, carry yer bags for two, and pay ye back on Tuesday for a meal today, I swear it." },
        { id = "h_back", when = { metBefore = true }, text = "You again! Ye've a kind face, I said so the first time, didn't I? Or I meant to." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Now don't look at me like that, guv, because I can see ye've the same trade as me, only ye're better paid for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a whiff of the Lamb's cellar on ye, guv, sulphur an' candle wax. I won't tell nobody, if ye've a copper to help me forget." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, guv! Now there's a suit of armor that wants polishin', an' I'm just the man, rates very reasonable, payment Tuesday at the latest." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, guv! Pelts, is it? I know a man who knows a man who buys pelts an' asks no questions, which is the best kind of man." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Well, a druid, guv, an' one o' the tall ones. I've a story about a farm an' a wolf ye might like, if ye've a copper for the tellin'." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, guv! Spare a copper for an old farmer, or spare a little bread, if you're the conjuring sort." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf talking to rocks, is it? I talked to a rock once, back on the farm, before the farm went. Which farm, you ask? Depends on the day." },
      },
      again = {
        { id = "h_again", text = "Anything else, guv? I've nowhere to be, as ye can see." },
        { id = "h_again2", text = "Go on, then, ask. Questions are free, unlike bread." },
      },
      choices = {
        { text = "You don't look like you were born to begging.", next = "farm" },
        { text = "Here's a coin.", next = "coin" },
        { text = "You were blind a moment ago.", next = "blind" },
        { text = "Begging can't be your only trade, Morris.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt you know much about keeping armor, Morris.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Who buys pelts without asking questions, Morris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Are you trying to blackmail me, Morris?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you want a blessing, Morris, or a coin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the guards say you took, Morris?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Was it really the orcs that took your farm, Morris?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Shall I conjure you some bread, Morris?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which farm did you really lose, Morris?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Get a job, Morris.", next = "END", fx = { affinity = -1 } },
      },
    },
    farm = {
      lines = {
        { id = "f_default", text = "Had a farm once, I did, till the army built their towers right behind it, and the orcs came at the towers through my barley. Or it was the orcs burnt it outright; I tell it both ways, depending." },
      },
      choices = {
        { text = "Which is true?", next = "farm_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_true = {
      lines = { { id = "ft_default", text = "Both, guv, or neither, or some of each. A man tells the story that gets the coin, and soldiers give for the orcs and farmers give for the army, so I keep both in my pocket." } },
      choices = {
        { text = "Lying for coin is still lying.", next = "BACK", reply = "It is, guv, but so's an empty stomach. I'll take your word under advisement.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "A hungry man tells the story that feeds him.", next = "BACK", reply = "Exactly, guv! A man of the world, you are.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    coin = {
      lines = { { id = "c_default", text = "Bless ye, friend, bless ye a hundred times! I'll pay ye back Tuesday, word of a Lawry, though I won't say which Tuesday." } },
      choices = {
        { text = "Keep it, Morris. No need to pay me back.", next = "BACK", reply = "Bless you, guv! I'll name a Tuesday after you.", fx = { affinity = 2, align = { light = 1 }, trait = { generous = 1 } } },
        { text = "You'll pay me back, or I'll find you.", next = "BACK", reply = "You'll find me, guv, I've no doubt, right here on this bridge. I'll have it, honest.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    blind = {
      lines = { { id = "b_default", text = "Blind, me? Why, I can see! I can see, friend, it's a miracle, and ye did it! That's worth a copper to a holy soul like yerself, surely." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "I lost my farm in Lordaeron when the dead came, or I lost it in Westfall to the Defias, depending on what day it is. The truth's somewhere between the two, and I've stopped looking for it." } },
    holy_light = { { id = "tp_holy_light", text = "The priests give me soup on the Cathedral steps, and they don't ask which story I'm telling that day. That's the Light at work, I suppose, or a very patient cook." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are hiding in the mines under Moonbrook, and they're the ones that took my farm, I'll swear to it. Or it was the orcs, I can't recall, but either way somebody owes me a field." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I went to the Darkmoon Faire once and won a stuffed bear, and I sold it the next day for bread. Best trade I ever made, and the bear didn't mind." } },
    knows = { { id = "tp_knows", text = "A beggar on a bridge hears everything, guv, because nobody thinks he's listening. What'll ye have?" } },
    background = { { id = "tp_bg", text = "A farmer once, or so I tell it, and a beggar now, and that part's true enough.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Always have two stories, friend. One's never enough in a city this size." } },
    _none = { { id = "tp_none", text = "Couldn't say, guv. A copper might jog my memory, mind." } },
  },
}

P:NPC {
  key = "billy_canals", id = TODO_NPC("Billy"), name = "Billy",
  bible = "bibles/canals.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious" },
  notices = { "light", "kin", "wonder" },
  impression = {
    first = "Billy fishes the canals with his friend Adam and catches mostly boots, though to hear him tell it he once landed a fish bigger than himself. I believed every word while he was talking.",
    third = "{name} met Billy, a boy on the Stormwind canals with a fish story for every occasion.",
  },

  barks = {
    { id = "b_fish", text = "Think there's any fish in here? Adam says no, but Adam doesn't know anything!" },
  },

  greetings = {
    { id = "g_fish", text = "Hey! Hey, do you wanna hear about the biggest fish ever? It's true, I swear!" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Are you a priest? Can you pray for a fish? Not a big one, just one that's not a boot." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Did you fish here when you were little? Did you catch anything? I bet I catch more." },
    { id = "n_pet", cat = "wonder", when = { pet = true },
      text = "Whoa, is that yours? If it eats fish, I'll catch it one, a really big one, the biggest in the canal!" },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Yes! Unless it says I'm fishing wrong, because Adam already says that every day, and he's wrong about everything." } },
      choices = {
        { text = "It says be patient and kind to Adam, and it'll reward you.", next = "BACK", reply = "Kind to Adam? That's the hardest thing anybody's ever asked me, but all right.", fx = { align = { light = 1 } } },
        { text = "It says Adam's wrong, and you should catch the biggest one yourself.", next = "BACK", reply = "I knew it! I'll catch it and show him and he'll fall in the canal from shock!", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Does it bite? Adam says imps bite and set your hair on fire, but Adam also says there's a fish in the canal as big as a boat, and that's me, I said that first. My mum says not to talk to people from the Lamb, though, so maybe I'll just wave at it from over here." },
      },
      choices = {
        { text = "Your mum's right, Billy. Wave from there.", next = "BACK", reply = "All right, hello, imp! It's waving back, I think, or else it's being rude.", fx = { align = { order = 1 } } },
        { text = "Come closer, Billy. It won't bite much.", next = "BACK", reply = "Really? Mum would kill me, but she'd have to catch me first!", fx = { align = { order = -1 } } },
        { text = "Something else, Billy.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Like a seal? Then you could catch the big one under the bridge with your teeth, and Adam would have to admit I wasn't lying about it! Don't scare it off first, though, because I saw it before you did." } },
      choices = {
        { text = "The big fish belongs to whoever saw it first, Billy. That's fair.", next = "BACK", reply = "That's me! I saw it first! I'll tell Adam you said so.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Druids don't wait their turn, Billy. I'll catch it first.", next = "BACK", reply = "Hey, that's not fair! I saw it first, and I'm telling Adam you cheated.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because he always says there's no fish, and if I sneak up on him with a big one he'll fall right in the canal! Then he'll have to say there's fish, because he'll be sitting with them." } },
      choices = {
        { text = "Win fair, Billy, and show him the fish while he's looking.", next = "BACK", reply = "Fair's harder, but all right. He'd still fall in from surprise, though.", fx = { align = { honor = 1 } } },
        { text = "Sneak up and dunk him, and he'll never doubt you again.", next = "BACK", reply = "Yes! I'll do it tomorrow, and you'll be able to hear the splash from the Keep.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That'd be the best thing ever, except Adam would say it wasn't real, because it didn't come out of the canal. I think I have to catch one myself, even if it takes all summer." } },
      choices = {
        { text = "Catch it yourself, Billy. It'll mean more that way.", next = "BACK", reply = "You're right. I'll catch it myself, even if it takes me till I'm old.", fx = { align = { honor = 1 } } },
        { text = "A fish is a fish, so tell him you caught it.", next = "BACK", reply = "But he'd know! He always knows. I'll catch my own, thanks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Maybe, but only if I can still fish, because Adam says warriors have to march all day and you can't fish when you're marching. My uncle was in the Stormwind Guard and he says the worst bit is the boots." } },
      choices = {
        { text = "Being a warrior means looking after people, Billy. Remember that.", next = "BACK", reply = "I'll remember. My uncle looked after people, and he was the bravest one I knew.", fx = { align = { order = 1 } } },
        { text = "Being a warrior means you never have to do chores, Billy.", next = "BACK", reply = "No chores? Then I'll be a warrior tomorrow, and Mum can do the dishes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Yes please! Adam says blessing a line is cheating, but Adam caught a crab last week and he won't stop talking about it, so I think I'm allowed." } },
      choices = {
        { text = "There. May your next catch be the biggest fish in Stormwind.", next = "BACK", reply = "Thank you! Now I'll catch the biggest fish in Stormwind, and Adam will cry.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Blessings aren't for fishing, Billy. Patience will serve you better.", next = "BACK", reply = "Patience is so boring, though. All right, I'll try, but only a little bit.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fights monsters! And saves people, and doesn't run away even when it's really scary, but is that true, or is it just what they tell kids?" } },
      choices = {
        { text = "It's true. We stand our ground, however scared we are.", next = "BACK", reply = "Really? Then I'll be brave too, even when the canal goes dark.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes running is wiser, Billy. Brave doesn't mean foolish.", next = "BACK", reply = "Oh. That's not what the stories say. But I think I like it better.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Are you a priest? Can you bless my line, so I catch a real fish and not another boot?" },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Whoa, a paladin! Is your armour real? Can you hit things with the Light? Adam says paladins can, and he's never right about anything." },
        { id = "h_default", text = "I'm Billy, and me and Adam fish here every day, and once, at camp, I pulled out a fish bigger than me, honest, but I threw it back because it was looking at me funny." },
        { id = "h_boot", when = { metBefore = true }, text = "Look, look, I caught something! Oh, it's just another stinky old boot, that's three this week." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Whoa, you snuck up on me! Can you teach me to do that, so Adam never sees me coming?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Are you a wizard? Can you make a fish appear, a really big one, so I can show Adam?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Whoa, are you a real warrior? Adam says warriors can lift a horse, but I said nobody can lift a horse, so can you?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Are you really a druid? Adam says you can turn into a bear, and I said you'd have to prove it, because Adam believes everything." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Is that a little monster? Can it fish? Adam, come and look, there's a little monster!" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Are you a real shaman? Can you make the canal give me a fish instead of another boot?" },
      },
      again = {
        { id = "h_again", text = "Do you wanna hear another one? I know loads!" },
        { id = "h_again2", text = "Wait, wait, I've got a better one!" },
      },
      choices = {
        { text = "Tell me about the biggest fish.", next = "fish" },
        { text = "I'd bet there are monsters in the sea.", next = "monsters" },
        { text = "You keep talking about Adam.", next = "adam" },
        { text = "Want to see a real hunter's beast, Billy?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Why do you want to sneak up on Adam?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What if I conjured you a fish, Billy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you want to be a warrior someday, Billy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Shall I bless your fishing line, Billy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you want to know what a paladin really does, Billy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Shall I tell you how a druid swims like a seal, Billy?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you want to meet my imp, Billy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you want to hear what the water says, Billy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck fishing, Billy.", next = "END", fx = { affinity = 1 } },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "Last week I caught one with three eyes, right here in the canal, and it winked at me with the middle one! And there's a golden fish, too, and if you catch it you get three wishes, my daddy says." } },
      choices = {
        { text = "What would you wish for?", next = "fish_wish" },
        { text = "Three eyes? I don't believe you.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    fish_wish = {
      lines = { { id = "fw_default", text = "A boat, and a bigger boat, and then another wish so I can have more wishes! Adam says that's cheating, but it's not cheating if it's a magic fish." } },
      choices = { { text = "Smart thinking, Billy.", next = "BACK", fx = { affinity = 2 } } },
    },
    monsters = {
      lines = { { id = "m_default", text = "My daddy says there's fish in the ocean so big they can swallow a whole ship! And there's fish that walk on land and eat people, and they go mrrglgl, I heard it from a sailor." } },
      choices = {
        { text = "Those are murlocs, and they're real.", next = "monsters_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monsters_real = {
      lines = { { id = "mr_default", text = "They're REAL? Have you seen one? Did it try to eat you? Wait till I tell Adam, he's gonna be so scared!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    adam = {
      lines = { { id = "a_default", text = "He's my best friend, but he can't fish, and my daddy catches way more fish than Adam's daddy, and that's a fact." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet = {
      lines = { { id = "pet_l", text = "Whoa, is it yours, and does it eat fish? Adam, look, it's a real one, not a dog, a real one!" } },
      choices = { { text = "It eats fish. Want to feed it?", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a tonk you can drive, and Adam drove it into a fence and we had to run! It was the best day ever, and I'm going back as soon as I've got coppers again." } },
    onyxia = { { id = "tp_onyxia", text = "There's a black dragon in a swamp who sleeps on a hill of gold, and I'm going to catch her with a fishing line someday. Adam says I'd need a bigger hook, and I said I'd make one." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "My da says the statues in the Valley of Heroes are of real people who fought the orcs. I climbed one once, and a guard shouted, and I've not been back since." } },
    booty_bay = { { id = "tp_booty_bay", text = "I heard the pirates in Booty Bay catch fish bigger than a man, and I caught a fish bigger than a man once too. Adam wasn't there, so you'll just have to believe me." } },
    knows = { { id = "tp_knows", text = "I know loads of stuff, mostly about fish! Ask me!" } },
    background = { { id = "tp_bg", text = "I'm Billy, and I'm gonna be the best fisherman in Stormwind when I'm big." } },
    advice = { { id = "tp_ad", text = "If it's a boot, throw it back, 'cause it's not a fish. Took me ages to learn that." } },
    _none = { { id = "tp_none", text = "I dunno. Is it a fish? I only know about fish." } },
  },
}

P:NPC {
  key = "philmor", id = TODO_NPC("Manifest Clerk Philmor"), name = "Manifest Clerk Philmor",
  bible = "bibles/canals.md", role = "worker", tier = "quest",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Manifest Clerk Philmor keeps Stormwind's harbor running on too few dockhands and too many ledgers. He told me the work was open to anyone and my safety was my own affair, and he meant both.",
    third = "{name} met Manifest Clerk Philmor, who keeps the cargo manifests at Stormwind Harbor.",
  },

  greetings = {
    { id = "g_harbor", text = "Anyone can work the harbor, but if a crate falls on you, that's your own affair. Now, what is it?" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest on the docks. The sailors will ask you to bless the ship, and then they'll ask you to carry a crate, so be ready for both." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City folk, good. You'll know the Trade District, then, and won't get lost carrying a parcel through it." },
    { id = "n_strong", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Broad shoulders, sturdy boots, and I'd guess you've lifted heavier than a cargo crate. I've work for you, if you want it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Always, and the ledgers are longer than the docks. I don't care who unloads a crate or what they pray to, so long as the count matches at the end." } },
      choices = {
        { text = "The count matters. Keep the ledgers straight and the city fed.", next = "BACK", reply = "Exactly so. A straight ledger is a full larder, and I keep both.", fx = { align = { order = 1 } } },
        { text = "Count less and trust the hands more. The work gets done.", next = "BACK", reply = "Trust the hands, and the count goes missing. I'll keep counting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Crates come in marked for the Mage Quarter, and some of them are lighter than they should be and colder than they ought to be, and I sign for them all the same. I'm a manifest clerk, not a magistrate, and if the city guard wants to open a crate, they can do it on their own time." },
      },
      choices = {
        { text = "Then the guard should hear about the cold crates.", next = "BACK", reply = "They've heard, and they've signed my report, and nothing's happened. I'll keep signing.", fx = { align = { order = 1 } } },
        { text = "Sign and don't ask. A wise clerk.", next = "BACK", reply = "Wise, or frightened. I've stopped asking which.", fx = { align = { order = -1 } } },
        { text = "Something else, Philmor.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More each month, though it comes the long way round through Menethil, and most of it's crated so carefully I'm afraid to open it. Your people's seed and timber are good for the ledgers, but the dockhands swear the crates whisper at night." } },
      choices = {
        { text = "Every crate that crosses your docks should be opened and recorded.", next = "BACK", reply = "I'd open every one if I could, but the Sentinels guarding the elven crates would have my hand off. So I count what I'm allowed to count.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some cargo is sacred. Let it pass without prying, Clerk.", next = "BACK", reply = "Sacred I can respect, but undeclared is a different matter. I'll tread carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Enough that I've stopped calling it an accident, though not so much that anyone above me will listen. The Defias have friends on these docks and I've a fair idea which crates they favour, but a clerk's guess isn't evidence." } },
      choices = {
        { text = "Then give SI:7 your guesses and let them find the evidence.", next = "BACK", reply = "I have, and they said thank you very much and nothing else. I'll keep guessing.", fx = { align = { order = 1 } } },
        { text = "Mind your ledger, clerk, and let the crates fall where they fall.", next = "BACK", reply = "That's what my superiors say. Easy for them; it's not their ledger.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Crates of reagents, ink, crystal and things I'm not allowed to write down, which is always a clerk's favourite sort of cargo. Some of it comes stamped with the Kirin Tor's seal, and the crates I worry about come stamped with nothing at all." } },
      choices = {
        { text = "Every crate should be written down, sealed or not.", next = "BACK", reply = "I'd write down every last one, believe me, if the Mage Quarter allowed it, but they send a very polite apprentice to say it doesn't.", fx = { align = { order = 1 } } },
        { text = "What the Quarter keeps off the ledger is its own business.", next = "BACK", reply = "It is, until it falls off the wagon in front of the guard. Then it's mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most of them are Westfall men, and when their families' farms burn they go home to see to it. The ones who stay talk about the Brotherhood in low voices, and that worries me far more than the empty shifts." } },
      choices = {
        { text = "Men who leave to protect their families aren't deserters, Clerk.", next = "BACK", reply = "No, they're not, and I don't call them so. I just need someone to unload the crates.", fx = { align = { order = 1 } } },
        { text = "If they run off mid-shift, they're no better than deserters.", next = "BACK", reply = "Harsh, but the harbor master would agree. I try to be kinder.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crates of them, from Darkshore and Menethil and the Wetlands, and every one has to be checked against the manifest before it's unloaded. Last month someone tried to ship a live bear cub in a crate marked salt cod, and I still dream about it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Crates of them, from Darkshore and Menethil and the Wetlands, and every one has to be checked against the manifest before it's unloaded. Keep that {pet} away from the crates, please, because the last loose animal on these docks ate a whole manifest. I had to rewrite it from memory." },
      },
      choices = {
        { text = "A live cub in a crate is cruelty. Someone should answer for it.", next = "BACK", reply = "Someone should, and I've written to three people. None of them answered.", fx = { align = { light = 1 } } },
        { text = "A cub's worth a fortune to the right buyer. Clever shipper.", next = "BACK", reply = "A fortune and a mauled dockhand. I'll not let it happen again.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Before every long voyage, and twice before the run to Menethil. I don't hold with it myself, but I've noticed the ships that get blessed come back with fewer complaints in my ledger." } },
      choices = {
        { text = "A blessing steadies a crew. It's worth the asking, Clerk.", next = "BACK", reply = "I'll not argue with what works. The crews row straighter after the priest's been by, and I've the tallies to prove it.", fx = { align = { light = 1 } } },
        { text = "A sound hull does more than any blessing, Clerk.", next = "BACK", reply = "A sound hull and a blessing, then. I'll take both.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone who knows my schedule better than my dockhands do, which is to say any clerk, captain or carter on these piers. The guard won't spare a man for it, so I write it off as spoilage and lose a little more sleep every week." } },
      choices = {
        { text = "The guard should hear of it. Theft must answer to the law.", next = "BACK", reply = "They've heard, and they won't spare a man. I'll keep writing it down.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some of that spoilage feeds hungry families. Let a little go.", next = "BACK", reply = "Perhaps it does, and I've thought the same some nights. I'll write it down anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've come to bless a ship, you'll have to wait your turn, because every captain at these piers wants a blessing before he wants his cargo found." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Splendid, if you're here to tell me who's been lifting crates off my docks at night, and less splendid if you're here to inspect my ledgers." },
        { id = "h_default", key = true,
          text = "Manifest Clerk Philmor. Every crate that comes into this harbor passes my ledger, and this week half my dockhands haven't, so the cargo schedule is a work of fiction." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("Philmor's Favor") },
          text = "The Gatehouse shipment goes up the stairs in Trias' Cheese, to the stockroom entrance. Elaine knows the deliveries, so hand it to her and don't open it on the way." },
        { id = "h_favor_done", tags = { "news" }, when = { questDone = TODO_QUEST("Philmor's Favor") },
          text = "Elaine sent word the shipment arrived intact, and the last three came in short, wet or not at all. You've a future on the docks, if you ever tire of the other thing." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've the look of somebody who knows how cargo goes missing, which is the one thing my ledger can't tell me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, good. If you're waiting on a crate for the Mage Quarter, it's late, and so is everything else on this harbor." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and with arms on you, too. If you're looking for work, the dockhands have all gone off to Westfall and I've crates stacked to the rafters." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, are you? Then you'll be wanting to know whether the furs from Darkshore came in, and the answer is yes, but I can't find them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at my docks. A good share of the cargo on these piers comes up from Menethil, and some of it came from your Auberdine before that, so I'd guess you took the same long road." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The work's open to anyone, and so is the risk, but don't bring that thing near my ledgers." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Shaman, eh? If you can talk the sea into carrying our cargo gently, the harbour has work for you. Your safety's your own affair." },
      },
      again = {
        { id = "h_again", text = "Anything else? The tide doesn't wait for conversation." },
        { id = "h_again2", text = "Yes? Quickly, please." },
      },
      choices = {
        { text = "Do you need a hand?", next = "favor" },
        { text = "What's the Gatehouse?", next = "gatehouse", when = { any = { { questActive = TODO_QUEST("Philmor's Favor") }, { questDone = TODO_QUEST("Philmor's Favor") } } } },
        { text = "I've seen ships here from all along the coast.", next = "ships" },
        { text = "Why are you short of dockhands?", next = "dockhands" },
        { text = "I'd wager some of your cargo goes missing.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Mage Quarter must keep these docks busy.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your dockhands seem to be leaving the harbor, Clerk.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do many furs and hides pass through the harbor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do sailors often ask for blessings, Clerk?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who do you think is stealing from your docks, Clerk?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does much from Darnassus reach your ledgers, Clerk?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the docks ever ship cargo for the Slaughtered Lamb?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is the harbour short of hands, Philmor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    favor = {
      lines = { { id = "f_default", text = "Always. There's a shipment for the Gatehouse that should have gone up to the Trade District this morning, and nobody's free to take it. Carry it carefully, because it's yours until it's on Elaine's landing." } },
      choices = {
        { text = "Why so careful?", next = "gatehouse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gatehouse = {
      big = true,
      lines = { { id = "g_default", text = "The Gatehouse has its stockroom above Trias' Cheese, and its goods arrive quietly, so the guard's officers can have their ceremonial surprises. That's what the manifest says, and I write down what the manifest says." } },
      choices = {
        { text = "You don't believe it either.", next = "gatehouse_believe" },
        { text = "A clerk shouldn't ask what he's carrying.", next = "BACK", reply = "Perhaps not, but this one does, and he signs anyway. Mostly.", fx = { align = { order = 1 } } },
        { text = "A clerk should know what passes his ledger.", next = "BACK", reply = "He should, and I do, mostly. The Gatehouse is a special case.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gatehouse_believe = {
      lines = { { id = "gb_default", text = "I believe in an accurate ledger and a quiet life, and those two things only go together if I don't open the crates. You'd do well to keep the same habit." } },
      choices = {
        { text = "Understood.", next = "BACK", fx = { trait = { discreet = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ships = {
      lines = { { id = "s_default", text = "Up and down the coast, mostly, and the kaldorei keep a boat for Auberdine at the far pier. Ask the elf on the dock, Idrieth; he'll tell you when it sails, and politely, which is more than the sailors will." },
      },
      choices = {
        { text = "Auberdine is on my own shores, in Darkshore.", next = "ships_elves", when = { race = "NightElf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_elves = {
      lines = { { id = "se_default", text = "Your own shores, yes. Your people keep a tidy dock and a punctual boat, and I wish I could say the same for ours." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    dockhands = {
      lines = { { id = "d_default", text = "Some went to Westfall and came back masked, some went to Redridge and didn't come back, and the rest know I can't pay what the adventurers pay. So I hire whoever walks up, and here you are." } },
      choices = {
        { text = "Pay them better, then.", next = "BACK", reply = "With what? The harbor master's purse is shut tighter than a Gilnean gate.", fx = { align = { honor = 1 } } },
        { text = "Hire the desperate and work them hard.", next = "BACK", reply = "That's how it's done these days, and I don't like it. I'll keep doing it kindly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay ships come in every week with spice and rum and goblins who argue over every crate. I log them all, and I've learned more goblin swearing than any clerk should know." } },
    theramore = { { id = "tp_theramore", text = "The ships to Theramore run from Menethil now, not from here, and I'm told the crossing is rough. I'd go if I didn't have a harbour to keep and too few hands to keep it." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail have been seen off the coast south of Westfall, and the merchant captains won't sail past the lighthouse at night. That's cost this harbour a fortune, and I've the ledgers to prove it." } },
    gilneas = { { id = "tp_gilneas", text = "Gilnean ships used to call here every month, and we'd swap cloth for timber and gossip. Since the Wall went up, I've not logged a single one." } },
    knows = { { id = "tp_knows", text = "Every ship brings news with its cargo, and I write down the cargo; the news I only remember. What do you want to know?" } },
    background = { { id = "tp_bg", text = "A clerk on the docks with a ledger and too few dockhands. If there's a story, it's written in the margins." } },
    advice = { { id = "tp_ad", text = "Lift with your legs, count twice and never sign for a crate you haven't seen. That's all the wisdom the harbor teaches." } },
    _none = { { id = "tp_none", text = "Not on my manifest. Try the Trade District; they gossip there." } },
  },
}
