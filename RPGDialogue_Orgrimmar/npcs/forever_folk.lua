-- Orgrimmar folk new in Forever: An'drak and his wolf Evermore (Valley of Strength),
-- Gruga Bloodblade (Darkspear Islands battlemaster, Hall of the Brave) and Mon'ye
-- (transmogrifier, Cleft of Shadow). Voice: bibles/forever_folk.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- An'drak: an orc hunter with an old wolf called Evermore.
---------------------------------------------------------------------------
P:NPC {
  key = "andrak", id = TODO_NPC("An'drak"), name = "An'drak",
  bible = "bibles/forever_folk.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm", "gruff" }, values = { "loyal", "patient" },
  notices = { "pet", "class" },

  impression = {
    first = "He talks about his wolf Evermore more than about himself.",
    third = "{name} met An'drak, an orc hunter in the Valley of Strength, and his wolf Evermore.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Easy, friend. Evermore likes you. She wouldn't bite you even if I asked, I think." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Easy. Evermore won't bite unless I ask. Today, I might ask." },
    { id = "g_default", text = "Easy. Evermore won't bite unless I ask, and I rarely ask." },
    { id = "g_back", when = { metBefore = true }, text = "Evermore remembers you. See the ears? That's as much welcome as he gives anyone but me." },
    { id = "g_pet", when = { pet = { family = "Wolf" } }, text = "Keep your wolf on your side, and I'll keep mine on mine, and they can settle who's in charge with a look." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} keeps glancing at Evermore and then looking away. Good, that's manners, and you've taught it well, or it taught itself." },
    { id = "n_tauren", cat = "class", when = { class = "HUNTER", race = "Tauren" },
      text = "A tauren hunter. Your people walk beside their beasts instead of in front of them, and Evermore can tell the difference, I promise you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "An'drak, and this is Evermore. We've hunted from Durotar to the far side of the Barrens together, and these days we mostly stand in the Valley of Strength and let the young ones stare at him." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "An'drak, and this is Evermore. You're a hunter, so you'll know already that I'm the one who follows him, whatever it looks like from the outside." },
        { id = "h_frost", when = { origin = "orc_frostwolf" },
          text = "An'drak, and this is Evermore. You've the look of the Frostwolves about you, and if so, you'll know a good wolf when you see one." },
      },
      again = {
        { id = "h_again", text = "What else? Evermore's in no hurry, and neither am I." },
        { id = "h_again2", text = "Go on. He's listening too, believe it or not." },
      },
      choices = {
        { text = "Why is he called Evermore?", next = "name" },
        { text = "How did you find him?", next = "found" },
        { text = "How old is he?", next = "age" },
        { text = "Any advice for a hunter and a beast?", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Good hunting, An'drak.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "nm_default", text = "When he was a pup I told him he'd be with me forever, and some fool at the inn said nothing lasts forever. So I called him Evermore, to spite the fool, and the wolf's outlived the inn's roof by now." },
      },
      choices = {
        { text = "That's a good reason for a name.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    found = {
      lines = {
        { id = "fo_default", text = "In the Barrens, half starved in a dry gully, after something larger had killed the rest of his litter. He bit me twice before he let me carry him, and I've the scars to prove it, and I'd let him bite me again." },
      },
      choices = {
        { text = "You saved his life.", next = "found_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_saved = {
      lines = {
        { id = "fs_default", text = "And he's saved mine more times than I can count since, so we're square, or near enough. A beast doesn't keep score the way we do, which is one of the better things about them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    age = {
      big = true,
      lines = {
        { id = "ag_default", text = "Older than most wolves get, and slower in the mornings. Some say a hunter should let an old beast go before it fails him in the field, and others say you stay with it to the end. What would you do?" },
      },
      choices = {
        { text = "Stay with him to the end. He's earned that.", next = "BACK", reply = "That's what I'll do, then, and Evermore will hunt beside me till he can't. He's earned his last run.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Let him rest, and find a younger hunting partner.", next = "BACK", reply = "Maybe that's wiser, but I couldn't do it. Evermore stays, and I'll carry the slower mornings.", fx = { align = { honor = -1 } } },
        { text = "That's between you and Evermore.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Feed it before you feed yourself, and never ask it to do what you wouldn't. A beast that trusts you will run through fire, and a beast that only fears you will run the other way at the worst moment." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well enough, so you're doing something right. Feed it before you feed yourself, and never ask it to do what you wouldn't, and it'll run through fire for you." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a hunter, I've always been a hunter, and the rest of my life is between me and the wolf." } },
    advice = { { id = "tp_ad", text = "Never hunt hungry and never hunt angry. Both make you careless, and the Barrens punish carelessness." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask someone who spends more time indoors." } },
  },
}

---------------------------------------------------------------------------
-- Gruga Bloodblade: Darkspear Islands battlemaster, Hall of the Brave.
---------------------------------------------------------------------------
P:NPC {
  key = "gruga", id = TODO_NPC("Gruga Bloodblade"), name = "Gruga Bloodblade", title = "Darkspear Islands Battlemaster",
  bible = "bibles/forever_folk.md", role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce", "jovial" }, values = { "brave", "loyal" },
  notices = { "pvp", "race", "level" },

  impression = {
    first = "His grin could be for the fight or for me.",
    third = "{name} met Gruga Bloodblade, the Darkspear battlemaster in Orgrimmar who sends the Horde to fight on the Darkspear Islands.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Well, well, look who come back to the Hall of the Brave! Sit, warrior, and tell me your kills." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well, look who come into the Hall. Mind yourself, because the brave here have long memories." },
    { id = "g_default", text = "Well, well, look who come into the Hall of the Brave. You ready to fight for the Horde on the old islands, mon?" },
    { id = "g_low", when = { maxLevel = 29 }, text = "Not yet, little {class}. The islands eat the young ones, so come back to Gruga when you got more fights behind you." },
    { id = "g_back", when = { metBefore = true, minLevel = 30 }, text = "Back again, and still standing! The islands didn't get you yet, so let's go and give them another try." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, place = "before",
      text = "A Darkspear! Then you got a reason to fight on those islands that no orc got, and Gruga don't need to tell you what it is." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You wear an officer's rank, mon. The young ones on the islands need somebody to follow, so make sure they follow you and not the tide." },
    { id = "n_low", cat = "level", when = { maxLevel = 20 },
      text = "So small! Gruga was small once too, but he wasn't running around the Hall of the Brave asking for wars." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Gruga Bloodblade, battlemaster for the Darkspear Raiders. Theramore's soldiers be sitting on our old islands, and Gruga sends anyone strong enough to go and knock them off." },
        { id = "h_low", when = { maxLevel = 29 },
          text = "Gruga Bloodblade, and Gruga be sorry, {class}, but you not ready for the Darkspear Islands yet. Come back with a few more scars, and Gruga will send you with a smile." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Gruga Bloodblade, and it be good to see a Darkspear face in this hall of orcs. The Raiders be fighting for the islands where our grandmothers were born, so you know what this be about." },
      },
      again = {
        { id = "h_again", text = "What else you want to know? Ask fast, the boats don't wait." },
        { id = "h_again2", text = "Go on, mon, Gruga got all day and nothing but war to talk about." },
      },
      choices = {
        { text = "Who are we fighting there?", next = "enemy" },
        { text = "What's the ground like?", next = "ground" },
        { text = "Why are you wearing a Warsong tabard?", next = "tabard" },
        { text = "Send me to the islands.", next = "BUSINESS", when = { minLevel = 30 } },
        { text = "What does the Horde gain from those islands?", next = "xgain" },
        { text = "Who were the Darkspear before Thrall came?", next = "xpast" },
        { text = "I am a shaman. Do the spirits favour the islands?", when = { class = "SHAMAN" }, next = "xshaman" },
        { text = "Another time, Gruga.", next = "END" },
      },
    },
    enemy = {
      lines = {
        { id = "en_default", text = "The Theramore Expeditionary Force, they call themselves, Proudmoore's people come back to the islands their fleet once fought over. Gruga don't know what they want with a burnt old rock, but they want it bad, and that be reason enough to say no." },
      },
      choices = {
        { text = "Proudmoore's people fought there before?", next = "enemy_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy_before = {
      lines = {
        { id = "eb_default", text = "When the Warchief first come to our islands, the Kul Tiras ships were already there, fighting our people on the shore. Now Theramore's soldiers walk the same beaches, and Gruga thinks some of them remember." },
      },
      choices = {
        { text = "Then we'll remind them how it ended.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ground = {
      lines = {
        { id = "gr_default", text = "Jungle and black rock, with an old tower, the ruins, a camp and a cove full of broken ships. Whoever holds the most of them holds the islands, so don't go standing in one place admiring the view." },
      },
      choices = {
        { text = "Which is the hardest to hold?", next = "ground_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ground_hard = {
      big = true,
      lines = {
        { id = "gh_default", text = "The cove, every time, because the tide comes in and the humans come with it. Some fighters say you hold your ground no matter what, and some say you fall back and take it again later. What kind of fighter be you?" },
      },
      choices = {
        { text = "I hold the line. Nobody gives up ground.", next = "BACK", reply = "Dat be the warrior's way, mon, and the cove need more like you. Hold it, and the tide break on you.", fx = { align = { order = 1 } } },
        { text = "I fall back, wait, and strike where they're weak.", next = "BACK", reply = "Smart, mon, very smart, and the humans never see it coming. Fall back, and take it again.", fx = { align = { order = -1 } } },
        { text = "I'll find out when I get there.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    tabard = {
      lines = {
        { id = "tb_default", text = "Ha! The Raiders don't got tabards of our own sewn yet, so the Warsong lent Gruga one of theirs. It be a little tight across the shoulders, but nobody on the islands ever stopped to complain about the colors." },
      },
      choices = {
        { text = "It suits you, Gruga.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgain = {
      lines = {
        { id = "xgain_default", text = "A place for the Darkspear to call home again, maybe, and a lesson for Theramore that the Horde don't forget a debt. Some orcs say it be a waste of grunts for a rock in the sea. What you think, mon?" },
      },
      choices = {
        { text = "A debt to an ally is paid in full, whatever it costs.", next = "BACK", reply = "Dat be how Thrall talks, and dat be why the Darkspear follow him.", fx = { align = { honor = 1 } } },
        { text = "We fight where it profits the Horde, nowhere else.", next = "BACK", reply = "Hard words, mon, but Gruga heard them from wiser heads than yours. Maybe you right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpast = {
      lines = {
        { id = "xpast_default", text = "We were a small tribe being hunted by murlocs and a sea witch, and by humans too, until the Warchief's ships washed up on our shore. Sen'jin died for that meeting, and Vol'jin swore us to the Horde." },
      },
      choices = {
        { text = "What happened to Sen'jin?", next = "xsenjin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsenjin = {
      lines = {
        { id = "xsenjin_default", text = "The sea witch took him, and Thrall could not save him, though he tried. Gruga was a boy then, and he remembers the drums for Sen'jin went all night, and in the morning we sailed for Kalimdor." },
      },
      choices = {
        { text = "Then the islands are his grave as well.", next = "BACK", reply = "Dat they are, mon, and that be why the Raiders fight so hard.", fx = { learn = { "voljin" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xshaman_default", text = "The spirits there be angry, mon, because too much blood soaked into that ground for too many years. Talk to them gentle before you fight, and maybe they don't fight you too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    echo_isles = { { id = "tp_echo", text = "The Echo Isles be our home now, off the Durotar coast, when Zalazane's not sitting on them. The Darkspear Islands be the old home, far over the sea, and both of them be worth fighting for." } },
    background = { { id = "tp_bg", text = "Gruga fought for the Darkspear before he fought for the Horde, and now he gets to do both. Not much more to it than that, mon." } },
    advice = { { id = "tp_ad", text = "Keep moving, keep your friends close, and never chase a human into the water. Gruga learned that last one the wet way." } },
    darkspear = { { id = "tp_x_darkspear", text = "Small tribe, big hearts, long memory. The Darkspear don't forget a friend, and we never forget an enemy." } },
    _none = { { id = "tp_none", text = "Gruga don't know about that. Ask him about the islands, he knows plenty about those." } },
  },
}

---------------------------------------------------------------------------
-- Mon'ye: Darkspear transmogrifier, Cleft of Shadow.
---------------------------------------------------------------------------
P:NPC {
  key = "monye", id = TODO_NPC("Mon'ye"), name = "Mon'ye", title = "Transmogrifier",
  bible = "bibles/forever_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth", "dry" }, values = { "cunning", "curious" },
  notices = { "gear", "race" },

  impression = {
    first = "She studied my gear the way a tailor studies a bad seam.",
    third = "{name} met Mon'ye, a Darkspear transmogrifier in Orgrimmar's Cleft of Shadow who changes how armor looks.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Greetings, friend. Come into the shade, and Mon'ye will show you the best he has." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Greetings, {class}. Mon'ye will show you his wares, and Mon'ye will count them after you leave." },
    { id = "g_default", text = "Greetings, {class}. Come into the shade and let Mon'ye see what you be wearing, and what you could be wearing instead." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Either you liked the last look, or you've grown tired of it, and both be good for business." },
    { id = "g_naked", when = { nearlyNaked = true }, text = "Mon'ye can change how your armor looks, {class}, but first you got to be wearing some." },
  },

  notice = {
    { id = "n_broken", cat = "gear", when = { durability = { max = 0.25 } },
      text = "That armor be held together by hope, mon. Mon'ye can make it look like new, but it won't stop a blade any better, so go see a smith first." },
    { id = "n_sky", cat = "race", when = { race = "Skyborne" },
      text = "Mon'ye hears your people weave such fine cloth, with feathers worked right into it. One day you must tell me how you dye it." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Mon'ye, and I weave a little magic about a body so the armor looks like whatever you please. The steel stays the same underneath, but the world sees what you choose to show it." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Mon'ye, and a Darkspear never needs telling that what folk see and what be true are two different things. The witch doctors taught us that before we could walk, and I just found a way to make it pay." },
      },
      again = {
        { id = "h_again", text = "Something else, or shall we get to the weaving?" },
        { id = "h_again2", text = "Ask, ask. Mon'ye don't charge for talking." },
      },
      choices = {
        { text = "How does the weaving work?", next = "how" },
        { text = "Why should anyone care how armor looks?", next = "why" },
        { text = "Why work in the Cleft of Shadow?", next = "cleft" },
        { text = "You're from Sen'jin, then?", next = "senjin" },
        { text = "What would you dress me in?", next = "suggest" },
        { text = "Did the witch doctors mind you selling their tricks?", next = "witch", when = { race = "Troll" } },
        { text = "Could you make me look alive again?", next = "undead", when = { race = "Scourge" } },
        { text = "Show me what you can do.", next = "BUSINESS" },
        { text = "Not today, Mon'ye.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "hw_default", text = "Mon'ye takes the look of one piece you've worn and lays it over another, like a shadow that fits. It be the same trick the witch doctors use to hide a hut in the jungle, only prettier, and nobody gets cursed." },
      },
      choices = {
        { text = "Can you make me look like someone else?", next = "how_else" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_else = {
      big = true,
      lines = {
        { id = "he_default", text = "Your armor, yes, but never your face, and Mon'ye don't do that kind of work. Some customers want to look humble so nobody sees them coming, and some want to look exactly as dangerous as they be. Which kind be you?" },
      },
      choices = {
        { text = "Let them see exactly what's coming.", next = "BACK", reply = "Then Mon'ye make you look like the storm, mon, and they see you coming a mile off. Good choice.", fx = { align = { honor = 1 } } },
        { text = "Humble. Let them underestimate me.", next = "BACK", reply = "Humble it is, mon, and they never know what hit them. Mon'ye like that kind of customer.", fx = { align = { honor = -1 } } },
        { text = "I haven't decided yet.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because a warrior who loves the look of his armor stands taller in it, and a grunt standing tall has already half-won before the first swing. And because some folk spend their whole lives in hand-me-downs, and they deserve to look grand for once." },
      },
      choices = {
        { text = "That's kinder than I expected.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Vanity, then, with better words.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    cleft = {
      lines = {
        { id = "cl_default", text = "The rent be cheap, and the customers down here like a little mystery about themselves. Rogues want to look like merchants, merchants want to look like warlocks, and the warlocks just want something that hides the scorch marks." },
      },
      choices = {
        { text = "And what do you want to look like?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    senjin = {
      lines = { { id = "sj_default", text = "Sen'jin Village, on the Durotar coast, where the Darkspear been living since the Warchief gave us a home. Mon'ye grew up between the huts and the surf, watching the witch doctors paint their faces and make a hut vanish into the trees." },
      },
      choices = {
        { text = "Why did the Darkspear need a home?", next = "senjin_isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senjin_isles = {
      lines = { { id = "si_default", fx = { learn = { "echo_isles" } }, text = "Because the Echo Isles be ours by right, and Zalazane took them, mon, with his madness and his hexed trolls walking around like puppets. Vol'jin brought us to the mainland, and every Darkspear in Sen'jin looks out at those islands every evening." },
      },
      choices = {
        { text = "Will the Darkspear take them back?", next = "senjin_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senjin_back = {
      lines = { { id = "sb_default", text = "One day, when Vol'jin says the time be right, and Mon'ye will weave every warrior who goes a coat that makes Zalazane wet himself with fear. Until then the tide comes in, the tide goes out, and we wait the way trolls wait, which be patiently and with a grudge." } },
      choices = {
        { text = "Patience is wise. Strike when you're ready.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting is for cowards. Take them back now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    suggest = {
      lines = {
        { id = "sg_default", text = "Hmm, turn around for Mon'ye, slowly. You got the shoulders for something darker than what you wear, and a hood would suit you, because a little mystery never hurt anybody in Orgrimmar." },
        { id = "sg_warrior", when = { class = "WARRIOR" }, text = "Something with spikes, {class}, because you be the kind who wants the enemy to see you coming and think again. Mon'ye would put you in black iron with red trim, Warsong colors, and let them sing about you." },
        { id = "sg_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A long robe with a deep hood, {class}, and something that catches the light when you cast. Folk should look at your hands and not your face, because your hands be where the danger lives." },
        { id = "sg_tauren", when = { race = "Tauren" }, text = "Big and plain and good leather, the way your people like, and maybe a little paint on the shoulders. A tauren in fancy cloth looks like a kodo in a wedding dress, mon, and Mon'ye won't do that to you." },
      },
      choices = {
        { text = "And what does it cost?", next = "suggest_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    suggest_cost = {
      lines = { { id = "sc_default", text = "Less than you fear and more than you'd like, which be the honest price of anything worth having. Some folk spend more on looking good than on staying alive, and Mon'ye takes their coin and tells them to visit the smith after." } },
      choices = { { text = "Something else, Mon'ye.", next = "BACK" } },
    },
    witch = {
      lines = { { id = "wi_default", text = "Some did, and one old witch doctor told Mon'ye the loa would sour my weaving for selling a sacred thing. I asked Bwonsamdi myself, by way of a very long night and a very strong drink, and he didn't seem to mind, so here I be." } },
      choices = {
        { text = "Sacred things shouldn't be sold.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "A gift unused is a gift wasted.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    undead = {
      lines = { { id = "ud_default", text = "Mon'ye weaves armor, not skin, so the face underneath stays your own. But I can put you in the clothes you wore when you were breathing, if you remember them, and some Forsaken tell me that's a strange kind of comfort." } },
      choices = {
        { text = "I don't want to remember.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Maybe. I'll think about it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Darkspear girl from Sen'jin who learned the witch doctors' tricks and found a better use for them. That be all the story Mon'ye sells for free." } },
    advice = { { id = "tp_ad", text = "Dress for the fight you want, but armor for the fight you'll get." } },
    echo_isles = { { id = "tp_echo", next = "senjin_isles", text = "Our islands, mon, with a madman on them. Every Darkspear knows the name Zalazane." }, { id = "tp_echo2", text = "The Echo Isles be close enough to see from Sen'jin and too far to swim home to, which be the cruellest distance there is." } },
    _none = { { id = "tp_none", text = "Mon'ye knows cloth and steel and how they look, mon, and not much else." } },
  },
}
