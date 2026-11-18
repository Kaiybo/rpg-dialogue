-- The Alterac Valley gates: Lieutenant Haggerdin recruits for the Stormpike Guard, Warmaster Laggrond for the
-- Frostwolf Clan. Voices: bibles/av_headland.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lieutenant Haggerdin: Stormpike Guard recruitment officer at the Alliance entrance.
P:NPC {
  key = "dal_haggerdin", id = TODO_NPC("Lieutenant Haggerdin"), name = "Lieutenant Haggerdin",
  bible = "bibles/av_headland.md", role = "soldier", tier = "quest",
  communities = { "stormpike" }, temper = { "gruff", "proud" }, values = { "loyal", "dutiful", "proud" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "He calls the Frostwolves savages and the valley Ironforge's by right.",
    third = "{name} met Lieutenant Haggerdin, the Stormpike Guard's recruitment officer at the gates of Alterac Valley.",
  },

  greetings = {
    { id = "g_default", text = "Hail, {race}! Ye've arrived just in time, for the Frostwolves are at it again." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another tour, soldier? Good. Dun Baldar needs every axe." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the valley's changed hands three times since. Get in there an' change it back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown tougher since yer first tour, an' the Frostwolves will have noticed it, too." },
    { id = "g_banner", when = { questActive = TODO_QUEST("Proving Grounds") }, text = "Icewing Caverns, southwest o' Dun Baldar, an' bring back the banner. Mind the harpies." },
    { id = "g_honored", when = { reputation = { faction = "Stormpike Guard", min = "honored" } }, text = "There's a face the Guard knows well! Step up, an' let's see that insignia." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "Now there's a soldier's frame! The Guard could use a hundred like ye, an' I'd take the lot." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } },
      text = "A legend o' the Guard, standin' at my post! I'll salute ye for that, an' I don't do it often." },
  },

  start = "hello",
  nodes = {
    opn_orcs = {
      lines = {
        { id = "opn_orcs_q", text = "Change? Ye've been listenin' tae the folk in Theramore, I see. I fought orcs in the Second War, an' these Frostwolves never fought in it at all, which some say makes 'em different an' I say makes 'em lucky. What's yer view, soldier?" },
      },
      choices = {
        { text = "An orc is an orc. They'll burn the world again.", next = "opn_orcs_r_hate", fx = { affinity = 1, align = { light = -1 }, opinion = { orcs = "hate" } } },
        { text = "These ones never served the Horde of old. They might be different.", next = "opn_orcs_r_respect", fx = { affinity = -1, align = { light = 1 }, opinion = { orcs = "respect" } } },
        { text = "Changed or not, they're in our valley. That's what matters.", next = "opn_orcs_r_wary", fx = { trait = { practical = 1 }, opinion = { orcs = "wary" } } },
        { text = "I'm Horde, dwarf. Watch your mouth.", next = "opn_orcs_r_proud", when = { faction = "Horde" }, fx = { affinity = -2, opinion = { orcs = "proud" } } },
        { text = "I'd rather fight than talk, Lieutenant.", next = "BACK" },
      },
    },
    opn_orcs_r = {
      lines = {
        { id = "opn_orcs_r_default", text = "Good. Ye'll get plenty o' both in the valley." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_orcs_r_hate = {
      lines = {
        { id = "opn_orcs_r_hate", text = "Aye, they might, an' that's why we're here. Respect 'em, mind, as I said, but ye don't have tae like 'em." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_orcs_r_respect = {
      lines = {
        { id = "opn_orcs_r_respect", text = "Different, maybe. Still in my valley, still on wolves, still shootin' at my lads. Different doesnae mean friendly, soldier." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_orcs_r_wary = {
      lines = {
        { id = "opn_orcs_r_wary", text = "That's the General's answer, an' it's the right one. Leave the philosophy tae the mages in their city." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_orcs_r_proud = {
      lines = {
        { id = "opn_orcs_r_proud", text = "An' ye watch yer back in the valley, then. I'll grant ye the courage, an' that's all I'll grant." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lieutenant Haggerdin, in charge o' recruitment for the Stormpike Guard. As ye gain prestige among the Stormpike, come back tae me an' I'll see about upgradin' yer insignia, an' replace it if ye lose it." },
        { id = "h_sovereign", tags = { "news" }, when = { questActive = TODO_QUEST("The Sovereign Imperative") },
          text = "Rotimer sent ye from Ironforge? Then let's get tae work, for the King wants the valley an' the Frostwolves won't hand it over politely." },
        { id = "h_proving_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Proving Grounds"), days = 3 } },
          text = "Wear that insignia wi' pride, soldier. As yer rank grows, so will the insignia, an' maybe someday ye'll be a legend on that field." },
        { id = "h_eye", tags = { "news" }, when = { questDone = TODO_QUEST("The Eye of Command") },
          text = "The Eye o' Command, on yer own hand. I've handed out a great many insignia, but I've only ever dreamt o' givin' that one." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf o' Khaz Modan! The valley's ours by right o' the King, an' it'll take good dwarven boots tae hold it." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Ye'll like Dun Baldar, there's machines in the mines an' bigger ones on the field." },
        { id = "h_dd_honor", tags = { "news" }, when = { honorKills = { min = 250 } },
          text = "Word from the valley is ye've put a good many Frostwolves an' their friends in the snow, an' Vanndar likes that sort o' tally. Keep it up, an' mind ye come back for yer insignia." },
      },
      again = {
        { id = "h_again", text = "What else, soldier? The valley's waitin'." },
        { id = "h_again2", text = "Ask, then get in there." },
      },
      choices = {
        { text = "There's a war on in Alterac Valley, I hear.", next = "why" },
        { text = "Who leads the Stormpike Guard?", next = "vanndar" },
        { text = "What are the Frostwolves like?", next = "frostwolf" },
        { text = "Tell me about the insignia.", next = "insignia" },
        { text = "I've served the Guard well, Lieutenant.", next = "honored", when = { reputation = { faction = "Stormpike Guard", min = "honored" } } },
        { text = "For Ironforge, Lieutenant.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "The Stormpike Expedition came tae dig the valley's riches for Ironforge, an' the Frostwolf clan says it's their home. The King calls the takin' o' that land a sovereign imperative, an' I'm no' one tae argue wi' the King." },
      },
      choices = {
        { text = "Was it really their home?", next = "why_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_home = {
      big = true,
      lines = {
        { id = "wh2_default", text = "They were exiled there, by their own kind, years before the war, an' they've hunted the place ever since. That doesnae make it theirs, an' it doesnae make our claim any weaker in my eyes." },
        { id = "wh2_warm", when = { disposition = { min = 65 } },
          text = "Between us, aye, they've a better claim tae the snow than we do, but we've a better claim tae the iron under it. Wars have started over less, an' this one's no' stoppin' for my opinion." },
      },
      choices = {
        { text = "Ironforge's claim is just. We hold the valley.", next = "BACK", reply = "That's the spirit! Ye'll make a fine Stormpike. Take yer insignia, an' keep yer head down when the Frostwolf riders come over the ridge.", fx = { align = { honor = 1 } } },
        { text = "Claims aside, iron is iron. Take what we can.", next = "BACK", reply = "Hmph, Ironforge didnae send us up there for iron alone, but I'll not turn down a strong arm for the sake of a speech, so sign your name an' get warm.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    vanndar = {
      lines = {
        { id = "va_default", text = "General Vanndar Stormpike, from Dun Baldar at the valley's north end, an' a finer commander I've never served. His Guard holds the bunkers an' the mines, an' I send him every soldier I can find." },
      },
      choices = {
        { text = "Dun Baldar must be a cold place to hold.", next = "vanndar_baldar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vanndar_baldar = {
      lines = {
        { id = "vb_default", text = "Stone walls, warm forges an' bad beer, which is all a dwarf really needs. Defend it well, for if the Frostwolves ever reach the General, the whole valley goes wi' him." },
      },
      choices = { { text = "Something else, Lieutenant.", next = "BACK" } },
    },

    frostwolf = {
      lines = {
        { id = "fw_default", text = "Savages, an' stubborn ones, who just won't give up. They ride great wolves, call on their spirits an' fight like they've nothin' tae lose, which, livin' in that snow, they probably haven't." },
      },
      choices = {
        { text = "You almost sound like you respect them.", next = "frostwolf_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frostwolf_respect = {
      lines = {
        { id = "fr_default", text = "Respect an enemy, soldier, or he'll kill ye while ye're busy despisin' him. That's no' the same as likin' him, an' I'll no' be likin' any Frostwolf in this lifetime." },
      },
      choices = {
        { text = "Do you think the orcs can ever change, Lieutenant?", next = "opn_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },

    insignia = {
      lines = {
        { id = "in_default", text = "Every soldier starts wi' an initiate's insignia, earned by bringin' back the banner from the Icewing Caverns. Do well by the Guard, come back tae me, an' I'll swap it for a better one, all the way up tae the Eye o' Command." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    honored = {
      lines = {
        { id = "ho_default", text = "Aye, ye have, an' the General's heard yer name more than once. Keep at it, for the Guard remembers its own." },
      },
      choices = {
        { text = "I'll keep at it, Lieutenant.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the valley, the Guard an' every soldier who's come through this post. Ask." } },
    background = { { id = "tp_bg", text = "Lieutenant o' the Stormpike Guard, an' I've been signin' up soldiers since the first shovel went intae that valley." } },
    advice = { { id = "tp_ad", text = "Hold the graveyards, soldier, an' ye hold the valley." } },
    alterac = { { id = "tp_alterac", text = "Cold, rich an' full o' enemies. Just the way a dwarf likes it." } },
    magni = { { id = "tp_magni", text = "King Magni wants that valley back fer Ironforge, an' so do I, an' every Stormpike under Vanndar would march through the snow barefoot if he asked. That's a king worth soldierin' fer." } },
    thrall = { { id = "tp_thrall", text = "The Frostwolves are Thrall's kin, his father's clan, so the Horde'll never let them lose that valley without a fight. Good, fer I'd hate tae win it cheap." }, { id = "tp_thrall2", when = { disposition = { min = 65 } }, text = "Between us, the Frostwolves were livin' in Alterac long before we came lookin' fer iron, an' their warchief was born there. I'll fight them fer it all the same, but I'll no' pretend the snow's only ours." } },
    second_war = { { id = "tp_second_war", text = "Alterac was Perenolde's kingdom in the Second War, an' he sold the Alliance tae the Horde from right up there in those hills. Ironforge has a long memory fer traitors, an' a longer one fer good iron." } },
    wildhammer = { { id = "tp_wildhammer", text = "A few Wildhammer riders fly fer Dun Baldar, an' they're welcome, fer a gryphon's worth ten scouts in a blizzard. Dinnae tell them I said so, fer they're insufferable enough already." } },
    _none = { { id = "tp_none", text = "No' my concern, soldier. Mine's the valley." } },
  },
}

-- Warmaster Laggrond: Frostwolf Clan recruitment officer at the Horde entrance.
P:NPC {
  key = "dal_laggrond", id = TODO_NPC("Warmaster Laggrond"), name = "Warmaster Laggrond",
  prejudice = { race = "Scourge", amount = 10, why = "An old orc's distrust of the walking dead and of a queen who answers to no one." },
  bible = "bibles/av_headland.md", role = "soldier", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "proud" }, values = { "honorable", "loyal", "brave" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "He weighs whether each newcomer will earn honour or respect.",
    third = "{name} met Warmaster Laggrond, the Frostwolf Clan's recruiter at the gates of Alterac Valley.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "One of the Banshee Queen's dead, walking into a Frostwolf camp. Thrall calls you allies, so I'll call you one too, but my wolves can smell what you are, and so can I." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ha, the dead one! You've fought beside my warriors without once looking at them like supper, and I've stopped asking the shaman to bless the ground after you leave." },
    { id = "g_default", text = "You come to fight for Frostwolf? Then stand straight, for you will be tested." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good; the valley still needs blood that isn't ours." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. The Stormpike dig deeper every day you are away, so go and stop them." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You are stronger than when you first came. The clan has noticed." },
    { id = "g_banner", when = { questActive = TODO_QUEST("Proving Grounds") }, text = "Wildpaw Cavern, and the Frostwolf banner within. Do not return without it." },
    { id = "g_honored", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } }, text = "A friend of the clan stands before me. Speak, and be welcome." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR", faction = "Horde" },
      text = "A warrior. The Frostwolves were born fighting in this snow, and you look like you could learn to." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Frostwolf Clan", min = "exalted" } },
      text = "The clan sings of you by its fires. I did not think I would see such a hero at my post." },
  },

  start = "hello",
  nodes = {
    dd_rank = {
      lines = { { id = "dd_rank_default", text = "It is a dangerous thing, and a good one. A soldier the enemy knows is a soldier they fear, and they will send their best against you, so you will either grow stronger or fall, and the clan will honour you either way." } },
      choices = {
        { text = "Then let them send their best. I'll be waiting in the snow.", next = "BACK", reply = "Spoken like a Frostwolf. Lok'tar, {rank}, and die with honour if you must.", fx = { align = { honor = 1 } } },
        { text = "I'd rather they didn't know me. A hidden blade lives longer.", next = "BACK", reply = "That is a rogue's wisdom, and the snow has room for it. But the clan sings of the ones they saw.", fx = { align = { honor = -1 } } },
        { text = "Something else, Warmaster.", next = "BACK" },
      },
    },

    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I trust what bleeds and breathes. The Forsaken have a queen who answers to nobody and apothecaries who brew plagues in cellars, and they march under our banner while they serve hers first." } },
      choices = {
        { text = "We bleed for the Horde too, whatever it is we bleed.", next = "prej_a", fx = { align = { honor = 1 } } },
        { text = "We serve our queen first, and the Horde when it suits us.", next = "prej_b", fx = { align = { honor = -1 } } },
        { text = "What would a Forsaken have to do to earn your respect?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Words are cheap, but you said them looking me in the eye, which is more than your apothecaries do. Show me on the field, and I'll remember it." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "At least you say it plainly. I'd rather an honest enemy at my back than a lying friend, and I'll keep one eye on you either way." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Stand in the line when the Stormpike charge, and don't run when the frost bites. That is all I ask of any orc, and I'll ask no more of you." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    opn_dwarves = {
      lines = {
        { id = "opn_dwarves_q", text = "The Stormpike? Diggers with guns who think every mountain is theirs because their grandfathers dug in one. But I have watched them hold Dun Baldar through a winter that killed wolves, and that is not nothing. You have walked among their kind. Speak." },
      },
      choices = {
        { text = "Thieves in a stolen valley. Drive them out.", next = "opn_dwarves_r_hate", fx = { affinity = 2, align = { honor = -1 }, opinion = { dwarves = "hate" } } },
        { text = "They're stubborn and brave, and a worthy enemy deserves respect.", next = "opn_dwarves_r_respect", fx = { affinity = 1, align = { honor = 1 }, opinion = { dwarves = "respect" } } },
        { text = "Greedy for iron. Make them pay for every ounce.", next = "opn_dwarves_r_greedy", fx = { trait = { practical = 1 }, opinion = { dwarves = "greedy" } } },
        { text = "Some of them are decent. The Stormpike aren't all dwarves.", next = "opn_dwarves_r_mixed", when = { faction = "Alliance" }, fx = { affinity = -1, opinion = { dwarves = "mixed" } } },
        { text = "I'd rather fight than talk, Warmaster.", next = "BACK" },
      },
    },
    opn_dwarves_r = {
      lines = {
        { id = "opn_dwarves_r_default", text = "Good. The drums do not wait for talk either." },
      },
      choices = {
        { text = "Something else, Warmaster.", next = "BACK" },
      },
    },
    opn_dwarves_r_hate = {
      lines = {
        { id = "opn_dwarves_r_hate", text = "Then the valley will welcome you. Hate keeps you warm in the snow, but it burns out; take something else with you when you go in." },
      },
      choices = {
        { text = "Something else, Warmaster.", next = "BACK" },
      },
    },
    opn_dwarves_r_respect = {
      lines = {
        { id = "opn_dwarves_r_respect", text = "Durotan would have said the same. Respect them, and kill them, and do neither with your eyes closed." },
      },
      choices = {
        { text = "Something else, Warmaster.", next = "BACK" },
      },
    },
    opn_dwarves_r_greedy = {
      lines = {
        { id = "opn_dwarves_r_greedy", text = "Every ounce, and the valley takes its share in blood. That is a trader's answer, but I will take it." },
      },
      choices = {
        { text = "Something else, Warmaster.", next = "BACK" },
      },
    },
    opn_dwarves_r_mixed = {
      lines = {
        { id = "opn_dwarves_r_mixed", text = "Perhaps, in their own halls. In my valley they are only Stormpike, and that is enough." },
      },
      choices = {
        { text = "Something else, Warmaster.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am in charge of recruitment for the Frostwolf Clan. As a soldier of Frostwolf, you will check in with me as your rank rises, for honour and respect are earned on this frigid field." },
        { id = "h_defense", tags = { "news" }, when = { questActive = TODO_QUEST("In Defense of Frostwolf") },
          text = "Rokhstrom sent you from Orgrimmar. Good, for the Warchief's own clan is under attack, but to become a soldier of Frostwolf, you must first be tested." },
        { id = "h_rise", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rise and Be Recognized"), days = 3 } },
          text = "You have done much for the Frostwolf, and earned a place as a soldier and a friend. Keep that insignia on you always, and die with honour, if die you must." },
        { id = "h_eye", tags = { "news" }, when = { questDone = TODO_QUEST("The Eye of Command") },
          text = "The Eye of Command. Drek'Thar himself would bow his head to you, and Drek'Thar bows to no one." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Then you know what the Frostwolves are to the Warchief, and why this valley will never be given up." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. The cold is no friend to your hide, but the clan welcomes any who stand with it." },
        { id = "h_dd_rank", when = { pvpRank = 6 },
          text = "Your rank has risen, {rank}, and the Stormpike have started to learn your face. That is how respect is earned on this field, and you are earning it." },
      },
      again = {
        { id = "h_again", text = "What else? The drums do not wait." },
        { id = "h_again2", text = "Speak, and then go and fight." },
      },
      choices = {
        { text = "You don't trust the Forsaken, Warmaster.", next = "prej", when = { prejudiced = true } },
        { text = "Why does this valley matter so much?", next = "valley" },
        { text = "The Frostwolves must have a strong leader.", next = "drekthar" },
        { text = "What do you make of the Stormpike?", next = "stormpike" },
        { text = "What is this test?", next = "test" },
        { text = "The clan knows my name now, Warmaster.", next = "honored", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } } },
        { text = "For the Horde, Warmaster.", next = "END" },
        { text = "The Stormpike know my face, Warmaster. Is that a good thing?", next = "dd_rank", when = { pvpRank = 6 } },
      },
    },

    valley = {
      lines = {
        { id = "va_default", text = "Because it is home. Gul'dan exiled the Frostwolves here before the Second War, and Durotan led us through the snow and made it ours, and his son is now the Warchief." },
      },
      choices = {
        { text = "Thrall was born a Frostwolf?", next = "valley_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_thrall = {
      big = true,
      lines = {
        { id = "vt_default", text = "Born to Durotan and Draka, and taken from them as a babe when they were murdered. He came back to us grown, and Drek'Thar knew him, and the clan has followed him since." },
      },
      choices = {
        { text = "Then the valley is his birthright. We hold it.", next = "BACK", reply = "You understand, then, and the clan will be glad of you, because the Frostwolves have bled for that snow longer than the dwarves have dug in it.", fx = { align = { honor = 1 } } },
        { text = "Birthrights mean nothing. Hold it because it's strong ground.", next = "BACK", reply = "Strong ground is reason enough for a soldier, I suppose, but do not say that around Drek'Thar, for he would tell you the ground remembers whose it is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drekthar = {
      lines = {
        { id = "dr_default", text = "Drek'Thar, our elder shaman, who led the clan after Durotan fell. He is blind, and he sees more than any of us, and from Frostwolf Keep he directs the war." },
      },
      choices = { { text = "Something else, Warmaster.", next = "BACK" } },
    },

    stormpike = {
      lines = {
        { id = "st_default", text = "Dwarves from Ironforge who came to dig our valley's bones for iron and call it a sovereign right. The nefarious Stormpike Guard, the Warchief's people call them, and I will not argue." },
      },
      choices = {
        { text = "Can there be peace with them?", next = "stormpike_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormpike_peace = {
      big = true,
      lines = {
        { id = "sp_default", text = "When they leave, there will be peace. Until then there is the valley, and the valley is cold, and it buries the dead of both sides without caring which." },
      },
      choices = {
        { text = "What do you make of the dwarves, Warmaster?", next = "opn_dwarves" },
        { text = "Drive them out. No terms until they go.", next = "BACK", reply = "That is the Frostwolf answer, and mine. Go and show the Stormpike what it means when an orc stops talking.", fx = { align = { order = -1 } } },
        { text = "Talk is cheaper than war. Offer terms.", next = "BACK", reply = "You speak like a diplomat, and Thrall might even agree, but the Stormpike came with picks and cannons, not with words, and I have not heard them offer any.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    test = {
      lines = {
        { id = "te_default", text = "Wildpaw Cavern lies in the valley, and the gnolls there guard a Frostwolf banner they stole from us. Bring it back, and you earn an initiate's insignia, and from there you rise as far as your honour carries you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    honored = {
      lines = {
        { id = "ho_default", text = "It does, and it speaks your name with respect. No insignia I hand out can buy that, though I will give you those as well." },
      },
      choices = {
        { text = "Lok'tar, Warmaster.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the valley, the clan and the enemy. Ask." } },
    background = { { id = "tp_bg", text = "A warrior of the Frostwolf, born in the snow and raised on the hunt." } },
    advice = { { id = "tp_ad", text = "Respect the cold, and it will kill the Stormpike before it kills you." } },
    alterac = { { id = "tp_alterac", text = "Our home, and we will not give it up to dwarves with shovels." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a Frostwolf by blood, son of Durotan and Draka, and Alterac was the cradle of his clan. When you fight for the Frostwolves, you fight for his family." }, { id = "tp_thrall2", when = { faction = "Alliance" }, text = "You ask about the Warchief at the gate of his father's valley? He is a Frostwolf, and that is all you need to know about why we will not leave." } },
    second_war = { { id = "tp_second_war", text = "Gul'dan exiled the Frostwolves to Alterac for speaking against him, and the clan survived the snow when the rest of the Horde fell. That is where our strength comes from, and it is why the dwarves will not move us." } },
    the_elements = { { id = "tp_the_elements", text = "Drek'Thar speaks with the spirits of these mountains, and they answer him even blind. The snow is ours because the spirits know us." } },
    internment = { { id = "tp_internment", text = "The Frostwolves were never in the camps, for we were here in the mountains. But we took in those who broke free, and the Warchief does not forget it." } },
    _none = { { id = "tp_none", text = "That matters little in the valley. Ask elsewhere." } },
  },
}
