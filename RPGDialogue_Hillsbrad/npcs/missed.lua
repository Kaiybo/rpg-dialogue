-- Hillsbrad and Alterac, the folk a roster scan found missing (part 1): the Syndicate's captives and
-- hangers-on (Drull, Tog'thar, Elysa, Henchman Valik), Ravenholdt's two outdoor hands, and Warden Belamoore
-- of the Lordamere Internment Camp. Voice: bibles/missed.md
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
        { id = "h_default", text = "I am Tog'thar. We walked into Durnholde to look, and found more swords than we had seen outside a war, with robed men behind them throwing shadow. I woke in irons, with a human called Marlgen holding the key." },
        { id = "h_free", when = { questDone = TODO_QUEST("The Rescue") }, text = "I am Tog'thar, and I owe you a life, which an orc does not say lightly. Drull and I will stand beside you when you call for it." },
      },
      again = {
        { id = "h_again", text = "Ask the rest, and quietly." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
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

-- Carlo Aurelius: Ravenholdt assassin posted outside the manor.
P:NPC {
  key = "hb_carlo_aurelius", id = TODO_NPC("Carlo Aurelius"), name = "Carlo Aurelius", title = "Assassin", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "ravenholdt" }, temper = { "smooth", "watchful" }, values = { "discretion", "loyal" },
  notices = { "class", "stealth" },
  impression = {
    first = "Carlo Aurelius lounges near Ravenholdt Manor as if he had nothing to do, and I am fairly sure he had counted my weapons before I saw him at all. He is one of Lord Ravenholdt's assassins and is polite about it.",
    third = "{name} met Carlo Aurelius, an assassin of Ravenholdt who watches the approach to the manor.",
  },
  greetings = {
    { id = "g_default", text = "Good day. You've come a long way up a path that isn't on any map, so I assume you meant to." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a familiar face. You walk more quietly than you did last time, and I approve." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of the trade, I see. The manor is always pleased to meet talent, provided the talent wipes its feet." },
    { id = "n_loud", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "I heard your armour from the bottom of the hill, friend. I don't say it to offend you, only so you'll know why nobody here was surprised." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Carlo Aurelius, in Lord Ravenholdt's service. My work is to notice who comes up this path and to decide whether they go back down it, and you'll be glad to hear I've decided in your favour." } },
      again = {
        { id = "h_again", text = "Was there something further?" },
        { id = "h_again2", text = "Do go on. I'm in no hurry." },
      },
      choices = {
        { text = "What is Ravenholdt, exactly?", next = "manor" },
        { text = "Who comes up the path uninvited?", next = "uninvited" },
        { text = "The night elf nearby calls herself a landscape architect.", next = "simone" },
        { text = "I'll go on up, then.", next = "END" },
      },
    },
    manor = {
      lines = { { id = "m_default", text = "A private house, with a private guild in it. We train those whose gifts run to locks, shadows and knives, and we take work that people prefer not to see written down." } },
      choices = {
        { text = "Work for whom?", next = "whom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    whom = {
      lines = { { id = "w_default", text = "For whoever Lord Ravenholdt accepts, which is the only rule that matters here. I'll tell you who we never work for, though, and that's the Syndicate." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    uninvited = {
      lines = { { id = "u_default", text = "Syndicate men, mostly, looking for the house so that they can burn it. Their lords were Alterac's nobility, and they've never forgiven Ravenholdt for refusing to bow to a traitor king's son.", fx = { learn = { "syndicate" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    simone = {
      lines = { { id = "s_default", text = "Simone? She is one, in her way. She has rearranged these hills very thoughtfully, and a good many Syndicate scouts are now a permanent part of the scenery." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I serve the manor. Where I served before is a question we don't ask each other here." } },
    syndicate = { { id = "tp_sy", text = "Our neighbours and our enemies. They have numbers, and we have everything else." } },
    _none = { { id = "tp_none", text = "I couldn't possibly say. One hears so little, up here." } },
  },
}

-- Simone Cantrell: night elf "Landscape Architect" of Ravenholdt.
P:NPC {
  key = "hb_simone_cantrell", id = TODO_NPC("Simone Cantrell"), name = "Simone Cantrell", title = "Landscape Architect", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "ravenholdt" }, temper = { "serene", "sly" }, values = { "patience", "nature" },
  notices = { "race", "class" },
  impression = {
    first = "Simone Cantrell is a night elf in Ravenholdt's service who gives her profession as landscape architect and tends the grounds around the manor. The longer she talked about where things are planted, the less I thought she meant flowers.",
    third = "{name} met Simone Cantrell, the night elf who keeps the grounds, and their secrets, at Ravenholdt Manor.",
  },
  greetings = {
    { id = "g_default", text = "Walk where the grass is worn, traveller, and nowhere else. I have put a great deal of thought into the rest." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and you kept to the path. I noticed, and I was grateful." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah. It is strange to meet one of our people here, so far from the boughs, and I see you find it as strange to meet me." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle. You will feel what I have done to this hillside, and I ask you to believe that the land did not object." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Simone Cantrell, and I shape the land around this house. A hedge in the right place, a slope cut a little steeper, a stand of pine where a watcher might wish to stand unseen: these are a garden's work, and a fortress's too." } },
      again = {
        { id = "h_again", text = "What else would you ask of me?" },
        { id = "h_again2", text = "Speak. The garden will wait." },
      },
      choices = {
        { text = "So the garden is a defence.", next = "defence" },
        { text = "What brings a night elf to Ravenholdt?", next = "why" },
        { text = "Carlo says your work swallows Syndicate scouts.", next = "carlo" },
        { text = "I'll keep to the path.", next = "END" },
      },
    },
    defence = {
      lines = { { id = "d_default", text = "Every garden is one, if you think as its planter thinks. The path you climbed shows itself to the manor's windows at four turnings, and you did not notice a single one of them." } },
      choices = {
        { text = "And off the path?", next = "off" },
        { text = "Something else.", next = "BACK" },
      },
    },
    off = {
      lines = { { id = "o_default", text = "Off the path the ground is softer than it looks, and some of what grows there was chosen for its thorns. I will say no more, because a garden should keep a few surprises." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "I have walked this world for a very long time, and in all of it I have met few who understand patience. Lord Ravenholdt does, and so I lend him mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    carlo = {
      lines = { { id = "c_default", text = "Carlo exaggerates, though he does it charmingly. The Syndicate sends men to find us, and the hills are steep, and I merely see to it that the hills are not blamed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am kaldorei, and I tend the grounds of Ravenholdt. The rest is my own affair." } },
    syndicate = { { id = "tp_sy", text = "Hasty men in masks. They trample what they do not understand, and the land answers them." } },
    _none = { { id = "tp_none", text = "I do not know, and I am content not to. Ask within the manor." } },
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
    { id = "g_default", text = "This is a prison of the Kirin Tor, and you are not on my list of visitors. Explain yourself, and do it concisely." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You are still not on my list, but I have made a note that you are persistent." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and trained somewhere reputable by the look of your wards. Then you will understand why I do not permit wandering inside these walls." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell the fel on you from here. Conduct yourself perfectly, because I have empty cells and very little patience for your kind of study." },
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
        { text = "Who are your prisoners?", next = "prisoners" },
        { text = "What were they after in Dalaran?", next = "after" },
        { text = "A prison camp in these hills has an ugly history.", next = "history" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a mage of the Kirin Tor, and this camp is my charge until Dalaran needs it no longer." } },
    burning_legion = { { id = "tp_bl", text = "They destroyed our city in the last war. We are still counting what was lost." } },
    _none = { { id = "tp_none", text = "That does not concern this camp, and so I have no information to give you." } },
  },
}
