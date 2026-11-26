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
  prejudice = { class = "WARLOCK", amount = 10, why = "Argent Dawn cult-hunter; the Cult of the Damned's ritualists began where warlocks stand." },
  notices = { "class", "race" },
  impression = {
    first = "He saves his coldest disgust for the Scourge's living servants.",
    third = "{name} met Hadric Harlson of the Argent Dawn, who hunts the Cult of the Damned outside the Undercity on his commander's behalf.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I hunt people who make bargains in the dark, and I'd wager you've made a few yourself. Keep your hands where I can see them." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "The Deathguard may welcome warlocks, but the Argent Dawn has buried too many of its own to cultists who started out just like you. Speak, and quietly." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've fought the cult beside me and never once turned your power on the wrong side. I'll watch you still, but I've stopped counting your spells." },
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
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Hadric Harlson, of the Argent Dawn. I know what you are, and I'll be plain: the cultists I hunt out here started by calling on the same things you do, so give me cause to trust you." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. I've stopped expecting you to turn on me, which is more than I can say for most who carry the shadow. Keep low; the cult is close." },
        { id = "h_default", key = true,
          text = "Hadric Harlson, of the Argent Dawn. Keep your voice down, {class}, because there are Cult of the Damned skulking around the outskirts of the city, and I want them to hear nothing until we're on them." },
        { id = "h_emissary", tags = { "news" }, when = { questActive = TODO_QUEST("The Argent Emissary") },
          text = "The Deathguard sent you after me, I suppose, to see what the Argent Dawn is doing poking about Tirisfal unsupervised. Stay low and try not to be seen, {class}; these cultists are not to be trifled with." },
        { id = "h_crystals", when = { questActive = TODO_QUEST("Remnants of War") },
          text = "Don't handle those crystals more than you must. Even shattered and spent, the necrotic magic left in them is dangerous." },
        { id = "h_cult", when = { questActive = TODO_QUEST("The Cult of the Damned") },
          text = "Kill eight of their neophytes and eight of their enforcers, and don't let them talk to you. The cult is very good at talking." },
        { id = "h_both", tags = { "news" }, when = { questDone = TODO_QUEST("Remnants of War"), questBefore = TODO_QUEST("Bandarion Keep") },
          text = "You've done a great thing for the Dawn's cause here today. My commander and I were bound for Bandarion Keep before we learned of the cult, and if you want to know more of our mission, that's where you'll find him." },
        { id = "h_keep", when = { questActive = TODO_QUEST("Bandarion Keep") },
          text = "Head northwest to Bandarion Keep, and give my commander, Leonid, my regards. I'll stay here and mop up the rest of this mess." },
        { id = "h_keepdone", when = { questDone = TODO_QUEST("Bandarion Keep") },
          text = "You met Leonid, then. He'll have told you what that keep means to him, and I'll only say that he doesn't tell everyone." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quietly, mind." },
        { id = "h_again2", text = "Ask, then, and keep an eye on the treeline while you do." },
      },
      choices = {
        { text = "Why is the Argent Dawn in Tirisfal?", next = "why" },
        { text = "What are these crystals the cult wants?", next = "crystals" },
        { text = "What do you know of the Cult of the Damned?", next = "cult" },
        { text = "Who is your commander?", next = "leonid" },
        { text = "Are you Forsaken, or Argent Dawn?", next = "both" },
        { text = "Deathguard Kristof thinks someone is raising Scourge inside our borders.", next = "kristof", when = { any = { { questDone = TODO_QUEST("Patience") }, { questActive = TODO_QUEST("Patience") } } } },
        { text = "I'll keep low, then. Farewell.", next = "END" },
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
        { text = "She's right. Her knights belong to the Forsaken.", next = "BACK", reply = "That's her answer too, and I respect it, even if my patrols in the Plaguelands could use a few more swords. She knows her people better than I do.", fx = { align = { order = 1 }, learn = { "argent_dawn" } } },
        { text = "The Scourge threatens everyone. She should join you.", next = "BACK", reply = "It does, and I'll tell her you said so the next time she lets me through her gate. She'll listen politely and then do exactly as she pleases, which is rather the point of being free.", fx = { affinity = 1, align = { order = -1 }, learn = { "argent_dawn" } } },
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
        { text = "No mercy for them. They chose the Scourge.", next = "BACK", reply = "They did, with their eyes open and their hearts still beating, and that's what I can't forgive. Strike them down, and don't let them talk you out of it.", fx = { align = { light = -1 } } },
        { text = "Some were desperate. Stop them, but take prisoners where we can.", next = "BACK", reply = "Perhaps, and a prisoner can tell us where the next cell is hiding, so I'll not argue. Only don't mistake desperation for innocence, {class}.", fx = { affinity = 1, align = { light = 1 } } },
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
        { text = "It's a sickness, and the Light can ease it.", next = "BACK", reply = "Then I hope you're right, and I'll pray on the good days that you are. Until then I'll keep fighting and let the Light decide what I am.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's what we are. No cure, and no shame either.", next = "BACK", reply = "There's a hard sort of peace in that, and on the bad days I find I share it. No shame, then, only the work, and plenty of it.", fx = { align = { light = -1 } } },
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
    first = "He does not like being told he is wrong.",
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
      text = "A paladin. I'd heard Deathguard Billmuth was telling stories about your kind, and I'll reserve judgment until I've seen you fight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Kristof. I keep the waystation on the Undercity road, and I give directions to those who need them, though lately I've been watching for something other than lost travellers." },
        { id = "h_patience", tags = { "news" }, when = { questActive = TODO_QUEST("Patience") },
          text = "Executor Zygand wants my report? Then take it, and please see that he reads it at once, because I fear our Scourge problem has only just begun. Come back to me in due time, too; I believe I've nearly uncovered something I could use a willing blade for." },
        { id = "h_discipline", when = { questActive = TODO_QUEST("Discipline") },
          text = "I see the Executor's given you his motivator. Go on, then, if you must; there is no escape, even in death, and it may as well be your hand as his." },
        { id = "h_wrath", tags = { "news" }, when = { questBefore = TODO_QUEST("The Wrath of Rath'mael"), minLevel = 15 },
          text = "Reports have come in from the Lordamere Overlook, deep in the Ruins of Lordaeron. An unholy fog has taken the streets and the graveyard up there, and my scouts say it's being conjured by a necromancer named Rath'mael." },
        { id = "h_wrathact", when = { questActive = TODO_QUEST("The Wrath of Rath'mael") },
          text = "Has Rath'mael's skeletal lieutenant been slain? Bring allies if you have them, because Rath'mael won't fall to one blade." },
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
        { id = "rt_default", text = "Deathguard Linnea, at the rear guard east of Brill, had a rogue abomination wandering near Venomweb Vale, and she kept it quiet, as she should. Abominations don't stroll past the Bulwark unnoticed, {name}, so somebody stitched that thing together on our side of the wall, and that's my whole case in one corpse." },
        { id = "rt_done", when = { questDone = TODO_QUEST("Rear Guard Patrol") },
          text = "You put down Deathguard Linnea's abomination, I hear, and good riddance. But think on it: that thing didn't stroll past the Bulwark unnoticed, so somebody stitched it together on our side of the wall, and that's my whole case in one corpse." },
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
        { text = "Dillinger. Trust the walls' reports, not hunches.", next = "BACK", reply = "Then you're in good company, because the Bulwark thinks the same. I'll keep my hunches to myself until I can put a name to one of them.", fx = { align = { order = 1 } } },
        { text = "You. Something here is working against us.", next = "BACK", reply = "Thank you, and keep your voice down when you say it. Whoever it is, I'd rather they didn't know we're both watching.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zygand = {
      lines = {
        { id = "zy_default", text = "Executor Zygand listens to everything and believes nothing until it's been proven twice, but he reads every word, and that's more than most commanders do." },
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
        { id = "ha_default", text = "Hadric Harlson, yes, one of ours who went over to the Dawn. Some of the Deathguard don't trust him out of sight, but I've watched him, and he kills cultists with the kind of care you only see in someone who hates them personally." },
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
        { text = "A little pain keeps soldiers sharp. He's right.", next = "BACK", reply = "Perhaps it does, though I've yet to see a ghoul slow down because a deathguard was bruised. Zygand will be glad to hear you agree, at any rate.", fx = { align = { order = 1 } } },
        { text = "Beating your own soldiers wins nothing.", next = "BACK", reply = "No, it doesn't, and I'm glad to hear someone say so out loud. Keep that thought, and keep it away from Zygand's hearing.", fx = { affinity = 1, align = { order = -1 } } },
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
    background = { { id = "tp_bg", text = "I served, then I died, and now I serve again. The middle part I don't discuss." } },
    advice = { { id = "tp_ad", text = "When the reports don't add up, believe your own eyes before the reports." } },
    _none = { { id = "tp_none", text = "That's not my concern. Ask someone in Brill." } },
  },
}

-- Deathguard Lizabetha: the bridge at Cold Hearth Manor.
P:NPC {
  key = "tf_lizabetha", id = TODO_NPC("Deathguard Lizabetha"), name = "Deathguard Lizabetha",
  bible = "bibles/glades_forever.md", role = "guard", tier = "service",
  communities = { "brill" }, temper = { "clipped" }, values = { "dutiful", "practical" },
  notices = { "kit" },
  impression = {
    first = "She gives directions crisply and complaints even more crisply.",
    third = "{name} met Deathguard Lizabetha, who guards the bridge by Cold Hearth Manor south of Brill.",
  },

  greetings = {
    { id = "g_default", text = "Keep moving, unless you need directions." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Don't tell me you're still lost." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "You're off the zeppelin, I take it. Brill is north and the Undercity is east of it, and that's two questions I've saved you asking." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the manor, haven't you? It shows. Get to Brill and get that mended." },
    { id = "n_green", cat = "kit", when = { maxLevel = 7, race = "Scourge" },
      text = "You're not long up from Deathknell, by that stagger. Stay on this side of the bridge until you've stopped walking like a foal." },
  },

  start = "hello",
  nodes = {
    road = {
      lines = {
        { id = "rd_default", text = "I don't. Deathguard Dillinger has the stretch west toward Deathknell, and the patrols from Brill pass me twice a watch. Gordo comes lumbering by as well, with his arms full of gloom weed for the apothecaries, and he's the only one who never asks me anything." },
      },
      choices = {
        { text = "What comes down the road that shouldn't?", next = "road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road2 = {
      lines = {
        { id = "rd2_default", text = "Darkhounds, when they're hungry, and duskbats after sunset. The odd ghoul wanders out of the manor grounds and has to be put back down, and I do that myself, since there's nobody else on the bridge to do it." },
      },
      choices = {
        { text = "A dull posting, you called it.", next = "BACK", reply = "It is dull. A ghoul a week doesn't make it lively, it only makes it a ghoul a week." },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = {
        { id = "lo_default", text = "All day long, and there is a signpost not twenty paces behind me with every town on it. The newly risen I can forgive, since half of them have forgotten their letters, but the living come off that zeppelin with two good eyes and still ask." },
      },
      choices = {
        { text = "Perhaps they'd rather hear it from a person.", next = "lost2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost2 = {
      lines = {
        { id = "lo2_default", text = "Perhaps they would. Deathguard Cyrus in Brill enjoys it, and he'll recite the whole town to anyone who stands still. I only want them off my bridge before something follows them onto it." },
      },
      choices = {
        { text = "Then I'll read the signpost next time.", next = "BACK", reply = "You'd be the first. I'll remember your face for it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside = {
      lines = {
        { id = "in_default", text = "Then you know more of it than I do, and I'd sooner not hear the details. I knew that house by sight when it had lamps in the windows, and I'd like to keep it that way in my head while I stand here looking at it." },
      },
      choices = {
        { text = "I'll say only that it's quieter now.", next = "BACK", reply = "Quieter will do. Thank you for that, and for not saying more.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_again", text = "Anything else? I'm on duty, so be quick about it." },
        { id = "h_again2", text = "Go on, then. The bridge isn't going anywhere, and neither am I." },
        { id = "h_again3", text = "What else? Ask it plainly and I'll answer it plainly." },
      },
      choices = {
        { text = "Why guard a bridge out here?", next = "post" },
        { text = "What's at Cold Hearth Manor?", next = "manor" },
        { text = "What do you think of the Executor's motivator?", next = "motivator" },
        { text = "Which way to Brill?", next = "directions" },
        { text = "What's the life of a Deathguard like?", next = "life" },
        { text = "You can't have this whole road to yourself.", next = "road" },
        { text = "People keep asking you the way, I gather.", next = "lost" },
        { text = "I've been inside the manor, Deathguard.", next = "inside", when = { minLevel = 8 } },
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
        { text = "Discipline keeps the Deathguard strong.", next = "BACK", reply = "Strong, perhaps, but I've never seen a stick stop a ghoul. Carry the motivator if you must, and I'll be standing very straight when you pass.", fx = { align = { order = 1 } } },
        { text = "You're right. You've earned better than a stick.", next = "BACK", reply = "That's kind, and rarer than you'd think in Brill. I'll be at my post either way, but I'll stand there a little prouder for hearing it.", fx = { affinity = 1, align = { order = -1 } } },
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
    scourge = { { id = "tp_scourge", text = "The mindless ones drift out of the manor grounds now and then. They don't plan and they don't hurry, which is the only good thing I can say about them." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They keep to the west and the north, mostly, but I watch for red tabards on this road all the same. They'd love to burn that zeppelin tower." } },
    forsaken = { { id = "tp_forsaken", text = "We stand our posts and we don't complain where the Executor can hear. It's a living, in a manner of speaking." } },
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
    first = "He stayed behind so his friend could run, and it embarrasses him.",
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
          text = "Their friars and zealots carry satchels with their deployment orders. Bring a copy to Deathguard Billmuth at Bandarion Keep, and he'll take it from there, so we can warn the Deathguard and set an ambush of our own." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down." },
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
        { text = "Yes. You don't leave a friend behind.", next = "BACK", reply = "Then you'd have been good company out there, spiders and all. Billmuth would say the same, if he ever stopped apologising long enough.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No. One dead scout is better than two.", next = "BACK", reply = "That's the sensible answer, and I'd likely tell a recruit the same. But sensible doesn't keep you warm at night, even when you're dead.", fx = { align = { honor = -1 } } },
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
        { text = "Good. They've earned a second look.", next = "BACK", reply = "They have, and it costs us nothing to give it. I'd rather be wrong about them than wrong about Billmuth.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "One good deed doesn't make the Light trustworthy.", next = "BACK", reply = "It doesn't, and I'll not be preaching for them anytime soon. But it made me ask the question, which is more than the priests ever did.", fx = { align = { light = -1 } } },
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
        { id = "v_default", text = "This is Venomweb Vale. It was good hunting country once, all deer and rabbits, and now it's spiders the size of carts and a Scarlet camp in the north end. The Scarlet Monastery is just beyond, which is why they're so thick on the ground." },
      },
      choices = {
        { text = "Tell me about the Scarlet camp.", next = "camp" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_monastery" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a village lad, then a soldier, then a corpse, then a Deathguard, and lately a corpse again, briefly. I've had a busy few years." } },
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
    first = "He has opinions about every zeppelin pilot and most of the passengers.",
    third = "{name} met Deyrek Duke beside the zeppelin tower southeast of Brill, who watches the airships come and go.",
  },

  greetings = {
    { id = "g_default", text = "Waiting for the zeppelin? It'll be late, because it's always late." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The zeppelin still isn't here, in case you wondered." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "A tauren, and still on the platform after a whole minute. You've already outlasted the last one of your people I saw here." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Fresh off the ship from Durotar, by the look of you. Don't worry; the ground stops swaying in an hour or so." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge", maxLevel = 12 },
      text = "You're one of ours, and going out rather than coming in, by the look of that pack. Kalimdor's all sun, I'm told, so mind you don't dry out." },
    { id = "n_engineer", cat = "travel", when = { profession = "Engineering" },
      text = "You've an engineer's goggles, so tell me honestly whether that balloon looks sound to you. No, on second thought, don't tell me." },
  },

  start = "hello",
  nodes = {
    ride = {
      lines = {
        { id = "ri_default", text = "Never, and I never shall. I have already died once on solid ground, which was bad enough, and I see no reason to try it from a great height in a basket nailed together by goblins." },
      },
      choices = {
        { text = "The dead can't be much hurt by a fall.", next = "ride2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ride2 = {
      lines = {
        { id = "ri2_default", text = "We can be scattered by one, and I've no wish to spend eternity as a wide patch of Deyrek somewhere in the middle of the sea. A man likes to know where all of himself is." },
      },
      choices = {
        { text = "That's the best case against flying I've heard.", next = "BACK", reply = "I've had a long time on this platform to perfect it. The goblins have heard it too, and they offered me a discount.", fx = { affinity = 1 } },
        { text = "Something else, Deyrek.", next = "BACK" },
      },
    },
    tally = {
      lines = {
        { id = "ta_default", text = "In my head, yes, and I'm seldom wrong. This week it was eleven orcs, six trolls, one tauren, a goblin with a crate that ticked, and more sacks of Durotar grain than this country has seen since it stopped growing its own." },
      },
      choices = {
        { text = "Does anyone ask you for the count?", next = "tally2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally2 = {
      lines = {
        { id = "ta2_default", text = "The Deathguard on the Brill road ask, now and then, when the Executor wants to know who's about. Mostly it's for my own satisfaction, because a country that has visitors again is a country that isn't finished, and I like to keep count of the proof." },
      },
      choices = {
        { text = "That's a hopeful thing to count.", next = "BACK", reply = "Don't tell anyone in Brill. Hope's not fashionable there, and I've a reputation to keep." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rode = {
      lines = {
        { id = "ro_default", text = "You're standing here, so I can't argue that it went badly. Tell me, though, and tell me straight, did it creak the whole way, or only when the wind got up?" },
      },
      choices = {
        { text = "The whole way. You get used to it.", next = "BACK", reply = "I knew it. No, I shan't get used to it, because I shan't get on it, but thank you for an honest answer.", fx = { affinity = 1 } },
        { text = "It never creaked once. Smooth as a lake.", next = "BACK", reply = "Now I know you're lying, because I can hear it creaking from here while it's tied up. Still, it was kindly meant." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deyrek Duke. I watch the zeppelins, since somebody ought to, and the goblins certainly won't. One goes to Durotar and one to Grom'gol in Stranglethorn, and neither of them keeps to the timetable." },
        { id = "h_fire", tags = { "news" }, when = { questDone = TODO_QUEST("A Lesson in Divinity") },
          text = "I hear the Scarlets meant to set this tower alight to draw off Brill's guards. I'd have seen them coming, of course, but I'm glad somebody read their orders first." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing but time until the next ship." },
        { id = "h_again2", text = "Go on. If the ship comes in while you're asking, I'll only be surprised." },
        { id = "h_again3", text = "Was there more? I can talk and watch the sky at once; it's most of what I do." },
      },
      choices = {
        { text = "Why watch the zeppelins?", next = "why" },
        { text = "What do you make of the goblins?", next = "goblins" },
        { text = "What do you think of our new allies?", next = "allies" },
        { text = "Who are the strangest passengers you've seen?", next = "passengers" },
        { text = "The Scarlets meant to burn this tower?", next = "fire", when = { questDone = TODO_QUEST("A Lesson in Divinity") } },
        { text = "You've never once ridden one.", next = "ride" },
        { text = "Do you keep a record of what comes through?", next = "tally" },
        { text = "I came in on that ship, and it was no accident.", next = "rode", when = { race = { "Orc", "Troll", "Tauren" } } },
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
        { id = "ps_default", text = "There was a tauren who got off, looked at Tirisfal, and got straight back on again, which I thought showed great wisdom. And a troll who wanted to know where the beach was, and wouldn't believe me when I told him Lordaeron's beaches are mostly murlocs." },
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
        { id = "gb_default", text = "They'll fly anyone anywhere for coin, and they'll tell you the airship's perfectly safe while they're patching the balloon. I respect a people who can lie that cheerfully, though I'd never get on one of their machines." },
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
        { text = "The Horde stands together. The alliance is real.", next = "BACK", reply = "I'd like to believe that, and some days at the Bulwark it's easy, when the orcs are standing on the wall beside us. Brill talks a great deal, but Brill doesn't hold the line.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's a bargain. We use them, and they use us.", next = "BACK", reply = "That's the Undercity talking, and I suspect it's half right. Still, a bargain kept long enough starts to look a lot like friendship.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm from round here, and I'm staying round here. That's my story, and the zeppelin's late." } },
    advice = { { id = "tp_ad", text = "Hold on to something when the zeppelin docks. The goblins call it a landing; I'd call it an accident they've rehearsed." } },
    forsaken = { { id = "tp_forsaken", text = "We were a kingdom that kept to itself, and now we've a mooring tower with the whole Horde coming down the steps. I think it's good for us, though you'll not hear many say so." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They'd love to see this tower burn, with all its foreign passengers. I watch the road for them when I remember to stop watching the sky." } },
    thrall = { { id = "tp_thrall", text = "I've never laid eyes on him, but I've seen what he sends us, and it's grain and soldiers. For a Warchief who owes the Forsaken nothing, that's handsome." } },
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
    first = "His dog Max is very much alive, and he seems content.",
    third = "{name} met Relreo Emberlight in the Whispering Forest, who lives in a cottage with his dog Max and walks him up to Bandarion Keep.",
  },

  greetings = {
    { id = "g_default", text = "Hello there. Mind Max; he'll want to sniff you." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Max remembers you, I think; look at that tail." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Max, sit, and let the {class} see what a well-kept dog looks like. He's a little vain about his coat, I'm afraid." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, and you've brought a friend for Max! Let them sniff each other, {pet} won't mind, and Max has better manners than I do." },
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "One of the knights from the Keep. Max and I walk up there most days, and they always find a scrap for him." },
    { id = "n_living", cat = "class", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Max has taken to you straight away, and I think it's because you smell alive. He's very polite about the rest of us, but he does notice." },
  },

  start = "hello",
  nodes = {
    feeding = {
      lines = {
        { id = "fe_default", text = "It was a puzzle at first, because I'd forgotten that anything needs breakfast. I set snares for the forest hares now, and I trade mushrooms in Brill for bones and scraps, and Innkeeper Renee puts aside what her living guests leave on the plate." },
      },
      choices = {
        { text = "And water? Nothing in Tirisfal runs clean.", next = "feeding2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feeding2 = {
      lines = {
        { id = "fe2_default", text = "There's a spring behind the cottage that comes up clear, the only one I know of this side of the lake. I boil it anyway, twice, and I taste nothing myself, so I watch Max's face when he drinks and I go by that." },
      },
      choices = {
        { text = "He's lucky to have you.", next = "BACK", reply = "Oh, it's quite the other way about. I'd have no reason to boil a kettle at all, if it weren't for him.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = {
        { id = "qu_default", text = "It does, and I'm grateful. The deer are shy and the bears keep to the far side, and the only things that trouble us are the Vile Fin when they come up from the bluffs, and the little darters when they've been at the mushrooms." },
      },
      choices = {
        { text = "What happens when the darters have been at the mushrooms?", next = "quiet2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet2 = {
      lines = {
        { id = "qu2_default", text = "They get quite silly, and then they get quite cross, and they'll nip at anything that walks under them. Max chased one once and came home with a singed ear and a very thoughtful expression, and he has left them alone ever since." },
      },
      choices = {
        { text = "A wise dog learns the first time.", next = "BACK", reply = "He's wiser than I am, then, because I still go and watch them every week." },
        { text = "Something else, Relreo.", next = "BACK" },
      },
    },
    ring = {
      lines = {
        { id = "rg_default", text = "Then you can tell me something I've always wondered. All of Tirisfal is sick, the trees and the beasts and the soil, and yet that one ring of mushrooms is as bright as a spring morning. Is it the faerie dragons who keep it so?" },
      },
      choices = {
        { text = "They may. Such creatures carry a little of the Dream.", next = "BACK", reply = "A little of the Dream, here, in Tirisfal. Do you hear that, Max? I knew it was more than mushrooms.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I can't say. Some places simply refuse to die.", next = "BACK", reply = "I rather like that answer too. There's a good deal of that about in these woods, when you think of it." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Relreo Emberlight, and this is Max. We keep the cottage, and we walk up to Bandarion Keep when the weather's fair, and when it isn't, for that matter, because Max doesn't believe in weather." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, in the Whispering Forest! You'll have heard the faerie dragons singing by the mushroom ring, I hope, because I've never been able to explain it to anyone who hasn't." },
      },
      again = {
        { id = "h_again", text = "What else? Max is patient, and so am I." },
        { id = "h_again2", text = "Go on, we've nowhere to be until Max decides it's time for his walk." },
        { id = "h_again3", text = "Ask anything you like. It's a treat to have a visitor who isn't a deer." },
      },
      choices = {
        { text = "A living dog, with a Forsaken?", next = "max" },
        { text = "Why walk up to the Keep?", next = "keep" },
        { text = "What's in the Whispering Forest?", next = "forest" },
        { text = "How did you come to live out here?", next = "cottage" },
        { text = "It can't be easy, feeding a living dog out here.", next = "feeding" },
        { text = "The forest keeps its distance from your door.", next = "quiet" },
        { text = "I know the faerie ring you mean, Relreo.", next = "ring", when = { class = "DRUID" } },
        { text = "Goodbye, Relreo, and goodbye to you too, Max.", next = "END" },
      },
    },
    max = {
      big = true,
      lines = {
        { id = "m_default", text = "He found me, not long after I came out here, and he never seemed to notice I was dead. People in Brill told me a corpse has no business keeping a living dog, but he's fed and warm and happy, so I can't see who's being harmed." },
      },
      choices = {
        { text = "He chose you. That's a kind of blessing.", next = "BACK", reply = "That's a lovely way to think of it, and I believe Max would agree, if he had the words. He's the best company I've had in either life.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dog's a guard. Sentiment doesn't come into it.", next = "BACK", reply = "He's a fine guard, and a better friend, and I'll not apologise for the second part. You'd feel the same if he ever leaned against your leg.", fx = { align = { light = -1 } } },
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
        { id = "mk_default", text = "They spoil him dreadfully. Breton Samuels keeps a bone by the gate for him, and Danitha pretends not to notice, and I've seen grown knights who can't hold the Light without wincing kneel down in the mud to scratch his ears." },
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
    forsaken = { { id = "tp_forsaken", text = "I'm fond of my own people, truly, but they will talk about the grave so. Max never mentions it, which is one of the things I like about him." } },
    scourge = { { id = "tp_scourge", text = "They don't come into the forest much, I'm glad to say. Max growls at the wind when it blows from the east, and I've learned to bring him indoors when he does." } },
    lordaeron = { { id = "tp_lord", text = "These woods were the king's hunting ground once, I believe. The deer don't seem to miss him." } },
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
    first = "He and Rickard argue as if they had fifty years of practice.",
    third = "{name} met Adelbert Edmunds at the Bulwark, an old watchman who keeps his post beside Rickard Hardee.",
  },

  greetings = {
    { id = "g_default", text = "Eyes east, {class}. That's where the trouble comes from." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the wall? Rickard said you'd be back. Don't tell him he was right." },
    { id = "g_soldier", when = { class = { "WARRIOR", "PALADIN" } }, text = "You've stood a wall before, {class}, I can see it in your feet. Come and stand this one a minute and tell Rickard he's looking the wrong way." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been over the wall, by the look of that armor. Get it mended before you go back; the plague doesn't care how brave you are." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge", maxLevel = 30 },
      text = "You're young to be this far east, for one of us. The Plaguelands eat the young ones first, so listen twice to whatever the High Executor tells you." },
  },

  start = "hello",
  nodes = {
    dawn = {
      lines = {
        { id = "dw_default", text = "They're living folk, most of them, and paladins besides, and not five years ago their kind were burning ours on sight. But Argent Officer Garush pays in good coin for every Scourge trinket brought across this wall, and I've seen his people bleed beside ours." },
      },
      choices = {
        { text = "So which is it, pity or blessing?", next = "dawn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn2 = {
      lines = {
        { id = "dw2_default", text = "A blessing, and it pains me to say it. Rickard said so the first week they came and I told him he was a soft-headed old fool, and I've been finding ways not to admit he was right ever since." },
      },
      choices = {
        { text = "Your secret is safe at this end of the wall.", next = "BACK", reply = "See that it is. He's hard enough to stand beside when he's wrong.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nights = {
      lines = {
        { id = "ni_default", text = "It is, when you don't sleep. The wind comes off Andorhal after dark and you can hear things in it, bells sometimes, though there's no one over there with any business ringing a bell. Rickard says it's only loose iron in the ruins." },
      },
      choices = {
        { text = "And what do you say it is?", next = "nights2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nights2 = {
      lines = {
        { id = "ni2_default", text = "I say it's loose iron too, out loud, because the young Deathguard are listening. Between you and me I couldn't tell you, and I've stopped wanting to know, so long as it stays on its own side of the wall." },
      },
      choices = {
        { text = "That's all a wall is for.", next = "BACK", reply = "It is. People think a wall is to keep things out, but mostly it's so you needn't look at them." },
        { text = "Something else, Adelbert.", next = "BACK" },
      },
    },
    goeast = {
      lines = {
        { id = "ge_default", text = "Then report to High Executor Derrington first, because he knows what the cauldrons are doing to the fields and he'll not send you blind. Go by daylight, keep off the Andorhal road, and if the crows go up all at once, Rickard says to lie flat and wait." },
      },
      choices = {
        { text = "I'll come back and tell you how it went.", next = "BACK", reply = "Do that. The young ones never do, and I'd like to be wrong about one of them.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Adelbert Edmunds, and that's Rickard beside me, who'll tell you he does the watching while I do the talking. Don't believe him; he only has the one good eye." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of the living, out at the Bulwark. Keep a cloth over your mouth when the wind blows from the east; whatever's over there doesn't need to breathe, and you do." },
      },
      again = {
        { id = "h_again", text = "What else? Rickard's watching the road, so I've time." },
        { id = "h_again2", text = "Go on. If anything moves out there, Rickard will say so before I do." },
        { id = "h_again3", text = "Ask, then. It's a long watch and I've said everything to Rickard twice." },
      },
      choices = {
        { text = "What's the Bulwark like?", next = "wall" },
        { text = "Have you known Rickard long?", next = "rickard" },
        { text = "What's out there to the east?", next = "east" },
        { text = "Is Rickard's eye a problem on watch?", next = "eye" },
        { text = "You don't sound pleased to share the wall with the Dawn.", next = "dawn" },
        { text = "It must be a long watch out here.", next = "nights" },
        { text = "I mean to go east, Adelbert. What should I know?", next = "goeast", when = { minLevel = 45 } },
        { text = "Goodbye, Adelbert.", next = "END" },
      },
    },
    wall = {
      lines = {
        { id = "w_default", text = "It's quieter than it was. The plaguemist used to sit on this place like a wet blanket, all yellow and grey, and since the work in the Plaguelands began, it's thinned. I don't trust it, mind, because I've never known the Scourge to give up anything for free." },
      },
      choices = {
        { text = "Who holds the Bulwark?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = {
        { id = "h2_default", text = "High Executor Derrington, and the Argent Dawn alongside him, more's the pity or more's the blessing depending on who you ask. This was a refugee camp once, for the folk who got out of the capital when it fell, and I like to think we're keeping it for the same reason." },
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
        { text = "Hold the wall. Patience will win this one.", next = "BACK", reply = "Good, and you'll live longer for it, which is not nothing even for us. The wall holds, and the Scourge breaks itself on it, one ghoul at a time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take the fight to them. Walls only delay.", next = "BACK", reply = "Spoken like one of the young ones, and they never come back to say how it went. Go east if you must, but I'll keep the wall standing behind you.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stood a wall in life and I stand one now. I'm good at it, so I'll keep doing it." } },
    advice = { { id = "tp_ad", text = "Never turn your back to the east. Rickard learned that the hard way, whatever he tells you." } },
    scourge = { { id = "tp_scourge", text = "More of them past that ridge than there are stones in this wall. They don't tire and they don't bargain, so we don't either." } },
    argent_dawn = { { id = "tp_dawn", text = "They share the Bulwark with us and they fight the same enemy. I'll not say more than that where Rickard can hear me being fair to them." } },
    andorhal = { { id = "tp_andorhal", text = "It was the granary of Lordaeron, and the first place the plagued grain went out from. Nothing in it is alive now, and too much of it is still moving." } },
    _none = { { id = "tp_none", text = "Ask Rickard. He's the one who sees things, he says." } },
  },
}

P:NPC {
  key = "tf_rickard", id = TODO_NPC("Rickard Hardee"), name = "Rickard Hardee",
  bible = "bibles/glades_forever.md", role = "soldier", tier = "service",
  communities = { "bulwark" }, temper = { "wry" }, values = { "loyal", "patient" },
  notices = { "stealth", "class" },
  impression = {
    first = "He sees more than Adelbert gives him credit for.",
    third = "{name} met Rickard Hardee at the Bulwark, a half-blind watchman who stands his post beside Adelbert Edmunds.",
  },

  greetings = {
    { id = "g_default", text = "Come round to my left side, would you? That's the one that works." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I'd know that walk anywhere, even with one eye." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Light feet, and coming up on my blind side. Try the other, friend, it's better manners and you'll get a straighter answer." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You can come out of the shadows, friend. One eye or not, I've been watching shadows on this wall for longer than you've been sneaking." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll have better eyes than mine, then, so tell me if you see anything moving out past the ridge." },
    { id = "n_living", cat = "class", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You'll want to step back from the edge when the wind turns, friend. What blows over from the east doesn't trouble us, but I've seen it lay a living orc out flat." },
  },

  start = "hello",
  nodes = {
    camp = {
      lines = {
        { id = "ca_default", text = "It was. When the capital fell, the ones who got out alive were gathered here before they went south, and they say Uther himself stood guard over them. You can still find tent pegs in the ground if you kick about behind the wagons." },
      },
      choices = {
        { text = "And now the dead hold it against the dead.", next = "camp2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp2 = {
      lines = {
        { id = "ca2_default", text = "Funny, isn't it? Adelbert likes to think we're keeping it for the same reason they did, to give folk behind us time to get away. I let him think it, because it's a better reason than most soldiers ever get." },
      },
      choices = {
        { text = "You believe it too, I think.", next = "BACK", reply = "Maybe I do. Don't tell the old goat, he'll want it in writing.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mist = {
      lines = {
        { id = "mi_default", text = "It is thinner. When I first stood here you couldn't see the ridge at noon, and now I can make out single trees on it, such as they are. The Argent Dawn says it's the work being done against the cauldrons over there." },
      },
      choices = {
        { text = "Adelbert doesn't trust it.", next = "mist2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mist2 = {
      lines = {
        { id = "mi2_default", text = "Adelbert doesn't trust a sunny day. He's right that the Scourge gives nothing away for free, but somebody over there is paying for that clear air, and I'd sooner thank them than squint at it." },
      },
      choices = {
        { text = "Then I'll take your thanks east with me.", next = "BACK", reply = "Do, if you're going. And look back at the wall once, so I can tell Adelbert I saw you wave." },
        { text = "Something else, Rickard.", next = "BACK" },
      },
    },
    ridge = {
      lines = {
        { id = "rg_default", text = "Two plague hounds near the dead oak, and something slower behind them that hasn't decided yet which way it's going. You look, {class}, and tell me if the slow one's carrying anything, because that's past what I can make out." },
      },
      choices = {
        { text = "Nothing in its hands. It's only wandering.", next = "BACK", reply = "Good. Wanderers we can leave for the next patrol. It's the ones carrying things that mean somebody's giving orders.", fx = { affinity = 1 } },
        { text = "I can't tell at this distance either.", next = "BACK", reply = "Then we'll both keep watching it, and you can stop feeling sorry for my eye." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rickard Hardee. Adelbert does the talking, he says, and I do the watching, which is a fine joke from a man with two eyes who never uses either." },
      },
      again = {
        { id = "h_again", text = "Something else? Stay on my good side." },
        { id = "h_again2", text = "Go on. I can listen with both ears, at least." },
        { id = "h_again3", text = "What else? Keep your voice down a little, I'm watching that ridge." },
      },
      choices = {
        { text = "What happened to your eye?", next = "eye" },
        { text = "What do you watch for?", next = "watch" },
        { text = "Adelbert says you walked into a door.", next = "door", when = { heardLine = "tf_adelbert.h_default" } },
        { text = "What's Adelbert like?", next = "adelbert" },
        { text = "This wall was a refugee camp once, I hear.", next = "camp" },
        { text = "The mist over the Plaguelands looks thinner than the stories say.", next = "mist" },
        { text = "What does your one eye make of that ridge today?", next = "ridge", when = { class = "HUNTER" } },
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
        { id = "ad_default", text = "He's loud, stubborn and certain of everything, and the best man I've ever stood a wall beside. We've been arguing since before either of us died, and I expect we'll keep it up until the Scourge gets bored and goes home." },
      },
      choices = {
        { text = "That's a fine friendship.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crows = {
      lines = {
        { id = "cr_default", text = "Not a single one that I've seen. When the cult moves along the ridge the crows go up all at once and circle and won't come down, and the mindless dead don't bother them at all. I learned that my first winter here, and it's never once been wrong." },
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
        { text = "Honest ones. I say what I mean.", next = "BACK", reply = "A rare thing in Brill, and Adelbert would call you a fool for it. I'll take a friend who tells me the truth, though I'd not say no to a few insults besides.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The other kind. Honesty's overrated, if you ask me.", next = "BACK", reply = "Then you and Adelbert will get on splendidly, and I'll be the one stuck listening to the pair of you. Mind the old goat doesn't steal your boots.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stood a watch before I died and I stand one now. The view hasn't improved." } },
    advice = { { id = "tp_ad", text = "Watch what the crows do. They see more than any guard." } },
    scourge = { { id = "tp_scourge", text = "The mindless ones just come on, in a straight line, and they're no trouble to a wall. It's when they stop and wait that I send for the High Executor." } },
    argent_dawn = { { id = "tp_dawn", text = "Decent people, and they watch well. Adelbert grumbles about sharing the wall, but he saves them a place by the fire." } },
    forsaken = { { id = "tp_forsaken", text = "We're what's left of Lordaeron, minus a few parts. I gave an eye, and I count myself let off lightly." } },
    _none = { { id = "tp_none", text = "Never saw it, and I'd have noticed. Probably." } },
  },
}

-- Vigilant Deathguard: guards at the zeppelin landing south of Brill.
P:NPC {
  key = "tf_vigilant_deathguard", id = TODO_NPC("Vigilant Deathguard"), name = "Vigilant Deathguard", gender = "male",
  role = "guard", tier = "service",
  temper = { "cold", "sharp" }, values = { "duty" },
  impression = {
    first = "His eyes never stop moving between the sky and the road.",
    third = "{name} spoke with a Vigilant Deathguard at the zeppelin landing south of Brill.",
  },
  greetings = {
    { id = "g_default", text = "State your business at the landing, and keep clear of the ropes when the zeppelin comes in." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another flight? The goblins will be thrilled, or at least your coin will thrill them." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A lookout on the walls of Lordaeron's capital. I watched the sky for gryphons and the road for orcs. Then the danger came walking through the front gate, and I was looking the wrong way. I don't look away from anything now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfalls = {
      lines = { { id = "yfalls_x", text = "Then Tirisfal is cut off from Durotar, and the Horde has to trust the long road through the Barrens and the sea. The goblins say they'd rebuild in a week. I say a goblin's week is a month and a bill." } },
      choices = {
        { text = "Should the Forsaken build their own airships?", next = "yown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yown = {
      lines = { { id = "yown_x", text = "There's talk of it in the Undercity. The apothecaries want the secret of the goblin engines. Should we steal it, or keep paying the goblins and keep the peace?" } },
      choices = {
        { text = "Pay them. Bargains keep the Horde together.", next = "BACK", reply = "Aye, the Dark Lady would say the same, in public.", fx = { align = { honor = 1 } } },
        { text = "Steal it. We can't depend on goblins forever.", next = "BACK", reply = "Hm. That's what the apothecaries say in private. Keep it to yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The zeppelins are the Horde's lifeline between Tirisfal and Durotar, and that makes this tower a target for every Scarlet with a torch. I watch the road, the sky and the goblins, though not necessarily in that order." },
        { id = "yh_troll", when = { race = "Troll" }, text = "A troll, off the zeppelin. Keep your knives sheathed near the tower, the goblins get nervous, and nervous goblins drop things." },
      },
      again = { { id = "h_again", text = "Anything else? Be quick, because there's a ship due." } },
      choices = {
        { text = "Why watch the goblins?", next = "goblins" },
        { text = "Where do the zeppelins go?", next = "where" },
        { text = "Has the Crusade ever struck the tower?", next = "attack" },
        { text = "You keep glancing at the sky.", next = "sky" },
        { text = "What do you make of the Horde folk passing through?", next = "horde" },
        { text = "I've just come off the zeppelin from Durotar.", next = "durotar", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Who were you before?", next = "ylife" },
        { text = "What happens if the tower falls?", next = "yfalls" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    goblins = {
      lines = { { id = "g1_default", text = "Because they'll sell a seat to anyone with gold, and I'd rather not find out the hard way who bought one. They've been honest enough with us so far, and I intend to keep it that way by watching." } },
      choices = {
        { text = "A goblin's loyalty is only as good as the pay.", next = "BACK", reply = "Exactly so, and the Dark Lady pays well, which is the only reason I sleep at all.", fx = { align = { order = 1 } } },
        { text = "They've earned some trust by now, surely.", next = "BACK", reply = "Trust is for the living, friend, and I'm not one of those any more.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    attack = {
      lines = { { id = "at_default", text = "Twice that I've seen, both times at night, with oil and torches and a great deal of shouting about purity. The second time they got as far as the stairs before we put them down." } },
      choices = {
        { text = "What happened to the prisoners?", next = "attack_prisoners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    attack_prisoners = {
      lines = { { id = "ap_default", text = "There were two, and the Apothecaries took them to the Undercity. I didn't ask what for, and I'd advise you not to ask either, unless you've a strong stomach and no particular wish to sleep." } },
      choices = {
        { text = "The Scarlets would have done worse to us.", next = "attack_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    attack_stance = {
      big = true,
      lines = { { id = "as_default", text = "They would, and they have. Still, I've heard some of the newly risen grumble that we're becoming what we hated, so tell me where you stand." } },
      choices = {
        { text = "Whatever keeps the Forsaken safe is justified.", next = "BACK", reply = "That's the Deathguard's creed, near enough, and the Dark Lady's too.", fx = { align = { order = 1 } } },
        { text = "Cruelty for its own sake is the Scourge's way, not ours.", next = "BACK", reply = "Careful who hears you say that, friend, though I won't be the one to repeat it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky = {
      lines = { { id = "sk_default", text = "Bats, mostly, from the Undercity, carrying messages, and once a gryphon rider from the Alliance who'd lost his way. He didn't find it again, I'm afraid." } },
      choices = { { text = "Unlucky for him. Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "ho_default", text = "Orcs who stare at us as if we might fall apart, trolls who ask if we're tasty, and tauren who are unfailingly polite and won't stand downwind. They're allies, and I'm grateful for them, in my way." } },
      choices = { { text = "That's about fair. Something else.", next = "BACK" } },
    },
    durotar = {
      lines = { { id = "du_default", text = "Welcome to Tirisfal, then, and don't let the gloom fool you, because it's worse than it looks. Brill is just up the road; the innkeeper serves food the living can eat, if you're careful which dish you choose." } },
      choices = { { text = "I'll be careful. Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "w_default", text = "One flight carries you to Orgrimmar in Durotar, and the other goes to Grom'gol in Stranglethorn, if you've a taste for jungle and trolls. Mind the steps on the way up, because the goblins never fixed the loose one." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
  },
  topics = {
    zeppelins = { { id = "ytp_zep", text = "The zeppelins come and go like great floating pumpkins. I watch every one." } },
    durotar = { { id = "ytp_dur", text = "Durotar is red and hot, I'm told. I'd last about a day there." } },
    scarlet_crusade = { { id = "tp_crusade", text = "They hate the zeppelins almost as much as they hate us. Torches and oil, every time." } },
    goblins = { { id = "tp_goblins", text = "Honest so far, and well paid to stay that way. I keep an eye on them regardless." } },
    _none = { { id = "tp_none", text = "I watch a tower, not the world. Ask in Brill." } },
  },
}

-- Knight of Mourning: a human ghost bound by an oath to the mushroom ring in the Whispering Forest.
P:NPC {
  key = "tf_knight_of_mourning", id = TODO_NPC("Knight of Mourning"), name = "Knight of Mourning", gender = "male",
  role = "spirit", tier = "service",
  temper = { "grave", "formal" }, values = { "honor", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "He is grey and translucent, and he stands at the mushroom ring like a sentry who was never relieved.",
    third = "{name} met the Knight of Mourning, a ghost bound by his oath to the mushroom ring in the Whispering Forest.",
  },
  greetings = {
    { id = "g_default", text = "My oath binds me to this place. What brings you here, to this Light-forsaken place?" },
    { id = "g_back", when = { metBefore = true }, text = "You return, traveller, and I am still here, as I must be." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You are dead and yet you walk with your own will, which I did not think possible. I envy you that, a little, and I pity you a great deal." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "You carry the Light, I can feel it from here, warm as a hearth I can no longer sit beside." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      narr = "The faerie lights over the mushroom ring pass straight through him.",
      lines = {
        { id = "h_default", key = true, text = "My oath binds me to this place, and so I keep watch here, though I can no longer remember who asked it of me. What brings you to this Light-forsaken place, traveller?" },
      },
      again = {
        { id = "h_again", text = "Is there more? Time weighs little on me, so ask what you will." },
        { id = "h_again2", text = "Speak, then. The ring is quiet, and I would welcome a voice." },
      },
      choices = {
        { text = "What oath binds you here?", next = "oath" },
        { text = "Why call this place Light-forsaken?", next = "forsaken" },
        { text = "You've kept watch a long time, by the look of you.", next = "long" },
        { text = "What do you guard against?", next = "guard" },
        { text = "Do you remember your own name?", next = "name" },
        { text = "What do you know of the Forsaken?", next = "forsaken_folk" },
        { text = "Lordaeron is gone, Sir Knight. The king is dead.", next = "king" },
        { text = "I serve the Light too. Let me pray for you.", next = "pray", when = { class = { "PALADIN", "PRIEST" }, ["not"] = { race = "Scourge" } } },
        { text = "I could try to free you, by shadow if not Light.", next = "shadow", when = { race = "Scourge", class = { "PRIEST", "WARLOCK" } } },
        { text = "I'll leave you to your vigil.", next = "END" },
      },
    },
    oath = {
      lines = { { id = "o_default", text = "To guard, and to wait, and not to leave until I am released. I remember the kneeling and the words, but the face of the one who heard them has gone from me, and that is the cruellest part." } },
      choices = {
        { text = "Who could release you?", next = "release" },
        { text = "Something else.", next = "BACK" },
      },
    },
    release = {
      big = true,
      lines = { { id = "r_default", text = "Only the one I swore to, I think, or the Light itself, and neither has come. Tell me truly, traveller, would you keep an oath to the dead?" } },
      choices = {
        { text = "An oath is an oath, whoever made it and whoever's left.", next = "BACK", reply = "Then you understand me, and I am glad of it, though I would not wish my vigil on you.", fx = { align = { honor = 1 } } },
        { text = "No. The dead can't hold you to anything.", next = "BACK", reply = "Perhaps not, but I cannot unswear it, and so here I remain.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "The plague came through these woods, and the dead walked over the graves of the faithful, and the Light did not stop them. The forest still sings, I will grant you, but the song has a hollow sound to it now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "Long enough that the mushrooms have grown up around my feet, and the faerie dragons no longer bother to hide from me. I count the seasons by the leaves, though I have lost the count more than once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "gu_default", text = "I do not know, and that has troubled me for many seasons. Perhaps the ring itself, for the old folk said such circles were doors to somewhere fair, or perhaps something beneath it that I was set to keep from waking." } },
      choices = {
        { text = "Something beneath the ring?", next = "guard_beneath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_beneath = {
      lines = { { id = "gb_default", text = "On the stillest nights I hear something, like a voice in a dream speaking from very far off. I have never been able to make out the words, and I am no longer sure I wish to." } },
      choices = {
        { text = "Then you were right to stay.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "No. I have tried, and it comes almost to my lips and then slips away, like a fish in cold water. I remember a white horse, and a banner of blue and silver, and a woman laughing in a garden, but not my own name." } },
      choices = {
        { text = "Blue and silver were Lordaeron's colours.", next = "name_lordaeron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_lordaeron = {
      lines = { { id = "nl_default", text = "Were? You say it as though they are no more. I had hoped, standing here, that the kingdom I served still stood somewhere beyond these trees." } },
      choices = {
        { text = "It fell to the plague and the Scourge.", next = "king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      big = true,
      lines = { { id = "ki_default", text = "<The ghost is silent for a long while, and the faerie lights dim around him.> Then I have kept watch for a crown that no longer exists. Tell me, traveller, should I keep my oath still, or is it ended with the kingdom?" } },
      choices = {
        { text = "Keep it. Your oath is all that's left of Lordaeron's honour.", next = "BACK", reply = "Then I will keep it, and gladly, for it seems I am among the last who can.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's ended. You owe a dead kingdom nothing more.", next = "BACK", reply = "Perhaps you are right, and yet my feet will not move. It seems the oath does not care what either of us thinks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_folk = {
      lines = {
        { id = "ff_default", text = "Pale walkers who pass this way now and then, and stare at me as I stare at them. Some say they serve a queen beneath the old capital, but none has stayed long enough to tell me more." },
        { id = "ff_scourge", when = { race = "Scourge" }, text = "I know only what you show me, which is a dead thing that thinks and grieves. I had believed only ghosts like me were cursed with that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "pr_default", text = "You would do that for a stranger and a shade? Then pray, and I will listen, for I have not heard the Light's words spoken aloud in longer than I can tell. <He bows his translucent head.>" } },
      choices = { { text = "<Pray quietly for the knight.>", next = "BACK", fx = { affinity = 2 } } },
    },
    shadow = {
      lines = { { id = "sh_default", text = "No. I know that darkness, it is what walked through these woods and took my brothers, and I would rather stand here until the stars go out than be freed by it." } },
      choices = { { text = "As you wish. Something else.", next = "BACK", fx = { affinity = -1 } } },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "I served its banner, I am sure of that much. If it has fallen, I would rather you did not tell me how." } },
    _none = { { id = "tp_none", text = "I know only this ring and my oath, traveller, and little of the world beyond it now." } },
  },
}
