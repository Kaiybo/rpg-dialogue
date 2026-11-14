-- Sen'jin Village: the Darkspear's shore, within sight of the isles they lost. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gadrin", id = TODO_NPC("Master Gadrin"), name = "Master Gadrin",
  bible = "bibles/durotar.md", role = "priest", tier = "major",
  communities = { "senjin" }, temper = { "folksy" }, values = { "wise", "proud" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_hut", text = "Come, come. Gadrin don't bite. Not anymore; the teeth be too old." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you visit the old man again. Sit; the fire be warm." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear child! Let me look at you. Strong. You going to do the tribe proud, I can tell." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "MAGE" } },
      text = "You got the spark, eh? Careful with it. I teach two boys with the spark once. Only one of them listen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Master Gadrin. I teach the Darkspear witch doctors. I teach Vol'jin, once, and Zalazane. One of them I be proud of." },
        { id = "h_skull", when = { questActive = TODO_QUEST("Minshina's Skull") },
          text = "Minshina's skull sit on the isles in bad hands. Bring it to me. She deserve better." },
        { id = "h_zalazane", tags = { "news" }, when = { questActive = TODO_QUEST("Zalazane") },
          text = "Zalazane. My student, and the shame of my years. End him, and maybe this old man sleep through the night." },
        { id = "h_orgnil", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "Orgnil in Razor Hill need strong arms against the Burning Blade. Go to him. Tell him Gadrin say you be useful." },
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
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "echo_isles" } } },
      },
    },
    voljin = {
      lines = {
        { id = "vj_default", text = "The best I ever have. Zalazane listen too, but to the wrong voices. Now Vol'jin stand by the Warchief, and I watch the isles for him." },
      },
      choices = { { text = "He chose well.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    echo_isles = { { id = "tp_isles", text = "Every morning I look at them. Every morning they still there, waiting for us." } },
    burning_blade = { { id = "tp_blade", text = "Orcs playing with demons. Bad magic be bad magic, whoever play with it. Orgnil know." } },
    _none = { { id = "tp_none", text = "Even an old witch doctor don't know everything. Most things, yes." } },
  },
}
