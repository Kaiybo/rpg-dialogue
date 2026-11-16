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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out of the Warchief's lands and into my fields. The Crusade burns anything it can't explain, so they'll aim at you before they aim at me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, in Tirisfal. The Crusade calls us unnatural, and I expect they'll call you the same, in between the arrows." },
      },
      choices = {
        { text = "Will the Deathguard fight beside the elements, Executor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there work here for a druid, Executor?", next = "druid_q", when = { class = "DRUID" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Deathguard will fight beside anything that kills Crusaders, and lightning kills them well enough. Only keep your spirits clear of my lines, because my soldiers have had their fill of voices in their heads." } },
      choices = {
        { text = "I'll fight inside your lines and keep to your orders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements don't take orders, Executor, and neither do I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "There's work for anyone who can stand the smell of the glades. The Crusade camps among the trees at Solliden and along the monastery road, and a bear loose in their camp at night would do more than a dozen of my soldiers at the gate." } },
      choices = {
        { text = "I'll go in at night, as you say, and break their camp.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll fight them in daylight, where they can see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman in my town hall? Do mind the papers, because I've no wish to learn what lightning does to a ledger." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? Brill had a grove once, before the plague, and I've the deeds to it somewhere, though I wouldn't call it a grove now." },
      },
      choices = {
        { text = "Brill could use a shaman's totems, Magistrate. Where shall I plant them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to Brill's grove, Magistrate?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Brill needs a sword more than a magistrate, Sevren.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
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
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Perhaps it does, {class}, but a sword with no ledger behind it is just a brigand with ambitions. Hold the road to the Bulwark and I'll see your name written somewhere that matters." } },
      choices = {
        { text = "Then write my name down. I'll hold the road.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep your ledgers. I fight for the Forsaken, not for paper.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    brill = {
      lines = { { id = "b_default", text = "One street at a time. The Deathguard cleared it; I counted what was left and put it to work. A town needs both sorts." } },
      choices = { { text = "Impressive.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Outside the town limits, if you please, and well clear of the graveyard. I've spent two years teaching Brill to look like a town again, and a ring of totems by the well makes it look like a war camp." } },
      choices = {
        { text = "Outside the limits, then. Brill's order comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Brill is a war camp, Magistrate, whatever your ledgers say.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "The same thing that happened to everything else, I'm afraid: the plague got into the roots, and the trees came up grey. The Deathguard cut half of it for palisades and the apothecaries asked for the rest, so the deeds are worth rather less than the paper." } },
      choices = {
        { text = "Let me tend what's left. Something may still grow there.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The palisades were the better use. The town comes first.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You speak to the elements, I'm told, and I would dearly like to know whether the elements have opinions about what I keep in these bottles." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, how useful! You'll know your herbs better than any errand-runner, and I do hope you won't trample the doom weed." },
      },
      choices = {
        { text = "The earth here is sick, Apothecary. Do your brews make it worse?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You're growing something in these fields, Apothecary. What is it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "My hunting takes me into the fields. Do you need samples?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
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
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "A hunter who brings back what I ask for, intact and unchewed, is worth three of the usual errand-runners. The duskbats and the Darkhound packs both carry things the Royal Apothecaries want catalogued." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Do keep {pet} from chewing on the samples, I beg you. The duskbats and Darkhounds are no use to the Royal Apothecaries with bite marks in them, and I've had to explain that to hunters before." },
      },
      choices = {
        { text = "Write me a list. I'll bring back exactly that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bring what I kill. Sort it yourself.", next = "BACK", fx = { align = { order = -1 } } },
      },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Worse? It was the Scourge's grain that poisoned these fields, and my work is meant to answer it, not add to it. If the earth complains to you about a little runoff, do tell it the Royal Apothecary Society is terribly sorry, and very busy." } },
      choices = {
        { text = "Then answer the Scourge, and let the fields heal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The fields are already lost. Use them as you need.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Reagents, only reagents, for a remedy against the Scourge. The plague-touched earth grows things nowhere else in Lordaeron will, and I'd be a poor apothecary if I let that go to waste, so could you gather a few for me, gently, roots and all?" } },
      choices = {
        { text = "Gently, then, roots and all, for the war on the Scourge.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Not until I know what they're truly for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Gallows' End! Sit down, friend; the ale's thin, but I'm told the spirits are generous, and I mean the other kind." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? The Agamands kept a little orchard behind the manor, and I'd dearly like to see you turn it into brambles out of spite." },
      },
      choices = {
        { text = "Shall I ask the spirits about the Agamands, Coleman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shall I let the Agamands' orchard go wild, Coleman?", next = "druid_q", when = { class = "DRUID" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask them if you like, friend, though the Agamands walk about the mills in their own rotten bodies, which is a good deal more than lingering. If your spirits can tell old Gregor his mill hands are still waiting on their wages, I'd be obliged, though I'd rather he heard it from an axe." } },
      choices = {
        { text = "I'll lay them to rest, and their spirits with them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll make Gregor pay first, and let the spirits wait.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Wild, and thorny, and full of crows, if you please. They kept that orchard better than they ever kept us mill hands, and I stood guard over it the night the Scourge came, while Gregor locked the manor door behind him." } },
      choices = {
        { text = "I'll leave the trees be. They never wronged you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Brambles it is, then. Let the manor choke on them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dear? I've heard your sort can call down frost, and I'd give a good deal to feel a shiver again." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, sitting with me by the fire? I'm told your sort can go about in a bear's fur, and I'll wager that's warm." },
      },
      choices = {
        { text = "Shall I call the frost for you, Gretchen?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shall I take bear form, Gretchen, so you can touch the fur?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Your fields need guarding, Gretchen. I can swing an axe.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
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
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "That's kind of you, though the trouble in my fields mostly comes on six legs and doesn't fear an axe. Still, a warrior standing at the fence does wonders for my nerves." } },
      choices = {
        { text = "Then I'll stand there a while, for your nerves.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll clear the beetles if the work's worth my time.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    miss = {
      lines = {
        { id = "m_warm", text = "Being cold, isn't that strange? I sit by the fire because I remember wanting to, but now I don't feel either. I'd give a great deal to shiver again." },
      },
      choices = { { text = "I'm sorry.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would you? Only a little, dear, by the hearth where nobody will mind. I won't feel it, I expect, but I'd like to see the frost creep over my teacup, and I'd like to pretend for a moment." } },
      choices = {
        { text = "I'll call it gently. Pretending is no sin.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It won't help, Gretchen. Better to let the cold go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Oh, I couldn't feel it, dear, but I'd like to put my hands in it all the same. My father kept a great shaggy dog when I was small, and I'd sit with my hands buried in its coat until the frost went out of my fingers." } },
      choices = {
        { text = "Then put your hands in it, and remember the dog.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Memories won't warm you, Gretchen. Better to let them go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman under my roof! Sit by the hearth, love, and if the fire starts talking to you, do tell me what it says." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, love? You've got leaves in your fur and I've only just swept, but sit down anyway." },
      },
      choices = {
        { text = "Do the Forsaken mind a shaman's spirits in here, Renee?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there any green left in Tirisfal, Renee?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'm a warrior, Renee. What should a fighter know about Brill?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "May I bring my beast inside, Renee?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
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
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Only that the fights worth having are out past the fields, love, against the Scarlets and the Scourge, and not in my tavern. I've seen what a warrior does to furniture, and I'd much rather see it done to them." } },
      choices = {
        { text = "Then I'll take my fights outside, to Brill's enemies.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight where the fight finds me, even in here.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Bring it in, love, so long as it doesn't mind the bats and the bats don't mind it. We've had wolves and cats by the hearth before, and they behaved better than some of my living guests." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? Bring it in by the fire, love, and I'll find it a quiet corner away from the bats. It's got kinder eyes than half the guests I've poured for tonight." },
      },
      choices = {
        { text = "It'll mind its manners, I promise you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It goes where I go, whether the bats like it or not.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some do, love, because the last voice in their heads belonged to the Lich King. Keep your spirits quiet by the bar and nobody will mind them, and if a guest flinches, buy him a drink and let him be." } },
      choices = {
        { text = "I'll keep them quiet. Your guests have suffered enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My spirits aren't the Lich King. Your guests can learn that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Up by Brightwater Lake, love, where the plague didn't settle so thick, and there are still a few apple trees behind the old farms that nobody's burned. I walk up there sometimes, though I can't smell the blossom anymore, because I like to know it's there." } },
      choices = {
        { text = "Then I'll guard those trees from the Crusade's torches.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A few apple trees won't win this war, Renee.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out on the Tirisfal road! You'll know more about fire than I do, I expect, though I'd still like to see how you build one." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, a long way from Mulgore! You'll find Tirisfal's woods sadder than your plains, though I've learned to love them a little." },
      },
      choices = {
        { text = "Do you light your fires with flint, Eleanor, or ask them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why stay in a dead land, Eleanor, when the world is wide?", next = "druid_q", when = { class = "DRUID" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Flint and dry tinder, the way my mother taught me, and I've never once asked a fire's permission. I'd be curious to watch you do it, though, because a fire that comes when it's called would save me a great deal of trouble in this drizzle." } },
      choices = {
        { text = "Fire is a spirit. I ask, and I thank it after.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't ask it. I tell it, and it burns.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Because somebody ought to sit by a fire in it and call it a camp rather than a battlefield. The woods are sick, but they aren't dead, and I've watched a deer drink from Brightwater Lake at dawn as though nobody had told it about the plague." } },
      choices = {
        { text = "Then I'll help them heal, a little at a time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some of it is past healing, Eleanor. I've seen it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire first, then whatever your trade can add to it, whether you cook, work leather or fish. A camp is everyone's work." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask someone who lives here, if that's the word." } },
  },
}
