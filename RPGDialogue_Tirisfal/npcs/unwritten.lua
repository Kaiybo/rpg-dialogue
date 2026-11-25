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
    { id = "g_default", text = "Mind where you step, {class}. Half these graves are empty now, and the other half I'd rather you left alone." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The stones haven't changed since you last came, and neither have I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Doreen Beltis. I lived in Brill before the plague came up the road, and I'm still here after, which I suppose makes me the town's longest tenant." },
        { id = "h_living", when = { faction = "Alliance" }, text = "A living face in Brill's graveyard, and not even a Scarlet one. Say your piece quickly, before the Deathguard notice you." },
      },
      again = {
        { id = "h_again", text = "Something else? I've nowhere to be." },
        { id = "h_again2", text = "Go on. The dead are poor listeners." },
      },
      choices = {
        { text = { normal = "Whose graves are these?", polite = "If I may ask, whose graves are these?", blunt = "Who's buried here?" }, next = "graves" },
        { text = "You remember Brill as it was.", next = "before" },
        { text = "You keep watch here every night, by the look of it.", next = "watch" },
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
    { id = "g_default", text = "Good day, {class}. If you've come for cloth, I have it, and if you've come to stand in my light, I'd ask you to stand somewhere else." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Your seams are your own work, aren't they? They're crooked, but honestly crooked, which is more than I can say for most." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Constance Brisboise, apprentice clothier, though the master I apprenticed under is two years dead and not the useful kind of dead. I sell robes and gloves that will keep the rain off, and very little else." } },
      again = { { id = "h_again", text = "Anything else? I've hems to finish." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "Who was your master?", next = "master" },
        { text = "Where do you find good cloth in Tirisfal?", next = "cloth" },
        { text = "Let me see your wares.", next = "BUSINESS" },
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
  },
  topics = {
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
    { id = "g_default", text = "Quietly, {class}. The magistrate's in a mood, and I'd hate to miss whatever he says next." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of the light-fingered sort. Keep your hands where I can see them, and I'll keep mine where you can see them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jamie Nore. I don't have a post, exactly; I make myself useful by knowing things before the people who ought to know them." } },
      again = { { id = "h_again", text = "What else would you like to hear?" }, { id = "h_again2", text = "Ask away, quietly." } },
      choices = {
        { text = { normal = "What's the news in Brill?", polite = "Might you share the news in Brill?", blunt = "What's going on in Brill?" }, next = "news" },
        { text = "You're a spy, then.", next = "spy" },
        { text = "Who pays for what you know?", next = "pay", when = { class = "ROGUE" } },
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
  },
  topics = {
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
    { id = "g_default", text = "Walk with me if you must talk, {class}. I don't stop for long, except in one place." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Sahvan. The rest of the name I took after I woke, because the one I was born with belonged to a softer man." } },
      again = { { id = "h_again", text = "Anything else? We're nearly at the gate." } },
      choices = {
        { text = "You stop at the same grave every time.", next = "grave" },
        { text = "Why do you walk the town like this?", next = "walk" },
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
  },
  topics = {
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
    { id = "g_default", text = "Afternoon, {class}. Or evening; it's hard to tell under these clouds, and I've stopped trying." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Thomas Arlento. I farmed the land out past Agamand Mills when there was land worth farming, and now I hire on wherever the Deathguard need a strong back." } },
      again = { { id = "h_again", text = "Something else, {class}?" } },
      choices = {
        { text = "What happened to Agamand Mills?", next = "agamand" },
        { text = "Does anything grow in Tirisfal now?", next = "grow" },
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
  },
  topics = {
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
    { id = "g_default", text = "Welcome to Brill, {class}. It isn't much, but it's ours, and the Scourge have to come through a great many Deathguard to take it back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Claire Willower. New arrivals up from Deathknell come through here bewildered, so I tell them where things are before they wander into the river." },
        { id = "h_undead", when = { race = "Scourge" }, text = "You've the look of someone fresh out of the Deathknell graves. Don't worry; the confusion wears off, and what's left after it is mostly bearable." },
      },
      again = { { id = "h_again", text = "Anything else you need pointed at?" } },
      choices = {
        { text = { normal = "Where should I go first?", polite = "Where would you suggest I go first?", blunt = "Where do I go?" }, next = "where" },
        { text = "Who's in charge here?", next = "charge" },
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
  },
  topics = {
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
    { id = "g_default", text = "Hold there. You're not Scourge, so you're welcome to pass, but keep your weapon handy." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "Forsaken. The Dawn has no quarrel with you, so long as your quarrel is with the Lich King." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, or near enough. Good. The line holds a little better with every pair of hands." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The Argent Dawn sent us to watch the roads where the plague spills over. We don't care whose banner you march under, only that you're no friend of the Scourge." },
      },
      again = { { id = "h_again", text = "Anything else? I'd rather talk with my eyes on the road, if it's all the same to you." } },
      choices = {
        { text = "What is the Argent Dawn?", next = "dawn" },
        { text = "How bad is the plague out east?", next = "east" },
        { text = "How do you feel about the Forsaken?", next = "forsaken" },
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
    { id = "g_default", text = "Keep back from the effigy until the burning. The Dark Lady wants it lit properly, not by some fool with a torch." },
    { id = "g_hallows", when = { holiday = "hallowsend" }, text = "Hallow's End, at last. Tonight the Wicker Man burns, and every one of us remembers the day we broke our chains." },
    { id = "g_living", when = { race = "Orc" }, text = "An orc at our festival. Watch and learn what freedom looks like to the dead." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I guard the Wicker Man. It stands for the chains the Lich King put on us, and when it burns, we remember that we threw them off. No one touches it before its time." },
      },
      again = { { id = "h_again", text = "Something more? The fire won't wait forever." } },
      choices = {
        { text = "Why burn a wicker man?", next = "why" },
        { text = "What do the living make of this?", next = "living" },
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
  },
}
