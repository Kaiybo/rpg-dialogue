-- Durotar's working people with no quests of their own: the Den's trainers and shopkeeper,
-- Razor Hill's weaponsmith and trainers, and Sen'jin's mage teacher. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_QUEST = P.TODO_QUEST
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- The Valley of Trials
---------------------------------------------------------------------------

-- Frang: the Den's warrior trainer. Loud, plain, fond of bruises.
P:NPC {
  key = "frang", id = TODO_NPC("Frang"), name = "Frang", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "brave", "dutiful" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Has buried recruits killed by Burning Blade imps; every warlock looks like their next recruiter." },
  notices = { "class", "weary", "lock_pact" },
  impression = {
    first = "He judges recruits by how fast they get back up.",
    third = "{name} met Frang, the warrior trainer in the Valley of Trials' Den.",
  },
  greetings = {
    { id = "g_war", when = { class = "WARRIOR" }, text = "On your feet, recruit! If you are here, you have bruises to show me, and I want to see them." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You are not one of mine, but stand up straight anyway; the Den does not like a slouch." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I've buried two recruits this season because of the Burning Blade's imps. You'll forgive me if I don't turn my back on you." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Stand over there, away from my recruits. I'll not have them thinking a demon's master is someone to copy." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've trained with the others and never once called that thing to finish a fight for you. Fine; you can stand closer, but not too close." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "That armor has been chewed on by every boar in the valley, and you still came back walking. Good, because walking back is the first lesson." },
    { id = "n_troll", cat = "class", when = { class = "WARRIOR", race = "Troll" },
      text = "A Darkspear with an axe! Your people fight loose and quick, so I will teach you to hold a line as well, and then you will be dangerous." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "That fever in your blood isn't from the sun, recruit, it's a warlock's pact, and I can see it on you. Fight beside the imp if you must, but don't let the heat make you reckless." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The young ones don't know enough to fear you. Their fathers do, because the Silver Hand stood over the camps with that glow, but these whelps were born after. Teach them a paladin can fight beside them, and maybe they'll never learn the old fear." } },
      choices = {
        { text = "I'll stand shoulder to shoulder with them.", next = "BACK", reply = "Good, and they'll remember it longer than any lesson I give them. Show them the Light can stand with orcs.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'd do well to fear me a little.", next = "BACK", reply = "A little, maybe, but fear makes bad shield-brothers. Teach them respect instead, and I'll thank you for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not to their faces, no, because they'd rather die than look soft in front of me. But I hear them talking at the fire, and they all know who put their ribs back where they belong, so take it as thanks when they grunt at you." } },
      choices = {
        { text = "A grunt is thanks enough, Frang.", next = "BACK", reply = "Good, because a grunt is all you'll get from them. From an orc, though, a grunt can mean a great deal.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They should thank me properly, or heal themselves.", next = "BACK", reply = "Properly? They're orcs, priest, and a grunt is as proper as it gets. Take it, or go heal somewhere quieter.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No, Thotar does that down in Razor Hill, but I've knocked a few hunters into the dirt for their own good. The boars of the valley don't care what you call yourself, so learn to keep your feet when they charge, and you'll thank me for the bruises." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "No, Thotar does that down in Razor Hill, but I've knocked a few hunters into the dirt for their own good. That {pet} of yours has a better charge than half my recruits. Don't tell them I said so, because they're sulky enough already." },
      },
      choices = {
        { text = "I'll learn to take a hit. Pride can wait.", next = "BACK", reply = "Then you'll keep your feet, and that's half the battle. Thotar can teach you the other half in Razor Hill.", fx = { align = { honor = 1 } } },
        { text = "My beast takes the hits so I don't have to.", next = "BACK", reply = "Until your beast goes down, and then the boar has you. Get in the ring and learn to take a hit anyway, hunter.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It needs everyone who fights for it, but the warriors hold the line so the rest of you can work. Remember that when you're sneaking off into the scrub, because some recruit of mine is standing in the open for you." },
      },
      choices = {
        { text = "I'll remember them, and I'll have their backs.", next = "BACK", reply = "That's what I want to hear. They'll grumble at you all week, and then one day they'll step in front of a spear for you.", fx = { align = { honor = 1 } } },
        { text = "Each fights their own way. I owe them nothing.", next = "BACK", reply = "You owe them your life, every time they stand in the open for you. Remember that, rogue.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I blame the power and anyone who trusts it, though I'll admit some of your sort are fighting the Blade too. Fight at my recruits' side, and keep whatever follows you off their heels, and I'll judge you by that." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I blame the power and anyone who trusts it, and I see you trust yours enough to bring it right up to my recruits. Fight at their side and keep that thing off their heels, and I'll judge you by that, because they're watching it far more than they're watching the Blade." },
      },
      choices = {
        { text = "Then I'll fight at their shoulder, where they can see me.", next = "BACK", reply = "Then they'll see you fight, and they'll judge you fairly. So will I, from right behind you.", fx = { align = { order = 1 } } },
        { text = "Your blame is your own business, warrior.", next = "BACK", reply = "It is, and I'll keep it. Show me different, and maybe I'll change it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Better than you would think, and better than they used to. In the old Horde the shamans stood back and the warriors charged and nobody trusted anybody, but Thrall calls the storm with the same hammer he fights with, and the young ones are learning from him." } },
      choices = {
        { text = "Shoulder to shoulder with the warriors is the only way to fight.", next = "BACK", reply = "That's the new Horde, and I'm glad to see a shaman say it. Stand by my recruits, and keep the lightning pointed the right way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the warriors charge. I'll strike where the enemy doesn't expect.", next = "BACK", reply = "Strike where you like, but don't leave my warriors alone out there. They need you close.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd like nothing better, so long as you remember they're recruits and not quilboar. Knock them down hard enough to teach them something and gently enough that Ken'jai, our priest, doesn't come shouting at me." } },
      choices = {
        { text = "I'll fight them fairly, and they'll learn something honest.", next = "BACK", reply = "Good, fair and honest, and they'll learn more than they expect. Knock them down well, and help them up after.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fight them the way the quilboar will. That's the real lesson.", next = "BACK", reply = "Hard lessons, then, but not too hard, or Ken'jai will come shouting. Go easy on the teeth.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That getting up is the only lesson, because every quilboar in the valley will knock you down and your spells won't save you if you stay there. Watch how my recruits fall, and learn to fall like them, and then get up and burn whatever knocked you over." },
      },
      choices = {
        { text = "I'll get up and fight again, every time.", next = "BACK", reply = "That's the lesson, and you learned it fast, mage. Most of them lie there sulking the first time.", fx = { align = { honor = 1 } } },
        { text = "Better to stay down until they turn their backs.", next = "BACK", reply = "That's a rogue's trick, not a mage's, and the quilboar don't turn their backs. Get up and fight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin in the Den! The young ones will stare. Let them; it'll teach them to keep their eyes up." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Stand back from the ring, then, because my recruits will want to show off for you, and you'll be busy soon enough." },
        { id = "h_default", key = true, text = "I am Frang, and I teach the warriors of the Den to fight like the Horde fights, shoulder to shoulder and never turning their backs. Everything else they learn out in the valley, mostly from boars." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Back from the valley, are you? Tell me what the quilboar taught you today, and then I will teach you something they cannot." },
        { id = "h_orcwar", when = { race = "Orc", class = "WARRIOR", maxLevel = 9 }, text = "An orc recruit with an axe in his hand and the Warchief's freedom on his back. Your father fought for demons and your grandfather for a clan that is gone, so you will be the first of your line to fight for the Horde as it should be." },
        { id = "h_trollwar", when = { race = "Troll", class = "WARRIOR", maxLevel = 9 }, text = "A Darkspear recruit, quick on your feet and laughing at my orcs. Good, laugh, and then show them how you trolls fought the murlocs on the Echo Isles, because they need to see it." },
        { id = "h_w10", tags = { "news" }, when = { class = "WARRIOR", minLevel = 10 }, text = "You have outgrown my Den, recruit, and I am prouder of that than I will ever say again. Tarshaw in Razor Hill and Grezz in Orgrimmar can take you now, and one of them will send you to Uzzek in the Barrens to learn the shield." },
        { id = "h_low", when = { maxLevel = 5 }, text = "You are greener than a cactus apple, but everyone starts green. Just don't stay that way, so get out there and come back hurt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman in my Den! Good, because when my recruits fall down you can tell the earth to hold them up, and save me some shouting." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid in my Den! Good, because a recruit who's been knocked down by a bear learns to get up faster than one who's only been knocked down by me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. I teach shoulder to shoulder and never turning your back, so you'll find little here for you except a sore lesson." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I've seen what the Burning Blade's imps leave of a recruit's face, and I've buried two this season. You've the same smell about you." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Same smell as the Burning Blade's lot, and I've dug the graves for what they leave behind. Speak your piece and keep your imp out of my yard." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've not shamed the Den yet, so I suppose you've earned a word or two. Go on, then." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in my training ground. Your beast can sit by the wall, and you can stand with my recruits, because it won't hurt you to learn to take a hit." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in the Den! Stand back from my ring, because my recruits throw each other, and I won't have them throwing a spellcaster." },
      },
      choices = {
        { text = "Do your recruits ever thank the priests for mending them?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Warriors and shamans can't fight well together, I'd guess.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you want a bear to spar with your recruits, Frang?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me, Frang. I've bruises to show.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "When do I learn to charge?", next = "w_charge", when = { class = "WARRIOR" } },
        { text = "Where do I go when the Den can't teach me more?", next = "w_after", when = { class = "WARRIOR" } },
        { text = "What does a warrior learn first?", next = "first" },
        { text = "Who else trains in the Den?", next = "den" },
        { text = "You fight like someone who learned the hard way.", next = "past" },
        { text = "Does the Horde need rogues as much as warriors?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd guess you train hunters too, Frang.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you blame everyone who smells of sulphur for the Burning Blade?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What should a mage learn from your recruits, Frang?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the recruits fear a paladin, Frang?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll leave you to your recruits.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Speak quick, because I have a recruit lying in the dirt out there who thinks he is resting." },
        { id = "h_again2", text = "Go on, ask. Questions do not bruise, though some answers do." },
      },
    },
    w_charge = {
      lines = {
        { id = "wc_default", text = "At four, when you can run without dropping your axe, and not a day before. Until then you shout the battle cry, and you rend whatever you hit so it bleeds while you hit it again." },
        { id = "wc_have", when = { minLevel = 4 }, text = "You have it already, so use it to close on the quilboar before they can call their friends. Charge, rend, and stand there, and don't chase anything that runs, because running things lead you to more of them." },
      },
      choices = {
        { text = "What do I do once I'm in among them?", next = "w_charge2" },
        { text = "Something else, Frang.", next = "BACK" },
      },
    },
    w_charge2 = {
      lines = { { id = "wc2_default", text = "Keep shouting, keep swinging, and keep your back to a rock. The rage builds as they hit you and as you hit them, and a warrior who has rage can do things a warrior without it cannot, so do not fear the blows." } },
      choices = {
        { text = "Then I'll take their blows and grow angrier.", next = "BACK", reply = "Good, but stay in charge of it, recruit. Rage that runs you is how our fathers got their demon blood.", fx = { align = { order = -1 } } },
        { text = "I'd rather not be hit at all, if I can help it.", next = "BACK", reply = "Sensible, and you will learn the shield for that. But a warrior who is never hit is a warrior who is never in front.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_after = {
      lines = {
        { id = "wa_default", text = "North to Razor Hill, where Tarshaw Jaggedscar teaches the same as me with more scars, and then to Orgrimmar, where Grezz Ragefist shouts. When you reach ten, one of them sends you west into the Barrens to Uzzek, and he teaches the shield." },
        { id = "wa_troll", when = { race = "Troll" }, text = "To Razor Hill, by way of Sen'jin if you want to see your people. Tarshaw teaches there, and at ten he will send you into the Barrens to Uzzek, who teaches the shield, and you will hate him for a week and love him for the rest of your life." },
      },
      choices = {
        { text = "Who is Uzzek?", next = "w_uzzek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_uzzek = {
      lines = { { id = "wu_default", text = "An old warrior who held a wall in Lordaeron for a day and a night while his clan charged out and died. He sits on a hill near Far Watch Post now and teaches young ones to stand, and every recruit I ever sent him came back better." } },
      choices = { { text = "Thanks, Frang. Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "How to take a hit and stay standing, because a warrior who falls down cannot protect anyone. After that comes the shield, and after that the charge, and the charge is the fun part." } },
      choices = { { text = "Why the shield before the charge?", next = "first_shield" } },
    },
    first_shield = {
      lines = { { id = "fs_default", text = "Because the young ones all want to run at the enemy screaming, and half of them would die doing it. Teach them to guard first, and the ones who live long enough to charge will charge well." } },
      choices = {
        { text = "Guarding your brothers matters more than glory.", next = "BACK", reply = "It does, and the ones who learn it live longest. I've never once buried a grunt who kept his shield up for his brother.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Glory is what a warrior fights for. Let them charge.", next = "BACK", reply = "Let them charge, and I'll be digging graves all season. Guard first, and let the glory find them if they live long enough.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else, trainer.", next = "BACK" },
      },
    },
    den = {
      lines = { { id = "d_default", text = "Gornek runs the Den and sends every recruit out with work, and the other trainers stand along these walls with me. Ken'jai teaches the priests, and the troll talks more gently than I do, but nobody listens to either of us until they have been bitten by something." } },
      choices = { { text = "And outside the Den?", next = "den_out" } },
    },
    den_out = {
      lines = { { id = "do_default", text = "Galgar cooks, Kzan mends the weapons you break, and Foreman Thazz'ril shouts at his lazy peons until the whole valley can hear him. When you are ready to leave, the road runs east to Sen'jin and north to Razor Hill." } },
      choices = { { text = "Thanks, Frang. Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "p_default", text = "In the internment camps, if you can believe it, with sticks behind the guards' backs. When the Warchief broke the camps open, those sticks became axes, and I have not put one down since." } },
      choices = {
        { text = "The camps made the Horde stronger.", next = "BACK", reply = "Stronger, maybe, but at a price no orc should have to pay. I'd rather we'd grown strong some other way.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The camps were a crime. Nothing good came of them.", next = "BACK", reply = "It was, and I'll never forget it. But the axe I picked up there is the one I still carry.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know axes, shields and how to stand up again, so ask Gornek about anything else." } },
    thrall = { { id = "tp_thrall", text = "The Warchief got knocked down a hundred times in a human arena and got up a hundred and one. That's the lesson, and that's the only one I teach." } },
    second_war = { { id = "tp_second_war", text = "The old warriors talk about the Second War, but they don't talk about losing it. I tell my recruits the truth, which is that losing is the only teacher worth having." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar are past the ridge, and you'll meet them sooner or later. When you do, hit the horse half first, because it's bigger." } },
  },
}

-- Ken'jai: the Den's priest trainer, a Darkspear troll of the old loa and the new Light alike.
P:NPC {
  key = "kenjai", id = TODO_NPC("Ken'jai"), name = "Ken'jai", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "calm" }, values = { "wise", "kind" },
  spiritSensitive = true,
  notices = { "class", "weary", "lock_stones" },
  impression = {
    first = "He talks of the spirits as neighbours to keep on good terms.",
    third = "{name} met Ken'jai, the troll priest trainer in the Valley of Trials.",
  },
  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, mon, you be one of mine. Sit down, catch your breath, and tell Ken'jai what the valley did to you." },
    { id = "g_other", text = "You be hurt, you come to Ken'jai, and if you be not hurt yet, give it a day in this valley. The boars here bite ankles, and the recruits run into cactus backwards." },
    { id = "g_loa", when = { origin = "troll_loa_speaker" }, text = "Ah, the one the loa talk to, come to the valley. Tell them Ken'jai say hello and keep the jokes kind, mon, because my recruits be bleeding enough without the spirits laughing at them." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Look at you, all torn up like the scorpids had a feast. Come closer and let Ken'jai see if anything be broken under there." },
    { id = "n_orcpriest", cat = "class", when = { class = "PRIEST", race = "Orc" },
      text = "An orc who heals instead of hits, now that be a rare thing. Your people forgot the spirits for a long time, so you be walking an old road almost alone." },
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "That green stone you be carrying, mon, it be a warlock's healthstone, and I can smell the life that was squeezed into it. Ken'jai heal you for nothing, so you don't need to go eating somebody else's." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We both mend what be broken, but my spirits be neighbours, and your Light be a stranger who burn you. Trolls watch the dead careful, mon. Mend the young ones beside me, and I watch you less." } },
      choices = {
        { text = "Then I'll mend them beside you, Ken'jai.", next = "BACK", reply = "Then we be partners, mon, and I watch you less already. The young ones need us both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I mend my own. Your recruits are yours.", next = "BACK", reply = "Then mend your own, and I mend mine, mon. But a recruit be a recruit, whoever they belong to.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Busy like the tide, mon, always comin' in. They come back from the boars and the scorpids with holes in them, and I close the holes, and Frang send them out to get new ones, so I tell every warrior the same thing: a shield cost less than my time." } },
      choices = {
        { text = "I'm grateful for every wound you close, Ken'jai.", next = "BACK", reply = "You be welcome, mon, and keep coming back, but not too often. Ken'jai can close a wound, but he can't put back what a boar already ate.", fx = { align = { light = 1 } } },
        { text = "Wounds are what priests are for. Keep them coming.", next = "BACK", reply = "They keep coming, mon, don't you worry about that. But I'd rather they came back with fewer holes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Light don't care if a wound be on a troll or a boar, mon, so yes, if the beast hold still. Most of them don't, and I got a scorpid scar on my wrist to prove it, so you learn to mend your own beast and we both be happier." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Light don't care if a wound be on a troll or a boar, mon, so yes, if the beast hold still. That {pet} of yours be lookin' at my bandages like they be dinner. Keep it close while I work, mon." },
      },
      choices = {
        { text = "I'll learn to mend my own beast, Ken'jai.", next = "BACK", reply = "The beast will thank you for it, mon, and so will Ken'jai. Fewer scorpid stings on my table.", fx = { align = { honor = 1 } } },
        { text = "Mending is your work, priest, not mine.", next = "BACK", reply = "Then your beast be coming to me, and I be charging double for the bites. Learn a little, mon.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "In Sen'jin they do, because Un'Thuwa, the mage teacher there, has students who be always singing their own eyebrows off. I don't mind mending them, so long as they learn something, and they always learn to duck." },
      },
      choices = {
        { text = "Then I'll learn to cast carefully, and spare you the work.", next = "BACK", reply = "Un'Thuwa's students could learn from you, mon. Half my bandages go to scorched eyebrows.", fx = { align = { order = 1 } } },
        { text = "Burns heal. I'll keep casting as I like.", next = "BACK", reply = "They heal, mon, but your eyebrows don't always grow back. Cast as you like, and duck.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I heal anyone who bleed, because the loa don't ask what you be before they give. But I watch what you bring with you, and if that thing touch a recruit, I won't be healing it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I heal anyone who bleed, because the loa don't ask what you be before they give. But that servant of yours be standing over my cots like a vulture, mon, and if it touch a recruit, I won't be healing it, so call it back." },
      },
      choices = {
        { text = "Fair. What follows me keeps its distance from the recruits.", next = "BACK", reply = "Then we get along fine, mon. The loa be watching that thing, and so am I.", fx = { align = { light = 1 } } },
        { text = "What follows me does what I tell it. That's all.", next = "BACK", reply = "Then tell it to stay away from my recruits, mon, or you be healing yourself next time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "All the time, mon, like any family. The Loa want respect and the elements want balance, and the shaman who forget either one find out quick, so Ken'jai keep good terms with everybody and mend whoever get burned." } },
      choices = {
        { text = "Respect for every spirit is what keeps us whole.", next = "BACK", reply = "It be, mon, and you got a wise head on young shoulders. Ken'jai wish half his recruits thought so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The elements serve my purpose, and the Loa can wait.", next = "BACK", reply = "The Loa can wait, but they don't forget, mon. Careful who you keep waiting.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not so different, mon, because both of us be asking somethin' bigger to fix what got broke. You ask the land and the beasts and I ask the loa, and as long as the recruit get up, I don't think either one be jealous." } },
      choices = {
        { text = "Healers should work together, whatever power they draw on.", next = "BACK", reply = "That be the way, mon, and Ken'jai be glad to work beside you. A bleedin' recruit don't care who mends him, only that somebody does.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My craft is my own, and I keep it apart from priests.", next = "BACK", reply = "Then keep it apart, mon, but the recruit still bleed the same. Maybe one day we work together.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I heal everybody, mon, because the spirits don't ask what you do with your hands before they mend them. But I see the cuts on you, and some of them be from behind, so you be careful who you sneak around, because the quilboar sneak too." },
      },
      choices = {
        { text = "I'll keep my blades for the Horde's enemies.", next = "BACK", reply = "Good, mon, then I mend you gladly. There be plenty of quilboar and Kul Tirans to keep those blades busy.", fx = { align = { honor = 1 } } },
        { text = "I sneak around whoever I like, Ken'jai.", next = "BACK", reply = "Then I mend you anyway, mon, but I be counting the cuts from behind. The quilboar sneak too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one carryin' the Light. Frang hits them, I fix them, and you, mon, I don't know what to do with you yet." },
        { id = "h_default", key = true, text = "I be Ken'jai, and I teach the priests of the Den to mend what the warriors break. Frang hits them, I fix them, and between us the young ones learn something." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "Every priest who come back from the valley a little stronger make Ken'jai proud, mon. What you need to learn today?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The spirits and the Loa be cousins, mon, so you and Ken'jai already be family of a sort." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, mon! You mend the body with green magic and I mend it with the loa's blessing, so come and help me with Frang's recruits whenever you like." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, mon! You can make the fire, and I can mend the burns, so between us the young ones will learn quick." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "You come to a priest's hut with that cold on you, mon. Either you be very brave or you be very hurt, and I hope it be the second." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Frang send you over to get patched up again, or did you come on your own feet this time?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast get hurt out there too, I bet, and nobody in the valley know how to fix it but you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, mon? Ken'jai mend priests, warriors and whoever else fall down, and rogues fall down too, just more quietly." },
      },
      choices = {
        { text = "Do your Loa and my elements ever disagree, Ken'jai?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Green magic must be very different from a priest's.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Where does your healing come from?", next = "power" },
        { text = "A troll seems out of place in an orc valley.", next = "troll" },
        { text = "You must mend a great many recruits.", next = "mend" },
        { text = "Do Darkspear priests and mages often work together?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do Frang's recruits keep you busy, Ken'jai?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can a priest heal a hunter's beast, Ken'jai?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess you won't heal someone like me, Ken'jai.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you heal rogues too, Ken'jai?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can a troll priest and a Forsaken paladin work together?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more, mon? Ken'jai got time while nobody be bleeding." },
        { id = "h_again2", text = "Ask, ask. The spirits be quiet today, so I can listen." },
      },
    },
    power = {
      lines = { { id = "p_default", text = "From the spirits, from the strength inside you, and from what the humans call the Light, though I think they all be one river with many names. A priest who argue about the name while somebody bleeds be a bad priest." } },
      choices = { { text = "What about the dark side of it?", next = "power_dark" } },
    },
    power_dark = {
      lines = { { id = "pd_default", text = "Every river got a dark pool where the water go still, and some priests learn to drink from it. It be strong medicine, but Ken'jai warns every student that the shadow remember who visits." } },
      choices = {
        { text = "Power is power. I'll use what works.", next = "BACK", reply = "It works, mon, but it remember you. Be careful how deep you drink.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'd rather heal than drink from that pool.", next = "BACK", reply = "Then you be wiser than most, mon, and the loa will smile on you. Stay in the sunlight, far from that pool.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "t_default", text = "The Darkspear owe Thrall a life debt, mon, because he pulled us off an island where the humans and the murlocs were hunting us. So when he asked for teachers in this valley, Ken'jai came, and the orcs have been good to me." } },
      choices = { { text = "Where are the rest of your people?", next = "troll_where" } },
    },
    troll_where = {
      lines = { { id = "tw_default", text = "At Sen'jin Village on the coast, east of here, and some in Orgrimmar with Vol'jin. The Echo Isles were meant to be our home, but Zalazane took them with his voodoo, so for now the village be home enough." } },
      choices = { { text = "I hope you get the isles back.", next = "BACK", fx = { affinity = 2 } } },
    },
    mend = {
      lines = { { id = "m_default", text = "More than Frang would like to admit, mon, and most of them from the mottled boars and the scorpids by the hills. The worst ones come back from the caves in the north, where the Burning Blade keep their little demons." } },
      choices = { { text = "What do the imps do to them?", next = "mend_imps" } },
    },
    mend_imps = {
      lines = { { id = "mi_default", text = "Burn them and scratch them, mostly, and the burns of a fel creature heal slower than a boar's bite. Zureetha Fargaze up the hill send recruits to kill the familiars, so Ken'jai sees a lot of singed eyebrows." } },
      choices = { { text = "Thank you, Ken'jai. Now something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ken'jai knows healing and the Darkspear, mon, but not that. Ask Gornek, he knows everything in the valley." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits be like neighbours, you see, and you keep them sweet with gifts and good manners. Forget them, and they forget you." } },
    holy_light = { { id = "tp_holy_light", text = "The humans pray to something they call the Light, and I hear it heals as well as the spirits do. It don't sit right with me, though, because a light like that never asks your name." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear take care of their own, and since Thrall, the orcs be our own too. That's why I patch up Frang's recruits, even when they don't deserve it." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin's a good chief for the trolls, mon. He listens to the old ones and the young ones both, and that's harder than it sounds." } },
  },
}

-- Duokna: sells general goods to the Den's recruits.
P:NPC {
  key = "duokna", id = TODO_NPC("Duokna"), name = "Duokna", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "brisk" }, values = { "practical" },
  notices = { "purse", "hunger", "lock_shards" },
  impression = {
    first = "Nobody leaves without being asked about their waterskin.",
    third = "{name} bought supplies from Duokna, who keeps general goods for the recruits of the Valley of Trials.",
  },
  greetings = {
    { id = "g_shop", text = "Water, bread, thread and bags, everything a recruit forgets until it is too late. We had none of it in the camps, so nobody leaves my shop without it. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, so the valley has eaten through your supplies already. That is what it does." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your coin purse is lighter than a feather, recruit. The boars carry a little copper sometimes, if you are not too proud to look." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Your bag clinks cold, warlock, and I can feel it from behind the counter, so I know you've been filling it with shards again. Buy some bread too, because I don't think souls are very filling." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everyone needs something. My father came out of the camps with nothing but the clothes the Silver Hand gave him, and he swore his children would never walk without a pack. You're dead, but you'll want thread for that armour, I expect." } },
      choices = {
        { text = "Thread then, and thank you for asking.", next = "BACK", reply = "Thread it is, and a good spool too. My father would be glad to see you use it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I need nothing from anyone, Duokna.", next = "BACK", reply = "Nobody needs nothing in Durotar, and you'll learn that the first time the sun gets you. Come back when you do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I keep linen and water aside for whoever's doing the mending, because the young ones never think of it. If you're short, take what you need and pay me later, but bring the empty skins back, because water's dear in this valley." } },
      choices = {
        { text = "I'll pay you back and return every skin, Duokna.", next = "BACK", reply = "That's all I ask. Take what you need, and bring the skins back full the next time you're passing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your linen's for bleeding grunts. I'll take what I need.", next = "BACK", reply = "Take it, then, but the grunts will notice who took the bleeding grunts' linen. Bring the skins back, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Water, bandages and a spare shirt, in that order, because the axe only matters if you live long enough to swing it. Durotar's sun kills more careless recruits than the quilboar ever do, so fill your waterskin here before you go stomping off toward Razor Hill." } },
      choices = {
        { text = "I'll go prepared. Only fools march dry.", next = "BACK", reply = "Smart, and you'll live longer for it. Fill your waterskin, and go.", fx = { align = { order = 1 } } },
        { text = "A real warrior doesn't need coddling, Duokna.", next = "BACK", reply = "A real warrior needs water like anyone else, and the sun doesn't care how real you are. Take a skin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Meat for the cats and wolves, and almost anything for the boars, which is why boars are cheap to keep and cats are not. I keep tough jerky for the hunters heading out to Razor Hill, and I've never seen a beast turn it down, though I've seen a few recruits try." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Meat for the cats and wolves, and almost anything for the boars, which is why boars are cheap to keep and cats are not. Your {pet} looks hungry, but they always do. Feed it before you feed yourself, and it'll remember." },
      },
      choices = {
        { text = "My beast eats first. That's only fair.", next = "BACK", reply = "That's a good hunter, and your beast will love you for it. Here's the jerky.", fx = { align = { honor = 1 } } },
        { text = "It can hunt its own food. That's what beasts do.", next = "BACK", reply = "It can, but it'll be hungry and slow when you need it. Buy the jerky, hunter.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Once, a troll with quick fingers and slow feet, and Gornek made him carry water for a month. Buy what you need, and I'll treat you like any recruit, because that's what you are until you prove otherwise." },
      },
      choices = {
        { text = "I'll pay for every scrap. I'm no thief.", next = "BACK", reply = "Good, then we'll get along. I've no use for Gornek's water-carriers.", fx = { align = { honor = 1 } } },
        { text = "Count all you like. You'll never catch me.", next = "BACK", reply = "Maybe not, but Gornek will, and he's not as forgiving. Pay for what you take.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Bread, if you're tired of the conjured kind, which tastes like sand, from what the trolls say. And thread, because those robes tear on every cactus in the valley, and a mage with a torn robe looks like a scarecrow." },
      },
      choices = {
        { text = "Thread and bread, then. I'll buy honest goods.", next = "BACK", reply = "Thread and bread, then, and you'll look less like a scarecrow. Good choice.", fx = { align = { order = 1 } } },
        { text = "Conjured's free. Your bread costs coin.", next = "BACK", reply = "Free and tasteless, from what the trolls say. My bread costs coin and tastes like bread.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everything except the totems, because every one of you thinks the spirits will carry the rest. The spirits won't fill your waterskin, so take one from me and stop asking the river." } },
      choices = {
        { text = "A full waterskin honours the spirits too. I'll take one.", next = "BACK", reply = "It does, and I'm glad someone thinks so. Here's your skin.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land provides when I need it, so I travel light.", next = "BACK", reply = "The land's dry, shaman, and the spirits are busy. Take a skin anyway, just in case.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some could, in a kinder place, but Durotar's springs are few and the Burning Blade have fouled at least one of them. Take the waterskin, and if you find a clean spring the grunts don't know about, tell me where it is." } },
      choices = {
        { text = "I'll take the waterskin. Better prepared than proud.", next = "BACK", reply = "Smart druid, and rarer than you'd think. Bring me word of that spring if you find it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust the land. A druid shouldn't need a merchant's waterskin.", next = "BACK", reply = "Trust it all you like, but the land's been fouled. Take a skin, druid, just in case.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Bread, mostly, because your sort think about soul shards and forget their stomachs. Buy food and water before you go down into the valley, and never feed any of it to the little one, because it'll only spit it back at you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Bread, mostly, because you all think about soul shards and forget your stomachs, and I see your demon is already eyeing my water barrel. Buy food and water before you go down into the valley, and don't let it near the bread, because it'll only spit it back at you." },
      },
      choices = {
        { text = "I'll share mine with the recruits who forget theirs.", next = "BACK", reply = "That's kind of you, and the recruits will remember it. Buy a little extra, then, because they always forget.", fx = { align = { light = 1 } } },
        { text = "Every recruit carries their own. I won't share mine.", next = "BACK", reply = "Fair enough, as long as you carry enough for yourself. The little one still doesn't get any.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I don't suppose you need a waterskin, but every other recruit forgets something, so tell me what you forgot." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Then you'll want bandages and clean water, because prayers go further when the wound's been washed." },
        { id = "h_default", key = true, text = "I am Duokna, and I keep the goods for the Den. My father walked out of the camps with nothing, so I make sure the young ones walk out of here with a waterskin at least." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your totems are heavy, so I'll ask you what I ask everyone, which is whether you remembered to carry water as well." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll tell me you can live off the land, I suppose, and I'll tell you that Durotar's land is mostly rock, so take a waterskin anyway." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in my shop. Count your goods, Duokna, I always say to myself, and I'm saying it now." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage? You can conjure water, so you're the one recruit who won't need my waterskins. Shame, they're good waterskins." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Let me guess: you've got an axe and nothing else, and you want to know why you're always thirsty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want food for your beast as well as yourself, and you'd be surprised how many hunters forget the second part." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Did you remember water? Whatever follows you won't fetch it." },
      },
      choices = {
        { text = "Do you keep supplies aside for healers, Duokna?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do shamans usually forget to carry?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A druid could live off the land out there, Duokna.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What should a recruit carry?", next = "carry" },
        { text = "Where do your goods come from?", next = "supply" },
        { text = "Young rogues must steal from the Den now and then.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is there anything you sell that a mage needs?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do new warriors forget to buy, Duokna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the beasts of Durotar eat, Duokna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do folk with my studies forget to carry, Duokna?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the dead need supplies, Duokna?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'm fine for now.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit, or are you ready to pay for that waterskin?" },
      },
    },
    carry = {
      lines = { { id = "c_default", text = "Water first, because Durotar is dry and the sun is not kind. Then something to eat that is not a cactus apple, and a bag big enough to carry whatever the quilboar drop." } },
      choices = { { text = "Cactus apples look fine to me.", next = "carry_apple" } },
    },
    carry_apple = {
      lines = { { id = "ca_default", text = "They are fine, if you like spines in your tongue, and Galgar makes a fine dish from them when someone gathers enough. Raw off the plant, they are a lesson most recruits only need once." } },
      choices = {
        { text = "I'll take your bread, then.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "Carts come down from Razor Hill and Orgrimmar when the roads are clear, and the peons haul it up from the gate. If the peons are asleep again, it does not get hauled, and Thazz'ril hears from me." } },
      choices = {
        { text = "The peons work hard. Go easy on them.", next = "BACK", reply = "They do, when they're awake, and I'll grant you that. Thazz'ril could stand to be gentler.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Lazy peons should be woken with a stick.", next = "BACK", reply = "Thazz'ril uses a blackjack, and it barely works. A stick won't do much better.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell bread and bags, recruit. Ask Gornek if you want answers about anything bigger." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar don't carry water, they steal it. Don't give them the chance, and buy a second skin." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built this valley so new orcs could learn in it, and the new orcs keep forgetting their waterskins. I think he'd want me to keep reminding them." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins sell water for silver, and I sell it for copper. Somebody's getting cheated, and it isn't my customers." } },
  },
}

---------------------------------------------------------------------------
-- Razor Hill
---------------------------------------------------------------------------

-- Uhgar: Razor Hill's weaponsmith.
P:NPC {
  key = "uhgar", id = TODO_NPC("Uhgar"), name = "Uhgar", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff" }, values = { "proud", "craft" },
  notices = { "kit", "craft", "lock_shadow" },
  impression = {
    first = "He judges a fighter by the edge they carry.",
    third = "{name} met Uhgar, the weaponsmith of Razor Hill.",
  },
  greetings = {
    { id = "g_shop", text = "Blades, axes and maces, all of them sharp enough for orc hands. Look, but do not touch the edges unless you are buying." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Show me what you did to the last one I sold you." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have a smith's burns on your hands. Then you know what you are looking at, so I will not bother lying about the quality." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My steel's gone dull where your shadow falls on it, and I polished it this morning. Stand over there by the axes nobody buys, and we'll talk." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do; the Warchief carries one. But the Silver Hand's knights carried hammers and the Light both, and grunts my age saw what came down on the camps. If you'll carry one for the Horde, I'll sell you the best I've got." } },
      choices = {
        { text = "For the Horde, and nothing else. Show me the best.", next = "BACK", reply = "Then you'll have it, the best in Razor Hill. Carry it well.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I carry what I like. Show me what's cheapest.", next = "BACK", reply = "Cheapest it is, and you'll be back for a better one. I'll keep the good one waiting.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because a mace doesn't care where it lands, I suppose, and a priest who has to fight wants it done quickly. The trolls carry their own little knives for their rites, though, and I don't sell those and don't ask about them." } },
      choices = {
        { text = "A clean blow ends a fight with the least suffering.", next = "BACK", reply = "That's a priest's thinking, and a good one. A mace, then, and swing it like you mean to finish the fight.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever lands hardest is what I'll carry.", next = "BACK", reply = "Then take the heaviest mace I've got, and swing it hard. The quilboar won't argue.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something heavy enough to crack a scorpid shell and short enough to swing in a quilboar warren, which means an axe or a mace and never a fancy sword. The Kul Tirans carry long blades, and I've bought plenty of them cheap from grunts who found out how badly they work in the scrub." } },
      choices = {
        { text = "A good weapon earns its price. I'll pay it.", next = "BACK", reply = "Good, then you'll have one that won't fail you. Every blade on this rack was hammered here in Razor Hill, and I stand behind all of them.", fx = { align = { honor = 1 } } },
        { text = "I'd rather loot a Kul Tiran blade than pay for one.", next = "BACK", reply = "Loot all you like, but a Kul Tiran sword is long and fragile. Come back when it breaks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because scorpids get close and quilboar get closer, and a bow does nothing when a boar's tusk is in your knee. A light axe will save you more often than a bow, and I'll sell you one that won't pull your shoulder out of joint." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} is a weapon too, I suppose, though there's nothing I can sell you for it. Believe me, I've tried to think of something." },
      },
      choices = {
        { text = "I'll carry a blade, and fight close if I must.", next = "BACK", reply = "You'll be glad you did. Here's one that won't pull your shoulder out of its socket.", fx = { align = { honor = 1 } } },
        { text = "If it gets close, my beast deals with it.", next = "BACK", reply = "Until your beast goes down, and then you'll wish you'd listened. Buy a blade anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "In Durotar they do, because the spells run dry before the quilboar do, and then you need something to swing. Buy a sturdy one, and practice with it, because the Kul Tirans at Tiragarde won't wait for your mana to come back." },
      },
      choices = {
        { text = "A sturdy one, then. I'll practice with it.", next = "BACK", reply = "Good, and practice every day, out by the training dummies. The Kul Tirans won't wait for you to be ready.", fx = { align = { order = 1 } } },
        { text = "Spells are enough. I'll buy what's cheapest.", next = "BACK", reply = "Cheapest it is, then, but don't blame me when it breaks. Spells run dry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "One tried, a Burning Blade sympathiser with a blade that glowed green, and Gar'Thok's grunts dragged him off before I'd finished saying no. I sell honest steel to honest Horde, and I'd like to keep it that way." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "One tried, a Burning Blade sympathiser with a blade that glowed green, and Gar'Thok's grunts dragged him off before I'd finished saying no. You've got that same sulphur stink trailing behind you on that thing, so it stays off my counter, and I'll sell honest steel to you alone." },
      },
      choices = {
        { text = "Honest steel suits me. I'll keep my other work separate.", next = "BACK", reply = "Good, then we'll get along. I've no time for the ones who slip poison on my edges and blame the steel.", fx = { align = { light = 1 } } },
        { text = "Green glow sells, Uhgar. You're missing out.", next = "BACK", reply = "Green glow sells to the Burning Blade, and they don't pay for long. I'll stick to steel.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A mace, or a staff with iron on the end, because lightning finishes what a heavy head starts. Thrall carries the Doomhammer, and every young shaman in Razor Hill wants a hammer like it, though I tell them to learn to swing a small one first." } },
      choices = {
        { text = "A shaman should fight face to face, as the Warchief does.", next = "BACK", reply = "That's the Warchief's way, and the young ones will follow it. A mace it is.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather end a fight before the enemy ever reaches me.", next = "BACK", reply = "Then you'll want a staff, and a long one. The quilboar always get close eventually.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You'll need one when you're on two legs and out of breath, which happens more than any druid will admit, and the Kul Tirans at Tiragarde won't wait for you to change shape. A good mace has saved more of your kind than will ever thank me for it, so buy one and don't tell the others." } },
      choices = {
        { text = "The Kul Tirans deserve a fair fight, steel against steel.", next = "BACK", reply = "A fair fight, then, and good steel for it. Here's a mace that won't let you down.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Kul Tirans deserve nothing. I'll use whatever kills fastest.", next = "BACK", reply = "Whatever kills fastest is usually what I sell. Pick one, and swing it hard.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. A hammer, I suppose? I don't sell many to orcs; they remember who swung them at the camps." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll be wanting a mace, then, because I've never sold a priest a sword who didn't regret it." },
        { id = "h_default", key = true, text = "I am Uhgar, and I sell weapons to the grunts of Razor Hill and anyone else with coin. Durotar is a hard place, and a warrior of the Horde wants something better than a training axe before he leaves town." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, so you'll want a mace or an axe and not some little dagger. The spirits respect a weapon with weight behind it, or so the old shamans told me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid in a weapon shop. You'll want a staff or a mace, then, and something heavy enough that the Kul Tirans notice it before they notice the claws." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in a weapon shop. You'll be after a staff, then, and I'll find you one that won't snap on a quilboar's head." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I'll sell you a dagger, but I'll not put a curse on it, and I'll not buy back anything that whispers. You know the kind." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Put that training axe down before you embarrass us both, and let me show you something with an edge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want a gun or a bow from somebody else, but you'll want something for close work from me." },
      },
      choices = {
        { text = "Why are priests so fond of maces, Uhgar?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What weapon suits a shaman, Uhgar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A druid hardly needs your weapons, Uhgar.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What do you recommend?", next = "advice" },
        { text = "Who are Razor Hill's enemies?", next = "enemies" },
        { text = "I fight with spells, not steel.", next = "caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Mages here can't need much of a staff.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What weapon suits a warrior in Durotar, Uhgar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why would a hunter need your blades, Uhgar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Someone must have tried to sell you cursed weapons.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why don't orcs like hammers, Uhgar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? I have edges to grind." } },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Something heavy for the quilboar, because their hides are thick and their tusks are thicker. If you mean to fight the Kul Tirans at Tiragarde Keep, something quick, because a sailor dies to speed, not weight." },
        { id = "a_rogue", when = { class = "ROGUE" }, text = "For you, daggers, and keep them sharp enough to shave with. Kaplak teaches your kind in the burrow under the hill, and he will tell you the same." },
      },
      choices = { { text = "Someone taught you smithing well.", next = "advice_craft" } },
    },
    advice_craft = {
      lines = { { id = "ac_default", text = "Nobody taught me in a proper forge; I learned by mending the guards' blades in the camps, with whatever scrap they threw away. Now I work for orcs instead of guarding against them, and the iron is better too." } },
      choices = {
        { text = "That's a fine story, smith.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = { { id = "e_default", text = "The humans of Kul Tiras who built Tiragarde Keep on our coast, the Burning Blade cultists in their caves, and the centaur and quilboar on every border. Gar'Thok keeps the grunts busy with all of them." } },
      choices = {
        { text = "Drive the Kul Tirans into the sea.", next = "BACK", reply = "Gar'Thok would agree with you, and so would I. The sea's welcome to them.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let them be, if they keep to their walls.", next = "BACK", reply = "They don't, and they never have. But I'll sell to anyone who keeps them busy.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = { { id = "c_default", text = "Then carry a staff at least, because sooner or later a boar will get close enough to bite you mid-spell. I have a few, though I keep them in the back with the things nobody buys." } },
      choices = { { text = "Show me the staves.", next = "BUSINESS" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know steel and who needs cutting, and nothing else. Try Gar'Thok in the barracks." } },
    centaur = { { id = "tp_centaur", text = "Kolkar hide is thick and their bone is thicker, so you'll want a heavy edge for them. Bring the blade back after and I'll tell you how much it lost." } },
    quilboar = { { id = "tp_quilboar", text = "Quilboar bristles dull a blade faster than any armour. Ask the grunts who came back from the Barrens with chipped axes, and they'll tell you I'm right." } },
    thrall = { { id = "tp_thrall", text = "The Warchief carries the Doomhammer, Orgrim's old weapon, and it's the only weapon in Durotar I wouldn't want to sharpen. Some steel you just respect." } },
  },
}

-- Thotar: Razor Hill's hunter trainer.
P:NPC {
  key = "thotar", id = TODO_NPC("Thotar"), name = "Thotar", title = "Hunter Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "class", "pet", "lock_shards" },
  impression = {
    first = "He talks about beasts as if they were people worth respecting.",
    third = "{name} met Thotar, who teaches Razor Hill's hunters to read the land and trust their beasts.",
  },
  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and with the dust of the plains on you. Come and tell me what you have been tracking." },
    { id = "g_other", when = { ["not"] = { class = "HUNTER" } }, text = "You walk loudly, stranger, and every beast in Durotar heard you coming." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} keeps an eye on me while you talk, which means it is a good one. Never punish a beast for being wary of strangers." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "My wolf's hackles are up and she's growling at your bag, not at you, which tells me what's inside it. A beast knows a soul in a cage when it smells one." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They smell death and feel the Light, and they don't know which to trust. The grunts are the same, because they saw the Light in the camps on their jailers. Be patient with them all, beasts and grunts, and they'll come around." } },
      choices = {
        { text = "I'll be patient with them, Thotar.", next = "BACK", reply = "Good, and they'll come round in time. That boar in the end pen bit me for a month before it would eat from my hand.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll come round, or they'll keep their distance.", next = "BACK", reply = "Then you'll have a lonely road, and your beast will be the first to notice. Be patient.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd teach them to pay attention, which is most of what praying is, I think. A hunter who sits quiet beside a hurt beast and waits learns more about it than one who bandages it and walks off, and the beast learns more about him too." } },
      choices = {
        { text = "Patience heals as much as any spell, Thotar.", next = "BACK", reply = "It does, and the beasts know it better than we do. Sit with them, and they'll heal.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Speed heals better. A slow healer loses the beast.", next = "BACK", reply = "Sometimes, but a fast healer who doesn't listen misses the second wound. Be patient anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Where your enemy has been and where he's going next, which every scout and every tracker knows. The quilboar of Razormane Grounds leave tracks like a stampede, and if you follow them back you'll find their camps before they find you." } },
      choices = {
        { text = "Knowing the land wins fights before they start.", next = "BACK", reply = "It does, and every good hunter knows it. Learn the land, and the fights come to you.", fx = { align = { order = 1 } } },
        { text = "I find the enemy by charging. It always works.", next = "BACK", reply = "Until you charge into a quilboar ambush, and then it doesn't. Learn the tracks, warrior.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "To read tracks, and to learn which creatures should be left alone and which ones need to be hunted. A rogue who knows the land as well as the back alleys will last longer out here than one who only knows locks." },
      },
      choices = {
        { text = "Then teach me the land. I'll respect it.", next = "BACK", reply = "Good, then I'll teach you gladly. Start by reading the scorpid tracks in the dust outside the wall, and tell me which way they went.", fx = { align = { light = 1 } } },
        { text = "Locks pay better than tracks, hunter.", next = "BACK", reply = "Maybe they do, but the land outlasts every lock. Learn both, and you'll do well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A beast follows a hunter because it chooses to, and that thing follows you because it can't do anything else. I won't call you a cultist, but I'll tell you plainly that the land doesn't like what you've chained to you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A beast follows a hunter because it chooses to, and yours follows you because it can't do anything else, which I can see in the way it watches your back instead of the road. I won't call you a cultist, but the land doesn't like what you've chained to you, and neither do I." },
      },
      choices = {
        { text = "Then I'll keep it far from your beasts.", next = "BACK", reply = "Thank you, and my wolf thanks you too. Keep it far, and we'll get along.", fx = { align = { light = 1 } } },
        { text = "Choice is overrated. Chains don't break.", next = "BACK", reply = "They don't, and that's what worries me. Keep that thing far from my beasts, or they'll be howling all night.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and better than most hunters. My raptor would not cross the dry wash south of here for a week, and when I asked old Master Gadrin in Sen'jin about it he said an angry earth spirit had settled there, so now I listen when my beasts refuse a path." } },
      choices = {
        { text = "Then the beasts and the spirits both deserve our respect.", next = "BACK", reply = "They do, and I'm glad you see it. Listen to them both, and you'll live longer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that refuses a path should be made to cross it.", next = "BACK", reply = "Make it cross, and you'll lose it to whatever made it stop. Listen to your beast.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Both, and a hunter must know which one the day calls for. A druid wears the beast's very shape, which I think is a closer bond than any of mine, though I would not trade my companion for it." } },
      choices = {
        { text = "A beast is a partner, never a tool.", next = "BACK", reply = "That's the hunter's creed, and I'm glad to hear it. Your beast will know it too.", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Treat it as one.", next = "BACK", reply = "A weapon that loves you is still a weapon, but treat it like one and it stops loving you. Be careful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That the boars and scorpids out there were here before us, and they fight because the land is hard, not because they hate you. Freeze them if you must, but don't burn more than you need, because every one you kill is one fewer for the hunters to feed the village with." },
      },
      choices = {
        { text = "I'll kill only what I must.", next = "BACK", reply = "Then the land will thank you, and the scorpids will keep coming back for the next hunter.", fx = { align = { light = 1 } } },
        { text = "Beasts are beasts. I'll burn whatever's in my way.", next = "BACK", reply = "Then the land will run out of beasts, and so will you. Burn carefully, mage.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    h_road = {
      hub = true,
      narr = "He crouches and draws a line in the red dust with one finger, then a fork in it, then another.",
      lines = {
        { id = "hr_default", text = "Every hunter of the Horde walks the same road, though each walks it with a different beast. It starts here with a bow and a sting, it turns at the first beast you tame, and it ends somewhere I have never been, so listen while I can still guide you." },
        { id = "hr_low", when = { maxLevel = 9 }, text = "Your road is short yet, and it runs no farther than this hill. Learn your aspects and your stings, and when you have ten seasons of the hunt in your arms, come back, because then I will send you out to tame." },
        { id = "hr_tame", when = { minLevel = 10, maxLevel = 19 }, text = "You have reached the turn in the road, where a hunter stops walking alone. Everything you learn after this, you learn with a beast beside you, so choose it with care." },
        { id = "hr_high", when = { minLevel = 30 }, text = "You have walked most of the road already, and farther than this old orc has. Still, sit, because a hunter who stops asking where the road goes has usually stopped looking at the ground." },
      },
      again = {
        { id = "hr_again", text = "What else about the road? The dust will keep my lines until we are done." },
        { id = "hr_again2", text = "Ask. A hunter who asks once saves himself three bad hunts." },
      },
      choices = {
        { text = "What should I master before I tame anything?", next = "tr_aspect" },
        { text = "I'm ready to tame a beast, Thotar.", next = "tr_tame", when = { minLevel = 10 } },
        { text = "My beast sulks and won't fight well.", next = "tr_loyal", when = { minLevel = 10, pet = { type = "Beast" } } },
        { text = "Sergra speaks of a white lion in the Barrens.", next = "tr_white", when = { minLevel = 16 } },
        { text = "They say a hunter learns to die at thirty.", next = "tr_feign", when = { minLevel = 26 } },
        { text = "Orcs rode wolves before they ever drew bows.", next = "tr_orc", when = { race = "Orc" } },
        { text = "Darkspear hunters learned on the Echo Isles, not here.", next = "tr_troll", when = { race = "Troll" } },
        { text = "Enough of the road, Thotar.", next = "BACK" },
      },
    },
    tr_aspect = {
      lines = {
        { id = "tra_default", text = "Your aspects first, because a hunter who cannot take on the nature of a beast will never understand one. The monkey teaches you to slip a blow, the hawk to see the shot, and your serpent sting teaches you that a wound can keep fighting after your arrow has fallen." },
        { id = "tra_low", when = { maxLevel = 9 }, text = "Your aspects and your stings, before anything with teeth. Take on the monkey's quickness and you will slip the boars, and put a serpent sting in a scorpid and let the poison work while you step back, because patience kills more than arrows do." },
      },
      choices = {
        { text = "A sting that kills slowly seems cruel to me.", next = "tr_sting" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_sting = {
      big = true,
      lines = { { id = "trs_default", text = "Cruel to the beast, maybe, but kind to the hunter who would otherwise be standing in its reach. I teach the sting because a hunter alone must win without bleeding, and I teach the clean shot because the beast deserves to die quickly when you can manage it." },
      },
      choices = {
        { text = "A clean kill comes first. The sting is for need.", next = "h_road", reply = "Then you will kill fewer beasts badly, which is all I ask. The scorpids will not thank you, but the land will.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever wins the fight is the right tool.", next = "h_road", reply = "It is a tool, and you will use it, so use it well. Only remember that the beast felt every moment of it.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_tame = {
      lines = {
        { id = "trt_default", text = "Then I will give you a taming rod and three beasts to try it on: a dire mottled boar in the scrub, a surf crawler on the coast to the east, and an armored scorpid out by the rocks. You will keep none of them, because they are lessons, and the beast you keep should be one you choose." },
        { id = "trt_active", when = { questActive = TODO_QUEST("Taming the Beast") }, text = "You have the rod, so go and use it, and do not hurry the binding. If the beast breaks free and goes for your throat, it was not ready, and neither were you, so let it go and find another." },
        { id = "trt_done", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "You have tamed the boar, the crab and the scorpid and set them all free again, which is harder than it sounds. Now take what you learned to Orgrimmar, to Ormak Grimshot in the Valley of Honor, and he will teach you to train what you tame." },
        { id = "trt_trained", when = { questDone = TODO_QUEST("Training the Beast") }, text = "You have tamed, and Ormak has taught you to train, so there is nothing more of mine to give you at the start of the road. Every beast you tame from now on teaches your companion something, so tame widely even if you keep only one." },
      },
      choices = {
        { text = "Why set them free? I worked hard for them.", next = "tr_free" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_free = {
      big = true,
      lines = { { id = "trf_default", text = "Because a scorpid you tamed to pass a lesson is not your companion, it is your trophy, and trophies do not guard your back. The beast you keep should be the one you would grieve, and you will not grieve a crab." } },
      choices = {
        { text = "Then I'll wait for the beast I'd grieve.", next = "h_road", reply = "Good. You will know it when you see it, because it will be watching you before you draw.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A strong beast is worth keeping, grief or not.", next = "h_road", reply = "Strong is useful, and I will not pretend otherwise. But the day it falls, you will learn whether you chose well.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_loyal = {
      lines = {
        { id = "trl_default", text = "Then it is hungry or it does not trust you yet, and most often both. A new beast is rebellious, and it grows loyal only if it is fed what it likes and kept close, so feed {pet} before every hunt and never let it go to sleep unhappy." },
        { id = "trl_boar", when = { pet = { family = "Boar" } }, text = "A boar will eat anything you put in front of it, so if yours is sulking, the trouble is not in its belly. It is learning whether you stand your ground, and every time you run, it learns the wrong answer." },
      },
      choices = {
        { text = "And if it never grows loyal?", next = "tr_loyal2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_loyal2 = {
      lines = { { id = "trl2_default", text = "Then one morning it will be gone, back to the wild where nobody starves it, and you will have earned that. I have seen it happen to three of my students, and every one of them swore the beast was ungrateful." } },
      choices = {
        { text = "I'll feed it well. Back to the road.", next = "h_road" },
      },
    },
    tr_white = {
      lines = {
        { id = "trw_default", text = "Echeyakee, the white lion, whose name the tauren say means whitemist. Sergra Darkthorn at the Crossroads keeps a horn that calls him, and she gives it only to hunters who have already thinned the plainstriders and the zhevra and the prowlers for her." },
        { id = "trw_done", when = { killed = { name = "Echeyakee" } }, text = "You have already taken him, I hear, and brought his hide to Sergra. Then you know what I would have told you, that the white coat hides in the grass better than any beast has a right to." },
      },
      choices = {
        { text = "Are there other beasts like him?", next = "tr_rare" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_rare = {
      lines = { { id = "trr_default", text = "Humar the Pridelord, a black lion who lies under a lone tree west of Ratchet, and he roars for his whole pride when he is hurt. Hunters wait days to tame him, and in the Badlands there is a mountain cat called Broken Tooth who strikes faster than any beast I know of, and hunters wait weeks for him." } },
      choices = {
        { text = "A rare beast is the finest prize a hunter has.", next = "h_road", reply = "A fine beast, maybe, but no finer a companion than the boar who stands by you. Tame him if you can, and love him for more than his coat.", fx = { align = { order = -1 } } },
        { text = "I'd sooner keep the beast that has stood with me.", next = "h_road", reply = "Then you will never wait under a tree for three days, and your beast will never wonder if it was second best.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_feign = {
      lines = {
        { id = "trfd_default", text = "They do, and it is the strangest thing I teach. When the fight turns, you fall as if dead, and the beast that was tearing at you loses interest and wanders off, so long as your own beast is not still biting it." },
        { id = "trfd_high", when = { minLevel = 30 }, text = "You have learned it already, so you know how strange it feels to lie in the dust while something sniffs at your face. Do not lean on it, because the Scourge and the clever ones learn to wait for you to stand up." },
      },
      choices = {
        { text = "Playing dead feels like cowardice, Thotar.", next = "tr_feign2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_feign2 = {
      big = true,
      lines = { { id = "trfd2_default", text = "Every orc says that, and every orc who has learned it is still alive to say it. A possum does it and a beetle does it, and nobody calls the beetle a coward when it walks home afterwards." } },
      choices = {
        { text = "A hunter who lives can hunt again tomorrow.", next = "h_road", reply = "That is all the wisdom there is in it. Lie still, live, and come back for the beast later.", fx = { align = { honor = -1 } } },
        { text = "I'd rather fall fighting than lie in the dirt.", next = "h_road", reply = "Then you will fall fighting, and your beast will be left alone in the wild. Learn it anyway, and choose when you need it.", fx = { align = { honor = 1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_orc = {
      lines = { { id = "tro_default", text = "We did, on Draenor, and the Frostwolves still do in the mountains of Alterac, where the Warchief's father was chieftain. In the camps the humans took our wolves from us, and some of us learned to hunt with a bow because there was nothing left to ride." } },
      choices = {
        { text = "A wolf is a beast of war, not a pet.", next = "tr_orc2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_orc2 = {
      big = true,
      lines = { { id = "tro2_default", text = "The old Horde thought so, and they rode their wolves into human spears until there were almost none left. A Frostwolf will tell you the wolf chooses its rider as surely as a hunter's beast chooses its hunter, and that the clan that forgets this loses both." } },
      choices = {
        { text = "Then I'll treat a wolf as kin, as the Frostwolves do.", next = "h_road", reply = "The Warchief rides a wolf he speaks to like a brother, so you are in good company.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "War made us strong. The wolves served it well.", next = "h_road", reply = "They served it, and they died for it, and nobody asked them. Remember that when you ask yours.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_troll = {
      lines = { { id = "trtr_default", text = "They did, and I will not pretend to teach a Darkspear anything about raptors. Your people raised them from the egg on the islands, and the ones you brought to Sen'jin still let no one but a troll near the pens." } },
      choices = {
        { text = "Then what can an orc teach me?", next = "tr_troll2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    tr_troll2 = {
      lines = { { id = "trtr2_default", text = "Durotar, which is not the islands. Here the game is thin and the water is thinner, so you cannot take the old and the lame and leave the rest, because some years there is no rest. Learn to go hungry with dignity, and to share when you are not." } },
      choices = {
        { text = "That's a lesson worth having. Back to the road.", next = "h_road", fx = { affinity = 1 } },
      },
    },
    xorig_track = {
      lines = { { id = "xtr_default", text = "Then you know Durotar hides its game the way a miser hides coin, and you have the scars to show for it. Which beast tracked you back, the time you nearly did not come home?" } },
      choices = {
        { text = "A raptor, out along the Southfury River.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "A scorpid, and I never even saw it coming.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The beasts shy from you, I see. They'll learn your scent, and the grunts will learn your glow, in time." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. My hunters patch up their own beasts, mostly badly, so I'd be glad if you showed them how it's done." },
        { id = "h_default", key = true, text = "I am Thotar, and I teach the hunters of Razor Hill to read the land and to trust a beast at their side. In Durotar the land is mostly rock and the beasts are mostly angry, so there is plenty to learn." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "You have come for training, I think, and maybe for advice about your companion. Ask, and I will help with both." },
        { id = "h_path", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("The Hunter's Path") }, text = "Jen'shan sent you up from the valley, and she says you can wait in the dust without fidgeting. Good, because the next lesson is a beast, and beasts can smell a fidget." },
        { id = "h_taming", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("Taming the Beast") }, text = "You still have my taming rod, so there is still a beast out there waiting to be asked. Go gently, and if it fights the binding, let it go." },
        { id = "h_tamed", tags = { "news" }, when = { class = "HUNTER", questRecent = { TODO_QUEST("Taming the Beast"), days = 3 } }, text = "Boar, crab and scorpid, all tamed and all set free again. You have hands for it, so now go to Orgrimmar and let Ormak Grimshot teach you what to do with a beast you mean to keep." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, I think, and from Mulgore by the look of you. You will find the beasts of Durotar leaner and meaner than your plainstriders, but they are honest, and they will teach you if you let them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, I think. You and I listen to the same land, though you hear the spirits in it and I hear the beasts, so tell me what Durotar says to you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk like a cat on rock, rogue, and the scorpids don't even notice you. That's a skill worth having in Durotar." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Your beast doesn't belong in this land, and every beast that does can tell. My wolf has been growling since you came up the hill." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior at the hunters' corner. Stay and listen, because a warrior who reads the land charges at the right enemy." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You've no beast with you, but I'll talk about them anyway, because I talk about them to everyone." },
      },
      choices = {
        { text = "Would you teach your hunters to pray over their beasts?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your beasts must sense the spirits, Thotar.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you hunt the beasts or befriend them, Thotar?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Where does a hunter's road lead, Thotar?", next = "h_road", when = { class = "HUNTER" } },
        { text = "What beasts are worth taming here?", next = "beasts" },
        { text = "How do you choose a companion?", next = "choose" },
        { text = "What could a hunter teach a rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What should a warrior learn from the land, Thotar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What follows me isn't so different from a hunter's pet.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What should a mage know about Durotar's beasts?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do the beasts shy from me, Thotar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've tracked the scrub from the valley to the Barrens, Thotar.", next = "xorig_track", when = { origin = "orc_durotar_tracker" } },
        { text = "Farewell, Thotar.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Speak, and I will listen like a hunter listens." } },
    },
    beasts = {
      lines = { { id = "b_default", text = "The raptors of the Barrens to the west are quick and loyal once broken, and the scorpids here hold a line as well as any grunt. The wolves of Durotar are scrawny, but a scrawny wolf still knows how to run." } },
      choices = { { text = "Why a scorpid?", next = "beasts_scorpid" } },
    },
    beasts_scorpid = {
      lines = { { id = "bs_default", text = "Because nothing alive wants to bite through that shell, and a scorpid does not tire or complain. It will never love you the way a wolf does, but it will stand in front of you until it dies." } },
      choices = {
        { text = "Loyalty matters more than love.", next = "BACK", reply = "It does, in a scorpid, and it's a strange kind of comfort. You'll come to like it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A companion should choose to stand with you.", next = "BACK", reply = "Then get a wolf, and you'll have your choice. A scorpid chooses differently.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = {
        { id = "c_default", text = "Watch it hunt before you tame it, because a beast that hunts carelessly will fight carelessly beside you. When you find one that waits and watches, that is the one." },
        { id = "c_tauren", when = { race = "Tauren" }, text = "Your people already know this, I think, because the tauren have hunted beside the beasts of Mulgore for longer than we have been in Kalimdor. Watch it hunt, and pick the one that waits." },
      },
      choices = { { text = "Thank you, Thotar. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know tracks and beasts, and that is not either one. Ask Gar'Thok or Orgnil." } },
    centaur = { { id = "tp_centaur", text = "Centaur hunt like wolves, in packs, and they never stop running. It is a hard thing to respect them, but I do." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar keep their own beasts, boars as big as kodo calves, and they treat them better than they treat strangers. I find that worth thinking about." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren say the Earth Mother made every beast, and when I watch a pet come to a hunter's hand, I believe them. It is a gift, and gifts must be honoured." } },
    thrall = { { id = "tp_thrall", text = "The Warchief rides a great wolf, and he talks to it like a brother. That's how I know he's a good leader." } },
  },
}

-- Kaplak: Razor Hill's rogue trainer, down in the burrow under the hill.
P:NPC {
  key = "kaplak", id = TODO_NPC("Kaplak"), name = "Kaplak", title = "Rogue Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "sly" }, values = { "cunning" },
  notices = { "class", "stealth", "lock_eyes" },
  impression = {
    first = "He seems to enjoy being underestimated.",
    third = "{name} found Kaplak, the rogue trainer hidden beneath Razor Hill.",
  },
  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You found the burrow on your own, so you are learning. Come in, keep your voice low, and leave your pride at the door; it clanks." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "This burrow is not for sightseers, so either you are lost or you are nosy. Which is it?" },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice try, but I heard your buckle three steps ago. Wrap it in cloth next time and you might surprise someone who is not me." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { class = "WARLOCK", aura = { 132, 2970, 11743 } },
      text = "Those eyes of yours see through a cloak like it's gauze, don't they? Do me a favour and look somewhere else, because my students are trying to practise." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I trust nobody in my burrow. The Silver Hand marched into the camps with banners and trumpets, and everyone saw them coming, so I do it my way. If you're the kind who knows when to keep the glow down, we'll get on." } },
      choices = {
        { text = "I'll not hide the Light for anyone, Kaplak.", next = "BACK", reply = "Then you'll be the loudest thing in my burrow, and we'll see how long you last. Suit yourself.", fx = { align = { honor = 1 } } },
        { text = "I know when to keep it down. Quietly does it.", next = "BACK", reply = "Then we'll get on fine. Most of my students learn that the hard way, with a grunt's boot.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They need one more than they'd admit and less than they'd like, because a rogue who's been healed once starts taking chances. I'd rather they came back cut and careful, but if one doesn't come back at all, I'd be glad of someone to say the words over him." } },
      choices = {
        { text = "I'll say the words, and heal the ones who return.", next = "BACK", reply = "Thank you, priest, and they'll thank you too, the ones who come back. Say the words well, because the ones who don't come back still hear them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Rogues choose the dark. They can bury their own.", next = "BACK", reply = "They do, but someone still has to say the words. If not you, then me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "We do, and the good ones don't admit it, because it spoils the image. The warrior stands out front where the Kul Tirans can see him, and while they shoot at him my students walk around the back and finish it, so if you hear a scream behind the enemy line, that's teamwork." } },
      choices = {
        { text = "I'll stand out front. Someone has to.", next = "BACK", reply = "Good, and my students will thank you for it, quietly, from behind you.", fx = { align = { honor = 1 } } },
        { text = "Let the rogues take the front for once.", next = "BACK", reply = "Ha! They'd die, and you know it. Stand out front, and let them do what they do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of it, though you'll never be as quiet with a boar breathing at your heels. Tracking and stalking aren't so different, because both are about knowing where your prey will look and being somewhere else, and the best hunters in Durotar all have a boar scar to show for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some of it, though you'll never be as quiet with a boar breathing at your heels. Your {pet} would make a terrible thief, by the way, because it can't keep still when it's pleased with itself." },
      },
      choices = {
        { text = "I hunt in the open. Stalking is not stealing.", next = "BACK", reply = "It's not, and I respect that. But the craft is closer than you'd think.", fx = { align = { honor = 1 } } },
        { text = "Stalking, stealing, it's all the same craft.", next = "BACK", reply = "Now you're talking my language. The best hunters I've met would have made good rogues.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Some of you can turn invisible with a spell, I'm told, which is cheating, if you ask me. Learn to keep quiet without it, and you'll be twice as useful as those who rely on their tricks." },
      },
      choices = {
        { text = "Then I'll learn to stalk on my own two feet.", next = "BACK", reply = "Good, and you'll be twice as useful. I've seen a spell fizzle in the dark, but a careful foot has never once let me down.", fx = { align = { order = 1 } } },
        { text = "A spell does the job. Crawling through cactus is wasted effort.", next = "BACK", reply = "Until the spell fails, and then you're stuck in the cactus. Learn both, mage.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Sometimes, when someone needs a curse and a knife on the same target, though that green glow of yours lights up a dark alley like a bonfire. Work with my people if you like, but keep that thing out of sight, because it'll get us both killed." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Sometimes, when someone needs a curse and a knife on the same target, though that thing beside you glows worse than you do. Work with my people if you like, but send your demon away before we move, because it'll light up the alley and get us both killed." },
      },
      choices = {
        { text = "I'll keep it out of sight. Agreed.", next = "BACK", reply = "Good, then we'll work together. Keep it out of the burrow and away from my students.", fx = { align = { order = 1 } } },
        { text = "What's mine goes where it pleases. Deal with it.", next = "BACK", reply = "Then I'll deal with it by keeping you out of my burrow. Choose.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than they'd admit. A shaman who walks soft can call the wind to cover his steps and put frost on a man's legs before he knows he's been seen, and the Burning Blade never hear what's coming for them." } },
      choices = {
        { text = "I'd rather the enemy see me coming and fear it.", next = "BACK", reply = "Then you'll be a loud shaman, and the Blade will hear you coming. Your choice.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quiet kill is still a kill, and a quicker one.", next = "BACK", reply = "It is, and a quieter one too. You'll fit in well here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A cat already knows most of what I teach, which is to wait, to watch and to strike once. What I could teach you is the part that comes after, knowing when to keep your mouth shut, and that's harder for most folk than the killing." } },
      choices = {
        { text = "I'd rather strike openly, where the enemy can see me coming.", next = "BACK", reply = "Then you're a bear, not a cat, and that's fine too. My students will thank you for the cover.", fx = { align = { honor = 1 } } },
        { text = "Waiting in the dark and striking once suits me well enough.", next = "BACK", reply = "Then you've learned half the lesson already. The other half is keeping your mouth shut.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_spy = {
      lines = { { id = "xsy_default", text = "So you're the one paddling out past the reef while the rest of us sleep. Quiet work and good work, and nobody will ever sing about it, which is the best kind. Has Zalazane's lot ever come close to seeing you?" } },
      choices = {
        { text = "Once. I lay in the surf until dawn.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Never. They're hexed, not watchful.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin, here in my burrow. I didn't think your kind knew how to come in quietly. Most of them knock the door down." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, down here in the dark. You'll fit in better than you'd like to think, because the shadow you pray in is the same one I work in." },
        { id = "h_default", key = true, text = "Name's Kaplak, and I teach the quiet arts to those who have the stomach for them. The grunts upstairs win their honor in the open, but somebody has to handle the work that happens in the dark, and the Horde needs both." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, down in my burrow. Keep your thunder to yourself, friend, because the grunts upstairs don't need to know what goes on down here." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, down in my burrow, and quieter than most of my students. I hear your kind can walk as a cat, so I'll keep one eye on the shadows while we talk." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, down in my burrow? You're the last person I expected, because your kind glow too much to hide." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Down in the burrow with a light like that? Your little friend is giving away my hiding place, so put it out or take it outside." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, all noise and steel. The grunts upstairs could use you more than I can, though I'll admit you'd make a fine distraction." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You move almost quietly enough to be one of mine, though your beast gives you away." },
      },
      choices = {
        { text = "Do your rogues ever need a priest, Kaplak?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shamans can't have much use for the quiet arts.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a druid learn something from your quiet arts, Kaplak?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Why train down in a burrow?", next = "burrow" },
        { text = "What work happens in the dark?", next = "work" },
        { text = "Could a mage ever learn to move unseen?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess rogues work with warriors, Kaplak.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can a hunter learn to move like a rogue, Kaplak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do rogues ever work with my sort?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you trust a paladin in your burrow, Kaplak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I scout the Echo Isles by night, Kaplak.", next = "xorig_spy", when = { origin = "troll_echo_isles_spy" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick, because I do not like company standing in my doorway." } },
    },
    burrow = {
      lines = { { id = "b_default", text = "Because a rogue who trains in the open is a rogue everyone recognises later. Down here, my students learn their trade where nobody watches, and they leave with faces nobody remembers." } },
      choices = { { text = "I doubt Gar'Thok knows you're here.", next = "burrow_garthok" } },
    },
    burrow_garthok = {
      lines = { { id = "bg_default", text = "Gar'Thok knows everything that happens in his town, or he likes to think so. He leaves me alone because my students bring back what his grunts cannot, like word from the Kul Tiran keep and the cultists' caves." } },
      choices = {
        { text = "Spying is a dishonourable trade.", next = "BACK", reply = "Dishonourable, maybe, but it's kept Razor Hill standing. Gar'Thok can count the Kul Tirans on the beach because my lot counted them first.", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "Wars are won with knowledge, not honour.", next = "BACK", reply = "Exactly, and Gar'Thok knows it, even if he won't say so. Welcome to the burrow.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Scouting the Burning Blade's caves, mostly, and reading the papers the Kul Tirans leave lying around Tiragarde Keep. Orgnil Soulscar hunts the cultists in daylight, and my students make sure he knows where to look." } },
      choices = { { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If I knew, I would be the wrong orc to ask about it, wouldn't I?" } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt? Never heard of it, and neither have you, if you're smart. Some doors don't open from the outside." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are thieves in the north who think they're nobles. Real rogues work for something bigger than a pretty manor, and they don't wear purple." } },
    thrall = { { id = "tp_thrall", text = "The Warchief trusts the rogues who keep his secrets, and he's smart enough not to ask how. I like that in a chieftain." } },
    burning_blade = { { id = "tp_burning_blade", text = "The Burning Blade think they're clever, but they're loud, and they leave tracks. I could find them in my sleep, and some nights, I do." } },
  },
}

-- Tai'jin: Razor Hill's priest trainer, a Darkspear woman.
P:NPC {
  key = "taijin", id = TODO_NPC("Tai'jin"), name = "Tai'jin", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "warm" }, values = { "kind", "devout" },
  spiritSensitive = true,
  notices = { "class", "weary", "lock_taint" },
  impression = {
    first = "She does not hide that she misses the sea.",
    third = "{name} met Tai'jin, the troll priest trainer at Razor Hill.",
  },
  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, a healer come to see Tai'jin! Sit down, sit down, and tell me what you be needing." },
    { id = "g_other", text = "Welcome, mon. If you be hurt, Tai'jin can see to it, and if not, you can still keep me company." },
    { id = "g_echo", when = { origin = "troll_echo_isles" }, text = "Another one from the isles, mon! You smell the sea on the wind from here too, don't you? Every night I tell myself we going back, and every morning I go mend orcs instead." },
    { id = "g_sailed", when = { origin = "troll_sailed_with_thrall" }, text = "You was on that shore with us when the Warchief's ships come, I know your face. The sea witch nearly have us all, mon, and now look at us, mending orcs in their own desert like we been cousins forever." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Look at that armor, mon, it be held together with stubbornness. Let Tai'jin look at the cuts underneath before you go back out." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "There be a fel heat coming off you, mon, like the old orcs who drank Mannoroth's blood and never stopped burning. Tai'jin don't judge, but he think you been drinking from a dark cup a long time." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Different, mon. My gifts come from the spirits and the sea, and yours come from the humans' Light that burn the dead. I watch the dead careful, but if you can mend a grunt bleedin' from a Kul Tiran blade, I be glad of the help." } },
      choices = {
        { text = "Then I'll mend your grunts beside you.", next = "BACK", reply = "Then we be partners, mon. Grunts bleed faster than one troll can bind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll mend those who earn it, Tai'jin.", next = "BACK", reply = "Earn it how, mon? A grunt bleedin' be a grunt bleedin', and the loa don't ask.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, mon, from the quilboar and the Kul Tirans both, and they act like a cut be an insult instead of a wound. I tell them a warrior who hide his hurt be a warrior who fall over in the next fight, but they be orcs, and orcs don't listen." } },
      choices = {
        { text = "There's no shame in being healed. I'll come to you.", next = "BACK", reply = "Then you be wiser than the orcs, mon. They come in with an arm hangin' off and say it be nothin'.", fx = { align = { honor = 1 } } },
        { text = "A warrior hides his wounds. That's how it's done.", next = "BACK", reply = "That's the orc way, mon, and it fills my graves. Come to me anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Fast as milk in the sun, mon, because the scorpids and the raptors carry filth in their claws. Wash every scratch with clean water before you do anything else and come to me if it start to burn, because I seen hunters lose an arm for bein' too proud to ask." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Fast as milk in the sun, mon, because the scorpids and the raptors carry filth in their claws. Your {pet} got scratches too, I see. Bring it here and I clean them, because the Light don't mind fur." },
      },
      choices = {
        { text = "I'll tend my wounds and my beast's with care.", next = "BACK", reply = "Good, mon, and you keep your arm. Clean water first, always.", fx = { align = { order = 1 } } },
        { text = "A few scratches never hurt anyone, priest.", next = "BACK", reply = "Then come to me when your arm turns green, mon, and we see who be right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "More than they'd admit, because they get hurt where nobody can see, and they don't like to say how. I mend them all the same, and I don't ask who stuck the knife in, though I sometimes wonder." },
      },
      choices = {
        { text = "Thank you. I'll try not to need you so often.", next = "BACK", reply = "Ha! Try all you like, mon, but rogues always need me. I be here.", fx = { align = { honor = 1 } } },
        { text = "Best you don't ask. Just mend it.", next = "BACK", reply = "I don't ask, mon, and you don't tell. That be the arrangement.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We do, mon, because the arcane never cursed our people, and the orcs still remember what the fel did to them. But even we know the voodoo of Zalazane began as study, so keep your learning clean, as Vol'jin would want." },
      },
      choices = {
        { text = "I'll keep it clean, for the Darkspear's sake.", next = "BACK", reply = "Good, mon, Vol'jin will be proud. The Darkspear don't need another Zalazane.", fx = { align = { light = 1 } } },
        { text = "Study is study. Where it leads is my concern.", next = "BACK", reply = "It be, mon, but Zalazane said the same. Be careful where it leads.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Our shamans talk to the sea and the Loa as much as the elements, because the Echo Isles taught us that. The orcs learned it fresh from Thrall and the old ones who still remember, so they be careful with it, and we be a little more easy, I think." } },
      choices = {
        { text = "The spirits deserve care, whichever people calls on them.", next = "BACK", reply = "They do, mon, and you be wise to say it. Tai'jin seen orc spirits and troll loa and they both get angry when you treat them like servants.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Careful or easy, power is power, and I'll use it.", next = "BACK", reply = "Then the spirits will be careful with you, mon. Use it wisely.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day, mon, because I grew up with the sea in my ears and the smell of jungle rain. But the grunts here need mendin' more than I need the sea, so I stay, and I dream of the waves when I sleep." } },
      choices = {
        { text = "Duty keeps you here. The sea can wait for you.", next = "BACK", reply = "It can, mon, and I be glad you understand. The grunts need me more.", fx = { align = { order = 1 } } },
        { text = "Your heart belongs by the sea. You should follow it home.", next = "BACK", reply = "Maybe one day, mon, when the isles be free. Until then, I stay.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They don't like it, mon, because it comes from a dark place that never fed anybody. But back at Sen'jin we knew the voodoo had its dark corners too, so Tai'jin won't throw stones, as long as you keep that thing away from my wounded." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They don't like it, mon, and they like it less now it be standing in my tent, because what you call comes from a dark place that never fed anybody. Tai'jin won't throw stones, since the voodoo got its dark corners too, but take {pet} away from my wounded right now." },
      },
      choices = {
        { text = "I'll keep it well away from your wounded.", next = "BACK", reply = "The loa thank you, mon. My wounded need quiet, and nothing like that ever been quiet.", fx = { align = { light = 1 } } },
        { text = "Your loa can think whatever they like.", next = "BACK", reply = "They will, mon, and they won't be kind. Keep it away anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_bwon = {
      lines = { { id = "xbw_default", text = "Then you carry a heavy song, mon, and I hear you at the fires some nights when the wind come in off the sea. My brother fell on those isles when Zalazane turned, so if you ever have a verse to spare, would you sing his name for me?" } },
      choices = {
        { text = "I'll sing it tonight, Tai'jin.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Bwonsamdi already knows his name, Tai'jin.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one carryin' the Light. Aye, mon, I mend grunts with my own gifts, and I never thought to see a Forsaken mend with that one." },
        { id = "h_default", key = true, text = "I be Tai'jin, and I teach the priests of Razor Hill when they come through. The grunts here get cut up by quilboar and Kul Tirans, so my hands stay busy even when the students be few." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and you be welcome here, mon. Back home in Sen'jin the shamans and the witch doctors argue all night, but they always share the fire." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, mon, all the way out here in the red dust! The grunts be cut up somethin' fierce this week, so if you got green magic to spare, I be glad of it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You be the quiet one, mon, and I see the cut on your arm you trying to hide. Come here and let me look at it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "Un'Thuwa's student, are you? He sends me the ones who burn their own fingers, so I hope you be more careful." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Hold still while I look at you, because the grunts here never tell me when they be bleedin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and you got scratches from somethin' with claws. Let me see them, mon, before they go bad in this heat." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "The loa don't like what you carry, mon. But Tai'jin, she mend you anyway if you get hurt." },
      },
      choices = {
        { text = "How do Darkspear shamans differ from the orcs'?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Durotar's dry land must wear on you, Tai'jin.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "You sound like you're from Sen'jin Village.", next = "senjin" },
        { text = "What do the grunts think of a troll healer?", next = "grunts" },
        { text = "I'm an undead priest. Do you trust me?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do rogues come to you often, Tai'jin?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Darkspear seem to trust mages more than orcs do.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Are the grunts of Razor Hill hurt often, Tai'jin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do wounds from beasts go bad quickly here, Tai'jin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do the loa think of what I carry, Tai'jin?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Is my Light so different from yours, Tai'jin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I sing for Bwonsamdi, Tai'jin, for our dead on the isles.", next = "xorig_bwon", when = { origin = "troll_bwonsamdi_singer" } },
        { text = "Farewell, Tai'jin.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What more you want to ask, mon? My hands be free until the next grunt come limping in." },
        { id = "h_again2", text = "More questions? Good, it keep me from thinking about the sea." },
      },
    },
    senjin = {
      lines = { { id = "s_default", text = "Yes, mon, my family fish off the coast there, south and east of here. I came to Razor Hill because the orcs had more wounded than healers, but I still go home whenever the tide be right." } },
      choices = { { text = "You must miss the Echo Isles.", next = "senjin_isles" } },
    },
    senjin_isles = {
      lines = { { id = "si_default", text = "Every day, and every Darkspear does, since Zalazane took them with his voodoo and his hexed puppets. Master Gadrin in the village be trying to drive him out, and you should help him if your road go that way." } },
      choices = {
        { text = "Zalazane deserves a hard end.", next = "BACK", reply = "He does, mon, and Gadrin will see to it. Help him if you can.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "His puppets were your people. I hope they can be saved.", next = "BACK", reply = "I hope so too, mon, with all my heart. Some of them be my cousins, and I want to see their faces clear again.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grunts = {
      lines = { { id = "g_default", text = "At first they looked at my tusks and then looked away, mon, but a grunt with a spear through his leg stops caring who heals him. Now they bring me fish and call me auntie, which I pretend not to like." } },
      choices = { { text = "That's a good place to be.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Tai'jin trusts what you do, mon, more than what you be. If you heal the grunts and do not poison them, then you be a priest to me, cold hands or not." } },
      choices = { { text = "Ha. Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That be beyond Tai'jin, mon. Ask Orgnil or the commander in the barracks." } },
    holy_light = { { id = "tp_holy_light", text = "The humans' priests pray to the Light, and I hear it works for them. I pray to the loa and the spirits, and they work for me, so we're even." } },
    darkspear = { { id = "tp_darkspear", text = "My people be scattered between Sen'jin and the city now, but we still meet on the beach to dance. I miss the sea, mon, but at least I can see it from here." } },
    echo_isles = { { id = "tp_echo_isles", text = "The Echo Isles were home, and Zalazane took them, and now the crabs and the mad trolls sing there. I'll go back one day, if Vol'jin takes them back." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin will take the Echo Isles back, I'm sure of it. He just be waiting for the right time, because a Darkspear never rushes a fight." } },
  },
}

---------------------------------------------------------------------------
-- Sen'jin Village
---------------------------------------------------------------------------

-- Un'Thuwa: Sen'jin's mage trainer.
P:NPC {
  key = "unthuwa", id = TODO_NPC("Un'Thuwa"), name = "Un'Thuwa", title = "Mage Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "dry" }, values = { "curious", "proud" },
  notices = { "class", "arcane", "lock_armor" },
  impression = {
    first = "He is quietly proud that Darkspear bend the arcane like any elf.",
    third = "{name} met Un'Thuwa, the troll mage trainer of Sen'jin Village.",
  },
  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Another student of the arcane, mon. Come in, before you set something on fire out there." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "You not be a mage, I can tell, but you can still stand there and admire the hut." },
    { id = "g_primer", when = { origin = "orc_camp_primer" }, text = "So you be the orc who learn letters from a human guard's book, and then learn fire all alone! Come in, mon, because Un'Thuwa did near the same thing with an elf's scroll, and nobody ever believe either of us." },
  },
  notice = {
    { id = "n_orcmage", cat = "class", when = { class = "MAGE", race = "Orc" },
      text = "An orc mage, that be a rare bird, mon. Your people's shaman will frown at you, so you better get good enough that they stop." },
    { id = "n_lock_ward", cat = "lock_armor", when = { class = "WARLOCK", aura = { 6229, 11739, 11740, 28610 } },
      text = "There be a shell of shadow around you, mon, eating up the light, and my students be watching it instead of their frost. The arcane don't wrap itself round you like a skin, it pass through, and that be the difference." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everything that should not work, interest me. The Light should burn you and it answer you, the same way the elves say a troll should not bend the arcane, and I do. Strange things prove the world be bigger than the rules." } },
      choices = {
        { text = "The Light has its own rules. I keep them.", next = "BACK", reply = "Then you be wiser than most, mon. Un'Thuwa only wish the Light's rules came with the arcane too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for those who need them, mon.", next = "BACK", reply = "Ha! That be my kind of thinking, mon. But even I keep a few rules.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not easy, mon, and not often. The arcane be all rules and patterns, and the loa be all moods and bargains, so a troll who study both got to learn when to argue and when to listen, and I still be learnin' it myself." } },
      choices = {
        { text = "Both deserve respect, even if they don't agree.", next = "BACK", reply = "They do, mon, and you be wise to see it. I learned more arguin' with shamans than ever I learned from books.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The loa's moods are less use than the arcane's rules.", next = "BACK", reply = "The loa's moods keep you humble, mon, and the arcane's rules keep you alive. You need both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every Darkspear warrior be glad of a mage when the Kul Tirans line up their muskets, because a wall of frost stop a volley better than any shield. Learn to stand where my fire won't hit you, mon, and you and me get along fine." } },
      choices = {
        { text = "Magic has its place. I'll gladly fight beside it.", next = "BACK", reply = "Then we fight well together, mon. Stand where my fire won't hit, that's all I ask.", fx = { align = { honor = 1 } } },
        { text = "Steel is honest. I don't trust your tricks, troll.", next = "BACK", reply = "Honest, sure, until the muskets fire, mon. Then you be glad of my frost.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, mon, but Zalazane's magic touch the isles now, and some of the beasts out there act strange. I don't like it, because a beast be honest and a hex make it a liar, so if you hunt there, put down the ones that froth and spare the rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, mon, but Zalazane's magic touch the isles now, and some of the beasts out there act strange. Your {pet} not be hexed, I can see that much. Good, mon; keep it far away from Zalazane." },
      },
      choices = {
        { text = "I'll spare the beasts that aren't hexed.", next = "BACK", reply = "Good, mon, that be the right way. The raptors only do what the hex tell them, and that not their fault.", fx = { align = { light = 1 } } },
        { text = "A strange beast is a dangerous one. I'll kill them all.", next = "BACK", reply = "Safer, maybe, but sadder, mon. Spare the ones you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not of stealing them to read, mon, but to sell, because some fools in Orgrimmar pay good coin for old troll scrolls. Keep your hands where I see them, and we stay friends." },
      },
      choices = {
        { text = "I'll leave the books where they lie. You have my word.", next = "BACK", reply = "Then we stay friends, mon. Some of dem books bite, and I don't mean the words.", fx = { align = { honor = 1 } } },
        { text = "If someone pays for scrolls, someone will steal them.", next = "BACK", reply = "True, mon, and that be why I watch. Keep your hands where I see them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The arcane be a river, and the fel be the poison someone pour in it. The orcs who drank that poison nearly died of it, and Zalazane's dark voodoo be a poison of its own, so I teach my students to keep well clear of both." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The arcane be a river, and the fel be the poison someone pour in it, and I can smell that poison coming off your servant from across the room. The orcs who drank it nearly died of it, so I teach my students to keep well clear, and I'll ask you to keep it out of their sight." },
      },
      choices = {
        { text = "Then I'll keep the poison far from your river.", next = "BACK", reply = "Then the river stay clean, mon, and the fish don't float.", fx = { align = { light = 1 } } },
        { text = "Poison is power, Un'Thuwa, if you know the dose.", next = "BACK", reply = "Every poison be power until it kill you, mon. Careful with the dose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Safer? No, mon. The spirits be honest about what they cost, because you ask the fire for help and maybe it say no, but when I call fire with the arcane there be no asking, and nobody tell you when to stop." } },
      choices = {
        { text = "Power should answer to something, whether spirits or study.", next = "BACK", reply = "It should, mon, and that be the wisest thing I hear today. Learn when to stop, before the fire learn it for you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody should tell a caster when to stop.", next = "BACK", reply = "Then nobody stop you, mon, until something worse does. Learn to stop yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Used carelessly it does, mon, and the elves blew up half their world finding that out long before any troll learned a spell. That be why I teach my students slowly, though they always want the fireball before they learn to put it out." } },
      choices = {
        { text = "Slow and careful is the right way to teach any power.", next = "BACK", reply = "It be, mon, and you be a good student. Slow and careful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power should be used freely. Let the students learn by burning.", next = "BACK", reply = "Then I be mending eyebrows all day, mon, and Ken'jai be shouting at me. Slow, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_zand = {
      lines = { { id = "xzd_default", text = "Zandalari scrolls, mon? Un'Thuwa would trade his best robe for one page of those, and you learned from them before you were half grown. The Zandalari be the oldest of all the trolls, so tell me, do you still have them?" } },
      choices = {
        { text = "They're safe, and they're staying that way.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Some. Others burned when I got a spell wrong.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I study the arcane, and I never study anything as strange as you, mon. Where you learn your first prayer?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, mon. The loa and the arcane don't talk much, but I be curious what yours say to you." },
        { id = "h_default", key = true, text = "I be Un'Thuwa, and I teach the arcane to trolls, and to orcs brave enough to try it. Most of the village fish or fight, but there be a few of us who rather study." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, come to see a troll do magic the stubborn way. You ask the elements for help and I make them listen, so let's not argue about which be better." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, mon, in my hut. You bend your own body and I bend the arcane, and I be curious which of us has the harder time keepin' our shape." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in my hut! You can't learn from me, mon, but you be welcome to admire the books, as long as you don't pocket any." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I teach the arcane, and I don't touch what you touch. Keep that little thing out of my hut, please, because it be eyeing my scrolls." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon, in the mage's hut. You lost, or you come to see what real power look like?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon, and a beast with you. The beasts don't like the smell of my spells, but they get used to it." },
        { id = "h_mage", when = { class = "MAGE" }, text = "I be Un'Thuwa, and you be one of mine while you walk this coast. Mai'ah teach the little ones in the valley, and Un'Thuwa get them once they learn to keep their eyebrows." },
      },
      choices = {
        { text = "Where does the mage's road lead from Sen'jin?", next = "m_road", when = { class = "MAGE" } },
        { text = "I'm an orc mage. How do I face my people?", next = "m_orc", when = { class = "MAGE", race = "Orc" } },
        { text = "I'm Forsaken. Dalaran trained me, once.", next = "m_forsaken", when = { class = "MAGE", race = "Scourge" } },
        { text = "Do the arcane and the loa ever work together, Un'Thuwa?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The arcane seems safer than what the spirits give.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you think arcane magic harms the land, Un'Thuwa?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Where did a Darkspear learn magic?", next = "learn" },
        { text = "The village can't think much of mages.", next = "village" },
        { text = "Is there trouble here your magic could help with?", next = "zalazane" },
        { text = "Would you really suspect me of stealing books?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can magic help a warrior, Un'Thuwa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do beasts still roam the Echo Isles, Un'Thuwa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is the arcane really so different from what I practise?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Light interest a troll mage, Un'Thuwa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I learned my first spells from Zandalari scrolls, Un'Thuwa.", next = "xorig_zand", when = { origin = "troll_zandalari_scrolls" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more, mon? Ask, the fire can wait." } },
    },
    m_road = {
      hub = true,
      lines = {
        { id = "mr_default", text = "From Sen'jin the road run up to Orgrimmar for your spells and out across the Barrens for your lessons, mon. Un'Thuwa know the first stretch well and the rest only by what the students tell him when they come home." },
        { id = "mr_high", when = { minLevel = 30 }, text = "You walk further than Un'Thuwa ever did, mon, and it show on you. Still, ask, and maybe this old troll surprise you." },
      },
      again = {
        { id = "mr_again", text = "What else on the road, mon? The tide be out, I got time." },
        { id = "mr_again2", text = "Go on. Un'Thuwa like the questions better than the answers, most days." },
      },
      choices = {
        { text = "Polymorph looks a lot like a witch doctor's hex.", next = "m_poly", when = { minLevel = 8 } },
        { text = "Could my magic help against Zalazane?", next = "m_zala" },
        { text = "I can step home to Orgrimmar now.", next = "m_twenty", when = { minLevel = 20 } },
        { text = "The trainers send me to a human in Dustwallow.", next = "m_tabetha", when = { minLevel = 26 } },
        { text = "Enough of the road, Un'Thuwa.", next = "BACK" },
      },
    },
    m_poly = {
      big = true,
      lines = { { id = "mp_default", text = "It do, mon, and that be why the witch doctors hate it. A hex be a bargain with the loa, and a polymorph be a pattern with nobody else's say in it, so the shape come back when the pattern break. Zalazane's hexes don't come back, and that be the difference worth knowing." } },
      choices = {
        { text = "Then mine will always be the kind that comes back.", next = "m_road", reply = "Good, mon. A mage who keep that promise sleep well, and Un'Thuwa sleep very well.", fx = { align = { light = 1 } } },
        { text = "A hex that lasts is stronger. Maybe he's right.", next = "m_road", reply = "Stronger, mon, and that be exactly how Zalazane talk himself into madness. Don't you start.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_zala = {
      lines = { { id = "mz_default", text = "Fire burn his puppets the same as anything else, and frost hold a hexed raptor long enough for a hunter to free it. But his hold on the isles be voodoo, not arcane, so Master Gadrin and Vol'jin must break it, and we only clear the road for them." } },
      choices = {
        { text = "Then I'll clear the road for them.", next = "m_road", reply = "That be the right work for a mage, mon. Burn the puppets and leave the puppet-master to the ones who know him.", fx = { align = { honor = 1 } } },
        { text = "I'd rather face Zalazane myself.", next = "m_road", reply = "Bold, mon, and maybe foolish, because his hex take the strong minds first. Ask Gadrin before you try.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_twenty = {
      lines = { { id = "mt_default", text = "Then you can step back to Orgrimmar from anywhere with a rune from Magenius in the Drag and one breath. Un'Thuwa still walk to Sen'jin, because the sea road remind me why I fight, but you do as you like, mon." } },
      choices = {
        { text = "I'll walk when I can. The road teaches.", next = "m_road", reply = "It do, mon. The road teach you where everything be, and the rune only teach you where home be.", fx = { align = { order = 1 } } },
        { text = "Walking is for those who can't step.", next = "m_road", reply = "Ha! Then Un'Thuwa be a walker by choice, and proud of it.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_tabetha = {
      lines = { { id = "mtb_default", text = "Tabetha, yes. Un'Thuwa never meet her, but every student come back from that marsh speaking more carefully, so she must be doing something right. A human mage who teach the Horde be a strange thing, mon, and I like strange things." } },
      choices = { { text = "Back to the road.", next = "m_road" } },
    },
    m_orc = {
      big = true,
      lines = { { id = "mo_default", text = "Face them with patience, mon. Your shaman frown because the last orcs who wanted power without the spirits sold their whole people to demons, and they not wrong to remember it. But you learn the arcane from a troll in a hut by the sea, and no demon ever come to Sen'jin for supper." } },
      choices = {
        { text = "I'll prove the arcane clean, spell by spell.", next = "BACK", reply = "Then come back and tell Un'Thuwa when the first old orc nod at you. That be a good day.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their memories are their problem, not mine.", next = "BACK", reply = "Their memories be why there still be a Horde, mon. Don't be so quick.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_forsaken = {
      big = true,
      lines = { { id = "mfo_default", text = "Dalaran, mon! Un'Thuwa would give a tusk to see those libraries. But they shut the gates on you when you died, I hear, and now their mages hunt your kind in the pines, so tell me what you feel when you think of the Violet Citadel." } },
      choices = {
        { text = "Nothing. Dalaran died to me when it shut its gates.", next = "BACK", reply = "Cold, mon, and fair. Un'Thuwa would be cold too.", fx = { align = { light = -1 } } },
        { text = "Grief. It was home, and part of me still serves it.", next = "BACK", reply = "Then you be more loyal than they deserve, and Un'Thuwa respect that a great deal.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "Trolls been working magic since the humans were still herding goats, mon, whatever the elves say about it. Mine came from old scraps and a lot of burned fingers, and the Horde gave me a place to teach it." } },
      choices = { { text = "Trolls worked magic that long ago?", next = "learn_elves" } },
    },
    learn_elves = {
      lines = { { id = "le_default", text = "The old troll empires be big and proud back then, mon, with temples and witch doctors and mages in Zul'Aman and the jungles of Stranglethorn. The Darkspear were never one of the great tribes, but we remember the stories, and a good story teach as much as any spellbook." } },
      choices = {
        { text = "Old stories are worth keeping.", next = "BACK", reply = "They are, mon, and a good story teach as much as a spellbook. Keep them close.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Old stories don't matter. What you do now matters.", next = "BACK", reply = "What you do now be built on old stories, mon. Remember them anyway.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "The witch doctors call it cold magic and keep to their loa, and the hunters think I be soft for sitting inside. Master Gadrin respects it, though, and when Gadrin respects you, the village follows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zalazane = {
      lines = { { id = "z_default", text = "Fire burns a voodoo puppet same as anything else, mon, but Zalazane's power be his own kind of thing. Master Gadrin knows it best, so ask him if you want to go to the isles." } },
      choices = { { text = "I'll ask Gadrin.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Un'Thuwa knows spells, not that. Ask Master Gadrin, he knows everyone's business." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the greatest city of magic in the world, and the demons burned it. The humans are building it again, I hear, though they're not letting anyone in to see." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor be the human mages who run Dalaran, mon. They never let a troll through their gates, so Un'Thuwa teach himself from scraps, and he think he do all right." } },
    darkspear = { { id = "tp_darkspear", text = "A Darkspear learn what the tribe need to survive, mon, and right now the Horde need mages. Un'Thuwa be happy to oblige, and quietly proud he cast cleaner than most of the orcs." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits and the arcane don't always agree, and the shaman like to remind Un'Thuwa of it. I tell them the fire spirits never once complain about my fireballs, and that usually end the argument." } },
  },
}
