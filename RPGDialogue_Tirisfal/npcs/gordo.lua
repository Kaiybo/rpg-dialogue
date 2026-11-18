-- Gordo, the abomination who walks the road between Deathknell and Brill. Voice: bibles/gordo.md
-- Big, simple, sincere, and stitched from more than one man; he says "us" and means it.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gordo", id = TODO_NPC("Gordo"), name = "Gordo",
  bible = "bibles/gordo.md", role = "worker", tier = "quest",
  communities = { "brill" }, temper = { "simple" }, values = { "loyal", "kind" },
  notices = { "craft", "pet" },
  impression = {
    first = "Gordo is an abomination who calls himself \"us\" and tears weeds out of the ground for a master who never asked for them. He is enormous and stitched together and earnestly trying to help.",
    third = "{name} met Gordo, a hulking abomination who walks the road to Brill gathering weeds for his master.",
  },

  greetings = {
    { id = "g_weeds", text = "Weeds, weeds, more weeds. Gordo pulls them, but they come up squashed." },
    { id = "g_back", when = { metBefore = true }, text = "Friend come back! Us remembers you, because you is the one with small hands." },
    { id = "g_task", when = { questActive = TODO_QUEST("Gordo's Task") }, text = "Gloom weed grows in the fields and by the road. You take it to Master Holland, and he be happy." },
    { id = "g_after", when = { questDone = TODO_QUEST("Gordo's Task") }, text = "Master was not happy about the weeds, was he? Us heard him shouting all the way from the road." },
    { id = "g_away", when = { away = 14 }, text = "You gone {away}! Gordo counted, but us lost count after the fingers ran out." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You got big since last time, but not Gordo big. Nobody is Gordo big." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell like leaves! You is a picker, Gordo can tell, and pickers is the best kind of friend." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Little animal! Gordo wants to pet it, but us is not allowed to pet things anymore, because they stop moving after." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Us is Gordo. Master wants weeds, but Gordo gots big hands and is not good at picking, so maybe you help us and we not hurt you." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Gordo's Task") },
          text = "Master said weeds, so Gordo picks weeds. Gloom weed is the one he wants, us is almost sure, because it is gloomy and so is Master." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gordo's Task"), days = 3 } },
          text = "Master said doom weed, not gloom weed? Gordo was close! Doom and gloom is nearly the same word, and us thinks Master should be more clear." },
        { id = "h_doom", when = { questActive = TODO_QUEST("Doom Weed") },
          text = "You is picking doom weed now? Gordo will stay on the road this time and not help, because Master says Gordo's helping is the problem." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You is stitched back together too, only smaller and neater. Us likes your stitches, they is very tidy." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Big friend! Almost Gordo big! Us has not met anybody with horns before, but they is very nice horns." },
      },
      again = {
        { id = "h_again", text = "More talking? Gordo likes talking, it is easier than picking." },
        { id = "h_again2", text = "Us is listening. All of us." },
      },
      choices = {
        { text = "Who is your master, Gordo?", next = "master" },
        { text = "Why do you say \"us\"?", next = "us" },
        { text = "What do you see on this road?", next = "road" },
        { text = "I know herbs. Let me show you how to pick them.", next = "teach", when = { profession = "Herbalism" } },
        { text = "Someone must have made you, Gordo.", next = "made", when = { class = { "WARLOCK", "PRIEST", "MAGE" } } },
        { text = "I'll help you with the weeds.", next = "BUSINESS" },
        { text = "Goodbye, Gordo.", next = "END" },
      },
    },

    master = {
      lines = { { id = "ma_default", text = "Master Holland, in the graveyard at Brill. He is very small and very busy, and he makes the green bubbling things for the Dark Lady." },
        { id = "ma_done", when = { questDone = TODO_QUEST("Gordo's Task") }, text = "Master Holland, who shouts. Gordo brought the wrong weeds, and you brought the wrong weeds for Gordo, so now us and you is in trouble together." } },
      choices = {
        { text = "Does he treat you well?", next = "master_kind" },
        { text = "Something else, Gordo.", next = "BACK" },
      },
    },
    master_kind = {
      lines = { { id = "mk_default", text = "He does not hit Gordo, because Gordo is too big to hit, and he says thank you sometimes when he forgets to be busy. That is good enough for us." } },
      choices = {
        { text = "You deserve someone who says thank you more often.", next = "master_deserve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_deserve = {
      big = true,
      lines = { { id = "md_default", text = "Gordo does not know what Gordo deserves. Us was put together to carry things and smash things, and now us carries weeds, which is nicer." } },
      choices = {
        { text = "Then thank you, Gordo. For the weeds, and for trying.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "You were made to work. Work is what you're for.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    us = {
      lines = { { id = "us_default", text = "Because Gordo is lots of people stitched together, and it is rude to only talk for one. Sometimes the arm on the left wants to go home, but us does not know where home was." } },
      choices = {
        { text = "Do you remember any of them?", next = "us_remember" },
        { text = "Something else, Gordo.", next = "BACK" },
      },
    },
    us_remember = {
      lines = { { id = "ur_default", text = "One of us was a farmer, because he likes the fields, and one of us was a man who sang, but us cannot remember the songs. Gordo hums sometimes, and it is probably his." } },
      choices = {
        { text = "Hum it for me sometime.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "That's terrible, Gordo. I'm sorry.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    road = {
      lines = { { id = "ro_default", text = "Gordo sees the new dead walking from Deathknell, very wobbly, and the men in red hiding in the trees. The red men shoot arrows at Gordo, but the arrows is small." } },
      choices = {
        { text = "The Scarlet Crusade shoots at you, then.", next = "road_scarlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_scarlet = {
      lines = { { id = "rs_default", text = "Every week, and they shout that Gordo is a monster. Gordo does not shout back, because Master says to stay on the road and not chase things into the trees." } },
      choices = {
        { text = "Good. Stay on the road, Gordo.", next = "BACK", fx = { affinity = 1, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    teach = {
      lines = { { id = "te_default", text = "You pinch it at the bottom, like that, and pull slow? Gordo pinched it at the bottom and the bottom came off, and also some of the ground." } },
      choices = {
        { text = "Gentler, Gordo. Pretend it's a baby bird.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Maybe just stick to carrying, Gordo.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    made = {
      lines = { { id = "mde_default", text = "Gordo does not remember being made, only waking up already big. The Dark Lady's people say us was the Scourge's before, and now us belongs to Brill, which has better weeds." } },
      choices = {
        { text = "You belong to yourself now, Gordo.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Us does not remember before. Before is very dark and very cold, and now is weeds." } },
    advice = { { id = "tp_ad", text = "Do not pick the weeds too hard, because then they is not weeds anymore, they is mush." } },
    scourge = { { id = "tp_scourge", text = "Gordo was Scourge, before, and Gordo did not like it. Gordo likes Brill better, because here nobody shouts in Gordo's head." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken let Gordo stay and give Gordo jobs. Gordo is Forsaken now too, Gordo thinks, but Gordo does not ask, in case the answer is no." } },
    sylvanas = { { id = "tp_sylvanas", text = "Gordo saw the Dark Lady once, from far away. She was very small and very scary, and Gordo stood up very straight." } },
    _none = { { id = "tp_none", text = "Gordo does not know that one. Ask Master; he knows all the words." } },
  },
}
