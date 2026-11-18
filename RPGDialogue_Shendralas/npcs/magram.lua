-- The centaur of Shen'dralas: Orgrul in the Valley of Bones, Hagiak at the Magram Front, and the Gelkis
-- Nerlokh watching them both. Voice: bibles/shendralas.md
local P = RPGDialogueAPI:Pack("rpgd.shendralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shd_orgrul", id = TODO_NPC("Orgrul"), name = "Orgrul",
  bible = "bibles/shendralas.md", role = "questgiver", tier = "major",
  communities = { "magram", "valley_of_bones" }, temper = { "sharp", "proud" }, values = { "strong", "cunning" },
  likesTone = "blunt",
  notices = { "class", "race", "deeds" },

  impression = {
    first = "Orgrul of the Magram works among the bones of the valley as calmly as a farmer among his rows. He never raises his voice, and he watches every outsider as if he were weighing what their bones would be good for.",
    third = "{name} met Orgrul, a Magram centaur who works necromancy in the Valley of Bones on behalf of his clan.",
  },

  greetings = {
    { id = "g_default", text = "Outsider. Watch where your feet go; some of these bones are still in use." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The valley is quieter when you are in it, which tells me something about you." },
    { id = "g_hated", when = { reputation = { faction = "Magram Clan Centaur", max = "hostile" } }, text = "You come into my valley with Magram blood still under your nails, outsider. Speak quickly, because the bones are listening and they remember faces." },
    { id = "g_magram", when = { all = { { questDone = TODO_QUEST("Khan Jehn") }, { questDone = TODO_QUEST("Return to Orgrul") } } }, text = "Welcome back to the valley, Magram." },
    { id = "g_gelkis", when = { any = { { killed = { name = "Gelkis", min = 30 } }, { reputation = { faction = "Magram Clan Centaur", min = "friendly" } } } }, text = "There is Gelkis blood on you, and plenty of it. Good; come closer." },
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
        { id = "h_dd_longterm", when = { questDone = TODO_QUEST("Long-Term Solutions") },
          text = "Hagiak sends word that his warriors have eaten well for a week, and that an outsider is to thank for it. He has never once sent me word of anything good, so I suspect you frightened him into it." },
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
          text = "The valley floor is a mountain of bones, and I want more of it piled at my feet. Bring what I asked for, and do not stop to wonder whose it was." },
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
        -- Opinion pass: word from the Magram Front.
        { id = "h_o_doubt", once = true, when = { gossip = { topic = "shd_orgrul", stance = "distrust" } },
          text = "Hagiak's warriors tell me you said I trust bones more than warriors. They told me quickly, outsider, because they wanted to see what I would do, and I have done nothing, which frightens them more." },
      },
      again = {
        { id = "h_again", text = "What else? The bones will not raise themselves while we talk." },
        { id = "h_again2", text = "Speak, outsider. I am listening." },
      },
      choices = {
        { text = "Why raise the dead at all?", next = "why" },
        { text = "These outcasts seem to trouble the clan.", next = "outcasts" },
        { text = "Something has happened to your khan.", next = "khan" },
        { text = "The Magram can't have many friends among the clans.", next = "clans" },
        { text = "This valley is full of bones.", next = "valley" },
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
        { text = "The dead have no say in it, then.", next = "why_say" },
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
        { text = "The strong should protect the weak, not use them.", next = "BACK", reply = "Then you have never watched a Gelkis protect the weak, outsider, because they do it by kneeling in the dirt and waiting for the earth to save them.", fx = { align = { light = 1 } } },
        { text = "A hard law, but an honest one.", next = "BACK", reply = "Honest, yes, and the valley has never pretended otherwise, so perhaps your bones will be useful to someone after all, though not today.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "They must have done something ugly to get thrown out.", next = "outcasts_why" },
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
        { text = "Mercy isn't weakness, Orgrul.", next = "BACK", reply = "In your lands it may not be, but in this valley mercy is a door left open at night, and the Gelkis have walked through ours too many times.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "A traitor is a traitor. Let the vultures have him.", next = "BACK", reply = "At last you speak like a Magram, outsider, and the vultures of this valley have never once complained about the company we send them.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "Some things should stay dead, khans included.", next = "BACK", reply = "Some things, perhaps, but not a khan, and not while the Gelkis still laugh about the last one, so keep your counsel to yourself.", fx = { align = { order = 1 } } },
        { text = "Then show the Gelkis what a stubborn clan can do.", next = "BACK", reply = "Now that is a thing worth watching, and I will make sure the Gelkis have a good view of it before they die.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_jehn = {
      big = true,
      lines = {
        { id = "aj_default", text = "It meant the Gelkis learned that killing a Magram khan only buys a short rest. It also meant that an outsider showed more loyalty to this clan than some of those born to it, which I do not understand, but I will not refuse." },
      },
      choices = {
        { text = "I did it for the clan. That's all.", next = "BACK", reply = "Then you understand more than some who were born in this valley. I will not ask you why; the answer would only spoil it.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I did it for the reward. Don't make it more.", next = "BACK", reply = "Then you are honest about your greed, which is more than the Gelkis manage, and I prefer a mercenary who knows his price to a friend who does not.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The clans -----------------------------------------------------------------------------
    clans = {
      lines = {
        { id = "cl_default", text = "The Gelkis are our enemies, and the Kolkar and the Maraudine are no friends either. The Gelkis respect the earth and trust Theradras to protect them, and the Magram respect strength, and only one of those has ever kept a clan alive." },
      },
      choices = {
        { text = "There are quilboar at Bristleback Retreat too.", next = "quilboar" },
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
        { text = "Those great skeletons belonged to something enormous.", next = "goliaths" },
        { text = "Desolace once claimed this valley, didn't it?", next = "desolace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goliaths = {
      lines = {
        { id = "go_default", text = "Something enormous that died long before the centaur walked these lands, and that is all I know or need to know. The bones are strong and they do not argue, and I wish my apprentices would learn from them." },
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
        { text = "Because I'm strong, and you need strength.", next = "BACK", reply = "Strength I understand, outsider, so I will let you live today and watch you closely tomorrow, because the strong are also the ones who strike twice.", fx = { align = { honor = -1 } } },
        { text = "Because I'll own what I did and help undo it.", next = "BACK", reply = "Honesty, from you, at my fire, is either very brave or very foolish, and I have not decided which, so prove it with work before I decide for you.", fx = { align = { honor = 1 } } },
        { text = "What would you have me do, then?", next = "xjehn2" },
      },
    },
    xjehn2 = {
      lines = {
        { id = "xj2_default", text = "Work, and plenty of it. The Gelkis sent outsiders to kill our khan, and I will put you to work undoing what they did, which is the better use of you." },
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
        { text = "The dead deserve rest. I won't help you disturb it.", next = "BACK", reply = "Then go back to your Light and your lands, outsider, and leave the bones of Shen'dralas to those who know what they are worth.", fx = { affinity = -1, align = { light = 2 } } },
        { text = "If the dead can save the living, so be it.", next = "BACK", reply = "So, even a priest can learn sense in this valley, and I will remember that the Light bends when it is hungry enough.", fx = { affinity = 1, align = { light = -2 } } },
        { text = "I've seen Crusaders in red down here.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "cr_default", text = "Humans in red, with hammers and prayers, who come down from the north to destroy every skeleton they can reach. They break my servants and leave, and the next season there are more bones to raise, so I have never quite understood what they believe they are winning.",
          fx = { learn = { "scarlet_crusade" } } },
      },
      choices = {
        { text = "You want to know what I think of them?", next = "cr_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Opinion pass: Orgrul wants an outsider's judgement of the Crusade.
    cr_ask = {
      big = true,
      lines = { { id = "ca_default", text = "I do. You have seen these red ones in your own lands, outsider, and I have only seen them die in mine. Are they warriors, or fools?" } },
      choices = {
        { text = "Fanatics. They'd burn a village to save it.", next = "cr_ask_fanatic", fx = { opinion = { scarlet_crusade = "fanatics" }, align = { light = 1 } } },
        { text = "Fools. Let them break themselves on your bones.", next = "cr_ask_fools", fx = { opinion = { scarlet_crusade = "fools" }, align = { light = -1 }, affinity = 1 } },
        { text = "They fight the dead. On that, I'm with them.", next = "cr_ask_with", fx = { opinion = { scarlet_crusade = "useful", necromancy = "wrong" }, affinity = -1 } },
        { text = "They'd burn me on sight. I want them all dead.", next = "cr_ask_fools", when = { race = "Scourge" }, fx = { opinion = { scarlet_crusade = "hate" }, affinity = 1 } },
        { text = "Judge them yourself, Orgrul.", next = "BACK" },
      },
    },
    cr_ask_fanatic = {
      lines = { { id = "caf_default", text = "Then they are strong in belief and weak in sense, which is the most useful kind of enemy. I will remember that, outsider." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cr_ask_fools = {
      lines = { { id = "cao_default", text = "Good. Every hammer they swing is a bone I raise again next season, and their fallen make fine servants. You understand the valley better than I expected." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cr_ask_with = {
      lines = { { id = "caw_default", text = "Then you are a fool too, but an honest one, and I prefer honest fools to the other kind. Mind which side of the valley you sleep on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "Whether you remember dying, and whether you hate the one who raised you. My servants do not hate me, as far as I can tell, but none of them has ever woken up the way you did, and I would like to know which way I should fear." },
      },
      choices = {
        { text = "We remember. And we never forgive the ones who raised us.", next = "BACK", reply = "Then I will keep my servants simple and my bindings tight, and I will thank you for the warning, which is more than your queen would have given me.", fx = { align = { order = -1 } } },
        { text = "I remember, but I chose my own road. So could they.", next = "BACK", reply = "That is a worse answer than the other, outsider, because a servant who can choose is no servant at all, and I will think on it in the dark.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "Yours costs more, because your demons want something back and my dead want nothing at all. When your servant turns on you, outsider, remember that mine never could." },
      },
      choices = {
        { text = "My demons serve because I am stronger than they are.", next = "BACK", reply = "Every master says so, and every master is right until the night he is not, but at least your demon will have the decency to tell you why.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every servant turns, Orgrul. Even yours, someday.", next = "BACK", reply = "Perhaps, outsider, but bones have no ambitions and no grudges, and I would rather wait for a servant with nothing to want than one like yours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "Let them cry. The earth gave the Gelkis nothing but a reason to kneel, and the Magram have done well enough without its blessing." },
      },
      choices = {
        { text = "The earth will answer this desecration one day.", next = "BACK", reply = "Let it answer, then, and it will find the Magram waiting with the bones of everything it ever sent against us.", fx = { align = { order = 1 } } },
        { text = "The spirits have no claim on the dead here.", next = "BACK", reply = "At last, a shaman who does not weep for every stone, and I will let you walk through my valley without a guard, for now.", fx = { align = { order = -1 } } },
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
        { text = "Then live up to his blood, and stop raising the dead.", next = "BACK", reply = "His blood runs in me whether I raise the dead or not, elf, and Zaetar himself never once told us how to live up to it.", fx = { align = { light = 1 } } },
        { text = "His blood or not, you hit hard. That's enough for me.", next = "BACK", reply = "You speak like a Magram, elf, and that is the most unsettling thing a kaldorei has ever said to me, so I will take it as a compliment.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "They should not, and I would not trust yours either. But you are here, and the Gelkis are there, and the dead do not care what hooves walked over them, so we may yet find a use for each other." },
      },
      choices = {
        { text = "The Earth Mother would not want this alliance.", next = "BACK", reply = "The Earth Mother has wanted many things from my people, tauren, and given us very little, so her wishes weigh lightly in this valley.", fx = { align = { honor = 1 } } },
        { text = "A use for each other is enough for now.", next = "BACK", reply = "Good, then we understand each other, which is more than I expected from a shu'halo. Let us both profit before we remember our grudges.", fx = { affinity = 1, align = { honor = -1 } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You see the worth of my work, outsider, where the other clans see only something to spit at. That is a clearer eye than I expected, and I will remember whose it was." },
        { id = "s2", text = "Few praise the one who tends the bones, even among the Magram. Your words are noted, and the valley has heard them as well as I have." },
      },
      fail = {
        { id = "f1", text = "Soft words are what the weak use when they have no strength to offer. Bring me deeds, outsider, and leave the sweet talk for the Gelkis." },
        { id = "f2", text = "You praise me, and I ask myself what you want from my valley. The dead never flatter, and that is one reason I prefer them." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You mock a necromancer among his dead, and you do not look over your shoulder. That is strength, outsider, and the Magram honour strength wherever it stands." },
        { id = "s2", text = "Good. I have no use for those who creep and bow, and you do neither. A khan would kill you or feast you for such words, and I think he would feast you." },
      },
      fail = {
        { id = "f1", text = "The bones have heard what you said, outsider, and they are less patient than I am. Do not speak so to me again in this valley." },
        { id = "f2", text = "You bark like a Gelkis, loudly and from a safe distance. I have raised better warriors than you out of the dirt." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I see it. You are stronger than I judged, and among the Magram the stronger one speaks first, so speak, outsider, and I will listen." },
        { id = "s2", text = "The dead at my back are many, and still you stand there as if they were grass. I respect only strength, and you have shown me enough of it to make me careful." },
      },
      fail = {
        { id = "f1", text = "You threaten me in a valley where everything that ever died still answers when I call. Look around you, outsider, and count again." },
        { id = "f2", text = "Fear is for the living, and I have spent too long among the dead to have much of it left. If you are strong, show it on the Gelkis and not with your voice." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "That is Magram business, and you have not shown me enough strength to hear it. Earn your place in this valley first." },
      { id = "gt2", text = "I do not open my work to every outsider who comes down among the bones. When I think better of you, ask again." },
    },
    scarlet_crusade = { { id = "tp_crusade", text = "Red-robed humans with hammers who come to smash my servants. The dead are not frightened of them, and neither am I." } },
    highborne = { { id = "tp_highborne", text = "Elves who lived in the ruins to the south and threw their strength away. The old one on the hill is all that walks there now, apart from the ghosts." } },
    background = { { id = "tp_bg", text = "I am Magram, and I serve my clan with the dead of this valley. That is all you need to know about me, outsider." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the bones in this valley, even the ones that seem to be resting. Especially those ones." } },
    centaur = { { id = "tp_centaur", text = "The Magram are strong, and the strong survive, and the dead serve the strong as well as the living do. The Gelkis call this a sickness, and they say it from their knees." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon is the tomb of our father, and the Gelkis and the Maraudine squabble over it like dogs. The Magram have their own dead to tend, here in this valley." } },
    scourge = { { id = "tp_scourge", text = "I hear of a great power in the north that raises the dead by the thousand, and sends them where it wishes. It is wasteful, I think, but I would like to see how it binds them." } },
    forsaken = {
      { id = "tp_forsaken", when = { race = "Scourge" }, text = "You were raised and then you broke free of the one who raised you, I am told. Tell me, did you feel the moment it happened, and did it hurt?" },
      { id = "tp_forsaken2", text = "The dead who walk in the north and serve no master are called the Forsaken, I am told. I would like to meet one, and ask how it feels to break a binding." },
    },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback grow fat on the land the Magram need, and they are pushed out of somewhere better, I think, by their hungry look. They will make good bones when they are done." } },
    cairne = { { id = "tp_cairne", text = "The tauren chief in Mulgore is old and strong, and his people are many. The Magram do not need his friendship, and he would not offer it." } },
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
    { id = "g_hated", when = { reputation = { faction = "Magram Clan Centaur", max = "hostile" } }, text = "Half my warriors want your hide for a saddle blanket, outsider. The quilboar want it more, so for now you are useful to me." },
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
    -- Deeds pass: the player killed the outcast necromancers for Orgrul.
    dd_outcasts = {
      lines = { { id = "do_default", text = "Once. They left the clan and kept its craft, and a Magram who does that is a spear pointed at the clan's back. You did what the clan needed, outsider; whether you did it gladly is your own business." } },
      choices = {
        { text = "Traitors get what traitors earn. I'd do it again.", next = "BACK", reply = "Good. Say that at Orgrul's fire and you will find the Magram warm to you faster than you would like.", fx = { align = { light = -1 } } },
        { text = "I'd sooner have brought them home alive.", next = "BACK", reply = "Then you think like a Gelkis, outsider, and I will pretend I did not hear it, because you fight like a Magram.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_outcasts", when = { questDone = TODO_QUEST("Outcast Necromancers") },
          text = "Orgrul says you rooted the outcast necromancers out of their hole. He was pleased, which means his bones will be busier, which means fewer of my warriors die at the front, so I am pleased as well." },
        { id = "h_default", key = true,
          text = "I am Hagiak, and I hold the Magram Front. The Bristleback dig in at their retreat, my warriors dig in here, and between us lies a stretch of ground nobody can eat from. Orgrul works his bones in the valley behind us, and I keep the front." },
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
        -- Opinion pass: word from the Valley of Bones.
        { id = "h_o_fools", once = true, when = { gossip = { topic = "scarlet_crusade", stance = { "fools", "hate" } } },
          text = "Orgrul says you called the red-clad humans fools. For once the necromancer and I agree on something, so I'll tell my warriors to stop spitting when you pass." },
      },
      again = {
        { id = "h_again", text = "What else? Talk does not fill bellies." },
        { id = "h_again2", text = "Ask, then, but be quick about it." },
      },
      choices = {
        { text = "I killed Orgrul's outcasts. They were Magram once.", next = "dd_outcasts", when = { questDone = TODO_QUEST("Outcast Necromancers") } },
        { text = "You and the Bristleback seem to be at war.", next = "fight" },
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
        { text = "Peace would feed your warriors faster than war.", next = "BACK", reply = "Faster, maybe, but my warriors would rather go hungry than share a trough with pigs, and so would I, so do not speak of it again.", fx = { align = { light = 1 } } },
        { text = "Then break them, and take what they hold.", next = "BACK", reply = "That is the Magram way, and the only one my warriors understand, so go and break them, and bring back whatever they were hoarding.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "You're right. The living must fight their own wars.", next = "BACK", reply = "At last, an outsider who knows what a warrior is for. Tell Orgrul I said so; he will not care, but tell him anyway.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Use every weapon you have. Pride won't feed anyone.", next = "BACK", reply = "Pride is the only thing that has fed this clan through every lean winter, outsider, so do not tell me it is worth nothing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orgrul = {
      lines = {
        { id = "or_default", text = "He is clever, and he serves the clan, and I would never say a word against him in front of the khan. But he talks to bones more than he talks to warriors, and the warriors have noticed." },
      },
      choices = {
        { text = "And what do you think of it?", next = "or_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Opinion pass: Hagiak asks the player to settle the argument.
    or_ask = {
      big = true,
      lines = { { id = "oa_default", text = "I think a warrior should ask an outsider, since no Magram will answer me straight. You have seen Orgrul's bones march. Is a dead warrior worth a living one?" } },
      choices = {
        { text = "No. A clan should put its trust in the living.", next = "or_ask_living", fx = { opinion = { necromancy = "wrong", shd_orgrul = "distrust" }, align = { honor = 1 }, affinity = 1 } },
        { text = "The dead don't eat. In a hungry camp, that matters.", next = "or_ask_dead", fx = { opinion = { necromancy = "useful" }, align = { honor = -1 } } },
        { text = "Orgrul is clever, and clever wins wars.", next = "or_ask_clever", fx = { opinion = { shd_orgrul = "respect" } } },
        { text = "That's a matter for the clan, not me.", next = "BACK" },
      },
    },
    or_ask_living = {
      lines = { { id = "oal_default", text = "That is what my warriors say around the fires when they think I'm sleeping. I will not repeat it to Orgrul, and neither will you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    or_ask_dead = {
      lines = { { id = "oad_default", text = "Hm. That is the one argument I cannot answer, not with starvation hanging over every tent on this front. Perhaps you are right, and I only dislike the smell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    or_ask_clever = {
      lines = { { id = "oac_default", text = "Clever, yes. But clever is a cold fire to sit by, outsider, and the warriors would rather follow someone who bleeds." } },
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
        { text = "A wound doesn't care about pride. I'll heal them.", next = "BACK", reply = "Then heal them, and let them curse you while you do it, because a warrior who lives to curse you can still fight for me tomorrow.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Those who refuse my help made their choice.", next = "BACK", reply = "That is a hard answer, and a Magram one, and I will not argue with it. Just do not expect the ones you did heal to thank you for it either.", fx = { align = { order = 1 } } },
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
    quilboar = { { id = "tp_quilboar", text = "The Bristleback hold the ground between us and food, and my warriors are hungry. Every quilboar you kill is a meal my warriors can eat." } },
    centaur = { { id = "tp_centaur", text = "The Magram are strong, but strength does not fill a belly. Orgrul talks to bones more than to warriors, and the warriors notice." } },
    maraudon = { { id = "tp_maraudon", text = "The Gelkis cry over Maraudon and the Maraudine hide in it, and none of them hold the Front. Let them keep their holy hole." } },
    scourge = { { id = "tp_scourge", text = "Orgrul's dead do not eat, which is the only thing I like about them. They do not fight hungry either, which makes me jealous." } },
    cairne = { { id = "tp_cairne", text = "The tauren in Mulgore are fat and many, and they do not come south. If they ever do, my warriors will at least have something to eat." } },
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
    { id = "g_hated", when = { reputation = { faction = "Gelkis Clan Centaur", max = "hostile" } }, text = "You have killed Gelkis, outsider, and I have not forgotten one of their names. Say your piece from there, where my spear can reach you." },
    { id = "g_magram", when = { any = { { killed = { name = "Magram", min = 30 } }, { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } } } }, text = "You have been thinning the Magram, I see. The Earth Mother will remember it." },
    { id = "g_away", when = { away = 14 }, text = "You came back after {away}, outsider, and the Magram have raised more bones in that time than I like to count, so keep your voice low and listen." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word among the Gelkis is that you helped us, outsider, and the Earth Mother remembers such things, as do I." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked one of our people round, outsider, which is more than I can do with my own elders, so perhaps you should speak to Uthek for me." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk with the earth, I can tell. Then you feel what the Magram are doing in that valley, and you know it is wrong." },
    { id = "n_magram", cat = "deeds", when = { any = { { killed = { name = "Gelkis", min = 30 } }, { reputation = { faction = "Magram Clan Centaur", min = "friendly" } } } },
      text = "I know the smell of a Magram friend, outsider, and you reek of one. Say what you came to say and be gone." },
  },

  start = "hello",
  nodes = {
    -- Deeds pass: the player fed the Magram Front for Hagiak.
    dd_starve = {
      lines = { { id = "ds_default", text = "Hungry warriors who will ride against Gelkis camps the moment they can stand. The Earth Mother feeds every creature, I know; Uthek has told me so a hundred times. But the Earth Mother does not have to bury what they kill." } },
      choices = {
        { text = "Hunger makes no clan better. I'd feed yours just as gladly.", next = "BACK", reply = "Perhaps you would. Uthek would like you, outsider, and I am not sure yet whether that is praise.", fx = { align = { light = 1 } } },
        { text = "I was paid to do it. Your feud isn't mine.", next = "BACK", reply = "Then you are a spear for hire, and I will remember which way you pointed last.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_starve", tags = { "news" }, when = { questDone = TODO_QUEST("Threat of Starvation") },
          text = "You fed Hagiak's warriors at the Magram Front, outsider; the wind carries the smell of their cookfires all the way here. Every Magram belly you filled is a spear that will point at my people, and I have not decided whether to forgive you." },
        { id = "h_dd_rep", when = { reputation = { faction = "Gelkis Clan Centaur", min = "honored" } },
          text = "The elders speak your name at the council fire now, outsider, and even Uthek nods when they do. I would not have believed an outsider could earn that, but the Earth Mother has surprised me before." },
        { id = "h_default", key = true,
          text = "I am Nerlokh of the Gelkis. The Magram are raising the dead in the Valley of Bones, and while their eyes are on the bones, their village is poorly watched." },
        { id = "h_checking", when = { questActive = TODO_QUEST("Checking Things Out") },
          text = "Look carefully at what the Magram are doing, outsider, and come back and tell me all of it. I need to know how deep their attention runs before I decide anything." },
        { id = "h_jehn_active", when = { questActive = TODO_QUEST("Khan Jehn"), questDone = TODO_QUEST("Checking Things Out") },
          text = "Strike swiftly, outsider, but do not underestimate Khan Jehn. A khan is not a thing to be trifled with, and Jehn least of all." },
        { id = "h_jehn_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Khan Jehn"), days = 7 }, questDone = TODO_QUEST("Checking Things Out") },
          text = "Jehn is dead? Then the Earth Mother guided your hand, and Uthek can scold me all she likes, because a dead Magram khan is worth a scolding." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "One who walks with Cenarius's teaching. The Gelkis honor the earth as you do, outsider, and the Magram mock us for it." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "A healer of the outsiders. Look at what the Magram do in that valley and tell me your gods would allow it." },
      },
      again = { { id = "h_again", text = "What else? We should not linger here long." } },
      choices = {
        { text = "I fed hungry warriors. I won't apologise for that.", next = "dd_starve", when = { questDone = TODO_QUEST("Threat of Starvation") } },
        { text = "The Magram seem busy in the valley.", next = "valley" },
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
        { text = "That keeps them busy elsewhere, then.", next = "valley_opening" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_opening = {
      big = true,
      lines = {
        { id = "vo_default", text = "While they are busy, Magram Village is weak, and Khan Jehn has fewer guards than he has had in years. I would rather Uthek or Khan Shaka gave the order, but the window will close before word could reach Gelkis Village and come back." },
      },
      choices = {
        { text = "Then strike now, before the chance is gone.", next = "BACK", reply = "You see it as I do, and I am glad of it, because by the time my elders finish arguing, Khan Jehn will have his guards back and his eyes open.", fx = { align = { order = -1 } } },
        { text = "Wait for your khan's order. That's the right way.", next = "BACK", reply = "I know it is, and Uthek would say the same, but the right way may let the Magram rebuild while we wait on a messenger.", fx = { align = { order = 1 } } },
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
      choices = {
        { text = "Should you wait for Uthek's word, then?", next = "el_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Opinion pass: Nerlokh asks whether a warrior should wait for leave.
    el_ask = {
      big = true,
      lines = { { id = "ea_default", text = "That is what I am asking you. You are an outsider and owe the Gelkis nothing, so you can say it plainly: should a warrior wait for the elders' leave, or act when the moment comes?" } },
      choices = {
        { text = "Wait. A people that ignores its elders falls apart.", next = "el_ask_wait", fx = { opinion = { shd_gelkis_elders = "patience" }, align = { order = 1 } } },
        { text = "Act. Careful leaders lose wars.", next = "el_ask_act", fx = { opinion = { shd_gelkis_elders = "slow" }, align = { order = -1 }, affinity = 1 } },
        { text = "Listen to the earth before either of them.", next = "el_ask_earth", when = { class = { "SHAMAN", "DRUID" } }, fx = { opinion = { the_elements = "respect" }, affinity = 1 } },
        { text = "That's for the Gelkis to decide.", next = "BACK" },
      },
    },
    el_ask_wait = {
      lines = { { id = "eaw_default", text = "Uthek would like you. I do not, at this moment, but I will think about what you said, which is more than I do for most of his speeches." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    el_ask_act = {
      lines = { { id = "eaa_default", text = "Yes! The Magram do not wait for leave, and that is why they keep winning. I will remember that you said it, when Uthek asks me why I went." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    el_ask_earth = {
      lines = { { id = "eae_default", text = "The earth is slow too, and patient, and it has never yet told me to wait. Perhaps I have not been listening closely enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      big = true,
      lines = {
        { id = "af_default", text = "Now the Magram choose a new khan, and we prepare for whatever they do next. Uthek says I had no authority to suggest it, and she is right, and I would do it again." },
      },
      choices = {
        { text = "You were right to act. Victory needs no permission.", next = "BACK", reply = "I like to hear it, but I do not believe it, and Uthek would tell you that a clan where every warrior takes his own permission is no clan at all.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Uthek is right. Next time, ask first.", next = "BACK", reply = "She is, and I will ask next time, though I suspect the next time will come as quickly as this one did and leave no more room for asking.", fx = { align = { order = 1 } } },
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
    earth_mother = { { id = "tp_earth_mother", text = "The tauren say Earth Mother, and the Gelkis say Theradras, and I think the earth hears us both. She does not want the Magram's dead walking on her." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon holds our father, and Theradras weeps over him, and the Magram never visit. They are too busy digging up other graves." } },
    centaur = { { id = "tp_centaur", text = "The Magram are our kin and our shame, and Uthek tells me to wait for her word before I act. I am tired of waiting while their dead march." } },
    scourge = { { id = "tp_scourge", text = "The Magram's necromancers raise the bones of this valley, and the earth refuses them. I can feel it in the ground, a sickness that wants to be cut out." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback fight the Magram for the valley's edge, and I hope they both bleed. That is not kind, but the earth is not always kind either." } },
    _none = { { id = "tp_none", text = "Ask Uthek at Gelkis Village. She knows everything, given enough time to think about it." } },
  },
}
