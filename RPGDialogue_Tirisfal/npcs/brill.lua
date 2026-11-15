-- Brill: a human town, a plague town, now the Forsaken's. Voice: bibles/tirisfal.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zygand", id = TODO_NPC("Executor Zygand"), name = "Executor Zygand",
  bible = "bibles/tirisfal.md", role = "soldier", tier = "major",
  communities = { "brill" }, temper = { "cold" }, values = { "loyal", "dutiful" },
  notices = { "kit", "race" },
  impression = {
    first = "Executor Zygand speaks of the Scarlet Crusade the way a soldier speaks of bad weather he means to outlast. He is cold and spare with words, and I would not want to be on the wrong end of his blade.",
    third = "{name} met Executor Zygand, commander of the Deathguard in Tirisfal, who means to see the Scarlet Crusade driven from the glades.",
  },

  greetings = {
    { id = "g_brill", text = "State your business. The Crusade keeps me busy, and I prefer to stay that way." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and with results, I hope." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The zealots marked you. Mend yourself, and then repay them in kind." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of our living allies. Tirisfal is not kind to the breathing, so watch the fields." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Executor Zygand, commander of the Deathguard in Tirisfal. The Crusade means to burn this land clean of us, and it will not go the way they hope." },
        { id = "h_war", tags = { "news" }, when = { questActive = TODO_QUEST("At War With The Scarlet Crusade") },
          text = "The Crusade masses in the fields and the monastery roads. Cut them down where you find them, and bring proof." },
        { id = "h_maggot", when = { questActive = TODO_QUEST("Wanted: Maggot Eye") },
          text = "Maggot Eye is a gnoll who robs our graves. Bring me his paw, and the dead of Brill can rest." },
        { id = "h_intel", when = { questActive = TODO_QUEST("Vital Intelligence") },
          text = "Arren sent you with what the Crusade's runners carried? Let me see... yes, this will do nicely." },
      },
      choices = {
        { text = "Who are the Scarlet Crusade?", next = "crusade" },
        { text = "I held a line once, for Lordaeron. Put me on yours.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can reach their camps unseen, Executor.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I carry the Light, Executor. Does that trouble you?", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "My spells are at the Deathguard's service.", next = "mage", when = { class = "MAGE" } },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
      },
      again = {
        { id = "h_again", text = "Something further? Be brief; the Crusade is not." },
        { id = "h_again2", text = "Go on. I can spare a moment between reports." },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "Your old line broke, as all of Lordaeron's did, and you woke on the wrong side of it. The Deathguard is the line now, and it doesn't break, because there's nothing left in us that the Scourge can frighten." },
        { id = "wa_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "Lordaeron's army, then. Some of the Crusaders in those fields wore the same tabard you did, and they'll call you traitor before they swing. Answer them with steel, not words." },
      },
      choices = {
        { text = "Then I'll stand with the Deathguard, to the end.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll fight the Crusade my way, not in your ranks.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Unseen is good, and dead is better. The Crusade's officers sleep in the farmhouse at Solliden; their sentries don't, so learn which windows they don't watch, and bring me their orders as well as their throats." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker. Then you answer to the Dark Lady's own, and I'll not presume to give you orders. Tell your masters the Crusade's runners use the mill road, and they're careless at dusk." },
      },
      choices = { { text = "Orders and throats. Understood.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } } },
    },
    paladin = {
      big = true,
      lines = { { id = "pa_default", text = "Trouble me? Every Crusader I've killed was glowing with that same light when he came at us. I'll judge you by where you point it, and I'll be watching, because I've yet to meet a paladin who didn't think the Light gave him the right to judge me." } },
      choices = {
        { text = "I'll point it at the Crusade, and gladly.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "The Light isn't theirs. I'll show them mercy where I can.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Good. Fire is the one thing the Crusade respects, since it's the one thing they like to use on us. Burn their fields before they burn ours, and don't waste it on the rattlecages; they don't feel it." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran-trained, and now on our side of the wall. Bethor Iceshard in the Undercity would want to know you; he was Kirin Tor too, before." },
      },
      choices = { { text = "Their fields, then. Not ours.", next = "BACK", fx = { affinity = 2 } } },
    },
    crusade = {
      big = true,
      lines = {
        { id = "c_default", text = "The living who survived the plague and learned only hatred from it. They call us abominations and burn whatever they can't understand. They mistake cruelty for purity." },
      },
      choices = {
        { text = "Then we'll end them.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 }, learn = { "scarlet_crusade" } } },
        { text = "Do you ever recognize faces among the Crusaders?", tag = "Persuade", next = "faces",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Scourge" }, { questDone = TODO_QUEST("At War With The Scarlet Crusade") } } } },
          fail = { next = "faces_no", fx = { affinity = -1 } } },
      },
    },
    faces = {
      lines = {
        { id = "fc_default", text = "Once. A young Crusader on the mill road, with the look of a family that farmed near Brill before the plague; I may have known his father. I cut him down without slowing, and I still can't tell whether that was the Dark Lady's freedom in me or something the Scourge left behind." },
        { id = "fc_forsaken", when = { race = "Scourge" },
          text = "You're one of us, so you know the question already. Yes. Some of them were born in these villages, and some of us buried their parents. I don't hesitate, and I keep count, and some nights the counting is the only thing that keeps the faces away." },
      },
      choices = {
        { text = "You did your duty.", next = "BACK", fx = { affinity = 1 } },
        { text = "That wasn't the Scourge in you.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    faces_no = {
      lines = {
        { id = "fn_default", text = "I recognize the enemy, and that is all I need to recognize." },
        { id = "fn_living", text = "Sentiment belongs to the living. Ask me something useful, or let me work." },
      },
      choices = { { text = "As you say, Executor.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Reports reach me from every field and road in Tirisfal. Ask what you need, and keep it brief." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've served Brill well, so I'll tell you what the reports actually say, rather than what we announce." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, because the Dark Lady expects it of me. Do not mistake that for a welcome." },
    },
    scarlet_crusade = { { id = "tp_crusade", text = "Every Crusader we kill is one fewer torch at our door. I keep count." } },
    _none = { { id = "tp_none", text = "Ask the magistrate; administration is his burden, not mine." } },
  },
}

P:NPC {
  key = "sevren", id = TODO_NPC("Magistrate Sevren"), name = "Magistrate Sevren",
  bible = "bibles/tirisfal.md", role = "noble", tier = "quest",
  communities = { "brill" }, temper = { "brisk" }, values = { "orderly", "proud" },
  notices = { "status" },
  impression = {
    first = "When Magistrate Sevren took Brill back it was a plague town full of the mindless, and he is quietly proud of what it is now. He would much rather I did his errands than discussed them.",
    third = "{name} met Magistrate Sevren of Brill, who rebuilt the town one street at a time and keeps it running by the book.",
  },

  greetings = {
    { id = "g_hall", text = "Ah, you. There's work, and it's important, and I'd rather you did it than discussed it." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the town hall? Excellent, because I've more for you." },
  },

  notice = {
    { id = "n_living", cat = "status", when = { faction = "Horde", race = { "Orc", "Troll", "Tauren" } },
      text = "A living face in my hall! The Warchief's allies are welcome in Brill, but do keep your breathing quiet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "You're speaking to Magistrate Sevren. When we took Brill back it was a plague town full of the mindless; now it's a Forsaken town, and that's my doing." },
        { id = "h_grave", tags = { "news" }, when = { questActive = TODO_QUEST("Graverobbers") },
          text = "Gnolls are digging up our graveyard, and our dead are not their supper. Put a stop to it." },
        { id = "h_lich", when = { questActive = TODO_QUEST("The Prodigal Lich") },
          text = "Bethor Iceshard in the Undercity has asked after a lich who wears an old friend's name. Take him what we've learned." },
        { id = "h_ring", when = { questActive = TODO_QUEST("The Engraved Ring") },
          text = "Here's a ring with an engraving, and someone in this town knows whose it is. Find out who." },
      },
      choices = {
        { text = "How did you take Brill?", next = "brill" },
        { text = "I lived near Brill, before.", next = "farmer", when = { race = "Scourge" } },
        { text = "Does Brill need a warlock's help, Magistrate?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'll see to it.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly, please; the ledgers won't balance themselves." },
      },
    },
    farmer = {
      lines = {
        { id = "fa_default", text = "Didn't we all, more or less. I keep a list of the old families, you know, for the records. If your name's on it, I'll strike the 'deceased', which is about all the dignity the town hall can offer." },
        { id = "fa_brill", when = { origin = "forsaken_brill_farmer" },
          text = "A farmer, from the fields south of here? Then your land is likely in my ledger as abandoned, and I'm afraid the Deathguard grows nightshade on it now. You're welcome to visit it, though I wouldn't expect to be recognized." },
      },
      choices = {
        { text = "Strike it. I'm alive enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Leave the record. That person died.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    warlock = {
      lines = { { id = "wl_default", text = "Brill needs everyone's help, and a warlock's imp is at least cheaper than a peon. Only keep your demons out of the town hall; the last one set fire to a filing cabinet, and I had those records arranged." } },
      choices = { { text = "No demons in the town hall.", next = "BACK", fx = { affinity = 1 } } },
    },
    brill = {
      lines = { { id = "b_default", text = "One street at a time. The Deathguard cleared it; I counted what was left and put it to work. A town needs both sorts." } },
      choices = { { text = "Impressive.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "That's Zygand's department. I sign the orders, and he carries them out with alarming enthusiasm." } },
    _none = { { id = "tp_none", text = "That's not a matter for the town hall." } },
  },
}

P:NPC {
  key = "johaan", id = TODO_NPC("Apothecary Johaan"), name = "Apothecary Johaan",
  bible = "bibles/tirisfal.md", role = "scholar", tier = "quest",
  communities = { "brill" }, temper = { "intent" }, values = { "ambitious", "curious" },
  notices = { "craft" },
  impression = {
    first = "Apothecary Johaan works among bottles that are only mostly safe and speaks of a new plague with real enthusiasm. It is meant for the Scourge, he says, and he says it quickly.",
    third = "{name} met Apothecary Johaan of the Royal Apothecary Society, who labours over a new plague in Brill.",
  },

  greetings = {
    { id = "g_lab", text = "Careful where you put your hands. Some of these bottles are only mostly safe." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my helper. Have you brought me something interesting?" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You've a feel for plants and potions. The Society could use people like you, so think on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Johaan, of the Royal Apothecary Society. Our work here matters more than you'd guess from the smell." },
        { id = "h_plague", tags = { "news" }, when = { questActive = TODO_QUEST("A New Plague") },
          text = "A new plague, ours this time, made by our own hands. I need ingredients from the creatures of the glades, so bring them to me." },
        { id = "h_grief", when = { questActive = TODO_QUEST("Fields of Grief") },
          text = "The pumpkins in the old fields grew in plague-soaked earth. That makes them very useful to me." },
        { id = "h_silverpine", when = { questActive = TODO_QUEST("Delivery to Silverpine Forest") },
          text = "This goes to the Society's apothecary at the Sepulcher, and you mustn't drop it. Really, don't drop it." },
        { id = "h_experiment", when = { questActive = TODO_QUEST("Johaan's Experiment") },
          text = "An experiment wants a subject, and the Crusade has kindly provided one. Fetch what I need." },
      },
      choices = {
        { text = "What is the plague for?", next = "purpose" },
        { text = "I served the Cult once. I know a plague when I see one.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I studied in Dalaran. Can I help with the formulae?", next = "mage", when = { class = "MAGE" } },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Something else? Don't touch the green one while you think." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Do you? Then you'll know this is nothing like theirs, and you'll stop looking at my bottles like that. The Cult made a plague to serve a master; the Society makes one to destroy him. Different hands, different ends." },
        { id = "wl_cult", when = { origin = "forsaken_cult_remnant" },
          text = "You were one of Kel'Thuzad's faithful, before? Then you've seen the grain wagons and the cauldrons. Help me, and you'll be undoing a little of what you helped do." },
      },
      choices = {
        { text = "Different ends. I'll help you, Apothecary.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "A plague is a plague. I want no part of another.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "Formulae? This is alchemy, not your ley lines and incantations, though I'll grant a mage is usually good at measuring things exactly. Fetch the ingredients for now, and if you prove careful, I'll let you read my notes." } },
      choices = { { text = "I'm very careful.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    purpose = {
      big = true,
      lines = {
        { id = "f_default", text = "For the Scourge, of course. Who else would deserve it? Don't ask me again; the answer won't change, and I'm busy." },
      },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's not quite an answer.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Unless it can be distilled, I've no interest." } },
  },
}

P:NPC {
  key = "coleman", id = TODO_NPC("Coleman Farthing"), name = "Coleman Farthing",
  bible = "bibles/tirisfal.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "bitter" }, values = { "proud" },
  notices = { "drink" },
  impression = {
    first = "Coleman Farthing died defending the Agamands' mills because they asked him to, and he has not forgiven them. He is courteous and wry about it, which somehow makes the grudge feel deeper.",
    third = "{name} met Coleman Farthing in the Gallows' End, a former mill hand who wants the risen Agamands put to rest for good.",
  },

  greetings = {
    { id = "g_tavern", text = "Good evening, friend, do sit. I'm just here thinking unkind thoughts about my former employers." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Tell me something that'll ruin an Agamand's day." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Drinking? I miss it, you know, the taste of it. Enjoy it for me, there's a good fellow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Coleman Farthing, at your service. When the Scourge came, the Agamands asked us mill hands to stay and defend their property, and most of us died for it. I'd like to return the favor." },
        { id = "h_deaths", tags = { "news" }, when = { questActive = TODO_QUEST("Deaths in the Family") },
          text = "The Agamands walk the mills now, as undead as I am and twice as foul. Bring me what's left of them, and I'll see they rest. Eventually." },
        { id = "h_mills", when = { questActive = TODO_QUEST("The Haunted Mills") },
          text = "The mills are haunted, and of course they're haunted; everyone who died there had a reason to stay angry." },
      },
      choices = {
        { text = "That's a heavy grudge.", next = "grudge" },
        { text = "I could make the Agamands' rest a short one.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You held the mills like soldiers. I respect that.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll go to the mills.", next = "END", fx = { affinity = 2 } },
      },
      again = {
        { id = "h_again", text = "More? Splendid, I've nowhere to be, and nothing to drink." },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "A short rest, quietly, from behind? Oh, I do like you. Old Gregor Agamand always sat with his back to the door, because he was certain nobody under him would dare. Prove him wrong for me, would you?" } },
      choices = {
        { text = "From behind, then. He's earned it.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I'll face him, so he knows who sent me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Soldiers? We were millers with pitchforks, friend, and the Agamands had real swords locked in the manor the whole time. Respect the dead mill hands if you like, but don't call it soldiering; soldiers are at least given a chance." } },
      choices = { { text = "Then I'll give them justice.", next = "BACK", fx = { affinity = 2 } } },
    },
    grudge = {
      lines = { { id = "g_default", text = "It's the only thing I carried out of the grave. I find I'd rather not put it down." } },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, friend, but ask me about the Agamands; that I could talk about all night." } },
  },
}

P:NPC {
  key = "gretchen", id = TODO_NPC("Gretchen Dedmar"), name = "Gretchen Dedmar",
  bible = "bibles/tirisfal.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "chilly" }, values = { "practical" },
  notices = { "weary" },
  impression = {
    first = "By the tavern fire sits Gretchen Dedmar, out of habit, since she can no longer feel its warmth. What she misses most is being cold, which is one of the saddest things anyone has told me.",
    third = "{name} met Gretchen Dedmar, a chilly regular of the Gallows' End who has found a way to keep death's cold at bay for a time.",
  },

  greetings = {
    { id = "g_tavern", text = "Cold tonight, though it's always cold, now. You stop noticing, and then one day you notice again." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Fresh from the spirit healer? You've a bit of the grave on you still, but it fades." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gretchen Dedmar. I sit in the tavern because it's warm, not because I can feel it; habit is a comfort, even dead." },
        { id = "h_chill", tags = { "news" }, when = { questActive = TODO_QUEST("The Chill of Death") },
          text = "The chill of death never quite leaves you, but I've found a way to keep it at bay for a while, if you'll fetch what I asked for." },
        { id = "h_cup", when = { metBefore = true }, text = "I still order a cup of tea, though I can't taste it, and I hold it until it goes cold. Some habits are worth the coin." },
      },
      choices = {
        { text = "What do you miss most?", next = "miss" },
        { text = "Let me try something. A mage's fire is hotter.", next = "mage", when = { class = "MAGE" } },
        { text = "I'll be back with it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Something else, dear? I'll be in this chair until the tea goes cold, and it always does." },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Oh, would you? Hold it closer, then, a little closer still. No, nothing, though I think I saw my fingers flinch, which they haven't done in a long while. Thank you for trying, dear; it was kind of you." },
      },
      choices = {
        { text = "I'll find a hotter spell one day.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Maybe flinching is a start.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    miss = {
      lines = {
        { id = "m_warm", text = "Being cold, isn't that strange? I sit by the fire because I remember wanting to, but now I don't feel either. I'd give a great deal to shiver again." },
      },
      choices = { { text = "I'm sorry.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say, dear. Ask Renee; she listens to everyone." } },
  },
}

P:NPC {
  key = "renee", id = TODO_NPC("Innkeeper Renee"), name = "Innkeeper Renee",
  bible = "bibles/tirisfal.md", role = "innkeeper", tier = "service",
  communities = { "brill" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary", "race" },
  impression = {
    first = "Innkeeper Renee looks after everyone in the Gallows' End, and especially the dead ones. She once hurt people for a cause, she says, and now she pours drinks and listens, which seems to suit her far better.",
    third = "{name} met Innkeeper Renee of the Gallows' End, who left a harder life behind to look after Brill's guests, living and dead alike.",
  },

  greetings = {
    { id = "g_inn", text = "Welcome to the Gallows' End! Sit anywhere you like; nobody here bites. Well, nobody here bites guests." },
    { id = "g_home", when = { homeInn = { "Brill", "Gallows' End Tavern" } }, text = "Your room's kept. Don't mind the bats; they pay rent in silence." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you've been through it. Sit down, love, and whatever you need, I'll bring it." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A living guest! We keep food for your sort, and it's fresh, even. Mostly fresh, anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Renee, and I keep the tavern. Somebody has to look after people, even dead ones, and especially dead ones." },
        { id = "h_rogue", when = { questActive = TODO_QUEST("A Rogue's Deal") },
          text = "You're after the deal, are you? Quietly, then, because not every bargain in this town wants an audience." },
      },
      choices = {
        { text = "Why keep an inn, now?", next = "why" },
        { text = "I'm a rogue. Who in Brill should I know?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Just a room, thanks.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, love? Pull your chair in, and mind the bat on the rafter above you." },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Me, love, for a start, and then whoever I say. Keep your voice down in here and your knives in their sheaths, and I'll point you to the right people when you're ready for them." } },
      choices = { { text = "Quietly, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "I spent too long on the other side of things, hurting people for a cause. Now I pour drinks and listen, and it suits me better." } },
      choices = { { text = "It does.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "I know them better than I'd like. Let's leave it there, love." } },
    _none = { { id = "tp_none", text = "I hear everything in this tavern, but not that." } },
  },
}

P:NPC {
  key = "eleanor", id = TODO_NPC("Eleanor Shackleton"), name = "Eleanor Shackleton",
  bible = "bibles/tirisfal.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "composed" }, values = { "curious", "practical" },
  notices = { "craft" },
  impression = {
    first = "Before I could ask, Eleanor Shackleton told me she was not with the Crusade, which only made me wonder why she felt the need. She is a composed traveller and a patient teacher of campfires.",
    third = "{name} met Eleanor Shackleton, a traveller camped on the road near Brill who teaches anyone willing how to make a proper camp.",
  },

  greetings = {
    { id = "g_camp", text = "Good day. Before you ask: no, I'm not with the Crusade. I'm only passing through, on my way to the next stretch of wilderness." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my pupil! The fire's lit, so sit, if you like." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook? Then you can build a proper campfire already, or nearly, and everything else in a camp starts from that." },
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker. You'll want to learn the tent. A good tent near a fire makes a night's rest worth twice as much." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Eleanor Shackleton. I travel, and where I stop, I camp, and if you'd like to learn how, I'm a patient teacher." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "The Executor sent you to look me over, I expect. Look all you like, and then let me show you something useful." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire until you feel rested, properly rested; you'll know it when it comes." },
      },
      choices = {
        { text = "Why camp, when there are inns?", next = "why" },
        { text = "I don't sleep, Eleanor. What's a camp for, then?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm a long way from the Barrens. Any tips for this damp?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Safe travels.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything more? Tirisfal can wait while we talk; it has been waiting for years." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Company, mostly, and a place to set things down. I've shared a fire with a few of your people on this road, and they sit very still and watch the flames, and none of them has ever told me what they see there." } },
      choices = { { text = "Things we used to have.", next = "BACK", fx = { affinity = 2 } } },
    },
    living = {
      lines = { { id = "lv_default", text = "Dry wood off the ground, and plenty of it, because Tirisfal never stops dripping. And sleep with your back to the fire, not to the trees; the things in these woods aren't all as friendly as the Forsaken." } },
      choices = { { text = "Back to the fire. Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Inns are where the roads end. Camps are where they keep going. And anyone passing can share your fire, which is half the point." } },
      choices = { { text = "I'd like to learn.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire first, then whatever your trade can add to it, whether you cook, work leather or fish. A camp is everyone's work." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask someone who lives here, if that's the word." } },
  },
}
