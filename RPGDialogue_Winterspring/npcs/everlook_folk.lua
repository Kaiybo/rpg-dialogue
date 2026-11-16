-- Everlook's other residents (0.37.0): the goblin Umi means to frighten, the parts-maker, a Lordaeron refugee,
-- a Thorium Brotherhood smith, a tauren hunter, and the two flight masters. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "legacki", id = TODO_NPC("Legacki"), name = "Legacki",
  bible = "bibles/winterspring.md", role = "citizen", tier = "service",
  communities = { "everlook" }, temper = { "smug" }, values = { "gossip", "comfort" },
  notices = { "race" },

  impression = {
    first = "Legacki laughs at Umi's inventions and says so to anyone in earshot. She thinks she is far too clever to be frightened by anything a goblin could build.",
    third = "{name} met Legacki, the goblin of Everlook who laughs loudest at Umi Rumplesnicker's inventions.",
  },

  greetings = {
    { id = "g_default", text = "Cold enough for you? I've had three cups of something hot and I still can't feel my ears." },
    { id = "g_scared", when = { questRecent = { TODO_QUEST("Are We There, Yeti?"), days = 7 } },
      text = "Don't you come near me with anything furry, you hear? I know it was you, and I know who put you up to it." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You're not one of Umi's, are you? Every time a tinkerer smiles at me lately, I check behind me." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The Cartel cares about anything that pays, and the woods don't, so that's the short answer. The long answer is that if the furbolgs keep going mad, nobody will come up the pass to buy anything, and that's bad for everyone." } },
      choices = {
        { text = "The woods deserve care whether they pay or not.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. Coin keeps Everlook warm.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Respect them? This is a Steamwheedle town, so we respect the exchange rate first and the weather second. Umi thinks the snow's a personal friend, and the troll witch doctor out in the hills thanks every critter she skins, but the rest of us just want the wind to stop getting under the door." } },
      choices = {
        { text = "Fair enough. Coin keeps you warmer than spirits do.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The land feeds this town. It deserves more than that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Hiding? Me? I'm simply keeping out of the way of an engineer with too much spare fur and not enough sense. If you see it creaking about, you could always give it a nudge into a snowdrift, and I'd never tell a soul who did it." } },
      choices = {
        { text = "I'll warn you if it comes, fair and square.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tip it over myself. Sounds like fun.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll stay out of this one.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Umi's been building one for weeks and swears it'll scare me silly, and I'd rather it never got the chance. Mind you, if it's made of the junk she buys from Felnok, it'll fall apart without your help." } },
      choices = {
        { text = "I won't wreck someone else's work for you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "One fireball, for the fun of it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll leave you two to it.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Oh, a shaman, all bones and feathers and totems! It's a look, I'll give you that, though I'd lose a few of the teeth." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Well, aren't you dashing. If Umi asks whether you've seen me, you haven't, because I'd rather she didn't know where to send her silly yeti." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, how fancy! Do you think a fireball would melt a mechanical yeti? I'm only asking out of curiosity, you understand." },
        { id = "h_default", key = true,
          text = "Legacki, at your service, and the only goblin in Everlook with any taste. You've met Umi? Then you've seen her latest toy, and I'll bet you a gold piece it falls apart before the thaw." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Are We There, Yeti?") },
          text = "All right, all right, I screamed, and the whole of Everlook heard it. Umi's never going to let me forget it, and neither are the Bruisers, who laughed until they wept." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now there's a fashion I appreciate, all leaves and antlers and nobody telling you it's too much. What brings you to the frozen end of the world?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got gossip to spare and nobody worth sharing it with." },
        { id = "h_again2", text = "Ask away, but stand where I can see your hands." },
      },
      choices = {
        { text = "Does anyone in Everlook respect the spirits of this land?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the goblins care about Winterspring's woods?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's wrong with Umi's inventions?", next = "umi" },
        { text = "What's there to do in Everlook?", next = "town" },
        { text = "Scared of yetis, are you?", next = "yetis", when = { questActive = TODO_QUEST("Are We There, Yeti?") } },
        { text = "Are you hiding from a mechanical yeti?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would you want to melt a yeti?", next = "xmage", when = { class = "MAGE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    umi = {
      lines = { { id = "u_default", text = "Nothing, if you like smoke, springs and loud noises in the middle of the night. She's sweet, really, but she thinks a joke's not finished until somebody's fallen over." } },
      choices = {
        { text = "You laugh at her, though.", next = "umi_laugh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    umi_laugh = {
      lines = { { id = "ul_default", text = "Somebody has to keep her humble, sugar, and it might as well be me. If she ever builds something that works, I'll be the first to clap, from a safe distance." } },
      choices = {
        { text = "Mocking a friend's work isn't kind.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Friends tease. She'll get you back.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "t_default", text = "Drink at Vizzie's, freeze, drink again, and watch the Horde and the Alliance pretend not to see each other across the square. It's the best show in Winterspring, and the Bruisers keep it civil." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yetis = {
      lines = { { id = "y_default", text = "Me? Scared? The yetis stay up in the hills where they belong, and anything that comes down into town gets a Bruiser's boot. Why do you ask, exactly?" } },
      choices = {
        { text = "No reason at all.", next = "END", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came north for the Cartel's trade and stayed for the quiet. Then Umi arrived, and the quiet left." } },
    advice = { { id = "tp_ad", text = "Never turn your back on a goblin who's whistling. That's free, and it's the best advice you'll get here." } },
    _none = { { id = "tp_none", text = "No idea, sugar, and if Umi told you about it, don't believe a word." } },
  },
}

P:NPC {
  key = "felnok", id = TODO_NPC("Felnok Steelspring"), name = "Felnok Steelspring",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "fussy" }, values = { "precise", "dependable" },
  notices = { "craft" },

  impression = {
    first = "Felnok Steelspring builds parts for a scholar in the Burning Steppes and won't touch anything without gloves. He cares more about an uncracked horn than about why anybody wants it.",
    third = "{name} met Felnok Steelspring, the careful goblin who builds parts for Tinkee Steamboil in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Careful, careful! Nothing on that bench is finished, and some of it is cold enough to take your skin off." },
    { id = "g_horns", when = { questActive = TODO_QUEST("Chillwind Horns") }, text = "Horns, uncracked horns! Tell me you didn't drop any of them on the way here." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and burnt fingers, so you're an engineer. Don't touch the cooling coils; I counted them." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the chimaera live in that wind all their lives, and the cold gets into the horn the way rust gets into iron. Tinkee wants them whole for her work, so I take them uncracked or not at all. I suppose you'd say there's a spirit of the ice in them, and I'd say it's density, and we could both be right, if you insist." } },
      choices = {
        { text = "A horn's a horn. Take as many as Tinkee pays for.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Respect the beast that gave the horn, Felnok.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tinkee wants them for her work in the Burning Steppes, and I don't ask what for, because the answer would only make me nervous. They have to be uncracked, mind, which means someone has to take them off live chimaeras very carefully." } },
      choices = {
        { text = "Better not to ask, when the coin is good.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You ought to know what your work is used for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my spells away from the bench.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A gnome once tried to walk off with a gyromatic coil, and I caught him because the count was one short. That's the trick with thieves, friend, you don't watch them, you watch your inventory." } },
      choices = {
        { text = "Smart. Honest folk have nothing to fear from a count.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good thief would swap it for a fake.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll keep my hands where you can see them.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Kindly keep your totems off my bench, because I've a horn here that cracks if you so much as breathe on it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Don't cast anything near my bench, please, because sparks and fine springs do not get along, and I've lost a whole box of them to a show-off before." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Gloves, rogue, gloves. If you're going to handle anything on my bench, you'll wear gloves, and you'll not pocket a single spring, because I count them." },
        { id = "h_default", key = true,
          text = "Felnok Steelspring, and I build things for people who can't build them for themselves. Right now that's Tinkee Steamboil, down in the Burning Steppes, and she wants her order finished yesterday." },
        { id = "h_from_tinkee", tags = { "news" }, when = { questActive = TODO_QUEST("Felnok Steelspring") },
          text = "Tinkee sent you? Then she's sent me something she needs freezing, and I'm nearly ready for it. Nearly, mind you, because I'm missing one thing." },
        { id = "h_horns_before", when = { questDone = TODO_QUEST("Felnok Steelspring"), questBefore = TODO_QUEST("Chillwind Horns") },
          text = "I've got nearly everything Tinkee asked for, except the horns of the chillwind chimaera. They have to be uncracked, mind, because a cracked horn is worth nothing to me." },
        { id = "h_horns_during", tags = { "news" }, when = { questActive = TODO_QUEST("Chillwind Horns") },
          text = "Eight horns, all of them perfect, from the chillwinds out in the snow. Hit the beasts anywhere but the head, if you can manage it." },
        { id = "h_return", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Tinkee") },
          text = "It's all packed and padded, so carry it level and don't let anyone sit on it. Tinkee will know what to do with it from there." },
      },
      again = {
        { id = "h_again", text = "What else? I've a coil to wind and it won't wind itself." },
        { id = "h_again2", text = "Ask, but mind the bench." },
        { id = "h_again3", text = "Go on. I'll listen while I count these springs again." },
      },
      choices = {
        { text = "Why do the chillwind horns hold the cold so well?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Tinkee need all this for?", next = "tinkee" },
        { text = "Why do the horns matter so much?", next = "horns" },
        { text = "Why work out here in the cold?", next = "cold" },
        { text = "How do you build something that stays cold?", next = "eng", when = { profession = "Engineering" } },
        { text = "What are the chillwind horns for, anyway?", next = "xmage", when = { class = "MAGE" } },
        { text = "Has anyone actually stolen from you?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    tinkee = {
      lines = { { id = "tk_default", text = "Dragon eggs, I think, or something like them, from the black dragonkin in the Steppes. She wants them kept cold for study, and I build the bits that keep them cold. I don't ask more than that, because the people paying her don't like questions." } },
      choices = {
        { text = "Who's paying her?", next = "tinkee_patron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tinkee_patron = {
      lines = { { id = "tp_line", text = "Somebody she calls a patron, very important, very rich and very secretive. Tinkee goes pale when she mentions him, so I stopped asking, and I'd advise you to stop as well." } },
      choices = {
        { text = "Someone should find out who he is.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "A client's business is his own.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horns = {
      lines = { { id = "hr_default", text = "A chillwind horn holds the cold the way a bottle holds water, and I use them to line the cases. Crack one and the cold leaks out, and then whatever's inside spoils." } },
      choices = {
        { text = "Where do the chillwinds live?", next = "horns_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horns_where = {
      lines = { { id = "hw_default", text = "Out in the snowfields, wherever the wind's worst, and they breathe frost on anyone who comes close. Take a warm cloak and a friend, and if your friend's slower than you, so much the better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    cold = {
      lines = { { id = "c_default", text = "Because the cold here is free, friend, and in the Steppes it costs a fortune. Everlook's the only place I know where the weather does half my work for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eng = {
      lines = { { id = "e_default", text = "You don't build it cold, you build it to keep the warmth out, which is a different thing entirely. Layers, padding, sealed joints and good horn, and never open the lid to check, however tempted you are." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make parts, I make them right and I make them on time. That's all there is to tell, and it's more than most can say." } },
    advice = { { id = "tp_ad", text = "Wear gloves. Always wear gloves, in Winterspring and everywhere else." } },
    _none = { { id = "tp_none", text = "Not my department, friend. Ask somebody who isn't busy." } },
  },
}

P:NPC {
  key = "jessica", id = TODO_NPC("Jessica Redpath"), name = "Jessica Redpath",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook", "argent_dawn" }, temper = { "quiet" }, values = { "family", "hope" },
  notices = { "race", "kin" },

  impression = {
    first = "Jessica Redpath fled Lordaeron before the Scourge came and has been waiting for news of her family ever since. She asks about Darrowshire the way people ask about a wound.",
    third = "{name} met Jessica Redpath, a Lordaeron refugee in Everlook who hopes to find her little sister.",
  },

  greetings = {
    { id = "g_default", text = "Hello, traveller. If you've come from the east, I'd be grateful for any news at all." },
    { id = "g_searching", when = { questActive = TODO_QUEST("Sister Pamela") }, text = "Have you been to Darrowshire yet? Please, don't spare my feelings when you do." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You were from Lordaeron once, weren't you? Forgive me for staring; I keep looking for faces I knew." },
    { id = "n_refugee", cat = "kin", when = { origin = "human_lordaeron_refugee" },
      text = "You fled the north too, I can hear it in your voice. Did your family get out with you?" },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It's whiter and quieter, and nothing here remembers me, which is a kind of mercy, I suppose. Lordaeron had green hills and farms all the way to Darrowshire, and they say the plague has turned it all grey. If the land up there has spirits like yours, I hope somebody is still being kind to them." } },
      choices = {
        { text = "If I travel north, I'll ask the spirits after your family.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let Lordaeron go. The living need you here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not that I know of, but mages travel more than most, so every one who comes through Everlook, I ask whether they've heard any news of the folk from Darrowshire. Every one of them shakes their head, and I keep asking anyway." } },
      choices = {
        { text = "Don't stop asking. Someone may know.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's probably dead. You should let go.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'm sorry. I don't know him.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ruins, I'm told, and ghosts who still fight the battle that killed them. My family was there, and nobody can tell me whether they fell or fled, so if someone quiet could look among the houses, I'd be grateful just to know." } },
      choices = {
        { text = "I'll look, if I pass that way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some things are better left buried.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I hope you find your answer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman? I've never met one, though I've heard the orcs who speak to spirits are gentler than the ones I was taught to fear as a girl." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "You're a mage? Then perhaps you've been to Dalaran, or what's left of it. My family used to say the city's light could be seen from the hills on a clear night." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You have the look of someone who goes where others can't, and finds what others miss. I wonder whether you've ever been to Darrowshire." },
        { id = "h_default", key = true,
          text = "I'm Jessica Redpath. I left Lordaeron before the plague reached us, but my family stayed behind, and I've heard nothing of them since the fighting at Darrowshire." },
        { id = "h_before", when = { minLevel = 53, questBefore = TODO_QUEST("Sister Pamela") },
          text = "You look like someone who could walk into the Plaguelands and come out again. My little sister Pamela was in Darrowshire when the dead came, and I miss her more than I can say." },
        { id = "h_during", tags = { "news" }, when = { questActive = TODO_QUEST("Sister Pamela") },
          text = "Darrowshire is in the southern hills of the eastern Plaguelands, below the old roads. Pamela would be little still, in my mind at least, with a doll she never let go of." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Sister Pamela") },
          text = "You went to Darrowshire for me. I can see in your face that you found something, and I'm not sure yet whether I want to hear it." },
      },
      again = {
        { id = "h_again", text = "Is there something else? I don't mind talking; it passes the time." },
        { id = "h_again2", text = "Go on, please. It's good to hear a voice that isn't a trader's." },
      },
      choices = {
        { text = "How does Winterspring compare to the land you left?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Tell me about your family.", next = "family" },
        { text = "How did you end up in Everlook?", next = "everlook" },
        { text = "What happened at Darrowshire?", next = "darrowshire" },
        { text = "I found Pamela in Darrowshire.", next = "found", when = { questDone = TODO_QUEST("Sister Pamela") } },
        { text = "My family fled the north too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Have you asked mages about your family?", next = "xmage", when = { class = "MAGE" } },
        { text = "What would I find in Darrowshire?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "My father, Joseph, and my little sister Pamela, and others besides. Father was stubborn about leaving our home, and I was the one who ran, and I've been sorry ever since that I didn't make them come with me." } },
      choices = {
        { text = "You couldn't have known what was coming.", next = "family_guilt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_guilt = {
      lines = { { id = "fg_default", text = "Nobody could, I suppose. People keep telling me that, and some days I believe them, and some days I sit here and think of every word I should have said before I left." } },
      choices = {
        { text = "You lived. That isn't a crime.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    everlook = {
      lines = { { id = "e_default", text = "I went as far from the plague as a ship would take me, and then further, and the further road ended here in the snow. The Argent Dawn's man, Gregor, is kind to me, and he writes down every rumour from the east." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darrowshire = {
      lines = { { id = "d_default", text = "There was a battle there, they say, when the Scourge came down on the village and the people stood against them. I've heard it went very badly, and I've heard nothing else." } },
      choices = {
        { text = "Do you want the truth, if I find it?", next = "darrowshire_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darrowshire_truth = {
      lines = { { id = "dt_default", text = "I think so, yes, though ask me again on a cold night and I might say no. Not knowing is its own kind of plague, and I've had it long enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    found = {
      lines = { { id = "fd_default", text = "Then tell me plainly, please, or don't tell me at all. I've imagined it a hundred ways already, and none of them were kind." } },
      choices = {
        { text = "She's at peace, Jessica. That's what matters.", next = "found_soft", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "You deserve the whole truth, however hard it is.", next = "found_hard", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    found_soft = {
      lines = { { id = "fs_default", text = "At peace. I'll take those words and keep them, and I won't ask what you aren't saying. Thank you for going where I couldn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    found_hard = {
      lines = { { id = "fh_default", text = "Then she's gone, isn't she, and I knew it before you came back. Thank you for not lying to me; everyone else has been so careful, and careful is a kind of lying too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refugee = {
      lines = { { id = "r_default", text = "Then you know how it is, waking up thinking you're home and remembering you're not. Did you leave anyone behind?" } },
      choices = {
        { text = "Yes, and I still hope to find them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I don't talk about it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a daughter of Lordaeron once, and now I'm a refugee in the snow. Neither one was my idea." } },
    advice = { { id = "tp_ad", text = "Say what you mean to the people you love before you leave home. I didn't." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Gregor might; he hears more than I do." } },
  },
}

P:NPC {
  key = "malyfous", id = TODO_NPC("Malyfous Darkhammer"), name = "Malyfous Darkhammer", title = "The Thorium Brotherhood",
  bible = "bibles/winterspring.md", role = "blacksmith", tier = "quest",
  communities = { "everlook", "thorium_brotherhood" }, temper = { "dismissive", "proud" }, values = { "craft", "pride" },
  notices = { "race", "craft" },

  impression = {
    first = "Malyfous Darkhammer is a Dark Iron smith of the Thorium Brotherhood who calls outsiders ants to their faces. He spoke of his own work with more warmth than he showed anyone living.",
    third = "{name} met Malyfous Darkhammer, the Thorium Brotherhood's proud Dark Iron smith in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Another one wanting something, I see, so speak quickly or go." },
    { id = "g_hide", when = { questActive = TODO_QUEST("Pip Quickwit, At Your Service!") }, text = "You have a hide for me? Show it, and we'll see if it's worth the air you're breathing." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Bronzebeard blood, I can smell it on you. Keep your opinions of my clan behind your teeth, and we'll get along well enough." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, are you? We'll see; plenty of people hold a hammer, and very few know what to do with it." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A forge answers to the smith, ant, and that is the lesson my people learned at a terrible price beneath Blackrock. Thaurissan called up the Firelord thinking fire would serve him, and now Ragnaros rules our kin. I keep my fire small and my hammer heavy, and I do not ask the flame what it wants." } },
      choices = {
        { text = "Fire must be respected, not commanded. Your people learned that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then bind it better than Thaurissan did, smith.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Thaurissan summoned him to win a war against Ironforge, and the Firelord has held the Dark Iron ever since. The Thorium Brotherhood are those of us who chose the forge over the chains, so you will forgive me, ant, if I think little of anyone who bargains with fire for a living." } },
      choices = {
        { text = "Your kin made a bad bargain. I'll make better ones.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You chose rightly. No power is worth those chains.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll leave you to your forge.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We could make one that would cut through anything you pointed it at, if you proved worthy of our trust and brought us the ore and the arcanite. Until then, sharpen what you have, and stop dragging it across stone when you sneak." } },
      choices = {
        { text = "I'll earn your trust, and the blade with it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find a smith who's less particular.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll sharpen what I have.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. My people bound fire once and were burned for it, ant, so don't expect me to be impressed by your little totems." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. My kin under Blackrock let a fire lord into their mountain and are slaves to him still, so do not think your little demon impresses a Dark Iron." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Rogue. I can see the blades at your belt from here, and the edges are poor. A real smith would weep to see them." },
        { id = "h_default", key = true,
          text = "I am Malyfous Darkhammer of the Thorium Brotherhood, and I do not waste my hours on idle talk. If you have a task worthy of my hammer, name it; if not, there are snowdrifts outside you could study." },
        { id = "h_warm", when = { reputation = { faction = "Thorium Brotherhood", min = "honored" } },
          text = "You're known to the Brotherhood, I see, so I'll grant you a little patience. A little." },
        { id = "h_beast", when = { minLevel = 58 },
          text = "There's a beast in Blackrock Spire whose hide would make armour fit for a king, if anyone could skin it whole. The odds of a pristine hide are one in a million, so I don't expect you to bring me one." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Pip Quickwit, At Your Service!") },
          text = "You brought me the hide, and it's pristine, so the catalogue is open to you. Choose carefully, because I don't make anything twice." },
      },
      again = {
        { id = "h_again", text = "Still here? Then say what you want." },
        { id = "h_again2", text = "More questions. The ants always have questions." },
      },
      choices = {
        { text = "Does a Dark Iron forge answer to the fire spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What is the Thorium Brotherhood?", next = "brotherhood" },
        { text = "What could you make from the Beast's hide?", next = "hide" },
        { text = "Why work in Everlook, so far from home?", next = "everlook" },
        { text = "A Dark Iron, trading with my people?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Teach me something about the forge.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Ragnaros enslaved your people?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could the Thorium Brotherhood make a better blade?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Smiths of my clan who were slaves to the Firelord in the depths of Blackrock, and who broke their chains and walked out. We trade with anyone who pays, and we bow to no one, least of all fire." } },
      choices = {
        { text = "Escaping Ragnaros can't have been easy.", next = "brotherhood_escape" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_escape = {
      lines = { { id = "be_default", text = "It was not, and many who tried are still down there, burned or worse. We made what freed us with our own hands, and that is why our work is the best you'll find above the ground." } },
      choices = {
        { text = "Freedom earned by your own hands. I respect that.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Your clan served the fire willingly once.", next = "BACK", fx = { affinity = -2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide = {
      lines = { { id = "h_line", text = "Armour, and armour of a caliber you have never worn: a breastplate for a fighter, leggings for a spellcaster, and more besides. Every piece needs the Beast's hide, whole and unmarked, and other things harder still to find." } },
      choices = {
        { text = "One in a million, you said?", next = "hide_odds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide_odds = {
      lines = { { id = "ho_default", text = "One in a million, and I'm being generous. Most who try come back with a ruined hide and a bigger scar, and I send them away, because I will not put my name on scraps." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    everlook = {
      lines = { { id = "ev_default", text = "The goblins here pay, they don't ask where I come from, and nobody in Everlook has tried to spit at me yet. In the Brotherhood's trade, that counts as a fine place to work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Your people and mine fought a war over a mountain long before you were born, and we lost, and we've been paying for it since. I'll sell you good work, Bronzebeard, but don't ask me to love you for it." } },
      choices = {
        { text = "That war's done. We can trade like honest folk.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A Dark Iron's word isn't worth much in Ironforge.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = { { id = "sm_default", text = "Heat is patience, not force, and the metal tells you when it's ready if you listen. You surface folk beat it until it obeys, which is why your blades break." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was born under the mountain and I forged for a master of fire. Now I forge for myself, and for whoever pays." } },
    advice = { { id = "tp_ad", text = "Don't bring me anything less than perfect. It saves us both a walk." } },
    _none = { { id = "tp_none", text = "The Brotherhood doesn't waste time on that. Neither will I." } },
  },
}

P:NPC {
  key = "storm", id = TODO_NPC("Storm Shadowhoof"), name = "Storm Shadowhoof",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "stern" }, values = { "hunt", "honor" },
  notices = { "race", "class" },

  impression = {
    first = "Storm Shadowhoof is a tauren hunter who came to Winterspring for the great beasts of the snow. He measures people by whether they would stand in front of a charging bear.",
    third = "{name} met Storm Shadowhoof, the tauren who hunts Winterspring's greatest beasts.",
  },

  greetings = {
    { id = "g_default", text = "The snow carries tracks a long way. Have you come to hunt, or to watch?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother keep you, child of Mulgore. These hills are colder than our plains, but the beasts here would make our elders proud." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You walk like a hunter, quiet and watching. Good; the beasts of Winterspring kill the careless first." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The leaders of the herds and packs, the old chimaera and the great bears the young ones follow. When a leader falls the herd scatters for a season, so I choose carefully and never take more than one a year." } },
      choices = {
        { text = "That is a fair hunt. The herd grows stronger for it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why hunt them at all? Let the leaders lead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I believe they do. Ursius of the Shardtooth, Brumeran of the Chillwind and Shy-Rotam the frostsaber have lived long enough to grow great, and nothing in this snow grows old without the land's favour. I hunt them with respect and give the spirits thanks after every hunt, because a hunter who forgets his thanks soon stops coming home." } },
      choices = {
        { text = "A hunt given thanks is the only honourable hunt.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits don't choose who's hunted. Strength decides.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would track it from hiding and face it in the open, because a hunt that ends with a blade in the back is a killing and nothing more. You may hunt as you like, but the leaders of the herds deserve to see what comes for them." } },
      choices = {
        { text = "Facing your prey is the honourable way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. The beast won't care.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In war, yes; I have seen mages turn a battle. But a hunt is between the hunter and the beast, and a bolt of frost from far away teaches you nothing about the animal you killed, which is the whole reason to hunt." } },
      choices = {
        { text = "You're right. I'll hunt with my own hands.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hunt is about the kill. Use what works.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "We hunt differently, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, the Earth Mother's blessing on you. The great beasts here are wise, and I think the cold spirits keep them strong, so walk softly when you pass their dens." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You walk like a cat on snow, rogue, and a cat on snow is a fine hunter. But the beasts of Winterspring smell you long before they hear you, so mind the wind." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, in a land of frost. You will feel at home here, I think, though the ice in Winterspring does not answer to any spell I have seen." },
        { id = "h_default", key = true,
          text = "I am Storm Shadowhoof, and I hunt the great beasts of Winterspring. Every herd and pack in these hills has a leader, and those leaders are the hunts worth telling of." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are of the Alliance, and I don't share my hunts with the Alliance lightly. Still, the goblins say this is neutral ground, so speak, and I will listen." },
        { id = "h_ursius", tags = { "news" }, when = { questActive = TODO_QUEST("Ursius of the Shardtooth") },
          text = "Ursius leads the shardtooth bears, and he is bigger and angrier than any of them. Bring friends, and let him come to you." },
        { id = "h_brumeran", tags = { "news" }, when = { questActive = TODO_QUEST("Brumeran of the Chillwind") },
          text = "Brumeran rules the chillwind chimaera, and his breath freezes a warrior where he stands. Strike fast and keep moving." },
        { id = "h_shyrotam", tags = { "news" }, when = { questActive = TODO_QUEST("Shy-Rotam") },
          text = "Shy-Rotam is the matriarch of the frostsabers, old and clever, and she will not show herself to just anyone. Prepare well before you face her." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, out here in the snow! Then you know as well as I do that the great beasts of Winterspring have a great deal to teach a patient hunter." },
      },
      again = {
        { id = "h_again", text = "Ask what you will, for the tracks will keep a while." },
        { id = "h_again2", text = "Speak on, but quietly; sound carries over snow." },
      },
      choices = {
        { text = "Do the spirits favour the great beasts of Winterspring?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Which beasts of Winterspring do you hunt, Storm?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Which beasts do you hunt?", next = "beasts" },
        { text = "Why come so far north to hunt?", next = "why" },
        { text = "Shy-Rotam is sacred to my people.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "How do tauren hunt in the snow?", next = "tauren", when = { race = "Tauren" } },
        { text = "Would you hunt a great beast from hiding?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you think magic has a place in the hunt?", next = "xmage", when = { class = "MAGE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Ursius of the shardtooth, Brumeran of the chillwind, and Shy-Rotam of the frostsabers, each the greatest of its kind. Bring them down, and the hills will know your name as they know theirs." } },
      choices = {
        { text = "Why hunt the leaders?", next = "beasts_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_why = {
      lines = { { id = "bw_default", text = "Because killing the weak teaches you nothing, and killing the strong teaches you everything. My people honour the hunt, and the hunt is only honest when the beast can kill you too." } },
      choices = {
        { text = "A fair hunt honours both hunter and prey.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A hunt is a hunt. Kill quick and go home.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The plains of Mulgore have no snow, and the beasts there have learned to fear my people. Here, nothing fears a tauren, and that is a better teacher than any elder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "k_default", text = "I have heard this from the night elves before, and I know the frostsabers fought beside your people long ago. I don't hunt her out of disrespect, but because she is the greatest of her kind, and that is the highest honour a hunter can give." } },
      choices = {
        { text = "Then hunt something else, and honour her by letting her live.", next = "BACK", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "I understand. The hunt has its own law.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Slowly, young one, and downwind, and with a thicker cloak than you think you need. The snow hides the tracks by noon, so rise early, and trust your nose before your eyes." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned the hunt on the plains of Mulgore, and I came north to test it. So far, the north is winning." } },
    advice = { { id = "tp_ad", text = "Watch the tracks, not the trees. The beasts here are white, and they hide in plain sight." } },
    _none = { { id = "tp_none", text = "I know tracks and beasts. That is neither." } },
  },
}

P:NPC {
  key = "yugrek", id = TODO_NPC("Yugrek"), name = "Yugrek", title = "Wind Rider Master",
  bible = "bibles/winterspring.md", role = "flightmaster", tier = "service",
  communities = { "everlook" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Yugrek keeps the Horde's wind riders in Everlook and wraps them in blankets against the cold. He grumbles about the snow but would not leave his beasts for any warmer post.",
    third = "{name} met Yugrek, the orc who keeps the Horde's wind riders in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Flying? The riders are wrapped and ready, though they hate this cold more than I do." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc in the snow! Durotar's sun seems a long way off up here, doesn't it?" },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Demons, the shaman say, from the old war, and the ground drank their filth until it went sick. The riders won't land anywhere near it, and I've learned to trust their noses." } },
      choices = {
        { text = "Then someone must cleanse it, whatever the cost.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Leave it to the night elves. It's their forest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Harsher, shaman, because it comes down off the peaks all night and drives the snow sideways into the roosts. I've wrapped the riders in blankets and still they shiver. If the air spirits here have a grudge, I'd like to know whose it is, because it isn't mine." } },
      choices = {
        { text = "Leave the wind an offering at the roost, as is proper.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind answers no one. Your beasts will have to toughen up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They don't refuse, but they grumble and snap, and an angry wind rider over the mountains between here and Felwood is a hard flight. Keep your demon unsummoned until you land and we'll all get along fine." } },
      choices = {
        { text = "I'll keep my demon away. The beasts come first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon stays with me. They'll get used to it.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Downwind it is.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Badly, and loudly, and I don't blame them, since they come from the hot canyons of the Barrens and Thousand Needles. I warm their feed and wrap their wings at night, and I'd give a month's pay for a mage willing to stand guard over them with a hearth spell." } },
      choices = {
        { text = "Their care is worth every effort you make.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're beasts. They'll toughen up.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll leave you to your blankets.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, maybe you can tell the wind up here to stop biting my beasts, because they won't listen to me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. My wind riders don't like the smell of brimstone, so I'll have you stand downwind while I saddle one, if it's the same to you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage of the Horde! If you've got a spell to keep the cold off my wind riders, I'd like to hear it, because these blankets only do so much." },
        { id = "h_default", key = true,
          text = "I am Yugrek, and I keep the wind riders here for the Horde. They'll take you south to Felwood and on to Orgrimmar, if your business is with the Horde." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "My riders don't carry the Alliance. The night elf with the hippogryphs will see to you; she's just over there." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, this far north! The wind riders will carry you south over Felwood, though I'd keep my eyes shut over the worst of it, because the trees down there aren't right." },
      },
      again = {
        { id = "h_again", text = "Something else? The riders grow cold while we talk." },
        { id = "h_again2", text = "Speak, then, and quickly." },
      },
      choices = {
        { text = "Is the wind over Winterspring as harsh as it seems?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's wrong with the trees of Felwood?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do wind riders stand the cold?", next = "cold" },
        { text = "You and the night elf work side by side?", next = "maethrya" },
        { text = "Do your wind riders refuse warlocks?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do the wind riders take the cold?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "Badly, and they tell me so every morning. I wrap them in blankets bought from the goblins, at goblin prices, and the riders chew the blankets anyway." } },
      choices = {
        { text = "Chew the blankets?", next = "cold_chew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_chew = {
      lines = { { id = "cc_default", text = "Wind riders chew everything, friend, saddles, ropes and once a goblin's hat while he was still wearing it. The Bruisers fined me, and the rider was very pleased with himself." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    maethrya = {
      lines = { { id = "m_default", text = "Side by side, and we've never come to blows, though our beasts have. She says nothing to me and I say nothing to her, and in this cold that's as near to friendship as an orc and an elf will get." } },
      choices = {
        { text = "Maybe one day you'll say more.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some enemies are best kept at a distance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I flew for the Horde across the Barrens before they sent me here to freeze. I don't complain much, though the riders do." } },
    advice = { { id = "tp_ad", text = "Wear something warm when you fly. The wind up there bites harder than the riders." } },
    _none = { { id = "tp_none", text = "I keep wind riders, and that's all I know." } },
  },
}

P:NPC {
  key = "maethrya", id = TODO_NPC("Maethrya"), name = "Maethrya", title = "Hippogryph Master",
  bible = "bibles/winterspring.md", role = "flightmaster", tier = "service",
  communities = { "everlook" }, temper = { "reserved" }, values = { "dutiful", "nature" },
  notices = { "race" },

  impression = {
    first = "Maethrya keeps the Alliance's hippogryphs in Everlook and watches the goblins' trade with polite suspicion. She speaks softly, and her birds listen to every word.",
    third = "{name} met Maethrya, the night elf who keeps the Alliance's hippogryphs in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. The hippogryphs are rested, if you wish to leave the snow behind." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Elune's light on you. It is good to hear our tongue among so many goblins." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The Circle at the Emerald Sanctuary believes so, and they're braver than I am for it. I see the forest from above every day, and the rot reaches further each season." } },
      choices = {
        { text = "It can. Felwood must be cleansed, tree by tree.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some forests are lost. Burn the worst of it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I trust them to keep their bargains and nothing more, and the Steamwheedle Cartel sells to the Horde as gladly as to us. A quiet ear among their traders would hear more than I can, but that is the Sentinels' business, and not mine." } },
      choices = {
        { text = "The Cartel keeps the peace. That's enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd happily lighten a goblin's purse for the Alliance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep my ears open.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They remember, I think, in the way beasts do, what the Highborne's magic did to this world in the Sundering. Elune's creatures feel the arcane like a storm coming, and Winterspring has old Highborne ruins enough to keep them on edge." } },
      choices = {
        { text = "Then I'll keep my spells to myself around them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts shouldn't dictate how I use my power.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my hands still.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue of the Alliance. The goblins here will watch your hands closely, so I hope you give them nothing to see." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My hippogryphs are nervous around the arcane, so speak softly near them and keep your hands still while they settle." },
        { id = "h_default", key = true,
          text = "I am Maethrya, and I keep the hippogryphs for the Alliance in Everlook. They will carry you to Talonbranch Glade in Felwood, and on to the rest of Kalimdor." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "My birds will not carry you, but Yugrek's wind riders will, and he keeps them well enough. You'll find him a few paces away, complaining about the cold." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle. My hippogryphs fly south over Felwood every day, and they always climb higher over the worst of it, as if they can smell what's wrong with the trees." },
      },
      again = {
        { id = "h_again", text = "Is there something else you wish to know?" },
        { id = "h_again2", text = "Speak; the birds are patient, and so am I." },
      },
      choices = {
        { text = "Can Felwood still be saved, Maethrya?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "What do you think of Everlook?", next = "everlook" },
        { text = "What do the hippogryphs make of the snow?", next = "birds" },
        { text = "You don't trust the goblins much, do you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why are the hippogryphs afraid of magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    everlook = {
      lines = { { id = "e_default", text = "It is a goblin town in the heart of a land my people once walked freely, and they sell its furs by the bundle. I keep my opinions to myself, mostly, because the Bruisers keep the peace and the peace serves my birds." } },
      choices = {
        { text = "The goblins have as much right here as anyone.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Winterspring belongs to the kaldorei.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds = {
      lines = { { id = "b_default", text = "They are creatures of the forest, and they find the snow strange, but they are braver than they look. They watch the frostsabers on the hills as if they recognise old friends." } },
      choices = {
        { text = "Old friends?", next = "birds_friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds_friends = {
      lines = { { id = "bf_default", text = "The frostsabers have been allies of my people since long before the goblins came here with their scales. Some of our sentinels still ride them, and the hippogryphs remember." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I have tended hippogryphs since before the Third War, and I go wherever they are needed." } },
    advice = { { id = "tp_ad", text = "Do not stare at the hippogryphs when you mount. They find it rude." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not think the hippogryphs do either." } },
  },
}
