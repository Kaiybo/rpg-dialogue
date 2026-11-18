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
    { id = "g_hi", text = "Speak up, friend; the anvils don't stop for visitors, not even for the Earth Mother herself." },
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
        { id = "h_again", text = "What else? I've a quench going, and hot iron is less patient than a kodo." },
        { id = "h_again2", text = "Ask, ask. My hammer can listen." },
      },
      choices = {
        { text = "Who buys the most of your work?", next = "buyers" },
        { text = "Why so many apprentices?", next = "apprentices" },
        { text = "I didn't know tauren made good smiths.", next = "smiths" },
        { text = "Krog wants to know who carried that shield.", next = "krog", when = { questActive = TODO_QUEST("The Black Shield") } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Earth Mother keep your forge, Mosarn.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "The braves, the Earthen Ring, and the Grimtotem, who come up from the south and buy by the cartload. I don't ask them what for, because a shield is for protecting yourself, and that's nobody's business but the one holding it." } },
      choices = {
        { text = "The Grimtotem might turn it on the Horde.", next = "buyers_grim", fx = { learn = { "grimtotem" } } },
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
        { text = "Near enough doesn't sound good enough.", next = "apprentices_near" },
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
    _none = { { id = "tp_none", text = "Never heard of it. Is it made of iron? Then I'm not interested, and the ancestors can keep it." } },
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
    { id = "o_dw_hate", when = { gossip = { topic = "dwarves", stance = "hate" } }, text = "Taim says you want the dwarves out of Alterac! Good! Then train harder, because they hit like falling rocks!" },
    { id = "g_hi", text = "Shoulders back, like a bull facing the wind! Now, what do you want?" },
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
      again = { { id = "h_again", text = "Well? Out with it! You're not a kodo calf, you can speak for yourself." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's the hardest lesson?", next = "hard" },
        { text = "Why do the Ragetotem train warriors?", next = "tribe" },
        { text = "Have you fought the centaur?", next = "centaur" },
        { text = "How do I hold my ground against a charge?", next = "charge", when = { class = "WARRIOR" } },
        { text = "You can't hurt what doesn't feel pain, Sark.", next = "fk_pain", when = { race = "Scourge" } },
        { text = "My father says the Ragetotem are all bluster.", next = "bluster", when = { race = "Tauren" } },
        { text = "Farewell, Sark.", next = "END" },
      },
    },
    hard = {
      lines = { { id = "hd_default", text = "When to stop. Any calf can learn to swing an axe, but knowing when the fight's won and lowering it again, that takes years." } },
      choices = {
        { text = "Some enemies won't stop.", next = "hard_end" },
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
      choices = {
        { text = "Who are Ker and Torm to you?", next = "cousins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousins = {
      lines = { { id = "co_default", text = "Torm's my cousin, and so is Taim, the one sending braves off to Alterac to fight beside the Frostwolves! Ker's an older relation who trained me himself, and he still says I drop my shoulder, and he's still right!" } },
      choices = {
        { text = "Why send tauren to fight in Alterac?", next = "alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alterac = {
      lines = { { id = "al_default", text = "Because Thrall's orcs stood with us against the centaur when we were wandering, and the Frostwolf clan is his own blood! We pay our debts, so if you want a real fight, go and talk to Taim, and take warm furs, because those mountains are no place for a bull without them." } },
      choices = { { text = "Something else, Sark.", next = "BACK" } },
    },
    centaur = {
      lines = { { id = "ce2_default", text = "More times than I've counted! The Kolkar in the Barrens and the Galak in Thousand Needles, and every last one of them thinks a tauren is slow right up until the axe arrives." } },
      choices = {
        { text = "Do you respect them as fighters?", next = "centaur_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    centaur_respect = {
      big = true,
      lines = { { id = "cr_default", text = "I do, and I hate saying it! They ride hard and they never quit a fight, but they burned our camps when we were wandering the plains, and I'll never forgive them that." } },
      choices = {
        { text = "They're foes, but worthy ones. Respect them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Raiders who burn camps deserve no respect.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charge = {
      lines = { { id = "ch_default", text = "You plant your hooves, you lower your shoulder and you yell louder than the thing that's charging you! Torm will tell you all about footwork, but nothing stops a raptor like a bull who won't move." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fk_pain = {
      lines = { { id = "fp_default", text = "No, but I can knock it over, and you get up slower than you think! Feeling nothing isn't the same as being unbreakable, and bones crack whether you notice it or not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bluster = {
      lines = { { id = "bu_default", text = "Does he! Then send him up here and I'll bluster at him until he sits down! Tell him I said it fondly, mind, because every bull on this rise has a father who said the same about us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    centaur = { { id = "tp_ce", text = "Fast, fierce and fond of burning tents! Keep your shield up and your back to a rock." } },
    cairne = { { id = "tp_ca", text = "The High Chieftain could put me on my back in three breaths, even now! Nobody else living can say that." } },
    background = { { id = "tp_bg", text = "Ragetotem, warrior, teacher. I hit things and I show others how." } },
    advice = { { id = "tp_ad", text = "Keep your shield arm up. Every warrior who forgot is buried somewhere." } },
    _none = { { id = "tp_none", text = "What? Never heard of it! Ask someone who spends more time with the elders than with a spear." } },
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
    { id = "g_hi", text = "Closer. I don't shout, unlike my cousin; the plains taught me that a quiet hoof goes further." },
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
      again = { { id = "h_again", text = "Something else? Take your time, as the grass does." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Why does footwork matter so much?", next = "feet" },
        { text = "You're quieter than your cousin.", next = "sark" },
        { text = "How do you train footwork?", next = "drill" },
        { text = "What did the plains teach you?", next = "plains" },
        { text = "Orcs fight with fury, not footwork.", next = "orc_fury", when = { race = "Orc" } },
        { text = "Trolls fight low and fast.", next = "troll_low", when = { race = "Troll" } },
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
      choices = {
        { text = "So which of you is the better teacher?", next = "sark_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sark_better = {
      lines = { { id = "sb_default", text = "Ask the warriors in a year, not today. Sark's students hit harder at the start, and mine are still standing at the end of the season, and that's all I'll say before he hears me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drill = {
      lines = { { id = "dr_default", text = "On the edge of the rise, with nothing behind you but the drop and the wind. A brave who learns to keep his hooves on that ledge won't stumble on flat ground in the Barrens." } },
      choices = {
        { text = "Has anyone ever fallen?", next = "drill_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drill_fall = {
      lines = { { id = "df_default", text = "Once, and the wind rider master caught him halfway down, and he has never stepped wrong since. I don't recommend the method, but I can't argue with the result." } },
      choices = {
        { text = "I'd like to try the ledge.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plains = {
      lines = { { id = "pl_default", text = "That a quiet hoof finds more game and meets fewer arrows. I hunted with my father long before I held an axe, and the hunt is all footwork and patience, which is everything a warrior needs and most of them lack." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_fury = {
      lines = { { id = "of_default", text = "And the orcs who lived through the Second War learned footwork anyway, or they wouldn't have lived. Fury carries you forward, and balance tells you where forward is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll_low = {
      lines = { { id = "tr_default", text = "They do, and I've watched the Darkspear braves at the Crossroads with some envy. A troll can duck under a swing that a tauren must take on the horns, so if you've a trick or two to share, I'll listen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    centaur = { { id = "tp_ce", text = "They aim for the legs. Remember that and you'll keep yours." } },
    earth_mother = { { id = "tp_em", text = "She gave us our weight. Learning to carry it well is how we honour her." } },
    background = { { id = "tp_bg", text = "A Ragetotem who trains warriors. I prefer to let my students speak for me." } },
    advice = { { id = "tp_ad", text = "Plant your back hoof before you swing. Everything else is decoration." } },
    _none = { { id = "tp_none", text = "I don't know. I'd rather say so than guess, and the Earth Mother respects an honest blank." } },
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
    { id = "g_hi", text = "Ho, a visitor! Sit, sit, by the fire; I was just about to tell a story." },
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
      again = { { id = "h_again", text = "What else, friend? I've a hundred stories left, and the night's long as a migration." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Tell me about getting lost.", next = "lost" },
        { text = "What's the best beast to tame?", next = "beast" },
        { text = "Tell me about Holt and Kary.", next = "trainers" },
        { text = "What should a young hunter never do?", next = "never", when = { class = "HUNTER" } },
        { text = "My grandfather told hunting stories too.", next = "tauren_stories", when = { race = "Tauren" } },
        { text = "Farewell, Urek.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I once followed a plains lion three days into the Barrens and woke up surrounded by Razormane, with my bow at the bottom of a waterhole. I came home on foot, very hungry and very much wiser." } },
      choices = {
        { text = "What did you learn?", next = "lost_end" },
        { text = "How did you get home?", next = "lost_home" },
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
      choices = {
        { text = "Which beast chose you?", next = "beast_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast_mine = {
      lines = { { id = "bm_default", text = "An old plainstrider who followed me home from Red Cloud Mesa when I was a calf and never left. She's long gone now, and I still look over my shoulder for her on the trail." } },
      choices = { { text = "Something else, Urek.", next = "BACK" } },
    },
    lost_home = {
      lines = { { id = "lh_default", text = "On foot, up the road to the Crossroads, where I begged a meal off an orc grunt who thought I was a very large ghost. He still tells the story at the inn, and his version is worse than mine." } },
      choices = {
        { text = "Did you ever find the bow?", next = "lost_bow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_bow = {
      lines = { { id = "lb_default", text = "A Razormane turned up near Camp Taurajo two summers later wearing it across his back, and Holt shot it clean off him at sixty paces. We hung it by the fire here, and I tell that story far more than I use the bow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trainers = {
      lines = { { id = "tn_default", text = "Holt is the archer, steady as a stone, and Kary could track a moth across bare rock, and I'm the one who talks. Between the three of us we turn out hunters who can shoot, find their quarry and tell a good story afterward." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    never = {
      lines = { { id = "nv_default", text = "Never shoot what you can't name, never camp downwind of a quilboar, and never follow a lion three days into the Barrens. I learned all three the hard way, and the last one twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren_stories = {
      lines = { { id = "ts_default", text = "Then he was a wise bull, because a hunt that isn't told is half wasted. The young ones learn more around the fire than they ever do on the trail, though they'd never admit it to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    quilboar = { { id = "tp_qb", text = "Smelly, angry and very good at hiding in thorns. Never camp downwind of one, friend." } },
    earth_mother = { { id = "tp_em", text = "She gave us the hunt, the beasts and a fire to tell stories by, and I thank her for all three every night." } },
    background = { { id = "tp_bg", text = "Thunderhorn, hunter, teller of stories. Some of them are even true." } },
    advice = { { id = "tp_ad", text = "Always know where the nearest water is. You'll be surprised how often it matters." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if you find out, come back and tell me the story, and I'll tell it round the fire for you!" } },
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
      again = { { id = "h_again", text = "Anything else? Be quick; An'she's going down and the tracks go with her." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What can tracks tell you?", next = "tracks" },
        { text = "Is Urek a good hunter, then?", next = "urek" },
        { text = "Read my tracks, then.", next = "read" },
        { text = "In the jungle, we track by smell and broken leaves.", next = "troll_jungle", when = { race = "Troll", class = "HUNTER" } },
        { text = "Could you track someone who doesn't want to be found?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Farewell, Kary.", next = "END" },
      },
    },
    tracks = {
      lines = { { id = "t_default", text = "Who passed, how heavy they were, whether they were hurt, and whether they were in a hurry. Quilboar drag their feet and centaur never do, and a kodo with a limp will tell you about it a mile off." } },
      choices = {
        { text = "I'd guess you can track people too.", next = "tracks_people" },
        { text = "Have you tracked anything strange lately?", next = "grim" },
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
      choices = {
        { text = "And what of Holt?", next = "holt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holt = {
      lines = { { id = "ho_default", text = "Holt doesn't waste words or arrows, and I respect both. He's the one who shot Urek's lost bow off a Razormane's back, though Urek tells it as a story about himself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grim = {
      lines = { { id = "gr_default", text = "Grimtotem hoofprints near the Stonetalon trail, a dozen of them, moving by night and keeping off the roads. Our own people don't walk like that unless they don't want to be seen." } },
      choices = {
        { text = "What are the Grimtotem after?", next = "grim_more" },
        { text = "Something else.", next = "BACK" },
      },
      learn = { "grimtotem" },
    },
    grim_more = {
      lines = { { id = "gm_default", text = "Magatha would call them simple traditionalists, and I'd say traditionalists don't hide their tracks. I told Cairne's guards what I saw, and that's as far as a tracker's duty goes, though I'll keep watching the ground." } },
      choices = { { text = "Something else, Kary.", next = "BACK" } },
    },
    read = {
      lines = {
        { id = "rd_default", text = "You favour your left side, you've slept on hard ground for a week, and something with claws has been at your boots. That isn't magic, only looking, and anyone can learn it who stops talking long enough." },
        { id = "rd_fk", when = { race = "Scourge" }, text = "Your steps are uneven, as if one leg doesn't always listen to you, and you leave grave dirt wherever you stand. That isn't magic, only looking, and I'd notice it on any of your kind." },
      },
      choices = {
        { text = "Teach me to see like that.", next = "read_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    read_teach = {
      lines = { { id = "rt_default", text = "Start with your own tracks. Walk across the soft ground below the rise, come back an hour later and tell me what they say about you, and you'll be surprised how much you didn't know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll_jungle = {
      lines = { { id = "tj_default", text = "Then you'd be half wasted on the plains, where the grass springs back and the wind carries the smell away. Walk the Mulgore trails with me one morning and I'll show you what the ground does instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Everyone leaves something, even your kind. The careful ones step on stones and the clever ones walk in streams, and the ones who think they leave nothing at all are always the easiest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_gt", text = "They walk at night and off the roads. Draw your own conclusions." } },
    quilboar = { { id = "tp_qb", text = "They drag their feet and leave a trail a calf could follow, which is the only kind thing I'll say about them." } },
    background = { { id = "tp_bg", text = "Thunderhorn, tracker, teacher. I've followed most things across Mulgore at one time or another." } },
    advice = { { id = "tp_ad", text = "Look down before you look ahead. The ground remembers what the wind forgets." } },
    _none = { { id = "tp_none", text = "No tracks on that one, not on any ground I've walked. Ask someone else." } },
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
    { id = "g_hi", text = "Hello, little one. Oh, and you too, I suppose; the Earth Mother made you both." },
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
        { id = "h_default", key = true, text = "I am Hesuwa Thunderhorn, and I teach your companions what they need to know, with you listening in. The Earth Mother made the beasts to learn quicker than their hunters, most days." },
        { id = "h_nothunt", when = { ["not"] = { class = "HUNTER" } }, text = "You've no companion with you, so I'm not sure what I can teach you. You could sit and watch, if you're quiet." },
      },
      again = { { id = "h_again", text = "Anything more? Your companion's getting restless." } },
      choices = {
        { text = "Teach my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you teach a beast?", next = "teach" },
        { text = "You seem to prefer beasts to people.", next = "people" },
        { text = "Urek says the right beast chooses you.", next = "choose" },
        { text = "What should I feed my companion?", next = "feed", when = { class = "HUNTER" } },
        { text = "My companion seems unhappy with me lately.", next = "unhappy", when = { class = "HUNTER" } },
        { text = "Darkspear tame raptors and bats, you know.", next = "troll_beasts", when = { race = "Troll" } },
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
      choices = {
        { text = "They say you raised orphaned calves.", next = "calves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calves = {
      lines = { { id = "ca_default", text = "Kodo calves, mostly, whose mothers fell to the centaur or the quilboar out on the plains. A calf that has lost its herd will follow anything warm, and for a few summers that was me." } },
      choices = {
        { text = "What became of them?", next = "calves_grown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calves_grown = {
      lines = { { id = "cg_default", text = "They grew and walked back to the herds, every one, and I was proud of them for it. Sometimes a big kodo on the plains stops and looks at me for a long while, and I like to think she remembers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    choose = {
      lines = { { id = "ch_default", text = "He's right, though he says it faster than I would. You can't force a bond any more than you can force the rain, so you go out and you wait and you're patient, and one day a beast decides you'll do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feed = {
      lines = { { id = "fd_default", text = "Whatever it would hunt for itself, as near as you can manage. A cat wants meat, a boar will eat nearly anything, and a wolf would rather share your supper than eat alone, so let it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    unhappy = {
      lines = { { id = "un_default", text = "Then ask yourself when you last fed it before you fed yourself, and whether you've dragged it into fights it didn't need. Beasts sulk like calves, and like calves they forgive quickly once you make it right." } },
      choices = { { text = "I'll make it right.", next = "BACK" } },
    },
    troll_beasts = {
      lines = { { id = "tb_default", text = "And I'd dearly love to see a Darkspear raptor up close, if it promised not to eat my students. The beasts of the Echo Isles must be very different from ours, but I'd wager they want the same things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    earth_mother = { { id = "tp_em", text = "She made the beasts first, the elders say, and us after, to look after them. I take that seriously." } },
    centaur = { { id = "tp_ce", text = "They took the mothers of too many of my calves. I try not to hate them, and most days I manage." } },
    background = { { id = "tp_bg", text = "Thunderhorn. I raised orphaned calves before I trained anyone's companion, and it's much the same work." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself, and it'll never leave you." } },
    _none = { { id = "tp_none", text = "I don't know, and neither does your companion, by the look of its ears." } },
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
    { id = "g_hi", text = "Looking for a real fight? The Frostwolf need strong hooves and strong hearts in Alterac." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the snow, or on your way to it?" },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 3 },
      text = "You wear a rank of the Horde. Then you've already bled for it, and the Frostwolf will be glad of you." },
  },

  start = "hello",
  nodes = {
    op_dwarves = {
      lines = {
        { id = "opd_q", text = "The Frostwolves have held that valley since before the dwarves came digging, and now the Stormpike want it all. You've seen the dwarves in your travels, so what do you make of them?" },
      },
      choices = {
        { text = "They're hard workers and fierce fighters. I'd rather them as friends.", next = "op_dwarves_r1", fx = { align = { light = 1 }, opinion = { dwarves = "respect" } } },
        { text = "They dig up anything that isn't nailed down. Drive them out of Alterac.", next = "op_dwarves_r2", fx = { affinity = 2, align = { light = -1 }, opinion = { dwarves = "hate" } } },
        { text = "I'm a dwarf, and the Stormpike have every right to that valley.", next = "op_dwarves_r3", fx = { affinity = -2, trait = { stubborn = 1 }, opinion = { stormpike = "support" } }, when = { race = "Dwarf" } },
        { text = "It's a valley full of snow. Neither side should bleed for it.", next = "op_dwarves_r4", fx = { trait = { practical = 1 }, opinion = { alterac = "waste" } } },
        { text = "I'd rather not take sides in Alterac.", next = "BACK" },
      },
    },
    op_dwarves_r1 = {
      lines = {
        { id = "op_dwarves_r1", text = "Fierce, yes, I'll grant you that much, and I'd rather fight them than drink with them, because the drinking's worse. Still, you're not wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_dwarves_r2 = {
      lines = {
        { id = "op_dwarves_r2", text = "Now that's the spirit I need up north! Go and tell Drek'Thar you said so, and bring your warmest cloak." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_dwarves_r3 = {
      lines = {
        { id = "op_dwarves_r3", text = "Ha! At least you say it to my face, which is more than the snow does. We'll see whose right holds up when the thaw comes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_dwarves_r4 = {
      lines = {
        { id = "op_dwarves_r4", text = "I've said the same thing a hundred times on the way home, and then I go back, every time. Don't ask me to explain it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Taim Ragetotem, and I muster fighters for the Frostwolf clan in Alterac Valley, where the dwarves of the Stormpike have come digging into Frostwolf land. It's cold, it's bloody, and Thrall's own people need us there." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Then you'll know the Frostwolf already, or know of them. Thrall's own clan, and the Stormpike dwarves are digging through their valley as we speak." },
        { id = "h_frost", when = { origin = "orc_frostwolf" },
          text = "You're Frostwolf born, aren't you? I can hear the mountains in your voice. Go home and fight for it, then, and take some tauren with you." },
      },
      again = { { id = "h_again", text = "More questions? The snow won't wait, and neither will the Frostwolf." } },
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
        { text = "Not every debt should be paid in blood.", next = "why_end", fx = { learn = { "alterac" } } },
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
      choices = {
        { text = "What do you make of the dwarves up there?", next = "op_dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ragetotem, like Sark and Torm. They train fighters, and I send them somewhere to fight." } },
    advice = { { id = "tp_ad", text = "Take a thicker cloak than you think you need. Then take another one." } },
    alterac = { { id = "tp_av", text = "The Frostwolf valley, in the mountains north of Hillsbrad. The Stormpike want it, and they can't have it." } },
    _none = { { id = "tp_none", text = "Don't know it. Ask me about the snow instead; it's nothing like the grass of home." } },
  },
}
