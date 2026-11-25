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

-- Elder Bladeswift: an ancestor spirit honoured during the Lunar Festival. He stands in Darnassus, near the Cenarion Enclave.
P:NPC {
  key = "darn_elder_bladeswift", id = 15598, name = "Elder Bladeswift", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A spirit in old Kaldorei war-harness, standing as if still on watch.",
    third = "{name} paid respects to Elder Bladeswift, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. The moon is full and the year has turned, and an old warden walks again among his people." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has called me home again. Walk with me a moment, and honour the Sentinels who kept this land." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and I am still at my post. Old habits outlast even death." },
    { id = "g_done", when = { questDone = TODO_QUEST("Bladeswift the Elder") }, text = "My coin is yours already. Guard it as you would guard the borders of Ashenvale." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "NightElf" }, text = "A daughter or son of the Kaldorei. You stand straighter than most of the young ones I see." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "His hand drifts to a glaive that is no longer there.",
      lines = { { id = "h_default", text = "I am Elder Bladeswift, and I stood watch beside the Sentinels long before Teldrassil was planted. Each year at the Lunar Festival my people honour me, and I come back to see that Darnassus is well watched." } },
      again = { { id = "h_again", text = "Speak, {class}. An old warden listens even while he watches." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "I fight with the blade too, Elder.", next = "kin", when = { class = "WARRIOR" } },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I fought in the War of the Ancients beside the Priestess, and I guarded the forests through ten thousand quiet years after. My blade was swift, my eyes were sharp, and my name came honestly." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "Duty holds me, and the people who remember what it cost. Every Sentinel on the walls of Darnassus carries a little of my watch with her." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "You speak like a Sentinel, {class}. The old vigil is what keeps the Kaldorei alive.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "The living do make their own way, but they make it behind walls the dead once held. Do not forget that.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "The Lunar Festival is the turning of the year, when the Kaldorei and our allies honour the elders who came before. Elune smiles on it, and for a few nights her light lets us walk among our descendants." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is the sacred home of the druids, and Elune's light is strongest there when the year turns. Valadar Starsong keeps the festival there, and the elders are drawn to it like moths to a lantern." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "I accept your respect, {class}, and give you the coin of my line. Spend it at the festival, and stand your own watch well." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then fight as a Sentinel does: swift, silent, and only when you must. A blade drawn in anger is a blade drawn too soon." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That lies outside my watch, {class}. Ask the living about it." } },
  },
}

-- Lunar Festival Harbinger: a tauren herald at the moonwell who sends travellers to Moonglade for the Lunar Festival.
P:NPC {
  key = "darn_lunar_festival_harbinger", id = 15895, name = "Lunar Festival Harbinger", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "serene", "welcoming" }, values = { "ancestors", "tradition" },
  notices = { "race", "class" },
  impression = {
    first = "A tauren in festival colours, oddly at home among the night elves.",
    third = "{name} met a Lunar Festival Harbinger in Darnassus, who called the faithful to Moonglade.",
  },
  greetings = {
    { id = "g_default", text = "The year turns, friend, and the moon is full over Teldrassil. Have you heard the call of the Lunar Festival?" },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has begun! The lanterns are lit in Moonglade, and the elders are waiting to be honoured." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Lunar Festival") }, text = "Valadar Starsong waits for you in Moonglade. Go when you are ready, and go with a light heart." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "A druid! You need no directions to Moonglade, I think; your own wings will carry you there." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "The harbinger bows, horns low, and the lantern at his belt sways.",
      lines = { { id = "h_default", text = "I am a harbinger of the Lunar Festival, and I come to the great cities to remind their people that the elders are waiting. The druids of the Cenarion Circle keep the festival in Moonglade, and all who come in peace are welcome there." } },
      again = { { id = "h_again", text = "Ask, friend. The moon will not set while we talk." } },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "Why does a tauren herald serve in Darnassus?", next = "tauren" },
        { text = "How do I reach Moonglade?", next = "travel" },
        { text = "Moonlight on your path, harbinger.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year beneath the full moon, when every people honours its ancestors. The spirits of the elders return to the places they loved, and those who seek them out receive the blessing of their line." } },
      choices = {
        { text = "Where can the elders be found?", next = "elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = { { id = "e_default", text = "Everywhere, friend: in the cities, on the plains, in the deep places under the mountains and even in the burnt lands. Elder Bladeswift stands here in Darnassus, and many more wait for those willing to walk far." } },
      choices = {
        { text = "Honouring the dead is a sacred duty.", next = "BACK", reply = "It is, and the elders feel it when it is done with a true heart.", fx = { align = { light = 1 } } },
        { text = "I'll go for the coins and the fireworks.", next = "BACK", reply = "Ha! Then you will still go, and the elders are not proud. Perhaps you will find more than coins.", fx = { align = { light = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "The Cenarion Circle has tauren druids as well as Kaldorei, and in Moonglade we keep the peace together. The festival belongs to no single people, so its heralds come from many." } },
      choices = {
        { text = "The night elves don't mind?", next = "mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind = {
      lines = { { id = "m_default", text = "Some do, and they watch my horns as if I might trample their gardens. But the Priestess allows the festival heralds in the city, and the moon shines on everyone alike, so I bear the looks gladly." } },
      choices = { { text = "That's generous of you. Something else.", next = "BACK" } },
    },
    travel = {
      lines = { { id = "tr_default", text = "Moonglade lies in the mountains between Felwood and Winterspring, and the road there is long and dangerous. During the festival, though, the moonwells carry those who stand in them and ask for Elune's blessing, so you need not walk at all." } },
      choices = {
        { text = "I'll go to Moonglade, then.", next = "END", reply = "Then seek out Valadar Starsong when you arrive. He will show you the way of the festival." },
        { text = "I will take the druid's road myself.", next = "BACK", when = { class = "DRUID" }, reply = "Of course you will. Fly or teleport as you like; the festival waits." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not my message to carry, friend. Mine is only the moon and the festival." } },
  },
}

---------------------------------------------------------------------------
-- Ancient of Lore: an ancient who keeps the old memories of the kaldorei.
-- Treant voice like dar_protector: slow, Hmmm/Hroom, patient.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_ancient_lore", id = 3468, name = "Ancient of Lore",
  role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "patient", "slow" }, values = { "memory", "knowledge" },
  notices = { "race" },
  impression = {
    first = "A great ancient stands rooted among the trees, bark carved with runes so old the moss has grown into their grooves.",
    third = "{name} listened to an Ancient of Lore speak of the kaldorei's long memory.",
  },
  greetings = {
    { id = "g_default", text = "Hroom. A visitor. Hmmm. Come closer, little one; my hearing is very old, and so is everything else about me." },
    { id = "g_back", when = { metBefore = true }, text = "Hmmm. You again, and so soon. It feels like a heartbeat since you left. It was probably a season." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, text = "Hroom. A child of the kaldorei. I remember your grandmother's grandmother, I think. Or a tree that looked like her." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hroom. I am an Ancient of Lore. I keep the old stories, the ones the kaldorei wrote before they wrote in ink. Ask, and I will remember, slowly." },
      },
      again = { { id = "h_again", text = "Hmmm. Another question? Good. Questions are like rain; they keep an old tree from drying out." } },
      choices = {
        { text = "What do you remember of the Well of Eternity?", next = "well" },
        { text = "What do you think of Teldrassil?", next = "teldrassil" },
        { text = "Thank you, Ancient.", next = "END" },
      },
    },
    well = {
      lines = { { id = "we_default", text = "Hmmm. A lake of light, and the Highborne drinking from it until they were drunk on power. Then the Legion came through, and the lake swallowed the land. Hroom. A sad story, and an old one. The young ones should learn it better." } },
      choices = {
        { text = "The Highborne doomed everyone with their pride.", next = "BACK", reply = "Hmmm. Pride, yes. And hunger. Both grow quickly in the dark.", fx = { align = { order = 1 } } },
        { text = "Magic itself wasn't to blame, only its misuse.", next = "BACK", reply = "Hroom. A dangerous thing to say near the druids. A true one, perhaps.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teldrassil = {
      lines = { { id = "te_default", text = "Hroom. She is young, and she grew very fast. The Archdruid did not ask the dragons' blessing. I feel something in her roots that is not quite right. Hmmm. But I am old, and old trees worry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Darnassus Sentinel: the guards of the city.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_sentinel_guard", id = 4262, name = "Darnassus Sentinel",
  role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "cool", "watchful" }, values = { "duty", "Elune" },
  impression = {
    first = "A tall Sentinel in purple and silver, glaive at rest, watching the walkways with unhurried care.",
    third = "{name} spoke with a Darnassus Sentinel on watch in the city.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Walk in peace in Darnassus, and keep your voice low near the Temple." },
    { id = "g_human", when = { race = "Human" }, text = "Welcome, human. The city is larger than it looks, so ask if you lose your way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The city treats you well, I hope." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am of the Sentinels, sworn to Priestess Tyrande Whisperwind. We keep the peace in Darnassus, and we keep it quietly." },
      },
      again = { { id = "h_again", text = "Anything more? I am on watch, but I can spare a moment." } },
      choices = {
        { text = "Who leads the kaldorei?", next = "leaders" },
        { text = "Why are the Sentinels all women?", next = "women" },
        { text = "Farewell, Sentinel.", next = "END" },
      },
    },
    leaders = {
      lines = { { id = "le_default", text = "High Priestess Tyrande leads us from the Temple of the Moon. Archdruid Fandral Staghelm leads the druids from the Cenarion Enclave. The two do not always agree, and the city feels it." } },
      choices = {
        { text = "The priestess should have the final word.", next = "BACK", reply = "Elune guides her. Most of us believe that.", fx = { align = { order = 1 } } },
        { text = "Perhaps two voices are better than one.", next = "BACK", reply = "Perhaps. It certainly makes for long councils.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    women = {
      lines = { { id = "wo_default", text = "For ten thousand years our men slept in the Dream as druids, and we kept watch while they did. Now the druids wake, but the watch is still ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Lunar Festival Emissary: sends folk to Moonglade during the Lunar Festival.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_lunar_emissary", id = 15892, name = "Lunar Festival Emissary",
  role = "questgiver", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "festive" }, values = { "tradition", "the ancestors" },
  impression = {
    first = "A cheerful druid in festival red and gold, a lantern of moonlight hanging from her staff.",
    third = "{name} met a Lunar Festival Emissary inviting travellers to Moonglade.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, friend. The moon is turning, and Moonglade is waiting for you." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival is upon us! Have you been to Moonglade yet? You must, you simply must." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am an emissary of the Cenarion Circle. Each year, at the Lunar Festival, we call all peoples to Moonglade to honour their elders and remember the defeat of Omen." },
        { id = "h_q", when = { questActive = TODO_QUEST("The Lunar Festival") }, text = "Go to the moonlight at the city's edge and it will carry you to Moonglade. Find Valadar Starsong there; he'll tell you the rest." },
      },
      again = { { id = "h_again", text = "Anything else about the festival? I could talk about it all night." } },
      choices = {
        { text = "Who was Omen?", next = "omen" },
        { text = "Why honour the elders?", next = "elders" },
        { text = "I'll go to Moonglade.", next = "END" },
      },
    },
    omen = {
      lines = { { id = "om_default", text = "A great demon beast who served the Legion in the War of the Ancients. He came to Moonglade, years later, and was driven into Elune's lake, where he sleeps still. Each year we light the sky so he does not wake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elders = {
      lines = { { id = "el_default", text = "Because their wisdom kept our peoples alive. Their spirits wait in cities and wild places across Azeroth, and those who seek them out are given coins of ancestry." } },
      choices = {
        { text = "The old ways deserve honour.", next = "BACK", reply = "They do, and the elders will thank you.", fx = { align = { order = 1 } } },
        { text = "The young should make their own way.", next = "BACK", reply = "They will. But no tree grows without roots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Lunar Festival Vendor: sells fireworks, lanterns and festive goods.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_lunar_vendor", id = 15898, name = "Lunar Festival Vendor",
  role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "bright", "chatty" }, values = { "celebration", "trade" },
  impression = {
    first = "A vendor surrounded by paper lanterns, firework rockets and little red envelopes, all smelling faintly of gunpowder.",
    third = "{name} browsed the wares of a Lunar Festival Vendor.",
  },
  greetings = {
    { id = "g_default", text = "Fireworks, lanterns and festive dress! Everything a soul needs to light the sky." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "It's the Lunar Festival! Buy a rocket, buy a lantern, and send the old year off with a bang." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I sell for the festival: rockets, clusters of fireworks, lanterns and festive clothing. You pay in coins of ancestry for the good things, and coin of the realm for the rest." },
      },
      again = { { id = "h_again", text = "See anything you like? The rockets are very popular this year." } },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Why fireworks, of all things?", next = "why" },
        { text = "What are the little red envelopes for?", next = "envelopes" },
        { text = "Goodbye.", next = "END" },
      },
    },
    envelopes = {
      lines = { { id = "en_default", text = "Those are for giving, friend, not keeping. You tuck a gift inside and hand it to someone you're glad of, and the luck of the new year goes with it. I sell a great many to Sentinels, oddly enough." } },
      choices = {
        { text = "Where do the coins of ancestry come from?", next = "coins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coins = {
      lines = { { id = "co_default", text = "From the elders, of course! Find their spirits across the world, honour them, and each one gives you a coin. Bring those to me and you'll find I have very fine things indeed." } },
      choices = { { text = "Then I'd better start looking.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wh_default", text = "The druids say the lights keep Omen asleep under the lake. Personally, I think people simply like explosions." } },
      choices = {
        { text = "It's a sacred tradition. Respect it.", next = "BACK", reply = "Of course, of course. Sacred explosions, then.", fx = { align = { order = 1 } } },
        { text = "You're right. Explosions are the best part.", next = "BACK", reply = "Finally, someone who understands! Here, look at this one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Treant Ally: a young treant called up to fight beside the kaldorei.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_treant_ally", id = 5806, name = "Treant Ally",
  role = "soldier", tier = "service",
  communities = { "darnassus" }, temper = { "young", "earnest" }, values = { "the forest", "loyalty" },
  impression = {
    first = "A small treant, its bark still green and soft, shuffles beside you with the eagerness of a sapling.",
    third = "{name} walked for a time with a young Treant Ally.",
  },
  greetings = {
    { id = "g_default", text = "Hroom! Hello! I am here to help. Point me at something, and I will help it fall down." },
    { id = "g_back", when = { metBefore = true }, text = "Hmmm! You again. I am pleased. I am still learning what pleased feels like, but I think this is it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hmmm. I was called up from the wood not long ago. The druids say I am an ally, so I am being one. Hroom. It is my first job." },
      },
      again = { { id = "h_again", text = "Hmmm? Is there more to talk about? I like talking. It is like rustling, but with meaning." } },
      choices = {
        { text = "What is it like, being newly woken?", next = "woken" },
        { text = "Who should we fight?", next = "fight" },
        { text = "Come on, little friend.", next = "END" },
      },
    },
    woken = {
      lines = { { id = "wo_default", text = "Hroom. Everything is very loud and very fast. The birds are much bigger than I thought. The older trees tell me I will grow used to it in a few hundred years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fight = {
      lines = { { id = "fi_default", text = "Hmmm. The druids say anything that hurts the forest. The furbolgs who went mad, the creatures of the corruption, the ones with axes. I do not like the ones with axes." } },
      choices = {
        { text = "Then we'll protect every tree we can.", next = "BACK", reply = "Hroom! Yes! Every tree!", fx = { align = { light = 1 } } },
        { text = "Some trees have to fall so people can live.", next = "BACK", reply = "Hmmm. I do not like that. I will think about it for a century.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
