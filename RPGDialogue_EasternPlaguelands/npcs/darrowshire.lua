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
    first = "Davil Lightfire is a paladin's ghost who came home to Darrowshire to defend it and died doing so. Even dead, he talks of the fight as if it might still be won.",
    third = "{name} met the ghost of Davil Lightfire, the Silver Hand paladin who fell defending his home town of Darrowshire.",
  },

  greetings = {
    { id = "g_default", text = "Stand fast, friend! If the dead are walking in Darrowshire again, then so am I." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A brother of the Hand! Light's blessing on you, {class}, and on whatever brought you to my town." },
    { id = "g_battle", when = { questActive = TODO_QUEST("The Battle of Darrowshire") }, text = "Keep Horgus off me this time, friend, and I'll keep the rest off Joseph. We've a debt to settle with that brute." },
  },

  notice = {
    { id = "n_dk", cat = "race", when = { race = "Scourge" },
      text = "You're dead, and you're not trying to kill me. I'll take that as a good sign and leave my hammer where it is." },
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
      again = { { id = "h_again", text = "What else? Speak quick; the dead don't keep still for long here." } },
      choices = {
        { text = "Why did you come back to Darrowshire?", next = "home" },
        { text = "Tell me about Horgus.", next = "horgus" },
        { text = "What do you think of the Silver Hand now?", next = "hand" },
        { text = "How do you keep faith after all this?", next = "xfaith", when = { class = { "PALADIN", "PRIEST" } } },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "Darrowshire born, Silver Hand trained, Darrowshire buried. It's a short story, but I like the ending better than most." } },
    scarlet_crusade = { { id = "tp_sc", text = "Some of them were my brothers once, and they've forgotten what the Light is for." } },
    _none = { { id = "tp_none", text = "Ask Joseph; he always knew more about the town's business than I did." } },
  },
}
