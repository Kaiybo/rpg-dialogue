-- Ashenvale's missed folk, Alliance side: Krolg the furbolg in his hut, and the dryad Anilia at Xavian.
-- (Silverwind and Astranaar trainers/merchants live in more_folk.lua.) Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Krolg: an uncorrupted furbolg in his hut south of Mystral Lake. Classic: Raene's Cleansing (Dartol's Rod).
P:NPC {
  key = "krolg", id = TODO_NPC("Krolg"), name = "Krolg", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "wary", "sorrowful" }, values = { "tribe", "honesty" },
  notices = { "form", "class" },
  impression = {
    first = "Krolg is a furbolg who lives alone in a hut south of Mystral Lake, because the madness that took the Foulweald did not take him. He speaks slowly and sadly, and he would not have spoken at all had I not come to him wearing fur.",
    third = "{name} met Krolg, an uncorrupted furbolg of the Foulweald who lives alone south of Mystral Lake.",
  },
  greetings = {
    { id = "g_default", text = "You wear the shape of my people, but you smell of the elf town. Krolg will listen, because the one who sent you has a good smell too." },
    { id = "g_rod", when = { questActive = TODO_QUEST("Raene's Cleansing") }, text = "The rod of Dartol brought you here in a furbolg's skin. Sit by Krolg's fire, and we will speak of what must be done." },
    { id = "g_done", when = { questDone = TODO_QUEST("Raene's Cleansing") }, text = "You come back, friend of Krolg. The woods are a little quieter for what you did, and Krolg sleeps a little better." },
    { id = "g_back", when = { metBefore = true }, text = "Krolg remembers your smell. Come in, and mind the low roof." },
  },
  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, you walk as a bear and not only as a furbolg! The bear is grandfather to my people, and Krolg is glad to see him at the door." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_rod", when = { questActive = TODO_QUEST("Raene's Cleansing") }, text = "Krolg knows why the elf woman sent you. The Foulweald are sick in their hearts, and there are those among them who keep the sickness strong, and Krolg can tell you their names." },
        { id = "h_default", text = "I am Krolg, and once I was of the Foulweald tribe. A badness came into the forest and into my people, and it did not come into Krolg, so now I live here alone and they would kill me if they found the hut." },
      },
      again = {
        { id = "h_again", text = "What more do you ask of Krolg?" },
        { id = "h_again2", text = "Speak, friend. The fire is warm, and Krolg has few visitors." },
      },
      choices = {
        { text = "What happened to the Foulweald?", next = "foulweald" },
        { text = "Why did the madness spare you?", next = "spared" },
        { text = "Who keeps the sickness strong?", next = "names" },
        { text = "You are lonely out here.", next = "lonely" },
        { text = "A druid grieves with you, Krolg.", next = "druid", when = { class = "DRUID" } },
        { text = "Krolg's hut is well hidden. How do you live?", next = "hut" },
        { text = "Are there other furbolgs still free of the sickness?", next = "others" },
        { text = "What did the Foulweald sing at the full moon?", next = "w_song" },
        { text = "Stay hidden, Krolg, and stay well.", next = "END" },
      },
    },
    foulweald = {
      lines = { { id = "f_default", text = "They were hunters and honey gatherers, and they sang at the full moon. Then the water and the roots turned sour, and they grew angry at everything, and now they sing only before they kill.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "Where does the sourness come from?", next = "sour" },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    sour = {
      lines = { { id = "s_default", text = "From the north, where the trees weep green and the demons walk. It creeps down in the streams, and a furbolg drinks, and a little more of him goes away each season until only the anger is left.", fx = { learn = { "burning_legion" } } } },
      choices = { { text = "Then the north must be cleansed. Something else.", next = "BACK" } },
    },
    spared = {
      lines = { { id = "sp_default", text = "Krolg does not know, and he has asked the spirits many nights. Maybe he drank from a different stream, or maybe he is only stubborn, as his mother always said he was." } },
      choices = {
        { text = "Stubbornness has its uses.", next = "BACK", reply = "Ha! So Krolg's mother also said, when she was not angry with him.", fx = { affinity = 1 } },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "n_default", text = "Ran Bloodtooth is the worst, a cruel hunter who has killed many who would not follow, and he camps to the north with the bones of the dead about him. Above him is Chief Murgut, who holds the Foulweald with his totem and his fear." } },
      choices = {
        { text = "What must be done about them?", next = "done" },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "Bloodtooth must die first, for while he lives the frightened ones cannot leave. Then the chief must be called out at the totem mound and broken there, where all the tribe can see that his strength was only a sickness." } },
      choices = { { text = "It is hard counsel, but I hear it.", next = "BACK" } },
    },
    lonely = {
      lines = { { id = "l_default", text = "Yes. A furbolg is not made to live alone, and Krolg talks to the fire so that he does not forget how. The elf woman Raene sends friends sometimes, and that is a kindness he did not expect from her people." } },
      choices = { { text = "She is a good friend to have. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The tree-speakers were friends to the furbolgs before any other of the tall folk. It was one of yours, old Dartol, who made the rod so that he could sit at our fires, and Krolg is glad it still makes friends." } },
      choices = { { text = "So am I. Something else, Krolg.", next = "BACK" } },
    },
    hut = {
      lines = { { id = "ht_default", text = "Krolg gathers honey from the trees the Foulweald do not watch, and fishes in the stream before the sour water reaches it. He moves the fire every moon, so that the smoke does not show the same place twice, and he sleeps lightly." } },
      choices = {
        { text = "That sounds like a hard life.", next = "hut2" },
        { text = "You've learned to hunt your own people's habits.", next = "hut2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut2 = {
      lines = { { id = "ht2_default", text = "It is hard, but it is Krolg's own. Before the badness, the Foulweald shared everything, the honey and the fish and the songs. Now Krolg shares only with the fire, and with the elf woman's friends, when they come." } },
      choices = { { text = "Then I'm glad I came. Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "ot_default", text = "Krolg has heard of the Timbermaw, far to the north in the mountains, who keep their hearts clean behind their hold. They do not trust the tall folk, and they do not trust furbolgs from other tribes, but they have not breathed the sickness." } },
      choices = {
        { text = "Could you go to them?", next = "others2" },
        { text = "Then the furbolgs aren't lost, not all of them.", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = { { id = "ot2_default", text = "Krolg could try, but the way is through the green weeping forest, where the demons walk. And Krolg would not leave the frightened ones of the Foulweald alone with Bloodtooth. When the badness is broken here, maybe, Krolg will go north and sing with the Timbermaw." } },
      choices = {
        { text = "I'm a night elf. My people wronged yours, I think.", next = "BACK", reply = "Some of the tall folk, maybe. But the elf woman sent you, and you came. Krolg remembers kindness longer than wrongs.", when = { race = "NightElf" } },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
    w_song = {
      lines = {
        { id = "w_song_default", text = "A song about the honey trees, and the bees that live in them, and the bear spirit who taught the first furbolgs to share. Krolg sings it alone now, very quietly, so the sick ones do not hear him and come." },
      },
      choices = {
        { text = "Will you sing it for me?", next = "w_song2" },
        { text = "I'm sorry you sing alone.", next = "w_song2" },
      },
    },
    w_song2 = {
      lines = {
        { id = "w_song2_default", text = "Krolg will sing one line. The honey is sweet when it is shared, and bitter when it is hoarded, and the bear spirit sleeps in every tree. That is all Krolg will sing, because the rest makes him too sad, and he has to keep listening for the sick ones." },
        { id = "w_song2_w1", when = { class = "DRUID" }, text = "The tree-speakers knew this song once. Maybe you will find a tree-speaker who still knows the rest, and they will sing it to the Foulweald one day." },
      },
      choices = {
        { text = "It's a beautiful song.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Krolg.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Krolg was a honey gatherer of the Foulweald. Now he is only Krolg, and the hut is his whole tribe." } },
    furbolgs = { { id = "tp_fur", text = "My people are sick, not wicked. Remember that when you must raise your weapon to them." } },
    _none = { { id = "tp_none", text = "Krolg knows the woods and the tribe, and not that. Ask the elf woman Raene, who knows the tall folk's troubles." } },
  },
}

-- Anilia: a dryad lying wounded at Xavian. Classic: found for Vile Satyr! Dryads in Danger!; gives The Branch of Cenarius.
P:NPC {
  key = "anilia", id = TODO_NPC("Anilia"), name = "Anilia", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "fading", "brave" }, values = { "nature", "duty" },
  notices = { "class" },
  impression = {
    first = "Anilia is a dryad I found lying among the satyrs' stones at Xavian, too badly hurt to rise. She spent what breath she had on the Branch of Cenarius and on her friend Illiyana, and none of it on herself.",
    third = "{name} found the dryad Anilia dying at Xavian, where the satyr Geltharis had taken the Branch of Cenarius from her.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a friendly face, here of all places. Come close, please, for I cannot speak loudly any more." },
    { id = "g_illiyana", when = { questActive = TODO_QUEST("Vile Satyr! Dryads in Danger!") }, text = "Illiyana sent you? Dear Illiyana, I knew she would not forget me. Come close, for there is little time." },
    { id = "g_branch", when = { questActive = TODO_QUEST("The Branch of Cenarius") }, text = "Do not stay with me, kind one. Find Geltharis and take back the Branch, for that is all I ask." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the grove! Father's blessing is on you, I can feel it, and it eases me to have one of his own beside me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_branch", when = { questActive = TODO_QUEST("The Branch of Cenarius") }, text = "Geltharis will be near, gloating over what he stole, for satyrs cannot keep from gloating. Take the Branch from him and carry it to Illiyana, and tell her I was not afraid." },
        { id = "h_default", text = "I am Anilia, a daughter of Cenarius, and I was the keeper of his Branch. The satyrs caught me in these woods and their lord Geltharis tore it from my hands, and I fear they have done for me in the taking." },
      },
      again = {
        { id = "h_again", text = "Ask quickly, friend, while I can still answer." },
        { id = "h_again2", text = "I am still here, a little. What would you know?" },
      },
      choices = {
        { text = "What is the Branch of Cenarius?", next = "branch" },
        { text = "Who is Geltharis?", next = "geltharis" },
        { text = "Let me tend your wounds.", next = "wounds" },
        { text = "Illiyana is waiting at the Shrine for you.", next = "illiyana" },
        { text = "A druid's healing may still reach you.", next = "druid", when = { class = "DRUID" } },
        { text = "What were these woods like, before the satyrs came?", next = "before" },
        { text = "Is there anything you would have me do, besides the Branch?", next = "wish" },
        { text = "What was your favourite place in these woods?", next = "w_place" },
        { text = "Rest now. I will find him.", next = "END" },
      },
    },
    branch = {
      lines = { { id = "b_default", text = "A living bough that Father gave into our keeping, long ago, with his own blessing in the wood. In a dryad's hands it makes the forest glad, and I cannot bear to think what a satyr will make it do.", fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "What could a satyr do with it?", next = "misuse" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    misuse = {
      lines = { { id = "m_default", text = "Twist it, as they twist everything, until the blessing in it becomes a blight. They have already fouled the moonwells of this place, and with the Branch they could sicken groves that have stood since the world was whole." } },
      choices = { { text = "Then he will not keep it. Something else.", next = "BACK" } },
    },
    geltharis = {
      lines = { { id = "g_gel", text = "The lord of the satyrs of Xavian, and the cruellest of them. He will be close by, among his servants, for he likes to stand near what he has broken.", fx = { learn = { "satyrs" } } } },
      choices = { { text = "He will answer for this. Something else.", next = "BACK" } },
    },
    wounds = {
      lines = { { id = "w_default", text = "You are kind, but their blades were fouled, and it is past the mending of hands. Do not grieve, for a dryad goes back to the forest, and I should much rather you spent your strength on the Branch." } },
      choices = { { text = "As you wish, brave one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    illiyana = {
      lines = { { id = "i_default", text = "She will blame herself, because she always does. Tell her that we chased each other through these woods for a thousand springs, and that I would not trade one of them for a longer life." } },
      choices = { { text = "I will tell her every word. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "I feel it, like sun through leaves, and it takes the pain away. It will not hold me here, child of the grove, but it lets me go gently, and that is a great gift." } },
      choices = { { text = "Go gently, then. Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "bf_default", text = "Green all the way down to the roots, and loud with birds. Illiyana and I would race the deer from the shrine to the lake and back, and the Sentinels would pretend not to see us. The satyrs were only a story then, something old and far away." } },
      choices = {
        { text = "When did they come back?", next = "before2" },
        { text = "It sounds like a beautiful place.", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = { { id = "bf2_default", text = "Slowly, and then all at once, after the fires in the north and the demons in the far forest. They took the ruins at Xavian and Satyrnaar, and now they fill them with their laughter. Remember the forest as it was, kind one, so that someone does." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    wish = {
      lines = { { id = "ws_default", text = "Only that you look after Illiyana when I am gone, a little, from a distance. She will be angry and she will be reckless, and she will not want anyone's help. Help her anyway." } },
      choices = {
        { text = "I promise I'll look in on her.", next = "wish2" },
        { text = "She has the strength to carry this.", next = "wish2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wish2 = {
      lines = { { id = "ws2_default", text = "Thank you. She is stronger than she knows, and softer than she shows, and she will need someone to remind her of both. Tell her I said the deer were faster this spring, and she will know what I mean." } },
      choices = {
        { text = "I'm a druid. Your father's forest will remember you.", next = "BACK", reply = "Then I shall not be wholly gone. That is a sweet thing to hear at the end.", when = { class = "DRUID" } },
        { text = "I'll tell her. Something else.", next = "BACK" },
      },
    },
    w_place = {
      lines = {
        { id = "w_place_default", text = "A pool below the falls at Raynewood, where the light came down through the leaves in long green ribbons. Illiyana and I would lie on the stones there all afternoon and argue about which ribbon was the brightest, and she always won by cheating." },
      },
      choices = {
        { text = "How do you cheat at that?", next = "w_place2" },
        { text = "It sounds lovely.", next = "w_place2" },
      },
    },
    w_place2 = {
      lines = {
        { id = "w_place2_default", text = "By changing her answer whenever the sun moved, and then saying she had meant that one all along. Take her there, if you can, when this is over. Tell her to pick the brightest ribbon for me, and that I will not argue." },
      },
      choices = {
        { text = "I'll take her there.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Rest now, Anilia.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a daughter of Cenarius, and I kept his Branch. That is all I was, and it was enough." } },
    satyrs = { { id = "tp_sat", text = "They hate everything green. Do not listen when they speak, for they only speak to wound." } },
    _none = { { id = "tp_none", text = "I cannot think of that now, friend. Please, only the Branch." } },
  },
}
