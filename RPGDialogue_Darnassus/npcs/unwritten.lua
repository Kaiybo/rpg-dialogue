-- Darnassus folk with no conversation until now: the three battlemasters of the Warrior's Terrace
-- (Aethalas, Brogun Stoneshield, Keras Wolfheart), Huntress Leafrunner on the walkways,
-- Master Sergeant Moonshadow of the war effort, and Dawnwatcher Selgorm of the Argent Dawn.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Aethalas (Warsong Gulch battlemaster)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_aethalas", id = TODO_NPC("Aethalas"), name = "Aethalas",
  role = "soldier", tier = "service",
  communities = { "darnassus" }, temper = { "fierce", "proud" }, values = { "duty", "vengeance" },
  impression = {
    first = "She speaks of Warsong Gulch the way others speak of a wound.",
    third = "{name} met Aethalas, the Silverwing Sentinel who sends volunteers from Darnassus to fight in Warsong Gulch.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you've come to defend the forest, you've come to the right Sentinel." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {name}. The orcs are still cutting in Warsong Gulch, so there is still work for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aethalas of the Silverwing Sentinels. I gather those willing to stand against the Warsong orcs in the gulch, where they fell our trees and call it lumber." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "You are kaldorei, so you already know what Ashenvale is to us. The Warsong know only that it burns well." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask it quickly; the Sentinels in the gulch can't wait on us." },
        { id = "h_again2", text = "Go on, {name}. I am listening." },
      },
      choices = {
        { text = "What happens in Warsong Gulch?", next = "gulch" },
        { text = "You sound like you've lost friends there.", next = "lost" },
        { text = "Send me to the gulch.", next = "BUSINESS" },
        { text = "Farewell, Aethalas.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gu_default", text = "The Warsong Outriders cut their way into the forest, and we cut them back out. Each side tries to carry off the other's banner, and each banner carried home buys the trees another day." } },
      choices = {
        { text = "Why fight over banners instead of the trees themselves?", next = "banner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    banner = {
      lines = { { id = "ba_default", text = "Because a banner taken shames a warband, and the Warsong care for shame more than they care for timber. Make them ashamed often enough, and fewer of them come back." } },
      choices = {
        { text = "The forest is worth any price we pay.", next = "BACK", reply = "Then you'll do well in the gulch. Remember that when the arrows fly.", fx = { align = { honor = 1 } } },
        { text = "Fighting for flags seems a waste of good soldiers.", next = "BACK", reply = "Perhaps it is. But a waste that keeps the axes back is better than none.", fx = { align = { honor = -1 } } },
        { text = "I see. Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "lo_default", text = "Every Sentinel has lost someone there. I don't talk about mine, and you shouldn't ask anyone else about theirs either; just stand where they stood." } },
      choices = {
        { text = "I'll stand there, then.", next = "BACK", reply = "Good. That is all any of us asks.", fx = { affinity = 1 } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Brogun Stoneshield (Alterac Valley battlemaster)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_brogun", id = TODO_NPC("Brogun Stoneshield"), name = "Brogun Stoneshield",
  role = "soldier", tier = "service", race = "Dwarf",
  communities = { "darnassus" }, temper = { "gruff", "cheerful" }, values = { "duty", "kin" },
  impression = {
    first = "A Stormpike dwarf, very far from his snow and grumbling about it.",
    third = "{name} met Brogun Stoneshield, the Stormpike dwarf in Darnassus who sends recruits to fight in Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Ho there! Ye look like ye could hold a bridge. The Stormpike Guard could use ye in Alterac." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A proper dwarf! Thank the Titans, I was startin' to forget what one looked like among all these trees." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brogun Stoneshield, of the Stormpike Guard. Vanndar sent me all the way to this tree to find folk willin' to fight the Frostwolf clan in Alterac Valley, and I'll not go home empty-handed." },
      },
      again = {
        { id = "h_again", text = "Aye, what else? I've nothin' but time and leaves here." },
        { id = "h_again2", text = "Go on, lad, speak up." },
      },
      choices = {
        { text = "Why are the Stormpike fighting the Frostwolves?", next = "why" },
        { text = "You don't look happy among the trees.", next = "trees" },
        { text = "Send me to Alterac Valley.", next = "BUSINESS" },
        { text = "Farewell, Brogun.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "We came to dig the valley for ore and old relics, and the Frostwolves say it's their home and always was. Now there's blood on the snow every day, and neither side will give an inch of it." } },
      choices = {
        { text = "The valley belongs to whoever can hold it.", next = "why2", fx = { align = { order = -1 } } },
        { text = "If it was their home first, they have a fair claim.", next = "why2", fx = { align = { order = 1 } } },
        { text = "Who leads the Stormpike?", next = "vanndar" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Hmph. Say that loud in Dun Baldar and see who buys yer ale. Either way, there's fighting to be done, and talkin' won't end it." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    vanndar = {
      lines = { { id = "va_default", text = "General Vanndar Stormpike, and a harder old dwarf ye'll never meet. He holds Dun Baldar like it was Ironforge itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trees = {
      lines = { { id = "tr_default", text = "The elves are kind enough, but they've no forge worth the name and their ale tastes like moonlight. I miss a good roof of stone over my head." } },
      choices = {
        { text = "The forge in the Craftsmen's Terrace isn't bad.", next = "BACK", reply = "Aye, I'll give it a look. Can't be worse than nothin'." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Keras Wolfheart (Arathi Basin battlemaster)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_keras", id = TODO_NPC("Keras Wolfheart"), name = "Keras Wolfheart",
  role = "soldier", tier = "service", race = "Human",
  communities = { "darnassus" }, temper = { "earnest", "brisk" }, values = { "duty", "homeland" },
  impression = {
    first = "A soldier of the League of Arathor, recruiting for a war over farmland.",
    third = "{name} met Keras Wolfheart, the League of Arathor's battlemaster in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Well met. The League of Arathor needs every sword it can find for Arathi Basin." },
    { id = "g_human", when = { race = "Human" }, text = "Another human, out here among the trees! It's good to see a face that doesn't make me feel short." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Keras Wolfheart of the League of Arathor. We're fighting the Forsaken's Defilers for Arathi Basin, the farms, the mines and the mill that once fed all of Stromgarde." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "Go ahead. I've time for one more question." },
      },
      choices = {
        { text = "Who are the Defilers?", next = "defilers" },
        { text = "Why recruit in Darnassus, so far from Arathi?", next = "far" },
        { text = "Send me to Arathi Basin.", next = "BUSINESS" },
        { text = "Farewell, Keras.", next = "END" },
      },
    },
    defilers = {
      lines = { { id = "de_default", text = "Forsaken, mostly, sent by their Dark Lady to take the basin for the Horde. They don't eat, so I can't fathom what they want with farms, unless it's to make sure no one else does." } },
      choices = {
        { text = "Then we take the basin back for the living.", next = "def2", fx = { align = { light = 1 } } },
        { text = "Land is land. Whoever holds the mines gets rich.", next = "def2", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    def2 = {
      lines = { { id = "d2_default", text = "However you look at it, the basin needs holding, and the League will pay in honor for every flag you raise there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    far = {
      lines = { { id = "fa_default", text = "Because the kaldorei know what it is to lose land to the Horde, and because Stromgarde can't win this alone. Every ally counts, no matter how far they live." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Huntress Leafrunner (patrols the walkways)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_leafrunner", id = TODO_NPC("Huntress Leafrunner"), name = "Huntress Leafrunner",
  role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "watchful", "dry" }, values = { "duty", "nature" },
  impression = {
    first = "She walks the same paths every day and notices everything on them.",
    third = "{name} met Huntress Leafrunner, who patrols the walkways of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Keep to the paths, traveler, and the city will keep you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'd say you're lost, but you walk like you know exactly where you are going." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Huntress Leafrunner. I walk the paths of Darnassus from the Cenarion Enclave to the Temple Gardens and back, and I see who comes and goes." },
        { id = "h_outsider", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "Outsiders are more common here than they once were. Most of them stare up at the branches and walk into the lake." },
      },
      again = {
        { id = "h_again", text = "Anything more? I have a long round to finish." },
        { id = "h_again2", text = "Ask, then, while I'm standing still." },
      },
      choices = {
        { text = "What do you see on your rounds?", next = "rounds" },
        { text = "Darnassus seems too peaceful to need guarding.", next = "peace" },
        { text = "Farewell, huntress.", next = "END" },
      },
    },
    rounds = {
      lines = { { id = "ro_default", text = "Druids arguing in the Enclave, priestesses walking to the temple, and newcomers asking where the bank is. Lately, also druids muttering about the Arch Druid's new tree, though never loudly." } },
      choices = {
        { text = "What about the new tree?", next = "tree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree = {
      lines = { { id = "tr_default", text = "Teldrassil was Fandral Staghelm's work, and not every druid wanted it, since we were promised no more World Trees. It is not my place to judge, so I walk my rounds and keep my opinions to myself." } },
      choices = {
        { text = "Fandral has given our people a home.", next = "BACK", reply = "He has. I sleep under its leaves gladly enough.", fx = { align = { order = 1 } } },
        { text = "A promise broken is still broken, whatever came of it.", next = "BACK", reply = "Careful, {name}. Some of the Enclave would agree, and some would report you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "pe_default", text = "It seems so, and that is the point of guarding it. A quiet city is one whose guards are doing their work." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Master Sergeant Moonshadow (war effort recruiter)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_moonshadow", id = TODO_NPC("Master Sergeant Moonshadow"), name = "Master Sergeant Moonshadow",
  role = "soldier", tier = "quest",
  communities = { "darnassus" }, temper = { "brisk", "stern" }, values = { "duty", "order" },
  impression = {
    first = "He counts supplies the way other elves count stars.",
    third = "{name} met Master Sergeant Moonshadow, who gathers supplies in Darnassus for the Alliance war effort.",
  },
  greetings = {
    { id = "g_default", text = "You there! Do you have anything to give for the war effort? Every bandage and bar of copper counts." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Alliance Needs Your Help!") }, text = "The Alliance needs your help, {name}. Have you brought anything for the stockpiles?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Master Sergeant Moonshadow. Something stirs in the south of Silithus, and the Alliance is gathering supplies for whatever war comes of it. Darnassus will give its share, and more." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Alliance Needs Your Help!") }, text = "Your name is on my lists, {name}, among those who've given. There are few enough names on it to make yours stand out." },
      },
      again = {
        { id = "h_again", text = "What else? I've stockpiles to count." },
        { id = "h_again2", text = "Speak, {name}. The lists won't wait long." },
      },
      choices = {
        { text = "What's happening in Silithus?", next = "silithus" },
        { text = "What does the war effort need?", next = "needs" },
        { text = "Who decides where the supplies go?", next = "who" },
        { text = "I've brought something to give.", next = "BUSINESS" },
        { text = "A druid should be healing the land, not stockpiling for war.", next = "druid", when = { class = "DRUID" } },
        { text = "Farewell, sergeant.", next = "END" },
      },
    },
    silithus = {
      lines = { { id = "si_default", text = "The Cenarion Circle sends word of insects swarming from the desert, more than anyone has seen in a thousand years. Some of the eldest among us remember another war in that sand, and they do not sleep easily." } },
      choices = {
        { text = "Another war in Silithus?", next = "silithus2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithus2 = {
      lines = { { id = "s2_default", text = "The War of the Shifting Sands, against the qiraji. Fandral's own son died in it, and the bugs were only sealed away, not destroyed. Now the seal grows weak, or so the Circle believes." } },
      choices = {
        { text = "Then we'd better be ready this time.", next = "BACK", reply = "Exactly so. That is why I count copper bars.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs = {
      lines = { { id = "ne_default", text = "Bandages, metal, leather, herbs and food, in amounts you would not believe. The army that marches into Silithus will need to be fed, clothed and mended for a long time." } },
      choices = {
        { text = "Every city should give equally.", next = "needs2", fx = { align = { order = 1 } } },
        { text = "Let those who want to give, give. No one should be forced.", next = "needs2", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs2 = {
      lines = { { id = "n2_default", text = "Ironforge has given a great deal already, and Stormwind somewhat less. I won't have Darnassus come last on that list." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "The commanders in Ironforge keep the final tally, and the supplies go south when the stockpiles are full. My work is to fill ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The Circle itself asked for this, druid. If the qiraji come out of their hive, there will be no land left to heal." } },
      choices = { { text = "Then I'll give what I can.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Dawnwatcher Selgorm (Argent Dawn)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_selgorm", id = TODO_NPC("Dawnwatcher Selgorm"), name = "Dawnwatcher Selgorm",
  role = "questgiver", tier = "quest", race = "Human",
  communities = { "darnassus", "argent_dawn" }, temper = { "earnest", "patient" }, values = { "vigilance", "faith" },
  impression = {
    first = "A human of the Argent Dawn, watching for the Scourge from a city that has never seen one.",
    third = "{name} met Dawnwatcher Selgorm, the Argent Dawn's representative in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you, friend. The Argent Dawn keeps watch here, even this far from the plague." },
    { id = "g_bfd", when = { questActive = TODO_QUEST("Blackfathom Villainy") }, text = "You've come from Blackfathom Deeps? Then you have something to show me, I hope." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dawnwatcher Selgorm of the Argent Dawn. We fight the Scourge in Lordaeron, but we watch for every cult and darkness that would serve it, and some of them have crept into Kalimdor." },
        { id = "h_bfd_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackfathom Villainy"), days = 3 } }, text = "Kelris is dead, then, and the Twilight's Hammer in Blackfathom Deeps has lost its voice. The Dawn thanks you, {name}." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, friend. Vigilance starts with questions." },
      },
      choices = {
        { text = "What darkness has crept into Kalimdor?", next = "bfd" },
        { text = "What is the Argent Dawn?", next = "dawn" },
        { text = "A human in Darnassus must stand out.", next = "human" },
        { text = "The Light has no place among the kaldorei.", next = "light", when = { race = "NightElf" } },
        { text = "Farewell, Dawnwatcher.", next = "END" },
      },
    },
    bfd = {
      lines = { { id = "bf_default", text = "In Blackfathom Deeps, on the coast of Ashenvale, a cult called the Twilight's Hammer worships something that sleeps in the deep. Their leader is a night elf named Twilight Lord Kelris, and our agents want him stopped." } },
      choices = {
        { text = "A night elf, leading a cult?", next = "kelris" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelris = {
      lines = { { id = "ke_default", text = "Even the kaldorei are not proof against whispers in the dark. Argent Guard Thaelrid is in the Deeps already, and he could use help. Bring me Kelris's head, and the Dawn will remember you." } },
      choices = {
        { text = "Darkness must be destroyed wherever it hides.", next = "BACK", reply = "Spoken like a friend of the Dawn.", fx = { align = { light = 1 } } },
        { text = "I'll do it for the reward, not the cause.", next = "BACK", reply = "The Dawn pays either way. Perhaps the cause will find you later.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "da_default", text = "An order of all races, sworn to fight the Scourge and the darkness behind it. Priests, soldiers, scholars, even some of your Cenarion druids. Where the Scourge spreads, we stand against it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    human = {
      lines = { { id = "hu_default", text = "I do, a head shorter than everyone and twice as loud on these wooden floors. But the kaldorei have been kind, and the Dawn goes where it is needed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "Perhaps not, and I'd never preach it here. But Elune's priestesses and my own share an enemy, and that is enough to stand together." } },
      choices = { { text = "That I can accept.", next = "BACK" } },
    },
  },
}
