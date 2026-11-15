-- The Emerald Sanctuary: the Emerald Circle's camp in southern Felwood. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eridan", id = TODO_NPC("Eridan Bluewind"), name = "Eridan Bluewind",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "hopeful" }, values = { "devout", "patient" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_green", text = "Welcome, traveler. Look past the sickness, if you can, for there's still green under it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to Felwood, when most don't once they've seen it. Thank you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Can you feel it? The forest is still alive under the poison, and it's screaming, but it's alive." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of our own! You'll remember this forest as it was, or your parents will, so help me make it that again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Eridan Bluewind, of the Emerald Circle. Felwood was green once, and under all of this, somewhere, it still is, and we mean to find it again." },
        { id = "h_jadefire", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Corruption of the Jadefire") }, { questActive = TODO_QUEST("Further Corruption") } } },
          text = "The Jadefire satyrs wear the corruption like a crown, so thin their numbers; every one that falls is a little less poison in the soil." },
        { id = "h_flute", when = { questActive = TODO_QUEST("Flute of Xavaric") },
          text = "Xavaric carries a flute, and I want it out of satyr hands, because what it does in theirs I'd rather not see again." },
        { id = "h_ancients", when = { questActive = TODO_QUEST("Felbound Ancients") },
          text = "The ancients guarded this forest once, and now the corruption holds them, and it hurts to look at them. Do what must be done." },
        { id = "h_purified", when = { questDone = TODO_QUEST("Purified!") },
          text = "Purified... say it again, please, for I've waited a long time to hear that word in Felwood." },
        { id = "h_linken", when = { heardLine = "linken.h_default" },
          text = "You've met the gnome in Un'Goro who lost his memory? If his friends send you for a totem, come to me. The water spirit and I can do a great deal together." },
        { id = "h_rest", when = { metBefore = true },
          text = "I planted a seed by the sanctuary's edge this morning, and it won't take, but I plant one every morning anyway. One day one will." },
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
        { id = "w_default", text = "It was the demons' war. To weaken Hyjal's defenders, a dreadlord poisoned the forest around the mountain with a cursed skull. The beasts twisted and the ancients turned, and the land itself sickened, and it has not stopped." },
      },
      choices = {
        { text = "Can it be undone?", next = "what_undone" },
        { text = "I'll help heal it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    what_undone = {
      lines = { { id = "wu_default", text = "Slowly, and not in my lifetime, perhaps, and mine is long. But every satyr gone and every spring cleansed is a step, and healing is mostly stubbornness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "c_default", text = "We are those of the Cenarion Circle, and friends of it, who came to Felwood to fight for it, kaldorei and tauren side by side. The forest doesn't ask which." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    seeds = {
      lines = { { id = "s_default", text = "Because the day one takes, I want to have been here. And because a druid who stops planting has already lost." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you know why we stay. It doesn't hurt less with time; it only hurts more honestly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a druid of the Circle, sent where the land hurts most, and Felwood hurts most.", next = "what" } },
    advice = { { id = "tp_ad", text = "Don't drink from the streams, don't eat the fruit, and don't trust anything that glows green." } },
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle is the Cenarion Circle's hands in Felwood, and our hands are tired, but they're still working." } },
    _none = { { id = "tp_none", text = "I don't know, but the forest might, if you ask it gently." } },
  },
}

P:NPC {
  key = "greta", id = TODO_NPC("Greta Mosshoof"), name = "Greta Mosshoof",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "wary" }, values = { "protective", "wise" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_welcome", text = "The Emerald Circle welcomes you. Stay on the path, and don't touch anything that glows." },
    { id = "g_back", when = { metBefore = true }, text = "Still clean? Good; Felwood gets into people, so watch for it." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the same power that did this to the forest. I'll accept your help, but I'll be watching while I do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother, here in all this poison! She'd weep to see it, so help me dry her tears." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Greta Mosshoof, of the Emerald Circle. The satyrs and the Shadow Council made this forest what it is. I'd like to unmake it. Don't let the power here tempt you; it's what poisoned the land." },
        { id = "h_jaedenar", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Forces of Jaedenar") }, { questActive = TODO_QUEST("A Final Blow") } } },
          text = "Jaedenar belongs to the Shadow Council now, warlocks and demons, and worse beneath. Every one you put down gives the forest room to breathe." },
        { id = "h_water", when = { any = { { questActive = TODO_QUEST("Collection of the Corrupt Water") }, { questActive = TODO_QUEST("Seeking Spiritual Aid") } } },
          text = "The water carries the corruption downstream, into everything. A friend of mine, Islen Waterseer, may know how to cleanse it. Bring her what we gather." },
        { id = "h_cleansed", when = { questDone = TODO_QUEST("Cleansed Water Returns to Felwood") },
          text = "Clean water, back in Felwood, is a small thing, but it's how forests heal: one small thing, and then the next." },
        { id = "h_flames", when = { questActive = TODO_QUEST("Dousing the Flames of Protection") },
          text = "The Council's fires protect them. Put them out, and their walls come down with them." },
        { id = "h_watch", when = { metBefore = true },
          text = "I keep a stone from Mulgore in my pocket, and when the forest gets too loud, I hold it. It's quiet, the way stones should be." },
      },
      again = { { id = "h_again", text = "Yes? Ask, and I'll hold my stone while you do." } },
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
      lines = { { id = "cw_default", text = "It was a kaldorei village once, and something lies beneath it that they want, though I don't know what. I know they dig, and that the digging makes the forest worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tempt = {
      big = true,
      lines = { { id = "t_default", text = "The fel here hums, and some feel it as strength. Take a little, and you'll fight better tomorrow; take a little more, and you'll fight for them the day after." } },
      choices = {
        { text = "I won't touch it.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Power is power. It's how you use it.", next = "BACK", fx = { align = { light = -2 }, affinity = -2 } },
      },
    },
    stone = {
      lines = { { id = "s_default", text = "It's from the plains near home, plain grey and a little warm, and it's never once tried to be anything it isn't. I find that restful, here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "It should, since you know better than any of us what it costs. Mind your hands while you're here, warlock, because the forest is watching what you reach for." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { light = -1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a daughter of Mulgore who followed the Circle north. Some days I think I'll go home, and then I see one clean spring, and I stay." } },
    advice = { { id = "tp_ad", text = "If something here offers you strength, ask what it wants back. It always wants something back.", next = "tempt" } },
    _none = { { id = "tp_none", text = "That's not something the Circle has spoken of, and better I say nothing than something wrong." } },
  },
}

P:NPC {
  key = "maybess", id = TODO_NPC("Maybess Riverbreeze"), name = "Maybess Riverbreeze",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "earnest" }, values = { "kind", "practical" },
  notices = { "craft" },

  greetings = {
    { id = "g_hello", text = "The Earth Mother's blessing on you. Come and sit a moment; there's always more work than hands in Felwood." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "You've a trade, and that's good, because the salve needs all kinds of hands: herbs, hides, ore, enchanting dust. Everyone can help heal this place." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maybess Riverbreeze, of the Emerald Circle. I ask the Horde to help take Felwood back from the poison, not by fighting, mostly, but by mending." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "Bring me blood amber, the sap of the Warpwood elementals in the Irontree Caverns to the north. They're beyond saving, and what I learn from them may save everything else." },
        { id = "h_trusted", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cleansing Felwood"), days = 3 } },
          text = "I trust you now, friend, and I don't say that lightly in this forest. Take a Cenarion beacon, and let's begin on the plants." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You'll want Arathandris, to the south, who does for the Alliance what I do for the Horde. It's the same forest, and the same work." },
        { id = "h_daily", when = { metBefore = true },
          text = "Every day a little salve, and every day a little less poison. I'll not live to see it all clean, but somebody will." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask while my hands are busy; they work better when I'm talking." },
      },
      choices = {
        { text = "How do you mend a forest?", next = "mend" },
        { text = "Why must I kill elementals to earn your trust?", next = "trust" },
        { text = "What is the Emerald Circle?", next = "circle" },
        { text = "What was Felwood before?", next = "past" },
        { text = "I'm an herbalist. What should I look for?", next = "herb", when = { profession = "Herbalism" } },
        { text = "I'm Alliance. Can I still help?", next = "alliance", when = { faction = "Alliance" } },
        { text = "The alchemist at Bloodvenom wants the corruption.", next = "winna", when = { heardLine = "winna.h_default" } },
        { text = "I'll help mend it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },

    mend = {
      lines = {
        { id = "m_default", text = "With a salve the Cenarion Circle taught us, laid on the corrupted plants one by one. Some of them come back from it, and every one that does is a little root of the old forest taking hold again." },
      },
      choices = {
        { text = "How do you find the sick ones?", next = "mend_beacon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mend_beacon = {
      lines = {
        { id = "mb_default", text = "A Cenarion beacon shows you the taint the naked eye misses, the fel creep in the herbs and the sickness in the soil. I can make the salve from many things, so whatever your trade is, there's a way for you to help." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    trust = {
      big = true,
      lines = {
        { id = "t_default", text = "Because what I know about cleansing this forest would be a terrible weapon in the wrong hands, and I can't give it to just anyone who asks kindly. It seems odd, I know, that killing proves you'll help me heal." },
      },
      choices = {
        { text = "It does seem odd.", next = "trust_odd" },
        { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    trust_odd = {
      lines = {
        { id = "to_default", text = "The Warpwood elementals are past any saving, and their sap may teach me how to save everything that isn't. When so many lives hang on it, I've decided the end has to justify the means, and I pray to the Earth Mother that I'm right." },
      },
      choices = {
        { text = "I think you are.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'm not so sure.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    circle = {
      lines = {
        { id = "c_default", text = "Those of us here at the sanctuary who answer to the Cenarion Circle, tauren and night elves both. We came to learn what's poisoning Felwood and to stop it, and the stopping is slower than the learning." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    past = {
      lines = {
        { id = "p_default", text = "A green and peaceful forest, north of Ashenvale, before the demons came in the last war and twisted everything that grew here. The bears and the treants you see out there were whole once, and some part of them remembers it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    herb = {
      lines = {
        { id = "h2_default", text = "The fel creep, which clings to the herbs here like black moss. With the beacon you'll see it, and if you bring it to me I can purify it into the salve itself." },
      },
      choices = { { text = "I'll gather it.", next = "BACK", fx = { affinity = 2 } } },
    },
    alliance = {
      lines = {
        { id = "a_default", text = "Of course, though not from my hands; our peoples aren't ready for that, and I won't pretend otherwise. Arathandris to the south makes the same salve, and the plants won't care whose banner you fly." },
      },
      choices = { { text = "Thank you, Maybess.", next = "BACK", fx = { affinity = 1, opinion = { peace = "for" } } } },
    },
    winna = {
      lines = {
        { id = "w_default", text = "I've heard of her, and of the moonwell she wants water from. It grieves me that anyone of the Horde would look at this poison and see a tool, but I can't mend her, only the forest." },
      },
      choices = {
        { text = "She's helping the Horde, in her way.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I'll keep my distance from her.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A tauren of the Emerald Circle, who came to Felwood to heal what she could. I'll leave when it's healed, or when I'm too old to carry the salve." } },
    advice = { { id = "tp_ad", text = "Don't drink from any stream in Felwood, however clear it looks. The poison here is patient, and it doesn't always show itself." } },
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
      text = "Your trade can heal, here, because the salve needs what you gather, and Felwood will thank you, in its slow way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Arathandris Silversky, of the Emerald Circle. I ask the Alliance to help me cleanse Felwood, and the curse is old and stubborn, but so am I." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "The salve is laid on the sick plants a little each day. It doesn't look like war, but it's harder than war." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Maybess, to the north of here, works with the Horde, so go to her; the forest doesn't care who heals it." },
        { id = "h_daily", when = { metBefore = true },
          text = "One of the plants by the road flowered yesterday, clean, a small white flower, and I've been watching it all morning." },
      },
      again = { { id = "h_again", text = "Something else? Mind the flower, though." } },
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
      lines = { { id = "hh_default", text = "I don't, every day, and on the days I don't, I put the salve on anyway. Belief catches up eventually, because hands are more reliable than hearts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flower = {
      lines = { { id = "f_default", text = "It's still there, and still white. A satyr walked past it this morning and didn't notice, and I've never wanted anything so badly to stay unnoticed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maybess = {
      lines = { { id = "m_default", text = "Not side by side; our people won't allow it yet. But we use the same salve, and we leave each other notes by the road. The forest gets both of us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then pick nothing here that looks too healthy, because in Felwood the bright ones are the sick ones, and the dull grey ones might be getting better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Kaldorei, Emerald Circle, and too stubborn to be told a forest can't be saved." } },
    advice = { { id = "tp_ad", text = "Do one good thing a day here, only one, and then do it again tomorrow, because that's how this works.", next = "harder" } },
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle's in this forest, where few others would come." } },
    _none = { { id = "tp_none", text = "That I don't know, though the curse I know." } },
  },
}
