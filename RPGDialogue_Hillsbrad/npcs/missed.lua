-- Hillsbrad and Alterac, the folk a roster scan found missing: the Syndicate's captives and hangers-on
-- (Drull, Tog'thar, Elysa, Henchman Valik), Ravenholdt's two outdoor hands, Warden Belamoore of the Lordamere
-- Internment Camp, three out-of-the-way suppliers (Bro'kin, George Candarte, Rizz Loosebolt), the Frostwolf
-- supply officer, and two dwarves at Dun Garok (Rousch, Tamra Stormpike). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Drull: orc warrior of Gol'dir's party, held captive in Durnholde Keep.
P:NPC {
  key = "hb_drull", id = TODO_NPC("Drull"), name = "Drull", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "durnholde" }, temper = { "blunt", "angry" }, values = { "honor", "strength" },
  notices = { "race", "class" },
  impression = {
    first = "Drull is an orc warrior held prisoner by the Syndicate in Durnholde Keep, the same walls that once penned his people. He was more ashamed of being taken alive than afraid of what his jailor might do.",
    third = "{name} found Drull, an orc warrior held captive by the Syndicate in Durnholde Keep.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back again, {class}. My people will hear your name before I am done telling this story, and they will honour it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Speak if you must, but I have not forgotten how you behaved, and these walls have taught me patience with no one." },
    { id = "g_default", text = "You are no Syndicate dog. Speak quickly, {class}, before Jailor Eston comes back with his keys and his whip." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Good, for a warrior who returns is worth ten who promise." },
    { id = "g_free", when = { questDone = TODO_QUEST("The Rescue") }, text = "Lok'tar, {class}! I breathe free air because of you, and I will not forget whose hand opened the lock." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, in this place. Then you feel it too, the stink of the old camps in these stones." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human. You are not one of theirs, or you would have a mask, but stay where I can see your hands." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry your weapon like one who has used it. I would give much to have mine back in my hand beside you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Drull. I came here with Gol'dir and my brothers to learn what the Syndicate was doing in Blackmoore's old fortress, and they were ready for us. Krusk got away, and I did not, and that is the whole of it." },
        { id = "h_free", when = { questDone = TODO_QUEST("The Rescue") }, text = "I am Drull, and I am no man's prisoner now. When my strength is back I will return to Durnholde with an axe, and the jailors will learn how an orc repays a debt." },
      },
      again = {
        { id = "h_again", text = "What more? Ask it before the guard turns." },
        { id = "h_again2", text = "Speak, {class}." },
      },
      choices = {
        { text = "A warrior keeps his word even to his jailors.", next = "BACK", reply = "Then you are a truer orc than most I have known, {class}. Even here, a word given is a blade we still carry.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Lie to the jailors, and smile while you do it.", next = "BACK", reply = "Perhaps that frees a body, but it does not free the spirit. I will escape these walls with my honour, or not at all.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who holds you here?", next = "jailor" },
        { text = "What was your party sent to find?", next = "sent" },
        { text = "This keep was an internment camp once.", next = "camp" },
        { text = "Stay strong, Drull.", next = "END" },
      },
    },
    jailor = {
      lines = { { id = "j_default", text = "A human called Eston carries the key to my irons, and another called Marlgen holds Tog'thar's. They are small men who like to have large prisoners, and they will die surprised.", fx = { learn = { "syndicate" } } } },
      choices = {
        { text = "Where are the others of your party?", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Tog'thar is chained elsewhere in the keep, close enough that I hear him curse them. Gol'dir they took north into the mountains, because he led us and they think a leader knows more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sent = {
      lines = { { id = "s_default", text = "The Warchief wished to know what the Syndicate wanted with Durnholde, and he wished for something that was lost here long ago. I do not question why Thrall wants a thing, for he has earned that from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "It was the chief of them all, where Blackmoore kept orcs like cattle and raised the Warchief as a pit slave. To be chained here now is a shame I will wash out in blood, and not in mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a warrior of the Horde, sent to Hillsbrad at the Warchief's word. I was taken at Durnholde." } },
    syndicate = { { id = "tp_sy", text = "Human thieves in masks. They fight in numbers and from behind, and they hold this keep." } },
    _none = { { id = "tp_none", text = "I know nothing of that. A prisoner hears only keys and boots." } },
  },
}

-- Tog'thar: orc warrior of Gol'dir's party, held captive in Durnholde Keep.
P:NPC {
  key = "hb_togthar", id = TODO_NPC("Tog'thar"), name = "Tog'thar", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "durnholde" }, temper = { "grim", "dry" }, values = { "honor", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "Tog'thar is the second of the orcs the Syndicate holds in Durnholde Keep, struck down by their shadow casters before he could swing. He counts his jailor's footsteps and has plainly been planning something with the numbers.",
    third = "{name} found Tog'thar, an orc warrior held captive by the Syndicate in Durnholde Keep.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and Marlgen is far down the hall. Sit by the bars, {class}, and I'll tell you what I've counted since last time." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Marlgen passes in two hundred breaths, and I'd rather spend them listening for him than talking to you." },
    { id = "g_default", text = "A new face, and no mask on it. Come closer, {class}, and keep your voice below the wind." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Marlgen passes every two hundred breaths, so we have a little time." },
    { id = "g_free", when = { questDone = TODO_QUEST("The Rescue") }, text = "Throm-ka, {class}. I had counted on dying in those chains, and I am glad to have counted wrong." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Blood of my blood, here. Did Krusk send you, or did you find this place on your own nose?" },
    { id = "n_caster", cat = "class", when = { class = { "WARLOCK", "PRIEST", "MAGE" } },
      text = "You deal in spells. So did the ones on the wall who dropped me, so you will forgive me if I watch your hands." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tog'thar. We walked into Durnholde to look around, and we found more swords than we had seen outside a war, with robed men behind them throwing shadow. I woke in irons, with a human called Marlgen holding the key." },
        { id = "h_free", when = { questDone = TODO_QUEST("The Rescue") }, text = "I am Tog'thar, and I owe you a life, which an orc does not say lightly. Drull and I will stand beside you when you call for it." },
      },
      again = {
        { id = "h_again", text = "Ask the rest, and quietly." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Even caged, an orc fights fair or not at all.", next = "BACK", reply = "So I was taught, and so I still believe, though the shadow casters did not return the courtesy.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strangle the jailor in his sleep. Honour is for free orcs.", next = "BACK", reply = "I have thought it, every night, and I am ashamed of how much I have thought it. Do not tempt me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How were you taken?", next = "taken" },
        { text = "What have you learned from in here?", next = "learned" },
        { text = "Krusk still waits for you in Tarren Mill.", next = "krusk" },
        { text = "Hold on, Tog'thar.", next = "END" },
      },
    },
    taken = {
      lines = { { id = "t_default", text = "Their casters struck first, from the walls, and I was on the ground before my axe was clear. A blade I can answer, but there is no honor in a fight where the enemy will not come down and have it." } },
      choices = {
        { text = "The Syndicate keeps sorcerers?", next = "sorcerers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sorcerers = {
      lines = { { id = "so_default", text = "Shadow mages, a few, and well paid by the look of their robes. Thieves do not grow rich enough for that by robbing farmers, so someone with a lord's purse stands behind them.", fx = { learn = { "syndicate" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learned = {
      lines = { { id = "l_default", text = "That the guard changes at dusk, that Marlgen drinks, and that the men here take their orders from a manor to the north. A prisoner has nothing to do but listen, so I have listened well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    krusk = {
      lines = { { id = "k_default", text = "Then he lives, and that is the first good word I have had in this place. Tell him I never thought he ran, for someone had to carry the news out, and he was the fastest of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a warrior of the Horde, of Gol'dir's party. The Syndicate took me at Durnholde." } },
    syndicate = { { id = "tp_sy", text = "Bandits with a noble's coin behind them. Their orders come from the north." } },
    _none = { { id = "tp_none", text = "I cannot tell you. I have seen nothing but this wall for a long time." } },
  },
}

-- Elysa: kept against her will by Lord Aliden Perenolde at Dandred's Fold.
P:NPC {
  key = "hb_elysa", id = TODO_NPC("Elysa"), name = "Elysa", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "syndicate" }, temper = { "frightened", "weary" }, values = { "survival", "freedom" },
  notices = { "race", "class" },
  impression = {
    first = "Elysa lives on the top floor of the manor at Dandred's Fold as the mistress of Lord Aliden Perenolde, and she made it plain that she never chose it. She wears a pendant he gave her and flinches when anyone looks at it.",
    third = "{name} met Elysa, held as Aliden Perenolde's mistress in the manor at Dandred's Fold.",
  },
  greetings = {
    { id = "g_default", text = "W-what do you want? Please, I have nothing to do with what those men are about downstairs." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again. Please say you've not come to change your mind about me." },
    { id = "g_after", when = { questDone = TODO_QUEST("Lord Aliden Perenolde") }, text = "He's dead, then. I heard it through the floor, and I'm ashamed of how glad I was." },
  },
  notice = {
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Please don't hurt me! I never meant your people any harm, and he has had me here against my will." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You came up those stairs without a sound, past all his guards. I used to pray that someone would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My name is Elysa. Lord Perenolde keeps me in this room and calls it an honour, and I have learned to say thank you, because the Syndicate is not kind to people who say anything else." },
        { id = "h_after", when = { questDone = TODO_QUEST("Lord Aliden Perenolde") }, text = "I'm Elysa, and for the first time in a long while that's all I am. The pendant is yours if you want it, for I want no memory of him, so only please leave in peace." },
        { id = "h_gift", when = { questDone = TODO_QUEST("Taretha's Gift") }, text = "You took the pendant and left me alive, and both were kindnesses. I mean to be gone from this house before his men remember that I'm in it." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? Please be quick." },
        { id = "h_again2", text = "Yes? I'm listening." },
      },
      choices = {
        { text = "Who is Aliden Perenolde?", next = "aliden" },
        { text = "That pendant you wear is unusual.", next = "pendant" },
        { text = "How did you come to be here?", next = "how" },
        { text = "What will you do now?", next = "now" },
        { text = "Come with me now. I can get you past his guards.", next = "escape", when = { class = "ROGUE" } },
        { text = "I mean you no harm.", next = "END" },
      },
    },
    aliden = {
      lines = { { id = "a_default", text = "The son of the old king of Alterac, the one who betrayed the Alliance in the war. Aliden calls himself a lord still, and the Syndicate is his court, though it's a court of cut-throats who bow because he pays them.", fx = { learn = { "syndicate", "alterac" } } } },
      choices = {
        { text = "What does he want with Durnholde?", next = "durnholde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durnholde = {
      lines = { { id = "d_default", text = "A kingdom, I think, pieced together out of ruins. He talks at supper about Alterac restored, and his men nod, and then they go out and rob another farm." } },
      choices = {
        { text = "Does he believe his own talk?", next = "believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    believe = {
      lines = { { id = "b_default", text = "Every word of it, and that is what frightens me most. A man who knows he's a thief can be bargained with, but he thinks he is owed all this." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pendant = {
      lines = {
        { id = "p_default", text = "He gave it to me the first week, and he said it was found in the ruins of Durnholde and had belonged to some girl who lived there long ago. I never asked to wear another woman's necklace." },
        { id = "p_after", when = { questDone = TODO_QUEST("Lord Aliden Perenolde") }, text = "Take it, of course you can have it. It belonged to a girl named Taretha once, he said, and I hope she had more joy of it than I did." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    how = {
      lines = { { id = "ho_default", text = "My family had a holding near the lake, and the Syndicate came for its tithe. When there was no coin left, Lord Perenolde said that I would do, and nobody in that room was going to tell him otherwise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    escape = {
      lines = { { id = "es_default", text = "You would, wouldn't you? But if I vanish tonight, he will send his men to my family's farm by morning, so I must wait until he can no longer send anyone anywhere." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    now = {
      lines = { { id = "n_default", text = "Walk south until I stop seeing black masks, I think. Southshore might take me in, if I can cross the hills without meeting his men or a bear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a farmer's daughter by Lordamere Lake before the Syndicate came. I'd like to be nobody again." } },
    syndicate = { { id = "tp_sy", text = "Aliden's men. They call themselves the nobility of Alterac, and they behave like wolves." } },
    alterac = { { id = "tp_al", text = "A fallen kingdom. Aliden speaks of raising it again, and I've never heard him say what for." } },
    _none = { { id = "tp_none", text = "I don't know, truly. They never told me anything, and I was careful not to ask." } },
  },
}

-- Henchman Valik: a wounded Syndicate man on Sofera's Naze who will talk for a mug of Southshore Stout.
P:NPC {
  key = "hb_henchman_valik", id = TODO_NPC("Henchman Valik"), name = "Henchman Valik", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "syndicate" }, temper = { "wry", "resigned" }, values = { "self" },
  notices = { "race", "class" },
  impression = {
    first = "Henchman Valik lies wounded in the Syndicate camp on Sofera's Naze, too badly hurt to run or fight, and he greeted me as the enemy come to finish him. All he asked for was a mug of Southshore Stout, and he offered to talk in exchange.",
    third = "{name} found Henchman Valik, a dying Syndicate man on Sofera's Naze who traded what he knew for a last drink.",
  },
  greetings = {
    { id = "g_default", text = "Urrgh, so this is how it goes, hurt and dying with the enemy standing over me. Well, get on with it, or sit down and listen." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are you? Did you bring me something to drink, or have you only come to finish the job?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Valik") }, text = "Still here, as you see. That stout was the sweetest thing I ever tasted, and I'm making the memory last." },
  },
  notice = {
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "One of the Horde. Your kind does drink, doesn't it? I never thought to ask before we started killing each other." },
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } },
      text = "Don't trouble yourself with mending, {class}. I've seen wounds like this on other men, and I know how the story ends." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Valik, henchman of the Syndicate, for whatever that's still worth. No doubt you'll kill me anyway, but bring me a mug of Southshore Stout first and I'll tell you what you want to know." },
        { id = "h_active", when = { questActive = TODO_QUEST("Valik") }, text = "You know my price, and it's one mug. They brew it in Southshore, and I'd walk there myself if I had the legs for it." },
        { id = "h_done", when = { questDone = TODO_QUEST("Valik") }, text = "You kept your side of it, and I kept mine. That missive won't do me any good where I'm going, so I hope it does somebody harm." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Ask away. Talking takes my mind off the hole in me." },
      },
      choices = {
        { text = "Why Southshore Stout, of all things?", next = "stout" },
        { text = "How did you come by that wound?", next = "wound" },
        { text = "Why does a man join the Syndicate?", next = "join" },
        { text = "Your friends left you here to die.", next = "left" },
        { text = "Let me try to close that wound, Valik.", next = "mend", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "Rest, Valik.", next = "END" },
      },
    },
    stout = {
      lines = { { id = "s_default", text = "Because I grew up within smell of that brewery, before I took the mask. A man facing the end wants the taste of something from when he was honest, and for me that's a dark stout on a cold evening." } },
      choices = {
        { text = "You could have gone home any time.", next = "home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "With what I've done on that road? They'd have hanged me from the dock, and they'd have been right to. No, the stout will have to come to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wound = {
      lines = { { id = "w_default", text = "Your side or the other one, I honestly couldn't say which. Everyone in these hills wants the Syndicate dead, and one of them finally had good aim." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    join = {
      lines = { { id = "j_default", text = "The pay, to begin with, and then because there's no way out but the one I'm taking now. The lords talk about restoring Alterac, but down at my end of it we only ever robbed wagons.", fx = { learn = { "syndicate" } } } },
      choices = {
        { text = "Who gives the orders?", next = "orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      lines = { { id = "o_default", text = "They come down from Lord Perenolde's people in sealed missives, and men like me aren't meant to read them. I carried one, and for a drink I'll forget that I was told to burn it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mend = {
      lines = { { id = "md_default", text = "Kind of you, but save your prayers for somebody with a road ahead of him. Even if you stitched me shut, the first patrol out of Southshore would only open me up again, so I'd sooner have the stout." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    left = {
      lines = { { id = "l_default", text = "They did, and I'd have done the same to any of them. That's the trouble with a brotherhood of thieves, friend, for nobody comes back for you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Southshore born, Syndicate by trade, and dying by degrees. That's all there is." } },
    syndicate = { { id = "tp_sy", text = "Alterac's nobles on top and men like me underneath. Guess which of us ends up on a hillside." } },
    _none = { { id = "tp_none", text = "Can't help you. They never told the henchmen much, and I've forgotten half of that." } },
  },
}

-- Warden Belamoore: Kirin Tor mage in charge of the Lordamere Internment Camp.
P:NPC {
  key = "hb_warden_belamoore", id = TODO_NPC("Warden Belamoore"), name = "Warden Belamoore", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "dalaran" }, temper = { "stern", "precise" }, values = { "order", "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "Warden Belamoore is the Dalaran mage who commands the Lordamere Internment Camp, where the Kirin Tor hold those who trespass against the city. She runs her prison like a library, with everything catalogued and nothing lent out.",
    third = "{name} met Warden Belamoore, the Kirin Tor mage who commands the Lordamere Internment Camp.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and I find I've moved you from the persistent list to the trusted one. That is a rare promotion, so do try to keep it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. You remain off my visitors' list, and I have added a second note beneath your name that you would not enjoy reading." },
    { id = "g_default", text = "This is a prison of the Kirin Tor, and you are not on my list of visitors. Explain yourself, and do it concisely." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You are still not on my list, but I have made a note that you are persistent." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and trained somewhere reputable by the look of your wards. Then you will understand why I do not permit wandering inside these walls." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell the brimstone on you from here. Conduct yourself perfectly, because I have empty cells and very little patience for your kind of study." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "From the south, I take it. Dalaran still honours its old friendships, but it does not relax its rules for them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Warden Belamoore, of the Kirin Tor. Dalaran is rebuilding behind its barrier, and until that work is done, I hold here whoever was caught creeping about its ruins after things that are not theirs." } },
      again = {
        { id = "h_again", text = "Was there something more? Be precise." },
        { id = "h_again2", text = "Continue, but briefly." },
      },
      choices = {
        { text = "The Kirin Tor's law keeps Dalaran's prisoners where they belong.", next = "BACK", reply = "Precisely, and it keeps them fed and catalogued, which is more than their own kind would do for them.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A prison like this is just Dalaran's cruelty with better manners.", next = "BACK", reply = "An interesting opinion, and I've written it down. I'd keep it out of earshot of the guards, if I were you.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Who are your prisoners?", next = "prisoners" },
        { text = "What were they after in Dalaran?", next = "after" },
        { text = "A prison camp in these hills has an ugly history.", next = "history" },
        { text = "Is the camp humane?", next = "yhumane" },
        { text = "Do you miss Dalaran?", next = "ymiss" },
        { text = "Is Dalaran rebuilding well?", next = "ybuild" },
        { text = "A fellow mage. Any advice?", next = "ymage", when = { class = "MAGE" } },
        { text = "I'll not disturb your watch.", next = "END" },
      },
    },
    prisoners = {
      lines = { { id = "p_default", text = "Thieves, spies and scavengers, living and otherwise. I have several of the Forsaken in my cells at present, who came with stolen artefacts in their packs and a great many excuses." } },
      choices = {
        { text = "What becomes of them?", next = "becomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    becomes = {
      lines = { { id = "b_default", text = "They are held until the Council decides, and the Council has weightier business than them. I feed those who eat, I question those who will talk, and I confiscate whatever they carried." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "a_default", text = "Dalaran was the greatest store of magical learning in the human kingdoms, and when Archimonde cast it down, a great deal was left under the rubble. Every power in the north would like a piece of it, and none of them has asked politely.", fx = { learn = { "burning_legion" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history = {
      lines = { { id = "hi_default", text = "You are thinking of Durnholde and the orc camps, and I do not blame you. The difference is that mine holds those who committed a wrong, and I keep a record of each one to prove it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yhumane = {
      lines = {
        { id = "yyhumane_d", text = "As humane as a prison can be. They are fed, they are warm, and they are held only as long as the Kirin Tor require. That is more than the old camps offered the orcs, which I know some will remind me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "yymiss_d", text = "Every day. I was born in the old city, before Arthas came and Archimonde levelled it. The barrier keeps out the curious, and it keeps me out too, until my posting ends." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ybuild = {
      lines = {
        { id = "yybuild_d", text = "Slowly, and carefully, which is the Kirin Tor's way. They rebuild with every stone catalogued and every spell double-checked. Some say the city should open its gates to the refugees first. Others say Dalaran's secrets must be protected above all." },
      },
      choices = {
        { text = "Open the gates. People matter more than secrets.", next = "BACK", reply = "A kind thought. The Council would call it naive.", fx = { align = { order = -1 } } },
        { text = "Protect Dalaran's secrets at all costs.", next = "BACK", reply = "That is the Council's view, and mine, mostly.", fx = { align = { order = 1 } } },
      },
    },
    ymage = {
      lines = {
        { id = "yymage_d", text = "Catalogue everything, trust nothing, and never cast a spell you couldn't explain to a child. That last one is mine, not the Kirin Tor's, but I find it useful." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "ytp_dalaran", text = "Dalaran will rise again. It has before." } },
    kirin_tor = { { id = "ytp_kirin_tor", text = "The Kirin Tor rule Dalaran. I serve them, though I don't always agree with them." } },
    background = { { id = "tp_bg", text = "I am a mage of the Kirin Tor, and this camp is my charge until Dalaran needs it no longer." } },
    burning_legion = { { id = "tp_bl", text = "They destroyed our city in the last war. We are still counting what was lost." } },
    _none = { { id = "tp_none", text = "That does not concern this camp, and so I have no information to give you." } },
  },
}

-- Bro'kin: goblin alchemy supplier on top of the north wall of the Ruins of Alterac.
P:NPC {
  key = "hb_brokin", id = TODO_NPC("Bro'kin"), name = "Bro'kin", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "alterac" }, temper = { "cheerful", "pushy" }, values = { "profit", "curious" },
  notices = { "craft", "weary" },
  impression = {
    first = "Bro'kin is a goblin who sells alchemy supplies from the top of the north wall of the Ruins of Alterac, with a city full of ogres between him and any customer. He considers this an exclusive location, and he said so twice.",
    third = "{name} met Bro'kin, a goblin alchemy supplier perched on the wall of the Ruins of Alterac.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hey, it's my favourite climber! Three times past the ogres now, pal, which makes you practically a shareholder in this stall." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you again. Look, I'll sell to ya, 'cause a sale's a sale, but every copper's up front and I'm watchin' the edge." },
    { id = "g_default", text = "Well, look at that, a customer who made it up the ramp! You're already my favourite, pal, so step right up and mind the edge." },
    { id = "g_back", when = { metBefore = true }, text = "Back through the ogres a second time? Now that's brand loyalty, friend, and I respect it." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Then you didn't climb up here for the view, you came 'cause you heard what I stock, and you heard right." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "A tinkerer, huh? I got a gnome pal out in the Badlands you'd get along with, name of Lotwil, and he only blows himself up on weekdays." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bro'kin's the name, alchemy supplies, finest selection north of Booty Bay. And before you ask, yeah, there's ogres downstairs, and no, they don't bother me, on account of ogres can't figure out ramps." } },
      again = {
        { id = "h_again", text = "What else can I do ya for?" },
        { id = "h_again2", text = "Keep talking, pal, I got all day and no neighbours." },
      },
      choices = {
        { text = "An honest goblin weighs his reagents fair, even up on this wall.", next = "BACK", reply = "Hey, I do! Mostly 'cause anybody who climbs past ogres to buy from me is the kind who comes back to complain.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Up here you can charge whatever you like. Who else is selling?", next = "BACK", reply = "Now that's thinkin', pal! Mind you, I already do, so it's nice to hear you agree with my pricin' model.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why set up shop above a city of ogres?", next = "why" },
        { text = "What do you sell that's worth the climb?", next = "stock" },
        { text = "Don't the ogres ever come up here?", next = "ogres" },
        { text = "How did you get up here in the first place?", next = "yclimb" },
        { text = "Who are your customers, really?", next = "ycust" },
        { text = "Did Alterac fall before you came?", next = "yruins" },
        { text = "Goblin to goblin, is this a smart location?", next = "ygob", when = { race = "Goblin" } },
        { text = "Show me the goods.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Zero rent, zero competition, and anybody who gets here alive has gotta have coin, or they'd never have afforded the armour. It's what we call a self-selecting clientele, friend, and I worked it out on a napkin." } },
      choices = {
        { text = "And the ones who don't make it up?", next = "dont" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dont = {
      lines = { { id = "d_default", text = "Were never gonna buy anything anyway, so that's no loss on my books. Hey, I don't make the ogres, pal, I just price around 'em." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "Vials, the good crystal ones, and a recipe or two you won't find on any shelf in Stormwind or Orgrimmar. I sell to both sides at the same price, 'cause a potion don't care whose flag you drink it under." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ogres = {
      lines = { { id = "o_default", text = "One did, once, by accident, and he was so surprised to see me he walked right off the wall. The Crushridge are great big fellas, sure, but between the lot of 'em they couldn't count their own toes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yclimb = {
      lines = {
        { id = "yyclimb_d", text = "Up the back way, with a rope, two crates and a lot of language. The ogres saw me and laughed so hard one of them fell off a wall, and after that they decided I was funny, not food." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ycust = {
      lines = {
        { id = "yycust_d", text = "Syndicate thugs who don't want to walk to Southshore, adventurers with ogre blood on their boots, and once a very confused paladin. Everybody needs potions up here, pal, and nobody can get them anywhere else." },
      },
      choices = {
        { text = "You sell to the Syndicate?", next = "ysynd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysynd = {
      lines = {
        { id = "yysynd_d", text = "Sure I sell to the Syndicate. Their coin's as round as yours. They're killers and thieves, and I know it, but I'm not their mother, I'm their alchemist." },
      },
      choices = {
        { text = "A trader has no business picking sides.", next = "BACK", reply = "Exactly. You'd do well in the Cartel, friend.", fx = { align = { order = -1 } } },
        { text = "Selling to murderers makes you part of it.", next = "BACK", reply = "Sure, sure. Then you buy all my stock and I'll stop.", fx = { align = { order = 1 } } },
      },
    },
    yruins = {
      lines = {
        { id = "yyruins_d", text = "Long before, pal. The city fell when Lordaeron cut it loose after the war, and the nobles ran off to become the Syndicate. Now ogres live in the palace, and honestly they keep it cleaner." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygob = {
      lines = {
        { id = "yygob_v0", when = { race = "Goblin" }, text = "Smart? It's genius, cousin. No rent, no competition, and a moat made of ogres. You'd have done the same if you'd seen it first." },
        { id = "yygob_d", text = "Smart? It's genius. No rent, no competition, and a moat made of ogres. The only downside is the commute, and I don't commute." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "ytp_syndicate", text = "The Syndicate are Alterac's old nobles turned cutthroats. Good customers, bad tippers." } },
    crushridge = { { id = "ytp_crushridge", text = "The Crushridge ogres run the ruins now. They're loud, but they can't climb." } },
    background = { { id = "tp_bg", text = "Independent trader, Booty Bay papers, and the best spot in Alterac. That's me in one invoice." } },
    alterac = { { id = "tp_al", text = "Used to be a kingdom, now it's ogres and rubble. Cheap real estate, though, I'll say that." } },
    _none = { { id = "tp_none", text = "No idea, pal, and if I had one I'd be selling it." } },
  },
}

-- Rizz Loosebolt: gnome engineering supplier, caged by the ogres of Slaughter Hollow.
P:NPC {
  key = "hb_rizz_loosebolt", id = TODO_NPC("Rizz Loosebolt"), name = "Rizz Loosebolt", title = "Engineering Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "alterac" }, temper = { "frantic", "bright" }, values = { "craft", "survival" },
  notices = { "craft", "race" },
  impression = {
    first = "Rizz Loosebolt is a gnome locked in a cage in Slaughter Hollow, where the Crushridge ogres keep him, and he is still selling engineering supplies through the bars. He asked to be rescued and offered me a price list in the same breath.",
    third = "{name} found Rizz Loosebolt, a gnome engineer caged by ogres in Slaughter Hollow, still open for business.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! My circumstances have improved by roughly eleven percent just from seeing a friendly face, which is a lot for a cage." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'm still in the cage, and you're still not a key, so I suppose we'll just have to be civil about this." },
    { id = "g_default", text = "Oh, thank goodness, somebody who isn't an ogre! You wouldn't happen to have a key, or a crowbar, or failing that, some coin for a few blasting caps?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I'm still in the cage, as you can see, so my circumstances have improved by exactly zero percent." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Splendid, then you'll appreciate that this lock is a triple-tumbler ogre-forged monstrosity that I could open in ninety seconds if it weren't on the outside." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Tell them in Tinker Town that Rizz Loosebolt is alive and mostly uneaten, would you?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rizz Loosebolt, engineering supplies, currently trading from inside a cage for reasons that are not my fault. The ogres took me and my whole stock, and they haven't decided yet whether I'm a pet or a snack." } },
      again = {
        { id = "h_again", text = "Yes, yes, what else? Keep one eye on the cave mouth!" },
        { id = "h_again2", text = "Go on, I'm not going anywhere, obviously." },
      },
      choices = {
        { text = "A tinker should tell you when a blasting cap might misfire.", next = "BACK", reply = "Absolutely, and these misfire about four percent of the time, which I tell everyone, even the ogres.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the ogres the faulty caps and let them blow up.", next = "BACK", reply = "That's either very wicked or very clever, and I've been doing it for weeks, so I hope it's clever.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How did the ogres catch you?", next = "caught" },
        { text = "Can't I just let you out?", next = "out" },
        { text = "You're still selling, in there?", next = "selling" },
        { text = "How long have you been in the cage?", next = "ylong" },
        { text = "What do the ogres feed you?", next = "yfood" },
        { text = "Were you in Gnomeregan when it fell?", next = "yfell", when = { race = "Gnome" } },
        { text = "How do you sell from in there?", next = "ysell" },
        { text = "I'll see your wares, Rizz.", next = "END" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "I was surveying the old Alterac road for a quick route north, with a full cart, and I had calculated a ninety-four percent chance that the ogres would be asleep at that hour. It turns out the remaining six percent is quite large and carries a club." } },
      choices = {
        { text = "Why haven't they eaten you?", next = "eaten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaten = {
      lines = { { id = "e_default", text = "Because I fixed their chieftain's cook-pot, which had a crack in it, and now they think I'm lucky. I've been inventing small repairs ever since, at a rate of about one a day, and I am running out of things to fix." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    out = {
      lines = { { id = "o_default", text = "I've examined the question from every angle the cage allows, and the bars are set in the rock and the key is on an ogre the size of a mill. If you come up with something, I'm extremely open to proposals." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    selling = {
      lines = { { id = "s_default", text = "Naturally! The ogres let me keep the crates because they couldn't work out what any of it was for, and a gnome doesn't stop doing business merely because he's been captured. Besides, I'll need capital when I get out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylong = {
      lines = {
        { id = "yylong_d", text = "Eleven days, by my count, which I keep by scratching the bars. I've also counted the ogres, the bars, and the number of times the big one has looked at me hungrily. That last number is concerning." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfood = {
      lines = {
        { id = "yyfood_d", text = "Turnips, mostly, and once a raw fish that the cook ogre thought was very funny. I've worked out a turnip-powered heater, though, so I'm warm, if not happy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfell = {
      lines = {
        { id = "yyfell_v0", when = { race = "Gnome" }, text = "You know, then. I was out on a sales trip. My workshop was under the main gears, and everything I own is still down there, glowing." },
        { id = "yyfell_d", text = "I was out on a sales trip, which is the only reason I'm alive. My workshop was right under the main gears. Everything I owned is still down there, irradiated and probably glowing." },
      },
      choices = {
        { text = "Gnomeregan should be retaken, whatever it costs.", next = "BACK", reply = "Yes! Mekkatorque says so too. I'll bring the wrenches.", fx = { align = { honor = 1 } } },
        { text = "Let it go. Build something new elsewhere.", next = "BACK", reply = "Sensible. Painful, but sensible. I'll think about it.", fx = { align = { honor = -1 } } },
      },
    },
    ysell = {
      lines = {
        { id = "yysell_d", text = "Cash through the bars, goods through the bars, and absolutely no refunds. The ogres take ten percent of everything, which honestly is a better rate than the Cartel offered." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    crushridge = { { id = "ytp_crushridge", text = "The Crushridge ogres are not clever, but they are many, and they have my keys." } },
    slaughter_hollow = { { id = "ytp_slaughter_hollow", text = "Slaughter Hollow is where the ogres keep their prisoners. The name is not a joke." } },
    background = { { id = "tp_bg", text = "I'm a travelling supplier of engineering parts, temporarily stationary. Very temporarily, I hope." } },
    gnomeregan = { { id = "tp_gn", text = "I lost my workshop when the city fell, and now I've lost my cart to ogres. I'm starting to detect a pattern." } },
    _none = { { id = "tp_none", text = "I haven't the data, I'm afraid, and my sources of news are all ogres." } },
  },
}

-- Rousch: a dwarf who keeps to himself south of Dun Garok.
P:NPC {
  key = "hb_rousch", id = TODO_NPC("Rousch"), name = "Rousch", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "hillsbrad" }, temper = { "gruff", "guarded" }, values = { "self", "practical" },
  notices = { "race" },
  impression = {
    first = "Rousch is a dwarf who stands by himself south of Dun Garok, close enough to see its walls and far enough to be no part of what happens there. He answers to no banner that I could see, and he did not volunteer one.",
    third = "{name} met Rousch, a lone dwarf who keeps his own counsel south of Dun Garok.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Aye, it's ye again. Sit a moment if ye like, for ye're about the only one who comes here wantin' nothin' from me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. I've nae side tae offer ye, nae patience either, so say what ye came tae say an' be off." },
    { id = "g_default", text = "Aye? I'm nae buyin', nae sellin' an' nae recruitin', so if ye want talk, keep it short." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. I've still nae side tae offer ye, if that's what ye came for." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Dinnae start wi' the clan talk, {g:lad|lass}. I've heard every speech they give up at the fort, an' I'm stood down here on purpose." },
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Ye're a long way from yer own lines. I've nae quarrel wi' ye so long as ye've none wi' me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rousch. I keep tae this stretch below Dun Garok, where a dwarf can watch the hills an' the road both, an' be bothered by neither army. That suits me, an' I'll thank ye nae tae ask whose side I'm on." } },
      again = {
        { id = "h_again", text = "What else, then?" },
        { id = "h_again2", text = "Go on, if ye must." },
      },
      choices = {
        { text = "What goes on at Dun Garok?", next = "fort" },
        { text = "You don't take sides in the fighting?", next = "sides" },
        { text = "What do you watch for out here?", next = "watch" },
        { text = "Why don't you join Dun Garok's garrison?", next = "ywhy" },
        { text = "Where did you come from before this?", next = "yfrom" },
        { text = "Do the Forsaken ever trouble you?", next = "yforsaken" },
        { text = "A dwarf with no clan? Tell me, kinsman.", next = "yclan", when = { race = "Dwarf" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    fort = {
      lines = { { id = "f_default", text = "Ironforge's lads hold it, an' the dead folk from Tarren Mill want them out of it. They've been shootin' at each other across that slope since the fort went up, an' the hill's the only one that's gained any ground." } },
      choices = {
        { text = "Will the fort hold?", next = "holdit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holdit = {
      lines = { { id = "ho_default", text = "It's dwarven stone, so the walls will stand long after the garrison's tired of them. Whether there'll be anyone left behind the walls is a different question, an' I'm nae a bettin' dwarf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sides = {
      lines = { { id = "s_default", text = "I've had my fill of sides. Southshore an' Tarren Mill have been killin' each other over these foothills for as long as I've stood here, an' the foothills look just the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Whoever's comin', so I can be elsewhere when they arrive. The yetis come down from the cave when they're hungry, an' they dinnae ask which flag ye salute either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywhy = {
      lines = {
        { id = "yywhy_d", text = "Because I wore a uniform in the Second War, an' I watched what orders did tae good dwarves. Now I watch, an' I don't take orders, an' I sleep a deal better for it." },
      },
      choices = {
        { text = "Then you've given up on duty?", next = "yduty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yduty = {
      lines = {
        { id = "yyduty_d", text = "I've given up on bein' told what duty is. If an orc comes up that road at a child, I'll fight. If a captain tells me tae burn a farm, I'll nae. That's my duty, an' it's mine alone." },
      },
      choices = {
        { text = "Your conscience is the only honest commander.", next = "BACK", reply = "Aye. Glad tae hear someone say it.", fx = { align = { order = -1 } } },
        { text = "Without orders, armies fall apart.", next = "BACK", reply = "Armies fall apart anyway. I've seen it.", fx = { align = { order = 1 } } },
      },
    },
    yfrom = {
      lines = {
        { id = "yyfrom_d", text = "Dun Morogh, long ago, an' then Grim Batol, an' then a long walk north. I'll nae tell ye more than that, for some of it I'm nae proud of an' the rest is nae yer concern." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yforsaken = {
      lines = {
        { id = "yyforsaken_d", text = "They pass by, now an' then, an' they leave me be, for I've nae got anythin' they want. I've seen worse than walkin' dead. I've seen livin' folk do worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yclan = {
      lines = {
        { id = "yyclan_d", text = "Once I'd a clan, an' a hall, an' a name that meant somethin'. Now I've a hill an' a fire. Dinnae pity me, kinsman. I chose it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dun_garok = { { id = "ytp_dun_garok", text = "Dun Garok's a fine old fort, an' the dwarves in it are brave an' stubborn. I wish 'em well, from here." } },
    second_war = { { id = "ytp_second_war", text = "I was there. That's all I'll say, an' it's more than most who weren't will say." } },
    background = { { id = "tp_bg", text = "I'm a dwarf wi' nae banner, an' I like it so. That's all ye'll get from me." } },
    _none = { { id = "tp_none", text = "Nae idea, an' nae interest. Ask someone who's chosen a side." } },
  },
}

-- Tamra Stormpike: spectral dwarf seen in the inner hall of Dun Garok.
P:NPC {
  key = "hb_tamra_stormpike", id = TODO_NPC("Tamra Stormpike"), name = "Tamra Stormpike", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "dun_garok" }, temper = { "fierce", "distant" }, values = { "loyal", "dutiful" },
  notices = { "race", "class" },
  impression = {
    first = "Tamra Stormpike is a dwarf of the Stormpike clan who appears, pale and half there, in the inner hall of Dun Garok. She still walks her post with a rifle in the crook of her arm, and she spoke as though the fort's siege had never paused.",
    third = "{name} met the ghost of Tamra Stormpike, still standing her watch inside Dun Garok.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye've come back tae me again. I'd near forgotten what it was like tae have a friend stop by the hall, an' I'm glad of it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. Ye may pass, since ye're nae one o' the dead, but I'll keep this rifle pointed where it is." },
    { id = "g_default", text = "Who goes there? Ah, ye're nae one o' the dead, so ye may pass, though ye'll forgive me if I dinnae lower the rifle." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come again. Few do, an' fewer speak tae me when they see what I am." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' the mountain. It gladdens what's left of me tae see the hall still has living kin walkin' it." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "Ye carry the Light, an' I feel it like a hearth through a wall. Dinnae try tae send me on, {class}, for my watch isnae done." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye've a marksman's eye. Then ye'll ken a good rifle when ye see one, an' mine never once misfired." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Tamra Stormpike, an' I held this hall wi' rifle an' axe while I had breath tae do it. I've nae breath now, as ye can plainly see, but nobody has relieved me, so here I stand." } },
      again = {
        { id = "h_again", text = "Ask on, living one. I've time enough." },
        { id = "h_again2", text = "Aye? What else?" },
      },
      choices = {
        { text = "A Stormpike's oath holds even after death.", next = "BACK", reply = "Aye, it does, an' that's why I'm still standin' here. I swore tae hold this hall, an' I've nae been relieved.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Your oath died with you. Nobody holds a ghost to her post.", next = "BACK", reply = "Mebbe nae one holds me, but I hold mysel', an' I'll nae hear Dun Garok called forsaken by me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How did you fall?", next = "fall" },
        { text = "Why do you stay?", next = "stay" },
        { text = "Tell me about your rifle.", next = "rifle" },
        { text = "Who held the fort with you?", next = "ywith" },
        { text = "Do you remember the day it fell?", next = "yday" },
        { text = "Is there anything I can do for you?", next = "ydo" },
        { text = "Will you ever rest?", next = "yrest" },
        { text = "Does a dwarf ever forget her clan?", next = "ydwarf", when = { race = "Dwarf" } },
        { text = "Stand easy, Tamra.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "Defendin' this fort against the walkin' dead out o' Tarren Mill, an' I mind little past that. It's a bitter jest, tae die fightin' corpses an' then tae linger on as somethin' nae far from one." } },
      choices = {
        { text = "You're nothing like the Forsaken.", next = "BACK", reply = "Kindly said, an' I'll hold tae it. I serve my clan still, an' nae banshee has a claim on me.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because Dun Garok still stands an' still needs holdin'. A Stormpike doesnae leave a post for a small thing like dyin', an' I'll go tae my rest when the hills are quiet." } },
      choices = {
        { text = "Do the garrison know you're here?", next = "garrison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garrison = {
      lines = { { id = "g_default2", text = "Some o' the lads tip their helms when the lamps burn low, an' some pretend they've seen naught. I take nae offence, for I'd have done the same in their boots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rifle = {
      lines = { { id = "r_default", text = "Forged an' bored in this very fort, an' sighted by my own hand. It's the last true thing I carry, an' it shoots as straight for a shade as it did for a soldier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywith = {
      lines = {
        { id = "yywith_d", text = "My brother Gorrik, my cousin Feyna, an' a dozen others whose names I'll nae forget. They're gone now, all of them. I'm the only one who stayed, an' I'm nae sure why the others didn't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yday = {
      lines = {
        { id = "yyday_d", text = "The Syndicate came first, an' then the ogres, an' then the walls were burnin'. I held the inner door till my arm gave out. I remember the cold, an' then I remember nothin', an' then I was standin' here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydo = {
      lines = {
        { id = "yydo_d", text = "Tell my clan I held. That's all, really. Tell Vanndar's folk in Alterac that Tamra Stormpike never left her post. Maybe then I'll feel I can." },
      },
      choices = {
        { text = "I'll carry your message.", next = "BACK", reply = "Thank ye. That's more than I hoped for.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrest = {
      lines = {
        { id = "yyrest_d", text = "Rest's for them as finished the job. Some say a spirit should let go when the fight's lost. Others say ye hold till yer relieved. I'm a Stormpike. I hold." },
      },
      choices = {
        { text = "Hold, then. Your duty is your honour.", next = "BACK", reply = "Aye. That's the Stormpike way.", fx = { align = { honor = 1 } } },
        { text = "Let go, Tamra. You've done enough.", next = "BACK", reply = "Maybe, someday. But nae today.", fx = { align = { honor = -1 } } },
      },
    },
    ydwarf = {
      lines = {
        { id = "yydwarf_v0", when = { race = "Dwarf" }, text = "A dwarf! Tell me true, kinsman, is the Stormpike banner still flyin' anywhere? I've lost track of the world, standin' here." },
        { id = "yydwarf_d", text = "Ye're a dwarf, then. Tell me true, is the Stormpike banner still flyin' anywhere? I've lost track of the world, standin' here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dun_garok = { { id = "ytp_dun_garok", text = "Dun Garok was a proud fort. I'd see it proud again, if I could." } },
    stormpike = { { id = "ytp_stormpike", text = "The Stormpike are stubborn as stone, an' I'm the most stubborn of the lot." } },
    background = { { id = "tp_bg", text = "I was a Stormpike an' a rifle-dwarf of Dun Garok. I am both yet, after a fashion." } },
    _none = { { id = "tp_none", text = "That's a matter for the livin', an' I've lost the thread o' such things." } },
  },
}
