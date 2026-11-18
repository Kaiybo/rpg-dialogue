-- Kargath: the Horde's lone outpost in the Badlands, on the road to Blackrock. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "goretooth", id = TODO_NPC("Warlord Goretooth"), name = "Warlord Goretooth",
  gender = "male",
  bible = "bibles/badlands.md", role = "soldier", tier = "quest",
  communities = { "kargath" }, temper = { "boisterous" }, values = { "proud", "loyal", "brave" },
  prejudice = { class = "WARLOCK", faction = "Horde", amount = 10, why = "An old Horde warrior who remembers Gul'dan's warlocks leading the orcs to demon blood." },
  notices = { "race", "class", "level" },

  impression = {
    first = "Warlord Goretooth holds Kargath and plainly wishes he were fighting instead of watching. He's loud, proud and lonely on that tower, and he admitted to talking to vultures.",
    third = "{name} met Warlord Goretooth, who holds the Horde outpost of Kargath in the Badlands.",
  },

  greetings = {
    { id = "g_flirt", when = { flirt = true, chance = 0.4 }, text = "Lok'tar! Now there's a sight worth the climb; the vultures never looked half so fine, and they've had years to practise." },
    { id = "g_flirt_warm", when = { flirt = true, npcFlagBefore = "flirt_warm" }, text = "Ha! There's the one who promised me a drink by the fire! Theodora keeps asking why I've started oiling my tusks, and I keep telling her it's none of her business." },
    { id = "g_flirt_cool", when = { flirt = true, npcFlagBefore = "flirt_declined", chance = 0.5 }, text = "Ah, it's you. Don't fret, I'll keep my boasting for the Dark Irons today, and they never turn me down." },
    { id = "g_op_goretooth", when = { gossip = { topic = "goretooth", stance = "wrong" } }, text = "Thal'trak tells me you think I'm wrong to keep him at his post. Maybe I am, but if every soldier ran off after his wife, Kargath would be guarded by Lexlort's lizards." },
    { id = "g_prej1", when = { prejudiced = true }, text = "A warlock, climbing my tower. The last time I trusted one of your trade, Gul'dan's lot were handing round a cup of something red, and I've had the taste in my mouth ever since." },
    { id = "g_prej2", when = { prejudiced = true }, text = "Keep your imp at the foot of the stairs, warlock. The vultures don't like it, and neither do I." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, warlock! I've heard what you did on the road, and I don't care what whispers in your ear any more. You fight like an orc, and that's the end of it." },
    { id = "g_tower", text = "Another one climbs my tower, good! Lok'tar, {class}; I was starting to talk to the vultures, and they have no honor and worse jokes." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and with your blood still on the inside! That's more than I can say for the last three I sent up the road." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You were gone {away}, and I was back to talking to the vultures. Good, you can take their place." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been away {away} and come back with more muscle than you left with! The road east will be glad of it, even if the ogres won't." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, stronger than the last time you climbed my tower, and strength like that is earned in blood! Now I can send you somewhere properly dangerous." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you scared one of my people so badly they're still twitching. That's good work, but save it for the Dark Irons." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Kargath's been talking about you, and it's good talk for once. Keep it up, because the vultures don't sing anyone's praises." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! I was one, once, before they gave me a tower and a title, so swing an axe for me while you still can." },
    { id = "n_young", cat = "level", when = { maxLevel = 45 },
      text = "You're young for the Badlands, so stay south of the Spire; the Blackrock eat young things." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Good; the spirits of this rock have been angry since before I came, and nobody here knows how to ask them why." },
  },

  start = "hello",
  nodes = {
    flirt = {
      lines = {
        { id = "fl_default", text = "Staring? I'm admiring, which is a different thing, and a warrior should admire strength wherever he finds it. You climbed my tower without losing your breath, so if you'd share a drink by the fire when the watch changes, I'd count it an honor." },
        { id = "fl_orc", when = { race = "Orc" }, text = "Staring? I'm admiring, and any orc should know the difference. You've the shoulders of a Frostwolf and the eyes of a Warsong, so if you'd share a drink by the fire when the watch changes, I'd count it an honor." },
      },
      choices = {
        { text = "Save me a seat by the fire, Warlord.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Bring me a Dark Iron's beard first. Then we'll drink.", next = "flirt_dare", fx = { affinity = 1, trait = { brave = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "I'm dead, Warlord. Doesn't that put you off?", next = "flirt_dead", when = { race = "Scourge" } },
        { text = "I'm flattered, Warlord, but my heart is spoken for.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Then whoever holds it is lucky, and I hope they know it. If they don't, send them up my tower and I'll explain it to them." },
        { text = "Keep your eyes on the Spire, Warlord, not on me.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Ha! Spoken like an officer, and you're right, curse you. The Spire it is, then, though it's not half as pretty." },
      },
    },
    flirt_warm = {
      lines = { { id = "flw_default", text = "Ha! Then it's settled, and I'll have Shul'kar keep back the good grog, the jug he hides from Lexlort. Don't tell the ladies at the fire, mind, or I'll never hear the end of it." } },
      choices = { { text = "Something else, Warlord.", next = "BACK" } },
    },
    flirt_dare = {
      lines = { { id = "fld_default", text = "Now that's how the old clans did their courting, with a trophy and a boast before the fire! Bring me that beard and I'll pour the drink myself, and every grunt in Kargath will know why." } },
      choices = { { text = "Something else, Warlord.", next = "BACK" } },
    },
    flirt_dead = {
      lines = { { id = "fldd_default", text = "Put me off? Half the company I keep is dead, and they talk better than the living half. Besides, you've a fine pair of eyes, even if they do glow a little in the dark." } },
      choices = {
        { text = "Then I'll share that drink, Warlord.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Theodora would never let me hear the end of it.", next = "BACK", fx = { trait = { witty = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "No, she wouldn't, and neither would Vivian, and that's the trouble with this fort. There are too many sharp tongues on it and not one of them on my side." },
      },
    },
    prej = {
      lines = { { id = "prej_default", text = "I think the warlocks of the old Horde sold us to the demons and called it strength, and every orc my age paid for it. When I see a warlock now, I see Gul'dan smiling at the back of the tent, and that's not your fault, but it's there." } },
      choices = {
        { text = "I'm not Gul'dan. My power serves the Horde, not demons.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power. The old Horde just used it badly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then watch me on the road, Warlord, and judge from that.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Did you drink the demon's blood yourself?", next = "prej_why" },
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Everyone did, or near enough, and I'd not lie to you about it. I don't remember it as a choice, more a fire that made everything simple, and it took Thrall and years in the camps to burn it out of me." } },
      choices = {
        { text = "Then you know what it costs. That's wisdom, not prejudice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That was the old Horde. Let the old fears die with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Ha! Good answer. Go and show me, then, and I'll listen when you come back down that road." } },
      choices = {
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    op_warchief = {
      lines = {
        { id = "opw_default", text = "A few of the old ones grumble that Rend remembers what the Horde was for, and I knock their heads together when I hear it. But you've climbed my tower, so I'll hear you out. What makes a true Warchief?" },
      },
      choices = {
        { text = "Thrall is the only Warchief. Rend's a pretender with a dragon.", next = "op_wc_thrall", fx = { affinity = 2, align = { order = 1 }, opinion = { warchief = "trust" } } },
        { text = "Rend at least remembers the Horde was made for war.", next = "op_wc_rend", fx = { affinity = -2, align = { order = -1 }, opinion = { warchief = "soft", peace = "war" } } },
        { text = "Vol'jin's Darkspear follow Thrall, and that settles it for me.", next = "op_wc_thrall", fx = { affinity = 1, opinion = { warchief = "respect" } }, when = { race = "Troll" } },
        { text = "Warchiefs come and go. The Dark Lady is my queen.", next = "op_wc_queen", fx = { opinion = { warchief = "mixed", sylvanas = "trust" } }, when = { race = "Scourge" } },
        { text = "I'd rather fight Rend than argue about him.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    op_wc_thrall = {
      lines = {
        { id = "opwt_default", text = "Ha! That's the answer, and you said it like you meant it, which is the only way to say it on this tower. Rend can keep his dragon; we've got the Warchief and a great many axes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wc_rend = {
      lines = {
        { id = "opwr_default", text = "Rend remembers the war because he never stopped fighting it, and he'd sell every orc in Kargath to the Dark Irons to win it. Say that again in front of the 109th's widows, if you dare, because I won't stop them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wc_queen = {
      lines = {
        { id = "opwq_default", text = "Ha! Theodora says the same, with more words and a lot more darlings. Your queen fights the Scourge and the Warchief fights Rend, so as far as I'm concerned you're both on my side." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trouble me? Ha! I've fought beside the dead and I've fought against the Light, and you're both at once, so I can't decide whether to salute you or duck. Take the Spire road and smite a few Blackrock for me, and I'll decide you're one of mine." } },
      choices = {
        { text = "I fight for the Warchief, Light or no Light.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fight for myself. The Horde just points the same way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Riding, raiding and terror, as the old Horde did, and they're good at all three. When I was young every orc who could fight had a wolf at his side, and seeing Rend's riders on that road makes me ache for those days and hate myself for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}. Good teeth, good eyes. If you take it up the Spire road, keep it close, because Blackrock worgs go for other beasts first." },
      },
      choices = {
        { text = "The old ways had strength. Don't be ashamed of missing them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Thrall's Horde is better. Leave the old ways to Rend.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not while the Spire stands, I think, for nothing grows within a day's march of it and the orcs inside like it that way. Ask me again when Blackrock has fallen, and I'll give you a better answer." } },
      choices = {
        { text = "Then we take the Spire, and the land heals after.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them rot inside it. We can wait them out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ha! I would, if I thought you'd come back, and I'd want every word you heard up there. But Rend's orcs know every shadow on that mountain, so go carefully, and don't die where I can't send anyone to fetch you." } },
      choices = {
        { text = "The Horde needs knives in the dark as much as axes.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face Rend's orcs openly, Warlord.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd put anyone on these walls who can kill a Dark Iron at a hundred paces, and a mage can kill ten. Vivian keeps telling me the arcane is subtle, and I keep telling her I don't want subtle, I want the Spire on fire." } },
      choices = {
        { text = "Patience and discipline win sieges, not fireworks.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll give you fire, Warlord, as much as you like.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Good, because Thrall led us out of the fel's shadow once, and I'll not watch any orc of mine crawl back into it. Serve the Horde with your imps if you must, but the day you serve the imps instead, I'll know, and so will my axe." } },
      choices = {
        { text = "Power is power. The Horde should use every weapon.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The fel is a tool, never a master. I'll remember.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Short? I'd trade three grunts for one good healer, and the grunts would thank me for it, because every raid on the Dark Irons sends half of them back with burns that won't close. Shul'kar's stew can only do so much, and Vivian says her shadows don't mend anyone." } },
      choices = {
        { text = "Put me where I'm needed, Warlord. I'll hold the post.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I heal where I choose, Warlord, not where I'm posted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Warlord.", next = "BACK" },
      },
    },
    xcl_lbrs = {
      big = true,
      lines = { { id = "xcl_lbrs_default", text = "Good. Those were orcs in there once, Blackrock clan, the same blood as the warriors in my camp, and they bent the knee to a dragon instead of the Warchief. When I tell Thrall what you found, I want to tell him it was done cleanly." } },
      choices = {
        { text = "They chose the dragon, Warlord. They deserve no mercy.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "They were orcs once. Some could still be brought home.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Who really rules the Spire now, Warlord?", next = "xcl_lbrs2" },
      },
    },
    xcl_lbrs2 = {
      lines = { { id = "xcl_lbrs2_default", text = "Rend Blackhand sits in the upper halls calling himself Warchief, and behind him a black dragon in a general's armour. I've read the papers you brought down, and I don't like what they say about whose voice is giving Rend his orders." } },
      choices = {
        { text = "Then the Horde should march on the Spire itself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let Rend and the dragons bleed each other dry, Warlord.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xorig_brock = {
      lines = { { id = "xbr_default", text = "Then you know the Spire better than most of my grunts, and you'll know some of the faces up there. If it came to it, could you put your axe through a brother who still wears Rend's colors?" } },
      choices = {
        { text = "If he stands with Rend, yes.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I don't know, Warlord. I hope I never find out.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Kargath's walls have seen plenty of wounded since the Dark Irons started pushing, and too few hands to mend them, so you're welcome on my tower." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Up at the Spire, Rend's orcs still keep the old ways, fel and all, and I'd like to know which side of that line you stand on." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, eh? The old Horde had warlocks and no mages, and I've decided I like your lot better, because at least you set the right things on fire." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. I've always wished I could send someone up the Spire road who didn't clank, because my grunts sound like a smithy falling down the stairs." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid at Kargath! Can you smell the Spire from here, druid? I swear I can on the hot days, and it smells of the old Horde and older lies." },
        { id = "h_cl_lbrs", tags = { "news" }, when = { cleared = "Lower Blackrock Spire", faction = "Horde" },
          text = "Wyrmthalak is dead in his own citadel, and they say your hand was in it. The Spire will be quieter for a while, and I mean to use every hour of it." },
        { id = "h_default", key = true,
          text = "I am Warlord Goretooth, and Thrall gave me Kargath to hold. Up the road sits Blackrock Spire, full of orcs who call themselves the true Horde, and I sit here watching, and waiting, and getting old, which is no death for a warrior." },
        { id = "h_kos", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("KILL ON SIGHT: Dark Iron Dwarves") }, { questActive = TODO_QUEST("KILL ON SIGHT: High Ranking Dark Iron Officials") } } },
          text = "So you read the posting, good! Kill Dark Irons, all of them, and the officers twice over, and bring me proof." },
        { id = "h_angerforge", when = { questActive = TODO_QUEST("Operation: Death to Angerforge") },
          text = "General Angerforge is down in the depths, giving orders to Dark Irons. Take the orders away from him, permanently." },
        { id = "h_command", when = { any = { { questActive = TODO_QUEST("Warlord's Command") }, { questActive = TODO_QUEST("Eitrigg's Wisdom") } } },
          text = "Omokk, Voone and Wyrmthalak must die in their Spire, and any papers they carry come to me. If those papers say what I fear, the Warchief himself must hear it, so go to Orgrimmar and tell him Goretooth sent you." },
        { id = "h_butcher", tags = { "news" }, when = { questRecent = { TODO_QUEST("Operation: Death to Angerforge"), days = 7 } },
          text = "The Butcher of Blackrock is dead, and the 109th can rest! Wear that medallion where everyone in Kargath can see it, and let them ask you about it." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall, so you know why we hold this rock. He sent us here, and here we stay." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. The worgs up at the Spire are bred for war, {class}, and I'd give a great deal to see one of ours run them down." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one in plate, with the Light sitting on you like a war banner! I've seen strange things from this tower, but never a Forsaken who glows." },
      },
      again = {
        { id = "h_again", text = "More? Good, talking keeps me from counting vultures." },
        { id = "h_again2", text = "Speak up, {class}; the wind on this tower steals every second word, and I'd rather hear a boast than miss it." },
      },
      choices = {
        { text = "The land here is sick, Warlord. Can it heal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You sound like you'd rather be fighting.", next = "dream" },
        { text = "Why does the Horde hold Kargath at all?", next = "why" },
        { text = "Have the Dark Irons cost you dearly?", next = "the109" },
        { text = "You keep an odd lot of officers at Kargath.", next = "staff" },
        { text = "Warrior to warrior: do you miss it?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Angerforge is dead, Warlord.", next = "angerforge_dead", when = { questDone = TODO_QUEST("Operation: Death to Angerforge") } },
        { text = "I think you're sweet on the Forsaken at your fire, Warlord.", next = "forsaken", when = { race = "Scourge" } },
        { text = "The orcs at the Spire are my blood, Warlord.", next = "k_orc", when = { race = "Orc" } },
        { text = "The spirits here are sick with Dark Iron fire.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "My people have no stake in Blackrock feuds.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Send me up the Spire, Warlord. I won't clank.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would you put mages on Kargath's walls, Warlord?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I stand with Thrall, Warlord. My demons serve the Horde.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the Blackrock use their worgs for?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Kargath looks short of healers, Warlord.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does a Forsaken paladin trouble you, Warlord?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Wyrmthalak is dead, Warlord. I've seen the lower Spire.", next = "xcl_lbrs", when = { cleared = "Lower Blackrock Spire", faction = "Horde" } },
        { text = "You don't think much of warlocks, Warlord.", next = "prej", when = { prejudiced = true } },
        { text = "I was Blackrock, Warlord. I left Rend's banner.", next = "xorig_brock", when = { origin = "orc_blackrock_defector" } },
        { text = "You're staring, Warlord. Is something on your mind?", next = "flirt", when = { flirt = true } },
        { text = "Point me at the Dark Irons.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { kargath = 1 } } },
      },
    },

    dream = {
      big = true,
      lines = {
        { id = "d_default", text = "Rather? I dream of it every night: me, an axe, a hundred Blackrock, and a song about it after. Instead I get a tower, reports, and two Forsaken ladies at the fire who laugh at my jokes because they're dead and nothing else is funny." },
      },
      choices = {
        { text = "The ladies at the fire?", next = "ladies" },
        { text = "You speak of dying as if you dream of it.", next = "dream_death" },
        { text = "Maybe you'll get your fight.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    dream_death = {
      lines = {
        { id = "dd_default", text = "A thousand times, a thousand ways, and every one of them in the thick of the fighting with the enemies of the Horde falling around me like wheat. Some would call those nightmares, but I wake up smiling." },
      },
      choices = {
        { text = "I pray for such a death too.", next = "dream_young", fx = { trait = { brave = 1 } } },
        { text = "That's grim, Warlord.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "That's the only death worth dreaming of, Warlord.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    dream_young = {
      lines = {
        { id = "dy_default", text = "Ha! I knew it the moment you climbed up here; you remind me of myself when I was young and the war was still mine. I expect you'll be every bit as fierce dead as you are alive." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3 } } },
    },
    ladies = {
      lines = {
        { id = "l_default", text = "Theodora and Vivian, the Hierophant and the Shadowmage: fine company, with sharp tongues. Don't tell them I said fine." },
      },
      choices = { { text = "Your secret is safe.", next = "BACK", fx = { affinity = 3 } } },
    },

    why = {
      lines = {
        { id = "w_default", text = "The Warchief sent the Kargath Expeditionary Force into these badlands, and we found the dwarves digging at a place called Uldaman. But the real prize is a road through the Searing Gorge to Blackrock Mountain, where Rend Blackhand hides." },
      },
      choices = {
        { text = "Who is Rend Blackhand?", next = "why_rend" },
        { text = "The Dark Irons seem a nearer trouble than Rend.", next = "why_dark" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    why_rend = {
      lines = {
        { id = "wr_default", text = "Son of Blackhand, and he sits in the Spire calling himself Warchief of a Horde that died at the end of the Second War. There is one Warchief, and I would very much like to explain that to Rend in person." },
      },
      choices = {
        { text = "Does any grunt here think Rend has the right of it?", next = "op_warchief" },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    why_dark = {
      lines = {
        { id = "wd_default", text = "We went looking for Rend and woke the Dark Irons instead, and now they come at us out of the mountain and out of the Gorge. I didn't ask for a second war, but I'll take it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    the109 = {
      lines = {
        { id = "t_default", text = "A whole division of the Expeditionary Force, orcs and trolls, went into the Depths and was butchered by General Angerforge's men. So now every Dark Iron who wears his colors is to be killed on sight, and the postings by the road say so." },
      },
      choices = {
        { text = "And Angerforge himself?", next = "the109_op" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    the109_op = {
      lines = {
        { id = "to_default", text = "Operation: Death to Angerforge, for whoever earns it. I can't tell you every detail of what it entails, but I promise you it ends with somebody dying, and it won't be us." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    staff = {
      lines = {
        { id = "s_default", text = "Grandmaster Lexlort runs my scouts and sees everything, Theodora and Vivian study whatever the Dark Irons build, and Shul'kar feeds us all. It's a small fort, but it bites." },
      },
      choices = {
        { text = "Lexlort sees everything?", next = "staff_lexlort" },
        { text = "And your scouts in the field?", next = "staff_neeka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff_lexlort = {
      lines = {
        { id = "sl_default", text = "He found out where Angerforge's officers train before the dwarves knew it themselves. I don't ask how he does it, because I sleep better not knowing who's watching my tower." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    staff_neeka = {
      lines = {
        { id = "sn_default", text = "Neeka Bloodscar leads them, and she's the only orc in Kargath who's told me to my face that I walk too loud. She sends her reports south to Stonard, and I've learned to read them before I read anything else." },
        { id = "sn_done", when = { questDone = TODO_QUEST("Report to Helgrum") },
          text = "Neeka Bloodscar, and you've carried her reports to Stonard yourself, so you know she writes like she talks, short and sharp. When she says the road is clear, I believe her, and when she says it isn't, I double the guard." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    warrior = {
      lines = {
        { id = "wa_default", text = "Every day. Command is a fine thing, and now I feel the glory and the bitterness of every fight through the soldiers I send, but I can still feel an axe in my hand when I sleep." },
      },
      choices = { { text = "Then I'll swing one for you.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 } } } },
    },
    angerforge_dead = {
      lines = {
        { id = "ad_default", text = "I heard, and I drank to it, and then I drank to the 109th, and then I may have sung. You are a remarkable soldier, and the K.E.F. will not forget whose axe finished the job." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { kargath = 2 } } } },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Sweet? I'm a warlord, I'm not sweet on anything! I simply enjoy good company at a good fire, and if the company happens to be dead, well, it doesn't eat much." },
      },
      choices = {
        { text = "Theodora calls you Lunk.", next = "forsaken_lunk", when = { any = { { heardLine = "theodora.gl_default" }, { heardLine = "theodora.fo_default" } } } },
        { text = "Your secret is safe.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    forsaken_lunk = {
      lines = {
        { id = "fl_default", text = "She does, and she's the only one in Kargath who'd dare. It's my name, and a fine name, so tell her the Warlord said she may go on using it, if she likes." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_orc = {
      big = true,
      lines = {
        { id = "xor_default", text = "Blood, yes, and that is what makes it bitter. Rend's clan marched in the same Horde as mine in the Second War, and now they kneel to a Warchief they made up and call Thrall a slave's name, so tell me which of us is the true Horde." },
        { id = "xor_camp", when = { origin = "orc_camp_born" },
          text = "You were born behind the camp fences, like the young ones Thrall freed. Those orcs on the mountain never saw a fence; they kept their bloodlust and called it pride, and they would call you weak for having been a prisoner." },
      },
      choices = {
        { text = "Thrall's Horde is the true one.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Some of them fight with more honor than Orgrimmar knows.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "Could any of them be brought home?", next = "k_orc_home" },
      },
    },
    k_orc_home = {
      lines = {
        { id = "xoh_default", text = "Some, maybe, if Rend were dead and the dragon gone from his ear. I have thought it on long nights, and then the Spire sends another war party down the road, and I stop thinking it." },
      },
      choices = { { text = "Something else, Warlord.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Sick is a word for it. The Earthen Ring sends a shaman through here now and then, and they all leave with the same look you have now, like someone who has smelled a corpse in a stew." },
        { id = "xsh_thrall", when = { origin = "orc_thrall_shaman" },
          text = "You learned from Thrall's own circle, I hear it in how you talk. Then you know what the Dark Irons woke under that mountain was never theirs to wake, and the earth out here still feels it." },
      },
      choices = {
        { text = "The land can heal, if the fires are put out.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then burn the Dark Irons out with their own fire.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "No stake, but you came all this way from Mulgore to stand on hot rock beside us, so you have one now. The Blackrock would chain your people the way they chained mine, if they ever learned where you graze." },
      },
      choices = {
        { text = "Then I'll fight for the Horde's sake.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, standing = { kargath = 1 } } },
        { text = "I fight for my tribe, not for your feud.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A warlord hears every boast and every report that comes down that road. Ask me about any of these, and I'll tell you how it really went." },
    },
    blackrock = { { id = "tp_blackrock", text = "Rend Blackhand sits up there in the Spire calling himself Warchief, but there is only one Warchief, and his name is Thrall. I'd like to remind Rend of that with an axe." } },
    dark_iron = { { id = "tp_dark_iron", text = "They swarm out of the mountain like ants out of a kicked nest, so we kick back, and the Horde kicks hard." } },
    background = { { id = "tp_ba", text = "I was a young warrior once, and I lived every dream I had. Now I command, and I live them again through the soldiers I send up that road.", next = "dream" } },
    advice = { { id = "tp_ad", text = "Read the postings by the road before you go into the mountain. They'll tell you who to kill, and that saves a great deal of thinking once you're down there." } },
    thrall = {
      { id = "tp_thrall", text = "The Warchief built a new Horde out of the old one's ashes, and Kargath is one of the walls that keeps the old one out. I'd rather be in the field, but I hold this post because he asked." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "You march under the Warchief's banner too, so you know what we owe him. Every grunt in Kargath was a slave or a child of slaves before Thrall, and none of us forget it." },
    },
    second_war = { { id = "tp_second_war", text = "I was young in the Second War, and I lived every dream a warrior could have. Now I send others to live them, and I watch from this tower." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock clan in the Spire still serve the old Horde's masters, the dragons and the warlocks. Kargath was built to watch them, and someday I'll lead the assault myself." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons under the mountain are no friends of the Blackrock, though they share a roof. I'd let them kill each other, if I thought they'd finish the job." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Forsaken came to us through the Warchief's word, and they've sent their best to Kargath. I don't understand them, but they fight, and that's enough." } },
    firegut = { { id = "tp_firegut", text = "The Firegut ogres on Dreadmaul Rock have been doing something with fire and chanting, and I sent a platoon to find out what. They haven't come back." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin's trolls are some of my best soldiers, and Thal'trak is the best of them. I'd say so to Vol'jin's face, if I ever met him." } },
    internment = { { id = "tp_internment", text = "I wasn't in the camps, but I've commanded orcs who were, and I can tell. They don't break, because they've already been broken once." } },
    _none = { { id = "tp_none", text = "Never heard of it, but can I hit it?" } },
  },
}

P:NPC {
  key = "theodora", id = TODO_NPC("Hierophant Theodora Mulvadania"), name = "Hierophant Theodora Mulvadania",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "dramatic" }, values = { "curious", "mischievous" },
  notices = { "race" },

  impression = {
    first = "Hierophant Theodora Mulvadania calls everyone darling and gossips like a court lady at a bonfire. When she spoke of the 109th Division, though, the charm went out of her voice entirely.",
    third = "{name} met Hierophant Theodora Mulvadania of the Kargath Expeditionary Force, who mourns the slaughtered 109th Division.",
  },

  greetings = {
    { id = "g_op_necro", when = { gossip = { topic = "necromancy", stance = "hate" } }, text = "Vivian says you'd burn every necromancer in Lordaeron, darling. She's been reading by candlelight ever since, purely out of spite." },
    { id = "g_fire", text = "Oh, a new face at the fire! Sit, sit, darling, and you simply must tell me something dreadful, because it's been a dull week in the dust, and the dead do get so bored." },
    { id = "g_away", when = { away = 14 }, text = "Darling, you've been gone {away}, and it's been simply the dullest stretch of dust imaginable. Sit down and tell me everything dreadful." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Everyone's been saying the loveliest things about you, darling, and I adore being the last to hear gossip almost as much as being the first. Do sit." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear you put one over on somebody in Kargath, darling, and I'm only cross that I wasn't there to watch." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Another of us, how refreshing! The orcs are lovely, darling, but they do keep breathing at one." },
  },

  start = "hello",
  nodes = {
    op_forsaken = {
      lines = {
        { id = "opf_default", text = "Oh, the orcs are polite, darling, the way one is polite to a cousin who's been ill for a very long time. What I'd much rather know is what you make of us, honestly, since nobody in Kargath ever says it to my face." },
      },
      choices = {
        { text = "The Forsaken are Horde, and the Horde's word should be kept.", next = "op_fs_trust", fx = { affinity = 2, align = { order = 1 }, opinion = { forsaken = "trust" } } },
        { text = "Allies of convenience. I'd not turn my back on you.", next = "op_fs_distrust", fx = { affinity = -1, align = { order = -1 }, trait = { cautious = 1 }, opinion = { forsaken = "distrust" } } },
        { text = "We're the only ones in the Horde honest about being dead.", next = "op_fs_proud", fx = { affinity = 2, trait = { witty = 1 }, opinion = { forsaken = "admire" } }, when = { race = "Scourge" } },
        { text = "Cairne spoke for your people. That's enough for me.", next = "op_fs_trust", fx = { affinity = 1, opinion = { forsaken = "trust", cairne = "respect" } }, when = { race = "Tauren" } },
        { text = "I'll keep my thoughts to myself, Hierophant.", next = "BACK" },
      },
    },
    op_fs_trust = {
      lines = {
        { id = "opft_default", text = "Darling, how sweet, and how rare! I'll have it written down and framed, and I'll hang it in the Warlord's tent where he'll have to look at it every morning." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_fs_distrust = {
      lines = {
        { id = "opfd_default", text = "Wise, darling, very wise, and terribly rude, which I find I don't mind at all. Do keep watching; it's flattering to be thought dangerous at my age." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_fs_proud = {
      lines = {
        { id = "opfp_default", text = "Oh, I like you enormously. The living spend so much effort pretending they won't end up like us, and we've simply skipped to the end, darling, and found it rather roomy." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Constantly, darling, and every basilisk grows a foot each time it's mentioned. Vivian swears one of the scouts claimed to have killed a black dragon with a spear, and I'd dearly love to see the spear, because I suspect it's a broomstick." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And this is {pet}! Oh, it's adorable, darling, in a terrifying sort of way. Does it bite? No, don't answer, I'd rather wonder." },
      },
      choices = {
        { text = "My hunts need no embellishing, Hierophant. They speak for themselves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep the kill. I'll tell the story bigger at the fire.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Hierophant.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only rumour, darling, but the rumour is very good. They say the Dark Irons called a fire lord up out of the earth centuries ago and have been his servants ever since, which would explain the heat, and the tempers, and the abysmal manners." } },
      choices = {
        { text = "Then the Horde must stand together and put that fire out.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Dark Irons burn in their master's fire. It's their mess.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Vivian, as usual, because she has books and I have only opinions. She says the earth here was scorched by old wars long before the orcs came, and I say it simply has a sour disposition, like the Warlord." } },
      choices = {
        { text = "Any land can be mended, given time and care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some places are better left scorched.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Someone to read the Dark Irons' fire before it reads us, darling. Vivian takes their golems apart and I take their gossip apart, but neither of us can be in the Depths and at this fire at once." } },
      choices = {
        { text = "Then I'll serve the Expeditionary Force wherever it sends me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll follow my own studies, not the Force's orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, the Warlord talks to the vultures, but everyone knows that, so it hardly counts. The real secret is that Lexlort reads every letter that leaves this town before the wind rider does, and if you tell him I said so, I'll deny it beautifully." } },
      choices = {
        { text = "Your secret's safe with me, Hierophant.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets are currency. I'll spend this one wisely.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Hierophant.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Shadow, darling, the things in the dark that answer when called, which is why they call her Shadowmage and not just Vivian. She's brilliant, and she's frightened of her own shadow, which is either very funny or very sensible, and I've never decided which." } },
      choices = {
        { text = "Shadow is just another school. Fear is foolish.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "She's sensible. Some things answer too readily.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Hierophant.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! The Undercity's magi would adore you, darling, provided you didn't mind their hours, which are endless, or their company, which is worse." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, darling! You must tell me everything you've overheard in Kargath, and I'll tell you everything I've overheard, and we'll see who comes off better." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, darling! You must tell me whether the spirits gossip, because if they do, I'd very much like to know what they say about the Warlord." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, at Kargath? How delightful. Vivian and I have a running wager on whether the Badlands were ever green, and I suspect you could settle it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, darling, how lovely! Do tell me which you pray to, the shadow or the Light or the loa, because I've tried more than one and only the gossip ever answered." },
        { id = "h_default", key = true,
          text = "Hierophant Theodora Mulvadania, of the Undercity and the Kargath Expeditionary Force, and by the Dark Lady's grace no longer of any grave. I keep the Warlord company, because someone has to, and Vivian can't do it alone." },
        { id = "h_109th", tags = { "news" }, when = { questActive = TODO_QUEST("The 109th Division") },
          text = "The 109th Division were our people, Expeditionary Force, and they were my friends, and General Angerforge and his golem lord butchered them in the depths. I'm done being charming about it, darling: kill them both." },
        { id = "h_guzzler", when = { questActive = TODO_QUEST("The Grim Guzzler") },
          text = "The Grim Guzzler is a tavern inside Blackrock Depths, if you can believe it. Do go and see, and tell me everything, especially the parts you shouldn't." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "Golems, darling, which the Dark Irons build out of stone and spite. Bring me shards from the rock things in the Burning Steppes, and then we'll see who's been signing their work." },
        { id = "h_machines_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Rise of the Machines"), days = 3 } },
          text = "Initials, darling, etched into every one of those shards, and a rank beside them, as if the golems were soldiers. There's a gnome out in the Dustbowl called Lotwil who knows about such things, so do go and bother him." },
        { id = "h_goretooth", when = { heardLine = "goretooth.h_default" },
          text = "Did the Warlord tell you about his dreams, the glorious death and the hundred foes? He tells everyone, and we nod, because it's kinder." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter, darling! Do tell me what you've shot, because the Warlord's grunts only ever bring me stories, and I'd love something with a little more meat on it." },
      },
      again = {
        { id = "h_again", text = "More? Oh, you are a treat. Go on, darling." },
        { id = "h_again2", text = "Don't stop now, I was just starting to enjoy myself." },
      },
      choices = {
        { text = "Who's winning the wager, Hierophant?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Can a warrior's steel do anything against the Dark Iron?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "The fire spirits rage under Blackrock Mountain. Do you know why?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Kargath need most from its spellcasters, Hierophant?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You look like a woman with gossip to share.", next = "gossip" },
        { text = "What have you learned of the Dark Irons?", next = "machines" },
        { text = "What does a Hierophant do?", next = "hierophant" },
        { text = "Have you lost friends out here?", next = "the109" },
        { text = "How does a Forsaken get on among orcs?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm Forsaken, and the Light still answers me.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "You don't flinch at my demons, Hierophant.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "I'd wager you know every secret in Kargath, Hierophant.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does Vivian study that a mage wouldn't?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the grunts tell tall stories about hunting, Hierophant?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },

    gossip = {
      lines = {
        { id = "g_default", text = "Goretooth thinks he's charming, and Vivian thinks so too, though she'd sooner be torn apart by ghouls than say it. I say nothing, darling; I'm a Hierophant, and I simply observe." },
      },
      choices = {
        { text = "And what do you think of him?", next = "gossip_lunk" },
        { text = "Very wise.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    gossip_lunk = {
      lines = {
        { id = "gl_default", text = "Lunk? His name is Lunk, darling, Warlord Lunk Goretooth, and he struts up and down that tower like a peacock with tusks. I'd never have him, but I'd never let anyone else make fun of him either." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    machines = {
      lines = {
        { id = "m_default", text = "They showed themselves when we first pushed into the Searing Gorge, great lumbering things of rock and metal. We traced them back to the Burning Steppes, and quite possibly to Blackrock Depths itself." },
      },
      choices = {
        { text = "Who builds them?", next = "machines_marks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    machines_marks = {
      lines = {
        { id = "mm_default", text = "That's what my monocle is for, darling, the enormous one. Every fragment has a maker's initials and a rank stamped into it, and anyone who signs his golems has a very high opinion of himself." },
        { id = "mm_done", when = { questDone = TODO_QUEST("The Rise of the Machines") },
          text = "G.L.A., darling, on every shard, and the ones you smashed were only Rank IV, the lowliest sort. Lotwil went white as a sheet when he saw them, and gnomes don't go white easily." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    hierophant = {
      lines = {
        { id = "hi_default", text = "It's a title, darling, a lovely long one, and it means people expect me to know things. So I make very sure that I do, which is why I listen at every fire in Kargath." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    the109 = {
      big = true,
      lines = {
        { id = "t_default", text = "Good orcs and good trolls, a great many of them, and some of them were my friends, which is not something I say lightly in my condition. Angerforge and his golem lord, Argelmach, had them slaughtered in the Depths." },
      },
      choices = {
        { text = "Then they'll answer for it.", next = "the109_revenge", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll make them pay, but I won't fight fair doing it.", next = "the109_revenge", fx = { align = { honor = -1 } } },
        { text = "I'm sorry for your friends.", next = "the109_revenge", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    the109_revenge = {
      lines = {
        { id = "tr_default", text = "Revenge is the only gift I'd accept for them, darling, and I'd accept it with no mercy at all. Bring it to me and I'll weep, or whatever it is I do now instead." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    forsaken = {
      lines = {
        { id = "fo_default", text = "Beautifully, darling, as long as you remember that they mean well and smell of it. Lunk saves me the warmest seat by the fire, as if I could feel it, and that's sweeter than anything the Undercity ever did for me." },
      },
      choices = {
        { text = "And what do the orcs really make of you, Hierophant?", next = "op_forsaken" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Darling, how scandalous, and how utterly delicious! Half the Undercity would burn you for it and the other half would want to study you, so do be careful which half you tell." },
      },
      choices = {
        { text = "The Light didn't ask my permission.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd trade it for something less trouble, if I could.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Steel against Dark Iron is like hammering an anvil with an anvil, warrior. You'll need fire and shadow too, which is why Kargath keeps people like me around." } },
      choices = {
        { text = "Then I'll be the anvil, and you be the fire.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust steel. Magic only fails you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "Flinch? My dear, I've shared a corridor with abominations and a bench with the Royal Apothecaries, and an imp is the politest guest I've had all month. Do keep it away from the Warlord, though; he swings first and asks never." },
        { id = "xlk_cult", when = { origin = "forsaken_cult_remnant" },
          text = "I know where you learned it, darling, and I won't say it aloud in an orc town. We've all got something from before that we'd rather keep in the cellar." },
      },
      choices = {
        { text = "My demons are tools. Nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'd rather be rid of them, if I could.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Darling, I listen at every fire in Kargath, so of course I know things. Pick one of these and I'll tell you everything, including the parts I shouldn't." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, darling, the good gossip and the true gossip, which aren't always the same thing. Here's what I can tell you." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "Grim little people, though their ale is wonderful, or so I'm told." } },
    background = { { id = "tp_ba", text = "The Undercity sent me, the Expeditionary Force keeps me, and the Warlord amuses me. Before that is none of your business, darling, and most of it is buried." } },
    advice = { { id = "tp_ad", text = "Never let a Dark Iron see you're impressed by his golem, darling. They're vain about them, and vanity makes them careless." } },
    sylvanas = {
      { id = "tp_sylvanas", text = "Our Lady freed us from the Scourge and gave us back our minds, darling. Some of us have wondered since what to do with them." },
      { id = "tp_sylvanas2", when = { race = "Scourge" }, text = "You've felt her will the same as I have, darling, so I needn't explain. We are hers, and gladly, and we needn't discuss the rest in front of the living." },
    },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are the dead who woke up, darling, and found that nobody wanted them back. So we kept ourselves, and here we are." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took everything from us, darling, our homes, our lives and our names. I won't forgive it, and I won't forget it." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron was my home, darling, before it was a graveyard. I still remember the court, the music and the gossip." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is charming in his way, darling, though he looks at us as if we might bite. Some of us might." } },
    holy_light = { { id = "tp_holy_light", text = "I prayed to the Light once, darling, in the cathedral at Lordaeron. It didn't answer, or if it did, I wasn't listening." } },
    _none = { { id = "tp_none", text = "Never heard a whisper of it, darling, and I hear every whisper." } },
  },
}

P:NPC {
  key = "vivian", id = TODO_NPC("Shadowmage Vivian Lagrave"), name = "Shadowmage Vivian Lagrave",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "class" },

  impression = {
    first = "Shadowmage Vivian Lagrave insists she is very composed and then jumps at her own shadow. Her curiosity about the Dark Irons' secrets is almost greedy, and wholly sincere.",
    third = "{name} met Shadowmage Vivian Lagrave of the Kargath Expeditionary Force, a theatrical student of the Dark Irons' secrets.",
  },

  greetings = {
    { id = "g_op_forsaken", when = { gossip = { topic = "forsaken", stance = "distrust" } }, text = "Theodora tells me you'd not turn your back on us. Very wise, my dear, though it does make conversation awkward." },
    { id = "g_fire", text = "Oh! You startled me, not that I'm easily startled, of course; I'm a Shadowmage of the Undercity, and the dead are very composed." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A fellow practitioner! Finally someone at this fire who knows a ley line from a clothesline." },
  },

  start = "hello",
  nodes = {
    op_necro = {
      lines = {
        { id = "opn_default", text = "Troubling? My dear, I'm one of the raised, so I can hardly be squeamish about it. But plenty in the Horde whisper about the Apothecarium's work, and I'm curious, so what's your view of necromancy?" },
      },
      choices = {
        { text = "Necromancy made the Scourge. It should be burned out.", next = "op_necro_hate", fx = { affinity = -1, align = { light = 1 }, opinion = { necromancy = "hate" } } },
        { text = "A weapon is a weapon. Raise whatever serves the Horde.", next = "op_necro_useful", fx = { affinity = 1, align = { light = -1 }, opinion = { necromancy = "useful" } } },
        { text = "It gave me a second life. I'll not curse it.", next = "op_necro_grateful", fx = { affinity = 1, opinion = { necromancy = "mixed", undeath = "accept" } }, when = { race = "Scourge" } },
        { text = "I don't know enough to judge it.", next = "BACK" },
      },
    },
    op_necro_hate = {
      lines = {
        { id = "opnh_default", text = "Burned out! Well, that's honest, and I suppose the Scourge would agree with you about our side of it. Do remember that my abominations are holding the line you're standing behind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_necro_useful = {
      lines = {
        { id = "opnu_default", text = "Oh, practical! I knew I liked you. The Kirin Tor would faint to hear it, but the Kirin Tor never had to hold Kargath with a handful of grunts." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_necro_grateful = {
      lines = {
        { id = "opng_default", text = "Nor will I, my dear, though I curse the one who did it to us every evening, quite methodically. One may be grateful for the gift and still loathe the giver." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Interest me? It fascinates me, and it frightens me a little, which is the same thing in my line of work. Shadow and Light are meant to keep to their own sides of the room, and you seem to have moved the furniture." } },
      choices = {
        { text = "The Light chose me. Shadow has no hold on what I am.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Light and shadow are both tools. I'll use whichever works.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A clear path, mostly, because the Dark Irons guard their secrets with golems and fire elementals, and I can't study anything while it's trying to set me alight. If you break a golem, bring me its core, because there's a bound elemental inside every one, and I'd very much like to know how they did it." } },
      choices = {
        { text = "I'll clear your path and follow your lead in the mountain.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll break golems my own way. You can sort the pieces.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Vivian.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Trouble me? It thrills me, though I suppose it shouldn't. The Dark Irons trap fire and earth inside their golems to make them walk, and if I learn how, the Expeditionary Force could do it too, which I admit sounds worse when I say it to a shaman." } },
      choices = {
        { text = "Free them, Vivian. No spirit should be chained inside a golem.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study it. If the Dark Irons can, the Horde should too.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Everything, my dear, and that's the trouble. Their fire magic is crude, but it's old, and it answers to something under that mountain that I'd very much like to study from behind a very thick wall." } },
      choices = {
        { text = "Report it all to the Warlord first. Kargath's safety comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Study freely, Vivian. Rules only slow a good scholar.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You could, couldn't you, and you'd probably enjoy it, though I'd rather you didn't tell anyone how you came by it. The Dark Irons stole it first, I'm almost certain, so really you'd be stealing it back, which is practically a good deed." } },
      choices = {
        { text = "Stealing from thieves is no crime at all.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A theft's a theft, Vivian, whoever owned it first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Dragons, dwarves and fire, depending on which ruin you ask. The scholars say this was green once, before the black dragons and the Dark Irons had their way, and I've found petrified roots in Lethlor Ravine that agree with them." } },
      choices = {
        { text = "Some land is better left dead. Let it go.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Then it can be green again, one day.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then the Dark Irons have lost the dwarf who held their whole bargain with the Firelord together, and that bargain is what I came here to study. The heat in that mountain doesn't come from forges, you know, it comes from Ragnaros himself, and I'd dearly like to know who answers his call now." } },
      choices = {
        { text = "Ragnaros's fire should be stamped out, not studied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Learn everything you can from it. Power is power.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Who does answer Ragnaros now?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "His own servants, I expect, deeper down, where the stone runs molten and nobody sensible goes. The Dark Irons only ever borrowed his fire, and now there's nobody left at the top to answer for the loan." } },
      choices = {
        { text = "Then I'll keep my distance from the molten parts.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "Oh! You came up behind me and I didn't even hear you, which is exactly what I'd expect of a rogue, so I'm not startled at all." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Oh, how fortunate, because I've been taking apart elemental cores all week and I'd love to know whether they mind." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest! Splendid, because if anything in these essence jars ever escapes, I'll want someone close by who knows a prayer, and I'm perfectly composed about that, naturally." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths", faction = "Horde" },
          text = "Thaurissan is dead! Do you know what this means for my research? Every jar of essence in the Depths is suddenly that much easier to reach, and I'm perfectly calm about it." },
        { id = "h_default", key = true,
          text = "Shadowmage Vivian Lagrave, of the Kargath Expeditionary Force. I study the things in the mountain that the Dark Irons would rather we didn't, which is thrilling work, though mostly dust." },
        { id = "h_element", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Element") },
          text = "The Dark Irons put something in their golems to make them move, called Essence of the Elements, and I want ten. I have projects of my own that could use a heartbeat." },
        { id = "h_recipe", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave") }, { questActive = TODO_QUEST("Lost Thunderbrew Recipe") } } },
          text = "There's a Thunderbrew recipe lost somewhere in the Depths, and I want it, for research. Entirely for research!" },
        { id = "h_tablet", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave and the Darkstone Tablet") }, { questActive = TODO_QUEST("The Darkstone Tablet") } } },
          text = "The Darkstone Tablet holds the secret recipes of a dwarf alchemist who's been dead for ages, and it's somewhere in Blackrock Spire. Bring it to me carefully, because I mean to read every scratch on it!" },
        { id = "h_element_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Last Element"), days = 3 } },
          text = "Your essences went off to the Undercity by courier this morning, every one of them. I do hope you spent your payment on something frivolous; it's what I'd do." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "Oh! A warrior, and you clank, which is good, because at least I heard you coming, and I'm perfectly composed, thank you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid, out in this blasted place. I expect the Badlands make your fur crawl, and I can't say I blame you, for nothing here has grown properly in an age." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Oh! You're glowing. A Forsaken who wields the Light, here in Kargath, and I've only just finished my tea. Do forgive me if I stare, because it's purely academic, I promise." },
      },
      again = {
        { id = "h_again", text = "Yes? I'm perfectly composed, so ask away." },
        { id = "h_again2", text = "Something else? Oh good, I was hoping you'd stay." },
      },
      choices = {
        { text = "What happened to the Badlands, Vivian?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "My beasts could scout the Burning Steppes for you, Vivian.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Those golem essences hold bound elementals, Vivian. Does that trouble you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What could a spellcaster learn from the Dark Irons' fire, Vivian?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "The Warlord speaks well of you.", next = "flustered" },
        { text = "You're studying something more than beer, I think.", next = "study" },
        { text = "Why does a Shadowmage want a beer recipe?", next = "thunderbrew", when = { any = { { heardLine = "vivian.h_recipe" }, { questActive = TODO_QUEST("Vivian Lagrave") }, { questActive = TODO_QUEST("Lost Thunderbrew Recipe") } } } },
        { text = "What's the Darkstone Tablet?", next = "tablet", when = { any = { { heardLine = "vivian.h_tablet" }, { questActive = TODO_QUEST("Vivian Lagrave and the Darkstone Tablet") }, { questActive = TODO_QUEST("The Darkstone Tablet") } } } },
        { text = "You've noticed my craft, I think.", next = "practitioner", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "An orc who studies the arcane. Surprised?", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "Kargath must seem a long way from the Undercity.", next = "undercity", when = { race = "Scourge" } },
        { text = "A troll who deals with demons. Does that interest you?", next = "k_troll_lock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "I could steal that Thunderbrew recipe for you, Vivian.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does a Shadowmage need from a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Does the Light on me interest a shadowmage, Vivian?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Emperor Thaurissan is dead, Shadowmage. I was in the throne room.", next = "xcl_brd", when = { cleared = "Blackrock Depths", faction = "Horde" } },
        { text = "I'll find it.", next = "END", fx = { affinity = 1 } },
      },
    },

    flustered = {
      lines = {
        { id = "f_default", text = "He does? I mean, does he, how nice, that's... hm, well. Did you need a quest? I have several, so please, take one." },
      },
      choices = {
        { text = "You're blushing, Shadowmage.", next = "flustered_blush" },
        { text = "I'll take one.", next = "BACK", fx = { affinity = 3 } },
      },
    },
    flustered_blush = {
      lines = {
        { id = "fb_default", text = "I am dead, and the dead do not blush; it's the firelight, and you'll kindly say so if anyone asks. Theodora would never let me hear the end of it." },
      },
      choices = { { text = "It's the firelight.", next = "BACK", fx = { affinity = 2 } } },
    },

    study = {
      lines = {
        { id = "s_default", text = "The Dark Irons have mastered golems of terrible power, and our spies say they use a unique source to make them go. Think what the Apothecarium could build into our abominations with a power like that!" },
      },
      choices = {
        { text = "Abominations?", next = "study_abom" },
        { text = "That's grim work.", next = "study_grim", fx = { align = { light = 1 } } },
        { text = "Power like that would serve the Apothecarium well.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    study_abom = {
      lines = {
        { id = "sa_default", text = "Stitched, strong and very loyal, though not very bright, and they'd be so much stronger with a proper heart of elemental fire. Every essence you bring goes to the Undercity by the next courier." },
      },
      choices = {
        { text = "Do you find raising the dead troubling?", next = "op_necro" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    study_grim = {
      lines = {
        { id = "sg_default", text = "Grim? My dear, I'm a Shadowmage in the Badlands, so grim is the only kind of work there is. I try to be cheerful about it, and that's more than the work deserves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thunderbrew = {
      lines = {
        { id = "th_default", text = "A Dark Iron named Hurley Blackbreath stole the recipe for Thunderbrew Lager, which is said to fill whoever drinks it with strength and courage. The Forsaken can surely find uses for that more in line with our own objectives." },
      },
      choices = {
        { text = "Such as?", next = "thunderbrew_joke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thunderbrew_joke = {
      lines = {
        { id = "tj_default", text = "Picture the dwarves of the Alliance facing their own beer's virtues on a battlefield, turned against them by people who can't even taste it! I find that terribly funny, and perhaps death does that to one's sense of humor." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    tablet = {
      lines = {
        { id = "ta_default", text = "Urheld Darkstone was a dwarf alchemist of great skill, and his fellows thought him mad, so he never shared his research. He etched it onto tablets instead, which is a terribly sensible thing for a madman to do." },
      },
      choices = {
        { text = "And one is in the Spire?", next = "tablet_spire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tablet_spire = {
      lines = {
        { id = "ts_default", text = "In a chamber once called the Hall of Fortune, though who knows what the Blackrock call it now, since few who go in come back out to tell us. Do try to be one of the few." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    practitioner = {
      lines = {
        { id = "pr_default", text = "Oh, I could tell the moment you sat down, you've that slightly singed look about the fingertips. Tell me you've read something forbidden lately, because nobody here reads anything at all." },
      },
      choices = {
        { text = "Nothing I'd admit to in public.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I keep to what's safe.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "Surprised, and absolutely delighted! An orc who studies instead of smashing is the rarest specimen in the Badlands, so do sit somewhere I can watch you cast." },
      },
      choices = { { text = "I'm not a specimen.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } } },
    },
    undercity = {
      lines = {
        { id = "u_default", text = "This place has a certain stark charm, I'll grant it, but it has none of the Apothecarium's amenities. I miss a proper laboratory far more than I ever missed breathing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_troll_lock = {
      big = true,
      lines = {
        { id = "xtl_default", text = "Interest me? I've only read of it, in a Kirin Tor report that described the Darkspear's spirit-talk as quaint. I don't suppose your loa have opinions about the Burning Legion?" },
        { id = "xtl_voice", when = { origin = "troll_other_voice" },
          text = "You heard a different voice in the dark than the loa, I'm told, and listened to it. That's the most interesting thing anyone has said in Kargath since I arrived, which isn't saying much, but still." },
      },
      choices = {
        { text = "The loa keep their distance from my work.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "The loa watch me. They'd warn me if I went too far.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What did the report say?", next = "k_troll_report" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "They could, and they'd be less likely to be noticed than one of my apprentices. The black dragonflight has keen eyes, though, so send them low and send them at dusk." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? It's rather larger up close than I'd expected, and I am perfectly composed, thank you. Yes, it could scout the Steppes, but send it low and at dusk, because the black dragonflight has keen eyes." },
      },
      choices = {
        { text = "I'll send them as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My beasts go where I decide, Shadowmage.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    k_troll_report = {
      lines = {
        { id = "xtr_default", text = "That trolls can't be taught the higher schools, which I always found a little rich from people who taught Kel'Thuzad. You're proof against it, and I'll be writing that down with some pleasure." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I study what the Dark Irons leave lying about, and a few other things besides. Ask me about any of these, my dear." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "Their fire magic is crude but powerful, like a hammer made of lava, and I'd love to study it from a safe distance." } },
    background = { { id = "tp_ba", text = "The Apothecarium trained me, the Expeditionary Force sent me, and the Badlands bore me to tears until the Dark Irons gave me something to study." } },
    advice = { { id = "tp_ad", text = "Never touch a golem's heart with bare hands, my dear, even a broken one. Ask me how I know, and then count my fingers." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady sees farther than the rest of us, and she'll lead us where we need to go. I'm very composed about it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are the dead who refused to stay dead, and the living hate us for it. I don't mind, mostly." } },
    scourge = { { id = "tp_scourge", text = "The Scourge made us, and we unmade ourselves. The Apothecarium is working on how to unmake the rest of them." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron fell, and the Undercity grew in its ruins. It's not the same, but it's ours now." } },
    dalaran = { { id = "tp_dalaran", text = "I studied magic near Dalaran, before. The Kirin Tor wouldn't let me in now, I'm sure." } },
    _none = { { id = "tp_none", text = "Hm! That's not my field, not yet." } },
  },
}

P:NPC {
  key = "lexlort", id = TODO_NPC("Lexlort"), name = "Lexlort",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "terse" }, values = { "practical", "loyal" },
  notices = { "class" },

  impression = {
    first = "Lexlort spends words as though each one might be overheard and sold. He knew which path I'd come in by, and that is meant to impress me, I think.",
    third = "{name} met Lexlort, the Kargath Expeditionary Force's watchful spy on Blackrock Spire.",
  },

  greetings = {
    { id = "g_shadow", text = "You found me, and most don't, which is either good news for you or bad news for me. Speak low, {class}; a warrior shouts, but a scout of the Horde listens." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of ours, in trade if not in uniform. You'll understand why I don't say much." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They make reports, and I read them. Some say the Light in you is a trick of the Dark Lady's, and some say you're a Silver Hand spy who forgot to stay alive. I say nothing until I've watched you a while longer." } },
      choices = {
        { text = "Watch me, then. I serve the Dark Lady and the Horde.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I answer to the Light and to myself, not to the Dark Lady.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Grark Lorkrub sold our plans to the Blackrock, and someone has to bring him in alive, which means fighting through his guards without killing him by mistake. That's harder for your kind than you'd think, because a warrior's swing doesn't always stop where it's told." } },
      choices = {
        { text = "I'll bring him back alive. Discipline's half the fight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Traitors don't deserve a cell. I'll make no promises.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they'll take orders, I'll take them on, though nothing I've met takes orders well. The earth under Blackrock Mountain shakes when something moves deep inside, so you tell me what it's saying and I'll tell you whether to worry." } },
      choices = {
        { text = "I'll report everything the earth tells me, straight to you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits answer to me, not to the Expeditionary Force.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Tell me what the Spire's own casters are doing, which my scouts can feel but can't name. The Blackrock keep spellcasters up there as well as brutes, and none of mine can tell a ward from a curse." } },
      choices = {
        { text = "Put me on your rolls. I'll watch where you send me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll watch the Spire, but I report to no one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a fireball lights up the ridge for a mile, and every Blackrock on the Spire road sees it. I need people who can watch for a week without being seen, and a mage who can do that is rarer than an honest goblin." } },
      choices = {
        { text = "I can be patient when the Horde needs it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Patience is for spies. I'd rather burn it all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Lexlort.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It could, and then it would tell whoever asked it nicely, or whoever offered more. I don't trust a spy I can't buy, and I can't buy a demon, so I'll keep to orcs." } },
      choices = {
        { text = "Demons serve whoever binds them strongest. I bind well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right. Demons shouldn't be trusted with secrets.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Black dragonkin, mostly, and the Blackrock orcs who threw in with them, though I report all of it. Some nights the mountain glows red from the inside, and the wind riders won't fly near it until morning." } },
      choices = {
        { text = "The Blackrock betrayed the Horde. They must answer for it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the Blackrock to themselves. It's not our fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your imp talks, which makes it a bad spy, so keep it in your pocket while you're near my reports." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Your spells are loud, and loud is useless to me, though I'll admit you're handy when the quiet way goes wrong." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, which is useful to me, since spirits don't sell plans to the Blackrock, and that already puts them ahead of Grark." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Good, because my scouts come back cut up, and they'd rather be patched by you than by the alchemist upstairs." },
        { id = "h_default", key = true,
          text = "Lexlort, Grandmaster of the Warlord's scouts. The Expeditionary Force needs eyes on the Spire, and I'm the eyes, but sometimes I need hands that don't shake when the blood starts." },
        { id = "h_grark", tags = { "news" }, when = { questActive = TODO_QUEST("Grark Lorkrub") },
          text = "Grark Lorkrub sold our plans to the Blackrock, and an orc who sells his own clan has no honor left to lose. He's hiding under their wing in the Burning Steppes, so put him in thorium shackles and walk him to the Searing Gorge, where my men will be waiting." },
        { id = "h_predicament", when = { questActive = TODO_QUEST("Precarious Predicament") },
          text = "You've got Grark moving, so keep him close through the mountain. If he runs, he dies, and what he knows dies with him." },
        { id = "h_bijou", when = { questActive = TODO_QUEST("Operative Bijou") },
          text = "Bijou went into Blackrock Spire and hasn't come out. Bring her back alive, and don't let her talk you into anything on the way." },
        { id = "h_report", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bijou's Reconnaissance Report"), days = 3 } },
          text = "Bijou's reports are good, which annoys me more than if they'd been worthless. She's wriggled out of trouble again, and the K.E.F. is the better for it." },
        { id = "h_seen", when = { metBefore = true }, text = "You came in by the south path at noon; I know, because I always know. Don't take it personally." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You'll do for the loud work, and there's plenty of that, since the Spire's full of orcs who'd sooner fight than talk." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. They tell me your kind see in the dark when you take a cat's shape, so I might have a use for you up near the Spire." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I'd heard there were a few of you, but I hadn't heard you'd be so loud." },
      },
      again = {
        { id = "h_again", text = "Something else? Say it quickly, then." },
        { id = "h_again2", text = "Ask, but keep your voice down; the wind carries." },
      },
      choices = {
        { text = "What do you watch for near Blackrock Spire?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Could the spirits help you watch the Spire, Lexlort?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would you have a spellcaster do for the Expeditionary Force?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What do you watch for?", next = "watch" },
        { text = "Who is Grark Lorkrub?", next = "grark", when = { any = { { heardLine = "lexlort.h_grark" }, { questActive = TODO_QUEST("Grark Lorkrub") }, { questActive = TODO_QUEST("Precarious Predicament") }, { questDone = TODO_QUEST("Precarious Predicament") } } } },
        { text = "Who's Bijou?", next = "bijou", when = { any = { { heardLine = "lexlort.h_bijou" }, { questActive = TODO_QUEST("Operative Bijou") }, { questDone = TODO_QUEST("Operative Bijou") } } } },
        { text = "You knew I was coming before I reached the gate.", next = "seen" },
        { text = "Teach me something about the trade.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Grark's in your custody now.", next = "grark_done", when = { questDone = TODO_QUEST("Precarious Predicament") } },
        { text = "Why do you call spells loud?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "A demon could watch the Spire for you.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What loud work do you have, Lexlort?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'll be your hands.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My beast can be your eyes too.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "What do your scouts make of a paladin among the dead, Lexlort?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'm nobody's hands, Lexlort. I work for myself.", next = "END", fx = { align = { order = -1 } } },
      },
    },

    watch = {
      lines = {
        { id = "w_default", text = "Who goes in and out of the Spire, and when, and how drunk they are when they do it. The Warlord calls me the head of reconnaissance, which means I'm the one who doesn't sleep." },
      },
      choices = {
        { text = "What have you learned?", next = "watch_learned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_learned = {
      lines = {
        { id = "wl_default", text = "Where Angerforge's officers train, behind a locked gate near the heart of the dwarves' city, and that the Blackrock and the Dark Irons share a mountain and very little else. The rest I tell the Warlord." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    grark = {
      big = true,
      lines = {
        { id = "gr_default", text = "One of ours, once, and caught red-handed giving the Blackrock our daily operations. I tracked him across the Searing Gorge, through the mountain and into the Burning Steppes, where he thinks he's safe." },
      },
      choices = {
        { text = "A dead traitor would be easier to carry home.", next = "grark_alive" },
        { text = "Why would an orc turn traitor?", next = "grark_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grark_alive = {
      lines = {
        { id = "ga_default", text = "A dead traitor tells you nothing. A live one in shackles tells you who else he talked to, and that list matters more than he does." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grark_why = {
      lines = {
        { id = "gw_default", text = "He'd tell you there's power in joining the Blackrock's legion, and he'd mean it. Rend still promises some orcs the old Horde back, and a few are fool enough to want it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    bijou = {
      lines = {
        { id = "b_default", text = "A goblin, and one of our slipperiest operatives. I found out she was working for an exotic pet dealer in the Burning Steppes called Kibler, paying her way with Horde coin." },
      },
      choices = {
        { text = "So she's a traitor too?", next = "bijou_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bijou_trust = {
      lines = {
        { id = "bt_default", text = "She's a goblin, so she's loyal to whoever paid last. Never trust one, and never let her sweet-talk you, because she will try." },
        { id = "bt_done", when = { questDone = TODO_QUEST("Bijou's Reconnaissance Report") },
          text = "She swears she only took Kibler's coin to get inside the Spire, and her reports almost make me believe it. Almost; I'm still counting the money." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    seen = {
      lines = {
        { id = "se_default", text = "Every path into Kargath has somebody on it who belongs to me. Most of them are grunts who think they're guarding a road, and that's how I like it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "Never come back the way you went in, and never count on a door being locked twice. The Dark Irons change their locks, but they never change their habits." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    grark_done = {
      lines = {
        { id = "gd_default", text = "He is, and he's talking, slowly. You've earned your tribute, and the Warlord will want to see you about the last of it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "A beast doesn't gossip and doesn't get bored, which puts it ahead of half the grunts on this wall. Send it up the ridge at dusk and watch what the buzzards do; when they lift all at once, something from the Spire is moving." },
        { id = "xhu_head", when = { origin = "troll_headhunter" },
          text = "A headhunter from the jungle, by the trophies. You know how to wait in a tree for a day, so you know half my job already, and the buzzards will tell you the rest." },
      },
      choices = {
        { text = "Watching is half the hunt.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'd rather hunt the scouts than watch them.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I watch, I remember, and I'll talk about these if you ask me plainly." },
    },
    blackrock = { { id = "tp_blackrock", text = "I know their shift changes, their drinking songs and their names, because that's my job." } },
    background = { { id = "tp_ba", text = "I watch, I report, and I keep the rest to myself, as a scout of the Horde should. That's the whole story." } },
    advice = { { id = "tp_ad", text = "Count the guards on your way in, and count them again on your way out. If the numbers don't match, run." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock in the Spire are planning something. I don't know what yet, but I'll know before anyone else." } },
    thrall = { { id = "tp_thrall", text = "The Warchief values information, and I give it to him. That's all I'll say about the Warchief." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons trade with the Blackrock and fight them too. Whoever's winning this week, I'll know." } },
    ravenholdt = {
      { id = "tp_ravenholdt", text = "There's a manor in Alterac where my kind of work is taken seriously. I've never been invited, but I know where it is." },
      { id = "tp_ravenholdt2", when = { class = "ROGUE" }, text = "You'd know about Ravenholdt, then, if you know what's good for you. Don't speak the name in an inn, even one as quiet as Kargath's." },
    },
    _none = { { id = "tp_none", text = "That's nothing I'll share, not even with one of the Horde." } },
  },
}

P:NPC {
  key = "shulkar", id = TODO_NPC("Innkeeper Shul'kar"), name = "Innkeeper Shul'kar",
  bible = "bibles/badlands.md", role = "innkeeper", tier = "service",
  communities = { "kargath" }, temper = { "warm" }, values = { "generous", "loyal" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Shul'kar keeps a pot on and a dry bunk ready and collects the grunts' tall tales for free. Kargath is a hard place, and his inn is the softest corner of it.",
    third = "{name} met Innkeeper Shul'kar, who keeps the inn at Kargath for the Horde's soldiers.",
  },

  greetings = {
    { id = "g_op_warchief", when = { gossip = { topic = "warchief", stance = "soft" } }, text = "The Warlord says you think Rend's got the right of it. Keep that away from my tables, friend, because the 109th's widows drink here, and they're quicker with a knife than the Warlord." },
    { id = "g_inn", text = "Come in out of the dust and sit, {class}. There's water, there's grog, and there's a bunk nobody's bled on recently, which in an orc camp counts as luxury." },
    { id = "g_home", when = { homeInn = { "Kargath" } }, text = "Back from the badlands! Tell me what you killed, because the grunts like a good story with their supper, and my cooking needs the help." },
    { id = "g_away", when = { away = 14 }, text = "Back from the badlands after {away} away! Sit down and tell me what you killed while you were gone, because the grunts are bored of my stories." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in Kargath's been grumbling your name into their grog all week. I don't care who started it, but don't finish it in my inn." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half dead, and I've got Forsaken guests, so I know what that looks like. Rest, friend." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, now; the road to the Spire is hard enough sober." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do, and they grumble into their bowls, but they grumble about the weather too. A Forsaken who glows is strange, I'll grant you, but in Kargath strange is cheap and a good sword arm is dear, so they'll make room." } },
      choices = {
        { text = "I'll keep the peace here. A guest owes the host that much.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they want trouble, they can have it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Neeka's scouts bring in a buzzard now and then, but they're stringy things, and the basilisks taste like boot leather. A hunter who brought in anything that didn't taste of dust would be the most popular face in Kargath for a week." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} out of the kitchen, friend. The grunts would forgive a beast a great many things, but not a bite out of tomorrow's stew." },
      },
      choices = {
        { text = "I'll bring what I can. Kargath's grunts deserve a decent meal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll sell what I catch, and the grunts can bid for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Shul'kar.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "All night, every night, and my favourite is the one about the young Warchief calling the elements down on the internment camps to free his people. I know it's mostly true, which makes it better, and the grunts tell it as if they'd been standing next to him." } },
      choices = {
        { text = "Tell it true. Thrall earned it without any embellishment.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Embellish away. A good story wins more grunts than the truth.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They love a fireball in a story, because it's bright and loud, but they go quiet when somebody tells one about the old Horde's warlocks. Mostly they want to know if you can heal, and if you can, they'll fight over who sits next to you." } },
      choices = {
        { text = "Tell the old stories too, even the shameful ones.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the warlock tales out. Grunts fight better without them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They think everybody would rob them, because half of them have robbed each other at dice. Keep your hands to yourself under my roof and you'll have a bunk as dry as any, and a story to tell besides." } },
      choices = {
        { text = "Under your roof, I'm an honest guest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dice games are fair game, Shul'kar.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Shul'kar.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because conjured bread tastes of nothing, or so every mage at my table tells me, and my stew tastes of something, even if nobody can tell me what. A hot meal's a comfort as much as a fill, and out here comfort's rarer than food." } },
      choices = {
        { text = "Comfort matters. That's why I came in.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Food is fuel. Comfort is for the weak.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Burned it black, pot and all, and then sat on the ladle laughing at me. The warlock paid for the pot, I'll grant him that, but Kargath remembers the night there was no stew, and so do I." } },
      choices = {
        { text = "I'll keep mine leashed. Your hearth is safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Imps will be imps. Blame the stew, not the imp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few tough roots in the gullies and a cactus that tastes like it's angry at you, and that's about it. Most of what we eat comes by wind rider from the Barrens, so when the riders are late it's lizard, and when they're very late it's more lizard." } },
      choices = {
        { text = "Share what you have. Everyone eats or no one does.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Feed the soldiers first. Travelers can fend for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, and an imp with you. Keep it off the hearth, because the last one decided my stew needed more fire, and the grunts haven't forgiven either of us." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at my fire. You could conjure your own bread and water, I know, so I'll take it kindly that you came in anyway." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. My grunts sleep with their coin under their pillows when your kind take a bunk, so be a good guest and let them snore in peace." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman at my fire. The grunts swear one of yours called down a storm on the Dark Irons at the Gorge last week, and the storm gets bigger every time they tell it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest at my fire! The grunts will be glad of you, because they come back from the Gorge with cuts they won't show the alchemist, but they'll show a healer." },
        { id = "h_default", key = true,
          text = "I'm Shul'kar, and I keep the inn. A warrior fights on his stomach, and out here a hot meal and a dry bunk are worth more than gold, though I don't charge much more than gold for them." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he fought a Dark Iron the size of a door, and then it was two doors, and by morning it was a castle. Good story, though." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter at my fire. If you've anything fresh, I'll take it for the pot, because the grunts are sick of salted coyote, and so am I." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at my inn. The bunks are hard and the stew is mostly lizard, but nobody's died of either, and that's a better record than the Badlands have." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Sit down, sit down. I've fed the dead before and I've fed paladins, but never both on the same stool, so forgive the grunts if they stare at you over their stew." },
      },
      again = { { id = "h_again", text = "Anything else, while the pot's still on?" } },
      choices = {
        { text = "Nothing out here looks worth putting in a pot.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do the grunts tell many stories about shamans, Shul'kar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the grunts' stories say about spellcasters, Shul'kar?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Want to hear a battle?", next = "story" },
        { text = "Who's the town named for?", next = "name" },
        { text = "You must see every traveller who passes through Kargath.", next = "travelers" },
        { text = "Your Forsaken guests seem to like it here.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm a soldier, Shul'kar. Tell me a battle worth hearing.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Who rents the room upstairs?", next = "upstairs" },
        { text = "A Darkspear needs no grog to tell a story.", next = "k_troll", when = { race = "Troll" } },
        { text = "Do the grunts really think I'd rob them?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why would a mage eat your stew instead of conjured bread?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Did an imp really ruin your stew?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does anyone hunt for Kargath's pot, Shul'kar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do your guests mind a Forsaken paladin at the fire, Shul'kar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "A bunk, please.", next = "END", fx = { affinity = 1 } },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Always! Lay your axe by the fire and tell it slow, and don't leave out the part where it nearly went wrong; that's the best part." } },
      choices = {
        { text = "[Tell it]", next = "story_told", fx = { affinity = 2, standing = { kargath = 1 } } },
        { text = "Maybe later.", next = "BACK" },
      },
    },
    story_told = {
      lines = {
        { id = "st_default", text = "Ha, that's a good one, and the grunts will have it by supper, with a few more Dark Irons in it. You've paid for your bunk twice over." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = {
        { id = "n_default", text = "Kargath Bladefist, chieftain of the Shattered Hand, back in the old Horde. Whether he'd be proud of a dusty tower and my stew, I couldn't say, but we keep his name standing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    travelers = {
      lines = {
        { id = "t_default", text = "Everyone, sooner or later, since the wind riders from here reach Hammerfall and the Undercity to the north and Grom'gol and Stonard to the south. Kargath is the knot that ties the Horde's roads together on this side of the sea, and every rider who comes through wants a bath we haven't got the water for." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "Theodora and Vivian? They tip well and they don't eat, which makes them my favorite guests. They do laugh at things I'd rather not understand, though." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    upstairs = {
      lines = {
        { id = "up_default", text = "Jarkal Mossmeld, the troll alchemist, and his jars, and his smells. He pays his rent in potions, which is fair, since half my grunts would be dead of the heat without them." },
        { id = "up_reagents", when = { questDone = TODO_QUEST("Badlands Reagent Run") },
          text = "Jarkal, and you've been filling his jars with gizzards, so you know the smell I'm cooking against. I put more onions in the stew every week, and it's still losing." },
      },
      choices = {
        { text = "Do you trust him?", next = "upstairs_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    upstairs_trust = {
      lines = {
        { id = "ut_default", text = "With potions, yes, and with a bargain, never, though he'd say the same of me and my grog. We get along fine, as long as neither of us tries to sell the other anything." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "True enough, because the trolls in my common room tell the wildest tales of all, sober or not. Sit down and give me one about the jungle, and I'll tell the grunts it happened in the Badlands." },
        { id = "xtr_head", when = { origin = "troll_headhunter" },
          text = "A headhunter, by the look of your belt, so your stories come with proof. Leave the proof outside, though, because it puts the grunts off their stew." },
      },
      choices = {
        { text = "My stories are true, every word.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Mine get better each time I tell them.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Ha, every soldier says that and every soldier means 'tell me one I haven't heard.' The best I know is the night the 109th went up the mountain, and I'll tell it, but you'll buy the next round of grog for whoever cries first." },
        { id = "xwa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "A Razor Hill grunt, this far from the sea! Then you'll like the one about the Dark Iron who mistook a goblin keg for an altar, and I've told it so often I've started to believe it." },
      },
      choices = {
        { text = "Tell it straight, no polishing.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Polish it. A good lie beats a dull truth.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "An innkeeper who followed the Expeditionary Force out here because soldiers need feeding, and I've fed orcs since we ate gruel behind the camp fences. That's all there is to me, and it's enough." } },
    advice = { { id = "tp_ad", text = "Drink water before you drink grog, and drink both before you go near the Searing Gorge. The heat up there will have you seeing things." } },
    thrall = { { id = "tp_thrall", text = "The Warchief eats with his grunts, and I'd feed him the same stew I feed them. He'd like it, I'm sure." } },
    second_war = { { id = "tp_second_war", text = "I cooked for the Horde in the Second War, and the food was worse then. That's the only thing I'll say for the old days." } },
    uldaman = { { id = "tp_uldaman", text = "The dwarves dig at Uldaman, and their stew smells good from the road. I'd like the recipe." } },
    _none = { { id = "tp_none", text = "Don't know, but tell me about your battles instead, because I like those." } },
  },
}
