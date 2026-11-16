-- Sen'jin Village: the Darkspear's shore, within sight of the isles they lost. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gadrin", id = TODO_NPC("Master Gadrin"), name = "Master Gadrin",
  bible = "bibles/durotar.md", role = "priest", tier = "major",
  communities = { "senjin" }, temper = { "folksy" }, values = { "wise", "proud" },
  notices = { "race", "class" },
  impression = {
    first = "Master Gadrin taught Vol'jin and Zalazane both, and only one of them makes him proud. He jokes about his old teeth, but the shame of Zalazane plainly keeps him from sleeping through the night.",
    third = "{name} met Master Gadrin at Sen'jin Village, the old Darkspear witch doctor who once taught both Vol'jin and Zalazane.",
  },

  greetings = {
    { id = "g_hut", text = "Come, come, Gadrin don't bite. Not anymore, anyway; the teeth be too old." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you visit the old man again. Sit; the fire be warm." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear child! Let me look at you, so strong. You going to do the tribe proud, I can tell." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "MAGE" } },
      text = "You got the spark, eh? Careful with it. I teach two boys with the spark once, and only one of them listen." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The spirits, yes, once Zalazane be dead and his voodoo with him. The trolls he twisted, I don't know, and I pray to the loa every night that I find out." } },
      choices = {
        { text = "Then save every troll you can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "His slaves are lost. End them cleanly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Master Gadrin, and I teach the Darkspear witch doctors. I teach Vol'jin once, and Zalazane, and one of them I be proud of." },
        { id = "h_skull", when = { questActive = TODO_QUEST("Minshina's Skull") },
          text = "Minshina's skull sit on the isles in bad hands. Bring it to me, because she deserve better." },
        { id = "h_zalazane", tags = { "news" }, when = { questActive = TODO_QUEST("Zalazane") },
          text = "Zalazane be my student once, and now he be the shame of my years. End him, and maybe this old man sleep through the night." },
        { id = "h_orgnil", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "Orgnil in Razor Hill need strong arms against the Burning Blade. Go to him, and tell him Gadrin say you be useful." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid come to Sen'jin! The loa of the islands and your Earth Mother be old friends, I think, but Zalazane be twisting the spirits on the Echo Isles so bad that they barely know each other now." },
      },
      choices = {
        { text = "Can Zalazane's corruption be undone, Master Gadrin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened on the Echo Isles?", next = "isles" },
        { text = "Vol'jin was your student?", next = "voljin" },
        { text = "I hear a voice, Master, and it isn't a loa.", next = "warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "The spirits answer me now. Teach me to listen better.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I studied the arcane, Master. Is that so strange?", next = "mage", when = { race = "Troll", class = "MAGE" } },
        { text = "I hunt heads for the tribe, the old way.", next = "headhunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "Thank you, Master.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, child? Old Gadrin got nothing but time and a warm fire." },
        { id = "h_again2", text = "Ask, ask. The questions keep this old head from rusting." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Ah, child, sit down, because now I be afraid for you. Zalazane hear a voice that wasn't a loa too, and he tell me it was only power, and look at the isles now." },
        { id = "wl_other", when = { origin = "troll_other_voice" },
          text = "You hear it since you was small, eh? Zalazane too, and I tell him it be nothing. I don't make that mistake twice, so you tell me every time it speak." },
      },
      choices = {
        { text = "I'm not Zalazane. I command it, not the other way.", next = "warlock_command" },
        { text = "Then I'll come to you whenever it speaks.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "The power's mine to use, Master, voice or no voice.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    warlock_command = {
      lines = { { id = "wc_default", text = "He say that too, in this same hut, sitting where you sit. I believe you mean it, child, and I believe he meant it, and that be what keep me up at night." } },
      choices = { { text = "Then watch me, Master. I'll prove it.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Good, good! The Warchief bring the old ways back to the orcs, and now they come back to us too. You listen to the water first, because on this shore the sea always talk loudest." },
        { id = "sh_orc", when = { race = "Orc" },
          text = "An orc shaman, coming to an old troll for listening lessons, eh? The Warchief's teachers be good, but the sea here, it speak troll, and I translate." },
      },
      choices = {
        { text = "What does the sea say about the isles?", next = "shaman_sea" },
        { text = "I'll listen to the water.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    shaman_sea = {
      lines = { { id = "ss_default", text = "It say the isles be sick, and the sickness spread a little every tide. Zalazane's magic poison the water spirits too, so a shaman who help free the isles heal more than the Darkspear." } },
      choices = { { text = "Then I'll help free them.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" } } } },
    },
    mage = {
      lines = { { id = "ma_default", text = "Strange? A little, yes, because the Darkspear got the loa and the witch doctors and never need human books. But a sharp mind be a sharp mind, and Zalazane prove a witch doctor can go wrong too, so I judge the student and not the school." } },
      choices = {
        { text = "The tribe needs every kind of power it can get.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll keep the old ways close, beside the new.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    headhunter = {
      lines = { { id = "hd_default", text = "The old way, eh? That be good to hear, child, so bring the tribe's enemies down clean and give their spirits to the loa proper, and never take a head for pride, because that be how a hunter turns into something else." } },
      choices = { { text = "Clean, and never for pride.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A head taken for pride still scares the enemy.", next = "BACK", fx = { align = { honor = -1 } } } },
    },
    isles = {
      big = true,
      lines = {
        { id = "i_default", text = "Zalazane drink deep of power he shouldn't touch, and it drown him. He curse the isles and make our own people his puppets. We leave our home to save the rest." },
      },
      choices = {
        { text = "We'll take it back.", next = "END", fx = { affinity = 2, align = { honor = 1 }, learn = { "echo_isles" } } },
        { text = "Your people matter more than the isles, so let Zalazane keep them.", next = "END", fx = { align = { honor = -1 }, learn = { "echo_isles" } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "echo_isles" } } },
      },
    },
    voljin = {
      lines = {
        { id = "vj_default", text = "The best I ever have. Zalazane listen too, but to the wrong voices. Now Vol'jin stand by the Warchief, and I watch the isles for him." },
      },
      choices = {
        { text = "He chose well.", next = "END", fx = { affinity = 2 } },
        { text = "And the student you aren't proud of?", tag = "Persuade", next = "zalazane_blame",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Troll" }, { trait = "kind" } } } },
          fail = { next = "zalazane_shame", fx = { affinity = -1 } } },
      },
    },
    zalazane_blame = {
      lines = {
        { id = "zb_default", text = "Zalazane be the quicker of the two boys, quicker than Vol'jin even. I see the hunger in him early, and I teach him anyway, because I be proud to have such a clever student. So when you hear the isles be cursed, you remember an old fool help it happen." },
        { id = "zb_troll", when = { race = "Troll" },
          text = "You be Darkspear, so I tell you what I don't tell the chief. I see Zalazane reach too far and I say nothing, because he make me proud. Every puppet on those isles, I count as partly mine." },
      },
      choices = {
        { text = "You couldn't have known, Master.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then help us undo it.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
      },
    },
    zalazane_shame = {
      lines = {
        { id = "zs_default", text = "That be an old man's business, and an old man's shame, and not for a stranger to pick at." },
        { id = "zs_easy", text = "Ha, you ask the hard question first, eh? Gadrin answer only the easy ones today." },
      },
      choices = { { text = "Another time, then.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Old Gadrin hear everything eventually, because everybody come to the witch doctor sooner or later. Ask me about these, child." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You be good to this old man, so sit, and I tell you all of it, the long way round." },
    },
    echo_isles = { { id = "tp_isles", text = "Every morning I look at them, and every morning they still there, waiting for us." } },
    burning_blade = { { id = "tp_blade", text = "Orcs playing with demons, eh? Bad magic be bad magic, whoever play with it, and Orgnil know that." } },
    _none = { { id = "tp_none", text = "Even an old witch doctor don't know everything, though he know most things, yes." } },
  },
}
