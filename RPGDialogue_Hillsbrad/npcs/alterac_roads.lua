-- Between the towns: Ravenholdt Manor in the hills, the walls of Dalaran, a Syndicate prisoner, Tarren Mill's alchemist. Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ravenholdt", id = TODO_NPC("Lord Jorach Ravenholdt"), name = "Lord Jorach Ravenholdt",
  bible = "bibles/roads.md", role = "noble", tier = "quest",
  communities = { "ravenholdt" }, temper = { "cool" }, values = { "discreet", "proud" },
  notices = { "class" },
  impression = {
    first = "Lord Jorach Ravenholdt receives guests in a manor that is not supposed to be easy to find. He is courteous in the way a blade is polished, and he has clearly already decided what you are worth.",
    third = "{name} met Lord Jorach Ravenholdt, master of the hidden manor in the Alterac hills and no friend of the Syndicate.",
  },

  greetings = {
    { id = "g_manor", text = "You found the manor, which means either someone sent you or you are better at walking quietly than you look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The servants noticed you at the gate before you noticed them, I hope you realize." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of the trade, and not a Syndicate hireling, I trust. They tend to arrive here wearing their colours and leave without them." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_lock", when = { class = "WARLOCK" }, text = "They do, and some of their shadow mages dabble in the same arts you practise, though with less skill and fewer scruples, if you can imagine such a thing. I confess I would be curious to see what happens when the two of you meet in the dark." },
        { id = "xhcast_default", text = "They do, a handful of shadow mages who learned just enough in Alterac's better days to be dangerous. They cast from behind their swordsmen, which tells you everything about their courage, and a spellcaster who struck them first would spare my people a good deal of trouble." },
      },
      choices = {
        { text = "I'll face their casters openly, and let the Syndicate see who came.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll strike their casters from behind. They've earned nothing better.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they do, they speak quietly, which suits this house well. These hills have watched a king betray his own people and the Syndicate rise out of what was left, and I imagine the spirits have learned, as I have, to choose their confidants carefully." } },
      choices = {
        { text = "Then whatever they tell me here, I'll keep in confidence, my lord.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets are currency. I'd sell what the spirits tell me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We hide in it, and in return we keep it free of the Syndicate's woodcutters and smugglers, which I suspect suits the forest well enough. Alterac's nobles stripped these hills for coin once, and I do not intend to let their hirelings finish the work." } },
      choices = {
        { text = "A true guardian shouldn't need to hide.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "An unseen guardian is the best kind.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman of Thrall's Horde, at Ravenholdt. The Warchief's people rebuilt an old faith out of ashes in a few short years, and I respect anyone who builds something that lasts." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at Ravenholdt. My guests usually arrive in shadow, but few of them arrive on four paws, and I confess I find it refreshing." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest of the Horde, at my door. Whether you pray to the loa or to a Light that no longer quite answers you, I ask only that you pray quietly, because my servants are easily distracted." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage of the Horde. Whatever tower or village taught you, I would thank you not to practise on my tapestries, since they are older than your Warchief." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, received at Ravenholdt. Your own Horde remembers what your art once cost it, I am told, so you will understand if I keep you where the servants can see your hands." },
        { id = "h_default", key = true,
          text = "I am Jorach Ravenholdt, and this house has stood in these hills longer than Alterac's kings stood on their thrones. We keep our own counsel here, and we keep the Syndicate in its place." },
        { id = "h_emblems", tags = { "news" }, when = { questActive = TODO_QUEST("Syndicate Emblems") },
          text = "Those Syndicate emblems, yes. Every one you cut from a Syndicate cloak is a man who will not be reporting to the Perenoldes tonight, and I count them carefully." },
      },
      choices = {
        { text = "Does your house keep this forest, my lord, or only hide in it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do the spirits of Alterac speak to your house, my lord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Syndicate keep spellcasters of their own, my lord?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why does the Syndicate trouble you so much?", next = "syndicate" },
        { text = "What is this house, exactly?", next = "house" },
        { text = "I've walked in shadows a while. Is there a place for me here?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll leave you to your counsel, my lord.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something further? Speak plainly; this house dislikes wasted words." },
        { id = "h_again2", text = "Go on. The fire is warm and I have a little time." },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "Because they are thieves who call themselves an army, and they serve Alterac's disgraced nobles who sold their own kingdom to the Horde. Assassins should have masters with better taste than that." },
      },
      choices = {
        { text = "And the nobles who lead them?", next = "perenolde" },
        { text = "Thieves are thieves. You're no different, my lord.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Every trade needs a few rules. I'll respect yours.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    perenolde = {
      lines = {
        { id = "pe_default", text = "The Perenoldes cling to the ruins of Alterac and Strahnbrad and pay the Syndicate with coin they stole from their own people. Bring me the emblems their hirelings carry, and I will see your name remembered kindly in this house." },
      },
      choices = {
        { text = "Then I'll bring you emblems.", next = "BACK", fx = { affinity = 1, learn = "syndicate" } },
        { text = "I'll think on it.", next = "BACK" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "A guild, if you like, though we have no charter and no hall in any city. Those who belong here know it, and those who do not are shown the road politely, the first time." },
      },
      choices = {
        { text = "And the second time?", next = "house_second" },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    house_second = {
      lines = {
        { id = "hs_default", text = "There has not often been a second time, friend. The hills around Ravenholdt are steep, and the drop below the ridge is longer than most expect." },
      },
      choices = { { text = "I'll remember the drop.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Perhaps, in time. Ravenholdt opens its doors to those who prove they can be trusted with silence and a knife, and the Syndicate gives you a great many chances to prove both." },
      },
      choices = { { text = "Then I'll start with the Syndicate.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Hired knives with a noble's crest stitched on. Cut away the crest and they are only thugs." } },
    _none = { { id = "tp_none", text = "That is a question for someone who answers questions. I am not that person." } },
  },
}

P:NPC {
  key = "ansirem", id = TODO_NPC("Archmage Ansirem Runeweaver"), name = "Archmage Ansirem Runeweaver",
  bible = "bibles/roads.md", role = "scholar", tier = "service",
  communities = { "dalaran" }, temper = { "proud" }, values = { "learned", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Archmage Ansirem Runeweaver stands outside the violet dome over Dalaran as if waiting for it to finish a sentence. He speaks of the city's walls with the fondness of a man who helped build them.",
    third = "{name} met Archmage Ansirem Runeweaver of the Kirin Tor, keeping watch outside Dalaran's sealed dome.",
  },

  greetings = {
    { id = "g_dome", text = "Mind the barrier, please. It hums when it is pleased and crackles when it is not, and it has not been pleased in some time." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You can feel the dome, then, pressing at the back of your teeth. Good; it means you were taught properly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Archmage Ansirem Runeweaver of the Kirin Tor, at your service, within reason. Dalaran is closed while we rebuild, and I keep an eye on those who would rather it stayed broken." },
      },
      choices = {
        { text = "Why is the city sealed?", next = "dome" },
        { text = "Who wants Dalaran to stay broken?", next = "enemies" },
        { text = "I studied magic once. Does the Kirin Tor still teach?", next = "teach", when = { class = "MAGE" } },
        { text = "Good day, Archmage.", next = "END" },
      },
      again = { { id = "h_again", text = "Yes? I have a little patience left, and the dome has none." } },
    },
    dome = {
      lines = {
        { id = "do_default", text = "Archimonde broke the city when the Legion came, and the Scourge stripped what was left. The barrier keeps thieves and worse out while we mend the towers, and it keeps our mistakes in." },
      },
      choices = {
        { text = "Sealing yourselves away while the world burns seems wrong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Rebuilding first is wise. The world can wait a little.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "en_default", text = "The Syndicate in the hills, the Forsaken in their mill, and Dalaran's own renegades out at Ambermill in Silverpine. Loremaster Dibbs in Southshore keeps a list, and it grows longer every week." },
      },
      choices = { { text = "I'll ask Dibbs about the list.", next = "BACK", fx = { learn = "dalaran" } } },
    },
    teach = {
      lines = {
        { id = "te_default", text = "It teaches those it can reach, and for now that means the masters in Stormwind and Ironforge carry the burden. When the towers stand again, you may find the door open to you." },
      },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "A city of violet towers that will stand again, though not this year, I think." } },
    _none = { { id = "tp_none", text = "I'm afraid that falls outside my studies, and my studies are rather wide." } },
  },
}

P:NPC {
  key = "goldir", id = TODO_NPC("Gol'dir"), name = "Gol'dir",
  bible = "bibles/roads.md", role = "citizen", tier = "quest",
  communities = { "tarren_mill" }, temper = { "grim" }, values = { "loyal", "proud" },
  notices = { "race" },
  impression = {
    first = "Gol'dir is an orc the Syndicate kept in chains, moved from camp to camp in the Alterac hills. His wrists are raw, and his pride is not.",
    third = "{name} met Gol'dir, an orc held prisoner by the Syndicate in the hills of Alterac.",
  },

  greetings = {
    { id = "g_chains", text = "Another face at the bars. Speak, then, and tell me whether you came to gloat or to open this door." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "A brother of the Horde, here! Lok'tar, friend; I had nearly forgotten what our tongue sounds like in a free mouth." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They keep watch at night when the guards are drunk, and they question the prisoners when the guards grow bored of beating us. One of them asked me about Durotar for three days running, and his questions left marks the whip never did." } },
      choices = {
        { text = "Point him out to me, brother. I'll face him openly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll catch him asleep. He's earned no fair fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The key stays on the belt of whichever guard sleeps nearest the fire, because they trust nobody else with it. They change watch at dusk and again before dawn, and the second watch is always half asleep and half drunk." } },
      choices = {
        { text = "I'll take the key, but I'll fight the guard to his face.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take the key and leave nobody awake to raise an alarm.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some nights, when the guards slept, I heard the wind in the pines and remembered that Thrall freed our people from cages like these. The spirits did not break my chains, but they reminded me that chains have been broken before." } },
      choices = {
        { text = "Then walk out with your head high, and let the Syndicate see it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Freedom's enough. We slip out quietly, before anyone notices.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman of the Horde, here in these camps. I have asked the spirits of the earth to break these chains for many nights now, and perhaps they sent you instead." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, come to a chained orc. Whether you serve the loa or the Light the dead still whisper to, I don't care, so long as you can mend these wrists once the iron comes off." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage of the Horde. The Syndicate keep shadow mages in these camps, and I have watched them work for months, so forgive me if I flinch when you raise your hands." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, and of the Horde. I remember what your kind made of us before Thrall, so open this door if you've come to open it, and keep your demons on the far side of it." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "You came in quietly, and the guards never heard a thing. Good, because a Syndicate camp is full of men who sleep with one eye open and a hand on a knife." },
        { id = "h_default", key = true,
          text = "I am Gol'dir, and the Syndicate has kept me in chains longer than I care to count. They move me between their camps so nobody can find me, and still you found me." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "An Alliance face, and you have not drawn steel. Strange times, when a human's enemy and an orc's enemy are the same men in black cloaks." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Gol'dir") },
          text = "Krusk sent you? Then the old warrior did not forget me. Get these chains off, and I will walk back to Tarren Mill on my own feet." },
      },
      choices = {
        { text = "Did the spirits keep you company in your chains, Gol'dir?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the Syndicate's shadow mages do in these camps, Gol'dir?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where do the guards keep the keys, and when do they change watch?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why did the Syndicate take you?", next = "taken" },
        { text = "Who is Krusk to you?", next = "krusk" },
        { text = "What are they digging for at Strahnbrad?", next = "dig" },
        { text = "Lok'tar, brother. We'll get you home.", next = "BACK", when = { faction = "Horde" }, fx = { affinity = 2 } },
        { text = "I can't free you today. I'm sorry.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? The guards come back at dusk, so be quick." } },
    },
    taken = {
      lines = {
        { id = "ta_default", text = "I led Krusk's band out of Durotar on the Warchief's business, and the Syndicate ambushed us in these hills. Now they make me haul stone and dig at Strahnbrad, and they ask very often where the rest of my people went." },
      },
      choices = { { text = "Did you tell them?", next = "told" } },
    },
    told = {
      lines = {
        { id = "to_default", text = "Nothing that was true. A man in chains learns to give answers that send his jailers walking up cold hillsides for no reason, and I have sent them up a great many." },
      },
      choices = {
        { text = "Lying to the enemy is honorable work.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Clever, but I'd have just stayed silent.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    dig = {
      lines = {
        { id = "di_default", text = "Cellars and old vaults, under the houses the Perenoldes' people abandoned. They think Alterac's lords left gold behind when they ran, and they work orc backs bloody looking for it." },
      },
      choices = { { text = "Have they found anything?", next = "dig_found" } },
    },
    dig_found = {
      lines = {
        { id = "df_default", text = "Rats, bones and broken wine jars, mostly, which pleases me more than I can say. A noble's treasure is never where his servants were told it was." },
      },
      choices = {
        { text = "Let them dig forever, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    krusk = {
      lines = {
        { id = "kr_default", text = "Krusk rode under my command from Durotar, and he does not leave his people to rot. If he still waits in Tarren Mill, then I still have somewhere to walk to." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { learn = "tarren_mill" } } },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Cowards in black who beat chained men. I have long memory for their faces." } },
    _none = { { id = "tp_none", text = "Ask me again when I am not wearing iron." } },
  },
}

P:NPC {
  key = "hinott", id = TODO_NPC("Serge Hinott"), name = "Serge Hinott",
  bible = "bibles/roads.md", role = "trainer", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry" }, values = { "careful", "curious" },
  notices = { "craft" },
  impression = {
    first = "Serge Hinott teaches alchemy in Tarren Mill and measures reagents with the steadiness of someone whose hands no longer shake from anything. He speaks of poisons the way a baker speaks of bread.",
    third = "{name} met Serge Hinott, the Forsaken alchemist who teaches in Tarren Mill.",
  },

  greetings = {
    { id = "g_bench", text = "Step lightly near the bench. Half of what's on it is harmless and the other half is labelled, though not always correctly." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy" } },
      text = "You smell of the trade, which is a compliment, though few take it as one." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Very little, and I'm proud of that, though a spellcaster who could keep a flask cold on the road to Hammerfall would save me a great deal of wasted silverleaf. The heat in these valleys turns half my draughts before the Deathguards ever drink them." } },
      choices = {
        { text = "I'll help, if it serves the Dark Lady's soldiers first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Brew what you like. The Society's rules needn't bind you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The Syndicate, without a doubt, because their men came asking last spring with very good gold and very bad manners. I sent them away, but I've counted my vials every night since, and twice now the count has come up short." } },
      choices = {
        { text = "I'll find the thief and hand him to the High Executor.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sell the Syndicate your weakest batch and keep their gold.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The herbs are the same, peacebloom and silverleaf and the rest, and only the intentions differ. You ask the plant's spirit to help, and I ask the plant to stop a heart by morning, and I've never yet met a plant that refused me." } },
      choices = {
        { text = "Then I'll ask the spirits to undo whatever harm you brew.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "An herb is an herb. Use it however the war needs.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman at my bench. Your kind brew with herbs and prayers, I'm told, while I use herbs and arithmetic, and only one of us has ever had a complaint." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest at my bench. Whatever you pray to, loa or Light or the shadow between them, please do it after I've finished measuring, because prayer has never once improved a tincture." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. You're welcome to stand and watch, but you'll find alchemy terribly slow after fireballs, since nothing on this bench happens in less than a night." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Your sort buy my strongest draughts and never tell me what they're for, and I've decided I'm happier not knowing." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "One of the quiet ones. If you've come to compare poisons, I'd be delighted, because nobody else in Tarren Mill will talk shop with me." },
        { id = "h_default", key = true,
          text = "Serge Hinott, alchemist to Tarren Mill. The Apothecary Society does the grand work in the Undercity, and I do the useful work out here, where a draught has to be ready by morning." },
        { id = "h_living", when = { faction = "Alliance" },
          text = "A living one from Southshore's side of the hills. I'll not sell to you, but you can listen, I suppose, and then you can walk away quickly." },
      },
      choices = {
        { text = "Do your draughts and a shaman's herbs have anything in common?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there anything in Hillsbrad you can't brew without magic, Serge?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who would pay most for what's on this bench, Serge?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What do you brew out here?", next = "brews" },
        { text = "How do you get along with Apothecary Lydon?", next = "lydon" },
        { text = "Good day.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? The flask on the left is about to do something interesting." } },
    },
    brews = {
      lines = {
        { id = "br_default", text = "Remedies for the deathguards, mostly, and tonics for the living Horde who pass through and catch every cold in Hillsbrad. The more famous things I leave to Lydon, who enjoys them more than I do." },
      },
      choices = {
        { text = "Making weapons of sickness is beneath an alchemist.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "War is war. A good poison saves soldiers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lydon = {
      lines = {
        { id = "ly_default", text = "Well enough, so long as I stay out of his cellar. Whatever he's working on down there for the Society, he asks the farm folk of Hillsbrad to taste it, and they don't get a choice." },
      },
      choices = { { text = "I'll keep out of his cellar too.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it doesn't dissolve or distill, I've no opinion of it." } },
  },
}
