-- Corporal Keeshan, held at Render's Rock. Voice: bibles/keeshan.md
-- Taken when Stonewatch Keep fell. Tired, sharp, still a soldier.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "keeshan", id = TODO_NPC("Corporal Keeshan"), name = "Corporal Keeshan",
  bible = "bibles/keeshan.md", role = "soldier", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "brave", "stern" },
  notices = { "soldier", "kit" },

  greetings = {
    { id = "g_cell", text = "Took your time. Doesn't matter. You're here." },
    { id = "g_after", when = { questDone = TODO_QUEST("Missing In Action") }, text = "My escort! Still standing? Good. So am I." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Stormwind trained, by the stance. Keep your shield higher. They aim for the shoulder when they're tired, and they're always tired." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You came to rescue me in that? Light help us both. Stay close, then. Very close." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Corporal Keeshan, Stormwind Army. I was on the walls at Stonewatch when it fell. They kept me alive. Orcs like a prisoner who can talk." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Missing In Action") },
          text = "Marris sent you? Good man. Get me down off this rock and I'll walk out on my own two feet. I'll need a blade before we're halfway." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "First proper meal in weeks. First proper bed. I keep waking up thinking I'm still on that rock." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Missing In Action"), days = 7 } },
          text = "Marris wants me back on the walls. Soon as my hands stop shaking. They've nearly stopped." },
        { id = "h_young", when = { maxLevel = 20 },
          text = "How old are you? Never mind. I was younger when I first went to war. That's not the comfort it sounds like." },
        { id = "h_sleep", when = { metBefore = true }, text = "Slept through the night, first time since the camp. Woke up reaching for a sword that wasn't there. Progress." },
      },
      choices = {
        { text = "What did you see up there?", next = "seen" },
        { text = "Let's get moving.", next = "END" },
      },
    },
    seen = {
      big = true,
      lines = {
        { id = "s_default", text = "More of them than Lakeshire thinks. Better armed. And they take orders from someone who isn't an orc. I heard them argue about it." },
      },
      choices = {
        { text = "Someone's directing them?", next = "who", fx = { learn = { "blackrock" } } },
        { text = "Tell the Marshal.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Don't know. Didn't see. Just heard them grumble about orders. Tell the magistrate. He likes a mystery." } },
      choices = { { text = "I will.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "Disciplined. Well fed. That doesn't happen by accident." } },
    _none = { { id = "tp_none", text = "I've been on a rock. Ask me again when I've had a drink." } },
  },
}
