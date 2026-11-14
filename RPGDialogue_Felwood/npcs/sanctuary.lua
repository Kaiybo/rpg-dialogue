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
      again = { { id = "h_again", text = "What else? Softly; the sanctuary listens." } },
      choices = {
        { text = "What happened to Felwood?", next = "what" },
        { text = "What is the Emerald Circle?", next = "circle" },
        { text = "Why plant seeds that won't grow?", next = "seeds" },
        { text = "I can feel the sickness in the ground.", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "I'll help heal it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "The demons' war. To weaken Hyjal's defenders, a dreadlord poisoned the forest around the mountain with a cursed skull. The beasts twisted. The ancients turned. The land itself sickened, and it has not stopped." },
      },
      choices = {
        { text = "Can it be undone?", next = "what_undone" },
        { text = "I'll help heal it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    what_undone = {
      lines = { { id = "wu_default", text = "Slowly. Not in my lifetime, perhaps, and mine is long. But every satyr gone and every spring cleansed is a step. Healing is mostly stubbornness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "c_default", text = "Those of the Cenarion Circle, and friends of it, who came to Felwood to fight for it. Kaldorei and tauren, side by side. The forest doesn't ask which." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    seeds = {
      lines = { { id = "s_default", text = "Because the day one takes, I want to have been here. And because a druid who stops planting has already lost." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you know why we stay. It doesn't hurt less with time. It hurts more honestly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A druid of the Circle, sent where the land hurts most. Felwood hurts most.", next = "what" } },
    advice = { { id = "tp_ad", text = "Don't drink from the streams. Don't eat the fruit. Don't trust anything that glows green." } },
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
      again = { { id = "h_again", text = "Yes? Ask. I'll hold my stone while you do." } },
      choices = {
        { text = "Who are the Shadow Council?", next = "council" },
        { text = "Tempt me? How?", next = "tempt" },
        { text = "Tell me about the stone.", next = "stone", when = { metBefore = true } },
        { text = "The power here doesn't frighten me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Warlocks who serve the demons, the same kind who poisoned the orcs long ago. They've made Jaedenar their home. They like this forest the way it is." } },
      choices = {
        { text = "Why Jaedenar?", next = "council_why" },
        { text = "Then we change it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    council_why = {
      lines = { { id = "cw_default", text = "It was a kaldorei village once, and something lies beneath it they want. I don't know what. I know they dig, and that the digging makes the forest worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tempt = {
      big = true,
      lines = { { id = "t_default", text = "The fel here hums. Some feel it as strength. Take a little, and you'll fight better tomorrow. Take a little more, and you'll fight for them the day after." } },
      choices = {
        { text = "I won't touch it.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Power is power. It's how you use it.", next = "BACK", fx = { align = { light = -2 }, affinity = -2 } },
      },
    },
    stone = {
      lines = { { id = "s_default", text = "From the plains near home. Plain grey, a little warm. It's never once tried to be anything it isn't. I find that restful, here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "It should. You know better than any of us what it costs. Mind your hands while you're here, warlock. The forest is watching what you reach for." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { light = -1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A daughter of Mulgore who followed the Circle north. Some days I think I'll go home. Then I see one clean spring, and I stay." } },
    advice = { { id = "tp_ad", text = "If something here offers you strength, ask what it wants back. It always wants something back.", next = "tempt" } },
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
      again = { { id = "h_again", text = "Something else? Mind the flower." } },
      choices = {
        { text = "Why is it harder than war?", next = "harder" },
        { text = "Tell me about the flower.", next = "flower", when = { metBefore = true } },
        { text = "Do you work with Maybess?", next = "maybess" },
        { text = "I've some herb lore.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "I'll help cleanse it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    harder = {
      lines = { { id = "h2_default", text = "In war you win or lose and it's over. Here you do the same small thing every day, and most days nothing changes. You have to keep believing anyway." } },
      choices = {
        { text = "How do you keep believing?", next = "harder_how" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    harder_how = {
      lines = { { id = "hh_default", text = "I don't, every day. On the days I don't, I put the salve on anyway. Belief catches up eventually. Hands are more reliable than hearts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flower = {
      lines = { { id = "f_default", text = "Still there. Still white. A satyr walked past it this morning and didn't notice. I've never wanted anything so badly to stay unnoticed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maybess = {
      lines = { { id = "m_default", text = "Not side by side; our people won't allow it yet. But we use the same salve, and we leave each other notes by the road. The forest gets both of us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then pick nothing here that looks too healthy. In Felwood, the bright ones are the sick ones. The dull grey ones might be getting better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Kaldorei, Emerald Circle, and too stubborn to be told a forest can't be saved." } },
    advice = { { id = "tp_ad", text = "Do one good thing a day here. Only one. Then do it again tomorrow. That's how this works.", next = "harder" } },
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle's in this forest. Few others would come." } },
    _none = { { id = "tp_none", text = "That I don't know. The curse I know." } },
  },
}
