-- Thunder Bluff, the outer rises and the bridges: Henen Ragetotem and Kon Yelloweyes on Hunter
-- Rise (Birgitte Cranston lives in more_folk.lua), Pand Stonebinder and Pawe Mistrunner on Spirit
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Well met, friend. Stand here as long as you wish. You're welcome among us." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met, {class}. Stand here if you wish, but stand quietly." },
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
      again = { { id = "h_again_x", text = "Speak, then. My eyes are still on the young ones." },
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Speak, but keep your eyes on the ring as I do." },
      },
      choices = {
        { text = "What do you look for?", next = "look" },
        { text = "You seem hard to impress.", next = "impress" },
        { text = "What makes a good warrior?", next = "x_good" },
        { text = "Victory matters more than how you fight.", next = "x_st" },
        { text = "I'm a warrior. Would I impress you?", next = "x_wa", when = { class = "WARRIOR" } },
        { text = "Orcs and tauren fight differently.", next = "x_orc", when = { race = "Orc" } },
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
    x_good = {
      lines = {
        { id = "xg1", text = "Patience, first, which surprises the young. A warrior who waits for the opening lives to fight again, and one who charges blind feeds the vultures of the Barrens. Strength comes after, and courage last." },
      },
      choices = {
        { text = "Courage last?", next = "x_good2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_good2 = {
      lines = {
        { id = "xg2", text = "Every calf has courage. It is the cheapest thing a warrior carries, and the one that gets the most of them killed. I would rather train a frightened tauren who listens than a brave one who does not." },
      },
      choices = {
        { text = "Who were you, before you watched?", next = "x_good3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_good3 = {
      lines = {
        { id = "xg3", text = "A warrior who charged blind, and lost a brother to the centaur because of it. The Earth Mother spared me so that I might stand here and say so to the young ones. They listen, mostly." },
      },
      choices = {
        { text = "A hard lesson. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "I have heard that said by centaur and by Grimtotem, and I have buried tauren who believed it. What do you believe, {class}, truly?" },
      },
      choices = {
        { text = "Honour in battle is worth more than any win.", next = "BACK", reply = "Then you would do well among the Ragetotem.", fx = { align = { honor = 1 } } },
        { text = "The dead don't care how they lost.", next = "BACK", reply = "No, but the living do, and they remember.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_wa = {
      lines = {
        { id = "xw1", text = "Perhaps, if you stood still long enough for me to watch. Spar with Sark or Torm, and I will tell you afterwards what they did not." },
      },
      choices = {
        { text = "I'll do that. Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo1", text = "You fight like a storm and we fight like a stampede, and both are fearsome, but the stampede lasts longer. I have learned much from orcs, and I hope they have learned a little from us." },
      },
      choices = {
        { text = "I think we have. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_cen", text = "The centaur taught me everything I know about war, and none of it kindly." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "I saw you on the bridge, friend, and I smiled. Come, sit with me." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "I saw you on the bridge, {class}, some while before you saw me. I was watching." },
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
      again = { { id = "h_again_x", text = "I see you are still here. Ask what you will." },
        { id = "h_again", text = "What else, {class}? I can listen and look at once." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "What can you see from here?", next = "see" },
        { text = "Yellow eyes are rare among tauren.", next = "eyes" },
        { text = "What was your grandmother like?", next = "x_gm" },
        { text = "The Venture Company must be driven out by force.", next = "x_st" },
        { text = "I'm a hunter. What should I watch for?", next = "x_hu", when = { class = "HUNTER" } },
        { text = "I'm a druid. Do you feel the land?", next = "x_dr", when = { class = "DRUID" } },
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
    x_gm = {
      lines = {
        { id = "xg1", text = "She was a seer of the Bloodhoof, and she could tell a storm by the colour of the grass three days before it came. She gave me her eyes, the elders say, and her patience, though I am still waiting for the patience." },
      },
      choices = {
        { text = "What did she teach you?", next = "x_gm2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gm2 = {
      lines = {
        { id = "xg2", text = "To look at the land as a whole, and not at one thing in it. When the kodo grow restless, when the birds leave the trees, when the river runs low, each one alone means little, but together they tell a story." },
      },
      choices = {
        { text = "And what story do they tell now?", next = "x_gm3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gm3 = {
      lines = {
        { id = "xg3", text = "That Mulgore is wounded at its edges. The Venture Company tears at the Rolling Plains in the north, the Grimtotem grow bold in the south, and the gnolls dig where they should not. The Earth Mother is patient, but she is not blind." },
      },
      choices = {
        { text = "Then we must help her. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Perhaps. Cairne has sent braves against them, and still they come back with more machines. Is force the only answer you see?" },
      },
      choices = {
        { text = "Yes. They only understand strength.", next = "BACK", reply = "Then go and show them. I will watch from here.", fx = { align = { light = -1 } } },
        { text = "No. We should outlast them, as the land does.", next = "BACK", reply = "A patient thought. My grandmother would like you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hu = {
      lines = {
        { id = "xh1", text = "Dust on the horizon where there should be none, and silence where the birds should sing. Those are the two signs that something is moving on the plains that does not belong there." },
      },
      choices = {
        { text = "I'll watch for them. Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "I feel it the way an old kodo feels rain in its bones. You feel it more truly, I think, for the Earth Mother speaks to druids in a voice I only hear as whispers." },
      },
      choices = {
        { text = "A gift we share. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "The Earth Mother sees everything. I only see what she lets me." } },
    background = { { id = "tp_bg", text = "I hunted for many years and now I mostly watch, which is the better half of hunting anyway." } },
    _none = { { id = "tp_none", text = "I have not seen it, {class}, and I do not speak of what I have not seen." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "The spirits are close today, friend, and they're glad you're here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The spirits are close today, {class}. Walk gently, for they're watching you." },
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
      again = { { id = "h_again_x", text = "The spirits are patient. Ask, friend." },
        { id = "h_again", text = "What else would you ask, {class}?" },
        { id = "h_again2", text = "Speak softly, friend, and I will hear you." },
      },
      choices = {
        { text = "How do you remember the dead?", next = "dead" },
        { text = "What do you make of the Forsaken below?", next = "forsaken" },
        { text = "Do your kin mind that you left the kitchens?", next = "kin" },
        { text = "How did you come to this work?", next = "x_how" },
        { text = "The dead should be left in peace.", next = "x_st" },
        { text = "I'm Forsaken. Will you remember me?", next = "x_fs", when = { race = "Scourge" } },
        { text = "I'm a shaman. Do the spirits speak to you?", next = "x_sh", when = { class = "SHAMAN" } },
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
    x_how = {
      lines = {
        { id = "xh1", text = "My grandfather died in the war with the centaur, and nobody in my family could remember the words to say over him. I swore that would not happen again, and I came to Spirit Rise to learn." },
      },
      choices = {
        { text = "Who taught you the words?", next = "x_how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how2 = {
      lines = {
        { id = "xh2", text = "The shamans of the Rise, and an old Bloodhoof woman who knew every name from the days before the city. She has passed now, and I said her name first of all." },
      },
      choices = {
        { text = "Do you have many names to keep?", next = "x_how3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how3 = {
      lines = {
        { id = "xh3", text = "Hundreds, and more each season. I keep them in my head, not on hide, because the spirits like to hear them spoken. Each name is a little fire against the dark, my grandfather used to say." },
      },
      choices = {
        { text = "A beautiful thought. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Many say so, and I understand. But peace is not forgetting, and I do not wake them, I only remember. Is there harm in that?" },
      },
      choices = {
        { text = "No harm. Remembering honours them.", next = "BACK", reply = "Thank you. I hoped you would see it so.", fx = { align = { order = 1 } } },
        { text = "Let the past go. The living need you more.", next = "BACK", reply = "Perhaps. My kin say the same, and I love them for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_fs = {
      lines = {
        { id = "xf1", text = "If you tell me your name, I will. You are dead and still walking, which is strange to me, but you were someone once, and the Earth Mother does not forget her children, even the ones far from home." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    x_sh = {
      lines = {
        { id = "xs2", text = "Not as they speak to you, but they listen, I think. When I say a name and the smoke turns, I like to believe someone has heard. You would know better than I." },
      },
      choices = {
        { text = "They hear you. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "The Earth Mother holds every name I keep. I only say them aloud so that she knows we remember." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Be welcome, friend. Step where you like. The bluff is glad of you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Be welcome, {class}. Mind where you step, because the bluff does not forget." },
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
      again = { { id = "h_again_x", text = "Ask, friend, and I will listen with both ears." },
        { id = "h_again", text = "What else, {class}? The drums can wait, for they are patient things." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "What goes into a good drum?", next = "drum" },
        { text = "What do the drums say?", next = "say" },
        { text = "May I strike one?", next = "strike" },
        { text = "Who made the first drums?", next = "x_first" },
        { text = "Drums should call warriors to battle.", next = "x_st" },
        { text = "I'm a leatherworker. Could I help?", next = "x_lw", when = { profession = "Leatherworking" } },
        { text = "Are there drums for the shamans?", next = "x_sh", when = { class = "SHAMAN" } },
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
    x_first = {
      lines = {
        { id = "xf1", text = "The first tauren, the stories say, who heard the Earth Mother's heartbeat in the ground and wished to answer it. My family has made drums since before Thunder Bluff, when the tribes were scattered." },
      },
      choices = {
        { text = "What did your family do then?", next = "x_first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_first2 = {
      lines = {
        { id = "xf2", text = "They carried drums from camp to camp, and when the tribes were far apart, the beat would carry news across the plains. A good drum could be heard from one hill to the next, and the elders knew every rhythm." },
      },
      choices = {
        { text = "Do you still know them?", next = "x_first3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_first3 = {
      lines = {
        { id = "xf3", text = "Most of them. There is one for a birth, one for a death, one for the hunt and one for danger. I pray to the Earth Mother I never need to beat the last one from Elder Rise." },
      },
      choices = {
        { text = "May she spare you. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Some say so, and some of my drums have gone to the Horde's war camps. But I made them for councils and prayer, not for war. Which do you think they should do?" },
      },
      choices = {
        { text = "War drums keep warriors brave. That's a fine use.", next = "BACK", reply = "Perhaps. I'll make one for the Barrens, then.", fx = { align = { light = -1 } } },
        { text = "Prayer and council are better than war.", next = "BACK", reply = "That is my heart, too.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lw = {
      lines = {
        { id = "xl1", text = "Then bring me a kodo hide, well stretched and without holes, and I'll show you how to tension it. Leather for a drum must be thin and tight, not thick and soft like armor." },
      },
      choices = {
        { text = "I'll bring one. Something else.", next = "BACK" },
      },
    },
    x_sh = {
      lines = {
        { id = "xs2", text = "There are, small hand drums, for calling the spirits of earth and fire. The shamans of Spirit Rise use them, though many say they hear the spirits better with their eyes closed." },
      },
      choices = {
        { text = "I'll try it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "The drums are her heartbeat, my grandmother said. I only try to match it." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "The bluff honours you, friend, and so do I. Walk with me a while." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "I am on my round. If you have something to say, say it quickly." },
    { id = "g_rep1", when = { rep = { faction = "Thunder Bluff", min = "Honored" } }, text = "The bluff honours you, so I will slow my round a step. Only a step, mind." },
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
        { id = "h_thrag", when = { heardLine = "thrag_stonehoof.b_default" }, text = "You have been at Karn's fire, I can smell the coal on you. If young Thrag sent you to ask about his spearhead, say so, and I will tell you what I can." },
      },
      again = { { id = "h_again_x", text = "Still walking. Still listening." },
        { id = "h_again", text = "What else? Be brief, {class}." },
        { id = "h_again2", text = "Speak while we walk." },
      },
      choices = {
        { text = "Does anyone ever trouble the bank?", next = "bank" },
        { text = "Why do hunters stand guard here?", next = "hunters" },
        { text = "An apprentice smith thinks you carry his spearhead.", next = "spear", when = { heardLine = "thrag_stonehoof.b_default" } },
        { text = "What did you hunt in the Barrens?", next = "x_bar" },
        { text = "A guard should never hope for trouble.", next = "x_st" },
        { text = "I'm a hunter too.", next = "x_hu", when = { class = "HUNTER" } },
        { text = "Tauren shouldn't guard goblin coin.", next = "x_ta", when = { race = "Tauren" } },
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
    x_bar = {
      lines = {
        { id = "xb1", text = "Centaur, mostly, the Kolkar of the Barrens, and the occasional quilboar who strayed too far from the thorns. The centaur were the worthiest game, though I would never say so to one of them." },
      },
      choices = {
        { text = "Why were they worthy?", next = "x_bar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_bar2 = {
      lines = {
        { id = "xb2", text = "Because they fought back, and fought well, and never once asked for mercy. A Ragetotem respects that, even in an enemy who killed his kin. Respect does not mean forgiveness." },
      },
      choices = {
        { text = "Will you go back to the Barrens?", next = "x_bar3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_bar3 = {
      lines = {
        { id = "xb3", text = "When this turn of the season ends, and Cairne releases me. The bank does not need a Ragetotem, and the centaur have not grown any friendlier while I have been walking bridges." },
      },
      choices = {
        { text = "Good hunting, then. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "No? You say that because you have never walked the same bridges for a whole season. Tell me, {class}, do you want peace or the hunt?" },
      },
      choices = {
        { text = "Peace. A quiet watch is a good watch.", next = "BACK", reply = "So the elders say, and they are usually right.", fx = { align = { honor = 1 } } },
        { text = "The hunt. Only fools love a dull watch.", next = "BACK", reply = "A fool, perhaps. A Ragetotem, certainly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hu = {
      lines = {
        { id = "xh1", text = "Then you know how dull this is for me, and you will forgive me if I am short with you. Go to the Hunter's Hall below, and tell my kin I am still standing." },
      },
      choices = {
        { text = "I'll tell them. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "It is not goblin coin, it is tauren coin in goblin hands, and I guard the tauren. The goblins only count it. That distinction keeps me from feeling a fool." },
      },
      choices = {
        { text = "Wise distinction. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_cen", text = "The centaur are worthy enemies. I will kill them again someday, and I will respect them while I do." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "The winds are fair today, friend. Walk beside me, if you like." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The winds are fair today, {class}. Keep your distance, please." },
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
      again = { { id = "h_again_x", text = "The wind is still here, and so am I. Ask." },
        { id = "h_again", text = "What else, {class}? I am still listening." },
        { id = "h_again2", text = "Ask, and keep walking." },
      },
      choices = {
        { text = "What does the wind tell you?", next = "wind" },
        { text = "These bridges sway a great deal.", next = "bridges" },
        { text = "How did you learn to listen?", next = "x_how" },
        { text = "Wind is only wind. Trust your eyes.", next = "x_st" },
        { text = "I'm a shaman. The winds talk to me.", next = "x_sh", when = { class = "SHAMAN" } },
        { text = "I'm tauren. Teach me to listen.", next = "x_ta", when = { race = "Tauren" } },
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
    x_how = {
      lines = {
        { id = "xh1", text = "From my father, who was a shaman before he was a hunter. He said the wind was the breath of the Earth Mother and that she always speaks, but we are too loud to hear her." },
      },
      choices = {
        { text = "What does she say?", next = "x_how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how2 = {
      lines = {
        { id = "xh2", text = "That the rain is coming, that the herds are moving, and sometimes that something is burning far away. Last spring the wind smelled of Venture Company smoke for a week before the braves found the camp." },
      },
      choices = {
        { text = "What did the braves do?", next = "x_how3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how3 = {
      lines = {
        { id = "xh3", text = "They drove the goblins back across the river, and the wind smelled of grass again. The Earth Mother does not fight, but she warns, and we fight for her." },
      },
      choices = {
        { text = "Good. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Eyes see only what is in front of them. The wind brings the whole plain to me. But perhaps you have eyes sharper than mine?" },
      },
      choices = {
        { text = "Perhaps. I trust what I can see.", next = "BACK", reply = "Then watch closely, and I will listen for you.", fx = { align = { order = -1 } } },
        { text = "No. Your father's way is wiser.", next = "BACK", reply = "He would be glad to hear you say it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_sh = {
      lines = {
        { id = "xs2", text = "Then you hear them better than I do, and I envy you. Ask them, the next time, what is coming from the Barrens. They always tell me only that something is." },
      },
      choices = {
        { text = "I'll ask. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "Stand at the edge of the bluff at dawn, close your eyes, and do not speak until the sun is warm on your face. Then tell me what you heard. Most young ones hear nothing the first time." },
      },
      choices = {
        { text = "I'll try it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "The wind is her breath. I only try to listen to it." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Good hunting, friend! I can't stop, but I'm glad to see you!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good hunting, {class}. I can't stop, and I wouldn't, for you." },
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
      again = { { id = "h_again_x", text = "Ask, then. The planks will wait." },
        { id = "h_again", text = "What else, {class}? Mind the loose plank." },
        { id = "h_again2", text = "Ask on, I have the breath for it." },
      },
      choices = {
        { text = "What will you do when your turn ends?", next = "after" },
        { text = "Is the bluff ever attacked?", next = "attacked" },
        { text = "Where is the Hunter's Hall?", next = "hall" },
        { text = "Tell me about the Thunderhorn.", next = "x_tribe" },
        { text = "A hunter's place is the plains, not a city.", next = "x_st" },
        { text = "I'm a hunter. Any advice?", next = "x_hu", when = { class = "HUNTER" } },
        { text = "Night elves are hunters too.", next = "x_ne", when = { race = "NightElf" } },
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
    x_tribe = {
      lines = {
        { id = "xt1", text = "We are the hunters' tribe, and we have followed the herds of Mulgore since before memory. Holt, Kary and Urek Thunderhorn teach in the hall below, and every young hunter in the city learns from one of us." },
      },
      choices = {
        { text = "What do the Thunderhorn teach first?", next = "x_tribe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tribe2 = {
      lines = {
        { id = "xt2", text = "To take only what you need, and to thank the beast that feeds you. A hunter who kills for sport is no Thunderhorn, and the Earth Mother turns her face from him." },
      },
      choices = {
        { text = "And the second lesson?", next = "x_tribe3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tribe3 = {
      lines = {
        { id = "xt3", text = "To never hunt alone without a companion. A beast at your side is your eyes when you sleep and your strength when you fall. My own wolf waits for me in the hall, and she sulks when I walk these planks." },
      },
      choices = {
        { text = "A loyal friend. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "I agree with you, and I say it every evening to anyone who will listen. But the city needs protecting too, and someone must do it. Is it wrong to want to be elsewhere?" },
      },
      choices = {
        { text = "No. Do your duty and go home after.", next = "BACK", reply = "So I will, and gladly.", fx = { align = { order = 1 } } },
        { text = "Leave. Your heart's on the plains.", next = "BACK", reply = "Tempting. Don't tell the elders you said it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hu = {
      lines = {
        { id = "xh1", text = "Feed your pet before yourself, and never let it see you afraid. Beyond that, find Holt Thunderhorn below, and he will set you right, though he will make you sweat for it." },
      },
      choices = {
        { text = "I'll find him. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "They are, and good ones, though they hunt with bows and moonlight while we hunt with spears and sun. I would like to see a nightsaber run against a plainstrider someday." },
      },
      choices = {
        { text = "That would be a race. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "Every beast I kill, I thank the Earth Mother for. That is the first rule of the Thunderhorn." } },
    background = { { id = "tp_bg", text = "The Thunderhorn are hunters first and everything else after, and I am no different." } },
    _none = { { id = "tp_none", text = "I could not say, {class}. Ask at the Hunter's Hall, where they have time to sit and think." } },
  },
}
