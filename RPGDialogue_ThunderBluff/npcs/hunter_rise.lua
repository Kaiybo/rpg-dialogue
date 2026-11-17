-- Hunter Rise: the blacksmith who makes too many shields, the Ragetotem and Thunderhorn trainers,
-- the pet trainer and the Frostwolf battlemaster. Voice: bibles/mosarn.md, hunter_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Mosarn: a blacksmith who arms the braves and anyone else who pays.
---------------------------------------------------------------------------
P:NPC {
  key = "mosarn", id = TODO_NPC("Mosarn"), name = "Mosarn",
  bible = "bibles/mosarn.md", role = "blacksmith", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "gruff" }, values = { "craft", "practical", "proud" },
  notices = { "gear", "craft" },
  impression = {
    first = "Mosarn hammers shields and armor on Hunter Rise with a crew of apprentices, faster than anyone else on the Bluff. He is proud of the work and careless about where it ends up.",
    third = "{name} met Mosarn, the Hunter Rise blacksmith who arms the braves of Thunder Bluff and anyone else with coin.",
  },

  greetings = {
    { id = "g_hi", text = "Speak up, the anvils don't stop for visitors." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did my armor hold, or have you come to complain?" },
    { id = "g_shield", when = { questActive = TODO_QUEST("The Black Shield") }, text = "Krog sent you with a shield? Let me see it, then, and hold it to the light." },
    { id = "g_shield_done", when = { questDone = TODO_QUEST("The Black Shield") }, text = "Has Krog found his burners yet? I still think about that shield, which is more than I do about most of them." },
  },

  notice = {
    { id = "n_broken", cat = "gear", when = { durability = { max = 0.25 } }, place = "before",
      text = "Earth Mother, look at the state of you. Whoever made that armor should be ashamed, and if it was me, I don't want to hear about it." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've got a smith's burns on your forearms. Tell me, do you quench in oil or in water?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Mosarn, and everything with a Hunter Rise stamp on it came off one of these anvils. My apprentices and I arm the braves of the Bluff, and the Earthen Ring, and anyone else who pays, so there's a fair bit of my work walking around Kalimdor." },
        { id = "h_shield", when = { questActive = TODO_QUEST("The Black Shield") },
          text = "Let me see that. Yes, this is a shield that I made, the rivets give it away. As for who carried it, I make so many shields and so much armor that I can't keep track of where any one of them goes." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior, good, you'll know what a shield is worth. I'm Mosarn, and I've made more of them than I could count, though I could tell you about every one that ever came back broken." },
      },
      again = {
        { id = "h_again", text = "What else? I've a quench going." },
        { id = "h_again2", text = "Ask, ask. My hammer can listen." },
      },
      choices = {
        { text = "Who buys the most of your work?", next = "buyers" },
        { text = "Why so many apprentices?", next = "apprentices" },
        { text = "Do tauren make good smiths?", next = "smiths" },
        { text = "Krog wants to know who carried that shield.", next = "krog", when = { questActive = TODO_QUEST("The Black Shield") } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Earth Mother keep your forge, Mosarn.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "The braves, the Earthen Ring, and the Grimtotem, who come up from the south and buy by the cartload. I don't ask them what for, because a shield is for protecting yourself, and that's nobody's business but the one holding it." } },
      choices = {
        { text = "Even if the Grimtotem turn it on the Horde?", next = "buyers_grim", fx = { learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    buyers_grim = {
      lines = { { id = "bg_default", text = "They're tauren, and they live under Cairne's peace like the rest of us. If the High Chieftain says not to sell to them, I'll stop, and until then my apprentices need feeding." } },
      choices = {
        { text = "And if your shields are turned on innocents?", next = "buyers_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_end = {
      big = true,
      lines = { { id = "be_default", text = "Then I'd want to know about it, and I'd want the one who did it found. But I won't stop making shields because someone might misuse one, any more than the hunters stop making bows." } },
      choices = {
        { text = "A smith answers for where his work goes.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "You make shields. What others do isn't on you.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentices = {
      lines = { { id = "a_default", text = "Because one smith makes one good shield a day, and the braves need a hundred. I teach them the rivets and the temper, and I check every piece before it leaves, or near enough every piece." } },
      choices = {
        { text = "Near enough?", next = "apprentices_near" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentices_near = {
      lines = { { id = "an_default", text = "You try checking a hundred shields between dawn and dusk. If one goes out with a bad rivet, the brave who gets it brings it back and shouts at me, and I fix it, and that's how a forge works." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smiths = {
      lines = { { id = "s_default", text = "We do now. When we wandered, a tauren carried nothing heavier than a spear, and it was the orcs who showed us how to work iron properly. I'm better at it than most of them, mind, and I've told them so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    krog = {
      lines = { { id = "k_default", text = "Tell him I'm sorry, but that's the truth of it. Half the tauren in Dustwallow carry a shield like that, and the Grimtotem buy more than anyone, if that helps him at all." } },
      choices = { { text = "It might. Thank you, Mosarn.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A smith, and a busy one. I learned from an orc in the Crossroads and I've been better than him for years." } },
    advice = { { id = "tp_ad", text = "Have your armor looked at before it fails, not after. After costs more." } },
    grimtotem = { { id = "tp_gt", text = "Good customers, prompt payers, poor conversation." } },
    _none = { { id = "tp_none", text = "Never heard of it. Is it made of iron? Then I'm not interested." } },
  },
}

---------------------------------------------------------------------------
-- Sark Ragetotem: warrior trainer, blunt and loud.
---------------------------------------------------------------------------
P:NPC {
  key = "sark", id = TODO_NPC("Sark Ragetotem"), name = "Sark Ragetotem", title = "Warrior Trainer",
  bible = "bibles/hunter_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gruff" }, values = { "brave", "proud" },
  notices = { "class" },
  impression = {
    first = "Sark Ragetotem trains warriors on Hunter Rise at the top of his voice. He seems to believe that anything worth teaching is worth shouting.",
    third = "{name} met Sark Ragetotem, a loud warrior trainer on Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Shoulders back! Now, what do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still standing. Good, that's the first lesson." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR", race = "Scourge" },
      text = "A Forsaken warrior. You lot don't feel the bruises, which makes you hard to teach and very hard to stop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Sark Ragetotem, and I train warriors with Ker and Torm. The Ragetotem have held Hunter Rise since the Bluff was built, and we've never sent out a brave who couldn't take a hit." },
        { id = "h_notwar", when = { ["not"] = { class = "WARRIOR" } }, text = "You're no warrior, but I'll tell you the same thing I tell the calves: stand where you can see your enemy and never turn your back on a centaur." },
      },
      again = { { id = "h_again", text = "Well? Out with it!" } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's the hardest lesson?", next = "hard" },
        { text = "Why do the Ragetotem train warriors?", next = "tribe" },
        { text = "Farewell, Sark.", next = "END" },
      },
    },
    hard = {
      lines = { { id = "hd_default", text = "When to stop. Any calf can learn to swing an axe, but knowing when the fight's won and lowering it again, that takes years." } },
      choices = {
        { text = "And if the enemy won't stop?", next = "hard_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard_end = {
      big = true,
      lines = { { id = "he_default", text = "Then you stop him, and you don't enjoy it. The day you start enjoying it, come back here and I'll knock that out of you myself." } },
      choices = {
        { text = "A warrior fights only as long as needed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll enjoy a good fight, Sark. No shame in it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    tribe = {
      lines = { { id = "t_default", text = "Because somebody has to, and we're good at it! Ragetotem calves wrestle before they can walk, and the ones who survive their cousins grow up to be very hard to knock over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ragetotem, warrior, teacher. I hit things and I show others how." } },
    advice = { { id = "tp_ad", text = "Keep your shield arm up. Every warrior who forgot is buried somewhere." } },
    _none = { { id = "tp_none", text = "What? Never heard of it! Ask someone who reads." } },
  },
}

---------------------------------------------------------------------------
-- Torm Ragetotem: warrior trainer, quiet and exact.
---------------------------------------------------------------------------
P:NPC {
  key = "torm", id = TODO_NPC("Torm Ragetotem"), name = "Torm Ragetotem", title = "Warrior Trainer",
  bible = "bibles/hunter_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "disciplined", "patient" },
  notices = { "class" },
  impression = {
    first = "Torm Ragetotem trains warriors on Hunter Rise in a voice so quiet you have to lean in, which may be the point. He is the calm one of the Ragetotem.",
    third = "{name} met Torm Ragetotem, a soft-spoken warrior trainer on Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Closer. I don't shout, unlike my cousin." },
    { id = "g_back", when = { metBefore = true }, text = "You've been practicing your footwork. I can see it in how you stand." },
  },

  notice = {
    { id = "n_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "An orc warrior, on Hunter Rise. Your people taught mine about iron, and we taught you about patience, and I'd say we both got the better bargain." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Torm Ragetotem. Sark teaches you to hit hard and Ker teaches you to keep going, and I teach you where to put your feet, which is the part everybody skips." },
        { id = "h_notwar", when = { ["not"] = { class = "WARRIOR" } }, text = "You aren't a warrior, but you're welcome to watch. Most of what I teach is how to stand, and everybody needs that sooner or later." },
      },
      again = { { id = "h_again", text = "Something else? Take your time." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Why does footwork matter so much?", next = "feet" },
        { text = "You're quieter than your cousin.", next = "sark" },
        { text = "Farewell, Torm.", next = "END" },
      },
    },
    feet = {
      lines = { { id = "f_default", text = "Because a tauren is heavy, and a heavy thing that falls over stays fallen. The centaur learned to aim for our legs years ago, and the warriors who listened to me are the ones who are still walking." } },
      choices = {
        { text = "So strength isn't enough.", next = "feet_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feet_end = {
      big = true,
      lines = { { id = "fe_default", text = "Strength is a gift from the Earth Mother, and balance is how you thank her for it. Plenty of strong bulls have died face down in the Barrens." } },
      choices = {
        { text = "Discipline first. Strength follows.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather hit first and hard.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    sark = {
      lines = { { id = "s_default", text = "Somebody in the family has to be. Sark thinks shouting makes a lesson stick, and I think listening does, and the warriors we train seem to need a little of both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Ragetotem who trains warriors. I prefer to let my students speak for me." } },
    advice = { { id = "tp_ad", text = "Plant your back hoof before you swing. Everything else is decoration." } },
    _none = { { id = "tp_none", text = "I don't know. I'd rather say so than guess." } },
  },
}

---------------------------------------------------------------------------
-- Urek Thunderhorn: hunter trainer, a tracker with stories.
---------------------------------------------------------------------------
P:NPC {
  key = "urek", id = TODO_NPC("Urek Thunderhorn"), name = "Urek Thunderhorn", title = "Hunter Trainer",
  bible = "bibles/hunter_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "jovial" }, values = { "nature", "friendly" },
  notices = { "pet" },
  impression = {
    first = "Urek Thunderhorn trains hunters on Hunter Rise and cannot teach a single shot without telling the story of where he learned it. Most of the stories are about getting lost.",
    third = "{name} met Urek Thunderhorn, a talkative hunter trainer on Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Ho, a visitor! Sit, sit, I was just about to tell a story." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Rise! Have you been lost anywhere interesting?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "And who's this? Hello, {pet}, yes, you're very handsome. Your hunter's lucky to have you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Urek Thunderhorn, and I train hunters with Holt and Kary. Holt teaches the bow, Kary teaches the trail, and I teach what to do when you've lost the bow and the trail both, which happens more than they'd admit." },
        { id = "h_nothunt", when = { ["not"] = { class = "HUNTER" } }, text = "Not a hunter? Never mind, everyone's welcome on the Rise, as long as they don't startle the beasts." },
      },
      again = { { id = "h_again", text = "What else, friend? I've a hundred stories left." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Tell me about getting lost.", next = "lost" },
        { text = "What's the best beast to tame?", next = "beast" },
        { text = "Farewell, Urek.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I once followed a plains lion three days into the Barrens and woke up surrounded by Razormane, with my bow at the bottom of a waterhole. I came home on foot, very hungry and very much wiser." } },
      choices = {
        { text = "What did you learn?", next = "lost_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_end = {
      big = true,
      lines = { { id = "le_default", text = "That a hunter who won't turn back is just a meal that hasn't happened yet. I let that lion go, and I've never been sorry, though I still think about his mane." } },
      choices = {
        { text = "Knowing when to turn back is wisdom.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd have followed him a fourth day.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    beast = {
      lines = { { id = "b_default", text = "The one that chooses you back. Hesuwa will tell you the same, though he'll take longer about it and sound wiser." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Thunderhorn, hunter, teller of stories. Some of them are even true." } },
    advice = { { id = "tp_ad", text = "Always know where the nearest water is. You'll be surprised how often it matters." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if you find out, come back and tell me the story!" } },
  },
}

---------------------------------------------------------------------------
-- Kary Thunderhorn: hunter trainer who reads tracks.
---------------------------------------------------------------------------
P:NPC {
  key = "kary", id = TODO_NPC("Kary Thunderhorn"), name = "Kary Thunderhorn", title = "Hunter Trainer",
  bible = "bibles/hunter_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry" }, values = { "careful", "nature" },
  notices = { "class" },
  impression = {
    first = "Kary Thunderhorn trains hunters on Hunter Rise and teaches tracking above everything else. She notices where people have been before they say a word.",
    third = "{name} met Kary Thunderhorn, a sharp-eyed hunter trainer on Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Red dust on your hooves. You've come up from the Barrens, haven't you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Your tracks are cleaner than they were, at least." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "HUNTER", race = "Troll" },
      text = "A troll hunter. Your people track through jungle, which is harder than plains, so I'd be glad to hear how you do it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kary Thunderhorn, and I teach tracking, along with whatever else a hunter needs. Holt's the archer and Urek's the storyteller, so somebody has to be the one who actually knows where the beast went." },
        { id = "h_nothunt", when = { ["not"] = { class = "HUNTER" } }, text = "You're no hunter, but you walk like someone who's been followed recently. Watch your back on the plains." },
      },
      again = { { id = "h_again", text = "Anything else? Be quick, the light's going." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What can tracks tell you?", next = "tracks" },
        { text = "Is Urek a good hunter, then?", next = "urek" },
        { text = "Farewell, Kary.", next = "END" },
      },
    },
    tracks = {
      lines = { { id = "t_default", text = "Who passed, how heavy they were, whether they were hurt, and whether they were in a hurry. Quilboar drag their feet and centaur never do, and a kodo with a limp will tell you about it a mile off." } },
      choices = {
        { text = "And people? Can you track people?", next = "tracks_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tracks_people = {
      big = true,
      lines = { { id = "tp_default", text = "Easier than beasts, because people lie with their mouths and never with their feet. I don't do it for anyone who asks, though, because a tracker who hunts people for coin is a different kind of hunter." } },
      choices = {
        { text = "Some people deserve to be hunted down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right. Keep the skill for beasts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    urek = {
      lines = { { id = "u_default", text = "He's the best shot of the three of us when he can find his bow, which I'd never say in front of Holt. He loses it often, and always when it matters most." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Thunderhorn, tracker, teacher. I've followed most things across Mulgore at one time or another." } },
    advice = { { id = "tp_ad", text = "Look down before you look ahead. The ground remembers what the wind forgets." } },
    _none = { { id = "tp_none", text = "No tracks on that one. Ask someone else." } },
  },
}

---------------------------------------------------------------------------
-- Hesuwa Thunderhorn: pet trainer, who speaks to the beasts first.
---------------------------------------------------------------------------
P:NPC {
  key = "hesuwa", id = TODO_NPC("Hesuwa Thunderhorn"), name = "Hesuwa Thunderhorn", title = "Pet Trainer",
  bible = "bibles/hunter_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "nature", "kind" },
  notices = { "pet" },
  impression = {
    first = "Hesuwa Thunderhorn trains hunters' companions on Hunter Rise, and greets the beast before the hunter. He seems to find animals easier company than people, and does not hide it.",
    third = "{name} met Hesuwa Thunderhorn, the pet trainer of Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Hello, little one. Oh, and you too, I suppose." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Let me look at your companion first, and then we'll talk." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} is well fed and its coat is clean. You're taking care of it, and I can tell it knows." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Hesuwa Thunderhorn, and I teach your companions what they need to know, with you listening in. The beasts learn quicker than their hunters, most days." },
        { id = "h_nothunt", when = { ["not"] = { class = "HUNTER" } }, text = "You've no companion with you, so I'm not sure what I can teach you. You could sit and watch, if you're quiet." },
      },
      again = { { id = "h_again", text = "Anything more? Your companion's getting restless." } },
      choices = {
        { text = "Teach my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you teach a beast?", next = "teach" },
        { text = "Do you prefer beasts to people?", next = "people" },
        { text = "Farewell, Hesuwa.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Slowly, with food and with time and with never once lying to it. A beast forgives a hunter for being wrong, but never for being false." } },
      choices = {
        { text = "And if a companion won't learn?", next = "teach_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_end = {
      big = true,
      lines = { { id = "te_default", text = "Then you let it go back to the wild, with thanks. Some hunters keep a beast that's unhappy with them, and I think less of them for it." } },
      choices = {
        { text = "If it's unhappy, I'd set it free.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A companion learns to obey, in time.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    people = {
      lines = { { id = "p_default", text = "Beasts are simpler, and they don't argue about the Grimtotem at supper. I like people well enough, only I like them best when they're feeding something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Thunderhorn. I raised orphaned calves before I trained anyone's companion, and it's much the same work." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself, and it'll never leave you." } },
    _none = { { id = "tp_none", text = "I don't know, and neither does your companion, by the look of it." } },
  },
}

---------------------------------------------------------------------------
-- Taim Ragetotem: the Alterac Valley battlemaster, for the Frostwolf.
---------------------------------------------------------------------------
P:NPC {
  key = "taim", id = TODO_NPC("Taim Ragetotem"), name = "Taim Ragetotem", title = "Alterac Valley Battlemaster",
  bible = "bibles/hunter_trainers.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk" }, values = { "loyal", "brave" },
  notices = { "pvp" },
  impression = {
    first = "Taim Ragetotem sends tauren north to fight for the Frostwolf clan in Alterac Valley. He talks about the snow as though it were a personal insult.",
    third = "{name} met Taim Ragetotem, who musters fighters on Hunter Rise for the Frostwolf in Alterac Valley.",
  },

  greetings = {
    { id = "g_hi", text = "Looking for a real fight? The Frostwolf need warm bodies in Alterac." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the snow, or on your way to it?" },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 3 },
      text = "You wear a rank of the Horde. Then you've already bled for it, and the Frostwolf will be glad of you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Taim Ragetotem, and I muster fighters for the Frostwolf clan in Alterac Valley, where the dwarves of the Stormpike have come digging into Frostwolf land. It's cold, it's bloody, and Thrall's own people need us there." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Then you'll know the Frostwolf already, or know of them. Thrall's own clan, and the Stormpike dwarves are digging through their valley as we speak." },
        { id = "h_frost", when = { origin = "orc_frostwolf" },
          text = "You're Frostwolf born, aren't you? I can hear the mountains in your voice. Go home and fight for it, then, and take some tauren with you." },
      },
      again = { { id = "h_again", text = "More questions? The snow won't wait." } },
      choices = {
        { text = "Send me to Alterac.", next = "BUSINESS" },
        { text = "Why should tauren fight for the Frostwolf?", next = "why" },
        { text = "What's it like in the valley?", next = "valley" },
        { text = "Farewell, Taim.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Thrall saved us from the centaur when nobody else would, and the Frostwolf are his blood. A debt like that you pay in the snow, if that's where it's owed." } },
      choices = {
        { text = "Must every debt be paid in blood?", next = "why_end", fx = { learn = { "alterac" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "alterac" } } },
      },
    },
    why_end = {
      big = true,
      lines = { { id = "we_default", text = "Not every one, and the High Chieftain would rather none were. But the dwarves started this one, and I'd rather they found tauren waiting for them than orc children." } },
      choices = {
        { text = "Then I'll go. The Horde stands together.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight for myself, not for old debts.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Snow up to your knees, wolves who are friendlier than the dwarves, and the cold gets into your horns so you hear it ringing for days. Every tauren who comes back says they'll never go again, and half of them are back within the month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ragetotem, like Sark and Torm. They train fighters, and I send them somewhere to fight." } },
    advice = { { id = "tp_ad", text = "Take a thicker cloak than you think you need. Then take another one." } },
    alterac = { { id = "tp_av", text = "The Frostwolf valley, in the mountains north of Hillsbrad. The Stormpike want it, and they can't have it." } },
    _none = { { id = "tp_none", text = "Don't know it. Ask me about the snow instead." } },
  },
}
