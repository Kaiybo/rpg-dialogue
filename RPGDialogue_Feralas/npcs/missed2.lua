-- Feralas, the missed folk (Horde side and neutral): Camp Mojache's quieter hands (Bronk, Cawind Trueaim,
-- Hahrana Ironhide, Worb Strongstitch, Sage Palerunner, Orik'ando, Blaise Montgomery) and Griniblix the
-- Spectator in the Dire Maul arena. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Worb Strongstitch: light armor merchant.
P:NPC {
  key = "worb_strongstitch", id = TODO_NPC("Worb Strongstitch"), name = "Worb Strongstitch", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "easy" }, values = { "plain_dealing" },
  notices = { "class", "kit" },
  impression = {
    first = "Worb Strongstitch sells leather and cloth armor at Camp Mojache, and he tugged at every seam on his rack to show me it would hold. He speaks slowly and sells slowly, and I trusted him the more for it.",
    third = "{name} met Worb Strongstitch, the light armor merchant of Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, {class}. The forest has thorns as long as my finger, so let us see whether what you wear will stop one." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back, and the thorns have been at you. Come and look at the rack." },
  },
  notice = {
    { id = "n_light", cat = "class", when = { class = { "ROGUE", "DRUID", "HUNTER", "SHAMAN" } },
      text = "You move like one who would rather not be heard, and leather is the armor for that. I have a few pieces that will not creak when you crouch." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is hanging by its last threads, friend. I sell new, but I would not send you back into the wilds in that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Worb Strongstitch, and the name was my mother's before it was mine. I sell armor for those who must move quickly, and I pull every seam myself before it goes on the rack." },
      },
      again = {
        { id = "h_again", text = "Is there more I can tell you?" },
        { id = "h_again2", text = "Take your time. I always do." },
      },
      choices = {
        { text = "Do you make all of this yourself?", next = "make" },
        { text = "What wears armor out fastest here?", next = "wear" },
        { text = "Light armor seems a risk against ogres.", next = "ogres" },
        { text = "Winds be at your back, Worb.", next = "END" },
      },
    },
    make = {
      lines = { { id = "m_default", text = "Some of it, and the rest comes from Hahrana Ironhide's students once she has passed their work. If she has let a piece leave her fire, it is sound, and I only pull the seams out of habit." } },
      choices = {
        { text = "She's a hard teacher?", next = "hahrana" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hahrana = {
      lines = { { id = "h2_default", text = "She is a fair one, which the young sometimes mistake for hard. I have seen her unpick a whole jerkin in front of the one who made it, and I have seen that same one thank her a year later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wear = {
      lines = { { id = "w_default", text = "The damp, before any claw or blade. Leather that is not dried by a fire each night goes green by the week's end, and then it tears like wet bark." } },
      choices = { { text = "I'll dry mine tonight. Something else.", next = "BACK" } },
    },
    ogres = {
      lines = { { id = "o_default", text = "Nothing I sell will stop a Gordunni club, and nothing the smiths sell will stop it either. Against an ogre the best armor is not being where the club lands, and for that you want to be light on your hooves." } },
      choices = { { text = "Well reasoned. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My mother stitched tents for the Bloodhoof when they wandered, and I stitch what the tribes wear now that they do not." } },
    _none = { { id = "tp_none", text = "I cannot say, friend. I know seams, and that one is past the edge of my cloth." } },
  },
}

-- Sage Palerunner: an old sage of the camp.
P:NPC {
  key = "sage_palerunner", id = TODO_NPC("Sage Palerunner"), name = "Sage Palerunner", gender = "male",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "mojache" }, temper = { "grave", "kindly" }, values = { "ancestors", "memory" },
  notices = { "class", "race" },
  impression = {
    first = "Sage Palerunner is very old, even for a tauren elder, and he sits where the sun reaches him in Camp Mojache. He spoke of the elven ruins in the forest as a herdsman speaks of a sinkhole, something to be known about and walked around.",
    third = "{name} met Sage Palerunner, an old tauren sage at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Come into the light where my eyes can find you, {class}. They are not what they were, though they have seen a great deal." },
    { id = "g_back", when = { metBefore = true }, text = "I know that step. Sit by an old bull again, and tell me what the forest has shown you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Mu'sha is high, and the old do not sleep much. Sit, if you have questions that will not wait for An'she." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "The spirits lean toward you when you walk; I am old, but I still feel that. Then you will understand why this forest makes me uneasy." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Young one, you carry yourself as our people did on the plains. It warms me to see it so far from Mulgore." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am called Sage Palerunner, and I have been old for longer than most here have been alive. The braves hunt and the chiefs decide, and I remember, which is the only work left to me and perhaps the most needed." },
      },
      again = {
        { id = "h_again", text = "Ask again, young one. Remembering is slow, but it comes." },
        { id = "h_again2", text = "What else would you draw out of an old bull?" },
      },
      choices = {
        { text = "What do you remember that Mojache needs?", next = "remember" },
        { text = "This forest makes you uneasy.", next = "forest" },
        { text = "Tell me about the other sage, Korolusk.", next = "korolusk" },
        { text = "Rest well, elder.", next = "END" },
      },
    },
    remember = {
      lines = { { id = "r_default", text = "I remember the years when the centaur drove us from one grazing to the next, and no tauren owned the ground under his hooves. The young ones think the camps have always stood, and someone must tell them what it cost." } },
      choices = { { text = "They should hear it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forest = {
      lines = { { id = "f_default", text = "It is rich land, and I thank the Earth Mother for it. But there are elven stones under these trees that were raised by proud hands for dark purposes, and such stones do not forget what was done among them." } },
      choices = {
        { text = "Which ruins do you mean?", next = "ruins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = { { id = "ru_default", text = "The great city in the north that the ogres call Dire Maul, and the broken temples of Isildien to the south. My dreams walk there some nights against my wishes, and I wake glad that my legs can no longer carry me so far." } },
      choices = {
        { text = "What do the dreams show you?", next = "dreams" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dreams = {
      lines = { { id = "d_default", text = "Nothing so clear that I would send a brave after it. An old bull's dreams may be the spirits speaking or only his supper, and I have not yet learned to tell which." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    korolusk = {
      lines = { { id = "k_default", text = "Korolusk reads what the elves wrote, where I only remember what our own people said. He is the younger and the sharper of us, and I let him believe that I have not noticed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born on the open plains, in the wandering years. I did not expect to end my days under trees, but the Earth Mother chooses the path." } },
    _none = { { id = "tp_none", text = "If I ever knew that, it has wandered off with my youth. Ask Korolusk, whose memory is still in its prime." } },
  },
}

-- Orik'ando: a Darkspear troll resting in the camp.
P:NPC {
  key = "orikando", id = TODO_NPC("Orik'ando"), name = "Orik'ando", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "mojache" }, temper = { "easy", "sly" }, values = { "the_hunt", "the_spirits" },
  notices = { "race", "class" },
  impression = {
    first = "Orik'ando is a Darkspear troll who has made himself comfortable among the tauren of Camp Mojache. He laughs easily and watches closely, and he asked more about me than he told about himself.",
    third = "{name} met Orik'ando, a Darkspear troll staying at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Hey, {class}, come sit a while. De tauren be fine company, but dey take all day to finish one story." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, you still be breathin'! Dis forest don't always give people back, mon." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, all de way out here! Sit down, sit down, and tell me if de fishing off Sen'jin be as good as I remember." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You walk like a hunter, quiet on de heel. Dat's good, because everything in Feralas be listenin' for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Orik'ando, of de Darkspear. I came down from Durotar to see dis jungle everyone talks about, and I been here longer dan I planned, because it reminds me of a home we don't have no more." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon?" },
        { id = "h_again2", text = "Go on, I got nowhere to be." },
      },
      choices = {
        { text = "The forest reminds you of home?", next = "home" },
        { text = "How do you find living among tauren?", next = "tauren" },
        { text = "You watch people closely.", next = "watch" },
        { text = "Stay sharp, Orik'ando.", next = "END" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Wet and green and loud at night, like de islands we left behind before Thrall brought us over de sea. Durotar be good to de Darkspear, but it be red rock and dust, and a jungle troll misses de rain." } },
      choices = {
        { text = "Will you stay here, then?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "A while longer, maybe. Vol'jin be needin' every spear near Sen'jin Village, I know dat, but de spirits don't seem in a hurry to send me back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "Dey be kind, and dey share de fire, and dey never once laughed at how little I eat next to dem. Witch Doctor Uzer'i been here longer dan me, and he says de same, when he says anything at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Ha! You got good eyes yourself, to catch me at it. A troll who don't watch be a troll who gets eaten, and in dis forest I count ogres, gnolls and elves all wantin' a bite." } },
      choices = { { text = "Then we'll both keep watching. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear born, on de islands, before de sea witch and de long boat ride. I been a hunter since I could lift a spear." } },
    _none = { { id = "tp_none", text = "Dat I don't know, mon. Ask de tauren, but bring a blanket, 'cause de answer be long." } },
  },
}

-- Blaise Montgomery: a Forsaken visitor at the camp.
P:NPC {
  key = "blaise_montgomery", id = TODO_NPC("Blaise Montgomery"), name = "Blaise Montgomery", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "mojache" }, temper = { "dry", "cold" }, values = { "the_dark_lady" },
  notices = { "race", "craft" },
  impression = {
    first = "Blaise Montgomery is a Forsaken who stands a little apart at Camp Mojache, where the tauren give him room and he seems to prefer it. He regards the whole green forest as a personal insult.",
    third = "{name} met Blaise Montgomery, a Forsaken staying at Camp Mojache.",
  },
  greetings = {
    { id = "g_default", text = "Yes, {class}? If you have come to tell me how lovely the forest is, a dozen tauren have beaten you to it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Nothing has died here since we last spoke, apart from my patience." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Another of the Dark Lady's own, in this dripping wilderness. Stand where I can see you; it is restful to look at someone who is not blooming." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Before you ask, I am well, I have eaten, and no, I do not wish to be blessed. Your people are relentlessly kind, and I am learning to endure it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Blaise Montgomery, late of Lordaeron and later still of the Undercity. I have been sent to the far end of the world to stand among cattle and ferns, and I am told it is important." },
      },
      again = {
        { id = "h_again", text = "Was there more? There usually is." },
        { id = "h_again2", text = "Do go on. I have nothing but time, as you may imagine." },
      },
      choices = {
        { text = "What brings the Forsaken to Feralas?", next = "why" },
        { text = "The tauren seem to treat you well.", next = "tauren" },
        { text = "You don't care for the forest.", next = "forest" },
        { text = "I'll leave you to your ferns.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The Dark Lady likes to know what her allies are doing at the edges of the map, and someone must write the letters. I was chosen, I suspect, because nobody in the Undercity would notice I had gone." } },
      choices = {
        { text = "And what do you write?", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "That the ogres are numerous, the elves are entrenched on their island, and the tauren remain determined to feed me. I leave out the weather, because nobody at home would believe so much rain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "They do, which I find difficult to forgive. I was a living man once and I recall being far less gracious to strangers than they are to a walking corpse, so perhaps the lesson is meant for me." } },
      choices = { { text = "Perhaps it is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forest = {
      lines = { { id = "f_default", text = "Everything here grows, without pause and without shame, and it grows on anything that stands still. I have picked moss off my own sleeve twice this week, and I assure you the forest was not invited." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I had a life in Lordaeron, and then I had a grave, and now I have a posting. None of the three was my idea." } },
    _none = { { id = "tp_none", text = "I have not the faintest notion. Ask someone with a pulse and an interest." } },
  },
}

-- Griniblix the Spectator: watching the arena at the Maul, Dire Maul.
P:NPC {
  key = "griniblix", id = TODO_NPC("Griniblix the Spectator"), name = "Griniblix the Spectator", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = {}, temper = { "loud", "eager" }, values = { "profit", "spectacle" },
  notices = { "class", "level" },
  impression = {
    first = "Griniblix the Spectator is a goblin in a black tunic who has found himself a seat above the fighting pit in Dire Maul and has no plans to give it up. He sized me up like a bookmaker, and I think he was working out my odds.",
    third = "{name} met Griniblix the Spectator, a goblin who watches the fights in the Dire Maul arena.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, fresh blood! You here to fight or to watch, pal, because one of those I can make money on." },
    { id = "g_back", when = { metBefore = true }, text = "Look who walked back in on their own two legs! That's better than even odds in this pit, friend." },
  },
  notice = {
    { id = "n_fighter", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "Now you, you've got a pit fighter's shoulders, and I say that as a professional. Stand in the sand a minute and let the crowd get a look at you, by which I mean me." },
    { id = "n_green", cat = "level", when = { maxLevel = 44 },
      text = "Whoa, whoa, kid, no offense, but the things in that pit would use you for a toothpick. Stay up here by me, where the liability's lower." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Griniblix, pal, and they call me the Spectator because watchin' is the only job here with no overhead. Best seat in the Maul, free blood sport every day, and the ogres never think to charge admission." },
      },
      again = {
        { id = "h_again", text = "What else ya got? Talk fast, I don't want to miss a bout." },
        { id = "h_again2", text = "Go on, go on, I'm listening with one ear." },
      },
      choices = {
        { text = "Who fights in this pit?", next = "fighters" },
        { text = "How does a goblin end up in Dire Maul?", next = "how" },
        { text = "You're taking bets, aren't you.", next = "bets" },
        { text = "Enjoy the show.", next = "END" },
      },
    },
    fighters = {
      lines = { { id = "f_default", text = "Three big names, and you never know which one's gonna stomp out. There's Mushgog, who's half swamp, and The Razza, who's all teeth, and Skarr the Unbreakable, who's exactly what it says on the bill." } },
      choices = {
        { text = "Which one would you back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "Skarr, every time, because a name like \"the Unbreakable\" don't stick to a fella who breaks. Now if somebody like you walked in and broke him, well, that'd be a show worth the trip, and I'd tell everybody I saw it first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    how = {
      lines = { { id = "h2_default", text = "Followed the noise, friend, same as any businessman. I heard there was an ogre city with a fighting pit and no promoter, and I figured a gap in the market that size don't stay open long." } },
      choices = {
        { text = "And the ogres let you stay?", next = "ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres = {
      lines = { { id = "o_default", text = "Ogres love a guy who cheers, pal, it's the simplest contract I ever worked under. I yell loud, I yell for whoever's winnin', and nobody's stepped on me yet, which I count as a profit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bets = {
      lines = { { id = "be_default", text = "Me? With who, the bats? I'd love to, sweetheart, but there's nobody down here with a purse and a pulse both, so for now I'm just keepin' the book in my head for the day the crowds show up." } },
      choices = { { text = "I'll believe that when I see it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've watched fights in Booty Bay and Gadgetzan, pal, and neither one's got a pit like this. No ropes, no rules and no refunds." } },
    _none = { { id = "tp_none", text = "No idea, friend, and it ain't on today's card. Ask me about the fights." } },
  },
}
