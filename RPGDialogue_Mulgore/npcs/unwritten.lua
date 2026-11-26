-- Mulgore folk the roster scan found unwritten: Antur Fallow at the edge of Red Cloud Mesa, the Minor
-- Manifestation of Earth that answers shaman on the Call of Earth, and two Darkmoon Faire hands seen
-- when the Faire camps in Mulgore: Rinling, who runs the shooting gallery and buys engineering parts,
-- and Stamp Thunderhorn, who cooks for the crowds.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Antur Fallow: young tauren on her Rite of Strength, with her father's furs still undelivered.
---------------------------------------------------------------------------
P:NPC {
  key = "mul_antur_fallow", id = TODO_NPC("Antur Fallow"), name = "Antur Fallow", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "camp_narache" }, temper = { "earnest" }, values = { "family", "tradition" },
  notices = { "race", "level" },
  impression = {
    first = "A young tauren sits on a bundle of furs where the trail leaves Red Cloud Mesa, a spear across her knees. She looks from the bundle to the trail and back, as if one of them might decide for her.",
    third = "{name} met Antur Fallow, a young tauren torn between her Rite of Strength and her father's errand.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, traveller. Are you heading down to Bloodhoof Village, by any chance?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I hoped you would, though I did not like to say so." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Antur Fallow, and I am on my Rite of Strength, or I should be. My father asked me to carry these furs to Bloodhoof Village, and I cannot do both before the sun sets." },
        { id = "h_q", when = { questActive = TODO_QUEST("A Task Unfinished") }, text = "You have the furs? Then my father's trade is in good hands, and I can go and prove myself without shame." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Task Unfinished") }, text = "My father sent word that the furs arrived. I owe you more thanks than I know how to give, so I will give you all of it." },
      },
      again = {
        { id = "h_again", text = "Is there something more? I should be going soon." },
        { id = "h_again2", text = "Ask, if you like. The trail will wait a little." },
      },
      choices = {
        { text = "What is your Rite of Strength?", next = "rite" },
        { text = "Tell me about your father.", next = "father" },
        { text = "Why not do one, then the other?", next = "choose" },
        { text = "I walked the Rite myself, not long ago.", next = "tauren", when = { race = "Tauren" } },
        { text = "What will you do after the Rite?", next = "yafter" },
        { text = "Do you have friends at Narache?", next = "yfriends" },
        { text = "Good luck, Antur.", next = "END" },
      },
    },
    rite = {
      lines = { { id = "r_default", text = "Every young brave of Camp Narache must prove they can stand on their own before the tribe calls them grown. Grull Hawkwind sends us against the quilboar and the plains beasts, and we come back changed, or we do not come back.", fx = { learn = { "rite_of_strength" } } } },
      choices = {
        { text = "Are you afraid?", next = "afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = { { id = "a_default", text = "A little, of the Battleboar and of failing. Grull says fear is only the Earth Mother reminding us we are small, and that a brave listens to it without obeying it." } },
      choices = {
        { text = "Then the Rite matters more than the furs.", next = "afraid_end", fx = { align = { order = -1 } } },
        { text = "A promise to family comes before any rite.", next = "afraid_end", fx = { align = { order = 1 } } },
      },
    },
    afraid_end = {
      lines = { { id = "ae_default", text = "Perhaps you are right. I only know that I will be ashamed either way, unless someone helps me carry the load." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    father = {
      lines = { { id = "f_default", text = "He is a trader of furs, and a good one, though he talks to his hides more than to his daughter. Bloodhoof Village needs them before the cold nights come down off the mesas." } },
      choices = { { text = "He'll understand if you choose the Rite.", next = "BACK", reply = "He would say so. He would also sulk for a moon. That is my father." } },
    },
    choose = {
      lines = { { id = "c_default", text = "The elders say the Rite begins at dawn and does not wait for anyone's errands. And my father says the trader in Bloodhoof does not wait either, so I am caught between two stubborn old bulls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "Then you know how it feels, standing at the edge of the mesa with the whole of Mulgore below you. Tell me it ends well, even if it is a lie." } },
      choices = { { text = "It ends well. Go and see.", next = "BACK", fx = { affinity = 1 } } },
    },
  
    yafter = {
      lines = {
        { id = "yanturf_yafter_d", text = "Walk the plains for a season, I hope, the way my mother did, before I decide whether to hunt or to trade. My father wants a trader. I think I want to be a hunter, but I have never told him so." },
      },
      choices = {
        { text = "Why haven't you told him?", next = "ytell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytell = {
      lines = {
        { id = "yanturf_ytell_d", text = "Because he would be quiet, the way he gets when he is hurt, and talk to his furs for a week. He has carried the trade alone since my mother died. I am afraid that if I leave it, I leave him too." },
      },
      choices = {
        { text = "Tell him. A daughter's path is her own.", next = "BACK", reply = "Perhaps you are right. I will tell him after the Rite, when I am brave enough.", fx = { align = { honor = 1 } } },
        { text = "Your father needs you. The trade is family.", next = "BACK", reply = "That is what I tell myself each night. It sounds truer when you say it.", fx = { align = { honor = -1 } } },
      },
    },
    yfriends = {
      lines = {
        { id = "yanturf_yfriends_d", text = "A few. Tarak, who boasts, and Mira, who never says a word but always hits the target. They have both finished their Rites already, and they wait to see if I will finish mine." },
        { id = "yanturf_yfriends_v0", when = { race = "Tauren" }, text = "A few, as you will have had at your own camp. Tarak boasts and Mira never speaks but always hits the target. They have finished their Rites, and they wait for me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rite_of_strength = { { id = "yanturf_tp_rite_of_strength", text = "The Rite of Strength is how Narache knows a calf is ready. Grull Hawkwind decides who passes." } },
    furs = { { id = "yanturf_tp_furs", text = "My father's furs are fine work, plainstrider and cougar. The trader in Bloodhoof pays well for them." } },
  },
}

---------------------------------------------------------------------------
-- Minor Manifestation of Earth: elemental that tests shaman on the Call of Earth.
---------------------------------------------------------------------------
P:NPC {
  key = "mul_minor_manifestation_of_earth", id = TODO_NPC("Minor Manifestation of Earth"), name = "Minor Manifestation of Earth",
  role = "citizen", tier = "service",
  communities = {}, temper = { "slow" }, values = { "balance" },
  impression = {
    first = "Stones grind together and rise into a shape no taller than a tauren calf. It looks at you the way a hill looks at weather.",
    third = "{name} met a Minor Manifestation of Earth on the Call of Earth.",
  },
  greetings = {
    { id = "g_default", text = "You called. The earth heard. Now the earth asks why." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am a small piece of a very old thing. The young shaman call me to learn whether the stone will listen to them, and some days I listen." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "You carry the totem of earth, or you soon will. Then hear me well, for the stone does not repeat itself." },
      },
      again = { { id = "h_again", text = "Ask. Stone is patient, but not forever." } },
      choices = {
        { text = "What does the earth want of a shaman?", next = "want" },
        { text = "Why are you so small?", next = "small" },
        { text = "How old are you?", next = "xold" },
        { text = "Do you remember the world before the tauren?", next = "xbefore" },
        { text = "I call on the earth too.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "What do you feel beneath Mulgore?", next = "yfeel" },
        { text = "Do other elements speak to you?", next = "yothers" },
        { text = "I am no shaman. Will you speak to me?", next = "BACK", when = { class = { "WARRIOR", "HUNTER", "DRUID" } }, reply = "Stone speaks to anything that stands on it. You stand, so I speak, a little." },
        { text = "Return to the stone.", next = "END" },
      },
    },
    want = {
      lines = { { id = "w_default", text = "Respect, and the same patience it gives you. A shaman who asks the ground for strength must be ready to stand still when it answers." } },
      choices = { { text = "I'll remember.", next = "BACK" } },
    },
    small = {
      lines = { { id = "s_default", text = "All mountains are small at first. You are small too, and still you came to test me." } },
      choices = { { text = "Fair point.", next = "BACK" } },
    },
    xold = {
      lines = {
        { id = "x_xold", text = "As old as the mountain, and as young as this morning, for you called me this morning. Stone does not count years, only weight." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbefore = {
      narr = "Pebbles slide off its shoulders and click softly against the ground.",
      lines = {
        { id = "x_xbefore", text = "I remember the world before it broke, when this was one land and the sea was far. The stone remembers the shaking, and it does not wish to shake again." },
      },
      choices = {
        { text = "Could it break again?", next = "xbreak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbreak = {
      lines = {
        { id = "x_xbreak", text = "Everything can break, little mortal, if it is pushed hard enough. Some of your kind dig deep and take much, and others leave the stone alone." },
      },
      choices = {
        { text = "We should take only what we need from the earth.", next = "BACK", reply = "The stone hears you, and it is quieter for it.", fx = { align = { light = 1 } } },
        { text = "The earth is there to be used.", next = "BACK", reply = "Then use it, and see what it remembers of you.", fx = { align = { light = -1 } } },
      },
    },
    xshaman = {
      lines = {
        { id = "x_xshaman", text = "I know, and I feel it in you, a small warmth like a stone in summer sun. Speak to us with patience and we will answer, slowly, but surely." },
      },
      choices = {
        { text = "I'll be patient.", next = "BACK", reply = "Good. Patience is the earth's only lesson.", fx = { affinity = 1 } },
      },
    },
  
    yfeel = {
      narr = "*The stones of its body settle, as though it were leaning closer to the ground.*",
      lines = {
        { id = "yminorm_yfeel_d", text = "Roots, deep and old, and water moving slowly through the dark. And to the west, a scraping. Small hands with iron tools, digging where the stone did not ask to be opened." },
      },
      choices = {
        { text = "The dwarves at the digsite?", next = "ydig" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydig = {
      lines = {
        { id = "yminorm_ydig_d", text = "I do not know their names. Names are a thing of the quick. I know only that they dig for something buried long ago, and that the stone around it is uneasy. Some burdens are buried for a reason." },
      },
      choices = {
        { text = "Then they must be stopped before they wake it.", next = "BACK", reply = "Stone agrees. Tell the tall ones in the village, and they may listen.", fx = { align = { order = 1 } } },
        { text = "Perhaps what's buried should be studied, not hidden.", next = "BACK", reply = "Stone does not study. Stone remembers. Be careful what you dig toward, little mortal.", fx = { align = { order = -1 } } },
      },
    },
    yothers = {
      lines = {
        { id = "yminorm_yothers_d", text = "Fire is loud, and water is restless, and air never stays to finish a sentence. We are not friends, the elements. But we are old, and we remember when the world was whole, and that is a kind of kinship." },
        { id = "yminorm_yothers_v0", when = { class = "SHAMAN" }, text = "Fire is loud, water restless, air never finishes. You will meet them all, young shaman, and each will test you differently. Stone tests patience. The others are less kind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mulgore = { { id = "yminorm_tp_mulgore", text = "This land is soft on top and hard beneath. The tauren walk softly on it, which the stone appreciates." } },
    patience = { { id = "yminorm_tp_patience", text = "Patience is the first thing stone teaches, and the last thing most mortals learn." } },

    earth = { { id = "tp_xearth", text = "The earth is the mother of all things. I am only a small piece of her." } },
  },
}

---------------------------------------------------------------------------
-- Rinling: sand troll who runs the Darkmoon Faire shooting gallery and buys engineering parts.
---------------------------------------------------------------------------
P:NPC {
  key = "mul_rinling", id = TODO_NPC("Rinling"), name = "Rinling", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "darkmoon_faire" }, temper = { "cheerful" }, values = { "fun", "craft" },
  notices = { "profession" },
  impression = {
    first = "A wiry troll in a striped Darkmoon vest grins from behind a rack of targets and odd contraptions. Every few moments he fiddles with a gear on the counter.",
    third = "{name} met Rinling, the troll who runs the Darkmoon Faire's shooting gallery.",
  },
  greetings = {
    { id = "g_default", text = "Step up, step up, mon! The Faire be in town, and Rinling wants to see you smile." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You got a good eye, or you just like losin' to targets?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rinling, keeper of the gallery and collector of clever bits. The Faire sets up in Mulgore for a while, and the tauren be the best shots I ever lost money to." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "You smell of oil and gunpowder, mon! An engineer! Rinling always has work for a tinkerer." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Keep smilin'." },
        { id = "h_again2", text = "Anything more? The targets ain't goin' anywhere." },
      },
      choices = {
        { text = "Why do you buy engineering parts?", next = "parts" },
        { text = "Why must I keep smiling?", next = "smile" },
        { text = "How did a troll join the Faire?", next = "faire" },
        { text = "I've brought you some gizmos.", next = "gizmo", when = { profession = "Engineering" } },
        { text = "How long have you been with the Faire?", next = "xlong" },
        { text = "What's the best prize you've seen?", next = "xprize" },
        { text = "A Darkspear in the Faire? Where's home?", next = "xhome", when = { race = "Troll" } },
        { text = "Maybe later.", next = "END" },
      },
    },
    parts = {
      lines = { { id = "p_default", text = "Modulators, gizmos, repair kits, whatever you make. Silas wants the gallery to spin and whistle and explode just a little, and I can't build what I don't have." } },
      choices = {
        { text = "Explode just a little?", next = "explode" },
        { text = "Something else.", next = "BACK" },
      },
    },
    explode = {
      lines = { { id = "e_default", text = "A little bang makes the crowd cheer, mon. A big bang makes Silas very unhappy and Rinling very scorched, so we be careful with the measures." } },
      choices = { { text = "Wise. Something else.", next = "BACK" } },
    },
    smile = {
      lines = { { id = "s_default", text = "Because that be the job, and Silas Darkmoon pays for it. A sad customer don't come back, and a customer who don't come back don't buy more tickets." } },
      choices = {
        { text = "The Faire's a fine thing for weary folk.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Faire's just a pretty way to take coin.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    faire = {
      lines = { { id = "f_default", text = "The Faire found me selling scraps in Tanaris and said I could see the whole world. I see a lot of tents, mon, but they be in different places every month, so I count that as the world." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gizmo = {
      lines = { { id = "gizmo_default", text = "Bring them over and I'll trade you Faire tickets for each one that whirrs. Rinling don't pay for things that just sit there looking sad." } },
      choices = { { text = "Deal.", next = "BACK", fx = { affinity = 1 } } },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Six years, mon, since Silas Darkmoon found me cheatin' at dice on a dock in Booty Bay. He said a troll who cheats dat well should be runnin' de games instead of losin' dem." },
      },
      choices = {
        { text = "Do you still cheat?", next = "xcheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcheat = {
      lines = {
        { id = "x_xcheat", text = "Never at me own gallery, mon, Silas would have me ears. But a little edge here and dere, dat be how de Faire stay alive on de road." },
      },
      choices = {
        { text = "A fair game should be fair. No edges.", next = "BACK", reply = "You sound like Silas, and he be a very boring man about rules.", fx = { align = { honor = 1 } } },
        { text = "A little edge never hurt anyone.", next = "BACK", reply = "Ha! You be a Faire person at heart, I see it.", fx = { align = { honor = -1 } } },
      },
    },
    xprize = {
      narr = "He grins and spins a gear across his knuckles.",
      lines = {
        { id = "x_xprize", text = "A clockwork bird dat sang every song from Stormwind to Orgrimmar, made by a gnome who wanted to see if it would work. It did, too well, and it never stop singin' until somebody threw it in a lake." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhome = {
      lines = {
        { id = "x_xhome", text = "Echo Isles, mon, before Zalazane went mad. I left young, and now I live on de wagon, and home be wherever de tents go up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_xdarkmoon_faire", text = "De Darkmoon Faire go everywhere and stay nowhere. Dat suit a troll like me." } },
    silas = { { id = "tp_xsilas", text = "Silas Darkmoon run de Faire. He know everyt'ing, and he say nothin'." } },
  },
}

---------------------------------------------------------------------------
-- Stamp Thunderhorn: tauren food vendor with the Darkmoon Faire.
---------------------------------------------------------------------------
P:NPC {
  key = "mul_stamp_thunderhorn", id = TODO_NPC("Stamp Thunderhorn"), name = "Stamp Thunderhorn", title = "Food Vendor", gender = "male",
  role = "vendor", tier = "service",
  communities = { "darkmoon_faire" }, temper = { "jovial" }, values = { "hospitality" },
  impression = {
    first = "A broad tauren in an apron stands behind a smoking grill at the Darkmoon Faire, turning skewers with his bare fingers. The smell drifts halfway across the fairground.",
    third = "{name} met Stamp Thunderhorn, the Darkmoon Faire's tauren cook.",
  },
  greetings = {
    { id = "g_default", text = "Come and eat, friend. Nobody enjoys the Faire on an empty belly." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again already? Good. The grill is hot." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Stamp Thunderhorn, and I feed the Faire wherever it goes. When we camp in Mulgore I cook as my grandmother did, and everyone eats twice." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of Mulgore at my grill! Sit, and I will give you a taste of home before the Faire takes me away again." },
      },
      again = { { id = "h_again", text = "What else? The skewers will burn if I talk too long." } },
      choices = {
        { text = "What's on the grill?", next = "food" },
        { text = "A tauren who travels with the Faire?", next = "travel" },
        { text = "Tell me about your grandmother.", next = "xgran" },
        { text = "What do you think of the Faire's folk?", next = "xfolk" },
        { text = "Do you ever cook kodo?", next = "xkodo", when = { race = "Tauren" } },
        { text = "What's the strangest thing you've eaten?", next = "ystrange" },
        { text = "Does the Faire ever go hungry?", next = "yhungry" },
        { text = "Give me something to eat.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Kodo skewers, crunchy frog for the brave, and fried fish when the Faire is near water. The frog sounds strange, but the children always come back for more." } },
      choices = { { text = "I'll take the frog.", next = "BACK", reply = "A brave choice! Mind the legs." } },
    },
    travel = {
      lines = { { id = "t_default", text = "The Thunderhorn have always followed the herds, so the Faire is only a herd with more tents. I see the world, I feed it, and I come home to Mulgore every season." } },
      choices = { { text = "A good life.", next = "BACK" } },
    },
    xgran = {
      lines = {
        { id = "x_xgran", text = "She cooked for the whole Thunderhorn tribe when we still wandered the Barrens, over a fire built in a pit dug with her own hooves. Every dish I make is a memory of her hands." },
      },
      choices = {
        { text = "Why didn't you stay in Mulgore?", next = "xstay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = {
        { id = "x_xstay", text = "Because the world is big, and I wanted to see what everyone else eats. In Stormwind I ate fish pie, in Booty Bay I ate something I will not name, and I came home to plains bread." },
      },
      choices = {
        { text = "Should tauren travel so far?", next = "xfar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfar = {
      lines = {
        { id = "x_xfar", text = "My elders say a tauren belongs with the herd, and I should come home for good. I say the Earth Mother made the whole world, not only Mulgore." },
      },
      choices = {
        { text = "The world is worth seeing. Keep travelling.", next = "BACK", reply = "My stomach and I both agree with you.", fx = { align = { order = -1 } } },
        { text = "Your herd needs you. Come home someday.", next = "BACK", reply = "Someday, perhaps, when my hooves are tired.", fx = { align = { order = 1 } } },
      },
    },
    xfolk = {
      narr = "He flips a skewer with his bare fingers and doesn't flinch.",
      lines = {
        { id = "x_xfolk", text = "Strange and kind and a little crooked, like good bread. Silas pays fairly, the gnomes are clever, and the trolls make the Faire laugh." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xkodo = {
      lines = {
        { id = "x_xkodo", text = "Never, cousin, and I would not serve it to anyone. The kodo carried our tribes across the Barrens, and I will not repay them that way." },
      },
      choices = {
        { text = "Good.", next = "BACK", reply = "Earth Mother bless you for asking." },
      },
    },
  
    ystrange = {
      lines = {
        { id = "ystampt_ystrange_d", text = "In Booty Bay, a goblin sold me a stew he swore was turtle. It had too many legs for a turtle. I ate it anyway, because a cook must know what the world tastes like, and I was ill for three days." },
        { id = "ystampt_ystrange_v0", when = { race = "Goblin" }, text = "In Booty Bay, one of your kin sold me a stew he swore was turtle. It had too many legs. I was ill three days, and I still respect his salesmanship." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhungry = {
      lines = {
        { id = "ystampt_yhungry_d", text = "Once, crossing the Barrens in a dry season. The supply wagon broke an axle, and we were two days from water. I cooked what we had, and gave the children the most. Silas told me later that some of the carnies grumbled." },
      },
      choices = {
        { text = "Did you do right?", next = "yright" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yright = {
      lines = {
        { id = "ystampt_yright_d", text = "I think so. But a carnie who cannot work is a Faire that cannot pay, and Silas reminded me of that very politely. My grandmother would have fed the children first. Silas would have fed the workers." },
      },
      choices = {
        { text = "Feed the children first. Always.", next = "BACK", reply = "My grandmother would agree with you, and so do I. Silas forgave me in the end.", fx = { align = { light = 1 } } },
        { text = "Silas has a point. The workers keep everyone alive.", next = "BACK", reply = "Perhaps. A cook must think of tomorrow's meal as well as today's.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    silas = { { id = "ystampt_tp_silas", text = "Silas Darkmoon pays fairly and asks no questions. I like him, though I do not always understand him." } },
    kodo = { { id = "ystampt_tp_kodo", text = "I will never cook kodo. The kodo carried my grandmother's tents across the Barrens." } },

    darkmoon_faire = { { id = "tp_xdarkmoon_faire", text = "The Faire comes to Mulgore every few months. I cook twice as much when it does." } },
  },
}

-- Elder Bloodhoof: an ancestor spirit honoured during the Lunar Festival. He stands in Bloodhoof Village, among the tents of the tribe that bears his name.
P:NPC {
  key = "mul_elder_bloodhoof", id = 15575, name = "Elder Bloodhoof", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A grey-horned spirit who smells faintly of kodo smoke.",
    third = "{name} paid respects to Elder Bloodhoof, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "The moon is full on the new year, young one, and the old ones walk among the tents again. Come, stand with me a while." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come round again, and the ancestors are near tonight. I am glad you came to honor them." },
    { id = "g_back", when = { metBefore = true }, text = "You return to an old bull's fire. The Earth Mother smiles on those who remember twice." },
    { id = "g_done", when = { questDone = TODO_QUEST("Bloodhoof the Elder") }, text = "You have honoured me already, and the coin of my line goes with you. Carry it gently." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "Tauren" }, text = "You wear the horns of the plains, child. Your grandmothers would know my face, even if you do not." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "The elder's outline wavers like heat over the grass, then settles.",
      lines = { { id = "h_default", text = "I am Elder Bloodhoof, and I hunted these plains when Bloodhoof Village was a ring of tents and a cookfire. Each year at the Lunar Festival the living remember us, and so we come back to be remembered." } },
      again = { { id = "h_again", text = "Ask what you will, young one. The night is long, and I am in no hurry." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "My family were Bloodhoof too, Elder.", next = "kin", when = { race = "Tauren" } },
        { text = "Tell me something no one remembers.", next = "ymem" },
        { text = "Should the elders be remembered forever?", next = "yforget" },
        { text = "What happens when the festival ends?", next = "ymoon" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I was a hunter of the tribe, long before Cairne led us out of the Barrens and into Mulgore. I followed the kodo herds and the thunder, and I buried more friends than I like to count when the centaur came riding." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "The memory of the living holds me, and nothing more. While a calf of this village can say my name, I am not gone, and that is the oldest promise our people make to one another." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Then you understand the tauren better than most who visit us. Remembering is a kind of hunting, and you must keep at it.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "And so they do, but even a young bull walks on ground his fathers cleared. Rest a moment in that thought.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "Once a year the moon brings the new year, and the living honour those who came before them, with lanterns and fireworks and too much food. The elders of every race walk again for the length of it, and the Earth Mother allows it." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is where the druids keep the Lunar Festival, and Elune's light is strongest there on the night of the turning. The night elves say she welcomes all the elders home, and the tauren say the Earth Mother and the moon are old friends." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Then I take your respect and I give you the coin of my line, as the old custom asks. Spend it at the festival, or keep it, but do not forget whose fire you stood beside." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then you are my kin many times over, and I am glad to see the line still runs strong. Tell your grandchildren that an old hunter stood here, and that he was proud." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  
    ymem = {
      lines = {
        { id = "yelderb_ymem_d", text = "I hunted with a brother who could call the kodo by name. He fell to the centaur on the long walk out of the Barrens, and I carried his horn the rest of the way." },
        { id = "yelderb_ymem_v0", when = { race = "Tauren" }, text = "I hunted with a brother who could call the kodo by name. You carry the same blood, child, so carry the memory for me as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yforget = {
      lines = {
        { id = "yelderb_yforget_d", text = "Some of the living say we elders should be forgotten, so the young can walk without our shadows. Others say forgetting is how a people loses itself." },
      },
      choices = {
        { text = "Remember them. The elders guide the living.", next = "BACK", reply = "Then I will stay a while longer, and gladly. Thank you, child.", fx = { align = { light = 1 } } },
        { text = "Let the dead go. The young need room to grow.", next = "BACK", reply = "Perhaps. But even a young tree drinks from old roots.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymoon = {
      lines = {
        { id = "yelderb_ymoon_d", text = "When the festival ends, the elders go back to the quiet. We do not sleep, exactly, but we wait, the way the earth waits through winter. Each year I wonder if anyone will come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "yelderb_tp_centaur", text = "The centaur hunted us across the Barrens for generations. I remember their arrows better than I remember my own children's faces, and that grieves me." } },
    cairne = { { id = "yelderb_tp_cairne", text = "Cairne is a good chieftain, the best of my line. I watch over his village with pride." } },

    _none = { { id = "tp_none", text = "That is a question for the living, young one. I only remember the plains as they were." } },
  },
}

-- Elder Dreamseer: an ancestor spirit honoured during the Lunar Festival. In Classic he keeps his vigil in Gadgetzan, Tanaris, far from the plains.
P:NPC {
  key = "mul_elder_dreamseer", id = 15586, name = "Elder Dreamseer", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "His eyes are half shut, as if he is listening to something far away.",
    third = "{name} paid respects to Elder Dreamseer, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a dreamer comes to the dreamer. Sit, if the wind allows it, and tell me what you have seen." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon of the year is upon us, and the Lunar Festival with it. Few walk this far to honor an elder, and I will not forget it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, which I dreamed you might. The dreams are not always wrong." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dreamseer the Elder") }, text = "You have given your respect, and my coin rests with you. May your sleep be kind tonight." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "Tauren" }, text = "The Earth Mother sends you dreams too, child, whether you listen to them or not." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "The spirit tilts his great head, as if something only he can hear has spoken.",
      lines = { { id = "h_default", text = "I am Elder Dreamseer, and in life I read the dreams of my people for the signs the Earth Mother gave them. Now, for a few nights in the new year, I am the one who visits their sleep." } },
      again = { { id = "h_again", text = "Speak, dreamer. I am listening, even when my eyes are closed." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "The spirits speak to me as well, Elder.", next = "kin", when = { class = "SHAMAN" } },
        { text = "Tell me something no one remembers.", next = "ymem" },
        { text = "Should the elders be remembered forever?", next = "yforget" },
        { text = "What happens when the festival ends?", next = "ymoon" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I was a seer of the old tribes, and the hunters came to me before a long hunt to know if the herd would run true. I saw the coming of the green-skinned strangers in a dream long before Cairne ever met their Warchief." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "The dreams hold me, child, and the ones who still dream of me. When a tauren wakes and remembers an old voice telling them to be careful, that was probably me." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Then you will dream well. The old ways are only dreams that many people agreed to keep.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "Perhaps, but the living dream of us whether they mean to or not. Ask your own sleep tonight and see.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "The Lunar Festival marks the turning of the year, when Mu'sha's light is full and the veil between the living and their elders is thin. We are honoured with lanterns and red envelopes, and in return we offer what wisdom we kept." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "In Moonglade the druids light the great festival, and the Moonclaw sleep there under the moon. Every elder who is honoured feels the pull of it, the way a herd feels the rain coming." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Your respect is a good dream, and I thank you for it. Take this coin of my line, and when you are troubled, remember that an old seer once thought kindly of you." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then we are of one craft, shaman. Listen most when they are quietest, because a spirit that shouts is usually lying." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  
    ymem = {
      lines = {
        { id = "yelderd_ymem_d", text = "I dreamed once of a great tree burning, and of a people who walked out of the fire with green skin and wolves at their side. I told the elders, and they laughed. Then the orcs came, and Thrall with them." },
        { id = "yelderd_ymem_v0", when = { race = "Tauren" }, text = "I dreamed once of a great tree burning, and of a people who walked out of the fire with green skin and wolves at their side. You carry the same blood, child, so carry the memory for me as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yforget = {
      lines = {
        { id = "yelderd_yforget_d", text = "There are young shaman who say dreams are only dreams, and that the old seers spoke too much of things they could not prove. Others say the dreams are the Earth Mother's own voice." },
      },
      choices = {
        { text = "Remember them. The elders guide the living.", next = "BACK", reply = "Then I will stay a while longer, and gladly. Thank you, child.", fx = { align = { light = 1 } } },
        { text = "Let the dead go. The young need room to grow.", next = "BACK", reply = "Perhaps. But even a young tree drinks from old roots.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymoon = {
      lines = {
        { id = "yelderd_ymoon_d", text = "When the festival ends, the elders go back to the quiet. We do not sleep, exactly, but we wait, the way the earth waits through winter. Each year I wonder if anyone will come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dreams = { { id = "yelderd_tp_dreams", text = "Dreams are the Earth Mother speaking slowly, for she knows we are slow to listen." } },
    thrall = { { id = "yelderd_tp_thrall", text = "I dreamed of him before he came. A green-skinned chieftain with a hammer, and a storm at his back." } },

    _none = { { id = "tp_none", text = "I have not dreamed of that, child. Ask me again after you have slept." } },
  },
}

-- Elder Skyseer: an ancestor spirit honoured during the Lunar Festival. In Classic he stands at Freewind Post, high on the mesas of Thousand Needles.
P:NPC {
  key = "mul_elder_skyseer", id = 15584, name = "Elder Skyseer", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "He keeps looking upward, as if counting the stars.",
    third = "{name} paid respects to Elder Skyseer, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "The sky is wide tonight, and every star in it is an old friend. Come, look up with me, {class}." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The festival lights burn in Moonglade, and I have come back once more to be remembered. Stay a while, and let us honor the old ways together." },
    { id = "g_back", when = { metBefore = true }, text = "Back again under the same sky. It changes less than the living, which is a comfort." },
    { id = "g_done", when = { questDone = TODO_QUEST("Skyseer the Elder") }, text = "You have honoured me already, and my coin is yours. Look up when you are lost." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "NightElf" }, text = "A child of the moon atop the mesas of Freewind Post? The festival makes strange and welcome neighbours." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He lifts one ghostly hand and traces a line between two stars.",
      lines = { { id = "h_default", text = "I am Elder Skyseer, and I watched the sky over Mulgore for all of my long life. I read the weather for the hunters and the seasons for the planters, and now I come back each year to see if the stars have kept their places." } },
      again = { { id = "h_again", text = "Ask, {class}. The stars will wait for us." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "My grandmother read the sky as you did.", next = "kin", when = { race = "Tauren" } },
        { text = "Tell me something no one remembers.", next = "ymem" },
        { text = "Should the elders be remembered forever?", next = "yforget" },
        { text = "What happens when the festival ends?", next = "ymoon" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I read the clouds and the stars for my tribe, and when the rain would come and when it would not. A tauren who knows the sky knows when to move the herd, and that kept many of us alive in the dry years." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "The sky holds me, the same as it holds everything. When the living look up at night and feel small, they are looking where I spent my life." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Good. The stars are the oldest tradition of all, and they never once forgot their places.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "The young always say so, until they need to know when the rain is coming. Then they come looking for an old skywatcher.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the new year by the moon, and the turning of the sky's great wheel. The living honour their elders, set off bright fireworks to frighten away the dark, and remember that they are part of something older than themselves." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is where the sky comes closest to the earth, or so it seems to me. Elune's light falls on the festival there, and the elders of every people are called to it." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Then I give you my thanks and the coin of my line. Look for my star on a clear night; I will not tell you which one it is." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then she and I would have argued about the clouds for hours, and enjoyed every moment. Honour her tonight as you honour me." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  
    ymem = {
      lines = {
        { id = "yesk_ymem_d", text = "I saw the night the sky burned red over the north, long ago, and the hunters said it was a sign of war. It was, and they were right, but I was the only one who saw the stars weep afterwards." },
        { id = "yesk_ymem_v0", when = { race = "Tauren" }, text = "I saw the night the sky burned red over the north, long ago, and the hunters said it was a sign of war. You carry the same blood, child, so carry the memory for me as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yforget = {
      lines = {
        { id = "yesk_yforget_d", text = "Some say the sky shows nothing, and the old readers were only guessing. Others say the sky remembers everything that happens beneath it." },
      },
      choices = {
        { text = "Remember them. The elders guide the living.", next = "BACK", reply = "Then I will stay a while longer, and gladly. Thank you, child.", fx = { align = { light = 1 } } },
        { text = "Let the dead go. The young need room to grow.", next = "BACK", reply = "Perhaps. But even a young tree drinks from old roots.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymoon = {
      lines = {
        { id = "yesk_ymoon_d", text = "When the festival ends, the elders go back to the quiet. We do not sleep, exactly, but we wait, the way the earth waits through winter. Each year I wonder if anyone will come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stars = { { id = "yesk_tp_stars", text = "The stars are the eyes of the ancestors. Look up on a clear night and you will feel them looking back." } },
    an_she = { { id = "yesk_tp_an_she", text = "An'she is the sun, and Mu'sha the moon. They are the eyes of the Earth Mother, open in turn." } },

    _none = { { id = "tp_none", text = "That is not written in the sky, {class}, or if it is, I never read that part." } },
  },
}

-- Elder Stonespire: an ancestor spirit honoured during the Lunar Festival. In Classic he waits in Everlook, Winterspring, far from his old stones.
P:NPC {
  key = "mul_elder_stonespire", id = 15574, name = "Elder Stonespire", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "He stands as still as the stone he was named for, untroubled by the snow.",
    third = "{name} paid respects to Elder Stonespire, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, young one. The stones remember everything, and so do I, at least for tonight." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Another Lunar Festival, and another year turned. The ancestors smile on those who seek out their elders." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the stones, and they are glad of it, in their slow way." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stonespire the Elder") }, text = "My coin is already in your keeping. Let it be as steady as the stone." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "Tauren" }, text = "You have the hooves of the plains, child, and they stand well on old ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He sets one broad hand against the frozen ground, as if feeling for a heartbeat.",
      lines = { { id = "h_default", text = "I am Elder Stonespire, and I raised the standing stones my people still gather around. I am honoured each Lunar Festival, and this year it has carried me to the snows of Everlook, far from my stones." } },
      again = { { id = "h_again", text = "Speak, child. I have all the patience of rock." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "My people are new to Kalimdor, Elder.", next = "kin", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "Tell me something no one remembers.", next = "ymem" },
        { text = "Should the elders be remembered forever?", next = "yforget" },
        { text = "What happens when the festival ends?", next = "ymoon" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I was a stoneworker and a keeper of the high places, where the tauren went to speak with the Earth Mother. My hands set the stones, and my voice taught the young which ones must never be moved." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "My stones hold me, and the hands of those who touch them. A tauren who leans on an old stone to rest is leaning on me, though they rarely know it." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Well said. The old ways are like stones: heavy, slow, and still standing when the tents are gone.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "The living will make their own way, true. But they will walk it on ground someone else cleared.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "The Lunar Festival turns the year and honours the elders of every people. The living bring us their respect, and we lend them a little of our long patience in return." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade belongs to the druids and to Elune, and the festival is grandest there. Even a tauren who has never left Mulgore feels the pull of it at the turning of the year." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Your respect is welcome, young one, and here is the coin of my line in return. Keep it close and keep your footing sure." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then walk softly here, and listen to the land before you speak to it. The Horde has given us much, and the Earth Mother welcomes friends of the tauren." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  
    ymem = {
      lines = {
        { id = "yess_ymem_d", text = "I raised the standing stones on the high ridge with my own hands, three summers of carrying. My sons helped, and the youngest crushed his foot under the third stone. He walked with a limp all his life, and never complained." },
        { id = "yess_ymem_v0", when = { race = "Tauren" }, text = "I raised the standing stones on the high ridge with my own hands, three summers of carrying. You carry the same blood, child, so carry the memory for me as well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yforget = {
      lines = {
        { id = "yess_yforget_d", text = "Some of the young say the old stones should be moved, so the new roads run straight. Others say a stone set by an elder's hand should never be shifted." },
      },
      choices = {
        { text = "Remember them. The elders guide the living.", next = "BACK", reply = "Then I will stay a while longer, and gladly. Thank you, child.", fx = { align = { light = 1 } } },
        { text = "Let the dead go. The young need room to grow.", next = "BACK", reply = "Perhaps. But even a young tree drinks from old roots.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymoon = {
      lines = {
        { id = "yess_ymoon_d", text = "When the festival ends, the elders go back to the quiet. We do not sleep, exactly, but we wait, the way the earth waits through winter. Each year I wonder if anyone will come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stones = { { id = "yess_tp_stones", text = "A standing stone is a promise to the Earth Mother. My stones have kept theirs for a long time." } },
    high_places = { { id = "yess_tp_high_places", text = "The high places are where the earth comes closest to the sky. Speak softly there." } },

    _none = { { id = "tp_none", text = "The stones do not know that, child, and neither do I." } },
  },
}

-- Hulfnar Stonetotem: a Bloodhoof Village tauren, broad and slow to anger.
P:NPC {
  key = "mul_hulfnar_stonetotem", id = 10599, name = "Hulfnar Stonetotem", gender = "male",
  role = "citizen", tier = "service",
  communities = { "bloodhoof" }, temper = { "calm", "stubborn" }, values = { "tribe", "land" },
  notices = { "race" },
  impression = {
    first = "A heavy-shouldered bull who plants his hooves like he means to stay.",
    third = "{name} met Hulfnar Stonetotem in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "May the eternal sun shine upon you, {class}. The village is quiet today, which is how I like it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Bloodhoof is a place people come back to." },
  },
  notice = {
    { id = "n_ally", cat = "race", when = { faction = "Alliance" }, text = "You are a long way from your own people, stranger. Walk carefully here, and I will not need to stamp the ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Hulfnar Stonetotem, and I was born in a tent not twenty paces from here. My family is of the Stonetotem line, which is no kin to the Grimtotem, whatever the young ones joke." } },
      again = { { id = "h_again", text = "Something else, {class}? I have nowhere to be." } },
      choices = {
        { text = "What's your work in the village?", next = "work" },
        { text = "The Stonetotem and the Grimtotem are different?", next = "names" },
        { text = "Tell me about your family.", next = "xfam" },
        { text = "What do you think of the Horde?", next = "xhorde" },
        { text = "You must know the land well, cousin.", next = "xland", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "I keep the peace and lend a strong back where one is needed. When the gnolls come up from the Palemane camps or the wolves get bold, the village knows where to find me, and they know I can stamp hard enough to knock them flat." } },
      choices = {
        { text = "The gnolls trouble you often?", next = "quilboar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "The Palemane gnolls raid from the south, the Bristleback quilboar keep their own camps, and the Venture Company cuts our trees in the west. Cairne asks us to defend, not to chase, and so far we have obeyed him." } },
      choices = {
        { text = "Sometimes you must strike first.", next = "BACK", reply = "Perhaps, but a herd that charges every shadow soon runs off a cliff. I will wait for the real enemy.", fx = { align = { order = -1 } } },
        { text = "Cairne is wise. Defend and endure.", next = "BACK", reply = "So my mother taught me, and so I teach my sons. The land outlasts its raiders.", fx = { align = { order = 1 } } },
      },
    },
    names = {
      lines = { { id = "n_default", text = "Very different, {class}. A stonetotem is a carved post that marks our hunting grounds, and my line carved them; the Grimtotem are Magatha's people, who would sooner see the Horde gone. I have no love for them." } },
      choices = { { text = "I'll remember the difference. Something else.", next = "BACK" } },
    },
    xfam = {
      lines = {
        { id = "x_xfam", text = "My mother weaves, my father hunts, and my sister has gone to Thunder Bluff to learn the ways of the Bluff's healers. I stayed, for Bloodhoof Village needs strong backs more than it needs another healer." },
      },
      choices = {
        { text = "Do you envy her?", next = "xenvy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xenvy = {
      lines = {
        { id = "x_xenvy", text = "A little, when the wind smells of the city cookfires. But the Earth Mother puts each of us where we are needed, and I am needed here, carrying water and mending fences." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "x_xhorde", text = "The orcs helped us drive back the centaur and find this land, and Cairne calls them friends. I have met only a few, and they are loud and fierce, but they keep their word." },
      },
      choices = {
        { text = "Should the tauren stay in the Horde?", next = "xstay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = {
        { id = "x_xstay", text = "Some elders whisper that we owe the orcs nothing more and should keep to Mulgore. Others say the Horde is our family now, whatever its quarrels." },
      },
      choices = {
        { text = "The Horde is family. Stand with it.", next = "BACK", reply = "Cairne would say the same, and I trust Cairne.", fx = { align = { order = 1 } } },
        { text = "Mulgore first. The tauren must look after themselves.", next = "BACK", reply = "You speak like the old herders. Perhaps they are not wrong.", fx = { align = { order = -1 } } },
      },
    },
    xland = {
      narr = "He scrapes a hoof across the ground, slowly, the way a bull warns.",
      lines = {
        { id = "x_xland", text = "Every hill and stream of it, cousin, from the Red Rocks to the Venture camps. The Venture Company cuts our trees, and the gnolls dig in the hills, and I would see them both gone." },
      },
      choices = {
        { text = "So would I.", next = "BACK", reply = "Then may we hunt them together, some day.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    bloodhoof_village = { { id = "tp_xbloodhoof_village", text = "Bloodhoof Village is my home. The finest place in the world, though I've seen little else." } },
    grimtotem = { { id = "tp_xgrimtotem", text = "We Stonetotem have nothing to do with the Grimtotem. Say it plainly, please." } },
    _none = { { id = "tp_none", text = "I do not know that, {class}. Ask the elders, or ask the wind; the wind knows more than I do." } },
  },
}

-- Thontek Rumblehoof: a young Bloodhoof Village brave with a loud voice and a louder stomp.
P:NPC {
  key = "mul_thontek_rumblehoof", id = 10600, name = "Thontek Rumblehoof", gender = "male",
  role = "citizen", tier = "service",
  communities = { "bloodhoof" }, temper = { "eager", "boastful" }, values = { "strength", "tribe" },
  notices = { "race", "kit" },
  impression = {
    first = "Young for a guardian, and very proud of his hooves.",
    third = "{name} met Thontek Rumblehoof, a young brave of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Ho, {class}! You came to Bloodhoof at a good time; nothing has tried to eat anyone all morning." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Have you come to hear about my stomp? Everyone does, sooner or later." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Another young bull from the village, out seeing the world. I will catch you up soon, you watch." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Thontek Rumblehoof, and they named me for the noise I made as a calf, running through the tents. Now I am a brave of Bloodhoof Village, and I make that noise on purpose." } },
      again = { { id = "h_again", text = "What else? I have stories, if you have time for them." } },
      choices = {
        { text = "What do you do for the village?", next = "duty" },
        { text = "Tell me about this famous stomp.", next = "stomp" },
        { text = "What's the hardest part of being a brave?", next = "xhard" },
        { text = "What do you think of the Venture Company?", next = "xventure" },
        { text = "I'm also young. Any advice?", next = "xyoung", when = { race = "Tauren" } },
        { text = "Who do you look up to?", next = "yhero" },
        { text = "Have you ever been in a real fight?", next = "yfight" },
        { text = "Farewell, Thontek.", next = "END" },
      },
    },
    duty = {
      lines = { { id = "d_default", text = "I walk the edge of the village and watch the roads to Thunder Bluff and Camp Narache. The elders say I am too eager, but an eager brave is awake when the others are napping." } },
      choices = {
        { text = "The elders are right. Patience is a warrior's strength.", next = "BACK", reply = "That is what they all say, every one of them. Maybe when I am old and grey I will agree.", fx = { align = { order = 1 } } },
        { text = "Eagerness wins fights. Keep it.", next = "BACK", reply = "Ha! I knew I liked you. Tell that to old Hulfnar when you see him.", fx = { align = { order = -1 } } },
      },
    },
    stomp = {
      lines = { { id = "s_default", text = "A tauren who brings his hooves down hard enough can shake the ground under his enemies, and they fall about like startled plainstriders. Mine is the loudest in the village, though Hulfnar says otherwise." } },
      choices = {
        { text = "Who taught you?", next = "teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = { { id = "t_default", text = "Nobody taught me, {class}; every tauren is born with it, the way a kodo is born heavy. The trick is learning when to use it, and I am still working on that part." } },
      choices = { { text = "Keep working on it. Something else.", next = "BACK" } },
    },
    xhard = {
      lines = {
        { id = "x_xhard", text = "Waiting. Everyone says a brave's duty is to stand ready, and I am very good at standing, but I am not good at waiting for anything to happen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xventure = {
      lines = {
        { id = "x_xventure", text = "They cut down our trees and make machines that roar through the hills. Baine and the hunters drive them back, but they always return with more saws." },
      },
      choices = {
        { text = "Should the tauren attack them?", next = "xattack" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xattack = {
      lines = {
        { id = "x_xattack", text = "I would charge them tomorrow if the elders let me. But Baine says that patience wins wars, and a calf who charges first is a calf who dies first." },
      },
      choices = {
        { text = "Charge them. Show the goblins tauren strength.", next = "BACK", reply = "Yes! That's what I keep saying!", fx = { align = { honor = 1 } } },
        { text = "The elders are right. Wait for the right time.", next = "BACK", reply = "You sound like the elders. I suppose I'll listen to you too.", fx = { align = { honor = -1 } } },
      },
    },
    xyoung = {
      narr = "He stamps a hoof proudly, and the ground thuds.",
      lines = {
        { id = "x_xyoung", text = "Stomp loudly and listen quietly, that's what my mother says, though I am better at the first part. And never chase a swoop into the hills, because they are faster than they look." },
      },
      choices = {
        { text = "Thanks.", next = "BACK", reply = "Walk with the Earth Mother, friend!", fx = { affinity = 1 } },
      },
    },
  
    yhero = {
      lines = {
        { id = "ythonte_yhero_d", text = "Baine Bloodhoof, who is patient, and Brave Strongbash, who is strong. I want to be both, though the elders say I must choose one first. I chose strong, and now I am trying to learn patient." },
        { id = "ythonte_yhero_v0", when = { race = "Tauren" }, text = "Baine, who is patient, and Strongbash, who is strong. You will know how the elders make us choose. I chose strong, and now I am learning patient, badly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfight = {
      lines = {
        { id = "ythonte_yfight_d", text = "Once, against a gnoll who tried to steal a kodo calf. I stomped, and he fell, and I was so surprised that he got up and ran away. The other braves still laugh about it. I tell them I let him go." },
      },
      choices = {
        { text = "Did you?", next = "ylet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylet = {
      lines = {
        { id = "ythonte_ylet_d", text = "No. But now I wonder if I should have. A brave from Narache says a thief must always be punished, so he does not return. My mother says a gnoll who runs away has learned enough." },
      },
      choices = {
        { text = "Punish thieves, or they return.", next = "BACK", reply = "Then next time I will not be so surprised, and he will not get up.", fx = { align = { order = 1 } } },
        { text = "Your mother is right. He learned his lesson.", next = "BACK", reply = "I like to think so. And I like that I did not have to hurt him more.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    stomp = { { id = "ythonte_tp_stomp", text = "A tauren's war stomp is a gift from the Earth Mother. I am still learning how to aim it." } },
    baine = { { id = "ythonte_tp_baine", text = "Baine keeps the village. He is patient as stone, and I am trying to learn from him." } },

    bloodhoof_village = { { id = "tp_xbloodhoof_village", text = "Bloodhoof Village is where I was born and where I will die old." } },
    venture_company = { { id = "tp_xventure_company", text = "The Venture Company cuts our trees. I would cut their saws." } },
    _none = { { id = "tp_none", text = "I have no idea, {class}, but if you find out, come and tell me. I like news." } },
  },
}

---------------------------------------------------------------------------
-- Ancestral Spirit: the spirit at Red Rocks met in the Rites of the Earthmother.
---------------------------------------------------------------------------
P:NPC {
  key = "mul_ancestral_spirit", id = 2994, name = "Ancestral Spirit", gender = "male",
  role = "spirit", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wisdom", "tradition" },
  impression = {
    first = "A tall shape of pale light stands among the red stones, the outline of a tauren elder with horns wreathed in mist. The wind goes quiet around it.",
    third = "{name} spoke with an Ancestral Spirit at Red Rocks in Mulgore.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, child of the Earthmother. Few walk to the Red Rocks for anything but grief." },
    { id = "g_q", when = { questActive = TODO_QUEST("Rite of Wisdom") }, text = "You come walking the Rites of the Earthmother. Then stand still a moment and listen, for wisdom is mostly listening." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I was a hunter of the plains once, and I sleep now beneath these stones with my kin. The Earthmother does not let us wander far; we keep watch over the living who still remember us." } },
      again = { { id = "h_again", text = "The spirit waits, patient as stone. What else would you ask?" } },
      choices = {
        { text = "What is the wisdom of the Rites?", next = "wisdom" },
        { text = "Do the dead grieve as we do?", next = "grieve" },
        { text = "These red stones feel older than anything in Mulgore.", next = "redrocks" },
        { text = "My grandmother is buried here. Does she hear me?", next = "kin", when = { race = "Tauren" } },
        { text = "What was your life as a hunter?", next = "xlife" },
        { text = "Do you know my ancestors?", next = "xmine", when = { race = "Tauren" } },
        { text = "Did you know Cairne's kin?", next = "xcairne" },
        { text = "Rest well, ancestor.", next = "END" },
      },
    },
    wisdom = {
      lines = { { id = "w_default", text = "That the land was here before us, and will be here after. A hunter who takes more than he needs forgets that he too will lie down in the grass one day." } },
      choices = {
        { text = "Then I will take only what I need.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The strong take what they must to survive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why must I walk the Rites at all?", next = "rites" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rites = {
      lines = { { id = "ri_default", text = "Because a young tauren must learn the land before he can call himself its child. Elder Bloodhoof's people walk the Rites of Strength, Vision and Wisdom, and each one asks a different kind of courage." } },
      choices = { { text = "Then I will finish them. Something else.", next = "BACK" } },
    },
    redrocks = {
      lines = { { id = "rr_default", text = "They are, child. Our people raised them when we first came to these plains, and we have laid our dead beneath them ever since. The centaur and the quilboar never dared to trouble this place." } },
      choices = {
        { text = "The centaur are still out there, though.", next = "centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    centaur = {
      lines = { { id = "ce_default", text = "They are, and the Venture Company's machines bite at the plains as well. Cairne will not let Mulgore fall, but every generation must guard it again, as we did in ours." } },
      choices = { { text = "Something else, ancestor.", next = "BACK" } },
    },
    kin = {
      narr = "The light of the spirit dims, then brightens, like a smile.",
      lines = { { id = "ki_default", text = "She hears you, and she is proud of what she hears. Sing her name here at dusk, and the wind will carry it to her." } },
      choices = { { text = "I will. Thank you, ancestor.", next = "BACK" } },
    },
    grieve = {
      lines = { { id = "g_default2", text = "We remember, which is gentler than grief. When the living sing our names at the Red Rocks, we hear them, and the sound is like rain after a long summer." } },
      choices = { { text = "I will remember that.", next = "BACK" } },
    },
    xlife = {
      lines = {
        { id = "x_xlife", text = "I followed the great kodo herds from the Barrens to the foot of these mountains, before the tribes found rest in Mulgore. We were wanderers then, with the centaur at our heels, and every season was a flight." },
      },
      choices = {
        { text = "Do you miss the wandering?", next = "xwander" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwander = {
      narr = "The mist about its horns stirs, though there is no wind.",
      lines = {
        { id = "x_xwander", text = "The wind never misses the grass it has passed over, and neither do I. But I am glad the young ones have Mulgore, where the grass is green and the centaur are far away." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmine = {
      lines = {
        { id = "x_xmine", text = "All the ancestors know one another, little one, as all the stars share one sky. Yours walk near you more often than you think, especially when you are afraid." },
      },
      choices = {
        { text = "Do they judge me?", next = "xjudge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xjudge = {
      lines = {
        { id = "x_xjudge", text = "They watch, and they hope, and sometimes they grieve. Some elders say the dead should guide the living closely, and some say the young must find their own way." },
      },
      choices = {
        { text = "I'll heed the ancestors' guidance.", next = "BACK", reply = "Then you will never walk alone, though you may walk slowly.", fx = { align = { order = 1 } } },
        { text = "I'll find my own path.", next = "BACK", reply = "So did I, once. The ancestors forgave me, and they will forgive you.", fx = { align = { order = -1 } } },
      },
    },
    xcairne = {
      lines = {
        { id = "x_xcairne", text = "Cairne Bloodhoof is a great chief, and he brought the tribes home. I hunted with his grandfather, long ago, and the grandson has the same steady eyes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_xcairne", text = "Cairne led the tribes to Mulgore. The ancestors are proud of him." } },
    red_rocks = { { id = "tp_xred_rocks", text = "The Red Rocks hold the bones of our honoured dead. Walk softly there." } },
    _none = { { id = "tp_none", text = "That is a matter for the living. Ask in Bloodhoof Village." } },
  },
}
