-- Mulgore's working people with no quests of their own: Camp Narache's trainers and
-- Bloodhoof Village's warrior trainer, weaponsmith and baker. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Camp Narache
---------------------------------------------------------------------------

-- Harutt Thunderhorn: Camp Narache's warrior trainer.
P:NPC {
  key = "harutt", id = TODO_NPC("Harutt Thunderhorn"), name = "Harutt Thunderhorn", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "steady" }, values = { "brave", "patient" },
  prejudice = { class = "WARLOCK", amount = 10, why = "Trains braves to take their own blows; a summoned servant fighting in your place offends him." },
  notices = { "class", "weary" },
  impression = {
    first = "He makes braves carry river stones uphill until they stop complaining.",
    third = "{name} met Harutt Thunderhorn, the warrior trainer of Camp Narache.",
  },
  greetings = {
    { id = "o_grim_redeem", when = { gossip = { topic = "grimtotem", stance = "redeemable" } }, text = "The Chief told me you think the Grimtotem could still come home. I hope you're right, though I'd keep my spear close while you wait." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Come, young brave, and plant your hooves. Let us see what the plains have taught you since you last stood here." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Walk with the Earth Mother, friend. You are not one of my braves, but you are welcome at my fire." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "A brave stands in front of his people and takes the blow himself. You send a demon to take it for you, and I've no respect for that." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I'll train any tauren who asks, but I won't train a demon's master. Ask your questions and leave my braves to their drills." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've taken a few blows yourself since I met you, I'll grant you. I still don't care for what fights beside you, but I'll talk." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "The quilboar have been at you, I see, and your armor shows every tusk. Rest before you go back down the ravine, because pride heals slower than a bruise." },
    { id = "n_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "An orc warrior on our mesa, and a long way from Durotar. Your people fight like a storm, but here you might learn to fight like a mountain." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Strength without patience only breaks things, and I suspect you've had patience forced on you by death. The braves will learn something from watching you, if you stand firm and keep your temper." } },
      choices = {
        { text = "I'll stand firm and keep my temper.", next = "BACK", reply = "Then you'll teach the braves more by standing still than I teach them by shouting. Come to the training ground whenever you like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them learn from my anger too.", next = "BACK", reply = "Anger teaches them to swing wild, and the battleboars love a wild swing. Keep it on a short rope, paladin, or it will drag you along behind it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Firmer, some of them, because a brave only has to stand his ground, while a priest stands it and keeps everyone else standing too. I saw it on the long walk before Mulgore, and I teach my braves to guard their healers first." } },
      choices = {
        { text = "Then I'll stand firm and keep your braves standing.", next = "BACK", reply = "Then my braves will stand firmer too, knowing you're behind them. That's the bargain I learned on the long walk, and it has never failed me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let your braves guard themselves. I'm no one's nursemaid.", next = "BACK", reply = "Then they'll fall, and you'll walk past them, and the camp will remember it. I hope you never learn that lesson the way I watched others learn it.", fx = { align = { light = -1 } } },
        { text = "Something else, Harutt.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because one day a beast will charge you after your companion falls, and on that day you'll need to plant your feet and hold. The battleboars of Narache charge straight at anything that moves, and learning to stand against them is the first lesson every young one learns, warrior or hunter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because one day a beast will charge you after your companion falls, and on that day you'll need to plant your feet and hold. Your {pet} stands well, I'll give it that. Perhaps it could teach my young braves a thing or two about patience." },
      },
      choices = {
        { text = "I'll learn to stand firm, as the braves do.", next = "BACK", reply = "Good. The battleboars will knock you flat a few times first, and you'll thank them for it later.", fx = { align = { order = 1 } } },
        { text = "I'll stay back and let my beast hold the line.", next = "BACK", reply = "And when the beast falls, you'll be standing back there alone with a battleboar coming. Learn to plant your feet anyway, young one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Less different than either would like, because the bear stands its ground for the cubs behind it, and so does a good brave. Gennia Runetotem tells her students the bear is patience with claws, and I have stolen that for my own lessons." } },
      choices = {
        { text = "The bear stands for the herd, never for its own glory.", next = "BACK", reply = "That is the bear's whole lesson, and I'll steal your words for my students, if you don't mind. They need to hear it from someone younger than me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A bear that waits too long gets nothing. Strike first.", next = "BACK", reply = "A bear that strikes first often strikes the wrong thing, as many young braves have found. Wait for the charge, and then meet it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Patience, which is the same thing a rogue needs, because the strongest blow is the one you wait for. Go down to the Bristleback camps and watch their scouts, and come back when you've learned to wait without fidgeting." },
      },
      choices = {
        { text = "Patience first, then a fair fight. That's my way.", next = "BACK", reply = "Good. Go and watch the Bristleback for a day, and come back and tell me what you saw before you tell me what you killed.", fx = { align = { honor = 1 } } },
        { text = "I'll wait, and then strike while they sleep.", next = "BACK", reply = "The quilboar would do the same to you, and they'd call it clever too. I'll not teach that here, but I'll not pretend it isn't done.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They trust what they can see, and fire is easy to see, so they'll trust you quickly once you've helped them. The quilboar to the west are tougher than they look, so stand behind my braves and let them hold the line while you work." },
      },
      choices = {
        { text = "I'll stand behind your braves and fight as one.", next = "BACK", reply = "Good, that's how the braves come home together. They'll point, and you'll burn, and nobody's tail gets singed.", fx = { align = { order = 1 } } },
        { text = "I'll fight where I please. The braves can follow.", next = "BACK", reply = "Then the braves will follow you into whatever trouble you find, and some won't come back. Stand with them, mage, not ahead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because the orcs told them how demons once turned the Horde into something it never wanted to be, and they can smell brimstone on you. Show them you're patient and in command of what you carry, and the fear will pass, as most fears do." },
      },
      choices = {
        { text = "I'll earn their trust, Harutt. They'll see.", next = "BACK", reply = "They will, given time. Show them one spell that helps instead of burns, and half of them will follow you about the camp.", fx = { align = { light = 1 } } },
        { text = "Let them fear me. Fear keeps them careful.", next = "BACK", reply = "Fear makes them careful, yes, and it makes them throw spears at the first shadow. I'd rather they were steady around you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at Narache. The young braves will stare. Stand firm and let them, since that's a lesson too." },
        { id = "h_default", key = true, text = "I am Harutt Thunderhorn, and I teach the young braves of Narache to stand firm. A tauren is strong from birth, but strength without patience only breaks things." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Your arms are thicker than when you came to me, young one, and your stance is better. Are you ready to learn more?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You carry totems on your belt, young one, and that is a heavy load for a brave. Carry it as patiently as you would carry a spear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter comes to the warrior's fire. Sit, and let me tell you why a hunter should stand as firm as any brave." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Strength without patience breaks things, and I am told that healing without patience breaks things too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll wear the bear's shape before long, so come and watch my braves, because a bear that fights every battle ends up a rug in somebody's tent." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in Narache. I teach strength, young one, and you'll need it even if you strike from the shadows." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, at Camp Narache! We don't see many here, though the trolls who pass through say your sort are clever." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I'll speak plainly, young one. The braves have been whispering about you since you came into camp, and I won't lie to them about what they smell." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "The braves smell the fel on you, young one, and so do I. I won't lie to them, and I won't lie to you: you're not welcome at my fire." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've stood with the braves and never once set your demon on them. That counts for something with me, though not for everything." },
      },
      choices = {
        { text = "Why should a hunter learn to stand firm, Harutt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "A shaman needn't be as strong as a warrior, Harutt.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does patience have to do with fighting?", next = "patience" },
        { text = "The camp seems to face plenty of danger.", next = "danger" },
        { text = "Who else trains here?", next = "others" },
        { text = "A priest can't stand as firmly as a brave, Harutt.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is a druid's bear any different from a warrior's strength?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What could a rogue learn from you, Harutt?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The braves don't seem to trust mages, Harutt.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do the braves go quiet when I pass, Harutt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will you train beside a paladin, Harutt?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Harutt.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will, young one. The sun is high, and there is time." },
        { id = "h_again2", text = "Something more? Speak, and I will listen, as the mesa listens to the wind." },
      },
    },
    patience = {
      lines = { { id = "p_default", text = "The kodo does not run at every noise, and that is why the wolves cannot move it. A brave who waits for the right moment strikes once, and a brave who charges at everything is tired when the real enemy comes." } },
      choices = {
        { text = "Then I'll learn to wait.", next = "BACK", reply = "Good, the kodo will teach you if you watch them. Come back after your first real fight and tell me if you still believe it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Sometimes you must strike first and hard.", next = "BACK", reply = "Sometimes, yes, and the kodo knows that too when the wolves come close. But you'll strike harder for having waited first.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "The Bristleback quilboar who dig in Brambleblade Ravine, below the mesa, and the plainstriders and battleboars that roam the grass. Grull Hawkwind sends the braves against them, and I make sure they come back." } },
      choices = { { text = "The quilboar seem to attack you often.", next = "danger_why" } },
    },
    danger_why = {
      lines = { { id = "dw_default", text = "They are greedy for land, and they think Red Cloud Mesa should belong to them. Chief Hawkwind would share the plains with almost anyone, but the quilboar do not want to share anything." } },
      choices = { { text = "Thank you.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "Meela Dawnstrider teaches the shaman, and Gart Mistrunner the druids, and Lanka Farshot the hunters. Between the four of us, every young tauren learns something before they walk down to Bloodhoof." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Stronger, in the way that matters, because the elements will not be bullied and a shaman must not bend to them either. Strength without patience breaks things, and with the elements it breaks you first." } },
      choices = {
        { text = "Then I'll learn patience before I ask for power.", next = "BACK", reply = "Then the elements will listen, and so will I. Come to my fire at dusk, when the wind is quietest.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements answer the bold. Patience is for the old.", next = "BACK", reply = "The elements answer the bold once, young one, and break them the second time. Come back when you've been broken, and we'll talk again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That I do not know, young one. Ask Grull or the chief, who see farther than I do." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback are the first enemy every brave in Narache meets, and they are a good teacher. Tough, mean, and never willing to give up, which is what I want my braves to learn." } },
    cairne = { { id = "tp_cairne", text = "Cairne carried river stones up the hill when he was a calf, just as my braves do now. He told me so himself, and I believe him." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us these stones and this hill, and I use them both. My braves complain, but they get stronger, and she is pleased." } },
  },
}

-- Meela Dawnstrider: Camp Narache's shaman trainer.
P:NPC {
  key = "meela", id = TODO_NPC("Meela Dawnstrider"), name = "Meela Dawnstrider", title = "Shaman Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "serene" }, values = { "wise", "kind" },
  notices = { "class", "form" },
  impression = {
    first = "She has no patience for anyone who treats the spirits like servants.",
    third = "{name} met Meela Dawnstrider, the shaman trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "The wind told me you were coming, young one. Sit with me, and tell me what the elements have whispered to you." },
    { id = "g_other", when = { ["not"] = { class = "SHAMAN" } }, text = "Peace be on you, traveler. The morning is clear, An'she is warm, and the spirits are calm." },
  },
  notice = {
    { id = "n_ghost", cat = "form", when = { form = { "ghostwolf" } },
      text = "You come to me on four legs and wrapped in spirit, and that is good. The ghost wolf carries you only because the spirits allow it, so thank them when you change back." },
  },
  start = "hello",
  nodes = {
    op_elements = {
      lines = {
        { id = "ope_q", text = "Every people I've met treats the elements differently, and I've learned not to call any of them wrong too quickly. What do you think the elements are owed, young one?" },
      },
      choices = {
        { text = "Respect, the way you'd treat an elder. They're not ours to use.", next = "op_elements_r1", fx = { affinity = 2, align = { order = 1 }, opinion = { the_elements = "respect" } } },
        { text = "Nothing. They're a force like any other, to be bent to need.", next = "op_elements_r2", fx = { affinity = -2, align = { order = -1 }, opinion = { the_elements = "useful" } } },
        { text = "Thanks, and sometimes a bargain. The orcs' way works too.", next = "op_elements_r3", fx = { trait = { practical = 1 }, opinion = { the_elements = "mixed" } } },
        { text = "I hear them, Meela. They're owed listening.", next = "op_elements_r4", fx = { affinity = 2, opinion = { the_elements = "respect" } }, when = { class = "SHAMAN" } },
        { text = "I've never thought about it, Meela.", next = "BACK" },
      },
    },
    op_elements_r1 = {
      lines = {
        { id = "op_elements_r1", text = "That's the tauren way, and I couldn't have put it better. Go and listen to the wind for a while, and it'll thank you for it." },
      },
      choices = {
        { text = "Something else, Meela.", next = "BACK" },
      },
    },
    op_elements_r2 = {
      lines = {
        { id = "op_elements_r2", text = "The orc warlocks thought that way about other powers, once, and you've seen what became of their land. Be careful, young one." },
      },
      choices = {
        { text = "Something else, Meela.", next = "BACK" },
      },
    },
    op_elements_r3 = {
      lines = {
        { id = "op_elements_r3", text = "Thrall would say much the same, I think, and I'll not argue with the Warchief about the spirits. Only remember to thank them first." },
      },
      choices = {
        { text = "Something else, Meela.", next = "BACK" },
      },
    },
    op_elements_r4 = {
      lines = {
        { id = "op_elements_r4", text = "Then you've learned the hardest lesson already, and everything after is only practice." },
      },
      choices = {
        { text = "Something else, Meela.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They do not resent it; they do not know it. The first lesson I teach is to listen before you ask, and you, I think, had to learn to listen in a very dark place. If the Light is how you listen, I'll not argue with it." } },
      choices = {
        { text = "The Light and the spirits can share Mulgore.", next = "BACK", reply = "They can, I think, as the sun and the moon share the sky. Listen well, and both will answer you in time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits needn't approve of my Light.", next = "BACK", reply = "No, they needn't, and they won't ask your leave either. Only listen first, and you'll find they're more patient with strangers than you think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not that I have felt, though fire grows restless near a priest of shadow, and water seems to lean towards a healer. You ask a power that answers, as I do, and I only ask that you never treat it like a servant." } },
      choices = {
        { text = "I'll ask with respect, as you teach your shaman.", next = "BACK", reply = "Then you'll be welcome at my fire, priest, and the elements will feel it. You may find they answer you sooner than you expect.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. I'll use whatever answers me.", next = "BACK", reply = "The elements are not a tool to be picked up, priest, and they will teach you so. Use it if you must, but they will remember how you asked.", fx = { align = { light = -1 } } },
        { text = "Something else, Meela.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should, because the earth holds his feet and the air fills his lungs when he charges. The young braves who train with Harutt come to my fire before their first fight, and those who listen for the earth's rumble hear the quilboar coming sooner." } },
      choices = {
        { text = "I'll thank the earth before I fight, Meela.", next = "BACK", reply = "Then the earth will hold your feet when the quilboar charge. Come to my fire before your next fight, and we'll thank it together.", fx = { align = { light = 1 } } },
        { text = "My strength is my own, Meela, not the earth's.", next = "BACK", reply = "It is, and the earth gave you the ground to stand on. Thank it anyway, warrior, and see if you don't stand a little firmer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Thunder before it rolls and the earth before it shakes, and every shift of the wind that carries a scent. The beasts of Mulgore live closer to the elements than any shaman, so watch them closely, and they'll teach you as much as I ever could." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Thunder before it rolls and the earth before it shakes, and every shift of the wind that carries a scent. Your {pet} lifts its head when the wind turns. That is the air speaking, {class}, and your companion is listening." },
      },
      choices = {
        { text = "I'll learn to listen as my beast does.", next = "BACK", reply = "Then your beast will teach you more than any trainer could. Watch the wind with it, and you'll know the storm before it breaks.", fx = { align = { light = 1 } } },
        { text = "Beasts hear scent and noise, nothing more.", next = "BACK", reply = "That is all they need, and more than most of us notice. Listen to the scent and the noise, hunter, and you'll find the spirits in them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They don't fear it, child, they despise it, and so do I. The orc shamans learned that lesson in their own blood when their warlocks turned the elements away from them, and I'll not see the young of Narache learn it from you." },
      },
      choices = {
        { text = "I won't bring it near your students.", next = "BACK", reply = "Thank you, child. The young ones have only just stopped having nightmares about the last one.", fx = { align = { light = 1 } } },
        { text = "The elements' opinion of me changes nothing.", next = "BACK", reply = "It changes everything about how they'll answer you, which is not at all. Go your way, but do not come near my students with that thing.", fx = { align = { light = -1 } } },
        { text = "How do you listen to the elements?", next = "listen" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The elements are alive, and they answer when you ask with respect. The arcane answers whoever has the will to grasp it, and that's exactly what makes my people wary of it." },
      },
      choices = {
        { text = "Asking with respect is the wiser path.", next = "BACK", reply = "It is, and it's the path I teach, though few of the young have the patience for it. You may surprise me.", fx = { align = { order = 1 } } },
        { text = "Will and study are all any power needs.", next = "BACK", reply = "Then the arcane will answer you, and the elements will not. That is a choice, and I hope you understand what it costs.", fx = { align = { order = -1 } } },
        { text = "Who taught the tauren the shaman's way?", next = "tradition" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A shaman asks the elements and waits for their answer, but a druid becomes part of the wild and keeps its balance from within. The night elves taught Hamuul the druid's way, while the shaman's way is far older among the tauren, and I think the Earth Mother is glad to be heard either way." } },
      choices = {
        { text = "Each path should keep to its own teachers and its own ways.", next = "BACK", reply = "There's wisdom in that, and the elders would agree. Still, I think the Earth Mother listens to both of us gladly.", fx = { align = { order = 1 } } },
        { text = "Let the paths mingle, because the wild draws no such lines.", next = "BACK", reply = "It doesn't, and I've thought the same on long evenings. Let them mingle, then, as long as both are honoured.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They don't forgive or condemn, because the elements aren't judges, but they do remember who treats them like servants. Walk softly through Mulgore and don't foul the water or burn the grass, and they'll let you pass as they let the wind pass." },
      },
      choices = {
        { text = "I'll walk softly and leave the land as I found it.", next = "BACK", reply = "Then they'll let you pass as easily as they let the wind pass. Few rogues ever think to ask.", fx = { align = { light = 1 } } },
        { text = "The elements aren't my concern. My targets are.", next = "BACK", reply = "They will be, if you foul their water or burn their grass. Walk softly anyway, rogue, for your own sake.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. The elements are listening to you very carefully, and so am I." },
        { id = "h_default", key = true, text = "I am Meela Dawnstrider, and I teach the young shaman of Narache to hear the earth, fire, water and air. The elements are not tools, and the first lesson is learning to listen before you ask them for anything." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "You have been listening to the spirits, I can tell, because you walk more softly than you did. Are you ready for a new lesson?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The earth holds you up, though you may never have thanked it for that." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast hears the elements better than you do, so watch its ears when the wind changes." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The elements are quiet around you, as they are around anyone who listens to something they cannot hear, and I find I respect that." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. The elements and the wild are close cousins, so I'd ask you to listen as carefully as my shaman do, though your teachers on Elder Rise will tell you the same in other words." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. The spirits don't care for sneaking, young one, but the wind is quiet too, so I won't judge you yet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How do you listen to the elements?", next = "listen" },
        { text = "Someone must have taught the tauren the shaman's way.", next = "tradition" },
        { text = "I'm an orc shaman. Is our way different?", next = "orc", when = { race = "Orc", class = "SHAMAN" } },
        { text = "Your elements don't fear what walks with me, do they?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Is the arcane so different from the elements?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior thank the elements, Meela?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What does my companion hear, Meela?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess the elements and my prayers quarrel sometimes, Meela.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How does a druid's path differ from a shaman's, Meela?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "The spirits must find it hard to forgive a rogue.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the elements resent the Light, Meela?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Meela.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else would you know? The wind can wait for us." },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "Sit still on the grass until you can feel the earth under you, and then wait until you can feel the wind on your face without thinking about it. When you stop noticing yourself, the spirits begin to notice you." } },
      choices = { { text = "They might never answer.", next = "listen_none" } },
    },
    listen_none = {
      lines = { { id = "ln_default", text = "Then you are still talking inside your own head, and you should try again tomorrow. The spirits answer everyone in time, but they do not answer anyone who is in a hurry." } },
      choices = {
        { text = "The spirits deserve that respect.", next = "BACK", reply = "They do, and they'll give it back to you when you're ready. Come and sit with me again tomorrow, and the day after.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If they won't answer, I'll find power elsewhere.", next = "BACK", reply = "Then go, and find what answers the impatient. But it won't be the spirits, and it won't be gentle.", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tradition = {
      lines = { { id = "t_default", text = "No one taught us; the tauren have always spoken with the spirits of the earth, as long as there have been tauren. Our elders say the Earth Mother gave us her ears so we would never be lonely on the plains." } },
      choices = {
        { text = "What do you think the spirits are owed?", next = "op_elements" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "o_default", text = "The orcs lost the elements for a time and found them again through Thrall, so your way is younger and fiercer than ours. The spirits are the same spirits, though, and they were glad to have your people back." } },
      choices = { { text = "That's good to hear.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not mine to know, little one. Ask the elders at Bloodhoof, or the chief." } },
    the_elements = { { id = "tp_the_elements", text = "The elements are not servants, and they are not to be commanded. A shaman listens first, asks second, and only acts when the spirits agree." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is the source of all the spirits, and every shaman must honour her. I teach the young to thank her before they ask anything of the elements." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a shaman, and that is a great comfort to me. A leader who listens to the spirits will not lead his people astray." } },
  },
}

-- Gart Mistrunner: Camp Narache's druid trainer.
P:NPC {
  key = "gart", id = TODO_NPC("Gart Mistrunner"), name = "Gart Mistrunner", title = "Druid Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "narache" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class", "form" },
  impression = {
    first = "He speaks of the night elves who taught his people with gratitude.",
    third = "{name} met Gart Mistrunner, the druid trainer of Camp Narache.",
  },
  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome back, young druid. The plains have been good to you, I think, because you walk like you belong on them." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "Welcome, friend. The grass is green on the mesa this season, which is a good sign." },
  },
  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear" } },
      text = "You stand before me as a bear, and you wear the shape well. Remember that the bear is strong because it is patient, not because it is angry." },
  },
  start = "hello",
  nodes = {
    op_druidism = {
      lines = {
        { id = "opdr_q", text = "I've told you how we learned the old ways from the kaldorei. Now I'd like to hear you: do you think a druid should stand apart from the wars of their people?" },
      },
      choices = {
        { text = "Yes. The wild has no side, and neither should a druid.", next = "op_druidism_r1", fx = { affinity = 2, align = { order = -1 }, opinion = { druidism = "neutral" } } },
        { text = "No. A druid who won't defend their people isn't worth much.", next = "op_druidism_r2", fx = { affinity = -1, align = { order = 1 }, opinion = { druidism = "duty" } } },
        { text = "I'm a druid, and I'd guard Mulgore before any grove.", next = "op_druidism_r3", fx = { opinion = { druidism = "duty" } }, when = { class = "DRUID" } },
        { text = "I don't know enough of druids to say.", next = "BACK" },
      },
    },
    op_druidism_r1 = {
      lines = {
        { id = "op_druidism_r1", text = "That's what they teach in Moonglade, and it's what I try to live by here. It's harder than it sounds, when your people are bleeding." },
      },
      choices = {
        { text = "Something else, Gart.", next = "BACK" },
      },
    },
    op_druidism_r2 = {
      lines = {
        { id = "op_druidism_r2", text = "Hamuul's heard that from many of our braves, and he answers it better than I can. I only know the forest doesn't care whose banner's on the axe." },
      },
      choices = {
        { text = "Something else, Gart.", next = "BACK" },
      },
    },
    op_druidism_r3 = {
      lines = {
        { id = "op_druidism_r3", text = "Then guard it well, and don't let anyone in Moonglade tell you that's a lesser thing." },
      },
      choices = {
        { text = "Something else, Gart.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not fear, I think, only uncertainty. They know life and they know death, and you are both and neither. The night elves taught us to see the balance in things, and you are a balance I have not seen before." } },
      choices = {
        { text = "Then I'll walk carefully and keep the balance.", next = "BACK", reply = "Then I'm glad of you, and the beasts will learn your scent soon enough. Start with the plainstriders; they forgive easily.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Balance is for druids. I'm a paladin.", next = "BACK", reply = "A paladin may be, and a good one, but balance belongs to everything that walks the earth. You'll find it in your own way, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They would sense the healing in you, I think, the same way they sense it in a druid, though yours smells of incense and ours of grass. A hurt beast will come to a gentle hand, so if you find one, kneel and wait." } },
      choices = {
        { text = "Then I'll kneel and wait, and mend what comes.", next = "BACK", reply = "Then you'll find the wild kinder than you expect, priest. I once had a wolf follow me home for a week after I set its leg.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hurt beast that comes to me is easy prey.", next = "BACK", reply = "Easy prey, yes, and the wild would never trust you again. I hope you never put that to the test.", fx = { align = { light = -1 } } },
        { text = "Something else, Gart.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, because a druid in bear form stands in front of the quilboar the same as any warrior. The difference is that a bear knows when the fight is over, and I'd wish that wisdom on every warrior who walks through Narache." } },
      choices = {
        { text = "I'll know when the fight is over, Gart.", next = "BACK", reply = "Then you have the bear's wisdom already, warrior, and I'll have nothing to teach you but the shape.", fx = { align = { honor = 1 } } },
        { text = "The fight's over when the enemy's dead.", next = "BACK", reply = "Sometimes, and sometimes it's over long before that. The bear knows the difference, and I'd wish it on you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Both begin with listening to the beasts, though the druid walks further down that road than most hunters wish to. The Earth Mother gave the beasts their forms and gave us the means to understand them, so whatever path you walk, walk it with care." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Both begin with listening to the beasts, though the druid walks further down that road than most hunters wish to. Your {pet} looks content. I've always believed a content beast is the mark of a good hunter." },
      },
      choices = {
        { text = "I'll walk with care, as the Earth Mother wishes.", next = "BACK", reply = "Then you'll walk well, whatever path you choose, and the Earth Mother will see it.", fx = { align = { light = 1 } } },
        { text = "The Earth Mother made the beasts for us to use.", next = "BACK", reply = "For us to live with, yes, and sometimes to eat. But use is not the same as ownership, and the beasts know the difference.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Every creature in Mulgore knows how to hide, from the prairie dogs to the cougars in the hills, and none of them hides without a reason. Watch a cougar stalk the plainstriders some evening, and you'll learn more than any trainer could teach you." },
      },
      choices = {
        { text = "I'll hunt like the cougar, only when I must.", next = "BACK", reply = "That is the cougar's way, and a good one. Watch her in the hills sometime; she can lie still for half a day.", fx = { align = { light = 1 } } },
        { text = "I'll learn their tricks and use them on anyone.", next = "BACK", reply = "The cougar uses her tricks for her cubs and her supper, not for anyone. I'd ask you to think about that before you use them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They say the arcane cost their people dearly, long ago, and they don't say much more than that to a tauren. I only know that the creatures here flee from fire, so please use your frost instead when you hunt in Mulgore." },
      },
      choices = {
        { text = "I'll respect their warning and use my magic carefully.", next = "BACK", reply = "Thank you, and the beasts will thank you too. Frost, please, and the grass will stay green.", fx = { align = { order = 1 } } },
        { text = "Their old fears needn't bind me.", next = "BACK", reply = "Perhaps not, but the grass here burns, and the night elves aren't the only ones who remember fire. Use frost in Mulgore, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, because they know when something doesn't belong in the world, and that companion of yours doesn't. I won't send you away, because the Horde accepts you, but please keep it far from the wild whenever you can." },
      },
      choices = {
        { text = "I'll keep it from the wild, Gart.", next = "BACK", reply = "Thank you. The plainstriders scatter at the smell of it, and I spend all evening calling them back.", fx = { align = { light = 1 } } },
        { text = "The wild will have to get used to it.", next = "BACK", reply = "It won't, and it'll flee from you instead. You'll walk these plains a long while without seeing a living thing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The creatures of Mulgore have gone very quiet around you, and I am curious why." },
        { id = "h_default", key = true, text = "I am Gart Mistrunner, and I teach the young druids of Narache. We learn to take the shapes of the beasts and to heal the land, as the Earth Mother wishes." },
        { id = "h_druid", when = { class = "DRUID" }, text = "Each time you come back, I can see more of the wild in you. What will you learn this time?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The creatures of Mulgore grow calmer when one of your kind walks among them, and I wonder if you've noticed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You remind me of the young druids when they first take the bear's form, all strength and no stillness." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a beast who trusts you. That trust is the first step on the druid's path as well as yours." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Most of my students are tauren, and the creatures of Narache rarely see a troll or a Forsaken, so do not mind if the plainstriders stare." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You move like a cat, almost, though a cat doesn't carry knives." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. The night elves who taught my people were wary of magic like yours, but I've seen it do good." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "The creatures go quiet when you walk past, stranger, and so do I, I'm afraid." },
      },
      choices = {
        { text = "What does a druid know of fighting, Gart?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "The hunter's path seems much like the druid's, Gart.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Who taught the tauren to be druids?", next = "history" },
        { text = "What does a druid do for Mulgore?", next = "land" },
        { text = "I'm a night elf druid as well.", next = "elf", when = { race = "NightElf", class = "DRUID" } },
        { text = "The elements and the beasts must share the same spirits.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would the creatures here make of a priest, Gart?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a rogue learn from the creatures, Gart?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why are the night elves wary of mages, Gart?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The creatures seem to fear my companion, Gart.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the creatures fear me, Gart?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Gart.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will, and I will answer as well as I can, Earth Mother willing." },
      },
    },
    history = {
      lines = { { id = "h2_default", text = "The night elves did, when Hamuul Runetotem studied with Malfurion Stormrage, though our oldest stories say Cenarius walked with our ancestors long before. Today the Cenarion Circle still welcomes tauren in Moonglade, though not every elf is pleased about it." } },
      choices = { { text = "The elves must resent you.", next = "history_elves" } },
    },
    history_elves = {
      lines = { { id = "he_default", text = "Some do, because we stand with the Horde and the orcs cut down their forests in Ashenvale. But a druid is a druid first, and in Moonglade we try to remember that, whatever our peoples do outside it." } },
      choices = {
        { text = "Should druids stand apart from war, Gart?", next = "op_druidism" },
        { text = "Nature matters more than any war.", next = "BACK", reply = "It does, and in Moonglade we try to remember it. I'm glad to hear a young one say so.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Horde comes first, even for druids.", next = "BACK", reply = "It does, for many of us, and I'll not argue it here. But the wild doesn't care whose banner we carry.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    land = {
      lines = { { id = "l_default", text = "We watch the herds and the grass, and we notice when something goes wrong with them before anyone else does. The plainstriders near the ravine have been restless, and I think the quilboar are to blame." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elf = {
      lines = { { id = "e_default", text = "Then you are far from your home, but we follow the same path, and you are welcome by my fire. Your people taught mine long ago, so I owe you thanks at the least." } },
      choices = { { text = "Then we're kin in this.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I don't think they do, though they're neighbors on the same land, the way the kodo and the plainstrider are. The beasts answer the Earth Mother through the wild and the elements answer through stone and wind, and both grow restless when the land is hurt, though our elders teach us to keep their ways apart." } },
      choices = {
        { text = "Each spirit has its place, and the elders are right to keep them there.", next = "BACK", reply = "There's sense in it, and the elders have kept the peace that way for many winters. I've never seen a storm come of it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spirits mingle freely. Lines the elders draw don't bind them.", next = "BACK", reply = "Maybe they do, and I've felt them mingle on stormy nights. Still, the elders have their reasons, and I'd not throw them out lightly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the beasts and the grass, but I don't know that. Ask Grull Hawkwind; he roams farther than I do." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Emerald Dream is where the druids go in sleep, and the night elves taught us how. I am grateful to them for that, whatever the orcs think of them." } },
    elune = { { id = "tp_elune", text = "The night elves pray to Elune, and the tauren pray to the Earth Mother. I think they are both looking at the same moon, but the night elves never let us say so." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made every creature in Mulgore, and I spend my days learning about them. I am more interested in the plainstriders than in the people, I confess." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The Cenarion Circle is the order of druids that the night elves founded, and they let the tauren join after the war on Hyjal. Hamuul is one of them, and I hope to be one day." } },
  },
}

---------------------------------------------------------------------------
-- Bloodhoof Village
---------------------------------------------------------------------------

-- Krang Stonehoof: Bloodhoof Village's warrior trainer.
P:NPC {
  key = "krang", id = TODO_NPC("Krang Stonehoof"), name = "Krang Stonehoof", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "gruff" }, values = { "proud", "dutiful" },
  notices = { "class", "weary" },
  impression = {
    first = "He is proud that the tauren have become warriors of the Horde.",
    third = "{name} met Krang Stonehoof, the warrior trainer of Bloodhoof Village.",
  },
  greetings = {
    { id = "o_dw_distrust", when = { gossip = { topic = "dwarves", stance = "distrust" } }, text = "I hear you think the dwarves would dig up the whole world. Good, because then you'll understand why my braves keep their axes sharp near Bael'dun." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior comes down from the mesa! Come here, and let us see whether Harutt taught you anything." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Welcome to Bloodhoof, stranger. Keep your weapon sheathed in the village, as the bull keeps his horns low in the herd, and we will get along." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You have been fighting the Venture Company, I think, because only their saws leave marks like that. Get your armor mended before you go back to the mines." },
  },
  start = "hello",
  nodes = {
    op_orcs = {
      lines = {
        { id = "opo_q", text = "I've told you what I owe them. But you've walked with the orcs more than some, so tell me what you think of them, and don't dress it up." },
      },
      choices = {
        { text = "Brothers in arms. The tauren owe them everything.", next = "op_orcs_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { orcs = "kin" } } },
        { text = "Useful allies. But they started this war with the Alliance.", next = "op_orcs_r2", fx = { align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { orcs = "useful" } } },
        { text = "Too hot-blooded. The tauren should lead with calm, not fury.", next = "op_orcs_r3", fx = { trait = { patient = 1 }, opinion = { orcs = "rash" } } },
        { text = "Lok'tar, Krang. My people won't forget what yours gave.", next = "op_orcs_r4", fx = { affinity = 3, opinion = { tauren = "kin" } }, when = { race = "Orc" } },
        { text = "I'll let my axe speak for me, Krang.", next = "BACK" },
      },
    },
    op_orcs_r1 = {
      lines = {
        { id = "op_orcs_r1", text = "Spoken like a warrior of Bloodhoof! Come and tell my students that, because some of them think the debt's already paid." },
      },
      choices = {
        { text = "Something else, Krang.", next = "BACK" },
      },
    },
    op_orcs_r2 = {
      lines = {
        { id = "op_orcs_r2", text = "Useful, you say! The orcs bled for us at the centaur camps before you were born, so mind how you weigh it." },
      },
      choices = {
        { text = "Something else, Krang.", next = "BACK" },
      },
    },
    op_orcs_r3 = {
      lines = {
        { id = "op_orcs_r3", text = "Hmph. Cairne would agree with you, and he's earned the right to say it. I'm not sure you have yet." },
      },
      choices = {
        { text = "Something else, Krang.", next = "BACK" },
      },
    },
    op_orcs_r4 = {
      lines = {
        { id = "op_orcs_r4", text = "Lok'tar! Sit at my fire any night you like, orc, because the tauren don't forget either." },
      },
      choices = {
        { text = "Something else, Krang.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They'll fight beside anyone who stands with Mulgore. The orcs told us stories of the Silver Hand and the camps, and some braves will be wary. Fight beside them well, and the stories will change." } },
      choices = {
        { text = "Then I'll fight beside them and change the stories.", next = "BACK", reply = "That's all they'll ask of you. Fight well beside them once, and the orcs will be telling a new story by the fire.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fight my way. They can take it or not.", next = "BACK", reply = "Then they'll take it or not, as you say, and the stories will stay as they are. Fight well, at least, and I'll not complain.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They trust what they have seen, and they have seen troll priests pull braves back from death at the edge of the Barrens. A Forsaken priest makes them uneasy still, because the dead should not be walking, but I tell them a healer is a healer." } },
      choices = {
        { text = "I'll earn their trust, Krang, one wound at a time.", next = "BACK", reply = "That's how it's done, priest. Mend one brave who swore he didn't need it, and the rest will line up.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their trust doesn't matter. Their wounds heal either way.", next = "BACK", reply = "They do, and I'll not argue that. But a brave who trusts his healer stands longer, and you'll want that someday.", fx = { align = { light = -1 } } },
        { text = "Something else, Krang.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a hunter who knows where the warriors will stand knows where to shoot, and where not to. Since Cairne joined the Horde, our braves fight beside orc hunters and troll hunters both, and the ones who learn each other's ways come home together." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because a hunter who knows where the warriors will stand knows where to shoot, and where not to. Your {pet} will need to know the shield-wall too. Bring it to the training ground, and we'll see if it can hold its place." },
      },
      choices = {
        { text = "I'll learn to fight beside the warriors.", next = "BACK", reply = "Good, then you'll come home with my braves, and that's all I ask. Learn where they stand, and shoot around them.", fx = { align = { order = 1 } } },
        { text = "I fight my own way. The warriors can adapt.", next = "BACK", reply = "They'll try, but warriors are slow to adapt, I'll warn you. Learn a little of their ways anyway, and everyone comes home.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "So I've heard the orcs of the Shattered Hand fought, and nobody I know calls them cowards. I'll teach my warriors to stand firm and you can go around the side, but don't arrive after the fight's already won." },
      },
      choices = {
        { text = "The flank wins battles. The front only bleeds.", next = "BACK", reply = "Maybe it does, and the Shattered Hand would agree with you. Just don't arrive late, rogue, or the front will have bled for nothing.", fx = { align = { honor = -1 } } },
        { text = "I'll stand at the front with your braves.", next = "BACK", reply = "Then you're welcome at the front, and the braves will be glad of you. Stand firm, and keep your knives close.", fx = { align = { honor = 1 } } },
        { text = "What do you make of the Horde?", next = "horde" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "So the Warchief says, and I'll follow his word, because the Horde gave us Mulgore. But I've heard what the Burning Blade did in Durotar, and you carry the same smell, so I'll keep a spear near my hand whenever you're near the barracks." },
      },
      choices = {
        { text = "I'll follow the Warchief's rules, as you do.", next = "BACK", reply = "Good, that's all I ask of anyone, tauren or orc or otherwise. Cairne gave Thrall his word, and I keep it.", fx = { align = { order = 1 } } },
        { text = "Watch me all you like. I answer to myself.", next = "BACK", reply = "Then I'll keep watching, and my spear will stay near my hand. Answer to yourself, but don't answer to anything else.", fx = { align = { order = -1 } } },
        { text = "What threats does Mulgore face?", next = "threats" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Cairne gave his word to Thrall, and that word covers every tauren who can swing a claw or a club, druids as much as warriors. Some on Elder Rise think a druid belongs only to the wild, but the centaur in the Barrens never stop to ask what kind of tauren they're attacking." } },
      choices = {
        { text = "A druid serves the Horde and keeps Cairne's word.", next = "BACK", reply = "That's how I see it, and so does the High Chieftain. The Barrens grunts won't care if you come with claws or a spear.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid serves the wild first, and no banner after.", next = "BACK", reply = "Some on Elder Rise would agree, and I'll not argue with them. But the centaur won't care, druid, when they come over the hill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They do, as long as they stay behind my warriors and don't hurl fire across the grass. Mulgore's borders run from the Venture Company's camps to the Bael'dun digs, and every mile of it needs guarding, so I'll take a mage if I can't get a warrior." },
      },
      choices = {
        { text = "I'll stand behind your warriors and guard the border.", next = "BACK", reply = "Good, then I'll find you a stretch of border and a few warriors to stand in front of you. Thank you, mage.", fx = { align = { order = 1 } } },
        { text = "I don't stand behind anyone, Krang.", next = "BACK", reply = "Then you'll stand alone, and the border will be guarded by one less. I'll find a warrior instead, if I can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin in Bloodhoof. Since Cairne joined the Horde, I've trained braves beside orcs and trolls. I never thought I'd train beside a dead knight." },
        { id = "h_default", key = true, text = "I am Krang Stonehoof, and I train the warriors of Bloodhoof Village. Since Cairne joined the Horde, our braves fight beside orcs and trolls, and they must learn to fight as well as any of them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? The orcs taught us that a shaman can fight as hard as any warrior, and I'll expect you to prove it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The orcs and trolls fight beside us now, and so must our hunters and warriors, so come and learn how a shield-wall works." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Horde's healers are one of the reasons I let my braves march beside orcs and trolls without fearing for their lives." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. I've seen Hamuul's students fight as bears at the edge of the Barrens, and I'll admit they held the line as well as any warrior of mine." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. The orcs taught us that warriors win wars, but I've seen what fire does to a quilboar line, and I'll admit it helps." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "How do shamans fight beside the Horde's warriors, Krang?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What threats does Mulgore face?", next = "threats" },
        { text = "The tauren seem fond of the Horde.", next = "horde" },
        { text = "Your warriors fight in the open. I prefer the flanks.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why should a hunter learn the shield-wall, Krang?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My kind fights for the Horde too, Krang, whatever the stories say.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Your warriors must trust priests, Krang.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should druids fight in the Horde's battles, Krang?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do mages belong at the borders, Krang?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will the braves fight beside a paladin, Krang?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll go.", next = "END" },
      },
      again = { { id = "h_again", text = "What else would you ask of an old warrior? Speak, and be quick about it, before my old bones stiffen." } },
    },
    threats = {
      lines = { { id = "t_default", text = "The Venture Company goblins cut down our trees and dig in our hills to the north, and the Palemane gnolls hold Palemane Rock to the southwest. Worse are the dwarves at Bael'dun, who dig into Mulgore's earth without asking anyone." } },
      choices = { { text = "The dwarves must be digging for something.", next = "threats_dwarves" } },
    },
    threats_dwarves = {
      lines = { { id = "td_default", text = "Nobody knows for sure, but the earth groans where they dig, and the shaman don't like it. Baine Bloodhoof watches them, and if they go any deeper, the village will have to answer." } },
      choices = {
        { text = "Drive them out before they do harm.", next = "BACK", reply = "Baine would agree with you, I think, if they go any deeper. Until then, we watch, and we keep our spears ready.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Talk to them first. War should be the last choice.", next = "BACK", reply = "That's what the elders say, and they're usually right. But the earth is still groaning, and talk doesn't seem to quiet it.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "h2_default", text = "The orcs saved us from the centaur when we were wandering and dying, and Thrall asked nothing for it but friendship. That's a debt I will pay with my axe until the day I die." } },
      choices = {
        { text = "What do you make of the orcs, then?", next = "op_orcs" },
        { text = "That's a good reason to fight.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Close and hard, the way Thrall's own shamans fought when they broke open the internment camps. A shaman who hides behind the braves isn't worth the totems, so plant yours where the fighting is and swing a mace while they work." } },
      choices = {
        { text = "I'll stand at the front, where the braves can see me.", next = "BACK", reply = "Good, that's where a shaman belongs, and the braves will fight harder seeing you there. Plant your totems and swing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A clever shaman strikes where the enemy isn't looking.", next = "BACK", reply = "Clever, maybe, but the braves won't see you, and they'll fight like they're alone. Come to the front sometimes, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is beyond an axe-teacher, friend, so take your question to Baine Bloodhoof." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest warrior the tauren have ever had, and he has never needed to prove it. He is proof that strength and wisdom can live in the same body." } },
    centaur = { { id = "tp_centaur", text = "The centaur raided our borders for generations, and I have fought them more times than I can count. Mulgore is ours now, and I walk its borders so it stays ours." } },
    thrall = { { id = "tp_thrall", text = "The Warchief helped us drive off the centaur, and he asked only for our friendship. The tauren became warriors of the Horde because of him, and I am proud of it." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback press on our southern border, and I send my students there first. A tauren who can fight a quilboar can fight anything." } },
  },
}

-- Mahnott Roughwound: Bloodhoof Village's weaponsmith.
P:NPC {
  key = "mahnott", id = TODO_NPC("Mahnott Roughwound"), name = "Mahnott Roughwound", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "dry" }, values = { "practical", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "He says a small weapon simply looks silly in tauren hands.",
    third = "{name} met Mahnott Roughwound, the weaponsmith of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_shop", text = "Maces, axes and staves, all made big enough for a tauren's hands and blessed by the Earth Mother's good oak. Take a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend? I hope you're here to buy, and not to complain about the last one." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You work the forge as well, I can see it on your hands. Then you know a good haft from a bad one, so I won't waste your time with the bad ones." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Of course! The orcs say the Silver Hand used hammers in the old wars, so maybe a paladin knows something about them I don't. A tauren hammer swings for the herd, though, so swing it well." } },
      choices = {
        { text = "It'll swing for the herd and the Horde.", next = "BACK", reply = "Then it'll swing well, and I'll be proud to have made it. Bring it back if it dents, and I'll mend it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It'll swing for whatever I choose.", next = "BACK", reply = "It'll swing for whatever you choose, as long as you can lift it. Just don't choose anything in Mulgore, or I'll want it back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because the gnolls never stop to ask whether you're a healer, and a priest with a heavy staff lives long enough to finish the prayer. My braves laugh when I say so, but they don't laugh when the gnolls come." } },
      choices = {
        { text = "My faith is my weapon, Mahnott, not your staff.", next = "BACK", reply = "Faith is a fine weapon, priest, but it doesn't keep a gnoll off you. Carry the staff anyway, and let your faith do the rest.", fx = { align = { light = 1 } } },
        { text = "A heavy staff, then. I'll aim for gnoll knees.", next = "BACK", reply = "Ha! Now there's a priest after my own heart. The gnolls have very bony knees, so swing hard.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Mahnott.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A great axe the smiths on the bluffs made from the iron of a broken goblin drill, and it's so heavy most orcs can barely lift it. The tauren braves swing it like a stick, though, and I'm told it splits a centaur's shield and the centaur behind it." } },
      choices = {
        { text = "I'll buy a weapon I can wield with skill.", next = "BACK", reply = "That's wise, and I'll find you something that fits your hands. Hold out your arm; let me see your reach.", fx = { align = { order = 1 } } },
        { text = "The heavier the better. Skill is overrated.", next = "BACK", reply = "Ha, the braves say the same, and they're usually the ones I'm mending. Heavy it is, then, but learn to swing it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A light axe or a short spear, something you can swing one-handed when the arrows are no use. The prairie wolves of Mulgore come in close and fast, and a hunter with nothing but a bow learns that lesson only once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A light axe or a short spear, something you can swing one-handed when the arrows are no use. Your {pet} looks fierce enough to keep most things off you, but even the fiercest beast tires. Buy the axe, friend." },
      },
      choices = {
        { text = "I'll carry a blade, and use it well.", next = "BACK", reply = "Good. Something light, then, and sharp, so the prairie wolves learn to keep their distance.", fx = { align = { honor = 1 } } },
        { text = "My beast is my blade. I need no other.", next = "BACK", reply = "Until it falls, and then you'll be standing there with a bow and a wolf at your throat. Carry something anyway, hunter.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I do, though I keep them on the bottom shelf where no tauren has to look at them. Orc and troll rogues come through Bloodhoof often enough, and I'm not too proud to admit the little things sell." },
      },
      choices = {
        { text = "A small blade in the right place beats a big one.", next = "BACK", reply = "It does, I'll grant you, and the little things sell for a reason. Bottom shelf, then, and take your pick.", fx = { align = { honor = -1 } } },
        { text = "Fair. A big weapon in plain sight is more honest.", next = "BACK", reply = "That's how a tauren sees it, and I'll not argue. Still, the rogues keep buying, so someone thinks otherwise.", fx = { align = { honor = 1 } } },
        { text = "What weapon would you choose for me?", next = "advice" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A light staff, as if a mage ever carried any other kind. I've got a few carved from Mulgore ash that won't snap, and I'll admit a staff is the one weapon where tauren and mages agree it ought to be long." },
      },
      choices = {
        { text = "Mulgore ash it is. Good, honest wood.", next = "BACK", reply = "It is, and it'll outlast anything from the city. Here, feel the weight of this one.", fx = { align = { order = 1 } } },
        { text = "Wood is wood. I only care about the enchantment.", next = "BACK", reply = "Then you'll never know what you're holding, mage, and the wood will know it. Still, I'll sell you one, enchantment or no.", fx = { align = { order = -1 } } },
        { text = "Where does your wood and iron come from?", next = "materials" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because you'll spend half your life out of bear shape, and a Palemane gnoll won't wait politely while you change. Hamuul himself carries a staff nearly as tall as a kodo, so don't let any young druid tell you claws are enough." } },
      choices = {
        { text = "Claws or staff, I'll meet the gnolls head-on.", next = "BACK", reply = "Ha, good! The gnolls don't expect a druid to swing a staff, and the surprise is half the fight.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather the gnolls never saw me coming at all.", next = "BACK", reply = "Then take the cat, and leave the staff on your back for emergencies. Hamuul would approve, I think.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I sell to anyone with coin and the arms to lift what I make, though your sort tends to want daggers and I don't make many. I'll say this, though: whatever you keep is a poor shield, and a good staff has never once turned on its owner." },
      },
      choices = {
        { text = "I'll carry my own staff and fight my own fights.", next = "BACK", reply = "Good. A staff never whispers at you in the night, and I'll find you a sturdy one.", fx = { align = { honor = 1 } } },
        { text = "What serves me now serves better than any staff.", next = "BACK", reply = "For now, maybe. Carry a staff anyway, warlock, for the day it decides it would rather serve itself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. You'll want a hammer, I expect, and I've got some heavy ones, though they might be a bit big for you." },
        { id = "h_default", key = true, text = "I am Mahnott Roughwound, and I sell weapons to the braves of Bloodhoof. Most of what I have is heavy, because a tauren with a little dagger looks like a kodo wearing a hat." },
        { id = "h_small", when = { race = { "Troll", "Scourge" } }, text = "I am Mahnott Roughwound, and I sell weapons, though most of mine are made for tauren hands. Look anyway, because I keep a few smaller ones for our friends from the Horde." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Shaman, eh? Then you'll want a good mace or a heavy axe, and I have both, because a totem alone won't stop a charging quilboar." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! At last, somebody who'll appreciate a proper weapon, heavy enough to fell a kodo in one swing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll want something for close work, then, and I've axes light enough for a hunter's arm." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've no little daggers for you, I'm afraid, though I have a staff that would make a Palemane gnoll think twice about his life." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! You'll grow your own claws soon enough, but until then you'll want a good heavy staff, because a little one in your hands would look ridiculous." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "You'll want a staff, then, by the look of those ink-black fingers. None of mine are small, so I hope you're strong." },
      },
      choices = {
        { text = "What weapon suits a shaman of the plains, Mahnott?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where does your wood and iron come from?", next = "materials" },
        { text = "What weapon would you choose for me?", next = "advice" },
        { text = "So you don't sell daggers, then, Mahnott.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd want a staff, Mahnott, and a light one.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What's the heaviest weapon you sell, Mahnott?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What should a hunter carry for close work, Mahnott?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would a priest need a big weapon, Mahnott?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a druid need your weapons, Mahnott?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I'd guess you won't sell weapons to someone like me.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will you sell a hammer to a paladin, Mahnott?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, or are you ready to buy something heavy?" } },
    },
    materials = {
      lines = { { id = "m_default", text = "The wood comes from the trees near the lakes, the ones the Venture Company hasn't cut down yet, and the iron is traded down from Thunder Bluff. The goblins would sell me iron too, but only after they have stolen the hills to make it." } },
      choices = {
        { text = "Trade with goblins is still trade.", next = "BACK", reply = "It is, and I'll not pretend otherwise. But I'd rather buy from those who don't steal my hills to make it.", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Good. Don't buy from thieves.", next = "BACK", reply = "That's my thinking too, and the iron from the bluffs is better anyway. The goblins can keep their stolen ore.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Something you can swing all day without your arms going numb, because the plains are big and the fights are long. Don't buy the biggest one just because it looks good on you." },
        { id = "a_hunter", when = { class = "HUNTER" }, text = "For a hunter, something on the back for when the beast gets too close and the bow is useless. Most hunters forget that until they're bleeding." },
      },
      choices = { { text = "Show me what you'd choose.", next = "BUSINESS" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A mace, and a heavy one, because you'll want something solid behind every swing. The orc shamans like axes, and I sell those too, though I'll never understand anyone who wants a small one." } },
      choices = {
        { text = "A sound mace and a steady hand. That's the honest way.", next = "BACK", reply = "That's how my father taught me, and it's the only way I know. I'll find you a mace with some weight to it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever hits hardest when nobody's looking is the right weapon.", next = "BACK", reply = "That's an orc's answer, and maybe a troll's. I'll sell you a mace anyway, shaman, and you can decide who's looking.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Weapons I know, but not that. Ask someone else in the village; the elders keep the long stories." } },
    centaur = { { id = "tp_centaur", text = "The centaur use spears, which are fine weapons for a centaur. A tauren needs something bigger, because a spear looks like a toothpick in our hands." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar use thorns and bones, which break easily. A good tauren axe will last a lifetime, and I have the axes to prove it." } },
    cairne = { { id = "tp_cairne", text = "Cairne carries a runespear that is taller than most orcs, and it suits him. I would like to make a weapon that fine one day." } },
  },
}

-- Jhawna Oatwind: Bloodhoof Village's baker.
P:NPC {
  key = "jhawna", id = TODO_NPC("Jhawna Oatwind"), name = "Jhawna Oatwind", title = "Baker",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous", "kind" },
  notices = { "hunger", "weary" },
  impression = {
    first = "Nobody leaves her without hearing which farm the grain came from.",
    third = "{name} bought bread from Jhawna Oatwind, the baker of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_shop", text = "Fresh bread from Mulgore's wheat, still warm, and the Earth Mother gave every grain of it. Come and have a look, little one." },
    { id = "g_morning", when = { timeOfDay = "dawn" }, text = "You're up with the sun, and so is the bread. Come and take some while it's hot." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Oh, look at you, all scraped up. Eat something before you do anything else, because a hungry fighter makes poor choices." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Mind? No, only curious. You smell of grave and the Light both, and I've never smelled that before. But the wheat doesn't mind who walks past it, and neither do I." } },
      choices = {
        { text = "Thank you, Jhawna. You're kind to strangers.", next = "BACK", reply = "Oh, it's nothing, dear. Come back when you're hungry, and I'll have another one in the oven.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take my leave. I don't need kindness.", next = "BACK", reply = "Then take a loaf anyway, and you needn't call it kindness. Call it bread, and leave it at that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Oh, I'd not say no, though the Earth Mother has kept them warm so far and I'd not want her to feel slighted. Say it softly, and maybe say it over the wheat fields too, because the Venture Company's dust has been settling on the eastern farms." } },
      choices = {
        { text = "I'll bless the fields and the ovens both.", next = "BACK", reply = "Oh, thank you, that's very kind of you. The eastern farmers will be grateful, and so will I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bread needs heat, Jhawna, not prayers.", next = "BACK", reply = "It does, and I've plenty of heat, dear. But a prayer never hurt the wheat, and the Venture Company's dust won't blow away on its own.", fx = { align = { light = -1 } } },
        { text = "Something else, Jhawna.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All of them, and some take a loaf in their packs for the road as well. A brave who fights on an empty belly fights badly, and the centaur aren't kind to those who falter, so I bake enough for the whole watch and a few besides." } },
      choices = {
        { text = "Thank you for feeding the braves, Jhawna.", next = "BACK", reply = "It's no trouble, and they'd do the same for me. Take a loaf for the road yourself, while you're here.", fx = { align = { honor = 1 } } },
        { text = "Bread is soft. Warriors should eat what they kill.", next = "BACK", reply = "Then you'll eat what you kill and be hungry by noon, dear. Take a loaf anyway, and don't tell anyone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider pies and kodo stew bread, mostly, though I once made a wolf-and-wheat pie that nobody would eat twice. The hunters of Bloodhoof bring me what's left of their hunts, and I make sure nothing goes to waste, as the Earth Mother would wish." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Plainstrider pies and kodo stew bread, mostly, though I once made a wolf-and-wheat pie that nobody would eat twice. And I've a crust or two for your {pet}, if it likes bread. Most beasts do, though they pretend they don't." },
      },
      choices = {
        { text = "Nothing wasted. That's the right way to hunt.", next = "BACK", reply = "It is, and the Earth Mother would be glad of it. Bring me the scraps, and I'll make them into a pie you'll be proud of.", fx = { align = { honor = 1 } } },
        { text = "Leftovers are for scavengers. I take only the best cuts.", next = "BACK", reply = "Then the scavengers will eat well, and I'll miss out on a good pie. Bring me the rest anyway, if you're feeling generous.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then the thieves had better come and ask, because I'd give them a loaf before I'd let them steal one. Nobody in Bloodhoof goes hungry while my ovens are hot, and that includes whatever sort of person you are." },
      },
      choices = {
        { text = "I'd ask, Jhawna. A gift beats a theft.", next = "BACK", reply = "Then come and ask, dear, and you'll never leave hungry. I've never turned a soul away from this cart.", fx = { align = { honor = 1 } } },
        { text = "A thief who asks isn't much of a thief.", next = "BACK", reply = "Then he's a hungry one, and a foolish one, because asking costs nothing here. Take a loaf, dear, and think on it.", fx = { align = { honor = -1 } } },
        { text = "Where does the wheat come from?", next = "wheat" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Conjured bread, is it? I tasted some once, from a Forsaken mage passing through, and it was like chewing on a cloud that had only heard about wheat, so fill your belly on it if you must, but don't tell me it's bread." },
      },
      choices = {
        { text = "Fair. Real bread from real fields is better.", next = "BACK", reply = "It is, and I'll not hear otherwise in my bakery. Come back for a fresh loaf, and you'll see.", fx = { align = { order = 1 } } },
        { text = "It fills a belly and costs nothing. That's bread.", next = "BACK", reply = "It fills a belly, and a cloud fills a sky, but neither of them is bread. Taste mine, and tell me you still think so.", fx = { align = { order = -1 } } },
        { text = "What's the news in the village?", next = "news" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Oh, I hope so, because the farmers have tried everything else. The goblins at the Venture mine grind up the hills and the wind carries the dust onto the wheat, and now the eastern fields look tired in a way no amount of rain seems to fix." } },
      choices = {
        { text = "The goblins must be driven from that mine for good.", next = "BACK", reply = "That's what the farmers say, and they're tired of saying it. I hope someone listens.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land heals in its own time, so let it be.", next = "BACK", reply = "Maybe it does, and the druids say the same. But the wheat is tired, and I'm tired of watching it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, the ones who come down the road from Orgrimmar with their dark robes, and they're always hungry. I think their spells take more out of them than they let on, and this loaf will put back whatever your magic takes." },
      },
      choices = {
        { text = "Thank you, Jhawna. I'll pay you fairly for it.", next = "BACK", reply = "Thank you, dear, though I'd have given it to you anyway. Eat it slowly, it's better that way.", fx = { align = { honor = 1 } } },
        { text = "I'll take whatever's going free and keep my coin.", next = "BACK", reply = "Then take it, dear, and keep your coin. I'd sooner see it eaten than left for the swoops.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light! I don't suppose you eat bread? The farms grow it for the living, but I'd share with anyone." },
        { id = "h_default", key = true, text = "I am Jhawna Oatwind, and I bake for Bloodhoof Village. The wheat comes from the farms around us, and if you have ever wondered why Mulgore smells so sweet in the morning, it's my ovens." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The old ones used to sing over the first wheat of the season, and I always thought the bread tasted better for it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You look like you've been living on jerky and pride, and that's no way for anyone to fight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have plainstrider meat to trade, I hope, because I'd love to try a new pie." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! We bless the first loaf of every harvest to the Earth Mother, and I've always wondered whether your people bless their bread too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Then you'll know whether the Earth Mother is happy with the wheat this year, because the Venture Company's dust keeps settling on the eastern farms and I can't tell anymore." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "You look hungry, dear, the way the quiet ones from Orgrimmar always do. Have some bread before whatever you're carrying eats first." },
      },
      choices = {
        { text = "Do the old songs over the wheat still matter, Jhawna?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Where does the wheat come from?", next = "wheat" },
        { text = "You must hear all the village news here.", next = "news" },
        { text = "I can cook too.", next = "cook", when = { profession = "Cooking" } },
        { text = "Your bread cart could feed a whole thieves' camp, Jhawna.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A conjured loaf is lighter to carry than yours.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The braves must eat your bread before battle.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you bake with a hunter's game, Jhawna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Your ovens could use a blessing, Jhawna.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a druid help the eastern farms, Jhawna?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I'd guess even folk of my calling buy your bread, Jhawna.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the tauren mind a paladin's company, Jhawna?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Jhawna.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, little one? The ovens are warm, and so am I." } },
    },
    wheat = {
      lines = { { id = "w_default", text = "From the Wheathoof family and the others on the plains, and they work hard for every sack of it. Ahab Wheathoof's dog Kyle runs off whenever there's food about, so hold on to your bread if you pass his farm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    news = {
      lines = { { id = "n_default", text = "The Venture Company is cutting down our trees north of the village, and nobody is happy about it. The braves are busy with the gnolls and the goblins, and I'm busy feeding the braves." } },
      choices = {
        { text = "The goblins should be driven out.", next = "BACK", reply = "That's what everyone says, and the braves are trying. I just hope they're quick about it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Maybe Thunder Bluff can bargain with them.", next = "BACK", reply = "Maybe they can, and I'd be glad if they did. The goblins like a deal, after all, and the trees can't bargain for themselves.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Then you know that good bread needs patience and good flour, and that people only remember the burned loaves. Come by the ovens when you have time, and we can talk recipes." } },
      choices = { { text = "I'd like that.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They matter to me, and to every farmer around the village, because the rains have come strangely this year. Nobody sings over the fields anymore except old Zarlman, and he forgets the words." } },
      choices = {
        { text = "The old songs should be kept, even over something as plain as wheat.", next = "BACK", reply = "I think so too, and so would my grandmother. Maybe you'll sing for us sometime, and old Zarlman can learn the words from you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The songs are pretty, but rain matters more than ritual.", next = "BACK", reply = "It does, and I won't argue with the rain. But the songs were for the farmers too, and the farmers are tired.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh, I wouldn't know that, little one. I know flour and ovens and the Earth Mother's wheat, and that's about it." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us the wheat, and I thank her for every loaf. The fields of Mulgore are her gift, and I bake her thanks into the bread." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire comes, I sell more bread than in the whole season before it. The Faire folk eat like they have never seen bread before, and maybe they haven't." } },
    cairne = { { id = "tp_cairne", text = "Cairne likes my bread, and he always asks which farm the wheat came from. He is a chieftain who remembers the small things, and that is why we love him." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback trample the southern fields, and the farmers are angry. I wish someone would teach them to grow their own grain." } },
  },
}
