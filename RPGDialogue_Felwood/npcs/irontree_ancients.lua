-- Vartrus the Ancient, spirit of an Ancient of Lore in the Irontree Woods, who sets hunters on the demonic corrupters.
-- Voice: bibles/irontree_ancients.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "vartrus", id = TODO_NPC("Vartrus the Ancient"), name = "Vartrus the Ancient",
  bible = "bibles/irontree_ancients.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "grave", "serene" }, values = { "nature", "wise" },
  notices = { "hunter", "pet" },

  impression = {
    first = "He weighs every word before he lets it go.",
    third = "{name} met Vartrus the Ancient, the spirit of an Ancient of Lore who guards what is left of the Irontree Woods.",
  },

  greetings = {
    { id = "g_default", text = "Stand still, small one, and let me look at you. I have not seen many living things today that were not rotting." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter walks among the dead trees. Good. The forest has need of one." },
    { id = "g_stave", when = { questActive = TODO_QUEST("Stave of the Ancients") }, text = "The bark will guide you to the corrupters. Face them alone, as I told you, or they will not face you at all." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stave of the Ancients") }, text = "The corrupters are dead, and the woods are quieter for it. I have not heard such quiet in a long age." },
  },

  notice = {
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER" },
      text = "You carry a bow as my brothers once carried branches, as part of yourself. That is how I knew you before you spoke." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion is unafraid of me. Beasts remember the Ancients longer than your kind do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Vartrus, an Ancient of Lore, and these were once my woods. My body was destroyed when Archimonde and the Burning Legion marched upon Hyjal, ten thousand years ago, but my spirit remains, as do the spirits of my brothers, Stoma and Hastat." },
        { id = "h_hunter_before", when = { class = "HUNTER", questBefore = TODO_QUEST("An Introduction") },
          text = "Your diligence has been noted, hunter. We are the Ancients, protectors of this once great forest, and there are tasks that we can offer to one such as you, tasks that will open the way to a weapon this world has not seen in ten thousand years." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Stave of the Ancients"), days = 3 } },
          text = "Simone, Klinfran, Solenor and Artorius are dead, and you brought me their heads. Take the stave, and bring it to Stoma for its string, for together they will make a weapon worthy of what you have done." },
        { id = "h_nonhunter", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } },
          text = "I am Vartrus, an Ancient of Lore, or what remains of one. I have nothing to ask of you, small one, for my tasks are for those who hunt, but I will speak with you, because I have been a long time without speaking." },
      },
      again = {
        { id = "h_again", text = "Ask, small one. I have had ten thousand years to think of answers." },
        { id = "h_again2", text = "What else? The wind has time, and so do I." },
      },
      choices = {
        { text = "What happened to you at Hyjal?", next = "hyjal" },
        { text = "Who are Stoma and Hastat?", next = "brothers" },
        { text = "What tasks do you offer hunters?", next = "tasks", when = { class = "HUNTER" } },
        { text = "Who are the corrupters?", next = "corrupters", when = { class = "HUNTER" } },
        { text = "Why do your tasks belong only to hunters?", next = "why_hunters", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } } },
        { text = "I'm a druid. I feel your grief in the Dream.", next = "druid", when = { class = "DRUID" } },
        { text = "I'll leave you in peace, Ancient.", next = "END" },
      },
    },

    hyjal = {
      lines = { { id = "hy_default", text = "We stood at the foot of the mountain with the demigods and the night elves, and we held the line while the World Tree was saved. The fel fire took our bodies, root and branch, but we did not let the demons pass, and that is enough to rest on." } },
      choices = {
        { text = "And yet you didn't rest.", next = "hyjal_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal_stay = {
      big = true,
      lines = { { id = "hys_default", text = "No. The forest we died for is dying now, poisoned by demons who came back after we were gone. Some say the dead should leave the living to their own wars, but I could not leave while the Legion's filth still crawled through my roots." } },
      choices = {
        { text = "The dead have done enough. You've earned your rest.", next = "hyjal_end", fx = { align = { order = 1 } } },
        { text = "A guardian guards. You were right to stay.", next = "hyjal_end", fx = { align = { order = -1 } } },
        { text = "Will you ever rest?", next = "hyjal_end" },
      },
    },
    hyjal_end = {
      lines = { { id = "hye_default", text = "When the last corrupter is gone, perhaps, or when the forest no longer needs me. I do not expect it soon, but an Ancient measures time in centuries, and I am patient." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brothers = {
      lines = { { id = "br_default", text = "Ancients of Lore, like me, who fell beside me and remain beside me. Stoma knows the binding of strings, and Hastat holds knowledge of a quiver lost since our deaths. Each of us waits for a hunter worthy of what we can give." } },
      choices = {
        { text = "What do they ask for?", next = "brothers_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_ask = {
      lines = { { id = "bra_default", text = "Things that are hard to come by, as all true gifts should be. Hastat will want the sinew of a grown blue dragon, for instance, and you will not find one sleeping by the road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    tasks = {
      lines = {
        { id = "ta_default", text = "First you must bring me a leaf, an ancient leaf, which has fallen far from here into fire. Then I will set you against the agents of the Legion who still walk this world, and if you destroy them, I will give you a stave cut from my own bark." },
        { id = "ta_done", when = { questDone = TODO_QUEST("Stave of the Ancients") },
          text = "You have done all I asked, hunter. Go to my brothers now, for what I gave you is only part of the weapon, and they hold the rest." },
      },
      choices = {
        { text = "A leaf, fallen into fire?", next = "tasks_leaf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tasks_leaf = {
      lines = { { id = "tl_default", text = "Into the deepest fire there is, beneath a mountain, where the Firelord keeps his treasures. I cannot tell you more, because I do not know how it came there, only that it is mine and that it calls to me." } },
      choices = { { text = "I'll find it.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    corrupters = {
      lines = { { id = "co_default", text = "Simone the Seductress, Klinfran the Crazed, Solenor the Slayer and Artorius the Doombringer. They wear other faces now and walk among your kind, and nature wilts and weeps wherever they pass." } },
      choices = {
        { text = "How do I fight them?", next = "corrupters_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupters_how = {
      lines = { { id = "coh_default", text = "Alone, hunter. They are arrogant, and if you come to them by yourself they will try to destroy you, but if you bring allies, they will flee. Turn their arrogance into their misery, and bring me their heads." } },
      choices = { { text = "Alone, then.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    why_hunters = {
      lines = { { id = "wh_default", text = "Because a hunter walks with the beasts and listens to the forest, as we did. Your path is a good one, small one, but it is not ours, and our gifts would not sit easily in your hands." } },
      choices = { { text = "I understand.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you know what it is to love a forest and watch it sicken. Go gently in the Dream while you are in Felwood, druid, for my grief is not the only thing you will hear there." } },
      choices = { { text = "I'll be careful, Vartrus.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know these woods, the war at Hyjal, and the demons who came back." } },
    background = { { id = "tp_bg", text = "An Ancient of Lore, who died at Hyjal and stayed.", next = "hyjal" } },
    burning_legion = { { id = "tp_legion", text = "They burned us once. They will not find us so easy to burn twice." } },
    malfurion = { { id = "tp_malf", text = "Cenarius's student. I remember him young, and very certain." } },
    _none = { { id = "tp_none", text = "That is a thing of your age, small one, not of mine." } },
  },
}
