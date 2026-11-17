-- Bolder'ok: the ogres who turned on the Twilight's Hammer's prophets and joined the Horde.
-- Voice: bibles/riverglades.md ("Horde side (1.10.0)")
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rg_clugfist", id = TODO_NPC("Clugfist"), name = "Clugfist",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "bolderok" }, temper = { "gruff", "proud" }, values = { "loyal", "brave" },
  notices = { "race", "class" },

  impression = {
    first = "Clugfist is an ogre of Bolder'ok who talks slowly and means every word. He calls everyone smaller than him a little one, which is everyone, and he hates the Twilight's Hammer with his whole enormous heart.",
    third = "{name} met Clugfist at Bolder'ok, an ogre whose clan broke with the Twilight's Hammer and now stands with the Horde.",
  },

  greetings = {
    { id = "g_default", text = "Little one comes to Bolder'ok. Speak, and Clugfist listens." },
    { id = "g_friend", when = { questDone = TODO_QUEST("Jom-Jom's Escape") }, text = "Little one is back! Little one is friend, so Bolder'ok is happy." },
    { id = "g_hero", when = { townStanding = { town = "bolderok", min = 55 } }, text = "Bolder'ok knows this little one. Everybody move, and let friend sit by the fire." },
  },

  notice = {
    { id = "n_ogre_size", cat = "race", when = { race = "Tauren" },
      text = "Big little one! You are almost as big as an ogre, so Clugfist will not have to bend down so far to talk." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Shaman, like orc shamans. Clugfist likes orc shamans, because they talk to fire and fire does not ask for blood." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Clugfist is of Bolder'ok. Bolder'ok was Twilight once, but not now, and now Bolder'ok is Horde." },
        { id = "h_jomjom", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Jom-Jom's Escape"), days = 3 } },
          text = "Jom-jom saved by a little one, and Clugfist did not think little ones could carry so much ogre home. Little one is friend now." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Orc! Orcs are good to Bolder'ok. Orcs give us a place to stand when the Twilight throw us out." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll, with the funny tusks. Clugfist met a troll once who threw a spear at a cultist so far it went over the hill." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You smell like dead, little one. The Twilight talk about dead things a lot, so you stand there where Clugfist can see you." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Little one has big axe. Good! Ogres like little ones who hit hard." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You do shadow magic, like the Twilight do. Clugfist does not like it, but Horde says you are friend, so Clugfist keeps fists down." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "You make fire from hands? Two-head magic is like that, and Clugfist does not trust it, but you can try to be good." },
      },
      again = {
        { id = "h_again", text = "Little one has more words? Clugfist is listening." },
        { id = "h_again2", text = "Say more." },
      },
      choices = {
        { text = "Why did Bolder'ok leave the Twilight's Hammer?", next = "left" },
        { text = "Why join the Horde?", next = "horde" },
        { text = "Who is Jom-jom?", next = "jomjom" },
        { text = "What do you know of Krol'dok?", next = "kroldok" },
        { text = "Is Jom-jom all right?", next = "jomjom_after", when = { questDone = TODO_QUEST("Jom-Jom's Escape") } },
        { text = "Do you trust shadow magic now?", next = "xlock", when = { class = { "WARLOCK", "PRIEST" } } },
        { text = "Farewell, Clugfist.", next = "END" },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "le_default", text = "The prophets say the world will end, and they say ogres must bleed on the stones to make it end faster. Bolder'ok said no, and the Twilight threw Bolder'ok out for saying it." },
      },
      choices = {
        { text = "The prophets lied to you?", next = "left_lies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    left_lies = {
      big = true,
      lines = {
        { id = "ll_default", text = "Prophets promise ogres power, and then ogres go up on the altar and never come down. Clugfist counted, and the prophets never go up on the altar, so Clugfist knows they lie." },
      },
      choices = {
        { text = "You were right to break with them.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A clan that betrays its masters may betray again.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "ho_default", text = "Horde fights Twilight, Bolder'ok fights Twilight, so Horde and Bolder'ok are friends. The orcs at Rog'mar give us meat and axes, and we give them ogres, which is a good trade." },
      },
      choices = {
        { text = "And the humans at Farholde?", next = "horde_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_humans = {
      lines = {
        { id = "hh_default", text = "Humans on horses do not like ogres, and Clugfist does not blame them, because the Twilight ogres burned their towns. Bolder'ok stays on this side of the river, and they stay on that side, and nobody gets hit." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jomjom = {
      lines = {
        { id = "jj_default", text = "Jom-jom is young and big and not very clever, and he wanders. He went looking for a friend, and he did not come back." },
        { id = "jj_done", when = { questDone = TODO_QUEST("Jom-Jom's Escape") },
          text = "Jom-jom is young and big and not very clever, and he wanders. Little one brought him home, so now he wanders only where Clugfist can see." },
      },
      choices = {
        { text = "What friend was he looking for?", next = "jomjom_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jomjom_friend = {
      lines = {
        { id = "jf_default", text = "Jom-jom does not say who, and Clugfist does not ask. When an ogre of Bolder'ok goes away, the Twilight usually have him, and it is better not to think about where." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jomjom_after = {
      lines = {
        { id = "ja_default", text = "Jom-jom eats and sleeps and tells the story of the little one who saved him, and it gets bigger each time. Soon little one will be bigger than Clugfist in the story." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, standing = { bolderok = 1 } } } },
    },
    kroldok = {
      big = true,
      lines = {
        { id = "kd_default", text = "Krol'dok is where the Twilight ogres live, with Mugg as their big boss. Clugfist knows the caves, and Clugfist knows Mugg, and Mugg is very strong and very stupid, which is the worst kind.",
          fx = { learn = { "krol_dok" } } },
        { id = "kd_done", when = { questDone = TODO_QUEST("Eye of Mugg") },
          text = "Mugg is dead! Little ones killed him, and Bolder'ok sang about it all night. The Twilight ogres in Krol'dok will fight each other now to be the new boss." },
      },
      choices = {
        { text = "The ogres in Krol'dok were your kin once.", next = "kd_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kd_kin = {
      big = true,
      lines = {
        { id = "kk_default", text = "Some were, and some still are, but they chose the prophets and Bolder'ok chose to live. If they come out of the caves and put down their clubs, Clugfist will let them sit by the fire, but they never come out." },
      },
      choices = {
        { text = "Then they've made their choice. Show no mercy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Keep the fire lit for them anyway.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "No. Clugfist saw what shadow did to ogres who listened too long to the prophets. But the Horde says you are friend, so Clugfist watches your hands and says nothing more." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Clugfist was born in the mound, served the Twilight for many winters, and left. That is all, and it is enough." } },
    advice = { { id = "tp_ad", text = "If the Twilight say they want to help you, run away. Clugfist did not run fast enough the first time." } },
    twilights_hammer = { { id = "tp_th", text = "Liars with robes and altars. They tell ogres the sky will fall, and they make ogres bleed to help it fall faster." } },
    krol_dok = { { id = "tp_kd", text = "Caves in the mountains, full of Twilight ogres and their slaves. Clugfist does not go there any more." } },
    second_war = { { id = "tp_second_war", text = "Clugfist's grandfather marched with the orcs in the big war and came home with one arm and many stories. Clugfist liked the stories, and did not like the arm." } },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock orcs used ogres like hammers in the old wars and threw them away when they broke. Clugfist does not miss the Blackrock, and the Blackrock do not miss Clugfist." } },
    thrall = { { id = "tp_thrall", text = "Little ones say the new orc chief does not make slaves of ogres. Clugfist has not met him, but Clugfist likes what little ones say about him." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron dwarves live in the burning mountain to the west, and they have fire in their eyes and no friends. Clugfist stays away, and so should little one." } },
    _none = { { id = "tp_none", text = "Clugfist does not know that, so little one should ask an orc. Orcs know many things." } },
  },
}

P:NPC {
  key = "rg_jomjom", id = TODO_NPC("Jom-jom"), name = "Jom-jom",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "bolderok" }, temper = { "anxious" }, values = { "loyal", "kind" },
  notices = { "race" },

  impression = {
    first = "Jom-jom is a young ogre, enormous and frightened, who went looking for a friend in the wrong place. He wants very much to go home.",
    third = "{name} met Jom-jom, a young ogre of Bolder'ok who wandered off to find a friend and needed help getting home.",
  },

  greetings = {
    { id = "g_default", text = "Jom-jom wants to go home now." },
    { id = "g_home", when = { questDone = TODO_QUEST("Jom-Jom's Escape") }, text = "Little one! Jom-jom is home, and Jom-jom told everybody about you." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! Orcs are Bolder'ok's friends, so you take Jom-jom home, yes?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jom-jom came looking for his friend, and his friend was not there, and now Jom-jom just wants to go home to Bolder'ok." },
        { id = "h_escape", when = { questActive = TODO_QUEST("Jom-Jom's Escape") },
          text = "You walk in front, little one, and Jom-jom walks behind. If the Twilight come, you hit them, and Jom-jom hits them too." },
        { id = "h_home", tags = { "news" }, key = true, when = { questDone = TODO_QUEST("Jom-Jom's Escape") },
          text = "Jom-jom is home, and Clugfist was very angry and then very happy. Jom-jom will not go wandering again, or not soon." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "You are big for a little one! Jom-jom feels safer with you walking in front." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You look like the bones the Twilight leave behind. You are not going to put Jom-jom on a stone, are you?" },
      },
      again = {
        { id = "h_again", text = "Little one has more questions? Jom-jom will try to answer." },
      },
      choices = {
        { text = "Who was your friend?", next = "friend" },
        { text = "Why did you go alone?", next = "alone" },
        { text = "What's Bolder'ok like?", next = "home" },
        { text = "Do you miss the Twilight's Hammer?", next = "twilight" },
        { text = "I'll get you home, Jom-jom.", next = "END", when = { questBefore = TODO_QUEST("Jom-Jom's Escape") } },
        { text = "Stay close.", next = "END" },
      },
    },
    friend = {
      lines = {
        { id = "fr_default", text = "Jom-jom's friend stayed with the Twilight when Bolder'ok left, because he liked their shiny robes. Jom-jom will not say his name, because saying it makes Jom-jom sad, and he was not there anyway." },
      },
      choices = {
        { text = "Where do you think he went?", next = "friend_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend_where = {
      big = true,
      lines = {
        { id = "fw_default", text = "Clugfist says not to think about it, so Jom-jom tries not to, but Jom-jom thinks about it anyway, mostly at night." },
      },
      choices = {
        { text = "Maybe he's alive. Don't give up on him.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "He chose the Hammer. Let him go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "al_default", text = "Because Clugfist would say no, and Clugfist says no very loudly. Jom-jom is big, so Jom-jom thought it would be easy." },
      },
      choices = {
        { text = "Was it easy?", next = "alone_easy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_easy = {
      lines = {
        { id = "ae_default", text = "No. The Twilight have ogres bigger than Jom-jom, and they have robes who make the ground burn. Jom-jom ran, and hid, and waited for a little one to come." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = {
        { id = "ho_default", text = "Bolder'ok has a big fire and lots of meat and nobody making speeches about the sky falling. The orcs come sometimes and bring axes, and Clugfist lets Jom-jom carry them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    twilight = {
      lines = {
        { id = "tw_default", text = "No! The Twilight made ogres stand in the cold for chanting, and the prophets took ogres up on the stones, and the ogres did not come back down. Jom-jom likes Bolder'ok better." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Jom-jom is from the mound, and then from Bolder'ok. Jom-jom is not very old, Clugfist says, and not very clever either." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "Jom-jom went to the robe men because they said they were friends, and they were not friends. Jom-jom does not want to talk about it, please." } },
    second_war = { { id = "tp_second_war", text = "Clugfist tells stories about the big war, with orcs and dragons and fire. Jom-jom likes the stories, but Jom-jom would not like to be in one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Jom-jom heard about a fair with lights and music and little ones who juggle fire. Jom-jom would like to see it, if they let ogres in." } },
    _none = { { id = "tp_none", text = "Jom-jom does not know. Ask Clugfist; Clugfist knows everything." } },
  },
}
