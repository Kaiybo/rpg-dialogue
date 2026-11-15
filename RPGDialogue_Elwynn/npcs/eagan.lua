-- Eagan Peltskinner, Northshire Valley. Voice: bibles/eagan.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eagan", id = TODO_NPC("Eagan Peltskinner"), name = "Eagan Peltskinner",
  bible = "bibles/eagan.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "beast", "form", "skinner" },

  greetings = {
    { id = "g_traps", text = "Step where I step. There are traps." },
    { id = "g_fur", text = "Bring me something with fur on it." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "I've skinned bears. Don't take it personally." },
    { id = "n_cat", cat = "form", place = "replace", when = { form = "cat" },
      text = "Hold still. I'm only looking at the coat. Good coat." },
    { id = "n_pet", cat = "beast", when = { pet = { type = "Beast" } },
      text = "That's a good animal. Feed it before you feed yourself and it'll keep you alive." },
    { id = "n_skinner", cat = "skinner", when = { profession = "Skinning" },
      text = "You skin. I can tell from your knife. Most folk hack at a pelt like it owes them money." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Easy, now. I've no quarrel with bears that pay their way." },
    { id = "r_pet", on = "pet", when = { pet = { type = "Beast" } }, text = "Where'd that one come from? Healthy, too. Well kept." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wolves are pushing over the ridge. Hungry ones. They take what they can carry." },
        { id = "h_willem", when = { questRecent = { TODO_QUEST("Eagan Peltskinner"), days = 1 } },
          text = "Willem sent you? Then he thinks you can hold a knife. We'll see." },
        { id = "q_wolves_active", when = { questActive = TODO_QUEST("Wolves Across the Border") },
          text = "Tough meat, not tender. That's how I know they're the hungry ones." },
        { id = "q_wolves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wolves Across the Border"), days = 2 } },
          text = "Quieter nights. The pelts from those wolves will keep somebody warm in the Abbey come winter." },
        { id = "h_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human hunter. My grandfather would've called that a trapper with ambitions. He'd not have meant it kindly." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You're one of the ones who turns into the animals. Hard to know whether to shake your hand or check your teeth." },
        { id = "h_steaks", when = { questDone = TODO_QUEST("Wolves Across the Border") },
          text = "Ate the last of your wolf last night. Slow over coals, a bit of salt. Tough as a boot and I'd not change a thing." },
        { id = "h_veteran", when = { minLevel = 20 },
          text = "You've a better knife than you came here with. And a few scars from things bigger than wolves, by the look. Good." },
      },
      again = {
        { id = "h_again", text = "Something else? Quick. Traps don't check themselves." },
        { id = "h_again2", text = "Well?" },
      },
      choices = {
        { text = "What do you need?", next = "BUSINESS" },
        { text = "What do you want with wolf meat?", next = "meat" },
        { text = "Why so many wolves this year?", next = "why" },
        { text = "Do you ever feel sorry for them?", next = "pity" },
        { text = "Teach me a cleaner cut?", next = "skin", when = { profession = "Skinning" } },
        { text = "Would you skin me, if I were a bear?", next = "druid", when = { class = "DRUID" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    meat = {
      lines = {
        { id = "m_default", text = "Eat it. I hate those timber wolves, but I like a wolf steak. Funny how that works. The pelts go down to Goldshire." },
      },
      choices = {
        { text = "Who takes the pelts?", next = "meat_helene" },
        { text = "Wolf steak? Really?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    meat_helene = {
      lines = {
        { id = "mh_default", text = "Helene. My wife. She skins and sews down in Goldshire, and she's more orders than I've wolves. If you skin, go and learn from her. She's better than me." },
      },
      choices = {
        { text = "High praise, from you.", next = "meat_praise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_praise = {
      lines = {
        { id = "mp_default", text = "It's not praise. It's a fact. I hunt. She makes something of it. Most folk only see the second half." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "w_default", text = "Hungry ones, come over the border from the hills. Young wolves, mostly, and the timber wolves after them. Easy pickings down here. Recruits are easy pickings." },
      },
      choices = {
        { text = "Then I'll thin them out.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "What about the kobolds?", next = "why_kobolds" },
      },
    },
    why_kobolds = {
      lines = {
        { id = "wk_default", text = "Kobolds don't wear anything worth taking. Wolves keep clear of their mine, though. Even a wolf has standards." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pity = {
      lines = { { id = "p_default", text = "Sorry? They'd eat me if I let them. I don't let them." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Seems a hard way to see it.", next = "pity_hard", fx = { align = { light = 1 }, trait = { kind = 1 }, affinity = -1 } },
      },
    },
    pity_hard = {
      lines = {
        { id = "ph_default", text = "Soft folk keep pets. I keep a larder. We both feed something. Mine just doesn't follow me home." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skin = {
      lines = {
        { id = "s_default", text = "Knife flat. Follow the fat, don't saw. If you hear it tearing, you've already ruined it. Helene teaches it properly, in Goldshire." },
      },
      choices = { { text = "Knife flat. Thanks.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "d_default", text = "Depends on the coat. Don't look at me like that. You asked." } },
      choices = { { text = "Fair.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Trapper. Skinner. Northshire. That's the lot." } },
    advice = { { id = "tp_ad", text = "Feed your animal before yourself. Clean your knife before you sleep. Never turn your back on a wolf that's stopped growling." } },
    kobolds = { { id = "t_kobolds", text = "Kobolds don't wear anything worth taking." } },
    hogger = { { id = "t_hogger", text = "A gnoll that big has a hide like a door. I'd like it. I'd not like to be the one taking it." } },
    _none = { { id = "t_none", text = "Ask someone who talks more." } },
  },
}
