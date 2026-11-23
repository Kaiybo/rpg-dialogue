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
  },
  topics = {
    _none = { { id = "tp_none", text = "That is a question for the living, young one. I only remember the plains as they were." } },
  },
}

-- Elder Dreamseer: an ancestor spirit honoured during the Lunar Festival. He waits by the high places of Thunder Bluff, where the winds are loudest.
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
  },
  topics = {
    _none = { { id = "tp_none", text = "I have not dreamed of that, child. Ask me again after you have slept." } },
  },
}

-- Elder Skyseer: an ancestor spirit honoured during the Lunar Festival. He stands on the plains of Mulgore under the open sky.
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
    { id = "g_back", when = { metBefore = true }, text = "Back again under the same sky. It changes less than the living, which is a comfort." },
    { id = "g_done", when = { questDone = TODO_QUEST("Skyseer the Elder") }, text = "You have honoured me already, and my coin is yours. Look up when you are lost." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "NightElf" }, text = "A child of the moon on the plains of Mulgore? The festival makes strange and welcome neighbours." },
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
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not written in the sky, {class}, or if it is, I never read that part." } },
  },
}

-- Elder Stonespire: an ancestor spirit honoured during the Lunar Festival. She keeps to the rocky heights of Mulgore, near the old stones.
P:NPC {
  key = "mul_elder_stonespire", id = 15574, name = "Elder Stonespire", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "She stands as still as the stone she was named for.",
    third = "{name} paid respects to Elder Stonespire, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, young one. The stones remember everything, and so do I, at least for tonight." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the stones, and they are glad of it, in their slow way." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stonespire the Elder") }, text = "My coin is already in your keeping. Let it be as steady as the stone." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "Tauren" }, text = "You have the hooves of the plains, child, and they stand well on old ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She sets one broad hand against the rock beside her, as if feeling for a heartbeat.",
      lines = { { id = "h_default", text = "I am Elder Stonespire, and I raised the standing stones my people still gather around. I am honoured each Lunar Festival, and I come back to see that they still stand straight." } },
      again = { { id = "h_again", text = "Speak, child. I have all the patience of rock." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "My people are new to Mulgore, Elder.", next = "kin", when = { race = { "Orc", "Troll", "Scourge" } } },
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
    _none = { { id = "tp_none", text = "I have no idea, {class}, but if you find out, come and tell me. I like news." } },
  },
}
