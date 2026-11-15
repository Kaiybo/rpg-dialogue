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
          text = "You're from Lakeshire? Then you're the best thing I've seen in this cave. Get me to the Marshal. I'll try to keep up." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "First proper meal in weeks. First proper bed. I keep waking up thinking I'm still on that rock." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Missing In Action"), days = 7 } },
          text = "Marris wants me back on the walls. Soon as my hands stop shaking. They've nearly stopped." },
        { id = "h_young", when = { maxLevel = 20 },
          text = "How old are you? Never mind. I was younger when I first went to war. That's not the comfort it sounds like." },
        { id = "h_sleep", when = { metBefore = true }, text = "Slept through the night, first time since the camp. Woke up reaching for a sword that wasn't there. Progress." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short. My head's still ringing." },
        { id = "h_again2", text = "Go on. Talking keeps me awake, and awake is good." },
      },
      choices = {
        { text = "What did you see up there?", next = "seen" },
        { text = "What happened at Stonewatch?", next = "fall" },
        { text = "Can you walk?", next = "walk" },
        { text = "Hold still. Let me see to that head.", next = "priest", when = { class = "PRIEST" } },
        { text = "Shield up, Corporal. We go together.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "How are you holding up, Corporal?", next = "after", when = { questDone = TODO_QUEST("Missing In Action") } },
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
        { text = "How many more?", next = "numbers" },
        { text = "Tell the Marshal.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Don't know. Didn't see. Just heard them grumble about orders. Tell the magistrate. He likes a mystery." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1 } } },
    },
    numbers = {
      lines = { { id = "nu_default", text = "Enough to hold a keep and raid a town in the same week, with more coming down the Steppes pass. Lakeshire counts the raiders. Nobody's counting the camps." } },
      choices = {
        { text = "Then I'll count them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fall = {
      big = true,
      lines = {
        { id = "f_default", text = "Our regiment was the 12th Sabre. Cavalry, on a wall, which tells you how it went. Most of the lads died, something hit me on the head, and the world went black." },
      },
      choices = {
        { text = "The 12th Sabre?", next = "regiment" },
        { text = "I'm sorry, Corporal.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    regiment = {
      lines = { { id = "rg_default", text = "Good riders, the best I served with. When I'm home I'll write down every name I remember for the Marshal. Somebody should say them out loud." } },
      choices = {
        { text = "Say them to me, on the way down.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    walk = {
      lines = { { id = "wk_default", text = "Can I? I'll have to. My head's ringing like a temple bell. Keep the orcs off me and point me downhill." } },
      choices = {
        { text = "Lean on me.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's go.", next = "END" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Careful, that's... oh. That's better. Light, that's better. I'd forgotten what not hurting felt like." } },
      choices = {
        { text = "The Light hadn't forgotten you.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Good. Now you can walk.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Now you sound like a sergeant. Find me anything with an edge and I'll hold the left." } },
      choices = {
        { text = "The left's yours.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Some nights I'm back on that rock. Then I wake and I'm not. Every time, it surprises me, and every time it's a good surprise." } },
      choices = {
        { text = "It'll get easier.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Corporal, 12th Sabre Regiment, Stormwind Army. That's all a prisoner gives, and I'm still in the habit.", next = "fall" },
                   { id = "tp_bg2", text = "Soldier. Was one before the cave, and I mean to be one after." } },
    advice = { { id = "tp_ad", text = "Keep your head down and your shield up. I managed one of those." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "I was on its walls when it fell. That's all I'll say about it sober." } },
    keeshan = { { id = "tp_keeshan", text = "That's me. Ask me something I don't have to think hard about." } },
    blackrock = { { id = "tp_blackrock", text = "Disciplined. Well fed. That doesn't happen by accident." } },
    _none = { { id = "tp_none", text = "I've been on a rock. Ask me again when I've had a drink." } },
  },
}
