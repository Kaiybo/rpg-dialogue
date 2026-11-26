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
    first = "He is proud of his work and careless where it ends up.",
    third = "{name} met Mosarn, the Hunter Rise blacksmith who arms the braves of Thunder Bluff and anyone else with coin.",
  },

  greetings = {
    { id = "g_hi", text = "Speak up, friend; the anvils don't stop for visitors, not even for the Earth Mother herself." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did my armor hold, or have you come to complain?" },
    { id = "g_shield", when = { questActive = TODO_QUEST("The Black Shield") }, text = "Krog sent you up from Brackenwall with a shield? Let me see it, then, and hold it to the light." },
    { id = "g_shield_done", when = { questDone = TODO_QUEST("The Black Shield") }, text = "Has Krog found out who burned that inn in Dustwallow yet? I still think about that shield, which is more than I do about most I make." },
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
        { text = "A smith answers for where his work goes.", next = "BACK", reply = "And I do answer for it, every night when I bank the forge. But a shield that stops one arrow on a brave's chest is worth a hundred I worry over.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "You make shields. What others do isn't on you.", next = "BACK", reply = "The elders say so too, and most nights I believe them. On the other nights I sit by the forge and wonder anyway, which is no bad thing for a smith.", fx = { affinity = 1, align = { honor = -1 } } },
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
      lines = { { id = "k_default", text = "Tell him I'm sorry, but I can't say who carried it. Half the tauren in Dustwallow carry a shield like that, and the Grimtotem buy more than anyone, if that helps him at all." } },
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
    first = "He believes anything worth teaching is worth shouting.",
    third = "{name} met Sark Ragetotem, a loud warrior trainer on Hunter Rise.",
  },

  greetings = {
    { id = "o_dw_hate", when = { gossip = { topic = "dwarves", stance = "hate" } }, text = "My kinsman Taim says you want the dwarves out of Alterac! Good! Then train harder, because they hit like falling rocks!" },
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
        { id = "h_taurwar", when = { race = "Tauren", class = "WARRIOR" }, text = "A tauren warrior on the Ragetotem's rise! Plant your hooves, bull, and let me hear you roar, because a warrior who can't roar can't scare anything." },
        { id = "h_orcwar", when = { race = "Orc", class = "WARRIOR" }, text = "An orc! Your people roar almost as well as mine, and I've wanted to test that since the first day Thrall's warriors walked into Mulgore." },
        { id = "h_trollwar", when = { race = "Troll", class = "WARRIOR" }, text = "A troll warrior, all knees and grins! Torm will love your footwork, and I'll love knocking you over until you learn to keep it." },
        { id = "h_ruga", tags = { "news" }, when = { class = "WARRIOR", minLevel = 20, questBefore = TODO_QUEST("Trial at the Field of Giants") }, text = "You're strong enough for my cousin Ruga's trial now! He's at Camp Taurajo in the southern Barrens, and he'll send you into the Field of Giants to see if you can stand against things nobody's ever fought before." },
        { id = "h_rugadone", when = { class = "WARRIOR", questDone = TODO_QUEST("Trial at the Field of Giants") }, text = "Ruga says you came back from the Field of Giants quieter than you went, which is what he likes! I'd have liked it louder, but he's the patient one in the family." },
      },
      again = {
        { id = "h_again", text = "Well? Out with it! You're not a kodo calf, you can speak for yourself." },
        { id = "h_again2", text = "More questions? Good! Questions shouted are questions answered!" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's the hardest lesson?", next = "hard" },
        { text = "Why do the Ragetotem train warriors?", next = "tribe" },
        { text = "Have you fought the centaur?", next = "centaur" },
        { text = "How do I hold my ground against a charge?", next = "charge", when = { class = "WARRIOR" } },
        { text = "Teach me to use my rage, Sark.", next = "w_rage", when = { class = "WARRIOR" } },
        { text = "Who is this Ruga at Camp Taurajo?", next = "w_ruga", when = { class = "WARRIOR", minLevel = 16 } },
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
        { text = "A warrior fights only as long as needed.", next = "BACK", reply = "Good, you were listening, which puts you ahead of half the bulls I train. Now go show me you can hold back, because that's harder than swinging.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll enjoy a good fight, Sark. No shame in it.", next = "BACK", reply = "No shame in the joy of a clean bout, no, and I've felt it myself. Just watch that the joy stays in the fight, and doesn't follow you home.", fx = { align = { light = -1 } } },
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
      lines = { { id = "co_default", text = "Torm's my cousin, and so is Taim, the one sending braves off to Alterac to fight beside the Frostwolves! Ker's an older relation who trained me herself, and she still says I drop my shoulder, and she's still right!" } },
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
    w_rage = {
      lines = {
        { id = "wr_default", text = "Rage comes when you hit and when you're hit, so the worst thing you can do is stand there doing neither! Spend it as fast as it comes, on a heroic strike or a cleave, and you'll never feel the bruises until the fight's over." },
        { id = "wr_ber", when = { minLevel = 30 }, text = "You're old enough for the berserker's stance, and that's where rage runs hottest! Take it from Klannoc on Fray Island if you haven't, and then learn to come back out of it, or you'll fight like a stampede with no herd behind it." },
      },
      choices = {
        { text = "Rage is a gift. I'll let it run.", next = "BACK", reply = "Ha! That's a Ragetotem talking! Just remember Ker will have words with you if you trample the healer.", fx = { align = { order = -1 } } },
        { text = "Rage is a tool. I keep it on a rope.", next = "BACK", reply = "Torm would like that answer better than I do, but he's right more than I am. Keep the rope short.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_ruga = {
      lines = {
        { id = "wru_default", text = "Another cousin, and the quietest Ragetotem ever born, so the family sent him as far away as the Barrens! He watches the south from Camp Taurajo and tests warriors at the Field of Giants, where strange insects have come boiling up out of the ground." },
      },
      choices = {
        { text = "Insects? I'd have thought centaur were worse.", next = "w_ruga2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_ruga2 = {
      lines = { { id = "wru2_default", text = "So would I, but Ruga says these things don't fight like anything he's seen, and nobody knows where they come from! He'll send you after them, and when you come back, he'll send you to old Thun'grim the smith for armor worth wearing." } },
      choices = { { text = "Then I'll go to Ruga. Something else.", next = "BACK" } },
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
    background = { { id = "tp_bg", text = "I'm a Ragetotem and a warrior, and now a teacher, which means I hit things and then show others how!" } },
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
    first = "His voice is so quiet you have to lean in.",
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
        { id = "h_taurwar", when = { race = "Tauren", class = "WARRIOR" }, text = "A brave of the herd, with an axe instead of a spear. Stand on the ledge with me a moment, and I'll see by your hooves how much the plains have taught you already." },
        { id = "h_deadwar", when = { race = "Scourge", class = "WARRIOR" }, text = "A Forsaken warrior, so far from your city. Your balance is a dead man's balance, stiff in the knees, and I think I can help with that if you'll be patient with me." },
        { id = "h_ruga", tags = { "news" }, when = { class = "WARRIOR", faction = "Horde", minLevel = 20, questBefore = TODO_QUEST("Trial at the Field of Giants") }, text = "You're ready to see my cousin Ruga, I think. He keeps watch over Camp Taurajo in the southern Barrens, and he tests warriors who think they're done learning to stand." },
        { id = "h_islander", tags = { "news" }, when = { class = "WARRIOR", faction = "Horde", minLevel = 30, questBefore = TODO_QUEST("The Affray") }, text = "You're thirty now, and steadier than most. There's a human named Klannoc Macleod on Fray Island, off the coast south of Ratchet, who tests warriors for the berserker's stance, and I think you're ready to be tested." },
      },
      again = {
        { id = "h_again", text = "Something else? Take your time, as the grass does." },
        { id = "h_again2", text = "Ask, if you like. The wind is quiet up here, so I'll hear you." },
      },
      choices = {
        { text = "Teach me, Torm. I'll listen closely.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "How should I stand behind a shield?", next = "w_shield", when = { class = "WARRIOR", minLevel = 10 } },
        { text = "Tell me about this human on Fray Island.", next = "w_islander", when = { class = "WARRIOR", minLevel = 28 } },
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
        { text = "Discipline first, and the strength will follow.", next = "BACK", reply = "You listen better than most, {class}. Plant your feet, find your center, and the strength will come when you need it, not before.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather hit first and hard.", next = "BACK", reply = "So did the bulls face down in the Barrens, and they hit very hard indeed. Come back when you've been knocked flat once, and we'll talk again.", fx = { align = { order = -1 } } },
      },
    },
    w_shield = {
      lines = {
        { id = "ws_default", text = "Back hoof planted, front hoof light, so you can turn the shield toward a blow without moving your weight. Uzzek near Far Watch taught you the stance, I hope, but stance is only the shape, and footwork is what keeps the shape when something heavy hits it." },
        { id = "ws_tauren", when = { race = "Tauren" }, text = "You're heavy, and that helps, but a heavy thing pushed from the side still tips. Turn the shield, not your body, and let the blow slide off as rain slides off a hide tent." },
      },
      choices = {
        { text = "So the shield turns blows instead of stopping them.", next = "w_shield2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_shield2 = {
      big = true,
      lines = { { id = "ws2_default", text = "Exactly, and few warriors ever hear it, because they think a shield is a wall. A wall breaks eventually, and a shield that turns blows lasts until the fight is over, so which would you rather be for the ones behind you?" } },
      choices = {
        { text = "Something that bends and lasts, like the grass.", next = "BACK", reply = "Then you understand the plains better than most braves born on them.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A wall. Nothing gets past me.", next = "BACK", reply = "Walls fall all at once, and those behind them with it. Think on it, at least.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_islander = {
      lines = {
        { id = "wi_default", text = "Klannoc Macleod keeps a fighting grate on Fray Island, and he cares nothing for banners, only for how a warrior fights. Win his affray and you'll know the berserker's stance, and that is the one stance where my footwork matters least and your temper matters most." },
        { id = "wi_done", when = { questDone = TODO_QUEST("The Affray") }, text = "You've been, so you know what he is. If he sent you north to the troll at Chillwind Point, go, because the whirlwind weapons are worth the cold, but keep your feet when you face the wind lord." },
      },
      choices = {
        { text = "Why do you dislike the berserker's stance?", next = "w_islander2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_islander2 = {
      lines = { { id = "wi2_default", text = "I don't dislike it, but I've seen good warriors forget their feet in it, and a warrior who forgets his feet forgets everything else soon after. Use it to finish a fight, and step out of it before the fight finishes you." } },
      choices = { { text = "I'll mind my feet. Something else.", next = "BACK" } },
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
    background = { { id = "tp_bg", text = "I'm a Ragetotem who trains warriors, and I'd rather my students spoke for me than speak for myself." } },
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
    first = "Most of his stories are about getting lost.",
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
        { text = "Tell me about the beasts no one caught.", next = "u_tales", when = { class = "HUNTER" } },
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
        { text = "Knowing when to turn back is wisdom.", next = "BACK", reply = "It is, though it took me three days and a sore belly to learn it. Some lessons the plains only teach you the hard way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd have followed him a fourth day.", next = "BACK", reply = "Then you'd be the lion's supper, and he'd have a fine mane and a full belly. Go on, laugh, but I've buried hunters who thought the same.", fx = { align = { honor = -1 } } },
      },
    },
    beast = {
      lines = { { id = "b_default", text = "The one that chooses you back. Hesuwa, who trains our companions, will tell you the same, though he'll take longer about it and sound wiser." } },
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
    u_tales = {
      hub = true,
      narr = "He settles deeper by the fire and rubs his hands together, plainly delighted to be asked.",
      lines = {
        { id = "ut_default", text = "Every hunter on this rise has a beast they chased and never caught, and I've a story for each of them. Pick one, friend, and I'll tell it true, or nearly." },
        { id = "ut_high", when = { minLevel = 40 }, text = "You've caught a few of the beasts in my stories yourself by now, I'd wager. Pick one anyway, and tell me after whether I got it right." },
      },
      again = {
        { id = "ut_again", text = "Another? The fire's still good." },
        { id = "ut_again2", text = "Go on, pick another, and I'll try to keep this one shorter. I won't manage it." },
      },
      choices = {
        { text = "Tell me about the white lion of the Barrens.", next = "u_white" },
        { text = "Is Humar the Pridelord real?", next = "u_humar", when = { minLevel = 14 } },
        { text = "What about a cat called Broken Tooth?", next = "u_tooth", when = { minLevel = 30 } },
        { text = "Did you ever play dead to escape something?", next = "u_feign", when = { minLevel = 24 } },
        { text = "Enough stories for now, Urek.", next = "BACK" },
      },
    },
    u_white = {
      lines = {
        { id = "uw_default", text = "Echeyakee, whitemist in our tongue, and he's both mercy and death, the old hunters say. He can't be found by wandering; Sergra Darkthorn at the Crossroads keeps a horn that calls him, and she gives it only to hunters who've proved themselves on her other hunts." },
        { id = "uw_done", when = { killed = { name = "Echeyakee" } }, text = "You took him yourself, so you tell me! Was the white coat as hard to see in the grass as they say? I've never blown that horn, and I'm too old to start." },
      },
      choices = {
        { text = "Mercy and death? What do they mean by that?", next = "u_white2" },
        { text = "Back to the stories.", next = "u_tales" },
      },
    },
    u_white2 = {
      big = true,
      lines = { { id = "uw2_default", text = "That he takes the weak from the herds quickly, before they suffer, and that he'll take a careless hunter just as quickly. Some say a beast like that should be left to do his work, and Sergra says her hunters have to eat. Which do you say?" } },
      choices = {
        { text = "Leave him be. The plains need their mercy.", next = "u_tales", reply = "You'd have liked my grandmother, who said the same and never blew a horn in her life.", fx = { align = { order = -1 } } },
        { text = "Sergra's hunters come first. He must be hunted.", next = "u_tales", reply = "That's the camp's answer, and a fair one. Thank him when he falls, at least.", fx = { align = { order = 1 } } },
        { text = "Back to the stories.", next = "u_tales" },
      },
    },
    u_humar = {
      lines = { { id = "uh_default", text = "Real as you are, and black as a moonless night, lying under a lone tree west of Ratchet with his pride around him. When he's hurt he roars, and every lion in the pride comes running, which taught me to run faster than a lion, briefly. Hunters wait days to tame him, and some still have their legs." } },
      choices = {
        { text = "I'd wait a week for a beast like that.", next = "u_tales", fx = { trait = { brave = 1 } } },
        { text = "I'll keep the companion I have, thank you.", next = "u_tales", reply = "Ha! A wise hunter, and a loyal one. Your companion's glad to hear it, look.", fx = { affinity = 1 } },
      },
    },
    u_tooth = {
      lines = { { id = "uto_default", text = "A mountain cat in the Badlands, gray and scarred, and quicker than any beast I've heard of, so quick that some hunters say there's no better companion anywhere. I went looking for him once, got lost among the ogres, and came home with nothing but a sunburn and this story." } },
      choices = { { text = "Of course you got lost. Back to the stories.", next = "u_tales", fx = { trait = { witty = 1 } } } },
    },
    u_feign = {
      lines = { { id = "uf_default", text = "Once, in Thousand Needles, when a pack of Galak centaur came round a rock I'd sworn was empty. I dropped like a stone and lay there with my eyes shut while they argued over my bow, and when they rode off without it, I got up and walked home and told everyone I'd won." } },
      choices = {
        { text = "That isn't cowardice. It's sense.", next = "u_tales", reply = "That's what Holt said, though he laughed for an hour first.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd have stood and fought them.", next = "u_tales", reply = "And there'd be one less story by this fire, and one more name on the totems. Learn to drop when it counts.", fx = { align = { honor = 1 } } },
        { text = "Back to the stories.", next = "u_tales" },
      },
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
    first = "She notices where people have been before they say a word.",
    third = "{name} met Kary Thunderhorn, a sharp-eyed hunter trainer on Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "You've red dust all over you. Come up from the Barrens, have you?" },
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
        { text = "Teach me to read the trail, Kary.", next = "k_trail", when = { class = "HUNTER" } },
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
        { text = "Some people deserve to be hunted down.", next = "BACK", reply = "Then let the law of the Horde decide who they are, not your bow alone. Once you start choosing your own quarry among people, it gets easier every time.", fx = { align = { light = -1 } } },
        { text = "You're right. Keep the skill for beasts.", next = "BACK", reply = "I'm glad you see it, because not every young hunter does. The beasts never lie to you, and that's a better trail to spend your life on.", fx = { affinity = 1, align = { light = 1 } } },
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
    k_trail = {
      hub = true,
      lines = {
        { id = "kt_default", text = "Holt will teach you to hit what you aim at, and I'll teach you to find it first, which is the harder half. Ask what you like about the trail, and keep your eyes on the ground while you do." },
        { id = "kt_high", when = { minLevel = 35 }, text = "You read the ground better than you did, I can see it in how you came up the ramp, eyes down and then up. Ask what you like, and I'll see if there's anything left to teach you." },
      },
      again = {
        { id = "kt_again", text = "What else? An'she's still up, so the tracks are still good." },
        { id = "kt_again2", text = "Go on, and keep your eyes on the ground while you ask." },
      },
      choices = {
        { text = "How do I sense a beast before I see it?", next = "k_sense" },
        { text = "Can I track things other than beasts?", next = "k_more", when = { minLevel = 10 } },
        { text = "How do I see through my companion's eyes?", next = "k_eyes", when = { minLevel = 14 } },
        { text = "How do I learn a beast before I fight it?", next = "k_lore", when = { minLevel = 20 } },
        { text = "My people tracked by the wind, not the ground.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "Enough of the trail, Kary.", next = "BACK" },
      },
    },
    k_sense = {
      lines = { { id = "ks_default", text = "You learn what beasts do and where they'd rather be, until the knowing settles in you and you feel them on the plains like you feel rain coming. Some call it a gift from the Earth Mother, and I call it ten thousand hours on my belly in the grass, and I think we're both right." } },
      choices = { { text = "Back to the trail.", next = "k_trail" } },
    },
    k_more = {
      lines = {
        { id = "km_default", text = "You can, in time: people first, then the dead who walk, and later the hidden things, the elementals, the demons and the giants. Every one leaves a different trail, and the dead are the strangest, because they don't care where they step." },
      },
      choices = {
        { text = "Tracking people feels like hunting them.", next = "k_more2" },
        { text = "Back to the trail.", next = "k_trail" },
      },
    },
    k_more2 = {
      big = true,
      lines = { { id = "km2_default", text = "It is hunting them, and I won't dress it up. The Grimtotem move at night and the Venture Company cut where they please, and a tracker who refuses to follow people leaves her own people blind. Would you rather know who's coming, or be polite about it?" } },
      choices = {
        { text = "Know. A tracker serves the tribe, whoever it follows.", next = "k_trail", reply = "That's how I see it, and Cairne's guards seem grateful enough.", fx = { align = { order = 1 } } },
        { text = "Some trails should be left alone, Kary.", next = "k_trail", reply = "Maybe, and you'll have to decide which, out there alone. I only ask you to decide on purpose.", fx = { align = { order = -1 } } },
        { text = "Back to the trail.", next = "k_trail" },
      },
    },
    k_eyes = {
      lines = { { id = "ke_default", text = "You sit still, and you let your companion's eyes become yours for a while, and you see the plains the way a cat does, close to the ground and full of smells you've no word for. And with the eagle's eye you can see far over the plains yourself, which is less strange and more useful." } },
      choices = {
        { text = "Seeing as a beast does sounds like a druid's art.", next = "k_trail", reply = "The druids would say so too, and they'd be half right. We borrow; they become.", fx = { trait = { curious = 1 } } },
        { text = "Back to the trail.", next = "k_trail" },
      },
    },
    k_lore = {
      lines = { { id = "kl_default", text = "You study it, and the knowing tells you what it eats and how it fights and whether it would make you a companion, before you've drawn a single arrow. A beast that frightens easily you can send running with a word, which saves a lot of arrows on the Barrens." } },
      choices = { { text = "Back to the trail.", next = "k_trail" } },
    },
    k_sky = {
      lines = { { id = "ksk_default", text = "Then you'll have to learn the ground here, because the wind on the plains lies about which way the herd went. I'd like to hear what the wind tells you, though, and whether it's ever told you something the ground didn't." } },
      choices = {
        { text = "It tells me when a storm is coming.", next = "k_trail", reply = "So does my knee, but I'll grant the wind is prettier about it.", fx = { trait = { witty = 1 } } },
        { text = "Our spirits have been quiet. I hope they speak again.", next = "k_trail", reply = "Then I hope so too, and until they do, the ground will talk to you. It never stops.", fx = { affinity = 1 } },
      },
    },
    grim = {
      lines = { { id = "gr_default", text = "Grimtotem hoofprints near the Stonetalon trail, a dozen of them, moving by night and keeping off the roads. Our own people don't walk like that unless they don't want to be seen.", fx = { learn = { "grimtotem" } } } },
      choices = {
        { text = "What are the Grimtotem after?", next = "grim_more" },
        { text = "Something else.", next = "BACK" },
      },
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
    first = "He greets the beast before the hunter, and does not hide why.",
    third = "{name} met Hesuwa Thunderhorn, the pet trainer of Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Hello, little one. Oh, and you too, I suppose; the Earth Mother made you both." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Let me look at your companion first, and then we'll talk." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} is well fed and its coat is clean. You're taking care of it, and I can tell it knows." },
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
        { text = "Tell me about the bond with a companion.", next = "h_bond", when = { class = "HUNTER" } },
        { text = "How do you teach a beast?", next = "teach" },
        { text = "You seem to prefer beasts to people.", next = "people" },
        { text = "Urek says the right beast chooses you.", next = "choose" },
        { text = "What should I feed my companion?", next = "feed", when = { class = "HUNTER" } },
        { text = "My companion seems unhappy with me lately.", next = "unhappy", when = { class = "HUNTER" } },
        { text = "Darkspear tame raptors and bats, you know.", next = "troll_beasts", when = { race = "Troll" } },
        { text = "Farewell, Hesuwa.", next = "END" },
      },
    },
    h_bond = {
      hub = true,
      lines = {
        { id = "hb_default", text = "The bond between a hunter and a companion is the Earth Mother's oldest gift, older than the bow. Ask what you like about it, and your companion can listen, since it concerns them most." },
        { id = "hb_pet", when = { pet = { type = "Beast" } }, text = "{pet} is listening already, look at the ears. Ask what you like about the bond, and I'll answer for the both of you." },
      },
      again = {
        { id = "hb_again", text = "What else? Your companion has settled, so we have a little while." },
        { id = "hb_again2", text = "Ask on. I'd rather answer you than mend a bond that's broken." },
      },
      choices = {
        { text = "How does a companion grow to trust me?", next = "h_loyal" },
        { text = "What can you teach it that I can't?", next = "h_teach", when = { minLevel = 10 } },
        { text = "Should I trade my companion for a stronger beast?", next = "h_trade", when = { minLevel = 20 } },
        { text = "My companion fell. Will it forgive me?", next = "h_fell", when = { minLevel = 10 } },
        { text = "Tauren hunters keep a companion for life, I'm told.", next = "h_life", when = { race = "Tauren" } },
        { text = "Enough of the bond, Hesuwa.", next = "BACK" },
      },
    },
    h_loyal = {
      lines = { { id = "hl_default", text = "The way a calf does, by being fed and kept close and never frightened by the one who feeds it. It begins rebellious and becomes unruly, which is no better, and then one season it settles, and after enough seasons it would walk into Razorfen with you. Only happiness moves it along, so keep it happy above everything." } },
      choices = { { text = "Back to the bond.", next = "h_bond" } },
    },
    h_teach = {
      lines = { { id = "ht_default", text = "To growl so its foes turn from you, to grow a thicker hide, and to stand against fire and frost and the shadow that the Scourge carry. The wild never taught it those, because the wild never asked it to guard anyone. You'll have to teach it the bites and claws yourself, by taming beasts that already know them." } },
      choices = { { text = "Back to the bond.", next = "h_bond" } },
    },
    h_trade = {
      lines = { { id = "htr_default", text = "You can, and many do, and the stable master will keep the old one for you if you can't bear to let it go. But a new companion starts rebellious, however strong it is, and the old one already knows your step. Strength can be taught, and trust has to be grown." } },
      choices = {
        { text = "Then I'll keep the one that knows my step.", next = "h_bond", reply = "Good. Bring it to me when it's ready to learn, and we'll make it strong together.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hunter needs the strongest beast there is.", next = "h_bond", reply = "Needs it, maybe, for the hardest hunts. Stable the old one kindly, then, and visit it.", fx = { align = { light = -1 } } },
        { text = "Back to the bond.", next = "h_bond" },
      },
    },
    h_fell = {
      lines = { { id = "hf_default", text = "It will, for beasts forgive more easily than we do, but it will come back hungry and unhappy, and it will remember. Call it back while there's warmth in it, feed it at once, and don't drag it straight back into the fight that felled it." } },
      choices = {
        { text = "It fell because I chose the fight badly.", next = "h_fell2" },
        { text = "Back to the bond.", next = "h_bond" },
      },
    },
    h_fell2 = {
      big = true,
      lines = { { id = "hf2_default", text = "Then say so, to it and to yourself, because it already knows. Some hunters blame the beast for being weak, and those are the hunters whose companions leave them one quiet morning." } },
      choices = {
        { text = "The fault was mine. I'll choose better.", next = "h_bond", reply = "Then it's already forgiven you, I'd wager. Look at it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A beast must learn to survive what I choose.", next = "h_bond", reply = "It will learn, and it will learn that you don't choose well. Be careful what you teach it.", fx = { align = { honor = -1 } } },
        { text = "Back to the bond.", next = "h_bond" },
      },
    },
    h_life = {
      lines = { { id = "hli_default", text = "The old ones did, and some still do. My grandmother's hawk outlived two of her bows and sat on her grave post for a season after she was gone, and nobody on the rise would chase it off. I think that's how it should be, though the young ones change companions like moccasins now." } },
      choices = {
        { text = "I'll keep mine as your grandmother kept hers.", next = "h_bond", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Back to the bond.", next = "h_bond" },
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
        { text = "If it's unhappy, I'd set it free.", next = "BACK", reply = "Then the Earth Mother will smile on you, and so will the beast, in its way. Bring it to me the first time it refuses you, because they all do once.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A companion learns to obey, in time.", next = "BACK", reply = "Some do, and they're good beasts for it. But obedience isn't the same as trust, and a beast knows the difference better than any hunter.", fx = { align = { light = -1 } } },
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
    first = "He talks about the snow as though it were a personal insult.",
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
        { text = "They're hard workers and fierce fighters. I'd rather have them as friends.", next = "op_dwarves_r1", fx = { align = { light = 1 }, opinion = { dwarves = "respect" } } },
        { text = "They dig up anything that isn't nailed down. Drive them out of Alterac.", next = "op_dwarves_r2", fx = { affinity = 2, align = { light = -1 }, opinion = { dwarves = "hate" } } },
        { text = "I'm a dwarf, and the Stormpike have every right to that valley.", next = "op_dwarves_r3", fx = { affinity = -2, trait = { stubborn = 1 }, opinion = { stormpike = "support" } }, when = { race = "Dwarf" } },
        { text = "It's a valley full of snow. Neither side should bleed for it.", next = "op_dwarves_r4", fx = { trait = { practical = 1 }, opinion = { alterac = "waste" } } },
        { text = "I'd rather not take sides in Alterac.", next = "BACK" },
      },
    },
    op_dwarves_r1 = {
      lines = {
        { id = "op_dwarves_r1", text = "Fierce, yes, and I've fought beside them and drunk beside them, and the drinking left the worse bruises. Still, you're not wrong." },
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
        { id = "op_dwarves_r3", text = "Ha! At least you say it to my face. We'll see whose right holds up when the thaw comes." },
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
      again = { { id = "h_again_x", text = "Speak, {class}. The snow in Alterac will not melt while we talk." }, { id = "h_again", text = "More questions? The snow won't wait, and neither will the Frostwolf." } },
      choices = {
        { text = "Send me to Alterac.", next = "BUSINESS" },
        { text = "Why should tauren fight for the Frostwolf?", next = "why" },
        { text = "What's it like in the valley?", next = "valley" },
        { text = "Why does a Ragetotem hate the snow?", next = "x_snow" },
        { text = "I'm an orc. The Frostwolves are my kin.", next = "x_orc", when = { race = "Orc" } },
        { text = "Do the Forsaken fight in Alterac?", next = "x_fs", when = { race = "Scourge" } },
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
      lines = { { id = "we_default", text = "Not every one, and the High Chieftain would rather none were. But the dwarves started this one, and better they find tauren horns waiting for them than orc children." } },
      choices = {
        { text = "Then I'll go. The Horde stands together.", next = "BACK", reply = "That's the spirit the Frostwolves need in the valley. Go with my blessing, and come back with your hide whole.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight for myself, not for old debts.", next = "BACK", reply = "Then fight for yourself, and the valley won't care why you came. Only know that the orc beside you will be fighting for you, whatever you fight for.", fx = { align = { order = -1 } } },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Snow up to your knees, wolves who are friendlier than the dwarves, and the cold gets into your horns so you hear it ringing for days. Every tauren who comes back says they'll never go again, and half of them are back within the month." } },
      choices = {
        { text = "What do you make of the dwarves up there?", next = "op_dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_snow = {
      lines = {
        { id = "xs1", text = "Because the Earth Mother made my hooves for grass and sun, and the valley gives me only ice. I have fought on the plains of Mulgore and the Barrens, and nothing there ever froze my horns to my helm." },
      },
      choices = {
        { text = "Then why do you send others there?", next = "x_snow2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_snow2 = {
      lines = {
        { id = "xs2", text = "Because Drek'Thar's Frostwolves sheltered Thrall when he was a hunted slave, and Thrall stood with us when the centaur would have scattered the tribes for good. A debt like that is paid in whatever weather it falls due." },
      },
      choices = {
        { text = "Have you fought there yourself?", next = "x_snow3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_snow3 = {
      lines = {
        { id = "xs3", text = "Twice, and I came home with a dwarf's hammer-mark on my shoulder and a great respect for wolves. The Frostwolf riders fight as one beast, and I have seen nothing finer, even among my own Ragetotem." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo1", text = "Then you hardly need me to send you, for your blood calls you to the valley already. Go to Drek'Thar, and tell him the tauren of Thunder Bluff still remember what the Frostwolves did for Thrall." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
    x_fs = {
      lines = {
        { id = "xf1", text = "They do, and the dwarves fear them more than they fear us, which I find strange. Your people do not feel the cold, and that alone makes you worth three tauren in Alterac's snow." },
      },
      choices = {
        { text = "A rare advantage. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    thrall = { { id = "tp_thrall", text = "Thrall gave us passage across the Barrens and a place in the Horde. The Frostwolves gave Thrall his name and his clan. We owe them both." } },
    background = { { id = "tp_bg", text = "Ragetotem, like Sark and Torm. They train fighters, and I send them somewhere to fight." } },
    advice = { { id = "tp_ad", text = "Take a thicker cloak than you think you need. Then take another one." } },
    alterac = { { id = "tp_av", text = "The Frostwolf valley, in the mountains north of Hillsbrad. The Stormpike want it, and they can't have it." } },
    _none = { { id = "tp_none", text = "Don't know it. Ask me about the snow instead; it's nothing like the grass of home." } },
  },
}

---------------------------------------------------------------------------
-- Sky Earthtotem, who keeps to the Hunter's Hall, and Rown Leaftender, a young hunter of the rise.
-- Light entries: the wiki gives no more than where they stand.
---------------------------------------------------------------------------
P:NPC {
  key = "sky_earthtotem", id = TODO_NPC("Sky Earthtotem"), name = "Sky Earthtotem", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "tradition" },
  notices = { "class", "race" },
  impression = {
    first = "A seasoned tauren hunter sitting in the Hunter's Hall, oiling a bowstring with the slow care of someone who has done it ten thousand times.",
    third = "{name} spoke with Sky Earthtotem in the Hunter's Hall on Hunter Rise.",
  },
  greetings = {
    { id = "g_default", text = "Sit, if you have the time. The Hunter's Hall was built for resting between hunts, and too few use it that way." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A fellow hunter, and your companion with you. Let {pet} lie by the fire; the hall has seen muddier paws." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. Sit, and tell me which way the herds were moving." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your people hunt the jungle the way we hunt the grass, low and patient, and I have always respected that." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry a warrior's weight on your shoulders. On the plains that much steel sings to every beast for a mile." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I have hunted Mulgore and the Barrens since before this city had bridges, and now I sit in the hall and tell the young ones where the game has gone. It is a good life for old knees." },
        { id = "h_young", when = { maxLevel = 15 }, text = "You have the look of someone fresh from Camp Narache. Listen well, and you'll come home from more hunts than you would otherwise." },
      },
      again = {
        { id = "h_again", text = "What else? Ask before the young ones come back and want the fire." },
        { id = "h_again2", text = "Go on. My bowstring isn't going anywhere, and neither am I." },
      },
      choices = {
        { text = "Where has the game gone?", next = "game" },
        { text = "What makes a good hunt?", next = "hunt" },
        { text = "You remember the bluff before the bridges?", next = "old" },
        { text = "You've hunted the Barrens too?", next = "barrens" },
        { text = "That bowstring looks older than I am.", next = "string" },
        { text = "Tell me about the other hunters on the rise.", next = "rise" },
        { text = "What should a hunter's companion be taught first?", next = "companion", when = { class = "HUNTER" } },
        { text = "Orcs hunt too. Do we do it wrong?", next = "orc", when = { race = { "Orc", "Troll" } } },
        { text = "Earth Mother guide your arrows.", next = "END" },
      },
    },
    game = {
      lines = { { id = "ga_default", text = "North and west, away from the quilboar and the Venture Company's machines at the Red Rocks. The plainstriders still come down to the Stonebull Lake in the evenings, but the great kodo herds walk farther from us every year." } },
      choices = {
        { text = "The Venture Company should be driven out by force.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Cairne will deal with them in his own time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Why do the kodo walk farther?", next = "kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo = {
      lines = { { id = "ko_default", text = "Kodo go where it is quiet, and the goblins are never quiet. Their saws cut the trees and their machines drink the water, and a herd that once grazed below the bluff now crosses into the Barrens and does not come back." } },
      choices = {
        { text = "Where do they go?", next = "kodo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo2 = {
      lines = { { id = "ko2_default", text = "South, past the Crossroads, and the oldest of them walk on into Desolace to die among their ancestors' bones. I saw that place once, as a young bull, and I have never wanted to hunt kodo since." } },
      choices = {
        { text = "A hunter should not grow soft over his quarry.", next = "BACK", reply = "Perhaps not, but a hunter who feels nothing for his quarry is only a butcher with a long reach.", fx = { align = { light = -1 } } },
        { text = "Some things should not be hunted at all.", next = "BACK", reply = "My father would have argued with you, and my grandfather would have agreed. I find I side with my grandfather more each year.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "Patience first, then a clean shot, and thanks to the beast before you touch it. A hunter who forgets the thanks will find, sooner or later, that the plains forget him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    old = {
      lines = { { id = "o_default", text = "Before the bridges we climbed by rope and ladder, and only the strong or the stubborn came up at all. When Cairne brought the tribes together and the orcs helped drive off the centaur, the city grew so fast I hardly recognized it." } },
      choices = {
        { text = "Do you miss the old way?", next = "old2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old2 = {
      big = true,
      lines = { { id = "o2_default", text = "My knees do not, I promise you. But we were wanderers for a long age, following the herds, and some of us still feel the stone is too still beneath us. The Grimtotem say we have grown soft living alongside outsiders. What do you say?" } },
      choices = {
        { text = "The city and the Horde keep the tribes alive.", next = "BACK", reply = "That is Cairne's answer, and I think it is the true one, though it sits a little heavily on an old wanderer.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Grimtotem aren't wrong. Walls make a people forget.", next = "BACK", reply = "Careful who hears you say that on the bluff. Still, I have thought it myself on long nights, and I won't pretend otherwise.", fx = { align = { order = -1 }, learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrens = {
      lines = { { id = "b_default", text = "Every summer of my youth, from the Crossroads down to Camp Taurajo, chasing zhevra and dodging centaur. The Barrens are honest country; everything there wants to eat you, and nothing pretends otherwise." } },
      choices = {
        { text = "The centaur are the worst of it.", next = "centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    centaur = {
      lines = { { id = "ce_default", text = "The Kolkar and the Galak have harried my people for generations, and they hunted us off these plains before the orcs came. I have killed centaur, and I took no joy in it, but I would do it again tomorrow to keep a camp safe." } },
      choices = {
        { text = "They should be driven from the Barrens entirely.", next = "BACK", reply = "Many say so. I only know the plains have never been empty of them, and I doubt they ever will be.", fx = { align = { honor = -1 } } },
        { text = "Defend the camps, but don't hunt them for sport.", next = "BACK", reply = "That is a hunter's answer. A war that has no end is fought one camp at a time.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    string = {
      lines = { { id = "st_default", text = "It is kodo sinew, twisted by my mate the winter we were joined, and I have restrung it more times than I can count without ever changing the knot she tied. A bowstring remembers who made it, the old hunters say." } },
      choices = {
        { text = "That's a fine thing to carry with you.", next = "BACK", reply = "It is, and it has never once broken in a hunt. She would say that was the knot, and I would say it was her.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "ri_default", text = "Urek talks, Holt shoots, and Kary finds anything that has ever left a track, and the three of them teach the young better than I ever could. Young Rown Leaftender wanders up here too, and spends more time looking at grass than at game." } },
      choices = {
        { text = "Is Rown a poor hunter, then?", next = "rown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rown = {
      lines = { { id = "rw_default", text = "No, he is a slow one, which is a different thing. He knows where every herb on the plains comes up after rain, and one day that will feed a camp when the arrows miss. I tell the others to stop laughing at him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    companion = {
      lines = { { id = "cp_default", text = "To lie still, before anything else. A beast that will hold quiet in the grass beside you is worth three that bite hard, and {pet} has the look of one who could learn it." } },
      choices = { { text = "I'll practise with {pet}. Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "or_default", text = "Not wrong, only hungry. Your people came to Durotar with little and hunted like it, and there is no shame in that. Now you have time to learn the slower way, and some of your hunters are learning it very well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    kodo = { { id = "tp_kodo", text = "The great kodo are the oldest friends my people have. Hunt them only when you must, and never the old ones." } },
    venture_company = { { id = "tp_venture", text = "Goblins with saws and no manners. They cut what the Earth Mother grew for a thousand years and sell it by the plank." } },
    advice = { { id = "tp_ad", text = "Know where the wind is before you know where the beast is." } },
    _none = { { id = "tp_none", text = "I only know the trails and the beasts on them, friend. Ask the elders for the rest." } },
  },
}

P:NPC {
  key = "rown_leaftender", id = TODO_NPC("Rown Leaftender"), name = "Rown Leaftender", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "eager" }, values = { "nature" },
  notices = { "class" },
  impression = {
    first = "A young tauren on Hunter Rise with leaves still caught in his mane, plainly fresh in from the plains.",
    third = "{name} spoke with Rown Leaftender on Hunter Rise.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! I'm only just back from the plains, so forgive the burrs, {class}." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I found peacebloom by the Winding Chasm this morning, if you're curious, and I know you are." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You're one of the Cenarion folk, aren't you? I can always tell; you look at the ground the way I do." },
    { id = "n_herbal", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! Do the spirits ever tell you where the herbs are? I've always wanted to ask one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm still learning the bow from the trainers here, though I confess I spend more time watching the grass grow than watching for game. My mother says I was named well, and she doesn't always mean it kindly." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no rush, which is part of my trouble." },
        { id = "h_again2", text = "Ask away. Sky says patience is a hunter's first gift, and it's the only one I've got so far." },
      },
      choices = {
        { text = "What do you watch for in the grass?", next = "grass" },
        { text = "A hunter has to learn to take a life.", next = "take" },
        { text = "Your mother doesn't approve, then?", next = "mother" },
        { text = "How are the trainers treating you?", next = "trainers" },
        { text = "Have you thought of becoming a druid instead?", next = "druid" },
        { text = "You've a burr stuck to your horn.", next = "burr" },
        { text = "I'm a hunter. Want some advice?", next = "advice", when = { class = "HUNTER" } },
        { text = "Good luck with the bow.", next = "END" },
      },
    },
    grass = {
      lines = { { id = "gr_default", text = "Which herbs come up after the rain, which places the plainstriders nest, where the wolves have been. The trainers say it's wasted time, but I've never once come home without knowing where to find something." } },
      choices = {
        { text = "What have you found lately?", next = "grass2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grass2 = {
      lines = {
        { id = "gr2_default", text = "Earthroot along the Red Rocks, and mageroyal thick by the lake where the Stonebull clan used to camp. And something odd: the grass near the Venture Company's camps is dying in rings, as if it were poisoned." },
        { id = "gr2_herb", when = { profession = "Herbalism" }, text = "You gather too, don't you? Then you'll want to know the earthroot is thick along the Red Rocks right now. But the grass near the Venture Company's camps is dying in rings, as if poisoned." },
      },
      choices = {
        { text = "Poisoned? Have you told anyone?", next = "grass3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grass3 = {
      big = true,
      lines = { { id = "gr3_default", text = "I told Kary, and she said goblins spill oil wherever they go, which is true. But I'm afraid if I keep quiet it'll spread, and if I say too much the elders will think I'm a calf crying wolf. What would you do?" } },
      choices = {
        { text = "Go to the elders. Better to be laughed at than silent.", next = "BACK", reply = "You're right. I'll take a handful of the dead grass with me so they can see it, and then they can laugh all they like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait on elders. Pull up their stakes yourself.", next = "BACK", reply = "Me? Against goblins with saws? Well, maybe I could pull up one or two stakes at night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    take = {
      lines = { { id = "t_default", text = "I know it, and I can, when I have to. I only think the hunt should be the last thing a tauren learns, not the first, and some of the older hunters laugh at me for it." } },
      choices = {
        { text = "You're right. Tend the land before you take from it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hunger doesn't wait for gentleness. Learn the bow.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother = {
      lines = { { id = "mo_default", text = "She's a hunter, and her mother was, and they both brought home plainstrider every week of my childhood. I think she hoped I'd be the same, and instead I bring home flowers and tell her where the plainstriders are." } },
      choices = {
        { text = "Telling her where they are still feeds the family.", next = "mother2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother2 = {
      lines = { { id = "mo2_default", text = "That's what I keep saying! Last winter she followed my directions and brought home three in a day, and she didn't say a word about it, but she did put an extra bead in my mane." } },
      choices = { { text = "That sounds like approval to me. Something else.", next = "BACK" } },
    },
    trainers = {
      lines = { { id = "tr_default", text = "Holt is patient with me, which is kind, since I'm the worst shot on the rise. Kary says I'd track well if I didn't stop for every flower, and Urek just tells me stories about getting lost, which I think is his way of being encouraging." } },
      choices = {
        { text = "And Sky Earthtotem in the hall?", next = "sky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky = {
      lines = { { id = "sk_default", text = "Sky is the only one who never laughs at me. He told me once that a slow hunter isn't a bad hunter, he's just one who hasn't found his reason yet, and I've been thinking about that ever since." } },
      choices = { { text = "Sounds like wise counsel. Something else.", next = "BACK" } },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "I've thought of it every day for a year. Turak Runetotem's people on the Elder Rise speak of the Cenarion Circle and Moonglade, and it sounds like everything I'm already doing, only with someone telling me it matters." },
        { id = "dr_druid", when = { class = "DRUID" }, text = "You'd know better than me! Is it true you learn to hear what the land needs? Turak's people make it sound like everything I'm already doing, only with someone telling me it matters." },
      },
      choices = {
        { text = "Then go to the Elder Rise and ask.", next = "druid2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid2 = {
      lines = { { id = "dr2_default", text = "I will, I think, once I've learned the bow properly, so my mother can't say I gave up on it. A druid who can shoot can't hurt, can he?" } },
      choices = {
        { text = "Finish what you started first. That's wise.", next = "BACK", reply = "That's what I hoped someone would say. Thank you.", fx = { affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burr = {
      lines = { { id = "bu_default", text = "Oh, Earth Mother, again? Thank you. That's swiftthistle, I think, and it sticks to everything, which is how it spreads; clever plant, really, if a little rude." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "ad_default", text = "Yes, please! Everyone tells me to shoot faster, and nobody tells me how. How did you learn?" } },
      choices = {
        { text = "I watched my quarry until I knew it.", next = "BACK", reply = "Watching! I'm good at watching. Maybe I'm closer than I thought.", fx = { affinity = 1 } },
        { text = "Practice until your arms ache. There's no shortcut.", next = "BACK", reply = "That sounds like Holt. Fine, fine, I'll go back to the targets." },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_venture", text = "The grass dies around their camps. I don't know why, but I don't like it." } },
    advice = { { id = "tp_ad", text = "Look down sometimes. The ground tells you more than people think." } },
    _none = { { id = "tp_none", text = "I don't know about that, I'm afraid. Ask someone who spends less time looking at grass." } },
  },
}
