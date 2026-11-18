-- Captain Grayson, the ghost of Westfall Lighthouse. Voice: bibles/grayson.md
-- A pirate whose ship struck the coast the night the lamp went dark.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "grayson", id = TODO_NPC("Captain Grayson"), name = "Captain Grayson",
  bible = "bibles/grayson.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "steady" }, values = { "honest", "kind" },
  spiritSensitive = true,
  notices = { "death", "sea" },
  impression = {
    first = "He seemed more lonely than frightening.",
    third = "{name} met the ghost of Captain Grayson at the Westfall lighthouse, who keeps its flame lit for the ships that still sail.",
  },

  greetings = {
    { id = "g_flame", text = "Keep clear of the lamp. It's the only thing here still alive, in its way." },
    { id = "g_murkeye", when = { questActive = TODO_QUEST("The Coastal Menace") }, text = "Old Murk-Eye, the murloc who rules this shore, still breathes. I can feel it in the tide." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Coastal Menace") }, text = "The beach is quiet. Quiet enough that I can hear the gulls again." },
  },

  notice = {
    { id = "n_ghost", cat = "death", place = "replace", when = { ghost = true },
      text = "Ha! Another one of us, is it? Don't get comfortable; your body's waiting for you, and it won't wait forever. Mine didn't." },
    { id = "n_undead", cat = "death", when = { race = "Scourge" },
      text = "Dead, but walking about in your own skin, you lucky soul. Mine's somewhere at the bottom of this bay." },
    { id = "n_fish", cat = "sea", when = { profession = "Fishing" },
      text = "A fisher. Then you know the sea keeps what it takes. Respect it and it might give a little back." },
  },

  start = "hello",
  nodes = {
    dd_grayson_d = {
      lines = {
        { id = "dd_grayson_d_a", text = "Then you know the cold of it, and the quiet at the bottom where the light doesn't reach. I've been in that quiet for a long while now, and I keep the flame lit so nobody else has to learn it the way we did." },
      },
      choices = {
        { text = "Your watch is a noble thing, Captain. Your crew would be proud.", next = "dd_grayson_d2", fx = { align = { light = 1 } } },
        { text = "You could rest instead. The sea will take who it takes.", next = "dd_grayson_d2", fx = { align = { light = -1 } } },
      },
    },
    dd_grayson_d2 = {
      lines = {
        { id = "dd_grayson_d2a", text = "Perhaps I could, and perhaps one day I will, when the coast is quiet and the ships come home every time. Until then the light needs a keeper, and I've nowhere else to be." },
      },
      choices = { { text = "Then keep it well. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I mind the loneliness more than the dying. I tend the flame so no other ship meets the rocks mine did. Perhaps the spirits you speak with understand that." } },
      choices = {
        { text = "Your watch is a kindness, Captain. Keep the flame burning.", next = "BACK", reply = "Aye, that I will, as long as there's oil and night. It's good to hear a living voice call it kindness instead of madness.", fx = { align = { light = 1 } } },
        { text = "You've done enough, Captain. Let yourself rest.", next = "BACK", reply = "Rest, is it? I'd like it well enough, but the rocks don't rest and neither do the ships. Ask me again when they stop sailing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Murlocs, mostly; they've no respect for the dead or the living, and they've taken the shore below the lighthouse. I can't lift a sword any more, but I can watch, and I'd like to watch them lose." } },
      choices = {
        { text = "I'll drive the murlocs back for you, Captain.", next = "BACK", reply = "Ha, now there's a sight I'd stay up for, if I slept at all. I'll be watching from the gallery, cheering like a sailor in port.", fx = { align = { honor = 1 } } },
        { text = "Your lamp's no business of mine, Captain.", next = "BACK", reply = "No, I suppose it isn't, and I've learned not to expect it. The flame keeps itself company well enough.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It does, and it looks right through me, which is more than most people manage. The murlocs see me too, and old Murk-Eye, their leader, looks up at me every night and grins." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It does, and it looks right through me, which is more than most people manage. Your {pet} hasn't stopped staring at me since you came up the path, so tell it I'm harmless, would you?" },
      },
      choices = {
        { text = "I'll hunt Murk-Eye for you, and the keeper's family.", next = "BACK", reply = "You'd do that for the keeper's family? Then I'll watch for you every night, and I'll grin at old Murk-Eye first, for once.", fx = { align = { honor = 1 } } },
        { text = "I'll leave Murk-Eye be. He's not my quarrel.", next = "BACK", reply = "Fair, he's my quarrel and the keeper's, not yours. But I'd sleep easier, if I slept, knowing he wasn't grinning up at me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Aye, and a spell might fail on the one night the fog rolls in thick off the Great Sea. I've had years to think about it, {class}, and I trust a flame I can tend myself." } },
      choices = {
        { text = "Keep your watch, Captain. It's an honest duty.", next = "BACK", reply = "That it is, and I'll keep it honest till the oil runs dry or the sea takes the rocks. Thank you for seeing it so.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the ships fend for themselves. You've earned your rest.", next = "BACK", reply = "Earned it, have I? A pirate doesn't earn rest, {class}, he steals it, and I'd rather not steal from the ships.", fx = { align = { honor = -1 } } },
        { text = "How did your ship go down?", next = "ship" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I've no doubt you could try, and I've no doubt it would be a poor trade for both of us. I keep this light burning by my own will, and if you take that from me, it's only a lamp and a dead man." } },
      choices = {
        { text = "I'd never bind a soul that keeps a light burning.", next = "BACK", reply = "Then we understand each other, and I'm glad of it. I'd not want to find out what I'd be without the flame.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A bound spirit keeps a flame lit just as well.", next = "BACK", reply = "Just as well, maybe, but not by my will, and that's the difference that matters to me. Take your hand off my lamp, if you please.", fx = { align = { light = -1 } } },
        { text = "Why do you stay here?", next = "stay" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It warms rather than burns, and nobody was more surprised than me. I was no saint in life, paladin, but I think whatever judges the dead is weighing the ships this lamp has saved against the ones I sank." } },
      choices = {
        { text = "Your watch is atonement enough. Rest when you're ready, Captain.", next = "BACK", reply = "That's kinder than I deserve, paladin, and I'll hold on to it on the long nights. When the coast is safe, perhaps.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A pirate's ghost has no claim on the Light's mercy.", next = "BACK", reply = "Maybe not, and I never asked it for any. I'll keep the lamp lit all the same, mercy or none.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else, Captain.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the rocks below this light are still there, and ships still come round the point at night with no one to warn them. When some living captain knows these waters as well as I do, perhaps I'll let the flame go out." } },
      choices = {
        { text = "The dead must move on, Captain. That's the natural order.", next = "BACK", reply = "Natural order sank my ship and drowned my crew, druid. I'll move on when the rocks do.", fx = { align = { order = 1 } } },
        { text = "Stay as long as you like. No law binds a willing spirit.", next = "BACK", reply = "That's a kind way to put it, and an old sailor's way too. I'll stay, then, and keep the lamp.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_drown_grayson", when = { deathCause = "drowning" },
          text = "The sea has had you once already, I can tell, because it leaves a chill that I know better than anyone living. You came back from it, which is more than I managed, so mind the rocks." },

        { id = "h_default", text = "Captain Grayson, of a ship long sunk and a crew long drowned. I mean no harm to the living; I mean only to keep this flame lit." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Keeper of the Flame") },
          text = "The night my ship came in, this lamp was dark and we hit the rocks. I'd not wish that on any captain, honest or otherwise." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("Keeper of the Flame") },
          text = "The flame needs feeding, and I can't lift so much as a candle. You can." },
        { id = "h_coast", when = { questActive = TODO_QUEST("The Coast Isn't Clear") },
          text = "The murlocs on the shore grow bolder every tide. Thin them, and the next keeper might live to see old age." },
        { id = "h_menace", tags = { "news" }, when = { questActive = TODO_QUEST("The Coastal Menace") },
          text = "Old Murk-Eye, the murloc chief, drove the keeper's family off once, and when they came back and lit the lamp, he came back too. I watched it all, and I couldn't do a thing." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Coastal Menace"), days = 3 } },
          text = "He's gone; I felt it in the tide. The family's beyond thanking you, so I'll do it for them: thank you." },
        { id = "h_pirate", when = { class = "ROGUE" },
          text = "You've a pirate's way of standing, weight on the balls of the feet and one hand near the knife. I'd have signed you on." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The flame burns brightest when nobody's looking at it, and I'm always looking at it. That comes with being dead, I find." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and a living one. I mean you no harm; I only mean to keep the flame lit, and you could help." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast sees me plainly, I think, because animals are better at seeing the dead than people are." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'd half expected your Light to burn me where I stand, but it only feels warm, which is a strange thing for a dead man to feel." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A child of the kaldorei, if this old ghost's eyes still serve. I never sailed far enough to see your people's shores, and now I never shall." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, living, and come to see a ghost. Do your spirits speak to me, then? I've had little enough company out here." },
      },
      again = {
        { id = "h_again", text = "Ask on. The dead have nothing but time, and I've had a good many years of it." },
        { id = "h_again2", text = "What else? The tide's turning, as it always is." },
      },
      choices = {
        { text = "I drowned once, Captain. I came back.", next = "dd_grayson_d", when = { deathCause = "drowning" } },

        { text = "Why do you stay?", next = "stay" },
        { text = "You have the look of a pirate about you.", next = "pirate" },
        { text = "What threatens this stretch of coast?", next = "murkeye" },
        { text = "Being dead can't be pleasant.", next = "dead" },
        { text = "I could help you find rest, captain.", next = "priest", when = { class = "PRIEST" } },
        { text = "We're both dead. Why aren't you bitter?", next = "scourge", when = { race = "Scourge" } },
        { text = "My people scatter the dead to the wind, Captain.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "A spell could keep your lamp lit without you, Captain.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Spirits like you can be bound, Captain.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does a ghost need with a warrior, Captain?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can my beast actually see you, Captain?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd think the Light would trouble one like you, Captain.", next = "xapala", when = { class = "PALADIN" } },
        { text = "My people teach that every spirit should pass on. Why do you stay?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you mind being a ghost, Captain Grayson?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Rest easy, captain.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = {
        { id = "s_default", text = "Because a dark lamp killed my crew, and a dark lamp killed that family. If keeping it lit is the only good I do, dead, it'll be enough." },
      },
      choices = {
        { text = "That's a noble penance.", next = "BACK", reply = "Penance, aye, that's as good a word as any. It doesn't feel noble most nights, just cold.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A dead man keeping a lamp lit is just stubbornness.", next = "BACK", reply = "Stubbornness has kept more sailors alive than prayer ever did. I'll take the word as a compliment.", fx = { align = { light = -1 } } },
        { text = "You don't owe anyone anything now.", next = "owe", fx = { trait = { kind = 1 } } },
        { text = "Who was the keeper's family?", next = "family" },
      },
    },
    owe = {
      lines = { { id = "o_default", text = "Maybe not. But I've nothing else to do, and the gulls are poor conversation." } },
      choices = { { text = "I'll visit, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    family = {
      lines = { { id = "fa_default", text = "The keeper and his kin. I never learned their names; nobody introduces themselves to a ghost. They lit the lamp twice, and the second time, Murk-Eye came back for them." } },
      choices = {
        { text = "I'm sorry you had to watch.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate = {
      lines = { { id = "p_default", text = "A pirate, a privateer or a merchant with flexible morals, depending on who you asked and what they'd lost." } },
      choices = {
        { text = "Ha. Fair.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "What was your ship called?", next = "ship" },
        { text = "You're dead, Captain. Who's left to hide it from?", tag = "Persuade", next = "pirate_honest",
          check = { pass = { any = { { disposition = { min = 62 } }, { class = { "ROGUE", "PRIEST" } }, { trait = "witty" } } } },
          fail = { next = "pirate_tide", fx = { affinity = -1 } } },
      },
    },
    ship = {
      lines = { { id = "sh_default", text = "That depends which year you mean, because she wore a few names and a few coats of paint. The sea knows which one stuck, and I'll let it keep that." } },
      choices = {
        { text = "A careful answer.", next = "pirate_wrecks", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate_wrecks = {
      lines = { { id = "pw_default", text = "Careful's a habit, that's all. Look along the beach and you'll see mine's not the only wreck; the Great Sea is hard on ships, and harder on ships with no light to steer by." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    murkeye = {
      lines = {
        { id = "mu_default", text = "Murk-Eye is an old murloc with a long memory, and he leads the weaker ones the way a gull leads a flock to scraps. The lighthouse family were scraps, to him." },
        { id = "mu_active", when = { questActive = TODO_QUEST("The Coastal Menace") },
          text = "He walks the shore with his kin about him, so wait till he wanders clear of them. Then bring me one of his scales." },
      },
      choices = {
        { text = "Then I'll put him down.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "He seems to hate the lighthouse.", next = "murkeye_why" },
      },
    },
    murkeye_why = {
      lines = { { id = "mw_default", text = "I've wondered that myself. Light on the water means boats, and boats mean nets, so maybe he's no fool, but he's a murderer all the same." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    dead = {
      lines = { { id = "de_default", text = "It's cold, mostly, and quiet. You'd think the dead would have plenty to say to each other, but we don't." } },
      choices = {
        { text = "Are there others like you here?", next = "dead_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_others = {
      lines = { { id = "do_default", text = "If there are, they keep to themselves. I see the lamp, the rocks and the gulls. That's company enough for a man who earned less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      big = true,
      lines = { { id = "pr_default", text = "Rest? Kind of you. But I've a lamp to keep, and I'd not trust the next fellow to keep it. When this coast is safe, ask me again." } },
      choices = {
        { text = "Then I'll make it safe.", next = "BACK", reply = "Then I'll watch you do it, and I'll be glad of it. Come back and tell me when the last murloc's gone.", fx = { affinity = 2, align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Suit yourself. The lamp can keep you company forever.", next = "BACK", reply = "Aye, it can, and it has so far. There are worse companions than a good flame.", fx = { align = { light = -1 } } },
        { text = "Let me at least pray for your crew.", next = "priest_crew" },
      },
    },
    priest_crew = {
      lines = { { id = "pc_default", text = "Do, by all means. They were rough men and they'd laugh at you for it, but pray anyway; somebody should, and it can't be me." } },
      choices = {
        { text = "Light keep them, wherever the sea put them.", next = "BACK", reply = "That's a fine thing to say over them, and they'd pretend not to hear it. Thank you, for their sake.", fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "If they'd laugh at prayer, I'll spare them one.", next = "BACK", reply = "Ha, you're right, they'd only make rude remarks. I'll say a word for them myself, then, when nobody's listening.", fx = { align = { light = -1 } } },
      },
    },
    scourge = {
      lines = { { id = "sc_default", text = "Bitter? A dark lamp killed me, not a plague. No one did this to me but the rocks, and it's hard to hate rocks. You've better reason than I have." } },
      choices = {
        { text = "I do.", next = "BACK", reply = "Then you've more right to bitterness than I'll ever have. Don't let it sink you, that's all I ask.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Maybe I'll try your way.", next = "BACK", reply = "It's a lonely way, I'll warn you, but it keeps a flame lit. You might find it suits you.", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    pirate_honest = {
      lines = {
        { id = "ph_default", text = "Ha! Nobody, and that's a fair point to put to a ghost. A pirate, then, since you ask it straight: I took cargo off three kingdoms' merchantmen under whatever flag the morning called for." },
        { id = "ph_after", text = "But I never fired on a ship that struck her colours, and I never left a crew to drown, and you can ask the sea about that too. It's the one thing I'd want carved on the lighthouse, if anybody ever bothered to carve anything." },
      },
      choices = {
        { text = "An honest pirate. That's rare.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate_tide = {
      lines = {
        { id = "pt_default", text = "Hide? I'm not hiding a thing, friend; I'm only letting the tide keep what it's already taken. Ask me about something the sea hasn't got." },
        { id = "pt_default2", text = "A dead man keeps his own counsel, the same as a living one, only longer. I've told you what I'll tell anybody." },
      },
      choices = {
        { text = "Then I'll let the matter rest, Captain.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "To the wind! Now that's a sailor's funeral if I ever heard one, better than a hole in a field. Would the wind have me, do you think, or am I too heavy with the things I owe?" } },
      choices = {
        { text = "The wind takes everyone, Captain.", next = "skyborne2", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Pay your debts first, then ask the wind.", next = "skyborne2", fx = { trait = { stern = 1 } } },
      },
    },
    skyborne2 = {
      lines = { { id = "skyborne2_l", text = "Aye, maybe so. Tell me how it goes, someday, your way of saying goodbye, and I'll tell you if it's better than mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail fly a flag I flew myself once, and I'm not proud of it now. They're cruel even by a pirate's measure, and they'd sink this whole coast for a chest of silver." } },
    booty_bay = { { id = "tp_booty_bay", text = "I made port at Booty Bay more times than I can count, and I left more coin there than I'll ever see again. The goblins were kind to me while my purse was full, and that was kind enough." } },
    deadmines = { { id = "tp_deadmines", text = "They've built a ship inside the hill, I'm told, which is a fool's place for a ship and a ghost's joke if ever I heard one. Every night I watch the coast for it to sail, and every night it doesn't." } },
    third_fleet = { { id = "tp_third_fleet", text = "The Third Fleet sailed for Stormwind once, and I raced them along this coast in my younger days. They're gone now, scattered or sunk, and I wish I had a few of their lanterns to keep this one lit." } },
    gilneas = { { id = "tp_gilneas", text = "I sailed past Gilneas once, in a fog thick enough to chew, and the wall they'd built was black against the cliffs. Nobody came out to hail us, and I've wondered since whether anybody's left behind it." } },
    theramore = { { id = "tp_theramore", text = "Theramore's harbour was a pirate's grave in my day, with Lady Proudmoore's ships lying in wait. I'm glad I never tried it, because I'd not like to haunt that marsh." } },
    knows = {
      { id = "tp_knows", text = "A dead man sees a good deal from the top of a lighthouse, and hears even more in the wind off the water. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I was a captain once, of a ship that ran this coast, and then came the rocks, and then this. The middle was more fun than the end.", next = "pirate" } },
    advice = { { id = "tp_ad", text = "Never sail a strange coast at night without a light to steer by. I'd know." } },
    defias = { { id = "tp_defias", text = "I've seen their ships slip along this coast at night, running dark. I know the trick; I used it myself." } },
    westfall = { { id = "tp_westfall", text = "From up here it looks peaceful. That's the trouble with lighthouses. Everything looks peaceful from a height." } },
    _none = { { id = "tp_none", text = "The dead hear less than the living suppose, and out here it's mostly waves." } },
  },
}
