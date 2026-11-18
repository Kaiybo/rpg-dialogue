-- Thunder Bluff, the outer rises and the bridges: Henen Ragetotem and Kon Yelloweyes on Hunter
-- Rise, Birgitte Cranston in the Pools of Vision, Pand Stonebinder and Pawe Mistrunner on Spirit
-- Rise, Sheza Wildmane on Elder Rise, and the three hunters who walk the walkways.
-- Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Henen Ragetotem: a Ragetotem on Hunter Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "henen_ragetotem", id = TODO_NPC("Henen Ragetotem"), name = "Henen Ragetotem", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "stern", "watchful" }, values = { "strength", "honor" },
  notices = { "class" },
  impression = {
    first = "Henen Ragetotem stands on Hunter Rise near the hall where her kinsmen train warriors, and she watches the young ones spar with her arms folded. Very little that they do seems to surprise her, and less seems to impress her.",
    third = "{name} met Henen Ragetotem, who watches the young warriors on Hunter Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. Stand here if you wish, but stand quietly, because I am watching that one's footwork." },
    { id = "g_back", when = { metBefore = true }, text = "You again. They have not improved since you left, if that is what you came to ask." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "You carry your weight on your back hoof, or what you have in place of one. Sark will mend that, if you let him." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Henen, of the Ragetotem. Sark and Torm do the teaching, and I do the watching, because a teacher stands too close to see what his students have truly learned." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Speak, but keep your eyes on the ring as I do." },
      },
      choices = {
        { text = "What do you look for?", next = "look" },
        { text = "You seem hard to impress.", next = "impress" },
        { text = "I'll leave you to your watching.", next = "END" },
      },
    },
    look = {
      lines = { { id = "l_default", text = "Whether they look at their enemy's weapon or at his shoulders. The weapon lies to you, and the shoulders cannot, and a brave who has learned that one thing will outlive ten who are merely strong." } },
      choices = {
        { text = "Who taught you that?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "t_default", text = "A centaur did, in the Barrens, by nearly killing me while I admired his spear. I have been grateful to him ever since, and I told him so before I finished it." } },
      choices = { { text = "A hard teacher. Something else.", next = "BACK" } },
    },
    impress = {
      lines = {
        { id = "i_default", text = "I am a Ragetotem, {class}, and we were the tribe that stood between the centaur and the calves. I have seen what real need makes of a warrior, and a sparring ring on a safe rise shows me only the beginning of it." },
        { id = "i_war", when = { class = "WARRIOR" }, text = "Then impress me, {class}. Go down to the Barrens, come back with something to tell, and I will listen to all of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought for my tribe when we had no walls, and now I watch those who have never known that." } },
    _none = { { id = "tp_none", text = "That is not my concern, {class}. Ask someone who is not busy." } },
  },
}

---------------------------------------------------------------------------
-- Kon Yelloweyes: on Hunter Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "kon_yelloweyes", id = TODO_NPC("Kon Yelloweyes"), name = "Kon Yelloweyes", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "quiet", "wry" }, values = { "patient", "devout" },
  notices = { "class", "pet" },
  impression = {
    first = "Kon Yelloweyes stands at the edge of Hunter Rise and looks out over Mulgore with eyes the colour of dry grass. He says little at first, and then turns out to have noticed everything.",
    third = "{name} met Kon Yelloweyes, a sharp-sighted tauren on Hunter Rise.",
  },
  greetings = {
    { id = "g_hi", text = "I saw you on the bridge, {class}, some while before you saw me. Come and stand here, for the view is better." },
    { id = "g_back", when = { metBefore = true }, text = "You walk a little differently than you did, friend. Something out there has taught you to watch your left side." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Tell me what moves on the plain below us, {class}, and I will tell you what you missed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kon, and they call me Yelloweyes, which was my grandmother's name before it was mine. I come to this edge most days, because a hunter who stops looking soon forgets how." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I can listen and look at once." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "What can you see from here?", next = "see" },
        { text = "Yellow eyes are rare among tauren.", next = "eyes" },
        { text = "Good watching, Kon.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Three kodo by the stream to the south, and a swoop circling over something dead near the road. Further off there is smoke that is too black for a cook fire, where the goblins have their mine." } },
      choices = {
        { text = "Does anyone act on what you see?", next = "act" },
        { text = "Something else.", next = "BACK" },
      },
    },
    act = {
      lines = { { id = "a_default", text = "I tell the Thunderhorn at the Hunter's Hall, and they send word to Bloodhoof if it warrants it. Mostly it does not, {class}, and I am glad, because a watcher with nothing to report has had a good day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eyes = {
      lines = {
        { id = "e_default", text = "They are, and when I was a calf the others said I had a prairie wolf for a father. My grandmother told me the Earth Mother gives odd eyes to those she wants to look harder, and I chose to believe her." },
        { id = "e_tauren", when = { race = "Tauren" }, text = "As you would know. The calves called me wolf-born, and my grandmother said the Earth Mother gives odd eyes to those she wants to look harder, and I have tried to prove her right." },
      },
      choices = { { text = "She sounds wise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted for many years and now I mostly watch, which is the better half of hunting anyway." } },
    _none = { { id = "tp_none", text = "I have not seen it, {class}, and I do not speak of what I have not seen." } },
  },
}

---------------------------------------------------------------------------
-- Birgitte Cranston: Forsaken portal trainer in the Pools of Vision.
---------------------------------------------------------------------------
P:NPC {
  key = "birgitte_cranston", id = TODO_NPC("Birgitte Cranston"), name = "Birgitte Cranston", gender = "female", title = "Portal Trainer",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cold", "precise" }, values = { "knowledge", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Birgitte Cranston teaches the portal spells in the Pools of Vision, beneath Spirit Rise, among the other Forsaken mages. She is exact, unsmiling and visibly tired of the sound of drums coming down through the rock.",
    third = "{name} met Birgitte Cranston, the Forsaken portal trainer in Thunder Bluff's Pools of Vision.",
  },
  greetings = {
    { id = "g_hi", text = "Yes? If you have come to ask the way out of this cave, it is behind you, and if you have come about portals, do go on." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust you arrived where you intended last time, and with everything attached." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, at last, and not another shaman come to stare. You will find I teach quickly and repeat nothing." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Your people have been very hospitable, and very loud. I don't suppose you could ask them about the drumming." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Birgitte Cranston. I teach mages to fold the distance between two places, which the tauren regard as cheating, since they would prefer everyone walked there and thought about it on the way." },
        { id = "h_mage", when = { class = "MAGE" }, text = "Birgitte Cranston. I teach the portal and the teleport, and the difference between them is whether you mean to inconvenience only yourself or your friends as well." },
      },
      again = {
        { id = "h_again", text = "Was there something further, or are you merely enjoying the damp?" },
        { id = "h_again2", text = "Go on, {class}. I have eternity, though I would rather not spend it here." },
      },
      choices = {
        { text = "Teach me the portal spells.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why does a Forsaken teach in Thunder Bluff?", next = "why" },
        { text = "How does a portal work?", next = "portal" },
        { text = "I'll leave you to the damp.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the tauren have no mages of their own and the Horde requires a way on and off this rock that does not involve a lift. The Dark Lady's envoys asked for volunteers, and I am told that I volunteered." } },
      choices = {
        { text = "You don't care for it here.", next = "care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = {
        { id = "c_default", text = "I care for the pools, which are quiet and old and have a certain resonance that is useful to my work. I care rather less for being prayed over by passing shaman, who mean it kindly, which is the worst of it." },
        { id = "c_scourge", when = { race = "Scourge" }, text = "You know precisely how it is. They look at us with such gentle pity, and offer to help us find peace, and one cannot even be properly rude to them because they gave us this cave." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    portal = {
      lines = { { id = "p_default", text = "One fixes a place in the mind so exactly that the world is persuaded you are already standing in it, and then one steps through before it thinks better of the matter. A rune holds the door open for others, which is why I am always short of runes." } },
      choices = {
        { text = "And if the mind wanders?", next = "wander" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wander = {
      lines = { { id = "wa_default", text = "Then the spell simply fails, and you are left standing where you were with a headache, looking foolish. The lurid stories about arriving in halves are told by people who never learned it, though I find them useful for keeping students attentive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied in Lordaeron when it had a king and I had a pulse. Neither loss has affected my technique." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I can't say I am curious. Ask Thurston, who likes to chat." } },
  },
}

---------------------------------------------------------------------------
-- Pand Stonebinder: first aid (bandage) trainer in the Spiritual Healing tent, Spirit Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "pand_stonebinder", id = TODO_NPC("Pand Stonebinder"), name = "Pand Stonebinder", gender = "male", title = "Bandage Trainer",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle", "practical" }, values = { "kind", "devout" },
  notices = { "class", "profession" },
  impression = {
    first = "Pand Stonebinder teaches the binding of wounds in the Spiritual Healing tent on Spirit Rise. He has large, steady hands and the manner of someone who has talked a great many frightened people through a great deal of pain.",
    third = "{name} met Pand Stonebinder, who teaches first aid on Thunder Bluff's Spirit Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Be at ease, {class}. Are you hurt, or have you come to learn how to help those who are?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and walking well. Show me the last bandage you tied, if you still wear it." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } },
      text = "You have no healing of your own, {class}, so you of all people ought to know a clean bandage. Sit, and I will show you." },
    { id = "n_heal", cat = "class", when = { class = { "SHAMAN", "DRUID", "PRIEST" } },
      text = "The spirits answer you, I can see. Learn the bandage anyway, {class}, for the day they are slow to answer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Pand Stonebinder. The shaman on this rise heal with the spirits' help, and I teach what can be done with clean cloth and two hands when no shaman is near." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, {class}?" },
        { id = "h_again2", text = "Speak, friend, for nobody is bleeding just now." },
      },
      choices = {
        { text = "Teach me to bind wounds.", next = "BUSINESS" },
        { text = "Why bandages, on a rise full of healers?", next = "why" },
        { text = "What is the most important thing to know?", next = "know" },
        { text = "Earth Mother keep your hands steady.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the healers are here and the wounds are out there, friend. A brave gored by a quilboar below Red Cloud Mesa cannot wait three days for a shaman, but his hunting brother can stop the blood in three breaths if someone has shown him how." } },
      choices = {
        { text = "Have you had to do it yourself?", next = "yourself" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yourself = {
      lines = { { id = "y_default", text = "Many times, on the long walk, when the centaur harried the herd and the shaman were too few. I bound with strips of my own blanket, and I learned then that the cloth matters less than keeping calm while you tie it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    know = {
      lines = {
        { id = "k_default", text = "Press first, and bind after. The young ones fuss with knots while the blood runs, and the knot never saved anyone, so put your whole hand on the wound and lean until it slows." },
        { id = "k_scourge", when = { race = "Scourge" }, text = "For the living, to press first and bind after. For your people I confess I am still learning, since you do not bleed as we do, and I would be grateful if you told me what serves you." },
      },
      choices = { { text = "Press, then bind. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I bound wounds on the long walk because someone had to, and I have taught it ever since so that more than one of us can." } },
    _none = { { id = "tp_none", text = "That is no wound I know how to dress, friend. Ask the shaman, who see further than I do." } },
  },
}

---------------------------------------------------------------------------
-- Pawe Mistrunner: on Spirit Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "pawe_mistrunner", id = TODO_NPC("Pawe Mistrunner"), name = "Pawe Mistrunner", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "thoughtful", "kind" }, values = { "devout", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Pawe Mistrunner keeps to Spirit Rise, where the smoke of the shamans' fires drifts across the path, and she greets passers-by as though she had been expecting them. She is a Mistrunner who has stepped a little apart from the family's kitchens.",
    third = "{name} met Pawe Mistrunner, a quiet tauren of Spirit Rise.",
  },
  greetings = {
    { id = "g_hi", text = "The spirits are close today, {class}. Walk gently, and you are welcome here." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the rise, friend. It draws some people that way." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The fires lean toward you a little, {class}. The elements know one of their own, even when the shaman is still learning to know them." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "You are from the pools below. I leave a bowl of water at the cave mouth each morning, and I have never asked whether your people want it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Pawe, of the Mistrunners. My family feeds the living on the other rises, and I have taken it on myself to remember the dead on this one, which is only another kind of tending." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, {class}?" },
        { id = "h_again2", text = "Speak softly, friend, and I will hear you." },
      },
      choices = {
        { text = "How do you remember the dead?", next = "dead" },
        { text = "What do you make of the Forsaken below?", next = "forsaken" },
        { text = "Do your kin mind that you left the kitchens?", next = "kin" },
        { text = "Walk with the Earth Mother, Pawe.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "I say their names at sunrise, the ones I knew and the ones I was told of, and I keep the path swept for those who come to do the same. Our dead lie at Red Rocks, east of the bluff, but the remembering is done up here, where the wind can carry it." } },
      choices = {
        { text = "That must be a long list of names.", next = "names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "n_default", text = "It grows, as such lists do, and the long walk added to it more than all the years since. I do not find it heavy, {class}, because a name that is spoken is not yet lost, and I would rather carry them than let them fall." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "They are dead who were not let go, and I cannot think of anything sadder. Some on this rise fear them, but I think the kindest thing we can do is what we do for our own, which is to leave the water out and remember that they had names." },
        { id = "f_scourge", when = { race = "Scourge" }, text = "I think you were not let go, and that it was a cruelty done to you. I do not ask you to want my pity, friend, only to know that someone on this rise says a word for your people at sunrise as well." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Aska sends a bowl across every evening so that I do not forget what I come from. Nan says I have gone strange, and then she sends fruit for the offerings, so I think I am forgiven." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Mistrunner who tends the remembering, where my family tends the pots." } },
    _none = { { id = "tp_none", text = "The spirits have not spoken of it to me, friend, and I would not put words in their mouths." } },
  },
}

---------------------------------------------------------------------------
-- Sheza Wildmane: stands before Elder Rise Drums.
---------------------------------------------------------------------------
P:NPC {
  key = "sheza_wildmane", id = TODO_NPC("Sheza Wildmane"), name = "Sheza Wildmane", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm", "proud" }, values = { "craft", "devout" },
  notices = { "profession", "race" },
  impression = {
    first = "Sheza Wildmane stands before the hut called Elder Rise Drums, with drums of every size stacked in and around it. She taps one with a knuckle now and then, listens, and nods or frowns at what it tells her.",
    third = "{name} met Sheza Wildmane, who keeps the drums on Thunder Bluff's Elder Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome, {class}. Mind where you step, because that small one by your foot took me a whole winter." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the drums, friend. They are the same as before, only a little better seasoned." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You know hides, by your hands. Then you will understand me when I say that a drumhead is the hardest thing to choose a skin for." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "I am told the sound carries down into your pools, friend. If it troubles your people, tell them it is meant as a welcome and not as a warning." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sheza, of the Wildmane, and these are the drums of the Elder Rise. When the elders sit in council or the druids gather, it is these that call them, and I see that every one speaks truly." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The drums can wait, for they are patient things." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "What goes into a good drum?", next = "drum" },
        { text = "What do the drums say?", next = "say" },
        { text = "May I strike one?", next = "strike" },
        { text = "May they always speak truly.", next = "END" },
      },
    },
    drum = {
      lines = { { id = "d_default", text = "A hollowed log that has dried slowly, and a hide that was taken with thanks and stretched while the morning was cool. I am particular about my leathers, {class}, and I keep the finest ones put by for years until the right log comes." } },
      choices = {
        { text = "Which hide makes the best drumhead?", next = "hide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide = {
      lines = { { id = "hi_default", text = "Kodo, for the great council drums, because nothing else has the breadth or the depth of voice. For the small ones I like plainstrider, which is thin and bright, and sounds like rain beginning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    say = {
      lines = {
        { id = "s_default", text = "A slow beat calls the elders to council, a quick one calls the rise to a feast, and a single stroke at dusk means someone has gone to the Earth Mother. Every tauren on the bluff knows them as well as they know their mother's voice." },
        { id = "s_tauren", when = { race = "Tauren" }, text = "You know them already, young one, as you know your mother's voice: the slow beat for council, the quick one for feasting, and the one stroke at dusk that we all hope not to hear." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strike = {
      lines = { { id = "st_default", text = "Not the large ones, for half the rise would come running to a council that nobody called. Tap that small one by the door with your knuckle, gently, and tell me whether it sounds finished to you." } },
      choices = {
        { text = "It sounds finished to me.", next = "BACK", reply = "Then your ear is kinder than mine, friend. I hear a week's more drying in it, but I thank you." },
        { text = "It sounds a little dull.", next = "BACK", reply = "So it does, and you have a good ear. It wants another week in the wind before it will sing." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Wildmane are druids, mostly. I was the one who listened to the drums at their gatherings and not to the teaching." } },
    _none = { { id = "tp_none", text = "No drum of mine has spoken of that, {class}. Ask one of the elders across the rise." } },
  },
}

---------------------------------------------------------------------------
-- Hunter Ragetotem: patrols the bank and the walkways.
---------------------------------------------------------------------------
P:NPC {
  key = "hunter_ragetotem", id = TODO_NPC("Hunter Ragetotem"), name = "Hunter Ragetotem", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk", "stern" }, values = { "dutiful", "strength" },
  notices = { "class" },
  impression = {
    first = "Hunter Ragetotem walks the round past the Thunder Bluff Bank and out along the bridges, spear on his shoulder, and he does not break stride to talk. He has the Ragetotem bearing, which is to say he looks as though he hopes somebody will try something.",
    third = "{name} met Hunter Ragetotem, who patrols the bank and bridges of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Walk with me if you want to talk, {class}, because the round does not wait." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Keep pace, then." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I have seen you looking at the bank, {class}. Look all you please, so long as it is only looking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am a hunter of the Ragetotem, and this turn of the season my hunting ground is the bank and the bridges. It is duller game than centaur, but Cairne asks it, so I walk." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief, {class}." },
        { id = "h_again2", text = "Speak while we walk." },
      },
      choices = {
        { text = "Does anyone ever trouble the bank?", next = "bank" },
        { text = "Why do hunters stand guard here?", next = "hunters" },
        { text = "An apprentice smith thinks you carry his spearhead.", next = "spear", when = { heardLine = "thrag_stonehoof.b_default" } },
        { text = "I'll leave you to your round.", next = "END" },
      },
    },
    bank = {
      lines = { { id = "bk_default", text = "Not while I have walked it. A goblin once tried to argue his way into another goblin's vault, and Atepa had talked him out of it before I had so much as lowered my spear." } },
      choices = {
        { text = "You sound disappointed.", next = "disappointed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    disappointed = {
      lines = { { id = "d_default", text = "A Ragetotem is raised to fight, and a quiet watch sits badly with us. But I have buried enough kin on the plains to know that a quiet watch is what they died for." } },
      choices = { { text = "Well said, hunter. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunters = {
      lines = { { id = "hu_default", text = "The Bluffwatchers hold the lifts and the lodges, and we who hunt take turns on the walkways between, because our eyes are used to distance. From the bridges I can see a dust trail on the Golden Plains before it knows where it is going." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spear = {
      lines = { { id = "s_default", text = "Young Thrag, at Karn's fire. Yes, it is his, and it has held its edge through a season of quilboar. Do not tell him I said so, because Karn wants him hungry a while longer." } },
      choices = { { text = "I'll keep it quiet. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Ragetotem, and I hunted centaur in the Barrens before I walked bridges." } },
    _none = { { id = "tp_none", text = "Not my watch, {class}. Ask at the lodges." } },
  },
}

---------------------------------------------------------------------------
-- Hunter Sagewind: patrols the walkways.
---------------------------------------------------------------------------
P:NPC {
  key = "hunter_sagewind", id = TODO_NPC("Hunter Sagewind"), name = "Hunter Sagewind", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm", "watchful" }, values = { "dutiful", "devout" },
  notices = { "class" },
  impression = {
    first = "Hunter Sagewind walks the rope bridges of Thunder Bluff with his head a little tilted, as if he were listening to the wind more than watching the path. He answers questions briefly and kindly and keeps moving.",
    third = "{name} met Hunter Sagewind, who patrols the walkways of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "The winds are fair today, {class}. Walk beside me if you have a question, for I must keep to my round." },
    { id = "g_back", when = { metBefore = true }, text = "We meet on the bridges again, friend. Hold the rope, the wind is turning." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You step lightly on the planks, {class}, like one who has stalked something. The hall on Hunter Rise will be glad of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am a hunter of the Sagewind, taking my turn on the walkways. Up here the wind tells you most of what you need, if you have the patience to let it finish." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I am still listening." },
        { id = "h_again2", text = "Ask, and keep walking." },
      },
      choices = {
        { text = "What does the wind tell you?", next = "wind" },
        { text = "These bridges sway a great deal.", next = "bridges" },
        { text = "Fair winds, hunter.", next = "END" },
      },
    },
    wind = {
      lines = { { id = "w_default", text = "Smoke from Bloodhoof's fires when it blows from the south, and dust from the Barrens when it comes from the east. Today there is neither, only grass, and that is the wind I like best." } },
      choices = {
        { text = "And when it brings something worse?", next = "worse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worse = {
      lines = { { id = "wo_default", text = "Then I send word to the lifts before the trouble is close enough to see. Twice this year it has been harpies off the northern cliffs, and both times the Bluffwatchers were waiting for them." } },
      choices = { { text = "A good nose saves spears. Something else.", next = "BACK" } },
    },
    bridges = {
      lines = {
        { id = "b_default", text = "They are meant to, because a bridge that will not bend in the wind is one that breaks in it. Keep a hand on the rope and look at the far side, and you will cross as well as any calf does." },
        { id = "b_tauren", when = { race = "Tauren" }, text = "You will stop noticing it within a moon, as we all did. Our weight is the reason the ropes are as thick as your arm, so trust them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted the plains for my family, and now I walk the bridges for all the families." } },
    _none = { { id = "tp_none", text = "The wind has not carried that to me, friend." } },
  },
}

---------------------------------------------------------------------------
-- Hunter Thunderhorn: patrols the walkways.
---------------------------------------------------------------------------
P:NPC {
  key = "hunter_thunderhorn", id = TODO_NPC("Hunter Thunderhorn"), name = "Hunter Thunderhorn", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk", "friendly" }, values = { "dutiful", "loyal" },
  notices = { "pet" },
  impression = {
    first = "Hunter Thunderhorn patrols the walkways of Thunder Bluff at a long easy stride and knows every plank that creaks. He is one of the Thunderhorn, the hunters' tribe, and he would plainly rather be on the plains with a bow.",
    third = "{name} met Hunter Thunderhorn, who patrols the walkways of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Good hunting, {class}. I cannot stop, but you are welcome to walk the round with me." },
    { id = "g_back", when = { metBefore = true }, text = "Good hunting again, friend. Still on the same planks, as you see." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "Keep your companion close on the bridges, {class}. I have fished one frightened cat off the ropes already this season." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am of the Thunderhorn, and half my kin teach at the Hunter's Hall while I walk in circles above them. Every hunter takes a turn at it, and mine ends with the moon." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Mind the loose plank." },
        { id = "h_again2", text = "Ask on, I have the breath for it." },
      },
      choices = {
        { text = "What will you do when your turn ends?", next = "after" },
        { text = "Is the bluff ever attacked?", next = "attacked" },
        { text = "Where is the Hunter's Hall?", next = "hall" },
        { text = "Good hunting, Thunderhorn.", next = "END" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "I will go down the lift without looking back and hunt prairie wolves along the Rolling Plains until I have forgotten what a plank feels like. Holt Thunderhorn at the hall says the wells need watching as well, so perhaps I will do some good while I am at it." } },
      choices = {
        { text = "What's wrong with the wells?", next = "wells" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wells = {
      lines = { { id = "w_default", text = "Goblins fouled them, the Venture Company's, to drive the herds off land they wanted. The druids have been cleansing them one by one, and a hunter can at least keep the goblins from coming back to undo it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    attacked = {
      lines = { { id = "at_default", text = "Not the bluff itself, not once. That is the whole reason Cairne chose it, because our people spent generations being run down on open ground, and nothing runs up a cliff." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hall = {
      lines = {
        { id = "ha_default", text = "On Hunter Rise, across the bridge to the south and east, with the big hides stretched outside. Ask for any Thunderhorn, and you will be in good hands." },
        { id = "ha_hunter", when = { class = "HUNTER" }, text = "On Hunter Rise, across the bridge to the south and east. Tell Urek or Kary that their kinsman on the walkways sent you, and they will work you twice as hard." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Thunderhorn are hunters first and everything else after, and I am no different." } },
    _none = { { id = "tp_none", text = "I could not say, {class}. Ask at the Hunter's Hall, where they have time to sit and think." } },
  },
}
