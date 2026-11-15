-- The Military Ward: the Hall of Arms' trainers, and a soldier's widow who waits for letters.
-- Voices: bibles/military_ward.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sara Balloo: Sully Balloo's wife. His letter from beneath the Thandol Span, her plea to Magni,
-- and the King's memorial (A King's Tribute).
P:NPC {
  key = "sara_balloo", id = TODO_NPC("Sara Balloo"), name = "Sara Balloo",
  bible = "bibles/military_ward.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "gentle" }, values = { "loving", "loyal" },
  notices = { "soldier" },

  impression = {
    first = "Sara Balloo waits in the Military Ward for news of her husband, Sully, who serves at the Thandol Span. She asks every traveler where they have been, and listens very carefully to the answer.",
    third = "{name} met Sara Balloo of Ironforge, whose husband Sully was posted with the soldiers watching the Thandol Span.",
  },

  greetings = {
    { id = "g_news", text = "Ye look as though ye've come a long way. What news d'ye bring from the roads?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") }, text = "Oh, it's you. No, stay, please; I'd rather see a kind face than an empty doorway." },
    { id = "g_memorial", when = { questDone = TODO_QUEST("A King's Tribute") }, text = "Good day tae ye. I went an' sat by Sully's stone this mornin', an' it helped, a little." },
  },

  notice = {
    { id = "n_priest", cat = "soldier", when = { class = "PRIEST", questDone = TODO_QUEST("Sully Balloo's Letter") },
      text = "A priest. I've had the High Priest's people by, an' they're very kind, but I don't want tae be prayed at today; I only want tae sit." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 25 },
      text = "Ye carry yerself like a soldier. Have ye been up through the Wetlands, past Dun Modr? My Sully's posted there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sara Balloo. My Sully serves wi' the garrison at Dun Modr, watchin' over the Thandol Span, an' I ask everyone who comes through the Ward whether they've passed that way." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Sully Balloo's Letter") },
          text = "Ye've the look o' someone carryin' somethin' heavy, an' ye keep lookin' at me as if it belongs tae me. These are tryin' times for the soul, so tell me plain: what news d'ye bring?" },
        { id = "h_grief", tags = { "news" }, when = { questRecent = { TODO_QUEST("Sully Balloo's Letter"), days = 3 } },
          text = "I've read his letter so often the ink's goin' soft. He wrote it in case, ye see, an' then the case came, an' he was right tae write it." },
        { id = "h_plea", tags = { "news" }, when = { questActive = TODO_QUEST("Sara Balloo's Plea") },
          text = "Have ye taken my note tae the King? I'd go myself, but I couldnae stand before him like this an' say what needs sayin' wi'out breakin' in half." },
        { id = "h_tribute", tags = { "news" }, when = { questActive = TODO_QUEST("A King's Tribute") },
          text = "They say the King's ordered a memorial for Sully, an' the Grand Mason's sent for stone. I don't know what tae feel about it yet, so I'm feelin' all of it at once." },
        { id = "h_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "Sully's gone. He died at the Thandol Span when the Dark Irons came, an' ye were the one who found him, so ye've as much right tae his name as anyone." },
      },
      again = {
        { id = "h_again", text = "Is there somethin' else? I've nowhere tae be." },
        { id = "h_again2", text = "Go on. It's good tae talk." },
      },
      choices = {
        { text = "Tell me about Sully.", next = "sully" },
        { text = "What's happening at the Thandol Span?", next = "span" },
        { text = "How do you pass the days?", next = "days" },
        { text = "What did the King say?", next = "king", when = { questDone = TODO_QUEST("Sara Balloo's Plea") } },
        { text = "Would you like me to pray with you?", next = "pray", when = { class = "PRIEST" } },
        { text = "Take care, Sara.", next = "END" },
      },
    },

    sully = {
      lines = {
        { id = "su_default", text = "He's a soldier, an' a believer in what he's sent tae do, which is more than most can say. He writes every fortnight, an' every letter begins the same way, 'My dear Sara', as if I might've forgotten who I was." },
        { id = "su_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "He was a soldier who believed in his missions, every one. His last letter began like all the others, 'My dear Sara', an' the rest is mine, if ye don't mind." },
      },
      choices = {
        { text = "Of course. The rest is yours.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Why did he believe so strongly?", next = "sully_why" },
      },
    },
    sully_why = {
      lines = {
        { id = "sw_default", text = "Because somebody has tae hold the bridges, he'd say, or there's nothin' between the Dark Irons an' the rest o' us but water. I used tae tell him that's what the water's for." },
      },
      choices = {
        { text = "He was right; someone has to stand there.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "You were right; no bridge is worth a husband.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    span = {
      lines = {
        { id = "sp_default", text = "It's the great bridge between the Wetlands an' Arathi, an' the Dark Irons have been at it. Folk say there was an attack, an' the garrison at Dun Modr's been stretched thin ever since." },
      },
      choices = {
        { text = "I'll go and see for myself.", next = "span_go" },
        { text = "Something else, Sara.", next = "BACK", fx = { learn = { "thandol_span", "dark_iron" } } },
      },
    },
    span_go = {
      lines = {
        { id = "sg_default", text = "Would ye? If ye pass by the Span, look for him, will ye; Sully Balloo, a broad dwarf wi' a laugh ye can hear from the far bank. Tell him tae write." },
        { id = "sg_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "Ye've already been, an' ye found him in the water under the bridge. I'm glad it was someone who'd come back an' tell me, an' no' a stranger who'd walk on." },
      },
      choices = {
        { text = "The Dark Irons will answer for this bridge.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "thandol_span" } } },
        { text = "Vengeance won't bring anyone home.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 }, learn = { "thandol_span" } } },
      },
    },

    days = {
      lines = {
        { id = "da_default", text = "I keep the house, an' I walk the Ward, an' I go up tae the gates when a courier's due. Some evenin's Brother Toldren lets me sit in the back o' the Hall, an' doesnae ask me anythin', which is a mercy." },
      },
      choices = {
        { text = "Waiting must be the hardest part.", next = "days_wait" },
        { text = "Keeping busy is the best medicine.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    days_wait = {
      lines = {
        { id = "dw_default", text = "It is, an' everyone in the Military Ward knows it. Half the wives an' husbands on this street are waitin' on someone, an' we nod tae each other in the mornin' an' don't say a word." },
      },
      choices = {
        { text = "Families like yours carry this war too.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "It's the price of keeping Khaz Modan safe.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    king = {
      big = true,
      lines = {
        { id = "ki_default", text = "He sighed, they say, a long one, an' then he ordered a memorial built. He said that war's travesties have tae be endured for the good o' our people, an' that every dwarf who falls weighs on him." },
        { id = "ki_done", when = { questDone = TODO_QUEST("A King's Tribute") },
          text = "It's finished now, granite from Alterac, an' it'll stand longer than any of us. The King says it's for the ones who'll come after, so they don't forget what Sully gave." },
      },
      choices = {
        { text = "The King honored him rightly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A stone is small payment for a life.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Do you believe him?", next = "king_believe" },
      },
    },
    king_believe = {
      lines = {
        { id = "kb_default", text = "I believe he means it, an' I believe it doesnae help as much as he'd like. Both can be true, Sully used tae say about most things." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    pray = {
      lines = {
        { id = "pr_default", text = "Not today, if ye'll forgive me; I've been prayed for until my ears ring. Only sit wi' me a moment, would ye, an' that can be the prayer." },
      },
      choices = {
        { text = "Silence can be a prayer too.", next = "BACK", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Sometimes words help more than silence.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I listen tae every traveler who'll stop, so I know more about the roads than I ever wanted tae. Ask me." } },
    background = { { id = "tp_bg", text = "I'm Sully Balloo's wife, an' that's all I've been for a long while. I don't mind it." } },
    advice = { { id = "tp_ad", text = "Write tae the ones who wait for ye, even if it's only a line. Ye'll never know how much a line weighs." } },
    thandol_span = { { id = "tp_span", text = "The bridge my Sully was sent tae hold. I'd rather ye asked me about somethin' else, but I'll tell ye what I know.", next = "span" } },
    dark_iron = { { id = "tp_dark_iron", text = "They're the ones who struck the Span. I don't know more than that, an' I don't want tae." } },
    _none = { { id = "tp_none", text = "I'm sorry, I couldnae say. Ask someone in the Hall o' Arms; they know about such things." } },
  },
}

-- Kelstrum Stonebreaker: warrior trainer; scoffs that non-warriors wouldn't last a day of his regimen.
P:NPC {
  key = "kelstrum", id = TODO_NPC("Kelstrum Stonebreaker"), name = "Kelstrum Stonebreaker", title = "Warrior Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "stern", "brave" },
  notices = { "class" },

  impression = {
    first = "Kelstrum Stonebreaker told me I wouldn't last a day under his training regimen, and laughed about it. I am not entirely sure he was wrong.",
    third = "{name} met Kelstrum Stonebreaker, a loud warrior trainer in the Hall of Arms.",
  },

  greetings = {
    { id = "g_ha", text = "Ha! Another one wanderin' intae the Hall o' Arms. State yer business, an' stand up straight while ye do it." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Back for more punishment? Good; punishment's what makes a warrior." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest in the Hall o' Arms! Ye'd no' last a day under my regimen, but I'll grant ye this: I'd want ye behind me in a fight, so don't let anyone tell ye different." },
    { id = "n_human_war", cat = "class", when = { class = "WARRIOR", race = "Human" },
      text = "A human warrior. Ye're taller than my usual lot, so ye'll be gettin' hit in the head more; mind yer helmet." },
    { id = "n_gnome_war", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome warrior! Bilban says ye're all the best at gettin' under a guard, an' I'll admit he has a point, low as it is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kelstrum Stonebreaker, an' I train warriors. Yer no warrior, by the look o' ye, an' ye wouldnae last a day under my trainin' regimen, but go on, ask what ye came tae ask." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "There's a warrior! A bit soft round the edges, but we'll hammer that out. What'll it be: trainin', or are ye just here tae admire the weapons?" },
        { id = "h_warrior_high", when = { class = "WARRIOR", minLevel = 40 },
          text = "Look at that, someone who survived my regimen an' kept goin'. I'll no' say I'm proud, for it'd go tae yer head, but I'm no' disappointed." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, now; my students are standin' about." },
        { id = "h_again2", text = "Spit it out. Warriors don't dither." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's this famous regimen?", next = "regimen" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "I'd last a day, I'll wager.", next = "wager", when = { ["not"] = { class = "WARRIOR" } } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    regimen = {
      lines = {
        { id = "re_default", text = "Up before the forges, a hundred swings wi' a practice axe, a run tae the gates an' back, then sparrin' till ye cannae lift yer arms. Then we start the real work." },
      },
      choices = {
        { text = "Discipline makes the warrior.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Real fights don't follow a drill.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And the real work is?", next = "regimen_real" },
      },
    },
    regimen_real = {
      lines = {
        { id = "rr_default", text = "Learnin' tae get up. Anybody can swing an axe, but a warrior's the one who's still standin' when the others are lyin' down, an' that's all I really teach." },
      },
      choices = { { text = "That's a fair lesson.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    good = {
      lines = {
        { id = "go_default", text = "Thick skin, a short memory for bruises, an' the sense tae stand in front o' the folk who cannae take a hit. That last one's the part they forget." },
      },
      choices = {
        { text = "Standing in front is an honor.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Winning matters more than where you stand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wager = {
      lines = {
        { id = "wa_default", text = "Ha! A wager, is it? I've heard that from mages, an' priests, an' once from a very confident gnome wi' a wrench, an' I'm still waitin' tae lose." },
      },
      choices = {
        { text = "Then I'll be the first.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Maybe I'll keep my wager for another day.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear a fair bit from the soldiers comin' back through the Ward. Here's what's worth knowin'." } },
    background = { { id = "tp_bg", text = "I train warriors in the Hall o' Arms. That's my story, an' it's got a lot o' shoutin' in it." } },
    advice = { { id = "tp_ad", text = "Get up. Whatever knocks ye down, get up before it comes back for a second look." } },
    _none = { { id = "tp_none", text = "Do I look like a librarian? Ask in the Hall o' Explorers." } },
  },
}

-- Bilban Tosslespanner: gnome warrior trainer; talks like an engineering manual.
P:NPC {
  key = "bilban", id = TODO_NPC("Bilban Tosslespanner"), name = "Bilban Tosslespanner", title = "Warrior Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "practical", "proud" },
  notices = { "class" },

  impression = {
    first = "Bilban Tosslespanner explains swordplay as if it were a faulty machine to be repaired. I understood perhaps half, but he was very sure of all of it.",
    third = "{name} met Bilban Tosslespanner, a gnome warrior trainer in the Hall of Arms who talks about combat like an engineer.",
  },

  greetings = {
    { id = "g_spec", text = "Greetings. Please state your class specification and the nature of your inquiry." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Ah, a warrior unit, returning for calibration. Excellent." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Due to incompatibility in your class specification, I am unable to train you. I can, however, recommend that you stand behind someone I have trained." },
    { id = "n_gnome_war", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome warrior! Low center of gravity, excellent; most opponents' guards are calibrated for a target twice your height." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bilban Tosslespanner, warrior trainer. I correct deficiencies in combat technique, much as one corrects a misaligned gear, though with more shouting." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Due to incompatibility in your class specification, I'm unable to help you rectify any lack of ability. I am, however, able to talk, so do proceed." },
      },
      again = {
        { id = "h_again", text = "Further inquiries? Please proceed." },
        { id = "h_again2", text = "Next item on the agenda?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Why does a gnome take up arms?", next = "why" },
        { text = "Combat is like engineering?", next = "engineering" },
        { text = "Good day, Bilban.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because the troggs did not wait for us to finish our calculations. A great many gnomes learned to fight on the way out of Gnomeregan, and some of us found we had an aptitude." },
      },
      choices = {
        { text = "Every gnome should learn to fight now.", next = "BACK", fx = { align = { order = 1 }, learn = { "gnomeregan" } } },
        { text = "Gnomes should build, and leave fighting to others.", next = "BACK", fx = { align = { order = -1 }, learn = { "gnomeregan" } } },
        { text = "How did you learn?", next = "why_learn" },
      },
    },
    why_learn = {
      lines = {
        { id = "wl_default", text = "Badly, at first, and then from Kelstrum, who shouted at me until I improved. I have since refined his method by adding diagrams, which he does not appreciate." },
      },
      choices = { { text = "I'd like to see the diagrams.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    engineering = {
      lines = {
        { id = "en_default", text = "Exactly like it. Every guard has a tolerance, every swing has a load limit, and every opponent has a weak bolt somewhere, so a warrior's task is to find the bolt." },
      },
      choices = {
        { text = "Strike the weak bolt first, whatever it takes.", next = "BACK", fx = { align = { honor = -1 }, trait = { practical = 1 } } },
        { text = "I'd rather beat them fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "And my weak bolt?", next = "bolt" },
      },
    },
    bolt = {
      lines = {
        { id = "bo_default", text = "Your left side, at present; you favor it when you stand. I'd charge a fee for that diagnosis, but I'm told the Hall of Arms frowns on it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I have catalogued a number of facts, of varying reliability. Select one." } },
    background = { { id = "tp_bg", text = "I left Gnomeregan with the rest, learned to fight, and now I train others to do it more efficiently. That is the summary." } },
    advice = { { id = "tp_ad", text = "Check your equipment's tolerances before a fight, not during. During is very inconvenient." } },
    _none = { { id = "tp_none", text = "That falls outside my area of specification." } },
  },
}

-- Daera Brightspear: dwarf hunter trainer; sends young dwarf hunters to Grif Wildheart in Kharanos.
P:NPC {
  key = "daera", id = TODO_NPC("Daera Brightspear"), name = "Daera Brightspear", title = "Hunter Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "steady" }, values = { "practical", "patient" },
  notices = { "pet" },

  impression = {
    first = "Daera Brightspear looked at my companion before she looked at me, which I suppose is how hunters say hello. She speaks plainly and seems to trust beasts more than people.",
    third = "{name} met Daera Brightspear, a dwarf hunter trainer in the Hall of Arms.",
  },

  greetings = {
    { id = "g_hunt", text = "If ye're no' a hunter, I cannae help ye wi' trainin'. If ye are, come in an' let's have a look at ye." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "An' who's this, then? Let me see yer beast first; ye can wait." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet}, is it? A good name. The beast'll answer tae it as long as ye feed it, an' longer, if ye're kind." },
    { id = "n_priest", cat = "pet", when = { class = "PRIEST" },
      text = "A priest in the Hall o' Arms. Ye'd make a fair hunter, I think; ye already know how tae keep somethin' alive that'd rather bite ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Daera Brightspear. I train hunters here, an' if ye're no' one, ye'll want tae look for yer own kind o' trainer, though I'll answer a question if ye've one." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunter's Path") },
          text = "Grif Wildheart's waitin' for ye in Kharanos. He'll put ye on the path tae a beast o' yer own, an' mind ye listen tae him; he's never been wrong about an animal." },
        { id = "h_hunter_young", when = { class = "HUNTER", maxLevel = 12 },
          text = "A young hunter, an' ye've no' got a beast yet, have ye? Go an' see Grif Wildheart in Kharanos; he'll know when ye're ready." },
      },
      again = {
        { id = "h_again", text = "Anythin' else?" },
        { id = "h_again2", text = "Go on, then, ask." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you choose a beast?", next = "beast" },
        { text = "Who's Grif Wildheart?", next = "grif" },
        { text = "Farewell.", next = "END" },
      },
    },
    beast = {
      lines = {
        { id = "be_default", text = "Ye don't, mostly; it chooses ye, an' ye find out by how much it bites. A bear's loyal, a cat's clever, an' a boar's too stubborn tae know when it's beaten, which makes it a dwarf's favorite." },
      },
      choices = {
        { text = "A beast should obey its master.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A beast is a partner, not a servant.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grif = {
      lines = {
        { id = "gr_default", text = "A hunter in Kharanos who teaches the young ones how tae tame their first beast. He's patient wi' animals an' short wi' people, so ye'll get on fine if ye bark." },
      },
      choices = {
        { text = "I'll bark politely.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hunters bring news in from the hills along wi' the pelts. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "I train hunters in the Hall o' Arms. My own story's mostly about cold mornin's an' patient beasts." } },
    advice = { { id = "tp_ad", text = "Feed yer beast before ye feed yerself. It remembers who did." } },
    _none = { { id = "tp_none", text = "No' my trade, I'm afraid. Try someone wi' books." } },
  },
}
