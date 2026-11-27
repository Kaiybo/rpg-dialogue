-- Stonard's two prisoner guards, whom a roster scan found missing: Grunt Tharlak (who growls) and
-- Grunt Zuul (who says as little as he can), set over the human spy Infiltrator Marksen.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Grunt Tharlak: guards Infiltrator Marksen; loud, suspicious, itching for a real fight.
P:NPC {
  key = "grunt_tharlak", id = TODO_NPC("Grunt Tharlak"), name = "Grunt Tharlak", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "restless" }, values = { "honor", "dutiful" },
  notices = { "soldier", "race" },
  impression = {
    first = "Grunt Tharlak stands over Stonard's human prisoner with his axe in his hands and his patience worn thin. He growled at the spy, at the swamp and at me, in that order, and plainly wished he were anywhere there was something to hit.",
    third = "{name} met Grunt Tharlak, one of the two grunts guarding the human spy in Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you, {class}. Go on through; you have earned that much from me, and the prisoner can glare at someone else." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. State your business and keep well away from the prisoner, or I will put you out of the gate myself." },
    { id = "g_default", text = "Stand back from the prisoner, {class}. He is not to be touched until the Commander's questioner comes, and I will not be the grunt who lets it happen." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The human still breathes and I still stand here, so nothing has changed." },
  },
  notice = {
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR" },
      text = "Lok'tar, warrior. You have the look of one who has seen battle lately, and I envy you for it." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Keep your hands where I can see them, dead one. Your kind have shown too much interest in this human already, and I do not like it." },
    { id = "n_rogue", cat = "soldier", when = { class = "ROGUE" },
      text = "You move like the thing I am guarding. Walk where I can hear you, shadow-walker." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Tharlak. Zuul and I were given this human to watch, and so I watch him, though I would sooner be in the marsh with the hunters than standing over a spy who whines." } },
      again = {
        { id = "h_again", text = "What else? Ask it and be done, {class}." },
        { id = "h_again2", text = "Speak. My eyes stay on the human." },
      },
      choices = {
        { text = "The prisoner must wait for the Commander's questioner, as ordered.", next = "BACK", reply = "Yes, and that is why I stand here in the mud instead of doing it myself.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Why wait for a questioner? Make the human talk now.", next = "BACK", reply = "Because the Commander said wait, and a grunt who forgets his orders is no grunt at all.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Who is the prisoner?", next = "prisoner" },
        { text = "You sound tired of guard duty.", next = "duty" },
        { text = "What does Stonard fight out there?", next = "fight" },
        { text = "Why not simply kill the spy?", next = "kill", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Hold your post, grunt.", next = "END" },
      },
    },
    prisoner = {
      lines = { { id = "p_default", text = "A human who calls himself Marksen, taken while he crept about spying where he had no business. He says he has a secret worth his life, and every prisoner I ever guarded has said the same." } },
      choices = {
        { text = "Do you believe him?", next = "believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    believe = {
      lines = { { id = "b_default", text = "I believe he is afraid, and a frightened human will say anything. But he looks at the Forsaken who pass more than he looks at my axe, and that I do not understand, so I have told the Dispatch Commander of it." } },
      choices = {
        { text = "He fears the Forsaken more than you?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "So it seems, and it shames me a little. An orc will kill a man cleanly, and he knows it, but the dead ones come by with their bottles and their soft voices and ask whether the prisoner is thirsty." },
        { id = "f_scourge", when = { race = "Scourge" }, text = "So it seems, and you would know why better than I. Your apothecaries come by with bottles and soft voices and ask whether he is thirsty, and I send them away, ally or no." },
      },
      choices = { { text = "Keep sending them away. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    duty = {
      lines = { { id = "d_default", text = "A grunt does as he is ordered, and I do not complain of the order. I complain of the standing still, for my father's father took this ground with an axe, and I hold it with my feet.", fx = { learn = { "stonard" } } } },
      choices = {
        { text = "Your grandfather fought here?", next = "grandfather" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grandfather = {
      lines = { { id = "gf_default", text = "The Horde came through this swamp when it first walked into this world, and Stonard has stood since those days. It was a darker Horde then, with the demon's fire in its blood, but the ground was won all the same, and we do not give back what was won." } },
      choices = { { text = "Nor should you. Something else.", next = "BACK" } },
    },
    fight = {
      lines = { { id = "fi_default", text = "Crocolisks and jaguars for the pot, the broken ones who skulk in the marsh, and green-scaled whelps around the sunken temple to the east. And humans, now, creeping down from their dark forest, which is why I have this one at my feet." } },
      choices = { { text = "Enemies enough for any grunt. Something else.", next = "BACK" } },
    },
    kill = {
      lines = { { id = "k_default", text = "Because there is no honor in an axe through a bound man, and because the dead tell the Commander nothing. When he has been questioned, his fate is for others to speak, and until then I am his shield as much as his jailer." } },
      choices = { { text = "That is an orc's answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a grunt of Stonard, as my father was. I stand where I am told to stand, and today that is over a human." } },
    stonard = { { id = "tp_st", text = "This place has been the Horde's since the first war in these lands. We are few and far from Orgrimmar, and we hold it still." } },
    _none = { { id = "tp_none", text = "I am a guard, not a seer. Take that to the Dispatch Commander." } },
  },
}

-- Grunt Zuul: guards Infiltrator Marksen beside Tharlak; watchful and sparing with words.
P:NPC {
  key = "grunt_zuul", id = TODO_NPC("Grunt Zuul"), name = "Grunt Zuul", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "stonard" }, temper = { "stoic", "watchful" }, values = { "dutiful", "patience" },
  notices = { "soldier", "class" },
  impression = {
    first = "Grunt Zuul guards the human spy in Stonard without seeming to look at him at all, and misses nothing. He let his comrade do the growling and answered me only when an answer was owed.",
    third = "{name} met Grunt Zuul, the quieter of the two grunts guarding the human spy in Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, {class}. You have done right by Stonard, and the watch remembers it, even if I say little." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I remember you. Stay on your side of the post and out of trouble, because I will know if you don't." },
    { id = "g_default", text = "You may look at the prisoner, {class}, but you will come no closer than that post." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you. The rule is the same as before, and so is the post." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You watch as a hunter watches, from the side of the eye. That is how I watch the human, and he has not yet learned it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Throm-ka, shaman. The spirits of this swamp are heavy, and I would hear what they say of this place, when my watch is done." },
  },
  start = "hello",
  nodes = {
    ybefore = {
      lines = {
        { id = "ygruntzuul1", text = "Nowhere. I was born in this swamp, to orcs who hid from the humans' camps. My mother taught me to sit in the reeds for a day without moving, so the patrols would pass. That is why I watch so well." },
      },
      choices = {
        { text = "Stonard stands because its grunts keep the watch without complaint.", next = "BACK", reply = "It does. A wall of orcs is only as strong as the one who stays awake.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A real warrior follows his own judgment, not a watch rota.", next = "BACK", reply = "Then go and judge things out in the swamp, {class}, far from my post.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you miss anything of that life?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "ygruntzuul2", text = "The quiet. In the reeds, there was only the water and my mother's breathing. Here there is Tharlak, who never stops talking, and a human who never stops scheming." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ybecome = {
      lines = {
        { id = "ygruntzuul3", text = "The questioners will take what he knows and decide. Some say a spy should be killed, and some say he should be traded back for our own captives. Tharlak wants him dead. I have not decided." },
      },
      choices = {
        { text = "Trade him back. Our own captives matter more.", next = "BACK", reply = "That is a fair thought. I will say it to the questioners, if they ask a grunt.", fx = { align = { honor = 1 } } },
        { text = "Kill him. Spies get no mercy.", next = "BACK", reply = "That is Tharlak's answer, and the swamp's. Perhaps it is right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Zuul. Tharlak makes the noise for both of us, and I do the watching, and between the two the human has found no moment to run." } },
      again = {
        { id = "h_again", text = "Ask, if there is more." },
        { id = "h_again2", text = "I am listening, {class}, though I do not look at you." },
      },
      choices = {
        { text = "The prisoner says you ignore him.", next = "ignore" },
        { text = "Has he tried to escape?", next = "escape" },
        { text = "Tharlak does all the talking.", next = "tharlak" },
        { text = "What have you learned by watching him?", next = "learned", when = { class = { "HUNTER", "ROGUE", "SHAMAN" } } },
        { text = "Where did you serve before Stonard?", next = "ybefore" },
        { text = "What will become of the prisoner?", next = "ybecome" },
        { text = "Were you in the internment camps?", next = "BACK", when = { race = "Orc" }, reply = "No. I was born after, in the swamp, to those who hid. I have never worn a chain, and I do not intend to." },
        { text = "Keep your watch, Zuul.", next = "END" },
      },
    },
    ignore = {
      lines = { { id = "i_default", text = "He believes that, and I let him. A man who thinks he is not watched grows careless, and he shows you his hands and his eyes and where he would run." } },
      choices = {
        { text = "And where would he run?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "West, by the road, toward the pass and his dark forest beyond it. He looks that way each dusk when he thinks we are eating, and so each dusk that is the side on which I stand." } },
      choices = { { text = "He has no chance at all. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    escape = {
      lines = { { id = "e_default", text = "Once, with words. He offered Tharlak gold that he does not have and offered me a secret that he says he does, and when neither of us moved he sat down again and has been quiet since." } },
      choices = {
        { text = "Did the secret not tempt you?", next = "secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret = {
      lines = { { id = "s_default", text = "A secret given to a guard is worth nothing, for a guard cannot use it. If it is true, the questioner will have it from him, and if it is false, I have lost nothing by standing still." } },
      choices = { { text = "Patience is its own weapon. Something else.", next = "BACK" } },
    },
    tharlak = {
      lines = { { id = "t_default", text = "He does, and it is well that he does. The human fears his voice and forgets my eyes, and so he is guarded twice by grunts who seem to him only one loud orc and one stone." } },
      choices = { { text = "A good pairing. Something else.", next = "BACK" } },
    },
    learned = {
      lines = { { id = "l_default", text = "That he is no warrior, for he flinches before the blow and not after it. He is a man trained to listen at doors, and such men break quickly when no one will speak to them, which is the other reason I keep silent." } },
      choices = { { text = "Silence as a siege. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    tharlak = { { id = "ygruntzuul4", text = "Loud, and brave, and he never stops talking. The human fears him." } },
    prisoner = { { id = "ygruntzuul5", text = "A spy from the west. He listens at doors." } },
    background = { { id = "tp_bg", text = "I am a grunt of Stonard. I was set to watch a prisoner, and so I watch him." } },
    _none = { { id = "tp_none", text = "I do not know it. Ask one whose duty is to know." } },
  },
}
