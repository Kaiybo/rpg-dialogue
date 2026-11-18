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
    first = "Quel'ana Quickgale trains hunters in Valanaar's Hall of Arms with one good eye and better ears than anyone I've met. He talks about taming a beast as if it were a promise you make to it.",
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
        { text = "Farewell, Quel'ana.", next = "END" },
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
    first = "Seena Skybreaker trains warriors in Valanaar's Hall of Arms and talks about standing in front of other people as if it were the only job worth doing. She laughs easily and hits harder than she laughs.",
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
        { id = "h_default", key = true, text = "Seena Skybreaker. I teach my warriors to hold still when everything in them wants to step back, because the ones who step back are the ones we carry home. Blademaster Ren up in Thendal teaches the same lesson, and we're both right, so you'd better listen to one of us." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Skybreaker Bulwark") },
          text = "You did right by the Bulwark, and by my family's name, and I'll not forget it. Come to me whenever you need training, and I'll make sure you're worth what you've done." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; I've recruits to bruise." },
        { id = "h_again2", text = "Speak up. The hall's loud." },
      },
      choices = {
        { text = "What is the Skybreaker Bulwark?", next = "bulwark" },
        { text = "What makes a good warrior, in your eyes?", next = "front" },
        { text = "Who else trains in this hall?", next = "hall" },
        { text = "Who are your recruits?", next = "recruits" },
        { text = "Train me, Seena.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I guarded the pylons on Anvilas while they failed.", next = "xpylon", when = { origin = "skyborne_anvilas_pylon_guard" } },
        { text = "I trained for the Empyrean Blades.", next = "xblade", when = { origin = "skyborne_empyrean_recruit" } },
        { text = "How do your warriors fight compared to mine?", next = "xoutsider", when = { class = "WARRIOR", ["not"] = { race = "Skyborne" } } },
        { text = "Farewell, Seena.", next = "END" },
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
    first = "Riaani Nightwind of the Windshapers keeps the old wind constructs running and barely looks up from them to speak. He treats every bolt as something the spirits left in his keeping.",
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
        { text = "Share them. Pride won't mend a single bolt.", next = "BACK", reply = "Pride, is it? Perhaps, and perhaps not, but I'll think on it. A rusting construct helps nobody.", fx = { affinity = 1, align = { honor = -1 }, learn = { "two_orders" } } },
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
        { id = "or_default", text = "The cyclone construct? I've heard of it, and I've heard it drove off the bandits who hurt Alvarion Windfield, which means there's more wind left in it than anyone thought. If his wife Aamelia wants a Windshaper to look it over, she's only to ask, and I'd go gladly, since it's not every day one of them wakes up on its own." },
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
    first = "Alvarion Windfield lies upstairs at the Calmbreeze Inn with wounds that would have killed a weaker man, and he still makes jokes about his apples. He worries about his wife and his orchard far more than about himself.",
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
    first = "Melasa Fairmend teaches first aid in Valanaar and has been bandaging more people lately than she'd like. She's brisk, kind and a little too tired to be gentle about it.",
    third = "{name} met Melasa Fairmend, Valanaar's medic, who teaches first aid to anyone who'll learn it.",
  },

  greetings = {
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Melasa Fairmend. I teach first aid, which on this isle lately means teaching people how to keep their friends alive until somebody better can get to them. Linen, a steady hand and a cool head are most of it." },
      },
      again = {
        { id = "h_again", text = "What else? I've a few moments before the next one comes in." },
        { id = "h_again2", text = "Ask; I can roll bandages and talk." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Who have you been patching up lately?", next = "patients" },
        { text = "How do your people heal, without priests?", next = "healing" },
        { text = "What should I always carry?", next = "kit" },
        { text = "I've bandaged a few people myself.", next = "xfa", when = { profession = { "First Aid" } } },
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
        { text = "You're right. Skill is better than waiting on miracles.", next = "BACK", reply = "Good, then you'll make a fine medic. Sit down and I'll show you a proper knot.", fx = { affinity = 2, align = { order = 1 } } },
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
