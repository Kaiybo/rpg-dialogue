-- Orgrimmar folk with no conversation yet: the orphanage in the Drag, the war-effort collectors and the
-- Alliance ambassador in the Valley of Spirits, holiday merchants, Broken Tusk regulars, and a few
-- shopkeepers and quest-givers the roster scan missed.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Orphan Matron Battlewail: keeps the orphanage in the Drag with Tosamina.
P:NPC {
  key = "og_matron_battlewail", id = TODO_NPC("Orphan Matron Battlewail"), name = "Orphan Matron Battlewail", gender = "female",
  role = "matron", tier = "quest",
  communities = { "orgrimmar" }, temper = { "stern", "warm" }, values = { "family", "duty" },
  notices = { "race", "class" },
  impression = {
    first = "Orphan Matron Battlewail stands in the orphanage doorway in the Drag with her arms folded and a wooden spoon tucked into her belt like a war axe. Children's voices clatter behind her, and she hears every one of them.",
    third = "{name} met Orphan Matron Battlewail, who keeps the orphanage in Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your boots before you come any closer, {class}. I have scrubbed this step twice today already." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The little ones still ask about the warrior who stood in my doorway, so you made an impression on somebody." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "An orc grown and armed. Half the children in here want to be you, and the other half want to be the Warchief, so mind how you behave in front of them." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" }, text = "A warrior. Every child in here lost a warrior, so do not be surprised if they stare at you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Matron Battlewail, and this house is for the children the wars left behind. Tosamina and I feed them, mend them and teach them to be orcs, which is three jobs and none of them easy." } },
      again = {
        { id = "h_again", text = "What else? Speak quickly, before someone climbs onto the roof again." },
        { id = "h_again2", text = "I am listening, {class}, though I am also counting heads." },
      },
      choices = {
        { text = "How did these children come to be here?", next = "how" },
        { text = "Is there anything I could do for them?", next = "help" },
        { text = "You must have fought once yourself.", next = "fought" },
        { text = "I was raised without parents too.", next = "orphan", when = { race = "Orc" } },
        { text = "Farewell, Matron.", next = "END" },
      },
    },
    how = {
      lines = { { id = "w_default", text = "Some lost their parents in the camps, some in the fighting at Hyjal, and some to the centaur and the quilboar since we came to this land. The Horde made a home of Durotar, but a home still costs blood to keep." } },
      choices = {
        { text = "What becomes of them when they're grown?", next = "grown" },
        { text = "Something else, Matron.", next = "BACK" },
      },
    },
    grown = {
      lines = { { id = "gr_default", text = "Most take up the axe, because the Horde needs them and they know nothing else. I try to teach a few of them other trades as well, so that not every one of my children goes the way their parents went." } },
      choices = {
        { text = "The Horde needs warriors. Let them fight.", next = "fightpath" },
        { text = "They deserve a life beyond the battlefield.", next = "otherpath" },
      },
    },
    fightpath = {
      lines = { { id = "fp_default", text = "It does, and I will not pretend otherwise. But I have buried too many of my old charges already, so forgive me if I hope a few of them grow up to be smiths." } },
      choices = {
        { text = "A strong Horde keeps them safe.", next = "BACK", reply = "Strength keeps them alive, aye, but it is love that makes them worth keeping alive.", fx = { align = { honor = 1 } } },
        { text = "A child should choose their own road.", next = "BACK", reply = "Spoken like someone who had a choice. I am glad you did.", fx = { align = { honor = -1 } } },
      },
    },
    otherpath = {
      lines = { { id = "op_default", text = "So I say, though not too loudly in this city. A smith or a cook or a shaman serves the Horde as well as any grunt, and lives a good deal longer doing it." } },
      choices = { { text = "Something else, Matron.", next = "BACK", fx = { affinity = 1 } } },
    },
    help = {
      lines = { { id = "hp_default", text = "In the week of the children, when the city honors its orphans, I let grown warriors take one of my little ones out to see the world. Come back then and I will find you a child who needs showing it.", fx = { learn = { "childrens_week" } } } },
      choices = {
        { text = "I'll come back for that week.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fought = {
      lines = { { id = "f_default", text = "I carried an axe in the Second War, and I carried the demon blood in me like the rest. When Thrall freed us, I found I had no more stomach for killing and a great deal of it for raising, so here I am." } },
      choices = { { text = "Something else, Matron.", next = "BACK" } },
    },
    orphan = {
      lines = { { id = "o_default", text = "Then you know what these little ones carry, and you know they can carry it a long way. Grow strong and come back to show them so, {class}, because that is worth more to them than coin." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought, I was caged, and now I mind other orcs' children. Of the three, the minding is the hardest work." } },
    _none = { { id = "tp_none", text = "I have forty children to think about, {class}. That question will have to wait its turn behind all of them." } },
  },
}

-- Horde Orphan: one of Matron Battlewail's charges in the Drag.
P:NPC {
  key = "og_horde_orphan", id = TODO_NPC("Horde Orphan"), name = "Horde Orphan",
  role = "child", tier = "service",
  communities = { "orgrimmar" }, temper = { "curious", "bold" }, values = { "family" },
  impression = {
    first = "A small orc child in a patched tunic stares up at you with frank interest, mostly in your weapon.",
    third = "{name} talked with one of the orphans of Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Is that a real axe? Matron says I can't touch real axes until I'm bigger, but I'm bigger than I was last week." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I live at the orphanage with Matron Battlewail and about a hundred other kids, or maybe forty, I always lose count. When I grow up I'm going to be a warrior like the Warchief, and nobody's going to cage me ever." } },
      again = { { id = "h_again", text = "Are you still here? Tell me about a fight you won, please!" } },
      choices = {
        { text = "What happened to your parents?", next = "parents" },
        { text = "Tell me about the Matron.", next = "matron" },
        { text = "Run along now.", next = "END" },
      },
    },
    parents = {
      lines = { { id = "p_default", text = "My father fought at Mount Hyjal and didn't come back, and Matron says that makes him a hero. I would rather he was here, though, even if he wasn't a hero at all." } },
      choices = {
        { text = "He died with honor. Be proud of him.", next = "BACK", reply = "I am proud. I'm going to be a hero too, but I'm going to come back after.", fx = { align = { honor = 1 } } },
        { text = "It's all right to just miss him.", next = "BACK", reply = "Matron says that too, when nobody else is listening.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    matron = {
      lines = { { id = "m_default", text = "She's scary when you climb on the roof, but she makes the best stew in Orgrimmar and she knows everybody's name. Tosamina helps her, and Tosamina lets us stay up late sometimes." } },
      choices = { { text = "Sounds like a good home. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know that one. Ask the Matron, she knows everything." } },
  },
}

-- Apothecary Jezel: Forsaken collecting purple lotus for the war effort.
P:NPC {
  key = "og_apothecary_jezel", id = TODO_NPC("Apothecary Jezel"), name = "Apothecary Jezel", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "dry", "precise" }, values = { "duty", "craft" },
  notices = { "race", "profession" },
  impression = {
    first = "Apothecary Jezel stands among the war effort's crates in the Valley of Spirits with a ledger and a cracked vial of something faintly violet. She has the stillness of the dead and the impatience of a chemist.",
    third = "{name} met Apothecary Jezel, a Forsaken collecting purple lotus for the Horde's war effort.",
  },
  greetings = {
    { id = "g_default", text = "You have come to the war effort, or else you are lost. Either way, I could use purple lotus, {class}." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Purple Lotus!") }, text = "The lotus does not pick itself, I am sorry to say. Bring it soon, while the war still has a use for it." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" }, text = "Ah, one of our own. You will understand that I find Orgrimmar's sun insufferably cheerful." },
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" }, text = "Your hands smell of herbs. Good, because I have work for exactly those hands." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Apothecary Jezel of the Royal Apothecary Society, lent to the war effort by the Dark Lady herself. The Horde is gathering supplies for a war in Silithus, and my part of it is purple lotus." } },
      again = { { id = "h_again", text = "Something further? I have a ledger to keep." }, { id = "h_again2", text = "Speak. The dead have patience, but not unlimited amounts of it." } },
      choices = {
        { text = "What war in Silithus?", next = "war" },
        { text = "Why purple lotus?", next = "lotus" },
        { text = "I'll gather lotus for you.", next = "BUSINESS" },
        { text = "A Forsaken in Orgrimmar seems out of place.", next = "place" },
        { text = "I serve the Dark Lady too, Apothecary.", next = "kin", when = { race = "Scourge" } },
        { text = "Good day, Apothecary.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Something stirs behind the great scarab wall in Silithus, and both the Horde and the Alliance mean to be ready when the gates open. Every race of the Horde is asked to give, and I am told the Alliance does the same in Ironforge." } },
      choices = {
        { text = "What's behind the wall?", next = "wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wl_default", text = "The silithid, and whatever commands them, and the night elves have been unusually quiet about the rest. I do not trust a secret ten thousand years old, and I trust one kept by elves still less." } },
      choices = {
        { text = "Then we should strike first and hard.", next = "BACK", reply = "Exactly my view. Bring me lotus and you will have helped strike.", fx = { align = { order = 1 } } },
        { text = "Let the elves fight their own old wars.", next = "BACK", reply = "A tempting thought, but the insects will not stop at the elves' borders.", fx = { align = { order = -1 } } },
      },
    },
    lotus = {
      lines = { { id = "l_default", text = "It goes into elixirs and draughts that will keep soldiers standing in the heat of the desert. You will find it in Feralas and the Hinterlands and other green places that I would not visit by choice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    place = {
      lines = { { id = "p_default", text = "It is, and the orcs remind me of it with their eyes every day. But the Warchief keeps his word to the Dark Lady, and I keep mine to the war effort, so we tolerate each other well enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "kin_default", text = "Then you know that our place in this Horde is bought with work like this. The orcs will never love us, so let them at least owe us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I mixed medicines in Lordaeron when I was alive. Now I mix them for the Horde, which pays less and argues more." } },
    _none = { { id = "tp_none", text = "That is outside my field, {class}, and my field is wide enough already." } },
  },
}

-- Bloodguard Rawtar: orc collecting lean wolf steaks for the war effort.
P:NPC {
  key = "og_bloodguard_rawtar", id = TODO_NPC("Bloodguard Rawtar"), name = "Bloodguard Rawtar", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "blunt", "hearty" }, values = { "duty", "honor" },
  notices = { "race", "profession" },
  impression = {
    first = "Bloodguard Rawtar stands by a cook-fire in the Valley of Spirits, a broad orc with a soldier's scars and a cook's apron tied over her mail.",
    third = "{name} met Bloodguard Rawtar, who collects lean wolf steaks for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! An army marches on its stomach, and right now its stomach is empty." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Lean Wolf Steaks!") }, text = "Where are my steaks? The grunts are already eating their boots." },
  },
  notice = {
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" }, text = "You have a cook's burns on your fingers. Good, I need someone who can tell a steak from a sandal." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Bloodguard Rawtar, and I feed the soldiers who will march to Silithus. Lean wolf steaks keep well in the heat and make a grunt strong, so that is what I collect." } },
      again = { { id = "h_again", text = "What else? The fire needs tending." } },
      choices = {
        { text = "Why does a bloodguard cook?", next = "cook" },
        { text = "Where do I find good wolves?", next = "wolves" },
        { text = "I'll bring you steaks.", next = "BUSINESS" },
        { text = "I cook too, Bloodguard. Any advice?", next = "tips", when = { profession = "Cooking" } },
        { text = "Who eats your cooking, then?", next = "grunts" },
        { text = "Were you at Hyjal with Grom's Warsong?", next = "hyjal", when = { race = "Orc" } },
        { text = "I am a warrior. What should I eat before battle?", next = "warfood", when = { class = "WARRIOR" } },
        { text = "Farewell, Bloodguard.", next = "END" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Because a demigod's hoof broke my leg at Mount Hyjal and it never set straight, so I cannot charge any longer. I could sulk about it, or I could make sure the orcs who still can charge go into battle with full bellies." } },
      choices = {
        { text = "That's still a warrior's work.", next = "pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      lines = { { id = "pr_default", text = "I tell myself that every morning. Some days I even believe it, mostly the days when the stew comes out right." } },
      choices = {
        { text = "Every orc serves the Horde. That is enough.", next = "BACK", reply = "Aye, that is what Thrall says, and he would know.", fx = { align = { honor = 1 } } },
        { text = "Glory is overrated. Good food isn't.", next = "BACK", reply = "Ha! Say that to a grunt and watch him choke on his bread.", fx = { align = { honor = -1 } } },
      },
    },
    wolves = {
      lines = { { id = "w_default", text = "The big gray wolves of Alterac and the Hinterlands give the leanest meat. Cook it over a hot fire, not a slow one, or you will be bringing me leather." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tips = {
      lines = { { id = "tips_default", text = "Salt it the night before and never trust a troll near your spice box. That is all the wisdom I have, and it has served me well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grunts = {
      lines = { { id = "gr_default", text = "The grunts of the Valley of Honor, mostly, and soon the ones who will march to Silithus. They eat like starving wolves and thank me like wolves too, which is to say with a grunt and an empty bowl." } },
      choices = {
        { text = "Do they ever complain?", next = "complain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    complain = {
      lines = { { id = "cp_default", text = "Every day, about the salt, the gristle and the cook. I let them, because an orc who still has breath to complain still has breath to fight." } },
      choices = {
        { text = "A soldier eats what he is given.", next = "BACK", reply = "Spoken like a sergeant. I will tell them you said so.", fx = { align = { order = 1 } } },
        { text = "Let them grumble. They have earned it.", next = "BACK", reply = "Aye, they have, and they will earn more before this is done.", fx = { align = { order = -1 } } },
      },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "I was, and I saw the Warsong charge into the demon's shadow with Grom roaring at their head. He bought our freedom with his own blood that day, and I have never once eaten a meal without remembering it." } },
      choices = {
        { text = "Grom died well.", next = "gromdeath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gromdeath = {
      lines = { { id = "gd_default", text = "He died the only way he could have forgiven himself, with Mannoroth dead at his feet. I limp because of that battle, and I would limp twice over to have stood near him again." } },
      choices = {
        { text = "Then honor him by feeding his warriors.", next = "BACK", reply = "That is exactly what I mean to do, {class}.", fx = { align = { honor = 1 } } },
        { text = "He should never have drunk the blood again.", next = "BACK", reply = "Hm. You are not wrong, but say it softly in this city.", fx = { align = { honor = -1 } } },
      },
    },
    warfood = {
      lines = { { id = "wf_default", text = "Meat and bread, a little salt, and nothing that sits heavy in the gut when the horns sound. A warrior who charges on a full belly charges slower, but he does not faint halfway there either." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a bloodguard of the Warchief's own guard, once. Now I am a cook, and I am still guarding the Horde, after a fashion." } },
    _none = { { id = "tp_none", text = "I know steaks and battle, {class}. That is neither." } },
  },
}

-- Chief Sharpclaw: tauren collecting baked salmon for the war effort.
P:NPC {
  key = "og_chief_sharpclaw", id = TODO_NPC("Chief Sharpclaw"), name = "Chief Sharpclaw", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "patient" }, values = { "honor", "tradition" },
  notices = { "race", "profession" },
  impression = {
    first = "Chief Sharpclaw is an old tauren with a fishing net slung over one horn, standing among the war effort's crates as patiently as if he were waiting for a fish to bite.",
    third = "{name} met Chief Sharpclaw, a tauren collecting baked salmon for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "May the Earth Mother guide your steps, {class}. If she guides them toward a river, all the better." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Baked Salmon!") }, text = "The salmon swim where they will, young one. Take your time, but do not take too much of it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "One of the shu'halo, and far from the plains. It is good to see a familiar face among all this stone." },
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" }, text = "You carry a fishing pole. Then we shall understand each other well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sharpclaw, chief of a small tribe of fishers, and Cairne asked me to gather food for the Horde's march into Silithus. Baked salmon keeps well and feeds a warrior through a long day, and so salmon is what I ask for." } },
      again = { { id = "h_again", text = "What else would you ask? There is no hurry, the river runs on regardless." } },
      choices = {
        { text = "Where do the best salmon run?", next = "salmon" },
        { text = "Why did Cairne choose you?", next = "chosen" },
        { text = "I'll bring you salmon.", next = "BUSINESS" },
        { text = "Which tribe do you hail from, Chief?", next = "tribe", when = { race = "Tauren" } },
        { text = "Tell me of the Horde's march.", next = "march" },
        { text = "I fish too. Where do you cast your line?", next = "cast", when = { profession = "Fishing" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    salmon = {
      lines = { { id = "s_default", text = "In the cold rivers of the north, in the Alterac foothills and the Hinterlands and the Eastern Plaguelands, where they leap the falls. Catch them, bake them, and bring them to me." } },
      choices = {
        { text = "The Plaguelands? Is the fish safe to eat?", next = "plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "pl_default", text = "The water runs down from the mountains, and the fish do not seem sick, though I would not drink from that river myself. The Forsaken apothecaries have tested them, or so they say." } },
      choices = {
        { text = "Then I'll trust the Forsaken on this.", next = "BACK", reply = "Trust is a gift, young one. Give it carefully, but do give it.", fx = { align = { light = 1 } } },
        { text = "I wouldn't trust a Forsaken with my supper.", next = "BACK", reply = "Many of my people feel as you do. Still, they are our allies, and the fish is good.", fx = { align = { light = -1 } } },
      },
    },
    chosen = {
      lines = { { id = "c_default", text = "Because I am too old to fight and too stubborn to stay at home. Cairne knows that an idle tauren is a sad thing, so he gave me work." } },
      choices = { { text = "Something else, Chief.", next = "BACK" } },
    },
    tribe = {
      lines = { { id = "tribe_default", text = "A small tribe of fishers who joined Cairne in the long walk to Mulgore. We were never many, but we were never hungry either, so long as there was a river." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    march = {
      lines = { { id = "mr_default", text = "The Warchief gathers food, cloth and arms for the day the gates of Ahn'Qiraj open in Silithus. Many young ones will walk that road, and I would see them walk it fed." } },
      choices = {
        { text = "Do you fear for the young ones?", next = "fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "I fear for them as the herd fears for its calves, though the herd still walks on to the next grazing ground. Some will not come home, and the Earth Mother will take them back gently." } },
      choices = {
        { text = "They know the price. It is their choice.", next = "BACK", reply = "It is, and I honor them for it, though my heart still aches.", fx = { align = { order = -1 } } },
        { text = "The Warchief must not waste them.", next = "BACK", reply = "Thrall is wise, young one, and I believe he knows the weight of each life.", fx = { align = { order = 1 } } },
      },
    },
    cast = {
      lines = { { id = "ca_default", text = "Where the water slows below a fall, and in the morning before An'she has warmed the stones. The salmon rest there before they leap, and a patient fisher takes them there." } },
      choices = {
        { text = "I'll try that. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My tribe fished the Stonebull Lake before we came to Thunder Bluff. The fish there were small, but the water was sweet." } },
    _none = { { id = "tp_none", text = "I am only an old fisher, young one, and old fishers know only a few things well." } },
  },
}

-- Doctor Serratus: Forsaken collecting rugged leather for the war effort.
P:NPC {
  key = "og_doctor_serratus", id = TODO_NPC("Doctor Serratus"), name = "Doctor Serratus", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "cold", "sardonic" }, values = { "duty", "craft" },
  notices = { "race", "profession" },
  impression = {
    first = "Doctor Serratus examines a stack of hides in the Valley of Spirits with the detached care of a surgeon, his own skin stitched in places that no living patient would tolerate.",
    third = "{name} met Doctor Serratus, a Forsaken collecting rugged leather for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a fresh pair of hands. Do try to keep them attached while you work for me, {class}." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Rugged Leather!") }, text = "Rugged leather, if you please, not the flimsy rubbish you find on rabbits." },
  },
  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" }, text = "A skinner. I appreciate a professional who knows where the knife should go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Doctor Serratus, physician to the Royal Apothecary Society and, for my sins, collector of hides for the war effort. Armor and bandages and stretchers all need rugged leather, and soldiers need all three." } },
      again = { { id = "h_again", text = "Is there more? I am counting hides." } },
      choices = {
        { text = "A doctor collecting leather?", next = "doctor" },
        { text = "Where do I find rugged leather?", next = "where" },
        { text = "I'll bring leather.", next = "BUSINESS" },
        { text = "Were you a doctor in Lordaeron too?", next = "lordaeron", when = { race = "Scourge" } },
        { text = "What do you make of the orcs?", next = "orcs" },
        { text = "I'm a priest. Could the Light mend you?", next = "priest", when = { class = "PRIEST" } },
        { text = "I skin hides myself. Any advice?", next = "skin", when = { profession = "Skinning" } },
        { text = "Good day, Doctor.", next = "END" },
      },
    },
    doctor = {
      lines = { { id = "d_default", text = "I was a surgeon in Lordaeron, back when I had a pulse. Now I patch soldiers living and dead alike, and I have found that leather makes a better stretcher than most things." } },
      choices = {
        { text = "Do you miss being alive?", next = "alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive = {
      lines = { { id = "a_default", text = "I miss sleep, and I miss the taste of wine, but I do not miss the fear of dying. That one fear is gone, and I find the rest of them much easier to bear." } },
      choices = {
        { text = "Death was a mercy for you, then.", next = "BACK", reply = "An unusual view. I shall make a note of it, though I doubt the Lich King intended mercy.", fx = { align = { light = -1 } } },
        { text = "No one should have to live like that.", next = "BACK", reply = "Perhaps not, but we do, and so I would rather be useful.", fx = { align = { light = 1 } } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "From the larger beasts of Felwood, Winterspring and the Eastern Plaguelands. Thin hides are worthless to me, so skin the big ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lordaeron = {
      lines = { { id = "lordaeron_default", text = "In Stratholme, before Arthas put it to the torch. I treated the first plague victims, and I learned too late that nothing I had would help them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "They are excellent patients, because they bleed a great deal and complain very little. They do flinch when I come near, though, and I cannot entirely blame them." } },
      choices = {
        { text = "And the tauren?", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "The tauren treat me with a courtesy I do not deserve and a little pity I do not want. Their healers mend with herbs and prayer, and I mend with needles, and somehow we both save lives." } },
      choices = {
        { text = "The Horde holds together because of such courtesy.", next = "BACK", reply = "Perhaps so. I shall endure it gracefully, then.", fx = { align = { honor = 1 } } },
        { text = "Pity is wasted on the dead.", next = "BACK", reply = "Precisely what I keep telling them, to no effect at all.", fx = { align = { honor = -1 } } },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "The Light burns me, {class}, as it burns all of the Dark Lady's children, and so I would thank you to keep it in your pocket. Some of our priests have found a shadow that answers instead, and it suits us better." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skin = {
      lines = { { id = "sk_default", text = "Cut along the belly, never across it, and work the hide free while the beast is still warm. A cold hide tears, and I have no use for torn leather or for skinners who hurry." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Surgeon, corpse, physician. In that order." } },
    _none = { { id = "tp_none", text = "I cannot diagnose that, {class}, and I will not pretend to." } },
  },
}

-- Healer Longrunner: tauren collecting wool bandages for the war effort.
P:NPC {
  key = "og_healer_longrunner", id = TODO_NPC("Healer Longrunner"), name = "Healer Longrunner", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "gentle", "earnest" }, values = { "mercy", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Healer Longrunner rolls bandages among the war effort's crates, a lean young tauren whose hands are never still and whose voice is always soft.",
    third = "{name} met Healer Longrunner, a tauren collecting wool bandages for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Peace to you, {class}. Are you wounded? No? Good, then perhaps you can help me tend the ones who will be." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Wool Bandages!") }, text = "The bandages will save lives, friend. Every one you bring is a warrior who comes home." },
  },
  notice = {
    { id = "n_aid", cat = "profession", when = { profession = "First Aid" }, text = "You know first aid! Then you know how fast a bandage runs out on a battlefield." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Longrunner, a healer of Thunder Bluff, and I gather wool bandages for the Horde's army. When the gates in Silithus open, our warriors will bleed, and I would rather they bled into clean wool." } },
      again = { { id = "h_again", text = "What else, friend? I can listen and roll bandages at once." } },
      choices = {
        { text = "How did you become a healer?", next = "healer" },
        { text = "Do you think the war is worth it?", next = "worth" },
        { text = "I'll make wool bandages for you.", next = "BUSINESS" },
        { text = "I know first aid as well.", next = "aid", when = { profession = "First Aid" } },
        { text = "What do the wounded say to you?", next = "wounded" },
        { text = "I'm a shaman. The spirits mend wounds too.", next = "spirits", when = { class = "SHAMAN" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    healer = {
      lines = { { id = "h2_default", text = "My mother was a runner who carried messages across the Barrens, and she taught me that the fastest feet are useless if you cannot mend what you find at the end of the road. I chose mending." } },
      choices = {
        { text = "Is your mother still running?", next = "mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother = {
      lines = { { id = "m_default", text = "She runs between Camp Taurajo and the Crossroads still, though her knees complain. If you see a tauren running faster than she ought to, it is likely her." } },
      choices = { { text = "Something else, Healer.", next = "BACK" } },
    },
    worth = {
      lines = { { id = "w_default", text = "I do not know, friend, and that is the truth. I only know that the wounded will come whether it is worth it or not, and I will be ready for them." } },
      choices = {
        { text = "Some wars must be fought, healer.", next = "BACK", reply = "Perhaps, and those who fight them deserve clean bandages.", fx = { align = { order = 1 } } },
        { text = "Every war is a waste of good lives.", next = "BACK", reply = "Then we agree, though I will not say so to an orc.", fx = { align = { order = -1 } } },
      },
    },
    aid = {
      lines = { { id = "aid_default", text = "Then you know the most important lesson, friend, which is to keep your hands steady even when your heart is not. The old healers of Thunder Bluff teach it before anything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wounded = {
      lines = { { id = "wo_default", text = "Most of them ask whether they will fight again, and a few ask for their mothers. I answer the first truthfully and the second kindly, and I hold their hands either way." } },
      choices = {
        { text = "Does it weigh on you?", next = "weigh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weigh = {
      lines = { { id = "we_default", text = "It does, friend, every evening when the work is done and the camp is quiet. I sing to the Earth Mother then, and she takes a little of the weight from me so I can carry the rest." } },
      choices = {
        { text = "Mercy is a strength, healer.", next = "BACK", reply = "Thank you. Not every warrior believes that, and I am glad you do.", fx = { align = { light = 1 } } },
        { text = "You must harden your heart to do this work.", next = "BACK", reply = "Perhaps, but a hard heart makes for rough hands, and I need gentle ones.", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They do, and gladly. A shaman's healing wave closes a wound faster than any bandage, but the spirits tire and the wool does not, so we need both." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned healing in Thunder Bluff and practice it wherever I am needed. Today that is Orgrimmar." } },
    _none = { { id = "tp_none", text = "I am sorry, friend, but I do not know about that. I know about wounds." } },
  },
}

-- Herbalist Proudfeather: tauren collecting peacebloom for the war effort.
P:NPC {
  key = "og_herbalist_proudfeather", id = TODO_NPC("Herbalist Proudfeather"), name = "Herbalist Proudfeather", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "warm", "wistful" }, values = { "land", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Herbalist Proudfeather sorts bundles of pale peacebloom among the war effort's crates, a feather braided into her mane and a dusting of pollen on her sleeves.",
    third = "{name} met Herbalist Proudfeather, a tauren collecting peacebloom for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "An'she's light on you, {class}. Do you have a moment for an herbalist far from her meadows?" },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Peacebloom!") }, text = "The peacebloom grows nearly everywhere, friend, so do not let me keep you from it." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" }, text = "You have an herbalist's eye. You must have noticed the peacebloom along every road from here to the Barrens." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Proudfeather, and I gather peacebloom for the Horde's healing draughts. It is a humble flower, but a thousand humble flowers will keep an army on its feet." } },
      again = { { id = "h_again", text = "What else? The flowers will keep a moment longer." } },
      choices = {
        { text = "Why peacebloom, of all things?", next = "why" },
        { text = "You seem homesick.", next = "home" },
        { text = "I'll gather peacebloom.", next = "BUSINESS" },
        { text = "I miss Mulgore too.", next = "mulgore", when = { race = "Tauren" } },
        { text = "Do the orcs value your work?", next = "value" },
        { text = "I gather herbs as well.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "May the Earth Mother keep you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because it is the root of nearly every healing draught the alchemists make. You find it in Mulgore, in Durotar and in the Barrens, wherever the ground is kind enough to let something grow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "hm_default", text = "I am. Orgrimmar is all red stone and smoke, and I miss the green grass of Mulgore more than I thought I would." } },
      choices = {
        { text = "Why not go home, then?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Because the work is here, and the Horde has asked it of us. Cairne says that a tribe which does not answer its friends will one day have no friends to answer it." } },
      choices = {
        { text = "Cairne is right. We stand together.", next = "BACK", reply = "Yes, and that is why I am here among the orcs and their smoke.", fx = { align = { honor = 1 } } },
        { text = "Your own home should come first.", next = "BACK", reply = "Perhaps, but I would feel ashamed going home before the work is finished.", fx = { align = { honor = -1 } } },
      },
    },
    mulgore = {
      lines = { { id = "mulgore_default", text = "Then you know how the grass sounds at dusk, when the wind runs through it like water. Hold onto that sound, friend, it will carry you home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    value = {
      lines = { { id = "va_default", text = "The shamans do, and the alchemists in the Drag pay well enough. The grunts think a flower is a flower, until one of my draughts drags them back from the edge." } },
      choices = {
        { text = "And then?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "And then they bring me flowers, crushed in their great fists, as thanks. I keep every one of them pressed in a book, even the ones that are mostly weeds." } },
      choices = {
        { text = "Every warrior owes the healers a debt.", next = "BACK", reply = "That is kind, though I would settle for them watching where they step.", fx = { align = { order = -1 } } },
        { text = "Gratitude matters less than discipline.", next = "BACK", reply = "Spoken like an orc, friend, but I will keep my pressed flowers all the same.", fx = { align = { order = 1 } } },
      },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then look for earthroot beneath the peacebloom where the soil is red, and silverleaf where the trees grow thick. The land hides her gifts in pairs, if you know how to look." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up gathering herbs on the slopes below Thunder Bluff. I would like to go back to them one day." } },
    _none = { { id = "tp_none", text = "I am only an herbalist, friend, and that is a question for someone wiser than me." } },
  },
}

-- Lady Callow: Forsaken collecting mageweave bandages for the war effort.
P:NPC {
  key = "og_lady_callow", id = TODO_NPC("Lady Callow"), name = "Lady Callow", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "haughty", "cold" }, values = { "duty", "pride" },
  notices = { "race", "profession" },
  impression = {
    first = "Lady Callow stands in the Valley of Spirits in the remains of a fine Lordaeron gown, holding a roll of mageweave as though it were a lady's glove.",
    third = "{name} met Lady Callow, a Forsaken noblewoman collecting mageweave bandages for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "You may approach, {class}. I trust you have something useful to offer the war effort." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Mageweave Bandages!") }, text = "I am still waiting on those bandages, and I am not accustomed to waiting." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" }, text = "One of the Dark Lady's children. At least you know how to stand still and listen." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Lady Callow, once of a house in Lordaeron whose name no longer matters. I collect mageweave bandages for the Horde's march on Silithus, because the Dark Lady asked it and because I have nothing better to do with eternity." } },
      again = { { id = "h_again", text = "Is there more you wish to say? Be brief." } },
      choices = {
        { text = "You were a noble in Lordaeron?", next = "noble" },
        { text = "Why mageweave bandages?", next = "mageweave" },
        { text = "I'll bring you bandages.", next = "BUSINESS" },
        { text = "Did you know the Dark Lady in life?", next = "sylvanas", when = { race = "Scourge" } },
        { text = "What became of your roses?", next = "roses" },
        { text = "I'm a tailor. I can stitch mageweave.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Good day, my lady.", next = "END" },
      },
    },
    noble = {
      lines = { { id = "n_default", text = "I had a manor near Andorhal, with gardens and servants and a husband who bored me. The plague took the gardens, the servants and the husband, and in truth I miss the gardens most." } },
      choices = {
        { text = "That's cold, even for the dead.", next = "cold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "Perhaps it is, but the dead have little use for pretense. I loved my roses more honestly than I ever loved Lord Callow, and he knew it." } },
      choices = {
        { text = "Honesty is a kind of virtue.", next = "BACK", reply = "How charming of you to say so. I shall try to remember it.", fx = { align = { light = 1 } } },
        { text = "Some things are better left unsaid.", next = "BACK", reply = "You would have done well at court, then.", fx = { align = { light = -1 } } },
      },
    },
    mageweave = {
      lines = { { id = "m_default", text = "Because it holds better than wool and the Horde's tailors have more mageweave than they know what to do with. Bandages are the one luxury a soldier truly needs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sylvanas = {
      lines = { { id = "sylvanas_default", text = "Only by name, as the Ranger-General of Quel'Thalas. Now she is our queen, and I find I serve her more gladly than I ever served King Terenas." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roses = {
      lines = { { id = "ro_default", text = "They went black with the rest of Andorhal, and the beds are full of ghouls now. I went back once, after I rose, and found a single white rose growing through the ribs of a footman." } },
      choices = {
        { text = "Did you take it?", next = "took" },
        { text = "Something else.", next = "BACK" },
      },
    },
    took = {
      lines = { { id = "tk_default", text = "I did, and it died in my hand within the hour, as everything does now. I have not tried to grow anything since, and I do not intend to." } },
      choices = {
        { text = "Perhaps the soil of Tirisfal would take one.", next = "BACK", reply = "How tiresomely hopeful of you. Still, I may consider it.", fx = { align = { light = 1 } } },
        { text = "Then leave the past buried, my lady.", next = "BACK", reply = "At last, someone who understands me.", fx = { align = { light = -1 } } },
      },
    },
    tailor = {
      lines = { { id = "tl_default", text = "Then you are worth more to me than half the soldiers in this valley. Bring me mageweave bandages, stitched tightly, and I shall think rather well of you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a lady of Lordaeron, and now I am a lady of the Forsaken. The title survived better than I did." } },
    _none = { { id = "tp_none", text = "I do not concern myself with such things, {class}." } },
  },
}

-- Miner Cromwell: Forsaken collecting copper bars for the war effort.
P:NPC {
  key = "og_miner_cromwell", id = TODO_NPC("Miner Cromwell"), name = "Miner Cromwell", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "dour", "plain" }, values = { "work", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Miner Cromwell sits on a crate of copper bars in the Valley of Spirits, a stooped Forsaken with a pick across his knees and dust in the seams of his rotting coat.",
    third = "{name} met Miner Cromwell, a Forsaken collecting copper bars for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Copper, {class}. That is what I want, and I expect you know where to find it." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Copper Bars!") }, text = "No copper yet? The hills are full of it, so go and dig." },
  },
  notice = {
    { id = "n_mine", cat = "profession", when = { profession = "Mining" }, text = "A miner, by your shoulders. Good, I can talk to you without explaining what a seam is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Cromwell, and I was a miner before I died and I am a miner still. The war effort needs copper bars for arrowheads and fittings and a hundred other things, so I collect them." } },
      again = { { id = "h_again", text = "What else? Talk is cheap, copper is not." } },
      choices = {
        { text = "Where did you mine in life?", next = "past" },
        { text = "Where should I look for copper?", next = "where" },
        { text = "I'll bring you copper bars.", next = "BUSINESS" },
        { text = "I mine too. Any tips?", next = "tips", when = { profession = "Mining" } },
        { text = "Do you get on with the orcs?", next = "orcs" },
        { text = "Did you rise there, in the shafts?", next = "rose", when = { race = "Scourge" } },
        { text = "Farewell.", next = "END" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "In the hills above Hillsbrad, for a lord who paid us in bread and promises. When the plague came he fled to Stormwind, and I stayed and died in the shafts." } },
      choices = {
        { text = "Do you resent the living for that?", next = "resent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    resent = {
      lines = { { id = "r_default", text = "I resent him, and lords like him. The common living folk never did me any harm, but I would not cry if that lord's manor burned with him in it." } },
      choices = {
        { text = "Then he deserves to burn.", next = "BACK", reply = "Aye, and I would hold the torch.", fx = { align = { light = -1 } } },
        { text = "Vengeance won't bring back your life.", next = "BACK", reply = "No, but it might warm the cold a little.", fx = { align = { light = 1 } } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Everywhere, nearly. The hills of Durotar and the Barrens are thick with it, and so are the slopes of Silverpine, if you can stand the worgen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tips = {
      lines = { { id = "tips_default", text = "Follow the dark veins in the rock and listen for the hollow sound, and you will find ore where others walk past it. Also, never mine near kobolds, they take it personally." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "Well enough, because they work hard and say little, which suits me. It is the goblins I cannot abide, with their prices and their talk." } },
      choices = {
        { text = "What's wrong with the goblins?", next = "goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "gb_default", text = "They would sell a mine out from under the miners and charge them rent for the dark. The Venture Company strips the Barrens bare and calls it trade." } },
      choices = {
        { text = "A mine should belong to those who work it.", next = "BACK", reply = "Aye, and that is the first sensible thing I have heard all week.", fx = { align = { order = -1 } } },
        { text = "Someone has to own the land.", next = "BACK", reply = "That is what my lord said too, before he ran.", fx = { align = { order = 1 } } },
      },
    },
    rose = {
      lines = { { id = "rs_default", text = "I did, in the dark at the bottom of the Hillsbrad shaft, with my pick still in my hand. I dug my own way out, and I have not stopped digging since." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I dug copper in life and I dig it in death. Not much changed, except the pay." } },
    _none = { { id = "tp_none", text = "Never heard of it, {class}. I spend my days underground." } },
  },
}

-- Sergeant Umala: orc collecting thick leather for the war effort.
P:NPC {
  key = "og_sergeant_umala", id = TODO_NPC("Sergeant Umala"), name = "Sergeant Umala", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "brisk", "proud" }, values = { "duty", "honor" },
  notices = { "race", "profession" },
  impression = {
    first = "Sergeant Umala inspects every hide brought to her in the Valley of Spirits as if it were a recruit, pulling at the edges and scowling at the thin spots.",
    third = "{name} met Sergeant Umala, an orc collecting thick leather for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Stand straight when you speak to me, {class}. I have no time for slouches or thin hides." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Thick Leather!") }, text = "Thick leather, I said, and I meant thick. Bring it soon." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" }, text = "A leatherworker. Good, then you know quality when you see it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sergeant Umala, and I gather thick leather for the armor of the Horde's soldiers. When the gates of Ahn'Qiraj open, our grunts will need every hide we can stitch together." } },
      again = { { id = "h_again", text = "Well? What else?" } },
      choices = {
        { text = "What is Ahn'Qiraj?", next = "aq" },
        { text = "Where should I hunt for thick hides?", next = "where" },
        { text = "I'll bring thick leather.", next = "BUSINESS" },
        { text = "I fought in the Second War too.", next = "war2", when = { race = "Orc" } },
        { text = "You look at those hides like recruits.", next = "recruits" },
        { text = "What armor would you trust in battle?", next = "armor", when = { class = "WARRIOR" } },
        { text = "Farewell, Sergeant.", next = "END" },
      },
    },
    aq = {
      lines = { { id = "a_default", text = "An old city of the silithid behind a great wall in Silithus. The scouts say the insects are stirring, and the Warchief means for us to be ready when they come." } },
      choices = {
        { text = "Will the Alliance fight beside us?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "al_default", text = "They gather their own supplies in Ironforge, and there is even a dwarf ambassador here to count ours. I do not like it, but I like the bugs even less." } },
      choices = {
        { text = "Fighting beside them is necessary.", next = "BACK", reply = "Necessary, aye, but I will keep my back to a wall.", fx = { align = { order = 1 } } },
        { text = "The Horde needs no help from them.", next = "BACK", reply = "That is the orc in you talking, and I agree.", fx = { align = { order = -1 } } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "In the Hinterlands, Feralas and the Badlands. Big animals with thick hides, not the scrawny things around here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    war2 = {
      lines = { { id = "war2_default", text = "Then we have both seen what the demon blood did to us. I am glad we are free of it, and I am glad we fight for a better reason now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recruits = {
      lines = { { id = "rc_default", text = "Because I trained recruits for twenty years, and a weak hide and a weak recruit fail in the same place. They split at the edges when the pressure comes." } },
      choices = {
        { text = "Were you hard on them?", next = "hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "hd_default", text = "Harder than they liked and softer than the Alliance would have been. Most of the ones I trained are still alive, and that is the only measure I care about." } },
      choices = {
        { text = "Discipline keeps soldiers alive.", next = "BACK", reply = "It does. Remember that when your own sergeant shouts at you.", fx = { align = { order = 1 } } },
        { text = "Fear makes poor soldiers.", next = "BACK", reply = "Hm. Some of them told me so, years later, and some of them were right.", fx = { align = { order = -1 } } },
      },
    },
    armor = {
      lines = { { id = "ar_default", text = "Thick leather under mail, and mail under plate if you can afford it, warrior. A blade that slips past the steel still has to cut through hide, and that is often enough to save you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a sergeant in the Second War and I am a sergeant now. I will be one until I die, most likely." } },
    _none = { { id = "tp_none", text = "Not my concern, {class}. Ask someone who has time to wonder." } },
  },
}

-- Stoneguard Clayhoof: tauren collecting runecloth bandages for the war effort.
P:NPC {
  key = "og_stoneguard_clayhoof", id = TODO_NPC("Stoneguard Clayhoof"), name = "Stoneguard Clayhoof", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "solid", "calm" }, values = { "duty", "loyal" },
  notices = { "race", "profession" },
  impression = {
    first = "Stoneguard Clayhoof stands among the war effort's crates like a menhir, broad and still, with a stack of runecloth bandages at her hooves.",
    third = "{name} met Stoneguard Clayhoof, a tauren collecting runecloth bandages for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, {class}. I guard these supplies and I gather more of them, so if you bring bandages, you are a friend." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Runecloth Bandages!") }, text = "The runecloth bandages, friend. Do not forget them." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Ah, a shu'halo. The stoneguard of Thunder Bluff are glad to see our people doing their part." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Clayhoof of the stoneguard, and I gather runecloth bandages for the march on Ahn'Qiraj. Runecloth holds best of all, and the best is what our warriors deserve." } },
      again = { { id = "h_again", text = "What else? I am in no hurry." } },
      choices = {
        { text = "What is a stoneguard?", next = "stoneguard" },
        { text = "Where do I find runecloth?", next = "runecloth" },
        { text = "I'll bring bandages.", next = "BUSINESS" },
        { text = "Does Cairne still guard the bluffs himself?", next = "cairne", when = { race = "Tauren" } },
        { text = "What do you make of Orgrimmar?", next = "city" },
        { text = "I'm a shaman. Do the stoneguard know the earth spirits?", next = "earth", when = { class = "SHAMAN" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    stoneguard = {
      lines = { { id = "s_default", text = "We are the guards of Thunder Bluff's high places, sworn to stand like stone when everything else falls. Cairne sent a few of us here to guard the war effort's supplies." } },
      choices = {
        { text = "Do you trust the orcs to guard their own?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "I trust them to fight, and to fight well. Guarding a stack of crates takes patience, though, and that is not something every orc has." } },
      choices = {
        { text = "The orcs are our brothers. Trust them.", next = "BACK", reply = "I do, friend, but I also watch the crates.", fx = { align = { honor = 1 } } },
        { text = "Trust is earned, even between allies.", next = "BACK", reply = "Wise words, and stoneguard words.", fx = { align = { honor = -1 } } },
      },
    },
    runecloth = {
      lines = { { id = "r_default", text = "From the satyrs of Felwood and the trolls of Zul'Farrak and the dead of the Plaguelands. Wherever the enemies of the Horde are strongest, there you will find runecloth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cairne = {
      lines = { { id = "cairne_default", text = "He walks them every morning before the sun is fully risen, old as he is. We stoneguard try to keep up, and we rarely do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "ci_default", text = "It is loud and hot and made of stone that someone else carved, which is strange to me. Still, the orcs built it with their own hands after years in chains, and that I respect." } },
      choices = {
        { text = "Would you ever live here?", next = "live" },
        { text = "Something else.", next = "BACK" },
      },
    },
    live = {
      lines = { { id = "lv_default", text = "No, friend, I would miss the wind on the bluffs too much. But I am glad the orcs have a home, because a people without one grows bitter, and bitterness spreads." } },
      choices = {
        { text = "Every people deserves its own home.", next = "BACK", reply = "Yes, and every people should guard it well.", fx = { align = { light = 1 } } },
        { text = "Homes are won by strength, not deserved.", next = "BACK", reply = "There is truth in that, though it is a hard truth.", fx = { align = { light = -1 } } },
      },
    },
    earth = {
      lines = { { id = "ea_default", text = "We stand with them, which is close to knowing them. The earth spirits like a patient creature, and no one is more patient than a stoneguard on watch." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have guarded the bluffs of Thunder Bluff all my life. These crates are smaller, but I guard them just as well." } },
    _none = { { id = "tp_none", text = "I do not know that, friend. Stone does not need to know much." } },
  },
}

-- Commander Stronghammer: dwarf ambassador counting the Horde's war effort.
P:NPC {
  key = "og_commander_stronghammer", id = TODO_NPC("Commander Stronghammer"), name = "Commander Stronghammer", gender = "male",
  role = "ambassador", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff", "wary" }, values = { "duty", "honor" },
  notices = { "race" },
  impression = {
    first = "Commander Stronghammer is a dwarf in Orgrimmar, which is remarkable enough, standing among the Horde's war-effort crates with a ledger and a stare that dares anyone to say so.",
    third = "{name} met Commander Stronghammer, the Alliance ambassador who watches the Horde's war effort in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Aye, aye, I'm a dwarf, and aye, I'm in Orgrimmar. Ye can stop starin' now, {class}." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "An orc. Well, I suppose that's to be expected around here, isn't it?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Commander Stronghammer of Ironforge, sent to see that the Horde pulls its weight for the war in Silithus. Ye've got yer collectors, we've got ours, an' I'm here to make sure nobody's cheatin'." } },
      again = { { id = "h_again", text = "Anythin' else? I've numbers to check." } },
      choices = {
        { text = "Do you trust the Horde?", next = "trust" },
        { text = "How do you like Orgrimmar?", next = "orgrimmar" },
        { text = "Good day, dwarf.", next = "END" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Trust is a strong word, {g:lad|lass}. I trust that the bugs in Silithus'll eat us all if we don't work together, an' that'll have to do for now." } },
      choices = {
        { text = "A truce with the Alliance makes us stronger.", next = "BACK", reply = "Aye, it does, though I'll not say it too loud in Ironforge.", fx = { align = { order = 1 } } },
        { text = "This truce won't last past the war.", next = "BACK", reply = "Likely not, but let's not be the first to break it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orgrimmar = {
      lines = { { id = "o_default", text = "It's hot, it's red, an' nobody serves a proper ale. But I'll grant ye this, the orcs built it fast an' built it strong, an' a dwarf can respect good stonework." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea, {class}. I'm here to count crates, not answer riddles." } },
  },
}

-- Bounty Hunter Kolark: a well-travelled tauren who trades in thorium-headed arrows.
P:NPC {
  key = "og_bounty_hunter_kolark", id = TODO_NPC("Bounty Hunter Kolark"), name = "Bounty Hunter Kolark", gender = "male",
  role = "bounty_hunter", tier = "quest",
  communities = { "orgrimmar" }, temper = { "laconic", "shrewd" }, values = { "practical", "honor" },
  notices = { "race", "class" },
  impression = {
    first = "Bounty Hunter Kolark leans against a pillar in the Valley of Honor, a tauren with a salt-stained cloak and a quiver of arrows whose heads catch the light like dark silver.",
    third = "{name} met Bounty Hunter Kolark, a tauren tracker who has hunted bounties across the South Seas.",
  },
  greetings = {
    { id = "g_default", text = "You have the look of someone who hunts, {class}. Sit, if you like, and we shall talk of quarry." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the hunt? Then tell me what you caught, or show me." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "A hunter. Then you will know good arrows when you see them." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A brother of the plains, far from home like me. The Earth Mother sends us all over her lands, it seems." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Kolark, and I hunt for bounties wherever the Horde will pay for them. I have travelled to the South Seas and back, and there I learned to make arrows tipped with thorium that will pierce a dragon's scale." } },
      again = { { id = "h_again", text = "What else, friend? I am patient as a stalking cat." } },
      choices = {
        { text = "Tell me about the South Seas.", next = "seas" },
        { text = "Could you trade me those arrows?", next = "trade" },
        { text = "Why does a tauren hunt bounties?", next = "why" },
        { text = "Show me those arrows, hunter.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Any bounties worth taking now?", next = "bounties" },
        { text = "Do you miss Mulgore, brother?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    seas = {
      lines = { { id = "s_default", text = "Warm water, endless islands and pirates who will cut your throat for a copper. The Bloodsail buccaneers hold many of those islands, and I have collected more than one bounty on their captains." } },
      choices = {
        { text = "Did you ever get caught?", next = "caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "Once, on a ship bound for Booty Bay. They chained me in the hold and forgot that tauren are stronger than chains, and that was the last mistake that crew made." } },
      choices = {
        { text = "Pirates deserve no mercy.", next = "BACK", reply = "They gave none to me, so I returned the favor.", fx = { align = { light = -1 } } },
        { text = "You could have just escaped.", next = "BACK", reply = "I could have. But they would have chained the next tauren too.", fx = { align = { light = 1 } } },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "Not for gold, but for a fair trade. Bring me what I ask, and I will give you thorium-headed arrows, as fair a bargain as you will find in this city." } },
      choices = {
        { text = "I'll make that trade.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I was never good at sitting still, and the Horde has many enemies who need finding. Some tauren hunt kodo, and I hunt worse things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bounties = {
      lines = { { id = "bo_default", text = "There are always bounties, friend, posted on the boards in the Valley of Honor and at the Crossroads. Centaur raiders, quilboar chieftains and the occasional deserter all fetch a price." } },
      choices = {
        { text = "Who was your hardest quarry?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "hq_default", text = "A Bloodsail captain who swam better than he fought, and he swam a long way. I caught him on the beaches of Stranglethorn after three days, and I let the bounty office decide his fate." } },
      choices = {
        { text = "You did right to bring him in alive.", next = "BACK", reply = "Justice is for the Horde to give, not for me.", fx = { align = { honor = 1 } } },
        { text = "I'd have ended it on the beach.", next = "BACK", reply = "Many would have, and the pay is the same either way.", fx = { align = { honor = -1 } } },
      },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "I miss the smell of the grass after rain, and the kodo calling at dusk. One day I will lay down my bow by Bloodhoof Village, but the sea still has a few more stories for me first." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born in Mulgore and I have hunted on every shore since. One day I will go home, but not yet." } },
    _none = { { id = "tp_none", text = "I have not heard of that, friend. Perhaps it is not worth a bounty." } },
  },
}

-- Kruban Darkblade: Darkmoon Faire barker who wanders the Valley of Strength.
P:NPC {
  key = "og_kruban_darkblade", id = TODO_NPC("Kruban Darkblade"), name = "Kruban Darkblade", gender = "male",
  role = "barker", tier = "quest",
  communities = { "orgrimmar" }, temper = { "loud", "jovial" }, values = { "fun" },
  notices = { "race" },
  impression = {
    first = "Kruban Darkblade strides through the Valley of Strength in a coat of Darkmoon purple, an orc with a voice built for a battlefield and put to use selling tickets.",
    third = "{name} met Kruban Darkblade, an orc barker for the Darkmoon Faire.",
  },
  greetings = {
    { id = "g_default", text = "Hear me, Orgrimmar! The Darkmoon Faire is coming, and you do not want to miss it, {class}!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Kruban Darkblade, and I cry the news of the Darkmoon Faire to every orc, troll and tauren who will listen. Silas Darkmoon's wonders come to Mulgore and Elwynn in turn, and I make sure the Horde knows when." } },
      again = { { id = "h_again", text = "More questions? Good, curiosity sells tickets!" } },
      choices = {
        { text = "What is the Darkmoon Faire?", next = "faire" },
        { text = "How did an orc become a barker?", next = "orc" },
        { text = "Who is Silas Darkmoon?", next = "silas" },
        { text = "What games does the Faire have?", next = "games" },
        { text = "I remember the camps too.", next = "camps", when = { race = "Orc" } },
        { text = "It comes near Mulgore? Near my home?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Some other time.", next = "END" },
      },
    },
    faire = {
      lines = { { id = "f_default", text = "Games, wonders, prizes and the strangest folk in all of Azeroth, gathered in one field. You can win tickets, trade them for treasures and see a gnome shot from a cannon, if you are lucky." } },
      choices = {
        { text = "Where does it set up?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "Near Mulgore, by Thunder Bluff, when it comes to Horde lands, and near Goldshire in Elwynn when it visits the Alliance. Both sides come, and nobody fights, because Silas will not have it." } },
      choices = {
        { text = "A place without war sounds good.", next = "BACK", reply = "It is, and it is good for business too.", fx = { align = { order = -1 } } },
        { text = "I don't share a field with the Alliance.", next = "BACK", reply = "Then you will miss the best fun in Azeroth, friend.", fx = { align = { order = 1 } } },
      },
    },
    orc = {
      lines = { { id = "o_default", text = "I fought in the Second War and I hated every day of it. When the Faire came by the camp where I was held, I asked Silas if he needed a loud voice, and he did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    silas = {
      lines = { { id = "s_default", text = "The master of the Faire, and the richest showman in the world. Nobody knows where he came from, and I do not ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    games = {
      lines = { { id = "ga_default", text = "There is the ring toss, the shooting gallery and a tonk you can drive about and crash into other folk's tonks. The gnome cannon is the favorite, though, and nobody minds being the gnome except the gnome." } },
      choices = {
        { text = "Which game do you like best?", next = "best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The strength test, because I still hold the record among the Faire's own folk. Silas says it is unseemly for a barker to win his own prizes, so I give the tickets to the children." } },
      choices = {
        { text = "Games are a waste of a warrior's time.", next = "BACK", reply = "Then you have never seen an orc lose to a goblin at ring toss!", fx = { align = { order = 1 } } },
        { text = "A little foolishness is good for anyone.", next = "BACK", reply = "Now that is the Faire's spirit, friend!", fx = { align = { order = -1 } } },
      },
    },
    camps = {
      lines = { { id = "cm_default", text = "Then you know how long the days were behind those fences, and how little there was to laugh about. The day the Faire stopped outside our camp, I laughed until I wept, and I swore I would never stop again." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mulgore = {
      lines = { { id = "ml_default", text = "Right below Thunder Bluff, on the plains by the lake, where the kodo come to drink. The tauren children follow the wagons for miles when they arrive, and the elders pretend not to." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Soldier once, showman now. I prefer the showman." } },
    _none = { { id = "tp_none", text = "I don't know that one, friend, but ask me about the Faire." } },
  },
}

-- Rilli Greasygob: ex-Venture Company goblin at Nogg's Machine Shop.
P:NPC {
  key = "og_rilli_greasygob", id = TODO_NPC("Rilli Greasygob"), name = "Rilli Greasygob", gender = "male",
  role = "engineer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "nervous", "chatty" }, values = { "profit" },
  notices = { "profession" },
  impression = {
    first = "Rilli Greasygob hunches over a workbench in Nogg's Machine Shop, glancing up whenever the door opens as if he expects a debt collector to come through it.",
    third = "{name} met Rilli Greasygob, a goblin who left the Venture Company for Nogg's shop in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Oh, it's you! I mean, not you, just somebody, and I'm glad it's not somebody else, if you follow me." },
  },
  notice = {
    { id = "n_eng", cat = "profession", when = { profession = "Engineering" }, text = "An engineer, eh? Don't touch the red wires, pal, I'm still figurin' out what they do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Name's Rilli, and I work for Nogg now, which is a lot better than workin' for the Venture Company, believe you me. Over there it was all shouting and quotas, and Boss Copperplug never once said thank you." } },
      again = { { id = "h_again", text = "Somethin' else? Talk fast, I got a bomb in the oven." } },
      choices = {
        { text = "Why did you leave the Venture Company?", next = "left" },
        { text = "Who is Boss Copperplug?", next = "copperplug" },
        { text = "I hear you have a job for me.", next = "BUSINESS" },
        { text = "What are you building for Nogg?", next = "build" },
        { text = "I'm an engineer. Show me your work.", next = "eng", when = { profession = "Engineering" } },
        { text = "Never mind.", next = "END" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "I had a disagreement with the boss about who owned my inventions, and the boss had a lot of thugs on his side. So I took my tools and ran, and Nogg was kind enough to hire me." } },
      choices = {
        { text = "Are they still after you?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "Probably! The Venture Company don't forget a debt, and they figure I owe them for every bolt I took. That's why I jump every time the door opens." } },
      choices = {
        { text = "Let them come. I'll deal with them.", next = "BACK", reply = "You would? Pal, you just became my favorite customer.", fx = { align = { order = -1 } } },
        { text = "Maybe pay them what you owe.", next = "BACK", reply = "Pay them? With what? You see any gold on me?", fx = { align = { order = 1 } } },
      },
    },
    copperplug = {
      lines = { { id = "c_default", text = "The Venture Company's boss down in the Barrens, runs the operations near the Sludge Fen and the drill sites. Mean as a snake and twice as greasy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    build = {
      lines = { { id = "bu_default", text = "Right now? A clockwork boot that kicks the bombs back out the door before they go off, which Nogg says is the stupidest thing he ever paid for. I say it's an investment in keepin' all ten fingers." } },
      choices = {
        { text = "Does it work?", next = "works" },
        { text = "Something else.", next = "BACK" },
      },
    },
    works = {
      lines = { { id = "wk_default", text = "Mostly! It kicked one bomb out the door just fine, and then it kicked Nogg, which cost me a week's wages and a very long apology." } },
      choices = {
        { text = "Invention needs risk. Keep at it.", next = "BACK", reply = "See, that's what I tell Nogg, and he never listens!", fx = { align = { order = -1 } } },
        { text = "Maybe test it away from your boss.", next = "BACK", reply = "Yeah, yeah, real sensible, pal. Sensible don't get patents.", fx = { align = { order = 1 } } },
      },
    },
    eng = {
      lines = { { id = "en_default", text = "Sure, sure, take a look, just don't touch the coil on the left, it bites. That's a Venture Company shredder valve, by the way, and I may or may not have borrowed it on my way out." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Used to build drills for the Venture Company. Now I build whatever Nogg tells me to." } },
    _none = { { id = "tp_none", text = "Don't know nothin' about that, pal, and I'd keep it that way if I were you." } },
  },
}

-- Zando'zan: Darkspear rogue in the Cleft of Shadow; sends rogues to Wrenix in Ratchet.
P:NPC {
  key = "og_zandozan", id = TODO_NPC("Zando'zan"), name = "Zando'zan", gender = "male",
  role = "rogue", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sly", "amused" }, values = { "cunning" },
  notices = { "class", "race" },
  impression = {
    first = "Zando'zan lounges in the shadows of the Cleft, a lean Darkspear with a knife he keeps turning over in his fingers just to watch the light run along it.",
    third = "{name} met Zando'zan, a Darkspear rogue in the Cleft of Shadow.",
  },
  greetings = {
    { id = "g_default", text = "Ya walk loud for someone in de Cleft, {class}. De shadows be hearin' every step." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "Ah, one of de quiet ones. Maybe I got somethin' for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Zando'zan, and I deal in de quiet arts, mon. Poisons, knives, secrets, whatever de Horde needs done in de dark." } },
      again = { { id = "h_again", text = "Still here, mon? De shadows be waitin'." } },
      choices = {
        { text = "What sort of poisons?", next = "poisons" },
        { text = "Do you know Wrenix in Ratchet?", next = "wrenix" },
        { text = "I'm ready to learn poisons.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Tell me about the Echo Isles.", next = "isles" },
        { text = "Darkspear to Darkspear, what news?", next = "news", when = { race = "Troll" } },
        { text = "Leave me out of your dark business.", next = "END" },
      },
    },
    poisons = {
      lines = { { id = "p_default", text = "De kind dat makes a man slow, or sick, or dead, dependin' on how much you like him. Every good rogue learns dem, sooner or later." } },
      choices = {
        { text = "Poison is a coward's weapon.", next = "coward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      lines = { { id = "c_default", text = "Ha! Tell dat to a Kul Tiran marine with a blade in his belly and nothin' in his veins but fire. De dead don't care how dey died, mon." } },
      choices = {
        { text = "Winning is what matters.", next = "BACK", reply = "Now you be talkin' like a troll.", fx = { align = { honor = -1 } } },
        { text = "How you win matters too.", next = "BACK", reply = "Dat be a nice thought, and nice thoughts get a lot of folk killed.", fx = { align = { honor = 1 } } },
      },
    },
    wrenix = {
      lines = { { id = "w_default", text = "De goblin with de clever machine for brewin' poisons, ya. I send my students to him when dey be ready, because he got de tools I don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    isles = {
      lines = { { id = "is_default", text = "De Echo Isles be our home, mon, off de coast of Durotar, but Zalazane holds dem now with his voodoo. He turned our own people into his puppets, and de rest of us moved to Sen'jin." } },
      choices = {
        { text = "What do you think of Zalazane?", next = "zalazane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zalazane = {
      lines = { { id = "zz_default", text = "I think a witch doctor dat binds his own kin deserves a quiet knife in de night. Vol'jin says patience, and Vol'jin be wiser dan me, so I wait." } },
      choices = {
        { text = "Then use that knife. Zalazane deserves it.", next = "BACK", reply = "Ha! Maybe one day, mon, if Vol'jin looks de other way.", fx = { align = { light = -1 } } },
        { text = "Vol'jin is right. Free the isles properly.", next = "BACK", reply = "Properly, ya, which means slower. I be patient, mostly.", fx = { align = { light = 1 } } },
      },
    },
    news = {
      lines = { { id = "nw_default", text = "De Cleft be quiet, and de quiet be good for business. Keep your eyes on de Burning Blade cultists in de shadows, cousin, because dey be gettin' bold." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up on de Echo Isles, mon, and I learned to be quiet before I learned to walk." } },
    _none = { { id = "tp_none", text = "I don't know dat, and if I did, I wouldn't tell ya for free." } },
  },
}

-- Mokvar: in Grommash Hold, he sets heroes on the path to rebuilding their dungeon armor.
P:NPC {
  key = "og_mokvar", id = TODO_NPC("Mokvar"), name = "Mokvar", gender = "male",
  role = "agent", tier = "quest",
  communities = { "orgrimmar" }, temper = { "shrewd", "formal" }, values = { "ambition", "craft" },
  notices = { "level", "class" },
  impression = {
    first = "Mokvar stands in a corner of Grommash Hold, an orc in good clothes rather than mail, who studies the armor of every passing hero as a jeweler studies stones.",
    third = "{name} met Mokvar, an orc in Grommash Hold who takes an interest in heroes and their armor.",
  },
  greetings = {
    { id = "g_default", text = "A moment, {class}. I have a proposition for someone who has seen the inside of Blackrock Spire." },
  },
  notice = {
    { id = "n_young", cat = "level", when = { maxLevel = 55 }, text = "You are young yet. Come back to me when your armor has more scars than you do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Mokvar, and I serve those who serve the Horde best. There are heroes whose armor was won in Stratholme and Scholomance, and I know of a way to make it stronger still." } },
      again = { { id = "h_again", text = "What else? My proposition stands." } },
      choices = {
        { text = "What's this proposition?", next = "proposition" },
        { text = "Who do you work for?", next = "who" },
        { text = "I'm ready for your proposition.", next = "BUSINESS", when = { minLevel = 58 } },
        { text = "What does Grommash Hold mean to you?", next = "hold" },
        { text = "I'm a shaman. Is there armor for me?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    proposition = {
      lines = { { id = "p_default", text = "There is a ghost at the gates of Stratholme, a man named Anthion Harmon, who knows how to reforge the armor of heroes. I will send you to him, if you have the gold and the courage." } },
      choices = {
        { text = "A ghost? Can he be trusted?", next = "ghost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghost = {
      lines = { { id = "g2_default", text = "He was human, and an ally of no one, and he has nothing left to lose. That makes him more trustworthy than most living men I know." } },
      choices = {
        { text = "I'll take the risk. Power is power.", next = "BACK", reply = "That is the right answer, and the hard road starts there.", fx = { align = { light = -1 } } },
        { text = "Dealing with the dead feels wrong.", next = "BACK", reply = "We are allied with the Forsaken, {class}. The line has already been crossed.", fx = { align = { light = 1 } } },
      },
    },
    who = {
      lines = { { id = "w_default", text = "For the Warchief, and for myself, and for any hero with ambition. Grommash Hold is full of warriors, and some of them need more than a sword." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hold = {
      lines = { { id = "ho_default", text = "It bears Grom Hellscream's name, and every hero who walks under its roof walks in his shadow. I am no warrior, but I can help those who are rise as high as he did." } },
      choices = {
        { text = "Did you know Grom?", next = "grom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom = {
      lines = { { id = "gm_default", text = "I saw him once, before Hyjal, when he passed through the camps shouting that the Horde would rise again. He was terrible and glorious, and I have not stopped measuring heroes against him since." } },
      choices = {
        { text = "Grom's courage is the measure of a hero.", next = "BACK", reply = "Then may you measure up, {class}.", fx = { align = { honor = 1 } } },
        { text = "Grom's rage nearly doomed us all.", next = "BACK", reply = "It did, and he paid for it. Do not forget the paying.", fx = { align = { honor = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "There is, the mail of the Ten Storms, which the old shamans wore against the dark. Harmon knows how to make it greater still, if you are willing to bleed for it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not my business, {class}, and I am particular about my business." } },
  },
}

-- Great-father Winter: an orc actor hired by Smokywood Pastures for the Feast of Winter Veil.
P:NPC {
  key = "og_greatfather_winter", id = TODO_NPC("Great-father Winter"), name = "Great-father Winter", gender = "male",
  role = "holiday", tier = "quest",
  communities = { "orgrimmar" }, temper = { "jolly", "theatrical" }, values = { "generosity" },
  notices = { "race" },
  impression = {
    first = "Great-father Winter sits outside Grommash Hold in a great red coat and a white beard that does not quite hide his tusks, booming greetings at everyone in sight.",
    third = "{name} met Great-father Winter, who brings the Feast of Winter Veil to Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Ho ho! Greetings of the season, {class}! Have you been a good member of the Horde this year?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Great-father Winter, and I bring cheer and gifts to all of Orgrimmar for the Feast of Winter Veil. Smokywood Pastures has been kind enough to help me with the gifts, of course." } },
      again = { { id = "h_again", text = "More to say? Speak up, little one!" } },
      choices = {
        { text = "Aren't you just an orc in a beard?", next = "actor" },
        { text = "What is Winter Veil?", next = "veil" },
        { text = "Do you have a gift for me?", next = "BUSINESS" },
        { text = "Where do all the gifts come from?", next = "gifts" },
        { text = "Orcs had no feasts in the camps.", next = "camps", when = { race = "Orc" } },
        { text = "My people mark the winter differently.", next = "tauren", when = { race = "Tauren" } },
        { text = "Happy Winter Veil.", next = "END" },
      },
    },
    actor = {
      lines = { { id = "a_default", text = "Hush, not so loud! There are children about, and they believe in Great-father Winter. Smokywood Pastures pays me well, and I would like to keep the job." } },
      choices = {
        { text = "Your secret is safe.", next = "BACK", reply = "Good, good. You will get a fine gift for that.", fx = { align = { light = 1 } } },
        { text = "The children should know the truth.", next = "BACK", reply = "Bah! They will learn the truth soon enough without your help.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    veil = {
      lines = { { id = "v_default", text = "A festival of the deepest winter, when friends exchange gifts and eat too much. The dwarves started it, I am told, but the Horde has taken to it well." } },
      choices = {
        { text = "The dwarves? Why do we celebrate it?", next = "dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "Because gifts and feasting are good no matter who thought of them first, and because Smokywood Pastures sells to both sides. Do not tell the grunts that, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gifts = {
      lines = { { id = "gf_default", text = "Ho ho! From my workshop at the top of the world, little one, and from the Smokywood stalls by the wagonload. The children like the first answer and the goblins prefer the second." } },
      choices = {
        { text = "Who pays for them all?", next = "pays" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pays = {
      lines = { { id = "pa_default", text = "Smokywood Pastures, who make it all back on fruitcake and wrapping paper and then some. Still, a gift is a gift, whoever's ledger it came out of." } },
      choices = {
        { text = "Generosity is never wasted.", next = "BACK", reply = "Ho ho! That is the spirit of the season!", fx = { align = { light = 1 } } },
        { text = "It's just goblin business in a red coat.", next = "BACK", reply = "Shh! You will get coal for that, mark my words.", fx = { align = { light = -1 } } },
      },
    },
    camps = {
      lines = { { id = "cp_default", text = "No, we did not, and that is exactly why I put on this beard. Every orc child in this city deserves the winter feast I never had, and I will boom and laugh until my voice gives out." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tr_default", text = "Then mark it your way and mine both, friend, for the Earth Mother will not mind an extra feast. Sing your winter songs and eat my gingerbread, and nobody will be the poorer for it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ho ho! That is not the sort of thing Great-father Winter knows about." } },
  },
}

-- Kaymard Copperpinch: Smokywood Pastures goblin selling Winter Veil goods.
P:NPC {
  key = "og_kaymard_copperpinch", id = TODO_NPC("Kaymard Copperpinch"), name = "Kaymard Copperpinch", gender = "male",
  role = "vendor", tier = "quest",
  communities = { "orgrimmar" }, temper = { "pushy", "cheerful" }, values = { "profit" },
  notices = { "purse" },
  impression = {
    first = "Kaymard Copperpinch stands behind a stall heaped with Smokywood Pastures wares, a goblin in a red scarf who smiles like a man counting coins in his head.",
    third = "{name} met Kaymard Copperpinch, a Smokywood Pastures goblin selling Winter Veil goods.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, friend! Smokywood Pastures has the finest goods for the season, and I have the finest prices." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Kaymard Copperpinch, at your service! I handle the fancy goods for Smokywood Pastures, while my cousin Penney handles the cheap stuff, and between us we sell Winter Veil to the whole Horde." } },
      again = { { id = "h_again", text = "Anything else, valued customer?" } },
      choices = {
        { text = "What do you sell?", next = "BUSINESS" },
        { text = "What's Smokywood Pastures?", next = "smokywood" },
        { text = "I heard someone is stealing Winter Veil.", next = "stolen" },
        { text = "How's business this year?", next = "biz" },
        { text = "I could acquire some goods for you, quietly.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Not interested.", next = "END" },
      },
    },
    smokywood = {
      lines = { { id = "s_default", text = "The biggest holiday outfit in Azeroth, friend! We sell gifts, treats and cheer to Horde and Alliance alike, and we hire Great-father Winter to make it all official." } },
      choices = {
        { text = "You sell to the Alliance too?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "Of course! Gold doesn't care who spends it. There's a Smokywood stall in Ironforge too, run by my other cousin." } },
      choices = {
        { text = "That's just smart business.", next = "BACK", reply = "Now you're talkin'! You'd make a fine goblin.", fx = { align = { honor = -1 } } },
        { text = "Selling to our enemies is treachery.", next = "BACK", reply = "Treachery? It's commerce, friend!", fx = { align = { honor = 1 } } },
      },
    },
    stolen = {
      lines = { { id = "st_default", text = "Ugh, don't remind me. Some green thief keeps sneakin' off with the holiday treats, and Smokywood would be very grateful if somebody did somethin' about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    biz = {
      lines = { { id = "bz_default", text = "Business is booming, pal, booming! The orcs took to Winter Veil like a kobold to candles, and every grunt with a sweetheart needs a gift, so my margins are lookin' festive." } },
      choices = {
        { text = "Penney says she outsells you.", next = "penney" },
        { text = "Something else.", next = "BACK" },
      },
    },
    penney = {
      lines = { { id = "pn_default", text = "Penney sells more units, sure, but I sell more gold, and gold's the only figure the trade princes read. Cheap moves fast, but quality moves up, ya see." } },
      choices = {
        { text = "Quality is worth paying for.", next = "BACK", reply = "A customer of taste! I'll remember you, friend.", fx = { align = { order = 1 } } },
        { text = "Penney's right. Cheap and fast wins.", next = "BACK", reply = "Ugh, don't you start too, she's insufferable enough.", fx = { align = { order = -1 } } },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Whoa, whoa, keep your voice down, pal! Smokywood runs a clean ledger, at least where the guards can see it, so let's call that conversation a hypothetical." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, pal, but I've got a nice fruitcake if you're interested." } },
  },
}

-- Penney Copperpinch: Smokywood Pastures goblin selling cheaper Winter Veil goods.
P:NPC {
  key = "og_penney_copperpinch", id = TODO_NPC("Penney Copperpinch"), name = "Penney Copperpinch", gender = "female",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "bright", "pushy" }, values = { "profit" },
  impression = {
    first = "Penney Copperpinch runs the cheaper Smokywood stall, all ribbons and candy canes, and she talks twice as fast as her cousin Kaymard.",
    third = "{name} met Penney Copperpinch, who sells Smokywood Pastures' budget Winter Veil goods.",
  },
  greetings = {
    { id = "g_default", text = "Hey there, sweetheart! Winter Veil treats at Winter Veil prices, and that's a bargain, believe me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Penney Copperpinch, Smokywood Pastures, best deals in Orgrimmar! My cousin Kaymard sells the fancy stuff, but I sell what folks actually buy." } },
      again = { { id = "h_again", text = "What else, sweetheart?" } },
      choices = {
        { text = "What do you have?", next = "BUSINESS" },
        { text = "Do you and Kaymard get along?", next = "kaymard" },
        { text = "How did you get into this trade?", next = "trade" },
        { text = "Bye, Penney.", next = "END" },
      },
    },
    kaymard = {
      lines = { { id = "k_default", text = "Sure, so long as I sell more than he does, which I do every year. He thinks fancy sells, but I know cheap sells faster." } },
      choices = {
        { text = "Quality always wins in the end.", next = "BACK", reply = "Tell that to my ledger, sweetheart.", fx = { align = { order = 1 } } },
        { text = "Cheap and quick is the goblin way.", next = "BACK", reply = "You get it! Kaymard never does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "td_default", text = "My mother ran a candy cart in Booty Bay, and I was haggling with pirates before I could see over the counter. Smokywood hired me the year I sold a whole crate of stale fruitcake to a Bloodsail quartermaster." } },
      choices = {
        { text = "Stale fruitcake? To pirates?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "pi_default", text = "Pirates'll eat anything, sweetheart, and they paid in good coin, which is more than I can say for some customers. Never ask where the coin came from, that's the first rule of the trade." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care, but have you seen my candy canes?" } },
  },
}

-- Rachelle Gothena: Forsaken selling Hallow's End treats in the Valley of Strength.
P:NPC {
  key = "og_rachelle_gothena", id = TODO_NPC("Rachelle Gothena"), name = "Rachelle Gothena", gender = "female",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "playful" }, values = { "remembrance" },
  impression = {
    first = "Rachelle Gothena stands in the Valley of Strength with a tray of Hallow's End sweets and a smile that would be pleasant if half of it were not bone.",
    third = "{name} met Rachelle Gothena, a Forsaken who sells Hallow's End treats in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Happy Hallow's End, {class}. Would you care for a treat, or would you prefer a trick?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Rachelle, and I bring the Forsaken's own holiday to the orcs. Hallow's End is the day we celebrate our freedom from the Lich King, and the candy is a lovely bonus." } },
      again = { { id = "h_again", text = "Something else, my dear?" } },
      choices = {
        { text = "What is Hallow's End?", next = "hallow" },
        { text = "Show me your treats.", next = "BUSINESS" },
        { text = "What were you in life?", next = "life" },
        { text = "Goodbye.", next = "END" },
      },
    },
    hallow = {
      lines = { { id = "h2_default", text = "It is the day the Forsaken broke free of the Scourge, and we celebrate it with masks, sweets and the burning of a wicker man. The living find it a little unsettling, which is half the fun." } },
      choices = {
        { text = "Freedom is worth celebrating.", next = "BACK", reply = "It is, and I celebrate it every day I wake.", fx = { align = { order = -1 } } },
        { text = "Burning effigies sounds dangerous.", next = "BACK", reply = "Only for the wicker man, dear.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    life = {
      lines = { { id = "lf_default", text = "A baker's wife in Brill, if you can believe it, and I made the best sweet buns in Tirisfal. The plague took the bakery and the baker, but it left me the recipes." } },
      choices = {
        { text = "Do you miss that life?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "ms_default", text = "I miss the smell of the ovens, dear, though I can barely smell anything now. Making sweets for the living is the closest I come to it, and I find I do not mind that as much as I ought to." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I have no idea, dear, but I do have candy." } },
  },
}

-- Alowicious Czervik: goblin sweets seller outside the inn in the Valley of Strength.
P:NPC {
  key = "og_alowicious_czervik", id = TODO_NPC("Alowicious Czervik"), name = "Alowicious Czervik", gender = "male",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "eager", "talkative" }, values = { "profit" },
  impression = {
    first = "Alowicious Czervik stands by a cart outside the inn, a goblin with sticky fingers and a tray of sweets he insists are the finest in Kalimdor.",
    third = "{name} met Alowicious Czervik, a goblin selling sweets in the Valley of Strength.",
  },
  greetings = {
    { id = "g_default", text = "Hey, pal, you look like you need somethin' sweet! I got treats that'll make an ogre weep." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Alowicious Czervik, purveyor of sweets and treats! Orcs got a sweet tooth under all that grumbling, and I'm here to feed it." } },
      again = { { id = "h_again", text = "Somethin' else, pal? The candy's not gettin' any fresher." } },
      choices = {
        { text = "Let me see your sweets.", next = "BUSINESS" },
        { text = "Orcs really buy candy?", next = "orcs" },
        { text = "Where do you get your sweets?", next = "source" },
        { text = "No thanks.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "You'd be surprised! The grunts come off a shift and buy a whole bag, and then they glare at me like I'm gonna tell somebody. I never do, of course." } },
      choices = {
        { text = "Every warrior deserves a little sweetness.", next = "BACK", reply = "That's what I always say, pal!", fx = { align = { honor = -1 } } },
        { text = "A grunt should be eating meat, not candy.", next = "BACK", reply = "Hey, meat's fine, but it don't come in a pretty wrapper.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Half from a baker in Ratchet and half from my own kitchen, which used to be a still, so don't ask what's in the toffee. The margins on toffee are beautiful, pal, absolutely beautiful." } },
      choices = {
        { text = "Is the toffee safe to eat?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safe as anything in Orgrimmar, which is to say mostly! Nobody's complained yet, and a couple of grunts swear it's the only thing that gets 'em through a night watch." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No clue, pal, but have a lollipop." } },
  },
}

-- Kizzak Sparks: goblin fireworks vendor in the Drag.
P:NPC {
  key = "og_kizzak_sparks", id = TODO_NPC("Kizzak Sparks"), name = "Kizzak Sparks", gender = "male",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "excitable", "reckless" }, values = { "profit", "craft" },
  impression = {
    first = "Kizzak Sparks has singed eyebrows, a crate of rockets and a grin that suggests he has never once regretted lighting a fuse.",
    third = "{name} met Kizzak Sparks, a goblin who sells fireworks in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Fireworks, pal! Bright ones, loud ones, ones that only sometimes explode early!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Kizzak Sparks, fireworks specialist and part-time eyebrow donor! When there's a holiday in Orgrimmar, I'm the one makin' the sky go boom." } },
      again = { { id = "h_again", text = "Still here? Careful, that crate's a little warm." } },
      choices = {
        { text = "Show me the fireworks.", next = "BUSINESS" },
        { text = "What happened to your eyebrows?", next = "eyebrows" },
        { text = "What's the biggest show you ever put on?", next = "show" },
        { text = "I'll keep my distance.", next = "END" },
      },
    },
    eyebrows = {
      lines = { { id = "e_default", text = "A little experiment with a double-stage rocket, nothin' serious. They grow back, mostly, and my cousin says I look more distinguished without 'em." } },
      choices = {
        { text = "Safety should come first, Kizzak.", next = "BACK", reply = "Safety? Pal, safety's never sold a single rocket.", fx = { align = { order = 1 } } },
        { text = "Some risks are worth a good show.", next = "BACK", reply = "A goblin after my own heart!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    show = {
      lines = { { id = "sw_default", text = "The Lunar Festival two years back, when I lit three hundred rockets over the Valley of Strength at once. The sky went red and gold, the wyverns went somewhere else entirely, and I went deaf for a week." } },
      choices = {
        { text = "Did anyone get hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "ht_default", text = "Just one hut and a goblin, and the goblin was me, so it hardly counts. The hut belonged to a peon who said it was the best night of his life, so I figure we're square." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Dunno, pal, but I bet it'd look great with fireworks." } },
  },
}

-- Ukra'nor: orc staff merchant at Skyfury Staves.
P:NPC {
  key = "og_ukranor", id = TODO_NPC("Ukra'nor"), name = "Ukra'nor", gender = "male",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "proud", "gruff" }, values = { "craft" },
  notices = { "class" },
  impression = {
    first = "Ukra'nor stands among racks of carved staves in Skyfury Staves, an orc with a carver's knife on his belt and wood shavings in his beard.",
    third = "{name} met Ukra'nor, who sells staves at Skyfury Staves in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Skyfury Staves, {class}. Every staff here was carved by hands that know the wood." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" }, text = "A shaman. My staves carry the spirits well, if you treat them with respect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Ukra'nor, and I sell staves to shamans, mages and anyone who would rather hit from a distance. The wood comes from Ashenvale and Mulgore, and I carve it myself." } },
      again = { { id = "h_again", text = "What else? A good staff waits for no one." } },
      choices = {
        { text = "Show me your staves.", next = "BUSINESS" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "How did you learn to carve?", next = "learn" },
        { text = "Farewell.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Mulgore's wood is strong but slow to carve, and Ashenvale's is fine and sings when the spirits pass through it. The elves do not like us taking it, of course." } },
      choices = {
        { text = "The Horde must take what it needs.", next = "BACK", reply = "That is how the Warsong see it, and their axes agree.", fx = { align = { honor = -1 } } },
        { text = "We should honor the elves' claim.", next = "BACK", reply = "A gentle thought, but my staves do not carve themselves.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "le_default", text = "From an old tauren carver who took pity on me in the Barrens, after the camps. He said my hands were made for breaking things and he would teach them to make something instead." } },
      choices = {
        { text = "Is he still carving?", next = "teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = { { id = "te_default", text = "He went back to the earth three winters ago, and I carved his totem myself. Every staff I sell carries a little of what he taught me, so he is still working, in a way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know wood and carving, {class}, and little else." } },
  },
}

-- Shim'la: Darkspear troll in the Valley of Honor.
P:NPC {
  key = "og_shimla", id = TODO_NPC("Shim'la"), name = "Shim'la", gender = "female",
  role = "townsfolk", tier = "service",
  communities = { "orgrimmar" }, temper = { "easy", "wry" }, values = { "loyal" },
  impression = {
    first = "Shim'la leans against a wall in the Valley of Honor, a Darkspear troll who watches the training yards with amused eyes.",
    third = "{name} met Shim'la, a Darkspear troll in the Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon. You come to train, or you come to watch de orcs sweat like I do?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Shim'la of de Darkspear, and I like to watch de warriors train in dis valley. De orcs be fierce, but dey don't know how to have fun with it." } },
      again = { { id = "h_again", text = "Somethin' else, mon?" } },
      choices = {
        { text = "Do trolls train differently?", next = "trolls" },
        { text = "Why are you in Orgrimmar?", next = "why" },
        { text = "See you, Shim'la.", next = "END" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "We dance, mon, we laugh, and den we kill. De orcs just grunt and swing, and dey think dat be de same thing." } },
      choices = {
        { text = "Discipline is better than dancing.", next = "BACK", reply = "Maybe, but de dancer lives longer, mon.", fx = { align = { order = 1 } } },
        { text = "A little joy makes a fighter better.", next = "BACK", reply = "You get it! Come dance with de Darkspear sometime.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Sen'jin Village be small, and Orgrimmar be big and loud and full of trouble. A troll needs a little trouble, mon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know dat one, mon. Ask a shaman." } },
  },
}

-- Doyo'da: jungle troll who drinks at the inn in the Valley of Strength.
P:NPC {
  key = "og_doyoda", id = TODO_NPC("Doyo'da"), name = "Doyo'da", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "lazy", "friendly" }, values = { "comfort" },
  impression = {
    first = "Doyo'da sprawls on a bench at the inn with a mug in one hand, a troll who looks like he has not moved since the city was built.",
    third = "{name} met Doyo'da, a troll who drinks at the Valley of Strength inn.",
  },
  greetings = {
    { id = "g_default", text = "Ey, mon. Sit down, de drinks be cold and de stories be warm." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Doyo'da, and I be restin', mon. I fought at Mount Hyjal and I been restin' ever since, and nobody's told me to stop yet." } },
      again = { { id = "h_again", text = "Somethin' else, mon? Don't make me sit up." } },
      choices = {
        { text = "You fought at Hyjal?", next = "hyjal" },
        { text = "Who else drinks here?", next = "others" },
        { text = "Enjoy your rest.", next = "END" },
      },
    },
    hyjal = {
      lines = { { id = "h2_default", text = "Ya, against de demons, beside orcs and elves and humans all together. Strangest day of my life, and de last time I want to fight anybody." } },
      choices = {
        { text = "You've earned your rest, then.", next = "BACK", reply = "Dat's what I keep tellin' de innkeeper!", fx = { align = { order = -1 } } },
        { text = "The Horde still needs fighters.", next = "BACK", reply = "Den let de young ones fight, mon. I did my part.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Kozish de goblin, who sells anythin' to anybody, and some orcs like Goma, Sarok and little Zazo. Good company, mostly, if you don't mind de shoutin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know, mon, and I be too comfortable to find out." } },
  },
}

-- Kozish: goblin who hangs about the inn in the Valley of Strength.
P:NPC {
  key = "og_kozish", id = TODO_NPC("Kozish"), name = "Kozish", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "slick", "chatty" }, values = { "profit" },
  impression = {
    first = "Kozish sits at a corner table in the inn with a ledger and a drink, a goblin who seems to be doing business with half the room.",
    third = "{name} met Kozish, a goblin who does his business at the inn.",
  },
  greetings = {
    { id = "g_default", text = "Hey, friend! Pull up a chair, I'm always open for business." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Name's Kozish, and I buy, I sell and I broker, mostly from this table. You need somethin' found, I know a guy, and if I don't, I know a guy who knows a guy." } },
      again = { { id = "h_again", text = "Anything else, valued customer?" } },
      choices = {
        { text = "What kind of business?", next = "business" },
        { text = "Why do business in an inn?", next = "inn" },
        { text = "Not interested.", next = "END" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "All kinds, friend, all kinds. Ore, cloth, information, the occasional favor, and nothin' that would bother the Warchief, mostly." } },
      choices = {
        { text = "That sounds like smuggling.", next = "BACK", reply = "Smuggling? I prefer 'creative trade'.", fx = { align = { order = 1 } } },
        { text = "A little bending of the rules is fine.", next = "BACK", reply = "Now there's somebody I can do business with!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "Because everybody comes through here eventually, and a goblin who's sittin' still is a goblin who's not payin' rent. Smart, huh?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend, but for a price I can find out." } },
  },
}

-- Goma: orc regular at the inn in the Valley of Strength.
P:NPC {
  key = "og_goma", id = TODO_NPC("Goma"), name = "Goma", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "loud", "boastful" }, values = { "honor" },
  impression = {
    first = "Goma is a big orc at the inn with a mug of grog and a story he is telling loud enough for everyone, whether they want to hear it or not.",
    third = "{name} met Goma, a boastful orc at the inn.",
  },
  greetings = {
    { id = "g_default", text = "Ha! Another one! Sit down and hear how I killed a quilboar with my bare hands!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Goma, and I have killed more quilboar than any orc in this inn. Ask anyone, they will tell you, unless they were lying about their own." } },
      again = { { id = "h_again", text = "More? I have more stories than you have ears!" } },
      choices = {
        { text = "Tell me about the quilboar.", next = "quilboar" },
        { text = "Do you ever stop boasting?", next = "boast" },
        { text = "I'll leave you to your grog.", next = "END" },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "It was in the Barrens, near Razorfen, and it charged me with a spear the size of a tree. I broke the spear over my knee and its neck over the other one." } },
      choices = {
        { text = "An impressive feat.", next = "BACK", reply = "It was! Buy me another grog and I will tell it again.", fx = { align = { light = 1 } } },
        { text = "I don't believe a word of it.", next = "BACK", reply = "Bah! Come to Razorfen and I will prove it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boast = {
      lines = { { id = "b_default", text = "Why would I? An orc who does not boast is an orc who has done nothing worth boasting about. Sarok and Zazo know that well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, but I bet I could kill it." } },
  },
}

-- Sarok: orc regular at the inn in the Valley of Strength.
P:NPC {
  key = "og_sarok", id = TODO_NPC("Sarok"), name = "Sarok", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet", "dry" }, values = { "loyal" },
  impression = {
    first = "Sarok sits beside Goma at the inn, an orc of few words who rolls his eyes every time his friend begins another story.",
    third = "{name} met Sarok, a quiet orc at the inn.",
  },
  greetings = {
    { id = "g_default", text = "If Goma has been talking to you, I am sorry. He does not know when to stop." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sarok, and I fought beside Goma for six years. Half his stories are true, and I will not tell you which half." } },
      again = { { id = "h_again", text = "What else? Speak before Goma starts again." } },
      choices = {
        { text = "Which half is true?", next = "half" },
        { text = "Why do you drink with him?", next = "why" },
        { text = "Farewell.", next = "END" },
      },
    },
    half = {
      lines = { { id = "hf_default", text = "The quilboar was real, but it was a small one, and I was the one who killed it. Goma fell into the mud and has never forgiven me." } },
      choices = {
        { text = "You should set the record straight.", next = "BACK", reply = "And ruin his favorite story? No, let him have it.", fx = { align = { light = 1 } } },
        { text = "Let him have his glory.", next = "BACK", reply = "That is what friends are for.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because he saved my life at the Crossroads, and because the grog is cheap. Mostly the first one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I do not know. Ask Goma, he will pretend he does." } },
  },
}

-- Zazo: young orc who hangs around the inn in the Valley of Strength.
P:NPC {
  key = "og_zazo", id = TODO_NPC("Zazo"), name = "Zazo", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "eager", "naive" }, values = { "honor" },
  impression = {
    first = "Zazo is a young orc at the inn who hangs on every word Goma says, his eyes shining with the hope of glory.",
    third = "{name} met Zazo, a young orc at the inn.",
  },
  greetings = {
    { id = "g_default", text = "Are you an adventurer? Have you killed anything big? Tell me everything!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Zazo, and I am going to be the greatest warrior in the Horde, just like Goma. I am only waiting until I am old enough to join the army." } },
      again = { { id = "h_again", text = "Tell me more! Please!" } },
      choices = {
        { text = "Goma exaggerates, you know.", next = "goma" },
        { text = "Why do you want to be a warrior?", next = "warrior" },
        { text = "Good luck, Zazo.", next = "END" },
      },
    },
    goma = {
      lines = { { id = "g2_default", text = "No he doesn't! Well, maybe a little, but Sarok says even half a Goma story is better than most orcs' whole stories." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "Because the Horde needs warriors, and because I want my name sung in Grommash Hold. My father was a peon, and I want to be more than that." } },
      choices = {
        { text = "Glory is a worthy goal.", next = "BACK", reply = "Yes! You understand!", fx = { align = { honor = 1 } } },
        { text = "A peon's work is honest too.", next = "BACK", reply = "I suppose, but nobody sings songs about peons.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know! But I will find out when I'm a warrior!" } },
  },
}

-- Elder Darkhorn: a tauren ancestor-spirit in the Valley of Wisdom, outside Grommash Hold, at the Lunar Festival.
P:NPC {
  key = "og_elder_darkhorn", id = 15579, name = "Elder Darkhorn", gender = "female",
  role = "elder", tier = "quest",
  temper = { "stern", "kind" }, values = { "memory", "honour" },
  notices = { "race" },
  impression = {
    first = "The spirit of an old tauren matron stands beside Grommash Hold, unbothered by the orcs hurrying past.",
    third = "{name} honoured Elder Darkhorn, a tauren spirit who returns to Orgrimmar at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Peace to you, child. Even in a city of iron and smoke, the ancestors find a place to stand." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come round again, and the ancestors are near tonight. I am glad you came to honor them." },
    { id = "g_back", when = { metBefore = true }, text = "You return to me. Good. A spirit is only as strong as those who remember her." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Darkhorn the Elder") }, text = "You seek the elders this year. Come, and take the blessing I have to give." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A shu'halo of the plains. Walk tall in this orc city, child, for our people stood beside them by choice." },
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "An orc who stops to speak with a tauren ghost. Thrall has taught his people well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Darkhorn, and in life I led my clan's young through hard winters on the plains. Now the Lunar Festival calls me back, and I stand where the Horde's chieftains gather." } },
      again = {
        { id = "h_again", text = "What more would you ask, child?" },
        { id = "h_again2", text = "Speak. The Warchief's guards will not mind an old ghost's chatter." },
      },
      choices = {
        { text = "Why stand beside Grommash Hold?", next = "hold" },
        { text = "What is the Lunar Festival for?", next = "festival" },
        { text = "What were the plains like in your day?", next = "plains" },
        { text = "I am of the Bloodhoof's people, Elder.", next = "kin", when = { race = "Tauren" } },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    hold = {
      lines = { { id = "hd_default", text = "Because here the Horde decides its future, and the future should hear from the past now and then. Thrall listens to his elders, and that is rare in a young chieftain." } },
      choices = {
        { text = "What would you tell the Warchief?", next = "advice" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    advice = {
      lines = { { id = "a_default", text = "That a home is harder to keep than to take. The orcs fought for this land, and now they must learn to grow old in it." } },
      choices = {
        { text = "The Horde must stay strong and ready for war.", next = "BACK", reply = "Strength, yes. But a spear held too long makes the arm ache.", fx = { align = { honor = 1 } } },
        { text = "Peace is what the Horde needs now.", next = "BACK", reply = "Then guard that peace well, child. It breaks easier than bone.", fx = { align = { honor = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year, when the living remember the dead and the dead bless the living. Druids gather in Moonglade, and elders like me wander the world for any who seek us." } },
      choices = {
        { text = "How do I reach Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Ask the festival's heralds in the Valley of Wisdom; the druids there will send you by the moon's own path. Look for my kin too, for many elders wait beside the old places of Kalimdor." } },
      choices = { { text = "I'll seek them out. Something else.", next = "BACK" } },
    },
    plains = {
      lines = { { id = "p_default", text = "Wide and gold, and hunted by centaur on every side. We moved with the kodo, and every winter we buried someone dear, and every spring we sang for them." } },
      choices = { { text = "Mulgore is safer now, thanks to Cairne.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Then you carry the Earth Mother's blessing in your hooves already. Remember us at the festival fires, and tell the little ones our names." } },
      choices = { { text = "I will, Elder. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A tauren elder of long ago, who returns each year at the Lunar Festival." } },
    _none = { { id = "tp_none", text = "That is a matter for the living, child. Ask them." } },
  },
}

-- Lunar Festival Herald: a tauren herald by the bank who sends Horde folk to the festival in the Valley of Wisdom.
P:NPC {
  key = "og_lunar_herald", id = 15891, name = "Lunar Festival Herald", gender = "male",
  role = "herald", tier = "quest",
  temper = { "cheerful", "earnest" }, values = { "tradition", "community" },
  notices = { "race" },
  impression = {
    first = "A tauren in festival colours calls out to anyone passing the bank.",
    third = "{name} heard the Lunar Festival Herald's call in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Hail, friend! The Lunar Festival has come, and all are welcome to celebrate it." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival is here at last! The elders have returned, and the Valley of Wisdom is full of light." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! Have you visited the Valley of Wisdom yet?" },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Lunar Festival") }, text = "Off to the Valley of Wisdom with you! The festival harbinger waits there." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A child of Mulgore! You know the elders' ways already; go and honour them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Each year at the new moon, the spirits of our elders return, and the druids of Moonglade open their glade to all. Go to the Valley of Wisdom and speak with the festival's harbinger there." } },
      again = { { id = "h_again", text = "Anything else, friend? There are more to greet today." } },
      choices = {
        { text = "Who are these elders?", next = "elders" },
        { text = "Moonglade is a night elf place, isn't it?", next = "moonglade" },
        { text = "Do the orcs keep this festival too?", next = "orcs" },
        { text = "My people have always honoured the ancestors.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll go to the valley.", next = "END" },
      },
    },
    elders = {
      lines = { { id = "e_default", text = "The honoured dead of every people, who walk among us while the festival lasts. They wait in cities, ruins and lonely hills, and each will give a coin of blessing to one who seeks them." } },
      choices = {
        { text = "Where can I find them?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "One stands right here in Orgrimmar, Elder Darkhorn, beside Grommash Hold. Others wait in Thunder Bluff, the Undercity and across both continents." } },
      choices = {
        { text = "I'll find every one of them.", next = "BACK", reply = "That is the spirit! The ancestors will smile on you.", fx = { align = { order = 1 } } },
        { text = "Chasing ghosts for coins seems pointless.", next = "BACK", reply = "Then go for the feasting, friend. The elders will forgive you.", fx = { align = { order = -1 } } },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "It is a druid's place, and druids of every people share it, tauren and kaldorei alike. During the festival, the Cenarion Circle keeps the peace there for all." } },
      choices = { { text = "Then I'll go in peace. Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Many do now, the ones who follow the shamans' path and honour their own ancestors. The orcs know better than most what it is to lose their elders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "So we have, and so this festival is ours as much as anyone's. Wear your best and greet the elders proudly." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I only know the festival, friend. Ask in the Valley of Wisdom." } },
  },
}

-- Festival Talespinner: a Forsaken storyteller in Orgrimmar during the Midsummer Fire Festival.
P:NPC {
  key = "og_festival_talespinner", id = 16818, name = "Festival Talespinner", gender = "male",
  role = "storyteller", tier = "quest",
  temper = { "theatrical", "sly" }, values = { "stories", "the Horde" },
  notices = { "race" },
  impression = {
    first = "A Forsaken storyteller in festival finery gestures grandly beside the bonfire.",
    third = "{name} listened to the Festival Talespinner at Orgrimmar's Midsummer fires.",
  },
  greetings = {
    { id = "g_default", text = "Ah, an audience! Gather close, friend, the fire is warm and my tales are warmer." },
    { id = "g_festival", when = { holiday = "midsummer" }, text = "The Midsummer fires burn high tonight, friend. Even a dead man feels their warmth, and that is a tale in itself." },
    { id = "g_back", when = { metBefore = true }, text = "You return for another tale? You flatter a dead man's vanity." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Stealing Stormwind's Flame") }, text = "Have you the Alliance's flame yet? Oh, the tale we will tell when you bring it home." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" }, text = "One of the Dark Lady's children, warm by an orc's fire. Isn't it strange how we still enjoy the heat?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The Midsummer Fire Festival, friend, when every city lights its great flame against the dark. And I am here to tell the tales that go with it, the bolder the better." } },
      again = {
        { id = "h_again", text = "Another question? I live for them. Well, in a manner of speaking." },
        { id = "h_again2", text = "Speak up. The fire crackles loud tonight." },
      },
      choices = {
        { text = "Why does a Forsaken celebrate a fire festival?", next = "forsaken" },
        { text = "Tell me a tale, then.", next = "tale" },
        { text = "I hear the Alliance cities have flames too.", next = "flames" },
        { text = "I'm Forsaken too. The fire troubles me.", next = "fear", when = { race = "Scourge" } },
        { text = "Some other time.", next = "END" },
      },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "Because I remember summers, friend, and I see no reason death should take that too. The Horde lights its fires, and the Forsaken stand among them as allies." } },
      choices = { { text = "A fair answer. Something else.", next = "BACK" } },
    },
    tale = {
      lines = { { id = "t_default", text = "Here is a short one. Once a frost lord came down from the north to snuff the summer fires, and the people beat him back with nothing but torches and stubbornness. Every year since, they light the fires to remind him." } },
      choices = {
        { text = "Is any of that true?", next = "truth" },
        { text = "A fine tale. Something else.", next = "BACK" },
      },
    },
    truth = {
      lines = { { id = "tr_default", text = "Every good tale is true somewhere, and this one is truer than most. Ask the shamans about the lords of fire and frost, and see how quickly they stop smiling." } },
      choices = { { text = "Then I'll keep my torch lit.", next = "BACK" } },
    },
    flames = {
      lines = { { id = "fl_default", text = "They do, burning proudly in Stormwind, Ironforge and Darnassus. A daring Horde hero might slip in and bring a little of that flame home to Orgrimmar." } },
      choices = {
        { text = "Stealing their flame would shame them. I'll do it.", next = "BACK", reply = "That's the spirit! Come back with fire in your hands.", fx = { align = { honor = 1 } } },
        { text = "Let them keep their fire. It's a holiday.", next = "BACK", reply = "How generous of you. The Alliance would never return the favour.", fx = { align = { honor = -1 } } },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "It troubles us all, friend; fire was made to burn dead things. That is why I stand close to it. A tale is no good if the teller is afraid of it." } },
      choices = { { text = "I'll try to stand a little closer.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know no tale of that, friend, but give me an hour and I will make one up." } },
  },
}

-- Great-father Winter's Helper: a goblin Little Helper beside Great-father Winter in the Valley of Strength.
P:NPC {
  key = "og_winter_helper", id = 15746, name = "Great-father Winter's Helper", gender = "male",
  role = "helper", tier = "service",
  temper = { "busy", "chipper" }, values = { "holiday", "coin" },
  impression = {
    first = "A goblin in a red and green suit, juggling ribbons and a long list.",
    third = "{name} met Great-father Winter's Helper in the Valley of Strength during the Feast of Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil! Smokywood Pastures wishes you joy, cheer, and reasonable prices!" },
    { id = "g_festival", when = { holiday = "winterveil" }, text = "Winter Veil is here at last! Great-father Winter is in fine spirits, and so is Smokywood Pastures." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Are you on the nice list? Don't answer that; it's above my pay grade." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I help Great-father Winter with the gifts and the crowds and the occasional angry grunt. It's a busy season, but the tips are good!" } },
      again = { { id = "h_again", text = "What else? Quick, the Great-father is waving at me." } },
      choices = {
        { text = "Who is Great-father Winter?", next = "greatfather" },
        { text = "What does Smokywood Pastures have to do with it?", next = "smokywood" },
        { text = "Happy Winter Veil.", next = "END" },
      },
    },
    greatfather = {
      lines = { { id = "gf_default", text = "The jolly old fellow who brings gifts at the Winter Veil, of course! The Horde calls him Great-father, and the Alliance has some other name for him." } },
      choices = {
        { text = "Is he real?", next = "real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    real = {
      lines = { { id = "r_default", text = "Real enough to hand out presents, pal, and that's what counts. I don't ask questions while the gifts keep coming." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    smokywood = {
      lines = { { id = "s_default", text = "Everything! They supply the treats, the trimmings and the trees, and they pay me to smile. Their stall's right over there, if you've coin to spend." } },
      choices = {
        { text = "So the holiday is just a goblin sales pitch.", next = "BACK", reply = "Hey, a goblin's gotta eat too! But the cheer's free.", fx = { align = { order = 1 } } },
        { text = "Good business is good cheer, I say.", next = "BACK", reply = "Now there's someone who understands the season!", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea! But I'll put it on the list for the Great-father." } },
  },
}

-- Raider Bork: the orc war mount quartermaster outside the Hall of Legends.
P:NPC {
  key = "og_raider_bork", id = 12796, name = "Raider Bork", gender = "male",
  role = "quartermaster", tier = "service",
  temper = { "gruff", "proud" }, values = { "honour", "victory" },
  notices = { "race" },
  impression = {
    first = "A scarred orc raider stands by the Hall of Legends with the look of a man who has ridden hard.",
    third = "{name} spoke with Raider Bork, war mount quartermaster of the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "You stand before the Hall of Legends, warrior. Only those who have proven themselves in battle may buy from me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you earned a better rank since we last spoke?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Raider Bork, and I keep the war mounts for the Horde's greatest champions. Wolves, kodo and raptors, all bred for battle against the Alliance." } },
      again = { { id = "h_again", text = "What else, warrior? Speak quickly." } },
      choices = {
        { text = "How does one earn a war mount?", next = "earn" },
        { text = "What is the Hall of Legends?", next = "hall" },
        { text = "Lok'tar, Raider.", next = "END" },
      },
    },
    earn = {
      lines = { { id = "e_default", text = "Through blood and honour on the battlefield. Rise high enough in the Horde's ranks, and I will gladly sell you a steed fit for a legend." } },
      choices = {
        { text = "What makes a war mount better than a common one?", next = "mount" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mount = {
      lines = { { id = "m_default", text = "Armour, training and temper. A war wolf will charge into a line of spears without flinching, and it will not run even when its rider falls." } },
      choices = {
        { text = "Glory in war is worth any cost.", next = "BACK", reply = "Spoken like a true raider. Go and earn it.", fx = { align = { honor = 1 } } },
        { text = "I'd rather a mount that brings me home alive.", next = "BACK", reply = "Hmph. Wisdom, perhaps. But legends are not made that way.", fx = { align = { honor = -1 } } },
      },
    },
    hall = {
      lines = { { id = "h2_default", text = "It honours the Horde's finest in the war against the Alliance. Those of high rank may enter, and the rest may only look and hope." } },
      choices = { { text = "I'll earn my place. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my concern, warrior. I deal in mounts and glory." } },
  },
}

-- Sergeant Thunderhorn: a tauren quartermaster in the Hall of Legends who outfits the Horde's ranked warriors.
P:NPC {
  key = "og_sergeant_thunderhorn", id = 14581, name = "Sergeant Thunderhorn", gender = "male",
  role = "quartermaster", tier = "service",
  temper = { "steady", "dutiful" }, values = { "duty", "honour" },
  notices = { "race" },
  impression = {
    first = "A broad tauren sergeant stands among racks of fine armour, calm and watchful.",
    third = "{name} met Sergeant Thunderhorn, quartermaster in the Hall of Legends.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, warrior. The Horde rewards those who fight for it, and I see that the rewards reach the right hands." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your name grows on the battlefield, I hear." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A child of Mulgore among the Horde's champions. The Earth Mother is proud, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sergeant Thunderhorn, and I keep the arms and armour granted to the Horde's ranked warriors. Your rank decides what you may claim." } },
      again = { { id = "h_again", text = "Anything else, warrior?" } },
      choices = {
        { text = "What kind of equipment do you keep?", next = "gear" },
        { text = "A tauren in an orc hall. How did you end up here?", next = "tauren" },
        { text = "Farewell, Sergeant.", next = "END" },
      },
    },
    gear = {
      lines = { { id = "gr_default", text = "Armour forged for each calling, from warrior's plate to shaman's mail, and weapons fit for a warlord. Each piece is earned in battle, not bought with gold." } },
      choices = {
        { text = "Why not sell it to any who can pay?", next = "pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      lines = { { id = "p_default", text = "Because gold can be stolen, but honour must be won. A warrior who wears this armour has bled for the Horde." } },
      choices = {
        { text = "That's how it should be.", next = "BACK", reply = "Then go and earn it, warrior.", fx = { align = { order = 1 } } },
        { text = "Seems like a waste of good steel.", next = "BACK", reply = "Perhaps to a merchant. Not to a soldier.", fx = { align = { order = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "The Thunderhorn have fought beside the orcs since Thrall came to Mulgore. Where the Horde fights, my people fight too." } },
      choices = { { text = "The Horde is stronger for it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I cannot help you with that, warrior." } },
  },
}

---------------------------------------------------------------------------
-- Orgrimmar Grunt: the city guard. Light entry; World guard pool covers the rest.
---------------------------------------------------------------------------
P:NPC {
  key = "org_grunt", id = 3296, name = "Orgrimmar Grunt", gender = "male",
  role = "guard", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "honor", "duty" },
  impression = {
    first = "An Orgrimmar Grunt in spiked pauldrons blocks half the path without trying, axe resting on his shoulder, watching you with flat professional interest.",
    third = "{name} spoke with a grunt of Orgrimmar.",
  },
  greetings = { { id = "g_default", text = "Lok'tar. Speak your business; the Warchief's city is busy." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the peace in Orgrimmar, by the Warchief's order. Brawlers, thieves, and the odd drunk ogre; I've seen all of them on these streets before noon." } },
      again = { { id = "h_again", text = "Anything else? Keep it short." } },
      choices = {
        { text = "What does the Warchief ask of his grunts?", next = "thrall" },
        { text = "Where's the Valley of Strength?", next = "dir" },
        { text = "For the Horde.", next = "END" },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "Discipline. Thrall broke the chains of the camps, and he won't see us become brutes again. A grunt who strikes without cause answers to his captain, and then to the Warchief." } },
      choices = {
        { text = "That discipline is what makes us strong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "An orc needs his fury, not more rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dir = {
      lines = { { id = "d_default", text = "Through the main gate and you're standing in it. The bank, the auction house, and the inn are all there. Ask any grunt, we all know the way." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my concern. Ask in the Valley of Wisdom." } } },
}
