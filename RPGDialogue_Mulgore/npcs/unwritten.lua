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
      lines = { { id = "g_default", text = "Bring them over and I'll trade you Faire tickets for each one that whirrs. Rinling don't pay for things that just sit there looking sad." } },
      choices = { { text = "Deal.", next = "BACK", fx = { affinity = 1 } } },
    },
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
  },
}
