-- Dolanaar's missed folk and the roads beyond: Aldia, Brannol Eaglemoon, Byancie, Dazalar, Melarith,
-- Narret Shadowgrove, Nyoma and Sinda in the village; Alanna Raveneye at the Oracle Glade; Huntress Nhemai
-- and Huntress Yaeliura on the Darnassus road with Moon Priestess Amara; Sentinel Shaya south of the village.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Aldia: general supplies in Dolanaar. (Forever: Soft Saber Pelts.)
P:NPC {
  key = "aldia", id = TODO_NPC("Aldia"), name = "Aldia", title = "General Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "quest",
  communities = { "dolanaar" }, temper = { "brisk", "friendly" }, values = { "practical", "thrifty" },
  notices = { "profession", "class" },
  impression = {
    first = "Aldia keeps Dolanaar's general store and knows what every traveller on the Darnassus road has run short of before they ask. She wastes nothing, and she has a use in mind for every pelt on the island.",
    third = "{name} met Aldia, who sells general supplies in Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. Dolanaar is the last shop before a long road in either direction, so look carefully." },
    { id = "g_pelts", when = { questActive = TODO_QUEST("Soft Saber Pelts") }, text = "Have the nightsabers given up their coats yet? I want the soft ones, mind, and not anything a boar has rolled on." },
    { id = "g_done", when = { questDone = TODO_QUEST("Soft Saber Pelts") }, text = "Those pelts are already cut and stitched, {class}, and half of Dolanaar has asked where I got them." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Dolanaar, I see. The road has emptied your pack or filled it, and I can help with either." },
  },
  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "You carry a skinning knife, and it has been kept sharp. I always have a use for someone who can bring a pelt in whole." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_pelts", when = { questActive = TODO_QUEST("Soft Saber Pelts") }, text = "The nightsabers along the road wear the softest fur on Teldrassil, and that is what I need from you. Bring the pelts to me clean and I will see that they are put to good use." },
        { id = "h_default", text = "I am Aldia, and I sell what a traveller needs between Shadowglen and Darnassus: satchels, water, and a good many small things besides. I also make use of whatever the forest can spare, which is more than most people think." },
      },
      again = {
        { id = "h_again", text = "What else can Dolanaar's shopkeeper do for you?" },
        { id = "h_again2", text = "Go on, I am only counting waterskins." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What do you want with saber pelts?", next = "pelts" },
        { text = "You see every traveller on this road.", next = "road" },
        { text = "What does the village need most?", next = "needs" },
        { text = "A skinner could keep you in pelts.", next = "skinner", when = { profession = "Skinning" } },
        { text = "Elune guide you, Aldia.", next = "END" },
      },
    },
    pelts = {
      lines = { { id = "p_default", text = "A nightsaber's winter coat is softer than anything a loom can make, and it lines a satchel or a bedroll better than cloth. The cats have grown far too many on this tree, so the taking of a few does the forest a kindness as well." } },
      choices = {
        { text = "Too many? Why is that?", next = "many" },
        { text = "Something else.", next = "BACK" },
      },
    },
    many = {
      lines = { { id = "m_default", text = "Ask the druids, and they will give you six answers and a frown. All I know is that everything on Teldrassil breeds faster than it ought, and that the hunters cannot keep pace with it.", fx = { learn = { "teldrassil" } } } },
      choices = { { text = "That is troubling. Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "r_default", text = "I do, and I can tell you who is on it by what they buy. Novices from Shadowglen want bags, Sentinels want bandages, and anyone bound for Starbreeze Village wants to be talked out of going." } },
      choices = {
        { text = "Why talk them out of Starbreeze?", next = "starbreeze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    starbreeze = {
      lines = { { id = "s_default", text = "Because the Gnarlpine hold it now, and the furbolgs there are not the gentle neighbours they once were. Athridas Bearmantle can tell you more, for he grieves over them as if they were his own kin.", fx = { learn = { "furbolgs" } } } },
      choices = { { text = "I will ask him. Something else.", next = "BACK" } },
    },
    needs = {
      lines = { { id = "n_default", text = "Hands, mostly, and steady ones. Half the village has a task it cannot leave its post to do, so if you are looking for work, walk from the inn to the moonwell and you will be stopped three times." } },
      choices = { { text = "Then I will take that walk.", next = "BACK" } },
    },
    skinner = {
      lines = { { id = "sk_default", text = "You could, and Radnaal Maneweaver would grumble that I was poaching his best students. Bring me what you cannot use yourself, and I will pay what any merchant would." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a trading post in Ashenvale once, a long while ago. Dolanaar is quieter, and the customers argue less." } },
    furbolgs = { { id = "tp_fur", text = "The Gnarlpine used to trade honey with us. Now they ambush the road, and nobody can tell me why." } },
    _none = { { id = "tp_none", text = "That is not on my shelves, I am afraid. Try Innkeeper Keldamyr, who hears everything twice." } },
  },
}

-- Brannol Eaglemoon: clothier in Dolanaar.
P:NPC {
  key = "brannol_eaglemoon", id = TODO_NPC("Brannol Eaglemoon"), name = "Brannol Eaglemoon", title = "Clothier", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "dolanaar" }, temper = { "mild", "thoughtful" }, values = { "craft", "patience" },
  notices = { "class" },
  impression = {
    first = "Brannol Eaglemoon sells cloth armor in Dolanaar and talks about thread the way druids talk about roots. He is a mild man who weaves slowly and would rather explain a stitch than hurry one.",
    third = "{name} met Brannol Eaglemoon, the clothier of Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have the look of someone whose robe has met a thorn bush and lost." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, {class}. I see the forest has been pulling at your sleeves again." },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "You wear cloth by calling and not by choice, I think. Then you will want it woven tight, for it is all that stands between you and a furbolg's claws." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brannol Eaglemoon, and I weave and sell cloth here in Dolanaar. It is quiet work, which suits me, though the Gnarlpine have lately given me more mending than I ever wished for." },
      },
      again = {
        { id = "h_again", text = "Was there something more?" },
        { id = "h_again2", text = "Ask on. The loom will wait, as it always does." },
      },
      choices = {
        { text = "Show me your cloth.", next = "BUSINESS" },
        { text = "The Gnarlpine bring you mending?", next = "mending" },
        { text = "Weaving seems an odd craft for a kaldorei man.", next = "odd" },
        { text = "Will cloth truly stop a claw?", next = "caster", when = { class = { "PRIEST", "MAGE", "WARLOCK" } } },
        { text = "Good day to you, Brannol.", next = "END" },
      },
    },
    mending = {
      lines = { { id = "m_default", text = "Every Sentinel who patrols toward Ban'ethil Hollow comes back with her cloak in ribbons. I sew them up and send them out again, and I have begun to recognise particular claws by the tears they leave." } },
      choices = {
        { text = "What do the tears tell you?", next = "tears" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tears = {
      lines = { { id = "t_default", text = "That the furbolgs strike wildly now, with no care for themselves, which is not how a furbolg fights when it is in its right mind. Something has soured them, and I hope Athridas finds the root of it soon.", fx = { learn = { "furbolgs" } } } },
      choices = { { text = "So do I. Something else.", next = "BACK" } },
    },
    odd = {
      lines = { { id = "o_default", text = "Most of our men walked the Dream for ten thousand years, and I am told I should have gone with them. I had no gift for it, so I stayed and learned a loom, and I find the waking world gives me quite enough to dream about.", fx = { learn = { "emerald_dream" } } } },
      choices = { { text = "No shame in that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    caster = {
      lines = { { id = "c_default", text = "It will not, and I will not pretend otherwise to someone who must wear it. It will turn rain, thorns and a glancing blow, and for anything worse you must rely on your spells and on standing somewhere else." } },
      choices = { { text = "Honest, at least. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept a loom in one village or another for a very long time. Dolanaar is the pleasantest of them." } },
    emerald_dream = { { id = "tp_dream", text = "The druids walk there, and many still sleep in the barrow dens. I know it only from what they tell me on waking." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend. Tallonkai Swiftroot hears most of what passes through Dolanaar." } },
  },
}

-- Byancie: first aid trainer in Dolanaar. (Forever: ends Camping 101: First Aid.)
P:NPC {
  key = "byancie", id = TODO_NPC("Byancie"), name = "Byancie", title = "First Aid Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "calm", "firm" }, values = { "merciful", "practical" },
  notices = { "weary", "class" },
  impression = {
    first = "Byancie teaches the binding of wounds in Dolanaar, with clean linen and no magic at all. She is calm in the way of someone who has seen a great deal of blood and decided not to be impressed by it.",
    third = "{name} met Byancie, who teaches first aid in Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Are you hurt, or have you come to learn how not to be?" },
    { id = "g_back", when = { metBefore = true }, text = "You are walking, and nothing is leaking, so my lessons have held. Welcome back." },
  },
  notice = {
    { id = "n_sick", cat = "weary", when = { resSick = true },
      text = "You have lately come back from the edge of death, and it shows in your colour. Sit a while, for no bandage of mine mends that, only rest." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: First Aid") },
          text = "Lyreena sent you to me about her camps, did she? Good, because a fire with no bandages beside it is only a warm place to bleed." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priestess of the moon need not always lean upon the Goddess, {class}. I am Byancie, and I teach what your own two hands can do when your prayers are spent." },
        { id = "h_default", text = "I am Byancie, and I teach the binding of wounds. The priestesses heal with Elune's grace and the druids with nature's, but linen and a steady hand ask nothing of anyone, and they are always with you." },
      },
      again = {
        { id = "h_again", text = "What else would you learn?" },
        { id = "h_again2", text = "Ask, and hold this roll of linen while you do." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Who do you bandage most in Dolanaar?", next = "who" },
        { text = "Why bandages, on an island full of healers?", next = "why" },
        { text = "What belongs in a camp's healing kit?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: First Aid") } },
        { text = "Be well, Byancie.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Sentinels, who will not stop patrolling for anything less than a broken leg. Shaya is the worst of them, and she is standing hurt at her post south of the village again while Laurna and I argue over whose turn it is to scold her." } },
      choices = {
        { text = "What keeps hurting them?", next = "hurting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurting = {
      lines = { { id = "hu_default", text = "The Gnarlpine, for the most part, and the spiders after them. A furbolg's claws leave a ragged wound that festers quickly, so I have learned to clean those first and ask how it happened afterwards.", fx = { learn = { "furbolgs" } } } },
      choices = { { text = "A hard lesson. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "y_default", text = "Because the healer is never standing where you fall. I have seen strong fighters die a hundred paces from a priestess for want of a strip of cloth, and I decided long ago that it would not happen to anyone I had taught." } },
      choices = { { text = "Then I am glad you teach. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "ca_default", text = "Clean linen, boiled water and somebody who knows how to use them. Lyreena builds a fine fire, and I see to it that those who sit by it are fit to walk on in the morning.", fx = { learn = { "camping" } } } },
      choices = { { text = "I will tell her so. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I bound wounds on Hyjal, when there were more wounded than healers. I have taught the craft ever since." } },
    camping = { { id = "tp_camp", text = "Lyreena teaches the fire. I teach what to do when someone falls into it." } },
    _none = { { id = "tp_none", text = "That is no wound I can dress. Ask Laurna Morninglight, or Athridas, who knows the island's troubles." } },
  },
}

-- Dazalar: hunter trainer in Dolanaar. Classic: the night elf Taming the Beast lessons.
P:NPC {
  key = "dazalar", id = TODO_NPC("Dazalar"), name = "Dazalar", title = "Hunter Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "dolanaar" }, temper = { "patient", "watchful" }, values = { "nature", "discipline" },
  notices = { "pet", "class" },
  impression = {
    first = "Dazalar trains Dolanaar's hunters and looks at the animal before he looks at its master. He speaks slowly, and he seems to think a beast's good opinion is the only one worth earning.",
    third = "{name} met Dazalar, the hunter trainer of Dolanaar, who teaches the taming of beasts.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Walk softly near me, for there is an owl overhead that has not made up its mind about you." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Ishnu-alah, hunter. Ayanna sent word of you from Shadowglen, and she does not praise lightly." },
    { id = "g_tame", when = { any = { { questActive = TODO_QUEST("Taming the Beast") }, { questActive = TODO_QUEST("The Hunter's Path") } } },
      text = "You come to be tested, and the beasts of Teldrassil will do the testing. I only hand you the rod and watch." },
    { id = "g_done", when = { questDone = TODO_QUEST("Training the Beast") }, text = "The hunter who went to Darnassus with a beast at heel. It gladdens me to see you both again." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The forest has been speaking of you, and not unkindly." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} stands easy beside you and watches my hands, not yours. That is trust, and you did not come by it cheaply." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_tame", when = { questActive = TODO_QUEST("Taming the Beast") }, text = "Take the taming rod and seek the beast I named. Hold its eye and do not strike it, for you are asking it to follow you, and no creature follows what it fears." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Dazalar, and when you are ready I will teach you the oldest part of our craft, which is the taming of a companion. The bow feeds a hunter, but the beast at her side is what makes her one of us." },
        { id = "h_default", text = "I am Dazalar, and I teach the hunters of Dolanaar. You do not walk our path, {class}, but you are welcome to ask about it, so long as you do not startle the owl." },
      },
      again = {
        { id = "h_again", text = "What else would you know of the hunt?" },
        { id = "h_again2", text = "Ask it quietly. We are being listened to from the branches." },
      },
      choices = {
        { text = "Train me, Dazalar.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How is a beast tamed?", next = "taming" },
        { text = "Which beasts of Teldrassil are worth taming?", next = "beasts" },
        { text = "The island's beasts seem restless.", next = "restless" },
        { text = "What comes after the taming?", next = "after", when = { class = "HUNTER" } },
        { text = "May your arrows fly true.", next = "END" },
      },
    },
    taming = {
      lines = { { id = "t_default", text = "You stand before it, unarmed in your heart, and you let it decide. The rod I lend only steadies your will; the beast must still look at you and find someone it would rather walk beside than fight." } },
      choices = {
        { text = "And if it decides against me?", next = "against" },
        { text = "Something else.", next = "BACK" },
      },
    },
    against = {
      lines = { { id = "a_default", text = "Then it will tell you with its claws, and you will learn something about yourself that I could not have taught you. Most students are refused once, and I think better of the ones who go back." } },
      choices = {
        { text = "I would go back.", next = "BACK", reply = "I believe you would. The stubborn ones make the best hunters, provided they also learn to listen.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "I send my students to three: a webwood lurker, a nightsaber stalker and a strigid screecher. The spider teaches patience, the cat teaches respect and the owl teaches you that some companions will always be cleverer than you." } },
      choices = {
        { text = "Which do you favor yourself?", next = "favor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    favor = {
      lines = { { id = "f_default", text = "The owl, though I would not say so in front of a nightsaber. A strigid sees the whole forest from above and tells you nothing unless you have earned it, and I have always admired that." } },
      choices = { { text = "A discerning bird. Something else.", next = "BACK" } },
    },
    restless = {
      lines = { { id = "r_default", text = "They are, and they have been since this tree was grown. The cats breed too quickly and the owls hunt by day, and when the beasts forget their own habits a hunter should ask what the land is trying to say.", fx = { learn = { "teldrassil" } } } },
      choices = { { text = "I will keep my ears open. Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "af_default", text = "Then you must learn to teach your companion, as it has taught you. Keldas here can begin that, and Jocaste in the Cenarion Enclave of Darnassus will show you the rest when I send you to her." } },
      choices = { { text = "I look forward to it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted the slopes of Hyjal before the tree there burned. Now I teach on a younger tree, and the lessons are the same." } },
    teldrassil = { { id = "tp_tel", text = "The beasts here are not at peace, and beasts do not lie. I leave the reasons to the druids." } },
    _none = { { id = "tp_none", text = "The forest has told me nothing of that. Ask Athridas Bearmantle, who listens to more than beasts." } },
  },
}

-- Melarith: a quiet resident of Dolanaar.
P:NPC {
  key = "melarith", id = TODO_NPC("Melarith"), name = "Melarith", gender = "male",
  bible = "bibles/missed.md", role = "villager", tier = "service",
  communities = { "dolanaar" }, temper = { "reflective", "gentle" }, values = { "peace", "memory" },
  notices = { "race", "travel" },
  impression = {
    first = "Melarith is a quiet man of Dolanaar who seems to have no trade but watching the road. He talks about the village as someone who remembers when there was no tree beneath it.",
    third = "{name} met Melarith, a quiet resident of Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. Sit a moment, if the road will allow it." },
    { id = "g_back", when = { metBefore = true }, text = "The road has brought you round again. I had wondered whether it would." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright over Dolanaar tonight. It is a good hour to be awake, and a better one for talking." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Your people live so briefly and travel so far. I have not gone a mile from this village in years, and I confess I envy you a little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Melarith, and I live here in Dolanaar, which is nearly all there is to say of me. I watch who comes down the road and who goes up it, and I find that is occupation enough for one who has already lived a long while." },
      },
      again = {
        { id = "h_again", text = "What else shall we speak of?" },
        { id = "h_again2", text = "I am in no hurry, as you may have gathered." },
      },
      choices = {
        { text = "What have you seen on the road lately?", next = "road" },
        { text = "You do not seem troubled by much.", next = "calm" },
        { text = "Where were you before Teldrassil?", next = "before" },
        { text = "Rest well, Melarith.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "More of the young than ever, coming up from Shadowglen with new weapons and old names. More Sentinels as well, riding toward Ban'ethil Hollow, and they come back slower than they went." } },
      choices = {
        { text = "What waits at Ban'ethil Hollow?", next = "hollow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hollow = {
      lines = { { id = "ho_default", text = "The Gnarlpine, and beneath them a barrow den where druids once slept in peace. I used to walk there in the evenings, and now I would not send a friend that way without a blade.", fx = { learn = { "furbolgs" } } } },
      choices = { { text = "I will go armed. Something else.", next = "BACK" } },
    },
    calm = {
      lines = { { id = "c_default", text = "I have been troubled enough for several lifetimes, and it mended nothing. These days I leave the worrying to Tallonkai, who is very good at it, and I keep the watching for myself." } },
      choices = { { text = "A fair division. Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "In the forests below Hyjal, in a village that the Legion's fires did not spare. Dolanaar is very like it, if you do not look down, and I have learned not to look down.", fx = { learn = { "burning_legion" } } } },
      choices = {
        { text = "I am sorry for what you lost.", next = "BACK", reply = "Thank you. It was long ago as you count such things, and only yesterday as I do.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am old, and I have settled here. There is no more to it than that, and I am content." } },
    teldrassil = { { id = "tp_tel", text = "It is a fine tree to live upon. I only wish I could forget how quickly it grew." } },
    _none = { { id = "tp_none", text = "That has not come down the road to me yet. Ask at the inn, where the news sleeps." } },
  },
}

-- Narret Shadowgrove: trade supplies in Dolanaar.
P:NPC {
  key = "narret_shadowgrove", id = TODO_NPC("Narret Shadowgrove"), name = "Narret Shadowgrove", title = "Trade Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "dolanaar" }, temper = { "orderly", "dry" }, values = { "craft", "thrifty" },
  notices = { "profession" },
  impression = {
    first = "Narret Shadowgrove sells thread, vials and tools to Dolanaar's craftsfolk, and keeps every one of them in a labelled place. He has a dry way of talking and a low opinion of anyone who borrows a needle.",
    third = "{name} met Narret Shadowgrove, who sells trade supplies in Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you have come for thread, say what colour before you touch anything." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {class}. I assume something has run out, since nobody visits me for my company." },
  },
  notice = {
    { id = "n_craft", cat = "profession", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Enchanting" } },
      text = "You have a craftsman's hands, stained and nicked in the right places. Then you already know that a trade is only as good as its supplies." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Narret Shadowgrove, and I supply the crafters of Dolanaar with everything they forget to make for themselves. Thread, vials, salt and dye all pass through my hands, and I can tell you precisely how much of each is left." },
      },
      again = {
        { id = "h_again", text = "What else? Put that vial back first." },
        { id = "h_again2", text = "Go on. I am listening and counting at once." },
      },
      choices = {
        { text = "Show me your trade goods.", next = "BUSINESS" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "Where do your goods come from?", next = "goods" },
        { text = "Any advice for a working crafter?", next = "advice", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Enchanting" } } },
        { text = "I will leave you to your counting.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Cyndra Kindwhisper buys vials by the crate for her alchemy, and Nadyia Maneweaver takes all the coarse thread I can get. Between the two of them I could close the shop to everyone else and scarcely notice." } },
      choices = {
        { text = "And your worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Anyone who says they will return a needle. In all my years I have lent eleven, and I am still waiting on nine of them, so I no longer lend." } },
      choices = { { text = "I will buy my own. Something else.", next = "BACK" } },
    },
    goods = {
      lines = { { id = "g_goods", text = "Up from Rut'theran by hippogryph, most of it, after a boat has carried it from Auberdine. Every hand between here and Darkshore takes its share, which is why a spool of thread costs what it does at the top of a tree." } },
      choices = { { text = "That explains the prices. Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Buy twice the thread you think you need and half the dye. Every apprentice does it the other way about, and then stands at my counter looking at a very bright, very unfinished garment." } },
      choices = { { text = "Noted, Narret. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept stores for crafters since before Darnassus had streets. Somebody must count the vials." } },
    _none = { { id = "tp_none", text = "I do not stock answers of that kind. Tallonkai Swiftroot may have one, if you can catch him standing still." } },
  },
}

-- Nyoma: cooking supplies in Dolanaar.
P:NPC {
  key = "nyoma", id = TODO_NPC("Nyoma"), name = "Nyoma", title = "Cooking Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "dolanaar" }, temper = { "cheerful", "generous" }, values = { "hospitable", "tradition" },
  notices = { "profession", "hunger" },
  impression = {
    first = "Nyoma sells spices and cooking wares in Dolanaar and keeps the village's recipes in her head, with strong views about each. She talks about food the way priestesses talk about the moon.",
    third = "{name} met Nyoma, who sells cooking supplies in Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah! Come and smell this, and tell me whether it wants more moonberry." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, {class}. I have a new spice in, and I have been waiting for someone to try it on." },
  },
  notice = {
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" },
      text = "You cook! I can always tell, because a cook looks at my spices before they look at me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nyoma, and I sell everything a kitchen needs, along with a few recipes I have collected over the years. Zarrin does the teaching in this village, and I see that his students have something worth putting in the pot." },
      },
      again = {
        { id = "h_again", text = "What else can I tempt you with?" },
        { id = "h_again2", text = "Ask, and stir this for me while you do." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What does Dolanaar like to eat?", next = "eat" },
        { text = "You and Zarrin must talk recipes.", next = "zarrin" },
        { text = "What should a travelling cook carry?", next = "cook", when = { profession = "Cooking" } },
        { text = "Until next time, Nyoma.", next = "END" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Stewed greens from the island's boughs, moonberries when they are in season, and spider on a skewer for those who can stop thinking about where it came from. I was doubtful of the spider myself, and now I ask for seconds." } },
      choices = {
        { text = "Spider? Truly?", next = "spider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spider = {
      lines = { { id = "s_default", text = "Truly, and the small webwood ones are the sweetest. Roast the legs over a low fire with a little spice, and you will forgive the creature for everything it did to you in the cave." } },
      choices = { { text = "I may try it. Something else.", next = "BACK" } },
    },
    zarrin = {
      lines = { { id = "z_default", text = "We argue recipes, which is better. He believes a dish is finished when the recipe says so, and I believe it is finished when it tastes right, and neither of us has given ground in a hundred years." } },
      choices = {
        { text = "I am with you. Taste decides.", next = "BACK", reply = "Ha! Say that loudly the next time you walk past him.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Salt, a mild spice and a pan you trust, and nothing more than that. Everything else the forest will hand you as you go, and a cook who carries the whole pantry never gets far enough to use it." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have cooked for this village since it was a handful of lanterns. A friend of mine among the Sisters in Darnassus still writes to ask for my recipes." } },
    _none = { { id = "tp_none", text = "Oh, that is nothing I could season. Ask Innkeeper Keldamyr, and bring me back the gossip." } },
  },
}

-- Sinda: leather armor in Dolanaar.
P:NPC {
  key = "sinda", id = TODO_NPC("Sinda"), name = "Sinda", title = "Leather Armor Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "dolanaar" }, temper = { "direct", "wry" }, values = { "craft", "nature" },
  notices = { "class", "form" },
  impression = {
    first = "Sinda sells leather armor in Dolanaar and tugs at every seam of it in front of the buyer to prove it will hold. She is wry about the druids, who are her best customers and wear her work least.",
    third = "{name} met Sinda, the leather armor merchant of Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Pull on that sleeve as hard as you like, because the furbolgs certainly will." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {class}, and the seams held, I see. I told you they would." },
  },
  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat" } },
      text = "Another druid in fur. I stitch you people the finest jerkins on Teldrassil, and you spend the whole day wearing your own hide instead." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Sinda, and I make leathers for druids like you, who buy them gladly and then turn into a bear the moment trouble comes. I keep making them anyway, since you must wear something on the way home." },
        { id = "h_default", text = "I am Sinda, and I sell leather armor to the scouts, hunters and druids of Dolanaar. It bends where you bend and it holds where it should, and I will stand behind every stitch." },
      },
      again = {
        { id = "h_again", text = "What more? I have a jerkin half sewn." },
        { id = "h_again2", text = "Ask on, then." },
      },
      choices = {
        { text = "Show me your leathers.", next = "BUSINESS" },
        { text = "Who makes what you sell?", next = "makes" },
        { text = "Is leather enough against the Gnarlpine?", next = "gnarlpine" },
        { text = "Does armor matter to a shapeshifter?", next = "druid", when = { class = "DRUID" } },
        { text = "Farewell, Sinda.", next = "END" },
      },
    },
    makes = {
      lines = { { id = "m_default", text = "I sew a good deal of it, and Nadyia Maneweaver makes the finer pieces at her house up the road. Radnaal Maneweaver brings in the hides, so between the three of us a nightsaber goes from the forest to your shoulders without leaving Dolanaar." } },
      choices = {
        { text = "A tidy arrangement.", next = "tidy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tidy = {
      lines = { { id = "t_default", text = "It is, and it means I know every hide I sell. If a seam of mine ever fails you, come and tell me which, because I will want to know whose knife to blame." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
    gnarlpine = {
      lines = { { id = "g_gnarl", text = "Against one of them, yes, and against an ambush of five, nothing is enough but a fast pair of legs. Leather will let you run, which is more than I can say for the mail Meri sells across the way." } },
      choices = { { text = "Then I will dress to run. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Kal tells me it does, in some fashion I do not pretend to follow, and that what you wear lends its strength to the shape you take. So buy well, and think of me kindly when you are a bear." } },
      choices = { { text = "I shall. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned leather from the scouts of Ashenvale. Dolanaar's hides are softer, and so are its customers." } },
    furbolgs = { { id = "tp_fur", text = "The Gnarlpine tear up good leather and wear it badly. Athridas says they were peaceful once, and I take his word for it." } },
    _none = { { id = "tp_none", text = "There is no seam of mine in that matter. Ask Athridas Bearmantle or the innkeeper." } },
  },
}

-- Alanna Raveneye: enchanting trainer at the Oracle Glade. (Forever: ends Camping 101: Enchanting.)
P:NPC {
  key = "alanna_raveneye", id = TODO_NPC("Alanna Raveneye"), name = "Alanna Raveneye", title = "Enchanting Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "teldrassil_wilds" }, temper = { "cool", "precise" }, values = { "knowledge", "caution" },
  notices = { "arcane", "profession" },
  impression = {
    first = "Alanna Raveneye teaches enchanting at the Oracle Glade, far from the villages, and prefers it that way. She handles magic like a healer handling poison, carefully and without any sign of fondness.",
    third = "{name} met Alanna Raveneye, the enchanting trainer of the Oracle Glade.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have come a long way to find me, so I will assume you have a reason." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the glade. Mind the harpies on your way out, for they have grown no gentler." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You carry the arcane openly, and you are not afraid of it. I would be easier in my mind if you were, a little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Enchanting") },
          text = "Lyreena's lessons have reached even the Oracle Glade, I see. Very well, I will show you what an enchanter can add to a camp, and it is less than you hope and more than nothing." },
        { id = "h_default", text = "I am Alanna Raveneye, and I teach enchanting to those who can be trusted with it. It is the one arcane craft our people still permit themselves, because it takes magic out of the world's small things and binds it somewhere useful." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak. The glade is quiet for the moment." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "Why teach so far from Dolanaar?", next = "far" },
        { text = "Our people distrust the arcane.", next = "arcane" },
        { text = "What can an enchanter do for a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Enchanting") } },
        { text = "Elune watch over this glade.", next = "END" },
      },
    },
    far = {
      lines = { { id = "f_default", text = "The Oracle Tree stands here, and old places hold their magic steadily, which makes my work cleaner. It also keeps my mistakes well away from anyone's house, and every enchanter makes a few." } },
      choices = {
        { text = "Is the glade safe for you?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Less than it was, since the Bloodfeather harpies began nesting in the hills above us. Sentinel Arynia Cloudsbreak keeps watch here and I am glad of her, because a harpy cares nothing for how delicate a formula is." } },
      choices = { { text = "I will speak with her. Something else.", next = "BACK" } },
    },
    arcane = {
      lines = { { id = "a_default", text = "With good cause, for the Highborne's hunger for it brought the Legion upon us and broke the world in two. I do not draw new power into Azeroth as they did; I only unmake what is already enchanted and use what is left.", fx = { learn = { "highborne" } } } },
      choices = {
        { text = "That is a narrow line to walk.", next = "BACK", reply = "It is, and I walk it with my eyes open. See that you do the same, if I teach you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "A small ward to keep the night's chill off and the flames steady, and no more than that. Tell Lyreena it will not keep out furbolgs, whatever she has been telling her students.", fx = { learn = { "camping" } } } },
      choices = { { text = "I will pass that on. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have studied enchantment since before the Sundering, and I have outlived everyone who was careless with it." } },
    highborne = { { id = "tp_high", text = "Azshara's favored servants, who loved magic more than their own people. Every student of mine learns their story first." } },
    camping = { { id = "tp_camp", text = "A ward for the fire is all I offer. Lyreena Duskblade teaches the rest in Dolanaar." } },
    _none = { { id = "tp_none", text = "That lies outside my study. Sentinel Arynia may know, or the druids in Dolanaar." } },
  },
}

-- Huntress Nhemai: rides the Darnassus road with Moon Priestess Amara and Huntress Yaeliura.
P:NPC {
  key = "huntress_nhemai", id = TODO_NPC("Huntress Nhemai"), name = "Huntress Nhemai", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "dolanaar" }, temper = { "sharp-eyed", "terse" }, values = { "dutiful", "vigilant" },
  notices = { "stealth", "class" },
  impression = {
    first = "Huntress Nhemai rides a nightsaber at Moon Priestess Amara's side and never once looked at me while we spoke. Her eyes stayed on the branches over the road, where the Gnarlpine like to wait.",
    third = "{name} met Huntress Nhemai, who guards the road to Darnassus with Moon Priestess Amara.",
  },
  greetings = {
    { id = "g_default", text = "Keep to the road, {class}, and keep moving. I am watching the trees, so forgive me if I do not turn." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The road has been quiet since you passed, and I intend to keep it so." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "You step lightly, but my saber smelled you from thirty paces. Do not try to creep past a huntress on her own road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Huntress Nhemai, and I ride with the Moon Priestess to keep this road open. The Gnarlpine drop from the boughs upon anyone walking alone, so I watch the boughs and Yaeliura watches the brush." },
      },
      again = {
        { id = "h_again", text = "Be quick, for we ride on shortly." },
        { id = "h_again2", text = "Ask, but I am still watching the trees." },
      },
      choices = {
        { text = "The priestess says you read the furbolgs well.", next = "read" },
        { text = "Where does that side path lead?", next = "path" },
        { text = "That is a fine nightsaber.", next = "saber" },
        { text = "Ride safely, huntress.", next = "END" },
      },
    },
    read = {
      lines = { { id = "r_default", text = "I only watched them long enough to see that they are afraid. A furbolg that ambushes from above and then flees is no warrior, and whatever has maddened the Gnarlpine has not made them brave.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "Afraid of what?", next = "afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = { { id = "a_default", text = "Of their own chieftain, I think, more than of us. Ursal the Mauler rules them with his claws, and the ones on this road look over their shoulders toward his den more often than they look at me." } },
      choices = { { text = "That is worth knowing. Something else.", next = "BACK" } },
    },
    path = {
      lines = { { id = "p_default", text = "North into the hills, to the den where Ursal the Mauler keeps his court. I would not walk it alone, and I would not walk it at all without telling the priestess first." } },
      choices = { { text = "I will remember. Something else.", next = "BACK" } },
    },
    saber = {
      lines = { { id = "s_default", text = "She is, and she hears an ambush before I see one. A huntress and her saber are raised together from the cub, so I trust her ears as I trust my own bow." } },
      choices = { { text = "A good partnership. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a huntress of the Sentinels, and I go where the Moon Priestess rides. There is little more to tell." } },
    furbolgs = { { id = "tp_fur", text = "The Gnarlpine watch this road from the branches. Look up as often as you look ahead." } },
    _none = { { id = "tp_none", text = "I watch a road, {class}, and know little else. Put your question to the Moon Priestess." } },
  },
}

-- Huntress Yaeliura: rides the Darnassus road with Moon Priestess Amara and Huntress Nhemai.
P:NPC {
  key = "huntress_yaeliura", id = TODO_NPC("Huntress Yaeliura"), name = "Huntress Yaeliura", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "dolanaar" }, temper = { "easy", "alert" }, values = { "dutiful", "loyal" },
  notices = { "pet", "class" },
  impression = {
    first = "Huntress Yaeliura rides the Darnassus road with Moon Priestess Amara, and she is the friendlier of the priestess's two guards, though her hand never leaves her bow. She keeps a tally of travellers seen safely past.",
    third = "{name} met Huntress Yaeliura, who guards the road to Darnassus with Moon Priestess Amara.",
  },
  greetings = {
    { id = "g_default", text = "Elune light your way, traveller. You are safe on this stretch, so long as we are on it." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again, {class}. That makes twice I have counted you safely by." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Hold {pet} close, if you would. My saber is courteous, but she does not share the road gladly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Huntress Yaeliura, and I ride with Moon Priestess Amara and Nhemai between Dolanaar and the gates of Darnassus. We see travellers through and send the Gnarlpine back into the trees, a dozen times a night." },
      },
      again = {
        { id = "h_again", text = "Anything more before we ride on?" },
        { id = "h_again2", text = "Speak, and walk with us a few paces if you like." },
      },
      choices = {
        { text = "How far is Darnassus from here?", next = "darnassus" },
        { text = "Your companion says very little.", next = "nhemai" },
        { text = "It must be dull, riding one road.", next = "dull" },
        { text = "Does a hunter's eye see this road differently?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Safe riding, huntress.", next = "END" },
      },
    },
    darnassus = {
      lines = { { id = "d_default", text = "Follow the stones west and you will see the gates before the moon has moved a hand's breadth. Do not leave the road for anything that calls to you from the trees, however much it sounds like someone in need." } },
      choices = {
        { text = "The furbolgs lure travellers?", next = "lure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lure = {
      lines = { { id = "l_default", text = "Not cleverly, but a branch shaken in the dark will draw the curious, and the curious are who they want. The priestess has us ride past every such place twice, and it has saved more than one novice." } },
      choices = { { text = "I will stay on the stones. Something else.", next = "BACK" } },
    },
    nhemai = {
      lines = { { id = "n_default", text = "Nhemai speaks when there is something to shoot at and at no other time, and I have ridden beside her long enough to find that restful. She has the best eyes of any huntress I know, so I do the talking and let her do the seeing." } },
      choices = { { text = "It seems to work. Something else.", next = "BACK" } },
    },
    dull = {
      lines = { { id = "du_default", text = "It was a peaceful road for a long time, and I would gladly have it dull again. A huntress who is bored is a huntress whose people are safe, and I have learned to pray for boredom." } },
      choices = { { text = "May you be bored soon. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It should, and if you look you will see claw marks high on the trunks where they climb. Read those as you would a deer trail, and you will know where the next ambush waits before it knows you." } },
      choices = { { text = "I see them now. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have served the Sentinels since I could draw a bow. The Moon Priestess asked for me by name, and I was proud to come." } },
    furbolgs = { { id = "tp_fur", text = "The Gnarlpine were our neighbours once. I take no joy in driving them off, but the road must stay open." } },
    _none = { { id = "tp_none", text = "I could not say, friend. Ask Moon Priestess Amara, who knows far more than her huntresses." } },
  },
}

-- Sentinel Shaya: wounded on her patrol south of Dolanaar. Classic: the priest lesson Garments of the Moon.
P:NPC {
  key = "sentinel_shaya", id = TODO_NPC("Sentinel Shaya"), name = "Sentinel Shaya", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "dolanaar" }, temper = { "stubborn", "proud" }, values = { "dutiful", "tough" },
  notices = { "class", "priest" },
  impression = {
    first = "Sentinel Shaya holds her post south of Dolanaar with one arm bound up and no intention of leaving it. She took being wounded as an insult, and being fussed over as a worse one.",
    third = "{name} met Sentinel Shaya, a wounded Sentinel who would not leave her patrol south of Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Hold there, {class}. This path is watched, even if the watcher is bleeding on it." },
    { id = "g_garments", when = { questActive = TODO_QUEST("Garments of the Moon") }, text = "Laurna sent you, and I can guess why. Very well, priest, do what you came to do, and be quick about it." },
    { id = "g_done", when = { questDone = TODO_QUEST("Garments of the Moon") }, text = "My healer returns. The arm is sound and the patrol is walked, and I have you to thank for both." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I am still here, and no, I have not gone back to the village." },
  },
  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "You wear the look of the Sisterhood. I suppose you will tell me to rest, as Laurna does, and I will tell you what I told her." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_garments", when = { questActive = TODO_QUEST("Garments of the Moon") }, text = "I am Sentinel Shaya, and I am told you are to mend me and bless me before I am allowed to be useful again. I will hold still, which is more than I have done for anyone this season." },
        { id = "h_default", text = "I am Sentinel Shaya, and this stretch south of Dolanaar is mine to patrol. The Gnarlpine opened my arm two nights ago, and I have been explaining ever since that one arm is enough to hold a glaive." },
      },
      again = {
        { id = "h_again", text = "What else? I have a patrol to finish." },
        { id = "h_again2", text = "Ask, and do not look at the bandage." },
      },
      choices = {
        { text = "How were you wounded?", next = "wound" },
        { text = "You ought to be resting in Dolanaar.", next = "rest" },
        { text = "What do you guard out here?", next = "guard" },
        { text = "Elune's grace will see you mended.", next = "priest", when = { class = "PRIEST" } },
        { text = "Hold your post, Sentinel.", next = "END" },
      },
    },
    wound = {
      lines = { { id = "w_default", text = "Three Gnarlpine came out of the brush at once, and I was watching the fourth. They did not fight as furbolgs used to, with warning and bluster, but all in a rush as though something were driving them.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "What became of the four?", next = "four" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four = {
      lines = { { id = "f_default", text = "Two will not trouble the road again, and two ran toward Ban'ethil Hollow with my blood on their claws. I mean to be standing here when they come back for the rest of me." } },
      choices = { { text = "I believe you will be. Something else.", next = "BACK" } },
    },
    rest = {
      lines = { { id = "r_default", text = "So Laurna says, and Byancie, and my captain, and now you. If I lie down in the inn, there is a gap in the watch as wide as I am, and the Gnarlpine find gaps faster than water does.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "Then stand, but let someone tend the arm.", next = "BACK", reply = "That I can agree to, provided they tend it here. I will not be carried anywhere." },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = { { id = "g_guard", text = "The south approach to the village and the path down toward Lake Al'Ameth. Novices wander that way after timberlings and forget what else lives in the brush, so somebody has to stand between them and it." } },
      choices = { { text = "They are fortunate. Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "I do not doubt it, and I have never refused the Goddess's gifts, only the bed that the priestesses want to go with them. Heal what you can where I stand, and I will thank you and Elune both." } },
      choices = { { text = "Where you stand, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have been a Sentinel for longer than this tree has stood. I have been wounded worse, and I walked those off too." } },
    sentinels = { { id = "tp_sen", text = "We hold the watch so that others may sleep. A Sentinel who leaves her post has stopped being one." } },
    _none = { { id = "tp_none", text = "That is beyond my patrol. Take it to Athridas Bearmantle in the village." } },
  },
}
