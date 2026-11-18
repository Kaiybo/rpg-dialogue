-- Tiev Mordune: a Darkspear shaman at North Tide's Run, waiting by the water shrine to help other
-- shaman through Islen Waterseer's trial. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sp_tiev", id = TODO_NPC("Tiev Mordune"), name = "Tiev Mordune",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "north_tides_run" }, temper = { "warm", "cheerful" }, values = { "helpful", "spirits", "patience" },
  notices = { "class", "race" },

  impression = {
    first = "He finished his trial of water and stayed to help with others'.",
    third = "{name} met Tiev Mordune, a troll shaman who waits by the water shrine at North Tide's Run to help others through their trial.",
  },

  greetings = {
    { id = "g_default", text = "Greetin's, mon! Tiev be watchin' de water, and de water be watchin' back." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, brotha? De spirits remember you, and so does Tiev." },
    { id = "g_sapta", when = { questActive = TODO_QUEST("Call of Water") }, text = "Ya have de sapta? Bring it here and we go down to de shrine together." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "Another one walkin' de water path! Come, come, Tiev knows dis road." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Tiev feels de totems on you, brotha. Earth, fire, maybe soon water, if you be patient." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, so far from de Echo Isles! Vol'jin's people get everywhere, ya?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tiev Mordune, of de Darkspear. Tiev come here to purify de waters and prove his understandin' to Islen, and Tiev did it, but Tiev stay a while to help de ones who come after." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "Greetin's! Have you too come to purify de waters here and prove your understandin' to Islen? Tiev just defeated de corrupt water spirit himself, so Tiev can help you plenty if somethin' go wrong." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Call of Water") },
          text = "Ahh, you spoke wit' de water spirit! Tiev saw your face when you come back, and it was a good face, a clean one." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De tide don't hurry, and neither does Tiev." },
        { id = "h_again2", text = "Ask away, brotha." },
      },
      choices = {
        { text = "What happened with the water spirit?", next = "spirit" },
        { text = "Why stay here, if you're finished?", next = "stay" },
        { text = "What's a water sapta?", next = "sapta", when = { class = "SHAMAN" } },
        { text = "A troll, alone among the Forsaken.", next = "forsaken" },
        { text = "Why do you talk about yourself like that?", next = "name" },
        { text = "Walk with the spirits, Tiev.", next = "END" },
      },
    },

    spirit = {
      lines = {
        { id = "sp_default", text = "De water here be sick, mon. A spirit of it went bad, all twisted and angry, and a shaman of water must put it down and carry what remain to de shrine before de pure spirit will talk to dem." },
      },
      choices = {
        { text = "Sick from what?", next = "spirit_sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_sick = {
      lines = {
        { id = "ss_default", text = "Tiev don't know for sure, but de whole forest be sick, ya? De dead walk it, de worgen howl in it, and de rot of Lordaeron run down into every stream. De water spirits feel all of it." },
      },
      choices = {
        { text = "Can it be healed?", next = "spirit_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_heal = {
      big = true,
      lines = {
        { id = "sh_default", text = "One spirit at a time, maybe. Islen say a shaman don't fix de world, only listen to it and help where it ask. Tiev think dat be a slow way to fix anything." },
      },
      choices = {
        { text = "Islen's right. Patience heals more than force.", next = "BACK", reply = "Ya, ya, Tiev know it. Tiev just don't like it.", fx = { align = { order = 1 } } },
        { text = "Then don't wait. Heal what you can, now.", next = "BACK", reply = "Hah! You sound like Tiev when Tiev was young. Maybe Tiev still is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stay = {
      lines = {
        { id = "st_default", text = "Tiev know another one who had trouble after de corrupt spirit. He waited too long and came out of de spirit world too quick for his taste, and Tiev hate to see dat happen again, so Tiev wait a bit." },
      },
      choices = {
        { text = "That's generous of you.", next = "stay_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay_why = {
      lines = {
        { id = "sw_default", text = "De loa teach dat what you give come back to you, one way or another. And besides, it be quiet here, and Wallace down de shore sell a fine spear, even if he can't see who he sell it to." },
      },
      choices = {
        { text = "Wallace seems a decent sort.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    sapta = {
      lines = {
        { id = "sa_default", text = "A water sapta, from Islen, to let you see into de spirit world. Bring Tiev one as proof you be ready, and Tiev will put his bracers and de last drops of water on de brazier so you can speak to de spirit too." },
        { id = "sa_active", when = { questActive = TODO_QUEST("Call of Water") },
          text = "Bring de sapta here, brotha, and don't worry none about seein' into de spirit world wit' it. Ol' Tiev know a trick or two about how de sapta magic works." },
      },
      choices = {
        { text = "What trick?", next = "sapta_trick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta_trick = {
      lines = {
        { id = "sk_default", text = "Ah, if Tiev tell you, it not be a trick no more, ya? Just trust Tiev, and come down to de shrine when you ready." },
      },
      choices = {
        { text = "I trust you, Tiev.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      big = true,
      lines = {
        { id = "fo_default", text = "Alone, but not so lonely, mon. De Forsaken at de Sepulcher be strange, and dey smell like old graves, but dey Horde, and Thrall say dey Horde, so Tiev say it too." },
        { id = "fo_forsaken", when = { race = "Scourge" },
          text = "Alone, but you here now, so not so alone! Tiev don't mind de Forsaken, though Tiev wonder sometimes what de loa think of folk who don't stay dead." },
      },
      choices = {
        { text = "The Horde is family. Trust them.", next = "BACK", reply = "Ya, family, even de strange cousins. Specially de strange cousins.", fx = { align = { light = 1 } } },
        { text = "Keep an eye on them. They're not like us.", next = "BACK", reply = "Tiev always keep an eye open, mon. Dat's just good sense, not mistrust.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "nm_default", text = "Because Tiev like de sound of it! An old witch doctor on de Echo Isles told Tiev a name said aloud be a name de spirits remember, so Tiev say it plenty." },
      },
      choices = {
        { text = "Then I'll remember it too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Tiev don't know dat one, mon. Ask de water, maybe it know." } },
  },
}
