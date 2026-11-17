-- Watcher Backus, on the road west of Darkshire. Voice: bibles/watcher_backus.md
-- Elling Trias's quiet contact in the Night Watch; helps with the Missing Diplomat, and wants no credit for it.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "watcher_backus", id = TODO_NPC("Watcher Backus"), name = "Watcher Backus",
  title = "The Night Watch",
  bible = "bibles/watcher_backus.md", role = "soldier", tier = "quest",
  communities = { "darkshire" }, temper = { "wary" }, values = { "careful", "loyal" },
  notices = { "stealth", "soldier" },

  impression = {
    first = "Watcher Backus walks a lonely stretch of road and knows more about the Defias than his superiors would like. He helped me, and then asked me to forget that he had.",
    third = "{name} met Watcher Backus of the Night Watch, a careful man on the western road who quietly helped track the Defias.",
  },

  greetings = {
    { id = "g_road", text = "Evening. Keep moving if you've nowhere to be; this road's no place to stand about." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Keep your voice down, would you?" },
    { id = "g_docket", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Be careful out there. I know Trias sent you, but that doesn't mean the woods care." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I'd started to think the Defias had found you, so I'm glad they hadn't." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way since you were poking about Addle's Stead for me. I hardly need to warn you about the woods now." },
    { id = "g_word_helped", when = { word = "helped" }, text = "People in Darkshire say you've been a help. That's good; just don't let them say you had help from me." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear you were caught out in a lie. In my line of work that gets people killed, so learn from it." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You walk like someone who doesn't want to be heard. Good. Out here, that keeps you breathing." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "A warrior. If anything comes out of the trees, I'll be glad to have you here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Watcher Backus, Night Watch. I walk this road from Darkshire out toward the old manor and back, and I see more than I get credit for." },
        { id = "h_defias", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Defias activity? There's always some, but a couple of weeks ago a few of their agents gathered at Addle's Stead, south of the road as you come in from Westfall. I'd start there." },
        { id = "h_found", when = { questDone = TODO_QUEST("The Missing Diplomat") },
          text = "That docket was too complex to be a decoy. I hope Trias made sense of it, and I hope he kept my name out of it." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Worst hour of the night to be on this road. The worgen come down from the hills, and the dead come up out of Raven Hill, and I'm stuck between the two." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly." },
        { id = "h_again2", text = "Go on, but watch the trees while you talk." },
      },
      choices = {
        { text = "Why so secretive?", next = "secret" },
        { text = "How do you know Elling Trias?", next = "trias" },
        { text = "What's out on this road?", next = "road" },
        { text = "What was in that Defias docket?", next = "docket", when = { questDone = TODO_QUEST("The Missing Diplomat") } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Watch yourself, Backus.", next = "END" },
      },
    },
    secret = {
      lines = { { id = "s_default", text = "If my superiors found out I knew about the Defias business and didn't share it with them first, they'd likely hang me. The Watch has its own way of doing things." },
      },
      choices = {
        { text = "Then why not just tell them?", next = "secret_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_why = {
      big = true,
      lines = { { id = "sw_default", text = "Because it's bigger than Darkshire, and the council would sit on it for a month arguing. Trias moves faster. Tell me honestly, do you think I'm doing wrong?" },
      },
      choices = {
        { text = "Yes. Your oath is to the Watch first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No. Do what works, and let the council argue.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I'm not one to judge.", next = "BACK" },
      },
    },
    trias = {
      lines = { { id = "t_default", text = "He sells cheese in Stormwind, and he hears things the way some men hear music. I pass him what I see out here when it seems to matter, and I don't ask what he does with it." },
      },
      choices = {
        { text = "A cheesemonger? Really?", next = "trias_cheese" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trias_cheese = {
      lines = { { id = "tc_default", text = "That's what the sign says, and I'd keep believing it, if I were you. Some questions are safer left unasked in Stormwind." },
      },
      choices = { { text = "Understood. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    road = {
      lines = { { id = "r_default", text = "Worgen in the woods to the north, and a house on the hill nobody goes near, and the Defias passing through from Westfall like they own the place. I count what I see and report what I'm allowed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    docket = {
      lines = { { id = "d_default", text = "I shouldn't even have looked at it, and I only skimmed. Names, dates, and a plan that wanted something very badly. Don't tell me any more than that." },
      },
      choices = { { text = "I won't. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I walk a road for the Night Watch. That's all you need to know, and all I'll tell." } },
    advice = { { id = "tp_ad", text = "Never stand still in Duskwood after dark. Something always notices." } },
    defias = { { id = "tp_defias", text = "They pass through here from Westfall more often than the council knows.", next = "road" } },
    _none = { { id = "tp_none", text = "Couldn't say, and wouldn't if I could. Ask in Darkshire." } },
  },
}
