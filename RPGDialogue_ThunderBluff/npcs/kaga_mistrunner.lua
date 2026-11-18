-- Kaga Mistrunner, meat vendor in Thunder Bluff. Voice: bibles/kaga_mistrunner.md
-- A traditional tauren who resents the Forsaken apothecaries in the Pools of Vision, hates the Venture Company
-- for her son's crushed leg, and keeps an eye on orc warlocks. Her secret: a Forsaken apothecary saved that leg.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kaga_mistrunner", id = TODO_NPC("Kaga Mistrunner"), name = "Kaga Mistrunner",
  bible = "bibles/kaga_mistrunner.md", role = "vendor", tier = "major",
  communities = { "thunder_bluff" }, temper = { "gruff", "proud" }, values = { "honest", "loyal" },
  likesTone = "blunt",
  notices = { "dead", "warlock", "hunter" },

  impression = {
    first = "Kaga Mistrunner sells meat in Thunder Bluff and speaks of the Forsaken in the Pools of Vision as a wrong done to the Earth Mother. She hates the Venture Company for her son's leg, and there is more to that story than she says.",
    third = "{name} met Kaga Mistrunner, a Thunder Bluff meat seller who wants the Forsaken gone from the Pools of Vision.",
  },

  greetings = {
    { id = "g_default", text = "Plainstrider, kodo and a little boar, all hunted clean in Mulgore and cured properly. Look as long as you like." },
    { id = "g_dead", when = { race = "Scourge" }, text = "You've come up from the Pools, have you? I sell meat for the living, but I suppose your coin spends the same." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "Earth Mother keep you, child of the plains. Come, look, and tell me what your family's cooking these days." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Keep that creature of yours away from my meat. I don't want it sniffing at anything I mean to sell." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Either you're hungry, or you've another question, and I hope it's the hunger." },
    { id = "g_thanked", priority = 20, when = { npcFlagBefore = "urged_thanks" },
      text = "There you are. I did what you told me, and I've been waiting for someone to say it to, so come here and listen." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and you've come back thinner. That's what the road does if nobody feeds you properly." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People on the rises speak well of you. I'll make my own mind up, but it does you no harm." },
  },

  notice = {
    { id = "n_dead", cat = "dead", when = { race = "Scourge" },
      text = "You smell of the apothecaries' bottles. Do all of you carry that smell, or only the ones who work down there?" },
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK", race = "Orc" },
      text = "An orc who still keeps demons. The Burning Blade wore your face too, and they still hide in the caves of Durotar with theirs." },
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER" },
      text = "A hunter. Tell me you take only what you need, and tell me true, because the goblins never learned how." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Kaga Mistrunner, and I sell the meat of Mulgore to anyone who'll cook it well. I've opinions on everything else that's come up onto these mesas lately, and I don't keep them to myself." },
        { id = "h_dead", when = { race = "Scourge" },
          text = "The High Chieftain welcomed your people, and he's wiser than I am, so I hold my tongue most days. But the Earth Mother gathers in what dies, and every time one of you walks past my stall I feel her being cheated." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Good to see one of our own. The mesas fill up with strangers these days, the dead in the Pools and orcs with their fire and goblins wanting to buy the ground under our hooves, and some days I miss when it was only us." },
        { id = "h_orc", when = { race = "Orc" },
          text = "The orcs are honest enough, and they stood with us against the centaur, which I don't forget. I only wish more of you had left your demons behind when you crossed the sea." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "I know what you carry with you. The orcs of the Burning Blade carried the same, and I'll be glad to see your back once you've bought what you came for." },
        { id = "h_thanked", priority = 20, when = { npcFlagBefore = "urged_thanks" },
          text = "I went down to the Pools and thanked the apothecary for Tahote's leg. She looked at me as though I'd grown a second head, and then said it had been interesting work, and I still don't know what I expected." },
        { id = "h_kept", priority = 10, when = { npcFlagBefore = "kept_secret" },
          text = "You kept what I told you to yourself, I hope. I've not told my son, and I've not told the elders, and some nights I can't decide whether that makes me a liar." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while I'm cutting, I can do both." },
        { id = "h_again2", text = "Go on. You've the look of someone with another question in them." },
        { id = "h_again_dead", when = { race = "Scourge" }, text = "Still here? Ask, then, and I'll answer you straight, even you." },
      },
      choices = {
        { text = "Where does your meat come from?", next = "trade" },
        { text = "You don't care for the Forsaken in the Pools?", next = "forsaken", when = { ["not"] = { race = "Scourge" } } },
        { text = "What did the Venture Company do to you?", next = "venture" },
        { text = "You don't trust the orcs?", next = "orcs", when = { ["not"] = { class = "WARLOCK" } } },
        { text = "Say it plainly. You want me gone from Thunder Bluff.", next = "xdead", when = { race = "Scourge" } },
        { text = "My power serves the Horde. I'm not the Burning Blade.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Cairne welcomed them. Will you doubt the High Chieftain?", next = "xcairne", when = { race = "Tauren" } },
        { text = "Let's see what you have.", next = "BUSINESS" },
        { text = "Earth Mother keep you, Kaga.", next = "END" },
      },
    },

    trade = {
      lines = {
        { id = "t_default", text = "My son hunts the plains for me, plainstrider and kodo and a boar when the quilboar haven't scared them all off. I cure it with salt from Ratchet, and I'll not pretend there's better salt anywhere in Kalimdor." },
      },
      choices = {
        { text = "Ratchet? That's goblin salt.", next = "trade_salt" },
        { text = "Your son hunts for you? Tell me about him.", next = "venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_salt = {
      lines = {
        { id = "ts_default", text = "Goblin salt, aye, from the Steamwheedle traders, and that's different. They sell and I buy and nobody digs up Mulgore, whereas the Venture Company came with saws and machines and never asked anyone.",
          fx = { learn = { "steamwheedle" } } },
      },
      choices = {
        { text = "Ratchet's goblins aren't the Venture Company. You're right.", next = "BACK", reply = "I'm glad someone sees it, because half the bluff lumps them all together. A Ratchet goblin will cheat you on the price, but at least he won't cut down your trees.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A goblin is a goblin. Their coin all flows the same way.", next = "BACK", reply = "Maybe so, and I count my change twice with every one of them. But a trader who cheats me is not the same as a company that crushed my son's leg.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      lines = {
        { id = "f_default", text = "Care for them? When a tauren dies, we give the body back to the Earth Mother and the spirit goes on to the ancestors, and that is how it's meant to be. Those things in the Pools of Vision were kept from her, and now they sit beneath Spirit Rise boiling poisons in the waters our elders use for visions." },
      },
      choices = {
        { text = "What do you think the apothecaries are brewing?", next = "forsaken_earth" },
        { text = "The Forsaken never chose to die. Pity them instead.", next = "forsaken_earth",
          fx = { affinity = -1, align = { light = 1 }, npcFlag = { set = { "pitied_dead" } } } },
        { text = "You're right. The dead belong to the Earth Mother.", next = "forsaken_earth",
          fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_earth = {
      lines = {
        { id = "fe_default", text = "I don't know what they brew, and that's the trouble. The Elder Crone keeps them close and the High Chieftain gave them shelter, and nobody asks a meat seller what she thinks of having plague-makers under her feet.",
          fx = { learn = { "grimtotem" } } },
        { id = "fe_pity", when = { npcFlag = "pitied_dead" },
          text = "Pity them? I do, some nights, and then I see the bottles going down to the Pools. The Elder Crone keeps them close and the High Chieftain gave them shelter, and nobody asks a meat seller what she thinks of plague-makers under her feet." },
      },
      choices = {
        { text = "Is it only the dead, or has someone else hurt you?", next = "venture" },
        { text = "Something else.", next = "BACK" },
      },
    },

    venture = {
      lines = {
        { id = "v_default", text = "The Venture Company came into the north of Mulgore with saws and machines and tore into the hills for whatever goblins dig for. My son Tahote went up with the hunters to drive them off, and one of their shredders came down on his leg.",
          fx = { learn = { "venture_company" } } },
      },
      choices = {
        { text = "Is he all right now?", next = "son" },
        { text = "Every goblin I've met would sell his own mother.", next = "son", fx = { affinity = 1, align = { light = -1 } } },
        { text = "The Venture Company's crimes aren't every goblin's.", next = "son", fx = { align = { light = 1 } } },
      },
    },
    son = {
      lines = {
        { id = "s_default", text = "He walks, with a limp, and he still hunts for me, slower than he did. The Earth Mother spared the leg when the healers had given up on it, and I thank her every morning." },
      },
      choices = {
        { text = "Did the Earth Mother save it, Kaga? Or someone else?", tag = "Persuade", next = "apothecary",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "DRUID", "PRIEST", "SHAMAN" } }, { trait = "honest" }, { race = "Scourge", affinity = { min = 2 } } } } },
          fail = { next = "son_closed", fx = { affinity = -1 } } },
        { text = "I'm glad he's on his feet.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_closed = {
      lines = {
        { id = "sc_default", text = "The Earth Mother saved it, I said, and I'll thank you not to tell me my own son's story. Buy something or leave me to my cutting." },
      },
      choices = {
        { text = "Forgive me. Something else.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },
    apothecary = {
      lines = {
        { id = "a_default", key = true, text = "The rot had got into it, and the shamans' poultices did nothing, and they spoke of taking the leg. Then one of the apothecaries came up from the Pools with a bottle that burned like fire, and the rot went out of it in three days.",
          fx = { npcFlag = { set = { "told_secret" } } } },
        { id = "a_dead", when = { race = "Scourge" },
          text = "Since you'll find out from your own kind anyway: the rot had got into it and the shamans had given up. One of the apothecaries came up from the Pools with a bottle that burned like fire, and the rot went out of it in three days.",
          fx = { npcFlag = { set = { "told_secret" } } } },
      },
      choices = {
        { text = "Does your son know?", next = "apothecary_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apothecary_secret = {
      lines = {
        { id = "as_default", text = "He was burning with fever and remembers none of it, and I told him it was the Earth Mother. I've never thanked that apothecary, and I've said worse about her people since than I've said to you today." },
      },
      choices = {
        { text = "Go down to the Pools and thank her, Kaga.", next = "BACK",
          fx = { affinity = 1, align = { honor = 1 }, npcFlag = { set = { "urged_thanks" } } } },
        { text = "Keep it to yourself. You owe the dead nothing.", next = "BACK",
          fx = { align = { honor = -1 }, npcFlag = { set = { "kept_secret" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orcs = {
      lines = {
        { id = "o_default", text = "Most of them, I trust well enough, and Thrall is a friend to our people. But the orcs drank demon blood once, and some of them never lost the taste, and you'll find them in the caves of Durotar calling themselves the Burning Blade.",
          fx = { learn = { "burning_blade" } } },
      },
      choices = {
        { text = "Do you see the Burning Blade in every orc?", next = "orcs_blade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs_blade = {
      lines = {
        { id = "ob_default", text = "Not every orc, no. But I see warlocks walking openly in Orgrimmar with their imps at their heels, and the Warchief allows it, and I wonder how a people can say they're free of demons while they keep them as pets." },
      },
      choices = {
        { text = "Thrall's orcs are not the Burning Blade.", next = "BACK", reply = "No, they're not, and I know it in my head. It's my stomach that still turns when I smell brimstone on the Orgrimmar wind.", fx = { align = { light = 1 } } },
        { text = "Watch them, then. Demons don't let go easily.", next = "BACK", reply = "That's my thinking exactly, and I'll keep watching whether anyone thanks me for it or not. A demon on a leash is still a demon, and leashes wear thin.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdead = {
      lines = {
        { id = "xd_default", text = "Gone? No, the High Chieftain gave his word, and I'd not shame him by wishing it broken. But I'll not pretend it sits easy with me, a thing the Earth Mother should have taken back standing at my stall and counting out coppers." },
      },
      choices = {
        { text = "I never asked to be torn from her.", next = "xdead_ask", fx = { affinity = 1 } },
        { text = "Why do you hate the Forsaken so much?", next = "xdead_ask" },
      },
    },
    xdead_ask = {
      lines = {
        { id = "xa_default", text = "Hate isn't the word, but I've not found a better one. Tell me something, since you're here: can you feel her at all, the Earth Mother, when you walk on the grass?" },
      },
      choices = {
        { text = "I feel nothing but the cold. I always do.", next = "xdead_cold", fx = { affinity = 1 } },
        { text = "Sometimes, at the Pools, I feel something.", next = "xdead_cold", fx = { affinity = 2 } },
        { text = "The Dark Lady is all the mother I need.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    xdead_cold = {
      lines = {
        { id = "xc_default", text = "You answered me honestly, either way, and maybe the Earth Mother hasn't let go of you altogether. I'll think on that, which is more than I've done for any of your people before today." },
      },
      choices = {
        { text = "Then think on it. That's all I ask.", next = "BACK", reply = "I will, though don't expect me to wave at the apothecaries tomorrow. A thought is a small seed, and it grows slow in old ground like mine.", fx = { align = { light = 1 } } },
        { text = "Don't bother. I don't need a tauren's pity.", next = "BACK", reply = "Pity? It wasn't pity, it was the first fair word I'd given any of you. Keep your pride, then, and I'll keep my distance, as before.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlock = {
      lines = {
        { id = "xl_default", text = "So the Burning Blade said too, I expect, before the demons had all of them. I've no proof against you and I'll sell to you fairly, but I'll not pretend I'm glad to have a summoner standing at my stall." },
      },
      choices = {
        { text = "I command my demons. They will never command me.", next = "BACK", reply = "Every one of them believed that, right up until they didn't. Keep your demons in check, and keep them away from my meat, and we'll have no quarrel.", fx = { align = { order = 1 } } },
        { text = "What I do with my power is my business.", next = "BACK", reply = "It's your business until it comes up the lift into my city, and then it's mine. Buy what you need, and go in peace, but go.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xcairne = {
      lines = {
        { id = "xn_default", text = "Doubt him? Never in my life. But a chieftain can be right about the Horde and still not see what's boiling in a bottle under his own city, and I'm the one living above it." },
      },
      choices = {
        { text = "Cairne's word should be enough for any tauren.", next = "BACK", reply = "It is enough for me, in all things but this one. Loving a chieftain doesn't mean I stop using my own nose, and my nose smells the Pools of Vision.", fx = { align = { order = 1 } } },
        { text = "Then say it to him. A chieftain needs honest voices.", next = "BACK", reply = "Maybe I should, and maybe I'm too proud and too afraid to climb that rise. You've given an old meat seller something to chew on, and it isn't the jerky.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, that's a kind thing to say, and I don't get many of those between the haggling. Thank you, friend." },
        { id = "s2", text = "You know good meat when you see it, and you've the decency to say so. My son will be glad to hear it, since he did the hunting." },
      },
      fail = {
        { id = "f1", text = "I've been buttered up by better than you, usually just before they ask for a lower price, and the price hasn't moved yet." },
        { id = "f2", text = "Don't soft-talk me, friend, because I've no patience for it. Plain words keep better than sweet ones." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've a tongue like a skinning knife, and I'll admit I walked into that one. Not many will trade jabs with a butcher." },
        { id = "s2", text = "The hunters needle me just that way when they bring in a thin kill, and I've never managed to stay cross with them. You've got some nerve, and I like it." },
      },
      fail = {
        { id = "f1", text = "I cut meat for a living, and I've heard every joke about it there is. Yours wasn't a new one, and it wasn't a good one either." },
        { id = "f2", text = "I'll not be laughed at on my own mat. Buy something or move along, and take your cleverness with you." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, there's no call for that, and I can see you're not one to trifle with. Let's speak civilly and leave it there." },
        { id = "s2", text = "Hm. I've stood in front of a charging kodo, and you've something of the same look about you. I'll mind my tone if you'll mind yours." },
      },
      fail = {
        { id = "f1", text = "I spend my days with a cleaver in my hand, friend, so think again about who you're leaning on. The Bluffwatchers are within a shout, besides." },
        { id = "f2", text = "You don't frighten me, and you shame yourself trying it on a meat seller. Go and cool your head in the wind." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's family business, and I don't lay it out for every customer. Come by a few more times, and we'll see." },
      { id = "gt2", text = "I'd sooner not speak of that with someone I hardly know. Ask me about the meat instead." },
    },
    knows = { { id = "tp_knows", text = "I know meat and the plains it comes from, and what's been happening on these mesas. Ask, and I'll give you my opinion whether you want it or not." } },
    background = { { id = "tp_bg", text = "A Mistrunner, born on the plains of Mulgore, and I've sold meat on these mesas since the High Chieftain brought us here. My son hunts it and I cut it, and that's all the story there is." } },
    advice = { { id = "tp_ad", text = "Take only what you'll eat, and thank the beast for it. The plains remember who's greedy." } },
    venture_company = { { id = "tp_venture", text = "Goblins with saws who'd strip Mulgore to the bare rock if anyone let them. My son's leg is what it cost us to say no." } },
    _none = { { id = "tp_none", text = "I sell meat, I don't keep a library. Ask one of the elders on Elder Rise." } },
  },
}
