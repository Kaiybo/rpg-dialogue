-- Guard Howe, just south of the Lakeshire bridge. Voice: bibles/guard_howe.md
-- Wants the Blackrock clan destroyed; speaks of the King's sovereign right like a creed.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "guard_howe", id = TODO_NPC("Guard Howe"), name = "Guard Howe", gender = "male",
  bible = "bibles/guard_howe.md", role = "guard", tier = "quest",
  communities = { "lakeshire" }, temper = { "grim" }, values = { "duty", "loyal" },
  notices = { "race", "soldier" },

  impression = {
    first = "Guard Howe talks about the Blackrock the way a preacher talks about sin. He wants them gone from Redridge, every one, and I don't think he'd rest even then.",
    third = "{name} met Guard Howe by the Lakeshire bridge, who wants the Blackrock clan driven out of the King's lands for good.",
  },

  greetings = {
    { id = "g_bridge", text = "Halt. These mountains belong to the King of Stormwind, and I'd like to know you're on his side." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "guard_howe_flirt_no" } }, cooldown = "2d",
      text = "Halt. Oh, it's you, and you may pass, of course, though you needn't hurry about it." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "guard_howe_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "You came back. I've counted the Blackrock torches on the ridge since we spoke, as I always do, but I've thought about other things too, which isn't like me at all." },
    { id = "g_flirt_no", when = { npcFlagBefore = "guard_howe_flirt_no" }, priority = 8, once = true,
      text = "Back to business, then, and that suits me well enough. I'm better at orcs than at talking, as you saw." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. How many Blackrock have you put down since we spoke?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Blackrock Bounty") }, text = "Return once you've slain fifteen of their champions. Not before." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. They raided twice while you were away, and I counted every torch." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're a different fighter than the one who first stopped at this bridge. The Blackrock will learn that too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They tell me you've been serving the township well. That's what I like to hear." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in Lakeshire has a grievance with you. Settle it, because I need this town of one mind against the orcs." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, at my bridge. Whatever colours you wear, keep your hands where I can see them." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "A warrior. Good; I've no use for anyone in Redridge who can't swing a blade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Guard Howe. The Blackrock clan has invaded our lands, and these mountains fall under the sovereign right of the King of Stormwind. I mean to see them driven out." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "guard_howe_flirt_no" } }, cooldown = "3d",
          text = "I've stood on this bridge three seasons and counted every Blackrock torch on that ridge. I've no idea why I'm telling you that, except that you're easier to look at than the ridge." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "guard_howe_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "There you are. The ridge has been quiet, and I found I minded the quiet less when I thought you might come by." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Blackrock Bounty") },
          text = "Our sources tell us the leaders of each unit in the clan are called champions. They're camped to the north, just west of the road to the Burning Steppes, and I want them dead." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackrock Bounty"), days = 3 } },
          text = "You've fought well against the Blackrock, and this township owes you more than it can pay. Fifteen fewer champions means a good many leaderless orcs." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin of the Light. My father fought beside your order in the last war, and I've never forgotten what that meant to him." },
      },
      again = {
        { id = "h_again", text = "What else? The orcs won't wait for us." },
        { id = "h_again2", text = "Speak. I'm watching the ridge while you do, and trying to forget my boots, which haven't been dry since the last rain." },
      },
      choices = {
        { text = "Why do you hate the Blackrock so much?", next = "why" },
        { text = "Killing the champions alone won't stop the rest of them.", next = "champions" },
        { text = "Can the orcs ever be driven out for good?", next = "forgood" },
        { text = "I've fought orcs before, and they bleed like anyone.", next = "veteran", when = { minLevel = 20 } },
        { text = "I'll take the bounty.", next = "BUSINESS" },
        { text = "Do you ever think about anything but the Blackrock, Howe?", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "guard_howe_flirt_no" } } },
        { text = "Stay vigilant, Howe.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "Seldom, though I'll confess I've thought about you since you came up the road, which is a poor thing for a guard to admit while he's meant to be watching the ridge." },
        { id = "fl_again", when = { npcFlagBefore = "guard_howe_flirt_yes" }, priority = 5,
          text = "I think about the Blackrock, and then I think about you, and then I remember the Blackrock and feel guilty about it. It's been a confusing week on this bridge." },
      },
      choices = {
        { text = "Watch the ridge, Howe. I'll keep you company while you do.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "guard_howe_flirt_yes" }, clear = { "guard_howe_flirt_no" } } } },
        { text = "The Light smiles on devotion, Howe. Even yours.", next = "flirt_yes", when = { class = "PALADIN" },
          reply = "Does it? Then I'll take that as a blessing, and say a prayer for some nerve to go with it.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "guard_howe_flirt_yes" }, clear = { "guard_howe_flirt_no" } } } },
        { text = "You're sweet, Howe, but keep your eyes on the ridge.", next = "BACK",
          reply = "Right, yes, the ridge, which is where my eyes belong. I'll thank you not to mention this to Berton.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "guard_howe_flirt_no" }, clear = { "guard_howe_flirt_yes" } } } },
        { text = "I'm not interested, guard.", next = "BACK",
          reply = "Understood, and no harm done. The orcs never turn me down, at least, though they do try to kill me.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "guard_howe_flirt_no" }, clear = { "guard_howe_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "Then stand there, on the left, where the wind's at your back and the ridge is in view. I don't know how courting's done in Stormwind, but in Lakeshire I'd say this counts, and I'll not hear otherwise." } },
      choices = {
        { text = "It counts, Howe.", next = "BACK",
          reply = "Good. I'll write it in the watch log under 'nothing to report', which will be a lie for the first time in three seasons." },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because they burned the farms up the valley, and because they're on land that isn't theirs. Some men here want coin for it, or glory, and I just want them gone." },
      },
      choices = {
        { text = "That sounds more like revenge than duty.", next = "why_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_revenge = {
      big = true,
      lines = { { id = "wr_default", text = "Call it what you like. A Blackrock killed a friend of mine at the old farmstead, and the King's law and my own grudge happen to point the same way." },
      },
      choices = {
        { text = "Fight for the kingdom, not your grudge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A grudge is as good a reason as any.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'm sorry for your friend.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    champions = {
      lines = { { id = "c_default", text = "Cut off the head and the body flounders. Orcs follow strength, and a unit without its champion argues among itself instead of raiding our farms." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgood = {
      lines = { { id = "f_default", text = "Not by Lakeshire alone, and not with the soldiers Stormwind has sent us, which is too few. But every one we kill is one less at the walls." },
      },
      choices = {
        { text = "Then Stormwind should send more.", next = "forgood_crown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgood_crown = {
      lines = { { id = "fc_default", text = "Write to the House of Nobles and see how far it gets you. Marshal Marris has, three times, and we've had nothing back but promises." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran = {
      lines = { { id = "v_default", text = "They do, and that's the only comfort I've found in this. You'll know, then, that they don't stop coming until someone stops them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    second_war = { { id = "tp_second_war", text = "My father stood on Stormwind's walls when the Horde came the second time, and he said the orcs never once asked whose land they were on. The Blackrock in these hills haven't changed their manners since." } },
    internment = { { id = "tp_internment", text = "We fed those orcs in the camps for years on the King's coin, and the moment they were loose, here they are again on the King's land. I said at the time we should have done otherwise, and nobody listened to a farmer." } },
    thrall = {
      { id = "tp_thrall", text = "They tell me the orcs have a new warchief across the sea who talks of peace. Let him come and say it to the families up the valley, and we'll see how long the word lasts." },
      { id = "tp_thrall2", when = { race = "Orc" }, text = "Your warchief may preach peace in his desert, orc, but the Blackrock never heard the sermon. Tell him that from Guard Howe, if you ever see him." },
    },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "That black mountain north of the Steppes is where every raider in these hills comes from, and it's where they run home to. One day the King will march on it, and I'll be in the front rank if he lets me." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon is a soldier, and I'd follow him anywhere. I only wish he'd look east to Redridge as often as he looks at his council." } },
    varian = { { id = "tp_varian", text = "The King went off to make peace and never came home, and I won't say more than that a guard ought to say. I still say his name every morning on this bridge, as my oath requires." } },
    holy_light = { { id = "tp_holy_light", text = "I'm no priest, but I pray to the Light every morning before I take the bridge. Some mornings I ask it for strength, and some mornings I just ask it to send more soldiers." } },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs came through that cursed gate in the Black Morass, and the King's men should have smashed every stone of it. Nobody will convince me it's safe to leave a single stone of it standing." } },
    background = { { id = "tp_bg", text = "Guard of Lakeshire, posted at the bridge. Before that, I farmed. The Blackrock settled that question for me." } },
    advice = { { id = "tp_ad", text = "Kill the champion first. Everything else in Redridge follows from that." } },
    blackrock = { { id = "tp_blackrock", text = "Invaders on the King's land, and I'll see them gone.", next = "why" } },
    _none = { { id = "tp_none", text = "Not my concern. My concern is north of this bridge." } },
  },
}
