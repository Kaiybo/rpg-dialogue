-- Kadrak, holding the Mor'shan Rampart on the Ashenvale border. Voice: bibles/kadrak.md
-- A Warsong warrior with Grom's clan behind him and the night elves' forest in front of him.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Kadrak's suspicion (authored, not canon): the night elves pay the Kolkar to harry his runners.
P:Claim {
  id = "kadrak_elves_pay_kolkar", by = "kadrak", truth = "false",
  text = "The night elves pay the Kolkar centaur to raid the Horde's runners on the Barrens roads.",
  truthNote = "Nothing supports it: the Kolkar raid everyone on the roads, kaldorei outrunners included, and the Sentinels have no dealings with them. Kadrak believes it because he keeps losing runners, not because he has proof.",
  tell = "true",
  exposedBy = { "kuraybin.kk_default" },
}

P:NPC {
  key = "kadrak", id = TODO_NPC("Kadrak"), name = "Kadrak",
  bible = "bibles/kadrak.md", role = "soldier", tier = "quest",
  temper = { "fierce" }, values = { "proud", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "He speaks of Grom Hellscream as if the chieftain still lived.",
    third = "{name} met Kadrak at the Mor'shan Rampart, the Warsong orc who directs the Horde's scouts on the Ashenvale border.",
  },

  greetings = {
    { id = "g_rampart", text = "What is it, {class}? Speak quickly, because the forest is listening." },
    { id = "g_reports", when = { questActive = TODO_QUEST("The Warsong Reports") }, text = "My scouts are at Zoram'gar, at Splintertree, and on the road toward Azshara. Bring me all three reports, and don't lose any of them." },
    { id = "g_presence", when = { questActive = TODO_QUEST("Horde Presence") }, text = "Rynthariel keeps the Talon Den on Stonetalon Peak. Kill her, and plant our flag where every elf there will see it." },
    { id = "g_flag", when = { questDone = TODO_QUEST("Horde Presence") }, text = "The flag still flies in the Talon Den, my scouts say, and every elf up there has to look at it each morning." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}? The rampart held without you, but barely, so don't make a habit of it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since you ran my reports. The Warsong could use more like you in Ashenvale." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word from the south says folk speak well of you. Up here, we'll see for ourselves." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc with fire in the eyes. Grom would have liked you, I think." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior at the rampart, good, because Ashenvale eats the soft ones." },
  },

  start = "hello",
  nodes = {
    dd_honor = {
      lines = {
        { id = "dd_hn_default", text = "Then you've seen what we're up against. The night elves fight like the forest itself is angry at us, and maybe it is, because Grom killed their demigod and they've never forgiven any of us for it. Do you think the Warsong should keep cutting, or leave the forest be?" },
      },
      choices = {
        { text = "Keep cutting. The Horde needs that timber to survive.", next = "BACK", reply = "Spoken like a Warsong, and that's the answer I give the Warchief every season. Lok'tar, and keep your axe sharp.", fx = { align = { order = 1 } } },
        { text = "We could take less and bleed less for it.", next = "BACK", reply = "Maybe, but the elves would call any axe at all an insult. You'll learn that on the next charge, I think, so watch your flanks.", fx = { align = { order = -1 } } },
        { text = "Something else, Kadrak.", next = "BACK" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "Less than I make of the elves, these days, but the Warsong never forget a jailer. Grom Hellscream sat in a human camp with the lethargy in him, and it took Thrall himself to wake him, so don't ask a Warsong to love them." },
        { id = "hum_v_orc", when = { race = "Orc" },
          text = "You know the story, so I'll keep it short. Grom sat in a human camp with the lethargy in him until Thrall woke him, and no Warsong forgets the walls that held him." },
      },
      choices = {
        { text = "Do the Warsong still want war with them?", next = "hu_stance" },
        { text = "The humans and elves are allies now.", next = "BACK", reply = "Allies of a sort, and the humans send soldiers into Ashenvale now and then. I'd rather fight one enemy at a time, but nobody asked me.", fx = { opinion = { humans = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Some do, loudly, in their cups. But the Warchief freed Grom from that camp, and Grom died for the Warchief's Horde, so I keep the Warchief's peace with the humans and save my axe for the forest." },
      },
      choices = {
        { text = "Grom would have kept the peace too. For Thrall.", next = "BACK", reply = "Maybe he would, though he'd have complained about it every day. Keep it, then, and complain all you like.", fx = { align = { order = 1 }, opinion = { humans = "distrust" } } },
        { text = "Grom would want his jailers to pay. I'll see to it.", next = "BACK", reply = "Hah! That sounds more like the Grom I knew, I'll admit. But the jailers are mostly dead, {class}, and the ones left behind Theramore's walls are the Warchief's business.", fx = { align = { order = -1 }, opinion = { humans = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_honor", when = { honorKills = { min = 50 } },
          text = "My scouts say you've been through the gulch, and that the Silverwing Sentinels have counted you among their losses more than once. Grom would have been glad of you, so keep the elves bleeding for every tree they try to hold." },
        { id = "h_default", key = true, text = "Kadrak, of the Warsong. I hold the Mor'shan Rampart and send our scouts north into Ashenvale, and every one I send, the night elves try to make sure doesn't come back." },
        { id = "h_op_grom", when = { opinion = { topic = "grom", stance = "blame" } },
          text = "You're the one who blames Grom. I let it pass once, and I'm still letting it pass, but my grunts heard it too, so watch your back on the rampart." },
        { id = "h_op_ashen", when = { opinion = { topic = "ashenvale", stance = "wrong" } },
          text = "I'm told you think the Horde has no business in Ashenvale. Then you can tell my dead scouts so yourself, because I'm tired of carrying their names." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Kadrak") },
          text = "Thork sent you up from the Crossroads? Good, because I've more work than runners. Catch your breath, and then listen." },
        { id = "h_reports_before", when = { questBefore = TODO_QUEST("The Warsong Reports") },
          text = "I've deployed scouts into Ashenvale, and I need a runner to take them their orders and bring back what they've seen. Zoram'gar Outpost on the coast to the west, Splintertree Post to the north, and a scout on the road east toward Azshara." },
        { id = "h_reports_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Warsong Reports"), days = 3 } },
          text = "You're one who can be counted on. These reports are what we need to push deeper into Ashenvale, and now we can plan our next move." },
        { id = "h_scroll", when = { questActive = TODO_QUEST("The Runed Scroll") },
          text = "Where did you find this? It's written in elf runes and tied with a silver ribbon, and an outrunner was carrying it through my lands, so let me read it." },
        { id = "h_presence_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Horde Presence"), days = 3 } },
          text = "You're a tough one! Rynthariel the Keymaster is dead and the Talon Den will be slow to regroup, so there'll be fewer Alliance runners crossing the Barrens for a while." },
      },
      again = {
        { id = "h_again", text = "What else? The forest won't watch itself." },
        { id = "h_again2", text = "Ask, and make it quick." },
      },
      choices = {
        { text = "What do you make of humans, Kadrak?", next = "hu_view" },
        { text = "I've been fighting the Silverwing in the gulch, Kadrak.", next = "dd_honor", when = { honorKills = { min = 50 } } },
        { text = "Why is the Horde pushing into Ashenvale?", next = "ashenvale" },
        { text = "Tell me about the Warsong.", next = "warsong" },
        { text = "The night elves must be hard enemies in those woods.", next = "elves" },
        { text = "I'm Warsong blood too.", next = "kin", when = { race = "Orc" } },
        { text = "Where did that runed scroll come from?", next = "scroll", when = { questDone = TODO_QUEST("The Runed Scroll") } },
        { text = "Give me orders.", next = "BUSINESS" },
        { text = "Blood and thunder.", next = "END" },
      },
    },
    ashenvale = {
      lines = { { id = "a_default", text = "Because the Horde needs timber to build, and Ashenvale has more trees than the Barrens has dust. The night elves call every trunk sacred, and they'd rather we froze in Durotar than cut a single branch." } },
      choices = {
        { text = "Maybe they have reason to guard their forest.", next = "reason" },
        { text = "Then we take what we need.", next = "take" },
      },
    },
    reason = {
      lines = { { id = "r_default", text = "Maybe they do, and I've heard their side, believe me. But Grom and the Warsong spilled their blood in that forest to kill the demon who cursed us, so don't tell me orcs have no claim on Ashenvale." } },
      choices = {
        { text = "What demon?", next = "mannoroth" },
        { text = "Something else, Kadrak.", next = "BACK" },
      },
    },
    take = {
      lines = { { id = "t_default", text = "That's the Warsong way, {class}, and it's kept us alive. But every log costs a life up there, and I count those lives, so we take what we need and not one tree more." } },
      choices = {
        { text = "What did Grom do there?", next = "mannoroth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mannoroth = {
      big = true,
      lines = { { id = "m_default", text = "Mannoroth, the pit lord whose blood bound us to the Legion. Grom drank that blood first, and Grom killed him in the canyon there, and died doing it, and the curse broke with his last breath." } },
      choices = {
        { text = "Then the Horde has earned its place in Ashenvale.", next = "BACK", reply = "Earned it in blood, aye, and Grom paid the largest share. The night elves can hate us for the trees, but they'll not tell me we came here as beggars.", fx = { affinity = 1, align = { order = -1 }, learn = { "warsong" }, opinion = { ashenvale = "necessary" } } },
        { text = "Grom freed us. That doesn't make the forest ours.", next = "BACK", reply = "You sound like a Warsong scout who's been up on the wall too long. Maybe you're right, but the Horde needs that timber, and the kaldorei have never once asked us nicely.", fx = { align = { order = 1 }, learn = { "warsong" }, opinion = { ashenvale = "wrong" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    warsong = {
      lines = { { id = "w_default", text = "Grom Hellscream's clan, the first to drink the blood and the first to be free of it. We hold the front lines because nobody else would hold them as well, and because Grom would have wanted his clan nowhere else." } },
      choices = {
        { text = "Who leads the Warsong now?", next = "leads" },
        { text = "Some say Grom doomed the orcs before he saved them.", next = "grom_op" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    grom_op = {
      lines = { { id = "go_default", text = "Some say it, and they're not wrong about who drank first. But he paid for all of us with his own life when he killed Mannoroth, so you tell me, {class}: what do you make of Grom Hellscream?" } },
      choices = {
        { text = "He died breaking the curse. He's our greatest hero.", next = "go_hero", fx = { affinity = 2, align = { honor = 1 }, opinion = { grom = "hero", warsong = "admire" } } },
        { text = "He doomed us first. Dying doesn't wash that away.", next = "go_blame", fx = { affinity = -2, align = { honor = -1 }, opinion = { grom = "blame" } } },
        { text = "Both. He drank first, and he paid it back.", next = "go_both", fx = { affinity = 1, opinion = { grom = "mixed" } } },
        { text = "My father drank too. Grom's death set him free.", next = "go_orc", when = { race = "Orc" }, fx = { affinity = 2, opinion = { grom = "debt" } } },
        { text = "Something else, Kadrak.", next = "BACK" },
      },
    },
    go_hero = {
      lines = { { id = "goh_default", text = "Then you'd fit at the rampart, {class}. We sing his name every night at the fire, and you're welcome to sing it with us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go_blame = {
      lines = { { id = "gob_default", text = "Say that at Splintertree and you'll be walking home without your teeth. I'll let it pass once, because you've the right to your own mind, but only once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go_both = {
      lines = { { id = "gobo_default", text = "Fair, and Grom would've said the same, in fewer words and louder. The Warsong don't hide what he did, because the end means nothing without the beginning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go_orc = {
      lines = { { id = "goo_default", text = "Then you know it better than most. Every orc walking free owes him that, and the Warsong collect it in timber and blood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leads = {
      lines = { { id = "ld_default", text = "The Warchief leads all of us, and the Warsong answer to him first. Out here the captains at Splintertree and the rampart keep the clan's fire lit, and we argue less than the Alliance would like." } },
      choices = { { text = "Sounds like you keep that fire well. Something else.", next = "BACK", fx = { affinity = 1, learn = { "warsong" } } } },
    },
    elves = {
      lines = {
        { id = "e_default", text = "They're quiet, quick and patient, and their Sentinels can sit in a tree for a day waiting for one runner. Their dryads and wisps fight beside them like the forest itself hates us, which it might." },
        { id = "e_troll", when = { race = "Troll" },
          text = "Your people knew the elves long before mine did, Darkspear, so you'll know they never let a grudge die. Their Sentinels can sit in a tree for a day waiting for one runner, and the forest fights beside them." },
        { id = "e_tauren", when = { race = "Tauren" },
          text = "Your elders call them old friends, I know, and still the Sentinels put arrows in tauren runners the same as mine. They're quiet and patient, and they forgive nothing." },
        { id = "e_undead", when = { race = "Scourge" },
          text = "You dead have it easy, because an arrow in the chest only annoys you. The rest of us learn the hard way that a Sentinel can sit in a tree for a day and never miss twice." },
      },
      choices = {
        { text = "Why do they hate us so much?", next = "elves_hate" },
        { text = "They sound like worthy enemies.", next = "BACK", reply = "Worthy, aye, and I'll say it in front of any grunt on the rampart. A worthy enemy is still an enemy, though, so don't let respect slow your axe.", fx = { learn = { "sentinels" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    elves_hate = {
      lines = {
        { id = "eh_default", text = "Because Grom killed Cenarius, their forest god, in the hills of Ashenvale, and they've hated every orc born since for it. Never mind that he had Mannoroth's blood in him that day, or that he died killing the demon who put it there; to the kaldorei, an orc is an orc." },
        { id = "eh_orc", when = { race = "Orc" },
          text = "Because Grom killed Cenarius, their forest god, and to them you carry his axe whether you were born yet or not. They don't care that he died killing the demon who cursed us, so don't expect them to care about you." },
      },
      choices = {
        { text = "Then let them hate. We'll give them reasons.", next = "BACK", reply = "Hah! That's Warsong talk, and the rampart likes it. Give them reasons, then, but come back alive to tell me about it.", fx = { align = { light = -1 }, opinion = { night_elves = "hate" } } },
        { text = "Their grief is fair. Grom did kill their god.", next = "BACK", reply = "Fair, maybe, and I've said as much myself on a bad night. But grief doesn't give them the right to shoot my scouts in the back, and they've done plenty of that.", fx = { align = { light = 1 }, opinion = { night_elves = "mixed" } } },
        { text = "What do they want from the Horde?", next = "elves_want" },
      },
    },
    elves_want = {
      lines = {
        { id = "ew_default", text = "Our absence, and nothing else. The Warchief sent envoys to trade for timber, and the elves sent them back with arrows in their packs, so if we'd waited for their leave, the Horde would still be living in tents on the red rock." },
      },
      choices = {
        { text = "Thrall wants peace someday. Don't make that impossible.", next = "BACK", reply = "The Warchief wants a lot of things, and I'd give him most of them. I'll keep his peace the day the Sentinels stop shooting my runners, and not a day before.", fx = { align = { order = 1 } } },
        { text = "Nobody tells the Horde to live in tents.", next = "BACK", reply = "Nobody, and certainly not a people who sleep in trees. Orgrimmar has walls now, and every beam in them came out of that forest.", fx = { align = { order = -1 } } },
        { text = "Are they behind the centaur raids too?", next = "elves_kolkar" },
      },
    },
    elves_kolkar = {
      lines = {
        { id = "ek_default", fx = { hear = "kadrak_elves_pay_kolkar" },
          text = "I'd swear to it, though I can't prove it yet. The Kolkar ride down out of the north just when my runners carry reports, and they always seem to know which road, so somebody is telling them, and the elves have the most to gain." },
      },
      choices = {
        { text = "The centaur raid everyone, Kadrak. Even the Alliance.", next = "BACK", reply = "Maybe they do, and maybe I've lost too many runners to think straight about it. Bring me proof either way, and I'll listen." },
        { text = "I'll keep my eyes open on the road.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Every orc is Warsong blood a little, these days, because Grom freed every one of us. Fight like he did, without fear, and you'll honor him better than any song." } },
      choices = {
        { text = "I'll fight without fear.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scroll = {
      lines = { { id = "sc_default", text = "From that scheming dryad Rynthariel, the Keymaster of the Talon Den on Stonetalon Peak. She's been sending outrunners through my territory, and she'll keep sending them until someone teaches her otherwise." } },
      choices = { { text = "Then someone will teach her.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Warsong, born and bred. I came to Kalimdor with Grom and I've been fighting for this land ever since." } },
    advice = { { id = "tp_ad", text = "In Ashenvale, look up. The elves are never where you expect them, and usually they're above you." } },
    warsong = { { id = "tp_ws", text = "My clan. We're the Horde's spearhead in Ashenvale, and we're proud of it.", next = "warsong" } },
    sentinels = { { id = "tp_sent", text = "The Sentinels are the night elves' warriors, mostly women, armed with glaives and owls and endless patience. Don't underestimate them." } },
    thrall = { { id = "tp_thrall", text = "Thrall is the son of Durotan, and he carries the Doomhammer and Grom's trust both. When he speaks, the Warsong listen, and that isn't something I'd say of any other chieftain." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande is the night elves' priestess queen, and she sits high in her tree while her Sentinels kill my scouts. I'd sooner meet her across a battlefield than across a table." } },
    second_war = { { id = "tp_second_war", text = "I was too young to ride against Lordaeron, and I'm glad, because the old Horde fought for demons and didn't know it. Ashenvale is my war, and at least I know who I'm fighting for." } },
    burning_legion = { { id = "tp_burning_legion", fx = { learn = { "dark_portal" } }, text = "The Legion poured their blood into us and made us into what we were, and Grom killed Mannoroth and broke their hold, and I will not hear anyone call that a small thing." } },
    blackfathom = { { id = "tp_blackfathom", text = "There are ruins sunk in the lake on Ashenvale's coast, and the scouts say cultists have moved in beside the naga. The Warsong want nothing to do with them, and the elves seem to want nothing to do with them either." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar ride out of the north Barrens and harry our supply lines, and sometimes I think the night elves are paying them. I've no proof, but I've a long memory." } },
    _none = { { id = "tp_none", text = "Don't know, and I've no time to find out. Ask at the Crossroads." } },
  },
}
