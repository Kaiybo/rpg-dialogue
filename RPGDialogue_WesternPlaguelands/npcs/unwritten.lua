-- Western Plaguelands: Caer Darrow's nameless ghosts a roster scan found with no conversation yet: a guardsman,
-- a cannoneer, a horseman and a citizen, all seen only with the Spectral Essence. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Caer Darrow Guardsman: a ghostly guard still walking his rounds.
P:NPC {
  key = "wpl_cd_guardsman", id = TODO_NPC("Caer Darrow Guardsman"), name = "Caer Darrow Guardsman",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "caer_darrow" }, temper = { "dutiful", "confused" }, values = { "duty", "loyal" },
  notices = { "class" },
  impression = {
    first = "A ghostly guardsman of Caer Darrow, still walking his rounds as if nothing had happened, though the town around him is full of the dead.",
    third = "{name} spoke with the ghost of one of Caer Darrow's guardsmen.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again, traveller, and welcome. Lord Barov's peace holds, so pass freely, and good day to you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Halt. I remember you, traveller, and I'll be watching you closely while you're in Caer Darrow." },
    { id = "g_default", text = "Halt, in the name of Lord Barov! State your business in Caer Darrow, traveller." },
    { id = "g_back", when = { metBefore = true }, text = "You again, traveller. Strange, I can't remember the last time anyone came twice." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A knight of the Silver Hand! Welcome, sir, Lord Barov will be glad to have one of Uther's own in the keep." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the peace in Caer Darrow, same as every day, though the town's been terribly quiet of late. The Barovs keep to the keep and the folk keep to their houses, and nobody tells a guardsman why." } },
      again = { { id = "h_again", text = "Anything else, traveller? I've my rounds to walk." } },
      choices = {
        { text = "Lord Barov's law keeps Caer Darrow peaceful. I'll respect it.", next = "BACK", reply = "Spoken like a good guest. Keep to it, and the town will keep you safe.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Barov's laws only protect Barov. I'll do as I please here.", next = "BACK", reply = "Then you'll do it in the stocks, traveller, and I'll be glad to put you there.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "When did you last see Lord Barov?", next = "xbarov" },
        { text = "What do you do when your shift ends?", next = "xshift" },
        { text = "You are dead. Look at your hands.", next = "xhands" },
        { text = "I'm a priest. I could help you rest.", next = "xrest", when = { class = "PRIEST" } },
        { text = "You know you're dead, don't you?", next = "dead" },
        { text = "What happened to the Barovs?", next = "barov" },
        { text = "Who lives in the keep now?", next = "keep" },
        { text = "Carry on, guardsman.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Dead? Don't be foolish, I'm standing right here, aren't I? Although now you mention it, I can't recall when I last ate, or slept, or saw the sun come up properly." } },
      choices = {
        { text = "Let him keep his rounds. He's at peace.", next = "BACK", reply = "Peace? Yes, I suppose it is peaceful, in a way.", fx = { align = { order = 1 } } },
        { text = "He deserves the truth, however hard it is.", next = "BACK", reply = "The truth? I... no. No, I have my rounds to walk.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barov = {
      lines = { { id = "b_default", text = "Lord Barov had dealings with some strange men from the north, men in dark robes, and after that, he stopped coming down to the town. I didn't ask, because a guardsman doesn't ask his lord's business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "The Barovs, of course, and their guests, though I've not seen a living servant go in or out for some time. There's a cold that comes off those walls at night that I don't like at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbarov = {
      lines = {
        { id = "xb1", text = "Lord Alexei rides in from the keep every morning, or he did, until the morning he didn't. There were strange folk in robes with him in his last visits, scholars, he said, invited to teach in the keep." },
      },
      choices = {
        { text = "Those scholars were the Cult of the Damned.", next = "xcult" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xcult = {
      lines = {
        { id = "xc1", text = "The what? Lord Barov would never... no, he'd not have let such people into Caer Darrow. You've got your facts muddled, friend, and I'll thank you not to slander the family." },
      },
      choices = {
        { text = "The Barovs sold their people to the Scourge.", next = "BACK", reply = "That's a lie, and I'd strike you for it, if my arm would only move.", fx = { align = { honor = -1 } } },
        { text = "Maybe the Barovs were deceived, like the rest.", next = "BACK", reply = "Deceived. Yes. That must be it, mustn't it?", fx = { align = { honor = 1 } } },
      },
    },
    xshift = {
      lines = {
        { id = "xs1", text = "Home to my wife and a bowl of stew, same as always. Only it's been a long shift, now I think of it, and I can't recall the way home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhands = {
      narr = "He lifts his hands and stares through them at the cobbles beneath.",
      lines = {
        { id = "xh1", text = "Oh, Light, you're right, I can see the stones through my palms. How long has it been?" },
      },
      choices = {
        { text = "Years. I'm sorry.", next = "BACK", reply = "Years. And still I keep the gate. Leave me to it, then, because I don't know what else to do." },
      },
    },
    xrest = {
      lines = {
        { id = "xr1", text = "Rest? I'll rest when Lord Barov dismisses me, and not before, thank you. Though it's kind of you to offer, and I don't recall the last time someone was kind." },
      },
      choices = {
        { text = "The offer stands.", next = "BACK" },
      },
    },
  },
  topics = {
    barov = { { id = "xtp_ba", text = "The Barov family rule Caer Darrow. Fine people, generous with the harvest." } },
    scholomance = { { id = "xtp_sc", text = "Scholars in the keep? I've not been inside in some time, now that you ask." } },
    background = { { id = "tp_bg", text = "I'm a guardsman of Caer Darrow, sworn to Lord Barov." } },
    _none = { { id = "tp_none", text = "I couldn't say, traveller. Ask at the keep." } },
  },
}

-- Caer Darrow Cannoneer: a ghostly gunner still at the town's cannons.
P:NPC {
  key = "wpl_cd_cannoneer", id = TODO_NPC("Caer Darrow Cannoneer"), name = "Caer Darrow Cannoneer",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "caer_darrow" }, temper = { "gruff", "anxious" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "A ghostly cannoneer of Caer Darrow, still standing by his gun and staring out over Darrowmere Lake for an enemy that never came by water.",
    third = "{name} spoke with the ghost of one of Caer Darrow's cannoneers.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you, friend! Stand by me awhile; she's quiet today, and I'd like the company while I watch the water." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand well clear of my gun, and I mean well clear, because I don't trust you near the powder." },
    { id = "g_default", text = "Stand clear of the gun, friend! She's loaded and she's touchy, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Stand clear, same as before, and keep your torch away from the powder." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You've the eye of a marksman, friend. Could you hit a boat at five hundred yards? I could, once." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I man the cannons of Caer Darrow, and I watch the lake for raiders, as Lord Barov ordered. Nothing has come across the water in a very long time, but I keep watching, because those are my orders." } },
      again = { { id = "h_again", text = "What else? Make it quick, I'm on watch." } },
      choices = {
        { text = "A gunner who sleeps at his post betrays the whole town.", next = "BACK", reply = "Aye, and I've never slept once at mine. Not once, in all the years I've stood here.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Nobody attacks by water. You could nap, and no one would know.", next = "BACK", reply = "I would know, friend, and if the boats ever come, the town would know too.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "When did you last fire the cannon?", next = "xfire2" },
        { text = "Who gives you your orders now?", next = "xorders" },
        { text = "I'm a dwarf. That's a fine gun.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "What did you expect to come across the lake?", next = "lake" },
        { text = "The danger came from inside the walls.", next = "inside" },
        { text = "When did you last fire that cannon?", next = "fire" },
        { text = "Keep watching, then.", next = "END" },
      },
    },
    lake = {
      lines = { { id = "l_default", text = "Trolls, maybe, or bandits, or the Horde come back again from the old wars. We never thought to watch the town behind us, and I suppose that was our mistake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inside = {
      lines = { { id = "i_default", text = "Inside? I don't follow you, friend. The keep is Lord Barov's, and nothing comes out of it but orders, and the orders say watch the lake." } },
      choices = {
        { text = "Orders are orders. You did your duty.", next = "BACK", reply = "I did, didn't I? I did my duty.", fx = { align = { order = 1 } } },
        { text = "Blind obedience got this whole town killed.", next = "BACK", reply = "Killed? I... I don't understand you, friend. Leave me be.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "f_default", text = "The night the screaming started in the town, I think, though I can't remember what I was aiming at. It's all mist after that, and I've been standing here ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfire2 = {
      lines = {
        { id = "xf1", text = "At a troll raft in the Second War, and I sank it too, square amidships. Since then, salutes on Lord Barov's birthday, and nothing else, though I keep her loaded, just in case." },
      },
      choices = {
        { text = "Do you still hear the town behind you?", next = "xtown" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xtown = {
      lines = {
        { id = "xt1", text = "I hear bells sometimes, and screaming, but always behind me, and when I turn round there's nothing. I've stopped turning round, because orders say to watch the lake." },
      },
      choices = {
        { text = "You should turn around and face it.", next = "BACK", reply = "Face what? There's nothing there. There's never anything there.", fx = { align = { order = -1 } } },
        { text = "Orders are orders. Watch the lake.", next = "BACK", reply = "Exactly so. A good soldier keeps to his post, whatever happens.", fx = { align = { order = 1 } } },
      },
    },
    xorders = {
      lines = {
        { id = "xo1", text = "The sergeant, though I haven't seen him since the grey morning. Lord Barov before that, and the king before him, Light keep King Terenas on his throne." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd1", text = "She's Ironforge make, you've a good eye! Bought from your people before the Second War, and she's never misfired once, which is more than I can say for myself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    terenas = { { id = "xtp_te", text = "Long live the king! He sent us these guns himself, or his quartermaster did." } },
    lake = { { id = "xtp_lk", text = "Darrowmere. Calm as glass, always. Too calm, some days." } },
    background = { { id = "tp_bg", text = "I'm a cannoneer of Caer Darrow, and the guns are my charge." } },
    _none = { { id = "tp_none", text = "Don't know anything about that, friend. Just the guns." } },
  },
}

-- Caer Darrow Horseman: a ghostly rider on a spectral horse.
P:NPC {
  key = "wpl_cd_horseman", id = TODO_NPC("Caer Darrow Horseman"), name = "Caer Darrow Horseman",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "caer_darrow" }, temper = { "proud", "melancholy" }, values = { "duty", "honor" },
  notices = { "class" },
  impression = {
    first = "A ghostly horseman of Caer Darrow, riding a spectral steed around the town in endless circles, as if patrolling a border that no longer exists.",
    third = "{name} spoke with the ghost of one of Caer Darrow's horsemen.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, traveller! My steed tossed his head when he saw you, and he's a good judge of folk." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand aside from the road, traveller, because I'll not slow for you twice." },
    { id = "g_default", text = "Whoa, steady there! You came up so quiet, traveller, I nearly rode you down." },
    { id = "g_back", when = { metBefore = true }, text = "You again, traveller! Have you come to ride with me, or just to stare?" },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! I always dreamed of riding with the Silver Hand, and Lord Barov said one day I might." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I ride the patrol around Caer Darrow, the same circle as always, the shore, the gate, the keep and round again. My horse knows the way so well I could sleep in the saddle, and maybe I do." } },
      again = { { id = "h_again", text = "Anything else, traveller? My horse is restless." } },
      choices = {
        { text = "A rider who swears to guard a border should guard it.", next = "BACK", reply = "Aye, and I'll ride it till my horse drops, and then I'll walk it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Ride somewhere better. No one will ever check your circuit.", next = "BACK", reply = "Lord Barov would, traveller, and so would my own conscience, which is worse.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's your horse's name?", next = "xname" },
        { text = "Who rides with you on patrol?", next = "xwho" },
        { text = "I'm a paladin. Your horse is a spirit too.", next = "xpal", when = { class = "PALADIN" } },
        { text = "Your horse looks like a ghost too.", next = "horse" },
        { text = "Why ride in circles?", next = "circles" },
        { text = "Have you seen anything strange?", next = "strange" },
        { text = "Ride on, horseman.", next = "END" },
      },
    },
    horse = {
      lines = { { id = "h2_default", text = "She's pale, I'll grant you, and she doesn't eat much anymore, but she's never thrown me once. We've been together since I joined the Barov guard, and I'll not ride another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circles = {
      lines = { { id = "c_default", text = "Because those are my orders, and because I can't seem to find the road out of town. Every time I turn for the bridge, I find myself back at the gate." } },
      choices = {
        { text = "Then keep riding. Someone has to guard this place.", next = "BACK", reply = "Aye. Someone has to.", fx = { align = { light = -1 } } },
        { text = "You should be at rest. I'll pray for you.", next = "BACK", reply = "Rest? That sounds... very fine, traveller. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "Men in black robes, coming and going from the keep, and lights in the windows that aren't candles. Lord Barov told us to look the other way, and so we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xname = {
      lines = {
        { id = "xn1", text = "Bramble, on account of how she went through a hedge her first day and never looked back. She was a farm horse, really, too stubborn for the plough and just stubborn enough for soldiering." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwho = {
      lines = {
        { id = "xw1", text = "There were six of us once, riding the circle in pairs. The others stopped coming out, one by one, and the sergeant said they'd been taken sick, and then the sergeant stopped coming out too." },
      },
      choices = {
        { text = "What do you think happened?", next = "xthink" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xthink = {
      lines = {
        { id = "xt1", text = "Sickness, like he said, from the grain. But a sick man doesn't stop being a man, and I've seen things in the keep's windows that don't move like men." },
      },
      choices = {
        { text = "Ride out, and don't come back here.", next = "BACK", reply = "Leave my post? I couldn't, even if Bramble would carry me past the gate.", fx = { align = { honor = -1 } } },
        { text = "Keep your patrol. Someone should watch.", next = "BACK", reply = "Aye, someone should. I suppose that's me.", fx = { align = { honor = 1 } } },
      },
    },
    xpal = {
      narr = "He reaches down to pat the mare's neck, and his hand passes through her mane like smoke.",
      lines = {
        { id = "xp1", text = "She's still warm to me, {class}. Don't tell me otherwise, please." },
      },
      choices = {
        { text = "I won't.", next = "BACK" },
      },
    },
  },
  topics = {
    barov = { { id = "xtp_ba", text = "The family pays us and feeds the horses. Or they did." } },
    bramble = { { id = "xtp_br", text = "My horse. Best mare in Caer Darrow." } },
    background = { { id = "tp_bg", text = "I'm a horseman of the Barov guard, and I've ridden this patrol longer than I can remember." } },
    _none = { { id = "tp_none", text = "I don't know, traveller. I only know the patrol." } },
  },
}

-- Caer Darrow Citizen: one of the town's ghostly folk.
P:NPC {
  key = "wpl_cd_citizen", id = TODO_NPC("Caer Darrow Citizen"), name = "Caer Darrow Citizen",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "caer_darrow" }, temper = { "wistful", "skittish" }, values = { "memory", "family" },
  notices = { "race" },
  impression = {
    first = "A ghostly citizen of Caer Darrow, going about errands that ended long ago, with a basket that holds nothing at all.",
    third = "{name} spoke with the ghost of one of Caer Darrow's townsfolk.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, and how lovely! I'd give you something from my basket, dear, if I could just remember what I put in it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Good day, I suppose, though I'd rather you didn't follow me to market today." },
    { id = "g_default", text = "Oh! Good day to you, stranger, I didn't hear you on the cobbles. It's been so long since we had visitors in town." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! How nice, nobody ever comes back to Caer Darrow." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Oh, you poor thing, you look terribly unwell. Is it the sickness from the grain? So many in town have it now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm just on my way to the market, though I can't seem to find it, which is very silly in a town this small. Everyone's been so quiet lately, and nobody answers their door." } },
      again = { { id = "h_again", text = "Was there something else, stranger?" } },
      choices = {
        { text = "What's your name?", next = "xname" },
        { text = "Who are the Barovs to you?", next = "xbarov" },
        { text = "You've been dead a long time.", next = "xdead" },
        { text = "What sickness was in the grain?", next = "grain" },
        { text = "Do you remember your family?", next = "family" },
        { text = "There is no market anymore.", next = "market" },
        { text = "Good day to you.", next = "END" },
      },
    },
    grain = {
      lines = { { id = "g2_default", text = "The grain from the north came in sacks marked from Andorhal, and after we ate the bread, people started falling ill. The priests said it would pass, and then the priests fell ill too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "My husband went to work at the keep and didn't come home, and my little ones were sleeping when I went out. I should get back to them, I really should, but I can't seem to find the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    market = {
      lines = { { id = "m_default", text = "No market? But I go every week, stranger, I'm sure of it, and the baker always saves me a loaf. You must be mistaken." } },
      choices = {
        { text = "You're right. I must be mistaken.", next = "BACK", reply = "There, you see? Now, if you'll excuse me.", fx = { align = { honor = -1 } } },
        { text = "I'm sorry. Caer Darrow fell to the plague.", next = "BACK", reply = "Fell? No, no, it can't have. I'd have noticed, wouldn't I?", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xname = {
      lines = {
        { id = "xn1", text = "Maudie, of the bakery by the bridge. Everyone knows my seed cakes, though now I come to think of it, I can't remember when I last lit the oven." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbarov = {
      lines = {
        { id = "xb1", text = "Lord Alexei and his lady, and their children, Alexei the younger and Weldon and the girl. They held a harvest festival every autumn and gave a loaf to every house, and we all loved them for it." },
      },
      choices = {
        { text = "The Barovs traded your town to the Scourge.", next = "xtrade" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xtrade = {
      lines = {
        { id = "xt1", text = "No, no. They wouldn't. They gave us bread. They gave us the bread from the north, the good grain, as a gift." },
      },
      choices = {
        { text = "They gave you plague. They knew what they did.", next = "BACK", reply = "<Her face crumples, and she turns away toward the empty market.>", fx = { align = { light = -1 } } },
        { text = "I'm sure they didn't know.", next = "BACK", reply = "No. Of course they didn't. Thank you for saying so.", fx = { align = { light = 1 } } },
      },
    },
    xdead = {
      lines = {
        { id = "xd1", text = "Don't be cruel, dear. I'm only a little tired, and the fog's very thick today, and it's been thick for so long." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    barov = { { id = "xtp_ba", text = "Good lords. They gave every house a loaf at harvest." } },
    andorhal = { { id = "xtp_an", text = "The grain came from Andorhal. It was such fine flour." } },
    background = { { id = "tp_bg", text = "I've lived in Caer Darrow all my life, and I'll not leave it now." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, stranger. Ask the guardsman." } },
  },
}

-- Deathguard Bartholomew: a Forsaken guard of Brill who gives directions and keeps watch on the road.
P:NPC {
  key = "wpl_deathguard_bartholomew", id = 1742, name = "Deathguard Bartholomew", gender = "male",
  role = "guard", tier = "quest",
  communities = { "brill" }, temper = { "dry", "dutiful" }, values = { "duty", "forsaken" },
  notices = { "race", "level" },
  impression = {
    first = "A Forsaken guard with a dry voice and a soldier's habit of pointing out the road.",
    third = "{name} met Deathguard Bartholomew, who guards Brill in Tirisfal Glades.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Brill, such as it is. If you are lost, I can point the way, and if you are Scarlet, I can point my blade." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Brill, are you? The town hasn't improved, but it hasn't burned either, so we count that a good week." },
  },
  notice = {
    { id = "n_low", cat = "level", when = { maxLevel = 10 }, text = "Fresh from Deathknell, by the look of you. Stay on the road and away from the Scarlet camps, and you might last the month." },
    { id = "n_living", cat = "race", when = { race = "Orc" }, text = "An orc in Brill. The Dark Lady's allies are welcome, though the townsfolk may stare; they've not seen many faces with skin on lately." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bartholomew, of the Deathguard. I keep the peace in Brill and tell newcomers where things are, since nobody else here has the patience for it." } },
      again = { { id = "h_again", text = "What else? I've nothing but time, and a great deal of road to watch." }, { id = "h_again2", text = "Ask away. The dead are better listeners than the living." } },
      choices = {
        { text = "Where should I go, around here?", next = "directions" },
        { text = "What threatens Brill?", next = "threats" },
        { text = "Do you remember your life before?", next = "before", when = { race = "Scourge" } },
        { text = "This town feels like a graveyard.", next = "graveyard" },
        { text = "Who were your neighbours in life?", next = "yneigh" },
        { text = "Do you ever see the living you knew?", next = "yseen" },
        { text = "A fellow Forsaken asks your counsel.", next = "BACK", when = { race = "Scourge" }, reply = "Then hear it: find a task and keep it. The ones who drift become what we fled." },
        { text = "Farewell, Deathguard.", next = "END" },
      },
    },
    directions = {
      lines = { { id = "d_default", text = "The inn is the Gallows' End, where Innkeeper Renee will rent you a bed you don't need. The Undercity lies east through the ruins of Lordaeron, and the Apothecaries in the cellar of the town hall always want errands run." } },
      choices = {
        { text = "What do the Apothecaries want?", next = "apothecary" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apothecary = {
      lines = { { id = "a_default", text = "Ingredients, mostly, and they are not particular about where those ingredients were walking yesterday. Master Apothecary Faranell's people are working on something for the Dark Lady, and they'll tell you as much as they think you need." } },
      choices = {
        { text = "Whatever they brew, the Scourge deserve it.", next = "BACK", reply = "Spoken like one of us. The Society will like you.", fx = { align = { order = -1 } } },
        { text = "Secret brews make me uneasy.", next = "BACK", reply = "They make me uneasy too, but I keep that between myself and the road.", fx = { align = { order = 1 } } },
      },
    },
    threats = {
      lines = { { id = "t_default", text = "The Scarlet Crusade, chiefly, who think every Forsaken is a ghoul to be burned. The Scourge still wander out of the north fields, and there are wolves and worse in the woods toward Agamand Mills." } },
      choices = {
        { text = "Why does the Crusade hate you so?", next = "crusade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade = {
      lines = { { id = "c_default", text = "Because we remind them of what they lost, and because hating the dead is easier than mourning them. Some of them were our neighbours, once, which makes it all the more tiresome." } },
      choices = { { text = "Then the fault is theirs. Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "I was a guardsman here when Brill was a living town, and I died in the same uniform. The Dark Lady gave me my will back, and I find I chose the same work twice." } },
      choices = { { text = "Some habits outlast death. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    graveyard = {
      lines = { { id = "graveyard_default", text = "It is, and a busy one, which is more than most villages in Lordaeron can say now. The dead here keep shop, brew potions and pour ale, so you may judge for yourself whether that is better or worse." } },
      choices = { { text = "Better, I think. Something else.", next = "BACK" } },
    },
  
    yneigh = {
      lines = {
        { id = "ydeathg_yneigh_d", text = "The baker Tomas, the smith's widow, a family of six by the old mill. I patrolled their street for eleven years. Most of them are ghouls now, wandering the fields. I put two down myself, and I recognised both." },
      },
      choices = {
        { text = "How do you bear it?", next = "ybear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybear = {
      lines = {
        { id = "ydeathg_ybear_d", text = "By telling myself they were gone already, and the thing I struck was only a husk. Some Deathguard say we should try to raise them free, as the Dark Lady freed us. The apothecaries say it cannot be done, and should not be tried." },
      },
      choices = {
        { text = "Try to free them. Everyone deserves a choice.", next = "BACK", reply = "A noble thought. I'll mention it at muster, though the captain will laugh.", fx = { align = { light = 1 } } },
        { text = "Put them down. Mercy is a clean end.", next = "BACK", reply = "Yes. I tell myself that every time, and it is true enough.", fx = { align = { light = -1 } } },
      },
    },
    yseen = {
      lines = {
        { id = "ydeathg_yseen_d", text = "Once, a human woman from the Crusade, riding past on the north road. She was my sister's daughter. She looked at me, and did not know me, and I let her ride on. I have not told the captain." },
        { id = "ydeathg_yseen_v0", when = { race = "Human" }, text = "Once, my sister's daughter, riding with the Crusade. She looked at me with your eyes, the eyes of the living, and did not know me. I let her ride on." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    brill = { { id = "ydeathg_tp_brill", text = "Brill is a dead town that keeps shop. I find that more comforting than I should." } },
    scarlet = { { id = "ydeathg_tp_scarlet", text = "The Scarlet Crusade burn what they fear. They fear us most of all." } },

    background = { { id = "tp_bg", text = "Guard of Brill in life, guard of Brill in death. I'm nothing if not consistent." } },
    _none = { { id = "tp_none", text = "Not my concern, I'm afraid. Ask at the Gallows' End; somebody there will pretend to know." } },
  },
}

-- Deathguard Morris: a Forsaken guard of Brill who worries over the town's supplies.
P:NPC {
  key = "wpl_deathguard_morris", id = 1745, name = "Deathguard Morris", gender = "male",
  role = "guard", tier = "quest",
  communities = { "brill" }, temper = { "grim", "practical" }, values = { "duty", "forsaken" },
  notices = { "race", "class" },
  impression = {
    first = "A grim Forsaken guard who looks at every traveller as a possible pair of hands.",
    third = "{name} met Deathguard Morris, who guards Brill in Tirisfal Glades.",
  },
  greetings = {
    { id = "g_default", text = "Another traveller in Brill. If you're able-bodied, and that's no small thing around here, the town could use you." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. That's two more times than most people manage." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" }, text = "A mage. Good; the Scarlet Crusade burns easily, and you look like you'd enjoy it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Morris, Deathguard of Brill. I watch the road and count the supplies, and lately the second job worries me more than the first." } },
      again = { { id = "h_again", text = "More? Fine, but be quick; the carts don't count themselves." }, { id = "h_again2", text = "Ask, then. I'll keep one eye on the road." } },
      choices = {
        { text = "What's wrong with the supplies?", next = "supplies" },
        { text = "How do the Deathguard keep discipline?", next = "discipline" },
        { text = "Do you still feel the Lich King's call?", next = "call", when = { race = "Scourge" } },
        { text = "You seem tired, for a corpse.", next = "tired" },
        { text = "What grows in the fields now?", next = "yfields" },
        { text = "What did you do in life?", next = "ylife" },
        { text = "Who do you trust in the supply line?", next = "ytrust" },
        { text = "A priest of the Forsaken offers you guidance.", next = "BACK", when = { race = "Scourge", class = "PRIEST" }, reply = "Guidance, from the Shadow? I'll take it, and I'll be suspicious of it, which I think is the point." },
        { text = "I'll be going.", next = "END" },
      },
    },
    supplies = {
      lines = { { id = "s_default", text = "Everything comes from the Undercity or the fields, and the fields are crawling with Scourge and Scarlet scouts. Carts go missing, crates arrive half-empty, and a town of dead folk still needs cloth, tools and reagents." } },
      choices = {
        { text = "Who's taking it, do you think?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Gnolls in the hills, Scarlet raiders on the north road, and I'd not swear to every Forsaken in the supply line, either. Hunger doesn't end with death; it only changes what you're hungry for." } },
      choices = {
        { text = "Hang the thieves, whoever they are.", next = "BACK", reply = "That's the Deathguard's way. I'll pass your opinion on.", fx = { align = { order = 1 } } },
        { text = "Hungry people steal. Feed them first.", next = "BACK", reply = "Kind thought. Strange one, for Brill, but kind.", fx = { align = { order = -1 } } },
      },
    },
    discipline = {
      lines = { { id = "d_default", text = "Strictly, because a Forsaken who stops caring is a ghoul with better manners. We drill, we stand watch, and we remember that we chose this, which the Scourge never could." } },
      choices = { { text = "Choice is what separates you. Something else.", next = "BACK" } },
    },
    call = {
      narr = "He goes still, and for a moment he seems to be listening to something far away.",
      lines = { { id = "c_default", text = "Sometimes, on quiet nights, a whisper at the back of the skull. I answer it the way the Dark Lady taught us, by ignoring it and finding something to kill." } },
      choices = { { text = "Good advice. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tired = {
      lines = { { id = "t_default", text = "The body doesn't tire, but the mind does, and mine has stood this post a long while. Still, it beats lying in a field with crows for company." } },
      choices = { { text = "That it does. Something else.", next = "BACK" } },
    },
  
    ylife = {
      lines = {
        { id = "ydeathg_ylife_d", text = "A quartermaster in the Lordaeron army, counting grain sacks for men who are now counting nothing. I died in Andorhal, behind a supply wagon, and woke with the same ledger in my hand. Some habits outlast the body." },
        { id = "ydeathg_ylife_v0", when = { race = "Scourge" }, text = "A quartermaster, counting grain sacks. Died in Andorhal, woke with the ledger still in my hand. You'll know how it is. Some habits cling harder than flesh." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrust = {
      lines = {
        { id = "ydeathg_ytrust_d", text = "Hardly anyone. Last week a crate of Apothecary reagents arrived with the seals broken. The carter swore he never touched it. I believed him, and I wrote it up as theft by gnolls. Now I'm not sure." },
      },
      choices = {
        { text = "Should you report the carter?", next = "yreport" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yreport = {
      lines = {
        { id = "ydeathg_yreport_d", text = "If I report him, the Apothecaries will have him in their cells, and they don't let people out whole. If I don't, and it was him, I've let a thief walk. Some say the law must be served. Others say the Apothecaries are worse than any thief." },
      },
      choices = {
        { text = "Report him. The supply line needs discipline.", next = "BACK", reply = "Yes. I'll write it up tonight, and pray to nothing that I'm wrong.", fx = { align = { order = 1 } } },
        { text = "Protect him. The Apothecaries are worse.", next = "BACK", reply = "A dangerous thing to say aloud. But you may not be wrong.", fx = { align = { order = -1 } } },
      },
    },
    yfields = {
      lines = {
        { id = "ydeathg_yfields_d", text = "North of Brill, past the windmill, the Scourge still wander. They don't eat, but they trample everything. Our farmers plant blightcaps and corpseweed now. Nothing else grows." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    apothecaries = { { id = "ydeathg_tp_apothecaries", text = "The Royal Apothecary Society brews for the Dark Lady. I count their crates and ask no questions." } },
    andorhal = { { id = "ydeathg_tp_andorhal", text = "Andorhal is where I died. I'd not go back for any reason." } },

    background = { { id = "tp_bg", text = "A Deathguard of Brill. Before that, I'd rather not say." } },
    _none = { { id = "tp_none", text = "No idea. I count crates, not rumours." } },
  },
}

-- Lysta Bancroft: a Forsaken of the Undercity's War Quarter who brings out captives for the warriors to fight.
P:NPC {
  key = "wpl_lysta_bancroft", id = 5679, name = "Lysta Bancroft", gender = "female",
  role = "citizen", tier = "service",
  temper = { "cold", "wry" }, values = { "forsaken" },
  notices = { "class" },
  impression = {
    first = "A thin Forsaken woman with a ring of keys and an unpleasant smile.",
    third = "{name} met Lysta Bancroft in the War Quarter of the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite spectator. Brother Malach's students are bleeding nicely today, so do come closer and enjoy it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I keep the somethings the students hit, and I've been wondering whether you'd do as one." },
    { id = "g_default", text = "Come to watch the sparring, have you? Brother Malach's students need something to hit, and I keep the somethings." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You do enjoy a show, don't you?" },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" }, text = "A warrior. I could bring you out something with teeth, if you've a mind to practise." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Lysta Bancroft, and I tend the captives of the War Quarter: humans, ghouls, the odd abomination. When Brother Malach calls, I bring one out for his pupils to fight." } },
      again = { { id = "h_again", text = "Anything else? My charges get restless if I leave them." } },
      choices = {
        { text = "Who is Brother Malach?", next = "xmalach" },
        { text = "Do the captives ever escape?", next = "xescape" },
        { text = "You're living, aren't you? Why work here?", next = "xliving", when = { race = "Scourge" } },
        { text = "Where do the captives come from?", next = "captives" },
        { text = "Isn't that cruel?", next = "cruel" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    captives = {
      lines = { { id = "c_default", text = "The Scourge ones are dragged in from the Plaguelands, and the living ones are Scarlet scouts and other trespassers. The Deathguard sends them down, and I keep them fed enough to put up a fight." } },
      choices = {
        { text = "And when they can't fight anymore?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "Then the Apothecaries have a use for them, and I don't ask what. Nothing in the Undercity goes to waste, you'll find." } },
      choices = { { text = "Grim, but practical. Something else.", next = "BACK" } },
    },
    cruel = {
      lines = { { id = "cr_default", text = "The living burned my family in their beds and called it mercy. You'll forgive me if I don't lose sleep, since I no longer sleep at all." } },
      choices = {
        { text = "They earned it. Let them bleed.", next = "BACK", reply = "Finally, someone who understands.", fx = { align = { order = -1 } } },
        { text = "Cruelty makes us no better than them.", next = "BACK", reply = "We were never better than them, dear. Only more honest.", fx = { align = { order = 1 } } },
      },
    },
    xmalach = {
      lines = {
        { id = "xm1", text = "A Forsaken who trains our warriors and believes every one of them should kill a living enemy before they're sent to the front. He says it settles the hands, and he's usually right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xescape = {
      lines = {
        { id = "xe1", text = "Once, a Scarlet scout picked his lock with a fish bone and got as far as the sewers. The bats found him before the guards did, and I've checked the cells twice a night since." },
      },
      choices = {
        { text = "Do you feel anything for them?", next = "xfeel" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xfeel = {
      lines = {
        { id = "xf1", text = "For the ghouls, nothing; they were Scourge the moment they rose. For the Scarlets, I remember they'd burn me without a second thought, and that does wonders for the conscience." },
      },
      choices = {
        { text = "Prisoners deserve better than to be sparring dummies.", next = "BACK", reply = "You'd better keep that sentiment far from Malach.", fx = { align = { honor = 1 } } },
        { text = "They'd do worse to us. Let them bleed.", next = "BACK", reply = "Now you're talking like a Forsaken.", fx = { align = { honor = -1 } } },
      },
    },
    xliving = {
      lines = {
        { id = "xl1", text = "Living? Me? No, friend, I died in the Undercity sewers when it was still the capital's drain, and I woke up with a set of keys in my hand. I've been the jailer ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet = { { id = "xtp_sc", text = "Fanatics. They make good sparring partners, at least." } },
    malach = { { id = "xtp_ma", text = "Brother Malach. He trains our warriors on whatever I bring him." } },
    background = { { id = "tp_bg", text = "A Lordaeron girl once, and now the keeper of the War Quarter's cages. A promotion, of sorts." } },
    _none = { { id = "tp_none", text = "I keep cages, not secrets. Ask Brother Malach." } },
  },
}

-- Elder Meadowrun: a night elf elder honoured near the Weeping Cave, Western Plaguelands, during the Lunar Festival.
P:NPC {
  key = "wpl_elder_meadowrun", id = 15602, name = "Elder Meadowrun", gender = "female",
  role = "elder", tier = "quest",
  temper = { "calm", "sorrowful" }, values = { "ancestors", "tradition" },
  notices = { "race", "season" },
  impression = {
    first = "A night elf elder glowing softly in a land of plague and ash.",
    third = "{name} paid respects to Elder Meadowrun in the Western Plaguelands during the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Even here, where the land weeps, the ancestors come at the turning of the year. Welcome, traveller." },
    { id = "g_done", when = { questDone = TODO_QUEST("Meadowrun the Elder") }, text = "You honoured me already, and walked through the plague to do it. The ancestors saw." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, text = "A child of Teldrassil in these sick lands. Keep your spirit close; this place hungers for it." },
    { id = "n_lunar", cat = "season", when = { holiday = "lunar" }, text = "The Lunar Festival brings elders to every corner of the world, even the dark ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Meadowrun, an elder, and I stand here because the ancestors wished someone to bear witness to this broken land. Seekers who come to me carry honour from elder to elder through the festival." } },
      again = { { id = "h_again", text = "Ask, child. The dark does not hurry me." }, { id = "h_again2", text = "Speak your mind. The ancestors are listening as well." } },
      choices = {
        { text = "Why stand in such a cursed place?", next = "why" },
        { text = "I come to honour you, elder.", next = "honour", when = { questActive = TODO_QUEST("Meadowrun the Elder") } },
        { text = "Can this land ever heal?", next = "heal" },
        { text = "I see you're a Kaldorei, like me. Why come so far east?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "What do you remember of the war at Hyjal?", next = "yhyjal" },
        { text = "Are you afraid here, elder?", next = "yafraid" },
        { text = "A Forsaken pays respects. Will you accept them?", next = "BACK", when = { race = "Scourge" }, reply = "Gladly, child. You were made to walk against your will, and yet you came here to honour the dead. That is enough." },
        { text = "Elune keep you, elder.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the dead here were never honoured, only raised and made to walk. Someone must remember them as they were, farmers and children and soldiers, and not as the Scourge made them." } },
      choices = {
        { text = "Do the ancestors of the humans come too?", next = "humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "I feel them at the edges, confused and grieving, unsure whether they are welcome. I tell them every spirit is welcome at the festival, whatever banner it marched under." } },
      choices = {
        { text = "That's generous of you, elder.", next = "BACK", reply = "It is only right. Grief knows no faction.", fx = { align = { order = -1 } } },
        { text = "Their kingdom brought this on itself.", next = "BACK", reply = "Perhaps, but their children did not choose it.", fx = { align = { order = 1 } } },
      },
    },
    honour = {
      lines = { { id = "ho_default", text = "Then take my blessing and a coin of the ancestors, and go on to the next elder. Walk carefully; the plague does not respect the festival." } },
      choices = { { text = "Thank you, elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    heal = {
      lines = { { id = "he_default", text = "Elune is patient, and the land has healed deeper wounds than this. But it will take many lifetimes, and those who fight the Scourge must win first." } },
      choices = {
        { text = "Who is fighting the Scourge here?", next = "fighters" },
        { text = "Then I'll fight. Something else.", next = "BACK" },
      },
    },
    fighters = {
      lines = { { id = "fi_default", text = "The Argent Dawn holds Chillwind Camp to the south, and at Felstone and Dalson's farm the brave and the desperate still plant what little will grow. They do not all trust one another, but they all fight." } },
      choices = { { text = "Then I'll join them. Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "Because grief is grief, whatever land it falls on. We lost Hyjal's forests to the same Legion that sent the Scourge here, and I would not have these people mourn alone." } },
      choices = { { text = "Ishnu-alah, elder. Something else.", next = "BACK" } },
    },
  
    yhyjal = {
      lines = {
        { id = "yelderm_yhyjal_d", text = "Fire on the mountain, the sky black with demons, and the World Tree trembling. I was there, as a healer, and I bound wounds until my hands bled. We won, but the forests we lost still haunt my dreams." },
      },
      choices = {
        { text = "Was the cost worth it?", next = "ycost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycost = {
      lines = {
        { id = "yelderm_ycost_d", text = "The druids say yes, for the world survived. Some of my sisters say no, that we should have fought sooner, before the Legion ever reached Hyjal. I have never decided which I believe." },
      },
      choices = {
        { text = "The druids were right. The world survived.", next = "BACK", reply = "Yes. I hold to that, on most nights.", fx = { align = { order = 1 } } },
        { text = "Your sisters were right. Waiting cost too much.", next = "BACK", reply = "Perhaps. Their grief is as true as the druids' wisdom.", fx = { align = { order = -1 } } },
      },
    },
    yafraid = {
      lines = {
        { id = "yelderm_yafraid_d", text = "No, child, for there is little left here that can harm a spirit. But I am sad, and the sadness is heavier than fear. Every spirit I meet here asks me why no one came to help them." },
        { id = "yelderm_yafraid_v0", when = { race = "NightElf" }, text = "No, sister. There is little left here that can harm a spirit. But I am sad. Every spirit I meet asks me why no one came, and I have no answer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hyjal = { { id = "yelderm_tp_hyjal", text = "Hyjal is sacred to my people. We defended it against the Legion, at great cost." } },
    plague = { { id = "yelderm_tp_plague", text = "The plague is a wound in the world itself. Elune will heal it, slowly." } },

    background = { { id = "tp_bg", text = "An elder of the Kaldorei, sent where the ancestors willed. This year, they willed here." } },
    _none = { { id = "tp_none", text = "The ancestors have not told me that, child, and I would not guess." } },
  },
}

---------------------------------------------------------------------------
-- Elder Moonstrike: a kaldorei ancestor honoured at the Lunar Festival, whose
-- spirit waits at the doors of Scholomance.
---------------------------------------------------------------------------
P:NPC {
  key = "wpl_elder_moonstrike", id = 15594, name = "Elder Moonstrike", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "calm", "sorrowful" }, values = { "tradition", "memory" },
  notices = { "race", "class" },
  impression = {
    first = "The shade of an old night elf woman glows softly in the dark at Scholomance's doors, untouched by the foulness around her.",
    third = "{name} paid respects to Elder Moonstrike of the Lunar Festival, at the gates of Scholomance.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. Few come to this place with honour in their hearts, so I am glad of you." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come again, and you have found me even here. The ancestors are pleased." },
    { id = "g_back", when = { metBefore = true }, text = "You return to an old spirit's vigil. Sit a while; the dark here does not touch us." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, text = "A child of my own people, so far from the forests. Elune walks with you even here, little one." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, text = "You carry light in your hands, priest. This school was built to snuff such light out, so hold yours close." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Moonstrike, and I am one of the elders the festival remembers. My spirit keeps watch at Scholomance, where the Cult of the Damned teaches its students to raise the dead." },
        { id = "h_q", when = { questActive = TODO_QUEST("Moonstrike the Elder") }, text = "You have come to honour the elders, and you have come a long and dangerous way to do it. Take this coin of ancestry, and remember me kindly." },
      },
      again = { { id = "h_again", text = "What else would you know, young one?" } },
      choices = {
        { text = "Why does your spirit linger here, of all places?", next = "why" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "What happens inside Scholomance?", next = "school" },
        { text = "A priest of the Light can't abide that school.", next = "priest", when = { class = "PRIEST" } },
        { text = "What did you do in life?", next = "ylife" },
        { text = "Do you see the students inside?", next = "ystudents" },
        { text = "A night elf honours you, elder.", next = "BACK", when = { race = "NightElf" }, reply = "Ishnu-alah, child of the moon. It warms me to see one of my own here, even in this dark place." },
        { text = "Elune-adore, Elder.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because someone must remember the dead properly in a place that only uses them. While I keep vigil, the necromancers cannot claim that every soul here belongs to them." } },
      choices = {
        { text = "That is a noble vigil.", next = "BACK", reply = "It is only a quiet one. But thank you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    festival = {
      lines = { { id = "fe_default", text = "The druids remember the night Omen was defeated at Moonglade, and all the peoples are asked to honour their elders. In the festival season, those who seek us out are given coins of ancestry, so the memory is passed on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barov = {
      lines = { { id = "ba_default", text = "Lord Alexei Barov and his kin, nobles of Lordaeron who gave their keep at Caer Darrow to the Cult for the promise of unlife. Two of his children squabble over his lands still, one among the Forsaken and one at Southshore, as if anything were left to inherit." } },
      choices = {
        { text = "And the Barovs themselves?", next = "barovs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barovs2 = {
      lines = { { id = "b2_default", text = "They walk the school's halls as servants of the Cult, bound to the bargain they made. Greed is a chain, young one, and it does not unlock at death." } },
      choices = { { text = "A grim lesson. Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Nor can I, though my goddess is Elune and yours is the Light. They twist the line between life and death, and every healer who walks near that place feels it like a wound." } },
      choices = { { text = "Then I will mend what I can. Something else.", next = "BACK" } },
    },
    school = {
      lines = { { id = "sc_default", text = "The Barov family gave their own keep to the Cult, and the Cult made it a school of death. The students practise on the living and the dead alike. I hear them at night, and I grieve." } },
      choices = {
        { text = "It should be burned to the ground.", next = "BACK", reply = "Fire cleanses, but it does not remember. Take care what you burn.", fx = { align = { light = 1 } } },
        { text = "Knowledge is knowledge, even dark knowledge.", next = "BACK", reply = "So said the Highborne, once. I remember how that ended.", fx = { align = { light = -1 } } },
        { text = "Who are the Barovs?", next = "barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
  
    ylife = {
      lines = {
        { id = "yelderm_ylife_d", text = "I was a priestess of Elune, and a teacher of young healers in Ashenvale. I trained hundreds over the centuries. I keep vigil at a school of death because I could not bear to watch another school go unwatched." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ystudents = {
      lines = {
        { id = "yelderm_ystudents_d", text = "Young humans, mostly, who came to learn power and stayed to become something else. Some of them weep at night, behind the windows. I hear them. I cannot help them, but I can listen." },
      },
      choices = {
        { text = "Can any of them be saved?", next = "ysaved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysaved = {
      lines = {
        { id = "yelderm_ysaved_d", text = "Some, perhaps, if they were taken out before the Cult finished its work. The Argent Dawn says every student is lost. I say a weeping child is not yet lost, though I do not know how to reach them." },
      },
      choices = {
        { text = "Save the weeping ones. They're not lost yet.", next = "BACK", reply = "Then go carefully, and watch their eyes. The lost ones do not weep.", fx = { align = { light = 1 } } },
        { text = "The Dawn is right. Better to purge it all.", next = "BACK", reply = "Perhaps. But I will keep listening, all the same.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    scholomance = { { id = "yelderm_tp_scholomance", text = "Scholomance is a school of death. The Cult teaches necromancy there, and the dead walk its halls." } },
    elune = { { id = "yelderm_tp_elune", text = "Elune watches over even this place, though her light is very faint here." } },
  },
}
