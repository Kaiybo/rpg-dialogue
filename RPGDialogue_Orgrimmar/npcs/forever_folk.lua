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
    first = "An'drak is a seasoned orc hunter who stands in the Valley of Strength with a grey wolf called Evermore at his knee. He talked about the wolf more than about himself, and I think he preferred it that way.",
    third = "{name} met An'drak, an orc hunter in the Valley of Strength, and his wolf Evermore.",
  },

  greetings = {
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
        { text = "Stay with him to the end. He's earned that.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Let him rest, and find a younger hunting partner.", next = "BACK", fx = { align = { honor = -1 } } },
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
    first = "Gruga Bloodblade is a big Darkspear troll in the Hall of the Brave who sends Horde fighters to the old Darkspear Islands. He grinned the whole time we spoke, and I couldn't tell whether that was for the fight or for me.",
    third = "{name} met Gruga Bloodblade, the Darkspear battlemaster in Orgrimmar who sends the Horde to fight on the Darkspear Islands.",
  },

  greetings = {
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
        { text = "I hold the line. Nobody gives up ground.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fall back, wait, and strike where they're weak.", next = "BACK", fx = { align = { order = -1 } } },
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
  },

  topics = {
    echo_isles = { { id = "tp_echo", text = "The Echo Isles be our home now, off the Durotar coast, when Zalazane's not sitting on them. The Darkspear Islands be the old home, far over the sea, and both of them be worth fighting for." } },
    background = { { id = "tp_bg", text = "Gruga fought for the Darkspear before he fought for the Horde, and now he gets to do both. Not much more to it than that, mon." } },
    advice = { { id = "tp_ad", text = "Keep moving, keep your friends close, and never chase a human into the water. Gruga learned that last one the wet way." } },
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
    first = "Mon'ye is a Darkspear troll in the Cleft of Shadow who weaves magic over armor so it looks like something else entirely. She studied my gear the way a tailor studies a bad seam, and she was far too polite about it.",
    third = "{name} met Mon'ye, a Darkspear transmogrifier in Orgrimmar's Cleft of Shadow who changes how armor looks.",
  },

  greetings = {
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
        { text = "Let them see exactly what's coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Humble. Let them underestimate me.", next = "BACK", fx = { align = { honor = -1 } } },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "A Darkspear girl from Sen'jin who learned the witch doctors' tricks and found a better use for them. That be all the story Mon'ye sells for free." } },
    advice = { { id = "tp_ad", text = "Dress for the fight you want, but armor for the fight you'll get." } },
    _none = { { id = "tp_none", text = "Mon'ye knows cloth and steel and how they look, mon, and not much else." } },
  },
}
