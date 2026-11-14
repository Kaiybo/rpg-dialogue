-- The Emerald Sanctuary: the Emerald Circle's camp in southern Felwood. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eridan", id = TODO_NPC("Eridan Bluewind"), name = "Eridan Bluewind",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "hopeful" }, values = { "devout", "patient" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_green", text = "Welcome, traveler. Look past the sickness, if you can. There's still green under it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to Felwood. Most don't, once they've seen it. Thank you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Can you feel it? The forest is still alive under the poison. It's screaming, but it's alive." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of our own. You'll remember this forest as it was, or your parents will. Help me make it that again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Eridan Bluewind, of the Emerald Circle. Felwood was green once. Under all of this, somewhere, it still is. We mean to find it again." },
        { id = "h_jadefire", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Corruption of the Jadefire") }, { questActive = TODO_QUEST("Further Corruption") } } },
          text = "The Jadefire satyrs wear the corruption like a crown. Thin them. Every one that falls is a little less poison in the soil." },
        { id = "h_flute", when = { questActive = TODO_QUEST("Flute of Xavaric") },
          text = "Xavaric carries a flute. I want it out of satyr hands. What it does in theirs, I'd rather not see again." },
        { id = "h_ancients", when = { questActive = TODO_QUEST("Felbound Ancients") },
          text = "The ancients guarded this forest once. Now the corruption holds them. It hurts to look at them. Do what must be done." },
        { id = "h_purified", when = { questDone = TODO_QUEST("Purified!") },
          text = "Purified. Say it again. I've waited a long time to hear that word in Felwood." },
        { id = "h_linken", when = { heardLine = "linken.h_default" },
          text = "You've met the gnome in Un'Goro who lost his memory? If his friends send you for a totem, come to me. The water spirit and I can do a great deal together." },
        { id = "h_rest", when = { metBefore = true },
          text = "I planted a seed by the sanctuary's edge this morning. It won't take. I plant one every morning anyway. One day one will." },
      },
      choices = {
        { text = "What happened to Felwood?", next = "what" },
        { text = "I'll help heal it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "The demons' war. To weaken Hyjal's defenders, a dreadlord poisoned the forest around the mountain with a cursed skull. The beasts twisted. The ancients turned. The land itself sickened, and it has not stopped." },
      },
      choices = {
        { text = "Can it be healed?", next = "heal" },
        { text = "That's horrible.", next = "END", fx = { affinity = 1 } },
      },
    },
    heal = {
      lines = {
        { id = "hl_default", text = "Slowly. One well, one grove, one seed at a time. The Circle has patience. The corruption has more. We'll see which runs out first." },
      },
      choices = { { text = "I'll lend my patience too.", next = "END", fx = { affinity = 3, trait = { patient = 1 }, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle is the Cenarion Circle's hands in Felwood. Our hands are tired. They're still working." } },
    _none = { { id = "tp_none", text = "I don't know. The forest might. Ask it gently." } },
  },
}

P:NPC {
  key = "greta", id = TODO_NPC("Greta Mosshoof"), name = "Greta Mosshoof",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "wary" }, values = { "protective", "wise" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_welcome", text = "The Emerald Circle welcomes you. Stay on the path, and don't touch anything that glows." },
    { id = "g_back", when = { metBefore = true }, text = "Still clean? Good. Felwood gets into people. Watch for it." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the same power that did this to the forest. I'll accept your help. I'll be watching while I do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother, here in all this poison. She'd weep to see it. Help me dry her tears." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Greta Mosshoof, of the Emerald Circle. The satyrs and the Shadow Council made this forest what it is. I'd like to unmake it. Don't let the power here tempt you; it's what poisoned the land." },
        { id = "h_jaedenar", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Forces of Jaedenar") }, { questActive = TODO_QUEST("A Final Blow") } } },
          text = "Jaedenar belongs to the Shadow Council now. Warlocks, demons, and worse beneath. Every one you put down gives the forest room to breathe." },
        { id = "h_water", when = { any = { { questActive = TODO_QUEST("Collection of the Corrupt Water") }, { questActive = TODO_QUEST("Seeking Spiritual Aid") } } },
          text = "The water carries the corruption downstream, into everything. A friend of mine, Islen Waterseer, may know how to cleanse it. Bring her what we gather." },
        { id = "h_cleansed", when = { questDone = TODO_QUEST("Cleansed Water Returns to Felwood") },
          text = "Clean water, back in Felwood. A small thing. It's how forests heal: one small thing, and then the next." },
        { id = "h_flames", when = { questActive = TODO_QUEST("Dousing the Flames of Protection") },
          text = "The Council's fires protect them. Put them out, and their walls come down with them." },
        { id = "h_watch", when = { metBefore = true },
          text = "I keep a stone from Mulgore in my pocket. When the forest gets too loud, I hold it. It's quiet, the way stones should be." },
      },
      choices = { { text = "I'll help.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not something the Circle has spoken of. Better I say nothing than something wrong." } },
  },
}

P:NPC {
  key = "maybess", id = TODO_NPC("Maybess Riverbreeze"), name = "Maybess Riverbreeze",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "earnest" }, values = { "kind", "practical" },
  notices = { "craft" },

  greetings = {
    { id = "g_hello", text = "Earth Mother's blessing. Come, sit a moment. There's always more work than hands in Felwood." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "You've a trade. Good. The salve needs all kinds of hands: herbs, hides, ore, enchanting dust. Everyone can help heal this place." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maybess Riverbreeze, Emerald Circle. I ask the Horde to help take Felwood back from the poison. Not by fighting, mostly. By mending." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "There's a salve we make that can cleanse the corrupted plants. It needs gathering, a little every day. Will you start?" },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You'll want Arathandris, to the south. She does for the Alliance what I do for the Horde. Same forest. Same work." },
        { id = "h_daily", when = { metBefore = true },
          text = "Every day a little salve, every day a little less poison. I'll not live to see it all clean. Somebody will." },
      },
      choices = { { text = "I'll help mend it.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I only know the forest, and only this bit of it." } },
  },
}

P:NPC {
  key = "arathandris", id = TODO_NPC("Arathandris Silversky"), name = "Arathandris Silversky",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "determined" }, values = { "protective", "devout" },
  notices = { "craft" },

  greetings = {
    { id = "g_hello", text = "These woods were beautiful, once. Help me make them so again." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "Your trade can heal, here. The salve needs what you gather. Felwood will thank you, in its slow way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Arathandris Silversky, Emerald Circle. I ask the Alliance to help me cleanse Felwood. The curse is old and stubborn. So am I." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "The salve. A little each day, laid on the sick plants. It doesn't look like war. It's harder than war." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Maybess, to the north of here, works with the Horde. Go to her. The forest doesn't care who heals it." },
        { id = "h_daily", when = { metBefore = true },
          text = "One of the plants by the road flowered yesterday. Clean. A small white flower. I've been watching it all morning." },
      },
      choices = { { text = "I'll help cleanse it.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle's in this forest. Few others would come." } },
    _none = { { id = "tp_none", text = "That I don't know. The curse I know." } },
  },
}
