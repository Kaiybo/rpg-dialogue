-- Darrowshire's two heroes, who rise only when the relics bring the battle back: Joseph Redpath, the captain
-- who held the town and was made into a monster, and Davil Lightfire, the paladin who came home to die. Voice: bibles/darrowshire.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "davil", id = TODO_NPC("Davil Lightfire"), name = "Davil Lightfire",
  bible = "bibles/darrowshire.md", role = "soldier", tier = "service",
  communities = { "darrowshire" }, temper = { "fierce", "earnest" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Even dead, he talks as if the fight might still be won.",
    third = "{name} met the ghost of Davil Lightfire, the Silver Hand paladin who fell defending his home town of Darrowshire.",
  },

  greetings = {
    { id = "g_default", text = "Stand fast, friend! If the dead are walking in Darrowshire again, then so am I." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A brother of the Hand! Light's blessing on you, {class}, and on whatever brought you to my town." },
    { id = "g_battle", when = { questActive = TODO_QUEST("The Battle of Darrowshire") }, text = "Keep Horgus off me this time, friend, and I'll keep the rest off Joseph. We've a debt to settle with that brute." },
    { id = "g_back", when = { metBefore = true }, text = "You again, friend! Good. A familiar face in this square is worth ten prayers." },
  },

  notice = {
    { id = "n_dk", cat = "race", when = { race = "Scourge" },
      text = "You're dead, and you're not trying to kill me. I'll take that as a good sign and leave my hammer where it is." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "You carry a libram at your belt, and you carry it where a squire is taught to. Who trained you? No matter, they did it properly." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The Hand rode beside dwarves of Ironforge more than once, and I never met one who'd leave a wall while there was a friend on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Davil Crokford, born in this town, though the Silver Hand called me Lightfire and it stuck. I came home with my disciples when the Scourge came for Darrowshire, and I'm still here, one way or another." },
        { id = "h_libram", when = { questActive = TODO_QUEST("Heroes of Darrowshire") },
          text = "My libram, is it? Somebody carried it off after the battle, and I hope they read it. Take it when you find it; a book of prayers does more good in living hands than in a ghost's." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quick; the dead don't keep still for long here." },
        { id = "h_again2", text = "Ask, friend. I've little enough time, and I'd rather spend it talking than waiting." },
        { id = "h_again3", text = "Go on, then. I can hear them gathering on the north road, but they're not here yet." },
      },
      choices = {
        { text = "Why did you come back to Darrowshire?", next = "home" },
        { text = "Tell me about Horgus.", next = "horgus" },
        { text = "What do you think of the Silver Hand now?", next = "hand" },
        { text = "How do you keep faith after all this?", next = "xfaith", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Tell me about Captain Redpath.", next = "redpath" },
        { text = "What was Darrowshire like, before?", next = "town" },
        { text = "Who were your disciples?", next = "disciples" },
        { text = "I've spoken with Carlin Redpath at the Chapel.", next = "carlin", when = { heardLine = "carlin.h_default" } },
        { text = "Light keep you, Davil.", next = "END" },
      },
    },

    home = {
      lines = { { id = "ho_default", text = "Because my mother's grave is in the churchyard and my brother's children were in the square, and the Hand could spare me and a handful of disciples, so I took them. I didn't stop to ask whether it was wise." } },
      choices = {
        { text = "Should you have waited for more knights?", next = "home_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_stance = {
      big = true,
      lines = { { id = "hs_default", text = "More knights would have come too late, and Joseph's people would have been ash by then. Still, my disciples died with me, and they had mothers too." } },
      choices = {
        { text = "You were right to ride. Waiting would have doomed them.", next = "BACK", reply = "I'd like to believe that, and some nights I do. Thank you, {class}.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Orders exist for a reason. Waiting might have saved more.", next = "BACK", reply = "They do, and I broke them, and I'd break them again. I'll answer for it when the Light asks.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horgus = {
      lines = { { id = "hg_default", text = "A ghoul the size of a barn, stitched together from who knows how many of our neighbours, and swinging a fist like a millstone. I broke my hammer on him and he broke me, and that was the end of it." } },
      choices = {
        { text = "Then I'll see that he falls first this time.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hand = {
      big = true,
      lines = { { id = "ha_default", text = "I hear the prince turned on us, and the order's scattered, and some of its best wear Scarlet now and burn villages. I'd rather have died in Darrowshire than lived to burn it." } },
      choices = {
        { text = "The Crusade has lost its way. The Dawn keeps the true faith.", next = "BACK", reply = "It has, and I'm glad the Dawn still stands. Tell them a dead knight of Darrowshire blesses them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Crusade is hard, but hard times need hard men.", next = "BACK", reply = "Hard men burned Darrowshire's neighbours on a rumour. I'll not call that faith.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },

    xfaith = {
      big = true,
      lines = { { id = "xf_default", text = "The same way I kept it in the square, {class}: one more swing, one more prayer, and never mind how many are still coming. Faith isn't believing you'll win; it's standing there anyway." } },
      choices = {
        { text = "Standing anyway is all any of us can do.", next = "BACK", reply = "It is, and it was enough for the folk who got out down the south road. I'm glad you understand.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather win. Standing and dying helps nobody.", next = "BACK", reply = "So would I, and so would every one of us in the square. We stood anyway, and some got away.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    redpath = {
      lines = { { id = "rp_default", text = "Joseph Redpath captained the militia, and there wasn't a better man in the shire. He was a farmer with a sword he'd hardly drawn, and he held that line for hours with ploughboys and millers, because they'd have followed him into the lake." } },
      choices = {
        { text = "And what was done to him after?", next = "redpath2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    redpath2 = {
      lines = { { id = "rp2_default", text = "I was already down, friend, so I know it only as the dead know things. They took what was best in him and turned it inside out, and sent it back against his own people. If you can put that right, you'll have done more for Darrowshire than I managed." } },
      choices = {
        { text = "I mean to try.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "tw_default", text = "Small, and proud of it. There was a mill, a chapel with a cracked bell, and a fair every harvest where my brother cheated at the ring toss. Folk left their doors open. I've prayed in the great cathedral, and I'd take our cracked bell over it." } },
      choices = {
        { text = "Did any of them get out?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "tw2_default", text = "Some, down the south road, while we held the square. Joseph's little girl was to be sent to her aunt's, I heard him say so myself. I've never learned whether she went, and it's the one thing I'd ask of you, if you ever hear." } },
      choices = {
        { text = "I'll find out what became of her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    disciples = {
      lines = { { id = "ds_default", text = "Six lads and a girl from the chapter house, none of them knighted, all of them certain they would be. I told them it was my town and my quarrel, and they could stay. Every one of them saddled up before I'd finished saying it." } },
      choices = {
        { text = "That's what you taught them.", next = "BACK", reply = "Aye, it is. That's the weight of it, friend, and the pride of it, both at once.", fx = { affinity = 1 } },
        { text = "You shouldn't have let them come.", next = "BACK", reply = "I've said so to myself every night since. Then I remember their faces at the gate, and I can't make myself wish they'd been cowards." },
        { text = "Something else.", next = "BACK" },
      },
    },
    carlin = {
      lines = { { id = "cl_default", text = "Carlin lives? Light be praised, I saw him go down under three of them at the mill bridge and thought that was the end of him. He was the best shot in the militia and the worst at taking an order. Tell him Davil says he still owes me a hammer." } },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darrowshire born, Silver Hand trained, Darrowshire buried. It's a short story, but I like the ending better than most." } },
    scarlet_crusade = { { id = "tp_sc", text = "Some of them were my brothers once, and they've forgotten what the Light is for." } },
    silver_hand = { { id = "tp_hand", text = "It was the finest company of men and women I ever knew. Whatever's left of it, I'll not hear it spoken of as a thing that failed." } },
    darrowshire = { { id = "tp_darrow", text = "My town. It was worth dying for, friend, and I've had no cause since to change my mind." } },
    holy_light = { { id = "tp_light", text = "It never left me, not even at the end. It's quieter now, like a hearth banked for the night, but it's there." } },
    _none = { { id = "tp_none", text = "Ask Joseph; he always knew more about the town's business than I did." } },
  },
}
