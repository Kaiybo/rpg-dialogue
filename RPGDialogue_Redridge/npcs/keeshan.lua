-- Corporal Keeshan, held at Render's Rock. Voice: bibles/keeshan.md
-- Taken when Stonewatch Keep fell. Tired, sharp, still a soldier.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "keeshan", id = TODO_NPC("Corporal Keeshan"), name = "Corporal Keeshan",
  bible = "bibles/keeshan.md", role = "soldier", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "brave", "stern" },
  notices = { "soldier", "kit" },

  impression = {
    first = "Corporal Keeshan survived the fall of Stonewatch and a long while in Blackrock hands. He is thin and tired, and there is still a soldier standing straight underneath.",
    third = "{name} found Corporal Keeshan of the Stormwind Army, taken prisoner by the Blackrock orcs after the fall of Stonewatch.",
  },

  greetings = {
    { id = "g_cell", text = "You took your time, but it doesn't matter now. You're here." },
    { id = "g_after", when = { questDone = TODO_QUEST("Missing In Action") }, text = "There's my escort, still standing, I see. Good, so am I." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're Stormwind trained, by the stance. Keep your shield higher; they aim for the shoulder when they're tired, and they're always tired." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You came to rescue me in that? Light help us both, then, and stay close. Very close." },
  },

  start = "hello",
  nodes = {
    xmage = {
      lines = { { id = "xma_default", text = "I'd have welcomed it, though the shadowcasters in Stonewatch would have heard you three floors up. Everything I learned in that keep says the Blackrock respect power, and they hate a mage who can match theirs." } },
      choices = {
        { text = "I'll face their casters openly and beat them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll pick them off before they see me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "How did Stonewatch fall?", next = "fall" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I know, and I'll not pretend I like hearing it, because I spent weeks listening to those casters chant through the walls. But you're on our side of the lake, and I'll take that over clean hands any day." } },
      choices = {
        { text = "Then I'll turn their own arts against them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll use as little of it as I must.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "How many did you see in the keep?", next = "numbers" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Ate what the animals ate, slept where they slept, and kept my head down. The land up there doesn't care whose side you're on, and it was the only thing in Redridge that wasn't trying to kill me." } },
      choices = {
        { text = "The wild shelters those who respect it. You did.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You survived by luck, and luck runs dry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. I spent a long while in those hills with nothing but the wolves for company, so I've a soft spot for anyone who speaks their tongue." },
        { id = "h_default", text = "Corporal Keeshan, Stormwind Army. I was on the walls at Stonewatch when it fell, and they kept me alive, because orcs like a prisoner who can talk." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Missing In Action") },
          text = "You're from Lakeshire? Then you're the best thing I've seen in this cave. Get me to the Marshal and I'll try to keep up." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "A proper meal and a proper bed, the first in weeks. I keep waking up thinking I'm still on that rock." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Missing In Action"), days = 7 } },
          text = "Marris wants me back on the walls as soon as my hands stop shaking, and they've nearly stopped." },
        { id = "h_young", when = { maxLevel = 20 },
          text = "How old are you? Never mind; I was younger when I first went to war, and that's not the comfort it sounds like." },
        { id = "h_sleep", when = { metBefore = true }, text = "I slept through the night, the first time since the camp, and woke up reaching for a sword that wasn't there. That's progress, I suppose." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short, if you would; my head's still ringing." },
        { id = "h_again2", text = "Go on, talk. It keeps me awake, and awake is good." },
      },
      choices = {
        { text = "How did you survive so long in the hills?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What did you see up there?", next = "seen" },
        { text = "What happened at Stonewatch?", next = "fall" },
        { text = "Can you walk?", next = "walk" },
        { text = "Hold still. Let me see to that head.", next = "priest", when = { class = "PRIEST" } },
        { text = "Shield up, Corporal. We go together.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "How are you holding up, Corporal?", next = "after", when = { questDone = TODO_QUEST("Missing In Action") } },
        { text = "The Light kept you alive, Corporal. Stand with me.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I'll scout ahead. Stay in my shadow.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'd have burned your cell door off, Corporal.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Their shadowcasters and I use the same arts, Corporal.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Let's get moving.", next = "END" },
      },
    },

    seen = {
      big = true,
      lines = {
        { id = "s_default", text = "There are more of them than Lakeshire thinks, and better armed. And they take orders from someone who isn't an orc; I heard them argue about it." },
      },
      choices = {
        { text = "Someone's directing them?", next = "who", fx = { learn = { "blackrock" } } },
        { text = "How many more?", next = "numbers" },
        { text = "Tell the Marshal.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "I don't know and I didn't see; I only heard them grumble about orders. Tell the magistrate, since he likes a mystery." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1 } } },
    },
    numbers = {
      lines = { { id = "nu_default", text = "Enough to hold a keep and raid a town in the same week, with more coming down the Steppes pass. Lakeshire counts the raiders, but nobody's counting the camps." } },
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
      lines = { { id = "wk_default", text = "Can I? I'll have to, though my head's ringing like a temple bell. Keep the orcs off me and point me downhill." } },
      choices = {
        { text = "Lean on me.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's go.", next = "END" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Careful, that's... oh, that's better. Light, that's so much better; I'd forgotten what not hurting felt like." } },
      choices = {
        { text = "The Light hadn't forgotten you.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That was my own skill, Corporal, not the Light's mercy.", next = "BACK", fx = { align = { light = -1 } } },
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
    paladin = {
      lines = { { id = "pa_default", text = "Maybe it did, though I'd have liked it to be quicker about it. Walk in front, then, and if that hammer starts glowing, I'll take it as a good sign." } },
      choices = {
        { text = "The Light was with you every day in that cave.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You kept yourself alive. Take the credit.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Your shadow, is it? I'll try, though I've been sitting on a rock for weeks and my knees crack like kindling. If you hear me trip, that's your signal to start stabbing." } },
      choices = {
        { text = "I'll go slow.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've seen more of the Blackrock than any man in Lakeshire would want to, from both sides of the bars. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "Corporal, 12th Sabre Regiment, Stormwind Army. That's all a prisoner gives, and I'm still in the habit.", next = "fall" },
                   { id = "tp_bg2", text = "I'm a soldier. I was one before the cave, and I mean to be one after." } },
    advice = { { id = "tp_ad", text = "Keep your head down and your shield up; I only managed one of those." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "I was on its walls when it fell. That's all I'll say about it sober." } },
    keeshan = { { id = "tp_keeshan", text = "That's me, and I'd rather you asked me something I don't have to think hard about." } },
    blackrock = { { id = "tp_blackrock", text = "They're disciplined and well fed, and that doesn't happen by accident." } },
    _none = { { id = "tp_none", text = "I've been on a rock. Ask me again when I've had a drink." } },
  },
}
