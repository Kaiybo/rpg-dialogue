-- Felwood folk missed in earlier passes: Ivy and Tenell Leafrunner of the Emerald Circle (Emerald Sanctuary) and
-- Nalesette Wildbringer, pet trainer at Talonbranch Glade. Voice: bibles/missed_folk.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ivy Leafrunner (Emerald Sanctuary: To Winterspring!)
---------------------------------------------------------------------------
P:NPC {
  key = "ivy", id = TODO_NPC("Ivy Leafrunner"), name = "Ivy Leafrunner", title = "Emerald Circle",
  bible = "bibles/missed_folk.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "earnest", "bright" }, values = { "nature", "hope" },
  notices = { "craft", "class" },
  impression = {
    first = "Ivy Leafrunner works with the Emerald Circle at the southern edge of Felwood and keeps her hope carefully, as one keeps a seedling in bad soil. She would rather show a visitor one clean leaf than describe a thousand tainted ones.",
    third = "{name} met Ivy Leafrunner of the Emerald Circle at the Emerald Sanctuary in Felwood.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Sanctuary. Breathe while you can, for the air is cleaner here than anywhere north of us." },
    { id = "g_2", when = { metBefore = true }, text = "You have come back out of the wood. Good, for I worry over everyone who walks north from here." },
    { id = "g_3", when = { questActive = TODO_QUEST("To Winterspring!") }, text = "The road to Winterspring runs through Timbermaw Hold. Go carefully, and give Wynd Nightchaser my greeting when you reach Starfall." },
    { id = "g_4", when = { questDone = TODO_QUEST("To Winterspring!") }, text = "So you reached Starfall, and came back to tell me. Was the snow as clean as they say?" },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Herbalism" },
      text = "You gather, and you have been gathering here, for I can smell the taint on your hands. Wash them in the moonwell before you eat anything." },
    { id = "n_2", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you feel it as we do, how the trees are still alive under the sickness, and still asking for help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Ivy Leafrunner, of the Emerald Circle. We came here to cleanse what the Legion fouled, a leaf and a root at a time, and to learn whether a whole forest can be brought back from this." },
        { id = "hello_2", when = { questBefore = TODO_QUEST("To Winterspring!") }, text = "There are friends of the Circle beyond the mountains, at Starfall Village in Winterspring. If your road takes you north, seek out Wynd Nightchaser there, for he knows that land and would welcome a capable hand." },
        { id = "hello_3", when = { questActive = TODO_QUEST("To Winterspring!") }, text = "Follow the road north to its end, and pass through the Timbermaw tunnels if the furbolgs will allow it. Starfall stands on a hill east of the frozen lake." },
      },
      again = {
        { id = "hello_again1", text = "What else would you ask? I can spare the time." },
        { id = "hello_again2", text = "Ask, friend. Hope grows better when it is talked about." },
        { id = "hello_again3", text = "Go on. The seedlings can wait a little." },
      },
      choices = {
        { text = "What does the Emerald Circle do here?", next = "circle" },
        { text = "These trees look past saving.", next = "saving" },
        { text = "What lies north of the Sanctuary?", next = "north" },
        { text = "Can the land itself be heard, under the taint?", next = "heard", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Is anything that grows here still safe to use?", next = "safe", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "Is there work for me?", next = "BUSINESS" },
        { text = "May your seedlings thrive, Ivy.", next = "END" },
      },
    },
    circle = {
      lines = {
        { id = "circle_default", text = "We tend the tainted plants and coax them back to health, and we send out those who can fight to thin the things that keep the wood sick. Greta Mosshoof leads us on the tauren side, and Jessir Moonbow among the kaldorei." },
      },
      choices = {
        { text = "Tauren and night elves, working together?", next = "circle_together" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_together = {
      lines = {
        { id = "circle_together_default", text = "Side by side, and we quarrel less than you would think. The corruption does not ask which banner a druid follows, and so we have stopped asking as well." },
      },
      choices = {
        { text = "That's rarer than it ought to be.", next = "circle_rare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_rare = {
      lines = {
        { id = "circle_rare_default", text = "It is. Taronn Redfeather says that the forest is teaching us manners, and that it is a harsh teacher. I think that he is right on both counts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    saving = {
      big = true,
      lines = {
        { id = "saving_default", text = "Many say so. They see the green slime and the withered boughs, and they say that it would be kinder to burn it all and to plant anew." },
      },
      choices = {
        { text = "Don't burn it. What lives can still be healed.", next = "BACK", reply = "That is what we are here to prove. Thank you, for I needed to hear someone else say it today.", fx = { align = { light = 1 } } },
        { text = "Burn it. Some rot is too deep to cure.", next = "BACK", reply = "I have thought so myself, on the bad days. But I have seen one cleansed sapling put out a true leaf, and I cannot unsee it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    north = {
      lines = {
        { id = "north_default", text = "The Deadwood furbolgs, who were gentle once and are now mad with the taint. Beyond them lie the ruins where the Jadefire satyrs keep their fouled moonwells, and Jaedenar, where the Shadow Council has dug itself in." },
      },
      choices = {
        { text = "And beyond all of that?", next = "north_beyond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north_beyond = {
      lines = {
        { id = "north_beyond_default", text = "There is Talonbranch Glade, where the Alliance keeps a post, and Bloodvenom Post for the Horde. At the very end of the road is Timbermaw Hold, the last of the furbolgs who kept their minds, and I honour them for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    heard = {
      lines = {
        { id = "heard_default", text = "Faintly. It is like a voice heard through a wall, and it is weary, but it has not given up. On the days when I doubt, I go and sit by the moonwell and listen until I hear it again." },
      },
      choices = {
        { text = "Then it's worth fighting for.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = {
        { id = "safe_default", text = "Very little, and nothing that has not first been cleansed. Bring what you gather to the Circle, and we shall tell you what may be used and what must be buried deep." },
      },
      choices = {
        { text = "I'll bring it to you first.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "I know this wood, what ails it, and the little that we have learned of mending it. Ask, and I shall share whatever may help." } },
    background = { { id = "tp_background", text = "I am a gatherer of the Emerald Circle. My brother Tenell and I came here together, and neither of us will leave before the other." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "We are their hands in Felwood. They send us seeds and counsel, and we send them back what we have learned." } },
    timbermaw = { { id = "tp_timbermaw", text = "They are the last furbolgs here who are still themselves. Earn their trust if you can, for the road north runs through their halls." } },
    satyrs = { { id = "tp_satyrs", text = "They were kaldorei once, and they chose this. I have less pity for them than I have for the trees." } },
    _none = { { id = "tp_none", text = "I do not know, friend. My learning stops at the edge of this wood." } },
  },
}

---------------------------------------------------------------------------
-- Tenell Leafrunner (Emerald Sanctuary, Emerald Circle)
---------------------------------------------------------------------------
P:NPC {
  key = "tenell", id = TODO_NPC("Tenell Leafrunner"), name = "Tenell Leafrunner", title = "Emerald Circle",
  bible = "bibles/missed_folk.md", role = "citizen", tier = "service",
  communities = { "emerald_sanctuary" }, temper = { "dry", "watchful" }, values = { "nature", "protective" },
  notices = { "class", "weary" },
  impression = {
    first = "Tenell Leafrunner keeps watch at the Emerald Sanctuary while the rest of the Emerald Circle tends its plants. He counts everyone who goes north into Felwood and notices who fails to return.",
    third = "{name} met Tenell Leafrunner of the Emerald Circle, who keeps watch at the Emerald Sanctuary.",
  },
  greetings = {
    { id = "g_default", text = "Hold there a moment. Good, your eyes are clear. One must look, in this wood." },
    { id = "g_2", when = { metBefore = true }, text = "You are back, and still yourself. I marked you down as likely to return, and I am glad to be right." },
  },
  notice = {
    { id = "n_1", cat = "weary", when = { durability = { max = 0.35 } },
      text = "You have been in the deep wood, and it has left its mark on your gear. Clean all of it before the slime dries, for it eats leather." },
    { id = "n_2", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "You move quietly. That will serve you well among the Deadwood, who strike at whatever they hear." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Tenell Leafrunner. My sister Ivy tends the seedlings, and I watch the road, because someone must, and because I am better with a bow than with a trowel." },
        { id = "hello_2", when = { faction = "Horde" }, text = "The Sanctuary stands open to the Horde as it does to the Alliance, by the Circle's word. Keep the peace here, and you will find that I am no enemy of yours." },
      },
      again = {
        { id = "hello_again1", text = "What more? I can talk and watch at once." },
        { id = "hello_again2", text = "Ask. The road is empty for the moment." },
        { id = "hello_again3", text = "Go on, I am listening." },
      },
      choices = {
        { text = "What do you watch for?", next = "watch" },
        { text = "Why did you check my eyes?", next = "eyes" },
        { text = "Your sister seems more hopeful than you are.", next = "ivy" },
        { text = "Guarding a garden is a waste of a good bow.", next = "waste" },
        { text = "What should I fear most on the road north?", next = "fear", when = { class = { "HUNTER", "ROGUE", "WARRIOR" } } },
        { text = "Does Darnassus send you any aid?", next = "aid", when = { race = "NightElf" } },
        { text = "Keep a good watch, Tenell.", next = "END" },
      },
    },
    watch = {
      lines = {
        { id = "watch_default", text = "Deadwood furbolgs, who wander south when the madness drives them, and now and then something worse from the ruins. And travellers, who are the greater number, and whom I count." },
      },
      choices = {
        { text = "Why count the travellers?", next = "watch_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_count = {
      lines = {
        { id = "watch_count_default", text = "So that someone knows when one fails to come back. I keep a tally on that post, with a notch for each who goes north and a second cut for each who returns. There are more single notches on it than I would like." },
      },
      choices = {
        { text = "Has anyone ever gone looking for them?", next = "watch_looking" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_looking = {
      lines = {
        { id = "watch_looking_default", text = "I go, when the count has stood a week. Twice I have found them alive. The other times I have brought back what there was, so that the Circle might say the words over it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes = {
      lines = {
        { id = "eyes_default", text = "The taint shows there first, as a green cast at the edge of the white. The Deadwood all have it, and the beasts as well. I have never yet seen it in a traveller, and I do not mean to be surprised by the first." },
      },
      choices = {
        { text = "What would you do if you saw it?", next = "eyes_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes_seen = {
      lines = {
        { id = "eyes_seen_default", text = "I would take them to Greta Mosshoof and the moonwell, and I would hope. And I would keep an arrow on the string while I hoped, because I have a sister inside that wall." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ivy = {
      lines = {
        { id = "ivy_default", text = "She is, and I thank Elune for it, since one of us ought to be. Ivy sees the one leaf that has healed, and I see the thousand that have not. Between the two of us, we see the wood as it is." },
      },
      choices = {
        { text = "It takes both kinds.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      big = true,
      lines = {
        { id = "waste_default", text = "I have heard that from Sentinels who were passing through. They say that the fight is in the north, at Jaedenar, and that a bow which guards seedlings is a bow thrown away." },
      },
      choices = {
        { text = "They're wrong. Without the garden there's nothing to fight for.", next = "BACK", reply = "So I tell myself at each change of the watch. It is good to hear it in another's voice.", fx = { align = { order = 1 } } },
        { text = "They're right. Take the fight to the source.", next = "BACK", reply = "Perhaps I shall, one day. But on that day I shall first need to know who is standing at this gate.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = {
        { id = "fear_default", text = "The oozes. A furbolg you will hear, and a satyr you will smell, but the slimes lie still in the pools and look like water. Test the ground with a stick before you cross anything green." },
      },
      choices = {
        { text = "A stick. I'll cut one before I go.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aid = {
      lines = {
        { id = "aid_default", text = "A little, and late. The Archdruid has his mind on Teldrassil, and Felwood is a long way from his new tree. Most of what we have comes from Moonglade, and from travellers like you." },
      },
      choices = {
        { text = "Then travellers will have to do.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I was a hunter in Ashenvale before the Circle called for hands. I came because Ivy came, and I have stayed because the work is worth doing." } },
    advice = { { id = "tp_advice", text = "Do not drink from anything here that you did not carry in with you." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Deadwood were our neighbours once. I take no joy in shooting them, and I shoot them all the same." } },
    burning_legion = { { id = "tp_burning_legion", text = "They did this, and they are doing it still at Jaedenar. Whatever we heal, they would foul again if they could reach it." } },
    _none = { { id = "tp_none", text = "I cannot say. I watch one road, and I know that road well." } },
  },
}

---------------------------------------------------------------------------
-- Nalesette Wildbringer (Talonbranch Glade, pet trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "nalesette", id = TODO_NPC("Nalesette Wildbringer"), name = "Nalesette Wildbringer", title = "Pet Trainer",
  bible = "bibles/missed_folk.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "gentle", "firm" }, values = { "nature", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Nalesette Wildbringer tends hunters' beasts at Talonbranch Glade and frets over each one that has walked through Felwood's poison. She trusts an animal's judgment of a person well before her own.",
    third = "{name} met Nalesette Wildbringer, who tends hunters' beasts at Talonbranch Glade.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you have a beast with you, let me see its eyes and its paws before anything else." },
    { id = "g_2", when = { metBefore = true }, text = "You return. And how is your companion's appetite? That is the first thing to go, in this wood." },
  },
  notice = {
    { id = "n_1", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has walked through the slime, I see. Hold it still, and I shall wash those paws before it licks them." },
    { id = "n_2", cat = "class", when = { class = "DRUID" },
      text = "The beasts here calmed when you came near. They know one who has worn a wild shape, and they are glad of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Nalesette Wildbringer. I teach the hunters' companions what they need to know, and I mend what Felwood does to them, which is the larger part of my work in these days." },
        { id = "hello_2", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Then your beast comes first and you second, as is proper. Bring it here, and let us see what it has learned and what it has suffered." },
      },
      again = {
        { id = "hello_again1", text = "What else would you ask? The owl is settled, so I may listen." },
        { id = "hello_again2", text = "Speak softly, and ask what you will." },
        { id = "hello_again3", text = "Go on. The beasts do not mind your voice." },
      },
      choices = {
        { text = "My companion needs training.", next = "BUSINESS", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does Felwood do to a beast?", next = "felwood" },
        { text = "Who else keeps the Glade running?", next = "glade" },
        { text = "A sick beast should be put down. It's kinder.", next = "kinder" },
        { text = "Is there any beast here worth taming?", next = "taming", when = { class = "HUNTER" } },
        { text = "Do the wild ones here still know themselves?", next = "wild", when = { class = "DRUID" } },
        { text = "Elune watch your charges, Nalesette.", next = "END" },
      },
    },
    felwood = {
      lines = {
        { id = "felwood_default", text = "It gets into them through the water and the grass. First they refuse their food, and then the eyes turn, and at the last they do not know the hand that raised them." },
      },
      choices = {
        { text = "Can you stop it?", next = "felwood_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_stop = {
      lines = {
        { id = "felwood_stop_default", text = "If I catch it early. I wash them in moonwell water, I feed them only what was carried in from Ashenvale, and I keep them close to me. I have brought back eleven, and lost four." },
      },
      choices = {
        { text = "Do you remember the four?", next = "felwood_four" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_four = {
      lines = {
        { id = "felwood_four_default", text = "By name, each of them. A hunter's bear was the last, and he sat with her until the end and would not let me do it for him. I have thought better of hunters ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    glade = {
      lines = {
        { id = "glade_default", text = "Mishellena keeps the hippogryphs, and she and I share our remedies. Kaerbrus teaches the hunters themselves, and Malygen sells what little the caravans bring this far." },
      },
      choices = {
        { text = "It's a small post for such a dangerous wood.", next = "glade_small" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade_small = {
      lines = {
        { id = "glade_small_default", text = "It is, and it was never meant to be more than that. We are here so that those who fight in Felwood have somewhere to mend, and their beasts as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kinder = {
      big = true,
      lines = {
        { id = "kinder_default", text = "Sometimes it is, and I have done it with my own hands. But too many reach for the knife at the first dull eye, when a week of clean water would have brought the creature back." },
      },
      choices = {
        { text = "Try to heal first. Every life deserves the chance.", next = "BACK", reply = "That is my rule. It costs me my sleep, and I would not change it.", fx = { align = { light = 1 } } },
        { text = "A quick end spares it suffering. Don't prolong it.", next = "BACK", reply = "I understand why you say so. I shall still give each of them the week.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taming = {
      lines = {
        { id = "taming_default", text = "Not from this wood. Whatever you tame here carries the taint in its blood, and one day it will turn. Go north to Winterspring for a frostsaber or an owl, where the snow is clean." },
      },
      choices = {
        { text = "Winterspring, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild = {
      lines = {
        { id = "wild_default", text = "Fewer each season. The bears go first, and the wolves hold out longer. I leave clean water at the edge of the Glade for those that still know to seek it, and each morning it is gone." },
      },
      choices = {
        { text = "Then some of them still remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I raised nightsabers in Ashenvale. When the Glade was founded, they asked for someone who would not turn a sick animal away." } },
    advice = { { id = "tp_advice", text = "Carry your companion's water in with you, and never let it drink from a pool in this wood." } },
    elune = { { id = "tp_elune", text = "Her wells are the only clean water here. I think of that each time I fill a bowl." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Deadwood went the way the bears go, only more slowly, and knowing it. I find that hard to think about." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Kaerbrus, for he hears the hunters' news." } },
  },
}
