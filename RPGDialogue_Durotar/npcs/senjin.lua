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
      },
      choices = {
        { text = "What happened on the Echo Isles?", next = "isles" },
        { text = "Vol'jin was your student?", next = "voljin" },
        { text = "Thank you, Master.", next = "END" },
      },
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
