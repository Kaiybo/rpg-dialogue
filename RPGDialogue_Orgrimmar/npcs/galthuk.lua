-- Galthuk, two-handed weapons merchant in Orgrimmar. Voice: bibles/galthuk.md
-- An old Second War grunt who calls the Forsaken "the corpses Thrall let in the door" and sneers at
-- Darkspear voodoo. Under it: a brother buried in Lordaeron soil before the plague came through.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "galthuk", id = TODO_NPC("Galthuk"), name = "Galthuk",
  bible = "bibles/galthuk.md", role = "vendor", tier = "major",
  communities = { "orgrimmar" }, temper = { "gruff", "proud" }, values = { "proud", "loyal" },
  likesTone = "blunt",
  race = "Orc",
  notices = { "dead", "warlock", "veteran" },

  impression = {
    first = "He calls the Forsaken walking corpses and troll voodoo a cheat.",
    third = "{name} met Galthuk, an old orc weapon merchant in Orgrimmar with no love for the Forsaken or the trolls' hexes.",
  },

  greetings = {
    { id = "g_default", text = "Two hands, a good grip and a blade with some weight behind it, that's what wins a fight. Have a look if you've the coin." },
    { id = "g_dead", when = { race = "Scourge" }, text = "Keep your hands where I can see them, Forsaken. You'll touch my steel when you've paid for it, and not before." },
    { id = "g_troll", when = { race = "Troll" }, text = "Leave the charms and the shrunken heads at the edge of the stall, troll. My blades don't need blessing, only a strong arm." },
    { id = "g_orc", when = { race = "Orc" }, text = "Lok'tar, {g:brother|sister}. It's good to see a proper orc face in a city this full of trolls and walking corpses." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Either you liked my steel or you liked my company, and nobody likes my company." },
    { id = "g_back_dead", when = { metBefore = true, race = "Scourge" }, text = "You again. I'll say this for you, corpse, you don't scare off, and I've seen living grunts run from my stall for less." },
    { id = "g_soft", priority = 20, when = { npcFlagBefore = "told_brother", race = "Scourge" },
      text = "Ah, it's you. Stand where you like; I've been thinking on what you said about the dead remembering." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, and the city didn't fall without you. Still, I'll admit the stall was quieter." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word in the Drag is you've made enemies in the city. Make them outside the walls next time; there's more room to swing." },
  },

  notice = {
    { id = "n_dead", cat = "dead", when = { race = "Scourge" },
      text = "Your jaw's held on with wire. Does it hurt, or have your kind forgotten how hurting works?" },
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "There's sulfur on you. I smelled that smell on the Shadow Council's lot when I was young, and I've not forgotten what it bought us." },
    { id = "n_veteran", cat = "veteran", when = { race = "Orc", minLevel = 45 },
      text = "You carry that weapon like someone who's used it in earnest. Good, because the young ones learn to fight in the pits now and nowhere else." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Galthuk. I sell two-handed steel to anyone with the arms to swing it, and I fought for the Horde when it still knew what it was. These days it lets in anything that asks politely, the dead included." },
        { id = "h_dead", when = { race = "Scourge" },
          text = "I'll trade with you, because the Warchief says I must, but I'll not pretend to like it. The dead should stay in the ground where we leave them, not come walking up to my stall wanting an axe." },
        { id = "h_troll", when = { race = "Troll" },
          text = "The Darkspear fight well, I'll give them that, and Vol'jin's loyal to Thrall. It's the rest of it I can't stomach: the hexes, the shrunken heads and the bone-rattling down in the Valley of Spirits." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Good to see one of our own. Some days I walk the Drag and count more trolls and corpses than orcs, and I wonder whose city Thrall built." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "The tauren are honest folk, if slow to anger and slower still to come down off those mesas. I've no quarrel with you, and I can't say that about the trolls or the corpses." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "You know what your kind did to my people the last time we listened to them. And still the Warchief lets you keep your hole in the Cleft of Shadow." },
        { id = "h_soft", priority = 20, when = { npcFlagBefore = "told_brother" },
          text = "You're the one I told about my brother Grukar. I've not told anyone else and I'd like it kept that way, but I'm glad I said it out loud once." },
        { id = "h_agreed", priority = 10, when = { npcFlagBefore = "agreed_dead", ["not"] = { race = "Scourge" } },
          text = "Ah, the one with sense, who sees the Forsaken for what they are. Thrall's a great orc, but he trusts too easily, and that's how the Horde gets hurt." },
      },
      again = {
        { id = "h_again", text = "What else? I've steel to oil, so be quick about it." },
        { id = "h_again2", text = "Go on, then. You've more questions than a grunt on his first day." },
        { id = "h_again_dead", when = { race = "Scourge" }, text = "Still here, Forsaken? Ask, then, since the stall's quiet and I've nothing better to do." },
        { id = "h_tone_blunt", when = { chance = 0.5, tone = "blunt" }, text = "You talk like a grunt, straight out and no bowing. That's how orcs spoke before half this city learned its manners from Undercity clerks." },
        { id = "h_tone_polite", when = { chance = 0.5, tone = "polite" }, text = "Save the pleases and thank-yous for the Undercity, where the dead like their manners. Here you say what you want and you pay for it." },
        { id = "h_tone_polite2", when = { chance = 0.5, tone = "polite" }, text = "All that bowing makes me wonder what you're after. Talk plain to me and I'll sell you plain steel, and we'll both be happier for it." },
      },
      choices = {
        { text = { normal = "Tell me about your steel.", polite = "I'd like to hear about your steel, if you've a moment.", blunt = "Tell me about the steel." }, next = "trade" },
        { text = { normal = "You've no love for the Forsaken, have you?", polite = "With respect, you've no love for the Forsaken, have you?", blunt = "You don't like the Forsaken, do you?" }, next = "forsaken", when = { ["not"] = { race = "Scourge" } } },
        { text = { normal = "What do you have against the trolls?", polite = "If I may ask, what do you have against the trolls?", blunt = "What's your quarrel with the trolls?" }, next = "trolls", when = { ["not"] = { race = "Troll" } } },
        { text = { normal = "You fought in the old wars?", polite = "If I may ask, did you fight in the old wars?", blunt = "You were in the old wars?" }, next = "war" },
        { text = { normal = "Say what you think of me plainly, orc.", polite = "Tell me plainly what you think of me, if you would.", blunt = "Say what you think of me, orc." }, next = "xdead", when = { race = "Scourge" } },
        { text = { normal = "Orcs drank demon blood. Don't lecture me about hexes.", polite = "With respect, orcs drank demon blood. Spare me the lecture on hexes.", blunt = "Orcs drank demon blood. Keep your hex talk to yourself." }, next = "xtroll", when = { race = "Troll" } },
        { text = { normal = "Show me your wares.", polite = "I'd like to see your wares, if you please.", blunt = "Let's see the steel." }, next = "BUSINESS" },
        { text = { normal = "I'll leave you to it.", polite = "I'll leave you to your work. Thank you.", blunt = "I'm done here." }, next = "END" },
      },
    },

    trade = {
      lines = {
        { id = "t_default", text = "Great axes from the forges here in the city, two-handed swords, and a few mauls heavy enough to stop a charging kodo. Nothing fancy, nothing blessed, and nothing a witch doctor's waved a chicken foot over." },
        { id = "t_warrior", when = { class = "WARRIOR" },
          text = "You're a warrior, so you know already: a great axe asks everything of you and gives it all back. I fought with one from Khaz Modan to the gates of Lordaeron's capital, and I never once wished for a shield." },
      },
      choices = {
        { text = "Where did you carry yours?", next = "war" },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      lines = {
        { id = "f_default", text = "Love them? They're corpses, {class}, the corpses Thrall let in the door because their queen needed friends. A thing that's died and got up again has nothing left to lose, and I've never trusted anyone with nothing to lose." },
      },
      choices = {
        { text = "Why do you trust them so little?", next = "forsaken_why" },
        { text = "They fight the Scourge as hard as anyone.", next = "forsaken_why",
          fx = { affinity = -1, align = { light = 1 }, npcFlag = { set = { "defended_dead" } } } },
        { text = "You're right. The dead don't belong in the Horde.", next = "forsaken_why",
          fx = { affinity = 1, align = { light = -1 }, npcFlag = { set = { "agreed_dead" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_why = {
      lines = {
        { id = "fw_default", text = "Because I've seen what the plague does. I was still in Lordaeron when it came, and I watched the dead climb out of the grain towns, and nobody can tell me which of them woke up one morning and decided to be friends." },
        { id = "fw_defended", when = { npcFlag = "defended_dead" },
          text = "Hard as anyone, aye, and they'd fight us just as hard if their queen said so. I was in Lordaeron when the plague came, and I watched the dead get up out of the grain towns, so don't tell me what they are." },
        { id = "fw_agreed", when = { npcFlag = "agreed_dead" },
          text = "At last, someone in this city with sense. I was in Lordaeron when the plague came, and I watched the dead get up out of the grain towns, and talking doesn't make them any less dead." },
      },
      choices = {
        { text = "Thrall chose them as allies. Trust his judgment.", next = "BACK", reply = "I trust him with my life, and I still won't trust them with my back. Maybe he sees further than a grain seller, but I'll keep my eyes open.", fx = { align = { order = 1 } } },
        { text = "Then tell Thrall he's wrong. Someone should.", next = "BACK", reply = "I've told him, more or less, in a crowd at the Hold, and he listened and didn't change his mind. That's the Warchief for you.", fx = { align = { order = -1 } } },
        { text = "Who did you lose in Lordaeron?", next = "lost" },
      },
    },
    lost = {
      lines = {
        { id = "l_default", text = "I didn't say I lost anyone, did I? Every orc who came out of the camps left someone behind in that country, and it's no business of yours who mine was." },
      },
      choices = {
        { text = "You fear one of the Forsaken might be someone you buried.", tag = "Persuade", next = "brother",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { class = "SHAMAN" }, { race = "Scourge", affinity = { min = 2 } } } } },
          fail = { next = "lost_closed", fx = { affinity = -1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    lost_closed = {
      lines = {
        { id = "lc_default", text = "Nice try. Better tongues than yours have poked at me and come away with nothing, so buy something or move along." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
        { text = "Fine. Good day.", next = "END" },
      },
    },
    brother = {
      lines = {
        { id = "b_default", key = true, text = "My brother, Grukar. He died of the camp fever, and the guards made us put him in the ground behind the stockade like a human, when he should have burned the way our people burn.",
          fx = { npcFlag = { set = { "told_brother" } } } },
        { id = "b_dead", when = { race = "Scourge" },
          text = "All right, corpse, you've earned it. My brother Grukar died of the camp fever, and the guards made us bury him in Lordaeron soil like a human, when he should have burned the way our people burn.",
          fx = { npcFlag = { set = { "told_brother" } } } },
      },
      choices = {
        { text = "And then the plague came through that country.", next = "brother_fear" },
        { text = "I'm sorry, Galthuk.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brother_fear = {
      lines = {
        { id = "bf_default", text = "The plague raised every grave it found in that country. So when a Forsaken walks up to my stall, I look at its face, and I'm afraid I'll know it, and that's the whole of it." },
      },
      choices = {
        { text = "If he walks, he's still your brother. Ask the Forsaken about him.", next = "BACK", reply = "Ask them? And hear that he's one of them now, walking and rotting with no memory of me? I don't know if I'd want that answer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then burn any that come near. It's what he'd want.", next = "BACK", reply = "Maybe it is, and maybe I'd do it. But I'd want to be sure it wasn't him first, and I'm never sure.", fx = { align = { light = -1 } } },
        { text = "Most of us don't remember who we were. Some do.", next = "BACK", fx = { affinity = 2 }, when = { race = "Scourge" } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trolls = {
      lines = {
        { id = "tr_default", text = "The Darkspear stood with us on the Echo Isles when the humans came, and their old chief died there, so I'll not hear a word against their courage. But the voodoo is a cheat: an orc's strength is in his arm and his ancestors, and a troll's is in whatever he mumbled at the loa that morning.",
          fx = { learn = { "echo_isles" } } },
      },
      choices = {
        { text = "Our own shamans talk to spirits too. What's the difference?", next = "trolls_push" },
        { text = "Agreed. A real warrior doesn't need tricks.", next = "BACK", reply = "That's it exactly, and you're the first who's agreed with me in a week. Strength in the arm, and the ancestors behind it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hex that wins the fight is as good as an axe.", next = "BACK", reply = "That's what the trolls say too, and I can't argue with a win. Still feels like cheating to me, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_push = {
      lines = {
        { id = "tp_default", text = "The difference is that our spirits are our own ancestors and the elements, which answer any honest shaman. The loa are old jungle gods who want blood for every favour, and I've seen a grunt come out of a troll hex not knowing his own name." },
        { id = "tp_shaman", when = { class = "SHAMAN" },
          text = "You'd know better than me, shaman, and I'll grant the elements answer trolls too. It's the loa I don't trust, old jungle gods who want blood for every favour, and the witch doctors who bargain with them." },
      },
      choices = {
        { text = "Have you ever asked a troll about it?", next = "trolls_asked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_asked = {
      lines = {
        { id = "ta_default", text = "A witch doctor in the Valley of Spirits once offered to read my bones for nothing, and I told him I'd keep my bones where they were. He laughed for a good long while, which I still don't like to think about." },
      },
      choices = {
        { text = "Maybe he only meant it kindly.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    war = {
      lines = {
        { id = "w_default", text = "I fought under Doomhammer in the Second War, from Khaz Modan to the gates of Lordaeron's capital. Then the humans won and put us in their camps, and I spent more years behind their fences than I ever spent at war." },
      },
      choices = {
        { text = "What were the camps like?", next = "camps" },
        { text = "Do you miss the old Horde?", next = "oldhorde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = {
        { id = "c_default", text = "Cold, mostly, and quiet, which was worse. The bloodlust had gone out of us and nothing came to fill it, so we sat in the mud and let the humans feed us until Thrall came and woke us up." },
      },
      choices = {
        { text = "Thrall freed you, yet you doubt his allies?", next = "camps_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_thrall = {
      lines = {
        { id = "ct_default", text = "I'd die for Thrall, and I'd tell him he's wrong to his face, and I don't see a quarrel between the two. He was raised among humans, so he's softer on strangers than a camp orc can afford to be." },
      },
      choices = {
        { text = "Loyalty means trusting your Warchief's judgment.", next = "BACK", reply = "It does, and I do trust it, mostly. But a loyal orc who never speaks up isn't much use to a Warchief either.", fx = { align = { order = 1 } } },
        { text = "A true warrior speaks his mind, even to a Warchief.", next = "BACK", reply = "That's my way, and I'm glad to hear it's yours too. Thrall can take it; he's heard worse from Grom.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldhorde = {
      lines = {
        { id = "oh_default", text = "I miss being young, and I miss my brother, and I don't miss the demon blood one bit. Anyone who says the old Horde was better never had to wake up from it." },
      },
      choices = {
        { text = "Your brother?", next = "lost" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdead = {
      lines = {
        { id = "xd_default", text = "Plainly? You're a corpse that talks, and I don't know what's behind your eyes, and I'm not sure you do either. The Warchief says you're our allies, so I'll sell you an axe, but I'll be watching where you swing it." },
      },
      choices = {
        { text = "Fair. I'd watch me too.", next = "xdead_ask", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Orcs had demons in their blood. You're no cleaner.", next = "xdead_ask",
          fx = { affinity = -1, align = { light = -1 }, npcFlag = { set = { "retorted" } } } },
        { text = "Why do you hate us so much?", next = "xdead_ask" },
      },
    },
    xdead_ask = {
      lines = {
        { id = "xa_default", text = "Hate's a big word. Tell me something first, since you're standing here: who were you, before? Did you have a name and a family, and do you remember them?" },
        { id = "xa_retort", when = { npcFlag = "retorted" },
          text = "Demon blood, aye, and we drank it ourselves and paid for it ourselves. So tell me, since you're so sharp: who were you, before, and do you remember any of it?" },
      },
      choices = {
        { text = "I remember everything. That's the worst of it.", next = "xdead_remember", fx = { affinity = 2 } },
        { text = "I remember nothing. That life is gone.", next = "xdead_forget" },
        { text = "That's none of your business, orc.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    xdead_remember = {
      lines = {
        { id = "xr_default", text = "Everything. Then somebody buried you once and grieved for you, and maybe still does. I put someone in that country's ground myself, and I've wondered ever since the plague came whether he's still lying there." },
      },
      choices = {
        { text = "Tell me about him. I'll listen as one who was buried.", tag = "Persuade", next = "brother",
          check = { pass = { any = { { disposition = { min = 60 } }, { affinity = { min = 2 } }, { trait = "kind" } } } },
          fail = { next = "lost_closed", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdead_forget = {
      lines = {
        { id = "xf_default", text = "Nothing at all? Then you're lucky or you're lying, and I can't tell which, and that's the whole trouble with your kind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },

    xtroll = {
      lines = {
        { id = "xt_default", text = "Hah, that's fair, and I'll not argue it, because I was there when the warlocks poured it for us. But we drank it once and spat it out, and your witch doctors take the loa's favours every morning and call it breakfast." },
      },
      choices = {
        { text = "Ask a witch doctor before you judge them.", next = "xtroll_loa" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll_loa = {
      lines = {
        { id = "xl_default", text = "Ask one? I nearly did once, down in the Valley of Spirits, and then my nerve went and I bought a drink instead. Maybe you've a point, troll, but don't tell anyone I said so." },
      },
      choices = {
        { text = "Next time, I'll walk you down there myself.", next = "BACK", reply = "Would you? Then maybe I'll go, if you're there to keep my nerve up. Don't tell the other stallholders.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Keep your doubts. The loa don't need an orc's blessing.", next = "BACK", reply = "Fair enough, troll, and I'll keep them to myself. The loa have done well enough without me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You've an eye for good steel and you're not afraid to say so, which I like. Most who walk in here can't tell an axe from a shovel." },
        { id = "s2", text = "Hm, that's fair praise and plainly given, and I'll not pretend I mind hearing it. I've put a lot of years into these blades." },
      },
      fail = {
        { id = "f1", text = "Flattery won't put an edge on a blade, and it won't put one on me either. If you want something, say it straight." },
        { id = "f2", text = "I've heard smoother talk from goblins trying to sell me pig iron, and I threw them out too. Keep your sweet words for someone softer." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've got a mouth on you, and I've not had a good insult since the camps. An orc who'll needle an old grunt to his face is an orc worth knowing." },
        { id = "s2", text = "That's the kind of cheek Doomhammer's grunts used to trade around the fire, and I'd forgotten how much I liked it. You'll do, {class}." },
      },
      fail = {
        { id = "f1", text = "I carried an axe under Doomhammer while you were still learning which end to hold. Mock me again and you can buy your blades from someone else." },
        { id = "f2", text = "You think that stings, after the years I spent behind human walls with humans laughing at me? Try harder, or better yet, get out of my shop." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, I can see you're not one to cross, and I'm too old to prove otherwise over nothing. You've made your point." },
        { id = "s2", text = "I know that look, because I've seen it across a battlefield, and the ones who wore it usually walked away. I'll not push you, {class}." },
      },
      fail = {
        { id = "f1", text = "You're threatening an orc who stands in a room full of axes, and I sharpened every one of them myself. Think about that for a moment." },
        { id = "f2", text = "Human wardens with whips couldn't frighten me into bowing, and you're no warden. Put your chest back in and act like you belong in this city." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The Burning Blade have a nest in Ragefire Chasm, right under the Cleft of Shadow, and anyone who says the Cleft doesn't know about it is lying or a fool." },
    { id = "bl2", text = "If I were the Warchief, I'd watch whoever keeps the Cleft of Shadow as closely as he claims to watch the Burning Blade. That's all I'll say, and I'll deny I said it." },
    { id = "bl3", text = "Half the Warchief's own guard buy their axes off me, and I know which of them can't swing them. Ask me the wrong way and I'll tell the whole Drag." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "I don't like you, and I don't sell my best steel to folk I don't like. That's the whole of it." },
      { id = "gv_prej", when = { grudge = "prejudice" }, text = "I fought beside living orcs and honest steel my whole life, and you're neither. Don't ask me to pretend I don't see it." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You haggled me like a goblin and then talked down to me like a peon. I've broken grunts' noses for less in the camps." },
      { id = "gv_values", when = { grudge = "values" }, text = "A warrior who fights dirty and boasts about it isn't a warrior, he's a liability. I've watched you, and I know which you are." },
    },
    amends = {
      { id = "am1", text = "Fight clean, pay what you owe, and stop wasting my time. Do that for a season and I might forget your face." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "You can't change what you are, so don't try. Just keep your hexes and your stink outside my stall and we'll get along well enough." },
    },
    spite = {
      { id = "sp1", text = "I think you'd drop the first blade I sold you the moment something bit back. I'd not trust you to hold a shield in a line." },
      { id = "sp_prej", when = { grudge = { worst = "prejudice" } }, text = "I think the Warchief is too generous with who he calls Horde, and you're the proof of it. Now get away from my axes." },
    },
    _gated = {
      { id = "gt1", text = "That's my business and none of yours, not until I know you better than I do." },
      { id = "gt2", text = "I don't tell that to every stranger with coin in hand, so prove yourself first, and then we'll see." },
    },
    knows = { { id = "tp_knows", text = "I know steel, and war, and which folk in this city I'd trust at my back. Ask, and I'll tell you straight." } },
    background = { { id = "tp_bg", text = "A grunt under Doomhammer, then years in the human camps, then Thrall. Now I sell axes, which is the closest thing to peace I've found." } },
    advice = { { id = "tp_ad", text = "Buy the heaviest blade you can swing for a whole day, not the heaviest you can lift once. The second kind gets you killed by noon." } },
    burning_blade = { { id = "tp_blade", text = "Orcs bargaining with demons again, in the caves of Durotar and under our own city in the Cleft of Shadow. We bled for the Legion once, and some fools want a second taste." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I don't care to. Ask a shaman; they like talking." } },
  },
}
