-- Brill: a human town, a plague town, now the Forsaken's. Voice: bibles/tirisfal.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zygand", id = TODO_NPC("Executor Zygand"), name = "Executor Zygand",
  bible = "bibles/tirisfal.md", role = "soldier", tier = "major",
  communities = { "brill" }, temper = { "cold" }, values = { "loyal", "dutiful" },
  notices = { "kit", "race" },

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
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
      },
    },
    crusade = {
      big = true,
      lines = {
        { id = "c_default", text = "The living who survived the plague and learned only hatred from it. They call us abominations and burn whatever they can't understand. They mistake cruelty for purity." },
      },
      choices = { { text = "Then we'll end them.", next = "END", fx = { affinity = 2, trait = { stern = 1 }, learn = { "scarlet_crusade" } } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Every Crusader we kill is one fewer torch at our door. I keep count." } },
    _none = { { id = "tp_none", text = "Ask the magistrate; administration is his burden, not mine." } },
  },
}

P:NPC {
  key = "sevren", id = TODO_NPC("Magistrate Sevren"), name = "Magistrate Sevren",
  bible = "bibles/tirisfal.md", role = "noble", tier = "quest",
  communities = { "brill" }, temper = { "brisk" }, values = { "orderly", "proud" },
  notices = { "status" },

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
        { text = "I'll see to it.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
      },
    },
    brill = {
      lines = { { id = "b_default", text = "One street at a time. The Deathguard cleared it; I counted what was left and put it to work. A town needs both sorts." } },
      choices = { { text = "Impressive.", next = "END", fx = { affinity = 2 } } },
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
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
      },
    },
    purpose = {
      big = true,
      lines = {
        { id = "f_default", text = "For the Scourge, of course. Who else would deserve it? Don't ask me again; the answer won't change, and I'm busy." },
      },
      choices = {
        { text = "Of course.", next = "END", fx = { affinity = 1 } },
        { text = "That's not quite an answer.", next = "END", fx = { affinity = -1, trait = { skeptical = 1 } } },
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
        { text = "I'll go to the mills.", next = "END", fx = { affinity = 2 } },
      },
    },
    grudge = {
      lines = { { id = "g_default", text = "It's the only thing I carried out of the grave. I find I'd rather not put it down." } },
      choices = { { text = "I understand.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
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
      choices = { { text = "What do you miss most?", next = "miss" }, { text = "I'll be back with it.", next = "END", fx = { affinity = 1 } } },
    },
    miss = {
      lines = {
        { id = "m_warm", text = "Being cold, isn't that strange? I sit by the fire because I remember wanting to, but now I don't feel either. I'd give a great deal to shiver again." },
      },
      choices = { { text = "I'm sorry.", next = "END", fx = { affinity = 2 } } },
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

  greetings = {
    { id = "g_inn", text = "Welcome to the Gallows' End! Sit anywhere you like; nobody here bites. Well, nobody here bites guests." },
    { id = "g_home", when = { homeInn = { "Brill", "Gallows' End Tavern" } }, text = "Your room's kept. Don't mind the bats; they pay rent in silence." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you've been through it. Sit down, love. Whatever you need, I'll bring it." },
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
        { text = "Just a room, thanks.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "I spent too long on the other side of things, hurting people for a cause. Now I pour drinks and listen, and it suits me better." } },
      choices = { { text = "It does.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
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
        { text = "Safe travels.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Inns are where the roads end. Camps are where they keep going. And anyone passing can share your fire, which is half the point." } },
      choices = { { text = "I'd like to learn.", next = "END", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire first, then whatever your trade can add to it, whether you cook, work leather or fish. A camp is everyone's work." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask someone who lives here, if that's the word." } },
  },
}
