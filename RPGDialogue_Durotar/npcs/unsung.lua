-- Durotar's working people with no quests of their own: the Den's trainers and shopkeeper,
-- Razor Hill's weaponsmith and trainers, and Sen'jin's mage teacher. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- The Valley of Trials
---------------------------------------------------------------------------

-- Frang: the Den's warrior trainer. Loud, plain, fond of bruises.
P:NPC {
  key = "frang", id = TODO_NPC("Frang"), name = "Frang", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "brave", "dutiful" },
  notices = { "class", "weary" },
  impression = {
    first = "Frang trains the young warriors in the Den and judges them by how fast they get up, not how hard they fall. He is loud about it, but he watches every recruit closely.",
    third = "{name} met Frang, the warrior trainer in the Valley of Trials' Den.",
  },
  greetings = {
    { id = "g_war", when = { class = "WARRIOR" }, text = "On your feet, recruit! If you are here, you have bruises to show me, and I want to see them." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You are not one of mine, but stand up straight anyway; the Den does not like a slouch." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "That armor has been chewed on by every boar in the valley, and you still came back walking. Good, because walking back is the first lesson." },
    { id = "n_troll", cat = "class", when = { class = "WARRIOR", race = "Troll" },
      text = "A Darkspear with an axe! Your people fight loose and quick, so I will teach you to hold a line as well, and then you will be dangerous." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The young ones don't know enough to fear you. Their fathers do, because the Silver Hand stood over the camps with that glow, but these whelps were born after. Teach them a paladin can fight beside them, and maybe they'll never learn the old fear." } },
      choices = {
        { text = "I'll stand shoulder to shoulder with them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'd do well to fear me a little.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not to their faces, no, because they'd rather die than look soft in front of me. But I hear them talking at the fire, and they all know who put their ribs back where they belong, so take it as thanks when they grunt at you." } },
      choices = {
        { text = "A grunt is thanks enough, Frang.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They should thank me properly, or heal themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No, Thotar does that down in Razor Hill, but I've knocked a few hunters into the dirt for their own good. The boars of the valley don't care what you call yourself, so learn to keep your feet when they charge, and you'll thank me for the bruises." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours has a better charge than half my recruits. Don't tell them I said so, because they're sulky enough already." },
      },
      choices = {
        { text = "I'll learn to take a hit. Pride can wait.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My beast takes the hits so I don't have to.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It needs everyone who fights for it, but the warriors hold the line so the rest of you can work. Remember that when you're sneaking off into the scrub, because some recruit of mine is standing in the open for you." },
      },
      choices = {
        { text = "I'll remember them, and I'll have their backs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Each fights their own way. I owe them nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I blame the power and anyone who trusts it, though I'll admit some of you are fighting the Blade too. Fight at my recruits' side, and keep your imp off their heels, and I'll judge you by that." },
      },
      choices = {
        { text = "Then I'll fight at their shoulder, where they can see me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your blame is your own business, warrior.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Better than you would think, and better than they used to. In the old Horde the shamans stood back and the warriors charged and nobody trusted anybody, but Thrall calls the storm with the same hammer he fights with, and the young ones are learning from him." } },
      choices = {
        { text = "Shoulder to shoulder with the warriors is the only way to fight.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the warriors charge. I'll strike where the enemy doesn't expect.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd like nothing better, so long as you remember they're recruits and not quilboar. Knock them down hard enough to teach them something and gently enough that Ken'jai doesn't come shouting at me." } },
      choices = {
        { text = "I'll fight them fairly, and they'll learn something honest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fight them the way the quilboar will. That's the real lesson.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That getting up is the only lesson, because every quilboar in the valley will knock you down and your spells won't save you if you stay there. Watch how my recruits fall, and learn to fall like them, and then get up and burn whatever knocked you over." },
      },
      choices = {
        { text = "I'll get up and fight again, every time.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better to stay down until they turn their backs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin in the Den! The young ones will stare. Let them; it'll teach them to keep their eyes up." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Stand back from the ring, then, because my recruits will want to show off for you, and you'll be busy soon enough." },
        { id = "h_default", key = true, text = "I am Frang, and I teach the warriors of the Den to fight like the Horde fights, shoulder to shoulder and never turning their backs. Everything else they learn out in the valley, mostly from boars." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Back from the valley, are you? Tell me what the quilboar taught you today, and then I will teach you something they cannot." },
        { id = "h_low", when = { maxLevel = 5 }, text = "You are greener than a cactus apple, but everyone starts green. Just don't stay that way, so get out there and come back hurt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman in my Den! Good, because when my recruits fall down you can tell the earth to hold them up, and save me some shouting." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid in my Den! Good, because a recruit who's been knocked down by a bear learns to get up faster than one who's only been knocked down by me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "Rogue. I teach shoulder to shoulder and never turning your back, so you'll find little here for you except a sore lesson." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock. I've seen what the Blade's imps leave of a recruit's face, and I've buried two of them this season." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in my training ground. Your beast can sit by the wall, and you can stand with my recruits, because it won't hurt you to learn to take a hit." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in the Den! Stand back from my ring, because my recruits throw each other, and I won't have them throwing a spellcaster." },
      },
      choices = {
        { text = "Do your recruits ever thank the priests for mending them?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warriors and shamans fight well together, Frang?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you want a bear to spar with your recruits, Frang?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What does a warrior learn first?", next = "first" },
        { text = "Who else trains in the Den?", next = "den" },
        { text = "Where did you learn to fight?", next = "past" },
        { text = "Does the Horde need rogues as much as warriors?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do you train hunters too, Frang?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you blame all warlocks for the Burning Blade?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What should a mage learn from your recruits, Frang?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the recruits fear a paladin, Frang?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll leave you to your recruits.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Speak quick, because I have a recruit lying in the dirt out there who thinks he is resting." },
        { id = "h_again2", text = "Go on, ask. Questions do not bruise, though some answers do." },
      },
    },
    first = {
      lines = { { id = "f_default", text = "How to take a hit and stay standing, because a warrior who falls down cannot protect anyone. After that comes the shield, and after that the charge, and the charge is the fun part." } },
      choices = { { text = "Why the shield before the charge?", next = "first_shield" } },
    },
    first_shield = {
      lines = { { id = "fs_default", text = "Because the young ones all want to run at the enemy screaming, and half of them would die doing it. Teach them to guard first, and the ones who live long enough to charge will charge well." } },
      choices = {
        { text = "Guarding your brothers matters more than glory.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Glory is what a warrior fights for. Let them charge.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else, trainer.", next = "BACK" },
      },
    },
    den = {
      lines = { { id = "d_default", text = "Gornek runs the Den and sends every recruit out with work, and the other trainers stand along these walls with me. Ken'jai teaches the priests, and the troll talks more gently than I do, but nobody listens to either of us until they have been bitten by something." } },
      choices = { { text = "And outside the Den?", next = "den_out" } },
    },
    den_out = {
      lines = { { id = "do_default", text = "Galgar cooks, Kzan mends the weapons you break, and Foreman Thazz'ril shouts at his lazy peons until the whole valley can hear him. When you are ready to leave, the road runs east to Sen'jin and north to Razor Hill." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "p_default", text = "In the internment camps, if you can believe it, with sticks behind the guards' backs. When the Warchief broke the camps open, those sticks became axes, and I have not put one down since." } },
      choices = {
        { text = "The camps made the Horde stronger.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The camps were a crime. Nothing good came of them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know axes, shields and how to stand up again, so ask Gornek about anything else." } },
  },
}

-- Ken'jai: the Den's priest trainer, a Darkspear troll of the old loa and the new Light alike.
P:NPC {
  key = "kenjai", id = TODO_NPC("Ken'jai"), name = "Ken'jai", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "calm" }, values = { "wise", "kind" },
  spiritSensitive = true,
  notices = { "class", "weary" },
  impression = {
    first = "Ken'jai teaches the young priests in the Den, a patient troll who mends Frang's recruits after their lessons. He talks of the spirits as neighbours who need to be kept on good terms.",
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
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We both mend what be broken, but my spirits be neighbours, and your Light be a stranger who burn you. Trolls watch the dead careful, mon. Mend the young ones beside me, and I watch you less." } },
      choices = {
        { text = "Then I'll mend them beside you, Ken'jai.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I mend my own. Your recruits are yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Busy like the tide, mon, always comin' in. They come back from the boars and the scorpids with holes in them, and I close the holes, and Frang send them out to get new ones, so I tell every warrior the same thing: a shield cost less than my time." } },
      choices = {
        { text = "I'm grateful for every wound you close, Ken'jai.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Wounds are what priests are for. Keep them coming.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Light don't care if a wound be on a troll or a boar, mon, so yes, if the beast hold still. Most of them don't, and I got a scorpid scar on my wrist to prove it, so you learn to mend your own beast and we both be happier." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours be lookin' at my bandages like they be dinner. Keep it close while I work, mon." },
      },
      choices = {
        { text = "I'll learn to mend my own beast, Ken'jai.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Mending is your work, priest, not mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "In Sen'jin they do, because Un'Thuwa's students be always singing their own eyebrows off. I don't mind mending them, so long as they learn something, and they always learn to duck." },
      },
      choices = {
        { text = "Then I'll learn to cast carefully, and spare you the work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Burns heal. I'll keep casting as I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I heal anyone who bleed, because the loa don't ask what you be before they give. But I watch what you bring with you, and if your demon touch a recruit, I won't be healing it." },
      },
      choices = {
        { text = "Fair. My demon keeps its distance from the recruits.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demon does what I tell it. That's all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "All the time, mon, like any family. The Loa want respect and the elements want balance, and the shaman who forget either one find out quick, so Ken'jai keep good terms with everybody and mend whoever get burned." } },
      choices = {
        { text = "Respect for every spirit is what keeps us whole.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The elements serve my purpose, and the Loa can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not so different, mon, because both of us be asking somethin' bigger to fix what got broke. You ask the land and the beasts and I ask the loa, and as long as the recruit get up, I don't think either one be jealous." } },
      choices = {
        { text = "Healers should work together, whatever power they draw on.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My craft is my own, and I keep it apart from priests.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I heal everybody, mon, because the spirits don't ask what you do with your hands before they mend them. But I see the cuts on you, and some of them be from behind, so you be careful who you sneak around, because the quilboar sneak too." },
      },
      choices = {
        { text = "I'll keep my blades for the Horde's enemies.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I sneak around whoever I like, Ken'jai.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock, you come to a priest's hut. Either you be very brave or you be very hurt, and I hope it be the second." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Frang send you over to get patched up again, or did you come on your own feet this time?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast get hurt out there too, I bet, and nobody in the valley know how to fix it but you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, mon? Ken'jai mend priests, warriors and whoever else fall down, and rogues fall down too, just more quietly." },
      },
      choices = {
        { text = "Do your Loa and my elements ever disagree, Ken'jai?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is green magic so different from a priest's, Ken'jai?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Where does your healing come from?", next = "power" },
        { text = "What's a troll doing in an orc valley?", next = "troll" },
        { text = "Do you mend many recruits?", next = "mend" },
        { text = "Do Darkspear priests and mages often work together?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do Frang's recruits keep you busy, Ken'jai?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can a priest heal a hunter's beast, Ken'jai?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Will you heal a warlock, Ken'jai?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
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
        { text = "Power is power. I'll use what works.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'd rather heal than drink from that pool.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
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
      lines = { { id = "mi_default", text = "Burn them and scratch them, mostly, and the burns of a fel creature heal slower than a boar's bite. Zureetha by the hill send recruits to kill the familiars, so Ken'jai sees a lot of singed eyebrows." } },
      choices = { { text = "Thank you, Ken'jai. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ken'jai knows healing and the Darkspear, mon, but not that. Ask Gornek, he knows everything in the valley." } },
  },
}

-- Duokna: sells general goods to the Den's recruits.
P:NPC {
  key = "duokna", id = TODO_NPC("Duokna"), name = "Duokna", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "brisk" }, values = { "practical" },
  notices = { "purse", "hunger" },
  impression = {
    first = "Duokna sells the Den's recruits the plain things they forget they need: water, bread, thread and bags. The questions are as practical as the goods, and nobody leaves without being asked about their waterskin.",
    third = "{name} bought supplies from Duokna, who keeps general goods for the recruits of the Valley of Trials.",
  },
  greetings = {
    { id = "g_shop", text = "Water, bread, thread and bags, everything a recruit forgets until it is too late. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, so the valley has eaten through your supplies already. That is what it does." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your coin purse is lighter than a feather, recruit. The boars carry a little copper sometimes, if you are not too proud to look." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everyone needs something. My father came out of the camps with nothing but the clothes the Silver Hand gave him, and he swore his children would never walk without a pack. You're dead, but you'll want thread for that armour, I expect." } },
      choices = {
        { text = "Thread then, and thank you for asking.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I need nothing from anyone, Duokna.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I keep linen and water aside for whoever's doing the mending, because the young ones never think of it. If you're short, take what you need and pay me later, but bring the empty skins back, because water's dear in this valley." } },
      choices = {
        { text = "I'll pay you back and return every skin, Duokna.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your linen's for bleeding grunts. I'll take what I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Water, bandages and a spare shirt, in that order, because the axe only matters if you live long enough to swing it. Durotar's sun kills more careless recruits than the quilboar ever do, so fill your waterskin here before you go stomping off toward Razor Hill." } },
      choices = {
        { text = "I'll go prepared. Only fools march dry.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A real warrior doesn't need coddling, Duokna.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Meat for the cats and wolves, and almost anything for the boars, which is why boars are cheap to keep and cats are not. I keep tough jerky for the hunters heading out to Razor Hill, and I've never seen a beast turn it down, though I've seen a few recruits try." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks hungry, but they always do. Feed it before you feed yourself, and it'll remember." },
      },
      choices = {
        { text = "My beast eats first. That's only fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It can hunt its own food. That's what beasts do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Once, a troll with quick fingers and slow feet, and Gornek made him carry water for a month. Buy what you need, and I'll treat you like any recruit, because that's what you are until you prove otherwise." },
      },
      choices = {
        { text = "I'll pay for every scrap. I'm no thief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Count all you like. You'll never catch me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Bread, if you're tired of the conjured kind, which tastes like sand, from what the trolls say. And thread, because those robes tear on every cactus in the valley, and a mage with a torn robe looks like a scarecrow." },
      },
      choices = {
        { text = "Thread and bread, then. I'll buy honest goods.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Conjured's free. Your bread costs coin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everything except the totems, because every one of you thinks the spirits will carry the rest. The spirits won't fill your waterskin, so take one from me and stop asking the river." } },
      choices = {
        { text = "A full waterskin honours the spirits too. I'll take one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land provides when I need it, so I travel light.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some could, in a kinder place, but Durotar's springs are few and the Burning Blade have fouled at least one of them. Take the waterskin, and if you find a clean spring the grunts don't know about, tell me where it is." } },
      choices = {
        { text = "I'll take the waterskin. Better prepared than proud.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust the land. A druid shouldn't need a merchant's waterskin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Bread, mostly, because you all think about soul shards and forget your stomachs. Buy food and water before you go down into the valley, and never feed any of it to the imp, because it'll only spit it back at you." },
      },
      choices = {
        { text = "I'll share mine with the recruits who forget theirs.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every recruit carries their own. I won't share mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I don't suppose you need a waterskin, but every other recruit forgets something, so tell me what you forgot." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Then you'll want bandages and clean water, because prayers go further when the wound's been washed." },
        { id = "h_default", key = true, text = "I am Duokna, and I keep the goods for the Den. Most of the young ones walk in with an axe and nothing else, so I make sure they walk out with a waterskin." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your totems are heavy, so I'll ask you what I ask everyone, which is whether you remembered to carry water as well." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll tell me you can live off the land, I suppose, and I'll tell you that Durotar's land is mostly rock, so take a waterskin anyway." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in my shop. Count your goods, Duokna, I always say to myself, and I'm saying it now." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage? You can conjure water, so you're the one recruit who won't need my waterskins. Shame, they're good waterskins." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Let me guess: you've got an axe and nothing else, and you want to know why you're always thirsty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want food for your beast as well as yourself, and you'd be surprised how many hunters forget the second part." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Did you remember water? Your demon won't fetch it for you." },
      },
      choices = {
        { text = "Do you keep supplies aside for healers, Duokna?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do shamans usually forget to carry?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Can't a druid live off the land out there, Duokna?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What should a recruit carry?", next = "carry" },
        { text = "Where do your goods come from?", next = "supply" },
        { text = "Do young rogues ever steal from the Den?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is there anything you sell that a mage needs?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do new warriors forget to buy, Duokna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the beasts of Durotar eat, Duokna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do warlocks forget to carry, Duokna?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the dead need supplies, Duokna?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'm fine for now.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit, or are you ready to pay for that waterskin?" },
      },
    },
    carry = {
      lines = { { id = "c_default", text = "Water first, because Durotar is dry and the sun is not kind. Then something to eat that is not a cactus apple, and a bag big enough to carry whatever the quilboar drop." } },
      choices = { { text = "What's wrong with cactus apples?", next = "carry_apple" } },
    },
    carry_apple = {
      lines = { { id = "ca_default", text = "Nothing, if you like spines in your tongue, and Galgar makes a fine dish from them when someone gathers enough. Raw off the plant, they are a lesson most recruits only need once." } },
      choices = {
        { text = "I'll take your bread, then.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "Carts come down from Razor Hill and Orgrimmar when the roads are clear, and the peons haul it up from the gate. If the peons are asleep again, it does not get hauled, and Thazz'ril hears from me." } },
      choices = {
        { text = "The peons work hard. Go easy on them.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Lazy peons should be woken with a stick.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell bread and bags, recruit, so ask Gornek if you want answers about anything bigger." } },
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
  notices = { "kit", "craft" },
  impression = {
    first = "Uhgar sells weapons in Razor Hill and judges a fighter by the edge they carry. He is gruff, proud of the iron, and quick to say which of the town's enemies blunts a blade fastest.",
    third = "{name} met Uhgar, the weaponsmith of Razor Hill.",
  },
  greetings = {
    { id = "g_shop", text = "Blades, axes and maces, all of them sharp. Look, but do not touch the edges unless you are buying." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Show me what you did to the last one I sold you." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have a smith's burns on your hands. Then you know what you are looking at, so I will not bother lying about the quality." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do; the Warchief carries one. But the Silver Hand's knights carried hammers and the Light both, and grunts my age saw what came down on the camps. If you'll carry one for the Horde, I'll sell you the best I've got." } },
      choices = {
        { text = "For the Horde, and nothing else. Show me the best.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I carry what I like. Show me what's cheapest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because a mace doesn't care where it lands, I suppose, and a priest who has to fight wants it done quickly. The trolls carry their own little knives for their rites, though, and I don't sell those and don't ask about them." } },
      choices = {
        { text = "A clean blow ends a fight with the least suffering.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever lands hardest is what I'll carry.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something heavy enough to crack a scorpid shell and short enough to swing in a quilboar warren, which means an axe or a mace and never a fancy sword. The Kul Tirans carry long blades, and I've bought plenty of them cheap from grunts who found out how badly they work in the scrub." } },
      choices = {
        { text = "A good weapon earns its price. I'll pay it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd rather loot a Kul Tiran blade than pay for one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because scorpids get close and quilboar get closer, and a bow does nothing when a boar's tusk is in your knee. A light axe will save you more often than you'd think, and I'll sell you one that won't pull your shoulder out of joint." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} is a weapon too, I suppose, though there's nothing I can sell you for it. Believe me, I've tried to think of something." },
      },
      choices = {
        { text = "I'll carry a blade, and fight close if I must.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it gets close, my beast deals with it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "In Durotar they do, because the spells run dry before the quilboar do, and then you need something to swing. Buy a sturdy one, and practice with it, because the Kul Tirans at Tiragarde won't wait for your mana to come back." },
      },
      choices = {
        { text = "A sturdy one, then. I'll practice with it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spells are enough. I'll buy what's cheapest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "One tried, a Burning Blade sympathiser with a blade that glowed green, and Gar'Thok's grunts dragged him off before I'd finished saying no. I sell honest steel to honest Horde, and I'd like to keep it that way." },
      },
      choices = {
        { text = "Honest steel suits me. I'll keep my craft separate.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Green glow sells, Uhgar. You're missing out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A mace, or a staff with iron on the end, because lightning finishes what a heavy head starts. Thrall carries the Doomhammer, and every young shaman in Razor Hill wants a hammer like it, though I tell them to learn to swing a small one first." } },
      choices = {
        { text = "A shaman should fight face to face, as the Warchief does.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather end a fight before the enemy ever reaches me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You'll need one when you're on two legs and out of breath, which happens more than any druid will admit. A good mace has saved more of your kind than will ever thank me for it, so buy one and don't tell the others." } },
      choices = {
        { text = "The Kul Tirans deserve a fair fight, steel against steel.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Kul Tirans deserve nothing. I'll use whatever kills fastest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. A hammer, I suppose? I don't sell many to orcs; they remember who swung them at the camps." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll be wanting a mace, then, because I've never sold a priest a sword who didn't regret it." },
        { id = "h_default", key = true, text = "I am Uhgar, and I sell weapons to the grunts of Razor Hill and anyone else with coin. Durotar is a hard place, and you will want something better than a training axe before you leave town." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, so you'll want a mace or an axe and not some little dagger. The spirits respect a weapon with weight behind it, or so the old shamans told me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid in a weapon shop. You'll want a staff or a mace, then, and something heavy enough that the Kul Tirans notice it before they notice the claws." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in a weapon shop. You'll be after a staff, then, and I'll find you one that won't snap on a quilboar's head." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock. I'll sell you a dagger, but I'll not put a curse on it, and I'll not buy back anything that whispers." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Put that training axe down before you embarrass us both, and let me show you something with an edge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want a gun or a bow from somebody else, but you'll want something for close work from me." },
      },
      choices = {
        { text = "Why are priests so fond of maces, Uhgar?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What weapon suits a shaman, Uhgar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does a druid even need your weapons, Uhgar?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What do you recommend?", next = "advice" },
        { text = "Who are Razor Hill's enemies?", next = "enemies" },
        { text = "I fight with spells, not steel.", next = "caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Do mages here really need a good staff?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What weapon suits a warrior in Durotar, Uhgar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why would a hunter need your blades, Uhgar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Have warlocks sold you cursed weapons before?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
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
      choices = { { text = "Who taught you smithing?", next = "advice_craft" } },
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
        { text = "Drive the Kul Tirans into the sea.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let them be, if they keep to their walls.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
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
  },
}

-- Thotar: Razor Hill's hunter trainer.
P:NPC {
  key = "thotar", id = TODO_NPC("Thotar"), name = "Thotar", title = "Hunter Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "class", "pet" },
  impression = {
    first = "Thotar trains the hunters at Razor Hill and talks about beasts as if they were people worth respecting. He wants to know about every animal a hunter tames, and he is patient with all of them.",
    third = "{name} met Thotar, who teaches Razor Hill's hunters to read the land and trust their beasts.",
  },
  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and with the dust of the plains on you. Come and tell me what you have been tracking." },
    { id = "g_other", when = { ["not"] = { class = "HUNTER" } }, text = "You walk loudly, stranger, and every beast in Durotar heard you coming." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} keeps an eye on me while you talk, which means it is a good one. Never punish a beast for being wary of strangers." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They smell death and feel the Light, and they don't know which to trust. The grunts are the same, because they saw the Light in the camps on their jailers. Be patient with them all, beasts and grunts, and they'll come around." } },
      choices = {
        { text = "I'll be patient with them, Thotar.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll come round, or they'll keep their distance.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd teach them to pay attention, which is most of what praying is, I think. A hunter who sits quiet beside a hurt beast and waits learns more about it than one who bandages it and walks off, and the beast learns more about him too." } },
      choices = {
        { text = "Patience heals as much as any spell, Thotar.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Speed heals better. A slow healer loses the beast.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Where your enemy has been and where he's going next, which every scout and every tracker knows. The quilboar of Razormane Grounds leave tracks like a stampede, and if you follow them back you'll find their camps before they find you." } },
      choices = {
        { text = "Knowing the land wins fights before they start.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I find the enemy by charging. It always works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "To read tracks, and to learn which creatures should be left alone and which ones need to be hunted. A rogue who knows the land as well as the back alleys will last longer out here than one who only knows locks." },
      },
      choices = {
        { text = "Then teach me the land. I'll respect it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Locks pay better than tracks, hunter.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A beast follows a hunter because it chooses to, and your demon follows you because it can't do anything else. I won't call you a cultist, but I'll tell you plainly that the land doesn't like what you've chained to you." },
      },
      choices = {
        { text = "Then I'll keep it far from your wolf.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Choice is overrated. Chains don't break.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and better than most hunters. My raptor would not cross the dry wash south of here for a week, and when I asked old Gadrin about it he said an angry earth spirit had settled there, so now I listen when my beasts refuse a path." } },
      choices = {
        { text = "Then the beasts and the spirits both deserve our respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that refuses a path should be made to cross it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Both, and a hunter must know which one the day calls for. A druid wears the beast's very shape, which I think is a closer bond than any of mine, though I would not trade my companion for it." } },
      choices = {
        { text = "A beast is a partner, never a tool.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Treat it as one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That the boars and scorpids out there were here before us, and they fight because the land is hard, not because they hate you. Freeze them if you must, but don't burn more than you need, because every one you kill is one fewer for the hunters to feed the village with." },
      },
      choices = {
        { text = "I'll kill only what I must.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Beasts are beasts. I'll burn whatever's in my way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The beasts shy from you, I see. They'll learn your scent, and the grunts will learn your glow, in time." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. My hunters patch up their own beasts, mostly badly, so I'd be glad if you showed them how it's done." },
        { id = "h_default", key = true, text = "I am Thotar, and I teach the hunters of Razor Hill to read the land and to trust a beast at their side. In Durotar the land is mostly rock and the beasts are mostly angry, so there is plenty to learn." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "You have come for training, I think, and maybe for advice about your companion. Ask, and I will help with both." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, I think, and from Mulgore by the look of you. You will find the beasts of Durotar leaner and meaner than your plainstriders, but they are honest, and they will teach you if you let them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, I think. You and I listen to the same land, though you hear the spirits in it and I hear the beasts, so tell me what Durotar says to you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk like a cat on rock, rogue, and the scorpids don't even notice you. That's a skill worth having in Durotar." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Your beast doesn't belong in this land, warlock, and every beast that does can tell. My wolf has been growling since you came up the hill." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior at the hunters' corner. Stay and listen, because a warrior who reads the land charges at the right enemy." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You've no beast with you, but I'll talk about them anyway, because I talk about them to everyone." },
      },
      choices = {
        { text = "Would you teach your hunters to pray over their beasts?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your beasts sense the spirits, Thotar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you hunt the beasts or befriend them, Thotar?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What beasts are worth taming here?", next = "beasts" },
        { text = "How do you choose a companion?", next = "choose" },
        { text = "What could a hunter teach a rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What should a warrior learn from the land, Thotar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is a demon really so different from a hunter's pet?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What should a mage know about Durotar's beasts?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do the beasts shy from me, Thotar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { text = "Loyalty matters more than love.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A companion should choose to stand with you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = {
        { id = "c_default", text = "Watch it hunt before you tame it, because a beast that hunts carelessly will fight carelessly beside you. When you find one that waits and watches, that is the one." },
        { id = "c_tauren", when = { race = "Tauren" }, text = "Your people already know this, I think, because the tauren have hunted beside the beasts of Mulgore for longer than we have been in Kalimdor. Watch it hunt, and pick the one that waits." },
      },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know tracks and beasts, and that is not either one. Ask Gar'Thok or Orgnil." } },
  },
}

-- Kaplak: Razor Hill's rogue trainer, down in the burrow under the hill.
P:NPC {
  key = "kaplak", id = TODO_NPC("Kaplak"), name = "Kaplak", title = "Rogue Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "sly" }, values = { "cunning" },
  notices = { "class", "stealth" },
  impression = {
    first = "Kaplak trains rogues out of a dim burrow under Razor Hill and speaks as if every conversation might be overheard. He seems to enjoy being underestimated.",
    third = "{name} found Kaplak, the rogue trainer hidden beneath Razor Hill.",
  },
  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You found the burrow on your own, so you are learning. Come in and keep your voice low." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "This burrow is not for sightseers, so either you are lost or you are nosy. Which is it?" },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice try, but I heard your buckle three steps ago. Wrap it in cloth next time and you might surprise someone who is not me." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I trust nobody in my burrow. The Silver Hand marched into the camps with banners and trumpets, and everyone saw them coming, which is why I prefer my way. If you're the kind who knows when to keep the glow down, we'll get on." } },
      choices = {
        { text = "I'll not hide the Light for anyone, Kaplak.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I know when to keep it down. Quietly does it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They need one more than they'd admit and less than they'd like, because a rogue who's been healed once starts taking chances. I'd rather they came back cut and careful, but if one doesn't come back at all, I'd be glad of someone to say the words over him." } },
      choices = {
        { text = "I'll say the words, and heal the ones who return.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Rogues choose the dark. They can bury their own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "We do, and the good ones don't admit it, because it spoils the image. The warrior stands out front where the Kul Tirans can see him, and while they shoot at him my students walk around the back and finish it, so if you hear a scream behind the enemy line, that's teamwork." } },
      choices = {
        { text = "I'll stand out front. Someone has to.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the rogues take the front for once.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of it, though you'll never be as quiet with a boar breathing at your heels. Tracking and stalking aren't so different, because both are about knowing where your prey will look and being somewhere else, and the best hunters in Durotar all have a boar scar to show for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a terrible thief, by the way, because it can't keep still when it's pleased with itself." },
      },
      choices = {
        { text = "I hunt in the open. Stalking is not stealing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Stalking, stealing, it's all the same craft.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Some of you can turn invisible with a spell, I'm told, which is cheating, if you ask me. Learn to keep quiet without it, and you'll be twice as useful as those who rely on their tricks." },
      },
      choices = {
        { text = "Then I'll learn to stalk on my own two feet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A spell does the job. Crawling through cactus is wasted effort.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Sometimes, when someone needs a curse and a knife on the same target, though that green glow of yours lights up a dark alley like a bonfire. Work with my people if you like, but keep your demon out of sight, because it'll get us both killed." },
      },
      choices = {
        { text = "I'll keep the imp out of sight. Agreed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp goes where it pleases. Deal with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than they'd admit. A shaman who walks soft can call the wind to cover his steps and put frost on a man's legs before he knows he's been seen, and the Burning Blade never hear what's coming for them." } },
      choices = {
        { text = "I'd rather the enemy see me coming and fear it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quiet kill is still a kill, and a quicker one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A cat already knows most of what I teach, which is to wait, to watch and to strike once. What I could teach you is the part that comes after, knowing when to keep your mouth shut, and that's harder for most folk than the killing." } },
      choices = {
        { text = "I'd rather strike openly, where the enemy can see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Waiting in the dark and striking once suits me well enough.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin, here in my burrow. I didn't think your kind knew how to come in quietly. Most of them knock the door down." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, down here in the dark. You'll fit in better than you'd like to think, because the shadow you pray in is the same one I work in." },
        { id = "h_default", key = true, text = "Name's Kaplak, and I teach the quiet arts to those who have the stomach for them. The grunts upstairs fight in the open, but somebody has to handle the work that happens in the dark." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, down in my burrow. Keep your thunder to yourself, friend, because the grunts upstairs don't need to know what goes on down here." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, down in my burrow, and quieter than most of my students. I hear your kind can walk as a cat, so you'll forgive me if I keep one eye on the shadows while we talk." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, down in my burrow? You're the last person I expected, because your kind glow too much to hide." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock, down in the burrow. Your imp's light is giving away my hiding place, so put it out or take it outside." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, all noise and steel. The grunts upstairs could use you more than I can, though I'll admit you'd make a fine distraction." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You move almost quietly enough to be one of mine, though your beast gives you away." },
      },
      choices = {
        { text = "Do your rogues ever need a priest, Kaplak?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do shamans have any use for the quiet arts?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a druid learn something from your quiet arts, Kaplak?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Why train down in a burrow?", next = "burrow" },
        { text = "What work happens in the dark?", next = "work" },
        { text = "Could a mage ever learn to move unseen?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do rogues work with warriors, Kaplak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can a hunter learn to move like a rogue, Kaplak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do rogues and warlocks ever work together?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you trust a paladin in your burrow, Kaplak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick, because I do not like company standing in my doorway." } },
    },
    burrow = {
      lines = { { id = "b_default", text = "Because a rogue who trains in the open is a rogue everyone recognises later. Down here, my students learn their trade where nobody watches, and they leave with faces nobody remembers." } },
      choices = { { text = "Does Gar'Thok know you're here?", next = "burrow_garthok" } },
    },
    burrow_garthok = {
      lines = { { id = "bg_default", text = "Gar'Thok knows everything that happens in his town, or he likes to think so. He leaves me alone because my students bring back what his grunts cannot, like word from the Kul Tiran keep and the cultists' caves." } },
      choices = {
        { text = "Spying is a dishonourable trade.", next = "BACK", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "Wars are won with knowledge, not honour.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Scouting the Burning Blade's caves, mostly, and reading the papers the Kul Tirans leave lying around Tiragarde Keep. Orgnil Soulscar hunts the cultists in daylight, and my students make sure he knows where to look." } },
      choices = { { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If I knew, I would be the wrong person to ask about it, wouldn't I?" } },
  },
}

-- Tai'jin: Razor Hill's priest trainer, a Darkspear woman.
P:NPC {
  key = "taijin", id = TODO_NPC("Tai'jin"), name = "Tai'jin", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "warm" }, values = { "kind", "devout" },
  spiritSensitive = true,
  notices = { "class", "weary" },
  impression = {
    first = "Tai'jin teaches priests at Razor Hill, a warm troll who treats Durotar's wounded grunts like cousins. She talks freely about Sen'jin, and she does not hide that she misses the sea.",
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
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Different, mon. My gifts come from the spirits and the sea, and yours come from the humans' Light that burn the dead. I watch the dead careful, but if you can mend a grunt bleedin' from a Kul Tiran blade, I be glad of the help." } },
      choices = {
        { text = "Then I'll mend your grunts beside you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll mend those who earn it, Tai'jin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, mon, from the quilboar and the Kul Tirans both, and they act like a cut be an insult instead of a wound. I tell them a warrior who hide his hurt be a warrior who fall over in the next fight, but they be orcs, and orcs don't listen." } },
      choices = {
        { text = "There's no shame in being healed. I'll come to you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A warrior hides his wounds. That's how it's done.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Fast as milk in the sun, mon, because the scorpids and the raptors carry filth in their claws. Wash every scratch with clean water before you do anything else and come to me if it start to burn, because I seen hunters lose an arm for bein' too proud to ask." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} got scratches too, I see. Bring it here and I clean them, because the Light don't mind fur." },
      },
      choices = {
        { text = "I'll tend my wounds and my beast's with care.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A few scratches never hurt anyone, priest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "More than they'd admit, because they get hurt where nobody can see, and they don't like to say how. I mend them all the same, and I don't ask who stuck the knife in, though I sometimes wonder." },
      },
      choices = {
        { text = "Thank you. I'll try not to need you so often.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Best you don't ask. Just mend it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We do, mon, because the arcane never cursed our people, and the orcs still remember what the fel did to them. But even we know the voodoo of Zalazane began as study, so keep your learning clean, as Vol'jin would want." },
      },
      choices = {
        { text = "I'll keep it clean, for the Darkspear's sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study is study. Where it leads is my concern.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Our shamans talk to the sea and the Loa as much as the elements, because the Echo Isles taught us that. The orcs learned it fresh from Thrall and the old ones who still remember, so they be careful with it, and we be a little more easy, I think." } },
      choices = {
        { text = "The spirits deserve care, whichever people calls on them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Careful or easy, power is power, and I'll use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day, mon, because I grew up with the sea in my ears and the smell of jungle rain. But the grunts here need mendin' more than I need the sea, so I stay, and I dream of the waves when I sleep." } },
      choices = {
        { text = "Duty keeps you here. The sea can wait for you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your heart belongs by the sea. You should follow it home.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They don't like it, mon, because what you call comes from a dark place that never fed anybody. But back at Sen'jin we knew the voodoo had its dark corners too, so Tai'jin won't throw stones, as long as you keep your demon away from my wounded." },
      },
      choices = {
        { text = "I'll keep my demon well away from your wounded.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your loa can think whatever they like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, mon. The loa don't like what you carry, but Tai'jin, she mend you anyway if you get hurt." },
      },
      choices = {
        { text = "How do Darkspear shamans differ from the orcs'?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does Durotar's dry land ever wear on you, Tai'jin?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Are you from Sen'jin Village?", next = "senjin" },
        { text = "What do the grunts think of a troll healer?", next = "grunts" },
        { text = "I'm an undead priest. Do you trust me?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do rogues come to you often, Tai'jin?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the Darkspear trust mages more than orcs do?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Are the grunts of Razor Hill hurt often, Tai'jin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do wounds from beasts go bad quickly here, Tai'jin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do the loa think of warlocks, Tai'jin?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Is my Light so different from yours, Tai'jin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Tai'jin.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What more you want to ask, mon? My hands be free until the next grunt come limping in." },
        { id = "h_again2", text = "More questions? Good, it keep me from thinking about the sea." },
      },
    },
    senjin = {
      lines = { { id = "s_default", text = "Yes, mon, my family fish off the coast there, south and east of here. I came to Razor Hill because the orcs had more wounded than healers, but I still go home whenever the tide be right." } },
      choices = { { text = "Do you miss the Echo Isles?", next = "senjin_isles" } },
    },
    senjin_isles = {
      lines = { { id = "si_default", text = "Every day, and every Darkspear does, since Zalazane took them with his voodoo and his hexed puppets. Master Gadrin in the village be trying to drive him out, and you should help him if your road go that way." } },
      choices = {
        { text = "Zalazane deserves a hard end.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "His puppets were your people. I hope they can be saved.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
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
  notices = { "class", "arcane" },
  impression = {
    first = "Un'Thuwa teaches magic in Sen'jin Village and is quietly proud that a Darkspear can bend the arcane as well as any elf. He is dry about it, and keen to hear where a student learned their first spell.",
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
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everything that should not work, interest me. The Light should burn you and it answer you, the same way the elves say a troll should not bend the arcane, and I do. Strange things prove the world be bigger than the rules." } },
      choices = {
        { text = "The Light has its own rules. I keep them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for those who need them, mon.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not easy, mon, and not often. The arcane be all rules and patterns, and the loa be all moods and bargains, so a troll who study both got to learn when to argue and when to listen, and I still be learnin' it myself." } },
      choices = {
        { text = "Both deserve respect, even if they don't agree.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The loa's moods are less use than the arcane's rules.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every Darkspear warrior be glad of a mage when the Kul Tirans line up their muskets, because a wall of frost stop a volley better than any shield. Learn to stand where my fire won't hit you, mon, and you and me get along fine." } },
      choices = {
        { text = "Magic has its place. I'll gladly fight beside it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Steel is honest. I don't trust your tricks, troll.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, mon, but Zalazane's magic touch the isles now, and some of the beasts out there act strange. I don't like it, because a beast be honest and a hex make it a liar, so if you hunt there, put down the ones that froth and spare the rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} not be hexed, I can see that much. Good, mon; keep it far away from Zalazane." },
      },
      choices = {
        { text = "I'll spare the beasts that aren't hexed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A strange beast is a dangerous one. I'll kill them all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not of stealing them to read, mon, but to sell, because some fools in Orgrimmar pay good coin for old troll scrolls. Keep your hands where I see them, and we stay friends." },
      },
      choices = {
        { text = "I'll leave the books where they lie. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If someone pays for scrolls, someone will steal them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The arcane be a river, and the fel be the poison someone pour in it. The orcs who drank that poison nearly died of it, and Zalazane's dark voodoo be a poison of its own, so I teach my students to keep well clear of both." },
      },
      choices = {
        { text = "Then I'll keep the poison far from your river.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Poison is power, Un'Thuwa, if you know the dose.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Safer? No, mon, but it be honest about what it costs. You ask the fire for help and maybe it say no, but when I call it there be no asking, and that be the trouble with the arcane, because nobody tell you when to stop." } },
      choices = {
        { text = "Power should answer to something, whether spirits or study.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody should tell a caster when to stop.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Used carelessly it does, mon, and the elves blew up half their world finding that out long before any troll learned a spell. That be why I teach my students slowly, though they always want the fireball before they learn to put it out." } },
      choices = {
        { text = "Slow and careful is the right way to teach any power.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power should be used freely. Let the students learn by burning.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I teach the arcane, warlock, and I don't touch what you touch. Keep that imp out of my hut, please, because it be eyeing my scrolls." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon, in the mage's hut. You lost, or you come to see what real power look like?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon, and a beast with you. The beasts don't like the smell of my spells, but they get used to it." },
      },
      choices = {
        { text = "Do the arcane and the loa ever work together, Un'Thuwa?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is the arcane any safer than what the spirits give?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you think arcane magic harms the land, Un'Thuwa?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Where did a Darkspear learn magic?", next = "learn" },
        { text = "What does the village think of mages?", next = "village" },
        { text = "Is there trouble here your magic could help with?", next = "zalazane" },
        { text = "Would you really suspect me of stealing books?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can magic help a warrior, Un'Thuwa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do beasts still roam the Echo Isles, Un'Thuwa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is the arcane really so different from the fel?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Light interest a troll mage, Un'Thuwa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more, mon? Ask, the fire can wait." } },
    },
    learn = {
      lines = { { id = "l_default", text = "Trolls been working magic since the humans were still herding goats, mon, whatever the elves say about it. Mine came from old scraps and a lot of burned fingers, and the Horde gave me a place to teach it." } },
      choices = { { text = "Before the elves? Really?", next = "learn_elves" } },
    },
    learn_elves = {
      lines = { { id = "le_default", text = "Big and proud, mon, with temples and witch doctors and mages in Zul'Aman and the jungles of Stranglethorn. The Darkspear were never one of the great tribes, but we remember the stories, and a good story teach as much as any spellbook." } },
      choices = {
        { text = "Old stories are worth keeping.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Old stories don't matter. What you do now matters.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "The witch doctors call it cold magic and keep to their loa, and the hunters think I be soft for sitting inside. Master Gadrin respects it, though, and when Gadrin respects you, the village follows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zalazane = {
      lines = { { id = "z_default", text = "Fire burns a voodoo puppet same as anything else, mon, but Zalazane's power be his own kind of thing. Gadrin knows it best, so ask him if you want to go to the isles." } },
      choices = { { text = "I'll ask Gadrin.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Un'Thuwa knows spells, not that. Ask Master Gadrin, he knows everyone's business." } },
  },
}
