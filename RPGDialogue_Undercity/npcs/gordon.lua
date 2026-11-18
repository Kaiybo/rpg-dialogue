-- Gordon Wendham, weapon merchant, Trade Quarter, Undercity. Voice: bibles/gordon.md
-- Lordaeron army smith, now Forsaken. Holds the living in contempt, the Horde's orcs, trolls and tauren
-- included ("warm ones"), since his own apprentice, now Scarlet, shot him on the Brill road. Warmer to the dead.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gordon_wendham", id = TODO_NPC("Gordon Wendham"), name = "Gordon Wendham",
  bible = "bibles/gordon.md", role = "vendor", tier = "quest",
  communities = { "undercity" }, temper = { "dry", "proud" }, values = { "practical", "loyal" },
  notices = { "race", "kit" },

  impression = {
    first = "Gordon Wendham sells blades in the Trade Quarter and calls the living \"warm ones\" as if it were a diagnosis. His apprentice put a bolt in him on the Brill road, and he has decided every beating heart would do the same.",
    third = "{name} met Gordon Wendham, an Undercity weaponsmith who forged for Lordaeron's army and now trusts nobody with a pulse.",
  },

  greetings = {
    { id = "g_default", text = "Blades on the left, axes on the right, and the prices are on the tags, because I'm tired of saying them aloud." },
    { id = "g_dead", when = { race = "Scourge" }, text = "Ah, one of us. Come in out of the drip, friend, and let's talk steel like civilised corpses." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Another warm one. Keep your breath off the polish, if you please; it fogs the steel and I have to do it all again." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Either my prices have grown on you or your blade's let you down, and I'd wager on the blade." },
    { id = "g_back_living", when = { metBefore = true, race = { "Orc", "Troll", "Tauren" } }, text = "You again, warm one. Still breathing, I see, which in my experience is only a matter of time." },
    { id = "g_agreed", when = { npcFlagBefore = "gw_agreed", race = { "Orc", "Troll", "Tauren" } }, priority = 10,
      text = "You're the warm one who agreed with me about your own kind. I still can't decide whether that makes you honest or merely spineless." },
    { id = "g_softened", when = { npcFlagBefore = "gw_softened" }, priority = 10,
      text = "You're the one who made me say Davin's name aloud. I've been sharpening the same knife for three nights since, and I've no idea why." },
    { id = "g_order", when = { questActive = TODO_QUEST("Ride to the Undercity") },
      text = "That's Podrig's hand on that order from the Sepulcher, I'd know his tidy little numbers anywhere. Let's see how many blades they've lost to the worgen this month." },
    { id = "g_garrett", when = { questActive = TODO_QUEST("Michael Garrett") },
      text = "Still here? Michael Garrett's at the bat roost by the outer gate, and the crates won't fly themselves to Silverpine, though I've asked them nicely." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You orcs always sniff when you come in. It's the oil on the blades, mostly, and the rest is me, so you may as well get used to it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mind the lintel, and spare me that little prayer your kind mutters over us. I'm not a restless spirit, tauren; I'm a shopkeeper with a long memory." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Keep your hands where I can see them, troll. The last one of yours asked me what the dead taste like, and I don't believe he was joking." },
    { id = "n_dull", cat = "kit", when = { class = { "WARRIOR", "ROGUE" }, durability = { max = 0.3 } },
      text = "Look at the state of that edge. Whoever let it get like that ought to be ashamed, and I suspect it was you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Gordon Wendham. I forged for the army of Lordaeron when there was one, and I forge for the Dark Lady now, which pays worse and complains less." },
        { id = "h_dead", when = { race = "Scourge" },
          text = "You and I have the advantage, friend: everyone who ever loved us has already turned on us, so there's nobody left to do it. The warm ones haven't learned that lesson yet." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "I'll sell to you, warm one, because the Dark Lady signed a treaty and coin is coin. Don't mistake that for trust; your heart's still beating, and I've seen what beating hearts do." },
        { id = "h_softened", when = { npcFlagBefore = "gw_softened", race = { "Orc", "Troll", "Tauren" } },
          text = "I suppose you'll want a decent blade, then, and not the ones I keep for the warm ones who annoy me. Don't tell anyone; I've a reputation to keep." },
        { id = "h_sepulcher", tags = { "news" }, when = { questRecent = { TODO_QUEST("Michael Garrett"), days = 3 } },
          text = "Podrig's crates went out to the Sepulcher on Garrett's bats, and one of them arrived bitten. The Sepulcher will have its swords all the same, and a bill for the bite marks." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a whetstone waiting, and it's better company than most." },
        { id = "h_again2", text = "Go on, then. I've all the time in the world, which is the one thing death is generous with." },
        { id = "h_again_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "More questions from the warm one. Ask, and keep your hands off the display." },
      },
      choices = {
        { text = "What have you got against the living?", next = "living" },
        { text = "What do you make of the Horde?", next = "horde" },
        { text = "You forged for Lordaeron's army?", next = "past" },
        { text = "The living will turn on us one day. You know it.", next = "xdead", when = { race = "Scourge" } },
        { text = "My heart beats, and I've bled for your Dark Lady.", next = "xliving", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Did you ever sell Davin's knife?", next = "xknife", when = { npcFlagBefore = "gw_softened" } },
        { text = "Show me your steel.", next = "BUSINESS" },
        { text = "Good day, Gordon.", next = "END" },
      },
    },

    living = {
      lines = {
        { id = "l_default", text = "Against them? Nothing at all, beyond knowing what they are. They're loud and frightened and they love you dearly, right up until your heart stops, and then they find a torch." },
        { id = "l_dead", when = { race = "Scourge" }, text = "You know as well as I do. They loved us, and they wept for us, and then we came home and they barred the doors and called for the priests." },
      },
      choices = {
        { text = "Something happened to you. What was it?", next = "davin" },
        { text = "You were warm once yourself, Gordon.", next = "living_warm", fx = { align = { light = 1 } } },
        { text = "You're right. The living can't be trusted.", next = "living_agree", fx = { align = { light = -1 }, npcFlag = { set = { "gw_agreed" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living_warm = {
      lines = {
        { id = "lw_default", text = "I was, and I was a fool with it. I took in a farm boy and taught him to fold steel, and I'd have given him the forge when my hands went, so don't tell me what the warm are capable of; I've had the lesson." },
      },
      choices = {
        { text = "Who was the farm boy?", next = "davin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    living_agree = {
      lines = {
        { id = "la_default", text = "Well, at least you know it. Most of them argue, and then go home and lock the shutters against the very thing they've been arguing for." },
        { id = "la_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "Listen to that: a warm one agreeing that the warm can't be trusted. I'll count the coin twice when you pay, then, since you've as good as told me to." },
      },
      choices = {
        { text = "What made you so sure of it?", next = "davin" },
        { text = "Something else.", next = "BACK" },
      },
    },

    davin = {
      lines = {
        { id = "d_default", text = "His name was Davin, a Brill farmer's boy with more arms than sense, and I made him a smith. When the plague came I died of it, and when I woke I walked home to Brill to find him, because I thought he'd want to know." },
      },
      choices = {
        { text = "Did you find him?", next = "davin_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    davin_now = {
      lines = {
        { id = "dn_default", text = "He'd taken the Scarlet tabard by then. He saw me on the Brill road and put a crossbow bolt through my chest, and the knife on his belt was the first one I ever let him finish on his own." },
        { id = "dn_dead", when = { race = "Scourge" }, text = "He'd joined the Scarlets, and he knew my face, and he shot me anyway. You'll have a story like it, friend; everyone in this city has, and we don't need to swap them." },
      },
      choices = {
        { text = "Would you forgive him, if he walked in now?", tag = "Persuade", next = "davin_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Scourge", disposition = { min = 50 } }, { class = "PRIEST" } } } },
          fail = { next = "davin_no", fx = { affinity = -1 } } },
        { text = "The Scarlets earned your hate. The Horde never did.", next = "davin_horde", fx = { align = { light = 1 } } },
        { text = "Then hate them all. Every warm one would do the same.", next = "davin_hate", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    davin_truth = {
      lines = {
        { id = "dt_default", text = "Forgive him? I'd sharpen his knife for him and tell him the tang was set crooked, because it was. That's the trouble, you see: I hate the lot of you for what he did, and I can't manage to hate him at all.",
          fx = { npcFlag = { set = { "gw_softened" } } } },
      },
      choices = {
        { text = "That isn't a weakness, Gordon.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    davin_no = {
      lines = {
        { id = "dno_default", text = "That's my business and the boy's, and he's not here, and you're a stranger. Buy something or ask about something else." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
    davin_horde = {
      lines = {
        { id = "dh_default", text = "Not yet, they haven't. The Scarlets were warm and loving and decent once too, and I'll wait and see what the orcs become when the war's over and they don't need our plague-brewers any more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },
    davin_hate = {
      lines = {
        { id = "dha_default", text = "Every one of them, yes, and I'll keep my bolts loaded for the day. Though I'll own it's tiring, hating that many people at once, and I'm not as young as I was when I died." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    horde = {
      lines = {
        { id = "ho_default", text = "Big, green and grateful, mostly, and the tauren pray over us as if we were ghosts that need laying. The Dark Lady says they're our allies, so I sell them axes and I don't ask what they say about us at their fires." },
        { id = "ho_orc", when = { race = "Orc" }, text = "Your Warchief's a decent sort, by all accounts, and he made a home for the dead when nobody else would. I'm grateful, after a fashion, but gratitude isn't trust, orc, and I learned the difference the hard way." },
      },
      choices = {
        { text = "So the alliance is only convenience?", next = "horde_conv" },
        { text = "Who buys your blades these days?", next = "customers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_conv = {
      lines = {
        { id = "hc_default", text = "Every alliance is convenience, warm or cold. They need the Undercity's apothecaries and we need their axes between us and the Scourge, and the day either of those stops being true, you'll see how long the speeches last." },
      },
      choices = {
        { text = "Allies are allies. Treat them as you'd be treated.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then use them before they use us.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = {
        { id = "cu_default", text = "Deathguards, mostly, and the Sepulcher out in Silverpine, where Podrig writes me orders in a hand so neat it's nearly rude. The warm ones come in for axes and leave smelling the oil, and I take their coin all the same." },
        { id = "cu_quest", when = { questDone = TODO_QUEST("Ride to the Undercity") },
          text = "The Sepulcher, for one, and you carried their last order yourself. Podrig loses blades to the worgen faster than I can temper them, and he never once asks what I think of the living, which is why I like him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Show me what the Deathguards carry.", next = "BUSINESS" },
      },
    },

    past = {
      lines = {
        { id = "p_default", text = "Eleven years on the smiths' row in the capital, above where we're standing. I made swords for men who went south to fight the Horde in the Second War, and some of the orcs who buy my axes now were in the camps those men filled." },
      },
      choices = {
        { text = "What was the city like, then?", next = "past_city" },
        { text = "Does that sit strangely with you?", next = "past_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_city = {
      lines = {
        { id = "pc_default", text = "Loud and bright and full of bells, and I hated the bells. Now I'd give a good deal to hear one, which tells you something about what's been taken from us and who took it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past_odd = {
      lines = {
        { id = "po_default", text = "Strangely? Everything sits strangely when you're dead. My old swords went to Terenas's men, my new axes go to Thrall's, and the only thing that hasn't changed is that the living still need someone to make the killing tools for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xdead = {
      lines = {
        { id = "xd_default", text = "Of course they will, friend, and the Dark Lady knows it better than any of us. Until then we smile at them, as well as these faces smile, and we keep our blades oiled." },
      },
      choices = {
        { text = "Then let's take what we need from them first.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Not all of them, Gordon. I've met decent warm ones.", next = "xdead_decent", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdead_decent = {
      lines = {
        { id = "xdd_default", text = "So had I, and I taught one of them to fold steel. I'll not argue with you, friend, because you're one of ours, but you'll forgive me if I wait for the bolt." },
      },
      choices = {
        { text = "Who taught you to wait for it?", next = "davin" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xliving = {
      lines = {
        { id = "xl_default", text = "Bled, have you? So did the boy I trained, and the next time I saw him he was on the Brill road with a crossbow aimed at me. Your blood's your own affair, warm one; it isn't a receipt." },
        { id = "xl_agreed", when = { npcFlagBefore = "gw_agreed" },
          text = "Last time you told me the living can't be trusted, and now you want me to trust you. Make up your mind, warm one, and then I'll make up mine." },
      },
      choices = {
        { text = "Then watch what I do, not what my heart does.", next = "xliving_watch", fx = { align = { honor = 1 } } },
        { text = "I don't need your trust. I need your steel.", next = "xliving_steel", fx = { align = { honor = -1 } } },
        { text = "What boy?", next = "davin" },
      },
    },
    xliving_watch = {
      lines = {
        { id = "xlw_default", text = "I'll watch, since you ask, and I've nothing but time. If you come back in a year still keeping your word, I'll apologise, and I've not apologised to anyone since I was buried." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xliving_steel = {
      lines = {
        { id = "xls_default", text = "Now that's the first honest thing a warm one's said to me this week. Steel I can sell you, and steel won't break your heart, so we'll get on well enough." },
      },
      choices = {
        { text = "Show me, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xknife = {
      lines = {
        { id = "xk_default", text = "No, and I won't. I set the tang straight at last, which took me two evenings, and it's under the counter where the warm ones can't see it. If he ever comes for it, I'll know what to say, and if he doesn't, I'll have a good knife." },
      },
      choices = {
        { text = "I hope he comes, Gordon.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Smith in the capital, then dead of the plague, then a smith again under it. The middle part was the least trouble." } },
    advice = { { id = "tp_ad", text = "Oil your blade every night and don't lend it to anyone who loves you. The second matters more." } },
    _none = { { id = "tp_none", text = "Steel I know, and grudges I know. Whatever that is, ask an apothecary; they like questions." } },
  },
}
