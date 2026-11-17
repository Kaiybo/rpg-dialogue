-- The centaur of Shen'dralas: Orgrul in the Valley of Bones, Hagiak at the Magram Front, and the Gelkis
-- Nerlokh watching them both. Voice: bibles/shendralas.md
local P = RPGDialogueAPI:Pack("rpgd.shendralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shd_orgrul", id = TODO_NPC("Orgrul"), name = "Orgrul",
  bible = "bibles/shendralas.md", role = "questgiver", tier = "major",
  communities = { "magram", "valley_of_bones" }, temper = { "sharp", "proud" }, values = { "strong", "cunning" },
  notices = { "class", "race", "deeds" },

  impression = {
    first = "Orgrul of the Magram works among the bones of the valley as calmly as a farmer among his rows. He never raises his voice, and he watches every outsider as if he were weighing what their bones would be good for.",
    third = "{name} met Orgrul, a Magram centaur who works necromancy in the Valley of Bones on behalf of his clan.",
  },

  greetings = {
    { id = "g_default", text = "Outsider. Watch where your feet go; some of these bones are still in use." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The valley is quieter when you are in it, which tells me something about you." },
    { id = "g_magram", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } }, text = "Welcome back to the valley, Magram." },
    { id = "g_gelkis", when = { killed = { name = "Gelkis", min = 30 } }, text = "There is Gelkis blood on you, and plenty of it. Good; come closer." },
    { id = "g_away", when = { away = 14 }, text = "Outsider, you have been gone {away}, and the bones did not wait for you, but the valley noticed your absence, which is more than it does for most." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You are stronger than when you last came to the valley, and since the Magram respect only strength, I would rather have you walking than in the dirt." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you made one of the valley's people give way to you, outsider, and it does not displease me, because strength is the only law in Shen'dralas." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear you were caught lying in the valley, outsider, and a lie that fails is only weakness wearing a mask, so be strong or be silent." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's servants, here among my dead. Your kind usually comes to the valley to break things, so I will wait and see what you came to do." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "A corpse that walks and talks and chooses its own road. I have raised a hundred dead in this valley, and not one of them has ever looked at me the way you are looking at me now." },
    { id = "n_jehn", cat = "deeds", when = { killed = { name = "Khan Jehn" }, ["not"] = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } } },
      text = "You can stop pretending you do not know my khan's name. I know what you did at Magram Village, outsider, and I have not yet decided what that makes you." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "The dead see you even when the living cannot. Step out, before one of them decides you are an enemy." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Orgrul of the Magram, and this valley is my work. The other clans keep away from the bones, and that is their weakness, because the dead here are strong and they do as they are told." },
        { id = "h_valley", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Valley of Bones"), days = 3 } },
          text = "So someone sent you down into the valley to find me, and you came instead of running. That already puts you ahead of most outsiders who wander through Shen'dralas." },
        { id = "h_raising", when = { questActive = TODO_QUEST("Bone Raising") },
          text = "The bones will not stand by themselves, outsider. Go and make them stand, and do not be gentle about it." },
        { id = "h_proof", when = { questActive = TODO_QUEST("Proof of Concept") },
          text = "I need proof that the work holds, not promises. Bring it to me and we will see whether my method is sound or merely clever." },
        { id = "h_proof_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Proof of Concept"), days = 3 } },
          text = "It holds. You held the staff and the dead obeyed you, and an outsider is not supposed to manage that, so either my method is better than I believed or you are." },
        { id = "h_mountain", when = { questActive = TODO_QUEST("Mountain of Bones") },
          text = "The valley floor is a mountain of bones, and I want a great deal more of it. Bring what I asked for, and do not stop to wonder whose it was." },
        { id = "h_mercy", when = { questActive = TODO_QUEST("No Mercy for the Weak") },
          text = "You have your task. The weak do not survive in Shen'dralas, and they do not deserve to, so do not waste your pity on them." },
        { id = "h_mercy_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("No Mercy for the Weak"), days = 3 } },
          text = "You showed no mercy, as I asked. The Gelkis would call that cruelty, and the Gelkis are on their knees praying to the earth while we stand on it." },
        { id = "h_outcasts", when = { questActive = TODO_QUEST("Outcast Necromancers") },
          text = "The outcasts are still in their hideaway, playing at my craft without my clan's leave. Finish them, outsider; the dead of this valley answer to the Magram, and to no one else." },
        { id = "h_outcasts_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Outcast Necromancers"), days = 3 } },
          text = "The outcasts are quiet now, and the dead they stole answer to me again. That is how it should be, and how it will stay." },
        { id = "h_tears", when = { questActive = TODO_QUEST("Corrupting Tears") },
          text = "I am still waiting on the tears, outsider. Sorrow is a powerful thing when it is bottled, and I have use for every drop of it." },
        { id = "h_bristle", when = { questActive = TODO_QUEST("Bristleback Retreat") },
          text = "Hagiak is waiting for you at the front, to the east. Go, and tell him Orgrul sent you; he will grumble, but he will listen." },
        { id = "h_return", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Orgrul") },
          text = "Hagiak sent you back to me, then, and the front still stands. Good; the dead can wait no longer, and neither can our khan." },
        { id = "h_jehn_active", when = { questActive = TODO_QUEST("Khan Jehn"), questDone = TODO_QUEST("Return to Orgrul") },
          text = "The ritual site is in the tent by the lake at Magram Village, and the staff is in your hands. Go, and bring our khan back to us." },
        { id = "h_jehn_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Khan Jehn"), days = 7 }, questDone = TODO_QUEST("Return to Orgrul") },
          text = "Khan Jehn walks among his people again, and he knows whose hands held the staff. You came here an outsider and you are not one any longer; to us, you are Magram." },
        { id = "h_magram", when = { questLater = { TODO_QUEST("Khan Jehn"), days = 7 }, questDone = TODO_QUEST("Return to Orgrul") },
          text = "Magram. The clan still speaks of the outsider who raised a khan, and the Gelkis still cannot believe it, which pleases me more than I can say." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "A servant of the Light, come to the Valley of Bones. Your Crusaders come here to smash my dead with hammers, and I am curious whether you mean to do the same." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock. You bargain with demons for your power, and I take mine from the bones of the dead, so between us I think I have the better deal." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "A dead thing that thinks for itself. Sit down, if your bones allow it, because I have questions for you that none of my servants can answer." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A shu'halo, this far from your plains. Your people and the centaur have spilled each other's blood since before either of us was born, so speak quickly and speak plainly." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of Cenarius's favored children. Our father's father was Cenarius, the Magram say, and we have never seen much of his favor, so do not expect much of mine." },
      },
      again = {
        { id = "h_again", text = "What else? The bones will not raise themselves while we talk." },
        { id = "h_again2", text = "Speak, outsider. I am listening." },
      },
      choices = {
        { text = "Why raise the dead at all?", next = "why" },
        { text = "Who are these outcasts?", next = "outcasts" },
        { text = "What happened to your khan?", next = "khan" },
        { text = "Where do the Magram stand with the other clans?", next = "clans" },
        { text = "What lies in this valley?", next = "valley" },
        { text = "What did raising your khan mean to the clan?", next = "after_jehn", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } } },
        { text = "I killed Khan Jehn. You know that, don't you?", next = "xjehn", when = { killed = { name = "Khan Jehn" }, ["not"] = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } } } },
        { text = "The Light forbids what you do here.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "What questions would you ask the dead, Orgrul?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Your necromancy and my demons: which costs more?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The earth spirits cry out in this valley.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "You call Cenarius your grandsire?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Then I'll speak plainly. Why should my people trust yours?", next = "xtauren", when = { race = "Tauren" } },
        { text = "Show me what your dead can do.", next = "xwarrior", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "I have work to do.", next = "END" },
      },
    },

    -- Why the dead ------------------------------------------------------------------------
    why = {
      lines = {
        { id = "wh_default", text = "Because the dead do not tire, do not desert and do not beg for food when the hunting is poor. A clan that respects only strength would be foolish to leave so much strength lying in the dirt." },
      },
      choices = {
        { text = "And the dead have no say in it?", next = "why_say" },
        { text = "Who taught the Magram necromancy?", next = "why_taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_say = {
      big = true,
      lines = {
        { id = "ws_default", text = "The dead are dead, outsider. If they wished to have a say, they should have been strong enough to stay alive, and that is the only law Shen'dralas has ever kept." },
      },
      choices = {
        { text = "The strong should protect the weak, not use them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hard law, but an honest one.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_taught = {
      lines = {
        { id = "wt_default", text = "No one you would know, and no one who is still alive to be asked. All you need know is that the Magram learned it and the Gelkis did not, and so the Gelkis pray while we build." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- The outcasts --------------------------------------------------------------------------
    outcasts = {
      lines = {
        { id = "oc_default", text = "Necromancers who left the clan, or were thrown out of it, and kept the craft anyway. They hide away in their little hole and raise what they please, and every skeleton they steal from this valley is one the Magram will not have." },
      },
      choices = {
        { text = "Why were they cast out?", next = "outcasts_why" },
        { text = "Couldn't they be brought back into the clan?", next = "outcasts_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outcasts_why = {
      lines = {
        { id = "ow_default", text = "That is a matter for the clan, outsider, not for you. You need only know that they serve no khan, and a necromancer who serves no khan is only a thief with a staff." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outcasts_back = {
      big = true,
      lines = {
        { id = "ob_default", text = "Brought back? The Magram do not forgive weakness, and leaving the clan was the weakest thing they could have done. You speak like a Gelkis, or like a child." },
      },
      choices = {
        { text = "Mercy isn't weakness, Orgrul.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "A traitor is a traitor. Let the vultures have him.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The khan -------------------------------------------------------------------------------
    khan = {
      lines = {
        { id = "kh_default", text = "Khan Jehn was slain by a band of outsiders, much like you, who were acting for the Gelkis. They struck at Magram Village while our eyes were turned to this valley, which is exactly what any clan would do, and the Gelkis are nothing if not predictable." },
        { id = "kh_done", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } }, text = "He was slain by outsiders working for the Gelkis, and then he was raised again by an outsider working for us. You know the rest better than anyone, Magram, because your hands held the staff." },
      },
      choices = {
        { text = "You don't seem angry about it.", next = "khan_calm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khan_calm = {
      lines = {
        { id = "kc_default", text = "Why would I rage at what I can undo? The Gelkis think a dead khan is the end of a war, and I intend to show them otherwise." },
        { id = "kc_done", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } }, text = "Why would I have raged at what I could undo? The Gelkis thought a dead khan was the end of a war, and now they know otherwise." },
      },
      choices = {
        { text = "Raising a khan from the dead. Is that wise?", next = "khan_wise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khan_wise = {
      big = true,
      lines = {
        { id = "kw_default", text = "Wise? It is strong, and among the Magram that is the same thing. A clan that loses its khan and simply grieves deserves to lose the next one too." },
      },
      choices = {
        { text = "Some things should stay dead, khans included.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then show the Gelkis what a stubborn clan can do.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_jehn = {
      big = true,
      lines = {
        { id = "aj_default", text = "It meant the Gelkis learned that killing a Magram khan only buys a short rest. It also meant that an outsider showed more loyalty to this clan than some of those born to it, which I do not understand, but I will not refuse." },
      },
      choices = {
        { text = "I did it for the clan. That's all.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I did it for the reward. Don't make it more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The clans -----------------------------------------------------------------------------
    clans = {
      lines = {
        { id = "cl_default", text = "The Gelkis are our enemies, and the Kolkar and the Maraudine are no friends either. The Gelkis respect the earth and trust Theradras to protect them, and the Magram respect strength, and only one of those has ever kept a clan alive." },
      },
      choices = {
        { text = "And the quilboar at Bristleback Retreat?", next = "quilboar" },
        { text = "What of the Highborne ruins to the south?", next = "highborne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar = {
      lines = {
        { id = "qb_default", text = "The Bristleback squeal and dig and hold their retreat as if it were worth holding. Hagiak watches them from the front, and if you want to know more about pigs, ask him; he has had to smell them longer than I have." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    highborne = {
      lines = {
        { id = "hb_default", text = "Old stones and old ghosts, and an old elf who stands on a hill and stares at them all day. The elves had great strength once and threw it away, and I have never understood why a people would do that to themselves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- The valley ----------------------------------------------------------------------------
    valley = {
      lines = {
        { id = "va_default", text = "Bones, more than any clan could count, and two great skeletons against the cliffs that no one living can put a name to. The ghosts of our own dead walk here too, and they do not always remember which side they are on." },
      },
      choices = {
        { text = "What were the great skeletons?", next = "goliaths" },
        { text = "Desolace once claimed this valley, didn't it?", next = "desolace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goliaths = {
      lines = {
        { id = "go_default", text = "Something enormous that died long before the centaur walked these lands, and that is all I know or need to know. The bones are strong, and they do not argue, which is more than I can say for my apprentices." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    desolace = {
      lines = {
        { id = "de_default", text = "Your maps say one thing and then another, and the bones do not care which. The valley is the door between Desolace and Shen'dralas, and whoever holds the door holds both rooms." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- Who the player is ---------------------------------------------------------------------
    xjehn = {
      big = true,
      lines = {
        { id = "xj_default", text = "Of course I know it; you can stop pretending surprise. You struck at our khan while our eyes were on this valley, and yet here you stand at my fire, asking for work, so tell me, outsider, why should I not have you killed?" },
      },
      choices = {
        { text = "Because I'm strong, and you need strength.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Because I'll answer for it honestly. I'll help undo it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What would you have me do, then?", next = "xjehn2" },
      },
    },
    xjehn2 = {
      lines = {
        { id = "xj2_default", text = "That is a Magram answer, at least, and I can use a Magram answer. The Gelkis sent outsiders to their deaths, and I will put you to work instead, which is the better use of you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xp_default", text = "Your Light forbids it in your lands, outsider, and these are not your lands. The dead here are bones, nothing more, and I put them to better use than your Crusaders do when they smash them into dust." },
        { id = "xp_jehn", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } }, text = "Does it? Then your Light must be very disappointed in you, because your own hands held the staff that raised our khan. I do not think less of you for it, servant of the Light, but I wonder whether you think less of yourself." },
      },
      choices = {
        { text = "The dead deserve rest. I won't help you disturb it.", next = "BACK", fx = { affinity = -1, align = { light = 2 } } },
        { text = "If the dead can save the living, so be it.", next = "BACK", fx = { affinity = 1, align = { light = -2 } } },
        { text = "What do the Crusaders want here?", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "cr_default", text = "Humans in red, with hammers and prayers, who come down from the north to destroy every skeleton they can reach. They break my servants and leave, and the next season there are more bones to raise, so I have never quite understood what they believe they are winning.",
          fx = { learn = { "scarlet_crusade" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "Whether you remember dying, and whether you hate the one who raised you. My servants do not hate me, as far as I can tell, but none of them has ever woken up the way you did, and I would like to know which way I should fear." },
      },
      choices = {
        { text = "We remember. And we never forgive the ones who raised us.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I remember, but I chose my own road. So could they.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "Yours costs more, because your demons want something back and my dead want nothing at all. When your servant turns on you, outsider, remember that mine never could." },
      },
      choices = {
        { text = "My demons serve because I am stronger than they are.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every servant turns, Orgrul. Even yours, someday.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "Let them cry. The earth gave the Gelkis nothing but a reason to kneel, and the Magram have done well enough without its blessing." },
      },
      choices = {
        { text = "The earth will answer this desecration one day.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits have no claim on the dead here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "Cenarius begat Zaetar, and Zaetar and Theradras begat the centaur, so the stories say, and Magra was the third of their children and the first of our khans. The Gelkis follow the mother, and the Magram claim the father's side, which is the side that did not crawl into the mud." },
      },
      choices = {
        { text = "Cenarius is no centaur's father.", next = "xnelf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf2 = {
      big = true,
      lines = {
        { id = "xn2_default", text = "Tell that to the bones in Maraudon, elf. Your demigod's blood runs in us whether he wanted it to or not, and that is why your people have never quite known whether to pity us or hunt us." },
      },
      choices = {
        { text = "Then live up to his blood, and stop raising the dead.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "His blood or not, you hit hard. That's enough for me.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "They should not, and I would not trust yours either. But you are here, and the Gelkis are there, and the dead do not care what hooves walked over them, so we may yet find a use for each other." },
      },
      choices = {
        { text = "The Earth Mother would not want this alliance.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A use for each other is enough for now.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = {
        { id = "xw_default", text = "They can stand where they are put and fight until they fall apart, and then I put them back together. Do not fight them unless I tell you to, outsider, because they do not stop when they are hurt." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Red-robed humans with hammers who come to smash my servants. The dead are not frightened of them, and neither am I." } },
    highborne = { { id = "tp_highborne", text = "Elves who lived in the ruins to the south and threw their strength away. The old one on the hill is all that walks there now, apart from the ghosts." } },
    background = { { id = "tp_bg", text = "I am Magram, and I serve my clan with the dead of this valley. That is all you need to know about me, outsider." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the bones in this valley, even the ones that seem to be resting. Especially those ones." } },
    _none = { { id = "tp_none", text = "That is no business of the Magram, and so it is no business of mine." } },
  },
}

P:NPC {
  key = "shd_hagiak", id = TODO_NPC("Hagiak"), name = "Hagiak",
  bible = "bibles/shendralas.md", role = "questgiver", tier = "quest",
  communities = { "magram", "magram_front" }, temper = { "gruff", "steady" }, values = { "strong", "loyal" },
  notices = { "class", "deeds" },

  impression = {
    first = "Hagiak holds the Magram Front with hungry warriors and no patience for talk. He looks at outsiders the way a quartermaster looks at a cart, wondering how much it can carry.",
    third = "{name} met Hagiak, the Magram warrior who holds the clan's front against the Bristleback quilboar.",
  },

  greetings = {
    { id = "g_default", text = "This is the front, outsider. Make yourself useful or make yourself scarce." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; the pigs have not stopped, so I have not stopped needing hands." },
    { id = "g_bristle", when = { killed = { name = "Bristleback", min = 25 } }, text = "You smell of quilboar, outsider, which means you have been busy. Good." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, outsider, and the pigs did not stop while you were away, so make yourself useful again." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have more strength than you did when you last came to the front, outsider, which means the pigs will learn your name the hard way." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you made someone in the valley back down, outsider, and that is the only kind of talk I respect, so do the same to the quilboar." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A fighter, at last. I have warriors enough at the front, but they are hungry warriors, and a hungry warrior spends the whole fight thinking about roast boar instead of the spear in front of him." },
    { id = "n_boar", cat = "deeds", when = { killed = { name = "Bristleback", min = 25 } },
      text = "You have been at the quilboar, I can tell by the stink. Every pig you put down is one less mouth eating what should be ours." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Hagiak, and I hold the Magram Front. The Bristleback dig in at their retreat, my warriors dig in here, and between us lies a stretch of ground nobody can eat from." },
        { id = "h_bristle_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Bristleback Retreat"), days = 3 } },
          text = "Orgrul sent you, then. He sends me bones and promises, and this time he has sent me something with a pulse, so I will try not to complain." },
        { id = "h_starve", when = { questActive = TODO_QUEST("Threat of Starvation") },
          text = "My warriors are chewing old harness straps to fool their bellies, outsider. Every day you take is another day of that, so be quick." },
        { id = "h_starve_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Threat of Starvation"), days = 3 } },
          text = "The warriors have eaten, which is more than I could promise them a few days ago. They will fight for you now, and they will not say so, so I am saying it for them." },
        { id = "h_long", when = { questActive = TODO_QUEST("Long-Term Solutions") },
          text = "One full meal does not win a war. I want something that will last, outsider, and so do you, if you ever want to stop coming back here." },
        { id = "h_long_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Long-Term Solutions"), days = 3 } },
          text = "That will hold us a while, longer than anything the shamans have tried. Go back to Orgrul now; he has waited long enough, and I would rather he waited somewhere else." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Orgrul") },
          text = "Why are you still here? Orgrul is waiting in the valley, and he does not like to wait." },
        { id = "h_magram", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } },
          text = "They say an outsider raised our khan. I did not believe it until I saw the khan, and I still do not quite believe it about you." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A shu'halo at the Magram Front. The Bristleback are your old enemies as well as ours, so for once we want the same thing." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } },
          text = "A healer. My warriors bleed more than they eat these days, so if you know how to close a wound, you are welcome at my fire." },
      },
      again = {
        { id = "h_again", text = "What else? Talk does not fill bellies." },
        { id = "h_again2", text = "Ask, then, but be quick about it." },
      },
      choices = {
        { text = "What's the fight with the Bristleback about?", next = "fight" },
        { text = "Why are your warriors starving?", next = "hunger" },
        { text = "What do you make of Orgrul?", next = "orgrul" },
        { text = "The quilboar have troubled my people too.", next = "xtauren", when = { race = "Tauren" } },
        { text = "I can tend your wounded, Hagiak.", next = "xhealer", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "I could hunt for the front.", next = "xhunter", when = { class = { "HUNTER", "DRUID" } } },
        { text = "Let me fight at the front.", next = "xwarrior", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "Ground, and what grows on it, and what runs across it. The pigs would take every hill between their retreat and the valley if we let them, and we have no intention of letting them." },
      },
      choices = {
        { text = "Why did the quilboar come here?", next = "fight_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight_why = {
      lines = {
        { id = "fw_default", text = "Their name says it: they retreated here, pushed out of somewhere better, and now they mean to keep what they found. A beaten enemy with nowhere left to run fights the hardest, and that is the enemy I have." },
      },
      choices = {
        { text = "Could you make peace with them?", next = "fight_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight_peace = {
      big = true,
      lines = {
        { id = "fp_default", text = "Peace with pigs? The Magram respect strength, outsider, and a clan that makes peace with something weaker has just told the world it is weak too." },
      },
      choices = {
        { text = "Peace would feed your warriors faster than war.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then break them, and take what they hold.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunger = {
      lines = {
        { id = "hu_default", text = "Because the front eats faster than the hunters can feed it, and the quilboar foul every patch of ground they leave. Orgrul's dead do not need to eat, which is a fine thing for Orgrul to say, but my warriors are still alive." },
      },
      choices = {
        { text = "Then let the dead hold the line.", next = "hunger_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunger_dead = {
      big = true,
      lines = {
        { id = "hd_default", text = "And what are my warriors, then, when the dead can do their work? A clan that hands its battles to bones forgets how to fight, and I will not lead a clan like that." },
      },
      choices = {
        { text = "You're right. The living must fight their own wars.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Use every weapon you have. Pride won't feed anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orgrul = {
      lines = {
        { id = "or_default", text = "He is clever, and he serves the clan, and I would never say a word against him in front of the khan. But he talks to bones more than he talks to warriors, and the warriors have noticed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtauren = {
      lines = {
        { id = "xt_default", text = "Then we share one enemy, which is more than a centaur and a shu'halo usually share. Do not mistake it for friendship, but I will take your spear if you are offering it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhealer = {
      big = true,
      lines = {
        { id = "xh_default", text = "Do it, then, and do it well. Some of my warriors will refuse an outsider's hands, and you will have to decide whether to heal them anyway." },
      },
      choices = {
        { text = "A wound doesn't care about pride. I'll heal them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Those who refuse my help made their choice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhu_default", text = "Hunt where the quilboar have not been, if you can find such a place, and bring meat, not trophies. My warriors cannot eat the heads you hang on your belt." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarrior = {
      lines = {
        { id = "xw_default", text = "Fight, then, but fight beside my warriors, not in front of them, because they will not follow an outsider and they will not forgive one who makes them look slow." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a Magram warrior, I hold the front, and I have not slept dry in a month. That is all the story there is." } },
    advice = { { id = "tp_ad", text = "Keep away from the pigs' tunnels unless you want to meet the whole herd at once, and if you go in anyway, burn your boots after." } },
    _none = { { id = "tp_none", text = "Ask Orgrul. He knows more things, and cares about more of them." } },
  },
}

P:NPC {
  key = "shd_nerlokh", id = TODO_NPC("Nerlokh"), name = "Nerlokh",
  bible = "bibles/shendralas.md", role = "questgiver", tier = "quest",
  communities = { "gelkis" }, temper = { "proud" }, values = { "brave", "devout" },
  notices = { "deeds", "class" },

  impression = {
    first = "Nerlokh of the Gelkis watches the Magram from the edge of the Valley of Bones and is plainly itching to do something about them. He talks of the Earth Mother with real faith and of his own elders with less patience.",
    third = "{name} met Nerlokh, a Gelkis centaur who watches the Magram at the Valley of Bones.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice low, outsider. The Magram have ears in the bones." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Good; there is still more to see in that valley than I like." },
    { id = "g_magram", when = { killed = { name = "Magram", min = 30 } }, text = "You have been thinning the Magram, I see. The Earth Mother will remember it." },
    { id = "g_away", when = { away = 14 }, text = "You came back after {away}, outsider, and the Magram have raised more bones in that time than I like to count, so keep your voice low and listen." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word among the Gelkis is that you helped us, outsider, and the Earth Mother remembers such things, as do I." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked one of our people round, outsider, which is more than I can do with my own elders, so perhaps you should speak to Uthek for me." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk with the earth, I can tell. Then you feel what the Magram are doing in that valley, and you know it is wrong." },
    { id = "n_magram", cat = "deeds", when = { killed = { name = "Gelkis", min = 30 } },
      text = "I know the smell of a Magram friend, outsider, and you reek of one. Say what you came to say and be gone." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Nerlokh of the Gelkis. The Magram are raising the dead in the Valley of Bones, and while their eyes are on the bones, their village is poorly watched." },
        { id = "h_checking", when = { questActive = TODO_QUEST("Checking Things Out") },
          text = "Look carefully at what the Magram are doing, outsider, and come back and tell me all of it. I need to know how deep their attention runs before I decide anything." },
        { id = "h_jehn_active", when = { questActive = TODO_QUEST("Khan Jehn"), questDone = TODO_QUEST("Checking Things Out") },
          text = "Swift, outsider, but do not underestimate him. A khan is not a thing to be trifled with, and Jehn least of all." },
        { id = "h_jehn_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Khan Jehn"), days = 7 }, questDone = TODO_QUEST("Checking Things Out") },
          text = "Jehn is dead? Then the Earth Mother guided your hand, and Uthek can scold me all he likes, because a dead Magram khan is worth a scolding." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "One who walks with Cenarius's teaching. The Gelkis honor the earth as you do, outsider, and the Magram mock us for it." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "A healer of the outsiders. Look at what the Magram do in that valley and tell me your gods would allow it." },
      },
      again = { { id = "h_again", text = "What else? We should not linger here long." } },
      choices = {
        { text = "What are the Magram doing in the valley?", next = "valley" },
        { text = "Why do the Gelkis and Magram fight?", next = "feud" },
        { text = "Who are your elders?", next = "elders" },
        { text = "Jehn is dead. What happens now?", next = "after", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Checking Things Out") } } } },
        { text = "I walk the earth's path too.", next = "xearth", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "No god of mine would allow that, Nerlokh.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Farewell, Nerlokh.", next = "END" },
      },
    },
    valley = {
      lines = {
        { id = "va_default", text = "Raising bones and putting them to work, the way a farmer puts oxen to the plough. They think it makes them strong, but a clan that needs the dead to fight for it is a clan running out of the living." },
      },
      choices = {
        { text = "And while they're busy?", next = "valley_opening" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_opening = {
      big = true,
      lines = {
        { id = "vo_default", text = "While they are busy, Magram Village is weak, and Khan Jehn has fewer guards than he has had in years. I would rather Uthek or Khan Shaka gave the order, but the window will close before word could reach Gelkis Village and come back." },
      },
      choices = {
        { text = "Then strike now, before the chance is gone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Wait for your khan's order. That's the right way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feud = {
      lines = {
        { id = "fe_default", text = "The Gelkis honor the Earth Mother, Theradras, and trust her to protect us, as children should. The Magram call that weakness and worship nothing but strength, and they have been trying to prove it on our backs for as long as anyone remembers." },
      },
      choices = {
        { text = "Does the Earth Mother protect you?", next = "feud_protect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feud_protect = {
      lines = {
        { id = "fp_default", text = "She does, in her way, which is slow and deep like stone. The Magram want answers by nightfall, and the earth does not give answers by nightfall, and that is the whole of the war if you think about it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elders = {
      lines = {
        { id = "el_default", text = "Uthek the Wise speaks for us at Gelkis Village, and Khan Shaka leads us. Uthek is careful, very careful, and sometimes I think careful is only a polite word for slow." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      big = true,
      lines = {
        { id = "af_default", text = "Now the Magram choose a new khan, and we prepare for whatever they do next. Uthek says I had no authority to suggest it, and he is right, and I would do it again." },
      },
      choices = {
        { text = "You were right to act. Victory needs no permission.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Uthek is right. Next time, ask first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xearth = {
      lines = {
        { id = "xe_default", text = "Then you feel it in the valley floor, like a bruise that will not heal. The bones belong to the earth, and every one the Magram pull up is taken from her." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "Then help us, outsider, because the Gelkis cannot break the Magram alone, and your gods do not seem to be in any hurry to do it for us." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a Gelkis, a child of the earth, and I watch the Magram so my clan does not have to." } },
    advice = { { id = "tp_ad", text = "Never trust a Magram who smiles at you. They only smile when they have already decided what you are worth." } },
    _none = { { id = "tp_none", text = "Ask Uthek at Gelkis Village. He knows everything, given enough time to think about it." } },
  },
}
