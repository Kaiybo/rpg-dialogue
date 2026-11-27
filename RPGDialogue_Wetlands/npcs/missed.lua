-- Menethil Harbor, the folk a roster scan found missing (part 1): the docks, the Grassman house, the
-- Rumdnul family at the general store, and the harbor's smaller traders. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Derina Rumdnul: Gruham's wife, Gimlok's mother; helps at the general store.
P:NPC {
  key = "wl_derina_rumdnul", id = TODO_NPC("Derina Rumdnul"), name = "Derina Rumdnul", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "warm", "harried" }, values = { "family", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "Derina Rumdnul keeps the books at her husband Gruham's supply shop and keeps an ear cocked for her son Gimlok, who is never where she left him. She worries loudly and laughs just as loudly.",
    third = "{name} met Derina Rumdnul, wife of Menethil's general supplier and mother of a wandering boy.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's yerself again, an' thank the stone ye're here! Ye've a sharp eye, so tell me ye've spotted Gimlok." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I've nae time for ye today, for I've a boy tae find an' a ledger tae balance." },
    { id = "g_default", text = "Welcome, {g:lad|lass}! Ye havenae seen a wee dwarf boy about so high, have ye, likely wet tae the knees?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yerself again. Where has that boy gotten to now, I ask ye?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "It's good tae see another dwarf in this soggy town. Ye'll understand me when I say a child should grow up wi' stone under his feet, an' nae a dock." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, are ye? Then tell my Gimlok the crocolisks are nae pets, for he'll nae hear it from his mother." },
  },
  start = "hello",
  nodes = {
    w8_led = {
      lines = { { id = "w8_led_a", text = "Wi' a sharp pencil an' a sharper tongue, {g:lad|lass}, for half the harbor buys on account an' the other half forgets they did. Gruham would give rope away tae anybody wi' a sad story, so I keep the book, an' I keep it shut." } },
      choices = {
        { text = "Who owes you the most?", next = "w8_led2" },
        { text = "Gruham sounds soft-hearted.", next = "w8_led2" },
        { text = "Something else, Derina.", next = "BACK" },
      },
    },
    w8_led2 = {
      lines = { { id = "w8_led2_a", text = "The League's diggers, by a long road, for Whelgar's crew buy lamp oil by the cask an' pay by the season, if the raptors let them. Gruham is soft-hearted, aye, an' I married him for it, but I'll no' let it sink the shop." } },
      choices = {
        { text = "The shop's in good hands.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "I'm Derina Rumdnul, an' that's my husband Gruham behind the counter, sellin' ye things ye didnae know ye needed. I mind the ledger an' I mind our son, an' the ledger's a good deal less trouble." } },
      again = {
        { id = "h_again", text = "What else, dearie? I've one eye on the door, mind." },
        { id = "h_again2", text = "Go on, dearie, I'm listenin', though if Gimlok knocks that shelf over again ye'll hear me shout." },
      },
      choices = {
        { text = "What does your son get up to?", next = "gimlok" },
        { text = "How did dwarves come to keep shop here?", next = "shop" },
        { text = "You sound like you miss the mountains.", next = "home" },
        { text = "Where did you live before Menethil?", next = "ybefore" },
        { text = "What will Gimlok be when he's grown?", next = "yfuture" },
        { text = "Do you get trouble from the Dragonmaw here?", next = "ydmaw" },
        { text = "How do you keep the ledger balanced in a port like this?", next = "w8_led" },
        { text = "Good day, Derina.", next = "END" },
      },
    },
    gimlok = {
      lines = { { id = "g_default2", text = "Everythin' he shouldnae! He's down at the docks pokin' at crabs, or under the pier, or followin' the Halloran children up somethin' tall. He's half their size an' twice as stubborn, like his father." } },
      choices = {
        { text = "What worries you most?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "The water, {g:lad|lass}. Dwarves sink like anvils, an' there are murlocs on the sandbars past the pier that would carry off a calf, never mind a boy. I've told him so till my beard... well, till Gruham's beard went grey." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "s_default", text = "Gruham said there was coin in a port where every ship needs rope an' every traveller forgets his waterskin, an' he was right, bless him. We came down from Loch Modan when Gimlok was a babe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Aye, I do. I miss dry stockings an' a proper hearth cut from the rock, but trade's good an' the neighbours are kind, so I'll nae complain more than twice a day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    ybefore = {
      lines = {
        { id = "yderina_ybefore_d", text = "Dun Modr, before the Dark Irons came. We left with what we could carry an' a cart that lost a wheel on the road. Gruham fixed it wi' his belt, an' he's been holdin' his trousers up wi' rope ever since." },
        { id = "yderina_ybefore_v0", when = { race = "Dwarf" }, text = "Dun Modr, before the Dark Irons. Ye'll have kin who lost homes the same way, I'd wager. Gruham fixed our cart wi' his belt, an' he's held his trousers up wi' rope ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfuture = {
      lines = {
        { id = "yderina_yfuture_d", text = "Gruham wants him tae have the shop. I want him tae have anythin' that keeps him on dry land. Gimlok wants tae be a sailor, which is the one thing a dwarf boy should never be. We'll see who wins." },
      },
      choices = {
        { text = "Should you let him choose?", next = "ychoose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychoose = {
      lines = {
        { id = "yderina_ychoose_d", text = "That's the question, isn't it? My own mam chose for me, an' I never forgave her for it. But I've seen what the sea does, an' a dwarf in deep water is a dwarf at the bottom of it." },
      },
      choices = {
        { text = "Keep him safe. A mother knows best.", next = "BACK", reply = "Aye, that's my heart talkin' too, though I'll need tae be cleverer than him.", fx = { align = { order = 1 } } },
        { text = "Let him choose. It's his life to live.", next = "BACK", reply = "Ye sound like Gruham. Maybe ye're both right, an' I'm only frightened.", fx = { align = { order = -1 } } },
      },
    },
    ydmaw = {
      lines = {
        { id = "yderina_ydmaw_d", text = "No' in the town, thank the Light, but the roads are another matter. Our supply wagons come down from Dun Algaz, an' twice this year they've been late because o' raids. Gruham worries, an' then I worry for both of us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gruham = { { id = "yderina_tp_gruham", text = "Gruham's a good husband an' a better shopkeeper. He'll sell ye a rope ye didnae know ye needed." } },
    gimlok = { { id = "yderina_tp_gimlok", text = "Gimlok's somewhere he shouldnae be. If ye see him, send him home, an' tell him his mam means it." } },

    background = { { id = "tp_bg", text = "I'm a shopkeeper's wife an' a mother, an' both are full days' work in this town." } },
    _none = { { id = "tp_none", text = "I wouldnae know, dearie. Ask Gruham, he hears everythin' over that counter." } },
  },
}

-- Gimlok Rumdnul: dwarf child of Gruham and Derina.
P:NPC {
  key = "wl_gimlok_rumdnul", id = TODO_NPC("Gimlok Rumdnul"), name = "Gimlok Rumdnul", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "menethil" }, temper = { "cheerful", "stubborn" }, values = { "curious" },
  notices = { "race" },
  impression = {
    first = "Gimlok Rumdnul is a dwarf boy, the shopkeeper's son, and he is smaller than every other child in Menethil and plainly doesn't care. He had a crab in his pocket when I met him.",
    third = "{name} met Gimlok Rumdnul, the shopkeeper's son in Menethil Harbor.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you again! Ye kept my secret, so ye can see the crab I caught, if ye promise no' tae tell mam." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Ye're no' going tae tell on me, are ye? I'll never forgive ye if ye do." },
    { id = "g_default", text = "Hullo! Are ye off one o' the big ships? I'm goin' tae sail on one when I'm bigger." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Dinnae tell my mam ye saw me by the water." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye've a proper beard! My da says mine will come in when I stop askin' about it." },
  },
  start = "hello",
  nodes = {
    w8_murl = {
      lines = { { id = "w8_murl_a", text = "Once! It came up the beach at low tide an' went mrglglgl at me, an' I went mrglglgl back, an' then a guard shot at it an' it ran away. I think it wanted tae be friends, but Mam says murlocs only want tae eat ye." } },
      choices = {
        { text = "Your mam is right this time.", next = "w8_murl2" },
        { text = "Maybe it did want to be friends.", next = "w8_murl2" },
        { text = "Something else, Gimlok.", next = "BACK" },
      },
    },
    w8_murl2 = {
      lines = { { id = "w8_murl2_a", text = "That's what everybody says! But it didnae eat me, so I think it was a nice one, or it wasnae hungry. I've been practisin' mrglglgl ever since in case I see it again, an' Regina says it's disgustin'." } },
      choices = {
        { text = "Stay away from the beach at low tide.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "I'm Gimlok, an' my da has the shop an' my mam has the shoutin'. I'm nae supposed tae be down here, but the crabs are down here, so what can I do?" } },
      again = {
        { id = "h_again", text = "What else? I've crabs tae catch." },
        { id = "h_again2", text = "Aye, go on, but quick, before Magni the crab runs off!" },
      },
      choices = {
        { text = "What do you do with the crabs?", next = "crabs" },
        { text = "Who do you play with?", next = "play" },
        { text = "Your mother is looking for you.", next = "mam" },
        { text = "What's your bravest adventure?", next = "ybrave" },
        { text = "Are you scared of anything?", next = "yscared" },
        { text = "What do you want to be when you're grown?", next = "ygrown" },
        { text = "Have you ever seen a murloc up close?", next = "w8_murl" },
        { text = "Stay out of the water, Gimlok.", next = "END" },
      },
    },
    crabs = {
      lines = { { id = "c_default", text = "I race them along the pier, an' the fastest one gets a name. This one's called Magni, because he's the king o' the crabs an' he pinches hardest." } },
      choices = {
        { text = "Does the king know about that?", next = "king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I dinnae think so, an' ye mustnae tell him! Da says the king has a hammer as big as me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    play = {
      lines = { { id = "p_default", text = "Jesse an' Regina, the tanner's two. Jesse climbs the tower an' I cannae reach the first rung yet, but I'm a better hider than the both of them, because I fit in a barrel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mam = {
      lines = { { id = "m_default", text = "She's always lookin' for me, that's just how she is. I'll go home when I hear her the third time, because the third time is when she means it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    ybrave = {
      lines = {
        { id = "ygimlok_ybrave_d", text = "I went under the pier at low tide an' found a murloc's egg! Well, it might've been a rock. But it was green an' it was round, an' I hid it under my bed till Mam found it an' screamed." },
      },
      choices = {
        { text = "What did she do with it?", next = "yegg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yegg = {
      lines = {
        { id = "ygimlok_yegg_d", text = "She threw it in the harbour. I cried a bit, but only a bit. Jesse says I should've kept it secret. Regina says Mam was right, because it might've hatched an' eaten me." },
      },
      choices = {
        { text = "Your mam was right. Murlocs don't make good pets.", next = "BACK", reply = "Aye, that's what Da said too. I'll find a crab instead, they're safer.", fx = { align = { order = 1 } } },
        { text = "Next time, keep it secret. Explorers need treasures.", next = "BACK", reply = "I will! I'll make a hidin' place even Mam cannae find.", fx = { align = { order = -1 } } },
      },
    },
    yscared = {
      lines = {
        { id = "ygimlok_yscared_d", text = "The deep water past the pier, because Mam says dwarves sink. An' the ghost ships up the coast, because Jesse says they're full o' drowned sailors who come ashore at night lookin' for boys." },
        { id = "ygimlok_yscared_v0", when = { race = "Dwarf" }, text = "The deep water, because we sink. Ye're a dwarf, so ye know. An' the ghost ships Jesse tells about, full o' drowned sailors lookin' for boys." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygrown = {
      lines = {
        { id = "ygimlok_ygrown_d", text = "A sailor, on the Maiden's Virtue, all the way to Theramore. Mam says no. Da says maybe. I say I'll learn tae swim first, an' then they cannae stop me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    magni = { { id = "ygimlok_tp_magni", text = "Magni's my crab. He's the king o' the crabs, an' he pinches harder than any of 'em." } },
    jesse = { { id = "ygimlok_tp_jesse", text = "Jesse climbs the tower. I'll climb it too, when I'm taller." } },

    background = { { id = "tp_bg", text = "I'm Gimlok Rumdnul, an' my da's shop is the one wi' all the rope." } },
    _none = { { id = "tp_none", text = "I dinnae know that one. Ask my da, he knows everythin' that costs money." } },
  },
}
