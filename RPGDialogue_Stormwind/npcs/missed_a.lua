-- Stormwind folk the roster scan found missing (part 1 of 3): Mazen's assistant in the library, a
-- boy on the canals, two old soldiers who walk to the Pig and Whistle, the mail and cloth sellers at
-- Lionheart Armory, the staff seller in the Mage Quarter, Miss Danna's three pupils, and the archmage
-- and two door guards of the Champions' Hall. Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Acolyte Dellis: upper floor of the Academy library on the canals; Mazen Mac'Nadir's assistant.
P:NPC {
  key = "acolyte_dellis", id = TODO_NPC("Acolyte Dellis"), name = "Acolyte Dellis", gender = "male",
  bible = "bibles/missed_a.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "nervous", "earnest" }, values = { "learning", "order" },
  notices = { "magic", "travel" },
  impression = {
    first = "Acolyte Dellis keeps the upper shelves of the Academy's library, and he handles every book as if it might bruise. He is missing a hat, and he would rather not say where it went.",
    third = "{name} met Acolyte Dellis, who tends the Academy's library for Mazen Mac'Nadir.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, you're back! I've kept that corner of the reading table clear for you, and I've not let anyone touch it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Please don't take anything off the shelves, because I've only just finished putting them back." },
    { id = "g_default", text = "Oh! Good day to you. Please mind the stack by the stair, because I've only just put it in order." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and nothing's fallen over since you left, which I count as a good day." },
  },
  notice = {
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "You're a student of the arcane, aren't you? Then you'll know not to open the red folios without asking, which is more than I can say for most visitors." },
    { id = "n_travel", cat = "travel", when = { minLevel = 35 },
      text = "You look as though you've slept outdoors a great deal, and on purpose. I can't think why anyone would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("Mazen's Behest") },
          text = "Master Mazen has sent you after the Essays, hasn't he? I'm sorry, truly, because that book was in my hands and it's my fault it's lying in a swamp." },
        { id = "h_default", text = "I'm Acolyte Dellis, and I look after the Academy's books for Master Mazen. If you want a volume, tell me the title and I'll find it faster than you could read the shelf marks." },
      },
      again = {
        { id = "h_again", text = "Was there another book, or another question?" },
        { id = "h_again2", text = "Go on, but softly, please, because voices carry up here." },
      },
      choices = {
        { text = "What sort of books do you keep here?", next = "books" },
        { text = "You look like a man who's lost his hat.", next = "hat" },
        { text = "What is Mazen like to work for?", next = "mazen" },
        { text = "Who decides what goes on the red folios' shelf?", next = "x_red" },
        { text = "Some knowledge is better left unwritten.", next = "x_stance" },
        { text = "I've read a few old books myself, as a priest.", next = "x_priest", when = { class = "PRIEST" } },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Histories of the Guardians, treatises on the ley lines, and a good many copies made from Dalaran's shelves before the city fell. Master Mazen says a library is a kingdom's memory, and I'd like ours to be a long one." } },
      choices = {
        { text = "Could a mage borrow one of those treatises?", next = "borrow", when = { class = "MAGE" } },
        { text = "Do many people come to read them?", next = "readers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    borrow = {
      lines = { { id = "bo_default", text = "You may read anything here at the table, and I'll fetch it for you gladly. Nothing leaves the building any more, though, and you may guess why I'm the one who made that rule." } },
      choices = { { text = "A sensible rule. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    readers = {
      lines = { { id = "r_default", text = "Students from the tower, mostly, and a clerk from the Keep now and then who wants an old treaty. Once a month a dwarf from the Explorers' League comes and argues with the maps, and I rather look forward to him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hat = {
      lines = { { id = "ht_default", text = "It's in the Swamp of Sorrows, along with a book I was meant to carry to Nethergarde Keep. There are plants in that swamp that walk, and one of them took a very personal dislike to me." } },
      choices = {
        { text = "Plants chased you out of a swamp?", next = "plants" },
        { text = "The road east is hard on anyone. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    plants = {
      lines = { { id = "p_default", text = "They did, and I'm not ashamed to say I ran until I reached the Darkshire road. I was made for catalogues and quiet rooms, and I've promised Master Mazen I'll never volunteer for an errand again." } },
      choices = { { text = "Stay with the catalogues, then. Something else.", next = "BACK" } },
    },
    mazen = {
      lines = { { id = "m_default", text = "He's patient, and he forgets where he's put his spectacles four times a day, and he knows more than any three archmages I've met. He forgave me for the Essays before I'd finished confessing, which made me feel a good deal worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_red = {
      lines = {
        { id = "x_red_l0", text = "Master Mazen does, and he locks that shelf with a key he wears round his neck. They're the Dalaran copies on summoning and the darker schools, kept so that someone will recognise the signs if they ever come back." },
      },
      choices = {
        { text = "Come back? Who would summon such things?", next = "x_red2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_red2 = {
      lines = {
        { id = "x_red2_l0", text = "Nobody in Stormwind, I'd hope, though Master Mazen says the guards found a circle meeting under the Slaughtered Lamb last spring. He asked me to keep a list of anyone who requests those folios, and I do, though it makes me feel like a spy." },
      },
      choices = {
        { text = "Has anyone asked lately?", next = "x_red3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_red3 = {
      lines = {
        { id = "x_red3_l0", text = "One gentleman in a very good coat, twice, and he grew quite cross when I said no. I wrote his name down, and I've told the Master, and I sleep a little worse for it." },
      },
      choices = {
        { text = "You did right to tell him. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Some people say so, and some of them are clergy. I think a thing forgotten is a thing that can surprise you, and I would rather be bored by a catalogue than surprised by a demon." },
      },
      choices = {
        { text = "A library should keep everything, however dangerous.", next = "BACK", reply = "Master Mazen would agree with you, though he'd still lock the shelf.", fx = { align = { order = -1 } } },
        { text = "Dangerous books belong under lock and the Church's eye.", next = "BACK", reply = "That's the rule we keep, and I think it's a fair one.", fx = { align = { order = 1 } } },
      },
    },
    x_priest = {
      lines = {
        { id = "x_priest_l0", text = "Then you'll know the Cathedral keeps its own library, and a better-guarded one than ours. Their archivist and Master Mazen trade copies by the cartload, and argue about the bindings." },
      },
      choices = {
        { text = "I'll ask after your copies there. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the Academy as a boy to learn spells, and found I liked the books better than the casting. Master Mazen took me on, and I've been up these stairs ever since." } },
    rumors = { { id = "tp_rumors_x", text = "They say a man in a good coat has been asking at every library in the city for the same old summoning texts. I only hope he's a scholar." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid, but if it's written down anywhere, Master Mazen will know which shelf." } },
  },
}

-- Adam: a boy fishing the Canals with his friend Billy.
P:NPC {
  key = "adam_canals", id = TODO_NPC("Adam"), name = "Adam", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "stubborn", "matter-of-fact" }, values = { "truth" },
  notices = { "fishing" },
  impression = {
    first = "Adam fishes the canals beside his friend Billy and doesn't believe a word Billy says. He's the sort of boy who counts things, and he has counted exactly one crab.",
    third = "{name} met Adam, a boy who fishes the Stormwind canals with Billy.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you again! I saved you a spot on the wall, right where the fish would be if there were any." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. You can't fish here, because this bit's mine and Billy's." },
    { id = "g_default", text = "Shh, you'll scare them off! Well, there aren't any to scare, but that's what you're supposed to say." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Billy still hasn't caught anything, in case you were wondering." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "You've got a real fishing pole! Tell Billy there aren't any big fish in the canal, because he won't listen to me." },
  },
  start = "hello",
  nodes = {
    ydad = {
      lines = {
        { id = "yadamcanals1", text = "He works on the docks in the harbour, carrying crates off the ships from Menethil and Booty Bay. He comes home smelling of tar and fish, and he says that's why he doesn't need to go fishing." },
        { id = "yadamcanals2", when = { race = "Dwarf" }, text = "He says the dwarves at the docks can carry twice as much as anyone. Can you really, or is that a story too?" },
      },
      choices = {
        { text = "Do you want to work the docks too?", next = "ydocks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydocks = {
      lines = {
        { id = "yadamcanals3", text = "No, I want my own boat, a little one with a red sail. Dad says boats cost more than he makes in a year, so I'm saving my coppers in a jar, and I've got eleven so far." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhere = {
      lines = {
        { id = "yadamcanals4", text = "In Old Town, above the shop where his uncle mends boots. His uncle says the Defias are hiding in the canals, but my mum says that's just what grown-ups say to keep us from playing under the bridges." },
      },
      choices = {
        { text = "Listen to your mum. Stay out from under the bridges.", next = "BACK", reply = "All right. Billy won't, though, and then I'll have to go and get him.", fx = { align = { order = 1 } } },
        { text = "A little exploring never hurt anyone.", next = "BACK", reply = "That's what Billy says! Only don't tell my mum you said it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Adam, and that's Billy, and he says there's a fish under the bridge as big as a boat. There isn't, because I've looked, and all I ever saw was an old boot." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not busy, the fish aren't biting." },
        { id = "h_again2", text = "You can ask me another one if you like." },
      },
      choices = {
        { text = "Have you ever caught anything?", next = "crab" },
        { text = "Billy says you can't fish.", next = "billy" },
        { text = "Why fish here, if there's nothing to catch?", next = "why" },
        { text = "Billy says he's going to catch a crocolisk.", next = "x_croc" },
        { text = "Fibbing is all right if it's a good story.", next = "x_stance" },
        { text = "I'm a hunter. I could teach you to read the water.", next = "x_hunt", when = { class = "HUNTER" } },
        { text = "What does your dad do?", next = "ydad" },
        { text = "Where does Billy live?", next = "ywhere" },
        { text = "Good luck, Adam.", next = "END" },
      },
    },
    crab = {
      lines = { { id = "c_default", text = "I caught a crab last week, a real one, with both claws! Billy says a crab doesn't count, but he's only saying that because he's never caught one." } },
      choices = {
        { text = "What did you do with the crab?", next = "crab2" },
        { text = "A crab counts. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    crab2 = {
      lines = { { id = "c2_default", text = "I took it home in my hat, and my mum screamed and made me put it back in the canal. So it's still down there somewhere, and I bet it's bigger now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    billy = {
      lines = { { id = "b_default", text = "Billy says lots of things, like how he pulled out a fish bigger than himself at camp. He's my best friend, but if he'd really caught it, he'd have kept it, wouldn't he?" } },
      choices = { { text = "Maybe he would. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because my dad says the harbor's too deep for boys, and the lake's all the way out past Goldshire. Anyway, it's nice here, and sometimes the cheese man's wife gives us the broken bits." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_croc = {
      lines = {
        { id = "x_croc_l0", text = "He says that every single day, and he hasn't even got a hook big enough. If he caught one it would pull him in, and then I'd have to tell his mum, and I'm not doing that." },
      },
      choices = {
        { text = "You're a good friend to him. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "My mum says a fib is a fib even if it's a fun one. Billy's dad says stories are how people keep warm in winter." },
      },
      choices = {
        { text = "A lie's a lie, Adam. Your mum's right.", next = "BACK", reply = "I knew it! I'm going to tell Billy you said so.", fx = { align = { honor = 1 } } },
        { text = "Billy's stories don't hurt anybody.", next = "BACK", reply = "I suppose, only he doesn't have to look so pleased about it.", fx = { align = { honor = -1 } } },
      },
    },
    x_hunt = {
      lines = {
        { id = "x_hunt_l0", text = "Really? Then where are the fish, because I've counted the ripples and there's hardly any. If you tell me, I won't tell Billy, and that's a promise." },
      },
      choices = {
        { text = "Under the bridge's shadow, where it's cool. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    billy = { { id = "yadamcanals5", text = "My best friend. He fibs, but he's good at skipping stones." } },
    boat = { { id = "yadamcanals6", text = "I'm going to have a little boat with a red sail. I've got eleven coppers saved." } },
    background = { { id = "tp_bg", text = "I live by the canals, and I'm going to be a real fisherman with a boat when I'm big. Billy can come too, if he stops fibbing." } },
    _none = { { id = "tp_none", text = "I don't know about that. You could ask Billy, but he'd only make something up." } },
  },
}

-- Aedis Brom: old dwarven soldier who walks from the Canals to the Pig and Whistle with Christoph Faral.
P:NPC {
  key = "aedis_brom", id = TODO_NPC("Aedis Brom"), name = "Aedis Brom", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind", "second_war" }, temper = { "hearty", "loud" }, values = { "comrades", "ale" },
  notices = { "soldier", "drink" },
  impression = {
    first = "Aedis Brom is a grey-bearded dwarf who walks the same road to the Pig and Whistle every day with his friend Christoph, refighting the Second War at the top of his voice. Half the street knows his stories by heart.",
    third = "{name} met Aedis Brom, an old dwarven soldier who drinks at the Pig and Whistle.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ha, it's my favourite listener! Christoph, pour slower, for we've company that's earned the long version o' the tale." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's yerself. We're walkin' tae the tavern, an' I'd as soon ye walked a different road." },
    { id = "g_default", text = "Well met, {g:lad|lass}! Walk wi' us if ye like, for we're bound for the Pig and Whistle and the road's short." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, it's yerself again! Christoph, look who's come back for the rest o' the story." },
  },
  notice = {
    { id = "n_dwarf", cat = "soldier", when = { race = "Dwarf" },
      text = "A dwarf in Stormwind, and no' one o' the forge lot by the look o' ye! It does my old heart good, {g:lad|lass}." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "Ye've a soldier's shoulders, and I'd wager ye've stood a line or two yerself." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've started without us, I see! Well, there's no law against it, more's the pity for yer head tomorrow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Aedis Brom, late o' more campaigns than I've fingers left tae count them on. Christoph and I fought the Horde from Darrowmere tae the Black Morass, and now we fight over who buys the first round." },
      },
      again = {
        { id = "h_again", text = "What else, then? The ale's no' getting any colder, mind." },
        { id = "h_again2", text = "Aye, go on, I've breath enough for another." },
      },
      choices = {
        { text = "Where did the two of you fight?", next = "war" },
        { text = "How did a dwarf end up in Stormwind?", next = "stormwind" },
        { text = "You two never seem to stop talking.", next = "christoph" },
        { text = "What do you make of the Defias on the roads?", next = "x_defias" },
        { text = "Tell me about Danath Trollbane.", next = "x_danath" },
        { text = "Ironforge sent ye south too, then?", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Enjoy your ale, Aedis.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Darrowmere first, all night in the fog wi' the mud up tae my beard, and I'll never be warm again for the memory of it. After that we marched on Alterac, and ye should have seen the traitor Perenolde's face when the army came up tae his front door." } },
      choices = {
        { text = "And the Black Morass?", next = "morass" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morass = {
      lines = { { id = "m_default", text = "Danath gathered every sellsword in Stormwind and marched us south tae Nethergarde, and a wetter, fouler place for a war I never saw. We held, though, and I've no' eaten a frog since, on principle." } },
      choices = { { text = "You earned your ale. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stormwind = {
      lines = { { id = "s_default", text = "I came south tae help rebuild the place after the war, and somehow never went home. Ironforge has the better ale, I'll no' lie tae ye, but Christoph's here, and a man shouldn't drink alone at my age." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    christoph = {
      lines = { { id = "c_default", text = "Forty years o' practice, {g:lad|lass}! He remembers every battle wrong, and I've tae walk beside him and put it right, or folk would believe him." } },
      choices = {
        { text = "What does he get wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "He swears it was himself that started the brawl in Lordaeron, when the whole regiment knows it was me. Ask Reese at the Pig and Whistle, for he's heard both tellings so often he could settle it in his sleep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_danath = {
      lines = {
        { id = "x_danath_l0", text = "Finest commander I ever served under, human or dwarf, and he never once asked a man tae do what he'd no' do first. When the Portal opened again, he went through it wi' Khadgar and the rest, and nobody's seen him since." },
      },
      choices = {
        { text = "Do you think he's alive?", next = "x_danath2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_danath2 = {
      lines = {
        { id = "x_danath2_l0", text = "Christoph says no, quiet-like, and I say aye, loud-like, an' that's the whole argument. A man like Danath doesnae die where nobody can see it, or I'll no' believe it till I'm shown the grave." },
      },
      choices = {
        { text = "What would you say to him, if he came back?", next = "x_danath3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_danath3 = {
      lines = {
        { id = "x_danath3_l0", text = "That he owes me three silver from a wager at Nethergarde, and that the lads he left behind did him proud. Then I'd buy him an ale, because I'm no' a man tae hold a debt over a hero." },
      },
      choices = {
        { text = "He'd be glad of both. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_defias = {
      lines = {
        { id = "x_defias_l0", text = "Stonemasons, the lot o' them, that the nobles cheated o' their pay, an' now they rob farmers that never cheated anybody. I've sympathy for a man unpaid, but none for a man wi' a mask." },
      },
      choices = {
        { text = "They were wronged first. The nobles share the blame.", next = "BACK", reply = "Aye, maybe so, but blame's no' a licence tae burn Westfall.", fx = { align = { order = -1 } } },
        { text = "A thief is a thief. Hang the lot of them.", next = "BACK", reply = "Ye've a soldier's way o' seeing it, an' I'll no' argue.", fx = { align = { order = 1 } } },
      },
    },
    x_dwarf = {
      lines = {
        { id = "x_dwarf_l0", text = "Aye, lad, an' half o' Dun Morogh wi' me in those days. Some went home after, but I'd found a friend and a tavern I liked, an' a dwarf's no' a fool tae leave both." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born under the mountain and soldiering since my beard was red. These days I walk, I drink and I remember, and that's work enough for an old dwarf." } },
    rumors = { { id = "tp_rumors_x", text = "They say the Blackrock clan's thick in the Burning Steppes again, an' I'd wager good silver Redridge will feel it before the year's out." } },
    _none = { { id = "tp_none", text = "That's past my knowing, {g:lad|lass}. Ask me about a battle, and I'll no' disappoint ye." } },
  },
}

-- Christoph Faral: old human soldier who walks with Aedis Brom.
P:NPC {
  key = "christoph_faral", id = TODO_NPC("Christoph Faral"), name = "Christoph Faral", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind", "second_war" }, temper = { "wry", "easy" }, values = { "comrades", "peace" },
  notices = { "soldier" },
  impression = {
    first = "Christoph Faral walks with his dwarven friend Aedis, slower than he used to and smiling more. He lets the dwarf do the shouting and slips in the correction afterwards.",
    third = "{name} met Christoph Faral, an old soldier who walks to the Pig and Whistle with Aedis Brom.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, there you are, friend. Aedis has been saving his best lie for when you came back round." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Aedis and I would sooner walk on quietly, if it's all the same to you." },
    { id = "g_default", text = "Good day to you, friend. Don't mind Aedis, because he's only loud until the second mug." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. We've not got any further than the canal bridge, as you can see." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You wear your sword the way we were taught to, low and ready. It's good to see somebody still drills." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Christoph Faral, once a sellsword and now a man who walks to the tavern for his health. A warm room and a cold ale are all Aedis and I ask of the world these days." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Ask away, for we've the whole afternoon." },
      },
      choices = {
        { text = "Aedis says he started the brawl in Lordaeron.", next = "brawl" },
        { text = "Do you miss soldiering?", next = "miss" },
        { text = "The city has changed since your day, I'd guess.", next = "city" },
        { text = "Aedis says Danath is still alive.", next = "x_danath" },
        { text = "Old soldiers are owed more than this city gives them.", next = "x_stance" },
        { text = "You'd have made a fine paladin, I think.", next = "x_pal", when = { class = "PALADIN" } },
        { text = "Good health to you both.", next = "END" },
      },
    },
    brawl = {
      lines = { { id = "b_default", text = "He would say that. I threw the first mug, and he threw the first sergeant, so I suppose it depends on what you call starting." } },
      choices = {
        { text = "What was the brawl about?", next = "brawl2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brawl2 = {
      lines = { { id = "b2_default", text = "Neither of us remembers, which tells you how good the ale was. I woke up in Northshire three weeks later with a new scar and no notion of how I'd come by it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss the men, and I don't miss the mud. A night in a trench at Darrowmere cures you of wanting glory, and anyone who says otherwise spent that war behind a desk." } },
      choices = {
        { text = "There's still fighting to be had, in Westfall and Redridge.", next = "today" },
        { text = "Something else.", next = "BACK" },
      },
    },
    today = {
      lines = { { id = "t_default", text = "So I hear, and it's young folk like you who'll do it. We fought an army you could see coming; you've bandits who used to be our own masons, and I think yours is the harder war.", fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "It's all new stone, friend, because the orcs left us nothing but the foundations. I helped carry rubble out of Old Town when we came home, and the Pig and Whistle was one of the first roofs to go back up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_danath = {
      lines = {
        { id = "x_danath_l0", text = "He says it every night, and I let him, because it costs me nothing. I watched the Portal close, and I knew what it meant, but a man may keep one hope in his pocket if it warms him." },
      },
      choices = {
        { text = "And what do you hope for?", next = "x_danath2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_danath2 = {
      lines = {
        { id = "x_danath2_l0", text = "Only that the young ones on the roads now have better captains than we had at the start. We learned at the Black Morass, mostly by burying the men who learned slower." },
      },
      choices = {
        { text = "Did you lose many there?", next = "x_danath3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_danath3 = {
      lines = {
        { id = "x_danath3_l0", text = "Enough that I stopped learning their names, and that's the part I'm least proud of. Aedis remembers every one, and that's why I let him do the talking." },
      },
      choices = {
        { text = "He remembers for both of you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Owed? Perhaps. We were paid in coin when we were paid at all, and the kingdom has its hands full with new wars. I'd rather it fed the farmers in Westfall than me." },
      },
      choices = {
        { text = "The crown should look after those who bled for it.", next = "BACK", reply = "Kind of you, and I'll tell Aedis, who'll make a speech of it.", fx = { align = { honor = 1 } } },
        { text = "Sellswords chose the coin. They've no further claim.", next = "BACK", reply = "Hard, but not wrong, and I said much the same when I was young.", fx = { align = { honor = -1 } } },
      },
    },
    x_pal = {
      lines = {
        { id = "x_pal_l0", text = "A kind thought, but the Light never once spoke to me, not even at the Morass when I begged it to. I'll leave that work to you and the Cathedral's men." },
      },
      choices = {
        { text = "It may yet. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sold my sword through the Second War and came home with most of my limbs. Aedis and I have been walking to the same tavern ever since." } },
    defias = { { id = "tp_defias", text = "The men who rebuilt this city and were never paid for it. I'll not excuse what they've become, but I remember what they were." } },
    advice = { { id = "tp_advice_x", text = "Never walk into a fight you can't walk out of, and if you must, make sure the dwarf goes first." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. Aedis will have an opinion, though, and he'll give it to you whether it's right or not." } },
  },
}

-- Andi: one of Miss Danna's pupils, walking Stormwind with the class.
P:NPC {
  key = "andi_pupil", id = TODO_NPC("Andi"), name = "Andi", gender = "female",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "curious", "bright" }, values = { "learning" },
  notices = { "magic" },
  impression = {
    first = "Andi walks at the front of Miss Danna's little class, close enough to ask the first question at every stop. She asked me three before I'd said hello.",
    third = "{name} met Andi, one of Miss Danna's pupils on their walk through Stormwind.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you! I told Miss Danna about you, and she said you sounded like a proper hero." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Miss Danna says we're only to be polite to nice people, so I don't have to be." },
    { id = "g_default", text = "Hello! We're on a school walk, and I'm allowed to talk to people if I'm polite." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Did you go anywhere exciting since last time?" },
  },
  notice = {
    { id = "n_elf", cat = "magic", when = { race = "NightElf" },
      text = "Are you a real night elf? Miss Danna says your people are older than Stormwind, older than anything." },
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "Are you a mage? I'm going to the Academy when I'm old enough, Miss Danna says I might." },
  },
  start = "hello",
  nodes = {
    d6_cath = {
      lines = { { id = "d6_cath_a", text = "It's the tallest thing I've ever been inside, and the windows make colours on the floor that move when the clouds do. A priest let us stand in the middle and be quiet for a whole minute, and Geoff lasted almost all of it." } },
      choices = {
        { text = "What did you think about in the quiet?", next = "d6_cath2" },
        { text = "Geoff lasting a minute is a miracle.", next = "d6_cath2" },
        { text = "Ask me something now.", next = "BACK" },
      },
    },
    d6_cath2 = {
      lines = { { id = "d6_cath2_a", text = "Whether the people who built it are buried under it, and Miss Danna said some of them are, the stonemasons who rebuilt the city after the orcs. I thought that was sad and also nice, because they'd get to hear the bells every day." } },
      choices = {
        { text = "That's a kind way to see it.", next = "BACK", fx = { learn = { "stonemasons" } } },
        { text = "What else do you know?", next = "BACK" },
      },
    },
    d6_friend = {
      lines = { { id = "d6_friend_a", text = "Pat, because she asks almost as many questions as me, so nobody thinks I'm strange. Geoff's all right too, but he wants to be a knight, and I've told him a ranger would beat a knight because she'd shoot him before he got close." } },
      choices = {
        { text = "I'm a hunter. I use a bow too.", next = "d6_friend2", when = { class = "HUNTER" } },
        { text = "What did Geoff say to that?", next = "d6_friend2" },
        { text = "A ranger would win, I think.", next = "d6_friend2" },
      },
    },
    d6_friend2 = {
      lines = {
        { id = "d6_friend2_a", text = "He said he'd have a shield, and then I said I'd go round the side, and then Miss Danna said that was enough tactics for one morning. I think I won, though, because he went quiet and looked at his stick." },
        { id = "d6_friend2_hunter", when = { class = "HUNTER" }, text = "You do? Can you hit things a long way off, like the lady at the gate could, and does your animal come with you everywhere? I'm going to tell Geoff a real hunter said rangers win, so please don't say anything different." },
      },
      choices = {
        { text = "Rangers win. Tell Geoff I said so.", next = "BACK", fx = { affinity = 1 } },
        { text = "What else is on your mind?", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", text = "I'm Andi, and Miss Danna is showing us the whole city so we'll know our history. I like the statues best, because every one of them was a real person once." },
      },
      again = {
        { id = "h_again", text = "Can I ask you something now? Oh, you go first, then." },
        { id = "h_again2", text = "What else do you want to know?" },
      },
      choices = {
        { text = "What has Miss Danna taught you today?", next = "lesson" },
        { text = "Which statue is your favourite?", next = "statue" },
        { text = "You seem to be the one asking the questions.", next = "questions" },
        { text = "Do you want to be a ranger, then?", next = "x_ranger" },
        { text = "Being brave is better than being clever.", next = "x_stance" },
        { text = "I'm an elf too, you know.", next = "x_elf", when = { race = "NightElf" } },
        { text = "What did you think of the Cathedral?", next = "d6_cath" },
        { text = "Who's your best friend in the class?", next = "d6_friend" },
        { text = "Mind your teacher, Andi.", next = "END" },
      },
    },
    lesson = {
      lines = { { id = "l_default", text = "That the orcs burned the old city down, and people came back and built this one on top with stone from the quarries. Geoff said that was boring, but I think it's the bravest thing I ever heard." } },
      choices = { { text = "It was brave. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    statue = {
      lines = { { id = "s_default", text = "The lady at the front gate, the elf with the bow! Miss Danna says she was a ranger who went through the Dark Portal and never came home." } },
      choices = {
        { text = "Why her?", next = "statue2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statue2 = {
      lines = { { id = "s2_default", text = "Because she's the only one who looks like she's about to go somewhere, and the others just look stern. I'd like to go somewhere too, when I'm big." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    questions = {
      lines = { { id = "q_default", text = "Miss Danna says a question is how you get cleverer, so I ask lots. Jimmy says I ask so many that we never get to the sweet shop, and that's a little bit true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_ranger = {
      lines = {
        { id = "x_ranger_l0", text = "Yes, or a teacher like Miss Danna, only with a bow, so the boys would listen. Is that allowed? I don't see why it shouldn't be." },
      },
      choices = {
        { text = "I don't see why not either. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Geoff says that, but Miss Danna says the clever ones are the ones who get to be old. I can't decide which, so I'm going to be both." },
      },
      choices = {
        { text = "Brave is better. Someone has to go first.", next = "BACK", reply = "That's what Geoff says, only he's never gone first at anything.", fx = { align = { honor = 1 } } },
        { text = "Clever is better. Brave people get hurt.", next = "BACK", reply = "I knew it! I'm telling Geoff right now.", fx = { align = { honor = -1 } } },
      },
    },
    x_elf = {
      lines = {
        { id = "x_elf_l0", text = "You're not the same sort of elf as the statue, are you, because your ears are longer and you're sort of purple. Miss Danna says your people live in a tree as big as a mountain, and I don't believe her." },
      },
      choices = {
        { text = "She's telling the truth. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class with Geoff and Jimmy, and I'm the best at reading. Miss Danna didn't say so, but I can tell." } },
    _none = { { id = "tp_none", text = "I don't know that one yet. I'll ask Miss Danna, because she knows everything." } },
  },
}

-- Geoff: one of Miss Danna's pupils.
P:NPC {
  key = "geoff_pupil", id = TODO_NPC("Geoff"), name = "Geoff", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "restless", "bold" }, values = { "adventure" },
  notices = { "soldier" },
  impression = {
    first = "Geoff trails behind Miss Danna's class, swinging a stick at enemies only he can see. History bores him unless somebody in it had a sword.",
    third = "{name} met Geoff, one of Miss Danna's pupils, who would rather be a knight.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Tell me what you fought this time, and don't leave out the blood." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I don't want to hold your weapon any more, so you can keep walking." },
    { id = "g_default", text = "Hey! Is that a real weapon? Can I hold it? Miss Danna's not looking." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you fight anything since I saw you?" },
  },
  notice = {
    { id = "n_knight", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Whoa, you've got real armor on! Does it clank when you run, and is it heavy?" },
  },
  start = "hello",
  nodes = {
    d6_defias = {
      lines = { { id = "d6_defias_a", text = "Nearly! A man in the Trade District had a red scarf, and I followed him for two whole streets, but then he went into a bakery and bought a loaf, and I don't think Defias buy bread. Jimmy says they do, because everybody has to eat, even bandits." } },
      choices = {
        { text = "Jimmy has a point there.", next = "d6_defias2" },
        { text = "Never follow strangers, Geoff. I mean it.", next = "d6_defias2" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    d6_defias2 = {
      lines = { { id = "d6_defias2_a", text = "I know, I know, Miss Danna said that too, very loudly. But the real Defias are out in Westfall, my uncle says, in the old farms, and they've got a whole hideout under the ground that nobody's found yet, so the bread man was probably all right." } },
      choices = {
        { text = "Leave the hideout to the soldiers, lad.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "What else, Geoff?", next = "BACK" },
      },
    },
    d6_brave = {
      lines = { { id = "d6_brave_a", text = "The guard at the gate by the Valley of Heroes, because he stands there all day even when it rains, and he once caught a pickpocket without even running. He just put his arm out, and the pickpocket ran right into it." } },
      choices = {
        { text = "Dwarves fight with hammers, lad, not sticks.", next = "d6_brave2", when = { race = "Dwarf" } },
        { text = "That's real bravery, standing in the rain.", next = "d6_brave2" },
        { text = "Catching thieves takes a cool head.", next = "d6_brave2" },
      },
    },
    d6_brave2 = {
      lines = {
        { id = "d6_brave2_a", text = "That's what I'll do when I'm a knight, only with a horse, so I can put my arm out from higher up. Miss Danna says a guard's bravery is the quiet kind, and I said I'd do the loud kind, and she sighed at me." },
        { id = "d6_brave2_dwarf", when = { race = "Dwarf" }, text = "A hammer! Can I hold it, just for a second, and is it really heavy? I'll get a hammer instead of a sword, then, and I'll put my arm out like the gate guard does, and then hit them with the hammer if they don't stop." },
      },
      choices = {
        { text = "Quiet bravery counts too, Geoff.", next = "BACK" },
        { text = "Anything else on your mind?", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", text = "I'm Geoff, and we've been walking for hours and hours and it's all old buildings. I wanted to see the Stockade, but Miss Danna says it isn't suitable." },
      },
      again = {
        { id = "h_again", text = "Tell me something else, quick, before she calls us." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Why the Stockade?", next = "stockade" },
        { text = "What do you want to be when you're grown?", next = "grown" },
        { text = "A stick isn't much of a sword.", next = "stick" },
        { text = "Show me how you'd fight an orc.", next = "x_fight" },
        { text = "Fighting isn't the only way to be a hero.", next = "x_stance" },
        { text = "I'm a warrior. That stick needs a better grip.", next = "x_war", when = { class = "WARRIOR" } },
        { text = "Have you ever seen a real Defias?", next = "d6_defias" },
        { text = "Who's the bravest person you know?", next = "d6_brave" },
        { text = "Keep up with your class, Geoff.", next = "END" },
      },
    },
    stockade = {
      lines = { { id = "s_default", text = "Because that's where they keep the bandits, the ones with the red masks! Jimmy's brother says you can hear them shouting through the bars at night, and I want to hear it too.", fx = { learn = { "defias" } } } },
      choices = { { text = "Your teacher's right about that one. Something else.", next = "BACK" } },
    },
    grown = {
      lines = { { id = "g_default2", text = "A knight, with a horse and a lion on my shield, and I'll go to Redridge and chase all the orcs out. Andi says I'd have to learn my letters first, but I bet knights don't read much." } },
      choices = {
        { text = "Knights read their orders, Geoff.", next = "grown2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grown2 = {
      lines = { { id = "g2_default", text = "They do? Oh, bother. Well, I'll learn the letters that are in orders, then, and I'll skip the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stick = {
      lines = { { id = "st_default", text = "It's a practice sword, and that's different. The guards by the gate practise with wooden ones too, I've seen them, so there." } },
      choices = { { text = "So they do. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_fight = {
      lines = {
        { id = "x_fight_l0", text = "Like this, chop, chop, and then a spin, and then you shout For the Alliance so they know who did it. Jimmy plays the orc, but he always falls down too soon." },
      },
      choices = {
        { text = "Very fierce. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "That's what Miss Danna says, and she means reading. I think heroes should be allowed to fight and read, as long as the fighting comes first." },
      },
      choices = {
        { text = "Heroes protect people. Fighting is just part of it.", next = "BACK", reply = "Oh. Then I'll protect Jimmy, because he needs it.", fx = { align = { light = 1 } } },
        { text = "Heroes win. That's all that matters.", next = "BACK", reply = "That's what I said! Wait till I tell Andi.", fx = { align = { light = -1 } } },
      },
    },
    x_war = {
      lines = {
        { id = "x_war_l0", text = "A real warrior! Show me, show me, is it like this, with both hands? Don't let Miss Danna see, she took my last stick." },
      },
      choices = {
        { text = "Both hands, thumbs round. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class, but only until I'm old enough to be a squire." } },
    defias = { { id = "tp_defias", text = "They wear red masks and they live in the Stockade now, some of them. I'm not scared of them, not much." } },
    _none = { { id = "tp_none", text = "I dunno. Ask Andi, she knows everything, and she'll tell you even if you don't ask." } },
  },
}

-- Jimmy: one of Miss Danna's pupils.
P:NPC {
  key = "jimmy_pupil", id = TODO_NPC("Jimmy"), name = "Jimmy", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "hungry", "cheerful" }, values = { "sweets" },
  notices = { "food" },
  impression = {
    first = "Jimmy is the smallest of Miss Danna's pupils and the one most likely to ask when lunch is. He knows where every bakery in Stormwind stands, which is its own kind of scholarship.",
    third = "{name} met Jimmy, one of Miss Danna's pupils, who knows every bakery in Stormwind.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again! You're my favourite grown-up, because you never tell me off for asking about food." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. I'm hungry and grumpy, and you're not helping." },
    { id = "g_default", text = "Hello! Have you got anything to eat? I'm not supposed to ask, but have you?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! We still haven't had lunch, in case you wondered." },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen, a good one! Do you make pies, and are they the kind with crust on top?" },
  },
  start = "hello",
  nodes = {
    ydanna = {
      lines = {
        { id = "yjimmypupil1", text = "She's our teacher, and she knows everything about Stormwind, like who built the walls and which king was which. She's nice, mostly, but she won't let us stop at bakeries, and she says I ask too many questions about food." },
        { id = "yjimmypupil2", when = { class = { "PRIEST", "PALADIN" } }, text = "She says the Light wants us to learn. Does it? I think the Light wants us to have lunch too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylive = {
      lines = {
        { id = "yjimmypupil3", text = "Near the canals, with my gran, because my mum and dad went away to Westfall to farm and didn't come back yet. Gran says they will, when the harvest's good, but it hasn't been good for ages." },
      },
      choices = {
        { text = "Do you miss them?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "yjimmypupil4", text = "Lots. Gran says the Defias are making the farms hard. Some people at the market say the farmers should fight the Defias, and some say they should give them what they want so they stop." },
      },
      choices = {
        { text = "The farmers should stand up to them.", next = "BACK", reply = "That's what Gran says too. I hope my dad is brave.", fx = { align = { order = 1 } } },
        { text = "Better to keep the peace and stay safe.", next = "BACK", reply = "I just want Mum and Dad home. I don't care who wins.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jimmy, and my feet hurt, and we've walked past three bakeries without stopping at any of them. Miss Danna says learning comes first, but I learn better after a bun." },
      },
      again = {
        { id = "h_again", text = "What else? Is it about food?" },
        { id = "h_again2", text = "You can ask me another thing." },
      },
      choices = {
        { text = "Which bakery is the best?", next = "bakery" },
        { text = "Do you like the school walks?", next = "walks" },
        { text = "Your friends look to be leaving you behind.", next = "behind" },
        { text = "If you had a whole silver, what would you buy?", next = "x_silver" },
        { text = "You should share your treats with the others.", next = "x_stance" },
        { text = "Gnomes like sweets too, you know.", next = "x_gnome", when = { race = "Gnome" } },
        { text = "Who is Miss Danna?", next = "ydanna" },
        { text = "Where do you live?", next = "ylive" },
        { text = "Run along, Jimmy.", next = "END" },
      },
    },
    bakery = {
      lines = { { id = "b_default", text = "The one in the Trade District by the fountain, because the lady there gives you the end of the loaf if you stand and look sad. I'm really good at looking sad." } },
      choices = {
        { text = "Show me your sad look.", next = "sad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sad = {
      lines = { { id = "s_default", text = "Like this, see, with my chin down and my eyes big. Geoff tried it once and the lady laughed at him, because he can't keep from grinning." } },
      choices = { { text = "That is very sad indeed. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    walks = {
      lines = { { id = "w_default", text = "I like the canals, because there's boys fishing and sometimes a boat, and I like the Cathedral because it's quiet and you can sit down. I don't like the bit with all the stairs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    behind = {
      lines = { { id = "bh_default", text = "They always wait at the corner, because Miss Danna counts us. Andi's asking a question anyhow, so I've got ages yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_silver = {
      lines = {
        { id = "x_silver_l0", text = "A whole silver? I'd buy a pie, a big one with meat in it, and then a sweet bun for after, and then I'd still have some left for tomorrow. Is a silver a lot? It sounds like a lot." },
      },
      choices = {
        { text = "It's quite a lot for pie. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "I do share, mostly, only Geoff eats his half and then wants my half too. Andi says that's not fair, and Andi's usually right." },
      },
      choices = {
        { text = "Sharing is right, even when it isn't fair.", next = "BACK", reply = "All right, but only with Andi, because she shares back.", fx = { align = { light = 1 } } },
        { text = "Keep what's yours, Jimmy. Geoff can buy his own.", next = "BACK", reply = "Yes! I'm going to tell him you said so.", fx = { align = { light = -1 } } },
      },
    },
    x_gnome = {
      lines = {
        { id = "x_gnome_l0", text = "There's a gnome by the canal who sells candy to the orphans, and he's got a sum for exactly how much sugar makes you happy. I want to be an orphan for one day, just to try it." },
      },
      choices = {
        { text = "Better not wish for that. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gran = { { id = "yjimmypupil5", text = "I live with my gran. She makes the best soup." } },
    westfall = { { id = "yjimmypupil6", text = "My mum and dad went there to farm. It's far, and it's dangerous now." } },
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class with Andi and Geoff. I'm the littlest, but I'm not the slowest, that's Geoff when he's fighting things." } },
    _none = { { id = "tp_none", text = "I don't know. Is it something you can eat?" } },
  },
}
