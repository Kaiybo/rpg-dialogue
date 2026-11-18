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
    { id = "g_op_warchief", when = { opinion = { topic = "warchief", stance = "trust" } }, text = "You're the one who thinks Thrall's worth talking to. I've been chewing on that since, and I've not decided you're wrong." },
    { id = "g_cell", text = "You took your time, but it doesn't matter now. You're here." },
    { id = "g_after", when = { questDone = TODO_QUEST("Missing In Action") }, text = "There's my escort, still standing, I see. Good, so am I." },
    { id = "g_blackrock_resolved", when = { thread = { id = "blackrock_down", state = "resolved" } }, text = "Word's come down from Morgan's Vigil that the Spire's lost three of its masters and fewer orcs are coming over the passes. I've slept through two nights running since I heard, and I'd forgotten I could." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're Stormwind trained, by the stance. Keep your shield higher; they aim for the shoulder when they're tired, and they're always tired." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You came to rescue me in that? Light help us both, then, and stay close. Very close." },
  },

  start = "hello",
  nodes = {
    op_orcs = {
      lines = {
        { id = "op_orcs_a", text = "I heard the guards on the rock talk about him, if you can believe it. They called him a slave-born whelp who'd made the Horde soft and given it to trolls and cow-men, and they spat after his name. I've had weeks to think about it, so what's your view?" },
      },
      choices = {
        { text = "If the Blackrock hate him, Thrall might be worth talking to.", next = "op_orcs_1", fx = { opinion = { warchief = "trust", peace = "for" }, align = { light = 1 } } },
        { text = "An orc's an orc. Thrall's lot would have done the same to you.", next = "op_orcs_2", fx = { opinion = { warchief = "distrust", orcs = "hate" }, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Different orcs, same axes. I'll judge them when they're in front of me.", next = "op_orcs_3", fx = { opinion = { orcs = "wary" }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "Redridge has buried too many of ours to think kindly of any orc.", next = "op_orcs_4", when = { origin = "human_redridge_born" }, fx = { opinion = { orcs = "hate", peace = "against" }, affinity = 1 } },
        { text = "Let's get you home first, Corporal.", next = "BACK" },
      },
    },
    op_orcs_1 = {
      lines = { { id = "op_orcs_r1", text = "That's more or less where I landed, round about the third week. Don't tell the Marshal; he'd have me back on latrine duty for treason." } },
      choices = { { text = "Something else, Corporal.", next = "BACK" } },
    },
    op_orcs_2 = {
      lines = { { id = "op_orcs_r2", text = "Maybe, maybe not, but you'll not hear me argue with anybody who wants orcs dead tonight. Ask me again when the ringing stops." } },
      choices = { { text = "Something else, Corporal.", next = "BACK" } },
    },
    op_orcs_3 = {
      lines = { { id = "op_orcs_r3", text = "A soldier's answer, and a good one. That's how I'd have said it before Stonewatch, and it's how I'll say it again once I've slept." } },
      choices = { { text = "Something else, Corporal.", next = "BACK" } },
    },
    op_orcs_4 = {
      lines = { { id = "op_orcs_r4", text = "Born here, are you? Then you know the 12th Sabre weren't the first, and they'll not be the last. Walk me home, and we'll both say a few names on the way." } },
      choices = { { text = "Something else, Corporal.", next = "BACK" } },
    },
    xcl_ubrs = {
      big = true,
      lines = { { id = "xcl_ubrs_default", text = "They'll boast anyway, because an orc boasts with his last breath, but I'd give a month's pay to hear the camp at Stonewatch go quiet when the news reaches it. The men I served with died to hold Redridge, and this is the first news in a year that makes it feel like it counted." } },
      choices = {
        { text = "It counted from the start, Corporal. Honour them by living well.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Counting doesn't matter. Killing orcs does, and I'll keep at it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What did the orcs say about the Spire?", next = "xcl_ubrs2" },
      },
    },
    xcl_ubrs2 = {
      lines = { { id = "xcl_ubrs2_default", text = "That Rend sat at the top like a king, and that dragons came and went from the peak, though I took that for drunk talk at the time. I'm not so sure now that it was the drink talking, and I try not to think too hard about it." } },
      choices = {
        { text = "You're safe now, Corporal. Leave the Spire to me.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They didn't need to. Their chanting was enough. You're a dwarf, and you're no orc, but the sound of spirits still turns my stomach." } },
      choices = {
        { text = "I'm sorry, Keeshan. I'll prove I'm nothing like them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then face the fear, Keeshan. It won't shrink on its own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the orcs feed them better than they fed me, and that they're kept on the east side of Stonewatch where the wind carries the scent away from the walls. A hunter who knew that could come at the keep from downwind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would give the Blackrock wolves a fight, {class}. I'd pay a month's wages to watch it, if the army ever paid me." },
      },
      choices = {
        { text = "I'll go in downwind and take the wolves first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The wolves are only beasts. I want the orcs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Corporal.", next = "BACK" },
      },
    },
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
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "You're the second soul to come looking for a Stormwind corporal in these hills, if my head's still straight. The other was a {altclass} called {alt}, and you've the same look, so I'll trust you the way I trusted that one." },
        { id = "h_cl_ubrs", tags = { "news" }, when = { cleared = "Upper Blackrock Spire", faction = "Alliance" },
          text = "You've been to the top of Blackrock Spire and come down again, and I was a prisoner of the Blackrock long enough to know what that costs. They used to boast about the Spire in my hearing every night, as though I'd never live to see it." },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. In the Blackrock pens I heard their wolves at night, and I'd like to think someone like you might teach those beasts some manners." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I spent a long while in Blackrock hands and heard their shamans chanting every night, so don't take it ill if I don't smile." },
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
        { text = "You look like you haven't slept in days, Corporal.", next = "after", when = { questDone = TODO_QUEST("Missing In Action") } },
        { text = "The Light kept you alive, Corporal. Stand with me.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I'll scout ahead. Stay in my shadow.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'd have burned your cell door off, Corporal.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What did you learn of the Blackrock's wolves, Corporal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Their shadowcasters and I use the same arts, Corporal.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did the Blackrock shamans hurt you, Keeshan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Rend Blackhand's Spire is broken, Corporal. They won't boast about it now.", next = "xcl_ubrs", when = { cleared = "Upper Blackrock Spire", faction = "Alliance" } },
        { text = "Let's get moving.", next = "END" },
      },
    },

    seen = {
      big = true,
      lines = {
        { id = "s_default", text = "There are more of them than Lakeshire thinks, and better armed. And they take orders from someone who isn't an orc; I heard them argue about it." },
      },
      choices = {
        { text = "It sounds as if someone's directing them.", next = "who", fx = { learn = { "blackrock" } } },
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
        { id = "f_default", text = "Our regiment was the 12th Sabre, cavalry posted on a wall, and you can guess how that went. Most of the lads died, something hit me on the head, and the world went black." },
      },
      choices = {
        { text = "The 12th Sabre?", next = "regiment" },
        { text = "I'm sorry, Corporal.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    regiment = {
      lines = { { id = "rg_default", text = "Good riders, the best I served with. When I'm home I'll write down every name I remember for the Marshal. Somebody should say them out loud." } },
      choices = {
        { text = "Some say Thrall's orcs aren't like the Blackrock. Do you believe that?", next = "op_orcs" },
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
    second_war = { { id = "tp_second_war", text = "My grandfather fought the Horde in the Second War, and he'd say the orcs never fought for land, only for the fighting. I didn't believe him until I saw the inside of Stonewatch after they took it." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "When they had me in the cages, the guards talked about the mountain to the north as if it were their capital. Every order seemed to come down from that spire, and every captive who went up the road never came back." } },
    internment = { { id = "tp_internment", text = "One of the guards at Render's Rock spoke good Common, and he told me he'd spent ten years in one of our camps. He said it like I owed him something, and I'm not sure he was wrong, which is the worst thing he did to me." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Blackrock were among the first orcs through the Dark Portal, so I'm told, and they've never once gone home. I'll say this for them: they're stubborn, which is the only thing we have in common." } },
    bolvar = { { id = "tp_bolvar", text = "I'd like a word with the Highlord about how many men Stonewatch had when it fell. I'd say it politely, mind, because I'm still a soldier, but I'd say it." } },
    holy_light = {
      { id = "tp_holy_light", text = "I prayed to the Light every night in the cage, and some nights it was the only thing that answered. I'm not a pious man, but I'm not ashamed to say that." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "I prayed every night in that cage, paladin, and you're the first of the Light's soldiers I've seen since. I don't know if that's an answer or a coincidence, and I'll take either." },
    },
    knows = {
      { id = "tp_knows", text = "I've seen more of the Blackrock than any man in Lakeshire would want to, from both sides of the bars. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "Corporal, 12th Sabre Regiment, Stormwind Army. That's all a prisoner gives, and I'm still in the habit.", next = "fall" },
                   { id = "tp_bg2", text = "I'm a soldier. I was one before the cave, and I mean to be one after." } },
    advice = { { id = "tp_ad", text = "Keep your head down and your shield up; I only managed one of those." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "I was on its walls when it fell. That's all I'll say about it sober." } },
    keeshan = { { id = "tp_keeshan", text = "That's me, and if it's all the same to you, ask me something I don't have to think hard about." } },
    blackrock = { { id = "tp_blackrock", text = "They're disciplined and well fed, and that doesn't happen by accident." } },
    _none = { { id = "tp_none", text = "I've been on a rock. Ask me again when I've had a drink." } },
  },
}
