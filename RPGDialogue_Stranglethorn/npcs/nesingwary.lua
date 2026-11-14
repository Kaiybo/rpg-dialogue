-- Nesingwary's Expedition: Hemet Nesingwary's hunting camp in northern Stranglethorn. Voice: bibles/stranglethorn.md
-- Classic has the father, Hemet Nesingwary (his son took over the camp only when he left for Outland).
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nesingwary", id = TODO_NPC("Hemet Nesingwary"), name = "Hemet Nesingwary",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "major",
  communities = { "nesingwary_camp" }, temper = { "gruff" }, values = { "brave", "proud" },
  notices = { "class", "pet", "kit" },

  greetings = {
    { id = "g_camp", text = "Quiet, now. Ye'll scare the game. Sit, if ye must. Then be useful." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back with all yer limbs. Good. The jungle doesnae give many second chances." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? Doesnae matter. A good shot's a good shot, whatever colors it's wearin'." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Proper, by the look o' yer kit. Ye'll understand what this place is, then. The finest huntin' ground in the world." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Fine animal, {pet}. Keep it close here. Every beast in this jungle would love tae make a meal o' yer friend." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Somethin' had a go at ye. Raptors, by the look. They hunt in packs. Learn that, or learn nothin' else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hemet Nesingwary. I came tae Stranglethorn for the huntin', an' I'm stayin' for the huntin'. Raptors, panthers, tigers, an' the great cat himself. There's nothin' else worth the trip." },
        { id = "h_welcome", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Welcome to the Jungle") }, { questActive = TODO_QUEST("Hunting in Stranglethorn") }, { questActive = TODO_QUEST("Hemet Nesingwary") } } },
          text = "Somebody sent ye tae me. Good. I've more beasts than hunters, an' I like it that way, but even I cannae shoot them all." },
        { id = "h_raptors", when = { questActive = TODO_QUEST("Raptor Mastery") },
          text = "Raptors. Fast an' clever, an' they never come alone. Thin them, an' ye'll start tae think like one. That's the point." },
        { id = "h_bangalash", when = { questActive = TODO_QUEST("Big Game Hunter") },
          text = "King Bangalash. The great cat o' the jungle. I've seen him once, at dusk, an' I've thought of nothin' else since. Bring me his head." },
        { id = "h_dusk", when = { timeOfDay = "night" },
          text = "Listen. Hear that? Somethin' big, west o' camp, movin' slow. Tomorrow. Tonight we drink." },
        { id = "h_cat", when = { form = "cat" },
          text = "Dinnae move. Dinnae... ach, it's a druid. Ye nearly had a bullet for yer trouble. Turn back intae yerself before Ajeck sees ye." },
        { id = "h_king_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Big Game Hunter"), days = 3 } },
          text = "The King's head, on my wall. I've wanted that for years, an' now I've got it I keep lookin' west anyway. There's always somethin' bigger." },
      },
      again = {
        { id = "h_again", text = "Aye? Out wi' it. The light's goin'." },
        { id = "h_again2", text = "Somethin' else? Quick, then. I'm cleanin' the rifle." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Pour yerself one an' ask. Barnil willnae mind. Barnil always minds." },
      },
      choices = {
        { text = "Why hunt at all?", next = "why" },
        { text = "What's the most dangerous thing out there?", next = "danger" },
        { text = "Barnil says you were a war hero.", next = "hero" },
        { text = "Tell me about your students.", next = "students" },
        { text = "What's the finest shot you ever took?", next = "shot", when = { class = "HUNTER" } },
        { text = "That's a fine rifle. Ironforge make?", next = "rifle", when = { race = { "Dwarf", "Gnome" } } },
        { text = "I'll hunt for you.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Good hunting.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because a man finds out what he is when somethin' bigger than him is lookin' back. Most never find out. In the jungle, everybody does. Usually quick." },
      },
      choices = {
        { text = "And what are you?", next = "what" },
        { text = "Seems a lot of killing just to find that out.", next = "why_killing", fx = { align = { light = 1 } } },
        { text = "I'll find out, then.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    what = {
      lines = {
        { id = "wt_default", text = "Still here. That's the answer, every mornin'. It's a good answer. Write it down. Barnil does." },
      },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    why_killing = {
      lines = {
        { id = "wk_default", text = "Aye, it is. But I eat what I shoot, an' I never take a beast that didnae have a fair chance at me. The trolls an' the Venture boys cannae say that." },
      },
      choices = {
        { text = "Fair chance. I can respect that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A fair chance against a rifle?", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    danger = {
      lines = {
        { id = "d_default", text = "Not the King. Not the tigers. The raptors, because there's always one more than ye counted. An' the trolls, because they count too." },
      },
      choices = {
        { text = "And the King? Bangalash?", next = "danger_king" },
        { text = "What about the Venture Company?", next = "danger_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_king = {
      lines = {
        { id = "dk_default", text = "Old, white an' patient, an' he lets ye see him exactly once. I've a place on the wall for him. I've had it for years." },
        { id = "dk_done", when = { questDone = TODO_QUEST("Big Game Hunter") },
          text = "On my wall, thanks tae you. I look at him every mornin'. He looks back. I'm no' sure which of us won." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger_venture = {
      lines = {
        { id = "dv_default", text = "Cuttin' the jungle down tae find what's under it. Every tree they fell sends the beasts somewhere else. Usually here. Usually at supper." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    hero = {
      big = true,
      lines = {
        { id = "hr_default", text = "Barnil talks when I'm out o' earshot. I fought when the Alliance asked, like plenty did, an' came home tae find I'd rather be shot at by a tiger." },
        { id = "hr_horde", when = { faction = "Horde" },
          text = "Barnil says too much. Aye, I fought yer lot, once. Ye fought mine. Out here it's the beasts that keep score, an' they dinnae care what color yer tabard is." },
      },
      choices = {
        { text = "What war?", next = "hero_war", fx = { trait = { curious = 1 } } },
        { text = "You don't like talking about it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    hero_war = {
      lines = {
        { id = "hw_default", text = "The one with the orcs in it. The first one, the second, they blur. Ask Barnil. He'll tell ye I was magnificent. I was mostly wet." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    students = {
      lines = {
        { id = "st_default", text = "Ajeck's the best shot in camp an' knows it. Erlgadin's the best-born an' wishes he wasnae. Barnil's no' a student, he's a saint. Pick one an' ask." },
      },
      choices = {
        { text = "Ajeck.", next = "students_ajeck" },
        { text = "Erlgadin.", next = "students_erlgadin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students_ajeck = {
      lines = { { id = "sa_default", text = "Her father taught her tigers. I just gave her somewhere tae practise. She'll take Sin'Dall one day. I hope I'm awake for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students_erlgadin = {
      lines = { { id = "se_default", text = "Came out here tae forget Stormwind. Talks about it every night. Good with a blade, better wi' a grudge. Leave him his letters." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },

    shot = {
      lines = {
        { id = "sh_default", text = "A raptor, mid-leap, through the gap between two of its friends. Barnil wrote it down. I've no' been able tae do it since, an' I've tried every week." },
      },
      choices = {
        { text = "Mine was luckier than that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Teach me how you set it up.", next = "shot_teach", fx = { trait = { curious = 1 } } },
      },
    },
    shot_teach = {
      lines = { { id = "sht_default", text = "Ye dinnae aim where it is. Ye aim where it's decided tae be. Raptors decide early. That's yer gift. Use it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },

    rifle = {
      lines = {
        { id = "rf_default", text = "Ironforge barrel, Stormwind stock, an' a sight I bought from a gnome who swore it'd make me famous. It did. The sight's terrible." },
        { id = "rf_gnome", when = { race = "Gnome" },
          text = "Ironforge barrel, an' a sight from one o' yer people that I'll swear is made o' lies. Ye wouldnae know a tinker named after a cheese, would ye?" },
      },
      choices = {
        { text = "May I hold it?", next = "rifle_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifle_hold = {
      lines = { { id = "rh_default", text = "No. But ye may admire it from there. Closer. That's enough. Barnil'll have tae clean it again just from you lookin'." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Does it have fur, claws or teeth? No? Then I couldnae care less." } },
  },
}

P:NPC {
  key = "barnil", id = TODO_NPC("Barnil Stonepot"), name = "Barnil Stonepot",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "patient" }, values = { "loyal", "orderly" },
  notices = { "race" },

  greetings = {
    { id = "g_pages", text = "Mind where ye step, friend. If ye see a loose page anywhere, it's ours. Don't step on it. Pick it up." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in this heat! Ye'll melt. I did, the first month. Then ye stop noticin'. Mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Barnil Stonepot. I keep the master's camp, his kit, an' his book. He's a hero o' the Alliance, ye know. Ye wouldnae think it, the way he snores." },
        { id = "h_book", tags = { "news" }, when = { questActive = TODO_QUEST("The Green Hills of Stranglethorn") },
          text = "I was proofreadin' the master's book, The Green Hills of Stranglethorn, when the wind took the lot. Pages all over the jungle now. Find them. Please. He doesnae know yet." },
        { id = "h_quiet", when = { metBefore = true },
          text = "I like it here, truth be told. Cleanin' rifles, packin' for the next trip. Peaceful. I miss a good fight sometimes, but the jungle's always happy tae provide one." },
        { id = "h_book_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Green Hills of Stranglethorn"), days = 3 } },
          text = "Every page back an' bound. He's never goin' tae know. Ye'll have a drink on me for that, an' ye'll never mention it either." },
      },
      again = {
        { id = "h_again", text = "Aye? I'm listenin'. My hands are busy, my ears aren't." },
        { id = "h_again2", text = "Somethin' else, friend? Mind the oil." },
      },
      choices = {
        { text = "What's the book about?", next = "book" },
        { text = "What's he really like, your master?", next = "master" },
        { text = "Don't you miss Ironforge?", next = "home", when = { race = "Dwarf" } },
        { text = "You said you miss a good fight.", next = "fight", when = { metBefore = true } },
        { text = "What do you do all day?", next = "work" },
        { text = "I'll look for the pages.", next = "END", fx = { affinity = 2 } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    book = {
      lines = {
        { id = "b_default", text = "The huntin', mostly. The jungle, the beasts, the master bein' brave at them. It's good. Too many words about the master's rifle, but don't tell him I said so." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } },
        { text = "Who's it for? Who reads a hunting book?", next = "book_readers" },
      },
    },
    book_readers = {
      lines = {
        { id = "br_default", text = "Stormwind nobles who'll never leave Stormwind. They'll buy it, put it on a shelf, an' tell their friends they've been tae the jungle. That's what books are for." },
        { id = "br_noble", when = { origin = "human_minor_noble" },
          text = "Folk like yer family, beggin' yer pardon. They'll buy it, shelve it, an' tell their friends they've been tae the jungle." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    master = {
      lines = {
        { id = "m_default", text = "Kind, when he forgets tae be gruff. He's never once let me carry the rifle on a hunt. Says if he dies, someone has tae finish the book." },
      },
      choices = {
        { text = "That's not a bad reason.", next = "master_reason" },
        { text = "Sounds like he's protecting you.", next = "master_reason", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_reason = {
      lines = { { id = "mr_default", text = "I know. That's what makes me cross. A dwarf likes tae be protected about as much as he likes tae be short. Which is tae say, it's no' his choice." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    home = {
      lines = {
        { id = "hm_default", text = "Every mornin', for about a breath. Then a parrot screams at me an' I remember I've seen a sky Ironforge never will. Do ye miss it, yerself?" },
      },
      choices = {
        { text = "Every day. The forges, the noise.", next = "BACK", fx = { affinity = 2 } },
        { text = "No. I wanted out.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I miss the beer.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    fight = {
      lines = {
        { id = "f_default", text = "I was a soldier before I was a servant. Ye don't forget how tae stand in a line. Out here, ye stand in it alone. It's no' the same." },
      },
      choices = {
        { text = "Come with me next time.", next = "fight_offer", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "The camp needs you here.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    fight_offer = {
      lines = { { id = "fo_default", text = "Ha! An' leave the master tae cook for himself? He'd be dead by Thursday. Kind of ye, though. Kind of ye." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    work = {
      lines = {
        { id = "w_default", text = "Clean four rifles. Mend three tents. Write down what he shot an' how he says he shot it. Then the other version, the true one, in the margin." },
      },
      choices = {
        { text = "You keep two versions?", next = "work_two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_two = {
      lines = { { id = "wt_default", text = "The book gets his. The margin gets mine. Someday someone'll read both an' have a good laugh. I hope it's me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the master. He'll tell ye. At length." } },
  },
}

P:NPC {
  key = "ajeck", id = TODO_NPC("Ajeck Rouack"), name = "Ajeck Rouack",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "focused" }, values = { "proud", "brave" },
  notices = { "class" },

  greetings = {
    { id = "g_bow", text = "Careful. I'm restringing. Talk if you like; I'll listen." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Show me your bow. Hm. Not bad. Your draw's short. Fix that before you go after anything with stripes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ajeck Rouack. My father put a bow in my hands before I could read, and taught me tigers before he taught me manners. I teach tiger hunting now. One day I'll take Sin'Dall." },
        { id = "h_tigers", tags = { "news" }, when = { questActive = TODO_QUEST("Tiger Mastery") },
          text = "Young tigers first. Then the older ones. Then the ones the trolls are afraid of. That's how my father taught me, and he was never wrong about tigers." },
        { id = "h_sindall", when = { metBefore = true },
          text = "I saw Sin'Dall's tracks this morning, by the river. Fresh. He knew I'd find them. He's teasing me." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Tigers hunt at night. So I sleep in the day, when I can. Hemet thinks it's lazy. Hemet snores." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. I'm still restringing." },
      },
      choices = {
        { text = "Who is Sin'Dall?", next = "sindall" },
        { text = "Tell me about your father.", next = "father" },
        { text = "How do you track a tiger?", next = "track" },
        { text = "Want to compare bows?", next = "bows", when = { class = "HUNTER" } },
        { text = "What about the cats that walk on two legs?", next = "druid", when = { class = "DRUID" } },
        { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Good hunting.", next = "END" },
      },
    },

    sindall = {
      lines = {
        { id = "s_default", text = "The oldest tiger in Stranglethorn. Clever, patient, and bigger than any I've seen. My father hunted him for years. I mean to finish what he started." },
      },
      choices = {
        { text = "What if he's too old to be a fair fight?", next = "sindall_fair" },
        { text = "Let me come when you go.", next = "sindall_come", fx = { trait = { brave = 1 } } },
        { text = "Good hunting.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    sindall_fair = {
      lines = { { id = "sf_default", text = "Then he'll die by an arrow instead of starving in a ditch. That's the fair fight. Not mine. His." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sindall_come = {
      lines = { { id = "sc_default", text = "No. Help me with the young ones, if you want to help. Sin'Dall's mine. My father's, then mine." } },
      choices = {
        { text = "Understood.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Pride gets hunters killed.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    father = {
      lines = {
        { id = "f_default", text = "Patient. Strict. He'd make me sit still in the grass until I stopped hearing myself breathe. I hated it. Now it's the only thing I do well." },
      },
      choices = {
        { text = "Is he still alive?", next = "father_alive" },
        { text = "Sounds like a good teacher.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    father_alive = {
      lines = { { id = "fa_default", text = "Ask me after Sin'Dall." } },
      choices = { { text = "I'm sorry I asked.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },

    track = {
      lines = {
        { id = "t_default", text = "You don't. You find where the water is, sit downwind, and wait for the jungle to go quiet. The quiet is the tiger." },
      },
      choices = {
        { text = "And then?", next = "track_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_then = {
      lines = { { id = "tt_default", text = "Then you find out whether you were quiet enough. Most people learn the answer once." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    bows = {
      lines = {
        { id = "b_default", text = "Mine's yew, my father's. Yours is newer and heavier than it needs to be. You're compensating for your draw. Fix the draw." },
        { id = "b_dwarf", when = { race = "Dwarf" },
          text = "A dwarf with a bow, not a gun? Hemet will be disappointed. The tigers won't." },
      },
      choices = {
        { text = "Show me.", next = "bows_show", fx = { trait = { curious = 1 } } },
        { text = "My draw is fine.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    bows_show = {
      lines = { { id = "bs_default", text = "Shoulder down. Breathe out before you release, not after. There. That's a tiger's worth of difference." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },

    druid = {
      lines = {
        { id = "d_default", text = "I've thought about that. If I see a cat with too much sense in its eyes, I lower the bow. Wear a collar, if you must hunt near here." },
      },
      choices = {
        { text = "A collar? I'll consider it.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'd see you coming.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not tigers. Not my concern." } },
  },
}

P:NPC {
  key = "erlgadin", id = TODO_NPC("Sir S. J. Erlgadin"), name = "Sir S. J. Erlgadin",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "bitter" }, values = { "honorable", "proud" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_sir", text = "Sir Erlgadin. Just 'Sir', thank you. I've given up the rest." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Honest about it, at least. That's more than I can say for my former colleagues in the House of Nobles." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sir S. J. Erlgadin. I was a count, once, in Stormwind's House of Nobles. I've stopped answering to it. I hunt panthers now. Panthers, at least, are honest about what they want." },
        { id = "h_panthers", tags = { "news" }, when = { questActive = TODO_QUEST("Panther Mastery") },
          text = "Panthers. They hide better than tigers and strike faster. Learn to see one before it sees you, and you'll have learned something the nobles never did." },
        { id = "h_city", when = { metBefore = true },
          text = "A letter came from Stormwind. They want me back for a vote. I used it to start this morning's fire. It burned beautifully." },
        { id = "h_hemet", when = { heardLine = "nesingwary.h_default" }, text = "Hemet told you about the hunting? He tells everyone. It's the only story he knows, and he tells it better every time." },
      },
      again = {
        { id = "h_again", text = "Yes? I've time. I have nothing but time; that's rather the point of exile." },
        { id = "h_again2", text = "Something further?" },
      },
      choices = {
        { text = "Why did you leave the House of Nobles?", next = "nobles" },
        { text = "Why panthers?", next = "panthers" },
        { text = "What's in the letters they keep sending?", next = "letters", when = { metBefore = true } },
        { text = "My family sits in that House.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "The Defias drove my family off our farm.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll hunt panthers.", next = "END", fx = { affinity = 2 } },
        { text = "Good day, Sir.", next = "END" },
      },
    },

    nobles = {
      big = true,
      lines = {
        { id = "n_default", text = "The stonemasons rebuilt our city, and the nobles refused to pay them. I sat in that hall and watched it happen. I said nothing. What came of it is in Westfall now, wearing red masks. I won't sit in that hall again." },
      },
      choices = {
        { text = "You can't undo it.", next = "nobles_undo", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Leaving was honest.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "Running away fixes nothing. Go back and vote.", next = "nobles_vote", fx = { align = { order = 2 } } },
        { text = "Who else in that hall knew?", next = "nobles_who", fx = { trait = { curious = 1 } } },
      },
    },
    nobles_undo = {
      lines = { { id = "nu_default", text = "No. I can only refuse to do it again. It's a small thing. Small things are what I have left." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nobles_vote = {
      lines = {
        { id = "nv_default", text = "And be one honest vote among a hundred purses? They'd count it, smile, and carry on. I'd rather build fires." },
      },
      choices = {
        { text = "One honest vote is still a vote.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    nobles_who = {
      lines = {
        { id = "nw_default", text = "All of us. That's the part nobody likes to hear. It wasn't one villain; it was a room full of men deciding it was someone else's purse." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" }, opinion = { defias = "nobles_to_blame" } } } },
    },

    panthers = {
      lines = {
        { id = "p_default", text = "A tiger tells you it's coming. A panther waits on a branch for you to be stupid. I spent years in a room full of panthers; I prefer the honest ones." },
      },
      choices = {
        { text = "And what does a panther teach you?", next = "panthers_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    panthers_teach = {
      lines = { { id = "pt_default", text = "To look up. Most people never do. Most nobles don't either; that's how the masons got as far as they did." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    letters = {
      lines = {
        { id = "l_default", text = "Votes. Summons. A cousin who'd like my seat if I'm not using it. They all start with my full title. That's how I know to burn them." },
      },
      choices = {
        { text = "Will you ever go back?", next = "letters_back" },
        { text = "Give the cousin the seat.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    letters_back = {
      lines = { { id = "lb_default", text = "When the masons are paid. So, no. Ask me something with a better answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    noble = {
      big = true,
      lines = {
        { id = "nb_default", text = "Then you'll have heard my name said unkindly over dinner. Do they still say I've gone native? I've gone honest. They'd not know the difference." },
      },
      choices = {
        { text = "They say worse.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I left too. In my way.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "They had their reasons for the masons.", next = "BACK", fx = { affinity = -3, opinion = { defias = "nobles_justified" } } },
      },
    },

    farmhand = {
      big = true,
      lines = {
        { id = "fh_default", text = "Then I'm one of the men who put the knife in their hands. I won't ask your pardon. I'd only ask you not to give it too easily." },
      },
      choices = {
        { text = "You're not the one who burned the fields.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "I won't.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Cheated men, turned thieves. I'd hang the thieves. I'd want the cheats hanged first." } },
    _none = { { id = "tp_none", text = "I've no opinion on it. I've given up having opinions in public. They cost too much." } },
  },
}
