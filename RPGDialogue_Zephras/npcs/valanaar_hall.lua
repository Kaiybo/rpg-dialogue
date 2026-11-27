-- Valanaar, Zephras Isle: the Hall of Arms, the Windshapers' construct work and the
-- Calmbreeze Inn's upstairs room. Quel'ana Quickgale (hunter trainer), Seena Skybreaker
-- (warrior trainer), Riaani Nightwind (Windshaper artisan), Alvarion Windfield (wounded
-- orchard keeper) and Melasa Fairmend (medic). Voice and sources: bibles/zep_valanaar_hall.md.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Quel'ana Quickgale: hunter trainer in the Hall of Arms, partially sighted.
-- Teaches young hunters to tame the isle's beasts.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_quelana", id = TODO_NPC("Quel'ana Quickgale"), name = "Quel'ana Quickgale", title = "Hunter Trainer",
  bible = "bibles/zep_valanaar_hall.md", role = "trainer", tier = "quest",
  communities = { "zephras_isle" }, temper = { "calm", "dry" }, values = { "craft", "duty" },
  notices = { "class", "pet", "race", "origin" },

  impression = {
    first = "He talks of taming a beast as a promise you make it.",
    third = "{name} met Quel'ana Quickgale, the partially sighted hunter trainer of Valanaar's Hall of Arms.",
  },

  greetings = {
    { id = "g_default", text = "I heard you before I saw you. Come in." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter's tread. Good; I've work for you." },
    { id = "g_taming", tags = { "news" }, when = { questActive = TODO_QUEST("Taming the Beast") }, text = "Well? Did it come to your hand, or did it run?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} is breathing easy and keeping close to your left side. That's a beast that trusts you, and you'd do well to deserve it." },
    { id = "n_rider", cat = "origin", when = { origin = "skyborne_banaethal_rider" },
      text = "You smell of Galestrider and old stone dust. One of the riders who went into the Ban'aethal ruins? Brave, or very lonely, or both." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", class = "HUNTER" },
      text = "A dwarf with a gun, by the smell of the powder. I've never heard anything so loud as the one I heard fired on the dock, and I've stood under a thunderstorm." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Quel'ana Quickgale, and I train the hunters who pass through this hall. Every season the isle's beasts get stranger and the people who can handle them get fewer, so if you've a hunter's instincts, I'll sharpen them until you can stay alive out there." },
        { id = "h_taming_done", tags = { "news" }, when = { questDone = TODO_QUEST("Taming the Beast") },
          text = "You've bonded with a beast of the isle, and that's no small thing. There's more to keeping a companion than taming it, though, so don't think the lesson's finished." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("Training the Beast") },
          text = "Go and learn how to train that companion properly. A tamed beast that doesn't know what you want of it is only a hungry animal following you about." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, which is most of what I do." },
        { id = "h_again2", text = "Go on. The hall's quiet for once." },
      },
      choices = {
        { text = "What does taming a beast involve?", next = "taming" },
        { text = "How did you lose your sight?", next = "eye" },
        { text = "What's happening to the isle's beasts?", next = "wilds" },
        { text = "Does anyone else in the hall help you, Quel'ana?", next = "kin" },
        { text = "Train me, Quel'ana.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Hunters where I'm from tame very different beasts.", next = "xoutsider", when = { class = "HUNTER", ["not"] = { race = "Skyborne" } } },
        { text = "I hunted the cliffs below Siroccas.", next = "xcliff", when = { origin = "skyborne_siroccas_cliff_hunter" } },
        { text = "I rode a Galestrider through Ban'aethal's ruins.", next = "xrider", when = { origin = "skyborne_banaethal_rider" } },
        { text = "What waits for a hunter once I leave the isle?", next = "hp", when = { class = "HUNTER" } },
        { text = "I'm not Skyborne, but I came to learn from you.", next = "hp_visit", when = { class = "HUNTER", ["not"] = { race = "Skyborne" } } },
        { text = "Farewell, Quel'ana.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "A great deal of ground that doesn't move under your feet, I'm told, and beasts none of us has ever heard breathe. The lessons won't change, though: the aspects you'll learn, the stings, the beast you keep fed and alive, and later, the trick of lying so still that death passes you over." },
        { id = "hp_tamed", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "You've bonded with a beast of the isle, so you'll carry a piece of Zephras with you wherever you go below. Keep it fed and keep it alive, and it will remember the winds for both of you." },
      },
      again = { { id = "hp_again", text = "What else? I'm listening." } },
      choices = {
        { text = "Which aspect should I learn first?", next = "hp_aspect" },
        { text = "How do I keep my companion's trust?", next = "hp_trust" },
        { text = "Will I ever come back to hunt here?", next = "hp_return" },
        { text = "Something else, Quel'ana.", next = "hello" },
      },
    },
    hp_aspect = {
      lines = { { id = "hpa_default", text = "The Monkey first, for it'll keep a vuldren's teeth out of you, and the Hawk once you're ready, for it puts the wind behind every arrow. I hunt by ear in the Monkey still, because a hunter who can't see well had better be hard to hit." } },
      choices = {
        { text = "I'll learn to fight from safety first.", next = "BACK", reply = "Then you'll last, and lasting is most of a hunter's skill.", fx = { align = { order = 1 } } },
        { text = "I'd rather strike hard and fast.", next = "BACK", reply = "Then strike, and keep your beast between you and what you strike.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_trust = {
      lines = { { id = "hpt_default", text = "Feed it what it would hunt for itself, and before it's hungry, and don't let it die for a mistake you could have avoided. Trust grows slowly in a beast and leaves it fast, and one that's been neglected too long will simply walk away from you one morning." } },
      choices = {
        { text = "I'll be worth its trust.", next = "BACK", reply = "I'll hear it, if you are. A trusting beast breathes easy beside its hunter.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_return = {
      lines = { { id = "hpr_default", text = "I hope so, and I hope the isle's still in one piece when you do. Whatever banner you choose below, come back and tell me what the beasts there sound like, because I'll never hear them myself." } },
      choices = {
        { text = "I'll come back and tell you everything.", next = "BACK", reply = "Then I'll listen for your step, and I'll know it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_visit = {
      lines = { { id = "hpv_default", text = "Then you've come a long way, and up, which is the stranger part. I'll teach you as I teach my own, but the beasts here don't know your kind, so they'll be more wary of you, not less, and you'll have to be twice as patient." } },
      choices = {
        { text = "Then I'll be twice as patient.", next = "BACK", reply = "Good. I'll hear whether you mean it.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taming = {
      lines = {
        { id = "ta_default", text = "Patience, mostly, and a willingness to be bitten. You find a beast of the isle, you let it see you're no threat and no meal, and if you're lucky and it's willing, it comes to your hand and stays there." },
        { id = "ta_nothunter", when = { ["not"] = { class = "HUNTER" } },
          text = "It's hunter's work, so you needn't learn it, but it's simple to say and hard to do. You let a wild thing see you're no threat and no meal, and if it's willing, it comes to your hand and stays." },
      },
      choices = {
        { text = "And then it's yours?", next = "bond" },
        { text = "Which beasts should I try to tame?", next = "which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    which = {
      lines = {
        { id = "wh_default", text = "Whatever will have you. I won't tell you which beast to choose, because the right one usually chooses you, but I'll tell you this: the ones that are losing themselves to the fading winds won't bond with anyone, so look for clear eyes and an easy breath." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bond = {
      big = true,
      lines = {
        { id = "bo_default", text = "Then you're its, as much as it's yours, and any hunter who forgets that loses the beast or loses a hand. I've known hunters who talk to their companions like family and hunters who treat them like a good bow, and both of them caught their supper." },
      },
      choices = {
        { text = "A companion is family. I'll treat it that way.", next = "BACK", reply = "Then your beast is lucky, and it'll know it before you do. I may not see it well, but I'll hear it purr.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "It's a weapon with teeth. I'll keep it sharp.", next = "BACK", reply = "Keep it sharp, then, and keep your fingers out of its mouth. A weapon with teeth can choose its own target.", fx = { affinity = -1, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye = {
      lines = {
        { id = "ey_default", text = "Slowly, over a good many years, and not in any way that makes a story worth telling at the inn. What it took from my eyes it gave to my ears, and I'd say I came out of the bargain a better hunter than I went in." },
      },
      choices = {
        { text = "How do you hunt by ear?", next = "eye2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye2 = {
      lines = {
        { id = "e2_default", text = "Everything that moves makes a sound, and everything that's afraid makes a different one. A vuldren that's turned dangerous breathes faster than a calm one, and I can hear that across a clearing, while most hunters couldn't even see it." },
      },
      choices = {
        { text = "Teach me to listen like that.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds = {
      lines = {
        { id = "wi_default", text = "They're losing themselves. The winds' magic kept the beasts of Zephras steady for longer than anyone remembers, and with it fading, some of them turn strange, docile things biting and hungry things coming right into the villages." },
      },
      choices = {
        { text = "Can anything be done for them?", next = "wilds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds2 = {
      lines = {
        { id = "w2_default", text = "Sometimes the kindest thing is to end it quickly, before a beast that's lost itself hurts something that hasn't. The druids say the great spirits of the isle feel it worst of all, and I believe them, because I've heard the ursera crying in the highlands at night." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "ki_default", text = "Quel'dora, who's family, works here in the hall with me, so you'll meet her sooner or later. She'll tell you I hunt better with one eye than most do with two, and I'll tell you she's being kind, and we'll both be a little right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xoutsider = {
      lines = {
        { id = "xo_default", text = "I'd imagine so, and I'd love to hear what's out there. Tell me, what's the hardest beast you've ever brought to your hand?" },
        { id = "xo_tauren", when = { race = "Tauren" },
          text = "I'd imagine so; the Windshapers say your plains are full of beasts the size of a house. Tell me, what's the hardest one you've ever brought to your hand?" },
      },
      choices = {
        { text = "A wolf that nearly took my arm.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I don't tame the hard ones. I shoot them.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    xrider = {
      lines = {
        { id = "xr_default", text = "Into the ruins, where nobody else would go. A Galestrider's a fine mount and a poor conversationalist, and I'd guess you came out of there with very good ears and very few friends. Did you find anything in the ruins worth the trouble?" },
      },
      choices = {
        { text = "Mostly things that wanted to eat me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Some things are better left where they fell.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    xcliff = {
      lines = {
        { id = "xc_default", text = "Then you'll have learned to shoot with the wind at your back, and you'll have to unlearn it, because the winds below the clouds won't help you. Siroccas had the best cliff hunters in the isles, and I'd like to think a few of them are still out there." },
      },
      choices = {
        { text = "I'd like to think so too.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Listen before you look. Your eyes tell you what's there, but your ears tell you what it means to do." } },
    two_orders = { { id = "tp_orders", text = "A beast doesn't care which order you belong to, and neither do I, in this hall." } },
    _none = { { id = "tp_none", text = "Not something I've heard of, and I hear most things." } },
  },
}

---------------------------------------------------------------------------
-- Seena Skybreaker: warrior trainer in the Hall of Arms. A shield-first
-- fighter; the Skybreaker Bulwark carries her family's name.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_seena", id = TODO_NPC("Seena Skybreaker"), name = "Seena Skybreaker", title = "Warrior Trainer",
  bible = "bibles/zep_valanaar_hall.md", role = "trainer", tier = "quest",
  communities = { "zephras_isle" }, temper = { "fierce", "wry" }, values = { "duty", "strength" },
  notices = { "class", "origin", "race" },

  impression = {
    first = "She laughs easily and hits harder than she laughs.",
    third = "{name} met Seena Skybreaker, Valanaar's warrior trainer, who teaches her students to stand in front of everyone else.",
  },

  greetings = {
    { id = "g_default", text = "Feet apart, chin down. That's how you walk into my hall." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "There's a warrior. Come to learn something, or come to show off?" },
    { id = "g_bulwark", tags = { "news" }, when = { questActive = TODO_QUEST("The Skybreaker Bulwark") }, text = "You know what I asked of you. Don't make me ask twice." },
  },

  notice = {
    { id = "n_shield", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a shield like you mean to use it on someone else's behalf. Good; that's the only reason to carry one." },
    { id = "n_pylon", cat = "origin", when = { origin = "skyborne_anvilas_pylon_guard" },
      text = "You stand like someone who's guarded a post nobody came to attack. Anvilas, was it? I'm sorry; that's the hardest kind of watch there is." },
    { id = "n_orc", cat = "race", when = { race = "Orc", class = "WARRIOR" },
      text = "An orc warrior. I've heard your people fight like a storm coming down off the mountain, and I'd dearly like to see whether that's true before you leave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_lorthuna", tags = { "news" }, when = { questDone = TODO_QUEST("Confront Lorthuna") },
          text = "They say you stood on the Rohashi Spires when Lorthuna fell. I heard the wind scream all the way down here when the Windlord struck her, and I've not slept well since, so I'll not ask how you sleep." },
        { id = "h_default", key = true, text = "Seena Skybreaker. I teach my warriors to hold still when everything in them wants to step back, because the ones who step back are the ones we carry home. Blademaster Ren up in Thendal teaches the same lesson, and we're both right, so you'd better listen to one of us." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Skybreaker Bulwark") },
          text = "You did right by the Bulwark, and by my family's name, and I'll not forget it. Come to me whenever you need training, and I'll make sure you're worth what you've done." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; I've recruits to bruise." },
        { id = "h_again2", text = "Speak up, friend, because the hall's loud tonight." },
      },
      choices = {
        { text = "What is the Skybreaker Bulwark?", next = "bulwark" },
        { text = "What makes a good warrior, in your eyes?", next = "front" },
        { text = "Who else trains in this hall?", next = "hall" },
        { text = "Who are your recruits?", next = "recruits" },
        { text = "Train me, Seena.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Where does a warrior go once Zephras is behind her?", next = "w_beyond", when = { class = "WARRIOR", race = "Skyborne", minLevel = 8 } },
        { text = "I guarded the pylons on Anvilas while they failed.", next = "xpylon", when = { origin = "skyborne_anvilas_pylon_guard" } },
        { text = "I trained for the Empyrean Blades.", next = "xblade", when = { origin = "skyborne_empyrean_recruit" } },
        { text = "How do your warriors fight compared to mine?", next = "xoutsider", when = { class = "WARRIOR", ["not"] = { race = "Skyborne" } } },
        { text = "Farewell, Seena.", next = "END" },
      },
    },
    w_beyond = {
      lines = {
        { id = "wb_default", text = "Wherever your banner sends you, and you'll find warrior trainers there who've never seen one of us, so stand in front and let them work it out. Whatever they call the stances, it's the same lesson I've given you: plant your feet and don't let the message reach them." },
        { id = "wb_horde", when = { faction = "Horde" }, text = "To Mulgore first, if the Earthen Ring has its way, and the tauren on Hunter Rise teach warriors who stand like hills. They'll send you to an orc in the Barrens for the shield, and he'll be the first orc you've ever argued with, so argue well." },
      },
      choices = {
        { text = "I'll make them remember the Skyborne.", next = "BACK", reply = "Make them remember a good warrior first. The rest will follow.", fx = { align = { honor = -1 } } },
        { text = "I'll stand in front and let my shield speak.", next = "BACK", reply = "That's the Skybreaker way. I'll hear about it, one way or another.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark = {
      lines = {
        { id = "bu_default", text = "A shield with my family's name on it, and it's seen more of Zephras's trouble than I have. That's all I'll say about it in front of the recruits, because they'll want stories, and I've drills to run." },
        { id = "bu_done", when = { questDone = TODO_QUEST("The Skybreaker Bulwark") },
          text = "You know what it is, since you've had your hands on it. A shield with my family's name on it, and it's seen more of Zephras's trouble than I have, and thanks to you it'll see more yet." },
      },
      choices = {
        { text = "Why does a name on a shield matter so much?", next = "bulwark2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark2 = {
      lines = {
        { id = "b2_default", text = "Because a shield's the one thing a warrior carries for someone else's sake. A sword is for you; a shield is for whoever's standing behind you, and every Skybreaker who's held that one stood in front of somebody." },
      },
      choices = {
        { text = "And you mean to teach that?", next = "front" },
        { text = "Something else.", next = "BACK" },
      },
    },
    front = {
      big = true,
      lines = {
        { id = "fr_default", text = "Someone who stands in front, and doesn't move. There are warriors who think the job's winning the fight and warriors who think it's keeping the people behind them alive, and on a good day those are the same thing, but you'll have bad days." },
      },
      choices = {
        { text = "Do you ever flinch, Seena?", next = "fear" },
        { text = "Keep the people behind me alive, whatever it costs.", next = "BACK", reply = "Good, and that's the harder answer, so remember it on the bad days. They'll come.", fx = { affinity = 2, align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "Win the fight. The dead can't be protected.", next = "BACK", reply = "The dead can't be protected, no, but neither can anyone behind a warrior who's chasing a win. Think on it.", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = {
        { id = "fe_default", text = "Every single time, somewhere behind my ribs. The trick isn't to stop feeling it; it's to make sure the message never reaches your feet, and that takes years of drill and one or two very bad days." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      lines = {
        { id = "re_default", text = "Young ones fresh from their coming of age, Peacekeepers who want to be better than they are, and lately refugees from the fallen places who'd rather learn to fight than wait to be robbed again. That last lot are the hungriest, and the quickest to learn." },
      },
      choices = {
        { text = "Will they go below the clouds too?", next = "recruits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits2 = {
      lines = {
        { id = "r2_default", text = "Some will, with whichever order will have them, and the rest will stay to hold what's left of the isle. I'll stay, myself; someone has to keep teaching, and I'd hate to leave the Bulwark without a Skybreaker behind it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpylon = {
      lines = {
        { id = "xp_default", text = "Then you stood the worst watch a warrior can stand, guarding something nobody could attack and nobody could save. Don't let anyone tell you it was wasted; you were there when it mattered, even if there was nothing to hit." },
      },
      choices = {
        { text = "It felt wasted.", next = "BACK", fx = { affinity = 1 } },
        { text = "Thank you, Seena.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    hall = {
      lines = {
        { id = "ha_default", text = "Quel'ana trains the hunters and hears everything, so mind what you say about him, and Quel'dora keeps the place from falling apart around all of us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xblade = {
      lines = {
        { id = "xb_default", text = "Then you'll have drilled until your arms shook, and somebody will have told you the Blades guarded the Shal'nan for longer than anyone can remember without losing him. They lost him anyway, in the end, and that's the lesson I'd have you take from them: guard well, and never think the guarding's done." },
      },
      choices = {
        { text = "I'll remember it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xoutsider = {
      lines = {
        { id = "xo_default", text = "Lighter, I'd guess. We've ten thousand years of fighting on narrow paths at the edges of cliffs, so we're quick and we don't overreach, because overreaching up here means falling. Come and spar with my recruits and show me what you do differently." },
      },
      choices = {
        { text = "I'll take you up on that.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Carry your shield for someone else. Carry your sword for yourself. Don't mix them up." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes and lightning. Close the distance fast, before they can call it down on you." } },
    _none = { { id = "tp_none", text = "Not a warrior's question. Ask someone who sits down for a living." } },
  },
}

---------------------------------------------------------------------------
-- Riaani Nightwind: Windshaper artisan in Valanaar who keeps the old wind
-- constructs running. Absorbed in his work; wary of the High Order.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_riaani", id = TODO_NPC("Riaani Nightwind"), name = "Riaani Nightwind", title = "Windshaper Artisan",
  bible = "bibles/zep_valanaar_hall.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "quiet", "earnest" }, values = { "craft", "devout" },
  notices = { "craft", "kin", "race" },

  impression = {
    first = "He treats every bolt as something the spirits left in his keeping.",
    third = "{name} met Riaani Nightwind, a Windshaper artisan in Valanaar who repairs the wind constructs the spirits left behind.",
  },

  greetings = {
    { id = "g_default", text = "<Riaani doesn't look up from the open panel of the wind construct.>" },
    { id = "g_again", when = { metBefore = true }, text = "Oh, it's you. Hold this, would you? No, the other end." },
    { id = "g_ho", when = { race = "Skyborne", faction = "Alliance" }, text = "High Order. Please keep your hands off the construct." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "You're carrying tools I've never seen, all gears and springs. Is that how your people build things that move, without any spirit in them at all?" },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I'm told your people build machines that walk and fly, and I'd give a year's windstones to look inside one." },
    { id = "n_ws", cat = "kin", when = { race = "Skyborne", faction = "Horde" },
      text = "One of ours. If you've a steady hand, the order always needs more people who can tell a good part from a broken one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Forgive me, I'm in the middle of something. I'm Riaani, of the Windshapers, and I look after the wind constructs, or what's left of them, because the spirits gave them to us and somebody has to keep them running now the spirits aren't here to do it." },
        { id = "h_broken1", tags = { "news" }, when = { questDone = TODO_QUEST("The Broken Construct") },
          text = "You came to help with the construct. Good; I can use another pair of hands, especially ones that don't shake around old magic." },
        { id = "h_broken3", tags = { "news" }, when = { questActive = TODO_QUEST("The Broken Construct (3)") },
          text = "It's nearly whole again, but nearly isn't good enough for a thing the spirits built. Go on; I'll keep it steady until you're back." },
      },
      again = {
        { id = "h_again", text = "What else? Pass me that while you ask." },
        { id = "h_again2", text = "Go on. My hands are busy, but my ears aren't." },
      },
      choices = {
        { text = "What did this construct do?", next = "construct" },
        { text = "Why do the Windshapers guard the constructs?", next = "custody" },
        { text = "Didn't a magister take parts from one?", next = "belathaan" },
        { text = "Is Hanaa Nightwind your kin?", next = "hanaa" },
        { text = "There's an old construct wandering Windfield Orchard.", next = "orchard" },
        { text = "How do you build anything without gears?", next = "xeng", when = { profession = { "Engineering" } } },
        { text = "I'm High Order. Can I help with the construct?", next = "xho", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "Winds guide you, Riaani.", next = "END" },
      },
    },
    construct = {
      lines = {
        { id = "co_default", text = "It trawled Windsong Lake for fish, back and forth every morning, and half of Valanaar ate what it brought in. Then the pylons failed, and it went into the lake with a good many others, and now it sits here in pieces while I try to remember how the pieces fit." },
      },
      choices = {
        { text = "Can it be fixed?", next = "parts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parts = {
      lines = {
        { id = "pa_default", text = "With enough parts, yes, and that's the trouble, because nobody's made new ones since the spirits left. We have to take what we need from the constructs that are past saving, or fish the pieces up out of the lake, and every part I use is a part I'll never get back." },
      },
      choices = {
        { text = "Then why not let the old ones go?", next = "parts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parts2 = {
      big = true,
      lines = {
        { id = "p2_default", text = "Because they're gifts, and you don't throw a gift into the lake because it's grown inconvenient. Some of my own order say we should strip the broken ones and be done with it, and some say every one should be mended, whatever it costs, and I've never been able to choose." },
      },
      choices = {
        { text = "Mend every one you can. They're the spirits' gifts.", next = "BACK", reply = "That's what my heart says, and it's good to hear it said by someone else. I'll keep my tools out.", fx = { affinity = 2, align = { order = 1 }, trait = { pious = 1 } } },
        { text = "Strip the broken ones. Keep the working ones alive.", next = "BACK", reply = "That's what my head says, most mornings, and I'll not pretend it's wrong. It still feels like betrayal.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    custody = {
      lines = {
        { id = "cu_default", text = "Because the spirits gave them into our keeping, and they always have been the Windshapers' to tend. The High Order wants to open them up and see what makes them move, and I understand the wish, but you don't learn how a heart works by cutting it out of somebody." },
      },
      choices = {
        { text = "Should the High Order be kept away?", next = "custody2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    custody2 = {
      big = true,
      lines = {
        { id = "c2_default", text = "My order says yes, and most days I agree. But the High Order are shen'dorei too, and their magisters know things about the arcane that we don't, and I sometimes wonder whether a construct would rather be studied than rust." },
      },
      choices = {
        { text = "Keep them out. Your oath comes first.", next = "BACK", reply = "Thank you, and I'll tell the others you said so. The oath is all we have left of them.", fx = { affinity = 1, align = { honor = 1 }, learn = { "two_orders" } } },
        { text = "Share them. Pride won't mend a single bolt.", next = "BACK", reply = "Pride, is it? Perhaps, and perhaps not, but I'll think on it. Winds know the one by the east stair could use the help.", fx = { affinity = 1, align = { honor = -1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    belathaan = {
      lines = {
        { id = "be_default", text = "Belathaan Brightwish, and yes, he did, and Ayessa sent someone after him to make it very clear he shouldn't do it again. Then Lorthuna had him killed on the road, and the High Order has been blaming us for it ever since." },
      },
      choices = {
        { text = "Do you think the Windshapers share the blame?", next = "belathaan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belathaan2 = {
      lines = {
        { id = "b2_default", text = "I think we frightened a man who'd done something foolish, and someone far worse finished him. His mother was one of us, you know. I didn't wish him dead, only away from my constructs, and I'm sorry those turned out to be so close together." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    orchard = {
      lines = {
        { id = "or_default", text = "The cyclone construct? I've heard of it, and I've heard it drove off the bandits who hurt Alvarion Windfield, so there's more wind in it than anyone thought. If his wife Aamelia wants a Windshaper to look it over, she's only to ask; it's not every day one wakes on its own." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hanaa = {
      lines = {
        { id = "ha_default", text = "Family, yes. She keeps her post on the road through Thendal Grove, and she'd tell you I spend more time with constructs than with people. She'd be right, but constructs don't ask me when I'm going to visit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xe_default", text = "We don't build them, that's the thing; the spirits did, and we only keep them going. There's a little of the wind inside each one, and when it fades the thing simply stops. Do your machines run without anything inside them at all?" },
      },
      choices = {
        { text = "Just gears, springs and a lot of swearing.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "They run on cleverness. No spirits required.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    xho = {
      lines = {
        { id = "xh_default", text = "You can help by passing me tools and keeping your spells to yourself, which I'll admit is more than I expected you to offer. I'm not angry with you; I'm tired of having to guard a broken thing from the people who ought to be helping mend it." },
      },
      choices = {
        { text = "Then I'll pass you tools.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the constructs, and a little about the people who argue over them. Ask." } },
    advice = { { id = "tp_ad", text = "If you find an old part in the grass or the lake, don't sell it. Bring it to a Windshaper." } },
    two_orders = { { id = "tp_orders", text = "They'd take the constructs apart to learn; we'd keep them whole to honor them. Neither of us has made a new one.", next = "custody" } },
    windstones = { { id = "tp_stones", text = "A construct with its wind fading will drink a windstone dry in a week. We can't keep that up for long." } },
    _none = { { id = "tp_none", text = "Hm? Sorry, I wasn't listening. No, I don't know." } },
  },
}

---------------------------------------------------------------------------
-- Alvarion Windfield: keeps Windfield Orchard with his wife Aamelia; lying
-- upstairs at the Calmbreeze Inn, badly wounded by bandits.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_alvarion", id = TODO_NPC("Alvarion Windfield"), name = "Alvarion Windfield",
  bible = "bibles/zep_valanaar_hall.md", role = "farmer", tier = "quest",
  communities = { "zephras_isle" }, temper = { "wry", "warm" }, values = { "family", "honest" },
  notices = { "class", "race" },

  impression = {
    first = "Badly wounded, he still makes jokes about his apples.",
    third = "{name} met Alvarion Windfield, keeper of Windfield Orchard, recovering upstairs at the Calmbreeze Inn after bandits nearly killed him.",
  },

  greetings = {
    { id = "g_default", text = "<Alvarion winces as he turns his head toward you, bandages showing under his shirt.>" },
    { id = "g_again", when = { metBefore = true }, text = "You again, and no, I'm not getting up." },
    { id = "g_news", tags = { "news" }, when = { questActive = TODO_QUEST("Deliver the News") }, text = "You've come from the orchard? From Aamelia? Tell me, quickly." },
  },

  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } },
      text = "You've a healer's look about you. Don't trouble yourself; Melasa the medic has done all that can be done, and the rest is lying here being bored." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Winds above, you're a big one. Mind the floorboards up here; Donaal the innkeeper swears they'll hold, but he's never had to test it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alvarion Windfield, of Windfield Orchard, though you'd not know it to look at me. Aamelia and I keep the orchard down in the lowlands, or we did, until some of the island's newer residents decided they'd rather take our harvest than grow their own." },
        { id = "h_tithe", tags = { "news" }, when = { questActive = TODO_QUEST("Blood Tithe") },
          text = "They wanted a share of the orchard, and when I said no, they took their tithe out of me instead. Go and collect it back from them, would you? I'd go myself, but I can't feel my left foot." },
        { id = "h_tithedone", tags = { "news" }, when = { questDone = TODO_QUEST("Blood Tithe") },
          text = "You paid them back for me, then. I can't say I feel better, exactly, but I sleep a little easier knowing they won't be at Aamelia's door tonight." },
        { id = "h_newsdone", when = { questDone = TODO_QUEST("Deliver the News") },
          text = "Thank you for coming all this way with word from Aamelia. Knowing she's safe has done more for me than any bandage." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be, as you can see." },
        { id = "h_again2", text = "Go on, talk to me. It beats counting the ceiling beams." },
      },
      choices = {
        { text = "Who did this to you?", next = "wounds" },
        { text = "Tell me about the orchard.", next = "orchard" },
        { text = "What's this I hear about a construct in your fields?", next = "construct" },
        { text = "How is Aamelia?", next = "aamelia" },
        { text = "I could pray over your wounds.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Rest well, Alvarion.", next = "END" },
      },
    },
    wounds = {
      lines = {
        { id = "wo_default", text = "Bandits. Refugees, most of them, from the islands that fell, and I'd feel sorry for them if they hadn't stuck a blade between my ribs. They camp out in the lowlands now and help themselves to whatever they like, and my orchard is very close to whatever they like." },
      },
      choices = {
        { text = "What should be done about them?", next = "bandits" },
        { text = "Who's been looking after you?", next = "carers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bandits = {
      big = true,
      lines = {
        { id = "ba_default", text = "Aamelia says they've lost everything and we should feed them, and I say they've taken everything and we should hang them, and we've had that argument every night since. Lying here, I've had a lot of time to wonder which of us is right." },
      },
      choices = {
        { text = "Feed the hungry ones. Most of them only want to live.", next = "BACK", reply = "That's Aamelia's side, and I'll tell her you took it. She'll be insufferable for a week.", fx = { affinity = 1, align = { light = 1 }, trait = { generous = 1 } } },
        { text = "They nearly killed you. Make them answer for it.", next = "BACK", reply = "That's my side, and I'll tell Aamelia you took it. She'll pretend not to hear.", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orchard = {
      lines = {
        { id = "or_default", text = "Stormapples, mostly, the Red Delicious kind, and berries along the hedges. Nyalah the cook buys our apples for her kitchen, and I'll tell you that's the proudest thing about our lives, that a cook that good thinks we grow something worth eating." },
      },
      choices = {
        { text = "What else does the orchard give you?", next = "flutterfly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flutterfly = {
      lines = {
        { id = "fl_default", text = "Flutterflies, in clouds, all summer. My mother used to dust babies with flutterfly powder to keep them from getting a rash, and I've never found any other use for the stuff, so if you think of one, you can have all you can carry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    construct = {
      lines = {
        { id = "cn_default", text = "The old cyclone construct? It's been wandering our fields for decades, since about when the wind spirits left. I've always thought it used to haul harvests to market, or tend livestock before the land was an orchard, though that might have been a thousand years ago." },
      },
      choices = {
        { text = "Is it dangerous?", next = "construct2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    construct2 = {
      lines = {
        { id = "c2_default", text = "We always said no, and mostly ignored it. Then the bandits came, and it woke up and drove them off, and then went back to standing about as if nothing had happened, and Aamelia's wanted a Windshaper to look at it ever since. I can't say I blame her." },
      },
      choices = {
        { text = "It sounds like it was protecting you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aamelia = {
      lines = {
        { id = "am_default", text = "Stubborn, brave, and still at the orchard, because somebody has to be and I can't. She'd tell you she's fine, and she'd be lying, and I'd tell you I'm fine, and I'd be lying too, so we're well matched." },
      },
      choices = {
        { text = "Aamelia asked me to bring you word.", next = "news", when = { questActive = TODO_QUEST("Deliver the News") } },
        { text = "Will you go back to the orchard?", next = "future" },
        { text = "I'll look in on her if I pass that way.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carers = {
      lines = {
        { id = "ca_default", text = "Melasa Fairmend, who stitched me up and scolds me twice a day for moving, and Donaal, who brings me soup and complains about the stairs. Between them I'm in danger of being looked after to death." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = {
        { id = "nw_default", text = "She's safe? And the construct drove them off on its own, and she wants a Windshaper to look at it before it does anything else surprising? Winds above, that's the most sensible thing anyone's said since I was carried up here, and I'll tell her so myself when I can walk." },
      },
      choices = {
        { text = "She sends her love, too.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    future = {
      lines = {
        { id = "fu_default", text = "As soon as Melasa lets me stand, and probably a day or two before. The trees don't care about bandits or cults or what the orders are quarrelling about this week; they need pruning all the same. What would you do, in my place?" },
      },
      choices = {
        { text = "Go back. It's your home.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Wait until the lowlands are safe.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "A priest. The only priests I ever knew wore grey and served Lorthuna, so you'll understand why I flinched. But you've a kind face, and Melasa says I'll take any help I can get, so go on, pray if you like; it can't hurt more than the bandits did." },
      },
      choices = {
        { text = "(Pray over his wounds.)", next = "BACK", fx = { affinity = 3, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Don't walk the lowlands alone after dark, and if a giant construct starts moving, let it." } },
    windstones = { { id = "tp_stones", text = "That's what the bandits wanted, mostly, windstones and apples. I don't know what they wanted the apples for." } },
    _none = { { id = "tp_none", text = "I grow apples, friend. Ask someone who's allowed out of bed." } },
  },
}

---------------------------------------------------------------------------
-- Melasa Fairmend: medic and first aid trainer in Valanaar. Bandages the
-- wounded the isle keeps sending her.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_melasa", id = TODO_NPC("Melasa Fairmend"), name = "Melasa Fairmend", title = "Medic",
  bible = "bibles/zep_valanaar_hall.md", role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "brisk", "warm" }, values = { "kind", "duty" },
  notices = { "craft", "class" },

  impression = {
    first = "She is brisk, kind and too tired to be gentle about it.",
    third = "{name} met Melasa Fairmend, Valanaar's medic, who teaches first aid to anyone who'll learn it.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good, you're back, and walking on your own. Sit, and let's see what you've learned since." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll teach you, since nobody should bleed for want of knowing, but I'll not chat." },
    { id = "g_default", text = "Gale's greetings. Are you hurt, or here to learn?" },
    { id = "g_hurt", when = { durability = { max = 0.20 } }, text = "Winds above, you look like you've rolled down a hill. Sit." },
  },

  notice = {
    { id = "n_fa", cat = "craft", when = { profession = { "First Aid" } },
      text = "You've bandaged people before; I can see it in how you hold your hands. Good. Zephras could use a hundred more like you." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, from below the clouds. I don't know what to make of your kind of healing, but if it closes wounds, I'll not argue with it." },
  },

  start = "hello",
  nodes = {
    mel_alv1 = {
      lines = {
        { id = "mel_alv1_1", text = "He is, because he won't stay in bed, and an orchard man with a wound in his side has no business up a ladder. Aamelia ties him to the bedpost with a sheet when she goes to market, I'm told, and I don't ask whether that's a joke." },
      },
      choices = {
        { text = "Will he mend?", next = "mel_alv2" },
        { text = "Something else, Melasa.", next = "BACK" },
      },
    },
    mel_alv2 = {
      lines = {
        { id = "mel_alv2_1", text = "He will, if he'll let it, and he's let it a little more since the bandits were dealt with. Anger tears at stitches as surely as a ladder does, and he was carrying a great deal of it." },
      },
      choices = {
        { text = "Then rest is the medicine.", next = "mel_alv3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    mel_alv3 = {
      lines = {
        { id = "mel_alv3_1", text = "Rest, and someone else picking his apples for a season, which is the part he can't bear. If you're in Windfield Orchard, tell him Melasa says the trees will wait, and watch his face when you do." },
      },
      choices = {
        { text = "I'll tell him. Something else.", next = "BACK" },
      },
    },
    mel_lin1 = {
      lines = {
        { id = "mel_lin1_1", text = "Othesia Evengale sells me her offcuts, and every refugee who comes in off the fallen places gives me whatever cloth they've carried. I wash it and boil it and cut it into strips, and it all ends up wrapped round somebody's arm." },
      },
      choices = {
        { text = "Refugees give it freely?", next = "mel_lin2" },
        { text = "I've cloth to spare for your bandages.", next = "mel_lin2", when = { profession = "Tailoring" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mel_lin2 = {
      lines = {
        { id = "mel_lin2_1", text = "More freely than you'd think, because they've seen what happens when there isn't any. A woman from Ban'aethal gave me her wedding shawl last month, and I've kept it folded in the drawer and not had the heart to cut it." },
      },
      choices = {
        { text = "Keep it there. Something else.", next = "BACK" },
      },
    },
    -- Deeds pass: the player keeps dying.
    dd_deaths = {
      lines = { { id = "dd_default", text = "And I'm glad of it, but don't lean on it. Every time you come back you're a little more careless, and careless people are the ones who end up on my table with a wound the spirits can't reach in time. Learn to bind your own, and you'll need them less." } },
      choices = {
        { text = "A healer must learn properly, one stitch at a time.", next = "BACK", reply = "Exactly so, and that's why my students practise on pig hide before they touch a person.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bandage it quick and move on; nobody checks the stitching.", next = "BACK", reply = "I check it, when they come back to me with it festering. Do it properly.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then teach me what you can.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_tithe", when = { questDone = TODO_QUEST("Blood Tithe") },
          text = "Alvarion has been mending faster since you settled things with the bandits who cut him; anger is a poor poultice, and you took it off him. I don't approve of revenge, but I'll not argue with the results." },
        { id = "h_dd_deaths", when = { deaths = { min = 5 } },
          text = "You've come back from the spirit healer more than once, haven't you? It mends the body well enough, but it doesn't teach you to carry bandages, and that's my job." },
        { id = "h_default", key = true, text = "Melasa Fairmend. I teach first aid, which on this isle lately means teaching people how to keep their friends alive until somebody better can get to them. Linen, a steady hand and a cool head are most of it." },
      },
      again = {
        { id = "h_again", text = "What else? I've a few moments before the next one comes in." },
        { id = "h_again2", text = "Ask; I can roll bandages and talk." },
      },
      choices = {
        { text = "The spirit healer keeps sending me back.", next = "dd_deaths", when = { deaths = { min = 5 } } },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Who have you been patching up lately?", next = "patients" },
        { text = "How do your people heal, without priests?", next = "healing" },
        { text = "What should I always carry?", next = "kit" },
        { text = "I've bandaged a few people myself.", next = "xfa", when = { profession = { "First Aid" } } },
        { text = "Alvarion Windfield seems to be your hardest case.", next = "mel_alv1" },
        { text = "Where do you get your linen?", next = "mel_lin1" },
        { text = "Farewell, Melasa.", next = "END" },
      },
    },
    kit = {
      lines = {
        { id = "ki_default", text = "Clean linen, more than you think you need, and something to tie it with. Everything else is a luxury, but I've seen people die for want of a strip of cloth, and I won't have that happen to anyone I've taught." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfa = {
      lines = {
        { id = "xf_default", text = "I can tell. Then you'll know the worst part isn't the blood, it's the waiting afterward, sitting beside someone and not knowing. If you're ever passing through Valanaar with a spare afternoon, I could use the help." },
      },
      choices = {
        { text = "I'll come when I can.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patients = {
      lines = {
        { id = "pa_default", text = "Peacekeepers with cult burns, refugees with feet worn raw from walking off the fallen places, and Alvarion Windfield upstairs at the inn, who has no business being alive and keeps telling me jokes about it. I'd like one quiet week, but I don't expect to get it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    healing = {
      lines = {
        { id = "he_default", text = "The Windshapers can work wonders with the elements, and the druids with what grows, but there aren't enough of either to go round. So most of us are healed by people like me, with linen and herbs and stubbornness, and I've come to think that's no bad thing." },
      },
      choices = {
        { text = "Why no bad thing?", next = "healing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    healing2 = {
      big = true,
      lines = {
        { id = "h2_default", text = "Because a bandage doesn't depend on anyone answering. We leaned on the spirits for everything once, and look where that left us, so I'd rather every child on the isle knew how to stop a bleed than wait for a miracle." },
      },
      choices = {
        { text = "You're right. I'd rather know a knot than pray for one.", next = "BACK", reply = "Good, then you'll make a fine medic. Sit down and I'll show you a proper knot.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Some wounds need more than linen. Don't dismiss the gifts.", next = "BACK", reply = "I'll not dismiss them, but I'll not wait on them either. Learn the linen first, child.", fx = { affinity = -1, align = { order = -1 }, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Pressure first, questions after. You'd be amazed how many people get that the wrong way round." } },
    _none = { { id = "tp_none", text = "I wouldn't know. If it isn't bleeding, it isn't my business." } },
  },
}

---------------------------------------------------------------------------
-- Anathamaas Aetherwind: mage trainer of the High Order in Valanaar. (Wiki:
-- trainer, High Order.) Courteous, lofty, sure magic is the isle's future.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_anathamaas", id = TODO_NPC("Anathamaas Aetherwind"), name = "Anathamaas Aetherwind", title = "Mage Trainer",
  role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "proud", "measured" }, values = { "knowledge", "ambition" },
  notices = { "class", "race" },

  impression = {
    first = "He speaks as if every sentence were a lecture he had polished in advance.",
    third = "{name} met Anathamaas Aetherwind, who trains mages for the High Order in Valanaar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my diligent student returns. I have prepared today's lesson with you particularly in mind." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I am bound by duty to instruct you, though not, I think, to enjoy it." },
    { id = "g_default", text = "Winds' tidings. If you have come to learn, you have come to the right hall." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, a student. Good, the High Order can never have too many." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A Windshaper's pupil, by the look of you. You needn't glare; I hold nothing against you, only against your teachers' habit of begging." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Anathamaas Aetherwind of the High Order, and I teach the arcane to those with the wit for it. Our forebears were Highborne, and I see no reason their children should forget what they knew." },
      },
      again = {
        { id = "h_again", text = "Another question? Good. Questions are the beginning of mastery." },
        { id = "h_again2", text = "Go on. I have time for a curious mind." },
      },
      choices = {
        { text = "True mastery comes from study, not from shortcuts.", next = "BACK", reply = "A sentence I would have written myself, had you not said it first.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Borrow a stronger mage's spell and call it your own.", next = "BACK", reply = "The High Order has a word for such students, and the word is not 'magister'.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "What does the High Order want?", next = "order" },
        { text = "You don't think much of the Windshapers.", next = "windshapers" },
        { text = "Where do I start with the arcane?", next = "xmage", when = { class = "MAGE" } },
        { text = "What became of the Highborne of Eldre'Thalas?", next = "past" },
        { text = "Tell me about the Kirin Tor.", next = "kirin" },
        { text = "They say arcane talent is growing rarer on the isle.", next = "decline" },
        { text = "I've chosen the Windshapers and the Horde.", next = "xhorde", when = { race = "Skyborne", faction = "Horde" } },
        { text = "I feel the ley lines under this floor.", next = "xley", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "I learned my spells far from Zephras.", next = "xoutmage", when = { class = "MAGE", ["not"] = { race = "Skyborne" } } },
        { text = "Winds be with you, Anathamaas.", next = "END" },
      },
    },
    order = {
      lines = { { id = "or_default", text = "Knowledge and power, which are the same thing seen from two sides. The ley lines still run beneath Zephras, and if we learn to read them properly, we need never again wait on a spirit's favour to keep this isle in the sky." } },
      choices = {
        { text = "And if the magic is what's failing?", next = "order2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    order2 = {
      big = true,
      lines = { { id = "o2_default", text = "Then it must be mended by those who understand it, not by those who pray at it. Falorne Fallwind would put it more sharply, but I find most people come round to us once the pylons start to flicker." } },
      choices = {
        { text = "You're right. Mastery beats begging.", next = "BACK", reply = "Well said. You may yet find a place in the High Order.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "That's the same pride that ruined the Highborne.", next = "BACK", reply = "You've been listening to Ventaari. Pride ruined them, yes, but ignorance would have ruined them faster.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    windshapers = {
      lines = { { id = "ws_default", text = "I think a great deal of them, as people. It is their notion that we owe the spirits a debt that I cannot abide, since the spirits left us of their own accord and we survived without them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmage = {
      lines = { { id = "xm_default", text = "With patience and a quiet room. The arcane rewards precision and punishes haste, and I have seen more than one eager student singe their own eyebrows trying to skip a lesson." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "pa_default", text = "A long and unflattering story. Prince Tortheldrin drew power from the Twisting Nether through crystal pylons, and when the Shal'nan's followers opposed him, he purged them, and the survivors fled west from Eldre'narr." } },
      choices = {
        { text = "So your ancestors rebelled against a Highborne prince?", next = "past2", fx = { learn = { "shal_nan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past2 = {
      lines = { { id = "p2_default", text = "They did, magisters among them, and I would remind the Windshapers of it when they call us the prince's heirs. Our forebears fled the same purge as theirs, and the wind spirits sheltered all of them alike." } },
      choices = {
        { text = "Then what was Tortheldrin's real crime?", next = "past3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past3 = {
      big = true,
      lines = { { id = "p3_default", text = "That is the question every student of mine must answer. I hold that his crime was cruelty, not curiosity, though there are those in this very hall who say the power itself was the poison." } },
      choices = {
        { text = "Power drawn like that is tainted, whoever holds it.", next = "BACK", reply = "A principled answer. I disagree, but I respect that you said it to my face.", fx = { align = { honor = 1 } } },
        { text = "Knowledge is only a tool. The fault lies in the hand.", next = "BACK", reply = "Precisely. Remember that when someone tells you to fear what you study.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kirin = {
      lines = { { id = "ki_default", text = "The mages of Dalaran, who answered when we called. Ansirem Runeweaver stood with us against Lorthuna's cultists, and it was through the Kirin Tor that the High Order came to the Alliance and to the Sky Enclave." } },
      choices = {
        { text = "Do you trust them?", next = "kirin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kirin2 = {
      lines = { { id = "k2_default", text = "I trust that they want what we know, and that we want what they know, which is a sounder footing than affection. Elaadrin Evengale handles the courtesies, and I am content to handle the lessons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    decline = {
      lines = { { id = "de_default", text = "They do say it, and I will not pretend I haven't seen fewer gifted children in recent years. Yet the ley lines themselves break the surface more often than ever, which tells me the power has not gone, only our grasp on it." } },
      choices = {
        { text = "Or perhaps the isle is telling you something.", next = "decline2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    decline2 = {
      lines = { { id = "d2_default", text = "The isle is rock and wind, and rock does not speak. I leave omens to Ventaari and the Windshapers; I would rather find the cause and correct it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhorde = {
      lines = { { id = "xh_default", text = "So I see, and I won't lecture you for it, though I am tempted. The Windshapers will teach you reverence, and I hope someone in Mulgore teaches you to ask questions as well." } },
      choices = {
        { text = "I'll ask plenty. Of the spirits, too.", next = "BACK", reply = "Then write down their answers, if they give any. I should very much like to read them.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xley = {
      lines = { { id = "xl_default", text = "Good. That sense is rarer than it was, so guard it and train it. Most students feel only a hum; the best can tell you which way the line runs and how strongly, and that is where the High Order's work begins." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xoutmage = {
      lines = { { id = "xo_default", text = "So I hear in your phrasing; you shape the words more bluntly than we do. Your teachers are not wrong, merely young, and I mean that as the kindest thing a shen'dorei can say of anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "The High Order studies; the Windshapers pray. I leave you to judge which keeps an isle aloft." } },
    shal_nan = { { id = "tp_shal", text = "The Shal'nan led our ancestors out of Eldre'Thalas and then stepped down. A noble gesture, though it left us a great many councils." } },
    _none = { { id = "tp_none", text = "That is outside my study. The library of the High Order may serve you better than I can." } },
  },
}

---------------------------------------------------------------------------
-- Halavuul Cragwind: mining trainer, Valanaar. (Wiki: trainer, sells picks.)
-- Earthy for a Skyborne: worries about digging into an island that floats.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_halavuul", id = TODO_NPC("Halavuul Cragwind"), name = "Halavuul Cragwind", title = "Mining Trainer",
  role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "dry", "careful" }, values = { "craft", "prudence" },
  notices = { "craft", "race" },

  impression = {
    first = "There's rock dust in the creases of his hands that no washing will ever get out.",
    third = "{name} met Halavuul Cragwind, who teaches mining in Valanaar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you back with all your fingers. That tells me you listened about the pick." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll show you where to swing, and then you can show yourself the door." },
    { id = "g_default", text = "Gale's greetings. You'll want a pick, I expect, and a lesson in where not to swing it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've heard your people dig whole cities out of mountains. Mind you don't try it here, because this mountain is floating." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Halavuul Cragwind, and I teach mining, which is an odd trade for a people who live in the sky. Still, there's copper in Zephras and tools need making, so somebody has to know how to get it out." },
      },
      again = { { id = "h_again", text = "What else? Mind the dust." } },
      choices = {
        { text = "A miner should only dig the seams that are rightfully theirs.", next = "BACK", reply = "That's the old rule, and the mountain has its own ways of enforcing it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If a seam's unguarded, it's anyone's for the taking.", next = "BACK", reply = "Unguarded is not the same as unclaimed, and the High Order knows the difference.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to mine.", next = "BUSINESS" },
        { text = "Is it safe to dig into a floating isle?", next = "safe" },
        { text = "Do you ever find windstones?", next = "stones" },
        { text = "Where are the best seams on the isle?", next = "seams" },
        { text = "Who gets to keep a windstone you dig up?", next = "stones2" },
        { text = "Odd trade, for someone raised in the sky.", next = "earth" },
        { text = "Dwarves would give their beards for ore this easy.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "The Earthen Ring teaches us to listen to stone.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Have you never considered a mechanical drill?", next = "xgnome", when = { race = "Gnome" } },
        { text = "Winds be with you.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safe enough, if you keep to the surface seams and don't go tunnelling toward the underside. I'll tell you plainly that I don't know what holds us up, and neither does anyone else, so I'd rather not find out by cracking it." } },
      choices = {
        { text = "The High Order says it's the ley lines.", next = "safe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe2 = {
      big = true,
      lines = { { id = "s2_default", text = "They say a great many things, and the Windshapers say the opposite. I'm a miner, so I trust what I can hold, though I'll admit I'd like to know who's right before the isle decides for us." } },
      choices = {
        { text = "Dig carefully, but dig. The isle needs the ore.", next = "BACK", reply = "That's my own rule, near enough. Keep to it and you'll do well.", fx = { align = { order = 1 } } },
        { text = "Better to leave the rock alone until we understand it.", next = "BACK", reply = "A cautious answer, and not a foolish one. My apprentices never like it, though.", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = { { id = "st_default", text = "Now and again, and every time I do, half of Valanaar wants it. If you're lucky enough to dig one up, think hard before you trade it away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seams = {
      lines = { { id = "se_default", text = "Copper turns up in the hills about the island, mostly where the rock has been weathered open by the wind. Look for green staining on the stone, and stay away from anywhere the ground hums, because that's usually a pylon or a ley line." } },
      choices = {
        { text = "What happens if I dig near a pylon?", next = "seams2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seams2 = {
      lines = { { id = "s3_default", text = "The pylon guards will have words with you, first of all, and they're right to. I knew a miner who swung too close to one years ago, and the stone under his feet shifted a hand's breadth, and he never picked up a pick again." } },
      choices = {
        { text = "Did anyone find out why it shifted?", next = "seams3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seams3 = {
      lines = { { id = "s4_default", text = "The High Order measured it and the Windshapers prayed over it, and neither of them told me anything I could use. I mark that spot on every map I give my apprentices, and that's the only answer I trust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stones2 = {
      big = true,
      lines = { { id = "w2_default", text = "That's the argument of the season. Some say whoever digs it keeps it, as it's always been, and some say every stone found should go to the Council of Elders for the pylons, and a few of my apprentices have come to blows over it." } },
      choices = {
        { text = "Every stone should go to the Council. The pylons come first.", next = "BACK", reply = "That's the dutiful answer. I'll note that you gave it before you'd found one.", fx = { align = { order = 1 }, learn = { "windstones" } } },
        { text = "Whoever does the digging earns the stone.", next = "BACK", reply = "That's been the rule as long as I've held a pick. Whether it should stay the rule, I couldn't tell you.", fx = { align = { order = -1 }, learn = { "windstones" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth = {
      lines = { { id = "ea_default", text = "It is, and my mother never understood it. But someone has to know the rock we live on, and lately I think that matters more than ever, with the isle drifting and nobody sure what holds it together." } },
      choices = {
        { text = "Has the Earthen Ring told you anything?", next = "earth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth2 = {
      lines = { { id = "e2_default", text = "Muln Earthfury came through while they were fighting Lorthuna's lot, and I'd have given a month's ore for an hour of his time. I never got it, so I'm still a miner guessing at stone, like I've always been." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "Easy, is it? Then you'll not mind my asking: how deep do your people dig before you stop? I've wondered for years how far is too far, and nobody here has ever dug deep enough to know." } },
      choices = {
        { text = "We stop when we hit something that bites back.", next = "BACK", reply = "Sensible. Here, I'd stop well before that, because there's only sky underneath.", fx = { affinity = 1 } },
        { text = "A dwarf never stops, lad. That's the trouble.", next = "BACK", reply = "Then I'll keep you well away from the underside, friend, with all respect.", fx = { trait = { witty = 1 } } },
      },
    },
    xshaman = {
      lines = { { id = "xs_default", text = "Does it, now? Then you know more than I do, and I've spent forty years with my hands in it. If the stone ever tells you why this isle stays up, come and tell me before you tell anyone else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "Something that shakes the rock on purpose, on an island held up by forces nobody understands? I've considered it for exactly as long as it took you to ask, and the answer is no, with respect." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    windstones = { { id = "tp_stones", text = "Found in the rock now and then, and fought over every time. Keep quiet if you dig one up." } },
    _none = { { id = "tp_none", text = "If it isn't in the rock, I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Eltheen Nightbreeze: rogue trainer in the Hall of Arms. (Wiki: trainer;
-- may be related to Earthbinder Galandria Nightbreeze, left unsaid.)
---------------------------------------------------------------------------
P:NPC {
  key = "zep_eltheen", id = TODO_NPC("Eltheen Nightbreeze"), name = "Eltheen Nightbreeze", title = "Rogue Trainer",
  role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "wry", "watchful" }, values = { "cunning", "loyal" },
  notices = { "class" },

  impression = {
    first = "She was leaning against the wall behind you before you noticed she'd moved.",
    third = "{name} met Eltheen Nightbreeze, who trains rogues in Valanaar's Hall of Arms.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. You came in quieter this time, and I noticed, which means you're improving." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll teach you, since it's my duty, but I'll be watching your hands the whole while." },
    { id = "g_default", text = "Gale's greetings. You walk loudly, you know." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "There you are. I wondered when you'd find your way back." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Better. You stopped at the door and checked the room before you came in, and that's half of what I teach." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Eltheen Nightbreeze. I teach the quiet arts here, which the elders tolerate because the Al'Aketh don't fight fairly and somebody on our side had better know how not to either." },
      },
      again = { { id = "h_again", text = "Something else? Say it softly." } },
      choices = {
        { text = "A blade in the dark should still serve a just cause.", next = "BACK", reply = "You'd be surprised how few of my students ever think to ask about the cause.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Loyalty is just a lock waiting for the right pick.", next = "BACK", reply = "Clever, and I'd keep it to yourself, because I'm loyal and I have a very good memory.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What do you teach, exactly?", next = "teach" },
        { text = "What use is a rogue to the isle?", next = "use" },
        { text = "How did you learn the quiet arts?", next = "taught" },
        { text = "Have you fought the Al'Aketh yourself?", next = "cult" },
        { text = "Will the orders end up spying on each other?", next = "orders" },
        { text = "I wore the grey robes once.", next = "xformer", when = { origin = "skyborne_former_alaketh" } },
        { text = "Seena's warriors call your students cowards.", next = "xwar", when = { class = "WARRIOR" } },
        { text = "In Stormwind, we have SI:7 for this sort of work.", next = "xsi7", when = { class = "ROGUE", race = "Human" } },
        { text = "Winds be with you, Eltheen.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "How to move without being heard, how to open what's locked, and where to put a blade so that one is enough. Seena teaches you to stand your ground, and I teach you to never need to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    use = {
      lines = { { id = "us_default", text = "The cult hides in ruins and caves, and the bandits off the fallen places know every goat path on the isle. A peacekeeper in bright armor can't get near them, but one of mine can, and comes back with names." } },
      choices = {
        { text = "That sounds a lot like spying on our own people.", next = "use2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use2 = {
      big = true,
      lines = { { id = "u2_default", text = "Sometimes it is, and I won't pretend otherwise. Some of those bandits were farmers a year ago, and whether you treat them as criminals or as people who lost everything is a choice I make every day." } },
      choices = {
        { text = "The law has to hold, or the isle falls apart.", next = "BACK", reply = "The constables would like you. I'm not sure I do, but you're not wrong.", fx = { align = { order = 1 } } },
        { text = "Give them a way back. They're still shen'dorei.", next = "BACK", reply = "That's what I tell myself in the dark. It's good to hear it said in daylight.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "le_default", text = "Mostly by being caught, over and over, by an old ranger who thought I was too loud to be any use. He never praised me once, and the day he stopped catching me, I knew I'd learned." } },
      choices = {
        { text = "Is he still teaching?", next = "taught2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught2 = {
      lines = { { id = "l2_default", text = "His ashes went to the wind three winters ago, and I got his old lockpicks as a gift from his family, which I thought was very funny of them. I use them to teach every student who comes through that door." } },
      choices = {
        { text = "Then he's still catching people, in a way.", next = "BACK", reply = "Ha. He'd have hated that you said that, which is why I like it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", text = "I've crept close enough to their fires to hear them pray, which is closer than I'd like. They call on Al'Akir as though he were already on his way, and some of them sound glad about it." } },
      choices = {
        { text = "What did you learn, listening?", next = "cult2", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      lines = { { id = "c2_default", text = "That they weren't all born to it. Some were frightened farmers who wanted somebody, anybody, to be in charge of the wind again, and Lorthuna gave them that. A few have since walked away from the grey." } },
      choices = {
        { text = "What happens to the ones who walk away?", next = "cult3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult3 = {
      big = true,
      lines = { { id = "c3_default", text = "That depends on who finds them first. Some in Valanaar want them locked up for good, and some want them given a second chance, and I've argued both sides depending on the day and what I'd last seen at a cult fire." } },
      choices = {
        { text = "Give them the chance. Mercy is how we win them back.", next = "BACK", reply = "Then you'll be disappointed now and again, and you'll have to keep choosing it anyway.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Once someone has called on Al'Akir, they can't be trusted.", next = "BACK", reply = "That's safer, and colder. I can't say you're wrong.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      big = true,
      lines = { { id = "or_default", text = "They already do, between you and me, though nobody would call it that. Each order asks my students what the other is saying, and I tell them to answer politely and say nothing useful. Do you think I'm wrong?" } },
      choices = {
        { text = "Spying on our own kin is beneath us.", next = "BACK", reply = "Spoken like someone who's never been lied to by kin. Still, I hope you keep that.", fx = { align = { honor = 1 } } },
        { text = "Know your rival. It's only sense.", next = "BACK", reply = "Now you sound like one of mine. Don't let the elders hear you say it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xformer = {
      lines = { { id = "xf_default", text = "I know, which is why I've been watching you since you came in. Don't flinch; if I thought you were still one of them, you'd never have seen me at all. Just know that others here will be watching too." } },
      choices = {
        { text = "I'm done with them. I'll prove it.", next = "BACK", reply = "Good. Prove it quietly, and you'll find more friends than you expect.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = { { id = "xw_default", text = "They do, until one of my students gets them out of an ambush they walked into with their shields up. Tell Seena's lot I'll still be here when they need me, which they will." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsi7 = {
      lines = { { id = "xs_default", text = "Do you? Then your king is wiser than I'd heard, keeping knives in the dark as well as swords in the light. I'd like to hear how they train, if you ever feel like telling me something useful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    al_aketh = { { id = "tp_aketh", text = "They pray loudly and post their watches badly. Both are useful to know." } },
    two_orders = { { id = "tp_orders", text = "Both orders want to know what the other's up to. Neither will hear it from me." } },
    _none = { { id = "tp_none", text = "I know a great many things, but not that. Odd, isn't it?" } },
  },
}

---------------------------------------------------------------------------
-- Belarysa Moonveil: upstairs in the Hall of Arms. (Wiki: location only.)
-- Kept light: a resident who watches the hall's comings and goings.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_belarysa", id = TODO_NPC("Belarysa Moonveil"), name = "Belarysa Moonveil",
  role = "citizen", tier = "service",
  communities = { "zephras_isle" }, temper = { "calm", "observant" }, values = { "duty" },
  notices = { "class" },

  impression = {
    first = "She sits by the upstairs rail of the Hall of Arms, watching the floor below.",
    third = "{name} met Belarysa Moonveil, who keeps to the upper floor of Valanaar's Hall of Arms.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you. I watched you cross the floor below, and I'm glad it was you coming up the stairs." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've watched you from up here, and I've seen enough to keep my distance." },
    { id = "g_default", text = "Gale's greetings. It's quieter up here than down there, which is why I stay." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Belarysa Moonveil. From up here you can see every trainer in the hall and every student who thinks they aren't being watched, and I find it more instructive than any lesson." },
      },
      again = { { id = "h_again", text = "Anything else? I'm not going anywhere." } },
      choices = {
        { text = "What have you seen from up here?", next = "seen" },
        { text = "Why not train down there yourself?", next = "why" },
        { text = "Your knees? Did you serve with the Peacekeepers?", next = "past" },
        { text = "Which of the trainers below is the best?", next = "trainers" },
        { text = "And what do students get up to when unwatched?", next = "gossip" },
        { text = "Were you watching my bout down there?", next = "xwatch", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Do many from below the clouds come through here?", next = "xout", when = { ["not"] = { race = "Skyborne" } } },
        { text = "I'll leave you to your watching.", next = "END" },
      },
    },
    seen = {
      lines = { { id = "se_default", text = "That Seena's students flinch less every week, that Quel'ana hears more than he sees, and that Eltheen is never quite where you last looked for her. And I've seen a good many young ones come through, more each season, all of them in a hurry." } },
      choices = {
        { text = "The isle needs them in a hurry.", next = "BACK", reply = "Perhaps. I only hope it gives them time to learn first.", fx = { align = { order = 1 } } },
        { text = "They should take their time.", next = "BACK", reply = "So I'd tell them, if any of them looked up.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "I've had my share of training, thank you, and my share of what comes after it. Up here I can rest my knees and still feel useful, which is more than most people my age can say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "pa_default", text = "Most of my life, walking walls and roads with a spear in my hand. I hoped to join the Empyrean Blades when I was young, as everyone did, and I never made it, and I've long since stopped minding." } },
      choices = {
        { text = "What were the Blades like?", next = "past2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past2 = {
      lines = { { id = "p2_default", text = "Proud, and with good reason, since they began as the Shal'nan's own guard. When the Shal'nan stepped down and vanished, they stayed, and that tells you more about them than any parade." } },
      choices = {
        { text = "Was the Shal'nan right to step down?", next = "past3", fx = { learn = { "shal_nan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past3 = {
      big = true,
      lines = { { id = "p3_default", text = "Every old soldier on this isle has an answer to that, usually after a cup of something. Some of us think the Shal'nan gave us the Council and the right to rule ourselves, and some think we were simply left behind." } },
      choices = {
        { text = "Stepping down was honorable. It gave the people a voice.", next = "BACK", reply = "That's my own view, most days. On the bad ones I miss having someone to follow.", fx = { align = { honor = 1 } } },
        { text = "A leader who walks away in a crisis has failed.", next = "BACK", reply = "You'd find friends among the old guard for that. I won't argue it tonight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = { { id = "tr_default", text = "Seena, if you want to survive the first blow, and Eltheen, if you'd rather there wasn't one. Quel'ana is the best teacher of the lot, though, because he makes students think, and they hate him for it until they're grateful." } },
      choices = {
        { text = "You've thought about this a great deal.", next = "trainers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers2 = {
      lines = { { id = "t2_default", text = "I have nothing else to think about, and I've watched a great many students walk out of here and not come back. If I can tell one of them which teacher to listen to, I've done something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gossip = {
      lines = { { id = "go_default", text = "Courting, mostly, and practising moves they've been told not to try. Last week two of Seena's students tried a trick of Eltheen's and knocked over the weapon rack, and I didn't tell anyone, so you mustn't either." } },
      choices = { { text = "Your secret's safe.", next = "BACK", reply = "I know. You've the face of someone who keeps them.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    xwatch = {
      lines = {
        { id = "xw_default", text = "I was, and you did well enough. You drop your guard after a good strike, as though you expect applause, and out in the wilds nobody will be clapping." },
        { id = "xw_rogue", when = { class = "ROGUE" }, text = "I was, and I saw you, which Eltheen will tell you is the trouble. You're quick, but you're quickest when you think nobody's looking, so practise as though I am." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xout = {
      lines = { { id = "xo_default", text = "More each month, since the orders went below the clouds and came back with friends. You're all larger and louder than us, and the trainers have had to learn new words for things, but I like the noise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    shal_nan = { { id = "tp_shal", text = "The Blades still guard what the Shal'nan left behind. Make of that what you will." } },
    two_orders = { { id = "tp_orders", text = "I've watched both orders train down there. They swing swords the same way." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask one of the trainers; they love being asked things." } },
  },
}

---------------------------------------------------------------------------
-- Culli Springwind: a resident of Valanaar. (Wiki: location only.) Kept to
-- town talk: the market, the skydocks, the news.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_culli", id = TODO_NPC("Culli Springwind"), name = "Culli Springwind",
  role = "citizen", tier = "service",
  communities = { "zephras_isle" }, temper = { "chatty", "warm" }, values = { "family" },
  notices = { "race" },

  impression = {
    first = "She greets you as though you'd been neighbours for years.",
    third = "{name} met Culli Springwind, a talkative resident of Valanaar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, there you are, dear! Come here and tell me everything, because I've been wondering about you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. I've heard things, dear, and I'm afraid I've believed some of them." },
    { id = "g_default", text = "Gale's greetings, dear! Isn't it a fine breeze today?" },
    { id = "g_outsider", when = { ["not"] = { race = "Skyborne" } }, text = "Oh, a traveler from below! Come here and let me have a proper look at you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Culli Springwind, and I've lived in Valanaar all my life, so if you want to know who's who or where anything is, you've asked the right woman. I hear everything eventually, usually twice." },
      },
      again = { { id = "h_again", text = "What else would you like to know, dear?" } },
      choices = {
        { text = "What's the news in Valanaar?", next = "news" },
        { text = "Where do the skycutters go?", next = "docks" },
        { text = "Tell me about this husband of yours.", next = "husband" },
        { text = "Your nephew in Mulgore, what else does he write?", next = "nephew" },
        { text = "Who's who in Valanaar, then?", next = "who" },
        { text = "Cultists on the shrine road? Where exactly?", next = "cult" },
        { text = "I'm a tauren of Mulgore, as it happens.", next = "xtauren", when = { race = "Tauren" } },
        { text = "I've come from the Alliance lands, over the sea.", next = "xalliance", when = { faction = "Alliance", ["not"] = { race = "Skyborne" } } },
        { text = "Good day, Culli.", next = "END" },
      },
    },
    news = {
      lines = { { id = "ne_default", text = "The pylons are flickering again, the orders are bickering again, and someone saw cultists on the road to the shrine. It's the same news every week, only a little louder each time." } },
      choices = {
        { text = "Who do you think is right, the orders?", next = "news2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news2 = {
      big = true,
      lines = { { id = "n2_default", text = "I think they're both too proud to share a table, and the rest of us pay for it. My husband sides with the High Order and I side with the Windshapers, and we've managed to stay married, so it can be done." } },
      choices = {
        { text = "The High Order. We have to stand on our own.", next = "BACK", reply = "You and my husband would get on. Don't tell him I said so.", fx = { align = { order = 1 } } },
        { text = "The Windshapers. We owe the spirits more respect.", next = "BACK", reply = "Thank you! I'll quote you at supper.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    docks = {
      lines = { { id = "do_default", text = "From the skydocks at the southern tip, east to Dalaran and west to Mulgore. My nephew went west, and he writes that the tauren are very kind and very large and that the bread is terrible." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    husband = {
      lines = { { id = "hu_default", text = "Oh, he's a dear, and very clever, and wrong about everything that matters. He works at the pylons, so he hears the High Order's mages every day and comes home sounding just like them." } },
      choices = {
        { text = "And you don't mind?", next = "husband2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband2 = {
      lines = { { id = "h2_default", text = "Not a bit, because I get the last word at supper. We argue about the orders the way other couples argue about the washing, and the neighbours say it's the best entertainment in Valanaar." } },
      choices = {
        { text = "Which order would he say I belong to?", next = "husband3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband3 = {
      lines = {
        { id = "h3_default", text = "Oh, he'd say whichever one you're standing nearest to, the flatterer. But you tell me, dear, which way are you leaning?" },
      },
      choices = {
        { text = "I've joined the High Order, bound for Dalaran.", next = "BACK", when = { race = "Skyborne", faction = "Alliance" }, reply = "He'll be insufferable when I tell him. Write to your mother, dear, Dalaran's a long way.", fx = { affinity = 1 } },
        { text = "I've joined the Windshapers, bound for Mulgore.", next = "BACK", when = { race = "Skyborne", faction = "Horde" }, reply = "I knew it! Say hello to my nephew if you see him, he's the one complaining about the bread.", fx = { affinity = 1 } },
        { text = "Neither. I keep my own counsel.", next = "BACK", reply = "Very wise, and very dull. You'd make a fine elder.", fx = { trait = { witty = 1 } } },
      },
    },
    nephew = {
      lines = { { id = "ne_default", text = "That the Windshapers at Camp Gev'rek have more to learn than they expected, and that the tauren shamans are patient with them. He says the spirits there speak in deeper voices, whatever that means, and that the nights are very quiet without the wind." } },
      choices = {
        { text = "Does he want to come home?", next = "nephew2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nephew2 = {
      lines = { { id = "n3_default", text = "He says not, but he asks after every single cousin by name, so I know better. Young ones always think they're going away for good, and then they spend every letter asking what's for supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "Well, High Elder Talaanis Shadowsong runs the Council, and she's sharp as a Galestrider's hoof. Under her you've the elders, who all talk at once, and under them you've the rest of us, who do the actual work." } },
      choices = {
        { text = "Does the Council do a good job?", next = "who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who2 = {
      big = true,
      lines = { { id = "w2_default", text = "That depends on who you ask and what's broken that week. Some folk want the Council to take a firmer hand, and others say the elders already meddle too much. What's your view, dear?" } },
      choices = {
        { text = "Times like these need a firm hand from the Council.", next = "BACK", reply = "That's my husband's view. I'll tell him he's got company.", fx = { align = { order = 1 } } },
        { text = "Let folk decide for themselves. The elders talk too much.", next = "BACK", reply = "Ha! Say that loud enough and you'll be elected to the Council yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", text = "The road out toward the Shrine of Akir, so the carter said, and he swore there were three of them in grey, standing perfectly still on the hill. He came back white as cloud and wouldn't take the road again." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK", reply = "Do, and come and tell me, because I'll want to know before the market does.", fx = { learn = { "al_aketh" } } }, { text = "Something else.", next = "BACK" } },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Oh, my nephew writes about your people in every letter! He says you're very kind and very large, and I can see he wasn't exaggerating. Is the bread really as bad as he says?" } },
      choices = {
        { text = "Our bread is fine. Your nephew is spoiled.", next = "BACK", reply = "I knew it! I'll tell his mother.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "We are glad to have your people with us.", next = "BACK", reply = "That's kind, dear. Look after him, if you meet him.", fx = { affinity = 1 } },
      },
    },
    xalliance = {
      lines = { { id = "xa_default", text = "From over the sea! I've never been further than the skydocks, and now the whole world is coming to visit. You'll want to see Valanaar properly while you're here, and please mind the edges." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "My husband's High Order and I'm Windshaper, and we've lasted thirty years. The orders could learn from us." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes on the shrine road, so they say. Don't go wandering out there alone, dear." } },
    _none = { { id = "tp_none", text = "I haven't heard about that yet, but give me a day." } },
  },
}

---------------------------------------------------------------------------
-- Emerii Tallgust: leatherworker, sells skinning supplies from his home in
-- Valanaar. (Wiki: vendor.) Proud of his curing; Jolee buys from him.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_emerii", id = TODO_NPC("Emerii Tallgust"), name = "Emerii Tallgust", title = "Leatherworker",
  role = "vendor", tier = "service",
  communities = { "zephras_isle" }, temper = { "fussy", "proud" }, values = { "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "His home smells of salt and tanning oil, and he apologises for neither.",
    third = "{name} met Emerii Tallgust, a leatherworker who sells skinning supplies from his home in Valanaar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Wipe your feet and come in; I've a hide curing that I think would suit you very well." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Wipe your feet, buy what you need, and leave the hides alone." },
    { id = "g_default", text = "Gale's greetings. Wipe your feet; the hides are drying." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning" } },
      text = "You skin, I see. Then you know a ragged cut ruins a hide, so please tell me you've stopped making them." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If you bring me clean hides, we'll get along very well." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Emerii Tallgust. I work leather and sell what you'll need to skin, knives, salt and thread, from my own front room, because the market stalls let the wind at everything." },
      },
      again = { { id = "h_again", text = "Something else? Mind the racks." } },
      choices = {
        { text = "Good leather takes weeks, and the price should honour that.", next = "BACK", reply = "Finally, someone who understands that tanning isn't just soaking things in a bucket.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hide's hide; I'd pay the same for a raw pelt.", next = "BACK", reply = "Then go and wear a raw pelt, and see how you smell in a week.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What's the secret to good leather?", next = "secret" },
        { text = "Jolee Brightmeadows buys from you, doesn't she?", next = "jolee" },
        { text = "Why sell from your home, rather than the market?", next = "home" },
        { text = "What's turned the beasts wild?", next = "wild" },
        { text = "Your prices are steep, Emerii.", next = "prices" },
        { text = "I'll bring you clean hides, I promise.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I wear the shape of those beasts, sometimes.", next = "xdruid", when = { class = "DRUID" } },
        { text = "My people work kodo hide in Mulgore.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Good day, Emerii.", next = "END" },
      },
    },
    secret = {
      lines = { { id = "se_default", text = "Salt, patience and a clean cut, in that order. Most people rush the salting because they want to see the finished thing, and then they wonder why it cracks before the season's out." } },
      choices = {
        { text = "Where do the best hides come from?", next = "hides" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      big = true,
      lines = { { id = "hi_default", text = "From the beasts that have turned wild lately, more's the pity, since they're strong and well fed. The Rangers bring them in by the cartload, and I can't decide whether to be grateful or ashamed that business is so good." } },
      choices = {
        { text = "Be grateful. Nothing should go to waste.", next = "BACK", reply = "That's the sensible view, and I'll try to hold it. Thank you.", fx = { align = { order = 1 } } },
        { text = "Be ashamed. Those beasts were peaceful once.", next = "BACK", reply = "They were. I still remember the vuldren eating out of children's hands.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jolee = {
      lines = { { id = "jo_default", text = "She does, and she complains about my prices every time, and then she buys the lot. She's the best seamstress in Thendal, so I let her complain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "The wind gets into everything at a stall, grit and damp and worse, and salt does nothing for a hide that's been flapping all morning. Besides, a front room has a door, and these days I like a door I can lock." } },
      choices = {
        { text = "Has someone been stealing from you?", next = "home2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home2 = {
      lines = { { id = "h2_default", text = "Not from me, but the potter two doors down lost a purse of windstones last month, and nobody's been caught. Folk from the fallen places are hungry, and hungry people take what's lying about, and I can't even blame them properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wild = {
      lines = { { id = "wi_default", text = "If I knew that, I'd be on the Council instead of in a front room full of hides. They started turning about when the spirits left, so everyone blames the spirits, but I've heard the Rangers blame the cult as well." } },
      choices = {
        { text = "What do you think?", next = "wild2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild2 = {
      lines = { { id = "w2_default", text = "I think a beast doesn't turn on the hand that fed it without good reason, and I think we don't know the reason. That's not a satisfying answer, but it's the honest one, and I'd rather be honest than satisfying." } },
      choices = {
        { text = "Who would know, if anyone?", next = "wild3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild3 = {
      lines = { { id = "w3_default", text = "The Nightclaw druids, maybe, up in Shadowgale Forest, though they don't come down and they don't answer letters. If you ever get one of them talking, ask about the beasts for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prices = {
      big = true,
      lines = { { id = "pr_default", text = "They're steep because the work is good, and because salt is dear and windstones dearer. Jolee says I ought to charge less in hard times, and my neighbour says I ought to charge more while I can. What would you do?" } },
      choices = {
        { text = "Charge fairly. Folk are struggling, and you'll be remembered for it.", next = "BACK", reply = "You sound like Jolee. Fine, I'll think about it, but don't tell her I said so.", fx = { align = { honor = 1 } } },
        { text = "Charge what folk will pay. That's how a trade survives.", next = "BACK", reply = "A practical answer, and one my ledger agrees with. My conscience is less sure.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "Everyone promises, and then they bring me something that looks like it was skinned with a spoon. One clean cut along the belly, salt it the same day, and keep your pet's teeth out of it, and we'll be friends." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Oh. Well, that's rather awkward, standing in a room full of hides. Please don't change in here, and please don't take it personally; none of these were anybody you knew, I'm almost certain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Kodo! I've heard of them from the Windshapers who've come back, beasts as big as a house. I'd give a great deal to work one of those hides, so if you ever have one spare, you'll find me very polite indeed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    windstones = { { id = "tp_stones", text = "Dearer than salt, and salt is dear. I take them, but I'd rather have coin." } },
    al_aketh = { { id = "tp_aketh", text = "The Rangers blame them for the beasts turning. I only know the hides got thicker." } },
    _none = { { id = "tp_none", text = "No idea. Ask me about hides." } },
  },
}
