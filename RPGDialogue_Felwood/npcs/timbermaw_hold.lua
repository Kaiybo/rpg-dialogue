-- Inside Timbermaw Hold: Gorn One Eye (provisioner, and the furbolg who asks you to strike at the Winterfall's demon)
-- and Meilosh (tailor who trades for runecloth).
-- Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Gorn One Eye
---------------------------------------------------------------------------
P:NPC {
  key = "gorn_one_eye", id = TODO_NPC("Gorn One Eye"), name = "Gorn One Eye",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "gruff", "steady" }, values = { "loyal", "protective" },
  notices = { "timbermaw_low" },

  impression = {
    first = "Gorn One Eye keeps the stores in Timbermaw Hold and watches strangers with the one eye he has left. When he finally trusts someone, he trusts them with everything.",
    third = "{name} met Gorn One Eye, the one-eyed Timbermaw furbolg who keeps the hold's provisions and hates the demon behind the Winterfall.",
  },

  greetings = {
    { id = "g_default", text = "Gorn sees you. One eye is enough for that." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } }, text = "Friend of the Timbermaw! Gorn has kept honey back for you, and bread that is not too old." },
    { id = "g_root", when = { questActive = TODO_QUEST("The Root of All Evil") }, text = "The torch, the High Chief's cave, the demon. Gorn has said it three times now, so you will not forget." },
    { id = "g_saved", when = { questDone = TODO_QUEST("The Root of All Evil") }, text = "You saved the hold. Gorn says it every time, because it stays true every time." },
  },

  notice = {
    { id = "n_low", cat = "timbermaw_low", when = { reputation = { faction = "Timbermaw Hold", max = "neutral" } },
      text = "The guards let you in, so Gorn will not chase you out. But you smell of the outside, and Gorn is watching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorn One Eye keeps the stores of Timbermaw Hold: bread, honey, sacks, and things for travellers who go through the mountain. Gorn also keeps watch, because the Winterfall to the north and the Deadwood to the south both want what is in these tunnels." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Root of All Evil"), reputation = { faction = "Timbermaw Hold", min = "friendly" } },
          text = "You have done much for the Timbermaw, and Gorn has watched it all. Now Gorn will tell you what the elders have found, because the Winterfall are not sick by accident. Something is feeding the sickness, and Gorn wants it dead." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Root of All Evil"), days = 3 } },
          text = "Xandivious is dead, the essence is in the elders' hands, and the healing of the Winterfall can begin. It will be slow, and some will never come back to themselves, but you have given them something they did not have yesterday." },
        { id = "h_peace", when = { questActive = TODO_QUEST("The Brokering of Peace") },
          text = "You carry the offering to your king? Good. Gorn does not know your cities, but Gorn knows the Timbermaw have been alone in the mountain too long." },
      },
      again = {
        { id = "h_again", text = "What else? Gorn is not busy, only watching." },
        { id = "h_again2", text = "Speak. Gorn's ears are both still good." },
      },
      choices = {
        { text = "Show me your stores.", next = "BUSINESS" },
        { text = "How did you lose the eye?", next = "eye" },
        { text = "What is feeding the Winterfall's sickness?", next = "root" },
        { text = "Why do the Timbermaw guard the tunnels?", next = "tunnels" },
        { text = "What happens now the demon is dead?", next = "after", when = { questDone = TODO_QUEST("The Root of All Evil") } },
        { text = "You want my people to make peace with yours?", next = "peace", when = { reputation = { faction = "Timbermaw Hold", min = "exalted" } } },
        { text = "Farewell, Gorn.", next = "END" },
      },
    },

    eye = {
      lines = { { id = "ey_default", text = "A Deadwood took it, long ago, when the sickness was new. He was Gorn's cousin, and he did not know Gorn any more, and Gorn did not want to hurt him, so Gorn waited too long." } },
      choices = {
        { text = "I'm sorry, Gorn.", next = "eye_after", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What happened to your cousin?", next = "eye_after" },
      },
    },
    eye_after = {
      lines = { { id = "eya_default", text = "Gorn's cousin is gone now. Gorn does not wait any more when the Deadwood come, and that is the lesson the eye taught, though Gorn wishes it had been cheaper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    root = {
      lines = {
        { id = "rt_default", text = "A demon, hiding near the High Chief of the Winterfall and whispering to him. Its name is Xandivious, and it taught them the firewater, and the firewater opened the door for the sickness. The elders have made a torch that will call it out." },
        { id = "rt_done", when = { questDone = TODO_QUEST("The Root of All Evil") },
          text = "It was Xandivious, and you killed it, at the mouth of the High Chief's own cave. Gorn tells the cubs the story now, and they ask to hear the part with the torch twice." },
      },
      choices = {
        { text = "How does the torch work?", next = "root_torch" },
        { text = "Will killing it cure the Winterfall?", next = "root_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    root_torch = {
      lines = { { id = "rtt_default", text = "Plant it at the mouth of the High Chief's cave in Winterfall Village, and the demon will come to see who has dared. Then you must strike, with friends if you have them, because it will not come gently." } },
      choices = { { text = "I'll bring friends. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    root_cure = {
      big = true,
      lines = { { id = "rtc_default", text = "Not all at once. Its essence will let the elders begin the healing, but some Winterfall have drunk too long and will fight until they die. Some of the elders say every Winterfall should be killed now, to keep the sickness out of the hold." } },
      choices = {
        { text = "Kill the ones who fight. Heal the ones who can be healed.", next = "root_cure_end", fx = { align = { light = 1 } } },
        { text = "The elders are right. Protect the hold first, whatever it costs.", next = "root_cure_end", fx = { align = { light = -1 } } },
        { text = "What does Gorn think?", next = "root_cure_end" },
      },
    },
    root_cure_end = {
      lines = { { id = "rce_default", text = "Gorn thinks of his cousin, and Gorn thinks the Winterfall have cousins too. Gorn will guard the door, and Gorn will hope, and those two things can sit in the same heart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tunnels = {
      lines = { { id = "tn_default", text = "Because the tunnels are the only road through the mountain that does not freeze or burn. The Timbermaw dug them, and the Timbermaw keep them clean, and a traveller who is friend to the Timbermaw may walk from Felwood to Winterspring without fear." } },
      choices = {
        { text = "And travellers who aren't friends?", next = "tunnels_foes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tunnels_foes = {
      lines = { { id = "tf_default", text = "They walk with a great deal of fear. Kill the Deadwood and the Winterfall, bring their beads and feathers to Nafien and Grazle, and the guards will learn your smell." } },
      choices = { { text = "I'll earn it. Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    after = {
      lines = { { id = "af_default", text = "Now the elders work, and Gorn guards the door, and the Winterfall that still have their minds may come back to them. It will be a long time, but a long time is still a time with an end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peace = {
      lines = { { id = "pe_default", text = "Gorn wants the Timbermaw to stop being alone. Your leader once tried to speak to us, and we did not answer, because we trusted nobody. Now Gorn trusts you, so Gorn would send our offering with you, if you will carry it." } },
      choices = {
        { text = "I'll carry it. It would be an honor.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Gorn knows the stores, the tunnels, and the enemies of the hold." } },
    background = { { id = "tp_bg", text = "Gorn is Timbermaw, born in the hold, and Gorn will die in the hold, as late as possible.", next = "eye" } },
    advice = { { id = "tp_ad", text = "Never drink what a Winterfall offers you. Never." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw are the last who remember. The others forgot, or were made to forget." } },
    _none = { { id = "tp_none", text = "Gorn does not know that. Gorn knows bread and enemies." } },
  },
}

---------------------------------------------------------------------------
-- Meilosh
---------------------------------------------------------------------------
P:NPC {
  key = "meilosh", id = TODO_NPC("Meilosh"), name = "Meilosh",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "gentle", "fussy" }, values = { "craft", "curious" },
  notices = { "tailor" },

  impression = {
    first = "Meilosh is the Timbermaw's tailor and trader, and he handles runecloth as if it were spun moonlight. He trades only with those the hold has learned to trust.",
    third = "{name} met Meilosh, the Timbermaw furbolg who trades for runecloth in Timbermaw Hold.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a traveller. Meilosh hopes you have brought cloth, and not mud." },
    { id = "g_stranger", when = { reputation = { faction = "Timbermaw Hold", max = "neutral" } }, text = "Meilosh does not trade with strangers. Come back when the hold knows your name." },
    { id = "g_runecloth", when = { questDone = TODO_QUEST("Runecloth") }, text = "Ah, the cloth-bringer! The cubs are wearing your runecloth already, and they are very proud of it." },
  },

  notice = {
    { id = "n_tailor", cat = "tailor", when = { profession = "Tailoring" },
      text = "You have a tailor's fingers, all needle-pricked. Meilosh can tell; it takes one to know one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Meilosh makes the clothing of Timbermaw Hold, and trades with the few outsiders the hold trusts. The Timbermaw are content in the mountain, but contentment is bad for trade, so Meilosh must find cloth wherever he can." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Runecloth"), reputation = { faction = "Timbermaw Hold", min = "friendly" } },
          text = "You are a friend of the hold now, so Meilosh will ask you. Runecloth is rare among us, and Meilosh's people have seen how fine it is, and now everyone wants a runecloth something. Will you bring Meilosh some?" },
      },
      again = { { id = "h_again", text = "What else would you know? Meilosh is only sewing." } },
      choices = {
        { text = "Show me what you trade.", next = "BUSINESS", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "Why do your people want runecloth?", next = "cloak" },
        { text = "What do furbolgs usually wear?", next = "wear" },
        { text = "Do you ever trade outside the hold?", next = "trade" },
        { text = "I'm a tailor myself.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Farewell, Meilosh.", next = "END" },
      },
    },
    cloak = {
      lines = { { id = "cl_default", text = "A night elf came to the hold, not long ago, a rare friend of ours, and she wore a cloak of runecloth. It was so fine that every Timbermaw wanted to touch it, and now Meilosh is asked every day when he will make one." } },
      choices = {
        { text = "Who was the night elf?", next = "cloak_elf" },
        { text = "How much runecloth do you need?", next = "cloak_need" },
      },
    },
    cloak_elf = {
      lines = { { id = "ce_default", text = "A friend, and Meilosh will not say more, because the hold keeps its friends' names safe. She has not come back since, and Meilosh hopes she is well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloak_need = {
      lines = {
        { id = "cn_default", text = "Thirty pieces will make a good start, and more after that, because the Timbermaw are many and the winters are long. Bring them, and Meilosh will give you something in trade, and you will be a friend of the hold a little more each time." },
        { id = "cn_active", when = { questActive = TODO_QUEST("Runecloth") }, text = "Thirty, as Meilosh said. The Winterfall and Deadwood carry it sometimes, and the human lands to the east are full of it, they say." },
      },
      choices = { { text = "I'll find some. Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    wear = {
      big = true,
      lines = { { id = "we_default", text = "Fur, mostly, which we grow ourselves, and wool and hide for the cold. Some elders say the Timbermaw should not want the things of outsiders at all, that cloth from outside will bring outsiders' troubles in with it." } },
      choices = {
        { text = "The elders are wise. Keep your ways.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trade makes friends. Let the cloth in.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "Never outside, only inside. Outsiders come to Meilosh, if the guards let them, and then Meilosh decides. It is a slow way to trade, but it is the Timbermaw way, and the Timbermaw are still here when other tribes are not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "ta_default", text = "Then you know how runecloth feels, soft and strong together, like the best kind of friend. Meilosh would like to watch you sew one day, to see how outsiders do it." } },
      choices = { { text = "One day, Meilosh.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Meilosh knows cloth and stitches and who in the hold needs a new coat." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw keep themselves to themselves. Meilosh thinks this is mostly wise." } },
    _none = { { id = "tp_none", text = "Meilosh does not know. Meilosh knows cloth." } },
  },
}
