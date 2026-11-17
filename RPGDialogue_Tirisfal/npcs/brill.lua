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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Mend my Deathguard when the Crusade's arrows find them, because a corpse that cannot feel its wounds will walk until it falls apart. Beyond that, I want the zealots to see that faith did not die with Lordaeron, and that it answers to the Dark Lady now." } },
      choices = {
        { text = "I'll keep your Deathguard standing, Executor. That's duty enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My prayers serve me first, Executor, and your soldiers second.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Track them, and bring them down before they reach their camps, because a scout who reports is worth a company to the Crusade. The beasts of the Tirisfal woods have grown fat on Scourge leavings, so mind them as you go." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a good nose, and the Crusade's scouts reek of lamp oil and incense. Set it on their trail and they will not reach the monastery roads." },
      },
      choices = {
        { text = "I'll bring them down cleanly, and bring you their orders.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll let one run, and follow him home to his camp.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The Crusade's scouts creep through the woods north of Brill, and I would rather they were tracked than merely counted." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, then. The Crusade burns priests of every kind but their own, so you'll be high on their lists, and I'd sooner you were high on mine." },
      },
      choices = {
        { text = "What use does the Deathguard have for a priest, Executor?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will the Deathguard fight beside the elements, Executor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there work here for a druid, Executor?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Scarlet Crusade?", next = "crusade" },
        { text = "I held a line once, for Lordaeron. Put me on yours.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can reach their camps unseen, Executor.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I carry the Light, Executor. Does that trouble you?", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "My spells are at the Deathguard's service.", next = "mage", when = { class = "MAGE" } },
        { text = "My demons could break the Crusade's lines, Executor.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Shall I track the Crusade's scouts through the woods, Executor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Then loose them on the Crusade and keep them on a short leash, because the zealots already call us demons and I'd rather not prove them right in front of my soldiers. Rupert Boch in the Gallows' End tells me most of his students survive their lessons, and in Tirisfal I'll take most." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You died a subject of Lordaeron and came back binding demons, which is a stranger road than most of us walked. The Dark Lady has a use for it, so point your imp at Solliden and let the Crusade learn what their sermons are worth." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc warlock in Tirisfal, a long way from the Warchief's frown. The Dark Lady judges by results and so do I, so bring me burned Crusader camps and I'll not ask what did the burning." },
      },
      choices = {
        { text = "I'll loose the imp on their camps at night.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll face the Crusade myself and keep my demon at heel.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Who are the Scarlet Crusade, exactly?", next = "crusade" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We cleared the mindless out of it in the first week and stacked the pews against the windows, and it has been a storehouse ever since. Some of the townsfolk would like it blessed again, though none of them can agree on by whom, and I would rather keep the peace than settle that argument." } },
      choices = {
        { text = "Brill deserves a place to grieve, Magistrate. Give them the chapel back.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A storehouse feeds people. Leave the pews against the windows.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Darkhounds trouble the farms and the duskbats trouble everyone, though the gnolls at the graveyard trouble me most of all. Thin any of them and I'll note it in the town's accounts, which is more thanks than most people get from me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} on the far side of the ledgers, please. Our Darkhounds trouble the outlying farms, and if yours could thin them out, I'd note it in the town's accounts." },
      },
      choices = {
        { text = "Then note it. Brill should know who keeps its roads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your ledger, Magistrate. I hunt for my own reasons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, in my town hall. Do keep your beast off the rugs, {class}; they're the last good ones in Brill." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in my town hall. Brill had a chapel once, before the plague, and I've not yet decided what it ought to be now, so perhaps you have an opinion." },
      },
      choices = {
        { text = "What became of Brill's old chapel, Magistrate?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Brill could use a shaman's totems, Magistrate. Where shall I plant them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to Brill's grove, Magistrate?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Brill needs a sword more than a magistrate, Sevren.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "How did you take Brill?", next = "brill" },
        { text = "I lived near Brill, before.", next = "farmer", when = { race = "Scourge" } },
        { text = "Does Brill need a warlock's help, Magistrate?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Who keeps Brill's secrets, Magistrate?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Does Brill have any use for a mage, Magistrate?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the beasts around Brill trouble the town, Magistrate?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I keep most of them, because a magistrate who doesn't know what his town is whispering won't be magistrate for long. Marion Call trains your sort in the Gallows' End, and she tells me when something matters, which is more than the deathstalkers ever do." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I dealt with cutpurses when Brill still had a harvest fair, and I'll tell you plainly that the Dark Lady's laws are no softer than the king's were. Keep your fingers out of Brill's pockets and in the Crusade's, and we'll get along." },
      },
      choices = {
        { text = "I'll keep my hands to myself in Brill, Magistrate.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Laws are for those too slow to avoid them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How did you take Brill back?", next = "brill" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Brill has a use for anyone who can keep the lamps lit without setting the thatch alight, which is harder than it sounds with Crusade arrows coming over the fields. Cain Firesong teaches in the inn, and I'll thank you to practise anywhere but my square." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran sent apprentices out to test the grain when the plague first came, and a good many of them died on these farms beside the people they meant to help. If you were one of them, you've earned your place in Brill twice over." },
      },
      choices = {
        { text = "I'll keep my spells off your square, Magistrate.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll practise where I like, Magistrate.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How did you take Brill back, Magistrate?", next = "brill" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Whether it can be poisoned, quite simply, because the Scourge bound our souls once and a cure for that would be worth more than any plague. Bring me your thoughts on it, and perhaps a hair or two, and I'll write your name very small in the margin of my notes." } },
      choices = {
        { text = "A cure for binding souls is worth the work. I'll help.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave my soul out of your bottles, Johaan.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Escort my samples, mainly, because the Crusade burns whatever it can't understand, and it understands very little. And if a few of my test subjects should arrive bruised rather than dead, I'd be grateful, since corpses make poor results." } },
      choices = {
        { text = "I'll guard your samples. The Dark Lady needs that plague.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I won't play nursemaid to bottles, Apothecary.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Do stand still, {class}, and keep that blade well away from my bottles, because some of them are only mostly safe." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Splendid, because I have a question about the soul that no apothecary has ever answered to my satisfaction, and you may be just the subject." },
      },
      choices = {
        { text = "What do you want to know about the soul, Apothecary?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The earth here is sick, Apothecary. Do your brews make it worse?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You're growing something in these fields, Apothecary. What is it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "My hunting takes me into the fields. Do you need samples?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What is the plague for?", next = "purpose" },
        { text = "I served the Cult once. I know a plague when I see one.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I studied in Dalaran. Can I help with the formulae?", next = "mage", when = { class = "MAGE" } },
        { text = "Could your bottles do a rogue's work, Apothecary?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is there anything here a warrior could do for you, Apothecary?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Oh, a great many of them could, though I must insist the Society's formulae are meant for the Scourge and the Scourge alone. Still, a careful rogue with a vial and a steady hand could teach us a great deal about the Crusade's constitution, and I would be fascinated by the results." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You'll know already that our bodies shrug off what would kill a living man, which makes you an ideal courier for the Society's more volatile work. Do mind the stoppers all the same; I've lost two assistants that way, and they were dead already." },
      },
      choices = {
        { text = "Poison is a tool, Apothecary. I'll use it where it works.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather settle the Crusade with steel than vials.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What is the plague for, really?", next = "purpose" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I prayed for them every night I stood guard at their mills, and then the plague came in the grain and they asked me to die for them, so I did. I've stopped praying, but I find I still say their names before I sleep, or before I sit still, since I don't sleep anymore." } },
      choices = {
        { text = "Say their names, Coleman. That's a kind of prayer too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They used you. You owe them nothing, not even their names.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If you like, though I'll admit I've a soft spot for them, since they've never once asked me to die for their property. They're lean and quick and they run in pairs out there, so watch the one you're not shooting at." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} looks like it would give a Darkhound a fair fight, which is fairer than the Agamands ever gave us. They run in pairs near the mills, so watch the one you're not shooting at." },
      },
      choices = {
        { text = "I'll hunt them fairly, and let the ones that flee go.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A road's a road, Coleman. I'll clear every last one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, at the Gallows' End! The Darkhounds roam the fields by the Agamand Mills these days, and I'd say they make better neighbours than the Agamands ever did." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the Gallows' End. You may have come too late for the Agamands, I'm afraid, because I prayed for them in life and look how that turned out." },
      },
      choices = {
        { text = "Do you still pray for the Agamands, Coleman?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I ask the spirits about the Agamands, Coleman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shall I let the Agamands' orchard go wild, Coleman?", next = "druid_q", when = { class = "DRUID" } },
        { text = "That's a heavy grudge.", next = "grudge" },
        { text = "I could make the Agamands' rest a short one.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You held the mills like soldiers. I respect that.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Could a mage's fire clear the Agamand Mills?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I could set a demon on the Agamands, Coleman.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Should I hunt the Darkhounds near the mills, Coleman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Fire would clear them, and I won't pretend the thought doesn't warm what's left of me, but the mills are dry as tinder and I bled for those mills. Burn the risen family if you must, and leave the millstones standing; I paid for them with my life." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You were studying magic while I was hauling grain sacks for the Agamands, I expect, and both of us ended up in the same ground. It's a funny sort of fairness, and I mean to enjoy it while it lasts." },
      },
      choices = {
        { text = "I'll burn only what needs burning, Coleman.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the mills burn, they burn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why carry such a heavy grudge?", next = "grudge" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "A demon in the Agamands' parlour would be a sight worth dying twice for, I admit. Only mind it doesn't follow you back to Brill, because the folk here have had enough of masters who smile first and devour after." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "We came back without any choice in it, and now you call things out of the Nether on purpose, though I'll not judge it. The Agamands called me to their mills on purpose too, and you can see how well that ended for all of us." },
      },
      choices = {
        { text = "The demon goes where I send it, and no further.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whatever it eats on the way is its own business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why carry such a heavy grudge, Coleman?", next = "grudge" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd ask it to make me cold again, because I can't feel it warm me and I can't feel the night without it either. The old priest in Brill used to tell us the Light was a fire that never went out, and I sit here hoping some of it is in this hearth after all." } },
      choices = {
        { text = "Some warmth is still in you, Gretchen. Keep sitting by it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light lied to you, Gretchen. Find something truer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, would you? I remember the first frost on Brightwater Lake and the way the reeds went stiff and white, but I can't remember the cold itself anymore. Tell it slowly, dear, and I'll hold my tea and pretend." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} like the cold, dear? Tell me how its breath steams on a frosty morning, because I've forgotten what that looks like, and I'd like to remember." },
      },
      choices = {
        { text = "I'll tell it true, Gretchen, cold and all.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some things are better forgotten, Gretchen. I'll spare you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gretchen Dedmar. I sit in the tavern because it's warm, not because I can feel it; habit is a comfort, even dead." },
        { id = "h_chill", tags = { "news" }, when = { questActive = TODO_QUEST("The Chill of Death") },
          text = "The chill of death never quite leaves you, but I've found a way to keep it at bay for a while, if you'll fetch what I asked for." },
        { id = "h_cup", when = { metBefore = true }, text = "I still order a cup of tea, though I can't taste it, and I hold it until it goes cold. Some habits are worth the coin." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dear? I've heard your sort can call down frost, and I'd give a good deal to feel a shiver again." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, sitting with me by the fire? I'm told your sort can go about in a bear's fur, and I'll wager that's warm." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, dear? Come and sit, and tell me about the cold places you've tracked through, because I'd like to remember what a frost feels like." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You're a priest, aren't you? I can tell by the way you look at the fire, as though you were asking it something." },
      },
      choices = {
        { text = "What would you ask of the fire, Gretchen?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I call the frost for you, Gretchen?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shall I take bear form, Gretchen, so you can touch the fur?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Your fields need guarding, Gretchen. I can swing an axe.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do you miss most?", next = "miss" },
        { text = "Let me try something. A mage's fire is hotter.", next = "mage", when = { class = "MAGE" } },
        { text = "I'm good at going unseen, Gretchen. Does that help?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A demon's fire burns hot, Gretchen. Want to feel it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I've tracked through snow, Gretchen. Shall I tell you about it?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It might, dear, because the Scarlet patrols near my old fields shoot at anything that walks upright and pale. Slip past them quietly and bring back what I asked for, and I'll sit here and pretend I can feel the fire while I wait." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I used to bolt my door against folk like you, back when I had a door and something worth taking. Now I'd almost welcome a thief to worry about, because worrying was such a living sort of feeling." },
      },
      choices = {
        { text = "I'll stay in the shadows and come back quietly.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "If the Crusade stops me, they'll see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What do you miss most, Gretchen?", next = "miss" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "That's kind, but I've sat beside every fire in this tavern and none of them reach me, and I doubt a demon's would be any different. Keep your little friend away from the hearth, please; Renee has only just got the soot off the stones." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I knew a girl from Brill who went off with the Cult and came back talking about the Nether as if it were a sweetheart, and then I never saw her again. You seem steadier than she was, so mind you stay that way." },
      },
      choices = {
        { text = "I'll keep the demon away from the hearth.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The imp sits where it likes, Gretchen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you miss most, Gretchen?", next = "miss" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More often than they ask for drinks, honestly, though they never call it praying. They sit at the bar and tell me who they lost, and I listen, which is what I'd want a priest to do, and I'll leave the shadows and the Light to you." } },
      choices = {
        { text = "Listening is holy work, Renee. You do it well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief keeps them weak. They should let it go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Renee, and I keep the tavern. Somebody has to look after people, even dead ones, and especially dead ones." },
        { id = "h_rogue", when = { questActive = TODO_QUEST("A Rogue's Deal") },
          text = "You're after the deal, are you? Quietly, then, because not every bargain in this town wants an audience." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman under my roof! Sit by the hearth, love, and if the fire starts talking to you, do tell me what it says." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, love? You've got leaves in your fur and I've only just swept, but sit down anyway." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my bar. Sit down, and I'll pour you something you can't taste, and you can tell me who you were praying for when you came in." },
      },
      choices = {
        { text = "Do the dead of Brill ever ask you for prayers, Renee?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the Forsaken mind a shaman's spirits in here, Renee?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there any green left in Tirisfal, Renee?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'm a warrior, Renee. What should a fighter know about Brill?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "May I bring my beast inside, Renee?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Why keep an inn, now?", next = "why" },
        { text = "I'm a rogue. Who in Brill should I know?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do mages drink at the Gallows' End, Renee?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will you serve a warlock under your roof, Renee?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They drink, though most of them complain about it, since nothing tastes of much to the dead and mages like to have opinions. Cain Firesong keeps his students to the back of the room, and I keep a bucket of water by the door in case one of them forgets where he is." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You've a Dalaran look about you, the way you watch the lamps as if you're judging how they were lit. Sit down and have something; whatever you were before, you're one of mine while you're under this roof." },
      },
      choices = {
        { text = "I'll mind the furniture and keep my spells quiet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If a Crusader comes through that door, he burns.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why keep an inn now, Renee?", next = "why" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'll serve anyone who pays and keeps their demons off the tables, and Rupert Boch's students are mostly good about that. I did worse things than summon imps when I was alive, so I'm not about to lecture you." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I served a cause once that told me any means were fine so long as the end was holy, and I hurt people for it. Whatever you call up out of the dark, make sure it's you doing the deciding, because nothing else ever should." },
      },
      choices = {
        { text = "I decide, Renee, and the demon obeys.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power doesn't need anyone's permission, Renee.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why keep an inn now, Renee?", next = "why" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because I knelt in their chapels once, in Lordaeron, before they decided that every grieving face belonged to a spy. I keep my own small prayers now, by the fire and away from them, and I find the habit hard to break and harder to explain." } },
      choices = {
        { text = "Keep your prayers, Eleanor. The Crusade doesn't own them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every Crusader prays too. Your prayers prove nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Back to the fire and face to the dark, and never let the fire grow so bright that you can't see past it. A good camp is a small fort, {class}, and I've watched soldiers forget that the moment they sit down." } },
      choices = {
        { text = "Then I'll take the first watch tonight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather the fire roared, and let whatever comes, come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The deer by Brightwater Lake, if you can stomach them, though I've learned to look closely at the meat first, because the plague shows in the liver. The wolves aren't worth the trouble, but their pelts make a fine bedroll." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a fine camp companion, because nothing creeps up on a fire that a beast can smell first. Feed it from the deer by Brightwater Lake, but look closely at the liver, because the plague shows there." },
      },
      choices = {
        { text = "I take only what I'll eat, and waste nothing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I take what I can carry, and sell the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because the Scarlet Crusade patrols the roads past Brill, and they'd see a warlock's fire from the monastery and come looking. A small fire, well banked and out of the wind, is all you need, and it keeps both of us out of their sight." },
      },
      choices = {
        { text = "Thank you. I'll keep my fires small and hidden.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the Crusade come. I'll be ready for them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, on the Tirisfal road! You'll know how to stand a watch, I expect, and that's half of keeping a good camp." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Then you know the woods better than most who come down this road, and you'll have eaten well, which is more than I can say." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and not one of the Crusade's, I can see that plainly. I'll say it before you ask: neither am I." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You'll know a campfire draws attention, so I'll teach you to build one that doesn't." },
      },
      choices = {
        { text = "Why do you keep telling everyone you're not with the Crusade?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you light your fires with flint, Eleanor, or ask them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why stay in a dead land, Eleanor, when the world is wide?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why camp, when there are inns?", next = "why" },
        { text = "I don't sleep, Eleanor. What's a camp for, then?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm a long way from the Barrens. Any tips for this damp?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "You notice a great deal for a traveller, Eleanor.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could light your fire with a word, Eleanor.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "How does a warrior keep a camp safe, Eleanor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What game is worth taking along this road, Eleanor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why should a warlock learn campfires, Eleanor?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A traveller who doesn't notice things soon stops travelling, and I don't intend to join the Forsaken just yet. I watch the road, the trees and the smoke on the horizon, and I watch the quiet ones like you closest of all." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You walk like someone who was a thief before you died, all soft heels and an eye on the exits. I don't carry anything worth taking, so you may as well sit by the fire and learn something honest." },
      },
      choices = {
        { text = "Fair enough. I'll sit by the fire and learn.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A rogue keeps to the shadows, Eleanor, not the firelight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why camp, when there are inns?", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'm sure you could, but a fire lit by magic teaches you nothing about wet wood and wind, and one day you'll be too tired to cast. Humour me and do it with flint first, and then you may show off as much as you like." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran taught you a dozen ways to start a fire, I'd guess, and none of them involved kneeling in the mud. The mud is where the learning happens, so kneel down here beside me." },
      },
      choices = {
        { text = "Flint first, then. I'll learn it properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll use the spell; that's what it's for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why camp at all, when there are inns?", next = "why" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire first, then whatever your trade can add to it, whether you cook, work leather or fish. A camp is everyone's work." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask someone who lives here, if that's the word." } },
  },
}
