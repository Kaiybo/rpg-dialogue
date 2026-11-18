-- Darnassus, folk the roster scan found missing (3 of 3): the Cenarion Enclave, the Temple and its
-- gardens, the Warrior's Terrace, and those who walk the city's paths. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Alaindia: wandering reagent vendor (Temple of the Moon, the Temple Gardens).
P:NPC {
  key = "dar_alaindia", id = TODO_NPC("Alaindia"), name = "Alaindia", title = "Reagents", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "serene", "wandering" }, values = { "devotion", "service" },
  notices = { "class" },
  impression = {
    first = "Alaindia carries her reagents in a satchel and walks the paths between the Temple of the Moon and its gardens. She never keeps a stall, on the grounds that those who need her are seldom standing still either.",
    third = "{name} met Alaindia, who wanders the Temple Gardens of Darnassus selling reagents.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. You have found me, which is the difficult part, so tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again, and on a different path. What have you run short of this time?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ishnu-alah. The gardens are at their best under the moon, and I am glad you have come to see them so." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You are bound for the Temple, I think, or have just come from it. I keep what a priest needs nearest the top of my bag." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid would look for Cyroen in the Enclave, as a rule. But I have seeds and thorns as well, if I am the nearer of the two." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Alaindia. I sell the small things that prayers and spells consume, and I walk while I do it, because a priestess who finds herself short of a candle should not have to cross the whole city for one." } },
      again = {
        { id = "h_again", text = "What else, before the path takes me on?" },
        { id = "h_again2", text = "Yes? Walk with me a little, if you like." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Why do you never stay in one place?", next = "walk" },
        { text = "Tell me about the Temple Gardens.", next = "gardens" },
        { text = "Goddess go with you.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "I served in the Temple once, and I found that I prayed best with my feet moving. The High Priestess was kind enough to say that Elune hears a walking prayer as well as a kneeling one, so I walk still, and I have made myself useful along the way." } },
      choices = {
        { text = "What do you pray for?", next = "pray" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "p_default", text = "For the tree to grow well, and for the young ones who leave it to come home. I say the second prayer more often of late, because so many more of them are leaving than once did." } },
      choices = { { text = "May they all come home. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gardens = {
      lines = { { id = "g_default", text = "They lie around the Temple of the Moon like a held breath. Voloren sells fishing lines by the water and Talaelar sells what is caught, and otherwise there is little but the lake and the light on it, which is how the Sisters wish it to be." } },
      choices = { { text = "A peaceful place. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a novice of the Temple, long ago. Now I carry a satchel around it, and I am content." } },
    sisterhood_of_elune = { { id = "tp_sis", text = "I serve the Sisters still, in my fashion. Somebody must keep them in candles." } },
    _none = { { id = "tp_none", text = "I do not know, {class}. Ask at the Temple, where the Sisters know a great deal more than I do." } },
  },
}

-- Anishar: rogue trainer in the Cenarion Enclave, beside Syurna and Erion Shadewhisper.
P:NPC {
  key = "dar_anishar", id = TODO_NPC("Anishar"), name = "Anishar", title = "Rogue Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "wry", "guarded" }, values = { "cunning", "discretion" },
  notices = { "class" },
  impression = {
    first = "Anishar trains rogues in the shadowed hollow beneath the Cenarion Enclave, and he is the least forbidding of the three who teach there. He smiles more than Syurna does, though it would be a mistake to take that for trust.",
    third = "{name} met Anishar, a rogue trainer in the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_default", text = "Well met, stranger. You have wandered rather far down for someone who is only looking at the trees." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of ours, and I did not hear you until the last stair. That is better than most manage, so come in." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I shall begin to think you like the dark." },
  },
  notice = {
    { id = "n_notrogue", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "All that armor, and you came down the stair like a rockslide. I mean no offence, friend, but we felt you coming through the floor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I am Anishar. Syurna will teach you and say six words while she does it, Erion will teach you and tell you whom not to trust, and I will teach you and let you ask why, so choose as suits your temper." },
        { id = "h_default", text = "I am Anishar, and I teach those who work unseen. You are not one of them, so I can offer you nothing but conversation, though I will say that mine is better than Syurna's." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on. Nobody here is listening who should not be." },
      },
      choices = {
        { text = "Train me, Anishar.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Why do night elves need rogues?", next = "need" },
        { text = "An odd place for your kind, among druids.", next = "druids" },
        { text = "I'll leave you to the shadows.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "For the same reason a forest needs owls. The Sentinels are the eagles, seen and feared, and there is always work that must be done by something quiet which is not seen at all." } },
      choices = {
        { text = "What sort of work?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Watching, for the most part, which is duller than the stories have it. We learn who is cutting in Ashenvale and who is paying them, and now and then a camp wakes to find its axes gone and its foreman very frightened.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Frightened is better than dead. Something else.", next = "BACK" } },
    },
    druids = {
      lines = { { id = "d_default", text = "The druids tolerate us because we ask for nothing and make no noise, and the roots down here keep a secret well. I think it amuses the Arch Druid to have us underfoot, though I would not care to ask him." } },
      choices = { { text = "Wise not to ask. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have worked unseen for a long time, and I teach it now. More than that I do not tell." } },
    warsong = { { id = "tp_ws", text = "Loud, strong and careless with their camps at night. We learn a good deal from them." } },
    _none = { { id = "tp_none", text = "If I knew, friend, I might not say. As it happens, I do not know." } },
  },
}

-- Corand: a quiet tracker who keeps to the Cenarion Enclave.
P:NPC {
  key = "dar_corand", id = TODO_NPC("Corand"), name = "Corand", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "watchful" }, values = { "patience", "nature" },
  notices = { "class" },
  impression = {
    first = "Corand keeps to the Cenarion Enclave and looks at the ground more than at the people who walk on it. He can say who passed an hour ago, and which of them was limping.",
    third = "{name} met Corand, a quiet tracker in the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You favour your left foot a little, so I would guess at a long road and a poor boot." },
    { id = "g_back", when = { metBefore = true }, text = "I knew your step before you spoke. Welcome back to the Enclave." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter reads the ground as I do, or ought to. Tell me, what crossed this path before you, and how long ago?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "My name is Corand. I track, which means only that I pay attention to what everybody else steps over, and the Enclave is a good place to practise, since so many who pass through it have four feet for half the day." } },
      again = {
        { id = "h_again", text = "Ask what you will." },
        { id = "h_again2", text = "Yes? I am listening, and looking." },
      },
      choices = {
        { text = "What can you tell from a track?", next = "track" },
        { text = "Do you hunt, then?", next = "hunt" },
        { text = "I'll leave you to your watching.", next = "END" },
      },
    },
    track = {
      lines = { { id = "t_default", text = "I can tell the weight, the haste and the mood, if the ground is soft. A frightened creature digs in its toes, a hunting one sets each foot down as though it were made of glass, and a druid in bear shape forgets and walks like someone with somewhere to be." } },
      choices = {
        { text = "What is the strangest track you've found here?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "Gnome prints, the first time I saw them, because I took them for a child's and could not understand why a child was carrying so much iron. I have learned better since, and the gnome in question has forgiven me." } },
      choices = { { text = "An easy mistake. Something else.", next = "BACK" } },
    },
    hunt = {
      lines = {
        { id = "hu_hunter", when = { class = "HUNTER" }, text = "Seldom, these days. I find the creature and then I leave it be, which you may think is half a hunt, but I have had my fill of the other half." },
        { id = "hu_default", text = "I did once. Now I follow a trail to its end, look at what made it, and go home, and I find that I am as satisfied as I ever was with a kill." },
      },
      choices = { { text = "There's a peace in that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I track, and I keep to the Enclave. There is not much else to tell about me." } },
    _none = { { id = "tp_none", text = "That has left no trail that I can follow, friend." } },
  },
}

-- Crildor: walks slowly between the Cenarion Enclave and the Temple Gardens, and sits by the lake.
P:NPC {
  key = "dar_crildor", id = TODO_NPC("Crildor"), name = "Crildor", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "content" }, values = { "peace", "fellowship" },
  notices = { "weary" },
  impression = {
    first = "Crildor walks slowly between the Cenarion Enclave and the Temple Gardens and stops to sit by the lake whenever it pleases him. He has the air of someone with nowhere he would rather be.",
    third = "{name} met Crildor, who walks the quiet paths of Darnassus and rests beside the lake.",
  },
  greetings = {
    { id = "g_default", text = "Well met, friend. There is no need to hurry on my account, since I never do." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it is you again. Sit a while, if the road will let you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. The moon is on the water tonight, and I was only just thinking that somebody ought to share it." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { minLevel = 40 },
      text = "You have travelled a long way, and I can see it in how you stand. The lake is a good place to set all of that down for a moment." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Crildor. I walk from the Enclave to the gardens and back again, and when my legs have had enough I sit by the water and watch people go past, which is a finer occupation than it sounds." } },
      again = {
        { id = "h_again", text = "What else shall we talk of?" },
        { id = "h_again2", text = "Go on, friend. I have the time." },
      },
      choices = {
        { text = "What do you see, watching people?", next = "see" },
        { text = "Do you never tire of the same path?", next = "path" },
        { text = "Rest well, Crildor.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "I see travellers from everywhere, all of them in a great hurry and most of them kind underneath it. They come in small companies, strangers who met on a road and decided to look after one another, and I never grow tired of seeing that." } },
      choices = {
        { text = "You think well of strangers.", next = "strangers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers = {
      lines = { { id = "st_default", text = "I have found that it is usually warranted, friend. Most people will share a fire and a tale if you only ask them, and those who gather others around them leave more behind than they ever know." } },
      choices = { { text = "I'll remember that at my next fire. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    path = {
      lines = { { id = "p_default", text = "It is never the same path twice. The light changes, the faces change, and now and then a druid forgets himself and goes by as a cat, and I would be sorry to have missed any of it by wanting to be elsewhere." } },
      choices = { { text = "A good way to see it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I walk, and I sit by the lake, and I am glad of the company that passes." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend. Sit down a moment anyway, for it may come to one of us." } },
  },
}

-- Cyroen: reagent vendor in the Cenarion Enclave.
P:NPC {
  key = "dar_cyroen", id = TODO_NPC("Cyroen"), name = "Cyroen", title = "Reagents", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "earthy", "unhurried" }, values = { "nature", "balance" },
  notices = { "class" },
  impression = {
    first = "Cyroen sells seeds, thorns and other reagents in the Cenarion Enclave, and he has soil worked into the lines of his hands. He talks about a wild thornroot as other merchants talk about fine silk.",
    third = "{name} met Cyroen, who sells reagents in the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Everything I sell grew somewhere not far from here, and I can tell you where if you ask." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and I hope that what I sold you was put to good use." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and welcome to the Enclave. I keep seeds for you that are still living, since the old workings will not answer to a dead one." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I have nothing for your craft, warlock, and I would ask you to stand clear of the seed trays. Some of them are sensitive to that kind of company." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Cyroen. The druids here use up seeds and thorns in their workings, and I see that they never have to stop in the middle of one to go digging for more." } },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak on. Nothing here grows quickly, and that includes me." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "What does a druid need with a seed?", next = "seed" },
        { text = "How fares the Enclave?", next = "enclave" },
        { text = "May your garden thrive.", next = "END" },
      },
    },
    seed = {
      lines = { { id = "s_default", text = "A seed is a promise that something will live, and the greatest of the druids can call on that promise for one who has fallen. I do not understand it more deeply than that, for I only grow them, and I grow them with great care." } },
      choices = {
        { text = "Do seeds grow well on Teldrassil?", next = "grow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Most do, but not all, and fewer than in the first years. I lose a tray now and then to a blight I cannot name, and the druids look grave when I show them and say very little.", fx = { learn = { "teldrassil" } } } },
      choices = { { text = "That is troubling to hear. Something else.", next = "BACK" } },
    },
    enclave = {
      lines = { { id = "e_default", text = "It is busy, and not always of one mind. The Arch Druid has his plans for the tree and the elder druids have their doubts about them, and I keep to my seed trays, which have never once raised their voices at me.", fx = { learn = { "cenarion_circle" } } } },
      choices = { { text = "Seeds are better company. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grow what the druids need and sell it in the Enclave. I am no druid myself, only a gardener." } },
    teldrassil = { { id = "tp_tel", text = "Something in the soil is not right. I am a gardener and not a healer, but any gardener can tell." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids keep the balance, or they try to. They do not always agree on how." } },
    _none = { { id = "tp_none", text = "That does not grow in my garden, friend. Ask one of the druids." } },
  },
}

-- Faelyssa: nimble-fingered, keeps to the Cenarion Enclave near the rogue trainers.
P:NPC {
  key = "dar_faelyssa", id = TODO_NPC("Faelyssa"), name = "Faelyssa", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "sly", "amused" }, values = { "cleverness", "patience" },
  notices = { "class" },
  impression = {
    first = "Faelyssa idles in the Cenarion Enclave turning a bent sliver of metal over and over in her fingers. She looked at the clasp on my pack for one moment longer than was polite.",
    third = "{name} met Faelyssa, a clever-fingered night elf in the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_default", text = "Well met. That is a sturdy lock on your pack, and I mean that only as a compliment." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and you have changed the clasp, which is wise of you if a little hurtful." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You carry picks in your left sleeve, where a careful person would. I would move them an inch higher, because they clink when you bow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Faelyssa. I have no stall and no students, only an interest in the things people fasten shut and what they believe that fastening is worth." } },
      again = {
        { id = "h_again", text = "Something else? I am not going anywhere." },
        { id = "h_again2", text = "Ask, and I may even answer." },
      },
      choices = {
        { text = "You pick locks.", next = "locks" },
        { text = "What keeps you in the Enclave?", next = "enclave" },
        { text = "I'll keep a hand on my pack.", next = "END" },
      },
    },
    locks = {
      lines = {
        { id = "l_rogue", when = { class = "ROGUE" }, text = "I open them, which is a politer word, and you know as well as I do that the whole of the art is patience. Practise on your own strongbox until your fingers know the pins without your eyes." },
        { id = "l_default", text = "I open them, which is a politer word. A lock is a small riddle that somebody was certain nobody could answer, and I have always found that kind of certainty hard to leave alone." },
      },
      choices = {
        { text = "And what do you take, once it's open?", next = "take" },
        { text = "Something else.", next = "BACK" },
      },
    },
    take = {
      lines = { { id = "t_default", text = "Nothing at all, which disappoints everybody who asks. I close it again and go away knowing something that its owner does not, and I find that worth more to me than whatever was in the box." } },
      choices = { { text = "A strange sort of honesty. Something else.", next = "BACK" } },
    },
    enclave = {
      lines = { { id = "e_default", text = "I have friends in the hollow below, where Syurna and Anishar teach. They do not ask me what I am doing, and I do not ask them, and so it is the most restful company in Darnassus." } },
      choices = { { text = "I can believe it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I open things that are shut. I do it for the pleasure of it, and for nothing else." } },
    _none = { { id = "tp_none", text = "That is one door I have not opened. Try somebody else." } },
  },
}

-- Fyrenna: food & drink on the Warrior's Terrace.
P:NPC {
  key = "dar_fyrenna", id = TODO_NPC("Fyrenna"), name = "Fyrenna", title = "Food & Drink", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "no-nonsense" }, values = { "care", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "Fyrenna sells food and drink on the Warrior's Terrace and feeds the Sentinels whether or not they remember to ask. She has the manner of someone used to being obeyed about meals.",
    third = "{name} met Fyrenna, who sells food and drink on the Warrior's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Have you eaten today? I mean a real meal, and not whatever you chewed on the road." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and looking thinner than when you left. Sit down, and I will find you something." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You have been at the training ground, by the sweat on you. Drink some water before you ask me for anything stronger." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I shall tell you before you ask that I have moonberry juice and spring water, and that the ale you want is down in Rut'theran, if it is anywhere." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Fyrenna. The warriors train here from moonrise until they drop, and I see to it that they drop onto a full stomach, because nobody ever swung a blade well on an empty one." } },
      again = {
        { id = "h_again", text = "What else, then? Speak, and eat while you do." },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Do the Sentinels forget to eat?", next = "forget" },
        { text = "What do night elves eat before a fight?", next = "eat" },
        { text = "My thanks, Fyrenna.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "They forget constantly, because they are proud of how little they need. A Sentinel will stand a watch from dusk to dawn on a handful of berries and call that discipline, and I call it foolishness and send bread up to the walkways." } },
      choices = {
        { text = "Do they thank you for it?", next = "thank" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thank = {
      lines = { { id = "t_default", text = "Sildanair nods to me, which from her is a speech. The young ones thank me properly, though they wait until their captains are not looking." } },
      choices = { { text = "A nod is something. Something else.", next = "BACK" } },
    },
    eat = {
      lines = { { id = "e_default", text = "They eat lightly, and they eat early. Bread, fruit and a little cheese will do, and nothing heavy, since you cannot fight from the trees with a roast boar sitting in you. Afterwards is another matter, and I keep the good things for then." } },
      choices = { { text = "I'll save my appetite. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fed warriors for longer than I care to count. They are no better at feeding themselves than they ever were." } },
    sentinels = { { id = "tp_sen", text = "They are our shield, and half of them are hungry. I do what I can about the second part." } },
    _none = { { id = "tp_none", text = "I do not know about that. Eat something, and then go and ask Sildanair." } },
  },
}

-- Huntress Ravenoak: mounted patrol on the walkways of Darnassus. Brisk.
P:NPC {
  key = "dar_huntress_ravenoak", id = TODO_NPC("Huntress Ravenoak"), name = "Huntress Ravenoak", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "stern" }, values = { "dutiful", "vigilant" },
  notices = { "class" },
  impression = {
    first = "Huntress Ravenoak rides the walkways of Darnassus on patrol and does not slow her nightsaber for conversation. She answers a question in the time it takes the cat to draw two breaths.",
    third = "{name} met Huntress Ravenoak on patrol in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Keep to the side of the walkway, {class}. If you have something to ask, ask it while I ride." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Be brief, for I have the rest of the round still to make." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. The night watch is the true watch, so say what you need and let me keep it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your beast close while you are in the city, hunter. My saber does not care for strangers, and I will not have a quarrel on the walkway." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Huntress Ravenoak, of the Sentinels. I ride the walkways of the city from the Warrior's Terrace to the Temple and back, and Huntress Skymane rides them the other way." } },
      again = {
        { id = "h_again", text = "Anything more? Quickly, now." },
        { id = "h_again2", text = "Speak. I am still riding." },
      },
      choices = {
        { text = "What do you watch for, inside the city?", next = "watch" },
        { text = "Darnassus seems peaceful enough.", next = "peace" },
        { text = "Ride on, Huntress.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "I watch for anyone who walks as if they did not wish to be seen. This city stands in the crown of a tree and has few doors, and the Horde has more than once sent those who believed that made it easy to enter." } },
      choices = {
        { text = "And what became of them?", next = "became" },
        { text = "Something else.", next = "BACK" },
      },
    },
    became = {
      lines = { { id = "b_default", text = "They learned how quickly a nightsaber covers a walkway, and those who lived carried the lesson home with them. I would rather be feared for a patrol than mourned for a lapse." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    peace = {
      lines = { { id = "p_default", text = "It is peaceful because somebody rides this round every hour of the day and the night. Enjoy it, {class}, and do not mistake it for something that happens without being kept." } },
      choices = { { text = "Then I thank you for keeping it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a huntress of the Sentinels, and this patrol is my post. That is all you need to know of me." } },
    sentinels = { { id = "tp_sen", text = "We guard what remains to our people. We do it mounted, and we do not sleep on watch." } },
    _none = { { id = "tp_none", text = "That is no matter for the patrol. Ask at the Warrior's Terrace." } },
  },
}

-- Huntress Skymane: the other mounted patrol; a shade warmer than Ravenoak.
P:NPC {
  key = "dar_huntress_skymane", id = TODO_NPC("Huntress Skymane"), name = "Huntress Skymane", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "proud" }, values = { "dutiful", "loyal" },
  notices = { "race" },
  impression = {
    first = "Huntress Skymane patrols the walkways of Darnassus on a great nightsaber, and one of her hands is always in its ruff. She is brisk with people, and noticeably gentler with the cat.",
    third = "{name} met Huntress Skymane on her patrol of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. Walk beside us if you must speak, for the patrol does not stop." },
    { id = "g_back", when = { metBefore = true }, text = "I know your face. Say what you need while the saber is in a patient mood." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You are a guest of Darnassus, and you will be treated as one. Stay on the walkways, and do not carry open flame beneath the boughs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Huntress Skymane, of the Sentinels. Ravenoak and I ride the city's paths in turn, so that no stretch of walkway goes long without eyes upon it." } },
      again = {
        { id = "h_again", text = "What else? Be quick about it." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "That is a fine nightsaber.", next = "saber" },
        { text = "What is Huntress Ravenoak like?", next = "ravenoak" },
        { text = "Safe patrol, Huntress.", next = "END" },
      },
    },
    saber = {
      lines = {
        { id = "s_hunter", when = { class = "HUNTER" }, text = "She is, and you have an eye for it, hunter. I raised her from a cub, and she has carried me through things that I would not have ridden into on any other back." },
        { id = "s_default", text = "She is the finest in the city, though every huntress will tell you the same of her own. I raised her from a cub, and we have not been parted for a day since." },
      },
      choices = {
        { text = "May I come closer?", next = "closer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    closer = {
      lines = { { id = "c_default", text = "You may look, but keep your hands at your sides. She will bear a stranger near her so long as I am calm, and I am calm so long as nobody reaches for her ears." } },
      choices = { { text = "Hands at my sides, then. Something else.", next = "BACK" } },
    },
    ravenoak = {
      lines = { { id = "r_default", text = "She is sterner than I am, and the better rider, though I will deny having said it. We have shared this round for many years, and I have never once found her post empty when I reached it." } },
      choices = { { text = "High praise among Sentinels. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a huntress of the Sentinels, and I ride the walkways of Darnassus with my saber." } },
    sentinels = { { id = "tp_sen", text = "We are the watch of the kaldorei, by day and by night. I am proud to ride among them." } },
    _none = { { id = "tp_none", text = "I cannot help you with that, and I cannot stop to try. Ask a Sentinel who is standing still." } },
  },
}

-- Jareth Wildwoods: a young night elf of the city, restless for the forests beyond it.
P:NPC {
  key = "dar_jareth_wildwoods", id = TODO_NPC("Jareth Wildwoods"), name = "Jareth Wildwoods", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "restless", "friendly" }, values = { "freedom", "curiosity" },
  notices = { "class" },
  impression = {
    first = "Jareth Wildwoods is young as night elves go, and he looks past the edge of the city more often than at it. He questions every traveller about the road they came by.",
    third = "{name} met Jareth Wildwoods, a restless young night elf in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Well met! You have come up from Rut'theran, have you not? Tell me, how did the forest look from the shore?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Where have you been since, and was it somewhere with a great many trees?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You are a hunter, and you have been out in the wilds, for I can smell pine on your cloak. I envy you more than I can politely say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Jareth Wildwoods, and I know what you are thinking, which is that the name suits somebody who lives in a forest and not in a city. I think so as well, and I remind my family of it often." } },
      again = {
        { id = "h_again", text = "What else can I ask you? I mean, what else can you ask me?" },
        { id = "h_again2", text = "Go on, I like talking with travellers." },
      },
      choices = {
        { text = "Why not leave for the forest, then?", next = "leave" },
        { text = "Darnassus is in a tree. Isn't that enough?", next = "tree" },
        { text = "Good luck to you, Jareth.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "I mean to, as soon as I have finished my training. My mother says Ashenvale is no place for somebody who has never drawn a bow in anger, and she is right, which I find the most annoying thing about her." } },
      choices = {
        { text = "Listen to her. Ashenvale is at war.", next = "war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "I know it, truly, and I know that the Warsong are no tale to frighten children with. But those are our forests they are cutting, and I do not think I can sit in the branches for ever while somebody else defends them.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Then train hard first. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tree = {
      lines = {
        { id = "t_ne", when = { race = "NightElf" }, text = "You must feel it too, surely. It is one tree, however great it is, and one may walk every bough of it in a few days. A forest has no end that you can reach by supper." },
        { id = "t_default", text = "It is one tree, friend, however great it is. I have walked every bough of it, and a forest is something else, because you can walk in one for a year and still not know it." },
      },
      choices = { { text = "I see the difference. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was raised in Darnassus, and I would like to see something that is not Darnassus." } },
    warsong = { { id = "tp_ws", text = "The orcs in Ashenvale. I have never seen one, and I think about them more than I should." } },
    _none = { { id = "tp_none", text = "I have not heard of that, but then I have never been anywhere. Will you tell me about it?" } },
  },
}

-- Sarin Starlight: a finely dressed night elf of the city who keeps an eye on the stars.
P:NPC {
  key = "dar_sarin_starlight", id = TODO_NPC("Sarin Starlight"), name = "Sarin Starlight", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "courtly", "dreamy" }, values = { "tradition", "wonder" },
  notices = { "race" },
  impression = {
    first = "Sarin Starlight wears a silvered breastplate over a fine robe, as if he had dressed for a council and a battle on the same evening. He looks up through the leaves a great deal, and speaks of the stars as of old acquaintances.",
    third = "{name} met Sarin Starlight, a courtly night elf of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. You find me counting what I can see of the sky, which through these leaves is never quite enough." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again beneath the same stars, though they have turned a little since." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. It is a clear night above the boughs, and I am glad of someone to share it with." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You are human, and I am told that your people name the stars differently than we do. I should like to hear one of your names for them, if you know any." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sarin, of the Starlight family. I keep the old habit of watching the heavens, which my people did long before we had a tree to stand in, and I dress for the occasion, as you see." } },
      again = {
        { id = "h_again", text = "What else would you speak of?" },
        { id = "h_again2", text = "Please, continue. The stars are patient." },
      },
      choices = {
        { text = "Why armor over a robe?", next = "armor" },
        { text = "What do the stars tell you?", next = "stars" },
        { text = "Clear skies, Sarin.", next = "END" },
      },
    },
    armor = {
      lines = { { id = "a_default", text = "The robe is for what I should prefer to be doing, and the breastplate is for what the times require. I wore neither for ten thousand years of peace, and I have worn both since the Legion returned, so that I am ready for whichever is wanted." } },
      choices = { { text = "A sign of the age. Something else.", next = "BACK" } },
    },
    stars = {
      lines = { { id = "s_default", text = "They tell me very little that I can use, and a great deal that I am glad to know. They are Elune's own lamps, and I find it steadies me to see that they are still where I left them." } },
      choices = {
        { text = "Have they ever not been?", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = {
        { id = "c_ne", when = { race = "NightElf" }, text = "You know the tale as I do. When the Legion first came, the sky itself burned green, and those of us who saw it have looked up every night since to be sure." },
        { id = "c_default", text = "Once, they were not. When the Burning Legion first came to this world, long before your people's histories begin, the sky burned green, and I have looked up every night since to be sure that it has not happened again." },
      },
      choices = { { text = "May it never. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Starlight family, and I watch the sky. There are worse ways to spend an age." } },
    _none = { { id = "tp_none", text = "I am afraid that is not written anywhere I can read, traveller, above or below." } },
  },
}

-- Sentinel Dalia Sunblade: at the Temple of the Moon; gives Eyes of the Sentinels.
P:NPC {
  key = "dar_dalia_sunblade", id = TODO_NPC("Sentinel Dalia Sunblade"), name = "Sentinel Dalia Sunblade", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "disciplined", "direct" }, values = { "duty", "vigilance" },
  notices = { "class", "race" },
  impression = {
    first = "Sentinel Dalia Sunblade stands her post at the Temple of the Moon, straight as a glaive. She looks at a traveller as a quartermaster looks at a new blade, wondering what use might be made of it.",
    third = "{name} met Sentinel Dalia Sunblade at the Temple of the Moon.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. You stand before the Temple of the Moon, so state your business, and state it truthfully." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Tell me what you have seen since we last spoke." },
    { id = "g_active", when = { questActive = TODO_QUEST("Eyes of the Sentinels") }, text = "You carry my charge, {class}. Have you a report for me, or do you need the task set out again?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Eyes of the Sentinels") }, text = "Elune-adore. The Sentinels remember those who have served as their eyes, and you are welcome at this post." },
  },
  notice = {
    { id = "n_ne", cat = "race", when = { race = "NightElf" },
      text = "You are kaldorei, and of an age to serve. The Sentinels have need of every one of us, whether or not you wear the armor." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You pass unseen when you choose to, and that is a rarer gift than a strong arm. I could find a use for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Eyes of the Sentinels") }, text = "You have served as our eyes once already, and served well. The watch does not end, and I will always hear what you have seen on your travels." },
        { id = "h_default", text = "I am Sentinel Dalia Sunblade. I guard this Temple, and I gather word for those who command us, because the Sentinels cannot defend what they cannot see." },
      },
      again = {
        { id = "h_again", text = "What more would you ask, {class}?" },
        { id = "h_again2", text = "Speak. My post allows for a few words." },
        { id = "h_again3", when = { questActive = TODO_QUEST("Eyes of the Sentinels") }, text = "Go on, and then be about the task." },
      },
      choices = {
        { text = "What do the Sentinels need to see?", next = "eyes" },
        { text = "Why do you guard the Temple?", next = "temple" },
        { text = "The Sentinels seem stretched thin.", next = "thin" },
        { text = "I am kaldorei. How may I serve?", next = "serve", when = { race = "NightElf" } },
        { text = "Elune keep your watch.", next = "END" },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "We need to see everything beyond the reach of our own patrols. Our lands are wide and our numbers are not what they once were, so that a Sentinel on a border post knows her own stretch of forest and nothing of the next valley." } },
      choices = {
        { text = "And travellers can fill the gaps?", next = "gaps" },
        { text = "What have your own eyes missed?", next = "missed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaps = {
      lines = { { id = "g_default", text = "They can, if they are willing to look and to report honestly. An adventurer crosses three territories in the time that a patrol holds one, and what you notice in passing may be the warning that some outpost has waited a season to hear.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "What makes a report worth hearing?", next = "report" },
        { text = "Something else.", next = "BACK" },
      },
    },
    report = {
      lines = { { id = "r_default", text = "Tell me what you saw, and not what you suppose. Give me numbers, a place and the direction of travel, and leave the guessing to those of us who must answer for it." } },
      choices = { { text = "Plain and exact, then. Something else.", next = "BACK" } },
    },
    missed = {
      lines = { { id = "m_default", text = "We have missed too much. The furbolgs of these woods turned on us before we understood that anything ailed them, and the Warsong had cut deep into Ashenvale before word of their full numbers reached Darnassus.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Late word is costly. Something else.", next = "BACK" } },
    },
    temple = {
      lines = { { id = "t_default", text = "I guard it because it is the heart of our people, and because the High Priestess stands within it. Tyrande Whisperwind led the Sentinels through ten thousand years of watching, and I count it the highest honour to hold the door behind which she serves." } },
      choices = {
        { text = "Has the Temple ever been threatened?", next = "threat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threat = {
      lines = { { id = "th_default", text = "It has not been, in my time at this post, and I intend for it to remain so. I would rather stand ten thousand quiet watches than a single eventful one." } },
      choices = { { text = "May they all be quiet. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    thin = {
      lines = { { id = "tn_default", text = "We are, and I will not insult you by pretending otherwise. We lost many on Hyjal, our druids are only lately woken from the Dream, and our borders now run from Darkshore to the edge of the Barrens." } },
      choices = { { text = "The Alliance stands with you. Something else.", next = "BACK", reply = "So we are told, and so I have begun to see. It is strange to us, after so long alone, but it is not unwelcome." } },
    },
    serve = {
      lines = { { id = "s_default", text = "You may serve by going out and by coming back. See the lands that we hold and the lands that we are losing, and bring what you learn to a Sentinel, for there has been too little of that among our young." } },
      choices = { { text = "I will be your eyes. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Sentinel of the Sunblade family, and my post is the Temple of the Moon. I ask for no other." } },
    sentinels = { { id = "tp_sen", text = "We are the watch of our people, and we see only as far as our eyes reach. That is why I ask travellers to look for us." } },
    warsong = { { id = "tp_ws", text = "They fell our forests in Ashenvale. I would know their numbers better than I do." } },
    _none = { { id = "tp_none", text = "I have no word of that, {class}. If you learn something, bring it to me." } },
  },
}

-- Voloren: fishing supplies in the Temple Gardens.
P:NPC {
  key = "dar_voloren", id = TODO_NPC("Voloren"), name = "Voloren", title = "Fishing Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "placid", "wry" }, values = { "patience", "quiet" },
  notices = { "craft" },
  impression = {
    first = "Voloren sells lines, hooks and bait beside the water in the Temple Gardens, and he speaks in a low voice so as not to disturb the fish. He regards the lake as a temple in its own right.",
    third = "{name} met Voloren, who sells fishing supplies in the Temple Gardens.",
  },
  greetings = {
    { id = "g_default", text = "Softly, friend, for they can feel a heavy step through the bank. What do you need, a line or a lure?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back. Did they bite, or did they only laugh at you?" },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You have the squint of someone who has watched a float for hours. Then you already know the best thing I could teach you, which is to wait." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Voloren, and I sell what a fisher needs. Talaelar across the garden sells the fish, and it is no secret between us that he owes his whole trade to my hooks." } },
      again = {
        { id = "h_again", text = "Something else? Softly, mind." },
        { id = "h_again2", text = "Go on, friend, though quietly." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Is fishing allowed in the Temple's lake?", next = "allowed" },
        { text = "Where is the best fishing on Teldrassil?", next = "best" },
        { text = "Tight lines, Voloren.", next = "END" },
      },
    },
    allowed = {
      lines = { { id = "a_default", text = "I would say that it is not forbidden, which is a different thing. The Sisters prefer the water left in peace, and so I sell the lines here and suggest most firmly that they be cast elsewhere." } },
      choices = {
        { text = "Talaelar doesn't seem to take the suggestion.", next = "talaelar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talaelar = {
      lines = { { id = "t_default", text = "He does not, and he supposes that nobody has noticed. The priestesses noticed long ago, and they have decided to consider it a form of contemplation, which is more mercy than he deserves and precisely as much as I should want." } },
      choices = { { text = "I won't tell him. Something else.", next = "BACK" } },
    },
    best = {
      lines = {
        { id = "b_fish", when = { profession = "Fishing" }, text = "Try Lake Al'Ameth, south of Dolanaar, at dusk and from the western bank. You will know what to do once you are there, and I ask only that you leave the small ones to grow." },
        { id = "b_default", text = "Lake Al'Ameth, south of Dolanaar, is the best of it, and the pools at Rut'theran if you care for salt water. Go at dusk, sit still, and do not speak to the fish, because it only encourages them." },
      },
      choices = { { text = "Dusk at Al'Ameth. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fished these waters since they were first filled. Now I mostly sell the hooks and watch other people try." } },
    _none = { { id = "tp_none", text = "I have not caught wind of that, friend. Ask someone who spends less time looking at water." } },
  },
}
