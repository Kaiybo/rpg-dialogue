-- Hillsbrad and Alterac folk no earlier pass reached: Tarren Mill's Delia Verana and Vinna Wayne, Deathstalker
-- Lesh at Southpoint Tower, Southshore's Sergeant Hartman, Caretaker Smithers and the crier, the Winter Veil
-- goblins at the Alterac Valley gates, Voggah Deathgrip, and the guards and odd figures of the mountains.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Delia Verana: Tarren Mill.
P:NPC {
  key = "hb_delia_verana", id = TODO_NPC("Delia Verana"), name = "Delia Verana", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "wry", "cold" }, values = { "practical" },
  impression = {
    first = "Delia Verana sits on the steps of a Tarren Mill house as though she owned it, which, before the plague, she did.",
    third = "{name} met Delia Verana, a Forsaken who lived in Tarren Mill before it fell and lives there still.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Tarren Mill, {class}. Mind the fences; I built that one, and it's the only thing in town that hasn't fallen down." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Delia Verana. This was my house, and that was my garden, and now it's a Deathguard billet, but they let me sit on my own steps." } },
      again = { { id = "h_again", text = "Something else? I've all day." } },
      choices = {
        { text = "What was Tarren Mill like before?", next = "before" },
        { text = "Southshore's only a few miles down the road.", next = "southshore" },
        { text = "I'll leave you to your steps.", next = "END" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "A quiet mill town in the foothills, with good apples and nosy neighbours. When the plague came, half of them fled to Southshore and the other half are standing around the square with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    southshore = {
      lines = { { id = "s_default", text = "So it is, and some of my old neighbours live there now, behind the walls with the Alliance. They'd shoot me on sight, and I can't decide whether that makes me sad or only tired." } },
      choices = {
        { text = "They're your enemies now. Forget them.", next = "BACK", reply = "That's what the Executor says, and he says it more kindly than you.", fx = { align = { honor = -1 } } },
        { text = "Maybe one day there'll be peace between you.", next = "BACK", reply = "Maybe, {class}. I'll sit on these steps and wait for it.", fx = { align = { honor = 1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask the Deathguard. I only know my own street." } },
  },
}

-- Vinna Wayne: Tarren Mill.
P:NPC {
  key = "hb_vinna_wayne", id = TODO_NPC("Vinna Wayne"), name = "Vinna Wayne", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "brisk", "dry" }, values = { "dutiful" },
  impression = {
    first = "Vinna Wayne carries buckets between the apothecaries' cauldrons and the well, and she does it with the stoic efficiency of someone who has carried buckets her whole life and her whole death.",
    third = "{name} met Vinna Wayne, a Forsaken who works around Tarren Mill.",
  },
  greetings = {
    { id = "g_default", text = "Out of the way, {class}, unless you'd like to carry one of these. No? Then out of the way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Vinna Wayne. I fetch and carry for the apothecaries, which is not glamorous, but somebody has to keep Lydon's cauldrons full." } },
      again = { { id = "h_again", text = "Quickly now, this bucket's heavy." } },
      choices = {
        { text = "What's in the buckets?", next = "buckets" },
        { text = "You work hard for a dead woman.", next = "work" },
        { text = "Carry on.", next = "END" },
      },
    },
    buckets = {
      lines = { { id = "b_default", text = "Water, mostly, though Apothecary Lydon has me fetch other things from the farms that I won't name. The less I know about his recipes, the better I sleep, or would, if I slept." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "I worked hard for a living woman too, and I wasn't paid any better then. At least now my back doesn't ache, and the Deathguard say please, now and then." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. I fetch things; I don't learn them." } },
  },
}

-- Deathstalker Lesh: Southpoint Tower, watching Hillsbrad Fields.
P:NPC {
  key = "hb_deathstalker_lesh", id = TODO_NPC("Deathstalker Lesh"), name = "Deathstalker Lesh", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "cold", "sharp" }, values = { "loyal", "duty" },
  impression = {
    first = "Deathstalker Lesh crouches in the shadow of Southpoint Tower, watching the fields below with the stillness of a cat at a mousehole.",
    third = "{name} met Deathstalker Lesh, a Forsaken scout who watches Hillsbrad Fields from Southpoint Tower.",
  },
  greetings = {
    { id = "g_default", text = "Keep low, {class}. The farmers below have keen eyes and keener pitchforks, and I've been at this post too long to be spotted now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathstalker Lesh, a scout for High Executor Darthalia. I watch Hillsbrad Fields and report on every cart and soldier that moves through them." } },
      again = { { id = "h_again", text = "Quietly. What else?" } },
      choices = {
        { text = { normal = "What have you seen in the fields?", polite = "What have you observed in the fields, Deathstalker?", blunt = "What's down there?" }, next = "fields" },
        { text = "You've been here a long time.", next = "long" },
        { text = "Is it time to strike?", next = "strike", when = { questActive = TODO_QUEST("Time To Strike") } },
        { text = "I'll leave you to watch.", next = "END" },
      },
    },
    fields = {
      lines = { { id = "f_default", text = "Farmers and the Hillsbrad militia, and Farmer Ray's orchards, and the Alliance's supplies heading into Southshore. They grow food for the soldiers who march on Tarren Mill, which makes every field a target." } },
      choices = {
        { text = "Farmers aren't soldiers.", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = { { id = "fa_default", text = "Then they shouldn't feed soldiers. The Executor doesn't ask me to weigh their innocence, only to count them." } },
      choices = {
        { text = "Every enemy supply line should be cut.", next = "BACK", reply = "Spoken like a Deathstalker. Darthalia would like you.", fx = { align = { honor = -1 } } },
        { text = "There's no honour in burning farms.", next = "BACK", reply = "Honour is a luxury of the living, {class}.", fx = { align = { honor = 1 } } },
      },
    },
    long = {
      lines = { { id = "l_default", text = "Long enough to know which farmer whistles and which one coughs. The dead make good scouts because we don't need to eat, sleep or warm our hands, and the living never think to look for us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strike = {
      lines = { { id = "s_default", text = "It is. Go down into the fields and do what the Executor wants done, while I watch the road for the militia. Come back to Tarren Mill when it's finished, and I'll make my report." } },
      choices = {
        { text = "What exactly does she want done?", next = "orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      lines = { { id = "o_default", text = "Their strength broken, so they can't send more to Southshore. Darthalia will give you the particulars; I only tell you when the moment's right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I watch the fields, not the gossip." } },
  },
}

-- Sergeant Hartman: Southshore, at Hallow's End.
P:NPC {
  key = "hb_sergeant_hartman", id = TODO_NPC("Sergeant Hartman"), name = "Sergeant Hartman", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "gruff", "steady" }, values = { "duty", "brave" },
  impression = {
    first = "Sergeant Hartman paces the Southshore green with a bucket at his feet, looking north toward Tirisfal like a man who expects to see smoke.",
    third = "{name} met Sergeant Hartman, the Southshore soldier who sends volunteers to spoil the Forsaken's Hallow's End festival.",
  },
  greetings = {
    { id = "g_default", text = "Ah, {class}, you've a sturdy look about you. Hallow's End is here, and the Forsaken are up to their old tricks in Tirisfal." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're a long way from friends, Horde. Move along, before I call the guard." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Sergeant Hartman, of the Southshore garrison. Every Hallow's End the undead raise a great burning figure outside their city, and every year I send someone to spoil it." } },
      again = { { id = "h_again", text = "Anything else, soldier?" }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = { normal = "What are the Forsaken celebrating?", polite = "What is it the Forsaken celebrate, Sergeant?", blunt = "What do the Forsaken celebrate?" }, next = "celebrate" },
        { text = "How do I spoil it?", next = "spoil" },
        { text = "What's this about pine?", next = "pine", when = { questActive = TODO_QUEST("The Power of Pine") } },
        { text = "How does the garrison fare these days?", next = "garrison" },
        { text = "My family fled Lordaeron too. I understand you.", next = "refugee", when = { race = "Human" } },
        { text = "I'll think on it.", next = "END" },
      },
    },
    celebrate = {
      lines = { { id = "c_default", text = "Their freedom from the Lich King, so they say, and they burn a wicker giant to mark it. It was our festival first, and I don't care for the way they've twisted it." } },
      choices = {
        { text = "They've as much right to it as we have.", next = "BACK", reply = "Have they? Tell that to the folk they drove out of Tarren Mill.", fx = { align = { order = -1 } } },
        { text = "It's an insult to Lordaeron's memory.", next = "BACK", reply = "Exactly my feeling, {class}, and I'm glad someone shares it.", fx = { align = { order = 1 } } },
      },
    },
    spoil = {
      lines = { { id = "s_default", text = "Go north into Tirisfal, near the Undercity, and douse their Wickerman with a bucket. It's guarded by abominations, mind, so you'll need to be quick, and quicker still getting out." } },
      choices = {
        { text = "That sounds like a good way to die.", next = "die" },
        { text = "Something else.", next = "BACK" },
      },
    },
    die = {
      lines = { { id = "d_default", text = "It does, and nobody's died of it yet that I know of, though a few came back smelling of pitch. Call it a tradition, and a little poke in the eye for the Dark Lady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pine = {
      lines = { { id = "p_default", text = "Wickerman ash gets everywhere, and it carries a stink that isn't natural. Pine resin cuts through it, so bring me what I asked for, and I'll see you're properly cleaned." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    garrison = {
      lines = { { id = "ga_default", text = "Stretched thin, if I'm honest, with Tarren Mill's dead to the north and the Syndicate creeping down out of Alterac. We hold Southshore, and we hold it well, but holding is all we've managed since the plague." } },
      choices = {
        { text = "What happened at Tarren Mill?", next = "tarren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarren = {
      narr = "He turns his head north and is quiet for a moment.",
      lines = { { id = "ta_default", text = "It was a living town once, with a mill and a smithy and a fair every harvest, and now it's the Forsaken's, every stone of it. Some of the folk walking its streets were neighbours of ours, and that's the part none of us can talk about for long." } },
      choices = {
        { text = "Then we take it back, one day.", next = "BACK", reply = "One day, aye, when Stormwind sends us more than letters.", fx = { align = { order = 1 } } },
        { text = "Let the dead keep it. Look after the living.", next = "BACK", reply = "Spoken like someone who never lived there, but you may be right.", fx = { align = { order = -1 } } },
      },
    },
    refugee = {
      lines = { { id = "re_default", text = "Then you know what it is to watch home burn and still find yourself setting a table for the people you lost. Hallow's End was ours before it was theirs, and I'll keep it that way while I've breath." } },
      choices = { { text = "Then I'll douse their fire for you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my business, {class}. Ask the Magistrate." } },
  },
}

-- Caretaker Smithers: the Southshore graveyard.
P:NPC {
  key = "hb_caretaker_smithers", id = TODO_NPC("Caretaker Smithers"), name = "Caretaker Smithers", title = "Caretaker", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "southshore" }, temper = { "gentle", "anxious" }, values = { "dutiful", "kind" },
  impression = {
    first = "Caretaker Smithers leans on a spade at the edge of the Southshore graveyard, glancing up the north road every few minutes.",
    third = "{name} met Caretaker Smithers, who tends the Southshore graveyard.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you, {class}. Mind the fresh ground, please; the dead deserve a little peace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Smithers, caretaker of this yard. I dig the graves and keep them tidy, and these days I keep an eye on them too." } },
      again = { { id = "h_again", text = "Anything else? I've a grave half dug." } },
      choices = {
        { text = "Why keep an eye on graves?", next = "eye" },
        { text = "You look worried.", next = "worried" },
        { text = "Rest easy, caretaker.", next = "END" },
      },
    },
    eye = {
      lines = { { id = "e_default", text = "Because in Lordaeron the dead don't always stay put. The plague is cured here, I'm told, but I've seen what walks out of Tarren Mill, and I'll not have it walking out of my yard." } },
      choices = {
        { text = "Burn the bodies, then.", next = "BACK", reply = "Burn them? These are Southshore's fathers and mothers, {class}. I'll not burn them.", fx = { align = { light = -1 } } },
        { text = "The Light will keep them in their graves.", next = "BACK", reply = "I pray you're right. I bless each one as I bury it.", fx = { align = { light = 1 } } },
      },
    },
    worried = {
      lines = { { id = "w_default", text = "Who in Southshore isn't? The Forsaken sit up the road in Tarren Mill, the Syndicate creeps out of Alterac, and every month I dig more graves for the militia." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm only the caretaker, {class}. Ask the Magistrate." } },
  },
}

-- Southshore Crier: runs into town warning of assassins.
P:NPC {
  key = "hb_southshore_crier", id = TODO_NPC("Southshore Crier"), name = "Southshore Crier", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "loud" }, values = { "dutiful" },
  impression = {
    first = "The Southshore crier stumbles into town red-faced and gasping, bell in hand, shouting warnings at anyone who will listen.",
    third = "{name} met the Southshore crier, who brings warnings of assassins to the town.",
  },
  greetings = {
    { id = "g_default", text = "Hear ye, hear ye! Oh, Light, give me a moment to breathe, {class}, because assassins are on their way to Southshore!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I ran all the way down from the hills, and I saw them, cloaked figures moving through the trees toward town. They must be after Magistrate Maltory again, and I've got to warn the guards!" } },
      again = { { id = "h_again", text = "Quickly, {class}, there's no time!" } },
      choices = {
        { text = "Who would want the Magistrate dead?", next = "who" },
        { text = "Where did you see them?", next = "where" },
        { text = "I'll guard the town.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Syndicate, I'd wager, out of Alterac, because they've been trying to get at him for months. Or the Forsaken, but they'd use plague, not knives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "wh_default", text = "In the hills north of the town, coming down from every direction at once. Guards to your posts, I say, and you too, if you've a weapon!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No time for that now! Assassins!" } },
  },
}

-- Hillsbrad Tailor: cloth vendors in Hillsbrad Fields.
P:NPC {
  key = "hb_hillsbrad_tailor", id = TODO_NPC("Hillsbrad Tailor"), name = "Hillsbrad Tailor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "practical" }, values = { "craft" },
  impression = {
    first = "The Hillsbrad tailor works at a table in the shade of a barn, stitching linen shirts for the farmhands and glancing nervously north toward Tarren Mill.",
    third = "{name} met a tailor selling cloth in Hillsbrad Fields.",
  },
  greetings = {
    { id = "g_default", text = "Looking for cloth, {class}? I've shirts and robes for honest work, and a few for less honest work, if you don't ask questions." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I sew for the farms of Hillsbrad Fields, mostly work shirts and the odd wedding dress, though there haven't been many weddings since the plague." } },
      again = { { id = "h_again", text = "Anything else? I've a seam to finish." } },
      choices = {
        { text = "Business must be hard here.", next = "hard" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Who buys your shirts these days?", next = "buyers" },
        { text = "I'm a tailor myself. Your stitching is fine work.", next = "craft", when = { profession = "Tailoring" } },
        { text = "Good day.", next = "END" },
      },
    },
    hard = {
      lines = { { id = "h2_default", text = "Hard as stone. The Forsaken raid the fields, the farmers can barely pay, and half my thread comes up from Southshore on carts that don't always arrive." } },
      choices = {
        { text = "Why not move to Southshore?", next = "move" },
        { text = "Something else.", next = "BACK" },
      },
    },
    move = {
      lines = { { id = "m_default", text = "Because my grandmother sewed in this barn, and her mother before her. If the dead want it, they'll have to take it from me needle by needle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The farmhands, when they're paid, and the Southshore militia, who tear through sleeves faster than I can mend them. A few adventurers too, though most of you want silk and I've only linen and wool." } },
      choices = { { text = "Linen will do. Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "cr_default", text = "Kind of you to say, and rarer than you'd think out here, where folk only notice a seam when it splits. My grandmother taught me a double stitch for work shirts, and it hasn't failed me yet." } },
      choices = { { text = "I'll try it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I only know cloth and the weather, {class}." } },
  },
}

-- Dillord Copperpinch: Smokywood Pastures, by the Horde entrance to Alterac Valley.
P:NPC {
  key = "hb_dillord_copperpinch", id = TODO_NPC("Dillord Copperpinch"), name = "Dillord Copperpinch", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "loud", "cheerful" }, values = { "ambitious" },
  impression = {
    first = "Dillord Copperpinch has set up a food stall in the snow outside Alterac Valley, wrapped in three scarves and selling hot drinks at mountain prices.",
    third = "{name} met Dillord Copperpinch, a Smokywood Pastures goblin selling food at the Horde entrance to Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Hey, pal, you look frozen! Hot food, warm drinks, and a price that'll warm ya even faster, 'cause I'm practically givin' it away." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Dillord Copperpinch, Smokywood Pastures, mountain branch. Soldiers come out of that valley half frozen and starving, and a goblin with a stove is a goblin with a customer base." } },
      again = { { id = "h_again", text = "Anything else, buddy? My fingers are freezin' here." } },
      choices = {
        { text = "Aren't you related to the other Copperpinches?", next = "family" },
        { text = "Selling food at a war seems risky.", next = "risky" },
        { text = "Show me the food.", next = "BUSINESS" },
        { text = "Stay warm.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "Cousins, the whole lot of 'em, and every one of us sellin' somethin' somewhere. Nardstrum and Jaycrue got the cozy city gig, and I got the snowdrift, 'cause I lost a bet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    risky = {
      lines = { { id = "r_default", text = "Risky? Listen, kid, the Frostwolves and the Stormpikes both get hungry, and nobody shoots the cook. That's the first rule of wartime catering, and I'd put it on a sign if I could spare the paint." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Dunno, pal, but I got hot cider that don't care either." } },
  },
}

-- Mirvyna Jinglepocket: Smokywood Pastures, by the Alliance entrance to Alterac Valley.
P:NPC {
  key = "hb_mirvyna_jinglepocket", id = TODO_NPC("Mirvyna Jinglepocket"), name = "Mirvyna Jinglepocket", title = "Smokywood Pastures", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "cheerful", "brisk" }, values = { "ambitious" },
  impression = {
    first = "Mirvyna Jinglepocket runs a food stall on the Headland by the Alliance side of Alterac Valley, ringing a little bell every time someone walks past.",
    third = "{name} met Mirvyna Jinglepocket, a goblin selling food at the Alliance entrance to Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Ding-a-ling, sweetheart! Hot pies, cold ale, and a warm smile at no extra charge, which is the only free thing on this stall." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mirvyna Jinglepocket, Smokywood Pastures, valley concession. The Stormpike dwarves eat like starved bears, and I've the only stove on this side of the mountain." } },
      again = { { id = "h_again", text = "Anything else? Bell's gettin' cold." } },
      choices = {
        { text = "Do you sell to the Horde too?", next = "horde" },
        { text = "What's with the bell?", next = "bell" },
        { text = "Let me see the food.", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    horde = {
      lines = { { id = "h2_default", text = "Not me personally, but my competitor Dillord's got the other gate, and the Cartel takes a cut from both of us. Business is business, and a war is just a very hungry customer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bell = {
      lines = { { id = "b_default", text = "It jingles, and it gets attention, and attention turns into coin. Plus the dwarves think it's festive, so they buy an extra pie, which is the whole point, sugar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, but I'd sell it to you if I had it." } },
  },
}

-- Voggah Deathgrip: Frostwolf, by the Horde entrance to Alterac Valley.
P:NPC {
  key = "hb_voggah_deathgrip", id = TODO_NPC("Voggah Deathgrip"), name = "Voggah Deathgrip", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "gruff", "proud" }, values = { "honor", "loyal" },
  impression = {
    first = "Voggah Deathgrip stands at the mouth of the Alterac Valley road in Frostwolf furs, watching every newcomer with the measuring look of a clan elder.",
    third = "{name} met Voggah Deathgrip of the Frostwolf clan, who calls warriors to defend Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. You come to the gates of Frostwolf country, and the Frostwolves will judge whether you belong." },
    { id = "g_orc", when = { race = "Orc" }, text = "Lok'tar, brother. Frostwolf blood or not, an orc is welcome at these gates." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Voggah Deathgrip of the Frostwolf clan. Drek'Thar sent me to stand at the gate and gather those willing to fight for our home." } },
      again = { { id = "h_again", text = "What else, warrior?" }, { id = "h_again2", text = "Speak plainly." } },
      choices = {
        { text = { normal = "Why do the Frostwolves need help?", polite = "How may I help the Frostwolves, elder?", blunt = "What's the trouble?" }, next = "help" },
        { text = "Tell me about Drek'Thar.", next = "drekthar" },
        { text = "I'm loyal to the Frostwolves.", next = "loyalty", when = { questActive = TODO_QUEST("Matters of Loyalty") } },
        { text = "The spirits are loud in these mountains.", next = "spirits", when = { class = "SHAMAN" } },
        { text = "I was born in an internment camp, not these hills.", next = "camps", when = { race = "Orc" } },
        { text = "I'll return when I'm ready.", next = "END" },
      },
    },
    help = {
      lines = { { id = "he_default", text = "The Stormpike dwarves dig in our valley, and they guard their diggings with a fortress. They want the iron and the relics; we want only our home back." } },
      choices = {
        { text = "Who are these Stormpike?", next = "stormpike" },
        { text = "What should I do first?", next = "first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Prove yourself to the clan, and the clan will trust you with more. Bring what I ask, and fight in the valley, and your name will be known among us." } },
      choices = {
        { text = "I'll crush the Stormpike for you.", next = "BACK", reply = "Bold words. Back them with your axe.", fx = { align = { honor = -1 } } },
        { text = "I'll fight with honour, as Durotan did.", next = "BACK", reply = "You know our history. Good; that matters.", fx = { align = { honor = 1 } } },
      },
    },
    drekthar = {
      lines = { { id = "d_default", text = "Our elder shaman, blind and wise, who sheltered Thrall when he was a boy. Drek'Thar sees more with his spirit than most see with two eyes." } },
      choices = {
        { text = "Thrall came here as a runaway?", next = "thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyalty = {
      lines = { { id = "l_default", text = "Then show it. Loyalty is spoken in deeds among the Frostwolves, and I will remember yours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormpike = {
      lines = { { id = "sp_default", text = "Dwarves of Ironforge who call themselves an expedition and dig like they mean to stay. They raised Dun Baldar in our valley and they hunt our wolves for sport, and the clan will not forget either." } },
      choices = { { text = "Then they'll answer for it. Something else.", next = "BACK" } },
    },
    thrall = {
      narr = "Voggah touches the wolf-tooth hanging at his throat.",
      lines = { { id = "th_default", text = "He came through the snow half dead, a slave's boy with a human's manners, and Drek'Thar saw his father's blood in him. Durotan's son learned the old ways here before he ever led the Horde, and that is why this valley is sacred to us." } },
      choices = {
        { text = "Then it's worth any price to hold.", next = "BACK", reply = "Any price the clan can pay with honour, yes.", fx = { align = { honor = -1 } } },
        { text = "Then it must be held with honour.", next = "BACK", reply = "That is what Durotan would have said. Good.", fx = { align = { honor = 1 } } },
      },
    },
    spirits = {
      lines = { { id = "sh_default", text = "They are, shaman, because these peaks remember the old clan and the wolves who ran with it. Drek'Thar listens to them every night, and lately they speak of iron and digging." } },
      choices = { { text = "I'll listen too. Something else.", next = "BACK" } },
    },
    camps = {
      lines = { { id = "ca_default", text = "Many were, brother, and no shame in it, because the shame belongs to the humans who built the camps. Thrall freed you, and Thrall learned freedom here, so in a way you were born in Frostwolf country after all." } },
      choices = { { text = "Lok'tar. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask the clan, not me. I speak for the gate." } },
  },
}

-- Ravenholdt Assassin: near Ravenholdt Manor.
P:NPC {
  key = "hb_ravenholdt_assassin", id = TODO_NPC("Ravenholdt Assassin"), name = "Ravenholdt Assassin",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "ravenholdt" }, temper = { "cold", "quiet" }, values = { "loyal" },
  impression = {
    first = "The Ravenholdt assassin stands so still against the trees that you nearly walk past without noticing, which you suspect is the point.",
    third = "{name} met an assassin of Ravenholdt in the hills of Alterac.",
  },
  greetings = {
    { id = "g_default", text = "You walk loudly, {class}. Ravenholdt hears everything that comes up this road." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of us, or near enough. You may pass, but quietly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard the road to the manor. Lord Ravenholdt receives only those he chooses, and I decide whether he's chosen you." } },
      again = { { id = "h_again", text = "Speak quickly." } },
      choices = {
        { text = "What is Ravenholdt?", next = "what" },
        { text = "What happens to uninvited guests?", next = "guests" },
        { text = "I'll turn back.", next = "END" },
      },
    },
    what = {
      lines = { { id = "w_default", text = "A house of the Assassins' League, who hunt the Syndicate and anyone else who dishonours the trade. More than that, you'd need to earn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = { { id = "g_default", text = "They leave quickly, or they don't leave. Most choose the first option, and I recommend it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not your concern, or mine." } },
  },
}

-- Stormpike Battleguard: the cave to the Alliance entrance of Alterac Valley.
P:NPC {
  key = "hb_stormpike_battleguard", id = TODO_NPC("Stormpike Battleguard"), name = "Stormpike Battleguard",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "southshore" }, temper = { "gruff", "loud" }, values = { "duty" },
  impression = {
    first = "The Stormpike battleguard blocks the cave mouth with a hammer on his shoulder and a beard full of frost.",
    third = "{name} met a Stormpike battleguard guarding the Alliance road into Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Halt there, {g:lad|lass}. This cave leads to Stormpike country, and nae one passes without the Stormpike's say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep this cave for Vanndar Stormpike. On the far side is the valley, Dun Baldar and the Frostwolves, and ye'll want a stout heart before ye go through." } },
      again = { { id = "h_again", text = "Aye? What else?" } },
      choices = {
        { text = "What are the Stormpike digging for?", next = "dig" },
        { text = "How bad are the Frostwolves?", next = "frostwolf" },
        { text = "I'll pass on.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Iron and old relics, the finest ye ever saw, and the Expedition means to have them. The orcs claim the valley, but we dwarves were digging these mountains long before they came." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    frostwolf = {
      lines = { { id = "f_default", text = "Tough as the mountain, I'll grant them that, and led by a blind shaman who sees too much. Ye'll not beat them by being careless, so keep yer wits about ye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask at Dun Baldar." } },
  },
}

-- Veteran Legionnaire: Frostwolf soldiers in the valley.
P:NPC {
  key = "hb_veteran_legionnaire", id = TODO_NPC("Veteran Legionnaire"), name = "Veteran Legionnaire",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "tarren_mill" }, temper = { "gruff", "steady" }, values = { "honor", "loyal" },
  impression = {
    first = "The veteran legionnaire wears Frostwolf red and has the scars of a dozen skirmishes in the valley, each one earned the hard way.",
    third = "{name} met a veteran Frostwolf legionnaire in the snows of Alterac.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. The valley is cold, but the fighting keeps us warm." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I've fought the Stormpike since they first came into the valley. My blade has seen more dwarves than my mother has seen grandchildren." } },
      again = { { id = "h_again", text = "Something else, warrior?" } },
      choices = {
        { text = "What have you learned in all that fighting?", next = "learned" },
        { text = "Are the Frostwolves winning?", next = "winning" },
        { text = "Lok'tar.", next = "END" },
      },
    },
    learned = {
      lines = { { id = "l_default", text = "That dwarves are hard to kill and harder to frighten. Hit them low and fast, and never let them dig in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    winning = {
      lines = { { id = "w_default", text = "Some days, and some days the dwarves are. As long as the Frostwolves stand, the valley is ours, whoever holds the field that night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask Drek'Thar. I only fight." } },
  },
}

-- Strange Snowman: outside Growless Cave at Winter Veil; a frozen Smokywood agent named Sacks.
P:NPC {
  key = "hb_strange_snowman", id = TODO_NPC("Strange Snowman"), name = "Strange Snowman",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "alterac" }, temper = { "anxious", "loud" }, values = { "ambitious" },
  impression = {
    first = "The snowman outside Growless Cave has a goblin's nose poking out of its face and is, quite unmistakably, muttering.",
    third = "{name} met a strange snowman in the Alterac Mountains, who turned out to be a goblin frozen in snow.",
  },
  greetings = {
    { id = "g_default", text = "Psst! Hey, pal, yeah, you, the one with legs that work! Don't scream, I'm not a snowman, I just play one in a crisis." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Name's Sacks, Smokywood Pastures, field agent. I came up here lookin' for a missin' shipment of Winter Veil treats, and somethin' big and green and grumpy buried me in a snowdrift." } },
      again = { { id = "h_again", text = "Quick, before my nose freezes off!" }, { id = "h_again2", text = "Talk faster, pal, I'm losin' feelin' in places." } },
      choices = {
        { text = { normal = "What buried you?", polite = "What buried you, if you don't mind me asking?", blunt = "What did this?" }, next = "greench" },
        { text = "What shipment?", next = "shipment" },
        { text = "I've dealt with the Greench.", next = "done", when = { questDone = TODO_QUEST("You're a Mean One...") } },
        { text = "That is the worst disguise I've ever seen.", next = "disguise", when = { class = "ROGUE" } },
        { text = "Dwarves don't hate dry kegs. We mourn them.", next = "keg", when = { race = "Dwarf" } },
        { text = "Good luck with that.", next = "END" },
      },
    },
    greench = {
      lines = { { id = "g_default", text = "The Abominable Greench, a big ugly brute who hates Winter Veil more than a dwarf hates a dry keg. He lives up in Growless Cave with all the stolen treats, and he don't share." } },
      choices = {
        { text = "I'll handle the Greench.", next = "handle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    handle = {
      lines = { { id = "h2_default", text = "That's the spirit, buddy, and I'll owe ya one, which in goblin terms is a big deal. Bring back the treats, and Smokywood will make it worth your while." } },
      choices = {
        { text = "I'll do it for the holiday spirit.", next = "BACK", reply = "Aw, a sentimental type. Bless ya, pal.", fx = { align = { light = 1 } } },
        { text = "I'll do it for the reward.", next = "BACK", reply = "Now you're talkin' my language, friend.", fx = { align = { light = -1 } } },
      },
    },
    shipment = {
      lines = { { id = "s_default", text = "Cookies, cocoa, gift wrap, the works, all bound for Smokywood's stalls across the cities. The whole season's margin was in those crates, and I ain't goin' home without it." } },
      choices = {
        { text = "Who's Smokywood Pastures, then?", next = "smokywood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "You did? Sparks and sprockets, you're a hero! Now dig me out of here, 'cause I've been a snowman so long I'm startin' to like carrots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smokywood = {
      lines = { { id = "sm_default", text = "Only the finest seasonal goods outfit from here to Booty Bay, pal, sellin' to the Alliance and the Horde both, because cocoa don't care whose army you march in. Wulmort in Ironforge runs the show, and if I come back empty-handed he'll dock it from my wages till next Veil." } },
      choices = {
        { text = "Would he really dock a frozen goblin's pay?", next = "docked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    docked = {
      lines = { { id = "dk_default", text = "Would he? Buddy, he docked my cousin for the eyebrows he lost when a firework went off in the warehouse, on account of the eyebrows bein' company time. Lovely fella, Wulmort, but he reads the small print in his sleep." } },
      choices = { { text = "Then let's get you paid. Something else.", next = "BACK" } },
    },
    disguise = {
      lines = { { id = "di_default", text = "Hey, it fooled the Greench, didn't it, and he lives in a cave full of snow, so he's practically an expert. You sneaky types are hard to please, I'll tell ya that for free." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    keg = {
      lines = { { id = "kg_default", text = "Mourn 'em, huh? Well, put that on the list of things the Greench'll answer for, pal, because I'm pretty sure he drank the whole crate of Winter Veil brew we had bound for Ironforge." } },
      choices = { { text = "Now it's personal. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, pal, I've been a snowman all week." } },
  },
}
