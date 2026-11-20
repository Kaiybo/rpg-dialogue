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
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the Academy as a boy to learn spells, and found I liked the books better than the casting. Master Mazen took me on, and I've been up these stairs ever since." } },
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
    { id = "g_default", text = "Shh, you'll scare them off! Well, there aren't any to scare, but that's what you're supposed to say." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Billy still hasn't caught anything, in case you were wondering." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "You've got a real fishing pole! Tell Billy there aren't any big fish in the canal, because he won't listen to me." },
  },
  start = "hello",
  nodes = {
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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "Born under the mountain and soldiering since my beard was red. These days I walk, I drink and I remember, and that's work enough for an old dwarf." } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I sold my sword through the Second War and came home with most of my limbs. Aedis and I have been walking to the same tavern ever since." } },
    defias = { { id = "tp_defias", text = "The men who rebuilt this city and were never paid for it. I'll not excuse what they've become, but I remember what they were." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. Aedis will have an opinion, though, and he'll give it to you whether it's right or not." } },
  },
}

-- Aldric Moore: mail armor, Lionheart Armory, Trade District.
P:NPC {
  key = "aldric_moore", id = TODO_NPC("Aldric Moore"), name = "Aldric Moore", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "confident", "argumentative" }, values = { "craft", "family" },
  notices = { "armor" },
  impression = {
    first = "Aldric Moore sells mail at Lionheart Armory and will tell anyone that leather is what you wear when you can't afford rings. Lara Moore, at the next rack, can hear every word, which seems to be the point.",
    third = "{name} met Aldric Moore, who sells mail armor at Lionheart Armory.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Lionheart Armory, {class}. If it's mail you want, you've come to the right rack." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let me see how the links are holding up." },
  },
  notice = {
    { id = "n_mail", cat = "armor", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's a frame built to carry weight. You'll want good mail under whatever else you wear, and I'll hear no argument on it." },
    { id = "n_worn", cat = "armor", when = { durability = { max = 0.25 } },
      text = "Your gear's taken a beating, friend. I sell new mail, mind, so for mending you'll want a smith in the Dwarven District." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "Aldric Moore, and I sell mail, which I doubt is what you came for. Carla has the robes by the window, and she'll look after you better than I could." },
        { id = "h_default", text = "Aldric Moore, and every ring on this rack was riveted by a smith I know by name. Mail turns a blade and still lets you run, and you'll not find a better bargain between cloth and plate." },
      },
      again = {
        { id = "h_again", text = "Anything else I can tell you?" },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Why mail and not leather?", next = "leather" },
        { text = "Who runs this shop?", next = "shop" },
        { text = "Where does your mail come from?", next = "source" },
        { text = "Good day, Aldric.", next = "END" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "Because a wolf can bite through leather and a knife can find the seams, and neither does much to good rings. Lara will tell you leather's quieter, and she's right, but I'd rather be loud and alive." } },
      choices = {
        { text = "You and Lara argue about this often?", next = "lara" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lara = {
      lines = { { id = "la_default", text = "Every day since we took the racks side by side, and neither of us has given an inch. It's a family habit, and the customers seem to enjoy it more than they should." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "s_default", text = "Harlan Bagley owns Lionheart and keeps the books, and the three of us sell from his floor. Carla Granger has the cloth, Lara the leather and I the mail, so there's hardly a soldier in Stormwind we can't dress between us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    source = {
      lines = { { id = "so_default", text = "From the forges in the Dwarven District, mostly, and a little comes down from Ironforge when the passes are clear. The army takes the best of it for the Redridge garrison these days, so I sell what's left and I'm glad to have it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold armor on this floor for years, and worn it before that. A man should know what he sells from the inside." } },
    _none = { { id = "tp_none", text = "That's outside my trade, friend. Ask Harlan, because he hears everything that crosses the counter." } },
  },
}

-- Carla Granger: cloth armor, Lionheart Armory, Trade District.
P:NPC {
  key = "carla_granger", id = TODO_NPC("Carla Granger"), name = "Carla Granger", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "observant" }, values = { "craft" },
  notices = { "armor", "magic" },
  impression = {
    first = "Carla Granger sells robes and cloth at Lionheart Armory, and she had my measure before I'd finished coming through the door. She says she's never needed a tape, and I believe her.",
    third = "{name} met Carla Granger, who sells cloth armor at Lionheart Armory.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Stand still a moment and let me look at your shoulders, because that's how I size a robe." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you, and I remember your sleeve length too. What can I find for you?" },
  },
  notice = {
    { id = "n_cloth", cat = "magic", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ah, somebody who'll actually wear what I sell! Most who come through that door walk straight past me to the Moores." },
    { id = "n_plate", cat = "armor", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll want the mail rack, I expect, though even a soldier needs a padded shirt under all that iron." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Carla Granger, and I keep the cloth at Lionheart: robes, mantles, gloves and anything else that won't rust. People forget that half the Alliance's strength walks about in wool and linen." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Yes, dear, go on." },
      },
      choices = {
        { text = "Can you really size someone by eye?", next = "eye" },
        { text = "A cloth seller in an armory seems odd.", next = "odd" },
        { text = "How do you get on with the Moores?", next = "moores" },
        { text = "Thank you, Carla.", next = "END" },
      },
    },
    eye = {
      lines = { { id = "e_default", text = "I can, and I've not been wrong in years. You favour your right arm and you stand as though you've walked a long way lately, so I'd cut your hem a finger short and leave room in the shoulder." } },
      choices = {
        { text = "Who taught you that?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "t_default", text = "Nobody did, exactly. I fitted robes for the Academy's students before I came to Harlan, and when forty apprentices need sleeves by morning you learn to stop reaching for the tape." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    odd = {
      lines = { { id = "o_default", text = "Harlan says the same, and then he counts what I've sold and stops saying it. A mage who's cold and wet casts badly, and good cloth is the only armor some folk can wear." } },
      choices = { { text = "Fairly said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    moores = {
      lines = { { id = "m_default", text = "Well enough, when they aren't shouting about leather and mail across my display. I've told Aldric and Lara that the day they agree on anything, I'll close the shop and declare a holiday." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've had a needle in my hand since I was a girl, and I've sold from Harlan Bagley's floor for a good while now. It suits me." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. I know cloth, and I know who's put on weight since Winter Veil, and that's about the sum of it." } },
  },
}

-- Allan Hafgan: staves, Stormwind Staves, Mage Quarter.
P:NPC {
  key = "allan_hafgan", id = TODO_NPC("Allan Hafgan"), name = "Allan Hafgan", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "proud", "courteous" }, values = { "craft", "stormwind" },
  notices = { "magic" },
  impression = {
    first = "Allan Hafgan sells staves in the Mage Quarter and speaks of each one as a vintner speaks of a year. He is proud that everything on his wall was made within the city, and a little sad about why it has to be.",
    third = "{name} met Allan Hafgan, the staff merchant at Stormwind Staves.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Stormwind Staves. Everything on these walls was made by crafters and mages of this city, and I'll stand behind every piece." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The ash staff you were eyeing is still here, I think." },
  },
  notice = {
    { id = "n_caster", cat = "magic", when = { class = { "MAGE", "WARLOCK", "PRIEST", "DRUID" } },
      text = "You hold yourself like someone who knows what a staff is for, and that it's more than a walking stick with ambitions." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_druid", when = { class = "DRUID" },
          text = "Allan Hafgan, at your service. I'm told your people prefer a staff that grew rather than one that was carved, and I do keep a few that were shaped with a lighter hand." },
        { id = "h_default", text = "Allan Hafgan, at your service. I sell staves, and Ardwyn beside me sells wands, so between us we can arm a spellcaster for anything short of a siege." },
      },
      again = {
        { id = "h_again", text = "Is there anything else I can tell you?" },
        { id = "h_again2", text = "Please, ask what you like." },
      },
      choices = {
        { text = "Where do your staves come from?", next = "source" },
        { text = "What makes a good staff?", next = "good" },
        { text = "A warrior could use one of these as a quarterstaff.", next = "warrior", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Good day, Allan.", next = "END" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Once, the best came from Dalaran and from the elves of Quel'Thalas, and a merchant had only to wait for the caravan. Both are gone now, so we make our own, and I'll say plainly that Stormwind has risen to it." } },
      choices = {
        { text = "Who does the making?", next = "makers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makers = {
      lines = { { id = "m_default", text = "Woodwrights in the Trade District turn the shafts, and Lucan Cordell and the other enchanters here in the quarter do the fine work. Lucan is slow and he won't be hurried, and that is why his pieces don't crack." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "g_default2", text = "Straight grain, patient seasoning and a core that takes a charge without complaint. A staff should feel a little too heavy in the shop, because you'll be leaning your whole will on it when it matters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "You could, and it would hold, though the enchanter who made it might weep to see it. If all you want is something to hit with, the weaponsmiths in Old Town will sell you plain oak for a great deal less." } },
      choices = { { text = "Honest of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept this shop since the quarter was rebuilt. I was never much of a caster myself, but I know a true staff when I lift one." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond me. The Academy's library on the canals may have your answer, if you can get Mazen to look up from his page." } },
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
    { id = "g_default", text = "Hey! Is that a real weapon? Can I hold it? Miss Danna's not looking." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you fight anything since I saw you?" },
  },
  notice = {
    { id = "n_knight", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Whoa, you've got real armor on! Does it clank when you run, and is it heavy?" },
  },
  start = "hello",
  nodes = {
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
    { id = "g_default", text = "Hello! Have you got anything to eat? I'm not supposed to ask, but have you?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! We still haven't had lunch, in case you wondered." },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen, a good one! Do you make pies, and are they the kind with crust on top?" },
  },
  start = "hello",
  nodes = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class with Andi and Geoff. I'm the littlest, but I'm not the slowest, that's Geoff when he's fighting things." } },
    _none = { { id = "tp_none", text = "I don't know. Is it something you can eat?" } },
  },
}

-- Guard Hammon: door guard, Champions' Hall.
P:NPC {
  key = "guard_hammon", id = TODO_NPC("Guard Hammon"), name = "Guard Hammon", gender = "male",
  bible = "bibles/missed_a.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "formal" }, values = { "dutiful" },
  notices = { "soldier" },
  impression = {
    first = "Guard Hammon stands his post at the Champions' Hall with his chin up and his eyes front. He is polite in the way of a man who has turned away a great many people.",
    third = "{name} met Guard Hammon, who stands watch at the Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Hold a moment, {class}. This is the Champions' Hall, and I'm to know who passes." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Go on, then, and keep it orderly inside." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've the bearing for it, I'll grant. Bearing isn't rank, mind, and it's rank the officers ask after." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Hammon, Stormwind footman, posted to the hall. Quine and I keep the door, and the officers inside keep the rest of the kingdom, or so they tell us." },
      },
      again = {
        { id = "h_again", text = "Anything further? I'm on post." },
        { id = "h_again2", text = "Be quick about it, if you would." },
      },
      choices = {
        { text = "Who is allowed inside?", next = "inside" },
        { text = "Is this a good posting?", next = "posting" },
        { text = "Carry on, guard.", next = "END" },
      },
    },
    inside = {
      lines = { { id = "i_default", text = "Officers of the Alliance and those they vouch for, and nobody else on a busy day. I don't make the list, I only read it, so there's no use arguing with me." } },
      choices = {
        { text = "Do many argue?", next = "argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue = {
      lines = { { id = "a_default", text = "A young lord's son tried last week and told me who his father was. I told him who my sergeant was, and he went home." } },
      choices = { { text = "Well handled. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    posting = {
      lines = { { id = "p_default", text = "It's dry, it's in Old Town, and the Pig and Whistle is close enough to smell at supper time. I'd sooner be here than on the Westfall road, though I'd not say so in front of the officers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Five years a footman, and two of them on this door. It's steady work." } },
    _none = { { id = "tp_none", text = "Not my business to know, {class}. Ask inside, if they'll have you." } },
  },
}

-- Guard Quine: door guard, Champions' Hall.
P:NPC {
  key = "guard_quine", id = TODO_NPC("Guard Quine"), name = "Guard Quine", gender = "male",
  bible = "bibles/missed_a.md", role = "guard", tier = "service",
  communities = { "stormwind" }, temper = { "dry", "watchful" }, values = { "dutiful" },
  notices = { "soldier", "stealth" },
  impression = {
    first = "Guard Quine shares the door of the Champions' Hall with Hammon and says about half as much. He watches hands rather than faces, a habit he says Old Town teaches quickly.",
    third = "{name} met Guard Quine, who stands watch at the Champions' Hall.",
  },
  greetings = {
    { id = "g_default", text = "Mind the step, and mind your manners inside. That's all I ask of anyone." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are you? Same rules as before." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You walk very quietly for someone with honest business. I'll say nothing more, but I've seen you, and I'd like you to know it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Quine. Hammon does the talking at this door and I do the looking, and it's worked well enough so far." },
      },
      again = {
        { id = "h_again", text = "Something more?" },
        { id = "h_again2", text = "Go on, but keep it short." },
      },
      choices = {
        { text = "What are you looking for?", next = "looking" },
        { text = "Old Town seems quiet enough.", next = "oldtown" },
        { text = "As you were, guard.", next = "END" },
      },
    },
    looking = {
      lines = { { id = "l_default", text = "Hands, mostly, and anybody who studies the windows longer than the door. There are generals in this hall, and there are people in this kingdom who'd pay well to know when they come and go." } },
      choices = {
        { text = "You mean the Defias.", next = "defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias = {
      lines = { { id = "d_default", text = "Them, and others who are better dressed. I've stood this door long enough to learn that the dangerous ones don't wear a red mask into town.", fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    oldtown = {
      lines = { { id = "o_default", text = "It's quiet because the barracks is at one end and we're at the other, and trouble doesn't like walking between soldiers. Go two streets off the square after dark and it's a different quarter altogether." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Old Town born, and a footman since I was old enough to lift the shield. I know these streets better than the rats do." } },
    defias = { { id = "tp_defias", text = "They've friends inside the walls. I couldn't prove it to a magistrate, but I'd bet a month's pay on it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Hammon might, since he likes to talk." } },
  },
}
