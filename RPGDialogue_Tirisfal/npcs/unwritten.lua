-- Brill folk no earlier pass reached: Doreen Beltis at the graves, Constance Brisboise the clothier,
-- Jamie Nore in the town hall, Sahvan Bloodshadow on his rounds, Thomas Arlento and Claire Willower.
-- Voice: bibles/missed.md (Forsaken: dry, cold, whole sentences).
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC = P.TODO_NPC

-- Doreen Beltis: keeps company with the Brill graveyard.
P:NPC {
  key = "tf_doreen_beltis", id = TODO_NPC("Doreen Beltis"), name = "Doreen Beltis", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "quiet", "dry" }, values = { "loyal", "patient" },
  impression = {
    first = "Doreen Beltis stands among the Brill graves with her hands folded, reading the stones as if she expects one of them to answer.",
    third = "{name} met Doreen Beltis, a Forsaken woman who keeps watch over the Brill graveyard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, {class}. Stand with me by the stones a moment, if you like; you're welcome company among the empty graves." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind where you step, and leave the graves alone, because I've no patience for you today." },
    { id = "g_default", text = "Mind where you step, {class}. Half these graves are empty now, and the other half I'd rather you left alone." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The stones haven't changed since you last came, and neither have I." },
  },
  start = "hello",
  nodes = {
    w3_shrouds = {
      lines = {
        { id = "w3_shrouds_1", text = "A good many, back when I had needles and a shop. I see them come up from Deathknell sometimes, still in my stitching, and I know the hem before I know the face, and then I know the face, and I wish I didn't." },
      },
      choices = {
        { text = "Do they know you made them?", next = "w3_know" },
        { text = "Kava cuts them up for linen now.", next = "BACK", reply = "Does he? Good. That linen was meant to be put to rest, and it's had a rest, and now it can work like the rest of us." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_know = {
      lines = {
        { id = "w3_know_1", text = "One or two have recognised the stitch and come to thank me, which is the strangest thanks a seamstress can be given. I tell them it was a poor job, done in a hurry in a bad year, and they say it held, and I suppose it did." },
      },
      choices = {
        { text = "It held. Something else.", next = "BACK" },
      },
    },
    ylooking = {
      lines = { { id = "ylooking_x", text = "My sister, Marla. She was buried here before the plague, of an ordinary fever. Her stone is the one with the lily carved on it. She never rose. I can't decide whether that's a mercy or a slight." } },
      choices = {
        { text = "Would you want her to rise?", next = "yrise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrise = {
      lines = { { id = "yrise_x", text = "Some nights I would. Then I see what I've become, and I'm glad she's spared it. The apothecaries say they can raise anyone, given time. Should I ask them?" } },
      choices = {
        { text = "Yes. She'd want to be with you again.", next = "BACK", reply = "Would she? I wonder. I'll hold off a little longer, I think.", fx = { align = { light = -1 } } },
        { text = "No. Let her rest. She earned it.", next = "BACK", reply = "Aye. You're right. I'll keep visiting the lily, and leave it at that.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "A seamstress in Brill. I made burial shrouds as well as dresses, for there was always demand. I sewed my sister's shroud myself, with lilies at the hem. I sewed my own, too, as it turned out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ygraves = {
      lines = { { id = "ygraves_x", text = "Most of them. The Agamands are buried in the east corner, those that stayed down. The Hallers are by the wall. The old priest, Father Oswin, lies under the yew tree. He rose and walked away toward the Monastery, and nobody's seen him since." } },
      choices = {
        { text = "Father Oswin walked to the Scarlets?", next = "yoswin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yoswin = {
      lines = { { id = "yoswin_x", text = "Toward them, anyway. Perhaps he thought they'd welcome him back. Perhaps he wanted them to finish it. I've never decided which, and I don't like either answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Doreen Beltis. I lived in Brill before the plague came up the road, and I'm still here after, which I suppose makes me the town's longest tenant." },
        { id = "h_living", when = { faction = "Alliance" }, text = "A living face in Brill's graveyard, and not even a Scarlet one. Say your piece quickly, before the Deathguard notice you." },
        { id = "yh_scourge", when = { race = "Scourge" }, text = "Another of us, wandering among the stones. Are you looking for your own grave? Many do, at first. It's rarely as comforting as they hope." },
      },
      again = {
        { id = "h_again", text = "Something else? I've nowhere to be." },
        { id = "h_again2", text = "Go on. The dead are poor listeners." },
      },
      choices = {
        { text = { normal = "Whose graves are these?", polite = "If I may ask, whose graves are these?", blunt = "Who's buried here?" }, next = "graves" },
        { text = "You remember Brill as it was.", next = "before" },
        { text = "You keep watch here every night, by the look of it.", next = "watch" },
        { text = "Who are you looking for?", next = "ylooking" },
        { text = "Who were you in life?", next = "ylife" },
        { text = "Do you know whose graves these are?", next = "ygraves" },
        { text = "Did you sew any of the shrouds the risen wear?", next = "w3_shrouds" },
        { text = "I'll leave you to your stones.", next = "END" },
      },
    },
    graves = {
      lines = { { id = "gr_default", text = "Neighbours, mostly, and a few strangers who died on the road from Lordaeron. A good many of them got up and walked off when the Scourge called, so I tend the names rather than the bodies." } },
      choices = {
        { text = "Did any of them come back as Forsaken?", next = "returned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    returned = {
      lines = { { id = "rt_default", text = "One or two, and they don't visit their own graves. I can't say I blame them, because it's a strange thing to read your name carved in stone and know the mason spelled it wrong." } },
      choices = {
        { text = "Better to be free than to rot in the ground.", next = "BACK", reply = "Spoken like someone who hasn't tried both. I'll grant you freedom suits me better than the Scourge did.", fx = { align = { order = -1 } } },
        { text = "The dead should stay buried.", next = "BACK", reply = "Then you're standing on the wrong side of the soil to say so, but I take your meaning.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "bf_default", text = "Brill was a market town with a good inn and too many dogs. On fair days you could hear the fiddles from the Gallows' End all the way out here, and now all I hear is Renferrel's shovel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "wa_default", text = "Every night, and the days as well, since I've no use for sleep. The Scarlets come down from the monastery now and then to burn what they call unclean, and I'd sooner they found me here than an empty yard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    brill_graveyard = { { id = "ytp_bg", text = "The Brill graveyard is my parish now. I know every stone by its carving." } },
    agamand = { { id = "ytp_agamand", text = "The Agamands were proud folk. Their graves are the tallest in the yard, and the emptiest." } },
    background = { { id = "tp_bg", text = "Born in Brill, buried in Brill, and up again in Brill. I've never been much of a traveller." } },
    _none = { { id = "tp_none", text = "If it isn't carved on a stone in this yard, I'm likely the wrong one to ask." } },
  },
}

-- Constance Brisboise: Apprentice Clothier, near Cold Hearth Manor.
P:NPC {
  key = "tf_constance_brisboise", id = TODO_NPC("Constance Brisboise"), name = "Constance Brisboise", title = "Apprentice Clothier", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "prim", "dry" }, values = { "craft", "practical" },
  notices = { "craft" },
  impression = {
    first = "Constance Brisboise keeps her bolts of cloth folded with a care that the rest of Tirisfal has long forgotten, and she eyes your sleeves as though she's already pricing the repair.",
    third = "{name} met Constance Brisboise, an apprentice clothier selling cloth armour near Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good day, {class}, and welcome back. You've stood out of my light, for once, and I've a bolt of cloth I think you'll like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. If you've come for cloth, I'll sell it, and if not, stand out of my light." },
    { id = "g_default", text = "Good day, {class}. If you've come for cloth, I have it, and if you've come to stand in my light, I'd ask you to stand somewhere else." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Your seams are your own work, aren't they? They're crooked, but honestly crooked, which is more than I can say for most." },
  },
  start = "hello",
  nodes = {
    w3_bowen = {
      lines = {
        { id = "w3_bowen_1", text = "He does, and he'll have told you he dressed the court, which is very nearly true, and that I'm the apprentice, which is entirely true and he never lets me forget it. He fusses over a hem like a hen over an egg." },
      },
      choices = {
        { text = "Do you two see each other often?", next = "w3_see" },
        { text = "He was very taken with my clothes.", next = "BACK", reply = "Taken to pieces, I expect. He does it to everyone, and then he does it to me twice." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_see = {
      lines = {
        { id = "w3_see_1", text = "Once a month, when the cart goes to the city, and we take tea we can't drink and criticise each other's seams for an hour. It's the most pleasant hour of the month, and if you tell him I said so, I'll deny it in writing." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Constance Brisboise, apprentice clothier, though the master I apprenticed under is two years dead and not the useful kind of dead. I sell robes and gloves that will keep the rain off, and very little else." } },
      again = { { id = "h_again", text = "Anything else? I've hems to finish, and the light is going." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "A clothier should cut her cloth to fit the customer, not the price.", next = "BACK", reply = "Just so. My master taught me that before he died, and I mean the useful kind of teaching.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Cut the robes short and charge for the full length.", next = "BACK", reply = "And have them flap about the ankles of every mage in Brill? No, I'll cut them true.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What happened to your shop in the capital?", next = "xshop" },
        { text = "Who buys robes in Brill?", next = "xbuyers" },
        { text = "Do you still enjoy the work?", next = "xenjoy" },
        { text = "I'm a mage. Do you sell robes for spellwork?", next = "xmage", when = { class = "MAGE" } },
        { text = "Who was your master?", next = "master" },
        { text = "Where do you find good cloth in Tirisfal?", next = "cloth" },
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Your brother Bowen tailors in the Undercity.", next = "w3_bowen" },
        { text = "Good day to you.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "A tailor in Lordaeron's capital, with a shop off the market square and a temper like a pin. The Scourge took him when the city fell, and if he walks anywhere now it's in the Plaguelands, wearing something badly made." } },
      choices = {
        { text = "Have you family left?", next = "family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "A brother, Bowen, who sells his own wares in the Undercity and thinks that makes him the successful one. We write now and then, and we're both too proud to admit we miss being alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "c_default", text = "Off the backs of Scarlets, mostly, since they're well dressed and careless with their lives. Linen from the old farms, wool when someone brings it, and I don't ask the Deathguard how they came by it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshop = {
      lines = {
        { id = "xs1", text = "Burned, looted, or full of ghouls, depending on which day you visited after the city fell. I went back once, for my master's shears, and found them in the gutter, rusted shut." },
      },
      choices = {
        { text = "Do you miss Lordaeron?", next = "xmiss" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "xm1", text = "I miss the silk merchants from Dalaran and the noblewomen who paid in gold and never looked at the bill. I don't miss the noblewomen themselves, and they would hardly miss me as I am now." },
      },
      choices = {
        { text = "The old kingdom deserved to fall.", next = "BACK", reply = "There's a sharp tongue. I might have liked you, before.", fx = { align = { order = -1 } } },
        { text = "Lordaeron was worth something. It's worth remembering.", next = "BACK", reply = "It was, and I remember every stitch of it.", fx = { align = { order = 1 } } },
      },
    },
    xbuyers = {
      lines = {
        { id = "xb1", text = "Deathguard, who need cloaks that hide the rot, and new risen who wake in their burial shrouds and want something with sleeves. Business is steady, because nobody in Brill is dying anymore, only falling apart." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xenjoy = {
      lines = {
        { id = "xe1", text = "My fingers are stiffer than they were, and I lose the feeling in them by noon, but the needle still goes where I tell it. A tailor who can't enjoy a straight seam has no business with a needle, living or dead." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma2", text = "Spellwork, {g:he|she} says, as if a robe cared what you do in it. I'll sell you good linen and you'll set fire to it by the week's end, because every mage does." },
      },
      choices = {
        { text = "I'll try to be careful.", next = "BACK", reply = "You won't, but I'll take your coin anyway." },
      },
    },
  },
  topics = {
    lordaeron = { { id = "xtp_lo", text = "The capital had fine silk and finer customers. Now it has a sewer and a queen." } },
    undercity = { { id = "xtp_uc", text = "The Dark Lady's court is down there. They prefer black, which is restful on the eyes." } },
    background = { { id = "tp_bg", text = "I was apprenticed in the capital. Now I'm an apprentice to nobody in particular." } },
    _none = { { id = "tp_none", text = "I sew, {class}. If it hasn't got a hem, I've no opinion on it." } },
  },
}

-- Jamie Nore: Brill town hall.
P:NPC {
  key = "tf_jamie_nore", id = TODO_NPC("Jamie Nore"), name = "Jamie Nore", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "wry", "restless" }, values = { "curious" },
  impression = {
    first = "Jamie Nore leans against the wall of Brill's town hall, listening to everything said inside it while appearing to listen to nothing at all.",
    third = "{name} met Jamie Nore, a sharp-eared Forsaken who loiters about Brill's town hall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again, {class}. Lean on the wall beside me, if you like; the magistrate's in fine form today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep your hands where I can see them, and keep your voice down, because I'm listening." },
    { id = "g_default", text = "Quietly, {class}. The magistrate's in a mood, and I'd hate to miss whatever he says next." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of the light-fingered sort. Keep your hands where I can see them, and I'll keep mine where you can see them." },
  },
  start = "hello",
  nodes = {
    w3_gossip = {
      lines = {
        { id = "w3_gossip_1", text = "Mrs. Winters at the general goods, and I mean that as the highest praise in my line of work. She hears everything, repeats it to everyone, and never asks for a copper, which makes her my greatest competitor and the only one I can't undercut." },
      },
      choices = {
        { text = "Do you trade news with her?", next = "w3_trade" },
        { text = "You envy her.", next = "BACK", reply = "Envy? No, I admire her, the way a fox admires a hound. She's better at it, and she doesn't even know it's a trade." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_trade = {
      lines = {
        { id = "w3_trade_1", text = "Every morning, over a crock of that pumpkin of hers, which I can't taste and she won't stop offering. I give her one rumour, she gives me three, and I spend the rest of the day finding out which of hers are true." },
      },
      choices = {
        { text = "Most of them, I'd wager. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Jamie Nore. I don't have a post, exactly; I make myself useful by knowing things before the people who ought to know them." } },
      again = { { id = "h_again", text = "What else would you like to hear? I've a little of everything this week." }, { id = "h_again2", text = "Ask away, quietly." } },
      choices = {
        { text = "What does the magistrate want?", next = "xmag" },
        { text = "Who do you sell your news to?", next = "xsell" },
        { text = "Tell me something about the Scarlets.", next = "xscar" },
        { text = { normal = "What's the news in Brill?", polite = "Might you share the news in Brill?", blunt = "What's going on in Brill?" }, next = "news" },
        { text = "You're a spy, then.", next = "spy" },
        { text = "Who pays for what you know?", next = "pay", when = { class = "ROGUE" } },
        { text = "Who's the worst gossip in Brill?", next = "w3_gossip" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The Scarlets are bolder at the monastery and pushing patrols as far as Solliden Farmstead. The Apothecaries are buying more corpses than the graveyard can spare, and nobody has told the Executor where they're going." } },
      choices = {
        { text = "Where do you think they're going?", next = "corpses" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corpses = {
      lines = { { id = "co_default", text = "Down into the Apothecarium, in carts with blankets over them. I'd not lose sleep over it, except I don't sleep and so I think about it rather a lot." } },
      choices = {
        { text = "The Society serves the Dark Lady. That's enough for me.", next = "BACK", reply = "Then you'll go far in the Undercity, and I mean that as a warning as much as praise.", fx = { align = { order = 1 } } },
        { text = "Someone should be watching the Society.", next = "BACK", reply = "Someone is, {class}. Just don't say so in front of an apothecary.", fx = { align = { order = -1 } } },
      },
    },
    spy = {
      lines = { { id = "s_default", text = "A spy works for someone. I work for Brill, in the sense that I'd like Brill still standing next month, and I tell the Deathguard what they need to hear when they can be bothered to listen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      lines = { { id = "p_default", text = "Whoever asks politely and pays promptly, which in Brill means almost nobody. The Ravenholdt folk once sent a letter, but I burned it, because people who answer them tend to disappear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmag = {
      lines = {
        { id = "xm1", text = "Magistrate Sevren wants the Scarlets driven out of Tirisfal, the Scourge out of the fields, and the apothecaries out of his hair, in that order. He gets about one of the three on a good week." },
      },
      choices = {
        { text = "And Executor Zygand?", next = "xzyg" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xzyg = {
      lines = {
        { id = "xz1", text = "Zygand wants the same things and thinks Sevren talks too much, and Sevren thinks Zygand thinks too little. They'd make a fine pair if either of them could stand the other." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsell = {
      lines = {
        { id = "xs1", text = "To whoever asks the right questions and pays for the answers, though I don't take coin from the Scarlets, before you ask. I've standards, few as they are, and those are the ones that survived the grave." },
      },
      choices = {
        { text = "Selling secrets is a dangerous game.", next = "xgame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgame = {
      lines = {
        { id = "xg1", text = "Everything's dangerous in Tirisfal. At least my game pays, and at least nobody's found me out yet, which is the same thing as being good at it." },
      },
      choices = {
        { text = "Information should go to the Dark Lady first.", next = "BACK", reply = "How loyal of you. I'll mention it to her spymaster, if she has one.", fx = { align = { order = 1 } } },
        { text = "Sell to the highest bidder. That's smart business.", next = "BACK", reply = "Now you sound like a goblin, and I mean that kindly.", fx = { align = { order = -1 } } },
      },
    },
    xscar = {
      lines = {
        { id = "xsc1", text = "They've got a new man at the monastery who preaches the plague came from the sins of the north, and the farmers out by Solliden believe him. If Brill burns one night, look for a Scarlet with a torch and a very clean tabard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet = { { id = "xtp_sc", text = "Zealots in red. They'd burn Brill and call it a cleansing." } },
    apothecary = { { id = "xtp_ap", text = "Johaan buys corpses by the cartload. I don't ask what for, and I don't sell to him." } },
    background = { { id = "tp_bg", text = "I was a clerk's girl in Brill. I still read other people's letters, only now I don't apologise." } },
    _none = { { id = "tp_none", text = "Haven't heard a whisper of that. Give me a day or two." } },
  },
}

-- Sahvan Bloodshadow: walks his rounds through Brill, stopping at one grave.
P:NPC {
  key = "tf_sahvan_bloodshadow", id = TODO_NPC("Sahvan Bloodshadow"), name = "Sahvan Bloodshadow", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "grim", "quiet" }, values = { "loyal" },
  impression = {
    first = "Sahvan Bloodshadow walks the same path through Brill again and again, and each time he passes the cemetery he stops at one grave and stands there a moment too long.",
    third = "{name} met Sahvan Bloodshadow, a Forsaken who walks Brill's streets and pauses at a single grave.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Walk with me again, {class}. I'll not stop for long, but I'm glad of the company on this path." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Walk on, if you must, but I've no wish to talk to you today." },
    { id = "g_default", text = "Walk with me if you must talk, {class}. I don't stop for long, except in one place." },
  },
  start = "hello",
  nodes = {
    w3_flock = {
      lines = {
        { id = "w3_flock_1", text = "Scattered, when the plague came over the hills, and eaten, I'd think, by what came after. But there's one ewe I still see, now and then, on the high ground above the Brill road, grey and thin and alive somehow, and she runs when she sees me." },
      },
      choices = {
        { text = "She doesn't know you any more.", next = "w3_know" },
        { text = "Perhaps she remembers you, and that's why she runs.", next = "BACK", reply = "Perhaps. I'd rather think she remembers me than that she's only afraid of what I am. I'll keep thinking it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_know = {
      lines = {
        { id = "w3_know_1", text = "No, and I'd not expect her to. I smell of the grave now, and Elise always said the flock knew my step before they saw me. I leave a handful of grain on a stone where she grazes, and it's gone by morning." },
      },
      choices = {
        { text = "That's a kindness, Sahvan. Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "I was a shepherd on the hills above Brill. Elise kept the house and the bees, and I kept the sheep, and we had a slow, good life. Then the grain came. She went first, and she didn't stay down." } },
      choices = {
        { text = "Why keep a grave for someone who left it?", next = "yrise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrise = {
      lines = { { id = "yrise_x", text = "Because it's the last place she was mine. The Deathguard want the plot for the newly risen, and they've asked me twice to give it up. Should I let it go, or keep it waiting for her?" } },
      choices = {
        { text = "Give it up. The living dead need it more.", next = "BACK", reply = "Aye. That's the sensible answer, and the Executor's too. I'll think on it.", fx = { align = { order = 1 } } },
        { text = "Keep it. No order should take that from you.", next = "BACK", reply = "Then I'll keep it, and they can ask a third time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yvisit = {
      lines = { { id = "yvisit_x", text = "Doreen Beltis stands among the stones most nights. She doesn't speak, and nor do I. She has her own stone to watch, her sister's, the one with the lily. We are two of a kind, keeping watch for people who didn't come back the way we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Sahvan. The rest of the name I took after I woke, because the one I was born with belonged to a softer man." },
        { id = "yh_human", when = { race = "Human" }, text = "Sahvan. You're living, and human, and I'll try not to stare. My wife had hair your colour, once, and the rest of my name I took after I woke." },
      },
      again = { { id = "h_again", text = "Anything else? We're nearly at the gate, and I'll stop at the stone again." } },
      choices = {
        { text = "What was your wife's name?", next = "xname" },
        { text = "Why walk so much?", next = "xwalkwhy" },
        { text = "I lost someone to the Scourge too.", next = "xlost", when = { race = "Scourge" } },
        { text = "You stop at the same grave every time.", next = "grave" },
        { text = "Why do you walk the town like this?", next = "walk" },
        { text = "What did you do in life?", next = "ylife" },
        { text = "Does anyone else keep watch at the graves?", next = "yvisit" },
        { text = "What became of your flock?", next = "w3_flock" },
        { text = "Farewell, Sahvan.", next = "END" },
      },
    },
    grave = {
      lines = { { id = "gr_default", text = "You've sharp eyes. It's my wife's, and it's empty, because she rose before I did and walked north with the Scourge, and I've never learned where she went." } },
      choices = {
        { text = "She may be free now, like you.", next = "free" },
        { text = "I'm sorry.", next = "BACK", reply = "Don't be. Sorrow's a living habit, and I'm trying to break it." },
      },
    },
    free = {
      lines = { { id = "fr_default", text = "If she were, she'd have come home, and she hasn't. So I keep walking past an empty grave, and one day either she'll be standing beside it or I'll stop expecting her to." } },
      choices = {
        { text = "Hope is worth keeping, even now.", next = "BACK", reply = "Perhaps. It's the only thing I've kept, so I'll take your word for it.", fx = { align = { light = 1 } } },
        { text = "Let her go. The past is rot.", next = "BACK", reply = "That's the Forsaken creed, near enough, and I've never managed to believe it.", fx = { align = { light = -1 } } },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "Because a man who stands still in Tirisfal starts to hear things. I walk the square, the inn, the stables and the yard, and the Deathguard have stopped asking me to stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xname = {
      lines = {
        { id = "xn1", text = "Elise. She kept bees behind our cottage near Brill, and she had a laugh you could hear across the river. I've not said her name aloud in a long while, so thank you for asking it." },
      },
      choices = {
        { text = "Do you think she's still out there?", next = "xthere" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xthere = {
      lines = {
        { id = "xt1", text = "I think she's in the Plaguelands, in some rotting army under a banner of bone, and I think one day I'll find her. What I'll do then, I haven't decided." },
      },
      choices = {
        { text = "Set her free. Put her down yourself.", next = "BACK", reply = "That's the kindness I've been telling myself I'm brave enough for.", fx = { align = { light = 1 } } },
        { text = "She's Scourge now. Leave her to rot with them.", next = "BACK", reply = "Cold. And maybe wise. I'll think on it, while I walk.", fx = { align = { light = -1 } } },
      },
    },
    xwalkwhy = {
      lines = {
        { id = "xw1", text = "Because when I stand still, I think, and thinking leads me back to the empty grave. Walking keeps the feet busy and the mind quiet, and I've worn out three pairs of boots this year." },
      },
      choices = {
        { text = "Where do you walk to?", next = "xwhere" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhere = {
      lines = {
        { id = "xwh1", text = "Out to the bridges at the Bulwark and back, and sometimes as far as the Plaguelands' edge, where the grass turns grey. The Deathguard know my face and let me pass." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlost = {
      lines = {
        { id = "xl1", text = "Then you know the hole it leaves, and that the hole doesn't close just because the heart stopped beating. Walk with me some time, if you like, and we needn't talk." },
      },
      choices = {
        { text = "I'd like that.", next = "BACK" },
      },
    },
  },
  topics = {
    elise = { { id = "ytp_elise", text = "Elise kept bees. I still remember the hum of the hives in summer, and her laugh across the river." } },
    brill_graveyard = { { id = "ytp_bg", text = "The same grave, every time, and it's still empty. I can't help it." } },
    plaguelands = { { id = "xtp_pl", text = "Grey grass and walking dead. My wife is somewhere out there." } },
    deathknell = { { id = "xtp_dk", text = "Where I woke. I didn't like it, but I don't suppose anyone does." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask someone who stands still long enough to learn things." } },
  },
}

-- Thomas Arlento: Brill townsman.
P:NPC {
  key = "tf_thomas_arlento", id = TODO_NPC("Thomas Arlento"), name = "Thomas Arlento", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "gruff", "dry" }, values = { "practical" },
  impression = {
    first = "Thomas Arlento has the stooped shoulders of a man who worked a field all his life, and death hasn't straightened them.",
    third = "{name} met Thomas Arlento, a Forsaken farmhand living in Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Afternoon, {class}, or evening, it hardly matters. You've a strong back yourself, I think, and it's good to see you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The Deathguard need a strong back, and I've work to do, so I'll not stand and talk." },
    { id = "g_default", text = "Afternoon, {class}. Or evening; it's hard to tell under these clouds, and I've stopped trying." },
  },
  start = "hello",
  nodes = {
    ymiss = {
      lines = { { id = "ymiss_x", text = "Every morning. The barley in summer, gold to the horizon. Now Tirisfal grows nothing but grey grass and pumpkins that rot from the inside. I tend a little plot behind the inn, out of habit." } },
      choices = {
        { text = "What grows in your plot?", next = "yplot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yplot = {
      lines = { { id = "yplot_x", text = "Not much. An apothecary offered me a powder to help it along, and swore it made his own turnips grow fat. I've kept it in a jar for a month. Should I use it, or let the soil be?" } },
      choices = {
        { text = "Use it. A crop is a crop.", next = "BACK", reply = "Aye, I suppose so. If the turnips glow, I'll blame you.", fx = { align = { light = -1 } } },
        { text = "Stop. Poisoned soil only poisons more.", next = "BACK", reply = "My father would've said that. I'll throw the powder in the canal.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleaders = {
      lines = { { id = "yleaders_x", text = "Executor Zygand gives us work, and the Dark Lady gives us freedom. I don't ask for more. A farmer never did understand lords, and I'm too old to start." } },
      choices = {
        { text = "Did you have family, before?", next = "ymills" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydruid = {
      lines = { { id = "ydruid_x", text = "Heal? I'd give my last bone to see it. If you can coax one green shoot out of this ground, come and show me. I'll believe it then, and not before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ymills = {
      lines = { { id = "ymills_x", text = "A wife, Hannah, and a boy who wanted to be a soldier. The plague took Hannah in the house. The boy rode off with the militia to Andorhal and never wrote. I like to think he's still too busy to write." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Thomas Arlento. I farmed the land out past Agamand Mills when there was land worth farming, and now I hire on wherever the Deathguard need a strong back." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren. Your folk know the land, I hear. Tell me, can anything grow in soil like this? I've been trying for years." },
      },
      again = { { id = "h_again", text = "Something else, {class}?" } },
      choices = {
        { text = "What did you farm before?", next = "xfarm" },
        { text = "What work do the Deathguard give you?", next = "xwork" },
        { text = "Have you seen the Agamands since?", next = "xseen" },
        { text = "What happened to Agamand Mills?", next = "agamand" },
        { text = "Does anything grow in Tirisfal now?", next = "grow" },
        { text = "Do you miss the farm?", next = "ymiss" },
        { text = "What do you think of the Forsaken leaders?", next = "yleaders" },
        { text = "I'm a druid. Can this land heal?", next = "ydruid", when = { class = "DRUID" } },
        { text = "I'll let you get back to work.", next = "END" },
      },
    },
    agamand = {
      lines = { { id = "a_default", text = "The Agamands were a proud family and they owned most of it. The plague made them proud corpses instead, and they still shamble about the mills as Scourge, so I don't go back there." } },
      choices = {
        { text = "I could clear them out.", next = "clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clear = {
      lines = { { id = "c_default", text = "The Deathguard in Brill will pay you for it, I expect, and Magistrate Sevren's been asking for someone daft enough to try. Mind the old mill wheel; the planks rotted before I did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grow = {
      lines = { { id = "grow_default", text = "Pumpkins, oddly enough, and nightshade, and whatever the apothecaries plant to see if it kills things. A farmer could weep at what's become of this soil, if farmers could still weep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfarm = {
      lines = {
        { id = "xf1", text = "Barley and pumpkins, and a few pigs the Agamands didn't know about. Tirisfal soil was black and rich once, and you could grow a pumpkin the size of a cart if you were patient with it." },
      },
      choices = {
        { text = "Can anything grow here now?", next = "xgrow" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xgrow = {
      lines = {
        { id = "xg1", text = "Weeds, and the odd sickly turnip, and whatever the apothecaries plant in their own plots, which I don't touch. The plague went into the earth along with everyone else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwork = {
      lines = {
        { id = "xw1", text = "Hauling, digging, mending fences, whatever wants a strong back. I don't tire now, which the Deathguard appreciate, though I miss the feeling of a good day's ache at sundown." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xseen = {
      lines = {
        { id = "xs1", text = "Once, from the road. Old Nissa Agamand at the window of the mill, still in her Sunday dress, and her sons in the yard where they used to beat their farmhands. I turned around and walked home." },
      },
      choices = {
        { text = "They deserve to be put down, every one.", next = "BACK", reply = "Aye, and I'd not shed a tear, though I'd not want to be the one doing it.", fx = { align = { honor = -1 } } },
        { text = "Whatever they were, they were victims of the plague too.", next = "BACK", reply = "Victims, maybe. Cruel ones, before and after.", fx = { align = { honor = 1 } } },
      },
    },
  },
  topics = {
    hannah = { { id = "ytp_hannah", text = "Hannah kept the house while I kept the fields. I still set out two cups, some mornings." } },
    brill = { { id = "ytp_brill", text = "Brill's quiet. I like quiet. It reminds me of the fields." } },
    agamand = { { id = "xtp_ag", text = "They owned the land and everyone on it. Now they own nothing but their own rot." } },
    deathguard = { { id = "xtp_dg", text = "They pay in coin and they don't make me sing while I dig, so I've no complaints." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know dirt and weather, and not much of either anymore." } },
  },
}

-- Claire Willower: Brill townswoman, welcomes newcomers.
P:NPC {
  key = "tf_claire_willower", id = TODO_NPC("Claire Willower"), name = "Claire Willower", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "brisk", "dry" }, values = { "dutiful", "practical" },
  impression = {
    first = "Claire Willower greets newcomers to Brill with a clipped courtesy, as though welcoming people were a chore she'd been assigned and meant to do properly.",
    third = "{name} met Claire Willower, who points new arrivals in Brill in the right direction.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back to Brill, {class}. You've found your way about without falling in the river, which puts you ahead of most." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. You know where things are by now, so I'll not waste my breath telling you twice." },
    { id = "g_default", text = "Welcome to Brill, {class}. It isn't much, but it's ours, and the Scourge have to come through a great many Deathguard to take it back." },
  },
  start = "hello",
  nodes = {
    w3_ask = {
      lines = {
        { id = "w3_ask_1", text = "Where their house is, nine times in ten, because they remember Brill as it was and they've come home. I have to tell them that their house belongs to the Deathguard now, or the rats, or nobody, and I've learned to say it while I'm walking them toward the inn." },
      },
      choices = {
        { text = "Does it ever get easier to tell them?", next = "w3_easier" },
        { text = "At least someone tells them kindly.", next = "BACK", reply = "Kindly is the least I can do. The Deathguard would tell them with a pointed finger, and then go back to leaning." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_easier = {
      lines = {
        { id = "w3_easier_1", text = "No, but I've got quicker at it, which isn't the same. A schoolmistress learns to tell a child the answer is wrong without making them hate the sum, and that's all this is, really, with the whole of their old life for the sum." },
      },
      choices = {
        { text = "That's a hard lesson to teach. Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "The schoolmistress in Brill. I taught letters to farm children in the room above the smithy. I still welcome people the way I welcomed new pupils, with a list of rules and a firm smile." } },
      choices = {
        { text = "Do you miss your pupils?", next = "ypupils" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypupils = {
      lines = { { id = "ypupils_x", text = "Some of them rose. One works for the apothecaries now, and he doesn't remember a single letter I taught him. Should I teach him again, or let him be what he's become?" } },
      choices = {
        { text = "Teach him. Learning is never wasted.", next = "BACK", reply = "Then I'll find him a slate. He'll grumble, but he always did.", fx = { align = { light = 1 } } },
        { text = "Let him be. The past is dead with him.", next = "BACK", reply = "Perhaps. Though I've never been good at leaving a lesson unfinished.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhard = {
      lines = { { id = "yhard_x", text = "It's easier than teaching sums, and the newcomers listen better. The hardest are the living visitors. They stare at my jaw and pretend they aren't. I've learned to stare back until they stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Claire Willower. New arrivals up from Deathknell come through here bewildered, so I tell them where things are before they wander into the river." },
        { id = "h_undead", when = { race = "Scourge" }, text = "You've the look of someone fresh out of the Deathknell graves. Don't worry; the confusion wears off, and what's left after it is mostly bearable." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren. Welcome to Brill. Mind the inn's ceiling beams, the last of your kind left a horn-shaped dent and Innkeeper Renee hasn't forgiven him." },
      },
      again = { { id = "h_again", text = "Anything else you need pointed at? I know Brill better than its own maps." } },
      choices = {
        { text = "What's the Gallows' End like?", next = "xinn" },
        { text = "Why do you help newcomers?", next = "xwhy" },
        { text = "Any advice for a new Forsaken?", next = "xnew", when = { race = "Scourge" } },
        { text = "A living visitor. Am I safe here?", next = "xliving", when = { race = "Orc" } },
        { text = { normal = "Where should I go first?", polite = "Where would you suggest I go first?", blunt = "Where do I go?" }, next = "where" },
        { text = "Who's in charge here?", next = "charge" },
        { text = "Who were you before?", next = "ylife" },
        { text = "Is it hard, welcoming strangers?", next = "yhard" },
        { text = "What do newcomers ask you most?", next = "w3_ask" },
        { text = "I'll find my own way.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "The Gallows' End Tavern, for a hearth to bind to and Innkeeper Renee's rooms. Trainers are about the square, and the Undercity is east up the road past the ruins of the old capital." } },
      choices = {
        { text = "What's at the ruins?", next = "ruins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = { { id = "r_default", text = "Lordaeron's palace, or what Arthas left of it. The Dark Lady rules from the vaults underneath, and you'll want to go and see the Undercity for yourself at least once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charge = {
      lines = { { id = "c_default", text = "Executor Zygand keeps the Deathguard, and Magistrate Sevren keeps the town hall and the paperwork. Between the two of them, Brill is well defended and thoroughly filed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xinn = {
      lines = {
        { id = "xi1", text = "Warm, if you count the fire, and loud, if you count the gossip. Renee keeps a decent cellar and doesn't ask what you did before you died, which is the best kind of innkeeper." },
      },
      choices = {
        { text = "Who else is worth knowing in Brill?", next = "xwho" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xwho = {
      lines = {
        { id = "xw1", text = "Executor Zygand keeps the guard, and Magistrate Sevren hands out the work that needs doing. Apothecary Johaan is down in the cellar near the tavern, and if he offers you a drink, decline it politely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = {
        { id = "xwy1", text = "Because I woke in Deathknell myself, with dirt in my mouth and no notion of what I'd become, and the first person who spoke kindly to me was a Deathguard who'd been dead a week longer. I owe that debt forward. Some come up from the crypts angry and some come up weeping, and both kinds need to know where the inn is." },
      },
      choices = {
        { text = "Kindness is wasted on the dead.", next = "BACK", reply = "Perhaps, but we have so little else to spend our time on.", fx = { align = { light = -1 } } },
        { text = "Kindness is what keeps us from being Scourge.", next = "BACK", reply = "I think so too, and I'm glad you said it aloud.", fx = { align = { light = 1 } } },
      },
    },
    xnew = {
      lines = {
        { id = "xn1", text = "Don't look into still water for the first few weeks, and don't go looking for your old family until you're ready for what you'll find. And bind yourself to the inn before you wander, because the spirit healers are far apart." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    xliving = {
      lines = {
        { id = "xl1", text = "Safe enough, so long as you stay out of the apothecaries' cellars. The Horde's our ally, and the Deathguard know it, even if some of them look at you as though you'd make a good experiment." },
      },
      choices = {
        { text = "Good to know. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gallows_end = { { id = "ytp_ge", text = "The Gallows' End is the warmest room in Brill, which isn't saying much." } },
    schooling = { { id = "ytp_school", text = "I taught letters in Brill once. Some habits outlast the body." } },
    brill = { { id = "xtp_br", text = "Our town. It was a human town once, and now it's a better one, or at least a quieter one." } },
    scarlet = { { id = "xtp_sc", text = "The Scarlet Crusade burn our kind on sight. Stay off the roads near the monastery." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Try the town hall; they keep records of everything." } },
  },
}

---------------------------------------------------------------------------
-- Argent Defender: an Argent Dawn soldier watching the edge of the plaguelands.
-- Living, stubborn, uneasy around the Forsaken but sworn to fight only the Scourge.
---------------------------------------------------------------------------
P:NPC {
  key = "tir_argent_defender", id = 11194, name = "Argent Defender",
  role = "guard", tier = "service",
  temper = { "steady", "wary" }, values = { "duty", "the Light" },
  impression = {
    first = "A soldier in the Argent Dawn's silver tabard, sword drawn, eyes fixed on the east where the plague still creeps.",
    third = "{name} spoke with an Argent Defender keeping watch against the Scourge.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and welcome. The Dawn remembers those who stand against the Scourge, and you've stood well." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Pass if you must, but keep your weapon handy, and don't think I've stopped watching you." },
    { id = "g_default", text = "Hold there. You're not Scourge, so you're welcome to pass, but keep your weapon handy." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "Forsaken. The Dawn has no quarrel with you, so long as your quarrel is with the Lich King." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, or near enough. Good. The line holds a little better with every pair of hands." },
  },
  start = "hello",
  nodes = {
    w3_plague = {
      lines = {
        { id = "w3_plague_1", text = "The Dawn's priests bless our water every morning, and we burn everything the Scourge touches, and we pray, mostly. I caught a touch of it once, at the edge of the Plaguelands, and a priest of the Dawn sat with me three days until the fever broke." },
        { id = "w3_plague_2", when = { race = "Scourge" }, text = "You'll find that funny, I expect, since it's already had you. The Dawn's priests bless our water, we burn what the Scourge touches, and we pray, and I caught a touch of it once and lived only because a priest sat with me three days." },
      },
      choices = {
        { text = "Did the priest catch it too?", next = "w3_priest" },
        { text = "The Dawn looks after its own, then.", next = "BACK", reply = "It looks after anyone who fights the Scourge. That's the only rule we keep without arguing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_priest = {
      lines = {
        { id = "w3_priest_1", text = "No, thank the Light, though she'd have stayed anyway, I think. She was a Forsaken, as it happens, one of the few the Dawn's taken in, and she held my hand the whole three days with hers as cold as a grave." },
      },
      choices = {
        { text = "That changed your mind about the Forsaken? Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "A farmer's son from Hillsbrad. I joined the Lordaeron army too late to save anything. When the Argent Dawn formed, I took their tabard because it was the only banner left that fought the dead and not the living." } },
      choices = {
        { text = "The Argent Dawn's discipline is what holds the plague back.", next = "BACK", reply = "It is, and it's why we've lasted where the Crusade has rotted from within. Discipline, and the Light.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Fight the Scourge any way you can, Dawn's rules or no.", next = "BACK", reply = "Any way you can, aye, until your way gets a comrade killed. Our rules exist for a reason.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do the Scarlets ever try to recruit you?", next = "yscarlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yscarlet = {
      lines = { { id = "yscarlet_x", text = "Often. They say the Dawn is soft for treating with Forsaken. My brother wears the Scarlet tabard now. Should I keep trying to bring him to the Dawn, or let him be lost?" } },
      choices = {
        { text = "Keep trying. Family's worth the fight.", next = "BACK", reply = "Thank you. I'll write him again, though he burns my letters.", fx = { align = { light = 1 } } },
        { text = "Let him go. He chose his side.", next = "BACK", reply = "Perhaps. I'd still rather face him with words than steel.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yask = {
      lines = { { id = "yask_x", text = "Only that we fight the Scourge first and question the rest later. The old Highlord Mograine's own son serves the Scarlets in their monastery now. That's a sorrow the Dawn doesn't speak of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The Argent Dawn sent us to watch the roads where the plague spills over. We don't care whose banner you march under, only that you're no friend of the Scourge." },
        { id = "yh_scourge", when = { race = "Scourge" }, text = "Forsaken. The Dawn stands with any who fight the Scourge. Speak, and I'll listen, though I'll keep my sword where it is." },
      },
      again = { { id = "h_again", text = "Anything else? I'd rather talk with my eyes on the road, if it's all the same to you." } },
      choices = {
        { text = "Why does the Dawn guard Tirisfal?", next = "xwhy" },
        { text = "Do you trust the Forsaken?", next = "xtrust" },
        { text = "I'm a paladin. I'd serve the Dawn.", next = "xpal", when = { class = "PALADIN" } },
        { text = "What is the Argent Dawn?", next = "dawn" },
        { text = "How bad is the plague out east?", next = "east" },
        { text = "How do you feel about the Forsaken?", next = "forsaken" },
        { text = "Who were you before the Dawn?", next = "ylife" },
        { text = "What does the Dawn ask of its soldiers?", next = "yask" },
        { text = "How do you keep from catching the plague out here?", next = "w3_plague" },
        { text = "Light keep you, Defender.", next = "END" },
      },
    },
    dawn = {
      lines = { { id = "da_default", text = "We're soldiers, priests and scholars who agreed on one thing: the Scourge must be ended. Our headquarters are at Light's Hope Chapel, and our quartermasters reward anyone who brings back proof of the fight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    east = {
      lines = { { id = "ea_default", text = "Bad enough that whole towns walk at night now. Stratholme is a tomb with the gates open, and the Plaguewood rots more every season. We hold what we can and pray for the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Some in the Dawn say they're only Scourge who forgot their master's voice. Others say the dead who choose to fight him are allies, however they smell. I try not to decide until I have to." } },
      choices = {
        { text = "Anyone who fights the Scourge is an ally.", next = "BACK", reply = "That's the Dawn's word on it, and I keep to it.", fx = { align = { light = -1 } } },
        { text = "The dead should be laid to rest, all of them.", next = "BACK", reply = "Say that a bit quieter around here, friend.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = {
        { id = "xw1", text = "Because the plague doesn't stop at borders, and neither do the dead. If the Scourge breaks through here, Brill falls, and then the Undercity, and then whatever's left of the north is theirs." },
      },
      choices = {
        { text = "Do the Forsaken want you here?", next = "xwant" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xwant = {
      lines = {
        { id = "xwa1", text = "They tolerate us, which is more than I expected. Their Deathguard and I stand watch a hundred paces apart and nod to each other at dawn, and that's as close to friendship as the north allows." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrust = {
      lines = {
        { id = "xt1", text = "I trust any soldier who fights the Lich King, and I watch any soldier who brews plague in a cellar. The Forsaken are both, and so I trust them and watch them at once." },
        { id = "xt2", when = { race = "Scourge" }, text = "No offence meant, friend. You've been honest with me, and I'll be honest with you in turn." },
      },
      choices = {
        { text = "The Forsaken are allies against the Scourge. Trust them.", next = "BACK", reply = "Perhaps. The Dawn will judge them by their deeds.", fx = { align = { light = -1 } } },
        { text = "The dead are the dead. Watch them closely.", next = "BACK", reply = "I do, and I'll keep doing it, Light forgive me.", fx = { align = { light = 1 } } },
      },
    },
    xpal = {
      lines = {
        { id = "xp1", text = "Then go to Light's Hope Chapel in the east, and tell the Dawn you've come to fight. They'll test you, and send you into places no paladin should walk, and you'll go anyway." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    argent_dawn = { { id = "ytp_ad", text = "The Dawn fights the Scourge wherever it walks. Tirisfal is no exception." } },
    scarlet_crusade = { { id = "ytp_sc", text = "The Scarlets hate the dead so much they've forgotten to love the living." } },
    scourge = { { id = "xtp_sc", text = "The Lich King's army. It never sleeps and never stops." } },
    lights_hope = { { id = "xtp_lh", text = "Our chapel in the east. The dead can't walk on its ground." } },
  },
}

---------------------------------------------------------------------------
-- Wickerman Guardian: Forsaken soldier set over the Wicker Man at Hallow's End.
---------------------------------------------------------------------------
P:NPC {
  key = "tir_wickerman_guardian", id = 15195, name = "Wickerman Guardian",
  role = "guard", tier = "service",
  communities = { "undercity" }, temper = { "grim", "proud" }, values = { "freedom", "the Dark Lady" },
  impression = {
    first = "A Forsaken soldier stands by the towering wicker figure, his armour glinting orange in the light of the festival fires.",
    third = "{name} spoke with a Wickerman Guardian, one of the Forsaken soldiers who guard the Wicker Man at Hallow's End.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and welcome. Stand by the effigy with me tonight, and we'll watch the Wicker Man burn together." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep back from the effigy, and don't touch a torch until the Dark Lady gives the word." },
    { id = "g_default", text = "Keep back from the effigy until the burning. The Dark Lady wants it lit properly, not by some fool with a torch." },
    { id = "g_hallows", when = { holiday = "hallowsend" }, text = "Hallow's End, at last. Tonight the Wicker Man burns, and every one of us remembers the day we broke our chains." },
    { id = "g_living", when = { race = "Orc" }, text = "An orc at our festival. Watch and learn what freedom looks like to the dead." },
  },
  start = "hello",
  nodes = {
    w3_made = {
      lines = {
        { id = "w3_made_1", text = "Reeds from the banks of Brightwater and willow from the Whispering Forest, bound with twine and pitch, and every Forsaken in Brill who wishes it weaves one strand. My strand is at the left knee, and every year I find it before the burning." },
      },
      choices = {
        { text = "What does weaving a strand mean?", next = "w3_strand" },
        { text = "I'd like to weave one myself.", next = "BACK", when = { race = "Scourge" }, reply = "Then come to me before the next Hallow's End, and I'll show you where to tie it. The knee's taken, mind." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_strand = {
      lines = {
        { id = "w3_strand_1", text = "That you had a part in your own freedom, and that you'll watch it burn and know it was yours. The Lich King made us all one thing, and the Wicker Man is made of all of us separately, and that, {class}, is the whole of the difference." },
      },
      choices = {
        { text = "A good difference. Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "A watchman in Brill. Every autumn I carried a torch round the town, warding off spirits. Now I guard the Wicker Man so the spirits can have their festival. Funny how it goes." } },
      choices = {
        { text = "The Wicker Man must burn at the appointed hour, as the Dark Lady commands.", next = "BACK", reply = "It must. Every one of us broke our chains together, and we burn it together, at the proper time.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Let anyone light the effigy when they please. It's a celebration.", next = "BACK", reply = "It's a remembrance, not a tavern brawl. The Dark Lady will have it done properly, or not at all.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How did the festival change?", next = "yhallow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrole = {
      lines = { { id = "yrole_x", text = "Keep the crowd back, keep the Alliance out, and make sure nobody lights it early. Last year a drunk orc tried, and I had to pour cider over him. He thanked me later. I think." } },
      choices = {
        { text = "Has the Alliance ever tried to sabotage it?", next = "yalliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yalliance = {
      lines = { { id = "yalliance_x", text = "A pair of dwarves came last year, with buckets. I caught them before they could douse it. They said it was a prank. Should I have let them go, or sent them to the Executor?" } },
      choices = {
        { text = "Let them go. It's a festival, after all.", next = "BACK", reply = "Aye, that's what I did. They left me a bottle of stout.", fx = { align = { order = -1 } } },
        { text = "Send them to the Executor. Rules are rules.", next = "BACK", reply = "That's the right answer, I suppose. I'll do better this year.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yscarlet = {
      lines = { { id = "yscarlet_x", text = "They watch from the hills and pray loud enough to hear. They've never come down. I think, in their hearts, they'd like to see it burn as much as we would." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yhallow = {
      lines = { { id = "yhallow_x", text = "Hallow's End was a living festival first, to scare the spirits off. Now the spirits run it. The masks are the same. Only the faces underneath have changed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I guard the Wicker Man. It stands for the chains the Lich King put on us, and when it burns, we remember that we threw them off. No one touches it before its time." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren at the Wicker Man! Stand back from the fire, friend. Fur burns as well as wicker." },
      },
      again = { { id = "h_again", text = "Something more? The fire won't wait forever." } },
      choices = {
        { text = "Who lights the Wicker Man?", next = "xlight" },
        { text = "Does the Dark Lady attend?", next = "xlady" },
        { text = "I'm a human. May I watch?", next = "xhuman", when = { race = "Human" } },
        { text = "Why burn a wicker man?", next = "why" },
        { text = "What do the living make of this?", next = "living" },
        { text = "Who were you before?", next = "ylife" },
        { text = "What's your role tonight?", next = "yrole" },
        { text = "Do the Scarlets ever try to stop the burning?", next = "yscarlet" },
        { text = "What's the Wicker Man made of?", next = "w3_made" },
        { text = "I'll watch the burning, then.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the Scourge made us burn the living, and now we choose what burns. It is a small thing, a heap of straw and sticks, but the choosing is everything." } },
      choices = {
        { text = "Then let it burn high.", next = "BACK", reply = "Spoken well. Stay for the lighting.", fx = { align = { order = -1 } } },
        { text = "A festival won't undo what the Forsaken have done.", next = "BACK", reply = "No. Nor was it meant to. It's for us, not for you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "li_default", text = "They carve gourds and hand out sweets, and they think the feast is theirs. Let them. We know whose day it really is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlight = {
      lines = {
        { id = "xl1", text = "A champion of the Undercity, chosen for deeds against the Scourge or the Scarlets. They carry the torch from the city's gate, and we follow, and when it catches, the whole hill sings." },
      },
      choices = {
        { text = "What do you sing?", next = "xsing" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xsing = {
      lines = {
        { id = "xs1", text = "Old songs of Lordaeron, with new words. The words are not kind to the living, and they are less kind to the Lich King." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlady = {
      lines = {
        { id = "xla1", text = "She has, and she may again, if the Scourge gives her a night's peace. Even the Banshee Queen remembers that she was once set free." },
      },
      choices = {
        { text = "The Dark Lady freed you. She deserves your loyalty.", next = "BACK", reply = "She does, and she has it, every one of us.", fx = { align = { order = 1 } } },
        { text = "You freed yourselves. Owe no one for it.", next = "BACK", reply = "Dangerous words, and true ones. Speak them quietly here.", fx = { align = { order = -1 } } },
      },
    },
    xhuman = {
      lines = {
        { id = "xh1", text = "Watch, then, from the edge of the firelight. Your people burned ours for years and called it mercy, so you'll forgive us if we enjoy a fire of our own choosing." },
      },
      choices = {
        { text = "I'll keep my distance.", next = "BACK" },
      },
    },
  },
  topics = {
    brill = { { id = "ytp_brill", text = "Brill burns the Wicker Man every year. Best show in Tirisfal." } },
    masks = { { id = "ytp_masks", text = "Wear a mask tonight. It's tradition, and it hides your expression when the Wicker Man goes up." } },
    hallows_end = { { id = "xtp_he", text = "Our feast. The living borrowed it and filled it with sweets." } },
    sylvanas = { { id = "xtp_sy", text = "The Dark Lady. She broke our chains first, and we broke the rest ourselves." } },
  },
}
