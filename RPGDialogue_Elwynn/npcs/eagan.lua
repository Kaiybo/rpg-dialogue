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
        { id = "h_default", text = "Wolves are pushing over the ridge. Hungry ones. They take what they can carry." },
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
      },
      choices = {
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Do you ever feel sorry for them?", next = "pity" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    pity = {
      lines = { { id = "p_default", text = "Sorry? They'd eat me if I let them. I don't let them." } },
      choices = {
        { text = "Fair enough.", next = "END", fx = { trait = { stern = 1 } } },
        { text = "Seems a hard way to see it.", next = "END", fx = { align = { light = 1 }, trait = { kind = 1 }, affinity = -1 } },
      },
    },
  },

  topics = {
    kobolds = { { id = "t_kobolds", text = "Kobolds don't wear anything worth taking." } },
    hogger = { { id = "t_hogger", text = "A gnoll that big has a hide like a door. I'd like it. I'd not like to be the one taking it." } },
    _none = { { id = "t_none", text = "Ask someone who talks more." } },
  },
}
