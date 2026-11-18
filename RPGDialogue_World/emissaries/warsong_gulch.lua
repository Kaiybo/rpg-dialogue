-- Warsong Gulch emissaries: the Silverwing Sentinel and the Warsong Outrider who stand in the capitals and recruit for the fight over the gulch in northern Ashenvale.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Silverwing Emissary (Alliance): a night elf Sentinel of Silverwing Hold, posted in Stormwind, Ironforge and Darnassus.
P:NPC {
  key = "emissary_silverwing", id = TODO_NPC("Silverwing Emissary"), name = "Silverwing Emissary",
  role = "soldier", tier = "quest",
  temper = { "steady", "proud" }, values = { "loyal", "dutiful" },
  notices = { "pvp", "soldier", "race" },

  impression = {
    first = "To her, the orcs' lumber mill is a wound that won't close.",
    third = "{name} met the Silverwing Emissary, a Sentinel of Silverwing Hold who stands in the Alliance capitals asking for help against the Warsong clan's logging in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Elune's light on you, friend. The Silverwing Sentinels have need of strong arms in Warsong Gulch, if you've a mind to lend yours." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and I'm glad of it. Every day I stand here, the orcs fell more of Ashenvale, so I hope you've come with good news." },
    { id = "g_marks", when = { carrying = { 20558, min = 3 } }, text = "I can see the Gulch's marks at your belt, which means you've stood at Silverwing Hold and come back. Hand them over when you're ready, and the Sentinels will know your name." },
    { id = "g_mark", when = { carrying = 20558 }, text = "You carry a Mark of Honor from the Gulch. Bring me three, and I'll see the Sentinels hear of what you did there." },
    { id = "g_honored", when = { reputation = { faction = "Silverwing Sentinels", min = "honored" } }, text = "The Sentinels speak well of you at Silverwing Hold, and they don't say that lightly of anyone born outside the forest. Ishnu-alah, friend, it's good to see you." },
    { id = "g_exalted", when = { reputation = { faction = "Silverwing Sentinels", min = "exalted" } }, text = "Every Sentinel in the Hold knows your face now, and some of them have stopped counting how many Warsong banners you've carried home. Ashenvale owes you, friend." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You wear an officer's rank in the Alliance's service, I see. Those titles are paid for in blood, and if blood must be spent, let it be spent at the Gulch, where the forest gains by it." },
    { id = "n_kills", cat = "soldier", when = { honorKills = { min = 250 } },
      text = "You've the bearing of someone who has faced the Horde many times and walked away, and few of the recruits who come to me can claim the same. The Gulch could use that steadiness." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" }, place = "before",
      text = "One of our own, and a long way from the boughs of Teldrassil! Ashenvale is your forest too, sister or brother, and it is bleeding." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am an emissary of the Silverwing Sentinels, who hold the southern end of Warsong Gulch against the orcs. The Warsong clan cuts our forest down for Orgrimmar's timber, and we take back what we can, one stolen banner at a time." },
        { id = "h_sw", when = { zone = "Stormwind City" },
          text = "Stormwind is a city of stone and smoke, and I confess it took me some weeks to sleep here. Your people built all this out of quarried rock, which is more than the orcs bother to do, so perhaps you'll understand why I've come to ask for help with my forest." },
        { id = "h_if", when = { zone = "Ironforge" },
          text = "There's not a single living tree inside this mountain, and the forge-heat sits on me like a fever. Still, the dwarves fight like the mountain itself when they're roused, and that's why the Sentinels sent me down here among them." },
        { id = "h_dn", when = { zone = "Darnassus" },
          text = "It's a strange thing to stand among the boughs of Teldrassil and speak of trees dying. Ashenvale was our home long before this one, and the orcs are cutting into the heart of it while we sit safe across the sea." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Cenarion Circle, or one who walks the same path. You'll know what the forest is feeling, then, because the Warsong are cutting the same trees that Cenarius once walked among." },
        { id = "h_honored", when = { reputation = { faction = "Silverwing Sentinels", min = "honored" } },
          text = "You've fought beside the Sentinels long enough that I needn't recruit you, only thank you. Sit with me a moment, if you've the time, and tell me how the Hold fares." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I've stood here long enough to answer most things about the Gulch." },
        { id = "h_again2", text = "Ask what you like, friend. The Hold will still need soldiers when you've finished." },
        { id = "h_again3", text = "Go on. I'd rather speak of Ashenvale than stand here silent." },
      },
      choices = {
        { text = "What is Warsong Gulch?", next = "gulch" },
        { text = "Why do the orcs cut the forest?", next = "mill" },
        { text = "How does the fighting there work?", next = "flags" },
        { text = "What do the Marks of Honor mean to the Sentinels?", next = "marks" },
        { text = "You seem out of place among these walls.", next = "city" },
        { text = "Did the Warsong really kill Cenarius?", next = "x_druid", when = { class = "DRUID" } },
        { text = "Our ancestors' forest is dying. What would you have me do?", next = "k_nelf", when = { race = "NightElf" } },
        { text = "Dwarves fight for stone, lass. Why should we bleed for trees?", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "The orcs run a mill? I'd like to see the machinery.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Stormwind has its own wars. Why should we fight yours?", next = "k_human", when = { race = "Human" } },
        { text = "Does the Light have a place in the Gulch?", next = "x_pala", when = { class = "PALADIN" } },
        { text = "Which of the Sentinels' tricks should a rogue learn?", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "The beasts of Ashenvale. Do they suffer for the logging?", next = "x_hunt", when = { class = "HUNTER" } },
        { text = "I'll think on it, Sentinel.", next = "END" },
      },
    },

    -- The place
    gulch = {
      lines = {
        { id = "gl_default", text = "It's a narrow valley in the north of Ashenvale, where the forest gives way to the Barrens. The Warsong built their lumber mill at one end, and we raised Silverwing Hold at the other, and the ground between belongs to whoever is bleeding on it that day." },
      },
      choices = {
        { text = "Why do the Warsong want that valley in particular?", next = "gulch_why" },
        { text = "Silverwing Hold must be well defended.", next = "gulch_hold" },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    gulch_why = {
      lines = { { id = "glw_default", text = "It's the easiest road from the Barrens into the old forest, and the trees there are ancient and straight, the kind you can't find in Durotar's red dust. Every trunk they haul out of the Gulch goes south to build their walls and their wolf pens and their war machines." } },
      choices = {
        { text = "And Silverwing Hold guards the door to Ashenvale.", next = "gulch_hold", fx = { learn = { "ashenvale" } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    gulch_hold = {
      lines = {
        { id = "gh_default", text = "The Silverwing Sentinels hold it, and the Sentinels answer to General Shandris Feathermoon, who answers to the High Priestess herself. The Hold is wood and moonstone, built with care, and the orcs have never once set fire to it, though Elune knows they've tried to carry off our banner often enough." },
      },
      choices = {
        { text = "The High Priestess cares about one valley?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'd be proud to stand on those walls.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },

    -- The mill and the moral question
    mill = {
      lines = {
        { id = "ml_default", text = "They'll tell you it's for survival, that Durotar grows nothing but thorns and the Horde must build or perish. I've heard the argument, and I'll even grant there's truth in it, but every tree they fell in the Gulch was older than their whole race's memory." },
        { id = "ml_nelf", when = { race = "NightElf" }, text = "They say they need it to survive, and perhaps they do, for Durotar is a hard land. But you and I were born to these trees, and you know as well as I do that some of the oaks they've cut down were saplings when Zin-Azshari still stood." },
      },
      choices = {
        { text = "Couldn't they take wood from somewhere else?", next = "mill_else" },
        { text = "Surely some peace could be made with them.", next = "mill_peace" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    mill_else = {
      lines = { { id = "mle_default", text = "There's little enough timber in the Barrens, and the orcs won't buy from the goblins at goblin prices when there's a forest a day's march north. So they come to Ashenvale, because it's near and it's rich and because they think the trees don't belong to anyone." } },
      choices = {
        { text = "And you think the trees belong to someone.", next = "mill_peace" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    mill_peace = {
      big = true,
      lines = {
        { id = "mp_default", text = "When the orcs first came to Ashenvale, Grom Hellscream's warriors slew Cenarius himself, and that was before any of them had asked us for so much as a branch. Some of my sisters say the young orcs aren't to blame for that, and others say every axe in the Gulch is Hellscream's axe. Which would you say, friend?" },
      },
      choices = {
        { text = "The orcs need wood to live. Let them take what they need, no more.", next = "BACK", reply = "That is a fairer measure than most of my sisters would give them, and Elune knows I have wished for it. But the orcs have never once stopped at what they need, and so the Sentinels must stop them.", fx = { opinion = { ashenvale = "share" }, align = { order = 1 }, learn = { "ashenvale" } } },
        { text = "The forest has its own law. Drive every axe out of it.", next = "BACK", reply = "That is the old law, and the Sentinels have kept it since before your grandmothers' grandmothers were born. Ride with us, then, and we will see every axe driven out of Ashenvale.", fx = { opinion = { ashenvale = "war" }, align = { order = -1 }, learn = { "ashenvale" } } },
        { text = "Hellscream died killing a demon. Doesn't that count for something?", next = "mill_grom" },
      },
    },
    mill_grom = {
      lines = { { id = "mg_default", text = "It counts for much, and we know it, for Mannoroth fell in our forest too. But a debt paid in one coin doesn't cancel a debt owed in another, and Cenarius is still dead, and the trees are still coming down." } },
      choices = {
        { text = "Then the fight goes on. I understand.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Hard words, Sentinel, but honest ones.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    -- How the battles go
    flags = {
      lines = {
        { id = "fl_default", text = "Each side keeps its banner deep inside its own walls, and the task is to steal the other's and carry it home while your own still stands. It sounds like a children's game until you've seen what the orcs will do to stop you reaching that flag room." },
        { id = "fl_war", when = { class = "WARRIOR" }, text = "Each side keeps its banner deep in its own fortress, and the task is to steal the other's and carry it home. A warrior who can stand in the tunnel and hold it while the runner gets clear is worth any three archers on the wall." },
      },
      choices = {
        { text = "Why a banner? Why not simply burn the mill?", next = "flags_why" },
        { text = "A flag-runner must need more than fast legs.", next = "flags_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flags_why = {
      lines = { { id = "fw_default", text = "Because neither side has the strength to hold the whole valley, and both know it. The Warsong standard is the clan's pride, and every time we take it the axes go quiet for a while, so the banner is worth more to us than any fire." } },
      choices = {
        { text = "Then everything rests on whoever carries the banner.", next = "flags_run", fx = { trait = { skeptical = 1 } } },
        { text = "Clever. Shaming them works better than burning them.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    flags_run = {
      big = true,
      lines = { { id = "fr_default", text = "Speed, mostly, and the nerve to keep running when you can hear wolves behind you. The best runners I've known wouldn't stop for a wounded friend on the way home, and I've never decided whether I admire them for it." } },
      choices = {
        { text = "You never leave anyone behind. The banner can wait.", next = "BACK", reply = "Elune bless you for saying it, because I have buried runners who carried the banner home and left a sister in the gulch, and the banner never meant as much to me afterward.", fx = { align = { honor = 1 } } },
        { text = "The banner wins the fight. A runner who stops loses it.", next = "BACK", reply = "That is the hard truth of the gulch, and perhaps you are right, but I hope I never have to watch you run past someone I love with that banner on your back.", fx = { align = { honor = -1 } } },
        { text = "I've never carried a banner. I'd like to learn.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    -- The marks
    marks = {
      lines = {
        { id = "mk_default", text = "When you win at the Gulch, you'll be given a Mark of Honor, and the Sentinels keep count of them. Bring me three and I'll carry word of your service back to the Hold, where it will be remembered." },
        { id = "mk_carry", when = { carrying = { 20558, min = 3 } }, text = "You've three of them on you now, I can see. Give them to me when you're ready, and the Sentinels will hear that you held the line for them." },
      },
      choices = {
        { text = "What do the Sentinels do with them?", next = "marks_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marks_why = {
      lines = { { id = "mkw_default", text = "We keep a tally at the Hold of every friend from outside the forest who has bled for it, and the marks are how we know you stood there with us. It means little to a dwarf, perhaps, but a night elf remembers for a very long time." } },
      choices = {
        { text = "I'd like to be remembered that long.", next = "BACK", fx = { affinity = 1 } },
        { text = "I fight for my own reasons, not a tally.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    -- The city she stands in
    city = {
      lines = {
        { id = "ct_default", text = "It's a strange post for a Sentinel, standing among walls when I'd rather be in the branches above the Hold. But Ashenvale can't win this alone, so here I am, asking strangers to care about a forest most of them have never seen." },
        { id = "ct_if", when = { zone = "Ironforge" }, text = "I confess I find it hard to breathe in here, with the forges going day and night and no sky at all. The dwarves are kind enough, though, and one of them brought me a potted fern last week, which I've kept alive by the Great Forge's light." },
        { id = "ct_sw", when = { zone = "Stormwind City" }, text = "The humans stare at me as if I were a tall purple ghost, but they listen when I speak, which is more than I expected. Their children ask whether Ashenvale has wolves in it, and I tell them yes, and that some of the wolves have riders." },
        { id = "ct_dn", when = { zone = "Darnassus" }, text = "Here I'm among my own, which should be easier, and it isn't. Too many of our people think the war in Ashenvale is a matter for the Sentinels alone, and they'd rather tend Teldrassil's groves than look south across the water." },
      },
      choices = {
        { text = "Do many answer your call?", next = "city_answer" },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    city_answer = {
      lines = { { id = "ca_default", text = "More than I feared and fewer than we need, which I'm told is what every recruiter says. The ones who come back from the Gulch often return to stand beside me and tell the next ones what it's like, and those are the voices that fill the Hold." } },
      choices = {
        { text = "Then I'll go, and come back to tell it.", next = "BACK", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },

    -- Class and race
    x_druid = {
      big = true,
      lines = { { id = "xd_default", text = "They did, in the war when the orcs first came to Kalimdor, and the forest still remembers where he fell. Some in the Circle say he'll return in time, as the Wild Gods do, and some say the orcs must pay for him first. What does your heart tell you, druid?" } },
      choices = {
        { text = "The forest heals. Vengeance won't bring the Lord of the Grove back.", next = "BACK", reply = "Your heart speaks with the Circle's patience, druid, and I envy you it. The forest does heal, given long enough, though I hope I live to see where Cenarius fell grow green again.", fx = { opinion = { warsong = "forgive" }, align = { light = 1 } } },
        { text = "Blood was spilled first. The Warsong must answer for it.", next = "BACK", reply = "Then you speak for many of my sisters, druid, and the Warsong would be wise to fear it. We have long memories at Silverwing Hold, and longer bows.", fx = { opinion = { warsong = "hate" }, align = { light = -1 } } },
        { text = "I don't know yet. I need time with the trees.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    k_nelf = {
      lines = { { id = "kn_default", text = "Come to Silverwing Hold, and bring others with you. The forest won't ask it of you, because the forest never asks, but your ancestors planted those groves and somebody has to stand between them and the axes." } },
      choices = {
        { text = "Then I'll stand there. Ishnu-alah, Sentinel.", next = "BACK", fx = { affinity = 2 } },
        { text = "We lost a world once. We can't lose this one too.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    k_dwarf = {
      lines = { { id = "kdw_default", text = "Because the orcs who cut our trees are the same ones who burned Khaz Modan in the Second War, and the clan that leads them is the one that never gave up the old ways. Stop them in the Gulch, and they come no closer to your mountains." } },
      choices = {
        { text = "Aye, that's reason enough. I'll go.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll fight for the Alliance, if not for the trees.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_gnome = {
      lines = { { id = "kgn_default", text = "You'd find it crude, I expect, all saw-blades and wolf-drawn carts, though they've built it to eat trees faster than any forest can grow them. If you go there to study it, study it from far away, and then help us burn the plans." } },
      choices = {
        { text = "Crude machines break easily. I'll keep that in mind.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Fine. No admiring orcish engineering out loud.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    k_human = {
      lines = { { id = "khm_default", text = "Because your kingdom's lumber comes from Elwynn and Westfall, and you know what it is to see a forest felled for an army. The Horde that cuts Ashenvale is the same Horde that burned Stormwind once, and they'll not stop at our borders if we let them grow strong." } },
      choices = {
        { text = "Then I'll fight for both our homes.", next = "BACK", fx = { affinity = 1 } },
        { text = "Stormwind's troubles come first for me.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    x_pala = {
      big = true,
      lines = { { id = "xp_default", text = "Elune is our light, and I won't ask you to bow to her, but I've seen paladins at the Hold shield a fallen runner and carry the flag home after. Some of them refuse to strike an orc who has laid down his axe, and some of them don't, and I've learned not to judge either." } },
      choices = {
        { text = "Spare those who yield. The Light asks mercy of us.", next = "BACK", reply = "Then you will be welcome at the Hold, paladin, for mercy is hard to carry into the gulch. Elune smiles on the merciful, I think, even when they are not her own.", fx = { opinion = { orcs = "mercy" }, align = { light = 1 } } },
        { text = "An orc who yields today cuts trees tomorrow.", next = "BACK", reply = "A hard truth, paladin, and one I have learned on the riverbank myself. Strike if you must, but do not take any joy in it, for that is how the orcs lost themselves.", fx = { opinion = { orcs = "hate" }, align = { light = -1 } } },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = { { id = "xr_default", text = "The Sentinels prefer the night and the shadows under the trees, so you'll feel at home there. Learn the tunnel from the orcs' flag room to the open ground, because a runner who knows the dark ways reaches home while the others are still fighting at the door." } },
      choices = { { text = "I'll learn the dark ways, then.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    x_hunt = {
      lines = { { id = "xh_default", text = "They do, and you'll see it if you ride through. The bears go hungry where the groves are cleared, the nightsabers move north, and the furbolgs, who were never easy neighbors, grow wilder every season that the axes come closer." } },
      choices = {
        { text = "Then I'll hunt the hunters who drive them out.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
  },

  topics = {
    ashenvale = { { id = "tp_ash", text = "Ashenvale is the oldest forest our people still hold, and every tree in it has a memory longer than your kingdoms. The orcs see a lumber yard, and we see our ancestors." } },
    _none = { { id = "tp_none", text = "I've no answer for that, friend. Ask me about the Gulch, and I'll have plenty to say." } },
  },
}

-- Warsong Emissary (Horde): an orc of the Warsong Outriders, posted in Orgrimmar, Undercity and Thunder Bluff.
P:NPC {
  key = "emissary_warsong", id = TODO_NPC("Warsong Emissary"), name = "Warsong Emissary",
  role = "soldier", tier = "quest",
  temper = { "gruff", "proud" }, values = { "loyal", "practical" },
  notices = { "pvp", "soldier", "race" },

  impression = {
    first = "He spoke of wood the way other orcs speak of water.",
    third = "{name} met the Warsong Emissary, an orc of the Warsong Outriders who recruits for the fight against the night elves over the timber of Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar, {g:brother|sister}! The Warsong Outriders need fighters in the Gulch, and you look like you could swing an axe." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Have you come to fight for the mill, or only to talk? Either way, stand here a moment, for the Horde needs both." },
    { id = "g_marks", when = { carrying = { 20558, min = 3 } }, text = "I smell the Gulch on you, and you're carrying the marks to prove it. Hand them over, and the Outriders will know you've stood at the mill." },
    { id = "g_mark", when = { carrying = 20558 }, text = "One mark from the Gulch, I see. Win two more and bring them to me, and the clan will remember you." },
    { id = "g_honored", when = { reputation = { faction = "Warsong Outriders", min = "honored" } }, text = "The Outriders say your name around the fires at the mill now. That's no small thing, because Warsong orcs don't praise easily." },
    { id = "g_exalted", when = { reputation = { faction = "Warsong Outriders", min = "exalted" } }, text = "Every orc at the mill knows who you are, and half of them owe you their lives. Hellscream himself would have shared his fire with you." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You carry an officer's rank in the Horde, I see. Bring that to the Gulch, where the young ones need someone to follow." },
    { id = "n_kills", cat = "soldier", when = { honorKills = { min = 250 } },
      text = "You've killed a great many of the Alliance, by the look of you, and you don't flinch when you talk about it. Good, because the Sentinels won't flinch either." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, place = "before",
      text = "A tauren, and you're looking at my axe the way your elders look at a burnt field. Hear me out before you judge me, friend." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I speak for the Warsong Outriders, who hold the lumber mill at the north end of Warsong Gulch. The night elves want our camp burned and our axes broken, and every day we hold out, more timber goes south to build the Horde's home." },
        { id = "h_og", when = { zone = "Orgrimmar" },
          text = "Look at these walls, {g:brother|sister}, and tell me where you think the wood came from. Orgrimmar stands because Warsong axes went into Ashenvale, and it will keep standing only if we keep them there." },
        { id = "h_uc", when = { zone = "Undercity" },
          text = "Thrall sent me down here among the Forsaken, and I'll admit these tunnels don't sit well with an orc who's used to the open sky. But the Forsaken fight hard and don't complain about the cold, and the Gulch needs fighters who don't complain." },
        { id = "h_tb", when = { zone = "Thunder Bluff" },
          text = "I know what some of the tauren up here think of my clan's work in Ashenvale, and I won't hide from it. Hear me out anyway, because Cairne has kept faith with Thrall, and the Horde needs every arm it can find." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Another son or daughter of Draenor, and you've the look of someone who knows what Durotar is like when the timber runs out. Come to the Gulch, and help keep the mill turning." },
        { id = "h_honored", when = { reputation = { faction = "Warsong Outriders", min = "honored" } },
          text = "You've done more for the mill than I can say in a city square. Stand with me a while, and tell me how the old place fares." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, because I've more recruits to find before dusk." },
        { id = "h_again2", text = "Go on. I can talk about the Gulch until the sun goes down." },
        { id = "h_again3", text = "Speak, {g:brother|sister}. The axes can wait for you a little longer." },
      },
      choices = {
        { text = "What is Warsong Gulch?", next = "gulch" },
        { text = "I'd have thought the Horde had wood enough at home.", next = "wood" },
        { text = "How does the fighting go there?", next = "flags" },
        { text = "What are these Marks of Honor worth to you?", next = "marks" },
        { text = "Tell me about Hellscream's clan.", next = "grom" },
        { text = "Our people revere the land. Why should I help you clear it?", next = "k_tauren", when = { race = "Tauren" } },
        { text = "What does a Forsaken care for orcish lumber?", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "The Darkspear know about fighting for land. What's in it for us?", next = "k_troll", when = { race = "Troll" } },
        { text = "The spirits of the forest are angry. Do you hear them?", next = "x_sham", when = { class = "SHAMAN" } },
        { text = "Do you need warriors who can hold a line?", next = "x_war", when = { class = "WARRIOR" } },
        { text = "How do I get at the night elves' banner unseen?", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Tauren druids say Cenarius died in that forest. Is it true?", next = "x_druid", when = { class = "DRUID" } },
        { text = "I'll think on it, Outrider.", next = "END" },
      },
    },

    -- The place
    gulch = {
      lines = {
        { id = "gl_default", text = "It's a valley in northern Ashenvale, just past where the Barrens end, and it's full of the tallest trees you'll ever see. We built the mill there because the road south is short, and the night elves built their Silverwing Hold at the other end because they can't stand to see an orc with an axe." },
      },
      choices = {
        { text = "What's the mill like?", next = "gulch_mill" },
        { text = "I've heard the Silverwing are hard to fight.", next = "gulch_elves" },
        { text = "Something else, Outrider.", next = "BACK" },
      },
    },
    gulch_mill = {
      lines = { { id = "gm_default", text = "Wolf pens, a big saw that the goblins helped us build, and a palisade cut from the first trees we felled. It's loud and it smells of sap and smoke, and I've never been anywhere I'd rather sleep." } },
      choices = {
        { text = "And the night elves come for it?", next = "gulch_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gulch_elves = {
      lines = {
        { id = "ge_default", text = "Sentinels, tall and silent, with their owls and their glaives, and they fight in the dark like they were born to it. They come for our banner every night, and some nights they get it, and I'll be honest with you, they're the hardest enemy the clan has faced since the demons." },
      },
      choices = {
        { text = "You respect them, then.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then they'll fall harder when we beat them.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },

    -- The wood and the moral question
    wood = {
      lines = {
        { id = "wd_default", text = "Have you seen Durotar, {g:brother|sister}? Red rock, thorny scrub and a sun that cracks the ground, and not a tree in it worth cutting. Without timber we can't build houses or ships or wagons, so the Horde goes north, because the Horde has to live somewhere." },
        { id = "wd_uc", when = { zone = "Undercity" }, text = "Your Forsaken have a whole dead city to build from, but in Durotar we have red rock and thorns and nothing more. Without timber we can't build houses or ships or wagons, so the Horde goes north, because the Horde has to live somewhere." },
      },
      choices = {
        { text = "You could trade for wood instead.", next = "wood_trade" },
        { text = "The night elves say the forest is sacred.", next = "wood_sacred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_trade = {
      lines = { { id = "wt_default", text = "With whom? The goblins charge more for a plank than it's worth, and the night elves would rather put an arrow in us than sell us a branch. So we cut it ourselves, and we pay for it in blood instead of gold." } },
      choices = {
        { text = "And the night elves call that theft.", next = "wood_sacred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_sacred = {
      big = true,
      lines = { { id = "ws_default", text = "They say it, and maybe they believe it, but they have a whole forest and we have a desert. Thrall teaches us to respect the land, and the Warsong do try, in our way, but no orc child ever grew up warm on respect. Which matters more, do you think?" } },
      choices = {
        { text = "The Horde's survival comes first. Cut what you need.", next = "BACK", reply = "Spoken like a true child of the Horde, {g:brother|sister}, and I will not argue with you. Our children must grow up warm, and the elves can share their forest or watch us take it.", fx = { opinion = { ashenvale = "necessary" }, align = { order = 1 }, learn = { "ashenvale" } } },
        { text = "A forest is not ours to tame. Take less, or nothing.", next = "BACK", reply = "You speak like a shaman, and perhaps that is no bad thing. But respect will not keep our children warm through a Durotar winter, and someone must swing the axe.", fx = { opinion = { ashenvale = "wrong" }, align = { order = -1 }, learn = { "ashenvale" } } },
        { text = "I'll have to think about that.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- How the battles go
    flags = {
      lines = {
        { id = "fl_default", text = "Each side guards its banner in its own fort, and you win by stealing theirs and bringing it home while ours still stands. The night elves are quick and they climb like cats, so it's no easy fight, but a Warsong banner carried back to the mill is worth a week of drinking." },
        { id = "fl_war", when = { class = "WARRIOR" }, text = "Each side guards its banner in its own fort, and you win by stealing theirs and bringing it home. A warrior who can stand in the tunnel and keep the Sentinels off a runner is worth ten wolves." },
      },
      choices = {
        { text = "Why a banner? Why not just burn their hold?", next = "flags_why" },
        { text = "Carrying the flag must take some nerve.", next = "flags_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flags_why = {
      lines = { { id = "fw_default", text = "Because neither side can hold the whole valley, and a stolen banner shames them more than a burnt wall. Every time we carry off the Silverwing standard, their archers stay in their towers for a while, and our axes go back to work." } },
      choices = {
        { text = "So it all comes down to the runner.", next = "flags_run", fx = { trait = { skeptical = 1 } } },
        { text = "Shaming them works better than burning them, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    flags_run = {
      big = true,
      lines = { { id = "fr_default", text = "Legs, guts and friends who'll die for you on the way home. I've seen runners leave a wounded friend in the tunnel to get the banner back, and I've seen others turn around for them, and I still can't say which one Hellscream would have honored." } },
      choices = {
        { text = "You never leave a comrade. The banner can wait.", next = "BACK", reply = "Then you have Grom's heart, I think, because he did not leave his people behind, even at the very end, and I would run beside you anywhere.", fx = { align = { honor = 1 } } },
        { text = "The banner wins the fight, so the runner keeps running.", next = "BACK", reply = "Many would agree, and the gulch has been won that way before, but do not be surprised if the grunt you left in the tunnel never runs beside you again.", fx = { align = { honor = -1 } } },
        { text = "I'd like to try carrying it myself.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    -- The marks
    marks = {
      lines = {
        { id = "mk_default", text = "Win at the Gulch and you'll come away with a Mark of Honor. Bring me three and I'll send word to the Outriders that you've stood with us, and they'll remember it." },
        { id = "mk_carry", when = { carrying = { 20558, min = 3 } }, text = "You've got three already, I see. Hand them over when you're ready, and the Outriders will know your name." },
      },
      choices = {
        { text = "What does the clan do with them?", next = "marks_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marks_why = {
      lines = { { id = "mkw_default", text = "We hang them on cords in the mill's longhouse, one cord for each fighter who isn't of the clan. Some of those cords are longer than my arm, and the young orcs count them before every fight for luck." } },
      choices = {
        { text = "I'd like a long cord of my own.", next = "BACK", fx = { affinity = 1 } },
        { text = "I fight for the Horde, not for a cord.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    -- Grom and the clan
    grom = {
      lines = {
        { id = "gr_default", text = "The Warsong were Grom Hellscream's clan, and when we first came to Kalimdor he led us into Ashenvale. He drank demon blood again there, he killed the night elves' forest god, and then he broke his chains and killed Mannoroth himself, and he died doing it." },
      },
      choices = {
        { text = "He killed their god? No wonder they hate you.", next = "grom_god" },
        { text = "He freed the orcs from the demons, didn't he?", next = "grom_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom_god = {
      lines = { { id = "gg_default", text = "Cenarius, they call him, and he came at us with the trees themselves as his army. The night elves say we owe them for it forever, but he struck first and we answered, and that's the way of war." } },
      choices = {
        { text = "So Hellscream freed you in the end.", next = "grom_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom_free = {
      big = true,
      lines = { { id = "gf_default", text = "He killed the demon who first put the curse on us, and the blood-lust broke with him. Some in the clan say we should carry on his fury in Ashenvale, and others say his death was to free us from that fury forever. Where do you stand, {g:brother|sister}?" } },
      choices = {
        { text = "Honor his sacrifice. The fury should end with him.", next = "BACK", reply = "Then you understand Grom better than many who carried his banner. He gave his life to set us free, and I will not throw that gift back into the fire.", fx = { opinion = { warsong = "restrain" }, align = { light = 1 } } },
        { text = "His fury won the war. Carry it into the Gulch.", next = "BACK", reply = "His fury won us Ashenvale, it is true, and the Gulch could use some of it. But be careful, {g:brother|sister}, for that same fury nearly made slaves of us all.", fx = { opinion = { warsong = "support" }, align = { light = -1 } } },
        { text = "I'd rather hear what you think.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    -- Race and class
    k_tauren = {
      lines = { { id = "kt_default", text = "Because we don't clear it, not the way the night elves claim. We cut where we must, and a tauren druid once walked our lines and told us which groves to leave, and we left them. The Earth Mother gives, friend, and we try to take only what keeps us alive." } },
      choices = {
        { text = "Then I'll watch the axes as well as the elves.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "I'll fight for the Horde. The land I'll speak for later.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    k_forsaken = {
      lines = { { id = "kf_default", text = "Not much, I'd wager, but you care about the Horde staying strong, because the Horde is the only friend the Forsaken have. Every orc we save in the Gulch is one more to stand beside you when the Alliance comes for your city." } },
      choices = {
        { text = "Then the dead will fight for the living, for now.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "We fight for ourselves first, orc.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_troll = {
      lines = { { id = "ktr_default", text = "Thrall gave your people a home in Durotar when the sea witch drove you off your islands, and that home needs wood like ours does. Help us hold the mill, and the timber builds Sen'jin's huts as surely as it builds Orgrimmar's walls." } },
      choices = {
        { text = "Ya, the Darkspear remember their debts, mon.", next = "BACK", fx = { affinity = 2 } },
        { text = "We'll fight, but we keep our own counsel.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    x_sham = {
      big = true,
      lines = { { id = "xs_default", text = "I'm no shaman, but our shamans at the mill say the spirits there are restless and that we owe them offerings for every tree we take. Some of my clan listen, and some say the spirits forgot the orcs long ago and we owe them nothing." } },
      choices = {
        { text = "Make the offerings. The spirits keep the balance.", next = "BACK", reply = "Our shamans will be glad to hear you say it, and I confess I sleep easier when they make them. If the spirits are restless, it costs us little to keep them calm.", fx = { opinion = { the_elements = "respect" }, align = { order = 1 } } },
        { text = "The spirits don't feed the Horde. Cut what you need.", next = "BACK", reply = "That is the warrior's answer, and many in the Horde would agree with you. Still, I would not want to be the orc the spirits remember when they finally decide to answer.", fx = { opinion = { the_elements = "useful" }, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_war = {
      lines = { { id = "xw_default", text = "Always, {g:brother|sister}! The tunnel to our flag room is narrow, and one warrior with a shield and a strong back can hold it long enough for the runner to get clear. Come to the Gulch, and you'll find no shortage of Sentinels to stop." } },
      choices = { { text = "Then I'll hold that tunnel.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } } },
    },
    x_rogue = {
      lines = { { id = "xr_default", text = "The Sentinels keep their banner high in their hold, and their archers watch the stairs. Go in through the side door while the rest of us keep them busy at the front, and don't stop running until you can smell the mill." } },
      choices = { { text = "I'll take the side door, then.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    x_druid = {
      lines = { { id = "xd_default", text = "It's true, and I won't lie to a druid about it. Hellscream's warriors killed Cenarius in that forest, and the night elves will never forgive us, but the Warsong of today were children then, and we fight for wood, not for gods." } },
      choices = {
        { text = "I'll pray the forest forgives you, even if they don't.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else, Outrider.", next = "BACK" },
      },
    },
  },

  topics = {
    ashenvale = { { id = "tp_ash", text = "More trees than a whole clan could cut in a lifetime, and the night elves guard each trunk as if it were their own child." } },
    _none = { { id = "tp_none", text = "I'm a soldier of the Warsong, not a scholar. Ask me about the Gulch, and you'll get a straight answer." } },
  },
}
