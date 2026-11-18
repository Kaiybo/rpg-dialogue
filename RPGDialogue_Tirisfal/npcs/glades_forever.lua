-- Tirisfal Glades (Forever only): the Argent emissary and the waystation by the Undercity road,
-- the Deathguard at Cold Hearth and Venomweb Vale, the zeppelin tower, the Whispering Forest and the Bulwark.
-- Voice: bibles/glades_forever.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Hadric Harlson: a Forsaken of the Argent Dawn, hunting cultists outside the Undercity.
P:NPC {
  key = "tf_hadric", id = TODO_NPC("Hadric Harlson"), name = "Hadric Harlson", title = "The Argent Dawn",
  bible = "bibles/glades_forever.md", role = "questgiver", tier = "quest",
  communities = { "argent_dawn" }, temper = { "steady" }, values = { "dutiful", "devout" },
  notices = { "class", "race" },
  impression = {
    first = "Hadric Harlson wears the Argent Dawn's colours on a Forsaken's body and seems entirely at ease in both. He speaks of the Scourge's living servants with a cold disgust he saves for no one else.",
    third = "{name} met Hadric Harlson of the Argent Dawn, who hunts the Cult of the Damned outside the Undercity on his commander's behalf.",
  },

  greetings = {
    { id = "g_default", text = "Be careful, {class}. There are cultists nearby." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Keep low; the cult has eyes in the grass." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown formidable since you helped me here. The Dawn could use you in the Plaguelands one day, if you ever have the stomach for it." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "One of Danitha's knights, unless I'm much mistaken. My commander will be glad to hear the Keep is sending its people out into the world." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "The Dawn takes anyone who fights the Scourge, living or dead, and I'm glad to see the Horde's living out here doing it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hadric Harlson, of the Argent Dawn. Keep your voice down, {class}, because there are Cult of the Damned skulking around the outskirts of the city, and I want them to hear nothing until we're on them." },
        { id = "h_emissary", tags = { "news" }, when = { questActive = TODO_QUEST("The Argent Emissary") },
          text = "Terrence sent you after me, I suppose, to see what the Argent Dawn is doing poking about Tirisfal unsupervised. Stay low and try not to be seen, {class}; these cultists are not to be trifled with." },
        { id = "h_crystals", when = { questActive = TODO_QUEST("Remnants of War") },
          text = "Don't handle those crystals more than you must. Even shattered and spent, the necrotic magic left in them is dangerous." },
        { id = "h_cult", when = { questActive = TODO_QUEST("The Cult of the Damned") },
          text = "Neophytes and enforcers, eight of each, and don't let them talk to you. The cult is very good at talking." },
        { id = "h_both", tags = { "news" }, when = { questDone = TODO_QUEST("Remnants of War"), questBefore = TODO_QUEST("Bandarion Keep") },
          text = "You've done a great thing for the Dawn's cause here today. My commander and I were bound for Bandarion Keep before we learned of the cult, and if you want to know more of our mission, that's where you'll find him." },
        { id = "h_keep", when = { questActive = TODO_QUEST("Bandarion Keep") },
          text = "Northwest, to Bandarion Keep, and give my commander my regards. I'll stay here and mop up the rest of this mess." },
        { id = "h_keepdone", when = { questDone = TODO_QUEST("Bandarion Keep") },
          text = "You met Leonid, then. He'll have told you what that keep means to him, and I'll only say that he doesn't tell everyone." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly, mind." },
        { id = "h_again2", text = "Ask, then, and keep an eye on the treeline while you do." },
      },
      choices = {
        { text = "Why is the Argent Dawn in Tirisfal?", next = "why" },
        { text = "What are these crystals the cult wants?", next = "crystals" },
        { text = "What do you know of the Cult of the Damned?", next = "cult" },
        { text = "Who is your commander?", next = "leonid" },
        { text = "Are you Forsaken, or Argent Dawn?", next = "both" },
        { text = "Kristof thinks someone is raising Scourge inside our borders.", next = "kristof", when = { any = { { questDone = TODO_QUEST("Patience") }, { questActive = TODO_QUEST("Patience") } } } },
        { text = "I'll keep low. Farewell.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "My commander and I were on our way to Bandarion Keep to meet the paladins there, until we learned the cult was nosing about the city. The Deathguard don't much like us wandering unsupervised, I know, but the cult is everyone's enemy." },
      },
      choices = {
        { text = "Why meet the paladins?", next = "keep" },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    keep = {
      lines = {
        { id = "k_default", text = "That keep was ours once, Dawn's Watch, and we held it against the Scourge's last great push into the glades. When we withdrew to the Plaguelands it fell into ruin, and now Danitha Morr's paladins have taken it in hand, which pleases my commander more than he lets on." },
      },
      choices = {
        { text = "Will the paladins join the Dawn?", next = "merge" },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    merge = {
      big = true,
      lines = {
        { id = "m_default", text = "Not if Danitha has her way. She says her knights are meant to serve the Forsaken first and the wider world second, and I can't fault her for it, though I'd have welcomed them in the Plaguelands. What do you think, {class}?" },
      },
      choices = {
        { text = "She's right. Her knights belong to the Forsaken.", next = "BACK", fx = { align = { order = 1 }, learn = { "argent_dawn" } } },
        { text = "The Scourge threatens everyone. She should join you.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, learn = { "argent_dawn" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    crystals = {
      lines = {
        { id = "c_default", text = "Fragments of the great necrotic focusing crystal that sat atop Naxxramas, when that citadel bore down upon this city to wipe the Forsaken off the map. It shattered in the battle and scattered across these fields, and I suspect that's what the cult is out here gathering." },
      },
      choices = {
        { text = "Naxxramas came here?", next = "naxx" },
        { text = "What can they do with the pieces?", next = "pieces" },
      },
    },
    naxx = {
      lines = {
        { id = "n_default", text = "It wasn't long ago, {class}, and both the Forsaken and the Dawn bled for it that day to secure the Forsaken's future. Leonid fought there, and so did I, and we both have names we don't say anymore." },
        { id = "n_forsaken", when = { race = "Scourge" },
          text = "You'll have risen after, or you'd remember the sky going dark over the ruins. Both the Forsaken and the Dawn lost a great deal that day, and the city you walk into owes its life to people whose names you'll never hear." },
      },
      choices = {
        { text = "What did you lose that day?", tag = "Persuade", next = "lost",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Remnants of War") }, { origin = "forsaken_lordaeron_soldier" } } } },
          fail = { next = "lost_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = {
        { id = "l_default", text = "A squad I'd only just been given, six of them, all newly risen and all sure the Light had forgotten them. I told them it hadn't, and then I watched them hold a gate while the citadel's shadow crossed over us, and none of them stood up again afterward." },
      },
      choices = {
        { text = "They believed you at the end, I think.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'm sorry, Hadric.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lost_no = {
      lines = {
        { id = "ln_default", text = "Enough. Ask me about the cult, {class}; that's a wound I can still do something about." },
      },
      choices = { { text = "Of course.", next = "BACK" } },
    },
    pieces = {
      lines = {
        { id = "p_default", text = "I don't know, and I'm not eager to find out. The denizens of Tirisfal will be pulling those crystals out of the ground for years, I expect, but every piece we take from the cult is one less they can use." },
      },
      choices = {
        { text = "Then I'll gather what I can.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      big = true,
      lines = {
        { id = "cu_default", key = true, text = "I have a special disgust for the living servants of the Scourge. They have the free will to walk away, and the promise of power and immortality has robbed them of their reason and their decency both, and if we don't wish to see Lordaeron's history repeat itself, we must stamp them out wherever they spring up." },
      },
      choices = {
        { text = "No mercy for them. They chose the Scourge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some were desperate. Stop them, but take prisoners where we can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Why do they serve it willingly?", next = "willing" },
      },
    },
    willing = {
      lines = {
        { id = "wi_default", text = "Because Kel'Thuzad promised them they'd never die, and the plague showed them what dying looked like. I was there when the grain went bad in the north, {class}, and I've no sympathy left for anyone who saw that and decided they'd like to be on the winning side." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    leonid = {
      lines = {
        { id = "le_default", text = "Leonid Barthalomew, whom the Dawn calls the Revered, and he hates the title. He treats undeath as an illness that wants treating, and he thinks it makes us better weapons against the Scourge, since there's nothing left in us for the plague to take." },
      },
      choices = {
        { text = "Do you see it the same way?", next = "illness" },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    illness = {
      big = true,
      lines = {
        { id = "il_default", text = "On good days I do. On bad days I think it's simply what I am now, and that there's no cure coming, and I fight anyway. Which do you believe, {class}?" },
      },
      choices = {
        { text = "It's a sickness, and the Light can ease it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's what we are. No cure, and no shame either.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    both = {
      lines = {
        { id = "b_default", text = "Both, and the Deathguard would like me to choose. I swear by the Dark Lady who freed my mind and by the Dawn that gave it something to do, and I haven't yet found those oaths pulling against each other." },
      },
      choices = {
        { text = "May they never pull apart.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kristof = {
      lines = {
        { id = "kr_default", text = "Does he? Then he's sharper than the Executor gives him credit for, because a cult this close to the city could do exactly that. I'll speak with him; tell him the Dawn is listening, and that we'd both be wise to share what we find." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    argent_dawn = { { id = "tp_ad_dawn", text = "We fight the Scourge, and we don't much care who stands beside us while we do it. That includes the dead, which surprises people." } },
    background = { { id = "tp_bg", text = "I was a soldier of Lordaeron, then I was the Scourge's, and now I'm the Dawn's. Only the last was my choice." } },
    advice = { { id = "tp_ad", text = "Never let a cultist finish a sentence. They're trained to make the next one sound reasonable." } },
    _none = { { id = "tp_none", text = "That's no concern of the Dawn's, {class}, and I've cultists to watch." } },
  },
}

-- Deathguard Kristof: the waystation on the road from Brill to the Undercity.
P:NPC {
  key = "tf_kristof", id = TODO_NPC("Deathguard Kristof"), name = "Deathguard Kristof",
  bible = "bibles/glades_forever.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "grim" }, values = { "dutiful", "sharp" },
  notices = { "kit", "class" },
  impression = {
    first = "Deathguard Kristof watches the Undercity road with the patience of someone who has already worked out that the danger is coming from somewhere else. He is grim and thoughtful and does not like being told he is wrong.",
    third = "{name} met Deathguard Kristof at the waystation southeast of Brill, who suspects the Scourge in Tirisfal are being made inside the Forsaken's own borders.",
  },

  greetings = {
    { id = "g_default", text = "There is no escape, even in death. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; I've been pulling on that thread, and I may need a willing blade." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since I first saw you on this road. Good, because what's coming will need hard people." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces. Brill has a smith; use him before the Scourge finishes the job." },
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "A paladin. I'd heard Billmuth was telling stories about your kind, and I'll reserve judgment until I've seen you fight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Kristof. I keep the waystation on the Undercity road, and I give directions to those who need them, though lately I've been watching for something other than lost travellers." },
        { id = "h_patience", tags = { "news" }, when = { questActive = TODO_QUEST("Patience") },
          text = "Zygand wants my report? Then take it, and please see that he reads it at once, because I fear our Scourge problem has only just begun. Come back to me in due time, too; I believe I've nearly uncovered something I could use a willing blade for." },
        { id = "h_discipline", when = { questActive = TODO_QUEST("Discipline") },
          text = "I see the Executor's given you his motivator. Go on, then, if you must; there is no escape, even in death, and it may as well be your hand as his." },
        { id = "h_wrath", tags = { "news" }, when = { questBefore = TODO_QUEST("The Wrath of Rath'mael"), minLevel = 15 },
          text = "Reports have come in from the Lordamere Overlook, deep in the Ruins of Lordaeron. An unholy fog has taken the streets and the graveyard up there, and my scouts say it's being conjured by a necromancer named Rath'mael." },
        { id = "h_wrathact", when = { questActive = TODO_QUEST("The Wrath of Rath'mael") },
          text = "Has the skeletal lieutenant been slain? Bring allies if you have them, because Rath'mael won't fall to one blade." },
        { id = "h_wrathdone", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Wrath of Rath'mael"), days = 3 } },
          text = "Rath'mael is gone, and the fog over the ruins is already thinning. Something of his kind will take his place, I have no doubt, but we can hope their ranks thin in the meantime." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Wrath of Rath'mael"), days = 7 } },
          text = "The ruins have been quiet since Rath'mael fell, too quiet for my liking. I keep wondering who he was taking his orders from." },
      },
      again = {
        { id = "h_again", text = "What else? The road won't watch itself." },
        { id = "h_again2", text = "Ask, then, and quickly." },
      },
      choices = {
        { text = "What did your report say?", next = "report" },
        { text = "Tell me about Rath'mael.", next = "rathmael", when = { minLevel = 15 } },
        { text = "What do you make of Zygand's discipline?", next = "discipline" },
        { text = "What's at the Ruins of Lordaeron?", next = "ruins" },
        { text = "There's an Argent Dawn emissary just down the road.", next = "hadric" },
        { text = "I'm looking for Edward Heartweaver.", next = "edward", when = { questActive = TODO_QUEST("A Frightened Request") } },
        { text = "\"No escape, even in death.\" What does that mean?", next = "motto", when = { metBefore = true } },
        { text = "Who else has seen these new Scourge?", next = "riptear", when = { any = { { questActive = TODO_QUEST("Rear Guard Patrol") }, { questDone = TODO_QUEST("Rear Guard Patrol") } } } },
        { text = "Which way to the Undercity?", next = "directions" },
        { text = "Farewell, Deathguard.", next = "END" },
      },
    },
    report = {
      lines = {
        { id = "r_default", key = true, text = "That the Scourge we see this far inland aren't slipping past our defenses. I've watched our forces at the Bulwark and the eastern waystation for some time, and it would take an army to break through them, so I think these new Scourge are being made here, inside our borders, by some enemy we haven't yet seen." },
      },
      choices = {
        { text = "Dillinger says the walls are failing.", next = "dillinger" },
        { text = "Will Zygand listen?", next = "zygand" },
        { text = "Who could be making them?", next = "who" },
      },
    },
    motto = {
      lines = {
        { id = "mo_default", text = "It means what it says. The Scourge took us once and the Dark Lady took us back, and neither of them asked; there's no hiding from your duty in the grave, because the grave gives you back. I find it steadies me, and others find it the bleakest thing they've ever heard." },
      },
      choices = {
        { text = "I find it steadying too.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "It's bleak, Kristof.", next = "BACK" },
      },
    },
    riptear = {
      lines = {
        { id = "rt_default", text = "Linnea, at the rear guard, had a rogue abomination wandering near Venomweb Vale, and she kept it quiet, as she should. Abominations don't stroll past the Bulwark unnoticed, {name}, so somebody stitched that thing together on our side of the wall, and that's my whole case in one corpse." },
        { id = "rt_done", when = { questDone = TODO_QUEST("Rear Guard Patrol") },
          text = "You put down Linnea's abomination, I hear, and good riddance. But think on it: that thing didn't stroll past the Bulwark unnoticed, so somebody stitched it together on our side of the wall, and that's my whole case in one corpse." },
      },
      choices = {
        { text = "Then we find whoever's stitching.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dillinger = {
      big = true,
      lines = {
        { id = "d_default", text = "Dillinger says a great many things, most of them in writing and all of them demanding reinforcements. He's not a fool, but he sees a corpse on the road and assumes it walked in through the front door. Which of us do you believe?" },
      },
      choices = {
        { text = "Dillinger. Trust the walls' reports, not hunches.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You. Something here is working against us.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zygand = {
      lines = {
        { id = "zy_default", text = "The Executor listens to everything and believes nothing until it's been proven twice. His patience ran out on our reports, which is fair, because mine ran out on his instructions some time ago, but he reads every word, and few commanders bother." },
      },
      choices = {
        { text = "Then give him proof.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Someone who knows necromancy and doesn't mind the smell. A rogue abomination was seen wandering near Venomweb Vale not long ago, and abominations don't slip through the Bulwark unnoticed; someone stitched that thing together on this side of the wall." },
      },
      choices = {
        { text = "The cult, perhaps?", next = "hadric" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hadric = {
      lines = {
        { id = "ha_default", text = "Hadric Harlson, yes, one of ours who went over to the Dawn. Terrence doesn't trust him out of sight, but I've watched him, and he kills cultists with the kind of care you only see in someone who hates them personally." },
        { id = "ha_cult", when = { questDone = TODO_QUEST("The Cult of the Damned") },
          text = "Hadric and his cultists, yes. You helped him clear them, I hear, and if the Cult of the Damned is this close to the city, it explains the lights I've been seeing in the woods. Perhaps I should speak to the man." },
      },
      choices = {
        { text = "You should. You're both after the same enemy.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    rathmael = {
      lines = {
        { id = "ra_default", text = "A necromancer, newly risen in the Scourge's ranks up in the ruins, and he's conjuring a fog thick enough to hide his creatures in the streets and the graveyard. We don't have the luxury of waiting this one out, {name}." },
      },
      choices = {
        { text = "Is he the one making the new Scourge?", next = "rathmael2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rathmael2 = {
      lines = {
        { id = "r2_default", text = "Perhaps, and perhaps he's only one hand of something larger. Kill him and we'll find out, because if the new Scourge stop appearing, I was right, and if they don't, I'll need to keep pulling on this thread." },
      },
      choices = {
        { text = "Then I'll kill him and we'll see.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = {
        { id = "ru_default", text = "The old capital, or what Arthas left of it, sitting on top of the Dark Lady's city like a lid. Most of us walk past it every day and don't look up, and the Scourge have been counting on that." },
        { id = "ru_forsaken", when = { race = "Scourge" },
          text = "Home, once, for most of us, whether we remember it or not. I walk past it every day and don't look up, and I think the Scourge have been counting on that." },
      },
      choices = {
        { text = "Then it's time someone looked.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    discipline = {
      big = true,
      lines = {
        { id = "di_default", text = "Zygand hands that motivator to every stranger who'll carry it, and half my fellow Deathguard thank him for the pain. I've said it before: there is no escape, even in death, and I'm not certain he means that as a comfort." },
      },
      choices = {
        { text = "A little pain keeps soldiers sharp. He's right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Beating your own soldiers wins nothing.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    edward = {
      lines = {
        { id = "e_default", text = "The man from the Sepulcher who walks up to the graveyard in the ruins every week? I've waved him past more times than I can count, and I told him it was madness with that fog up there. He went up some days ago, and I haven't seen him come down." },
      },
      choices = {
        { text = "Then I'll go up after him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    directions = {
      lines = {
        { id = "dr_default", text = "Follow this road to the ruins and go down through the throne room; you'll find the Undercity beneath. Brill is back the way you came, to the northwest, and the Bulwark lies far to the east, if you've a reason to go there." },
      },
      choices = {
        { text = "Thank you.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I served, I died, I serve. The middle part I don't discuss." } },
    advice = { { id = "tp_ad", text = "When the reports don't add up, believe your own eyes before the reports." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask in Brill." } },
  },
}

-- Deathguard Lizabetha: the bridge at Cold Hearth Manor.
P:NPC {
  key = "tf_lizabetha", id = TODO_NPC("Deathguard Lizabetha"), name = "Deathguard Lizabetha",
  bible = "bibles/glades_forever.md", role = "guard", tier = "service",
  communities = { "brill" }, temper = { "clipped" }, values = { "dutiful", "practical" },
  notices = { "kit" },
  impression = {
    first = "Deathguard Lizabetha keeps the bridge at Cold Hearth Manor and seems to regard the whole posting as a test of her patience. She gives directions crisply and complaints even more crisply.",
    third = "{name} met Deathguard Lizabetha, who guards the bridge by Cold Hearth Manor south of Brill.",
  },

  greetings = {
    { id = "g_default", text = "Keep moving, unless you need directions." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still lost?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the manor, haven't you? It shows. Get to Brill and get that mended." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Lizabetha. I watch this bridge, and I tell people the way to Brill, which they could find for themselves if they looked up from their boots." },
        { id = "h_motivate", when = { questActive = TODO_QUEST("Discipline") },
          text = "Don't you dare. I've been standing on this bridge since before dawn, and I've done nothing to deserve that thing, whatever the Executor's ledger says." },
        { id = "h_motivated", when = { questDone = TODO_QUEST("Discipline") },
          text = "I'll have you know I've doubled my efforts since your last visit. Not that anyone noticed." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm on duty." },
      },
      choices = {
        { text = "Why guard a bridge out here?", next = "post" },
        { text = "What's at Cold Hearth Manor?", next = "manor" },
        { text = "What do you think of the Executor's motivator?", next = "motivator" },
        { text = "Which way to Brill?", next = "directions" },
        { text = "What's the life of a Deathguard like?", next = "life" },
        { text = "Goodbye.", next = "END" },
      },
    },
    post = {
      lines = {
        { id = "p_default", text = "Because whatever comes out of that manor has to cross somewhere, and better here than in Brill's square. It's a dull posting, which is exactly how I like it, and the day it stops being dull you'll hear me shouting from the town hall." },
      },
      choices = {
        { text = "I'll listen for you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    manor = {
      lines = {
        { id = "m_default", text = "A family home, once, before the plague came through, and now it's a ruin full of things that used to be the family. I don't go in, and I'd advise you not to either, unless you've been asked to." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    life = {
      lines = {
        { id = "lf_default", text = "Standing, mostly, and not complaining where the Executor can hear. We don't sleep and we don't eat, so the Dark Lady gets every hour of standing out of each of us, and we're expected to be grateful, and on the whole I am." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    motivator = {
      big = true,
      lines = {
        { id = "mo_default", text = "Most of my fellows thank him for it and ask for another. I suppose pain is one of the few delights left to us, but I've always thought a guard who does her job shouldn't need a stranger hitting her with a stick." },
      },
      choices = {
        { text = "Discipline keeps the Deathguard strong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. You've earned better than a stick.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    directions = {
      lines = {
        { id = "d_default", text = "Brill is just north, up the road; you'll see the tower over the trees. The Undercity is east of Brill, beneath the ruins, and Deathknell is far to the west, if you've somehow got turned around." },
      },
      choices = { { text = "Thank you.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Deathguard on a bridge. That's all the background I have time for." } },
    advice = { { id = "tp_ad", text = "Look up from your boots once in a while. The roads are marked for a reason." } },
    _none = { { id = "tp_none", text = "Ask someone in Brill. I'm only the bridge." } },
  },
}

-- Deathguard Falgan: left for dead in Venomweb Vale, raised by a Forsaken paladin.
P:NPC {
  key = "tf_falgan", id = TODO_NPC("Deathguard Falgan"), name = "Deathguard Falgan",
  bible = "bibles/glades_forever.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "wry" }, values = { "loyal", "brave" },
  notices = { "class", "kit" },
  impression = {
    first = "Deathguard Falgan stayed behind so his friend could run, and he seems more embarrassed than proud of it. He speaks of the Symbol of Life with a wistfulness that belongs to an older Lordaeron.",
    third = "{name} met Deathguard Falgan in Venomweb Vale, who held off the Scarlet Crusade so his friend Billmuth could escape.",
  },

  greetings = {
    { id = "g_default", text = "Keep your head down. The Scarlets' camp is just over the rise." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I'm still here, and I'm still breathing, in a manner of speaking." },
  },

  notice = {
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "A paladin of our own. A year ago I'd have thought that was a joke, and now I owe my second life to one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Falgan, scout for the Deathguard, or I was until the Scarlets found me. Keep low; their camp is over that rise, and the spiders in this vale are nearly as bad." },
        { id = "h_raised", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Lesson in Divinity"), days = 2 }, class = "PALADIN" },
          text = "Thank you, stranger. I'd never have expected a paladin to do such a thing for me, and I'm in your debt for as long as this body holds together." },
        { id = "h_plans", when = { questActive = TODO_QUEST("A Lesson in Divinity"), class = "PALADIN" },
          text = "Their friars and zealots carry satchels with their deployment orders. Bring a copy to Billmuth, and he'll take it from there, so we can warn the Deathguard and set an ambush of our own." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly." },
      },
      choices = {
        { text = "What happened to you here?", next = "what" },
        { text = "You've seen a Symbol of Life before?", next = "symbol", when = { class = "PALADIN" } },
        { text = "What are the Scarlets planning?", next = "plans" },
        { text = "How do you feel about paladins now?", next = "paladins" },
        { text = "What is this place?", next = "vale" },
        { text = "Is Billmuth all right?", next = "billmuth" },
        { text = "Stay safe, Falgan.", next = "END" },
      },
    },
    what = {
      lines = {
        { id = "w_default", text = "Billmuth and I were sent to scout the Scarlets in Venomweb Vale, and we got close enough to hear them talking about an attack on Brill. Then Billmuth stepped on a twig, the whole camp came running, and I told him to run." },
      },
      choices = {
        { text = "And you didn't.", next = "stayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    billmuth = {
      lines = {
        { id = "bm_default", text = "He made it back, which is the whole point of telling a man to run. He went to the priests for help and they turned him away, so he went to the paladins at Bandarion Keep instead, and I'll never let him forget that he was brave enough to ask." },
      },
      choices = {
        { text = "What will you do now?", next = "now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    now = {
      lines = {
        { id = "nw_default", text = "Get back on my feet properly, then back to Brill, and then I suppose I'll stand somewhere the Scarlets are coming and remind them I don't stay dead. I'll buy Billmuth a drink he can't taste, too, because he's earned it." },
      },
      choices = {
        { text = "He'll appreciate it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed = {
      big = true,
      lines = {
        { id = "s_default", text = "Somebody had to slow them down, and Billmuth is a better runner than a fighter, bless him. I'd do it again, though I'd prefer to pick a spot with fewer spiders. Would you have stayed?" },
      },
      choices = {
        { text = "Yes. You don't leave a friend behind.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No. One dead scout is better than two.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    symbol = {
      lines = {
        { id = "sy_default", text = "Not since before the war, when Lordaeron was a very different place. The priests in my village carried them for the dying, and I never thought I'd see one held over me, least of all by one of us." },
      },
      choices = {
        { text = "The Light still answers us.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      lines = {
        { id = "pl_default", text = "An attack on Brill, that's all we heard before the twig. Their satchels will have the rest, and if we can get our hands on their orders, we can be waiting for them instead of the other way round." },
        { id = "pl_known", when = { questDone = TODO_QUEST("A Lesson in Divinity"), class = "PALADIN" },
          text = "A raid before dawn, fire on the zeppelin tower to draw off the guards, and the main force from the north, with the Magistrate and the townsfolk as their targets. Thanks to you, Billmuth's commander knows all of it, and the Scarlets will get the welcome they deserve." },
      },
      choices = {
        { text = "Then Brill will be ready.", next = "BACK", fx = { affinity = 1, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    paladins = {
      big = true,
      lines = {
        { id = "pa_default", text = "Plenty of our people mistrust paladins, and I was one of them. Billmuth went to the priests for help and they turned him away, and it was the knights at Bandarion Keep who came, so I've had to think again about a few things." },
      },
      choices = {
        { text = "Good. They've earned a second look.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "One good deed doesn't make the Light trustworthy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "cp_default", text = "Their encampment sits at the north end of the vale, friars and zealots mostly, with darkhounds on leashes, and a lieutenant who runs it like a monastery. They pray loudly in the mornings, which is how Billmuth and I found them, and why I'll never trust a hymn again." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    vale = {
      lines = {
        { id = "v_default", text = "Venomweb Vale. It was good hunting country once, all deer and rabbits, and now it's spiders the size of carts and a Scarlet camp in the north end. The Scarlet Monastery is just beyond, so they're thick on the ground." },
      },
      choices = {
        { text = "Tell me about the Scarlet camp.", next = "camp" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_monastery" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Village lad, then a soldier, then a corpse, then a Deathguard, and now a corpse again, briefly. I've had a busy few years." } },
    advice = { { id = "tp_ad", text = "Look where you put your feet. Billmuth will tell you why." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Billmuth; he'll worry about it for both of us." } },
  },
}

-- Deyrek Duke: a Forsaken by the zeppelin tower southeast of Brill.
P:NPC {
  key = "tf_deyrek", id = TODO_NPC("Deyrek Duke"), name = "Deyrek Duke",
  bible = "bibles/glades_forever.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "dry" }, values = { "curious", "practical" },
  notices = { "race", "travel" },
  impression = {
    first = "Deyrek Duke spends his days at the foot of the zeppelin tower, watching the goblin airships come and go with a connoisseur's eye. He has opinions about every pilot and most of the passengers.",
    third = "{name} met Deyrek Duke beside the zeppelin tower southeast of Brill, who watches the airships come and go.",
  },

  greetings = {
    { id = "g_default", text = "Waiting for the zeppelin? It'll be late. It's always late." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The zeppelin still isn't here, in case you wondered." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Fresh off the ship from Durotar, by the look of you. Don't worry; the ground stops swaying in an hour or so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deyrek Duke. I watch the zeppelins, since somebody ought to, and the goblins certainly won't. One goes to Durotar and one to Grom'gol in Stranglethorn, and neither of them keeps to the timetable." },
        { id = "h_fire", tags = { "news" }, when = { questDone = TODO_QUEST("A Lesson in Divinity") },
          text = "I hear the Scarlets meant to set this tower alight to draw off Brill's guards. I'd have seen them coming, of course, but I'm glad somebody read their orders first." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing but time until the next ship." },
      },
      choices = {
        { text = "Why watch the zeppelins?", next = "why" },
        { text = "What do you make of the goblins?", next = "goblins" },
        { text = "What do you think of our new allies?", next = "allies" },
        { text = "Who are the strangest passengers you've seen?", next = "passengers" },
        { text = "The Scarlets meant to burn this tower?", next = "fire", when = { questDone = TODO_QUEST("A Lesson in Divinity") } },
        { text = "Goodbye, Deyrek.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because everything that comes into Tirisfal that isn't dead or Scarlet comes through this tower now. Orcs, trolls, goblins, crates of who knows what, and the odd tauren looking green about the horns, and I like to see the world arrive, since I don't much fancy going out to meet it." },
      },
      choices = {
        { text = "I can see the appeal. Something else.", next = "BACK" },
        { text = "You should ride one sometime.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    passengers = {
      lines = {
        { id = "ps_default", text = "A tauren who got off, looked at Tirisfal, and got straight back on again, which I thought showed great wisdom. And a troll who wanted to know where the beach was, and wouldn't believe me when I told him Lordaeron's beaches are mostly murlocs." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fire = {
      lines = {
        { id = "fi_default", text = "As a distraction, so I hear, to draw the guards off while their main force came in from the north. I'd have seen them coming, I tell everyone, though between us I'd have been watching the sky for zeppelins and not the road for Scarlets." },
      },
      choices = {
        { text = "Then it's as well we read their orders.", next = "BACK", fx = { affinity = 1, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = {
        { id = "g_default", text = "They'll fly anyone anywhere for coin, and they'll tell you the airship's perfectly safe while they're patching the balloon. I respect a people who can lie that cheerfully, though I'd never get on one of their machines." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    allies = {
      big = true,
      lines = {
        { id = "a_default", text = "The orcs and the trolls? They're loud and they eat enough for a garrison, and they look at us as if we might fall apart at any moment, which is fair. Some in Brill say the Dark Lady only made this alliance because she needed bodies on her walls, and I'd like to know what you think." },
      },
      choices = {
        { text = "The Horde stands together. The alliance is real.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's a bargain. We use them, and they use us.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm from round here, and I'm staying round here. That's my story, and the zeppelin's late." } },
    advice = { { id = "tp_ad", text = "Hold on to something when the zeppelin docks. The goblins call it a landing; I'd call it an accident they've rehearsed." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask someone coming off the zeppelin; they've seen more than I have." } },
  },
}

-- Relreo Emberlight: a cottage in the Whispering Forest, and his dog Max.
P:NPC {
  key = "tf_relreo", id = TODO_NPC("Relreo Emberlight"), name = "Relreo Emberlight",
  bible = "bibles/glades_forever.md", role = "citizen", tier = "service",
  communities = { "whispering_forest" }, temper = { "gentle" }, values = { "kind", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Relreo Emberlight lives quietly in a cottage in the Whispering Forest with a dog called Max, who is very much alive. He seems content in a way few Forsaken manage.",
    third = "{name} met Relreo Emberlight in the Whispering Forest, who lives in a cottage with his dog Max and walks him up to Bandarion Keep.",
  },

  greetings = {
    { id = "g_default", text = "Hello there. Mind Max; he'll want to sniff you." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Max remembers you, I think; look at that tail." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, and you've brought a friend for Max! Let them sniff each other, {pet} won't mind, and Max has better manners than I do." },
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "One of the knights from the Keep. Max and I walk up there most days, and they always find a scrap for him." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Relreo Emberlight, and this is Max. We keep the cottage, and we walk up to Bandarion Keep when the weather's fair, and when it isn't, for that matter, because Max doesn't believe in weather." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, in the Whispering Forest! You'll have heard the faerie dragons singing by the mushroom ring, I hope, because I've never been able to explain it to anyone who hasn't." },
      },
      again = {
        { id = "h_again", text = "What else? Max is patient, and so am I." },
      },
      choices = {
        { text = "A living dog, with a Forsaken?", next = "max" },
        { text = "Why walk up to the Keep?", next = "keep" },
        { text = "What's in the Whispering Forest?", next = "forest" },
        { text = "How did you come to live out here?", next = "cottage" },
        { text = "Goodbye, Relreo. Goodbye, Max.", next = "END" },
      },
    },
    max = {
      big = true,
      lines = {
        { id = "m_default", text = "He found me, not long after I came out here, and he never seemed to notice I was dead. People in Brill told me a corpse has no business keeping a living dog, but he's fed and warm and happy, so I can't see who's being harmed." },
      },
      choices = {
        { text = "He chose you. That's a kind of blessing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dog's a guard. Sentiment doesn't come into it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cottage = {
      lines = {
        { id = "co_default", text = "I wanted somewhere quiet, away from the apothecaries and the Executor's ledger, and nobody else wanted a cottage this far from Brill. Max came with it, more or less, and the paladins came after, and I find I've ended up with neighbours after all." },
      },
      choices = {
        { text = "Good neighbours, it sounds like.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = {
        { id = "k_default", text = "The paladins are good company, and they like Max, and I like being near them; it's warm, somehow, near the Keep. They've had trouble lately with the Vile Fin murlocs on the bluffs and by the lake, so I keep Max on a short lead going past the water." },
      },
      choices = {
        { text = "Warm, you said?", next = "warm" },
        { text = "What do the paladins make of Max?", next = "maxkeep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maxkeep = {
      lines = {
        { id = "mk_default", text = "They spoil him dreadfully. Breton keeps a bone by the gate for him, and Danitha pretends not to notice, and I've seen grown knights who can't hold the Light without wincing kneel down in the mud to scratch his ears." },
      },
      choices = {
        { text = "Max has good taste in friends.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warm = {
      lines = {
        { id = "w_default", text = "I don't know how else to put it. I'm not one of them, and the Light doesn't come when I call, but standing near the Keep feels like standing near a hearth on a cold night, and I find I don't want to stop going." },
      },
      choices = {
        { text = "Perhaps it's calling you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest = {
      lines = {
        { id = "f_default", text = "Deer and stags, mostly, sickly as everything in Tirisfal is, and the odd bear. And in the middle there's a ring of great mushrooms where the little faerie dragons come and sing, and the deer all gather to watch, and I take Max there sometimes so he can watch with them." },
      },
      choices = {
        { text = "That sounds lovely.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've a cottage and a dog, and most of us came back to neither. I don't go looking for the rest." } },
    advice = { { id = "tp_ad", text = "Find something that's glad to see you. It makes the long nights shorter." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Max might, but he's not telling." } },
  },
}

-- Adelbert Edmunds and Rickard Hardee: two old watchmen at the Bulwark.
P:NPC {
  key = "tf_adelbert", id = TODO_NPC("Adelbert Edmunds"), name = "Adelbert Edmunds",
  bible = "bibles/glades_forever.md", role = "soldier", tier = "service",
  communities = { "bulwark" }, temper = { "gruff" }, values = { "dutiful", "stubborn" },
  notices = { "kit", "race" },
  impression = {
    first = "Adelbert Edmunds stands his watch at the Bulwark beside Rickard Hardee, and the two of them argue as if they had been doing it for fifty years. He is gruff and certain and quietly fond of his friend.",
    third = "{name} met Adelbert Edmunds at the Bulwark, an old watchman who keeps his post beside Rickard Hardee.",
  },

  greetings = {
    { id = "g_default", text = "Eyes east, {class}. That's where the trouble comes from." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the wall? Rickard said you'd be back. Don't tell him he was right." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been over the wall, by the look of that armor. Get it mended before you go back; the plague doesn't care how brave you are." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Adelbert Edmunds, and that's Rickard beside me, who'll tell you he does the watching while I do the talking. Don't believe him; he only has the one good eye." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of the living, out at the Bulwark. Keep a cloth over your mouth when the wind blows from the east; whatever's over there doesn't need to breathe, and you do." },
      },
      again = {
        { id = "h_again", text = "What else? Rickard's watching the road, so I've time." },
      },
      choices = {
        { text = "What's the Bulwark like?", next = "wall" },
        { text = "Have you known Rickard long?", next = "rickard" },
        { text = "What's out there to the east?", next = "east" },
        { text = "Is Rickard's eye a problem on watch?", next = "eye" },
        { text = "Goodbye, Adelbert.", next = "END" },
      },
    },
    wall = {
      lines = {
        { id = "w_default", text = "Quieter than it was. The plaguemist used to sit on this place like a wet blanket, all yellow and grey, and since the work in the Plaguelands began, it's thinned. I don't trust it, mind, because I've never known the Scourge to give up anything for free." },
      },
      choices = {
        { text = "Who holds the Bulwark?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = {
        { id = "h2_default", text = "High Executor Derrington, and the Argent Dawn alongside him, more's the pity or more's the blessing depending on who you ask. This was Uther's camp once, for the folk who got out of the capital when it fell, and I like to think we're keeping it for the same reason." },
      },
      choices = {
        { text = "That's a good reason.", next = "BACK", fx = { affinity = 1, learn = { "argent_dawn" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    rickard = {
      lines = {
        { id = "r_default", text = "Long enough to know he snores, if the dead can be said to snore. He'll tell you he lost that eye to a ghoul, and I'll tell you he walked into a door, and the truth is somewhere between us and not worth finding." },
      },
      choices = {
        { text = "I'll ask him myself.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye = {
      lines = {
        { id = "ey_default", text = "Not a bit of it, and don't tell him I said so. He sees things on that ridge that I miss with two good eyes, because he's learned to look properly, and I've only ever learned to look." },
      },
      choices = {
        { text = "I won't tell him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    east = {
      big = true,
      lines = {
        { id = "e_default", text = "The Western Plaguelands, and Andorhal, and more Scourge than there are stones in this wall. Some of the young ones want to march east and finish it, and I say a wall that holds is worth more than an army that doesn't come back. Where do you stand?" },
      },
      choices = {
        { text = "Hold the wall. Patience wins this.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take the fight to them. Walls only delay.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stood a wall in life and I stand one now. I'm good at it, so I'll keep doing it." } },
    advice = { { id = "tp_ad", text = "Never turn your back to the east. Rickard learned that the hard way, whatever he tells you." } },
    _none = { { id = "tp_none", text = "Ask Rickard. He's the one who sees things, he says." } },
  },
}

P:NPC {
  key = "tf_rickard", id = TODO_NPC("Rickard Hardee"), name = "Rickard Hardee",
  bible = "bibles/glades_forever.md", role = "soldier", tier = "service",
  communities = { "bulwark" }, temper = { "wry" }, values = { "loyal", "patient" },
  notices = { "stealth", "class" },
  impression = {
    first = "Rickard Hardee keeps watch at the Bulwark with one good eye and a great deal of patience, mostly spent on Adelbert. He sees more than his friend gives him credit for.",
    third = "{name} met Rickard Hardee at the Bulwark, a half-blind watchman who stands his post beside Adelbert Edmunds.",
  },

  greetings = {
    { id = "g_default", text = "Come round to my left side, would you? That's the one that works." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I'd know that walk anywhere, even with one eye." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You can come out of the shadows, friend. One eye or not, I've been watching shadows on this wall for longer than you've been sneaking." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll have better eyes than mine, then, so tell me if you see anything moving out past the ridge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rickard Hardee. Adelbert does the talking, he says, and I do the watching, which is a fine joke from a man with two eyes who never uses either." },
      },
      again = {
        { id = "h_again", text = "Something else? Stay on my good side." },
      },
      choices = {
        { text = "What happened to your eye?", next = "eye" },
        { text = "What do you watch for?", next = "watch" },
        { text = "Adelbert says you walked into a door.", next = "door", when = { heardLine = "tf_adelbert.h_default" } },
        { text = "What's Adelbert like?", next = "adelbert" },
        { text = "Goodbye, Rickard.", next = "END" },
      },
    },
    eye = {
      lines = {
        { id = "e_default", text = "Lost it, and I won't say how, because the true story is less impressive than the ones I tell at the inn. The other one sees well enough, and it's had more practice since." },
      },
      choices = {
        { text = "Then I won't ask again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "w_default", text = "Movement on the ridge, mostly, and the way the crows fly. The Scourge don't sneak, not the mindless ones, but the cult does, and crows can't abide a necromancer." },
      },
      choices = {
        { text = "I'll watch the crows too.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Crows can't abide a necromancer?", next = "crows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    adelbert = {
      lines = {
        { id = "ad_default", text = "Loud, stubborn, certain of everything, and the best man I've ever stood a wall beside. We've been arguing since before either of us died, and I expect we'll keep it up until the Scourge gets bored and goes home." },
      },
      choices = {
        { text = "That's a fine friendship.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crows = {
      lines = {
        { id = "cr_default", text = "Not one I've ever seen. When the cult moves along the ridge the crows go up all at once and circle and won't come down, and the mindless dead don't bother them at all. Learned that my first winter here, and it's never once been wrong." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    door = {
      big = true,
      lines = {
        { id = "d_default", text = "He would, the old goat, and he'll tell you that one every day until the wall falls. Let him; it's the only joke he has, and I'd miss it. Some friendships run on insults, and some on honesty; which kind do you keep?" },
      },
      choices = {
        { text = "Honest ones. I say what I mean.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The other kind. Honesty is overrated.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stood a watch before I died and I stand one now. The view hasn't improved." } },
    advice = { { id = "tp_ad", text = "Watch what the crows do. They see more than any guard." } },
    _none = { { id = "tp_none", text = "Never saw it, and I'd have noticed. Probably." } },
  },
}
